#!/usr/bin/env python
# -*- coding: utf-8 -*-
import difflib
import math
import numpy as np
import sys

# for Hungarian Algorithm
import munkres

from htmlprocessor import HTMLSequencer
from lett import Page, read_lett
from scorer import BOWScorer
from scorer import DistanceScorer
from scorer import LinkDistance
from scorer import NERDistance
from scorer import StructureScorer
from tokenizer import ExternalProcessor, SpaceTokenizer

sys.path.append("/home/buck/net/build/DataCollection/baseline")
from strip_language_from_uri import LanguageStripper

# from corenlp import StanfordCoreNLP


def get_best_match(source_corpus, target_corpus, scores):
    stripper = LanguageStripper()
    err = 0
    for s_idx, (s_url, s_page) in enumerate(source_corpus.iteritems()):
        max_idx = np.argmax(scores[s_idx])
        t_url = target_corpus.keys()[max_idx]
        success = stripper.strip(t_url) == stripper.strip(s_page.url)
        if not success:
            err += 1
        sys.stdout.write("%f\t%s\t%s\t%s\n" %
                         (scores[s_idx, max_idx], success, s_url, t_url))
    n = min(len(source_corpus), len(target_corpus))
    sys.stderr.write("Correct (greedy): %d out of %d = %f%%\n" %
                     (n - err, n, (1. * n - err) / n))


def get_nbest(source_corpus, target_corpus, scores, n=10):
    stripper = LanguageStripper()
    err = 0
    n = min(n, len(source_corpus))
    for s_idx, (s_url, s_page) in enumerate(source_corpus.iteritems()):
        best_score_indices = np.argpartition(scores[s_idx], -n)[-n:]
        t_urls = [target_corpus.keys()[idx] for idx in best_score_indices]
        t_urls = map(stripper.strip, t_urls)
        success = stripper.strip(s_page.url) in t_urls
        if not success:
            err += 1
    mlen = min(len(source_corpus), len(target_corpus))
    sys.stderr.write("Correct in %d-best: %d out of %d = %f%%\n" %
                     (n, mlen - err, mlen, (1. * mlen - err) / mlen))


def get_best_matching(source_corpus, target_corpus, scores):
    stripper = LanguageStripper()
    err = 0

    m = munkres.Munkres()
    cost_matrix = munkres.make_cost_matrix(scores, lambda cost: 1 - cost)
    indexes = m.compute(cost_matrix)

    for row, column in indexes:
        s_url = source_corpus.keys()[row]
        t_url = target_corpus.keys()[column]
        success = stripper.strip(t_url) == stripper.strip(s_url)
        if not success:
            err += 1
        sys.stdout.write("%f\t%s\t%s\t%s\n" %
                         (scores[row, column], success, s_url, t_url))

    n = min(len(source_corpus), len(target_corpus))
    sys.stderr.write("Correct: %d out of %d = %f%%\n" %
                     (n - err, n, (1. * n - err) / n))


def ratio(seq1, seq2):
    s = difflib.SequenceMatcher(None, seq1, seq2)
    return s.ratio()


def quick_ratio(seq1, seq2):
    s = difflib.SequenceMatcher(None, seq1, seq2)
    return s.quick_ratio()


def real_quick_ratio(seq1, seq2):
    s = difflib.SequenceMatcher(None, seq1, seq2)
    return s.real_quick_ratio()

if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument(
        'lettfile', help='input lett file', type=argparse.FileType('r'))
    parser.add_argument('-slang', help='source language', default='en')
    parser.add_argument('-tlang', help='target language', default='fr')
    parser.add_argument(
        '-source_tokenizer', help='call to tokenizer, including arguments')
    parser.add_argument(
        '-target_tokenizer', help='call to tokenizer, including arguments')
    parser.add_argument(
        '-corenlp_service', help='corenlp json service location',
        default='http://localhost:8080')
    args = parser.parse_args(sys.argv[1:])

    # gc = GaleChurchWrapper()
    # print gc.align_score([15, 2, 2, 2, 2, 10], [12, 3, 20, 3, 12])
    # sys.exit()

    # read source and target corpus
    s, t = read_lett(args.lettfile, args.slang, args.tlang)
    sys.stderr.write("Read %d %s docs and %d %s docs from %s\n" %
                     (len(s), args.slang,
                      len(t), args.tlang, args.lettfile.name))

    # distance_scorers = [LinkDistance(), LinkDistance(xpath="//img/@src")]

    # for length_function in [lambda x: len(x),
    #                         lambda x: len(x.split()),
    #                         lambda x: len(x.split("\n"))][::-1]:
    #     for growth_function in [lambda x: x,
    #                             lambda x: int(math.sqrt(x)),
    #                             lambda x: 1 + int(math.log(x))][::-1]:
    #         for ratio_function in real_quick_ratio, quick_ratio, ratio:
    #             scorer = StructureScorer(
    #                 length_function, growth_function, ratio_function)
    #             m = scorer.score(s, t)
    #             get_best_matching(s, t, m)
    #             get_best_match(s, t, m)

    source_tokenizer = ExternalProcessor(
        args.source_tokenizer) if args.source_tokenizer else SpaceTokenizer()
    target_tokenizer = ExternalProcessor(
        args.target_tokenizer) if args.target_tokenizer else SpaceTokenizer()

    # distance_scorers = [LinkDistance(),
    #                     SimhashDistance(source_tokenizer=source_tokenizer,
    #                                     target_tokenizer=target_tokenizer,
    #                                     n=1),
    #                     SimhashDistance(source_tokenizer=source_tokenizer,
    #                                     target_tokenizer=target_tokenizer,
    #                                     n=2),
    #                     SimhashDistance(source_tokenizer=source_tokenizer,
    #                                     target_tokenizer=target_tokenizer,
    #                                     n=3),
    #                     SimhashDistance(source_tokenizer=source_tokenizer,
    #                                     target_tokenizer=target_tokenizer,
    #                                     n=4),
    #                     SimhashDistance(source_tokenizer=source_tokenizer,
    #                                     target_tokenizer=target_tokenizer,
    #                                     n=5),
    #                     GaleChurchAlignmentDistance(),
    #                     StructureScorer(
    #                         length_function=lambda x: len(x.split()),
    #                         growth_function=lambda x: 1 + math.log(x),
    #                         ratio_function=lambda x: quick_ratio),
    #                     BOWScorer(source_tokenizer=source_tokenizer,
    #                               target_tokenizer=target_tokenizer),
    #                     LinkDistance(),
    #                     LinkDistance(xpath="//img/@src"),
    #                     NERDistance(args.corenlp_service,
    #                                 source_tokenizer=source_tokenizer,
    #                                 target_tokenizer=target_tokenizer)
    #                     ]

    distance_scorers = [StructureScorer(
        length_function=lambda x: len(x.split()),
        growth_function=lambda x: int(1 + math.log(x)),
        ratio_function=lambda x: quick_ratio),
        BOWScorer(source_tokenizer=source_tokenizer,
                  target_tokenizer=target_tokenizer),
        LinkDistance()]
    for scorer in distance_scorers:
        sys.stderr.write("Running: %s\n" % str(scorer))
        m = scorer.score(s, t)
        get_best_match(s, t, m)
        get_nbest(s, t, m, n=10)
        get_nbest(s, t, m, n=20)
        get_nbest(s, t, m, n=100)
        # get_best_matching(s, t, m)

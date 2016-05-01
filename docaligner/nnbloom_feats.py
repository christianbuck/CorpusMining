#!/usr/bin/env python

import sys
import numpy as np
from scipy.spatial import distance
from scipy.stats import pearsonr, spearmanr
from itertools import izip

np.random.seed(1337)  # for reproducibility


def pos_prob(x, y):
    # return sum(np.log(x[y > 0])) / sum(y)
    pos_probs = np.log(x[y > 0])
    pos_probs = np.nan_to_num(pos_probs)
    return sum(pos_probs)


def min_prob(x, y):
    """ the minimum probability of those fields, that should have
    been > .5 """
    return min(x[y > 0])


def max_prob(x, y):
    """ maximum of those that should be zero """
    return max(x[y < 1])


def all_prob(x, y):
    # return sum(np.log(x[y > 0])) / sum(y)
    pos_probs = np.log(x[y > 0])
    pos_probs[np.isnan(pos_probs)] = 0
    # pos_probs = np.nan_to_num(pos_probs)
    neg_probs = np.log(1 - x[y < 1])
    neg_probs[np.isnan(neg_probs)] = 0
    # neg_probs = np.nan_to_num(neg_probs)
    return sum(pos_probs) + sum(neg_probs)


def count_correct(x, y):
    return sum((x > .5) == y) / sum(y)


# def print_score(probs, dist_func, name):
#     dist = [dist_func(a, b) for a, b in izip(probs, self.Y_eval)]
#     print(dist[0], self.scores[0], dist[1100],
#           self.scores[1100], dist[-1], self.scores[-1])
#     pearson, p = pearsonr(self.scores, dist)
#     spearman, p = spearmanr(self.scores, dist)
#     print ("[%s]\tP: %f\tS: %f\tSum: %f" %
#            (name, pearson, spearman, sum(dist)))
#     self.history[name].append((pearson, spearman, sum(dist)))


if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument('pred', help='predictions npz',
                        type=argparse.FileType('r'))
    args = parser.parse_args()

    npzfile = np.load(args.pred)
    # X=self.X_eval, Y=self.Y_eval, predicted=probs)
    X = npzfile['X']
    Y = npzfile['Y']
    pred = npzfile['predicted']
    assert pred.shape == Y.shape

    dist_func = distance.cosine
    dist = [dist_func(a, b) for a, b in izip(pred, Y)]
    for d in dist:
        print d

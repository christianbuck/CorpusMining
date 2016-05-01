import sys
import subprocess
import os
import threading
from nltk.tokenize import word_tokenize
import re


class SpaceTokenizer(object):

    """ Fall-back is no tokenizer is available """

    def __init__(self):
        sys.stderr.write("Using SpaceTokenizer.\n")

    def process(self, line):
        return " ".join(line.split())


class WordTokenizer(object):

    """ Fall-back is no tokenizer is available """

    def __init__(self, language):
        sys.stderr.write("Using WordTokenizer.\n")
        self.language = language

    def process_line(self, line):
        words = [w for w in
                 word_tokenize(line, language=self.language)
                 if re.match("\w+|\d+", w) is not None]
        return u" ".join(words)

    def process(self, text):
        assert isinstance(text, unicode)
        return u"\n".join(self.process_line(line)
                          for line in text.split("\n")
                          if line.strip())


class ExternalProcessor(object):

    """ wraps an external script and does utf-8 conversions, is thread-safe """

    def __init__(self, cmd):
        self.cmd = cmd
        self.devnull = open(os.devnull, 'wb')
        if self.cmd is not None:
            self.proc = subprocess.Popen(cmd.split(), stdin=subprocess.PIPE,
                                         stdout=subprocess.PIPE,
                                         stderr=self.devnull)
            self._lock = threading.Lock()

    def process_multiline(self, text):
        res = []
        for line in text.split(u'\n'):
            if line.strip():
                res.append(self.process(line))
        return u'\n'.join(res)

    def process(self, line):
        if self.cmd is None or not line.strip():
            return line
        assert u"\n" not in line
        u_string = u"%s\n" % line
        u_string = u_string.encode("utf-8")
        result = u_string  # fallback: return input
        with self._lock:
            self.proc.stdin.write(u_string)
            self.proc.stdin.flush()
            result = self.proc.stdout.readline()
        return result.decode("utf-8").strip()

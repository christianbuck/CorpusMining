from gzip import GzipFile


class MemberReader(GzipFile):

    def __init__(self, fileobj):
        GzipFile.__init__(self, fileobj=fileobj)
        # When _member_lock is True, only one member in gzip file is read
        self._member_lock = False

    def _read(self, size):
        # Treat end of member as end of file when _member_lock flag is set
        if self._member_lock and self._new_member:
            raise EOFError()
        else:
            return GzipFile._read(self, size)

    def read_member(self):
        """Returns a file-like object to read one member from the gzip file.
        """
        if self._member_lock is False:
            self._member_lock = True

        if self._new_member:
            try:
                # Read one byte to move to the next member
                GzipFile._read(self, 1)
                assert self._new_member is False
            except EOFError:
                return None

        return self


if __name__ == '__main__':
    import sys
    if len(sys.argv) != 2:
        program = sys.argv[0]
        print program + ':', 'usage:', program, '<filename.gz>|<filename.bz2>'
        sys.exit(0)

    filename = sys.argv[1]
    fileobj = open(filename, mode='rb')
    zipfile = MemberReader(fileobj=fileobj)

    n = 0
    while True:
        n += 1
        start_location = fileobj.tell()
        member = zipfile.read_member()
        if member is None:
            break
        content = member.read()

        if n == 1:
            continue

        end_location = fileobj.tell()
        url = content.split("\n")[0].split()[0]
        print start_location, end_location, url

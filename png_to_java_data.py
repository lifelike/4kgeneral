import os
import sys
import Image

os.system("touch %s" % sys.argv[2])

PIXELS_PER_LINE = 8
LINES_PER_IMAGE = 8

im = Image.open(sys.argv[1])
o = open(sys.argv[2], "w")

WHITE = (255, 255, 255)
BLACK = (0, 0, 0)

pixels = {
    WHITE : '.',
    BLACK : 'x',
}

BLANK_LINE = pixels[WHITE] * PIXELS_PER_LINE

lines = []
line = None

n = 0
for d in im.getdata():
    if n % PIXELS_PER_LINE == 0:
        if line:
            lines.append(line)
        line = ""
    line += pixels[d]
    n = n + 1

for i in reversed(range(len(lines))):
    if lines[i] != BLANK_LINE:
        last_image = i / LINES_PER_IMAGE
        end_line = (last_image + 1) * LINES_PER_IMAGE
        lines = lines[:end_line]
        break

print >> o, '   "' + ('"\n   str_concat "'.join(lines)) + '"'

o.close()

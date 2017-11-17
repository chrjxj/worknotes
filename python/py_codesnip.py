# -*- coding: utf-8 -*-

# lambda instead of function
lambda x: True if x % 2 == 0 else False

# list and set

# iter, zip, enmu and yeild
for idx, val in enumerate(['a', 'b']):
    print("index %s value %s" % (idx, val))


# Generator
L = [x * x for x in range(10)]
[x * x for x in range(1, 11) if x % 2 == 0]
[m + n for m in 'ABC' for n in 'XYZ']

g = (x * x for x in range(10))
print(type(L), L)
print(type(g), g)

#
# Python, C,
#

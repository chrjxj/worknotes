# -*- coding: utf-8 -*-

######### sort by key or value #########

# https://stackoverflow.com/questions/613183/how-do-i-sort-a-dictionary-by-value
import operator
x = {1: 2, 3: 4, 4: 3, 2: 1, 0: 0}
print('sorting by values...')
sorted_x = sorted(x.items(), key=operator.itemgetter(1), reverse=True)
# output: [(0, 0), (2, 1), (1, 2), (4, 3), (3, 4)]

print('sorting by keys...')
sorted_x = sorted(x.items(), key=operator.itemgetter(0))

import sys
import random


n = int(sys.argv[1])
p = float(sys.argv[2])

print('Generating a graph of %d nodes with edge probability %.2f' % (n, p))

graph = []

for i in range(n - 1):
    for j in range(i + 1, n):
        if random.random() <= p:
            graph.append((i, j))

print(graph)

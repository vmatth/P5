import math
def set_partitions(iterable, k=None):
    """
    Yield the set partitions of *iterable* into *k* parts. Set partitions are
    not order-preserving.

    >>> iterable = 'abc'
    >>> for part in set_partitions(iterable, 2):
    ...     print([''.join(p) for p in part])
    ['a', 'bc']
    ['ab', 'c']
    ['b', 'ac']


    If *k* is not given, every set partition is generated.

    >>> iterable = 'abc'
    >>> for part in set_partitions(iterable):
    ...     print([''.join(p) for p in part])
    ['abc']
    ['a', 'bc']
    ['ab', 'c']
    ['b', 'ac']
    ['a', 'b', 'c']

    """
    L = list(iterable)
    n = len(L)
    if k is not None:
        if k < 1:
            raise ValueError(
                "Can't partition in a negative or zero number of groups"
            )
        elif k > n:
            return

    def set_partitions_helper(L, k):
        n = len(L)
        if k == 1:
            yield [L]
        elif n == k:
            yield [[s] for s in L]
        else:
            e, *M = L
            for p in set_partitions_helper(M, k - 1):
                yield [[e], *p]
            for p in set_partitions_helper(M, k):
                for i in range(len(p)):
                    yield p[:i] + [[e] + p[i]] + p[i + 1 :]

    if k is None:
        for k in range(1, n + 1):
            yield from set_partitions_helper(L, k)
    else:
        yield from set_partitions_helper(L, k)




def oSpaceCombinations(num):
    a=[]
    num = num+1
    for i in range(1,num):
        a.append(i)
    newCombination=[]
    newnew = []
    for k in 1, 2:
        for groups in list(set_partitions(a,k)):
            #print(groups)
            newnew.append(groups)
    newCombination.append(newnew[0][0])
    for i in range(1, len(newnew)):
        for j in range(0,2):
            if len(newnew[i][j]) != 1:
                newCombination.append(newnew[i][j])
    print("Combinations: ",newCombination)
    print("num of combinations: ", len(newCombination))

    return newCombination


oSpaceCombinations(9)
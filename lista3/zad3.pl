odd_permutation(L1,L2):-
	permutacja(L1,L2,M),
	M mod 2=:=1.

even_permutation(L1,L2):-
	permutacja(L1,L2,M),
	M mod 2=:=0.

permutacja(L1,L2,M):-permutacja(L1,L2,M,0).
permutacja([],[],N,N).
permutacja(L1,[X|L2],N,Acc):-
	better_select(X,M,L1,L3),
	N2 is Acc+M,
	permutacja(L3,L2,N,N2).

better_select(X,M,L1,L2):-better_select(X,M,0,L1,L2).
better_select(X,Il,Il,[X|L],L).
better_select(X,M,Acc,[Y|L1],[Y|L2]):-
	M2 is Acc+1,
	better_select(X,M,M2,L1,L2).

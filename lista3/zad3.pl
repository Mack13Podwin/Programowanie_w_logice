permutacja(L1,L2,X):-
	permutacja(L1,L2,X,0,0).
permutacja([],_,Sum,Sum,_).
permutacja([X|L1],L2,Y,Acc,PL):-
	better_select(X,M,L2,_),
	NewAcc is Acc+M+PL,
	NPl is PL+1,
	permutacja(L1,L2,Y,NewAcc,NPl).

better_select(X,M,L1,L2):-better_select(X,M,0,L1,L2).
better_select(X,Il,Il,[X|L],L).
better_select(X,M,Acc,[Y|L1],[Y|L2]):-
	M2 is Acc+1,
	better_select(X,M,M2,L1,L2).

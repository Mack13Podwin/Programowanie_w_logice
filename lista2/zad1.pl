środkowy([X],X).
środkowy(L,X):-
	L=[_|L1],
	append(L2,[_],L1),
	środkowy(L2,X).


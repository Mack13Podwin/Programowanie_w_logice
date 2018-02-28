my_append([],L,L).
my_append([X|L1],L2,[X|L3]):-
	my_append(L1,L2,L3).

środkowy([X],X).
środkowy(L,X):-
	L=[_|L1],
	my_append(L2,[_],L1),
	środkowy(L2,X).


my_member(X,[X|_]).
my_member(X,[_|L]):-
	my_member(X,L).
my_append([],L,L).
my_append([X|L1],L2,[X|L3]):-
	my_append(L1,L2,L3).

osiągalny(X,X).
osiągalny(X,Y):-
	osiągalność(X,Y,[X]).
osiągalność(X,Y,L):-
	arc(X,Y),
	\+ my_member(Y,L);
	arc(X,Z),
	\+ my_member(Z,L),
	my_append(L,[Z],L1),
	osiągalność(Z,Y,L1).


arc(a,b).
arc(b,a).
arc(b,c).
arc(c,d).

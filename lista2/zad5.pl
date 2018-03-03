lista(1,[1,1]).
lista(N,[1|X]):-
	numlist(2,N,Y),
	lista(Y,Z,[],[1],1),
	append(X,[],Z).

lista([],_,[],[],0):-
	true.
lista(IN,OUT,W0,W1,1):-
	W1\=[],
	select(Y,W1,Z),
	append(OUT,[Y],OUT2),
	lista(IN,OUT2,W0,Z,0).
lista([X|IN],OUT,W0,W1,1):-
	append(OUT,[X],OUT2),
	Y=[X|W0],
	lista(IN,OUT2,Y,W1,0).

lista(IN,OUT,W0,W1,0):-
	W0\=[],
	select(Y,W0,Z),
	append(OUT,[Y],OUT2),
	lista(IN,OUT2,Z,W1,1).
lista([X|IN],OUT,W0,W1,0):-
	append(OUT,[X],OUT2),
	Y=[X|W1],
	lista(IN,OUT2,W0,Y,1).


lista(1,[1,1]).
lista(N,X):-
	numlist(1,N,Y),
	lista(Y,X,[],[],0).

lista([],OUT,[],[],0):-
	OUT=[].
lista(IN,OUT,W0,W1,1):-
	W1\=[],
	select(Y,W1,Z),
	append([Y],OUT2,OUT),
	lista(IN,OUT2,W0,Z,0).
lista([X|IN],OUT,W0,W1,1):-
	append([X],OUT2,OUT),
	Y=[X|W0],
	lista(IN,OUT2,Y,W1,0).

lista(IN,OUT,W0,W1,0):-
	W0\=[],
	select(Y,W0,Z),
	append([Y],OUT2,OUT),
	lista(IN,OUT2,Z,W1,1).
lista([X|IN],OUT,W0,W1,0):-
	append([X],OUT2,OUT),
	Y=[X|W1],
	lista(IN,OUT2,W0,Y,1).


lista(N,X):-
	numlist(1,N,Y),
	lista(Y,X,[],[],0).

lista([],[],[],[],0).
lista(IN,OUT,W0,W1,1):-
	select(Y,W1,Z),
	OUT=[Y|OUT2],
	lista(IN,OUT2,W0,Z,0).
lista([X|IN],OUT,W0,W1,1):-
	OUT=[X|OUT2],
	lista(IN,OUT2,[X|W0],W1,0).

lista(IN,OUT,W0,W1,0):-
	select(Y,W0,Z),
	OUT=[Y|OUT2],
	lista(IN,OUT2,Z,W1,1).
lista([X|IN],OUT,W0,W1,0):-
	OUT=[X|OUT2],
	lista(IN,OUT2,W0,[X|W1],1).


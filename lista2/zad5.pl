lista(1,[1,1]).
lista(N,[1|X]):-
	numlist(2,N,Y),
	append(X,[],Y).
lista([],_,[],[],0):-
	true.

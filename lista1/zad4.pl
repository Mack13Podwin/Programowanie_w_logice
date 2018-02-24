le(1,1).
le(1,2).
le(1,3).
le(1,4).
le(1,5).
le(2,2).
le(2,4).
le(3,3).
le(4,4).
le(5,5).

/*le(gosia,gosia).
le(gosia, drzewo).
le(gosia,wieża_eiffla).
le(drzewo, drzewo).
le(drzewo, wieża_eiffla).
le(wieża_eiffla, wieża_eiffla).*/

maksymalny(X):-
	le(_,X),
	\+ (
	    le(_,Y),
	    X\=Y,
	    le(X,Y)
	).

największy(X):-
	le(_,X),
	\+ (
	    le(_,Y),
	    \+ le(Y,X)
	).

minimalny(X):-
	le(X, _),
	\+ (
	    le(_,Y),
	    X\=Y,
	    le(Y,X)
	).

najmniejszy(X):-
	le(X,_),
	\+ (
	    le(_,Y),
	    \+ le(X,Y)
	).

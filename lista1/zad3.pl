left(pencil,hourglass).
left(hourglass,butterfly).
left(butterfly,fish).
above(bicycle,pencil).
above(camera,butterfly).

right_of(X,Y):-
	left(Y,X).
below(X,Y):-
	above(Y,X).


left_of(X,Y):-
	left(X,Y);
	(
	    left(X,Z),
	    left_of(Z,Y)
	).
over(X,Y):-
	above(X,Y);
	(
	    above(X,Z),
	    over(Z,Y)
	).

higher(X,Y):-
	over(X,Y);
	(
	    \+ above(Y,_),
	    above(X,_);
	    (
		above(X,A),
		above(Y,B),
		higher(A,B)
	    )
	)
	.

above(Block1,Block2):-
	(   on(Block1,X),
	above(X,Block2) );
	on(Block1,Block2).

on(b1,b2).
on(b2,b3).

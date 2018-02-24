le(gosia,gosia).
le(gosia, drzewo).
le(gosia,wieża_eiffla).
le(drzewo, drzewo).
le(drzewo, wieża_eiffla).
le(wieża_eiffla, wieża_eiffla).
%le(drzewo,gosia).

częściowy_porządek:-
	\+ nieporządek.

nieporządek:-
	zwrotność;
	przechodniość;
	słaba_antysymetria.

zwrotność:-
	(   le(X,_); le(_,X)),
	\+ le(X,X).

przechodniość:-
	le(_,X), le(_,Y), le(_,Z),
	le(X,Y),
	le(Y,Z),
	\+ le(X,Z).
słaba_antysymetria:-
	le(_,X),le(_,Y),
	le(X,Y),
	le(Y,X),
	X\=Y.

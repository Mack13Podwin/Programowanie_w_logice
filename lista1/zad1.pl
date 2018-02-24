%rozwiązanie
jest_matką(X):-
	matka(X,_Y).
jest_ojcem(X):-
	ojciec(X,_Y).
jest_synem(X):-
	rodzic(_Y,X),
	mężczyzna(X).
siostra(X,Y):-
	rodzeństwo(X,Y),
	kobieta(X).
dziadek(X,Y):-
	rodzic(X,Z),
	rodzic(Z,Y).
rodzeństwo(X,Y):-
	rodzic(Z,X),
	rodzic(Z,Y),
	X\=Y.
%dane testowe
matka(X,Y):-
	rodzic(X,Y),
	kobieta(X).
ojciec(X,Y):-
	rodzic(X,Y),
	mężczyzna(X).

kobieta(sarah).
kobieta(lily).
mężczyzna(tim).
mężczyzna(ben).
mężczyzna(ted).
rodzic(tim,ben).
rodzic(sarah,ben).
rodzic(ted,tim).
rodzic(tim,lily).
rodzic(sarah,lily).


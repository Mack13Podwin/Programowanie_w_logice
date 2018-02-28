ma(0,X,Y):-ma(X,Y).

ma(ala, książka).
ma(jola, rower).
ma(rafał, kwiaty).
ma(agata, karty).

daje(potem(0),ala,książka,jola).
daje(potem(0),jola,rower,ala).
daje(potem(potem(0)),jola,książka,agata).

potem(0).
potem(potem(0)).
potem(potem(X)):-
	X=potem(_).

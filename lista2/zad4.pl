%ma(Kiedy,Kto,Co):-
%	ma(_,Co),
%	ma(Kiedy,Kto,Co,[]).

ma(0, Kto, Co):-
	ma(Kto,Co).
ma(Kiedy,Kto,Co):-
	daje(Kiedy,_,Co,Kto).
ma(Kiedy,Kto,Co):-
	ma(Kto,_),
	\+ daje(Kiedy, Kto, Co, _),
	l(X,Kiedy),
	ma(X,Kto,Co).

ma(ala, książka).
ma(jola, rower).
ma(rafał, kwiaty).
ma(agata, karty).

daje(potem(0),ala,książka,jola).
daje(potem(0),jola,rower,ala).
daje(potem(potem(0)),jola,książka,agata).

l(0,potem(0)).
l(potem(0),potem(potem(0))).



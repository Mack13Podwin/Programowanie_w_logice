interpreter(INST):- interpreter(INST,[]).
interpreter([],_).
interpreter([read(ID)|INST],MEM):-
	read(N),
	integer(N),
	var(MEM, ID, N, MEM2),
	interpreter(INST,MEM2).
interpreter([write(WARTOSC)|INST],MEM):-
	value(WARTOSC,MEM,VAL),
	format('~w~n',VAL),
	interpreter(INST,MEM).
interpreter([assign(ID,WARTOSC)|INST],MEM):-
	value(WARTOSC,MEM,VAL),
	var(MEM,ID,VAL,MEM2),
	interpreter(INST,MEM2).
interpreter([if(EXP,P)|INST],MEM):-interpreter([if(EXP,P,[])|INST],MEM),!.
interpreter([if(EXP,P1,P2)|INST],MEM):-
	(   expression(EXP,MEM)->append(P1,INST,INST2)
	;   append(P2,INST,INST2)),
	interpreter(INST2,MEM).
interpreter([while(EXP,P)|INST],MEM):-
	append(P,[while(EXP,P)],P2),
	interpreter([if(EXP,P2,[])|INST],MEM).

var([],ID,N,[ID=N]).
var([ID=_|MEM],ID,N,[ID=N|MEM]):-!.
var([ID1=V|MEM1],ID,N,[ID1=V|MEM2]):-var(MEM1,ID,N,MEM2).

value(int(N),_,N).
value(id(ID),MEM,N):-mem_read(MEM,ID,N).
value(VAL1 + VAL2, MEM,N):-
	value(VAL1,MEM,N1),
	value(VAL2,MEM,N2),
	N is N1+N2.
value(VAL1 - VAL2, MEM,N):-
	value(VAL1,MEM,N1),
	value(VAL2,MEM,N2),
	N is N1-N2.
value(VAL1 * VAL2, MEM,N):-
	value(VAL1,MEM,N1),
	value(VAL2,MEM,N2),
	N is N1*N2.
value(VAL1 / VAL2, MEM,N):-
	value(VAL1,MEM,N1),
	value(VAL2,MEM,N2),
	N2=\=0,
	N is N1 div N2.
value(VAL1 mod VAL2, MEM,N):-
	value(VAL1,MEM,N1),
	value(VAL2,MEM,N2),
	N2=\=0,
	N is N1 mod N2.

mem_read([ID=N|_],ID,N):-!.
mem_read([_|MEM],ID,N):-mem_read(MEM,ID,N).

expression(W1 =:= W2,MEM):-
	value(W1,MEM,VAL1),
	value(W2,MEM,VAL2),
	VAL1=:=VAL2.
expression(W1 =\= W2,MEM):-
	value(W1,MEM,VAL1),
	value(W2,MEM,VAL2),
	VAL1=\=VAL2.
expression(W1 < W2,MEM):-
	value(W1,MEM,VAL1),
	value(W2,MEM,VAL2),
	VAL1<VAL2.
expression(W1 > W2,MEM):-
	value(W1,MEM,VAL1),
	value(W2,MEM,VAL2),
	VAL1>VAL2.
expression(W1 =< W2,MEM):-
	value(W1,MEM,VAL1),
	value(W2,MEM,VAL2),
	VAL1=<VAL2.
expression(W1 >= W2,MEM):-
	value(W1,MEM,VAL1),
	value(W2,MEM,VAL2),
	VAL1>=VAL2.
expression((W1, W2),MEM):-
	expression(W1,MEM),
	expression(W2,MEM).
expression((W1;W2),MEM):-
	expression(W1,MEM),!;
	expression(W2,MEM).

zapałki(N,(duże(D),średnie(S),małe(M))):-
	generuj_duży_kwadrat(D,[],E),
	generuj_średnie_kwadraty(S,E,E2),
	generuj_małe_kwadraty(M,E2,E3),
	sprawdź_zapałki(N,E3),
	sprawdź_kwadraty(M,S,D,E3),
	rysuj(E3).
% Generowanie kwadratów(N-krawędź początkowa,E-zbiór dotychczasowych
% krawędzi, NE-nowy zbiór krawędzi)

generuj_duży_kwadrat(N,E,NE):-
	N=:=1 -> (duży_kwadrat(Krawędzie),
		 union(E,Krawędzie,NE));NE=E.

generuj_średnie_kwadraty(N,E,NE):-
	podzbiór([1,2,4,5],V),
	length(V,N),
	generuj_średnie_krawędzie(V,[],Krawędzie),
	union(E,Krawędzie,NE).

generuj_małe_kwadraty(N,E,NE):-
	podzbiór([1,2,3,4,5,6,7,8,9],V),
	length(V,N),
	generuj_małe_krawędzie(V,[],Krawędzie),
	union(E,Krawędzie,NE).
%Generowanie krawędzi

generuj_średnie_krawędzie([],E,E).
generuj_średnie_krawędzie([H|T],E,NE):-
	średni_kwadrat(H,Krawędzie),
	union(E,Krawędzie,NKrawędzie),
	generuj_średnie_krawędzie(T,NKrawędzie,NE).

generuj_małe_krawędzie([],E,E).
generuj_małe_krawędzie([H|T],E,NE):-
	mały_kwadrat(H,Krawędzie),
	union(E,Krawędzie,NKrawędzie),
	generuj_małe_krawędzie(T,NKrawędzie,NE).
%Definicje kwadratów

duży_kwadrat([1,2,3,10,11,12,101,104,105,108,109,112]).

średni_kwadrat(N,_):-(N<1;N=:=3;N>5),!,fail.
średni_kwadrat(N,Krawędzie):-
	E1 is N, E2 is N+1, E3 is N+6, E4 is N+7,
	P is floor(N/3),
	E5 is 100+N+P, E6 is 102+N+P, E7 is 104+N+P, E8 is 106+N+P,
	Krawędzie=[E1,E2,E3,E4,E5,E6,E7,E8].

mały_kwadrat(N,_):-(N<1;N>9),!,fail.
mały_kwadrat(N,Krawędzie):-
	E1 is N, E2 is N+3,
	P is floor(N/3),
	E3 is 100+N+P, E4 is 101+N+P,
	Krawędzie=[E1,E2,E3,E4].

%Sprawdzenie ilości krawędzi

sprawdź_zapałki(N,Zapałki):-
	Wszystkie=[1,2,3,4,5,6,7,8,9,10,11,12,
		  101,102,103,104,105,106,107,108,109,110,111,112],
	subtract(Wszystkie,Zapałki,Z),
	length(Z,N).

%Sprawdź kwadraty

sprawdź_kwadraty(M,S,D,Krawędzie):-
	policz_małe([1,2,3,4,5,6,7,8,9],Krawędzie,CM),CM=:=M,
	policz_średnie([1,2,4,5],Krawędzie,CS),CS=:=S,
	policz_duże(Krawędzie,CD),CD=:=D.

%Policz kwadraty

policz_duże(E,N):-
	duży_kwadrat(X),
	(subset(X,E)->N=1;N=0).

policz_średnie(V,E,N):-policz_średnie(V,E,0,N).
policz_średnie([],_,E,E).
policz_średnie([H|T],E,A,N):-
	średni_kwadrat(H,X),
	(subset(X,E)->C is A+1; C=A),
	policz_średnie(T,E,C,N).

policz_małe(V,E,N):-policz_małe(V,E,0,N).
policz_małe([],_,E,E).
policz_małe([H|T],E,A,N):-
	mały_kwadrat(H,X),
	(subset(X,E)->C is A+1; C=A),
	policz_małe(T,E,C,N).

%rysowanie
rysuj(X):-rysuj(1,101,X).
rysuj(X,Y,Zapałki):-
	write('+'),
	(member(X,Zapałki)->write(' - - - '); write('\t')),
	X2 is X+1,
	write('+'),
	(member(X2,Zapałki)->write(' - - - '); write('\t')),
	X3 is X2+1,
	write('+'),
	(member(X3,Zapałki)->write(' - - - '); write('\t')),
	X4 is X3+1,
	write('+\n\n'),
	(
	    Y<110->((member(Y,Zapałki)->write('|'); write('   ')),
	    Y2 is Y+1,
	    write('\t'),
	    (member(Y2,Zapałki)->write('|'); write('   ')),
	    Y3 is Y2+1,
	    write('\t'),
	    (member(Y3,Zapałki)->write('|'); write('   ')),
	    Y4 is Y3+1,
	    write('\t'),
	    (member(Y4,Zapałki)->write('|'); write('   ')),
	    Y5 is Y4+1,
	    write('\n\n'),
	    rysuj(X4,Y5,Zapałki));
	    write('\n\n'),true).

%Pomocniczy predykat podzbioru

podzbiór([],[]).
podzbiór([H|T],[H|NT]):-podzbiór(T,NT).
podzbiór([_|T],NT):-podzbiór(T,NT).

wyrażenie(Lista,Wartość,Wyrażenie):-
	wyrażenie(Lista,Wyrażenie),
	Wartość is Wyrażenie.
wyrażenie([],_):-!,fail.
wyrażenie([X],X).
wyrażenie(Lista, Wyrażenie):-
	mój_append(L1,L2,Lista),
	wyrażenie(L1,W1),
	wyrażenie(L2,W2),
	(
		 Wyrażenie=W1+W2;
		 Wyrażenie=W1-W2;
		 Wyrażenie=W1*W2;
		 \+ (
				  0.0 is W2;
				  0 is W2
		     )->Wyrażenie=W1/W2
	).

%append zwracający tylko niepuste listy.
mój_append(L1,L2,L):-
	append(L1,L2,L),
	L1=[_|_],L2=[_|_].

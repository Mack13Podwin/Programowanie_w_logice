board([H|L]):-
	length([H|L],LQ),
	queens([H|L],Q,1,LQ),
	S is LQ mod 2,
	draw(Q,0,LQ,S).

queens([],[],_,_).
queens([H1|T1],[H2|T2],KOL,LQ):-
	H2 is KOL+(LQ-H1)*LQ,
	KOL1 is KOL+1,
	queens(T1,T2,KOL1,LQ).

draw(_,LQ,LQ,_):-draw_horizontal(LQ),!.
draw(Q,N,LQ,1):-
	draw_horizontal(LQ),
	draw_level(Q,N,LQ,1),
	N1 is N+1,
	draw(Q,N1,LQ,0).
draw(Q,N,LQ,0):-
	draw_horizontal(LQ),
	draw_level(Q,N,LQ,0),
	N1 is N+1,
	draw(Q,N1,LQ,1).

draw_horizontal(LQ):-
	write('\n+'),
	draw_bar(0,LQ).

draw_bar(LQ,LQ):-!.
draw_bar(N,LQ):-
	write('-----+'),
	N1 is N+1,
	draw_bar(N1,LQ).

draw_level(Q,N,LQ,S):-
	write('\n|'),
	NR is N*LQ+1,
	draw_in(Q,NR,0,LQ,S),
	write('\n|'),
	draw_in(Q,NR,0,LQ,S).

draw_in(_,_,LQ,LQ,_):-!.
draw_in(Q,NR,C,LQ,1):-
	\+ member(NR,Q),
	write(':::::|'),
	C1 is C+1,
	NR1 is NR+1,
	draw_in(Q,NR1,C1,LQ,0),!.
draw_in(Q,NR,C,LQ,1):-
	write(':###:|'),
	C1 is C+1,
	NR1 is NR+1,
	draw_in(Q,NR1,C1,LQ,0),!.
draw_in(Q,NR,C,LQ,0):-
	\+ member(NR,Q),
	write('     |'),
	C1 is C+1,
	NR1 is NR+1,
	draw_in(Q,NR1,C1,LQ,1),!.
draw_in(Q,NR,C,LQ,0):-
	write(' ### |'),
	C1 is C+1,
	NR1 is NR+1,
	draw_in(Q,NR1,C1,LQ,1),!.

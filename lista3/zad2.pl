max_sum(L,X):-max_sum(L,X,0,0).
max_sum([],X,_,X).
max_sum([A|L],X,Sum,Max):-
	(   Sum>=0 -> SUM is A+Sum; SUM is A),
	max(SUM,Max,MAX),
	max_sum(L,X,SUM,MAX).

max(A,B,X):-(A>B->X is A; X is B).

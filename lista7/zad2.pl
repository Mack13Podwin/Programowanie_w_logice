:-consult('zad1.pl').

split(In,Out1,Out2):-split(In,Out1,Out2,1).
split(In,Out1,Out2,1):-
	freeze(In,(
	       In=[X|NIn],
	       Out1=[X|NOut1],
	       split(NIn,NOut1,Out2,2))),!;
	Out1=[],Out2=[].
split(In,Out1,Out2,2):-
	freeze(In,(
	      In=[X|NIn],
	      Out2=[X|NOut2],
	      split(NIn,Out1,NOut2,1))),!;
	Out1=[],Out2=[].

merge_sort(In,Out):-freeze(In, merge_sort2(In,Out)).

merge_sort2([],[]).
merge_sort2([H|T],Out):-freeze(T,
			       (T=[])->(Out=[H]);
			       (split([H|T],Out1,Out2),
				merge_sort(Out1,Out11),
				merge_sort(Out2,Out22),
				mymerge(Out11,Out22,Out))).



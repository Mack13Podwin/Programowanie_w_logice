mymerge(In1,In2,Out):-
	freeze(In1,(freeze(In2,merge2(In1,In2,Out)))).

merge2([],In2,In2):-!.
merge2(In1,[],In1):-!.
merge2(In1,In2,Out):-
	In1=[H1|T1],In2=[H2|T2],
	(   (H1=<H2)->Out=[H1|NOut],mymerge(T1,In2,NOut);
	Out=[H2|NOut],mymerge(In2,T2,NOut)).





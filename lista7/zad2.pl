:-consult('zad1.pl').

split(In,Out1,Out2):-
	freeze(In,(
	       In=[X,Y|NIn],
	       Out1=[X|NOut1],
	       Out2=[Y|NOut2],
	       split(NIn,NOut1,NOut2));
	       (
		      In=[X|NIn],
		      Out1=[X|NOut1],
		      split(NIn,NOut1,Out2))),!;
	Out1=[],Out2=[].

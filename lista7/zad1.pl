merge(In1,In2,Out):-
	freeze(In1,(freeze(In2,(
			      In1=[H1|T1],
			      In2=[H2|T2],
			      (	  H1=<H2->(
				      Out=[H1|NOut],
				      merge(T1,In2,NOut));
			      (
				      Out=[H2|NOut],
				      merge(In1,T2,NOut))),!
			  );
			 (
			      In1=[H1|T],
			      Out=[H1|NOut],
			      merge(T,In2,NOut));
			 (
			     In2=[H2|T],
			     Out=[H2|NOut],
			     merge(In1,T,NOut))),!);
	       Out=[]),!.





rybki(Kto):-
	Domy=[[norweg,_,_,_,_],[_,niebieski,_,_,_],[_,_,mleko,_,_],_,_],
	member([anglik,czerwony,_,_,_],Domy),
	lewy([_,zielony,kawa,_,_],[_,biały,_,_,_],Domy),
	member([duńczyk,_,herbata,_,_],Domy),
	obok([_,_,_,light,_],[_,_,_,_,koty],Domy),
	member([_,żółty,_,cygara,_],Domy),
	member([niemiec,_,_,fajka,_],Domy),
	obok([_,_,_,light,_],[_,_,woda,_,_],Domy),
	member([_,_,_,bez_filtra,ptaki],Domy),
	member([szwed,_,_,_,psy],Domy),
	obok([_,_,_,_,konie],[_,żółty,_,_,_],Domy),
	member([_,_,piwo,mentolowe,_],Domy),
	member([Kto,_,_,_,rybki],Domy).

lewy(X,Y,List):-append(_,[X,Y|_],List).
obok(X,Y,Lista):-
	lewy(X,Y,Lista);
	lewy(Y,X,Lista).
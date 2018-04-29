whitechar(X):-member(X,['\t','\n',' ']).
keyword(X):-
	member(X,['read','write','if','then','else','fi','while',
		  'do','od','and','or','mod']).
separator(X):-
	member(X,[';','+','-','*','/','(',')','<','>','=<','>=',
		  ':=','=','/=']).
sepchar(X):-
	member(X,[';','+','-','*','/','(',')','<','>','=',':']).

scanner(Stream,Tokens):-
	current_input(Input),
	set_input(Stream),
	my_read(Tokens),
	set_input(Input).

my_read(X):-
	get_char(C),
	read_next(C,X).

read_next(end_of_file,[]):-!.
read_next(C,X):-
	whitechar(C),!,
	get_char(C2),
	read_next(C2,X).
read_next(C,[H|T]):-
	category(C,CAT),
	read_word(C,C2,'',S,CAT),
	label(H,S,CAT),
	read_next(C2,T).

category(C,id):-char_type(C,upper).
category(C,key):-char_type(C,lower).
category(C,sep):-sepchar(C).
category(C,int):-
	atom_number(C,N),
	integer(N).

read_word(end_of_file,end_of_file,N,N,_):-!.
read_word(C,C,N,N,_):-
	whitechar(C),!.
read_word(C,C,N,N,CAT):-
	\+ category(C,CAT),!.
read_word(C,C2,N,N2,CAT):-
	atom_concat(N,C,N3),
	get_char(C3),
	read_word(C3,C2,N3,N2,CAT).

label(H,S,id):-H=id(S).
label(H,S,key):-
	keyword(S),
	H=key(S).
label(H,S,sep):-
	separator(S),
	H=sep(S).
label(H,S,int):-
	atom_number(S,N),
	integer(N),
	N >=0,
	H=int(N).

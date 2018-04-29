keyword(X):-member(X,['read','write','if','then','else','fi','while','do','od','and','or','mod']).
separator(X):-
	member(X,[';','+','-','*','/','(',')','<','>','=<','>=',':=','=','/=']).
whitechar(X):-member(X,['\t','\n',' ']).
variable(X):-
	\+ (member(C,X),
	char_type(C,lower)).

scanner(Stream,Tokens):-
	current_input(Input),
	set_input(Stream),
	my_read(Tokens),
	set_input(Input).

my_read(X):-
	get_char(C),
	read_next(C,[],X).

read_next(end_of_file,L,L):-!.
read_next(C,ACC,X):-
	whitechar(C),!,
	get_char(C2),
	read_next(C2,ACC,X).
read_next(C,ACC,X):-
	read_word(C,C2,'',H),
	check_token(ACC,H,L),
	read_next(C2,L,X).

read_word(end_of_file,end_of_file,N,N):-!.
read_word(C,C,N,N):-whitechar(C),!.
read_word(C1,C2,N1,N2):-
	atom_concat(N1,C1,N3),
	get_char(C3),
	read_word(C3,C2,N3,N2).

check_token(L,end_of_file,L):-!.
check_token(L,X,L2):-
	atom_chars(X,CS),
	last(CS,Y),
	Y=';'->(select(Y,CS,NL),!,
		atom_chars(T,NL),
		add_token(L,T,L3),
		add_separator(L3,Y,L2)
	       );add_token(L,X,L2).

add_token(L,end_of_file,L):-!.
add_token(L,X,L2):-
	(   (   keyword(X)->add_keyword(L,X,L2));
	(   separator(X)->add_separator(L,X,L2));
	(   (   (atom_number(X,N),integer(N),N>=0)->add_integer(L,N,L2));
	(   (atom_chars(X,CS),variable(CS))->add_variable(L,X,L2);
	L=L2))).

add_keyword(L,X,L2):-
	Y=key(X),
	append(L,[Y],L2).

add_separator(L,X,L2):-
	Y=sep(X),
	append(L,[Y],L2).

add_integer(L,X,L2):-
	Y=int(X),
	append(L,[Y],L2).

add_variable(L,X,L2):-
	Y=id(X),
	append(L,[Y],L2).

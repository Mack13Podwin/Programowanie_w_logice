:-consult('scanner.pl').
:-consult('grammar.pl').
:-consult('interpreter.pl').

wykonaj(X):-
	open(X,read,Stream),
	scanner(Stream,Tokens),
	close(Stream),
	phrase(program(INST),Tokens),
	interpreter(INST).

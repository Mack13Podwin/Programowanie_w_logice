browse(Term):-
	read_command(Term,[],[]).

read_command(ME,P,Stack):-
	format('~w~ncommand: ',ME),
	read(Com),
	change_node(ME,P,Stack,Com).

change_node(ME,P,Stack,i):-
	ME=..[F,NME|A],
	P1=[F|P],!,
	S=[[NME|A]|Stack],
	read_command(NME,P1,S).
change_node(_,[HP|P],[HS|Stack],o):-
	NME=..[HP|HS],!,
	read_command(NME,P,Stack).
change_node(_,[],[],o):-!.
change_node(ME,P,[HS|Stack],n):-
	append(_,[ME,NME|_],HS),!,
	read_command(NME,P,[HS|Stack]).
change_node(ME,P,[HS|Stack],p):-
	append(_,[NME,ME|_],HS),!,
	read_command(NME,P,[HS|Stack]).
change_node(ME,P,S,_):-read_command(ME,P,S).



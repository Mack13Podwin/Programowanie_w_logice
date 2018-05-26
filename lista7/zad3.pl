filozofowie:-
	thread_create(życie(1),ID1,[]),
	thread_create(życie(2),ID2,[]),
	thread_create(życie(3),ID3,[]),
	thread_create(życie(4),ID4,[]),
	thread_create(życie(5),ID5,[]),
	thread_join(ID1,_),
	thread_join(ID2,_),
	thread_join(ID3,_),
	thread_join(ID4,_),
	thread_join(ID5,_).

życie(ID):-
	(   ID<5->Left is ID,Right is ID+1;Left is 5, Right is 1),
	atom_concat('widelec',Right,MR),
	mutex_lock(MR),
	atom_concat('widelec',Left,ML),
	(
	    mutex_trylock(ML)->
	    napisz(ID,'myśli'),
	    napisz(ID,'chce prawy widelec'),
	    napisz(ID,'podniósł prawy widelec'),
	    napisz(ID,'chce lewy widelec'),
	    napisz(ID,'podniósł lewy widelec'),
	    napisz(ID,'je'),
	    napisz(ID,'odkłada prawy widelec'),mutex_unlock(MR),
	    napisz(ID,'odkłada lewy widelec'), mutex_unlock(ML)
	    ;
	    mutex_unlock(MR)
	),
	sleep(1),
	życie(ID).



napisz(ID,STRING):-
	mutex_lock(pisanie),
	format('[~w] ~w~n',[ID,STRING]),
	mutex_unlock(pisanie),
	sleep(1).







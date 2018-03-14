%wariancja([a_0,...,a_n])=1/n*\sum_{i=1}^n(a_i-avg([a_0,...,a_n]))^2
wariancja([],_):-!,fail.
wariancja(L,X):-
	suma_i_długość(L,Suma,Długość),
	Avg is Suma/Długość,
	wariancja(L,SUM,Avg),
	X is SUM/Długość.
wariancja(L,X,Avg):-wariancja(L,X,0,Avg).
wariancja([],X,X,_).
wariancja([A|L],X,S,Avg):-
	T is (A-Avg)**2,
	SUM is T+S,
	wariancja(L,X,SUM,Avg).
%predykat liczący jednocześnie sumę elementów i długość tablicy
suma_i_długość(L,X,Y):-suma_i_długość(L,X,0,Y,0).
suma_i_długość([],Sum,Sum,Dł,Dł).
suma_i_długość([A|L],X,Sum,Y,Dł):-
	Suma is Sum+A,
	Długość is Dł+1,
	suma_i_długość(L,X,Suma,Y,Długość).

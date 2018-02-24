% Przykłady wywołania:
%
% ?- lubi(przemko, X).
% X = prolog ;
% X = przemko ;
% false.
%
% ?- lubi(X, przemko).
% X = przemko ;
% false.
%
lubi(przemko, prolog).
lubi(przemko, X) :- lubi(X, prolog).

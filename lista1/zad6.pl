prime(LO,HI,N):-
	between(LO,HI,N),
	is_prime(N).

is_prime(2).
is_prime(X):-
	X<2,
	fail.
is_prime(X):-
	X>2,
	\+ divisible(X,2).

divisible(X,Y):-0 is X mod Y.
divisible(X,Y):-X > Y+1, divisible(X, Y+1).

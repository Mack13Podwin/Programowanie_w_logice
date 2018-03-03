prime(LO,HI,N):-
	between(LO,HI,N),
	is_prime(N).

is_prime(2).
is_prime(X):-
	X>2,
	\+ divisible(X,2).

divisible(X,Y):-
	0 is X mod Y;
	X > Y+1,
	Z is Y+1,
	divisible(X, Z).

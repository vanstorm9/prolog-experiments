change(H,Q,D,N,P):-
	/* Commented code was part of tutorial, but I experimented and
	discovered this code is redundant (it doesn't do anything)
	
	member(H,[0,1,2]),
	member(Q,[0,1,2,3,4]),
	member(D, [0,1,2,3,4,5,6,7,8,9,10]),
	member(N, [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,18,19,20]),
	*/ 
	S is 50*H + 25*Q + 10*D + 5*N,
	S =<100,
	P is 100-S.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Template for a SPARC file
%% Author: 
%% Description:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

sorts
	#people = {sara, honoka, bob, joe, batman}.
	#gender = {male, female}.
    
predicates
	% father(X,Y) denotes X is the father of Y
	father(#people, #people).
	mother(#people, #people).

	parent(#people, #people).
	grandparent(#people, #people).
	orphan(#people).
	hasParent(#people).

	% gender(X,Y) where person X is gender Y
	gender(#people, #gender).


rules

	% closed world assumption  (if we do not know something, it is not true)
	-father(X,Y) :- not father(X,Y).
	-mother(X,Y) :- not mother(X,Y).
	-parent(X,Y) :- not parent(X,Y).
	-grandparent(X,Y) :- not grandparent(X,Y).
	-hasParent(X) :- not hasParent(X).
	-orphan(X) :- not orphan(X).

	parent(bob, sara).
	parent(honoka, sara).
	parent(joe, bob).

	
	gender(sara, female).
	gender(honoka, female).
	gender(bob, male).

	% X is father of Y if X is male and X is a parent of Y
	father(X,Y) :- 
		gender(X,male), 
		parent(X,Y).


	% X is mother of Y if X is female and X is a parent of Y
	mother(X,Y) :- 
		gender(X,female), 
		parent(X,Y).

	% X is grandparent of Y if X is parent of Z and Z is parent of Y
	grandparent(X,Y) :- 
		parent(X,Z), 
		parent(Z,Y).

	hasParent(X) :- 
		parent(Y,X).

	orphan(X) :- 
		-hasParent(X).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Template for a SPARC file
%% Author: 
%% Description:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

sorts
    #people = {sara, bob, martha, larry, michael, batman}.
    #gender = {male, female}.
    
predicates
    % father(X,Y) denotes X is the father of Y
    father(#people, #people).
    mother(#people, #people).
    brother(#people, #people).
    sister(#people, #people).
    parent(#people, #people).
    ancestor(#people, #people).
    grandparent(#people, #people).
    grandfather(#people, #people).
    adj(#people, #adj).
    orphan(#people).
    hasParent(#people).
    
    % gender(X,Y) where person X is gender Y
    gender(#people, #gender).
    
    % lol(X,Y) where person X plays/doesn't play lol
    lol(#people, #lol).
    adjLol(#people, #adj).

rules

    % closed world assumption  (if we don't know something, it is not true)
    -father(X,Y) :- not father(X,Y).
    -mother(X,Y) :- not mother(X,Y).
    -parent(X,Y) :- not parent(X,Y).
    -grandparent(X,Y) :- not grandparent(X,Y).
    -hasParent(X) :- not hasParent(X).
    -orphan(X) :- not orphan(X).
    
    gender(michael, male).
    gender(bob, male).
    gender(larry, male).
    gender(sara, female).
    gender(martha, female).
    
    father(bob, sara).
    father(bob, larry).
    mother(martha, sara).
    mother(martha, larry).
    
    parent(michael, bob).
    parent(bob, sara).
    parent(bob, larry).
    parent(martha, sara).
    parent(martha, larry).
    
    brother(larry, sara).
    sister(sara, larry).
    
    % X is father of Y if X is male and X is a parent of Y
    father(X,Y) :- gender(X,male), parent(X,Y).
    % X is grandparent of Y if X is parent of Z and Z is parent of Y
    grandparent(X,Y) :- parent(X,Z), parent(Z,Y).
    % X is grandfather of Y if X is male and X is grandparent of Y
    grandfather(X,Y) :- gender(X,male), grandparent(X,Y).
    % X is ancestor of  Y if X is parent of Z and Z is parent of Y
    ancestor(X,Y) :- parent(X,Y).
    ancestor(X,Y) :- parent(X,Z), ancestor(Z,X).
    
    % orphan(X) denotes that X is orphan
    % X is an orphan if X has no parent
    % orphan(X) :- -hasParent(X).
    % hasParent(X) denotes X has a parent
    % hasParent(X) if there is Y such that parent(Y,X)
    hasParent(X) :- parent(Y,X).
    orphan(X) :- -hasParent(X).

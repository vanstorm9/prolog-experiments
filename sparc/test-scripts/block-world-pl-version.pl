%% blocks
block(a). block(b). block(c). block(d). block(e). block(f).

%% A location can be a block or a table
location(X) :- block(X).

% Declaring t (table) as a location
location(t).


% Block B is at location L if Block B is placed (put) at location L
holds(on(B,L),I+1):- occurs(put(B,L),I).

step(0 .. 999).

%% "Block B is on location L" is a property that changes with time
fluent(on(B,L)):-
	block(B), location(L).

action(put(B,L)):- 
	block(B), location(L),
	B != L.

%%%%%%%%%% rules %%%%%%%%%%%%%
holds(on(a,t),0).
holds(on(b,a),0).
holds(on(c,t),0).
holds(on(d,t),0).
holds(on(e,t),0).
holds(on(e,f),0).

occurs(put(d,b),0).


% Inertia Axiom
% block B is at location L at step I + 1, 
%	if block B is at location L at step I, 
%	if we do not have a reason to believe that block B is NOT at location L at step I + 1

holds(on(B,L), I+1):-	
	holds(on(B,L), I),
	not -holds(on(B,L), I + 1).

% Must deal with moved blocks to work with inertia axiom
% block B is NOT at location L at step I + 1,
%	if block B is NOT at location L at step I,
%	if we have no reason to believe that block B is NOT at location L at I + 1

-holds(on(B,L), I + 1):-
	holds(on(B,L), I),
	not -holds(on(B,L), I + 1).

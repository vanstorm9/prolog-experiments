recognize2(Node,[]) :-
	final(Node).
recognize2(Node1,String) :-
	arc(Node1,Node2,Label),
	traverse2(Label,String,NewString),
	recognize2(Node2,NewString).

traverse2('#',String,String).
traverse2(Label,[Label|Symbols],Symbols).

recognize1(Node,[]) :-
        final(Node).
recognize1(Node1,String) :-
        arc(Node1,Node2,Label),
        traverse1(Label,String,NewString),
        recognize1(Node2,NewString).

traverse1(Label,[Label|Symbols],Symbols)


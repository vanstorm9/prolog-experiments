/*
Traverse and searches the binary tree

Search for a number in the tree (searching for 30 for example)

memberOfTree(30,tree(1,tree(2,tree(3,nil,nil),tree(4,nil,nil)),tree(5,tree(6,nil,nil),tree(7,nil,nil)))).

*/

memberOfTree(X, tree(X, _, _)).
memberOfTree(X, tree(_, L, _)) :- memberOfTree(X, L).
memberOfTree(X, tree(_, _, R)) :- memberOfTree(X, R).

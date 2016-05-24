/*
In order traversal (or depth first search) of binary tree

Prints out the nodes while traversing.

Use this command: 

inorder(tree(1,tree(2,tree(3,nil,nil),tree(4,nil,nil)),tree(5,tree(6,nil,nil),tree(7,nil,nil))),X).

*/

inorder(tree(_,L,_), X) :- inorder(L,X).
inorder(tree(X,_,_), X).
inorder(tree(_,_,R), X) :- inorder(R,X).

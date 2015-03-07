/*:- consult('maze.pl').*/

mazeSize(5,9).
barrier(1,8).
barrier(2,1).
barrier(2,2).
barrier(2,4).
barrier(2,5).
barrier(3,4).
barrier(3,7).
barrier(3,9).
barrier(4,4).
barrier(4,7).
barrier(4,8).
barrier(4,9).
barrier(5,2).


/* Limit the domain of the maze*/

valid_maze(Row, Col) :- 
numlist(1, Row, RowRange), 
numlist(1, Col, ColRange),
member(Row, RowRange), member(Col, ColRange).


/* Below rules produce the output of the maze*/

/* Prints the column numbers */
print_list([]).
print_list([H|Y]) :- tab(1), write(H),  print_list(Y).

column_number(X,L) :- numlist(1, X, L), tab(1), print_list(L).

width(0).
width(X) :- N is X - 1, write(--), width(N).

/* How do you check all facts in knowledge base? */
/* How do you create a list of all facts in knowledge base*/
barrier_list(List) :- findall([X,Y], (barrier(X,Y)), List).


/* */
print_maze(Z) :- barrier_list(List), not(member(Z, List)), write(.).
print_maze(Z) :- barrier_list(List), (member(Z, List)), write(x).
/*output either . or x depending on member of list */

width2(0,_).
/*width2(X) :- N is X - 1, write(.), tab(1), width2(N).*/
width2(X, Y) :- N is X - 1, print_maze(X, Y), tab(1), width2(N, _).

divider(X) :- write(.+), width(X), write(+).  

row(Y,X,L2) :- numlist(1, Y, L2), print_row(Y, X, L2).

print_row(_, _, []). 
print_row(Y, X, [H|T]) :- write(H), write('|'), width2(X,Y), write('|'), nl, print_row(Y, X,T).

mazeSize(A,B) :- output(B,A).

output(X,Y) :- column_number(X,L), nl, divider(X), nl, row(Y, X, L2), divider(X).
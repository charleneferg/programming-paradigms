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


mazelist([], []).
mazelist([0, Col], [].
mazelist([Row, Col], [[Row, Col] | L ]) :- 
							Row > 0, 
							N2 is Row - 1, 
							mazelist([N2, Col], L).

mazeSize(X, Y, L1) :- mazelist([X,Y], L1).

/* Limit the domain of the maze*/

valid_maze(Row, Col) :- 
numlist(1, Row, RowRange), 
numlist(1, Col, ColRange),
member(Row, RowRange), member(Col, ColRange), mazelist([Row,Col], List).

/* How do you check all facts in knowledge base? */
/* How do you create a list of all facts in knowledge base*/
barrier_list(List) :- findall([X,Y], (barrier(X,Y)), List).

/* */
print_maze(Z) :- barrier_list(List), not(member(Z, List)), write(.).
print_maze(Z) :- barrier_list(List), (member(Z, List)), write(x).
/*output either . or x depending on member of list */
/* Below rules produce the output of the maze */
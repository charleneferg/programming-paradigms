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


/* How do you create a list of all facts in knowledge base*/
barrier_list(List) :- findall([X,Y], (barrier(X,Y)), List).



/* Check that the values are within the range of the maze size*/
valid_range(X, Y) :- 
mazeSize(Row,Col),
numlist(1, Row, RowRange), 
numlist(1, Col, ColRange),
member(X, RowRange), member(Y, ColRange), notbarrier(X,Y).

/* Same row*/
same_row([X,Y], [A,B]) :-  X = A, Y \= B.

/* Same column*/
same_col([X,Y], [A,B]) :-  Y = B, X \= A.

reverse([],A,A).
reverse([H|T],Acc,Result):- reverse(T,[H|Acc],Result).

go(X,Y,ActualPath) :- go1(X,Y,[],Path), reverse(Path,[],ActualPath).

go1(X,X,Route,Route).

go1(X,Y,Route,Path) :- door(X,Z), not(member(X,Route)), go1(X,Y,[X|Route],Path).
go1(X,Y,Route,Path) :- door(X,Z), not(member(Z,Route)), go1(Z,Y,[Z|Route],Path).
go1(X,Y,Route,Path):- door(Z,X), not(member(Z,Route)), go1(Z,Y,[Z|Route],Path).
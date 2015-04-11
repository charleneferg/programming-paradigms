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

not_barrier(X,Y) :- barrier(X,Y), not(barrier(X,Y)).

mazelist([], []).
mazelist([0, Col], []).
mazelist([Row, Col], [[Row, Col] | L ]) :- 
							Row > 0, 
							N2 is Row - 1, 
							mazelist([N2, Col], L).


/*Create a list of the barrier facts*/
barrier_list(List) :- findall([X,Y], (barrier(X,Y)), List).	

/* Reverse a list*/
reverse([],A,A).
reverse([H|T],Acc,Result):- reverse(T,[H|Acc],Result).

/* Check that the values are within the range of the maze size*/
valid_range(X, Y) :- 
mazeSize(Row,Col),
numlist(1, Row, RowRange), 
numlist(1, Col, ColRange),
member(X, RowRange), member(Y, ColRange), not_barrier(X,Y).

/* Same row*/
same_row([X,Y], [A,B]) :-  X = A, Y \= B.

/* Same column*/
same_col([X,Y], [A,B]) :-  Y = B, X \= A.

/*Points are next to each other*/
next_to(A, B).
next_to([X,Y], [X,Z]).

/*Points are connected if the points are next to each other. If*/
connect_to([X,Y], [X,Z]) :- next_to([X,Y],[X,Z]).
connect_to([X,Y], [X,Z]) :- next_to([X,Y],[X,A]), connect_to([X,A],[X,Z]).


solve(From, To, Path) :- solve1(From, To, Route, Path).

/* Boundary condition where from and to points are the same point*/
solve1(From, From, Route, Route).


solve1(From, To, Route, Path) :- door(X,Z), not(member(X,Route)), solve1(X,Y,[X|Route],Path).
solve1(From, To, Route, Path) :- door(X,Z), not(member(Z,Route)), solve1(Z,Y,[Z|Route],Path).
solve1(From, To, Route, Path) :- door(Z,X), not(member(Z,Route)), solve1(Z,Y,[Z|Route],Path).

solve(X,Y,AcutalPath) :- solve1(X,Y,[],Path), reverse(Path,[],ActualPath).

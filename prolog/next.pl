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

/* Same column*/
same_col([X,Y], [A,B], [X,Y]|L) :-  Y = B, X \= A.

move(X,Y) :- move([A,B],[C,D]).
move([A,B],[A,_],[[A,B]]).
move([A,B],[_,B],[[A,B]]).
move([A,B],[C,D]):- valid_range(C,D), valid_range(A,B), C > A, Z is C - 1, move([A,B],[Z,D]).
move([A,B],[C,D]):- valid_range(C,D), valid_range(A,B), A > C, Z is A - 1, move([Z,B],[C,D]).
move([A,B],[C,D]):- valid_range(C,D), valid_range(A,B), D > B, Z is D - 1, move([A,B],[C,Z]).
move([A,B],[C,D]):- valid_range(C,D), valid_range(A,B), B > D, Z is B - 1, move([A,Z],[C,D]).


add_move(X,Y,S,F) :- move(X,Z), not(member(Z,S)), add_move(Z,Y,[Z|S],F).
add_move(X,Y,S,[Y|S]) :- move(X,Y).


/* Check that the values are within the range of the maze size*/
valid_range(X, Y) :- 
mazeSize(Row,Col),
numlist(1, Row, RowRange), 
numlist(1, Col, ColRange),
member(X, RowRange), member(Y, ColRange), not(barrier(X,Y)).

reverse([],A,A).
reverse([H|T],Acc,Result):- reverse(T,[H|Acc],Result).

solve(From,To,ActualPath) :- solve1(From,To,[],Path), reverse(Path,[],ActualPath).

solve1(From, To, Route, Route).
solve1(From,To,Route,Path) :- move(From,To), not(member(From,Route)), solve1(From,To,[From|Route],Path).
solve1(From,To,Route,Path) :- move(From,Z), not(member(Z,Route)), solve1(Z,To,[Z|Route],Path).
/*solve1(From,To,Route,Path) :- move(Z,From), not(member(Z,Route)), solve1(Z,To,[Z|Route],Path).*/
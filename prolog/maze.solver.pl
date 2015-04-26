:- consult('maze.pl').
mazeSize(5,2).
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

move(X,Y) :- move([A,B],[C,D]).
move([A,B],[A,_],[[A,B]]).
move([A,B],[_,B],[[A,B]]).
move([A,B],[C,D]):- valid_range(C,D), valid_range(A,B), C > A, Z is C - 1, move([A,B],[Z,D]).
move([A,B],[C,D]):- valid_range(C,D), valid_range(A,B), A > C, Z is A - 1, move([Z,B],[C,D]).
move([A,B],[C,D]):- valid_range(C,D), valid_range(A,B), D > B, Z is D - 1, move([A,B],[C,Z]).
move([A,B],[C,D]):- valid_range(C,D), valid_range(A,B), B > D, Z is B - 1, move([A,Z],[C,D]).

solve(From,To,ActualPath) :- solve1(From,To,[],Path).
solve1(From, From, Route, Route).
solve1(From,To,Route,Path) :- move(From,To), not(member(From,Route)), solve1(From,To,[From|Route],Path).
solve1(From,To,Route,Path) :- move(From,Z), not(member(Z,Route)), solve1(Z,To,[Z|Route],Path).


collist([0, Col], []).
collist([Row, Col], [[Row, Col] | L ]) :- 
							Row > 0, 
							N2 is Row - 1, 
							rowlist([N2, Col], L).



rowlist([Row, 0], []).
rowlist([Row, Col], [[Row, Col] | L ]) :- 
							Col > 0, 
							N2 is Col - 1, 
							rowlist([Row, N2], L).
loop([1, Y], []).
loop([X, Y],[L |List]) :- X > 0, N3 = Y, N2 is X - 1, rowlist([N2, N3], L), loop([N2, Y], List).						

mazelist(List) :- mazeSize(X,Y),rowlist([X,Y], Rowlist), loop([X,Y], L1), append(Rowlist,L1,List).


/* Check that the values are within the range of the maze size*/
valid_range(X, Y) :- 
mazeSize(Row,Col),
numlist(1, Row, RowRange), 
numlist(1, Col, ColRange),
member(X, RowRange), member(Y, ColRange),not(barrier(X,Y)).

/* How do you create a list of all facts in knowledge base*/
barrier_list(List) :- 
	findall([X,Y], 
	(barrier(X,Y)), List).

/* */
print_maze(Z) :- 
	barrier_list(List), 
	not(member(Z, List)), 
	write(.).

print_maze(Z) :- 
	barrier_list(List), 
	(member(Z, List)), 
	write(x).


/*output either . or x depending on member of list */
/* Below rules produce the output of the maze             */

/* Prints the column numbers */
print_list([]).
print_list([H|Y]) :- tab(1), write(H),  print_list(Y).

column_number(X,L) :- numlist(1, X, L), tab(1), print_list(L).

width(0).
width(X) :- N is X - 1, write(--), width(N).

width2(0).
/*width2(X) :- N is X - 1, write(.), tab(1), width2(N). */
width2(X) :- N is X - 1, print_maze(X), tab(1), width2(N).

divider(X) :- write(.+), width(X), write(+).  

row(Y,X,L2) :- numlist(1, Y, L2), print_row(X, L2).

print_row(_, []). 
print_row(X, [H|T]) :- write(H), 
write('|'), width2(X), 
write('|'), nl, 
print_row(X,T).

mazeSize(A,B) :- output(B,A).

output(X,Y) :- column_number(X,L), 
nl, divider(X), nl, 
row(Y, X, L2), 
divider(X).
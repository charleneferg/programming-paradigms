mazeSize(2,3).

nextrow([0, Col], [] ).
nextrow([Row, Col], [Result| List]) :- 
							Row > 1, 
							Newrow is Row - 1,
							rowlist([Newrow, Col], Result), 
							nextrow([Newrow, Col], List).

rowlist([0, Col], []).
rowlist([0, 0], []).
rowlist([Row, 0], []).
rowlist([Row, Col], [[Row, Col] | L ]) :- 
							Col > 0,
							N2 is Col - 1, 
							rowlist([Row, N2], L).

create(X,Y, List):- rowlist([X,Y], Rowlist),
				nextrow([X,Y],L),
 				append(Rowlist,L,Result), sort(Result,List).					

mazelist(List) :- mazeSize(X,Y), create(X,Y, List). 
				

 				/* List = [[1, 3], [2, 1], [2, 2], [2, 3]]  */
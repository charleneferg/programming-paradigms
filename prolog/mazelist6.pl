mazeSize(2,3).

nextrow([Row, Col], []):- Row =< 0.
nextrow([Row, Col], List):- Row > 0, R is Row - 1, rowlist([R, Col], List), nextrow([R, Col], List).

rowlist([Row, Col], []) :- Col =< 0.
rowlist([Row, Col], [[Row, Col] | L ]) :- 
							Col > 0,
							N2 is Col - 1, 
							rowlist([Row, N2], L).

create(X,Y, List):- rowlist([X,Y], Rowlist),
				nextrow([X,Y],L),
 				append(Rowlist,L,Result), sort(Result,List).					

mazelist(List) :- mazeSize(X,Y), create(X,Y, List). 
				

 				/* List = [[1, 3], [2, 1], [2, 2], [2, 3]]  */
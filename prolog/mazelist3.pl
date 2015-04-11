mazeSize(2,3).
rowlist([], []).
rowlist([Row, Col], []).
rowlist([Row, Col], [[Row, Col] | L ]) :- 
							Row > 0, 
							N2 is Row - 1, 
							rowlist([N2, Col], L).

collist([], []).
collist([Row, 0], []).
collist([Row, Col], [[Row, Col] | L ]) :- 
							Col > 0, 
							N2 is Col - 1, 
							collist([Row, N2], L).

mazelist(List) :- mazeSize(X,Y), 
				rowlist([X,Y], Rowlist),
				collist([X,Y], Collist),
 				append(Rowlist,Collist,Result), sort(Result,List).

 				/* List = [[1, 3], [2, 1], [2, 2], [2, 3]]  */
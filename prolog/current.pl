mazeSize(2,3).
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

barrier_list(List) :- findall([X,Y], (barrier(X,Y)), List).
next_to([X,Y], [A,B]) :- 

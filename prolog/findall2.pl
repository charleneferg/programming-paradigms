:- consult('maze.pl').

barrier_list(List) :- 
	findall([X,Y], 
	(barrier(X,Y)), List).
door(a,b).
door(b,e).
door(b,c).
door(d,e).
door(c,d).
door(e,f).
door(g,e).

rev(L1, L2) :- rev2(L1, [], L2).
rev2([X|L1], L2, L3) :- 
/* Predicate member member(X,Y) if X is a member of list Y */

/* Clause 1  X is a member of the list that has X as its head */
/* Use the anonymous variable "_" to stand for the tail of the list, because we do not use tail in this fact*/ 

/*member(X,[X|_]).*/

/* Clause 2  X is a member of the list provided that it is in the tail */

/*member(X,[_|Y]) :- member(X,Y). */

/* Searching rooms in a house */
/* Predicate go(X,Y,Route) succeeds if it is possible to go from room X to room Y */
/* Route the third arguement is a list of the rooms we have visited so far*/

/*Boundary condition where we are going from room X to room Y and we are already at room Y or X = Y */

go(X,Y,Route) :- go1(X,Y,[],R), rev()

go1(X,X,Route,[X|Route]).


/* Choose an adjoining room call it Z, check if we have been to this room before. */
/*If not go from Z to Y and add Z to list */

go(X,Y,Route,[X|Path]) :- door(X,Z), not(member(Z,Route)), go(Z,Y,[Z|Route],[Z|Path]).

 /* Treat door as two-way door, that is door from room a to b is the same as door b to a. */
 /* Add semi colon predicate (for disjunction ,or) */

 /*go(X,Y,Route,Path) :- (door(X,Z); (door(Z,X)), not(member(Z,Route)), go(Z,Y,[Z|Route],[Z|Path]). */

 go(X,Y,Route,Path) :- door(Z,X), not(member(Z,Route)), go(Z,Y,[Z|Route],[Z|Path]). 


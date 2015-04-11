/*
ATTEMPT 1, dont need to split list into Head | Tail notation as only 2 elements in list
movedown([A|B],[A|_],[A|B]).
movedown([From|TFrom],[HTo|TTo],[[From|TFrom] |Result]) :-
	From < HTo,
	FromTemp is From + 1,
	movedown([FromTemp|TFrom],[HTo|TTo],Result).
moveup([A|B],[A|_],[A|B]).
moveup([From|TFrom],[HTo|TTo],[[From|TFrom] |Result]) :-
	From > HTo,
	FromTemp is From - 1,
	moveup([FromTemp|TFrom],[HTo|TTo],Result).
*/

/* move along y coordinates */

movedown([A,B],[A,_],[[A,B]]).
movedown( [StartY,StartX], [EndY,_], [[StartY,StartX] | Result] ) :-
		StartY < EndY,
		CurrentY is StartY + 1,
		movedown([CurrentY,StartX], [EndY,_],Result).

moveup([A,B],[A,_],[[A,B]]).
moveup( [StartY,StartX], [EndY,_], [[StartY,StartX] | Result] ) :-
		StartY > EndY,
		CurrentY is StartY - 1,
		moveup([CurrentY,StartX], [EndY,_],Result).

/* move along x coordinates*/

moveleft([A,B],[_,B],[[A,B]]).
moveleft( [StartY,StartX], [_,EndX], [[StartY,StartX] | Result] ) :-
		StartX > EndX,
		CurrentX is StartX - 1,
		moveleft([StartY,CurrentX], [_,EndX],Result).


moveright([A,B],[_,B],[[A,B]]).
moveright( [StartY,StartX], [_,EndX], [[StartY,StartX] | Result] ) :-

		StartX < EndX,
		CurrentX is StartX + 1,
		moveright([StartY,CurrentX], [_,EndX],Result).
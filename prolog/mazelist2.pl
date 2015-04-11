mazelist([], []).
mazelist([0, Col], []).
mazelist([Row, Col], [[Row, Col] | L ]) :- 
							Row > 0, 
							N2 is Row - 1, 
							mazelist([N2, Col], L).


%mazelist([Row, Col], L) :-
%							Row > 0, 
%							N2 is Row - 1, 
%							mazelist([N2, Col], L1), 
%							append([L1],[Row, Col], L).

create_list(0,[]).
create_list(N, K) :- X is N-1, create_list(X, K1), append(K1,[N],K).

moveright([A,B],[_,B],[[A,B]]).
moveright( [StartY,StartX], [_,EndX], [[StartY,StartX] | Result] ) :-

		StartX < EndX,
		CurrentX is StartX + 1,
		moveright([StartY,CurrentX], [_,EndX],Result).
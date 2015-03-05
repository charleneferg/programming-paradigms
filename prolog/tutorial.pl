path(1,2)
path(2,5)
path(1,3)
path(3,4)
path(4,8)
path(3,6)
path(6,7)
path(7,8)

route(Start,End) :- path(Start, end).

route(Start,End) :- path(start,Somewhere),
route(Somewhere,End).
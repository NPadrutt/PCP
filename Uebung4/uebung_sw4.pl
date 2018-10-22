mem(X, [X | _]).
mem(X, [_| Tail]) :- mem(X, Tail).


set_difference([H|TailSet1], Set2, [H|SetDifferenceTail]) :-
    not(mem(H, Set2)),
    set_difference(TailSet1, Set2, SetDifferenceTail).

set_difference([H|TailSet1], Set2, SetDifference) :-
    mem(H, Set2),
    set_difference(TailSet1, Set2, SetDifference).

set_difference([],_,[]).

:- use_module(library(clpr)).
%{ T = 15, M = T * 3, M = 2*(T+X)}.

?- use_module(library(clpfd)).

donald_gerald_robert([D,O,N,A,L,D] + [G,E,R,A,L,D] = [R,O,B,E,R,T]) :-
        Vars = [D,O,N,A,L,G,E,R,B,T],
        Vars ins 0..9,
        all_distinct(Vars),
                 D*100000 + O*10000 + N*1000 + A*100 + L*10 + D +
                 G*100000 + E*10000 + R*1000 + A*100 + L*10 + D #=
        R*100000 + O*10000 + B*1000 + E*100 + R*10 + T,
        D #\= 0, G #\= 0,
	label(Vars).

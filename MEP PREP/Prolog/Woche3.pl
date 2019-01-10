:- use_module(library(clpr)).
:- use_module(library(clpfd)).

%set_difference([a, b, c, d], [b, d, e, f], [a, c]).

mem(X, [X | _]).
mem(X, [_| Tail]) :- mem(X, Tail).

set_difference([],_,[]).
set_difference([X|Tail],Set2,[X|DifferenceList]) :-
    not(mem(X,Set2)),
    set_difference(Tail, Set2, DifferenceList).

set_difference([X|Tail],Set2, DifferenceList) :-
    mem(X,Set2),
    set_difference(Tail, Set2, DifferenceList).


% 3)
%  { T = 15, M=3*T, X+M=2*(X+T) }.


% 4)
solve_word([D,O,N,A,L,D] + [G,E,R,A,L,D] = [R,O,B,E,R,T]):-
    Vars = [D,O,N,A,L,G,E,R,B,T],
    Vars ins 0..9,
    all_distinct(Vars),
       D*100000 + O*10000 + N*1000 + A*100 + L*10 + D
      +G*100000 + E*10000 + R*1000 + A*100 + L*10 + D
     #=R*100000 + O*10000 + B*1000 + E*100 + R*10 + T,
     D#\=0,G#\=0,R#\=0,
     label(Vars).

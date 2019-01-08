% warn(T) :- T < 80, write('Temperatur ok'), !.
% warn(T) :- T < 100, write('Temperatur sehr warm'), !.
% warn(_) :- write('Temperatur zu heiss').
warn(T) :-T < 80, write('Temperatur ok').
warn(T) :-T < 100, write('Temperatur sehr warm').
warn(_) :-write('Temperatur zu heiss').
% Im Fall ohne Cut werden z.B. bei der Eingabe 70 alle drei Regeln
% ausgeführt, da nicht nach der ersten abgebrochen wird.

mem(X, [X | _]).
mem(X, [_ | Tail]) :- mem(X, Tail).

%L = [_, _, _], mem(a, L), mem(b, L), mem(c, L).
%L = [_, _, _], mem(a, L), mem(b, L), mem(c, L),!.





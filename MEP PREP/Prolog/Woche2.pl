fib_tr(N, F) :- fib_tr(N, 0, 1, F).
fib_tr(0, A, _, A).
fib_tr(N, A, B, F) :-
	N1 is N - 1,
	N1 >= 0,
	Sum is A + B,
	fib_tr(N1, B, Sum, F).

io_fib():-
	write("Gib eine Zahl ein: "),
	read(X),
	fib_tr(X, Y),
	write(Y).

fak(0, 1).
fak(N, F) :-
	write("Hinweis: Fakult�t von"),
	write(N),
	write("wurde gespeichert"),
        fak_as(N, F).
fak(N, F) :-
	N > 0,
	N1 is N - 1,
	fak(N1, F1),
	F is N * F1,
        asserta(fak_as(N, F)).

:- dynamic fak_as/2.

fak_clear():-
	retractall(fak_as(_,_)),
	write("Hinweis: Alle gespeicherten Werte wurden gel�scht").

%// 3.
% a)
add_tail(X, [], [X]).
add_tail(X, [Y|Tail1], [Y|Tail2]) :-
	add_tail(X, Tail1, Tail2).

% b)
% del([a,b,c], c, L).

del([],_,[]).
del([X|Tail], X, Tail).
del([Y|Tail],X, [Y|L]):- del(Tail,X,L).

%mem_d(a, [a,b,c]).

mem_d(X, List) :-
    del(List, X, Temp),
    not(List = Temp).

%rev_acc([a, b, c, d], [], L).

rev_acc([],L,L).
rev_acc([H|T],Acc,L) :- rev_acc(T, [H|Acc],L).

rev(List, Reverse) :- rev_acc(List,[],Reverse).




% warn(T) :- T < 80, write('Temperatur ok'), !.
% warn(T) :- T < 100, write('Temperatur sehr warm'), !.
% warn(_) :- write('Temperatur zu heiss').
warn(T) :-T < 80, write('Temperatur ok').
warn(T) :-T < 100, write('Temperatur sehr warm').
warn(_) :-write('Temperatur zu heiss').
% Im Fall ohne Cut werden z.B. bei der Eingabe 70 alle drei Regeln
% ausgef�hrt, da nicht nach der ersten abgebrochen wird.

mem(X, [X | _]).
mem(X, [_ | Tail]) :- mem(X, Tail).

%L = [_, _, _], mem(a, L), mem(b, L), mem(c, L).
%L = [_, _, _], mem(a, L), mem(b, L), mem(c, L),!.





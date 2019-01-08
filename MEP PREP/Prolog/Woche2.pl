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
	write("Hinweis: Fakultät von"),
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
	write("Hinweis: Alle gespeicherten Werte wurden gelöscht").

%// 3.
% a)
add_tail(X, [], [X]).
add_tail(X, [Y|Tail1], [Y|Tail2]) :-
	add_tail(X, Tail1, Tail2).

% b)

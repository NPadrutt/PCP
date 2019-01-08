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

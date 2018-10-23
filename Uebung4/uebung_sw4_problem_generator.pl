female(mary). female(liz). female(mia). female(tina). female(ann). female(sue).    % all females
male(mike). male(jack). male(fred). male(tom). male(joe). male(jim).               % all males
parent(mary, mia). parent(mary, fred). parent(mary, tina).                         % all childern of mary
parent(mike, mia). parent(mike, fred). parent(mike, tina).                         % all children of mike
parent(liz, tom). parent(liz, joe).                                                % allchildern of liz
parent(jack, tom). parent(jack, joe).                                              % all childern of jack
parent(mia, ann).                                                                  % all childern of mia
parent(tina, sue). parent(tina, jim).                                              % all childern of tina
parent(tom, sue). parent(tom, jim).                                                % all childern of t

mother(X,Y) :- parent(X,Y), female(X).
father(X,Y) :- parent(X,Y), male(X).
sibling(X,Y) :- parent(Z,X), parent(Z,Y).
grandmother(X,Y) :- mother(X,Z), parent(Z,Y).
offspring(X,Y) :- parent(Y,X).
offspring(X,Y) :- parent(Z,X), offspring(Z,Y).

:- op(1150, xfx, parent).
:- op(1150, xfx, mother).
:- op(1150, xfx, father).
:- op(1150, xfx, sibling).
:- op(1150, xfx, grandmother).
:- op(1150, xfx, offspring).

:- use_module(library(clpfd)).

solve_sudoku(Rows) :-
  append(Rows, Vs), Vs ins 1..9,
  maplist(all_distinct, Rows),
  transpose(Rows, Columns),
  maplist(all_distinct, Columns),
  Rows = [A,B,C,D,E,F,G,H,I],
  blocks(A, B, C), blocks(D, E, F), blocks(G, H, I),
  maplist(label, Rows).

blocks([], [], []).
blocks([A,B,C|Bs1], [D,E,F|Bs2], [G,H,I|Bs3]) :-
  all_distinct([A,B,C,D,E,F,G,H,I]),
  blocks(Bs1, Bs2, Bs3).

:- use_module(library(http/json_convert)).
:- use_module(library(http/http_json)).
:- use_module(library(http/http_client)).

:-json_object relation_json(firstPerson:atom, secondPerson:atom, relationship:atom, problemKey:integer).
:-json_object relation_solution_json(solution:atomic, problemKey:integer).
:-json_object sudoku_json(problemKey:integer, sudoku:list).
:-json_object sudoku_solution_json(problemKey:integer, solution:list).

solve(relationship, Id) :-
    atom_concat('http://localhost:16316/problem/relationship/', Id, Url),
    http_get(Url, Json, []),
    json_to_prolog(Json, relation_json(FirstPerson, SecondPerson, Relationship, ProblemKey)),

    solve_relationship(FirstPerson, Relationship, SecondPerson, ProblemKey).

solve_relationship(FirstPerson, Relationship, SecondPerson, ProblemKey):-
    not(call(Relationship, FirstPerson, SecondPerson)),
    prolog_to_json(relation_solution_json(false, ProblemKey), Json),
    http_post('http://localhost:16316/problem/relationship/', json(Json), _, []).


solve_relationship(FirstPerson, Relationship, SecondPerson, ProblemKey):-
    call(Relationship, FirstPerson, SecondPerson),
    prolog_to_json(relation_solution_json(true, ProblemKey), Json),
    http_post('http://localhost:16316/problem/relationship/', json(Json), _, []).


solve(sudoku, Id) :-
    atom_concat('http://localhost:16316/problem/sudoku/', Id, Url),
    http_get(Url, Json, []),
    json_to_prolog(Json, sudoku_json(ProblemKey, SudokuTemp)),
    maplist(replace, SudokuTemp, Sudoku),
    Sudoku = [A, B, C, D, E, F, G, H, I],
    solve_sudoku([A, B, C, D, E, F, G, H, I]),
    prolog_to_json(sudoku_solution_json(ProblemKey, Sudoku), JsonSolution),
    http_post('http://localhost:16316/problem/sudoku', json(JsonSolution), _,[]).

replace(L1, L2) :-
	maplist(replace_help, L1, L2).

replace_help(0, _).
replace_help(X, X).

female(mary). female(liz). female(mia). female(tina). female(ann). female(sue).% all females
male(mike). male(jack). male(fred). male(tom). male(joe). male(jim). % all males
parent(mary, mia). parent(mary, fred). parent(mary, tina). % all childern of mary
parent(mike, mia). parent(mike, fred). parent(mike, tina). % all children of mike
parent(liz, tom). parent(liz, joe). % allchildern of liz
parent(jack, tom). parent(jack, joe). % all childern of jack
parent(mia, ann). % all childern of mia
parent(tina, sue). parent(tina, jim). % all childern of tina
parent(tom, sue). parent(tom, jim). % all childern of tom

mother(X, Y) :-
    female(X),
    parent(X, Y).

father(X, Y) :-
    male(X),
    parent(X,Y).

sibling(X, Y) :-
    parent(Z, X),
    parent(Z, Y).

grandmother(X, Y) :-
    female(X),
    mother(X,Z),
    parent(Z,Y).

offspring(X, Y) :- parent(Y, X).
offspring(X, Y) :-
    parent(Z, X),
    offspring(Z, Y).


word(n,e,u).
word(t,o,p).
word(t,o,t).
word(b,r,o,t).
word(g,r,a,u).
word(h,a,l,t).
word(a,l,l,e).
word(j,e,t,z,t).
word(s,a,g,e,n).
word(u,n,t,e,n).
word(z,e,c,k,e).

solve(L1,L2,L3,L4,L5,L6,L7,L8,L9,L10,L11,L12) :-
    word(L2,L3,L4,L5),
    word(L8,L9,L10,L11,L12),
    word(L1,L3,L6,L8),
    word(L5,L7,L10).

color(gelb,rot).   color(gelb,grün).
color(rot,gelb).   color(rot, grün).
color(grün, gelb). color(grün, rot).

colors(LU,NW,OW,SZ,UR,ZG) :-
    UR = grün,
    SZ = rot,
    color(LU,NW), color(LU,OW), color(LU,ZG), color(LU,SZ),
    color(NW,OW), color(NW,UR), color(NW,SZ),
    color(UR,SZ),
    color(SZ,ZG).

:-op(1150, xfx, mother).
:-op(1150, xfx, offspring).

mult(0,_,0).
mult(_,0,0).
mult(Faktor1,Faktor2,Produkt) :-
    Count is Faktor1-1,
    Count >= 0,
    mult(Count, Faktor2, TempSum),
    Produkt is TempSum + Faktor2.

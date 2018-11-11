% Color Combinations
n(red, green). n(green, red).
n(yellow, red). n(red, yellow).
n(green, yellow). n(yellow, green).

colors(LU, NW, OW, SZ, UR, ZG) :-
    UR = yellow,
    SZ = red,
    n(LU, OW), n(LU, NW), n(LU, SZ), n(LU,ZG),
    n(OW, NW), n(OW,UR),
    n(NW,UR), n(NW,SZ),
    n(SZ, ZG), n(SZ, UR).

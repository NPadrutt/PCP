mult(0,_,0).
mult(_,0,0).
mult(Faktor1, Faktor2, Produkt) :-
    Count is Faktor1 - 1,
    Count >= 0,
    mult(Count, Faktor2, TempSum),
    Produkt is TempSum + Faktor2.

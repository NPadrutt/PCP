%words
word(n,e,u). word(t,o,p). word(t,o,t).                                 % 3 letters
word(b,r,o,t). word(g,r,a,u). word(h,a,l,t). word(a,l,l,e).             % 4 letters
word(j,e,t,z,t). word(s,a,g,e,n). word(u,n,t,e,n). word(z,e,c,k,e).     % 5 letters

solution(L1,L2,L3,L4,L5,L6,L7,L8,L9,L10,L11,L12) :-
    word(L2,L3,L4,L5),                           %second horizontal row
    word(L8,L9,L10,L11,L12),                     %second horizontal row
    word(L1,L3,L6,L8),                           %first vertical row
    word(L5,L7,L10).                             %second vertical row

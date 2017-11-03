<<<<<<< HEAD
articulo([el]).
nombre([gato]).
nombre([perro]).
nombre([pescado]).
nombre([carne]).
verbo([come]).

/*
oracion(Z):-sintagma_nominal(X), sintagma_verbal(Y).
sintagma_nominal(Z):-determinate(X), nombre(Y).
sintagma_verbal(Z):-verbo(X), sintagma_nominal(Y).
sintagma_verbal(X):-verbo(X).
*/

oracion(O):- particula_interrogativa(PI),
             oracion(O2),
             append(PI, O2).
oracion(O):- sintagma_nominal(SN),
             sintagma_verbal(SV).
             append(SN, SV, O).

sintagma_nominal(SN):- nombre(SN).
sintagma_nominal(SN):- articulo(A),
                       nombre(N),
                       append(A, N, SN).

sintagma_verbal(SV):- verbo(V),
                      sintagma_nominal(SN),
                      append(V, SN, SV).

ask:-
  split_string("¿El gato come pescado?", "", "¿", L),
  write(L).
=======
Gay(Nicko, le gustan de 20 cm).
sdasdas
dadas
asda
>>>>>>> c41ccff9ed9c3474afe15fab5b854ad8dcd943d8

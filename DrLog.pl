particula_interrogativa([donde]).
particula_interrogativa([como]).
particula_interrogativa([cuando]).
particula_interrogativa([que]).
particula_interrogativa([cuanto]).
particula_interrogativa([cuanta]).
particula_interrogativa([cuantos]).
particula_interrogativa([cuantas]).
particula_interrogativa([quien]).
particula_interrogativa([quienes]).
plarticula_interrogativa([cual]).
particula_interrogativa([cuales]).

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

oracion(O):- sintagma_nominal(SN),
             sintagma_verbal(SV).
             append(SN, SV, O).
oracion(O):- particula_interrogativa(PI),
             oracion(O2),
             append(PI, O2).

sintagma_nominal(SN):- nombre(SN).
sintagma_nominal(SN):- articulo(A),
                       nombre(N),
                       append(A, N, SN).

sintagma_verbal(SV):- verbo(V),
                      sintagma_nominal(SN),
                      append(V, SN, SV).

quita_signos(Oracion, Oracion_sin_signos):- split_string(Oracion, "", "¿", Lista),
                        atomic_list_concat(Lista, ' ', Atom),
                        atom_string(Atom, String),
                        split_string(String, "", "?", Oracion_sin_signos).

ask:-
  quita_signos("¿cual gato come pescado?", Lista),
  write(Lista),
  oracion(Lista).

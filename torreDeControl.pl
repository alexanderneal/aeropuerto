% Hechos
pista(1).
pista(2).
pista(3).

avion(avion1).
avion(avion2).
avion(avion3).

estado_pista(1, libre).
estado_pista(2, libre).
estado_pista(3, libre).

% Reglas

% Acción: Pedir pista (Transición de "Libre" a "Asignada")
pedirPista(Avion, Pista) :-
      avion(Avion),
      pista(Pista),
      estado_pista(Pista, libre),
      retract(estado_pista(Pista, libre)),
      assert(estado_pista(Pista, asignada(Avion))).

% Acción: Comunicar entrada de avión (Transición de "Asignada" a "Ocupada")
comunicarEntrada(Avion, Pista) :-
    avion(Avion),
    pista(Pista),
    estado_pista(Pista, asignada(Avion)),
    retract(estado_pista(Pista, asignada(Avion))),
    assert(estado_pista(Pista, ocupada(Avion))).

% Acción: Comunicar salida de avión (Transición de "Ocupada" a "Libre")
comunicarSalida(Avion, Pista) :-
      avion(Avion),
      pista(Pista),
      estado_pista(Pista, ocupada(Avion)),
      retract(estado_pista(Pista, ocupada(Avion))),
      assert(estado_pista(Pista, libre)).

% Ejemplo de uso
ejemplo_torre_control :-
    pedirPista(avion1, 1),
    comunicarEntrada(avion1,1),
    comunicarSalida(avion1,1),
    pedirPista(avion2,2),
    comunicarEntrada(avion2,2),
    comunicarSalida(avion2,2),
    pedirPista(avion3,3),
    comunicarEntrada(avion3,3),
    comunicarSalida(avion3,3).



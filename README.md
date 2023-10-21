# Simulación de Aeropuerto

Este es un ejemplo de simulación de una Torre de control de tráfico aéreo. La simulación existe  en tres posibles estados que se dan en un aterrizaje de avión en un aeropuerto. 
Se consta de la presencia de un avion aproximandose a la torre de control.
El estado **Libre** , para transitar al siguente debemos **pedirPista**.
**Asignada** y para pasar al siguiente estado debemos **comunicarEntradaAvion**.
**Ocupada** y para llegar al estado siguiente, debemos **comunicarSalidaAvion**.

De este modo se completa el ciclo sobre el funcionamiento de la torre de control.

## Modelo ER 

![Imagen de diagrama](modeloER.png)

## Uso
Aquí se presentan unos ejemplos de consultas que se pueden hacer en la simulación de control de tráfico aéreo:

1. ¿Qué pistas están actualmente libres?

```prolog

estado_pista(Pista, libre).

```

Esta consulta mostrará las pistas que están actualmente en estado "libre".

2. ¿Qué pistas están asignadas u ocupadas por un avión específico? Por ejemplo, para verificar si la pista 2 está asignada a algún avión:

```prolog

estado_pista(2, asignada(Avion)).

```

3. ¿Qué aviones están en una pista específica? Por ejemplo, para verificar si el avión avion1 está en la pista 3:

```prolog

estado_pista(3, asignada(avion1)).

```

4. ¿Qué aviones han utilizado las pistas hasta ahora? Esta consulta muestra todos los aviones que han utilizado las pistas, ya sea que estén asignadas o ocupadas:

```prolog

avion(Avion), (estado_pista(_, asignada(Avion)) ; estado_pista(_, ocupada(Avion))).

```

5. ¿Cuál es el estado actual de una pista específica? Por ejemplo, para conocer el estado de la pista 1:

```prolog

estado_pista(1, Estado).

```

6. ¿Qué aviones han pedido una pista pero aún no han comunicado su entrada? Esta consulta muestra los aviones que han solicitado una pista pero aún no han comunicado su entrada:

```prolog

avion(Avion), estado_pista(_, asignada(Avion)).

```

Esto son algunas de las consultas que se pueden realizar para conocer información acerca de los aviones  y las pistas de aterrizaje del aeropuerto.  

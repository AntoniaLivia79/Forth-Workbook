( Define constants for screen dimensions )
20 CONSTANT WIDTH
10 CONSTANT HEIGHT

( Define directions )
0 CONSTANT NORTH
1 CONSTANT SOUTH
2 CONSTANT EAST
3 CONSTANT WEST

( Game running flag )
VARIABLE running

( Define TRUE and FALSE )
-1 CONSTANT TRUE
0 CONSTANT FALSE

( Player position )
VARIABLE player-x
VARIABLE player-y

( Initialize player position )
5 player-x !
5 player-y !

( Initialize running flag )
TRUE running !

: clear-screen ( -- )

  27 EMIT [CHAR] [ EMIT [CHAR] 2 EMIT [CHAR] J EMIT ;

: draw-map ( -- ) 

  HEIGHT 0 DO
    WIDTH 0 DO
      I player-x @ = J player-y @ = AND IF
        ." @"
      ELSE 
        I 0 = I WIDTH 1- = OR J 0 = J HEIGHT 1- = OR OR IF 
          ." #"
      ELSE
        ." ."
        THEN
      THEN
    LOOP
    CR
  LOOP ;

( Custom >= operator )
: greater-equal ( n1 n2 -- flag )
  < 0= ;

( Custom < operator )
: less-than ( n1 n2 -- flag )
  > 0= ;

: non-negative? ( n -- flag )
  0 greater-equal ;

: move-north ( -- )
  player-y @ 1- DUP non-negative? IF
    player-y !
  ELSE
    DROP
  THEN ;

: move-south ( -- )
  player-y @ 1+ DUP HEIGHT < IF
    player-y !
  ELSE
    DROP
  THEN ;

: move-east ( -- )
  player-x @ 1+ DUP WIDTH < IF
    player-x !
  ELSE
    DROP
  THEN ;

: move-west ( -- )
  player-x @ 1- DUP non-negative? IF
    player-x !
  ELSE
    DROP
  THEN ;

: handle-input ( -- )
  KEY DUP [CHAR] w = IF
    DROP move-north
  ELSE DUP [CHAR] s = IF
    DROP move-south
  ELSE DUP [CHAR] a = IF
    DROP move-west
  ELSE DUP [CHAR] d = IF
    DROP move-east
  ELSE DUP [CHAR] q = IF
    DROP ." q pressed, exiting" CR FALSE running !
  ELSE
    DROP ( Do nothing for other keys )
  THEN THEN THEN THEN THEN ;

: game-loop ( -- )
  BEGIN
    clear-screen
    CR draw-map
    handle-input
    running @
  WHILE
  REPEAT ;

: start-game ( -- )
  game-loop ;

start-game


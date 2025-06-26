thf(obj_type,type,
    obj: $tType ).

thf(mor_type,type,
    mor: obj > obj > $tType ).

thf(id_type,type,
    id: 
      !>[X: obj] : ( mor @ X @ X ) ).

thf(comp_type,type,
    comp: 
      !>[X: obj,Y: obj,Z: obj] : ( ( mor @ X @ Y ) > ( mor @ Y @ Z ) > ( mor @ X @ Z ) ) ).

thf(ax1,axiom,
    ! [X: obj,Y: obj,M: mor @ X @ Y] :
      ( ( comp @ X @ X @ Y @ ( id @ X ) @ M )
      = M ) ).

thf(ax2,axiom,
    ! [X: obj,Y: obj,M: mor @ X @ Y] :
      ( ( comp @ X @ Y @ Y @ M @ ( id @ Y ) )
      = M ) ).

thf(ax3,axiom,
    ! [X: obj,Y: obj,Z: obj,A: obj,F: mor @ X @ Y,G: mor @ Y @ Z,H: mor @ Z @ A] :
      ( ( comp @ X @ Y @ A @ F @ ( comp @ Y @ Z @ A @ G @ H ) )
      = ( comp @ X @ Z @ A @ ( comp @ X @ Y @ Z @ F @ G ) @ H ) ) ).

thf(conj,conjecture,
    ! [X: obj,Y: obj,Z: obj,F: mor @ X @ Y,G: mor @ Y @ Z] :
      ( ( ( X = Y )
        & ( Y = Z )
        & ( F
          = ( id @ X ) )
        & ( G
          = ( id @ Y ) ) )
     => ( ( comp @ X @ Y @ Z @ F @ G )
        = ( id @ Z ) ) ) ).


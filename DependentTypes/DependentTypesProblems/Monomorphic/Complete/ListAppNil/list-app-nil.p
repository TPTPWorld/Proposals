thf(elem_type,type,
    elem: $tType ).

thf(nat_type,type,
    nat: $tType ).

thf(zero_type,type,
    zero: nat ).

thf(suc_type,type,
    suc: nat > nat ).

thf(plus_type,type,
    plus: nat > nat > nat ).

thf(list_type,type,
    list: nat > $tType ).

thf(nil_type,type,
    nil: list @ zero ).

thf(cons_type,type,
    cons: 
      !>[N: nat] : ( elem > ( list @ N ) > ( list @ ( suc @ N ) ) ) ).

thf(app_type,type,
    app: 
      !>[N: nat,M: nat] : ( ( list @ N ) > ( list @ M ) > ( list @ ( plus @ N @ M ) ) ) ).

thf(peano1,axiom,
    ! [N: nat] :
      ( ( suc @ N )
     != zero ) ).

thf(peano2,axiom,
    ! [N: nat,M: nat] :
      ( ( N != M )
     => ( ( suc @ N )
       != ( suc @ M ) ) ) ).

thf(peano3,axiom,
    ! [P: nat > $o] :
      ( ( P @ zero )
     => ( ! [M: nat] :
            ( ( P @ M )
           => ( P @ ( suc @ M ) ) )
       => ! [N: nat] : ( P @ N ) ) ) ).

thf(list_induct,axiom,
    ! [P: !>[N: nat] : ( ( list @ N ) > $o )] :
      ( ( P @ zero @ nil )
     => ( ! [M: nat,X: elem,Y: list @ M] :
            ( ( P @ M @ Y )
           => ( P @ ( suc @ M ) @ ( cons @ M @ X @ Y ) ) )
       => ! [N: nat,X: list @ N] : ( P @ N @ X ) ) ) ).

thf(ax1,axiom,
    ! [N: nat] :
      ( ( plus @ zero @ N )
      = N ) ).

thf(ax2,axiom,
    ! [N: nat,M: nat] :
      ( ( plus @ ( suc @ N ) @ M )
      = ( suc @ ( plus @ N @ M ) ) ) ).

thf(ax3,axiom,
    ! [N: nat,X: list @ N] :
      ( ( app @ zero @ N @ nil @ X )
      = X ) ).

thf(ax4,axiom,
    ! [N: nat,M: nat,X: elem,Y: list @ N,Z: list @ M] :
      ( ( app @ ( suc @ N ) @ M @ ( cons @ N @ X @ Y ) @ Z )
      = ( cons @ ( plus @ N @ M ) @ X @ ( app @ N @ M @ Y @ Z ) ) ) ).

thf(plus_zero_r,axiom,
    ! [M: nat] :
      ( ( plus @ M @ zero )
      = M ) ).

thf(list_app_nil_indinst,axiom,
    ( ( ( app @ zero @ zero @ nil @ nil )
      = nil )
   => ( ! [M: nat,X: elem,L: list @ M] :
          ( ( ( app @ M @ zero @ L @ nil )
            = L )
         => ( ( app @ ( suc @ M ) @ zero @ ( cons @ M @ X @ L ) @ nil )
            = ( cons @ M @ X @ L ) ) )
     => ! [M: nat,L: list @ M] :
          ( ( app @ M @ zero @ L @ nil )
          = L ) ) ) ).

thf(list_app_nil_base,axiom,
    ( ( app @ zero @ zero @ nil @ nil )
    = nil ) ).

thf(list_app_nil_indstep,axiom,
    ! [N: nat,X: elem,L: list @ N] :
      ( ( ( app @ N @ zero @ L @ nil )
        = L )
     => ( ( app @ ( suc @ N ) @ zero @ ( cons @ N @ X @ L ) @ nil )
        = ( cons @ N @ X @ L ) ) ) ).

thf(list_app_nil,conjecture,
    ! [N: nat,L: list @ N] :
      ( ( app @ N @ zero @ L @ nil )
      = L ) ).


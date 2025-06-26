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

thf(rev_type,type,
    rev: 
      !>[N: nat] : ( ( list @ N ) > ( list @ N ) ) ).

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

thf(plus_zero_r,axiom,
    ! [M: nat] :
      ( ( plus @ M @ zero )
      = M ) ).

thf(plus_com,axiom,
    ! [N: nat,M: nat] :
      ( ( plus @ N @ M )
      = ( plus @ M @ N ) ) ).

thf(plus_assoc,axiom,
    ! [M1: nat,M2: nat,M3: nat] :
      ( ( plus @ M1 @ ( plus @ M2 @ M3 ) )
      = ( plus @ ( plus @ M1 @ M2 ) @ M3 ) ) ).

thf(plus1r,axiom,
    ! [N: nat] :
      ( ( suc @ N )
      = ( plus @ N @ ( suc @ zero ) ) ) ).

thf(plus1ra,axiom,
    ! [N: nat,M: nat] :
      ( ( plus @ ( plus @ N @ ( suc @ zero ) ) @ M )
      = ( plus @ N @ ( suc @ M ) ) ) ).

thf(list_app_assoc_m1_step4,conjecture,
    ! [M: nat,L: list @ M,X: elem,M3: nat,L3: list @ M3] :
      ( ( ( app @ ( plus @ M @ ( suc @ zero ) ) @ M3 @ ( app @ M @ ( suc @ zero ) @ L @ ( cons @ zero @ X @ nil ) ) @ L3 )
        = ( app @ M @ ( suc @ M3 ) @ L @ ( cons @ M3 @ X @ ( app @ zero @ M3 @ nil @ L3 ) ) ) )
     => ( ( app @ ( plus @ M @ ( suc @ zero ) ) @ M3 @ ( app @ M @ ( suc @ zero ) @ L @ ( cons @ zero @ X @ nil ) ) @ L3 )
        = ( app @ M @ ( suc @ M3 ) @ L @ ( cons @ M3 @ X @ L3 ) ) ) ) ).

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

thf(ax6,axiom,
    ! [N: nat,X: elem,Y: list @ N] :
      ( ( rev @ ( suc @ N ) @ ( cons @ N @ X @ Y ) )
      = ( app @ N @ ( suc @ zero ) @ ( rev @ N @ Y ) @ ( cons @ zero @ X @ nil ) ) ) ).

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

thf(plus_s_com,axiom,
    ! [N: nat,M: nat] :
      ( ( plus @ ( suc @ N ) @ M )
      = ( plus @ ( suc @ M ) @ N ) ) ).

thf(list_rev_invol_lem_indstep5,conjecture,
    ! [N: nat,X: elem,L: list @ N,M2: nat,L2: list @ M2] :
      ( ( ( rev @ ( plus @ ( suc @ N ) @ M2 ) @ ( app @ ( suc @ N ) @ M2 @ ( rev @ ( suc @ N ) @ ( cons @ N @ X @ L ) ) @ L2 ) )
        = ( app @ ( suc @ M2 ) @ N @ ( rev @ ( suc @ M2 ) @ ( cons @ M2 @ X @ L2 ) ) @ L ) )
     => ( ( rev @ ( plus @ ( suc @ N ) @ M2 ) @ ( app @ ( suc @ N ) @ M2 @ ( rev @ ( suc @ N ) @ ( cons @ N @ X @ L ) ) @ L2 ) )
        = ( app @ ( suc @ M2 ) @ N @ ( app @ M2 @ ( suc @ zero ) @ ( rev @ M2 @ L2 ) @ ( cons @ zero @ X @ nil ) ) @ L ) ) ) ).

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

thf(plus_zero_r,axiom,
    ! [M: nat] :
      ( ( plus @ M @ zero )
      = M ) ).

thf(plus1r,axiom,
    ! [N: nat] :
      ( ( suc @ N )
      = ( plus @ N @ ( suc @ zero ) ) ) ).

thf(list_rev_invol_lem_base_step1,axiom,
    ! [M2: nat,L2: list @ M2] :
      ( ( rev @ ( plus @ zero @ M2 ) @ ( app @ zero @ M2 @ ( rev @ zero @ nil ) @ L2 ) )
      = ( rev @ M2 @ L2 ) ) ).

thf(list_rev_invol_lem_base_step2,axiom,
    ! [M2: nat,L2: list @ M2] :
      ( ( app @ M2 @ zero @ ( rev @ M2 @ L2 ) @ nil )
      = ( rev @ M2 @ L2 ) ) ).

thf(list_rev_invol_lem_base,conjecture,
    ! [M2: nat,L2: list @ M2] :
      ( ( rev @ ( plus @ zero @ M2 ) @ ( app @ zero @ M2 @ ( rev @ zero @ nil ) @ L2 ) )
      = ( app @ M2 @ zero @ ( rev @ M2 @ L2 ) @ nil ) ) ).

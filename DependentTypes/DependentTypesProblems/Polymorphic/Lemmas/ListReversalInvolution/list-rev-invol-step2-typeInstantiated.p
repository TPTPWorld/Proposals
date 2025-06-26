thf(nat_type,type,
    nat: $tType ).

thf(zero_type,type,
    zero: nat ).

thf(suc_type,type,
    suc: nat > nat ).

thf(plus_type,type,
    plus: nat > nat > nat ).

thf(list_type,type,
    list: $tType > nat > $tType ).

thf(nil_type,type,
    nil: 
      !>[A: $tType] : ( list @ A @ zero ) ).

thf(cons_type,type,
    cons: 
      !>[A: $tType,N: nat] : ( A > ( list @ A @ N ) > ( list @ A @ ( suc @ N ) ) ) ).

thf(app_type,type,
    app: 
      !>[A: $tType,N: nat,M: nat] : ( ( list @ A @ N ) > ( list @ A @ M ) > ( list @ A @ ( plus @ N @ M ) ) ) ).

thf(rev_type,type,
    rev: 
    !>[A: $tType,N: nat] : ( ( list @ A @ N ) > ( list @ A @ N ) ) ).

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

thf(plus_com,axiom,
    ! [N: nat,M: nat] :
      ( ( plus @ N @ M )
      = ( plus @ M @ N ) ) ).

thf(plus1r,axiom,
    ! [N: nat] :
      ( ( suc @ N )
      = ( plus @ N @ ( suc @ zero ) ) ) ).

thf(list_rev_invol_lem,axiom,
    ! [A: $tType,N: nat,L: list @ A @ N,M2: nat,L2: list @ A @ M2] :
      ( ( rev @ A @ ( plus @ N @ M2 ) @ ( app @ A @ N @ M2 @ ( rev @ A @ N @ L ) @ L2 ) )
      = ( app @ A @ M2 @ N @ ( rev @ A @ M2 @ L2 ) @ L ) ) ).

thf(list_rev_invol_step2,conjecture,
    ! [N: nat,L: list @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ N] :
      ( ( ( rev @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ N @ ( rev @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ N @ L ) )
        = ( rev @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ ( plus @ N @ zero ) @ ( app @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ N @ zero @ ( rev @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ N @ L ) @ (nil @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero))) ) ) )
     => ( ( rev @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ N @ ( rev @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ N @ L ) )
        = ( app @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ zero @ N @ ( rev @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ zero @ (nil @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)))) @ L ) ) ) ).

thf(nat_type,type,
    nat: $tType ).

thf(zero_type,type,
    zero: nat ).

thf(suc_type,type,
    suc: nat > nat ).

thf(plus_type,type,
    plus: nat > nat > nat ).

thf(list_type,type,
    list:
    $tType > nat > $tType).

thf(nil_type,type,
    nil:
    !>[A:$tType]: (list @ A @ zero) ).

thf(cons_type,type,
    cons: 
    !>[A:$tType, N:nat]: (A > (list @ A @ N) > (list @ A @ (suc @ N)))).

thf(app_type,type,
    app: 
    !>[A:$tType, N:nat, M:nat]: ((list @ A @ N) > (list @ A @ M) > (list @ A @ (plus @ N @ M)))).

thf(ax2,axiom,
    ! [N: nat,M: nat] :
      ( ( plus @ ( suc @ N ) @ M )
      = ( suc @ ( plus @ N @ M ) ) ) ).

thf(ax4,axiom,
    ! [A: $tType,N: nat,M: nat,X: A,Y: list @ A @ N,Z: list @ A @ M] :
      ( ( app @ A @ ( suc @ N ) @ M @ ( cons @ A @ N @ X @ Y ) @ Z )
      = ( cons @ A @ ( plus @ N @ M ) @ X @ ( app @ A @ N @ M @ Y @ Z ) ) ) ).

thf(plus_assoc,axiom,
    ! [M1: nat,M2: nat,M3: nat] :
      ( ( plus @ M1 @ ( plus @ M2 @ M3 ) )
      = ( plus @ ( plus @ M1 @ M2 ) @ M3 ) ) ).

thf(plus_s_a,axiom,
    ! [N: nat,M: nat,K: nat] :
      ( ( suc @ ( plus @ ( plus @ N @ M ) @ K ) )
      = ( plus @ ( suc @ N ) @ ( plus @ M @ K ) ) ) ).

thf(list_app_assoc_indstep2,conjecture,
    ! [M2: nat,L2: list @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ M2,M3: nat,L3: list @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ M3,M: nat,X: (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)),L: list @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ M] :
      ( ( ( app @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ ( suc @ M ) @ ( plus @ M2 @ M3 ) @ ( cons @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ M @ X @ L ) @ ( app @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ M2 @ M3 @ L2 @ L3 ) )
        = ( cons @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ ( plus @ ( plus @ M @ M2 ) @ M3 ) @ X @ ( app @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ ( plus @ M @ M2 ) @ M3 @ ( app @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ M @ M2 @ L @ L2 ) @ L3 ) ) )
     => ( ( app @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ ( suc @ M ) @ ( plus @ M2 @ M3 ) @ ( cons @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ M @ X @ L ) @ ( app @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ M2 @ M3 @ L2 @ L3 ) )
        = ( app @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ ( suc @ ( plus @ M @ M2 ) ) @ M3 @ ( cons @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ ( plus @ M @ M2 ) @ X @ ( app @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ M @ M2 @ L @ L2 ) ) @ L3 ) ) ) ).

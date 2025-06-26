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

thf(plus_assoc,axiom,
    ! [M1: nat,M2: nat,M3: nat] :
      ( ( plus @ M1 @ ( plus @ M2 @ M3 ) )
      = ( plus @ ( plus @ M1 @ M2 ) @ M3 ) ) ).

thf(list_app_assoc_indstep3,conjecture,
    ! [A: $tType,M2: nat,L2: list @ A @ M2,M3: nat,L3: list @ A @ M3,M: nat,X: A,L: list @ A @ M] :
      ( ( ( app @ A @ M @ ( plus @ M2 @ M3 ) @ L @ ( app @ A @ M2 @ M3 @ L2 @ L3 ) )
        = ( app @ A @ ( plus @ M @ M2 ) @ M3 @ ( app @ A @ M @ M2 @ L @ L2 ) @ L3 ) )
     => ( ( ( app @ A @ ( suc @ M ) @ ( plus @ M2 @ M3 ) @ ( cons @ A @ M @ X @ L ) @ ( app @ A @ M2 @ M3 @ L2 @ L3 ) )
          = ( cons @ A @ ( plus @ M @ ( plus @ M2 @ M3 ) ) @ X @ ( app @ A @ M @ ( plus @ M2 @ M3 ) @ L @ ( app @ A @ M2 @ M3 @ L2 @ L3 ) ) ) )
       => ( ( app @ A @ ( suc @ M ) @ ( plus @ M2 @ M3 ) @ ( cons @ A @ M @ X @ L ) @ ( app @ A @ M2 @ M3 @ L2 @ L3 ) )
          = ( cons @ A  @ ( plus @ ( plus @ M @ M2 ) @ M3 ) @ X @ ( app @ A @ ( plus @ M @ M2 ) @ M3 @ ( app @ A @ M @ M2 @ L @ L2 ) @ L3 ) ) ) ) ) ).


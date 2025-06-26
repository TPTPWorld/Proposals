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
    !>[A:$tType]: (list @ A @ zero) ).

thf(cons_type,type,
    cons: 
    !>[A:$tType, N:nat]: (A > (list @ A @ N) > (list @ A @ (suc @ N)))).

thf(app_type,type,
    app: 
    !>[A:$tType, N:nat, M:nat]: ((list @ A @ N) > (list @ A @ M) > (list @ A @ (plus @ N @ M)))).

thf(ax1,axiom,
    ! [N: nat] :
      ( ( plus @ zero @ N )
      = N ) ).

thf(ax3,axiom,
    ! [A:$tType, N:nat, X:list @ A @ N] :
      ( ( app @ A @ zero @ N @ (nil @ A) @ X )
      = X ) ).

thf(plus_assoc,axiom,
    ! [M1: nat,M2: nat,M3: nat] :
      ( ( plus @ M1 @ ( plus @ M2 @ M3 ) )
      = ( plus @ ( plus @ M1 @ M2 ) @ M3 ) ) ).

thf(list_app_assoc_base,conjecture,
    ! [M2: nat,L2: list @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ M2,M3: nat,L3: list @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ M3] :
      ( ( app @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ zero @ ( plus @ M2 @ M3 ) @ (nil @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero))) @ ( app @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ M2 @ M3 @ L2 @ L3 ) )
      = ( app @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ ( plus @ zero @ M2 ) @ M3 @ ( app @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ zero @ M2 @ (nil @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero))) @ L2 ) @ L3 ) ) ).


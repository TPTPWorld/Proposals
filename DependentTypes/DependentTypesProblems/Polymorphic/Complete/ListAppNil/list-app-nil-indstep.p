thf(nat_type,type,
    nat: $tType).

thf(zero_type,type,
    zero: nat).

thf(suc_type,type,
    suc: nat > nat).

thf(plus_type,type,
    plus: nat > nat > nat).

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
    ! [A:$tType, N:nat, M:nat, X:A, Y:list @ A @ N, Z:list @ A @ M] :
      ( ( app @ A @ ( suc @ N ) @ M @ ( cons @ A @ N @ X @ Y ) @ Z )
      = ( cons @ A @ ( plus @ N @ M ) @ X @ ( app @ A @ N @ M @ Y @ Z ) ) ) ).

thf(plus_zero_r,axiom,
    ! [M: nat] :
      ( ( plus @ M @ zero )
      = M ) ).

thf(list_app_nil_indstep,conjecture,
    ! [A:$tType, N: nat,X:A,L: list @ A @ N] :
      ( ( ( app @ A @ N @ zero @ L @ (nil @ A) )
        = L )
     => ( ( app @ A @ ( suc @ N ) @ zero @ ( cons @ A @ N @ X @ L ) @ (nil @ A) )
        = ( cons @ A @ N @ X @ L ) ) ) ).

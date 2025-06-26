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

thf(list_induct,axiom,
    ! [A: $tType,
       P: !>[N: nat] : ( ( list @ A @ N ) > $o )] :
      ( ( P @ zero @ ( nil @ A ) )
     => ( ! [M: nat,X: A,Y: list @ A @ M] :
            ( ( P @ M @ Y )
           => ( P @ ( suc @ M ) @ ( cons @ A @ M @ X @ Y ) ) )
       => ! [N: nat,X: list @ A @ N] : ( P @ N @ X ) ) ) ).

thf(ax1,axiom,
    ! [N: nat] :
      ( ( plus @ zero @ N )
      = N ) ).

thf(ax2,axiom,
    ! [N: nat,M: nat] :
      ( ( plus @ ( suc @ N ) @ M )
      = ( suc @ ( plus @ N @ M ) ) ) ).

thf(ax3,axiom,
    ! [A: $tType,N: nat,X: list @ A @ N] :
      ( ( app @ A @ zero @ N @ ( nil @ A ) @ X )
      = X ) ).

thf(ax4,axiom,
    ! [A: $tType,N: nat,M: nat,X: A,Y: list @ A @ N,Z: list @ A @ M] :
      ( ( app @ A @ ( suc @ N ) @ M @ ( cons @ A @ N @ X @ Y ) @ Z )
      = ( cons @ A @ ( plus @ N @ M ) @ X @ ( app @ A @ N @ M @ Y @ Z ) ) ) ).

thf(ax5,axiom,
    ! [A: $tType]: ( ( rev @ A @ zero @ (nil @ A) )
    = (nil @ A) ) ).

thf(ax6,axiom,
    ! [A: $tType,N: nat,X: A,Y: list @ A @ N] :
      ( ( rev @ A @ ( suc @ N ) @ ( cons @ A @ N @ X @ Y ) )
      = ( app @ A @ N @ ( suc @ zero ) @ ( rev @ A @ N @ Y ) @ ( cons @ A @ zero @ X @ (nil @ A) ) ) ) ).

thf(plus_com,axiom,
    ! [N: nat,M: nat] :
      ( ( plus @ N @ M )
      = ( plus @ M @ N ) ) ).

thf(plus1r,axiom,
    ! [N: nat] :
      ( ( suc @ N )
      = ( plus @ N @ ( suc @ zero ) ) ) ).

thf(list_app_nil,axiom,
    ! [A: $tType,N: nat,L: list @ A @ N] :
      ( ( app @ A @ N @ zero @ L @ (nil @ A) )
      = L ) ).

thf(list_rev_invol_lem,axiom,
    ! [A: $tType,N: nat,L: list @ A @ N,M2: nat,L2: list @ A @ M2] :
      ( ( rev @ A @ ( plus @ N @ M2 ) @ ( app @ A @ N @ M2 @ ( rev @ A @ N @ L ) @ L2 ) )
      = ( app @ A @ M2 @ N @ ( rev @ A @ M2 @ L2 ) @ L ) ) ).

thf(list_rev_invol,conjecture,
    ! [A: $tType,N: nat,L: list @ A @ N] :
      ( ( rev @ A @ N @ ( rev @ A @ N @ L ) )
      = L ) ).

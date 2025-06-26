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

thf(ax2,axiom,
    ! [N: nat,M: nat] :
      ( ( plus @ ( suc @ N ) @ M )
      = ( suc @ ( plus @ N @ M ) ) ) ).

thf(ax4,axiom,
    ! [N: nat,M: nat,X: elem,Y: list @ N,Z: list @ M] :
      ( ( app @ ( suc @ N ) @ M @ ( cons @ N @ X @ Y ) @ Z )
      = ( cons @ ( plus @ N @ M ) @ X @ ( app @ N @ M @ Y @ Z ) ) ) ).

thf(plus_assoc,axiom,
    ! [M1: nat,M2: nat,M3: nat] :
      ( ( plus @ M1 @ ( plus @ M2 @ M3 ) )
      = ( plus @ ( plus @ M1 @ M2 ) @ M3 ) ) ).

thf(plus_s_a,axiom,
    ! [N: nat,M: nat,K: nat] :
      ( ( suc @ ( plus @ ( plus @ N @ M ) @ K ) )
      = ( plus @ ( suc @ N ) @ ( plus @ M @ K ) ) ) ).

thf(list_app_assoc_indstep1,axiom,
    ! [M2: nat,L2: list @ M2,M3: nat,L3: list @ M3,M: nat,X: elem,L: list @ M] :
      ( ( ( app @ ( suc @ M ) @ ( plus @ M2 @ M3 ) @ ( cons @ M @ X @ L ) @ ( app @ M2 @ M3 @ L2 @ L3 ) )
        = ( app @ ( suc @ ( plus @ M @ M2 ) ) @ M3 @ ( cons @ ( plus @ M @ M2 ) @ X @ ( app @ M @ M2 @ L @ L2 ) ) @ L3 ) )
     => ( ( app @ ( suc @ M ) @ ( plus @ M2 @ M3 ) @ ( cons @ M @ X @ L ) @ ( app @ M2 @ M3 @ L2 @ L3 ) )
        = ( app @ ( plus @ ( suc @ M ) @ M2 ) @ M3 @ ( app @ ( suc @ M ) @ M2 @ ( cons @ M @ X @ L ) @ L2 ) @ L3 ) ) ) ).

thf(list_app_assoc_indstep2,axiom,
    ! [M2: nat,L2: list @ M2,M3: nat,L3: list @ M3,M: nat,X: elem,L: list @ M] :
      ( ( ( app @ ( suc @ M ) @ ( plus @ M2 @ M3 ) @ ( cons @ M @ X @ L ) @ ( app @ M2 @ M3 @ L2 @ L3 ) )
        = ( cons @ ( plus @ ( plus @ M @ M2 ) @ M3 ) @ X @ ( app @ ( plus @ M @ M2 ) @ M3 @ ( app @ M @ M2 @ L @ L2 ) @ L3 ) ) )
     => ( ( app @ ( suc @ M ) @ ( plus @ M2 @ M3 ) @ ( cons @ M @ X @ L ) @ ( app @ M2 @ M3 @ L2 @ L3 ) )
        = ( app @ ( suc @ ( plus @ M @ M2 ) ) @ M3 @ ( cons @ ( plus @ M @ M2 ) @ X @ ( app @ M @ M2 @ L @ L2 ) ) @ L3 ) ) ) ).

thf(list_app_assoc_indstep3,axiom,
    ! [M2: nat,L2: list @ M2,M3: nat,L3: list @ M3,M: nat,X: elem,L: list @ M] :
      ( ( ( app @ M @ ( plus @ M2 @ M3 ) @ L @ ( app @ M2 @ M3 @ L2 @ L3 ) )
        = ( app @ ( plus @ M @ M2 ) @ M3 @ ( app @ M @ M2 @ L @ L2 ) @ L3 ) )
     => ( ( ( app @ ( suc @ M ) @ ( plus @ M2 @ M3 ) @ ( cons @ M @ X @ L ) @ ( app @ M2 @ M3 @ L2 @ L3 ) )
          = ( cons @ ( plus @ M @ ( plus @ M2 @ M3 ) ) @ X @ ( app @ M @ ( plus @ M2 @ M3 ) @ L @ ( app @ M2 @ M3 @ L2 @ L3 ) ) ) )
       => ( ( app @ ( suc @ M ) @ ( plus @ M2 @ M3 ) @ ( cons @ M @ X @ L ) @ ( app @ M2 @ M3 @ L2 @ L3 ) )
          = ( cons @ ( plus @ ( plus @ M @ M2 ) @ M3 ) @ X @ ( app @ ( plus @ M @ M2 ) @ M3 @ ( app @ M @ M2 @ L @ L2 ) @ L3 ) ) ) ) ) ).

thf(list_app_assoc_indstep4,axiom,
    ! [M2: nat,L2: list @ M2,M3: nat,L3: list @ M3,M: nat,X: elem,L: list @ M] :
      ( ( app @ ( suc @ M ) @ ( plus @ M2 @ M3 ) @ ( cons @ M @ X @ L ) @ ( app @ M2 @ M3 @ L2 @ L3 ) )
      = ( cons @ ( plus @ M @ ( plus @ M2 @ M3 ) ) @ X @ ( app @ M @ ( plus @ M2 @ M3 ) @ L @ ( app @ M2 @ M3 @ L2 @ L3 ) ) ) ) ).

thf(list_app_assoc_indstep,conjecture,
    ! [M2: nat,L2: list @ M2,M3: nat,L3: list @ M3,M: nat,X: elem,L: list @ M] :
      ( ( ( app @ M @ ( plus @ M2 @ M3 ) @ L @ ( app @ M2 @ M3 @ L2 @ L3 ) )
        = ( app @ ( plus @ M @ M2 ) @ M3 @ ( app @ M @ M2 @ L @ L2 ) @ L3 ) )
     => ( ( app @ ( suc @ M ) @ ( plus @ M2 @ M3 ) @ ( cons @ M @ X @ L ) @ ( app @ M2 @ M3 @ L2 @ L3 ) )
        = ( app @ ( plus @ ( suc @ M ) @ M2 ) @ M3 @ ( app @ ( suc @ M ) @ M2 @ ( cons @ M @ X @ L ) @ L2 ) @ L3 ) ) ) ).


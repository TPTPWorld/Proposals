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

thf(plus_zero_r,axiom,
    ! [M: nat] :
      ( ( plus @ M @ zero )
      = M ) ).

thf(list_app_nil_indstep,conjecture,
    ! [N: nat,X: elem,L: list @ N] :
      ( ( ( app @ N @ zero @ L @ nil )
        = L )
     => ( ( app @ ( suc @ N ) @ zero @ ( cons @ N @ X @ L ) @ nil )
        = ( cons @ N @ X @ L ) ) ) ).

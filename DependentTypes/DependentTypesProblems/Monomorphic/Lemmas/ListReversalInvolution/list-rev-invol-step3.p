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

thf(ax5,axiom,
    ( ( rev @ zero @ nil )
    = nil ) ).

thf(plus_com,axiom,
    ! [N: nat,M: nat] :
      ( ( plus @ N @ M )
      = ( plus @ M @ N ) ) ).

thf(plus1r,axiom,
    ! [N: nat] :
      ( ( suc @ N )
      = ( plus @ N @ ( suc @ zero ) ) ) ).

thf(list_rev_invol_step3,conjecture,
    ! [N: nat,L: list @ N] :
      ( ( ( rev @ N @ ( rev @ N @ L ) )
        = ( app @ zero @ N @ ( rev @ zero @ nil ) @ L ) )
     => ( ( rev @ N @ ( rev @ N @ L ) )
        = ( app @ zero @ N @ nil @ L ) ) ) ).


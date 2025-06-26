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
      !>[N: nat] : ( nat > ( list @ N ) > ( list @ ( suc @ N ) ) ) ).

thf(app_type,type,
    app: 
      !>[N: nat,M: nat] : ( ( list @ N ) > ( list @ M ) > ( list @ ( plus @ N @ M ) ) ) ).

thf(ladd_type,type,
    ladd: 
      !>[N: nat] : ( ( list @ N ) > ( list @ N ) > ( list @ N ) ) ).

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

thf(ladd_nil,axiom,
    ( ( ladd @ zero @ nil @ nil )
    = nil ) ).

thf(ladd_cons,axiom,
    ! [N: nat,H1: nat,L1: list @ N,H2: nat,L2: list @ N] :
      ( ( ladd @ ( suc @ N ) @ ( cons @ N @ H1 @ L1 ) @ ( cons @ N @ H2 @ L2 ) )
      = ( cons @ N @ ( plus @ H1 @ H2 ) @ ( ladd @ N @ L1 @ L2 ) ) ) ).

thf(list_add_assoc,conjecture,
    ! [N: nat,L1: list @ N,L2: list @ N,L3: list @ N] :
      ( ( ladd @ N @ ( ladd @ N @ L1 @ L2 ) @ L3 )
      = ( ladd @ N @ L1 @ ( ladd @ N @ L2 @ L3 ) ) ) ).


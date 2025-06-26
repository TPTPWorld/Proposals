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

thf(m_tp,type,
    m: nat ).

thf(n_tp,type,
    n: nat ).

thf(l_tp,type,
    l: list @ m ).

thf(r_tp,type,
    r: list @ n ).

thf(test8,conjecture,
    ( ( rev @ ( plus @ m @ n ) @ ( app @ m @ n @ l @ r ) )
    = ( app @ n @ m @ ( rev @ n @ r ) @ ( rev @ m @ l ) ) ) ).

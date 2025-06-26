thf(a_type,type,
    a: $tType ).

thf(m_type,type,
    m: 
      !>[X: a] : $tType ).

thf(elem1_type,type,
    elem1: a ).

thf(fun1_type,type,
    fun1: ( m @ elem1 ) > $o ).

thf(fun2_type,type,
    fun2: ( m @ elem1 ) > $o ).

thf(nfun1ex,axiom,
    ? [X: m @ elem1] :
      ~ ( fun1 @ X ) ).

thf(fun2all,axiom,
    ! [X: m @ elem1] : ( fun2 @ X ) ).

thf(fun1andfun2ex,conjecture,
    ? [X: m @ elem1] :
      ( ~ ( fun1 @ X )
      & ( fun2 @ X ) ) ).

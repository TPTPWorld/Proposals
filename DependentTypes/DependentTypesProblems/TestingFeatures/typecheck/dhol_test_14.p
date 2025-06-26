thf(a_type,type,
    a: $tType ).

thf(m_type,type,
    m: 
      !>[X: a] : $tType ).

thf(n_type,type,
    n: 
      !>[X: a,Y: m @ X] : $tType ).

thf(elem1_type,type,
    elem1: a ).

thf(melem1_type,type,
    melem1: m @ elem1 ).

thf(nelem1_type,type,
    nelem1: n @ elem1 @ melem1 ).

thf(mfun_type,type,
    mfun: 
      !>[X: a] : ( m @ X ) ).

thf(fun1_type,type,
    fun1: 
      !>[X: a,Y: m @ X] : ( n @ X @ Y ) ).

thf(fun2_type,type,
    fun2: 
      !>[X: a] : ( n @ X @ ( mfun @ X ) ) ).

thf(ax1,axiom,
    ! [Y: m @ elem1] : ( melem1 = Y ) ).

thf(ax2,axiom,
    ( ( fun1 @ elem1 )
    = ( ^ [Y: m @ elem1] : nelem1 ) ) ).

thf(conj2,conjecture,
    ( ( fun1 @ elem1 @ melem1 )
    = nelem1 ) ).

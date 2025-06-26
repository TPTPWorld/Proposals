thf(a_type,type,
    a: $tType ).

thf(m_type,type,
    m: 
      !>[X: a] : $tType ).

thf(elem1_type,type,
    elem1: a ).

thf(elem2_type,type,
    elem2: a ).

thf(fun1_type,type,
    fun1: 
      !>[X: m @ elem1] : $o ).

thf(fun2_type,type,
    fun2: 
      !>[X: m @ elem2] : $o ).

thf(b_type,type,
    b: m @ elem1 ).

thf(c_type,type,
    c: m @ elem1 ).

thf(ax1,axiom,
    ! [X: a] : ( X = elem1 ) ).

thf(fun12,axiom,
    ! [X: a,Y: m @ X] :
      ( ( fun1 @ Y )
      = ( fun2 @ Y ) ) ).


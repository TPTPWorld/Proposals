thf(a_type,type,
    a: $tType ).

thf(f_type,type,
    f: !>[X: a] : $tType ).

thf(elem1_type,type,
    elem1: a ).

thf(elem2_type,type,
    elem2: a ).

thf(conj,conjecture,
    ( ( ^[G: f @ elem1] : G) = ( ^[H: f @ elem2] : H) ) ).

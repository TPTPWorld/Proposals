thf(a_type,type,
    a: $tType ).

thf(f_type,type,
    f: a > $tType ).

thf(pred_type,type,
    pred:
    !>[X: a] : ( (f @ X) > $o ) ).

thf(predEmpty,axiom,
    ? [X: a, F: f @ X] : (pred @ X @ F ) ).

thf(elem1_type,type,
    elem1: a ).

thf(conj,conjecture,
    ! [F: f @ elem1] : ( pred @ elem1 @ F ) ).

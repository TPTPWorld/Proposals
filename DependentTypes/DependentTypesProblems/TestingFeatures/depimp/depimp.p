thf(alpha_type,type,
    alpha: $tType ).

thf(a_type,type,
    a: alpha ).

thf(beta_type,type,
    beta: alpha > $tType ).

thf(b_type,type,
    b: beta @ a ).

thf(conj,conjecture,
    ( ! [X: alpha] : ( X = a )
   => ! [Y: alpha,Z: beta @ Y] : ( Z = b ) ) ).

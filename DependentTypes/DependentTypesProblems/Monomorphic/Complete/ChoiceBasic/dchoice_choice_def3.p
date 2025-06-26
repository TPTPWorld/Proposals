thf(a_type, type, (a : $tType)).
thf(b_type, type, (b : (a > $tType))).

thf(p_type, type, (p : (!> [A:a] : ((b @ A) > $o)))).

thf(pax, axiom, (! [A:a] : (? [B:(b @ A)] : ((p @ A @ B))))). 

thf(conj, conjecture, (! [A:a] : (p @ A @ (@+ [X: (b @ A)] : (p @ A @ X) )))).

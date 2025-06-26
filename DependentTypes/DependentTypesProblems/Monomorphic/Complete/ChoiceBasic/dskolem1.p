thf(a_type, type, a: $tType).
thf(b_type, type, b: a > $tType).
thf(p_type, type, p: (!> [X:a] : ((b @ X) > $o))).
thf(dskolem1, conjecture, ((! [X:a]: ? [Y:(b @ X)]: (p @ X @ Y)) => ?[F: (!>[N:a]: (b @ N))]: ![X:a]: (p @ X @ (F @ X)))).


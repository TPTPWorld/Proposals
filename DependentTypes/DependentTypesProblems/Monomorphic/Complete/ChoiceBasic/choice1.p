thf(nat_type, type, nat: $tType).
thf(fin_type, type, fin: nat > $tType).
thf(p_type,   type, p: !>[Y:nat]: ((fin @ Y) > $o)).
thf(ho_choice, conjecture, (![W:nat]: (?[Y:(fin @ W)]: ((p @ W) @ Y))) => (?[F: (!>[N:nat]: (fin @ N))]: ![Z:nat]: ((p @ Z) @ (F @ Z)))).


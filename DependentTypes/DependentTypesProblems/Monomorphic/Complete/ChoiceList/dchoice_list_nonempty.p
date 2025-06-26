thf(nat_type, type, nat: $tType).
thf(zero_type, type, zero: nat).
thf(suc_type, type, suc: nat > nat).
thf(list_type, type, list: nat > $tType).
thf(nil_type, type, nil: (list @ zero)).
thf(cons_type, type, cons: (!> [N:nat]: (nat > (list @ N) > (list @ (suc @ N))))).
thf(empty_type, type, empty: (!> [N:nat]: ((list @ N) > $o))).

thf(empty1, axiom, (empty @ zero @ nil)).
thf(empty2, axiom, ![L:nat,H:nat,T:(list @ L)]: (~(empty @ (suc @ L) @ (cons @ L @ H @ T)))).

thf(c, conjecture, (~ (empty @ (suc @ zero) @ (@+[X : (list @ (suc @ zero))] : (~ (empty @ (suc @ zero) @ X)))))).

thf(nat_type, type, nat: $tType).
thf(zero_type, type, zero: nat).
thf(suc_type, type, suc: nat > nat).
thf(list_type, type, list: nat > $tType).
thf(nil_type, type, nil: (list @ zero)).
thf(cons_type, type, cons: (!> [N:nat]: (nat > (list @ N) > (list @ (suc @ N))))).
thf(hd_type, type, hd: (!> [LENMINUSONE:nat]: ((list @ (suc @ LENMINUSONE)) > nat))).

thf(hd, axiom, ![LEN:nat,H:nat,L:(list @ LEN)]: ((hd @ LEN @ (cons @ LEN @ H @ L)) = H)).

thf(c, conjecture, (hd @ zero @ (@+[X : (list @ (suc @ zero))] : ((hd @ zero @ X) = zero))) = zero).


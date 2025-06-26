thf(nat_type,type, (nat : $tType)).
thf(zer_type,type, (zer : nat)).
thf(suc_type,type, (suc : (nat > nat))).
thf(fin_type,type, (fin : (nat > $tType))).
thf(zerf_type,type, (zerf : (!> [N:nat] : (fin @ (suc @ N))))).
thf(sucf_type,type, (sucf : (!> [N:nat] : ((fin @ N) > (fin @ (suc @ N)))))).

thf(zer_not_suc, axiom, (! [N:nat] : (zer != (suc @ N)))).

thf(p_type,type, (p : (!> [N:nat] : ((fin @ N) > $o)))).
thf(pax,axiom, (! [N:nat] : (p @ (suc @ N) @ (zerf @ N)))).

thf(dchoiceex2,conjecture, (! [N:nat] : (p @ (suc @ N) @ (@+ [X: (fin @ (suc @ N))] : (p @ (suc @ N) @ X))))).



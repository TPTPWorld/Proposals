thf(nat_type,type, (nat : $tType)).
thf(zer_type,type, (zer : nat)).
thf(suc_type,type, (suc : (nat > nat))).
thf(fin_type,type, (fin : (nat > $tType))).
thf(zerf_type,type, (zerf : (!> [N:nat] : (fin @ (suc @ N))))).
thf(sucf_type,type, (sucf : (!> [N:nat] : ((fin @ N) > (fin @ (suc @ N)))))).

thf(zerf_neq_sucf, axiom, (! [N:nat] : (! [X: (fin @ N)] : ((zerf @ N) != (sucf @ N @ X))))).

thf(dchoiceex5,conjecture, (((@+ [X: (fin @ (suc @ (suc @ zer)))] : (X != (zerf @ (suc @ zer)))) != (zerf @ (suc @ zer))) & ((@+ [X: (fin @ (suc @ (suc @ zer)))] : (X != (sucf @ (suc @ zer) @ (zerf @ zer)))) != (sucf @ (suc @ zer) @ (zerf @ zer))))).

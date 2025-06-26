thf(nat_type,type, (nat : $tType)).
thf(zer_type,type, (zer : nat)).
thf(suc_type,type, (suc : (nat > nat))).
thf(fin_type,type, (fin : (nat > $tType))).
thf(zerf_type,type, (zerf : (!> [N:nat] : (fin @ (suc @ N))))).
thf(sucf_type,type, (sucf : (!> [N:nat] : ((fin @ N) > (fin @ (suc @ N)))))).

thf(dchoiceex3,conjecture, ((@+ [X: (fin @ (suc @ zer))] : (X = (zerf @ zer))) = (zerf @ zer))).




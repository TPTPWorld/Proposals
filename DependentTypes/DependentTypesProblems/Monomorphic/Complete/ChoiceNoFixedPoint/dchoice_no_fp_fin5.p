thf(nat_type, type, nat: $tType).
thf(zero_type,type, zero: nat).
thf(suc_type, type, suc: nat > nat).

thf(fin_type, type, fin: nat > $tType).
thf(f1_type, type, f1: !>[A:nat]: (fin @ (suc @ A))).
thf(fs_type, type, fs: !>[A:nat]: ((fin @ A) > (fin @ (suc @ A)))).

thf(f1notfs, axiom, (! [N:nat] : (! [X:(fin @ N)] : ((f1 @ N) != (fs @ N @ X))))).
thf(fs_inj, axiom, (! [N:nat] : (! [X:(fin @ N)] : (! [Y:(fin @ N)] : (((fs @ N @ X) = (fs @ N @ Y)) => (X = Y)))))).
thf(finZ_inv, axiom, (! [X:(fin @ zero)] : $false)).
thf(finS_inv, axiom, (! [N:nat] : (! [X:(fin @ (suc @ N))] : ((X = (f1 @ N)) | (? [Y:(fin @ N)] : (X = (fs @ N @ Y))))))).

thf(nofp_type, type, (nofp : ((fin @ (suc @ (suc @ (suc @ (suc @ (suc @ zero)))))) > (fin @ (suc @ (suc @ (suc @ (suc @ (suc @ zero))))))))).
thf(nofp_def, definition, (nofp = (^ [X: (fin @ (suc @ (suc @ (suc @ (suc @ (suc @ zero))))))] : (@+ [Y: (fin @ (suc @ (suc @ (suc @ (suc @ (suc @ zero))))))] : (X != Y))))).

thf(dchoice_nofp_fin5, conjecture, (! [X:(fin @ (suc @ (suc @ (suc @ (suc @ (suc @ zero))))))] : ((nofp @ X) != X))).

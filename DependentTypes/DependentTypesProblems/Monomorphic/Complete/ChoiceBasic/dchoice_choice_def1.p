thf(nat_type, type, nat: $tType).
thf(zero_type,type, zero: nat).
thf(suc_type, type, suc: nat > nat).

thf(fin_type, type, fin: nat > $tType).
thf(f1_type, type, f1: !>[A:nat]: (fin @ (suc @ A))).
thf(fs_type, type, fs: !>[A:nat]: ((fin @ A) > (fin @ (suc @ A)))).

thf(fin_elim, axiom,
    ![P : (!>[N : nat]: ((fin @ (suc @ N)) > $o))]:
      (![N:nat]: (P @ N @ (f1 @ N))
    => (![N:nat]: ![F:(fin @ N)]: (P @ N @ (fs @ N @ F))
     => ![N:nat]: ![F:(fin @ (suc @ N))]: (P @ N @ F)))).

thf(p_type, type, (p : ((fin @ (suc @ (suc @ zero))) > $o))).
thf(pex, axiom, (? [X : (fin @ (suc @ (suc @ zero)))] : (p @ X))).
    
thf(pch, conjecture, (p @ (@+ [X: (fin @ (suc @ (suc @ zero)))] : (p @ X)))).


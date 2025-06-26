thf(nat_type, type, nat: $tType).
thf(zero_type,type, zero: nat).
thf(suc_type, type, suc: nat > nat).
thf(plus_type,type, plus: nat > nat > nat).

thf(plus_suc, axiom, (![X:nat,Y:nat]: ((plus @ (suc @ X) @ Y) = (suc @ (plus @ X @ Y))))).

thf(fin_type, type, fin: nat > $tType).
thf(f1_type, type, f1: !>[A:nat]: (fin @ (suc @ A))).
thf(fs_type, type, fs: !>[A:nat]: ((fin @ A) > (fin @ (suc @ A)))).

thf(fin_elim, axiom,
    ![P : (!>[N : nat]: ((fin @ (suc @ N)) > $o))]:
      (![N:nat]: (P @ N @ (f1 @ N))
    => (![N:nat]: ![F:(fin @ N)]: (P @ N @ (fs @ N @ F))
     => ![N:nat]: ![F:(fin @ (suc @ N))]: (P @ N @ F)))).

thf(swap_type, type, (swap : ((fin @ (suc @ (suc @ zero))) > (fin @ (suc @ (suc @ zero)))))).
thf(swap_def, definition, (swap = (^ [X: (fin @ (suc @ (suc @ zero)))] : (@+ [Y: (fin @ (suc @ (suc @ zero)))] : (X != Y))))).
    
thf(fin2swap1, conjecture, (! [X:(fin @ (suc @ (suc @ zero)))] : ((swap @ X) != X))).

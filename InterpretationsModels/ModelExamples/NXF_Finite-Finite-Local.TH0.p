%%% tff(simple_spec, logic, ($alethic_modal) == ([($constants) == ($rigid),($quantification) == ($constant),($modalities) == ($modal_system_M)])).

thf(fruit_type, type, fruit: $tType).
thf(mworld, type, mworld: $tType).
thf(mrel_type, type, mrel: (mworld > (mworld > $o))).
thf(mactual_type, type, mactual: mworld).
thf(mlocal_type, type, mlocal: ((mworld > $o) > $o)).
thf(mlocal_def, definition, (mlocal = (^ [Phi:(mworld > $o)]: ((Phi @ mactual))))).
thf(mglobal_type, type, mglobal: ((mworld > $o) > $o)).
thf(mglobal_def, definition, (mglobal = (^ [Phi:(mworld > $o)]: ((! [W:mworld]: ((Phi @ W))))))).
thf(mnot_type, type, mnot: ((mworld > $o) > (mworld > $o))).
thf(mand_type, type, mand: ((mworld > $o) > ((mworld > $o) > (mworld > $o)))).
thf(mor_type, type, mor: ((mworld > $o) > ((mworld > $o) > (mworld > $o)))).
thf(mimplies_type, type, mimplies: ((mworld > $o) > ((mworld > $o) > (mworld > $o)))).
thf(mequiv_type, type, mequiv: ((mworld > $o) > ((mworld > $o) > (mworld > $o)))).
thf(mnot_def, definition, (mnot = (^ [A:(mworld > $o),W:mworld]: ((~ ((A @ W))))))).
thf(mand_def, definition, (mand = (^ [A:(mworld > $o),B:(mworld > $o),W:mworld]: (((A @ W) & (B @ W)))))).
thf(mor_def, definition, (mor = (^ [A:(mworld > $o),B:(mworld > $o),W:mworld]: (((A @ W) | (B @ W)))))).
thf(mimplies_def, definition, (mimplies = (^ [A:(mworld > $o),B:(mworld > $o),W:mworld]: (((A @ W) => (B @ W)))))).
thf(mequiv_def, definition, (mequiv = (^ [A:(mworld > $o),B:(mworld > $o),W:mworld]: (((A @ W) <=> (B @ W)))))).
thf(mbox_type, type, mbox: ((mworld > $o) > (mworld > $o))).
thf(mbox_def, definition, (mbox = (^ [Phi:(mworld > $o),W:mworld]: ((! [V:mworld]: ((((mrel @ W) @ V) => (Phi @ V)))))))).
thf(mdia_type, type, mdia: ((mworld > $o) > (mworld > $o))).
thf(mdia_def, definition, (mdia = (^ [Phi:(mworld > $o),W:mworld]: ((? [V:mworld]: ((((mrel @ W) @ V) & (Phi @ V)))))))).
thf(mrel_reflexive, axiom, (! [W:mworld]: (((mrel @ W) @ W)))).
thf(mforall_fruit_type, type, mforall_fruit: ((fruit > (mworld > $o)) > (mworld > $o))).
thf(mforall_fruit_def, definition, (mforall_fruit = (^ [A:(fruit > (mworld > $o)),W:mworld]: ((! [X:fruit]: (((A @ X) @ W))))))).
thf(mexists_fruit_type, type, mexists_fruit: ((fruit > (mworld > $o)) > (mworld > $o))).
thf(mexists_fruit_def, definition, (mexists_fruit = (^ [A:(fruit > (mworld > $o)),W:mworld]: ((? [X:fruit]: (((A @ X) @ W))))))).
thf(apple_decl, type, apple: fruit).
thf(banana_decl, type, banana: fruit).
thf(healthy_decl, type, healthy: (fruit > (mworld > $o))).
thf(rotten_decl, type, rotten: (fruit > (mworld > $o))).
thf(apple_not_banana, axiom, (mglobal @ (^ [W:mworld]: ((apple != banana))))).
thf(necessary_healthy_fruit_everywhere, axiom, (mglobal @ (mforall_fruit @ (^ [F:fruit]: ((mbox @ (healthy @ F))))))).
thf(fruit_possibly_not_rotten, axiom, (mglobal @ (mforall_fruit @ (^ [F:fruit]: ((mdia @ (mnot @ (rotten @ F)))))))).
thf(rotten_banana_here, axiom, (mlocal @ (rotten @ banana))).
thf(not_true, conjecture, (mlocal @ (mbox @ ((mand @ (healthy @ apple)) @ (mnot @ (rotten @ banana)))))).
% SZS output end ListOfTH0 for NTF_Finite-Finite.p

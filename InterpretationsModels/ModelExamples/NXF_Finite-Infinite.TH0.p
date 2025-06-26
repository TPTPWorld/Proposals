%%% tff(simple_spec, logic, ($alethic_modal) == ([($constants) == ($rigid),($quantification) == ($constant),($modalities) == ($modal_system_S4)])).

thf(sequence_type, type, sequence: $tType).
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
thf(mrel_transitive, axiom, (! [W:mworld,V:mworld,U:mworld]: (((((mrel @ W) @ V) & ((mrel @ V) @ U)) => ((mrel @ W) @ U))))).
thf(mforall_sequence_type, type, mforall_sequence: ((sequence > (mworld > $o)) > (mworld > $o))).
thf(mforall_sequence_def, definition, (mforall_sequence = (^ [A:(sequence > (mworld > $o)),W:mworld]: ((! [X:sequence]: (((A @ X) @ W))))))).
thf(mexists_sequence_type, type, mexists_sequence: ((sequence > (mworld > $o)) > (mworld > $o))).
thf(mexists_sequence_def, definition, (mexists_sequence = (^ [A:(sequence > (mworld > $o)),W:mworld]: ((? [X:sequence]: (((A @ X) @ W))))))).
thf(null_decl, type, null: sequence).
thf(toss_decl, type, toss: (sequence > sequence)).
thf(all_heads_decl, type, all_heads: (sequence > (mworld > $o))).
thf(different_sequences, axiom, (mglobal @ (mforall_sequence @ (^ [S:sequence]: (((mand @ (^ [W:mworld]: (((toss @ S) != null)))) @ (^ [W:mworld]: (((toss @ S) != S))))))))).
thf(injection, axiom, (mglobal @ (mforall_sequence @ (^ [S1:sequence]: ((mforall_sequence @ (^ [S2:sequence]: (((mimplies @ (^ [W:mworld]: (((toss @ S1) = (toss @ S2))))) @ (^ [W:mworld]: ((S1 = S2)))))))))))).
thf(all_heads_possible, axiom, (mglobal @ (mforall_sequence @ (^ [S:sequence]: (((mimplies @ (all_heads @ S)) @ (mdia @ (all_heads @ (toss @ S))))))))).
thf(no_heads, axiom, (mglobal @ (all_heads @ null))).
thf(two_heads_necessary, conjecture, (mlocal @ (mbox @ (mexists_sequence @ (^ [S:sequence]: (((mand @ (all_heads @ S)) @ (all_heads @ (toss @ S))))))))).

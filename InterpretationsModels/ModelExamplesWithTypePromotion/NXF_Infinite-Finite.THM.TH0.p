%%% tff(simple_spec, logic, ($alethic_modal) == ([($constants) == ($rigid),($quantification) == ($constant),($modalities) == ($modal_system_S5)])).

thf(person_type, type, person: $tType).
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
thf(mrel_euclidean, axiom, (! [W:mworld,V:mworld,U:mworld]: (((((mrel @ W) @ U) & ((mrel @ W) @ V)) => ((mrel @ U) @ V))))).
thf(mforall_dint_type, type, mforall_dint: (($int > (mworld > $o)) > (mworld > $o))).
thf(mforall_dint_def, definition, (mforall_dint = (^ [A:($int > (mworld > $o)),W:mworld]: ((! [X:$int]: (((A @ X) @ W))))))).
thf(mexists_dint_type, type, mexists_dint: (($int > (mworld > $o)) > (mworld > $o))).
thf(mexists_dint_def, definition, (mexists_dint = (^ [A:($int > (mworld > $o)),W:mworld]: ((? [X:$int]: (((A @ X) @ W))))))).
thf(geoff_decl, type, geoff: person).
thf(alive_decl, type, alive: (person > ($int > (mworld > $o)))).
thf(age_decl, type, age: (person > ($int > $int))).
thf(before_geoff_born, axiom, (mglobal @ (mforall_dint @ (^ [Year:$int]: (((mimplies @ (^ [W:mworld]: ((($less @ Year) @ 1961)))) @ (mnot @ ((alive @ geoff) @ Year)))))))).
thf(geoff_born, axiom, (mglobal @ ((alive @ geoff) @ 1961))).
thf(geoff_alive_now, axiom, (mglobal @ ((alive @ geoff) @ 2022))).
thf(geoff_age, axiom, (mglobal @ (mforall_dint @ (^ [Year:$int]: (((mand @ ((mimplies @ ((alive @ geoff) @ Year)) @ (^ [W:mworld]: ((((age @ geoff) @ Year) = (($difference @ Year) @ 1961)))))) @ ((mimplies @ (mnot @ ((alive @ geoff) @ Year))) @ (^ [W:mworld]: ((((age @ geoff) @ Year) = -1)))))))))).
thf(necessarily_alive_between, axiom, (mglobal @ (mforall_dint @ (^ [StartYear:$int]: ((mforall_dint @ (^ [EndYear:$int]: (((mimplies @ ((mand @ (^ [W:mworld]: ((($less @ StartYear) @ EndYear)))) @ ((mand @ ((alive @ geoff) @ StartYear)) @ ((alive @ geoff) @ EndYear)))) @ (mbox @ (mforall_dint @ (^ [BetweenYear:$int]: (((mimplies @ ((mand @ (^ [W:mworld]: ((($greatereq @ BetweenYear) @ StartYear)))) @ (^ [W:mworld]: ((($lesseq @ BetweenYear) @ EndYear))))) @ ((alive @ geoff) @ BetweenYear))))))))))))))).
thf(necessarily_dead_after, axiom, (mglobal @ (mforall_dint @ (^ [DeathYear:$int]: (((mimplies @ ((mand @ ((alive @ geoff) @ DeathYear)) @ (mnot @ ((alive @ geoff) @ (($sum @ DeathYear) @ 1))))) @ (mbox @ (mforall_dint @ (^ [Year:$int]: (((mimplies @ (^ [W:mworld]: ((($greatereq @ Year) @ DeathYear)))) @ (mnot @ ((alive @ geoff) @ Year))))))))))))).
thf(might_live_another_year, axiom, (mglobal @ (mforall_dint @ (^ [Year:$int]: (((mimplies @ ((alive @ geoff) @ Year)) @ (mdia @ ((alive @ geoff) @ (($sum @ Year) @ 1))))))))).
%----Adding this should make the axioms contradictory
% tff(must_die,axiom,
%     {$necessary} @
%       ( ? [Year: $int] :
%           ( $greater(Year,1961)
%           & ~ alive(geoff,Year ) ) ).
%----This should be provable
thf(might_live_long, conjecture, (mlocal @ (mdia @ (mexists_dint @ (^ [Year:$int]: (((mand @ (^ [W:mworld]: ((((age @ geoff) @ Year) = 120)))) @ ((alive @ geoff) @ Year)))))))).

%%% Transformation parameters: FORCE_HIGHERORDER

% SZS output start ListOfTHF for NXF_Finite-Finite-Global.p
%Parameter '$terms' currently unsupported; this will probably coincide with global terms.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% User types %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
thf(person_decl, type, person: $tType).
thf(product_decl, type, product: $tType).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Meta-logical definitions of the embedding %%
thf(mworld_type, type, mworld: $tType).
thf(mrel_decl, type, mrel: (mworld > (mworld > $o))).
thf(mbox_decl, type, mbox: ((mworld > $o) > (mworld > $o))).
thf(mbox_def, definition, (mbox = (^ [Phi:(mworld > $o),W:mworld]: ((! [V:mworld]: ((((mrel @ W) @ V) => (Phi @ V)))))))).
thf(mdia_decl, type, mdia: ((mworld > $o) > (mworld > $o))).
thf(mdia_def, definition, (mdia = (^ [Phi:(mworld > $o),W:mworld]: ((? [V:mworld]: ((((mrel @ W) @ V) & (Phi @ V)))))))).
thf(mrel_reflexive, axiom, (! [W:mworld]: (((mrel @ W) @ W)))).
thf(mactual_decl, type, mactual: mworld).
thf(mlocal_decl, type, mlocal: ((mworld > $o) > $o)).
thf(mlocal_def, definition, (mlocal = (^ [Phi:(mworld > $o)]: ((Phi @ mactual))))).
thf(mglobal_decl, type, mglobal: ((mworld > $o) > $o)).
thf(mglobal_def, definition, (mglobal = (^ [Phi:(mworld > $o)]: ((! [W:mworld]: ((Phi @ W))))))).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Converted user type declarations %%%%%%%%%%%
thf(alex_decl, type, alex: person).
thf(chris_decl, type, chris: person).
thf(leo_decl, type, leo: product).
thf(work_hard_decl, type, work_hard: (mworld > (person > (product > $o)))).
thf(gets_rich_decl, type, gets_rich: (mworld > (person > $o))).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Converted problem %%%%%%%%%%%%%%%%%%%%%%%%%%
thf(work_hard_to_get_rich, axiom, (mglobal @ (^ [W:mworld]: ((! [P:person]: (((^ [W:mworld]: ((((^ [W:mworld]: ((? [R:product]: (((^ [W:mworld]: ((((^ [W:mworld]: (((work_hard @ W) @ ((^ [W:mworld]: (P)) @ W)))) @ W) @ ((^ [W:mworld]: (R)) @ W)))) @ W))))) @ W) => ((mdia @ (^ [W:mworld]: (((gets_rich @ W) @ ((^ [W:mworld]: (P)) @ W))))) @ W)))) @ W))))))).
%----Nobody necessarily gets rich.
thf(not_all_get_rich, axiom, (mglobal @ (^ [W:mworld]: ((~ (((^ [W:mworld]: ((? [P:person]: (((mbox @ (^ [W:mworld]: (((gets_rich @ W) @ ((^ [W:mworld]: (P)) @ W))))) @ W))))) @ W))))))).
%----Alex and Chris work hard on Leo-III.
thf(alex_works_on_leo, axiom, (mglobal @ (^ [W:mworld]: ((((^ [W:mworld]: (((work_hard @ W) @ ((^ [W:mworld]: (alex)) @ W)))) @ W) @ ((^ [W:mworld]: (leo)) @ W)))))).
thf(chris_works_on_leo, axiom, (mglobal @ (^ [W:mworld]: ((((^ [W:mworld]: (((work_hard @ W) @ ((^ [W:mworld]: (chris)) @ W)))) @ W) @ ((^ [W:mworld]: (leo)) @ W)))))).
%----Chris is not Alex
thf(chris_not_alex, axiom, (mglobal @ (^ [W:mworld]: ((((^ [W:mworld]: (chris)) @ W) != ((^ [W:mworld]: (alex)) @ W)))))).
%----It's possible that Alex gets rich but Chris does not.
thf(only_alex_gets_rich, conjecture, (mlocal @ (mdia @ (^ [W:mworld]: ((((^ [W:mworld]: (((gets_rich @ W) @ ((^ [W:mworld]: (alex)) @ W)))) @ W) & ((^ [W:mworld]: ((~ (((^ [W:mworld]: (((gets_rich @ W) @ ((^ [W:mworld]: (chris)) @ W)))) @ W))))) @ W))))))).
% SZS output end ListOfTHF for NXF_Finite-Finite-Global.p

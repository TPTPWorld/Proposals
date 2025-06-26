%------------------------------------------------------------------------------
fof(descendents_different,axiom,
    ! [A,D] : 
      ( is_descendant(A,D) => ( A != D ) ) ).

fof(descendent_transitive,axiom,
    ! [A,C,G] :
      ( ( is_descendant(A,C) & is_descendant(C,G) ) 
     => is_descendant(A,G) ) ).

fof(child_is_descendant,axiom,
    ! [P] : is_descendant(P,child_of(P)) ).

fof(all_have_child,axiom,
    ! [P] : ? [C] : C = child_of(P) ).
%------------------------------------------------------------------------------

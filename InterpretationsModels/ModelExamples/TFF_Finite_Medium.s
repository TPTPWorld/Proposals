%------------------------------------------------------------------------------
tff(human_type,type,      human: $tType ).
tff(cat_type,type,        cat: $tType ).
tff(jon_decl,type,        jon: human ).
tff(garfield_decl,type,   garfield: cat ).
tff(arlene_decl,type,     arlene: cat ).
tff(nermal_decl,type,     nermal: cat ).
tff(loves_decl,type,      loves: cat > cat ).
tff(owns_decl,type,       owns: ( human * cat ) > $o ).

tff(d_jon_decl,type,      d_jon: human ).
tff(d_garfield_decl,type, d_garfield: cat ).
tff(d_arlene_decl,type,   d_arlene: cat ).
tff(d_nermal_decl,type,   d_nermal: cat ).

tff(garfield_domain,interpretation-domain,
    ( ! [DH: human] : ( DH = d_jon )
    & ! [DC: cat]:
        ( DC = d_garfield | DC = d_arlene | DC = d_nermal )
    & $distinct(d_garfield,d_arlene,d_nermal) ) ).

tff(garfield_mapping,interpretation-mapping,
    ( ( jon = d_jon
      & garfield = d_garfield
      & arlene = d_arlene
      & nermal = d_nermal
      & loves(d_garfield) = d_garfield
      & loves(d_arlene) = d_garfield
      & loves(d_nermal) = d_garfield )
    & ( owns(d_jon,d_garfield)
      & ~ owns(d_jon,d_arlene)
      & ~ owns(d_jon,d_nermal) ) ) ). 
%------------------------------------------------------------------------------

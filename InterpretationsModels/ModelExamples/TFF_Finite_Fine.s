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

tff(garfield_domain_human,interpretation-domain(human,human),
    ! [DH: human] : ( DH = d_jon ) ).

tff(garfield_domain_cat,interpretation-domain(cat,cat),
    ( ! [DC: cat]:
        ( DC = d_garfield | DC = d_arlene | DC = d_nermal )
    & $distinct(d_garfield,d_arlene,d_nermal) ) ). 

tff(garfield_mapping_jon,interpretation-mapping(jon,human),
    jon = d_jon ).

tff(garfield_mapping_garfield,interpretation-mapping(garfied,cat),
    garfield = d_garfield ).

tff(garfield_mapping_arlene,interpretation-mapping(arlene,cat),
    arlene = d_arlene ).

tff(garfield_mapping_nermal,interpretation-mapping(nermal,cat),
    nermal = d_nermal ).

tff(garfield_mapping_loves,interpretation-mapping(loves,cat),
    ( loves(d_garfield) = d_garfield
    & loves(d_arlene) = d_garfield
    & loves(d_nermal) = d_garfield ) ). 

tff(garfield_mapping_owns,interpretation-mapping(owns,$o),
    ( owns(d_jon,d2cat(d_garfield))
    & ~ owns(d_jon,d_arlene)
    & ~ owns(d_jon,d_nermal) ) ).
%------------------------------------------------------------------------------

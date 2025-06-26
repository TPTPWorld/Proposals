%------------------------------------------------------------------------------
thf(beverage_decl,type,   beverage: $tType ).
thf(syrup_decl,type,      syrup: $tType ).
thf(coffee_type,type,     coffee: beverage ).
thf(mix_type,type,        mix: beverage > syrup > beverage ).
thf(heat_type,type,       heat: beverage > beverage ).
thf(heated_mix_type,type, heated_mix: beverage > syrup > beverage ).
thf(hot_type,type,        hot: beverage > $o ).

thf(d_coffee_type,type,   d_coffee: beverage ).
thf(d_date_type,type,     d_date: syrup ).

thf(hot_coffee_beverage,interpretation-domain(beverage,beverage),
    ( ! [DB: beverage] : ( DB = d_coffee ) ) ).

thf(hot_coffee_syrup,interpretation-domain(beverage,d_beverage),
    ( ! [DS: syrup] : ( DS = d_date ) ) ).

thf(hot_coffee,interpretation-mapping,
    ( ! [F: beverage > syrup > beverage,S: syrup] :
        ( ( F @ d_coffee @ S ) = d_coffee )
    & ( ( heat @ d_coffee ) = d_coffee )
    & ( hot @ d_coffee ) ) ).
%------------------------------------------------------------------------------

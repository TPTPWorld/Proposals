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

thf(hot_coffee,axiom,
    ( ( ! [DB: beverage] : ( DB = d_coffee )
      & ! [DS: syrup] : ( DS = d_date ) )
    & ( ( ( mix @ d_coffee @ d_date ) = d_coffee )
      & ( ( heat @ d_coffee ) = d_coffee )
      & ( ( heated_mix @ d_coffee @ d_date ) = d_coffee )
      & ( hot @ d_coffee ) ) ) ).

thf(verify,conjecture,
    ( ( heated_mix
      = ( ^ [B: beverage,S: syrup] : ( heat @ ( mix @ B @ S ) ) ) )
    & ! [B: beverage,S: syrup] : ( hot @ ( heated_mix @ B @ S ) )
    & ! [S: syrup] : ( ( heated_mix @ coffee @ S ) = coffee )
    & ~ ( ? [Mixture: syrup > beverage] :
          ~ ? [S: syrup] :
              ( ( ( Mixture @ S ) = coffee )
              & ( hot @ ( Mixture @ S ) ) ) ) ) ).
%------------------------------------------------------------------------------

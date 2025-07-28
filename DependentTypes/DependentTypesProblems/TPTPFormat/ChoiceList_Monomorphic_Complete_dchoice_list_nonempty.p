%------------------------------------------------------------------------------
% File     : TBA000^1 : TPTP v10.0.0. Released v10.0.0.
% Domain   : Data Structures
% Problem  : Non-empty list doesn't fulfill the empty predicate
% Version  : Especial.
% English  : The case of choosing a non-empty list to establish that it doesn't
%            fulfill the empty predicate.

% Refs     : [RRB23] Rothgang et al. (2023), Theorem Proving in Dependently
%          : [Rot25] Rothgang (2025), Email to Geoff Sutcliffe
% Source   : [Rot25]
% Names    : ChoiceList/dchoice_list_nonempty.p [Rot25]

% Status   : Theorem
% Rating   : ? v10.0.0
% Syntax   : Number of formulae    :   10 (   2 unt;   7 typ;   0 def)
%            Number of atoms       :    4 (   0 equ;   0 cnn)
%            Maximal formula atoms :    2 (   1 avg)
%            Number of connectives :   25 (   3   ~;   0   |;   0   &;  22   @)
%                                         (   0 <=>;   0  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    9 (   7 avg)
%            Number of types       :    2 (   1 usr)
%            Number of type decls  :    7 (   0 !>P;   2 !>D)
%            Number of type conns  :    5 (   5   >;   0   *;   0   +;   0  <<)
%            Number of symbols     :    6 (   6 usr;   2 con; 0-3 aty)
%            Number of variables   :    6 (   0   ^;   3   !;   0   ?;   6   :)
%                                         (   2  !>;   0  ?*;   0  @-;   1  @+)
% SPC      : DH0_THM_NEQ_NAR

% Comments :
%------------------------------------------------------------------------------
thf(nat_type,type,
    nat: $tType ).

thf(zero_type,type,
    zero: nat ).

thf(suc_type,type,
    suc: nat > nat ).

thf(list_type,type,
    list: nat > $tType ).

thf(nil_type,type,
    nil: list @ zero ).

thf(cons_type,type,
    cons: 
      !>[N: nat] : ( nat > ( list @ N ) > ( list @ ( suc @ N ) ) ) ).

thf(empty_type,type,
    empty: 
      !>[N: nat] : ( ( list @ N ) > $o ) ).

thf(empty1,axiom,
    empty @ zero @ nil ).

thf(empty2,axiom,
    ! [L: nat,H: nat,T: list @ L] :
      ~ ( empty @ ( suc @ L ) @ ( cons @ L @ H @ T ) ) ).

thf(c,conjecture,
    ~ ( empty @ ( suc @ zero )
      @ @+[X: list @ ( suc @ zero )] :
          ~ ( empty @ ( suc @ zero ) @ X ) ) ).

%------------------------------------------------------------------------------

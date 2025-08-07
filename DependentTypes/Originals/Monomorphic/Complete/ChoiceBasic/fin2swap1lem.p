%------------------------------------------------------------------------------
% File     : TBA000^1 : TPTP v10.0.0. Released v10.0.0.
% Domain   : TBA
% Problem  : TBA
% Version  : Especial.
% English  :

% Refs     : [RRB23] Rothgang et al. (2023), Theorem Proving in Dependently
% Source   : [TPTP]
% Names    :

% Status   : Theorem
% Rating   : ? v10.0.0
% Syntax   : Number of formulae    :   10 (   2 unt;   7 typ;   0 def)
%            Number of atoms       :    2 (   2 equ;   0 cnn)
%            Maximal formula atoms :    1 (   0 avg)
%            Number of connectives :   34 (   1   ~;   0   |;   0   &;  31   @)
%                                         (   0 <=>;   2  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    9 (   5 avg)
%            Number of types       :    2 (   1 usr)
%            Number of type decls  :    7 (   0 !>P;   3 !>D)
%            Number of type conns  :    6 (   6   >;   0   *;   0   +;   0  <<)
%            Number of symbols     :    7 (   6 usr;   1 con; 0-2 aty)
%            Number of variables   :   13 (   0   ^;   9   !;   1   ?;  13   :)
%                                         (   3  !>;   0  ?*;   0  @-;   0  @+)
% SPC      : TH0_THM_NEQ_ARI

% Comments :
%------------------------------------------------------------------------------
thf(nat_type, type, nat: $tType).
thf(zero_type,type, zero: nat).
thf(suc_type, type, suc: nat > nat).
thf(plus_type,type, plus: nat > nat > nat).

thf(plus_suc, axiom, (![X:nat,Y:nat]: ((plus @ (suc @ X) @ Y) = (suc @ (plus @ X @ Y))))).

thf(fin_type, type, fin: nat > $tType).
thf(f1_type, type, f1: !>[A:nat]: (fin @ (suc @ A))).
thf(fs_type, type, fs: !>[A:nat]: ((fin @ A) > (fin @ (suc @ A)))).

thf(fin_elim, axiom,
    ![P : (!>[N : nat]: ((fin @ (suc @ N)) > $o))]:
      (![N:nat]: (P @ N @ (f1 @ N))
    => (![N:nat]: ![F:(fin @ N)]: (P @ N @ (fs @ N @ F))
     => ![N:nat]: ![F:(fin @ (suc @ N))]: (P @ N @ F)))).

thf(fin2swap1lem, conjecture, (! [X:(fin @ (suc @ (suc @ zero)))] : (? [Y: (fin @ (suc @ (suc @ zero)))] : (X != Y)))).

%------------------------------------------------------------------------------

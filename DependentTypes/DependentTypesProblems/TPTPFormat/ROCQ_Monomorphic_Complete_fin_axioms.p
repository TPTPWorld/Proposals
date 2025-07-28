%------------------------------------------------------------------------------
% File     : TBA000^1 : TPTP v10.0.0. Released v10.0.0.
% Domain   : Interactive Theorem Proving
% Problem  : ROCQ axioms
% Version  : Especial.
% English  :

% Refs     : [RRB23] Rothgang et al. (2023), Theorem Proving in Dependently
%          : [Rot25] Rothgang (2025), Email to Geoff Sutcliffe
% Source   : [Rot25]
% Names    : ROCQ/fin_axioms.p [Rot25]

% Status   : Satisfiable
% Rating   : ? v10.0.0
% Syntax   : Number of formulae    :   11 (   2 unt;   7 typ;   0 def)
%            Number of atoms       :    2 (   2 equ;   0 cnn)
%            Maximal formula atoms :    1 (   0 avg)
%            Number of connectives :   51 (   0   ~;   0   |;   2   &;  46   @)
%                                         (   0 <=>;   3  =>;   0  <=;   0 <~>)
%            Maximal formula depth :   11 (   6 avg)
%            Number of types       :    2 (   1 usr)
%            Number of type decls  :    7 (   0 !>P;   4 !>D)
%            Number of type conns  :    7 (   7   >;   0   *;   0   +;   0  <<)
%            Number of symbols     :    7 (   6 usr;   1 con; 0-2 aty)
%            Number of variables   :   19 (   0   ^;  15   !;   0   ?;  19   :)
%                                         (   4  !>;   0  ?*;   0  @-;   0  @+)
% SPC      : DH0_SAT_EQU_NAR

% Comments :
%------------------------------------------------------------------------------
thf(nat_type,type,
    nat: $tType ).

thf(zero_type,type,
    zero: nat ).

thf(suc_type,type,
    suc: nat > nat ).

thf(plus_type,type,
    plus: nat > nat > nat ).

thf(plus_suc,axiom,
    ! [X: nat,Y: nat] :
      ( ( plus @ ( suc @ X ) @ Y )
      = ( suc @ ( plus @ X @ Y ) ) ) ).

thf(plus_zero,axiom,
    ! [X: nat] :
      ( ( plus @ X @ zero )
      = X ) ).

thf(fin_type,type,
    fin: nat > $tType ).

thf(f1_type,type,
    f1: 
      !>[A: nat] : ( fin @ ( suc @ A ) ) ).

thf(fs_type,type,
    fs: 
      !>[A: nat] : ( ( fin @ A ) > ( fin @ ( suc @ A ) ) ) ).

thf(fin_case,axiom,
    ! [P: !>[N: nat] : ( ( fin @ ( suc @ N ) ) > $o )] :
      ( ( ! [N: nat] : ( P @ N @ ( f1 @ N ) )
        & ! [N: nat,F: fin @ N] : ( P @ N @ ( fs @ N @ F ) ) )
     => ! [N: nat,F: fin @ ( suc @ N )] : ( P @ N @ F ) ) ).

thf(fin_rec,axiom,
    ! [P: !>[N: nat] : ( ( fin @ ( suc @ N ) ) > $o )] :
      ( ( ! [N: nat] : ( P @ N @ ( f1 @ N ) )
        & ! [N: nat,F: fin @ ( suc @ N )] :
            ( ( P @ N @ F )
           => ( P @ ( suc @ N ) @ ( fs @ ( suc @ N ) @ F ) ) ) )
     => ! [N: nat,F: fin @ ( suc @ N )] : ( P @ N @ F ) ) ).

%------------------------------------------------------------------------------

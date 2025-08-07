%------------------------------------------------------------------------------
% File     : ITP416^1 : TPTP v9.2.0. Released v9.2.0.
% Domain   : Interactive Theorem Proving
% Problem  : ROCQ axioms right
% Version  : Especial.
% English  :

% Refs     : [RRB23] Rothgang et al. (2023), Theorem Proving in Dependently
%          : [Rot25] Rothgang (2025), Email to Geoff Sutcliffe
% Source   : [Rot25]
% Names    : ROCQ/fin_r.p [Rot25]

% Status   : Theorem
% Rating   : ? v9.2.0
% Syntax   : Number of formulae    :   15 (   4 unt;   8 typ;   0 def)
%            Number of atoms       :    6 (   6 equ;   0 cnn)
%            Maximal formula atoms :    2 (   0 avg)
%            Number of connectives :   80 (   0   ~;   0   |;   2   &;  74   @)
%                                         (   0 <=>;   4  =>;   0  <=;   0 <~>)
%            Maximal formula depth :   11 (   5 avg)
%            Number of types       :    2 (   1 usr)
%            Number of type decls  :    8 (   0 !>P;   5 !>D)
%            Number of type conns  :    8 (   8   >;   0   *;   0   +;   0  <<)
%            Number of symbols     :    8 (   7 usr;   1 con; 0-3 aty)
%            Number of variables   :   30 (   0   ^;  24   !;   0   ?;  30   :)
%                                         (   6  !>;   0  ?*;   0  @-;   0  @+)
% SPC      : DH0_THM_EQU_NAR

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

thf(r_type,type,
    r: 
      !>[A: nat,B: nat] : ( ( fin @ A ) > ( fin @ ( plus @ A @ B ) ) ) ).

thf(r_0,axiom,
    ! [M: nat,F: fin @ M] :
      ( ( r @ M @ zero @ F )
      = F ) ).

thf(r_s,axiom,
    ! [M: nat,N: nat,F: fin @ M] :
      ( ( r @ M @ ( suc @ N ) @ F )
      = ( fs @ ( plus @ M @ N ) @ ( r @ M @ N @ F ) ) ) ).

thf(r_inj,conjecture,
    ! [M: nat,N: nat,P: fin @ M,Q: fin @ M] :
      ( ( ( r @ M @ N @ P )
        = ( r @ M @ N @ Q ) )
     => ( P = Q ) ) ).

%------------------------------------------------------------------------------

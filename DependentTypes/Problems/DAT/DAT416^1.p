%------------------------------------------------------------------------------
% File     : DAT416^1 : TPTP v9.2.0. Released v9.2.0.
% Domain   : Data Structures
% Problem  : Commutativity of list addition
% Version  : Especial.
% English  :

% Refs     : [RRB23] Rothgang et al. (2023), Theorem Proving in Dependently
%          : [Rot25] Rothgang (2025), Email to Geoff Sutcliffe
% Source   : [Rot25]
% Names    : Matrices/list-add-com.p [Rot25]

% Status   : Theorem
% Rating   : ? v9.2.0
% Syntax   : Number of formulae    :   15 (   4 unt;   9 typ;   0 def)
%            Number of atoms       :    6 (   6 equ;   0 cnn)
%            Maximal formula atoms :    2 (   1 avg)
%            Number of connectives :   58 (   3   ~;   0   |;   0   &;  51   @)
%                                         (   0 <=>;   4  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    8 (   5 avg)
%            Number of types       :    2 (   1 usr)
%            Number of type decls  :    9 (   0 !>P;   3 !>D)
%            Number of type conns  :   11 (  11   >;   0   *;   0   +;   0  <<)
%            Number of symbols     :    9 (   8 usr;   2 con; 0-4 aty)
%            Number of variables   :   18 (   0   ^;  14   !;   0   ?;  18   :)
%                                         (   4  !>;   0  ?*;   0  @-;   0  @+)
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

thf(list_type,type,
    list: nat > $tType ).

thf(nil_type,type,
    nil: list @ zero ).

thf(cons_type,type,
    cons: 
      !>[N: nat] : ( nat > ( list @ N ) > ( list @ ( suc @ N ) ) ) ).

thf(app_type,type,
    app: 
      !>[N: nat,M: nat] : ( ( list @ N ) > ( list @ M ) > ( list @ ( plus @ N @ M ) ) ) ).

thf(ladd_type,type,
    ladd: 
      !>[N: nat] : ( ( list @ N ) > ( list @ N ) > ( list @ N ) ) ).

thf(peano1,axiom,
    ! [N: nat] :
      ( ( suc @ N )
     != zero ) ).

thf(peano2,axiom,
    ! [N: nat,M: nat] :
      ( ( N != M )
     => ( ( suc @ N )
       != ( suc @ M ) ) ) ).

thf(peano3,axiom,
    ! [P: nat > $o] :
      ( ( P @ zero )
     => ( ! [M: nat] :
            ( ( P @ M )
           => ( P @ ( suc @ M ) ) )
       => ! [N: nat] : ( P @ N ) ) ) ).

thf(ladd_nil,axiom,
    ( ( ladd @ zero @ nil @ nil )
    = nil ) ).

thf(ladd_cons,axiom,
    ! [N: nat,H1: nat,L1: list @ N,H2: nat,L2: list @ N] :
      ( ( ladd @ ( suc @ N ) @ ( cons @ N @ H1 @ L1 ) @ ( cons @ N @ H2 @ L2 ) )
      = ( cons @ N @ ( plus @ H1 @ H2 ) @ ( ladd @ N @ L1 @ L2 ) ) ) ).

thf(list_add_com,conjecture,
    ! [N: nat,L1: list @ N,L2: list @ N] :
      ( ( ladd @ N @ L1 @ L2 )
      = ( ladd @ N @ L2 @ L1 ) ) ).

%------------------------------------------------------------------------------

%------------------------------------------------------------------------------
% File     : DAT379^1 : TPTP v9.2.0. Released v9.2.0.
% Domain   : Data Structures
% Problem  : Associativity of list append polymorphic, instantiation case
% Version  : Especial.
% English  : Associativity of append for polymorphic fixed-length lists. The
%            proof is by induction with a separate problem file for the base
%            and step case (with multiple subcases) as well as the correct
%            instantiation of the induction axiom for lists. The main file uses
%            the conjectures of the other files as lemmas in order to prove the
%            final result. To simplify proof search, the axioms in each problem
%            file have been preselected.

% Refs     : [RRB23] Rothgang et al. (2023), Theorem Proving in Dependently
%          : [Rot25] Rothgang (2025), Email to Geoff Sutcliffe
% Source   : [Rot25]
% Names    : ListAppAssoc/list-app-assoc-indinst.p [Rot25]

% Status   : Theorem
% Rating   : ? v9.2.0
% Syntax   : Number of formulae    :   14 (   3 unt;   8 typ;   0 def)
%            Number of atoms       :    9 (   9 equ;   0 cnn)
%            Maximal formula atoms :    4 (   1 avg)
%            Number of connectives :  179 (   2   ~;   0   |;   0   &; 170   @)
%                                         (   0 <=>;   7  =>;   0  <=;   0 <~>)
%            Maximal formula depth :   14 (   7 avg)
%            Number of types       :    2 (   1 usr)
%            Number of type decls  :    8 (   3 !>P;   3 !>D)
%            Number of type conns  :   10 (  10   >;   0   *;   0   +;   0  <<)
%            Number of symbols     :    8 (   7 usr;   1 con; 0-5 aty)
%            Number of variables   :   32 (   0   ^;  25   !;   0   ?;  32   :)
%                                         (   7  !>;   0  ?*;   0  @-;   0  @+)
% SPC      : DH1_THM_EQU_NAR

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
    list: $tType > nat > $tType ).

thf(nil_type,type,
    nil: 
      !>[A: $tType] : ( list @ A @ zero ) ).

thf(cons_type,type,
    cons: 
      !>[A: $tType,N: nat] : ( A > ( list @ A @ N ) > ( list @ A @ ( suc @ N ) ) ) ).

thf(app_type,type,
    app: 
      !>[A: $tType,N: nat,M: nat] : ( ( list @ A @ N ) > ( list @ A @ M ) > ( list @ A @ ( plus @ N @ M ) ) ) ).

thf(peano2,axiom,
    ! [N: nat,M: nat] :
      ( ( N != M )
     => ( ( suc @ N )
       != ( suc @ M ) ) ) ).

thf(list_induct,axiom,
    ! [A: $tType,
       P: !>[N: nat] : ( ( list @ A @ N ) > $o )] :
      ( ( P @ zero @ ( nil @ A ) )
     => ( ! [M: nat,X: A,Y: list @ A @ M] :
            ( ( P @ M @ Y )
           => ( P @ ( suc @ M ) @ ( cons @ A @ M @ X @ Y ) ) )
       => ! [N: nat,X: list @ A @ N] : ( P @ N @ X ) ) ) ).

thf(ax1,axiom,
    ! [N: nat] :
      ( ( plus @ zero @ N )
      = N ) ).

thf(ax2,axiom,
    ! [N: nat,M: nat] :
      ( ( plus @ ( suc @ N ) @ M )
      = ( suc @ ( plus @ N @ M ) ) ) ).

thf(plus_assoc,axiom,
    ! [M1: nat,M2: nat,M3: nat] :
      ( ( plus @ M1 @ ( plus @ M2 @ M3 ) )
      = ( plus @ ( plus @ M1 @ M2 ) @ M3 ) ) ).

thf(list_app_assoc_indinst,conjecture,
    ! [A: $tType,M2: nat,L2: list @ A @ M2,M3: nat,L3: list @ A @ M3] :
      ( ( ( app @ A @ zero @ ( plus @ M2 @ M3 ) @ ( nil @ A ) @ ( app @ A @ M2 @ M3 @ L2 @ L3 ) )
        = ( app @ A @ ( plus @ zero @ M2 ) @ M3 @ ( app @ A @ zero @ M2 @ ( nil @ A ) @ L2 ) @ L3 ) )
     => ( ! [M: nat,X: A,L: list @ A @ M] :
            ( ( ( app @ A @ M @ ( plus @ M2 @ M3 ) @ L @ ( app @ A @ M2 @ M3 @ L2 @ L3 ) )
              = ( app @ A @ ( plus @ M @ M2 ) @ M3 @ ( app @ A @ M @ M2 @ L @ L2 ) @ L3 ) )
           => ( ( app @ A @ ( suc @ M ) @ ( plus @ M2 @ M3 ) @ ( cons @ A @ M @ X @ L ) @ ( app @ A @ M2 @ M3 @ L2 @ L3 ) )
              = ( app @ A @ ( plus @ ( suc @ M ) @ M2 ) @ M3 @ ( app @ A @ ( suc @ M ) @ M2 @ ( cons @ A @ M @ X @ L ) @ L2 ) @ L3 ) ) )
       => ! [M: nat,L: list @ A @ M] :
            ( ( app @ A @ M @ ( plus @ M2 @ M3 ) @ L @ ( app @ A @ M2 @ M3 @ L2 @ L3 ) )
            = ( app @ A @ ( plus @ M @ M2 ) @ M3 @ ( app @ A @ M @ M2 @ L @ L2 ) @ L3 ) ) ) ) ).

%------------------------------------------------------------------------------

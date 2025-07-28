%------------------------------------------------------------------------------
% File     : TBA000^1 : TPTP v10.0.0. Released v10.0.0.
% Domain   : Data Structures
% Problem  : Associativity of list append
% Version  : Especial.
% English  : Associativity of list append. The proof is by induction with a 
%            problem file for the base and step case (with multiple subcases)
%            as well as the correct instantiation of the induction axiom for
%            lists. The main file uses the conjectures of the other files as
%            lemmas in order to prove the final result. To simplify proof
%            search, the axioms in each problem file have been preselected.

% Refs     : [RRB23] Rothgang et al. (2023), Theorem Proving in Dependently
%          : [Rot25] Rothgang (2025), Email to Geoff Sutcliffe
% Source   : [Rot25]
% Names    : ListAppAssoc/list-app-assoc.p [Rot25]

% Status   : Theorem
% Rating   : ? v10.0.0
% Syntax   : Number of formulae    :   16 (   5 unt;   9 typ;   0 def)
%            Number of atoms       :   11 (  11 equ;   0 cnn)
%            Maximal formula atoms :    4 (   1 avg)
%            Number of connectives :  219 (   0   ~;   0   |;   0   &; 215   @)
%                                         (   0 <=>;   4  =>;   0  <=;   0 <~>)
%            Maximal formula depth :   11 (   6 avg)
%            Number of types       :    2 (   2 usr)
%            Number of type decls  :    9 (   0 !>P;   2 !>D)
%            Number of type conns  :    8 (   8   >;   0   *;   0   +;   0  <<)
%            Number of symbols     :    8 (   7 usr;   2 con; 0-4 aty)
%            Number of variables   :   35 (   0   ^;  32   !;   0   ?;  35   :)
%                                         (   3  !>;   0  ?*;   0  @-;   0  @+)
% SPC      : DH0_THM_EQU_NAR

% Comments :
%------------------------------------------------------------------------------
thf(elem_type,type,
    elem: $tType ).

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
      !>[N: nat] : ( elem > ( list @ N ) > ( list @ ( suc @ N ) ) ) ).

thf(app_type,type,
    app: 
      !>[N: nat,M: nat] : ( ( list @ N ) > ( list @ M ) > ( list @ ( plus @ N @ M ) ) ) ).

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

thf(list_app_assoc_indinst,axiom,
    ! [M2: nat,L2: list @ M2,M3: nat,L3: list @ M3] :
      ( ( ( app @ zero @ ( plus @ M2 @ M3 ) @ nil @ ( app @ M2 @ M3 @ L2 @ L3 ) )
        = ( app @ ( plus @ zero @ M2 ) @ M3 @ ( app @ zero @ M2 @ nil @ L2 ) @ L3 ) )
     => ( ! [M: nat,X: elem,L: list @ M] :
            ( ( ( app @ M @ ( plus @ M2 @ M3 ) @ L @ ( app @ M2 @ M3 @ L2 @ L3 ) )
              = ( app @ ( plus @ M @ M2 ) @ M3 @ ( app @ M @ M2 @ L @ L2 ) @ L3 ) )
           => ( ( app @ ( suc @ M ) @ ( plus @ M2 @ M3 ) @ ( cons @ M @ X @ L ) @ ( app @ M2 @ M3 @ L2 @ L3 ) )
              = ( app @ ( plus @ ( suc @ M ) @ M2 ) @ M3 @ ( app @ ( suc @ M ) @ M2 @ ( cons @ M @ X @ L ) @ L2 ) @ L3 ) ) )
       => ! [M: nat,L: list @ M] :
            ( ( app @ M @ ( plus @ M2 @ M3 ) @ L @ ( app @ M2 @ M3 @ L2 @ L3 ) )
            = ( app @ ( plus @ M @ M2 ) @ M3 @ ( app @ M @ M2 @ L @ L2 ) @ L3 ) ) ) ) ).

thf(list_app_assoc_base,axiom,
    ! [M2: nat,L2: list @ M2,M3: nat,L3: list @ M3] :
      ( ( app @ zero @ ( plus @ M2 @ M3 ) @ nil @ ( app @ M2 @ M3 @ L2 @ L3 ) )
      = ( app @ ( plus @ zero @ M2 ) @ M3 @ ( app @ zero @ M2 @ nil @ L2 ) @ L3 ) ) ).

thf(list_app_assoc_indstep,axiom,
    ! [M2: nat,L2: list @ M2,M3: nat,L3: list @ M3,M: nat,X: elem,L: list @ M] :
      ( ( ( app @ M @ ( plus @ M2 @ M3 ) @ L @ ( app @ M2 @ M3 @ L2 @ L3 ) )
        = ( app @ ( plus @ M @ M2 ) @ M3 @ ( app @ M @ M2 @ L @ L2 ) @ L3 ) )
     => ( ( app @ ( suc @ M ) @ ( plus @ M2 @ M3 ) @ ( cons @ M @ X @ L ) @ ( app @ M2 @ M3 @ L2 @ L3 ) )
        = ( app @ ( plus @ ( suc @ M ) @ M2 ) @ M3 @ ( app @ ( suc @ M ) @ M2 @ ( cons @ M @ X @ L ) @ L2 ) @ L3 ) ) ) ).

thf(list_app_assoc,conjecture,
    ! [M: nat,L: list @ M,M2: nat,L2: list @ M2,M3: nat,L3: list @ M3] :
      ( ( app @ M @ ( plus @ M2 @ M3 ) @ L @ ( app @ M2 @ M3 @ L2 @ L3 ) )
      = ( app @ ( plus @ M @ M2 ) @ M3 @ ( app @ M @ M2 @ L @ L2 ) @ L3 ) ) ).

%------------------------------------------------------------------------------

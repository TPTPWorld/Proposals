Using the following lemma,

thf(list_rev_invol_lem,axiom,
    ! [N: nat,L: list @ N,M2: nat,L2: list @ M2] :
      ( ( rev @ ( plus @ N @ M2 ) @ ( app @ N @ M2 @ ( rev @ N @ L ) @ L2 ) )
      = ( app @ M2 @ N @ ( rev @ M2 @ L2 ) @ L ) ) ).

the problems list-rev-invol-step[1-5].p as a whole prove that the reversal
function on lists is an involution  The proof is split into smaller steps.
To simplify proof search, the axioms in each problem file have been preselected.
The file list-rev-invol.p contains a direct description of the problem and
includes all used axioms.

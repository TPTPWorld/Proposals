This collection of problems proves the following lemma:

thf(list_rev_invol_lem,axiom,
    ! [N: nat,L: list @ N,M2: nat,L2: list @ M2] :
      ( ( rev @ ( plus @ N @ M2 ) @ ( app @ N @ M2 @ ( rev @ N @ L ) @ L2 ) )
      = ( app @ M2 @ N @ ( rev @ M2 @ L2 ) @ L ) ) ).

The proof is by induction with a separate problem file for
the base and step case (with multiple subcases) as well as the
correct instantiation of the induction axiom for lists. The main
file list-rev-invol-lem.p uses the conjectures of the other files as
lemmas in order to prove the final result. To simplify proof search,
the axioms in each problem file have been preselected. For the actual
induction proof, it is sufficient to consider the "step" problem files.
The files list-rev-invol-lem-base.p and list-rev-invol-lem-indstep.p
describe the whole base case and induction step, respectively.
Furthermore, these files contain all used axioms.

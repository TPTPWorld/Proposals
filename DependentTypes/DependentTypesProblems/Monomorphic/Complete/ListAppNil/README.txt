This collection of problems proves

! [N: nat,L: list @ N] : ( ( app @ N @ zero @ L @ nil ) = L ),

i.e., nil is a right-neutral element of app.
The proof is by induction with a separate problem file for
the base and step case as well as the correct instantiation of
the induction axiom for lists. The main file list-app-nil.p
uses the conjectures of the other files as lemmas in order
to prove the final result. To simplify proof search, the
lemmas in the problem file for the induction step have been
preselected.

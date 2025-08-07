The files [matrix,list]-add-[com,assoc].p are easy problems about the commutativity and associativity
of pointwise addition of lists and matrices (which are lists of lists). The typechecks are trivial
as nothing is changed in these operations, but the proofs require induction.

I also tried to create a problem which describes associativity of matrix multiplication. Here, the
type check is more interesting but the implementation as lists of lists makes the problem very big
as you have to put a lot of "programmig effort" into it. That's why I opted for a formulation of
matrices as functions on bounded integers. However, for a succinct formulation as in the example,
this requires support for predicate subtypes. I think it would be nice to test any future extension
to predicate subtypes on this example which of course does not parse yet. I used the notation A |? p
as suggested in the original RRB paper.
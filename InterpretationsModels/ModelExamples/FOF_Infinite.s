%------------------------------------------------------------------------------
fof(people,interpretation,
%----Domain is the Peano numbers
    ( ( ! [I] : ( I = zero | ? [P] : I = s(P) )
%----Relationships between Peano numbers
      & ! [I1: peano,I2: peano,I3: peano] :
          ( peano_less(I1,s(I1))
          & ( ( peano_less(I1,I2) & peano_less(I2,I3) )
           => peano_less(I1,I3) )
          & ( peano_less(I1,I2)
           => I1 != I2 ) ) )
%----Mapping people to Peano numbers
    & ( bob = zero
      & ! [I] :
          child_of(I) = s(I) )
%----Interpretation of descendancy
    & ( ! [A,D] :
          ( is_descendant(A,D)
        <=> peano_less(A,D) ) ) ) ).
%------------------------------------------------------------------------------

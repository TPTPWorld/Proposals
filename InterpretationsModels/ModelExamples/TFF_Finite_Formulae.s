%------ Positive definition of equality_sorted
fof(lit_def,axiom,
    (! [X0_12,X0_13,X1_13] :
      ( equality_sorted(X0_12,X0_13,X1_13) <=>
           (
              (
                ( X0_12=$o & X1_1=X0_1 )
              )
%
             |
              (
                ( X0_12=human )
              )
%
             |
              (
                ( X0_12=human & X1_13=jon )
              )
%
             |
              (
                ( X0_12=human & X1_13=X0_13 )
              )
%
             |
              (
                ( X0_12=cat )
               &
                ( X0_14!=nermal )
               &
                ( X0_14!=nermal | X1_14!=arlene )
               &
                ( X0_14!=arlene | X1_14!=nermal )
               &
                ( X0_14!=arlene | X1_14!=garfield )
               &
                ( X0_14!=arlene | X1_14!=sK0 )
               &
                ( X0_14!=garfield )
               &
                ( X0_14!=garfield | X1_14!=nermal )
               &
                ( X0_14!=garfield | X1_14!=arlene )
               &
                ( X0_14!=sK0 )
               &
                ( X0_14!=sK0 | X1_14!=arlene )
               &
                ( X1_14!=nermal )
               &
                ( X1_14!=garfield )
               &
                ( X1_14!=sK0 )
              )
%
             |
              (
                ( X0_12=cat & X0_14=nermal & X1_14=nermal )
              )
%
             |
              (
                ( X0_12=cat & X0_14=nermal & X1_14=sK0 )
              )
%
             |
              (
                ( X0_12=cat & X0_14=garfield & X1_14=garfield )
              )
%
             |
              (
                ( X0_12=cat & X0_14=sK0 & X1_14=nermal )
              )
%
             |
              (
                ( X0_12=cat & X0_14=sK0 & X1_14=sK0 )
              )
%
             |
              (
                ( X0_12=cat & X1_14=X0_14 )
               &
                ( X0_14!=nermal )
               &
                ( X0_14!=garfield )
               &
                ( X0_14!=sK0 )
              )
%
             |
              (
                ( X0_12=cat & X1_14=arlene )
               &
                ( X0_14!=nermal )
               &
                ( X0_14!=garfield )
               &
                ( X0_14!=sK0 )
              )
%
           )
      )
    )
   ).
%
%------ Positive definition of owns
fof(lit_def,axiom,
    (! [X0_13,X0_14] :
      ( owns(X0_13,X0_14) <=>
           (
              (
                ( X0_13=jon & X0_14=garfield )
              )
%
             |
              (
                ( X0_14=garfield )
              )
%
           )
      )
    )
   ).

%------------------------------------------------------------------------------
tff(simple_spec,logic,
    $alethic_modal == [
      $constants == $flexible,
      $quantification == $varying,
      $modalities == $modal_system_M ] ).

%----Declarations to fool Vampire when processing this file directly
% tff('$world_type',type,$world: $tType).
% tff('$local_world_decl',type,$local_world: $world).
% tff('$accessible_world_decl',type,$accessible_world: ($world * $world) > $o).
% tff('$in_world_decl',type,$in_world: ($world * $o) > $o).

tff(person_type,type,person: $tType).
tff(geoff_decl,type,geoff: person).
tff(like_decl,type,like: person > $o).
tff(id_of_decl,type,id_of: person > $int).

tff(int2person_decl,type, int2person: $int > person ).

tff(int2world_decl,type,int2world: $int > $world ).

tff(like_geoff,interpretation,
%----An infinite number of worlds, numbered by naturals
    ( ( ! [I: $int] : 
          ( $greatereq(I,0)
         => ? [W: $world] : int2world(I) = W )
      & $local_world = int2world(0)
%----The type promoter is a bijection (injective and surjective)
      & ! [I1: $int,I2: $int] : 
          ( ( int2world(I1) = int2world(I2) ) => ( I1 = I2 ) )
      & ! [W: $world] : ? [I: $int] : int2world(I) = W
%----World 0 can access itself (system T)
      & $accessible_world(int2world(0),int2world(0))
%----World 0 can access all other worlds
      & ! [I: $int] : 
          ( $greater(I,0)
         => $accessible_world(int2world(0),int2world(I)) ) )

%----Now interpret each world
%----In world 0 
    & $in_world(int2world(0),
%----The domain for type person is the integers
        ( ( ! [P: person] : ? [I: $int] : P = int2person(I)
%----The type promoter is a bijection (injective and surjective)
          & ! [I1: $int,I2: $int] : 
              ( int2person(I1) = int2person(I2) => I1 = I2 ) )
%----geoff is interpreted as 0
        & ( geoff = int2person(0)
%----id_of coincides with the domain elements
          & ! [I: $int] : id_of(int2person(I)) = I )
%----like is true for 0 (and only 0 by next part for all worlds)
        & like(int2person(0) ) ) )
%----In all worlds
    & ! [IW: $int] :
        ( $greatereq(IW,0)
       => $in_world(int2world(IW),
%----The type promoter is a bijection (injective and surjective)
            ( ( ! [P: person] : ? [I: $int] : P = int2person(I)
              & ! [I1: $int,I2: $int] : 
                  ( int2person(I1) = int2person(I2) => I1 = I2 ) )
%----geoff is interpreted as the world number
            & ( geoff = int2person(IW)
%----id_of coincides with the world
            & id_of(int2person(IW)) = IW )
%----Like the person who is interpreted as this world number (geoff)
            & ( like(int2person(IW)) 
%----Like only this one person
              & ! [ID: $int] :
                  ( like(int2person(ID))
                <=> ID = IW ) ) ) ) ) ) ).
%------------------------------------------------------------------------------

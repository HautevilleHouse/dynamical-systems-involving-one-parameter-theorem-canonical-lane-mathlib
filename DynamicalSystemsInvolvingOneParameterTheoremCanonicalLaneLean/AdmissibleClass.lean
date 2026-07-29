import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterTheoremCanonicalLaneLean

structure OneParameterFlowSystem where
  state : Type
  timeDomain : Type
  flow : timeDomain → state → state
  oneParameterGroupProperty : ∀ (t s : timeDomain), flow (t + s) = flow t ∘ flow s
  identityFlow : flow 0 = id

structure AdmissibleClass where
  system : OneParameterFlowSystem
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  (∀ x : A.system.state, A.system.flow 0 x = x) ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DynamicalSystemsInvolvingOneParameterTheoremCanonicalLaneLean
end HautevilleHouse
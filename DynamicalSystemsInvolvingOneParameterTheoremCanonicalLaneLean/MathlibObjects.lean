import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterTheoremCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure DynamicalSystem where
  carrier : Type
  topology : TopologicalSpace carrier
  stateSpace : carrier
  timeDomain : Type
  evolution : timeDomain → carrier → carrier
  continuousTime : Prop

structure OneParameterFlow where
  system : DynamicalSystem
  parameter : Type
  parameterSpace : TopologicalSpace parameter
  flow : parameter → DynamicalSystem
  continuousParameter : Prop
  oneParameterFamily : Prop

structure AdmittedOneParameterObject where
  flow : OneParameterFlow
  parameterVariation : Prop
  bifurcationPoint : Prop
  topologicalConsequence : Prop
  conclusion : topologicalConsequence

structure AdmissibleClass where
  object : AdmittedOneParameterObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

end DynamicalSystemsInvolvingOneParameterTheoremCanonicalLaneLean
end HautevilleHouse

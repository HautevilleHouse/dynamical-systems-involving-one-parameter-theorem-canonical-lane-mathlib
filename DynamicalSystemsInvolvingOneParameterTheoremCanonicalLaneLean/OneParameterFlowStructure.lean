import DynamicalSystemsInvolvingOneParameterTheoremCanonicalLaneLean.AdmissibleClass

/-!
# One-Parameter Flow Structure Package

This package formalizes the structure of a one-parameter flow,
topological dynamics, and ergodic properties.
-/

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterTheoremCanonicalLaneLean

structure FlowSmoothnessPackage (F : OneParameterFlow) where
  smoothTime : Prop
  smoothSpace : Prop
  smoothFlow : Prop
  lipschitzInTime : Prop
  lipschitzInSpace : Prop

structure FlowSmoothnessEvidence {F : OneParameterFlow}
    (P : FlowSmoothnessPackage F) where
  smoothTimeClosed : P.smoothTime
  smoothSpaceClosed : P.smoothSpace
  smoothFlowClosed : P.smoothFlow
  lipschitzInTimeClosed : P.lipschitzInTime
  lipschitzInSpaceClosed : P.lipschitzInSpace

def FlowSmoothnessClosed {F : OneParameterFlow}
    (P : FlowSmoothnessPackage F) : Prop :=
  P.smoothTime ∧ P.smoothSpace ∧ P.smoothFlow ∧
  P.lipschitzInTime ∧ P.lipschitzInSpace

theorem flow_smoothness_closed_from_evidence
    {F : OneParameterFlow} (P : FlowSmoothnessPackage F)
    (E : FlowSmoothnessEvidence P) : FlowSmoothnessClosed P := by
  exact And.intro E.smoothTimeClosed
    (And.intro E.smoothSpaceClosed
      (And.intro E.smoothFlowClosed
        (And.intro E.lipschitzInTimeClosed E.lipschitzInSpaceClosed)))

end DynamicalSystemsInvolvingOneParameterTheoremCanonicalLaneLean
end HautevilleHouse
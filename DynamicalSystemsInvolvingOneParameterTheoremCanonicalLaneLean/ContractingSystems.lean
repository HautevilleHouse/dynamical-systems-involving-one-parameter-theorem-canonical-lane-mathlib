import canonicalLaneMathlib.AdmissibleClass
import DynamicalSystemsInvolvingOneParameterTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterTheoremCanonicalLaneLean

structure ContractingSystem (A : AdmissibleClass) where
  invariantSet : Set A.system.state
  contractionRate : ℝ
  distanceDecreases : ∀ (x y : A.system.state) (t : A.system.timeDomain), 
    dist (A.system.flow t x) (A.system.flow t y) ≤ exp (-contractionRate * t) * dist x y
  invariantSetClosedUnderFlow : ∀ (x : A.system.state), x ∈ invariantSet → ∀ t, A.system.flow t x ∈ invariantSet

structure ContractingSystemEvidence (A : AdmissibleClass) (C : ContractingSystem A) where
  distanceDecreasesClosed : C.distanceDecreases
  invariantSetClosedUnderFlowClosed : C.invariantSetClosedUnderFlow

def ContractingSystemClosed (A : AdmissibleClass) (C : ContractingSystem A) : Prop :=
  C.distanceDecreases ∧ C.invariantSetClosedUnderFlow

theorem contracting_system_closed_from_evidence (A : AdmissibleClass) (C : ContractingSystem A) (E : ContractingSystemEvidence A C) :
    ContractingSystemClosed A C := by
  exact And.intro E.distanceDecreasesClosed E.invariantSetClosedUnderFlowClosed

end DynamicalSystemsInvolvingOneParameterTheoremCanonicalLaneLean
end HautevilleHouse
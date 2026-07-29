import canonicalLaneMathlib.AdmissibleClass
import DynamicalSystemsInvolvingOneParameterTheoremCanonicalLaneLean.AdmissibleClass
import DynamicalSystemsInvolvingOneParameterTheoremCanonicalLaneLean.ContractingSystems

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterTheoremCanonicalLaneLean

structure EquilibriumAnalysis (A : AdmissibleClass) where
  fixedPoints : Set A.system.state
  hyperbolicCondition : ∀ x ∈ fixedPoints, Derivative (A.system.flow 1) x has no eigenvalue on unit circle
  localStableManifold : Prop
  localUnstableManifold : Prop
  centerManifold : Prop

structure EquilibriumAnalysisEvidence (A : AdmissibleClass) (E : EquilibriumAnalysis A) where
  fixedPointsClosed : E.fixedPoints = {x | ∀ t, A.system.flow t x = x}
  hyperbolicConditionClosed : E.hyperbolicCondition
  localStableManifoldClosed : E.localStableManifold
  localUnstableManifoldClosed : E.localUnstableManifold
  centerManifoldClosed : E.centerManifold

def EquilibriumAnalysisClosed (A : AdmissibleClass) (E : EquilibriumAnalysis A) : Prop :=
  E.fixedPoints = {x | ∀ t, A.system.flow t x = x} ∧
  E.hyperbolicCondition ∧
  E.localStableManifold ∧
  E.localUnstableManifold ∧
  E.centerManifold

theorem equilibrium_analysis_closed_from_evidence (A : AdmissibleClass) (E : EquilibriumAnalysis A) (Ev : EquilibriumAnalysisEvidence A E) :
    EquilibriumAnalysisClosed A E := by
  exact And.intro Ev.fixedPointsClosed
    (And.intro Ev.hyperbolicConditionClosed
      (And.intro Ev.localStableManifoldClosed
        (And.intro Ev.localUnstableManifoldClosed Ev.centerManifoldClosed)))

end DynamicalSystemsInvolvingOneParameterTheoremCanonicalLaneLean
end HautevilleHouse
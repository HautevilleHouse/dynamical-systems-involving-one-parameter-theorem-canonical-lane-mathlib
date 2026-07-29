import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterTheoremCanonicalLaneLean

structure InvariantMeasuresPackage where
  invariantMeasure : Type u
  ergodicityCondition : Prop
  mixingCondition : Prop
  uniqueness : Prop

structure InvariantMeasuresEvidence (M : InvariantMeasuresPackage) where
  ergodicityConditionClosed : M.ergodicityCondition
  mixingConditionClosed : M.mixingCondition
  uniquenessClosed : M.uniqueness

def InvariantMeasuresClosed (M : InvariantMeasuresPackage) : Prop :=
  M.ergodicityCondition ∧ M.mixingCondition ∧ M.uniqueness

theorem invariant_measures_closed_from_evidence (M : InvariantMeasuresPackage)
    (E : InvariantMeasuresEvidence M) : InvariantMeasuresClosed M := by
  exact And.intro E.ergodicityConditionClosed
    (And.intro E.mixingConditionClosed E.uniquenessClosed)

end DynamicalSystemsInvolvingOneParameterTheoremCanonicalLaneLean
end HautevilleHouse
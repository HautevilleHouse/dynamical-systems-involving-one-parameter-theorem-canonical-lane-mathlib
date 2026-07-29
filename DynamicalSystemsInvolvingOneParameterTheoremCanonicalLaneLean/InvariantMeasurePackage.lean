import DynamicalSystemsInvolvingOneParameterTheoremCanonicalLaneLean.OneParameterFlowStructure

/-!
# Invariant Measure Package
-/

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterTheoremCanonicalLaneLean

structure InvariantMeasurePackage {F : OneParameterFlow}
    (S : FlowSmoothnessPackage F) where
  measureSpace : Type
  measure : measureSpace → ℝ
  flowInvariant : Prop
  finiteMeasure : Prop
  ergodicDecomposition : Prop

structure InvariantMeasureEvidence {F : OneParameterFlow}
    {S : FlowSmoothnessPackage F} (M : InvariantMeasurePackage S) where
  flowInvariantClosed : M.flowInvariant
  finiteMeasureClosed : M.finiteMeasure
  ergodicDecompositionClosed : M.ergodicDecomposition

def InvariantMeasureClosed {F : OneParameterFlow}
    {S : FlowSmoothnessPackage F} (M : InvariantMeasurePackage S) : Prop :=
  M.flowInvariant ∧ M.finiteMeasure ∧ M.ergodicDecomposition

theorem invariant_measure_closed_from_evidence
    {F : OneParameterFlow} {S : FlowSmoothnessPackage F}
    (M : InvariantMeasurePackage S) (E : InvariantMeasureEvidence M) :
    InvariantMeasureClosed M := by
  exact And.intro E.flowInvariantClosed
    (And.intro E.finiteMeasureClosed E.ergodicDecompositionClosed)

end DynamicalSystemsInvolvingOneParameterTheoremCanonicalLaneLean
end HautevilleHouse
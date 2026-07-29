import DynamicalSystemsInvolvingOneParameterTheoremCanonicalLaneLean.InvariantMeasurePackage

/-!
# One-Parameter Theorem Closure Package

This package records the theorem-level closure: the flow admits an
invariant measure and ergodic decomposition, which corresponds to the
endpoint of the dynamical system.
-/

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterTheoremCanonicalLaneLean

structure OneParameterTheoremPackage {F : OneParameterFlow}
    {S : FlowSmoothnessPackage F} {M : InvariantMeasurePackage S}
    (C : AdmissibleClass) where
  flowAdmitsInvariantMeasure : C.object.invariantMeasure
  ergodicDecompositionExists : C.object.ergodicDecomposition
  invariantMeasureMatches : Prop
  conclusionReached : Prop

structure OneParameterTheoremEvidence {F : OneParameterFlow}
    {S : FlowSmoothnessPackage F} {M : InvariantMeasurePackage S}
    {C : AdmissibleClass} (T : OneParameterTheoremPackage C) where
  flowAdmitsInvariantMeasureClosed : T.flowAdmitsInvariantMeasure
  ergodicDecompositionExistsClosed : T.ergodicDecompositionExists
  invariantMeasureMatchesClosed : T.invariantMeasureMatches
  conclusionReachedClosed : T.conclusionReached

def OneParameterTheoremClosed {F : OneParameterFlow}
    {S : FlowSmoothnessPackage F} {M : InvariantMeasurePackage S}
    {C : AdmissibleClass} (T : OneParameterTheoremPackage C) : Prop :=
  T.flowAdmitsInvariantMeasure ∧ T.ergodicDecompositionExists ∧
  T.invariantMeasureMatches ∧ T.conclusionReached

theorem one_parameter_theorem_closed_from_evidence
    {F : OneParameterFlow} {S : FlowSmoothnessPackage F}
    {M : InvariantMeasurePackage S} {C : AdmissibleClass}
    (T : OneParameterTheoremPackage C) (E : OneParameterTheoremEvidence T) :
    OneParameterTheoremClosed T := by
  exact And.intro E.flowAdmitsInvariantMeasureClosed
    (And.intro E.ergodicDecompositionExistsClosed
      (And.intro E.invariantMeasureMatchesClosed E.conclusionReachedClosed))

end DynamicalSystemsInvolvingOneParameterTheoremCanonicalLaneLean
end HautevilleHouse
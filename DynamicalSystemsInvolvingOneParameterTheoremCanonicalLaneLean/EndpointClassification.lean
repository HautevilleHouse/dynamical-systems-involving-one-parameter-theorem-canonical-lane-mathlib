import DynamicalSystemsInvolvingOneParameterTheoremCanonicalLaneLean.OneParameterTheoremClosure

/-!
# Endpoint Classification Package
-/

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterTheoremCanonicalLaneLean

structure EndpointClassificationPackage {F : OneParameterFlow}
    {S : FlowSmoothnessPackage F} {M : InvariantMeasurePackage S}
    {C : AdmissibleClass} {T : OneParameterTheoremPackage C}
    (U : OneParameterTheoremPackage C) where
  finalInvariantMeasure : Prop
  ergodicComponentsClassified : Prop
  endpointReached : Prop

structure EndpointClassificationEvidence {F : OneParameterFlow}
    {S : FlowSmoothnessPackage F} {M : InvariantMeasurePackage S}
    {C : AdmissibleClass} {T : OneParameterTheoremPackage C}
    {U : OneParameterTheoremPackage C}
    (E : EndpointClassificationPackage U) where
  finalInvariantMeasureClosed : E.finalInvariantMeasure
  ergodicComponentsClassifiedClosed : E.ergodicComponentsClassified
  endpointReachedClosed : E.endpointReached

def EndpointClassificationClosed {F : OneParameterFlow}
    {S : FlowSmoothnessPackage F} {M : InvariantMeasurePackage S}
    {C : AdmissibleClass} {T : OneParameterTheoremPackage C}
    {U : OneParameterTheoremPackage C}
    (E : EndpointClassificationPackage U) : Prop :=
  E.finalInvariantMeasure ∧ E.ergodicComponentsClassified ∧ E.endpointReached

theorem endpoint_classification_closed_from_evidence
    {F : OneParameterFlow} {S : FlowSmoothnessPackage F}
    {M : InvariantMeasurePackage S} {C : AdmissibleClass}
    {T : OneParameterTheoremPackage C} {U : OneParameterTheoremPackage C}
    (E : EndpointClassificationPackage U)
    (Ev : EndpointClassificationEvidence E) : EndpointClassificationClosed E := by
  exact And.intro Ev.finalInvariantMeasureClosed
    (And.intro Ev.ergodicComponentsClassifiedClosed Ev.endpointReachedClosed)

end DynamicalSystemsInvolvingOneParameterTheoremCanonicalLaneLean
end HautevilleHouse
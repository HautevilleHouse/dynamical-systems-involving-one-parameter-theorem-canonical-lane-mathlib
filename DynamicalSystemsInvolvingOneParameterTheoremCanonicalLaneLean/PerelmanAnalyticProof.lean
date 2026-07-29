import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsInvolvingOneParameterTheoremCanonicalLaneLean.RicciFlowRoute

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterTheoremCanonicalLaneLean

structure FlowCertificate (F : OneParameterFlow) where
  flowFamilyEvolutions : Prop
  stagnationPointsControlled : Prop
  entropyConserved : Prop
  flowFamilyEvolutionsClosed : flowFamilyEvolutions
  stagnationPointsControlledClosed : stagnationPointsControlled
  entropyConservedClosed : entropyConserved
  flowEvidence : OneParameterFlowEvidence F

def FlowCertificateClosed (Fc : FlowCertificate F) : Prop :=
  Fc.flowFamilyEvolutions ∧ Fc.stagnationPointsControlled ∧ Fc.entropyConserved ∧
  OneParameterFlowClosed F

theorem flow_certificate_closed (Fc : FlowCertificate F) : FlowCertificateClosed Fc := by
  exact And.intro Fc.flowFamilyEvolutionsClosed
    (And.intro Fc.stagnationPointsControlledClosed
      (And.intro Fc.entropyConservedClosed
        (one_parameter_flow_closed_from_evidence F Fc.flowEvidence)))

structure BifurcationCertificate {G : DynamicalSystem}
    {F : OneParameterFlow G} (B : BifurcationAnalysisPackage F) where
  bifurcationPointsClassified : Prop
  topologicalChangesAccounted : Prop
  bifurcationPointsClassifiedClosed : bifurcationPointsClassified
  topologicalChangesAccountedClosed : topologicalChangesAccounted
  bifurcationEvidence : BifurcationAnalysisEvidence B

def BifurcationCertificateClosed (Bc : BifurcationCertificate B) : Prop :=
  Bc.bifurcationPointsClassified ∧ Bc.topologicalChangesAccounted ∧
  BifurcationAnalysisClosed B

theorem bifurcation_certificate_closed (Bc : BifurcationCertificate B) : BifurcationCertificateClosed Bc := by
  exact And.intro Bc.bifurcationPointsClassifiedClosed
    (And.intro Bc.topologicalChangesAccountedClosed
      (bifurcation_analysis_closed_from_evidence B Bc.bifurcationEvidence))

end DynamicalSystemsInvolvingOneParameterTheoremCanonicalLaneLean
end HautevilleHouse

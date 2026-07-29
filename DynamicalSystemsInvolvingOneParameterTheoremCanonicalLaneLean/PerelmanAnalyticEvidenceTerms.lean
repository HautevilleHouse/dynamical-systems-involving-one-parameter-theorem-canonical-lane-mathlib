import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsInvolvingOneParameterTheoremCanonicalLaneLean.PerelmanAnalyticProof

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterTheoremCanonicalLaneLean

structure FlowEvidenceTerms {G : DynamicalSystem}
    {F : OneParameterFlow G} (Fc : FlowCertificate F) where
  flowFamilyEvolutions : Fc.flowFamilyEvolutions
  stagnationPointsControlled : Fc.stagnationPointsControlled
  entropyConserved : Fc.entropyConserved
  flowClosed : OneParameterFlowClosed F

def FlowCertificate.evidenceTerms {G : DynamicalSystem}
    {F : OneParameterFlow G} (Fc : FlowCertificate F) : FlowEvidenceTerms Fc :=
  {
    flowFamilyEvolutions := Fc.flowFamilyEvolutionsClosed
    stagnationPointsControlled := Fc.stagnationPointsControlledClosed
    entropyConserved := Fc.entropyConservedClosed
    flowClosed := one_parameter_flow_closed_from_evidence F Fc.flowEvidence
  }

structure BifurcationEvidenceTerms {G : DynamicalSystem}
    {F : OneParameterFlow G} {B : BifurcationAnalysisPackage F}
    (Bc : BifurcationCertificate B) where
  bifurcationPointsClassified : Bc.bifurcationPointsClassified
  topologicalChangesAccounted : Bc.topologicalChangesAccounted
  bifurcationClosed : BifurcationAnalysisClosed B

def BifurcationCertificate.evidenceTerms {G : DynamicalSystem}
    {F : OneParameterFlow G} {B : BifurcationAnalysisPackage F}
    (Bc : BifurcationCertificate B) : BifurcationEvidenceTerms Bc :=
  {
    bifurcationPointsClassified := Bc.bifurcationPointsClassifiedClosed
    topologicalChangesAccounted := Bc.topologicalChangesAccountedClosed
    bifurcationClosed := bifurcation_analysis_closed_from_evidence B Bc.bifurcationEvidence
  }

end DynamicalSystemsInvolvingOneParameterTheoremCanonicalLaneLean
end HautevilleHouse

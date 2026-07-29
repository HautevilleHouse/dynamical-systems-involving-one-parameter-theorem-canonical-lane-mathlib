import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsInvolvingOneParameterTheoremCanonicalLaneLean.OneParameterFamily

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterTheoremCanonicalLaneLean

structure BifurcationAnalysisPackage {F : OneParameterFamilyPackage} (fam : F) where
  bifurcationPoints : Prop
  stabilityChange : Prop
  phasePortrait : Prop
  criticalParameter : Prop

structure BifurcationAnalysisEvidence {F : OneParameterFamilyPackage}
    {fam : F} (B : BifurcationAnalysisPackage fam) where
  bifurcationPointsClosed : B.bifurcationPoints
  stabilityChangeClosed : B.stabilityChange
  phasePortraitClosed : B.phasePortrait
  criticalParameterClosed : B.criticalParameter

def BifurcationAnalysisClosed {F : OneParameterFamilyPackage}
    {fam : F} (B : BifurcationAnalysisPackage fam) : Prop :=
  B.bifurcationPoints ∧ B.stabilityChange ∧ B.phasePortrait ∧ B.criticalParameter

theorem bifurcation_analysis_closed_from_evidence
    {F : OneParameterFamilyPackage} {fam : F}
    (B : BifurcationAnalysisPackage fam) (E : BifurcationAnalysisEvidence B) :
    BifurcationAnalysisClosed B := by
  exact And.intro E.bifurcationPointsClosed
    (And.intro E.stabilityChangeClosed
      (And.intro E.phasePortraitClosed E.criticalParameterClosed))

end DynamicalSystemsInvolvingOneParameterTheoremCanonicalLaneLean
end HautevilleHouse
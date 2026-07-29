import canonicalLaneMathlib.AdmissibleClass
import DynamicalSystemsInvolvingOneParameterTheoremCanonicalLaneLean.AdmissibleClass
import DynamicalSystemsInvolvingOneParameterTheoremCanonicalLaneLean.EquilibriumAnalysis

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterTheoremCanonicalLaneLean

structure BifurcationAnalysis (A : AdmissibleClass) (E : EquilibriumAnalysis A) where
  parameterSpace : Type
  bifurcationPoints : Set (A.system.state × parameterSpace)
  saddleNodeBifurcation : Prop
  hopfBifurcation : Prop
  pitchforkBifurcation : Prop
  transcriticalBifurcation : Prop

structure BifurcationAnalysisEvidence (A : AdmissibleClass) (E : EquilibriumAnalysis A) (B : BifurcationAnalysis A E) where
  saddleNodeBifurcationClosed : B.saddleNodeBifurcation
  hopfBifurcationClosed : B.hopfBifurcation
  pitchforkBifurcationClosed : B.pitchforkBifurcation
  transcriticalBifurcationClosed : B.transcriticalBifurcation

def BifurcationAnalysisClosed (A : AdmissibleClass) (E : EquilibriumAnalysis A) (B : BifurcationAnalysis A E) : Prop :=
  B.saddleNodeBifurcation ∧ B.hopfBifurcation ∧ B.pitchforkBifurcation ∧ B.transcriticalBifurcation

theorem bifurcation_analysis_closed_from_evidence (A : AdmissibleClass) (E : EquilibriumAnalysis A) (B : BifurcationAnalysis A E) (Ev : BifurcationAnalysisEvidence A E B) :
    BifurcationAnalysisClosed A E B := by
  exact And.intro Ev.saddleNodeBifurcationClosed
    (And.intro Ev.hopfBifurcationClosed
      (And.intro Ev.pitchforkBifurcationClosed Ev.transcriticalBifurcationClosed))

end DynamicalSystemsInvolvingOneParameterTheoremCanonicalLaneLean
end HautevilleHouse
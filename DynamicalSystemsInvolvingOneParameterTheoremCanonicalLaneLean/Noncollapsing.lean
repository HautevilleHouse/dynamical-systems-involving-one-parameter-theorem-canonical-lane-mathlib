import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsInvolvingOneParameterTheoremCanonicalLaneLean.ShortTimeExistence

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterTheoremCanonicalLaneLean

structure NoncollapsingPackage {G : DynamicalSystem}
    {F : OneParameterFlow G} (S : FlowSegmentPackage F) where
  scaleInvariantVolumeBound : Prop
  curvatureScaleControl : Prop
  blowupLimitNoncollapsed : Prop

structure NoncollapsingEvidence {G : DynamicalSystem}
    {F : OneParameterFlow G} {S : FlowSegmentPackage F}
    (N : NoncollapsingPackage S) where
  scaleInvariantVolumeBoundClosed : N.scaleInvariantVolumeBound
  curvatureScaleControlClosed : N.curvatureScaleControl
  blowupLimitNoncollapsedClosed : N.blowupLimitNoncollapsed

def NoncollapsingClosed {G : DynamicalSystem}
    {F : OneParameterFlow G} {S : FlowSegmentPackage F}
    (N : NoncollapsingPackage S) : Prop :=
  N.scaleInvariantVolumeBound ∧ N.curvatureScaleControl ∧ N.blowupLimitNoncollapsed

theorem noncollapsing_closed_from_evidence
    {G : DynamicalSystem} {F : OneParameterFlow G}
    {S : FlowSegmentPackage F}
    (N : NoncollapsingPackage S) (E : NoncollapsingEvidence N) :
    NoncollapsingClosed N := by
  exact And.intro E.scaleInvariantVolumeBoundClosed
    (And.intro E.curvatureScaleControlClosed E.blowupLimitNoncollapsedClosed)

end DynamicalSystemsInvolvingOneParameterTheoremCanonicalLaneLean
end HautevilleHouse

import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterTheorem

structure HopfBifurcationPackage (A : AdmissibleClass) where
  phaseSpace : Type u
  parameterSpace : Type v
  vectorField : parameterSpace → phaseSpace → phaseSpace
  equilibriumCurve : parameterSpace → phaseSpace
  eigenvaluesCrossing : Prop
  periodicOrbitEmergence : Prop
  nondegeneracyCondition : Prop

structure HopfBifurcationEvidence {A : AdmissibleClass} (H : HopfBifurcationPackage A) where
  eigenvaluesCrossingClosed : H.eigenvaluesCrossing
  periodicOrbitEmergenceClosed : H.periodicOrbitEmergence
  nondegeneracyConditionClosed : H.nondegeneracyCondition

def HopfBifurcationClosed {A : AdmissibleClass} (H : HopfBifurcationPackage A) : Prop :=
  H.eigenvaluesCrossing ∧ H.periodicOrbitEmergence ∧ H.nondegeneracyCondition

theorem hopf_bifurcation_closed_from_evidence {A : AdmissibleClass} (H : HopfBifurcationPackage A) (E : HopfBifurcationEvidence H) :
    HopfBifurcationClosed H := by
  exact And.intro E.eigenvaluesCrossingClosed (And.intro E.periodicOrbitEmergenceClosed E.nondegeneracyConditionClosed)

end DynamicalSystemsInvolvingOneParameterTheorem
end HautevilleHouse
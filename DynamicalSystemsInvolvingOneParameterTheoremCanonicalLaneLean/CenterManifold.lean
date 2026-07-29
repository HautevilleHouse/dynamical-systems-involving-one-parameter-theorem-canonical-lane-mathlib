import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterTheorem

structure CenterManifoldPackage (A : AdmissibleClass) where
  phaseSpace : Type u
  equilibrium : phaseSpace
  linearPart : phaseSpace → phaseSpace
  centerSubspace : Submodule ℝ phaseSpace
  reductionExists : Prop
  reducedDynamics : Prop
  persistenceUnderParameter : Prop

structure CenterManifoldEvidence {A : AdmissibleClass} (C : CenterManifoldPackage A) where
  reductionExistsClosed : C.reductionExists
  reducedDynamicsClosed : C.reducedDynamics
  persistenceUnderParameterClosed : C.persistenceUnderParameter

def CenterManifoldClosed {A : AdmissibleClass} (C : CenterManifoldPackage A) : Prop :=
  C.reductionExists ∧ C.reducedDynamics ∧ C.persistenceUnderParameter

theorem center_manifold_closed_from_evidence {A : AdmissibleClass} (C : CenterManifoldPackage A) (E : CenterManifoldEvidence C) :
    CenterManifoldClosed C := by
  exact And.intro E.reductionExistsClosed (And.intro E.reducedDynamicsClosed E.persistenceUnderParameterClosed)

end DynamicalSystemsInvolvingOneParameterTheorem
end HautevilleHouse
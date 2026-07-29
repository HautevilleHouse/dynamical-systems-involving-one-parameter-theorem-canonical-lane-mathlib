import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterTheorem

structure NormalFormPackage (A : AdmissibleClass) where
  phaseSpace : Type u
  vectorField : phaseSpace → phaseSpace
  equilibrium : phaseSpace
  poincareNormalForm : Prop
  resonanceCondition : Prop
  smoothConjugacy : Prop
  parameterDependence : Prop

structure NormalFormEvidence {A : AdmissibleClass} (N : NormalFormPackage A) where
  poincareNormalFormClosed : N.poincareNormalForm
  resonanceConditionClosed : N.resonanceCondition
  smoothConjugacyClosed : N.smoothConjugacy
  parameterDependenceClosed : N.parameterDependence

def NormalFormClosed {A : AdmissibleClass} (N : NormalFormPackage A) : Prop :=
  N.poincareNormalForm ∧ N.resonanceCondition ∧ N.smoothConjugacy ∧ N.parameterDependence

theorem normal_form_closed_from_evidence {A : AdmissibleClass} (N : NormalFormPackage A) (E : NormalFormEvidence N) :
    NormalFormClosed N := by
  exact And.intro E.poincareNormalFormClosed (And.intro E.resonanceConditionClosed (And.intro E.smoothConjugacyClosed E.parameterDependenceClosed))

end DynamicalSystemsInvolvingOneParameterTheorem
end HautevilleHouse
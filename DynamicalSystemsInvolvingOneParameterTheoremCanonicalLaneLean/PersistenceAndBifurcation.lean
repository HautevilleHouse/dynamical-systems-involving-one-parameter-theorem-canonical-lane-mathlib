import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterTheorem

structure PersistencePackage (A : AdmissibleClass) where
  phaseSpace : Type u
  parameterSpace : Type v
  dynamicalSystem : parameterSpace → (phaseSpace → phaseSpace)
  invariantSet : Set phaseSpace
  persistenceUnderParameter : Prop
  bifurcationSet : Set parameterSpace
  bifurcationPoints : Prop
  structuralStability : Prop

structure PersistenceEvidence {A : AdmissibleClass} (P : PersistencePackage A) where
  persistenceUnderParameterClosed : P.persistenceUnderParameter
  bifurcationPointsClosed : P.bifurcationPoints
  structuralStabilityClosed : P.structuralStability

def PersistenceClosed {A : AdmissibleClass} (P : PersistencePackage A) : Prop :=
  P.persistenceUnderParameter ∧ P.bifurcationPoints ∧ P.structuralStability

theorem persistence_closed_from_evidence {A : AdmissibleClass} (P : PersistencePackage A) (E : PersistenceEvidence P) :
    PersistenceClosed P := by
  exact And.intro E.persistenceUnderParameterClosed (And.intro E.bifurcationPointsClosed E.structuralStabilityClosed)

end DynamicalSystemsInvolvingOneParameterTheorem
end HautevilleHouse
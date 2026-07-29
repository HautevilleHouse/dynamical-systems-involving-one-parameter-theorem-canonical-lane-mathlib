import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterTheoremCanonicalLaneLean

structure OneParameterFamilyPackage where
  parameterSpace : Type u
  familyMap : parameterSpace → Type v
  continuousParameter : Prop
  familyMemberSmooth : Prop
  invariantStructure : Prop

structure OneParameterFamilyEvidence (F : OneParameterFamilyPackage) where
  continuousParameterClosed : F.continuousParameter
  familyMemberSmoothClosed : F.familyMemberSmooth
  invariantStructureClosed : F.invariantStructure

def OneParameterFamilyClosed (F : OneParameterFamilyPackage) : Prop :=
  F.continuousParameter ∧ F.familyMemberSmooth ∧ F.invariantStructure

theorem one_parameter_family_closed_from_evidence
    (F : OneParameterFamilyPackage) (E : OneParameterFamilyEvidence F) :
    OneParameterFamilyClosed F := by
  exact And.intro E.continuousParameterClosed
    (And.intro E.familyMemberSmoothClosed E.invariantStructureClosed)

end DynamicalSystemsInvolvingOneParameterTheoremCanonicalLaneLean
end HautevilleHouse
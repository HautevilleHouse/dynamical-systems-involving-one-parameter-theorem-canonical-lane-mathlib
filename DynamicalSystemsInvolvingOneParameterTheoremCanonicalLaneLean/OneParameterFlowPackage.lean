import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterTheoremCanonicalLaneLean

structure OneParameterFlowPackage where
  stateSpace : Type u
  parameterSpace : Type v
  flowMap : parameterSpace → stateSpace → stateSpace
  continuousInParameter : Prop
  continuousInState : Prop
  groupAction : Prop

structure OneParameterFlowEvidence (F : OneParameterFlowPackage) where
  continuousInParameterClosed : F.continuousInParameter
  continuousInStateClosed : F.continuousInState
  groupActionClosed : F.groupAction

def OneParameterFlowClosed (F : OneParameterFlowPackage) : Prop :=
  F.continuousInParameter ∧ F.continuousInState ∧ F.groupAction

theorem one_parameter_flow_closed_from_evidence (F : OneParameterFlowPackage)
    (E : OneParameterFlowEvidence F) : OneParameterFlowClosed F := by
  exact And.intro E.continuousInParameterClosed
    (And.intro E.continuousInStateClosed E.groupActionClosed)

end DynamicalSystemsInvolvingOneParameterTheoremCanonicalLaneLean
end HautevilleHouse
import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterTheoremCanonicalLaneLean

structure HyperbolicDynamicsPackage where
  hyperbolicityCondition : Prop
  stableManifold : Prop
  unstableManifold : Prop
  hyperbolicSet : Prop

structure HyperbolicDynamicsEvidence (H : HyperbolicDynamicsPackage) where
  hyperbolicityConditionClosed : H.hyperbolicityCondition
  stableManifoldClosed : H.stableManifold
  unstableManifoldClosed : H.unstableManifold
  hyperbolicSetClosed : H.hyperbolicSet

def HyperbolicDynamicsClosed (H : HyperbolicDynamicsPackage) : Prop :=
  H.hyperbolicityCondition ∧ H.stableManifold ∧
  H.unstableManifold ∧ H.hyperbolicSet

theorem hyperbolic_dynamics_closed_from_evidence (H : HyperbolicDynamicsPackage)
    (E : HyperbolicDynamicsEvidence H) : HyperbolicDynamicsClosed H := by
  exact And.intro E.hyperbolicityConditionClosed
    (And.intro E.stableManifoldClosed
      (And.intro E.unstableManifoldClosed E.hyperbolicSetClosed))

end DynamicalSystemsInvolvingOneParameterTheoremCanonicalLaneLean
end HautevilleHouse
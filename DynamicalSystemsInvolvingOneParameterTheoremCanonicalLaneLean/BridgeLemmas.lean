import canonicalLaneMathlib.AdmissibleClass
import DynamicalSystemsInvolvingOneParameterTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ∀ x : A.system.state, A.system.flow 0 x = x

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  intro x
  exact A.system.identityFlow x

end DynamicalSystemsInvolvingOneParameterTheoremCanonicalLaneLean
end HautevilleHouse
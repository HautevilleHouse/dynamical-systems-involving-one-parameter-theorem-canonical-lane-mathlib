import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterTheoremCanonicalLaneLean

structure InfiniteTimeIntervalPackage where
  timeDomain : Type u
  extendedTime : Prop
  asymptoticBehavior : Prop
  limitSetDefinition : Prop

structure InfiniteTimeIntervalEvidence (T : InfiniteTimeIntervalPackage) where
  extendedTimeClosed : T.extendedTime
  asymptoticBehaviorClosed : T.asymptoticBehavior
  limitSetDefinitionClosed : T.limitSetDefinition

def InfiniteTimeIntervalClosed (T : InfiniteTimeIntervalPackage) : Prop :=
  T.extendedTime ∧ T.asymptoticBehavior ∧ T.limitSetDefinition

theorem infinite_time_interval_closed_from_evidence (T : InfiniteTimeIntervalPackage)
    (E : InfiniteTimeIntervalEvidence T) : InfiniteTimeIntervalClosed T := by
  exact And.intro E.extendedTimeClosed
    (And.intro E.asymptoticBehaviorClosed E.limitSetDefinitionClosed)

end DynamicalSystemsInvolvingOneParameterTheoremCanonicalLaneLean
end HautevilleHouse
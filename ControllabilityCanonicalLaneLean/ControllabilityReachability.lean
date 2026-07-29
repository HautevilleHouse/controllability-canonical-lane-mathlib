import canonicalLaneMathlib.AdmissibleClass
import ControllabilityCanonicalLaneLean.ControllabilityStateSpace

namespace HautevilleHouse
namespace ControllabilityCanonicalLaneLean

structure ReachabilityPackage (C : ControlSystemStateSpace) where
  reachableSet : Prop
  controllabilityGramian : Type u
  rankCondition : Prop
  controllabilityDecomposition : Prop

structure ReachabilityEvidence {C : ControlSystemStateSpace} (R : ReachabilityPackage C) where
  reachableSetClosed : R.reachableSet
  rankConditionClosed : R.rankCondition
  controllabilityDecompositionClosed : R.controllabilityDecomposition

def ReachabilityClosed {C : ControlSystemStateSpace} (R : ReachabilityPackage C) : Prop :=
  R.reachableSet ∧ R.rankCondition ∧ R.controllabilityDecomposition

theorem reachability_closed_from_evidence {C : ControlSystemStateSpace} (R : ReachabilityPackage C) (E : ReachabilityEvidence R) :
    ReachabilityClosed R := by
  exact And.intro E.reachableSetClosed (And.intro E.rankConditionClosed E.controllabilityDecompositionClosed)

end ControllabilityCanonicalLaneLean
end HautevilleHouse
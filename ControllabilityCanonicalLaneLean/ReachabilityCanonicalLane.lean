import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControllabilityCanonicalLaneLean

structure ReachabilitySet where
  system : LinearControlSystem
  initialSet : Type u
  targetSet : Type v
  reachabilityCondition : Prop
  timeParameter : Type w
  reachableInFiniteTime : Prop

structure ReachabilitySetEvidence (R : ReachabilitySet) where
  reachabilityConditionClosed : R.reachabilityCondition
  reachableInFiniteTimeClosed : R.reachableInFiniteTime

def ReachabilitySetClosed (R : ReachabilitySet) : Prop :=
  R.reachabilityCondition ∧ R.reachableInFiniteTime

theorem reachability_set_closed_from_evidence (R : ReachabilitySet) (E : ReachabilitySetEvidence R) :
    ReachabilitySetClosed R := by
  exact And.intro E.reachabilityConditionClosed E.reachableInFiniteTimeClosed

structure ControllabilityAdmissibleObject where
  object : LinearControlSystem
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def ControllabilityWitnessClosed (O : ControllabilityAdmissibleObject) : Prop :=
  O.endpointSatisfied ∨ O.remainderRecorded

theorem controllability_witness_closed (O : ControllabilityAdmissibleObject) : ControllabilityWitnessClosed O :=
  O.gateWitness

end ControllabilityCanonicalLaneLean
end HautevilleHouse
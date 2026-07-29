import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControllabilityCanonicalLaneLean

structure LinearControlSystem where
  stateSpace : Type u
  inputSpace : Type v
  dynamics : stateSpace -> stateSpace
  inputMap : inputSpace -> stateSpace
  dimension : Nat
  smoothDynamics : Prop

structure ControllabilityGramian where
  system : LinearControlSystem
  gramianMatrix : Nat -> Nat -> Prop
  positiveDefinite : Prop
  controllabilityCondition : Prop

structure ControllabilityGramianEvidence (G : ControllabilityGramian) where
  gramianPositiveDefiniteClosed : G.positiveDefinite
  controllabilityConditionClosed : G.controllabilityCondition

def ControllabilityGramianClosed (G : ControllabilityGramian) : Prop :=
  G.positiveDefinite ∧ G.controllabilityCondition

theorem controllability_gramian_closed_from_evidence (G : ControllabilityGramian) (E : ControllabilityGramianEvidence G) :
    ControllabilityGramianClosed G := by
  exact And.intro E.gramianPositiveDefiniteClosed E.controllabilityConditionClosed

end ControllabilityCanonicalLaneLean
end HautevilleHouse
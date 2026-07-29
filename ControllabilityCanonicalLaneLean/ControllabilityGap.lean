import ControllabilityCanonicalLaneLean.BridgeLemmas

/-!
# Controllability Gap Package
-/

namespace HautevilleHouse
namespace ControllabilityCanonicalLaneLean

structure ControllabilityGapPackage where
  controllabilityMatrix : Mat ℂ
  kalmanRankCondition : Prop
  reachableSubspace : VectorSpace ℂ
  unreachableDynamics : Prop

structure ControllabilityGapEvidence (G : ControllabilityGapPackage) where
  kalmanRankConditionClosed : G.kalmanRankCondition
  reachableSubspaceClosed : G.reachableSubspace.dimension = rank G.controllabilityMatrix
  unreachableDynamicsClosed : G.unreachableDynamics

def ControllabilityGapClosed (G : ControllabilityGapPackage) : Prop :=
  G.kalmanRankCondition ∧ (G.reachableSubspace.dimension = rank G.controllabilityMatrix) ∧ G.unreachableDynamics

theorem controllability_gap_closed_from_evidence (G : ControllabilityGapPackage) (E : ControllabilityGapEvidence G) :
    ControllabilityGapClosed G := by
  exact And.intro E.kalmanRankConditionClosed (And.intro E.reachableSubspaceClosed E.unreachableDynamicsClosed)

end ControllabilityCanonicalLaneLean
end HautevilleHouse

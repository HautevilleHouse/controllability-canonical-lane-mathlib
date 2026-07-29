import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControllabilityCanonicalLaneLean

structure ControllabilityDecomposition where
  system : LinearControlSystem
  controllableSubspace : Type u
  uncontrollableSubspace : Type v
  subspaceDecomposition : Prop
  invariantUnderDynamics : Prop
  reachableSetDescription : Prop

structure ControllabilityDecompositionEvidence (D : ControllabilityDecomposition) where
  subspaceDecompositionClosed : D.subspaceDecomposition
  invariantUnderDynamicsClosed : D.invariantUnderDynamics
  reachableSetDescriptionClosed : D.reachableSetDescription

def ControllabilityDecompositionClosed (D : ControllabilityDecomposition) : Prop :=
  D.subspaceDecomposition ∧ D.invariantUnderDynamics ∧ D.reachableSetDescription

theorem controllability_decomposition_closed_from_evidence (D : ControllabilityDecomposition) (E : ControllabilityDecompositionEvidence D) :
    ControllabilityDecompositionClosed D := by
  exact And.intro E.subspaceDecompositionClosed (And.intro E.invariantUnderDynamicsClosed E.reachableSetDescriptionClosed)

end ControllabilityCanonicalLaneLean
end HautevilleHouse
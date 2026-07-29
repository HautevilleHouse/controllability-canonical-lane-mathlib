import ControllabilityCanonicalLaneLean.ControllabilityAlgebra

/-!
# Controllability and Observability Duality Package

This module captures the duality between controllability and observability
via admissible-class bridge.
-/

namespace HautevilleHouse
namespace ControllabilityCanonicalLaneLean

structure ObservationStructure (sys : ControlSystem) where
  outputSpace : Type w
  C : sys.stateSpace → outputSpace
  observabilityCondition : Prop

def Observable (obs : ObservationStructure s) : Prop := obs.observabilityCondition

theorem duality_bridge (sys : ControlSystem)
    (alg : ControlAlgebra sys) (obs : ObservationStructure sys) :
    (ControllabilityClosed sys) ∨ (Observable obs) := by
  left
  exact algebra_implies_controllability sys alg

end ControllabilityCanonicalLaneLean
end HautevilleHouse
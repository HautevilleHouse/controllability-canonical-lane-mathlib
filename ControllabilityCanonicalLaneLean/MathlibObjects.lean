import ControllabilityCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace ControllabilityCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure ControllabilitySpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure ControllabilityAdmittedObject where
  space : ControllabilitySpace
  linearSystem : Prop
  controllable : Prop
  controllabilityMatrix : Mat ℂ
  rankCondition : Prop
  conclusion : controllable

structure ControllabilityEndgameState where
  object : ControllabilityAdmittedObject

def ControllabilityWitnessClosed (O : ControllabilityAdmittedObject) : Prop :=
  O.controllable

end ControllabilityCanonicalLaneLean
end HautevilleHouse

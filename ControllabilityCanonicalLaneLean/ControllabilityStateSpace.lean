import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControllabilityCanonicalLaneLean

structure ControlSystemStateSpace where
  stateSpace : Type u
  inputSpace : Type v
  outputSpace : Type w
  dynamics : stateSpace × inputSpace → stateSpace
  initialCondition : stateSpace
  controllabilityProperty : Prop
  observabilityProperty : Prop

def ControllabilityStateSpaceClosed (C : ControlSystemStateSpace) : Prop :=
  C.controllabilityProperty ∧ C.observabilityProperty

structure ControllabilityAdmittedObject where
  stateSpace : ControlSystemStateSpace
  controllable : Prop
  conclusion : controllable

def ControllabilityWitnessClosed (O : ControllabilityAdmittedObject) : Prop :=
  O.controllable

end ControllabilityCanonicalLaneLean
end HautevilleHouse
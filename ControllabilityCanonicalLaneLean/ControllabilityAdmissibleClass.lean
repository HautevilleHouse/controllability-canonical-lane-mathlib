import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControllabilityCanonicalLaneLean

structure ControlAdmittedObject where
  reachableSet : Type u
  constrainedDynamics : Prop
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

structure AdmissibleClass where
  object : ControlAdmittedObject
  endpointSatisfied : Prop := object.endpointSatisfied
  remainderRecorded : Prop := object.remainderRecorded
  gateWitness : endpointSatisfied ∨ remainderRecorded := object.gateWitness

def admittedClosure (A : AdmissibleClass) : Prop :=
  ControlWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ControllabilityCanonicalLaneLean
end HautevilleHouse
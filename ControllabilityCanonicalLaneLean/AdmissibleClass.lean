import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControllabilityCanonicalLaneLean

structure AdmissibleClass where
  object : ControllabilityAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  ControllabilityWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ControllabilityCanonicalLaneLean
end HautevilleHouse
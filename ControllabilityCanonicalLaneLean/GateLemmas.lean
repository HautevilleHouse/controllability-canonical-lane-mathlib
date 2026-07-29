import canonicalLaneMathlib.AdmissibleClass
import ControllabilityCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace ControllabilityCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end ControllabilityCanonicalLaneLean
end HautevilleHouse
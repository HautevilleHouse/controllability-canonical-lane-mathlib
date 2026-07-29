import canonicalLaneMathlib.AdmissibleClass
import ControllabilityCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace ControllabilityCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ControllabilityWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end ControllabilityCanonicalLaneLean
end HautevilleHouse
import canonicalLaneMathlib.AdmissibleClass
import ControllabilityCanonicalLaneLean.ControllabilityStateSpace

namespace HautevilleHouse
namespace ControllabilityCanonicalLaneLean

open canonicalLaneMathlib.AdmissibleClass

def controllabilityProjection : Projection (ControllabilityAdmittedObject) := {
  toFun := fun x => x,
  idempotent := by intro x; rfl
}

theorem controllability_projection_idempotent (x : ControllabilityAdmittedObject) :
    controllabilityProjection.toFun (controllabilityProjection.toFun x) = controllabilityProjection.toFun x := by
  exact controllabilityProjection.idempotent x

end ControllabilityCanonicalLaneLean
end HautevilleHouse
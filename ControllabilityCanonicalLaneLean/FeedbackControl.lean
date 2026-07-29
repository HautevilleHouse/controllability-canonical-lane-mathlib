import canonicalLaneMathlib.AdmissibleClass
import ControllabilityCanonicalLaneLean.ControllabilityReachability

namespace HautevilleHouse
namespace ControllabilityCanonicalLaneLean

structure FeedbackPackage {C : ControlSystemStateSpace} (R : ReachabilityPackage C) where
  stabilizable : Prop
  detectable : Prop
  polePlacement : Prop
  linearQuadraticRegulator : Type u

structure FeedbackEvidence {C : ControlSystemStateSpace} {R : ReachabilityPackage C} (F : FeedbackPackage R) where
  stabilizableClosed : F.stabilizable
  detectableClosed : F.detectable
  polePlacementClosed : F.polePlacement

def FeedbackClosed {C : ControlSystemStateSpace} {R : ReachabilityPackage C} (F : FeedbackPackage R) : Prop :=
  F.stabilizable ∧ F.detectable ∧ F.polePlacement

theorem feedback_closed_from_evidence {C : ControlSystemStateSpace} {R : ReachabilityPackage C} (F : FeedbackPackage R) (E : FeedbackEvidence F) :
    FeedbackClosed F := by
  exact And.intro E.stabilizableClosed (And.intro E.detectableClosed E.polePlacementClosed)

end ControllabilityCanonicalLaneLean
end HautevilleHouse
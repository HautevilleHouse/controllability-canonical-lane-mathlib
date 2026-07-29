import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControllabilityCanonicalLaneLean

structure FeedbackStabilization where
  gainMatrix : Matrix (Fin inputDimension) (Fin stateDimension) ℝ
  closedLoopStable : Prop
  polePlacementAchieved : Prop
  lyapunovFunctionExists : Prop
  closedLoopStableTerm : closedLoopStable
  polePlacementAchievedTerm : polePlacementAchieved
  lyapunovFunctionExistsTerm : lyapunovFunctionExists

structure StabilizationEvidence (F : FeedbackStabilization) where
  gainExists : True

def StabilizationClosed (F : FeedbackStabilization) : Prop :=
  F.closedLoopStable ∧ F.polePlacementAchieved ∧ F.lyapunovFunctionExists

theorem stabilization_closed_from_evidence (F : FeedbackStabilization) (E : StabilizationEvidence F) : StabilizationClosed F := by
  exact And.intro F.closedLoopStableTerm
    (And.intro F.polePlacementAchievedTerm F.lyapunovFunctionExistsTerm)

end ControllabilityCanonicalLaneLean
end HautevilleHouse
import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControllabilityCanonicalLaneLean

structure StateSpaceModel where
  stateDimension : Nat
  inputDimension : Nat
  stateMatrix : Matrix (Fin stateDimension) (Fin stateDimension) ℝ
  inputMatrix : Matrix (Fin stateDimension) (Fin inputDimension) ℝ
  initialCondition : Vector ℝ stateDimension
  dynamicsSmooth : Prop
  dynamicsSmoothTerm : dynamicsSmooth

structure StateSpaceEvidence (X : StateSpaceModel) where
  dimensionPositive : X.stateDimension ≥ 1
  inputDimPositive : X.inputDimension ≥ 1

def StateSpaceClosed (X : StateSpaceModel) : Prop :=
  X.dynamicsSmooth ∧ X.stateDimension ≥ 1 ∧ X.inputDimension ≥ 1

theorem state_space_closed_from_evidence (X : StateSpaceModel) (E : StateSpaceEvidence X) : StateSpaceClosed X := by
  exact And.intro X.dynamicsSmoothTerm (And.intro E.dimensionPositive E.inputDimPositive)

end ControllabilityCanonicalLaneLean
end HautevilleHouse
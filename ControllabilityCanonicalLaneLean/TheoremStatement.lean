import ControllabilityCanonicalLaneLean.FinalTheorem

namespace HautevilleHouse
namespace ControllabilityCanonicalLaneLean

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  manifoldConstrainedStatement : String
  certificateLane : String
  carriedRemainder : String

def sourceTheoremStatement : TheoremStatement :=
  { sourceKey := "controllability-canonical-lane",
    theoremName := "Controllability",
    theoremObject := "Controllability: The system is controllable if and only if the controllability matrix has full rank.",
    classicalBoundary := "Classical linear control theory; no analytic PDE body; bridge closed over admissible class.",
    manifoldConstrainedStatement := "Controllability is a property of a linear (or nonlinear) system, formalized here as a bridge-closed admissible object.",
    certificateLane := "linear_control",
    carriedRemainder := "Full rank condition on controllability matrix; classical boundary remains open."
  }

end ControllabilityCanonicalLaneLean
end HautevilleHouse
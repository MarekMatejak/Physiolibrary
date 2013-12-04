within Physiolibrary2013;
package States
  package Examples
    "Examples that demonstrate usage of the Pressure flow components"
  extends Modelica.Icons.ExamplesPackage;
    model SimpleAdaptation_NoInit
    extends Modelica.Icons.Example;

    extends States.State(state_start=internalValue_start);

     parameter Real internalValue_start=0;
     parameter Real externalValue = 10;
     parameter Real HalfTime = 1;
     Real internalValue;
    equation
      change=(Modelica.Math.log(2)/HalfTime)*(externalValue-internalValue);
      state=internalValue;
    end SimpleAdaptation_NoInit;

    model SimpleAddaptation_InitSteadyState
    extends SimpleAdaptation_NoInit(Simulation=SimulationType.InitSteadyState);
    end SimpleAddaptation_InitSteadyState;

    model SimpleAddaptation_InitialInput
    extends SimpleAdaptation_NoInit(Simulation=SimulationType.InitialInput, redeclare
          package Utilities =
            Physiolibrary2013.FilesUtilities);
    end SimpleAddaptation_InitialInput;

    model SimpleAddaptation_Equilibrated
    extends SimpleAdaptation_NoInit(Simulation=SimulationType.Equilibrated);
    end SimpleAddaptation_Equilibrated;

    model SimpleReaction_NoInit
    extends Modelica.Icons.Example;
    extends States.StateSystem;
      parameter Types.AmountOfSubstance total = 1
        "total substances amount to conserve during during equilibrated simulation";

      Chemical.NormalizedSolution A(soluteMass_start=0.9, Simulation=Simulation)
        annotation (Placement(transformation(extent={{-56,-8},{-36,12}})));
      Chemical.ChemicalReaction reaction(K=1, Simulation=Simulation,
        isSubstrateFlowIncludedInEquilibrium={false},
        isProductFlowIncludedInEquilibrium={true})
        annotation (Placement(transformation(extent={{-10,-8},{10,12}})));
      Chemical.NormalizedSolution B(soluteMass_start=total-0.9, Simulation=Simulation)
        annotation (Placement(transformation(extent={{44,-8},{64,12}})));
    equation
      total*normalizedState[1]=A.soluteMass+B.soluteMass;  //the mass conservation law

      connect(A.q_out, reaction.substrate[1]) annotation (Line(
          points={{-46,2},{-10,2}},
          color={200,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(reaction.products[1], B.q_out) annotation (Line(
          points={{10,2},{54,2}},
          color={200,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics));
    end SimpleReaction_NoInit;

    model SimpleReaction_InitSteadyState
      extends SimpleReaction_NoInit(       Simulation=SimulationType.InitSteadyState);
    end SimpleReaction_InitSteadyState;

    model SimpleReaction_InitialInput
     extends SimpleReaction_NoInit(       Simulation=SimulationType.InitialInput);
    end SimpleReaction_InitialInput;

    model SimpleReaction_Equilibrated
     extends SimpleReaction_NoInit(       Simulation=SimulationType.Equilibrated);
    end SimpleReaction_Equilibrated;
  end Examples;

  type SimulationType = enumeration(
      NoInit
        "No initialization (start values are used as guess values with fixed=false)",

      InitSteadyState
        "Steady state initialization (derivatives of states are zero)",
      InitialInput
        "Initialization using dedeclarable function ParialUtilities.readInputReal()",

      Equilibrated
        "Change of state value is zero during simulations. Differential equation in State is removed, equilibrium equations in StateSystem are added, some flow equation in OnePort-type blocks can be excluded.")
    "Enumeration defining state managment (equilibrium) and state initialization"
      annotation (Evaluate=true);

  partial model State
    "Differentiation by this blocks instead of operator 'der' allows you to switch between dynamic mode der(y)=x and steady-state mode x=0"
    import Physiolibrary2013;

    replaceable package Utilities = Physiolibrary2013.FilesUtilities
                                                                    constrainedby
      Types.Utilities
                   annotation (Dialog(group="Functions to read or store",tab="Types"));

    Real state(start=state_start)
      "This state must be connected in inherited class definition";
    Real change "Dynamic change of state value per minute";

    parameter Real state_start "State start or init value"
     annotation (Dialog(enable=false,group="Initialization"));

    parameter Physiolibrary2013.States.SimulationType
                              Simulation(start=SimulationType.NoInit)
      "Type of simulation. Normal dynamic with some initialization or equilibrated during all time during simulation."
      annotation (Dialog(group="Simulation"));

   /* parameter Boolean EQUILIBRIUM(start=false) 
    "Is the state changing during simulation?"
     annotation (Dialog(group="Equilibrium"));
*/
    parameter Boolean SAVE_RESULTS(start=false)
      "Do you want to save the comparation of original state values with simulation final state values?"
       annotation (Dialog(group="Value I/O",tab="IO"));

    parameter String storeUnit="" "Unit in Utilities input/output function"
       annotation (Dialog(group="Value I/O",tab="IO"));

    parameter String stateName="" "Name in Utilities input/output function"
       annotation (Dialog(group="Value I/O",tab="IO"));
                                  //getInstanceName()

  protected
    parameter Real defaultValue(fixed=false) "Default value of state.";
    parameter Real initialValue(fixed=false) "Initial value of state.";

  initial equation
    if Simulation == SimulationType.InitSteadyState then
      der(state)=0;
   //   change = 0;
    elseif Simulation == SimulationType.InitialInput then
      state = Utilities.readInputReal(stateName, storeUnit);
    end if;

    initialValue = state; //in causality such as initialValue:=state
    if SAVE_RESULTS then
      defaultValue = Utilities.readInputReal(stateName, storeUnit);
    else
       defaultValue = Modelica.Constants.N_A;
    end if;
  equation

    when SAVE_RESULTS and terminal() then
      Utilities.writeReal(
          stateName,
          state,
          storeUnit);
      Utilities.writeComparation(
          stateName,
          defaultValue,
          initialValue,
          state,
          storeUnit);
    end when;

    if Simulation == SimulationType.Equilibrated or (initial() and Simulation == SimulationType.InitSteadyState) then
        change = 0;
    else
      der(state) = change;
    end if;

  end State;

  partial class StateSystem

    import Modelica.Utilities.*;

    parameter SimulationType  Simulation(start=SimulationType.NoInit)
      "Type of simulation. Normal dynamic with some initialization or equilibrated during all time during simulation."
      annotation (Dialog(group="Simulation"));

    /*  
  parameter Boolean EQUILIBRIUM = false 
    "Is the state changing during simulation?"
    annotation (Dialog(group="Equilibrium"));
*/

    parameter Integer NumberOfNormalizedStates=1
      "Number of additional steady state equation of whole system"
    annotation (Dialog(enable=false,group="Equilibrium"));

    Real normalizedState[NumberOfNormalizedStates]
      "Each state must be connected to the normalized sum of partial states in inherited class definition. This variable must have always the vectors of 1.";

  /*
  parameter Modelica.Blocks.Types.Init INIT_TYPE(start=Modelica.Blocks.Types.Init.NoInit) 
    "Type of state initialization."
    annotation (Dialog(enable=false,group="Initialization"));
*/
  protected
    Real state[NumberOfNormalizedStates](each start=1)
      "In differential systems has the same meaning as the normalizedState. In steady state just stay constant.";

  initial equation
   // if (Simulation==SimulationType.InitSteadyState) then
   //    normalizedState = ones(NumberOfNormalizedStates);
   // else
       state=ones(NumberOfNormalizedStates);
   // end if;
  equation

    if Simulation == SimulationType.Equilibrated then
      normalizedState = ones(NumberOfNormalizedStates); //in steady state must be the normalized sum of internal states of the system always equal to one
      der(state)=zeros(NumberOfNormalizedStates); //this additional equation must be instead redundant equation removed by steadyMain flag of some "resistance-type" block
    else
      normalizedState = state; // ={1,1,1,..,1}. The difference from vector ones(numberOfStates) could be used as the control of solver calculation error.
    end if;

  end StateSystem;

  annotation (Documentation(revisions="<html>
<p>Licensed by Marek Matejak under the Modelica License 2</p>
<p>Copyright &copy; 2008-2013, Marek Matejak.</p>
<p><br/><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Physiolibrary2013.UsersGuide.ModelicaLicense2\">Physiolibrary2013.UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p>
</html>"));
end States;

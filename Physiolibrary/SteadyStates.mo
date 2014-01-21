within Physiolibrary;
package SteadyStates "Dynamic Simulation / Steady State"
  extends Modelica.Icons.BasesPackage;
  package Examples
    "Examples that demonstrate usage of the Pressure flow components"
  extends Modelica.Icons.ExamplesPackage;
    model SimpleAdaptation_NormalInit
    extends Modelica.Icons.Example;

    extends SteadyState(
                  state_start=internalValue_start);

     parameter Real internalValue_start=0;
     parameter Real externalValue = 10;
     parameter Real HalfTime = 1;
     Real internalValue;
    equation
      change=(Modelica.Math.log(2)/HalfTime)*(externalValue-internalValue);
      state=internalValue;
      annotation (Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end SimpleAdaptation_NormalInit;

    model SimpleAdaptation_InitSteadyState
    extends SimpleAdaptation_NormalInit(
                                    Simulation=SimulationType.InitSteadyState);
      annotation (Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end SimpleAdaptation_InitSteadyState;

    model SimpleAdaptation_ReadInit
    extends SimpleAdaptation_NormalInit(Simulation=SimulationType.ReadInit, redeclare
          package Utilities =
            Physiolibrary.FilesUtilities);
      annotation (Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end SimpleAdaptation_ReadInit;

    model SimpleAdaptation_SteadyState
    extends SimpleAdaptation_NormalInit(
                                    Simulation=SimulationType.SteadyState);
      annotation (Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end SimpleAdaptation_SteadyState;

    model SimpleReaction_NormalInit
      import Physiolibrary;
    extends Modelica.Icons.Example;
    extends Physiolibrary.SteadyStates.SteadyStateSystem;
      parameter Physiolibrary.Types.AmountOfSubstance
                                        totalSubstancesAmount = 1
        "total substances amount to conserve during during equilibrated simulation";

      Physiolibrary.Chemical.Components.Substance A(
                                                   solute_start=0.9,
          Simulation=Simulation)
        annotation (Placement(transformation(extent={{-56,-8},{-36,12}})));
      Physiolibrary.Chemical.Components.ChemicalReaction
                                              reaction(K=1)
        annotation (Placement(transformation(extent={{-10,-8},{10,12}})));
      Physiolibrary.Chemical.Components.Substance B(
                                                   solute_start= totalSubstancesAmount - 0.9,
          Simulation=Simulation,
        isDependent=true)
        annotation (Placement(transformation(extent={{44,-8},{64,12}})));
    equation
      totalSubstancesAmount*normalizedState[1]=A.solute+B.solute;  //the mass conservation law

      connect(A.q_out, reaction.substrates[1]) annotation (Line(
          points={{-46,2},{-10,2}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(reaction.products[1], B.q_out) annotation (Line(
          points={{10,2},{54,2}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics), Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end SimpleReaction_NormalInit;

    model SimpleReaction_InitSteadyState
      extends SimpleReaction_NormalInit(   Simulation=SimulationType.InitSteadyState);
      annotation (Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end SimpleReaction_InitSteadyState;

    model SimpleReaction_ReadInit
     extends SimpleReaction_NormalInit(   Simulation=SimulationType.ReadInit);
      annotation (Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end SimpleReaction_ReadInit;

    model SimpleReaction_SteadyState
     extends SimpleReaction_NormalInit(   Simulation=SimulationType.SteadyState);
      annotation (Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end SimpleReaction_SteadyState;
  end Examples;

  type SimulationType = enumeration(
      NoInit "Use start values only as a guess of state values",
      NormalInit "Start values are used for initial state values",
      ReadInit "Initialization by function Utilities.readReal('state name')",
      InitSteadyState
        "Steady state initialization (initial derivations are zeros)",
      SteadyState "Derivations are zeros during whole simulation time")
    "Initialization or Steady state options (to determine model type before simulating)"
      annotation (Evaluate=true);

  partial model SteadyState
    "Abstract class for any dynamic state calculation (for any derivation), which is driven by SimulationType option."
    //allow to switch between dynamic mode 'der(y)=x' and steady-state mode 'der(y)=0'
    import Physiolibrary;

    replaceable package Utilities = Physiolibrary.FilesUtilities    constrainedby
      Physiolibrary.Types.Utilities
                   annotation (Dialog(group="Functions to read or store",tab="IO"));

    Real state(start=state_start)
      "This state must be connected in inherited class definition";
    Real change "Dynamic change of state value per minute";

    parameter Real state_start "State start or init value"
     annotation (Dialog(enable=false,group="Initialization", tab="IO"));

    parameter Physiolibrary.SteadyStates.SimulationType
                              Simulation(start=SimulationType.NormalInit)
      "Type of simulation."
      annotation (Dialog(group="Simulation",tab="Equilibrium"));

    parameter Boolean SAVE_RESULTS = false
      "save and test final state values with original values"
       annotation (Dialog(group="Value I/O",tab="IO"));

    parameter String storeUnit="" "Unit in Utilities input/output function"
       annotation (Dialog(group="Value I/O",tab="IO"));

    parameter String stateName="" "Name in Utilities input/output function"
       annotation (Dialog(group="Value I/O",tab="IO"));
                                  //getInstanceName()

    parameter Boolean isDependent = false
      "=true, If zero flow is propagated in eqiulibrium through resistors, impedances, reactions, etc."
      annotation (Dialog(group="Simulation",tab="Equilibrium"));

  protected
    parameter Real defaultValue(fixed=false) "Default value of state.";
    parameter Real initialValue(fixed=false) "Initial value of state.";

  initial equation

    if Simulation == SimulationType.NormalInit then
      state = state_start;
    elseif Simulation == SimulationType.ReadInit then
      state = Utilities.readReal(stateName, storeUnit);
    elseif Simulation == SimulationType.InitSteadyState and not isDependent then
      der(state)=0;  //here it have the same meaning as "change = 0", because of equation "der(state) = change"
    end if;

    initialValue = state; //in causality such as initialValue:=state
    if SAVE_RESULTS then
      defaultValue = Utilities.readReal(stateName, storeUnit);
    else
      defaultValue = Modelica.Constants.N_A;
    end if;
  equation

    when SAVE_RESULTS and terminal() then
      Utilities.writeReal(
          stateName,
          state,
          storeUnit);
      Utilities.writeComparison(
          stateName,
          defaultValue,
          initialValue,
          state,
          storeUnit);
    end when;

    if Simulation <> SimulationType.SteadyState then
      der(state) = change;
    elseif not isDependent then   /*** this test and equation exclusion could be done automatically, if the solver will be so smart that it removes all this dependend equations from the total equilibrated system. The most probable form of this dependent equation in equilibrium setting is (0 = 0). ***/
       change = 0;
    end if;

    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics),Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
  end SteadyState;

  partial class SteadyStateSystem
    "Global abstract class, for additional global equations (instead of steady-state-dependent equations)"

    import Modelica.Utilities.*;

    parameter SimulationType  Simulation(start=SimulationType.NormalInit)
      "Type of simulation. Normal dynamic with some initialization or equilibrated during all time during simulation."
      annotation (Dialog(group="Simulation type", tab="Simulation"));

    parameter Integer NumberOfNormalizedStates=1
      "Number of additional steady state equation of whole system"
    annotation (Dialog(enable=false,group="Equilibrium", tab="Simulation"));

    Real normalizedState[NumberOfNormalizedStates]
      "Each state must be connected to the normalized sum of partial states in inherited class definition. This variable must have always the vectors of 1.";

  protected
    Real state[NumberOfNormalizedStates](each start=1)
      "In differential systems has the same meaning as the normalizedState. In steady state just stay constant.";

  initial equation

    state=ones(NumberOfNormalizedStates);

  equation

    if Simulation == SimulationType.SteadyState then
      normalizedState = ones(NumberOfNormalizedStates); //in steady state must be the normalized sum of internal states of the system always equal to one
      der(state)=zeros(NumberOfNormalizedStates); //this additional equations must be instead of redundant dependent equations
    else
      normalizedState = state; // ={1,1,1,..,1}. The difference from vector ones(numberOfStates) could be used as the solver calculation error vector.
    end if;

    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics), Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
  end SteadyStateSystem;

  annotation (Documentation(revisions="<html>
<p>Licensed by Marek Matejak under the Modelica License 2</p>
<p>Copyright &copy; 2008-2013, Marek Matejak, Charles University in Prague.</p>
<p><br/><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Physiolibrary.UsersGuide.ModelicaLicense2\">Physiolibrary.UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p>
</html>", info="<html>
<p>We define an <i><b>equilibrated system</b></i> (ES) as a non-differential system derived from a differential system (DS) by using zero derivations and by adding additional system equations (ASE). The number of the ASE must be the same as the number of algebraically dependent equations in the non-differential system derived from DS by setting zero derivations. The ASE describes the system from the top view mostly such as the equations of mass conservation laws.</p>
<p>Using Physiolibrary an ES can be represented by simple modification of each model, using all the parts with the &ldquo;der&rdquo; operators from the States.State class. The purpose of this is to enable the user to easily switch from the original differential system to an ES. Do not worry, each differentiable class in Physiolibrary is defined with the States.State extension.</p>
<p>To define a model as an ES the user should extend it with partial model States.StateSystem and then define the ASE as the normalizedState vector. The model works still as before, until the Simulation parameter is switched to State.SimulationType.Equilibrated. After that it often changes to one big nonlinear strong component, but without solver stiff or convergence problems.</p>
<p>This style of system implementation also brings other benefits. To see these possibilities, you have to realize that ASE must be invariances in a dynamical simulation. This is really useful for debugging.</p>
<p>For example see the model States.Examples.SimpleReaction_Equilibrated, which implements the equilibrium of the closed system as a solution of two chemical substances with a simple reversible reaction between them.</p>
<p>It is always a big challenge to nicely solve initial values of differential system. However, it should be possible to solve the ES in initial phase. And this is the idea behind the States.SimulationTypes.InitSteadyState option.</p>
</html>"));
end SteadyStates;

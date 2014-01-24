within Physiolibrary;
package SteadyStates "Dynamic Simulation / Steady State"
  extends Modelica.Icons.BasesPackage;
  package Examples
    "Examples that demonstrate usage of the Pressure flow components"
  extends Modelica.Icons.ExamplesPackage;
    model SimpleReaction_in_Equilibrium
      extends Modelica.Icons.Example;

      import Physiolibrary.Types.*;

      SteadyStates.Components.ConservationLaw
        amountOfSubstanceConservationLaw(
        n=2,
        Total(displayUnit="mol") = 1,
        Simulation=SimulationType.SteadyState)
        annotation (Placement(transformation(extent={{68,-44},{88,-24}})));
      Chemical.Components.Substance A(Simulation=SimulationType.SteadyState,
          solute_start=0.9)
        annotation (Placement(transformation(extent={{-58,-10},{-38,10}})));
      Chemical.Components.ChemicalReaction reaction(K=1)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
      Chemical.Components.Substance B(
        Simulation=SimulationType.SteadyState,
        isDependent=true,
        solute_start=0.1)
        annotation (Placement(transformation(extent={{42,-10},{62,10}})));

    equation
      connect(A.solute, amountOfSubstanceConservationLaw.fragment[1]) annotation (
          Line(
          points={{-48,-10},{-48,-39},{68,-39}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(B.solute, amountOfSubstanceConservationLaw.fragment[2]) annotation (
          Line(
          points={{52,-10},{52,-37},{68,-37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(B.q_out,reaction. products[1]) annotation (Line(
          points={{52,0},{10,0}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(A.q_out,reaction. substrates[1]) annotation (Line(
          points={{-48,0},{-10,0}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      annotation (Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),     Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics));
    end SimpleReaction_in_Equilibrium;

    model SimpleReaction2_in_Equilibrium
    extends Modelica.Icons.Example;
      import Physiolibrary.Types.*;

      Chemical.Components.Substance A(Simulation=SimulationType.SteadyState,
          solute_start=0.9)
        annotation (Placement(transformation(extent={{-44,-10},{-24,10}})));
      Chemical.Components.ChemicalReaction reaction(K=1, nP=2)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
      Chemical.Components.Substance B(
        Simulation=SimulationType.SteadyState,
        isDependent=true,
        solute_start=0.1)
        annotation (Placement(transformation(extent={{26,-12},{46,8}})));

      Chemical.Components.Substance C(
        Simulation=SimulationType.SteadyState,
        isDependent=true,
        solute_start=0.1)
        annotation (Placement(transformation(extent={{26,16},{46,36}})));

      Components.ConservationLaw B_ConservationLaw(
        n=2,
        Total(displayUnit="mol") = 1,
        Simulation=SimulationType.SteadyState)
        annotation (Placement(transformation(extent={{52,-66},{72,-46}})));
      Components.ConservationLaw C_ConservationLaw(
        n=2,
        Total(displayUnit="mol") = 1,
        Simulation=SimulationType.SteadyState)
        annotation (Placement(transformation(extent={{78,-34},{98,-14}})));
    equation
      connect(A.q_out,reaction. substrates[1]) annotation (Line(
          points={{-34,0},{-10,0}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(reaction.products[1],B. q_out) annotation (Line(
          points={{10,-0.5},{20,-0.5},{20,-2},{36,-2}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(reaction.products[2],C. q_out) annotation (Line(
          points={{10,0.5},{20,0.5},{20,26},{36,26}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(A.solute, B_ConservationLaw.fragment[1])                annotation (
          Line(
          points={{-34,-10},{-34,-61},{52,-61}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(B.solute, B_ConservationLaw.fragment[2])                annotation (
          Line(
          points={{36,-12},{36,-59},{52,-59}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(A.solute, C_ConservationLaw.fragment[1])                annotation (
          Line(
          points={{-34,-10},{-34,-29},{78,-29}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(C.solute, C_ConservationLaw.fragment[2]) annotation (Line(
          points={{36,16},{36,10},{62,10},{62,-27},{78,-27}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"), Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics));
    end SimpleReaction2_in_Equilibrium;

    model O2_in_water
    extends Modelica.Icons.Example;
      import Physiolibrary.Types.*;

    public
      Chemical.Components.Substance oxygen_dissolved(
                                                    Simulation=SimulationType.SteadyState,
          solute_start=0.000001*7.875647668393782383419689119171e-5,
        isDependent=true)
        annotation (Placement(transformation(extent={{-12,-56},{8,-36}})));
      Modelica.Blocks.Sources.Clock oxygenPartialPressure(offset=1e-06)
        annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
      Modelica.Blocks.Sources.Sine temperature(
        amplitude=10,
        freqHz=1/60,
        offset=310.15)
        annotation (Placement(transformation(extent={{-94,-28},{-74,-8}})));
      Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature
        prescribedTemperature
        annotation (Placement(transformation(extent={{-56,-28},{-36,-8}})));
      Chemical.Components.GasSolubility gasSolubility(useHeatPort=true, kH_T0=1
            /(0.0105*(1e-3)*Modelica.Constants.R*298.15))
        annotation (Placement(transformation(extent={{-12,-28},{8,-8}})));
      Chemical.Sources.UnlimitedGasStorage unlimitedGasStorage(T=295.15,
          Simulation=Physiolibrary.Types.SimulationType.SteadyState)
        annotation (Placement(transformation(extent={{-40,60},{-20,80}})));
    equation

      connect(temperature.y, prescribedTemperature.T) annotation (Line(
          points={{-73,-18},{-58,-18}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(oxygen_dissolved.q_out, gasSolubility.q_in) annotation (Line(
          points={{-2,-46},{-2,-26}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(prescribedTemperature.port, gasSolubility.heatPort) annotation (
          Line(
          points={{-36,-18},{-2,-18}},
          color={191,0,0},
          smooth=Smooth.None));
      connect(oxygenPartialPressure.y, unlimitedGasStorage.partialPressure)
        annotation (Line(
          points={{-59,70},{-40,70}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(unlimitedGasStorage.q_out, gasSolubility.q_out) annotation (Line(
          points={{-20,70},{-2,70},{-2,-8}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics),
        experiment(StopTime=100),
        __Dymola_experimentSetupOutput,
        Documentation(info="<html>
<p>Partial pressure of oxygen in air is the air pressure multiplied by the fraction of the oxygen in air. Oxygen solubility</p>
</html>", revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end O2_in_water;

    model Allosteric_Hemoglobin_MWC
    extends Modelica.Icons.Example;
      import Physiolibrary.Chemical;
      import Physiolibrary.Types.*;

    //extends Physiolibrary.SteadyStates.Interfaces.SteadyStateSystem(
    //                                         Simulation=SteadyStates.SimulationType.SteadyState);
    //=States.SimulationType.NoInit); for dynamic simulation

      parameter Physiolibrary.Types.GasSolubility alpha =  0.0105 * 1e-3
        "oxygen solubility in plasma"; // by Siggaard Andersen: 0.0105 (mmol/l)/kPa
      parameter Physiolibrary.Types.Fraction L = 7.0529*10^6
        "=[T0]/[R0] .. dissociation constant of relaxed <-> tensed change of deoxyhemoglobin tetramer";
      parameter Physiolibrary.Types.Fraction c = 0.00431555
        "=KR/KT .. ration between oxygen affinities of relaxed vs. tensed subunit";
      parameter Physiolibrary.Types.Concentration KR = 0.000671946
        "oxygen dissociation on relaxed(R) hemoglobin subunit";   //*7.875647668393782383419689119171e-5
                                                                //10.500001495896 7.8756465463794e-05

      parameter Physiolibrary.Types.Concentration KT=KR/c
        "oxygen dissociation on tensed(T) hemoglobin subunit";

    //  Physiolibrary.Types.Fraction sO2 "hemoglobin oxygen saturation";

    //  parameter Physiolibrary.Types.AmountOfSubstance totalAmountOfHemoglobin=1;
    //  Physiolibrary.Types.AmountOfSubstance totalAmountOfRforms;
    //  Physiolibrary.Types.AmountOfSubstance totalAmountOfTforms;

      Chemical.Components.Substance T0(
        stateName="T0",
        Simulation=SimulationType.SteadyState,
        solute_start=1)
        annotation (Placement(transformation(extent={{32,78},{52,98}})));

      Chemical.Components.Substance T1(
        stateName="T1",
        Simulation=SimulationType.SteadyState,
        solute_start=0)
        annotation (Placement(transformation(extent={{34,36},{54,56}})));

      Chemical.Components.Substance R1(
        stateName="R1",
        Simulation=SimulationType.SteadyState,
        solute_start=0,
        isDependent=true)
        annotation (Placement(transformation(extent={{-20,36},{0,56}})));

      Chemical.Components.Substance T2(
        stateName="T2",
        Simulation=SimulationType.SteadyState,
        solute_start=0)
        annotation (Placement(transformation(extent={{34,-10},{54,10}})));

      Chemical.Components.Substance R2(
        stateName="R2",
        Simulation=SimulationType.SteadyState,
        solute_start=0)
        annotation (Placement(transformation(extent={{-20,-10},{0,10}})));

      Chemical.Components.Substance T3(
        stateName="T3",
        Simulation=SimulationType.SteadyState,
        solute_start=0)
        annotation (Placement(transformation(extent={{34,-54},{54,-34}})));

      Chemical.Components.Substance R3(
        stateName="R3",
        Simulation=SimulationType.SteadyState,
        solute_start=0)
        annotation (Placement(transformation(extent={{-20,-54},{0,-34}})));

      Chemical.Components.Substance T4(
        stateName="T4",
        Simulation=SimulationType.SteadyState,
        solute_start=0,
        isDependent=true)
        annotation (Placement(transformation(extent={{34,-92},{54,-72}})));

      Chemical.Components.Substance R4(
        stateName="R4",
        Simulation=SimulationType.SteadyState,
        solute_start=0)
        annotation (Placement(transformation(extent={{-20,-92},{0,-72}})));

      Chemical.Components.Substance R0(
        stateName="R0",
        Simulation=SimulationType.SteadyState,
        solute_start=0)
        annotation (Placement(transformation(extent={{-20,78},{0,98}})));

      Chemical.Components.ChemicalReaction quaternaryForm(K=L)
        annotation (Placement(transformation(extent={{4,78},{24,98}})));
      Chemical.Components.ChemicalReaction oxyR1(nP=2, K=KR/4)  annotation (Placement(
            transformation(
            extent={{-10,10},{10,-10}},
            rotation=90,
            origin={-10,64})));
      Chemical.Components.ChemicalReaction oxyT1(nP=2, K=KT/4)  annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={44,64})));
      Chemical.Components.ChemicalReaction oxyR2(nP=2, K=KR/(3/2))
                                                                annotation (Placement(
            transformation(
            extent={{-10,10},{10,-10}},
            rotation=90,
            origin={-10,22})));
      Chemical.Components.ChemicalReaction oxyR3(nP=2, K=KR/(2/3))
                                                                annotation (Placement(
            transformation(
            extent={{-10,10},{10,-10}},
            rotation=90,
            origin={-10,-24})));
      Chemical.Components.ChemicalReaction oxyR4(nP=2, K=KR*4)  annotation (Placement(
            transformation(
            extent={{-10,10},{10,-10}},
            rotation=90,
            origin={-10,-66})));
      Chemical.Components.ChemicalReaction oxyT2(nP=2, K=KT/(3/2))
                                                                annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={44,22})));
      Chemical.Components.ChemicalReaction oxyT3(nP=2, K=KT/(2/3))
                                                                annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={44,-24})));
      Chemical.Components.ChemicalReaction oxyT4(nP=2, K=KT*4)  annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={44,-66})));
      Chemical.Components.ChemicalReaction quaternaryForm1(K=c*L)
        annotation (Placement(transformation(extent={{8,36},{28,56}})));
      Chemical.Components.ChemicalReaction quaternaryForm2(K=(c^2)*L)
        annotation (Placement(transformation(extent={{8,-10},{28,10}})));
      Chemical.Components.ChemicalReaction quaternaryForm3(K=(c^3)*L)
        annotation (Placement(transformation(extent={{8,-54},{28,-34}})));
      Chemical.Components.ChemicalReaction quaternaryForm4(K=(c^4)*L)
        annotation (Placement(transformation(extent={{10,-92},{30,-72}})));

      Chemical.Components.Substance oxygen_unbound(solute_start=0.000001*
            7.875647668393782383419689119171e-5, Simulation=SimulationType.SteadyState)
        annotation (Placement(transformation(extent={{-56,-36},{-36,-16}})));
      Modelica.Blocks.Sources.Clock clock(offset=1e-06)
        annotation (Placement(transformation(extent={{-94,52},{-74,72}})));
      SteadyStates.Components.ConservationLaw hemoglobinConservationLaw(
        n=10, Total(displayUnit="mol") = 1,
        Simulation=Physiolibrary.Types.SimulationType.SteadyState)
        annotation (Placement(transformation(extent={{72,-2},{92,18}})));

      Chemical.Sources.UnlimitedGasStorage O2_in_air(Simulation=Physiolibrary.Types.SimulationType.SteadyState, T=295.15)
                    annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-66,32})));
      Chemical.Components.GasSolubility gasSolubility(kH_T0=1/(0.0105*(1e-3)*
            Modelica.Constants.R*298.15), useHeatPort=false)
        annotation (Placement(transformation(extent={{-76,-6},{-56,14}})));
      Modelica.Blocks.Math.Sum oxygen_bound(k={1,1,2,2,3,3,4,4}, nin=8)
        annotation (Placement(transformation(extent={{72,-56},{82,-46}})));
      Modelica.Blocks.Math.Division sO2_ "hemoglobin oxygen saturation"
        annotation (Placement(transformation(extent={{86,-60},{96,-50}})));
      Modelica.Blocks.Math.Sum tHb(nin=10, k=4*ones(10))
        annotation (Placement(transformation(extent={{72,-70},{82,-60}})));
    equation
     // sO2 = (R1.solute + 2*R2.solute + 3*R3.solute + 4*R4.solute + T1.solute + 2*T2.solute + 3*T3.solute + 4*T4.solute)/(4*hemoglobinConservationLaw.Total);
     // totalAmountOfRforms = R0.solute + R1.solute + R2.solute + R3.solute + R4.solute;
     //  totalAmountOfTforms = T0.solute + T1.solute + T2.solute + T3.solute + T4.solute;

     //  totalAmountOfHemoglobin*normalizedState[1] = totalAmountOfRforms + totalAmountOfTforms;

      connect(quaternaryForm.products[1],T0. q_out) annotation (Line(
          points={{24,88},{42,88}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(oxyR1.products[2], oxygen_unbound.q_out)
                                          annotation (Line(
          points={{-9.5,74},{-46,74},{-46,-26}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(oxyR2.products[2], oxygen_unbound.q_out)
                                          annotation (Line(
          points={{-9.5,32},{-46,32},{-46,-26}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(oxyR3.products[2], oxygen_unbound.q_out)
                                          annotation (Line(
          points={{-9.5,-14},{-46,-14},{-46,-26}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(oxyR4.products[2], oxygen_unbound.q_out)
                                          annotation (Line(
          points={{-9.5,-56},{-46,-56},{-46,-26}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(oxyR1.substrates[1],R1. q_out) annotation (Line(
          points={{-10,54},{-10,46}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(R1.q_out,oxyR2. products[1]) annotation (Line(
          points={{-10,46},{-10,32},{-10.5,32}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(oxyR2.substrates[1],R2. q_out) annotation (Line(
          points={{-10,12},{-10,0}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(oxyR3.substrates[1],R3. q_out) annotation (Line(
          points={{-10,-34},{-10,-44}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(oxyR3.products[1],R2. q_out) annotation (Line(
          points={{-10.5,-14},{-10.5,-7},{-10,-7},{-10,0}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(R3.q_out,oxyR4. products[1]) annotation (Line(
          points={{-10,-44},{-10,-56},{-10.5,-56}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(oxyR4.substrates[1],R4. q_out) annotation (Line(
          points={{-10,-76},{-10,-82}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(oxyT1.products[1],T0. q_out) annotation (Line(
          points={{44.5,74},{44.5,88},{42,88}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(oxyT1.substrates[1],T1. q_out) annotation (Line(
          points={{44,54},{44,46}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(oxygen_unbound.q_out, oxyT1.products[2])
                                          annotation (Line(
          points={{-46,-26},{-46,74},{43.5,74}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(oxygen_unbound.q_out, oxyT2.products[2])
                                          annotation (Line(
          points={{-46,-26},{-46,32},{43.5,32}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(oxygen_unbound.q_out, oxyT3.products[2])
                                          annotation (Line(
          points={{-46,-26},{-46,-14},{43.5,-14}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(oxygen_unbound.q_out, oxyT4.products[2])
                                          annotation (Line(
          points={{-46,-26},{-46,-56},{43.5,-56}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(T1.q_out,oxyT2. products[1]) annotation (Line(
          points={{44,46},{44,32},{44.5,32}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(oxyT2.substrates[1],T2. q_out) annotation (Line(
          points={{44,12},{44,0}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(T2.q_out,oxyT3. products[1]) annotation (Line(
          points={{44,0},{44,-14},{44.5,-14}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(oxyT3.substrates[1],T3. q_out) annotation (Line(
          points={{44,-34},{44,-44}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(T3.q_out,oxyT4. products[1]) annotation (Line(
          points={{44,-44},{44,-56},{44.5,-56}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(oxyT4.substrates[1],T4. q_out) annotation (Line(
          points={{44,-76},{44,-82}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(R0.q_out,quaternaryForm. substrates[1]) annotation (Line(
          points={{-10,88},{4,88}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(R0.q_out,oxyR1. products[1]) annotation (Line(
          points={{-10,88},{-10,74},{-10.5,74}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(R1.q_out,quaternaryForm1. substrates[1]) annotation (Line(
          points={{-10,46},{8,46}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(quaternaryForm1.products[1],T1. q_out) annotation (Line(
          points={{28,46},{44,46}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(R2.q_out,quaternaryForm2. substrates[1]) annotation (Line(
          points={{-10,0},{8,0}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(quaternaryForm2.products[1],T2. q_out) annotation (Line(
          points={{28,0},{44,0}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(R3.q_out,quaternaryForm3. substrates[1]) annotation (Line(
          points={{-10,-44},{8,-44}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(quaternaryForm3.products[1],T3. q_out) annotation (Line(
          points={{28,-44},{44,-44}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(R4.q_out,quaternaryForm4. substrates[1]) annotation (Line(
          points={{-10,-82},{10,-82}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(quaternaryForm4.products[1],T4. q_out) annotation (Line(
          points={{30,-82},{44,-82}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(R4.solute, hemoglobinConservationLaw.fragment[1])        annotation (
          Line(
          points={{-10,-92},{-10,-98},{64,-98},{64,2.2},{72,2.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(T4.solute, hemoglobinConservationLaw.fragment[2])        annotation (
          Line(
          points={{44,-92},{44,-98},{64,-98},{64,2.6},{72,2.6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(R3.solute, hemoglobinConservationLaw.fragment[3])        annotation (
          Line(
          points={{-10,-54},{64,-54},{64,3},{72,3}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(T3.solute, hemoglobinConservationLaw.fragment[4])        annotation (
          Line(
          points={{44,-54},{64,-54},{64,3.4},{72,3.4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(R2.solute, hemoglobinConservationLaw.fragment[5])        annotation (
          Line(
          points={{-10,-10},{64,-10},{64,3.8},{72,3.8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(T2.solute, hemoglobinConservationLaw.fragment[6])        annotation (
          Line(
          points={{44,-10},{64,-10},{64,4.2},{72,4.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(R1.solute, hemoglobinConservationLaw.fragment[7])        annotation (
          Line(
          points={{-10,36},{64,36},{64,4.6},{72,4.6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(T1.solute, hemoglobinConservationLaw.fragment[8])        annotation (
          Line(
          points={{44,36},{64,36},{64,5},{72,5}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(R0.solute, hemoglobinConservationLaw.fragment[9])        annotation (
          Line(
          points={{-10,78},{64,78},{64,5.4},{72,5.4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(T0.solute, hemoglobinConservationLaw.fragment[10])        annotation (
         Line(
          points={{42,78},{64,78},{64,5.8},{72,5.8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(oxygen_unbound.q_out, gasSolubility.q_in) annotation (Line(
          points={{-46,-26},{-66,-26},{-66,-4}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(O2_in_air.q_out, gasSolubility.q_out) annotation (Line(
          points={{-66,22},{-66,14}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(clock.y, O2_in_air.partialPressure) annotation (Line(
          points={{-73,62},{-66,62},{-66,42}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(R1.solute, oxygen_bound.u[1]) annotation (Line(
          points={{-10,36},{64,36},{64,-51.875},{71,-51.875}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(T1.solute, oxygen_bound.u[2]) annotation (Line(
          points={{44,36},{64,36},{64,-51.625},{71,-51.625}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(R2.solute, oxygen_bound.u[3]) annotation (Line(
          points={{-10,-10},{64,-10},{64,-51.375},{71,-51.375}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(T2.solute, oxygen_bound.u[4]) annotation (Line(
          points={{44,-10},{64,-10},{64,-51.125},{71,-51.125}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(R3.solute, oxygen_bound.u[5]) annotation (Line(
          points={{-10,-54},{64,-54},{64,-50.875},{71,-50.875}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(T3.solute, oxygen_bound.u[6]) annotation (Line(
          points={{44,-54},{64,-54},{64,-50.625},{71,-50.625}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(R4.solute, oxygen_bound.u[7]) annotation (Line(
          points={{-10,-92},{-10,-98},{64,-98},{64,-50.375},{71,-50.375}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(T4.solute, oxygen_bound.u[8]) annotation (Line(
          points={{44,-92},{44,-98},{64,-98},{64,-50.125},{71,-50.125}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(oxygen_bound.y, sO2_.u1) annotation (Line(
          points={{82.5,-51},{84,-51},{84,-52},{85,-52}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(sO2_.u2, tHb.y) annotation (Line(
          points={{85,-58},{84,-58},{84,-65},{82.5,-65}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(R0.solute, tHb.u[1]) annotation (Line(
          points={{-10,78},{64,78},{64,-65.9},{71,-65.9}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(T0.solute, tHb.u[2]) annotation (Line(
          points={{42,78},{64,78},{64,-65.7},{71,-65.7}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(R1.solute, tHb.u[3]) annotation (Line(
          points={{-10,36},{64,36},{64,-65.5},{71,-65.5}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(T1.solute, tHb.u[4]) annotation (Line(
          points={{44,36},{64,36},{64,-65.3},{71,-65.3}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(R2.solute, tHb.u[5]) annotation (Line(
          points={{-10,-10},{64,-10},{64,-65.1},{71,-65.1}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(T2.solute, tHb.u[6]) annotation (Line(
          points={{44,-10},{64,-10},{64,-64.9},{71,-64.9}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(R3.solute, tHb.u[7]) annotation (Line(
          points={{-10,-54},{64,-54},{64,-64.7},{71,-64.7}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(T3.solute, tHb.u[8]) annotation (Line(
          points={{44,-54},{64,-54},{64,-64.5},{71,-64.5}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(R4.solute, tHb.u[9]) annotation (Line(
          points={{-10,-92},{-10,-98},{64,-98},{64,-64.3},{71,-64.3}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(T4.solute, tHb.u[10]) annotation (Line(
          points={{44,-92},{44,-98},{64,-98},{64,-64.1},{71,-64.1}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics),
        experiment(StopTime=10000),
        __Dymola_experimentSetupOutput,
        Documentation(info="<html>
<p>To understand the model is necessary to study the principles of MWC allosteric transitions first published by </p>
<p>Monod,Wyman,Changeux (1965). &QUOT;On the nature of allosteric transitions: a plausible model.&QUOT; Journal of molecular biology 12(1): 88-118.</p>
<p><br/>In short it is about binding oxygen to hemoglobin.</p>
<p>Oxgen are driven by its partial pressure using clock source - from very little pressure to pressure of 10kPa.</p>
<p>(Partial pressure of oxygen in air is the air pressure multiplied by the fraction of the oxygen in air.)</p>
<p>Hemoglobin was observed (by Perutz) in two structuraly different forms R and T.</p>
<p>These forms are represented by blocks T0..T4 and R0..R4, where the suffexed index means the number of oxygen bounded to the form.</p>
<p><br/>In equilibrated model can be four chemical reactions removed and the results will be the same, but dynamics will change a lot. ;)</p>
<p>If you remove the quaternaryForm1,quaternaryForm2,quaternaryForm3,quaternaryForm4 then the model in equilibrium will be exactly the same as in MWC article.</p>
<p><br/>Parameters was fitted to data of Severinghaus article from 1979. (For example at pO2=26mmHg is oxygen saturation sO2 = 48.27 &percnt;).</p>
</html>", revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end Allosteric_Hemoglobin_MWC;

    model Allosteric_Hemoglobin2_MWC
      "Allosteric hemoglobin model implemented by Speciation blocks"
      import Physiolibrary.Types.*;
     extends Modelica.Icons.Example;

      parameter Physiolibrary.Types.GasSolubility alpha =  0.0105 * 1e-3
        "oxygen solubility in plasma"; // by Siggaard Andersen: 0.0105 (mmol/l)/kPa
      parameter Physiolibrary.Types.Fraction L = 7.0529*10^6
        "=[T0]/[R0] .. dissociation constant of relaxed <-> tensed change of deoxyhemoglobin tetramer";
      parameter Physiolibrary.Types.Fraction c = 0.00431555
        "=KR/KT .. ration between oxygen affinities of relaxed vs. tensed subunit";
      parameter Physiolibrary.Types.Concentration KR = 0.000671946
        "oxygen dissociation on relaxed(R) hemoglobin subunit";   //*7.875647668393782383419689119171e-5
                                                                //10.500001495896 7.8756465463794e-05

      parameter Physiolibrary.Types.Concentration KT=KR/c
        "oxygen dissociation on tensed(T) hemoglobin subunit";

      Physiolibrary.Types.Fraction sO2 "hemoglobin oxygen saturation";

      parameter Physiolibrary.Types.AmountOfSubstance totalAmountOfHemoglobin=0.001;

      Physiolibrary.Chemical.Components.ChemicalReaction
                                                quaternaryForm(K=L)
        annotation (Placement(transformation(extent={{-4,-98},{16,-78}})));
      Physiolibrary.Chemical.Components.Speciation
                         R0_in_R(numberOfSubunit={4})
        annotation (Placement(transformation(extent={{-40,-90},{-60,-70}})));
      Physiolibrary.Chemical.Components.Speciation
                         T0_in_T(numberOfSubunit={4})
        annotation (Placement(transformation(extent={{76,-90},{56,-70}})));
      Physiolibrary.Chemical.Components.Substance
                          OxyRHm(solute_start=0, Simulation=SimulationType.SteadyState)
        "Oxygenated subunit in R structure of hemoglobin tetramer"
        annotation (Placement(transformation(extent={{-98,-36},{-78,-16}})));
      Physiolibrary.Chemical.Components.ChemicalReaction
                       oxygenation_R(K=KR, nP=2)
        annotation (Placement(transformation(extent={{-70,-36},{-50,-16}})));
      Physiolibrary.Chemical.Components.Substance
                          DeoxyRHm(Simulation=SimulationType.SteadyState,
        isDependent=true,
        solute_start=1e-08)
        "Deoxygenated subunit in R structure of hemoglobin tetramer"
        annotation (Placement(transformation(extent={{-42,-36},{-22,-16}})));
      Physiolibrary.Chemical.Components.Substance
                          OxyTHm(solute_start=0, Simulation=SimulationType.SteadyState)
        "Oxygenated subunit in T structure of hemoglobin tetramer"
        annotation (Placement(transformation(extent={{22,-36},{42,-16}})));
      Physiolibrary.Chemical.Components.ChemicalReaction
                       oxygenation_T(K=KT, nP=2)
        annotation (Placement(transformation(extent={{50,-36},{70,-16}})));
      Physiolibrary.Chemical.Components.Substance
                          DeoxyTHm(solute_start=totalAmountOfHemoglobin - 0.00001,
          Simulation=SimulationType.SteadyState)
        "Deoxygenated subunit in T structure of hemoglobin tetramer"
        annotation (Placement(transformation(extent={{78,-36},{98,-16}})));

      Physiolibrary.Chemical.Components.Substance
                          oxygen_unbound(Simulation=SimulationType.SteadyState, solute_start=0.000001
            *7.875647668393782383419689119171e-5,
        isDependent=true)
        annotation (Placement(transformation(extent={{-4,-2},{16,18}})));
      Modelica.Blocks.Sources.Clock clock(offset=1e-06)
        annotation (Placement(transformation(extent={{-40,74},{-20,94}})));
      Modelica.Blocks.Math.Add add annotation (Placement(transformation(
            extent={{-4,-4},{4,4}},
            rotation=270,
            origin={-54,-54})));
      Modelica.Blocks.Math.Add add1 annotation (Placement(transformation(
            extent={{-4,-4},{4,4}},
            rotation=270,
            origin={62,-54})));
      Physiolibrary.SteadyStates.Components.ConservationLaw
        hemoglobinConservationLaw(Total(displayUnit="mol") = 1, n=2,
        Simulation=SimulationType.SteadyState)
        annotation (Placement(transformation(extent={{-6,-54},{14,-34}})));
      Chemical.Sources.UnlimitedGasStorage O2_in_air(Simulation=Physiolibrary.Types.SimulationType.SteadyState, T=295.15)
                    annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={6,66})));
      Chemical.Components.GasSolubility gasSolubility(kH_T0=1/(0.0105*(1e-3)*
            Modelica.Constants.R*298.15), useHeatPort=false)
        annotation (Placement(transformation(extent={{-4,28},{16,48}})));
    equation

      sO2 = (OxyRHm.solute + OxyTHm.solute)/totalAmountOfHemoglobin;

      connect(R0_in_R.species, quaternaryForm.substrates[1])
                                                       annotation (Line(
          points={{-60,-88},{-4,-88}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(quaternaryForm.products[1], T0_in_T.species)
                                                     annotation (Line(
          points={{16,-88},{46,-88},{46,-88},{56,-88}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(OxyRHm.q_out, oxygenation_R.substrates[1])
                                               annotation (Line(
          points={{-88,-26},{-70,-26}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(oxygenation_R.products[1], DeoxyRHm.q_out)
                                             annotation (Line(
          points={{-50,-26.5},{-42,-26.5},{-42,-26},{-32,-26}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(OxyTHm.q_out, oxygenation_T.substrates[1])
                                               annotation (Line(
          points={{32,-26},{50,-26}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(oxygenation_T.products[1], DeoxyTHm.q_out)
                                             annotation (Line(
          points={{70,-26.5},{80,-26.5},{80,-26},{88,-26}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(DeoxyRHm.q_out, R0_in_R.subunitSpecies[1])
                                                   annotation (Line(
          points={{-32,-26},{-50,-26},{-50,-70}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(T0_in_T.subunitSpecies[1], DeoxyTHm.q_out)
                                                   annotation (Line(
          points={{66,-70},{82,-70},{82,-26},{88,-26}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(oxygenation_R.products[2], oxygen_unbound.q_out) annotation (Line(
          points={{-50,-25.5},{-44,-25.5},{-44,8},{6,8}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(oxygenation_T.products[2], oxygen_unbound.q_out) annotation (Line(
          points={{70,-25.5},{76,-25.5},{76,8},{6,8}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(add.y, R0_in_R.totalSubunitAmount[1])
                                              annotation (Line(
          points={{-54,-58.4},{-54,-66},{-54,-80},{-58,-80}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(add1.y, T0_in_T.totalSubunitAmount[1])
                                               annotation (Line(
          points={{62,-58.4},{62,-66},{62,-80},{58,-80}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(OxyTHm.solute, add1.u2) annotation (Line(
          points={{32,-36},{32,-42},{59.6,-42},{59.6,-49.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add1.u1, DeoxyTHm.solute) annotation (Line(
          points={{64.4,-49.2},{64.4,-42},{88,-42},{88,-36}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(DeoxyRHm.solute, add.u1) annotation (Line(
          points={{-32,-36},{-32,-36},{-32,-44},{-51.6,-44},{-51.6,-49.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(OxyRHm.solute, add.u2) annotation (Line(
          points={{-88,-36},{-88,-44},{-56.4,-44},{-56.4,-49.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add.y, hemoglobinConservationLaw.fragment[1]) annotation (Line(
          points={{-54,-58.4},{-54,-60},{-16,-60},{-16,-49},{-6,-49}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add1.y, hemoglobinConservationLaw.fragment[2]) annotation (Line(
          points={{62,-58.4},{62,-62},{-14,-62},{-14,-47},{-6,-47}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(oxygen_unbound.q_out,gasSolubility. q_in) annotation (Line(
          points={{6,8},{6,30}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(O2_in_air.q_out,gasSolubility. q_out) annotation (Line(
          points={{6,56},{6,48}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(clock.y, O2_in_air.partialPressure) annotation (Line(
          points={{-19,84},{6,84},{6,76}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics),
        experiment(StopTime=10000),
        __Dymola_experimentSetupOutput,
        Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end Allosteric_Hemoglobin2_MWC;

    model CardiovascularSystem_GCG_SteadyState
      "Cardiovascular part of Guyton-Coleman-Granger's model from 1972"
       extends Modelica.Icons.Example;

       import Physiolibrary.Types.*;
       import Physiolibrary.Hydraulic;

      Hydraulic.Components.ElasticVessel pulmonaryVeins(
        volume_start(displayUnit="l") = 0.0004,
        ZeroPressureVolume(displayUnit="l") = 0.0004,
        Compliance(displayUnit="l/mmHg") = 7.5006157584566e-08,
        Simulation=SimulationType.SteadyState)
        annotation (Placement(transformation(extent={{-6,76},{14,96}})));
      Hydraulic.Components.ElasticVessel pulmonaryArteries(
        ZeroPressureVolume(displayUnit="l") = 0.00030625,
        Compliance(displayUnit="l/mmHg") = 3.6002955640592e-08,
        volume_start(displayUnit="l") = 0.00038,
        Simulation=SimulationType.SteadyState)
        annotation (Placement(transformation(extent={{-72,76},{-52,96}})));
      Hydraulic.Components.Conductor pulmonary(
                                              cond(displayUnit="l/(mmHg.min)")=
             4.1665920538226e-08)
        annotation (Placement(transformation(extent={{-40,76},{-20,96}})));
      Hydraulic.Components.ElasticVessel arteries(
        volume_start(displayUnit="l") = 0.00085,
        ZeroPressureVolume(displayUnit="l") = 0.000495,
        Compliance(displayUnit="l/mmHg") = 2.6627185942521e-08,
        Simulation=SimulationType.SteadyState)
        annotation (Placement(transformation(extent={{4,-44},{24,-24}})));
      Hydraulic.Components.ElasticVessel veins(
        Compliance(displayUnit="l/mmHg") = 6.1880080007267e-07,
        volume_start(displayUnit="l") = 0.00325,
        ZeroPressureVolume(displayUnit="l") = 0.00295,
        Simulation=SimulationType.SteadyState)
        annotation (Placement(transformation(extent={{-74,-44},{-54,-24}})));

      Hydraulic.Components.Conductor nonMuscle(
                                              cond(displayUnit="l/(mmHg.min)")=
             3.5627924852669e-09)
        annotation (Placement(transformation(extent={{-34,-44},{-14,-24}})));
      Hydraulic.Sensors.PressureMeasure pressureMeasure
        annotation (Placement(transformation(extent={{-88,30},{-68,50}})));
      Hydraulic.Components.Pump rightHeart(useSolutionFlowInput=true)
        annotation (Placement(transformation(extent={{-66,10},{-46,30}})));
      Physiolibrary.Types.Constants.VolumeFlowRateConst RNormalCO(k(displayUnit="l/min") = 8.3333333333333e-05)
        annotation (Placement(transformation(extent={{-70,44},{-62,52}})));
      Hydraulic.Sensors.PressureMeasure pressureMeasure1
        annotation (Placement(transformation(extent={{-18,28},{2,48}})));
      Hydraulic.Components.Pump leftHeart(useSolutionFlowInput=true)
        annotation (Placement(transformation(extent={{6,10},{26,30}})));
      Physiolibrary.Types.Constants.VolumeFlowRateConst LNormalCO(k(displayUnit="l/min") = 8.3333333333333e-05)
        annotation (Placement(transformation(extent={{2,44},{10,52}})));
      Hydraulic.Components.Conductor kidney(
                                           cond(displayUnit="l/(mmHg.min)")=
          1.4126159678427e-09)
        annotation (Placement(transformation(extent={{-34,-62},{-14,-42}})));
      Hydraulic.Components.Conductor muscle(
                                           cond(displayUnit="l/(mmHg.min)")=
          1.3001067314658e-09)
        annotation (Placement(transformation(extent={{-34,-26},{-14,-6}})));
      Hydraulic.Components.Conductor largeVeins(
                                               cond(displayUnit="l/(mmHg.min)")=
             1.6888886482791e-07)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-94,-6})));
      Hydraulic.Components.ElasticVessel rightAtrium(
        volume_start(displayUnit="l") = 0.0001,
        ZeroPressureVolume(displayUnit="l") = 0.0001,
        Compliance(displayUnit="l/mmHg") = 3.7503078792283e-08,
        Simulation=SimulationType.SteadyState,
        isDependent=true)
        annotation (Placement(transformation(extent={{-92,10},{-72,30}})));
      Physiolibrary.Blocks.Factors.Input2Effect rightStarling(data={{-6,0,0},{-3,0.15,0.104},{-1,0.52,
            0.48},{2,1.96,0.48},{4,2.42,0.123},{8,2.7,0}})
        "At filling pressure 0mmHg (because external thorax pressure is -4mmHg) is normal cardiac output (effect=1)."
        annotation (Placement(transformation(extent={{-66,26},{-46,46}})));
      Physiolibrary.Blocks.Factors.Input2Effect leftStarling(data={{-4,0,0},{-1,0.72,0.29},{0,1.01,
            0.29},{3,1.88,0.218333},{10,2.7,0}})
        "At filling pressure -0.0029mmHg (because external thorax pressure is -4mmHg) is normal cardiac output (effect=1)."
        annotation (Placement(transformation(extent={{6,26},{26,46}})));
      Components.ConservationLaw bloodVolume(
        n=5,
        Total=0.005,
        Simulation=Types.SimulationType.SteadyState)
        annotation (Placement(transformation(extent={{68,-14},{88,6}})));
    equation
      connect(pulmonaryArteries.q_in,pulmonary. q_in) annotation (Line(
          points={{-62,86},{-40,86}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pulmonary.q_out,pulmonaryVeins. q_in) annotation (Line(
          points={{-20,86},{4,86}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(veins.q_in, nonMuscle.q_in)  annotation (Line(
          points={{-64,-34},{-34,-34}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(nonMuscle.q_out, arteries.q_in)  annotation (Line(
          points={{-14,-34},{14,-34}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(rightHeart.q_out,pulmonaryArteries. q_in) annotation (Line(
          points={{-46,20},{-38,20},{-38,86},{-62,86}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(leftHeart.q_in,pulmonaryVeins. q_in) annotation (Line(
          points={{6,20},{-14,20},{-14,62},{22,62},{22,86},{4,86}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(leftHeart.q_out,arteries. q_in) annotation (Line(
          points={{26,20},{32,20},{32,-34},{14,-34}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pressureMeasure.q_in,rightHeart. q_in) annotation (Line(
          points={{-82,34},{-82,20},{-66,20}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pressureMeasure1.q_in,pulmonaryVeins. q_in) annotation (Line(
          points={{-12,32},{-14,32},{-14,62},{22,62},{22,86},{4,86}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(muscle.q_out, arteries.q_in) annotation (Line(
          points={{-14,-16},{0,-16},{0,-34},{14,-34}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(kidney.q_out, arteries.q_in) annotation (Line(
          points={{-14,-52},{0,-52},{0,-34},{14,-34}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(kidney.q_in, nonMuscle.q_in) annotation (Line(
          points={{-34,-52},{-44,-52},{-44,-34},{-34,-34}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(muscle.q_in, nonMuscle.q_in) annotation (Line(
          points={{-34,-16},{-44,-16},{-44,-34},{-34,-34}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(veins.q_in, largeVeins.q_out) annotation (Line(
          points={{-64,-34},{-94,-34},{-94,-16}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(largeVeins.q_in, rightAtrium.q_in) annotation (Line(
          points={{-94,4},{-94,20},{-82,20}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(rightAtrium.q_in, rightHeart.q_in) annotation (Line(
          points={{-82,20},{-66,20}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(RNormalCO.y, rightStarling.yBase) annotation (Line(
          points={{-61,48},{-56,48},{-56,38}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(LNormalCO.y, leftStarling.yBase) annotation (Line(
          points={{11,48},{16,48},{16,38}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pressureMeasure.q_in, rightAtrium.q_in) annotation (Line(
          points={{-82,34},{-82,20}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pulmonaryArteries.volume, bloodVolume.fragment[4]) annotation (
          Line(
          points={{-62,76},{-62,68},{54,68},{54,-7.2},{68,-7.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pulmonaryVeins.volume, bloodVolume.fragment[5]) annotation (Line(
          points={{4,76},{4,70},{56,70},{56,-6.4},{68,-6.4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pressureMeasure.actualPressure, rightStarling.u) annotation (Line(
          points={{-72,36},{-64,36}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pressureMeasure1.actualPressure, leftStarling.u) annotation (Line(
          points={{-2,34},{-2,36},{8,36}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(rightAtrium.volume, bloodVolume.fragment[1]) annotation (Line(
          points={{-82,10},{-82,-72},{56,-72},{56,-9.6},{68,-9.6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(veins.volume, bloodVolume.fragment[2]) annotation (Line(
          points={{-64,-44},{-64,-70},{54,-70},{54,-8.8},{68,-8.8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(arteries.volume, bloodVolume.fragment[3]) annotation (Line(
          points={{14,-44},{14,-68},{52,-68},{52,-8},{68,-8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(rightStarling.y, rightHeart.solutionFlow) annotation (Line(
          points={{-56,32},{-56,24}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(leftStarling.y, leftHeart.solutionFlow) annotation (Line(
          points={{16,32},{16,24}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics), Documentation(info="<html>
<p>Cardiovascular subsystem in famous Guyton-Coleman-Granger model from 1972. </p>
<p><br/>Model, all parameters and all initial values are from article: </p>
<p>A.C. Guyton, T.G. Coleman, H.J. Granger (1972). &QUOT;Circulation: overall regulation.&QUOT; Annual review of physiology 34(1): 13-44.</p>
</html>", revisions="<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end CardiovascularSystem_GCG_SteadyState;

  end Examples;

  package Components
    extends Modelica.Icons.Package;

    model ConservationLaw "System Mass or Energy conservation law"
      extends Interfaces.SteadyStateSystem; //(Simulation=Types.SimulationType.SteadyState);
      extends Physiolibrary.Icons.ConservationLaw;

      parameter Integer n "Number of mass/energy fragments";

      Modelica.Blocks.Interfaces.RealInput fragment[n] "Mass/Energy fragment"
        annotation (Placement(transformation(extent={{-120,-60},{-80,-20}}),
            iconTransformation(extent={{-120,-60},{-80,-20}})));

      parameter Real Total "Total mass/energy if useTotalAsInput=false"
        annotation (Dialog(enable=not useTotalInput));

    //  parameter Types.Fraction firstFragmentFraction = 0.5
    //    "Guess of first fragment fraction from Total for homotopy operator.";
    equation
      Total*normalizedState[1] = sum(fragment);

      //fragment[1] = homotopy( actual=Total*normalizedState[1] - sum(fragment[i] for i in 2:n), simplified=Total*normalizedState[1]*firstFragmentFraction);

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={Text(
              extent={{-160,-110},{160,-140}},
              lineColor={0,0,255},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid,
              textString="%name")}), Diagram(coordinateSystem(preserveAspectRatio=false,
              extent={{-100,-100},{100,100}}), graphics),
        Documentation(info="<html>
<p>This block was design to be used instead of obcure inheritance from SteadyState.Interfaces.SteadyStateSystem, but for unknown reason it does not work in OpenModelica 1.9.0 nor in Dymola 2014 for more complex models in steady state. </p>
</html>"));
    end ConservationLaw;

  end Components;

  package Interfaces
    extends Modelica.Icons.InterfacesPackage;

    partial model SteadyState
      "Abstract class for any dynamic state calculation (for any derivation), which is driven by SimulationType option."
      //allow to switch between dynamic mode 'der(y)=x' and steady-state mode 'der(y)=0'
      import Physiolibrary.Types.*;

      replaceable package Utilities = Physiolibrary.FilesUtilities    constrainedby
        Physiolibrary.Types.Utilities
                     annotation (Dialog(group="Functions to read or store",tab="IO"));

      Real state(start=state_start, stateSelect=StateSelect.prefer)
        "This state must be connected in inherited class definition";

      Real change "Dynamic change of state value per minute";

      parameter Real state_start "State start or init value"
       annotation (Dialog(enable=false,group="Initialization", tab="IO"));

      parameter SimulationType  Simulation(start=SimulationType.NormalInit)
        "Dynamic with Initialization or Steady State"
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

      if Simulation == SimulationType.NormalInit and not isDependent then
        state = state_start;
      elseif Simulation == SimulationType.ReadInit and not isDependent then
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

    partial model SteadyStates
      "Abstract class for any dynamic state calculation (for any derivation), which is driven by SimulationType option."
      //allow to switch between dynamic mode 'der(y)=x' and steady-state mode 'der(y)=0'
      import Physiolibrary.Types.*;

      replaceable package Utilities = Physiolibrary.FilesUtilities    constrainedby
        Physiolibrary.Types.Utilities
                     annotation (Dialog(group="Functions to read or store",tab="IO"));

      parameter Integer n "Number of states"
        annotation (Dialog(group="Simulation"));

      Real state[n](start=state_start, stateSelect=StateSelect.prefer)
        "This state must be connected in inherited class definition";

      Real change[n] "Dynamic change of state value per minute";

      parameter Real state_start[n] "State start or init value"
       annotation (Dialog(enable=false,group="Initialization", tab="IO"));

      parameter SimulationType  Simulation(start=SimulationType.NormalInit)
        "Dynamic with Initialization or Steady State"
        annotation (Dialog(group="Simulation",tab="Equilibrium"));

      parameter Boolean SAVE_RESULTS = false
        "save and test final state values with original values"
         annotation (Dialog(group="Value I/O",tab="IO"));

      parameter String storeUnit[n]=fill("",n)
        "Unit in Utilities input/output function"
         annotation (Dialog(group="Value I/O",tab="IO"));

      parameter String stateName[n]=fill("",n)
        "Name in Utilities input/output function"
         annotation (Dialog(group="Value I/O",tab="IO"));
                                    //getInstanceName()

      parameter Boolean isDependent[n]= fill(false,n)
        "=true, If zero flow is propagated in eqiulibrium through resistors, impedances, reactions, etc."
        annotation (Dialog(group="Simulation",tab="Equilibrium"));

    protected
      parameter Real defaultValue[n](fixed=false) "Default value of state.";
      parameter Real initialValue[n](fixed=false) "Initial value of state.";

    initial equation
      for i in 1:n loop
      if Simulation == SimulationType.NormalInit and not isDependent[i] then
        state[i] = state_start[i];
      elseif Simulation == SimulationType.ReadInit and not isDependent[i] then
          state[i] = Utilities.readReal(stateName[i], storeUnit[i]);
      elseif Simulation == SimulationType.InitSteadyState and not isDependent[i] then
        der(state[i])=0;  //here it have the same meaning as "change = 0", because of equation "der(state) = change"
      end if;

      initialValue = state; //in causality such as initialValue:=state
      if SAVE_RESULTS then
        defaultValue[i] = Utilities.readReal(stateName[i], storeUnit[i]);
      else
        defaultValue[i] = Modelica.Constants.N_A;
      end if;
      end for;
    equation

      when SAVE_RESULTS and terminal() then
        for i in 1:n loop
        Utilities.writeReal(
            stateName[i],
            state[i],
            storeUnit[i]);
        Utilities.writeComparison(
            stateName[i],
            defaultValue[i],
            initialValue[i],
            state[i],
            storeUnit[i]);
        end for;
      end when;

      if Simulation <> SimulationType.SteadyState then
        der(state) = change;
      else
        for i in 1:n loop
          if not isDependent[n] then   /*** this test and equation exclusion could be done automatically, if the solver will be so smart that it removes all this dependend equations from the total equilibrated system. The most probable form of this dependent equation in equilibrium setting is (0 = 0). ***/
            change[i] = 0;
          end if;
        end for;
      end if;

      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics),Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end SteadyStates;

    partial class SteadyStateSystem
      "Global abstract class, for additional global state equations"

      import Physiolibrary.Types.*;

      parameter SimulationType  Simulation(start=SimulationType.NormalInit)
        "Dynamic with Initialization or Steady State"
        annotation (Dialog(group="Simulation type", tab="Simulation"));

      parameter Integer NumberOfDependentStates=1
        "Number of additional steady state equation of the system"
      annotation (Dialog(enable=false,group="Equilibrium", tab="Simulation"));

      Real normalizedState[NumberOfDependentStates]
        "Normalized independent masses of the system/Normalized independent energies of the system/... This variables must always equals to ones.";

    protected
      Real state[NumberOfDependentStates](each start=1)
        "In differential systems has the same meaning as the normalizedState. In steady state has no meaning.";

    initial equation

      state=ones(NumberOfDependentStates);

    equation

      if Simulation == SimulationType.SteadyState then
        normalizedState = ones(NumberOfDependentStates); //add additional global steady-state equations
        der(state)=zeros(NumberOfDependentStates);       //remove 'state' from system calculations
      else
        normalizedState = state; //nothing special, just definition of 'state' variable

        //Correct definition of normalizedState should fulfill the equation 'normalizedState=ones(NumberOfDependentStates)' during simulation.
        //The difference from vector 'ones(NumberOfDependentStates)' could be used as the solver calculation error vector.
      end if;

      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics), Documentation(revisions="<html>
<p><i>2013-2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end SteadyStateSystem;
  end Interfaces;
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

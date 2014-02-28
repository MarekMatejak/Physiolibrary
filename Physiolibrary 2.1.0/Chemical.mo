within Physiolibrary;
package Chemical "Domain with Molar Concentration and Molar Flow"
 extends Modelica.Icons.Package;
  package Examples
    "Examples that demonstrate usage of the Pressure flow components"
  extends Modelica.Icons.ExamplesPackage;

    model SimpleReaction

       extends Modelica.Icons.Example;

       import Physiolibrary.Chemical.Components.*;

      Substance         A(solute_start=0.9)
        annotation (Placement(transformation(extent={{-56,-8},{-36,12}})));
      ChemicalReaction          reaction(K=1)
        annotation (Placement(transformation(extent={{-10,-8},{10,12}})));
      Substance         B(solute_start=0.1)
        annotation (Placement(transformation(extent={{42,-8},{62,12}})));
    equation

      connect(B.q_out, reaction.products[1]) annotation (Line(
          points={{52,2},{10,2}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(A.q_out, reaction.substrates[1]) annotation (Line(
          points={{-46,2},{-10,2}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics), Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),
        experiment(StopTime=1e-007),
        __Dymola_experimentSetupOutput);
    end SimpleReaction;

    model SimpleReaction2
       extends Modelica.Icons.Example;

      import Physiolibrary.Chemical.Components.*;

      Substance         A(solute_start=0.9)
        annotation (Placement(transformation(extent={{-40,-8},{-20,12}})));
      ChemicalReaction          reaction(K=1, nP=2)
        annotation (Placement(transformation(extent={{-6,-8},{14,12}})));
      Substance         B(solute_start=0.1)
        annotation (Placement(transformation(extent={{36,-8},{56,12}})));
      Substance         C(solute_start=0.1)
        annotation (Placement(transformation(extent={{36,16},{56,36}})));
    equation

      connect(A.q_out, reaction.substrates[1]) annotation (Line(
          points={{-30,2},{-6,2}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(reaction.products[1], B.q_out) annotation (Line(
          points={{14,1.5},{24,1.5},{24,2},{46,2}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(reaction.products[2], C.q_out) annotation (Line(
          points={{14,2.5},{24,2.5},{24,26},{46,26}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics), Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),
        experiment(StopTime=1e-009),
        __Dymola_experimentSetupOutput);
    end SimpleReaction2;

    model ExothermicReaction

       extends Modelica.Icons.Example;
      import Physiolibrary.Chemical;

      Components.Substance         A(solute_start=0.9)
        annotation (Placement(transformation(extent={{-56,-8},{-36,12}})));
      Components.ChemicalReaction
                                reaction(K=1,
        useHeatPort=true,
        dH=-1000,
        kf=1)
        annotation (Placement(transformation(extent={{-10,-8},{10,12}})));
      Components.Substance         B(solute_start=0.1)
        annotation (Placement(transformation(extent={{44,-8},{64,12}})));
      Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor
        annotation (Placement(transformation(extent={{12,-58},{32,-38}})));
      Physiolibrary.Thermal.Sources.UnlimitedHeat unlimitedHeat(T=310.15)
        annotation (Placement(transformation(extent={{74,-58},{54,-38}})));
    equation

      connect(B.q_out, reaction.products[1]) annotation (Line(
          points={{54,2},{10,2}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(A.q_out, reaction.substrates[1]) annotation (Line(
          points={{-46,2},{-10,2}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(reaction.heatPort, heatFlowSensor.port_a) annotation (Line(
          points={{0,2},{0,-48},{12,-48}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(unlimitedHeat.port, heatFlowSensor.port_b) annotation (Line(
          points={{54,-48},{32,-48}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics), Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),
        experiment(StopTime=5),
        __Dymola_experimentSetupOutput);
    end ExothermicReaction;

    model Allosteric_Hemoglobin_MWC
    extends Modelica.Icons.Example;
      import Physiolibrary.Chemical.*;
      import Physiolibrary.Types.*;

    extends Physiolibrary.SteadyStates.Interfaces.SteadyStateSystem(
                                             Simulation=SimulationType.SteadyState);

      parameter Temperature T=310.15 "Temperature";
    //  parameter GasSolubility alpha =  Modelica.Constants.R*298.15 * 0.0105 * 1e-3
    //    "oxygen solubility in plasma";
                                       // by Siggaard Andersen: 0.0105 (mmol/l)/kPa

      parameter Fraction L = 7.0529*10^6
        "=[T0]/[R0] .. dissociation constant of relaxed <-> tensed change of deoxyhemoglobin tetramer";
      parameter Fraction c = 0.00431555
        "=KR/KT .. ration between oxygen affinities of relaxed vs. tensed subunit";
      parameter Concentration KR = 0.000671946
        "oxygen dissociation on relaxed(R) hemoglobin subunit";   //*7.875647668393782383419689119171e-5
                                                                //10.500001495896 7.8756465463794e-05

      parameter Concentration KT=KR/c
        "oxygen dissociation on tensed(T) hemoglobin subunit";

      Fraction sO2 "hemoglobin oxygen saturation";

      parameter AmountOfSubstance totalAmountOfHemoglobin=1;
      AmountOfSubstance totalAmountOfRforms;
      AmountOfSubstance totalAmountOfTforms;

      Components.Substance                       T0(stateName="T0",Simulation=SimulationType.SteadyState,
        solute_start=1)
        annotation (Placement(transformation(extent={{32,78},{52,98}})));

      Components.Substance                       T1(stateName="T1",Simulation=SimulationType.SteadyState,
        solute_start=0)
        annotation (Placement(transformation(extent={{34,36},{54,56}})));

      Components.Substance                       R1(stateName="R1",Simulation=SimulationType.SteadyState,
        solute_start=0,
        isDependent=true)
        annotation (Placement(transformation(extent={{-20,36},{0,56}})));

      Components.Substance                       T2(stateName="T2",Simulation=SimulationType.SteadyState,
        solute_start=0)
        annotation (Placement(transformation(extent={{34,-10},{54,10}})));

      Components.Substance                       R2(stateName="R2",Simulation=SimulationType.SteadyState,
        solute_start=0)
        annotation (Placement(transformation(extent={{-20,-10},{0,10}})));

      Components.Substance                       T3(stateName="T3",Simulation=SimulationType.SteadyState,
        solute_start=0)
        annotation (Placement(transformation(extent={{34,-54},{54,-34}})));

      Components.Substance                       R3(stateName="R3",Simulation=SimulationType.SteadyState,
        solute_start=0)
        annotation (Placement(transformation(extent={{-20,-54},{0,-34}})));

      Components.Substance                       T4(stateName="T4",Simulation=SimulationType.SteadyState,
        solute_start=0,
        isDependent=true)
        annotation (Placement(transformation(extent={{34,-92},{54,-72}})));

      Components.Substance                       R4(stateName="R4",Simulation=SimulationType.SteadyState,
        solute_start=0)
        annotation (Placement(transformation(extent={{-20,-92},{0,-72}})));

      Components.Substance                       R0(stateName="R0",Simulation=SimulationType.SteadyState,
        solute_start=0)
        annotation (Placement(transformation(extent={{-20,78},{0,98}})));

      Components.ChemicalReaction               quaternaryForm(K=L)
        annotation (Placement(transformation(extent={{4,78},{24,98}})));
      Components.ChemicalReaction                oxyR1(nP=2, K=KR/4)
                                                                annotation (Placement(
            transformation(
            extent={{-10,10},{10,-10}},
            rotation=90,
            origin={-10,64})));
      Components.ChemicalReaction                oxyT1(nP=2, K=KT/4)
                                                                annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={44,64})));
      Components.ChemicalReaction                oxyR2(nP=2, K=KR/(3/2))
                                                                annotation (Placement(
            transformation(
            extent={{-10,10},{10,-10}},
            rotation=90,
            origin={-10,22})));
      Components.ChemicalReaction                oxyR3(nP=2, K=KR/(2/3))
                                                                annotation (Placement(
            transformation(
            extent={{-10,10},{10,-10}},
            rotation=90,
            origin={-10,-24})));
      Components.ChemicalReaction                oxyR4(nP=2, K=KR*4)
                                                                annotation (Placement(
            transformation(
            extent={{-10,10},{10,-10}},
            rotation=90,
            origin={-10,-66})));
      Components.ChemicalReaction                oxyT2(nP=2, K=KT/(3/2))
                                                                annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={44,22})));
      Components.ChemicalReaction                oxyT3(nP=2, K=KT/(2/3))
                                                                annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={44,-24})));
      Components.ChemicalReaction                oxyT4(nP=2, K=KT*4)
                                                                annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={44,-66})));
      Components.ChemicalReaction               quaternaryForm1(K=c*L)
        annotation (Placement(transformation(extent={{8,36},{28,56}})));
      Components.ChemicalReaction               quaternaryForm2(K=(c^2)*L)
        annotation (Placement(transformation(extent={{8,-10},{28,10}})));
      Components.ChemicalReaction               quaternaryForm3(K=(c^3)*L)
        annotation (Placement(transformation(extent={{8,-54},{28,-34}})));
      Components.ChemicalReaction               quaternaryForm4(K=(c^4)*L)
        annotation (Placement(transformation(extent={{10,-92},{30,-72}})));

      Components.Substance oxygen_unbound(                                      solute_start=0.000001
            *7.875647668393782383419689119171e-5,
        Simulation=SimulationType.SteadyState)
        annotation (Placement(transformation(extent={{-56,-36},{-36,-16}})));
      Components.GasSolubility
                            partialPressure(T=310.15, kH_T0(displayUnit="(mmol/l)/kPa at 25degC")=
             0.026029047188736)                                       annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={-70,-8})));
      Modelica.Blocks.Sources.Clock clock(offset=1e-06)
        annotation (Placement(transformation(extent={{-94,52},{-74,72}})));

      Sources.UnlimitedGasStorage oxygen_in_air(
        Simulation=Physiolibrary.Types.SimulationType.SteadyState,
        usePartialPressureInput=true,
        T=310.15)                                annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-70,30})));
    equation
       sO2 = (R1.solute + 2*R2.solute + 3*R3.solute + 4*R4.solute + T1.solute + 2*T2.solute + 3*T3.solute + 4*T4.solute)/(4*totalAmountOfHemoglobin);
       totalAmountOfRforms = R0.solute + R1.solute + R2.solute + R3.solute + R4.solute;
       totalAmountOfTforms = T0.solute + T1.solute + T2.solute + T3.solute + T4.solute;

       totalAmountOfHemoglobin*normalizedState[1] = totalAmountOfRforms + totalAmountOfTforms;

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
      connect(partialPressure.q_in, oxygen_unbound.q_out) annotation (Line(
          points={{-70,-16},{-70,-26},{-46,-26}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(partialPressure.q_out, oxygen_in_air.q_out)
                                                annotation (Line(
          points={{-70,2},{-70,20}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(clock.y, oxygen_in_air.partialPressure) annotation (Line(
          points={{-73,62},{-70,62},{-70,40}},
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

     extends Physiolibrary.SteadyStates.Interfaces.SteadyStateSystem(
                                              Simulation=SimulationType.SteadyState);

    //  parameter GasSolubility alpha =  0.0105 * 1e-3 "oxygen solubility in plasma";   // by Siggaard Andersen: 0.0105 (mmol/l)/kPa

      parameter Fraction L = 7.0529*10^6
        "=[T0]/[R0] .. dissociation constant of relaxed <-> tensed change of deoxyhemoglobin tetramer";
      parameter Fraction c = 0.00431555
        "=KR/KT .. ration between oxygen affinities of relaxed vs. tensed subunit";
      parameter Concentration KR = 0.000671946
        "oxygen dissociation on relaxed(R) hemoglobin subunit";   //*7.875647668393782383419689119171e-5
                                                                //10.500001495896 7.8756465463794e-05

      parameter Concentration KT=KR/c
        "oxygen dissociation on tensed(T) hemoglobin subunit";

      Fraction sO2 "hemoglobin oxygen saturation";

      parameter AmountOfSubstance totalAmountOfHemoglobin=0.001;

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
            origin={-66,-54})));
      Modelica.Blocks.Math.Add add1 annotation (Placement(transformation(
            extent={{-4,-4},{4,4}},
            rotation=270,
            origin={52,-54})));
      Sources.UnlimitedGasStorage oxygen_in_air(
        Simulation=Physiolibrary.Types.SimulationType.SteadyState,
        usePartialPressureInput=true,
        T=310.15)                                annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={6,60})));
      Components.GasSolubility
                            partialPressure1(T=310.15, kH_T0(displayUnit="(mmol/l)/kPa at 25degC")=
             0.026029047188736)                                       annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={6,32})));
    equation
      totalAmountOfHemoglobin*normalizedState[1] = OxyRHm.solute + DeoxyRHm.solute + OxyTHm.solute + DeoxyTHm.solute;

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
          points={{-66,-58.4},{-66,-80},{-58,-80}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(add1.y, T0_in_T.totalSubunitAmount[1])
                                               annotation (Line(
          points={{52,-58.4},{52,-80},{58,-80}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(OxyTHm.solute, add1.u2) annotation (Line(
          points={{32,-36},{32,-42},{49.6,-42},{49.6,-49.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add1.u1, DeoxyTHm.solute) annotation (Line(
          points={{54.4,-49.2},{54.4,-42},{88,-42},{88,-36}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(DeoxyRHm.solute, add.u1) annotation (Line(
          points={{-32,-36},{-32,-44},{-63.6,-44},{-63.6,-49.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(OxyRHm.solute, add.u2) annotation (Line(
          points={{-88,-36},{-88,-44},{-68.4,-44},{-68.4,-49.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(partialPressure1.q_out, oxygen_in_air.q_out)
                                                annotation (Line(
          points={{6,42},{6,50}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(partialPressure1.q_in, oxygen_unbound.q_out) annotation (Line(
          points={{6,24},{6,8}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(clock.y, oxygen_in_air.partialPressure) annotation (Line(
          points={{-19,84},{6,84},{6,70}},
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

    model MichaelisMenten "Basic enzyme kinetics"
      import Physiolibrary;
      extends Modelica.Icons.Example;
      extends Physiolibrary.SteadyStates.Interfaces.SteadyStateSystem(
                                                 Simulation=Types.SimulationType.SteadyState);
       import Physiolibrary.Types.*;

      Physiolibrary.Chemical.Sources.UnlimitedSolutionStorage
                       P(Conc=0)
        annotation (Placement(transformation(extent={{92,-12},{72,8}})));
      Physiolibrary.Chemical.Sources.UnlimitedSolutionStorage
                       S(Conc=0.1)
        annotation (Placement(transformation(extent={{-94,-12},{-74,8}})));

         parameter AmountOfSubstance tE=0.01 "total amount of enzyme";
         parameter Real k_cat(unit="1/s", displayUnit="1/min")= 1
        "forward rate of second reaction";
         parameter Physiolibrary.Types.Concentration Km = 0.1
        "Michaelis constant = substrate concentration at rate of half Vmax";

          Physiolibrary.Chemical.Components.Substance
                              ES(                       solute_start=0,
            Simulation=SimulationType.SteadyState)
            annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
          Physiolibrary.Chemical.Components.Substance
                              E(                       solute_start=tE,
            isDependent=true,
            Simulation=SimulationType.SteadyState)
            annotation (Placement(transformation(extent={{-10,38},{10,58}})));
          Components.ChemicalReaction
                           chemicalReaction(nS=2,
            K=2/Km,
            kf=2*k_cat/Km)
            annotation (Placement(transformation(extent={{-42,-10},{-22,10}})));
          Components.ChemicalReaction
                           chemicalReaction1(nP=2,
            K=Modelica.Constants.inf,
            kf=k_cat)
            annotation (Placement(transformation(extent={{24,-10},{44,10}})));

         // Real v(unit="mol/s", displayUnit="mmol/min") "test of MM equation";
    equation
          normalizedState[1]*tE = E.solute + ES.solute;

         //Michaelis-Menton: v=((E.q_out.conc + ES.q_out.conc)*k_cat)*S.concentration/(Km+S.concentration);

      connect(S.q_out, chemicalReaction.substrates[1]) annotation (Line(
          points={{-74,-2},{-60,-2},{-60,-0.5},{-42,-0.5}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(chemicalReaction1.products[1], P.q_out) annotation (Line(
          points={{44,-0.5},{54,-0.5},{54,-2},{72,-2}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(E.q_out, chemicalReaction.substrates[2]) annotation (Line(
          points={{0,48},{-50,48},{-50,0.5},{-42,0.5}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(E.q_out, chemicalReaction1.products[2]) annotation (Line(
          points={{0,48},{50,48},{50,0.5},{44,0.5}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(chemicalReaction.products[1], ES.q_out) annotation (Line(
          points={{-22,0},{0,0}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(ES.q_out, chemicalReaction1.substrates[1]) annotation (Line(
          points={{0,0},{24,0}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
          annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),     graphics),
                  Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics), Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),
        experiment(StopTime=1),
        __Dymola_experimentSetupOutput);
    end MichaelisMenten;

  end Examples;

  package Components
    extends Modelica.Icons.Package;
    model Substance "Substance accumulation in solvent"
      extends Physiolibrary.Icons.Substance;
      extends Chemical.Interfaces.ConditionalSolventVolume;
      extends Physiolibrary.SteadyStates.Interfaces.SteadyState(
      state(nominal=NominalSolute),
      change(nominal=NominalSolute/60),
      state_start=solute_start,
      storeUnit="mmol");

      parameter Physiolibrary.Types.AmountOfSubstance
                                        solute_start(nominal=NominalSolute) = 0
        "Initial solute amount in compartment"
         annotation (Dialog(group="Initialization"));

      Physiolibrary.Types.RealIO.AmountOfSubstanceOutput solute(nominal=
          NominalSolute) "Current amount of solute"
        annotation (Placement(transformation(extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,-100})));

      parameter Physiolibrary.Types.AmountOfSubstance
                                        NominalSolute = 0.001
        "Numerical scale. Default is from mmol to mol, but for some substances such as hormones, hydronium or hydroxide ions can be much smaller."
          annotation (Dialog(tab="Solver",group="Numerical support of very small concentrations"));

      Physiolibrary.Chemical.Interfaces.ChemicalPort_b            q_out
        "Flux from/to compartment" annotation (Placement(transformation(extent={{-10,
                -10},{10,10}})));
    equation
      q_out.conc = solute/volume; //TODO: solute/(solvent+solute)?

      state = solute; // der(solute)=q_out.q
      change = q_out.q;

                                                                                                        annotation (choicesAllMatching=true,
                  Diagram(coordinateSystem(preserveAspectRatio=false,extent={{-100,
                -100},{100,100}}), graphics), Icon(coordinateSystem(
              preserveAspectRatio=false,extent={{-100,-100},{100,100}}),
            graphics={                                    Text(
              extent={{-22,-102},{220,-136}},
              lineColor={0,0,255},
              textString="%name")}),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end Substance;

    model ChemicalReaction "Chemical Reaction"
      import Physiolibrary;

      parameter Real K = 1
        "Fixed dissociation constant [SI-unit] if useDissociationConstantInput=false"
        annotation (Dialog(enable=not useDissociationConstantInput));

      parameter Real kf = 10^8 "Forward reaction rate coefficient [SI unit]"
        annotation (Dialog(group="Parameters")); //forward K*(10^rateLevel) at temperature TK

      parameter Integer nS=1 "Number of substrates types"
        annotation (Dialog(group="Substrates", tab="Reaction type"));
      parameter Integer nP=1 "Number of products types"
        annotation (Dialog(group="Products", tab="Reaction type"));

      parameter Modelica.SIunits.StoichiometricNumber s[nS]=ones(nS)
        "Stoichiometric reaction coefficient for substrates"
        annotation (Dialog(group="Substrates", tab="Reaction type"));
      parameter Modelica.SIunits.ActivityCoefficient as[nS]=ones(nS)
        "Activity coefficients of substrates"
        annotation (Dialog(group="Substrates", tab="Reaction type"));

      parameter Modelica.SIunits.StoichiometricNumber p[nP]=ones(nP)
        "Stoichiometric reaction coefficients for products"
        annotation (Dialog(group="Products", tab="Reaction type"));
       parameter Modelica.SIunits.ActivityCoefficient ap[nP]=ones(nP)
        "Activity coefficients of products"
        annotation (Dialog(group="Products", tab="Reaction type"));

     extends Chemical.Interfaces.ConditionalHeatPort;

      parameter Physiolibrary.Types.Temperature TK=298.15 "Base temperature"
        annotation (Dialog(tab="Temperature dependence"));

      parameter Modelica.SIunits.MolarInternalEnergy dH=0
        "Standard Enthalpy Change (negative=exothermic)"
        annotation (Dialog(tab="Temperature dependence"));

    extends Chemical.Interfaces.ConditionalSolventVolume;

      parameter Boolean useDissociationConstantInput = false
        "=true, if external dissociation ratio is used"
      annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

      Modelica.Blocks.Interfaces.RealInput dissociationConstant(start=K) = KBase if useDissociationConstantInput
        "Dissociation constant [SI-unit]" annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,40})));

      Physiolibrary.Chemical.Interfaces.ChemicalPort_b
                                products[nP] "Products"
                             annotation (Placement(
            transformation(extent={{90,-10},{110,10}})));

      Physiolibrary.Chemical.Interfaces.ChemicalPort_a
                                substrates[nS] "Substrates"
                                annotation (Placement(
            transformation(extent={{-110,-10},{-90,10}})));  /*s[nS]*/
    protected
      Physiolibrary.Types.MolarFlowRate rr "Reaction molar flow rate";

      Real KaT "Dissociation constant in current temperature";
      Real KBase "dissociation constant at TK";

    equation
      if not useDissociationConstantInput then
        KBase = K;
      end if;

      KaT = KBase * Modelica.Math.exp(((-dH)/Modelica.Constants.R)*(1/T_heatPort - 1/TK));  //Hoff's equation

      rr = kf*volume*(product((as.*substrates.conc).^s) - (1/KaT)*product((ap.*products.conc).^p));  //Elementary first-order rate kinetics - the main equation

      lossHeat = -dH*rr; //dH<0 => Exothermic => lossHeat>0, Endothermic otherwise

      rr*s = substrates.q;
      rr*p = -products.q;

      annotation (
        Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,100}}),
                            graphics={
            Rectangle(
              extent={{-100,-30},{100,30}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-128,-66},{142,-40}},
              textString="%name",
              lineColor={0,0,255}),
            Polygon(
              points={{-60,6},{-60,4},{54,4},{54,4},{18,14},{18,6},{-60,6}},
              lineColor={0,0,0},
              smooth=Smooth.None,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{54,-8},{54,-6},{-60,-6},{-60,-6},{-24,-16},{-24,-8},{54,-8}},
              lineColor={0,0,0},
              smooth=Smooth.None,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid)}),
                                      Diagram(coordinateSystem(preserveAspectRatio=false,
                       extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>",     info="<html>
<pre>The Chemical reaction

Schema of chemical reaction:
s[1]*S[1] + .. + s[nS]*S[nS]  &LT;-&GT;  p[1]*P[1] + .. + p[nP]*P[nP] 

where
S are substrates, 
s are stochiometric coefficients of substrates,  
P are products, 
p are stochiometric coefficients of products.  

In equilibrium (at zero reaction flow) it fullfil, the dissociation constant K equation:
<p><br/><code>K = <font style=\"color: #ff0000; \">&nbsp;product</font>(P.^p) / <font style=\"color: #ff0000; \">product</font>(S.^s)</code></p>
<pre> 
The dissociation constant is dependent on temperature by Hoff&apos;s equation using reaction enthalphy change parameter dH.
<p><br/><code>The forward rate is kf*volume*<font style=\"color: #ff0000; \">product</font>(S.^s), where kf is forward rate coefficient. </code></p>
<p><code>The backward rate is (kf/K)*<font style=\"color: #ff0000; \">product</font>(P.^p), where backward rate coefficient kb is kf/K.</code></p>
<pre> 

It works in two modes:


1. Dynamic mode, if EQUILIBRIUM=false.

2. Equilibrium mode, if EQUILIBRIUM=true and all Substances are in STEADY mode. But some zero flows must be removed instead of additional steady-state equation. </pre>
</html>"),        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics));
    end ChemicalReaction;

    model Diffusion "Solute diffusion"
      extends Physiolibrary.Icons.Diffusion;
      extends Physiolibrary.Chemical.Interfaces.OnePort;

      parameter Boolean useConductanceInput = false
        "=true, if external conductance value is used"
        annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

      parameter Types.DiffusionPermeability Conductance=0
        "Diffusion conductance if useConductanceInput=false"
        annotation (Dialog(enable=not useConductanceInput));

    protected
      Types.DiffusionPermeability c;
    public
      Types.RealIO.DiffusionPermeabilityInput conductance = c if useConductanceInput
        annotation (Placement(transformation(extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,40})));
    equation
      if not useConductanceInput then
        c=Conductance;
      end if;

       q_in.q = c * (q_in.conc - q_out.conc);

       annotation (Icon(graphics),                 Documentation(revisions="<html>
<p><i>2009-2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>",     info="<html>
<p><a name=\"firstHeading\">The diffusion conductance parameter can be estimated using the F</a>ick&apos;s laws of diffusion: </p>
<p>J= -D*(dPhi)/dx</p>
<p>where</p>
<p>J is molar flow of solute per area [mol/(m2.s)]. </p>
<p>D is diffusion constant [m2/s]. </p>
<p>dPhi is concentration gradient [mol/m3].</p>
<p>dx is length of diffusion [m].</p>
<p><br/>So for example of the diffusion through membrane the parameter cond = <code>(D/membrameThicknes)*membraneArea.</code></p>
</html>"),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                100}}), graphics));
    end Diffusion;

    model GasSolubility "Henry's law of gas solubility in liquid."
       //q_in is dissolved in liquid and q_out is in gaseous solution"

      extends Physiolibrary.Icons.GasSolubility;
      extends Physiolibrary.Chemical.Interfaces.ConditionalHeatPort;

      parameter Physiolibrary.Types.DiffusionPermeability solubilityRateCoef=10^8
        "The rate constant of incoming gas to solution";

      Physiolibrary.Types.GasSolubility kH
        "Henry's law coefficient such as liquid-gas concentration ratio";

      parameter Physiolibrary.Types.GasSolubility kH_T0
        "Henry's law coefficient at base temperature (i.e. in (mmol/l)/mmHg at 37degC: aO2=1.34e-3, aCO2=22.9e-3, ..)";
      parameter Physiolibrary.Types.Temperature T0=298.15
        "Base temperature for kH_T0"
         annotation (Dialog(tab="Temperature dependence"));
      parameter Physiolibrary.Types.Temperature C(displayUnit="K") = 1700
        "Gas-liquid specific constant for Van't Hoff's change of kH (i.e.: O2..1700K,CO2..2400K,N2..1300K,CO..1300K,..)"
        annotation (Dialog(tab="Temperature dependence"));

      Physiolibrary.Chemical.Interfaces.ChemicalPort_b
                                q_out "Gaseous solution"
                             annotation (Placement(
            transformation(extent={{-10,90},{10,110}})));

      Physiolibrary.Chemical.Interfaces.ChemicalPort_a
                                q_in "Dissolved in liquid"
                                annotation (Placement(
            transformation(extent={{-10,-90},{10,-70}})));
    equation
      q_in.q + q_out.q = 0;

      kH = kH_T0 * Modelica.Math.exp(C* (1/T_heatPort - 1/T0)); // Van't Hoff equation

      // equilibrium:  liquid.conc = kH * gas.conc;
      q_out.q = solubilityRateCoef*(kH * q_out.conc - q_in.conc); //negative because of outflow

      lossHeat = C*Modelica.Constants.R*q_out.q; //negative = heat are comsumed when change from liquid to gas

       annotation (Documentation(revisions="<html>
<p><i>2009-2012</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>", info="<html>
<p><h4><font color=\"#008000\">Henry's law of The solubility of a Gas in Liquid</font></h4></p>
<p>Henry&apos;s law at equilibrium: The concentration of a gas in a liquid is proportional to the partial pressure of the gas.</p>
<p>p=k*c</p>
<p>where<b> p</b> is the partial pressure of the gas, <b>k</b> is a Henry&apos;s law constant and<b> c</b> is a small concentration of the gas in the liquid.</p>
<p>Henry&apos;s coefficient <b>k</b> depends on temperature and on the identities of all substances present in solution! </p>
</html>"));
    end GasSolubility;

    model Degradation "Degradation of solute"
      extends Interfaces.ConditionalSolventVolume;

      Physiolibrary.Chemical.Interfaces.ChemicalPort_a
                                q_in "Degraded solute outflow"
                                annotation (Placement(
            transformation(extent={{-110,-10},{-90,10}})));

      parameter Physiolibrary.Types.Time HalfTime
        "Degradation half time. The time after which will remain half of initial concentration in the defined volume when no other generation nor clearence nor degradation exist.";

      Physiolibrary.Types.VolumeFlowRate Clearance;
    equation
      Clearance = volume*Modelica.Math.log(2)/HalfTime;
      q_in.q = Clearance*q_in.conc;

     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
                            graphics={
            Rectangle(
              extent={{-100,-50},{100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-80,26},{62,0},{-80,-26},{-80,26}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-150,-100},{150,-60}},
              textString="%name",
              lineColor={0,0,255}),
            Text(
              extent={{-100,-30},{100,-50}},
              lineColor={0,0,0},
              textString="half-time=%HalfTime s"),
            Polygon(
              points={{-68,24},{-68,-24},{-58,-22},{-58,22},{-68,24}},
              lineColor={0,0,127},
              smooth=Smooth.None,
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-46,20},{-46,-20},{-36,-18},{-36,18},{-46,20}},
              lineColor={0,0,127},
              smooth=Smooth.None,
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-24,16},{-24,-16},{-14,-14},{-14,14},{-24,16}},
              lineColor={0,0,127},
              smooth=Smooth.None,
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-2,12},{-2,-12},{8,-10},{8,10},{-2,12}},
              lineColor={0,0,127},
              smooth=Smooth.None,
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{20,8},{20,-8},{30,-6},{30,6},{20,8}},
              lineColor={0,0,127},
              smooth=Smooth.None,
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{40,4},{40,-4},{50,-2},{50,2},{40,4}},
              lineColor={0,0,127},
              smooth=Smooth.None,
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid)}),
                                      Diagram(coordinateSystem(preserveAspectRatio=false,
                       extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<table>
<tr>
<td>Author:</td>
<td>Marek Matejak</td>
</tr>
<tr>
<td>Copyright:</td>
<td>In public domains</td>
</tr>
<tr>
<td>By:</td>
<td>Charles University, Prague</td>
</tr>
<tr>
<td>Date of:</td>
<td>2013</td>
</tr>
</table>
</html>"),        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics));
    end Degradation;

    model Clearance "Clearance with or without solvent outflow"

      Physiolibrary.Chemical.Interfaces.ChemicalPort_a
                                q_in "solute outflow"
                                annotation (Placement(
            transformation(extent={{-110,-10},{-90,10}})));

      parameter Boolean useSolventFlow = false
        "=true, if clearence is expressed from outflow"
      annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

      parameter Physiolibrary.Types.VolumeFlowRate Clearance=0
        "Clearance of solute if useSolventFlow=false"
        annotation (Dialog(enable=not useSolventFlow));

      Physiolibrary.Types.RealIO.VolumeFlowRateInput solventFlow(start=Clearance/K) = clearance/K if useSolventFlow
        "solvent outflow"
       annotation (Placement(transformation(extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,40})));

      parameter Real K(unit="1")=1
        "Coefficient such that Clearance = K*solventFlow if useSolventFlow=true"
        annotation (Dialog(enable=useSolventFlow));

      Physiolibrary.Types.VolumeFlowRate clearance;
    equation
      if not useSolventFlow then
         clearance=Clearance;
      end if;  //otherwise: clearance=K*solventFlow;

      q_in.q = clearance*q_in.conc;

    //  assert(clearance>=-Modelica.Constants.eps, "Clearance can not be negative!");

     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={
            Rectangle(
              extent={{-100,-50},{100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-80,25},{80,0},{-80,-25},{-80,25}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-150,-100},{150,-60}},
              textString="%name",
              lineColor={0,0,255}),
            Text(
              extent={{-100,-30},{100,-50}},
              lineColor={0,0,0},
              textString="K=%K")}),   Diagram(coordinateSystem(preserveAspectRatio=false,
                       extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<table>
<tr>
<td>Author:</td>
<td>Marek Matejak</td>
</tr>
<tr>
<td>Copyright:</td>
<td>In public domains</td>
</tr>
<tr>
<td>By:</td>
<td>Charles University, Prague</td>
</tr>
<tr>
<td>Date of:</td>
<td>2009</td>
</tr>
</table>
</html>"),        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics));
    end Clearance;

    model Stream "Flow of whole solution"
      extends Physiolibrary.Chemical.Interfaces.OnePort;
      extends Physiolibrary.Chemical.Interfaces.ConditionalSolutionFlow;

    equation
      q_in.q = if
                 (q>0) then q*q_in.conc else q*q_out.conc;

     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={
            Rectangle(
              extent={{-100,-50},{100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              origin={0,0},
              rotation=360),
            Polygon(
              points={{-80,25},{80,0},{-80,-25},{-80,25}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              origin={0,0},
              rotation=360),
            Text(
              extent={{-150,-20},{150,20}},
              textString="%name",
              lineColor={0,0,255},
              origin={2,-74},
              rotation=180)}),
         Diagram(coordinateSystem(preserveAspectRatio=false,
                       extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<table>
<tr>
<td>Author:</td>
<td>Marek Matejak</td>
</tr>
<tr>
<td>Copyright:</td>
<td>In public domains</td>
</tr>
<tr>
<td>By:</td>
<td>Charles University, Prague</td>
</tr>
<tr>
<td>Date of:</td>
<td>2009</td>
</tr>
</table>
</html>",     info="<html>
<p><h4><font color=\"#008000\">Bidirectional mass flow by concentration</font></h4></p>
<p>Possible field values: </p>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"0.1\"><tr>
<td></td>
<td><p align=\"center\"><h4>forward flow</h4></p></td>
<td><p align=\"center\"><h4>backward flow</h4></p></td>
</tr>
<tr>
<td><p align=\"center\"><h4>solutionFlow</h4></p></td>
<td><p align=\"center\">&GT;=0</p></td>
<td><p align=\"center\">&LT;=0</p></td>
</tr>
<tr>
<td><p align=\"center\"><h4>q_in.q</h4></p></td>
<td><p align=\"center\">=solutionFlow*q_in.conc</p></td>
<td><p align=\"center\">=-q_out.q</p></td>
</tr>
<tr>
<td><p align=\"center\"><h4>q_out.q</h4></p></td>
<td><p align=\"center\">=-q_in.q</p></td>
<td><p align=\"center\">=solutionFlow*q_out.conc</p></td>
</tr>
</table>
<br/>
</html>"));
    end Stream;

    model SolutePump "Prescribed solute flow"
      extends Physiolibrary.Chemical.Interfaces.OnePort;
      extends Physiolibrary.Chemical.Interfaces.ConditionalSoluteFlow;

    equation
      q_in.q = q;

     annotation (
        Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{
                100,100}}), graphics={
            Rectangle(
              extent={{-100,-50},{100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              origin={0,0},
              rotation=360),
            Polygon(
              points={{-80,25},{80,0},{-80,-25},{-80,25}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid,
              origin={0,0},
              rotation=360),
            Text(
              extent={{-150,-20},{150,20}},
              lineColor={0,0,255},
              origin={-10,-76},
              rotation=360,
              textString="%name")}),  Diagram(coordinateSystem(preserveAspectRatio=false,
                       extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics));
    end SolutePump;

    model Speciation
      "Chemical species definition by independent binding sides of macromolecule"
      extends Physiolibrary.Icons.Speciation;

      extends Physiolibrary.SteadyStates.Interfaces.SteadyStateSystem(
                                               Simulation=Types.SimulationType.SteadyState, NumberOfDependentStates=NumberOfSubunitTypes-1);
      extends Physiolibrary.Chemical.Interfaces.ConditionalSolventVolume;

      import Physiolibrary.Types.*;

      parameter Integer NumberOfSubunitTypes=1
        "Number of subunit types occuring in macromolecule";

      Physiolibrary.Chemical.Interfaces.ChemicalPort_a species
        "Defined macromolecule form"                                                        annotation (Placement(
            transformation(extent={{90,-90},{110,-70}})));
      Physiolibrary.Chemical.Interfaces.ChemicalPort_a subunitSpecies[NumberOfSubunitTypes]
        "Definid species of macromolecule subunit types (in NormalSolventVolume)"
                                                                                                            annotation (Placement(
            transformation(extent={{-10,90},{10,110}})));

      parameter Real numberOfSubunit[NumberOfSubunitTypes]
        "Number of identical subunits instances in macromolecule. First should be non-zero.";

    protected
      Real fractions[NumberOfSubunitTypes];
    public
      Physiolibrary.Types.RealIO.AmountOfSubstanceInput totalSubunitAmount[NumberOfSubunitTypes]
        annotation (Placement(transformation(extent={{-20,-20},{20,20}},
            rotation=180,
            origin={80,0})));
      Physiolibrary.Types.RealIO.AmountOfSubstanceOutput totalSubsystemAmount
       annotation (Placement(
            transformation(extent={{-10,-10},{10,10}},
            rotation=270,
            origin={0,-80})));                                                             //(start=1e-8)
    equation
      totalSubsystemAmount = totalSubunitAmount[1]/numberOfSubunit[1];

      fractions = if
                    (totalSubsystemAmount < Modelica.Constants.eps) then zeros(NumberOfSubunitTypes) else subunitSpecies.conc ./ (totalSubunitAmount/volume);

      species.conc = (totalSubsystemAmount/volume)*product(fractions.^numberOfSubunit);

      for i in 2:NumberOfSubunitTypes loop
             normalizedState[i-1]*totalSubsystemAmount*numberOfSubunit[i] = totalSubunitAmount[i];
      end for;

      subunitSpecies.q = -species.q * numberOfSubunit;

      annotation (defaultComponentName="macromoleculeSpecie_in_macromoleculeGroup",
        Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>",     info="<html>
<p>This block identify one specific chemical form (one chosen chemical species - called <i>specie</i>) of one macromolecule defined by forms of its subunits.</p>
<p>Only main connector called <b>species </b>is designed for inflow and outflow of macromolecule to/from <i>system</i>. The concentration in this connector is the concentration of its specific <i>specie.</i></p>
<p>Connectors <b> subunitSpecies[:] </b>represent specific forms of the macromolecule subunit types. If the sununit type occures n-times in macromolecule, the inflow is n-time greater than the inflow of macromolecule.</p>
<p><br/>Initial total concentrations of subunits must must be set to be right distribution of total macromolecule concentration. So the ratios between subunit concentrations are the ratios of their occurence in macromolecule. In equilibrium are this proporties fullfiled.</p>
<p>    </p>
<p><br/>For example: If the macromolecule has four identical independent subunits and each subunit can occur in two form F1 and F2, then the concentration of macromolecule <i>specie </i>composed only from four subunits in form F1 is <b>species.conc=</b>conc*fF1^4. </p>
<p>Where:</p>
<p>conc is totat concentration of macromolecule in <i>system</i> accumulated by <b>species.q</b>,</p>
<p>fF1 = F1/(F1+F2) is fraction of form F1 in subsystem of subunit,</p>
<p>4 is number of subunits (<b>numberOfSubunit</b>).</p>
<p><br/>This block can be connected to chemical reactions such as it was the chosen species with subsystem behind. It is recommended to use this block only as an equilibrated subsystem.</p>
</html>"));
    end Speciation;

    model Dilution "Adding/removing of the solvent to/from solution"
      extends Physiolibrary.Chemical.Interfaces.OnePort;

      parameter Boolean useDilutionInput = false
        "=true, if dilition input is used"
        annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

      parameter Physiolibrary.Types.Fraction Dilution=1
        "Concentration ratio after per before dilution (0..no solutes, 1..no dilution) if useDilutionInput=false"
        annotation (Dialog(enable=not useSolventFlow));

      Physiolibrary.Types.RealIO.FractionInput dilution(start=Dilution)= d if useDilutionInput
        "Fraction of final undilutes solution"
        annotation (Placement(transformation(extent={{-120,60},{-80,100}})));
    protected
      Types.Fraction d;
    equation
      if not useDilutionInput then
        d=Dilution;
      end if;
      q_out.conc = d * q_in.conc;

     annotation (
        Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{
                100,100}}), graphics={Bitmap(extent={{-100,101},{100,-101}},
                fileName="Resources/Icons/dilution.png",
              origin={0,33},
              rotation=270),
            Text(
              extent={{-120,20},{120,-20}},
              textString="%name",
              lineColor={0,0,255},
              origin={-2,-60},
              rotation=180)}),
        Diagram(coordinateSystem(preserveAspectRatio=false,
                       extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end Dilution;

    model Reabsorption "Reabsorption as input fraction"
       extends Physiolibrary.Icons.Reabsorption;

      parameter Boolean useEffect = false
        "=true, if reabsorption fraction is BaseReabsorption^(1/Effect)"
      annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

      parameter Boolean useMaxReabInput = false
        "=true, if external maximum of reabsorption molar flow is used"
      annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

      parameter Boolean useBaseReabsorption = false
        "=false, if BaseReabsorption=1"
      annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

      parameter Physiolibrary.Types.MolarFlowRate MaxReabsorption = Modelica.Constants.inf
        "Maximal reabsorption molar flow if useMaxReabInput=false"
        annotation (Dialog(enable=not useMaxReabInput));

      Physiolibrary.Chemical.Interfaces.ChemicalPort_a
                                Inflow "Tubular inflow"              annotation (Placement(
            transformation(extent={{-110,30},{-90,50}})));
      Physiolibrary.Chemical.Interfaces.ChemicalPort_b
                                Outflow "Tubular outflow"
        annotation (Placement(transformation(extent={{90,30},{110,50}})));

      Physiolibrary.Chemical.Interfaces.ChemicalPort_b
                                Reabsorption "Reabsorption from tubules"          annotation (Placement(
            transformation(extent={{-10,-110},{10,-90}})));
      Physiolibrary.Types.RealIO.FractionInput baseReabsorption=baseReabFract if useBaseReabsorption
        "Base fraction of molar inflow for reabsorption flow"
                                   annotation (Placement(transformation(extent={{-20,-20},
                {20,20}},
            rotation=270,
            origin={40,100})));

      Physiolibrary.Types.RealIO.FractionInput Effect(displayUnit="1")=e if useEffect
        "Effects<1 decrease reabsorption, effects>1 increase reabsorption fraction by equation ReabFract=BaseReabsorption^(1/Effect)"
                                   annotation (Placement(transformation(extent={{-20,-20},
                {20,20}},
            rotation=270,
            origin={0,100})));
      Physiolibrary.Types.RealIO.MolarFlowRateInput               MaxReab=mr if useMaxReabInput
        "Maximal allowed reabsorption molar flow rate"
                                   annotation (Placement(transformation(extent={{-100,
                -80},{-60,-40}})));
      Physiolibrary.Types.RealIO.FractionOutput               ReabFract=reabFract if useEffect
        "Actual reabsorbed fraction from solute inflow rate"                                annotation (Placement(transformation(extent={{80,-100},
                {120,-60}})));

      Physiolibrary.Types.Fraction reabFract,baseReabFract,e;
      Physiolibrary.Types.MolarFlowRate mr;
    equation
      Inflow.conc = Outflow.conc;
      0 = Inflow.q + Outflow.q + Reabsorption.q;

      Reabsorption.q=-min(mr,reabFract*Inflow.q);

      reabFract = baseReabFract^(1/e);

      if not useBaseReabsorption then
        baseReabFract=1;
      end if;

      if not useMaxReabInput then
        mr=MaxReabsorption;
      end if;

      if not useEffect then
        e=1;
      end if;

      annotation (Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},
                {100,100}}),       graphics={
            Text(
              extent={{0,-102},{154,-132}},
              lineColor={0,0,255},
              textString="%name")}), Diagram(coordinateSystem(preserveAspectRatio=false,
                      extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end Reabsorption;
  end Components;

  package Sensors
    extends Modelica.Icons.SensorsPackage;

    model MolarFlowMeasure "Measure of molar flow"
      extends Physiolibrary.Chemical.Interfaces.OnePort;
      extends Physiolibrary.Icons.MolarFlowMeasure;

     Physiolibrary.Types.RealIO.MolarFlowRateOutput actualFlow
                             annotation (Placement(transformation(extent={{-20,-20},
                {20,20}},
            rotation=270,
            origin={0,-60})));
    equation
      q_in.conc = q_out.conc;

      actualFlow = q_in.q;

     annotation (
        Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{
                100,100}}), graphics),Diagram(coordinateSystem(preserveAspectRatio=false,
                       extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end MolarFlowMeasure;

    model ConcentrationMeasure "Measure of molar concentration"

      Physiolibrary.Chemical.Interfaces.ChemicalPort_a
                                q_in "For measure only"
                                annotation (Placement(
            transformation(extent={{-10,-30},{10,-10}})));
      Physiolibrary.Types.RealIO.ConcentrationOutput actualConc
        "Actual concentration"
                             annotation (Placement(transformation(extent={{-20,-20},
                {20,20}},
            rotation=90,
            origin={0,40})));
    equation

      actualConc =         q_in.conc;

      q_in.q = 0;
     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={    Rectangle(
              extent={{-20,20},{20,-20}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
                                      Diagram(coordinateSystem(preserveAspectRatio=false,
                       extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end ConcentrationMeasure;

    model FlowConcentrationMeasure
      "The outflow concentration from absorption (i.e. portal vein concentration)"
      extends Physiolibrary.Chemical.Interfaces.ConditionalSolutionFlow;
      Physiolibrary.Chemical.Interfaces.ChemicalPort_a
                                q_in "Concentration before absorption source"
                             annotation (Placement(
            transformation(extent={{-110,-8},{-90,12}})));

      parameter Boolean useAdditionalSoluteFlowInput = false
        "=true, if absorbed molar flow input is chosen"
        annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

      parameter Types.MolarFlowRate AdditionalSoluteFlow=0
        "Additional solute molar flow if useAdditionalSoluteFlowInput=false"
        annotation (Dialog(enable=not useAdditionalSoluteFlowInput));

      Physiolibrary.Types.RealIO.MolarFlowRateInput additionalSoluteFlow(start=AdditionalSoluteFlow)=aq if useAdditionalSoluteFlowInput
        "Absorbed molar flow rate" annotation (Placement(transformation(extent={{-20,-20},
                {20,20}},
            rotation=90,
            origin={0,-60})));

     Physiolibrary.Types.RealIO.ConcentrationOutput Conc
        "Concentration after absorption source"                           annotation (Placement(transformation(extent={{80,-20},
                {120,20}})));

    protected
      Types.MolarFlowRate aq "Current additional solute molar flow";
    equation
      if not useAdditionalSoluteFlowInput then
        aq = AdditionalSoluteFlow;
      end if;
      Conc = q_in.conc + aq/q;
      q_in.q = 0;
     annotation (
        Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{
                100,100}}), graphics={Rectangle(
              extent={{-100,-50},{100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{-88,-50},{80,50}},
              textString="%name",
              lineColor={0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio=false,
                       extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics));
    end FlowConcentrationMeasure;
  end Sensors;

  package Sources
    extends Modelica.Icons.SourcesPackage;

    model UnlimitedSolutePump "Molar pump of solute"
      extends Physiolibrary.Chemical.Interfaces.ConditionalSoluteFlow;

      Physiolibrary.Chemical.Interfaces.ChemicalPort_b
                                q_out "Outflow"
                             annotation (Placement(
            transformation(extent={{90,-10},{110,10}})));

    equation
      q_out.q = - q;

     annotation (
        Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{
                100,100}}), graphics={
            Rectangle(
              extent={{-100,-42},{100,40}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-48,20},{50,0},{-48,-21},{-48,20}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-82,-82},{90,-58}},
              textString="%name",
              lineColor={0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio=false,
                       extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics));
    end UnlimitedSolutePump;

    model UnlimitedSolutionStorage "Constant concentration source"

      import Physiolibrary.Types.*;
      Physiolibrary.Chemical.Interfaces.ChemicalPort_b
                                q_out
        "constant concentration with any possible flow"
                                 annotation (Placement(
            transformation(extent={{90,-10},{110,10}})));

      parameter Boolean useConcentrationInput = false
        "=true, if fixed concentration is from input instead of parameter"
      annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

       parameter Concentration Conc = 0
        "Fixed concentration if useConcentrationInput=false"
        annotation (Dialog(enable=not useSolventFlowInput));

      parameter Boolean isIsolatedInSteadyState = true
        "=true, if there is no flow at port in steady state"
        annotation (Dialog(group="Simulation",tab="Equilibrium"));

      parameter SimulationType  Simulation=SimulationType.NormalInit
        "If in equilibrium, then zero-flow equation is added."
        annotation (Dialog(group="Simulation",tab="Equilibrium"));

       Types.RealIO.ConcentrationInput concentration(start=Conc)=c if useConcentrationInput
        annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));

    protected
      Concentration c "Current concentration";

    initial equation
      if isIsolatedInSteadyState and (Simulation==SimulationType.InitSteadyState) then
        q_out.q = 0;
      end if;

    equation
       if not useConcentrationInput then
         c=Conc;
       end if;

      q_out.conc = c;

      if isIsolatedInSteadyState and (Simulation==SimulationType.SteadyState) then
        q_out.q = 0;
      end if;

      annotation (Diagram(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},
                {100,100}}),       graphics), Icon(coordinateSystem(
              preserveAspectRatio=false,extent={{-100,-100},{100,100}}),
            graphics={
            Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,0},
              pattern=LinePattern.None,
              fillColor={107,45,134},
              fillPattern=FillPattern.Backward),
            Text(
              extent={{0,0},{-100,-100}},
              lineColor={0,0,0},
              textString="conc"),
            Line(
              points={{-62,0},{56,0}},
              color={191,0,0},
              thickness=0.5),
            Polygon(
              points={{38,-20},{38,20},{78,0},{38,-20}},
              lineColor={191,0,0},
              fillColor={191,0,0},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-150,150},{150,110}},
              textString="%name",
              lineColor={0,0,255}),
            Text(
              extent={{-150,-110},{150,-140}},
              lineColor={0,0,0},
              textString="Conc=%Conc")}),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end UnlimitedSolutionStorage;

    model UnlimitedGasStorage "Constant ideal gas source"
      extends Interfaces.ConditionalHeatPort;
      import Physiolibrary.Types.*;
      Physiolibrary.Chemical.Interfaces.ChemicalPort_b
                                q_out
        "constant gas concentration with any possible flow"
                                 annotation (Placement(
            transformation(extent={{90,-10},{110,10}})));

      parameter Boolean usePartialPressureInput = false
        "=true, if fixed partial pressure is from input instead of parameter"
      annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

       parameter Pressure PartialPressure = 0
        "Fixed partial pressure if usePartialPressureInput=false"
        annotation (Dialog(enable=not usePartialPressureInput));

      RealIO.PressureInput partialPressure(start=PartialPressure) = p if usePartialPressureInput
        "Partial pressure of Gas = air pressure * gas fraction"
        annotation (Placement(transformation(extent={{-120,-20},{-80,20}},
            rotation=0)));

     parameter Boolean isIsolatedInSteadyState = true
        "=true, if there is no flow at port in steady state"
        annotation (Dialog(group="Simulation",tab="Equilibrium"));

      parameter SimulationType  Simulation=SimulationType.NormalInit
        "If in equilibrium, then zero-flow equation is added."
        annotation (Dialog(group="Simulation",tab="Equilibrium"));

    protected
      Pressure p "Current partial pressure";

    initial equation
      if isIsolatedInSteadyState and (Simulation==SimulationType.InitSteadyState) then
        q_out.q = 0;
      end if;

    equation
      if not usePartialPressureInput then
        p=PartialPressure;
      end if;

      q_out.conc = p / (Modelica.Constants.R * T_heatPort);  //ideal gas equation

      if isIsolatedInSteadyState and (Simulation==SimulationType.SteadyState) then
         q_out.q = 0;
      end if;

      lossHeat=0; //only read temperature from heat port

      annotation (Diagram(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},
                {100,100}}),       graphics), Icon(coordinateSystem(
              preserveAspectRatio=false,extent={{-100,-100},{100,100}}),
            graphics={
            Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,0},
            pattern=LinePattern.None,
            fillColor={170,255,255},
            fillPattern=FillPattern.Backward),
            Polygon(
              points={{-100,100},{100,-100},{100,100},{-100,100}},
              smooth=Smooth.None,
              fillColor={159,159,223},
              fillPattern=FillPattern.Backward,
              pattern=LinePattern.None,
              lineColor={0,0,0}),
            Text(
              extent={{0,0},{-100,-100}},
              lineColor={0,0,0},
              textString="P,T"),
            Line(
              points={{-62,0},{56,0}},
              color={191,0,0},
              thickness=0.5),
            Polygon(
              points={{38,-20},{38,20},{78,0},{38,-20}},
              lineColor={191,0,0},
              fillColor={191,0,0},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-150,150},{150,110}},
              textString="%name",
              lineColor={0,0,255}),
            Text(
              extent={{-150,-110},{150,-140}},
              lineColor={0,0,0},
              textString="T=%T")}),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end UnlimitedGasStorage;
  end Sources;

  package Interfaces
    extends Modelica.Icons.InterfacesPackage;

    connector ChemicalPort "Concentration and Solute flow"
      Physiolibrary.Types.Concentration conc "Solute concentration";
      flow Physiolibrary.Types.MolarFlowRate q "Solute flow";
      annotation (Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end ChemicalPort;

    connector ChemicalPort_a
      "Concentration and expected positive Solute inflow"
      extends ChemicalPort;

    annotation (
        defaultComponentName="port_a",
        Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,
                100}}),     graphics={Rectangle(
              extent={{-20,10},{20,-10}},
              lineColor={107,45,134},
              lineThickness=1),       Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={107,45,134},
              fillColor={107,45,134},
              fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}),
            graphics={Rectangle(
              extent={{-40,40},{40,-40}},
              lineColor={107,45,134},
              fillColor={107,45,134},
              fillPattern=FillPattern.Solid),
       Text(extent = {{-160,110},{40,50}}, lineColor = {107,45,134}, textString = "%name")}),
        Documentation(info="<html>
<p>
Connector with one flow signal of type Real.
</p>
</html>",
        revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));

    end ChemicalPort_a;

    connector ChemicalPort_b
      "Concentration and expected negative Solute outflow"
      extends ChemicalPort;

    annotation (
        defaultComponentName="port_b",
        Icon(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=false),
            graphics={Rectangle(
              extent={{-20,10},{20,-10}},
              lineColor={107,45,134},
              lineThickness=1),       Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={107,45,134},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={Rectangle(
              extent={{-40,40},{40,-40}},
              lineColor={107,45,134},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
       Text(extent = {{-160,110},{40,50}}, lineColor = {107,45,134}, textString = "%name")}),
        Documentation(info="<html>
<p>
Connector with one flow signal of type Real.
</p>
</html>",
        revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));

    end ChemicalPort_b;

    partial model OnePort
      "Partial transfer of solute beween two ports without its accumulation"

      ChemicalPort_b            q_out
        annotation (Placement(transformation(extent={{90,-10},{110,10}})));
      ChemicalPort_a            q_in
        annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
    equation
      q_in.q + q_out.q = 0;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),
                             graphics), Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
    end OnePort;

    partial model ConditionalHeatPort
      "Partial model to include a conditional HeatPort in order to describe the power loss via a thermal network"

      parameter Boolean useHeatPort = false "=true, if HeatPort is enabled"
      annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true), Dialog(group="External inputs/outputs"));
      parameter Physiolibrary.Types.Temperature T=310.15
        "Fixed device temperature if useHeatPort = false"
        annotation (Dialog(enable=not useHeatPort,tab="Temperature dependence"));

      Physiolibrary.Thermal.Interfaces.HeatPort_a       heatPort(T(start=T)=T_heatPort, Q_flow=-lossHeat) if useHeatPort
        annotation (Placement(transformation(extent={{-10,-10},{10,10}}),
            iconTransformation(extent={{-10,-10},{10,10}})));
      Physiolibrary.Types.HeatFlowRate lossHeat
        "Loss heat leaving component via HeatPort";
      Physiolibrary.Types.Temperature T_heatPort "Temperature of HeatPort";
    equation
      if not useHeatPort then
         T_heatPort = T;
      end if;

      annotation (Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},
                {100,100}}),                                                                       graphics),
                 Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<ul>
<li><i> February 17, 2009   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
<li><i> January 21, 2014   </i>
       by Marek Matejak<br> integrated to Physiolibrary<br>
       </li>  
</ul>
</html>",     info="<html>
<p>
This partial model provides a conditional heating port for the connection to a thermal network.
</p>
<ul>
<li> If <b>useHeatPort</b> is set to <b>false</b> (default), no heat port is available, and the thermal
     loss power flows internally to the ground. In this case, the parameter <b>T</b> specifies
     the fixed device temperature (the default for T = 20<sup>o</sup>C).</li>
<li> If <b>useHeatPort</b> is set to <b>true</b>, a heat port is available.</li>
</ul>

<p>
If this model is used, the loss power has to be provided by an equation in the model which inherits from
ConditionalHeatingPort model (<b>lossPower = ...</b>). As device temperature
<b>T_heatPort</b> can be used to describe the influence of the device temperature
on the model behaviour.
</p>
</html>"));
    end ConditionalHeatPort;

    partial model ConditionalSolventVolume
      "Chemical processes can be modeled with or without(normalized to 1 liter) variable solvent volume"

      constant Physiolibrary.Types.Volume NormalSolventVolume=0.001 "1 liter";

      parameter Boolean useNormalizedVolume = true
        "=true, if solvent volume is 1 liter"
      annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

      Physiolibrary.Types.Volume volume "SolventVolume";

      Physiolibrary.Types.RealIO.VolumeInput solventVolume=volume if not useNormalizedVolume annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={-40,40})));
    equation
      if useNormalizedVolume then
        volume = NormalSolventVolume;
      end if;

      annotation (Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},
                {100,100}}),                                                                       graphics),
                 Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
    end ConditionalSolventVolume;

    partial model ConditionalSolutionFlow
      "Input of solution volumetric flow vs. parametric solution volumetric flow"

      parameter Boolean useSolutionFlowInput = false
        "=true, if solution flow input is used instead of parameter SolutionFlow"
      annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

      parameter Physiolibrary.Types.VolumeFlowRate SolutionFlow=0
        "Volumetric flow of solution if useSolutionFlowInput=false"
        annotation (Dialog(enable=not useSolutionFlowInput));

      Physiolibrary.Types.RealIO.VolumeFlowRateInput solutionFlow(start=SolutionFlow)=q if useSolutionFlowInput annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,40})));

      Physiolibrary.Types.VolumeFlowRate q "Current solution flow";
    equation
      if not useSolutionFlowInput then
        q = SolutionFlow;
      end if;

      annotation (Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},
                {100,100}}),                                                                       graphics),
                 Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
    end ConditionalSolutionFlow;

    partial model ConditionalSoluteFlow
      "Input of solute molar flow vs. parametric solute molar flow"

      parameter Boolean useSoluteFlowInput = false
        "=true, if solute flow input is used instead of parameter SoluteFlow"
      annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

      parameter Physiolibrary.Types.MolarFlowRate SoluteFlow=0
        "Volumetric flow of solute if useSoluteFlowInput=false"
        annotation (Dialog(enable=not useSoluteFlowInput));

      Physiolibrary.Types.RealIO.MolarFlowRateInput soluteFlow(start=SoluteFlow)=q if   useSoluteFlowInput annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={40,40})));

      Physiolibrary.Types.MolarFlowRate q "Current solute flow";
    equation
      if not useSoluteFlowInput then
        q = SoluteFlow;
      end if;

      annotation (Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},
                {100,100}}),                                                                       graphics),
                 Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
    end ConditionalSoluteFlow;
  end Interfaces;
  annotation (Documentation(revisions="<html>
<p>Licensed by Marek Matejak under the Modelica License 2</p>
<p>Copyright &copy; 2008-2013, Marek Matejak, Charles University in Prague.</p>
<p><br/><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Physiolibrary.UsersGuide.ModelicaLicense2\">Physiolibrary.UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p>
</html>", info="<html>
<p>In physiology books, chapters about chemical substances are organized by their types. The main reason for this is that each substance in the human body is regulated in a different way. For example the regulation of sodium is different from the regulation of potassium, and from the regulation of glucose, and so on. This view leads to the idea of having separate models of each substance. The origin of different flows and regulations is the (cellular) membrane. Water and solutions can cross it in different directions at the same time. Crossings occur for different reasons: water is driven mostly by osmotic gradients, electrolytes are driven by charge to reach Donnan&apos;s equilibrium, and some solutes can even be actively transported against their concentration or electrical gradients. And all this is specifically driven from the higher levels by neural and hormonal responses.&nbsp; </p>
<p>In Physiolibrary flows and fluxes of solutes are supported mostly by the Chemical package. All parts inside this Physiolibrary.Chemical package use the connector ChemicalPort, which defines the molar concentration and molar flow/flux rate of one solute. This is the supporting infrastructure for modeling membrane diffusion, accumulations of substances, reversal chemical reactions, Henry&apos;s law of gas solubility, dilution with additional solvent flow, membrane reabsorption, chemical degradation and physiological clearance. </p>
</html>"));
end Chemical;

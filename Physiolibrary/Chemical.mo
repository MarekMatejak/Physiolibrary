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

    model HendersonHaselbalch
        extends Modelica.Icons.Example;
      Components.Substance HCO3(isDependent=true, Simulation=Physiolibrary.Types.SimulationType.SteadyState)
        annotation (Placement(transformation(extent={{-18,46},{2,66}})));
      Components.ChemicalReaction HendersonHasselbalch(
        nP=2,
        K=10^(-6.103 + 3),
        dH=15.13)
        annotation (Placement(transformation(extent={{-58,22},{-38,42}})));
      Sources.UnlimitedGasStorage CO2_gas(PartialPressure=5332.8954966,
          Simulation=Physiolibrary.Types.SimulationType.SteadyState)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-80,82})));
      Sources.UnlimitedSolutionStorage pH(
        q_out(conc(nominal=10^(-7.4 + 3))),
        Conc=10^(-7.4 + 3),
        isIsolatedInSteadyState=false,
        Simulation=Physiolibrary.Types.SimulationType.SteadyState) annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-8,12})));
      Components.GasSolubility gasSolubility(C=2400, kH_T0(displayUnit="(mmol/l)/kPa at 25degC")=
             0.81805576878885)
        annotation (Placement(transformation(extent={{-90,46},{-70,66}})));
      Components.Substance CO2_liquid(Simulation=Physiolibrary.Types.SimulationType.SteadyState)
        annotation (Placement(transformation(extent={{-90,22},{-70,42}})));
    equation
      connect(HendersonHasselbalch.products[1], HCO3.q_out) annotation (Line(
          points={{-38,31.5},{-26,31.5},{-26,56},{-8,56}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(pH.q_out, HendersonHasselbalch.products[2]) annotation (Line(
          points={{-18,12},{-26,12},{-26,32.5},{-38,32.5}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(CO2_liquid.q_out, HendersonHasselbalch.substrates[1]) annotation (
         Line(
          points={{-80,32},{-58,32}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(gasSolubility.q_in, CO2_liquid.q_out) annotation (Line(
          points={{-80,48},{-80,32}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(CO2_gas.q_out, gasSolubility.q_out) annotation (Line(
          points={{-80,72},{-80,66}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics), Documentation(info="<html>
<p>Henderson-Hasselbalch equation in ideal buffered solution, where pH remains constant.</p>
<p>The partial pressure of CO2 in gas are input parameter. Outputs are an amount of free disolved CO2 in liquid and an amount of HCO3-.</p>
</html>"));
    end HendersonHaselbalch;

    package Hemoglobin "Hemoglobin blood gases binding"
      model Allosteric_Hemoglobin_MWC "Monod,Wyman,Changeux (1965)"
      extends Modelica.Icons.Example;
        import Physiolibrary.Chemical.*;
        import Physiolibrary.Types.*;

      //extends Physiolibrary.SteadyStates.Interfaces.SteadyStateSystem(
      //                                         Simulation=SimulationType.SteadyState);

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

      //  Fraction sO2 "hemoglobin oxygen saturation";

        parameter AmountOfSubstance totalAmountOfHemoglobin=1;
      //  AmountOfSubstance totalAmountOfRforms;
      //  AmountOfSubstance totalAmountOfTforms;

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


        SteadyStates.Components.MolarConservationLaw hemoglobinConservationLaw(
          n=10, Total(displayUnit="mol") = 1,
          Simulation=Physiolibrary.Types.SimulationType.SteadyState)
          annotation (Placement(transformation(extent={{72,-2},{92,18}})));
        Modelica.Blocks.Math.Sum oxygen_bound(k={1,1,2,2,3,3,4,4}, nin=8)
          annotation (Placement(transformation(extent={{72,-56},{82,-46}})));
        Modelica.Blocks.Math.Division sO2_ "hemoglobin oxygen saturation"
          annotation (Placement(transformation(extent={{86,-60},{96,-50}})));
        Modelica.Blocks.Math.Sum tHb(nin=10, k=4*ones(10))
          annotation (Placement(transformation(extent={{72,-70},{82,-60}})));
        Components.Substance          oxygen_unbound(solute_start=0.000001*
              7.875647668393782383419689119171e-5, Simulation=SimulationType.SteadyState)
          annotation (Placement(transformation(extent={{-56,-44},{-36,-24}})));
        Modelica.Blocks.Sources.Clock clock(offset=60)
          annotation (Placement(transformation(extent={{-94,44},{-74,64}})));
        Sources.UnlimitedGasStorage          O2_in_air(Simulation=Physiolibrary.Types.SimulationType.SteadyState,
          usePartialPressureInput=true,
          T=310.15)   annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-66,24})));
        Components.GasSolubility          gasSolubility(
                                            useHeatPort=false, kH_T0=
              0.026029047188736)
          annotation (Placement(transformation(extent={{-76,-14},{-56,6}})));
      equation
       //  sO2 = (R1.solute + 2*R2.solute + 3*R3.solute + 4*R4.solute + T1.solute + 2*T2.solute + 3*T3.solute + 4*T4.solute)/(4*totalAmountOfHemoglobin);
      //   totalAmountOfRforms = R0.solute + R1.solute + R2.solute + R3.solute + R4.solute;
      //   totalAmountOfTforms = T0.solute + T1.solute + T2.solute + T3.solute + T4.solute;

      //   totalAmountOfHemoglobin*normalizedState[1] = totalAmountOfRforms + totalAmountOfTforms;

        connect(quaternaryForm.products[1],T0. q_out) annotation (Line(
            points={{24,88},{42,88}},
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
        connect(R4.solute,hemoglobinConservationLaw. fragment[1])        annotation (
            Line(
            points={{-10,-92},{-10,-98},{64,-98},{64,2.2},{72,2.2}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(T4.solute,hemoglobinConservationLaw. fragment[2])        annotation (
            Line(
            points={{44,-92},{44,-98},{64,-98},{64,2.6},{72,2.6}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(R3.solute,hemoglobinConservationLaw. fragment[3])        annotation (
            Line(
            points={{-10,-54},{64,-54},{64,3},{72,3}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(T3.solute,hemoglobinConservationLaw. fragment[4])        annotation (
            Line(
            points={{44,-54},{64,-54},{64,3.4},{72,3.4}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(R2.solute,hemoglobinConservationLaw. fragment[5])        annotation (
            Line(
            points={{-10,-10},{64,-10},{64,3.8},{72,3.8}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(T2.solute,hemoglobinConservationLaw. fragment[6])        annotation (
            Line(
            points={{44,-10},{64,-10},{64,4.2},{72,4.2}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(R1.solute,hemoglobinConservationLaw. fragment[7])        annotation (
            Line(
            points={{-10,36},{64,36},{64,4.6},{72,4.6}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(T1.solute,hemoglobinConservationLaw. fragment[8])        annotation (
            Line(
            points={{44,36},{64,36},{64,5},{72,5}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(R0.solute,hemoglobinConservationLaw. fragment[9])        annotation (
            Line(
            points={{-10,78},{64,78},{64,5.4},{72,5.4}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(T0.solute,hemoglobinConservationLaw. fragment[10])        annotation (
           Line(
            points={{42,78},{64,78},{64,5.8},{72,5.8}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(R1.solute,oxygen_bound. u[1]) annotation (Line(
            points={{-10,36},{64,36},{64,-51.875},{71,-51.875}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(T1.solute,oxygen_bound. u[2]) annotation (Line(
            points={{44,36},{64,36},{64,-51.625},{71,-51.625}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(R2.solute,oxygen_bound. u[3]) annotation (Line(
            points={{-10,-10},{64,-10},{64,-51.375},{71,-51.375}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(T2.solute,oxygen_bound. u[4]) annotation (Line(
            points={{44,-10},{64,-10},{64,-51.125},{71,-51.125}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(R3.solute,oxygen_bound. u[5]) annotation (Line(
            points={{-10,-54},{64,-54},{64,-50.875},{71,-50.875}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(T3.solute,oxygen_bound. u[6]) annotation (Line(
            points={{44,-54},{64,-54},{64,-50.625},{71,-50.625}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(R4.solute,oxygen_bound. u[7]) annotation (Line(
            points={{-10,-92},{-10,-98},{64,-98},{64,-50.375},{71,-50.375}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(T4.solute,oxygen_bound. u[8]) annotation (Line(
            points={{44,-92},{44,-98},{64,-98},{64,-50.125},{71,-50.125}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(oxygen_bound.y,sO2_. u1) annotation (Line(
            points={{82.5,-51},{84,-51},{84,-52},{85,-52}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(sO2_.u2,tHb. y) annotation (Line(
            points={{85,-58},{84,-58},{84,-65},{82.5,-65}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(R0.solute,tHb. u[1]) annotation (Line(
            points={{-10,78},{64,78},{64,-65.9},{71,-65.9}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(T0.solute,tHb. u[2]) annotation (Line(
            points={{42,78},{64,78},{64,-65.7},{71,-65.7}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(R1.solute,tHb. u[3]) annotation (Line(
            points={{-10,36},{64,36},{64,-65.5},{71,-65.5}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(T1.solute,tHb. u[4]) annotation (Line(
            points={{44,36},{64,36},{64,-65.3},{71,-65.3}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(R2.solute,tHb. u[5]) annotation (Line(
            points={{-10,-10},{64,-10},{64,-65.1},{71,-65.1}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(T2.solute,tHb. u[6]) annotation (Line(
            points={{44,-10},{64,-10},{64,-64.9},{71,-64.9}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(R3.solute,tHb. u[7]) annotation (Line(
            points={{-10,-54},{64,-54},{64,-64.7},{71,-64.7}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(T3.solute,tHb. u[8]) annotation (Line(
            points={{44,-54},{64,-54},{64,-64.5},{71,-64.5}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(R4.solute,tHb. u[9]) annotation (Line(
            points={{-10,-92},{-10,-98},{64,-98},{64,-64.3},{71,-64.3}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(T4.solute,tHb. u[10]) annotation (Line(
            points={{44,-92},{44,-98},{64,-98},{64,-64.1},{71,-64.1}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(oxyR1.products[2],oxygen_unbound. q_out)
                                            annotation (Line(
            points={{-9.5,74},{-46,74},{-46,-34}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxyR2.products[2],oxygen_unbound. q_out)
                                            annotation (Line(
            points={{-9.5,32},{-46,32},{-46,-34}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxyR3.products[2],oxygen_unbound. q_out)
                                            annotation (Line(
            points={{-9.5,-14},{-46,-14},{-46,-34}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxyR4.products[2],oxygen_unbound. q_out)
                                            annotation (Line(
            points={{-9.5,-56},{-46,-56},{-46,-34}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygen_unbound.q_out, oxyT1.products[2])
                                            annotation (Line(
            points={{-46,-34},{-46,74},{43.5,74}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygen_unbound.q_out, oxyT2.products[2])
                                            annotation (Line(
            points={{-46,-34},{-46,32},{43.5,32}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygen_unbound.q_out, oxyT3.products[2])
                                            annotation (Line(
            points={{-46,-34},{-46,-14},{43.5,-14}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygen_unbound.q_out, oxyT4.products[2])
                                            annotation (Line(
            points={{-46,-34},{-46,-56},{43.5,-56}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygen_unbound.q_out,gasSolubility. q_in) annotation (Line(
            points={{-46,-34},{-66,-34},{-66,-12}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(O2_in_air.q_out,gasSolubility. q_out) annotation (Line(
            points={{-66,14},{-66,6}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(clock.y,O2_in_air. partialPressure) annotation (Line(
            points={{-73,54},{-66,54},{-66,34}},
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
</html>",   revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end Allosteric_Hemoglobin_MWC;

      model Allosteric_Hemoglobin2_MWC
        "Monod,Wyman,Changeux (1965) - The same allosteric hemoglobin model implemented by Speciation blocks"
        import Physiolibrary.Types.*;

       extends Modelica.Icons.Example;

      // extends Physiolibrary.SteadyStates.Interfaces.SteadyStateSystem(
      //                                          Simulation=SimulationType.SteadyState);

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

       // Fraction sO2 "hemoglobin oxygen saturation";

        parameter AmountOfSubstance totalAmountOfHemoglobin=0.001;

        Physiolibrary.Chemical.Components.ChemicalReaction
                                                  quaternaryForm(K=L)
          annotation (Placement(transformation(extent={{-4,-84},{16,-64}})));
        Components.Speciation
                           R0_in_R(NumberOfSubunitTypes=4)
          annotation (Placement(transformation(extent={{-32,-76},{-52,-56}})));
        Components.Speciation
                           T0_in_T(NumberOfSubunitTypes=4)
          annotation (Placement(transformation(extent={{68,-76},{48,-56}})));
        Physiolibrary.Chemical.Components.Substance OxyRHm[4](
          each Simulation=SimulationType.SteadyState,
          each isDependent=true,
          each solute_start=4e-19)
          "Oxygenated subunit in R structure of hemoglobin tetramer"
          annotation (Placement(transformation(extent={{-98,-36},{-78,-16}})));
        Physiolibrary.Chemical.Components.ChemicalReaction oxygenation_R[4](each K=KR, each nP=2)
          annotation (Placement(transformation(extent={{-70,-36},{-50,-16}})));
        Physiolibrary.Chemical.Components.Substance DeoxyRHm[4](each Simulation=
              SimulationType.SteadyState, each solute_start=4e-11)
          "Deoxygenated subunit in R structure of hemoglobin tetramer"
          annotation (Placement(transformation(extent={{-42,-36},{-22,-16}})));
        Physiolibrary.Chemical.Components.Substance OxyTHm[4](
          each Simulation=SimulationType.SteadyState,
          each isDependent=true,
          each solute_start=1e-14)
          "Oxygenated subunit in T structure of hemoglobin tetramer"
          annotation (Placement(transformation(extent={{14,-36},{34,-16}})));
        Physiolibrary.Chemical.Components.ChemicalReaction oxygenation_T[4](each K=KT, each nP=2)
          annotation (Placement(transformation(extent={{42,-36},{62,-16}})));
        Physiolibrary.Chemical.Components.Substance DeoxyTHm[4](
                                                 each Simulation=SimulationType.SteadyState,
            each solute_start=0.00025)
          "Deoxygenated subunit in T structure of hemoglobin tetramer"
          annotation (Placement(transformation(extent={{70,-36},{90,-16}})));

        Physiolibrary.Chemical.Components.Substance
                            oxygen_unbound(Simulation=SimulationType.SteadyState, solute_start=0.000001
              *7.875647668393782383419689119171e-5)
          annotation (Placement(transformation(extent={{-4,-2},{16,18}})));
        Modelica.Blocks.Sources.Clock clock(offset=60)
          annotation (Placement(transformation(extent={{-40,74},{-20,94}})));
        Modelica.Blocks.Math.Add add[4] annotation (Placement(transformation(
              extent={{-4,-4},{4,4}},
              rotation=270,
              origin={-66,-54})));
        Modelica.Blocks.Math.Add add1[4] annotation (Placement(transformation(
              extent={{-4,-4},{4,4}},
              rotation=270,
              origin={44,-54})));
        Sources.UnlimitedGasStorage oxygen_in_air(
          Simulation=Physiolibrary.Types.SimulationType.SteadyState,
          usePartialPressureInput=true,
          T=310.15)                                annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={6,60})));
        Components.GasSolubility
                              partialPressure1(          kH_T0(displayUnit="(mmol/l)/kPa at 25degC")=
               0.026029047188736, T=310.15)                             annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={6,32})));
        SteadyStates.Components.MolarConservationLaw totalHb(
          Simulation=Physiolibrary.Types.SimulationType.SteadyState,
          Total(displayUnit="mol") = totalAmountOfHemoglobin,
          n=2)
          annotation (Placement(transformation(extent={{70,-92},{90,-72}})));
        Modelica.Blocks.Math.Sum sum1(nin=8, k=(1/4)*ones(8))
                                             annotation (Placement(transformation(
              extent={{-4,-4},{4,4}},
              rotation=270,
              origin={-74,-82})));
        Modelica.Blocks.Math.Division sO2_ "hemoglobin oxygen saturation"
          annotation (Placement(transformation(extent={{-64,-96},{-54,-86}})));
      equation
      //  totalAmountOfHemoglobin*normalizedState[1] = sum(OxyRHm.solute) + sum(DeoxyRHm.solute) + sum(OxyTHm.solute) + sum(DeoxyTHm.solute);

      //  sO2 = (sum(OxyRHm.solute) + sum(OxyTHm.solute))/totalAmountOfHemoglobin;

        connect(R0_in_R.species, quaternaryForm.substrates[1])
                                                         annotation (Line(
            points={{-52,-74},{-4,-74}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(quaternaryForm.products[1], T0_in_T.species)
                                                       annotation (Line(
            points={{16,-74},{48,-74}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(OxyTHm.q_out, oxygenation_T.substrates[1])
                                                 annotation (Line(
            points={{24,-26},{42,-26}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygenation_T.products[1], DeoxyTHm.q_out)
                                               annotation (Line(
            points={{62,-26.5},{72,-26.5},{72,-26},{80,-26}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));

        connect(OxyTHm.solute, add1.u2) annotation (Line(
            points={{24,-36},{24,-42},{41.6,-42},{41.6,-49.2}},
            color={0,0,127},
            smooth=Smooth.Bezier));
        connect(add1.u1, DeoxyTHm.solute) annotation (Line(
            points={{46.4,-49.2},{46.4,-42},{80,-42},{80,-36}},
            color={0,0,127},
            smooth=Smooth.Bezier));
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
        connect(add.y, R0_in_R.totalSubunitAmount) annotation (Line(
            points={{-66,-58.4},{-66,-66},{-50,-66}},
            color={0,0,127},
            smooth=Smooth.Bezier));
        connect(OxyRHm.solute, add.u2) annotation (Line(
            points={{-88,-36},{-88,-44},{-68.4,-44},{-68.4,-49.2}},
            color={0,0,127},
            smooth=Smooth.Bezier));
        connect(DeoxyRHm.solute, add.u1) annotation (Line(
            points={{-32,-36},{-32,-36},{-32,-44},{-63.6,-44},{-63.6,-50},{
                -63.6,-49.2}},
            color={0,0,127},
            smooth=Smooth.Bezier));
        connect(OxyRHm.q_out, oxygenation_R.substrates[1]) annotation (Line(
            points={{-88,-26},{-70,-26}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(DeoxyRHm.q_out, R0_in_R.subunitSpecies) annotation (Line(
            points={{-32,-26},{-42,-26},{-42,-56}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygenation_R.products[1], DeoxyRHm.q_out) annotation (Line(
            points={{-50,-26.5},{-42,-26.5},{-42,-26},{-32,-26}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygenation_R[1].products[2], oxygen_unbound.q_out) annotation (Line(
            points={{-50,-25.5},{-36,-25.5},{-36,12},{6,12},{6,8}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygenation_R[2].products[2], oxygen_unbound.q_out) annotation (Line(
            points={{-50,-25.5},{-36,-25.5},{-36,12},{6,12},{6,8}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygenation_R[3].products[2], oxygen_unbound.q_out) annotation (Line(
            points={{-50,-25.5},{-36,-25.5},{-36,12},{6,12},{6,8}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygenation_R[4].products[2], oxygen_unbound.q_out) annotation (Line(
            points={{-50,-25.5},{-36,-25.5},{-36,12},{6,12},{6,8}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygenation_T[1].products[2], oxygen_unbound.q_out) annotation (Line(
            points={{62,-25.5},{78,-25.5},{78,8},{6,8}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygenation_T[2].products[2], oxygen_unbound.q_out) annotation (Line(
            points={{62,-25.5},{78,-25.5},{78,8},{6,8}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
       connect(oxygenation_T[3].products[2], oxygen_unbound.q_out) annotation (Line(
            points={{62,-25.5},{78,-25.5},{78,8},{6,8}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
            connect(oxygenation_T[4].products[2], oxygen_unbound.q_out) annotation (Line(
            points={{62,-25.5},{78,-25.5},{78,8},{6,8}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(T0_in_T.subunitSpecies, DeoxyTHm.q_out)
                                                     annotation (Line(
            points={{58,-56},{84,-56},{84,-26},{80,-26}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(add1.y, T0_in_T.totalSubunitAmount)
                                                 annotation (Line(
            points={{44,-58.4},{44,-66},{50,-66}},
            color={0,0,127},
            smooth=Smooth.Bezier));
        connect(R0_in_R.totalSubsystemAmount, totalHb.fragment[1]) annotation (Line(
            points={{-42,-74},{-42,-87},{70,-87}},
            color={0,0,127},
            smooth=Smooth.Bezier));
        connect(T0_in_T.totalSubsystemAmount, totalHb.fragment[2]) annotation (Line(
            points={{58,-74},{58,-74},{58,-85},{70,-85}},
            color={0,0,127},
            smooth=Smooth.Bezier));
        connect(OxyRHm.solute, sum1.u[1:4]) annotation (Line(
            points={{-88,-36},{-86,-36},{-86,-72},{-74,-72},{-74,-77.2},{-74.1,
                -77.2}},
            color={0,0,127},
            smooth=Smooth.Bezier));

        connect(OxyTHm.solute, sum1.u[5:8]) annotation (Line(
            points={{24,-36},{24,-70},{-73.3,-70},{-73.3,-77.2}},
            color={0,0,127},
            smooth=Smooth.Bezier));
        connect(sO2_.u1, sum1.y) annotation (Line(
            points={{-65,-88},{-74,-88},{-74,-86.4}},
            color={0,0,127},
            smooth=Smooth.Bezier));
        connect(totalHb.totalAmountOfSubstance, sO2_.u2) annotation (Line(
            points={{90,-86},{96,-86},{96,-100},{-80,-100},{-80,-94},{-65,-94}},
            color={0,0,127},
            smooth=Smooth.Bezier));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics),
          experiment(StopTime=10000),
          __Dymola_experimentSetupOutput,
          Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end Allosteric_Hemoglobin2_MWC;

      model QuaternaryForm
        "Model of hemoglobin space-structure form (can be parametrized as relaxed or tensed)"
        import Physiolibrary.Types.*;

       extends Physiolibrary.SteadyStates.Interfaces.SteadyStateSystem(
                                                Simulation=SimulationType.SteadyState);

        parameter Concentration KA = 10^(-6.89+3)
          "dissociation coefficient for acid chains of subunit";
        parameter Concentration Kz = 10^(-7.25+3)
          "valine 1 amino terminus dissociation coefficient of protonation to NH3+";
        parameter Concentration Kc = 10^(-8.35+3)
          "valine 1 amino terminus dissociation coefficient of protonation to NH3+";
        parameter Concentration KO2 = 0.000671946
          "oxygen dissociation coefficient of hemoglobin subunit";   //*7.875647668393782383419689119171e-5
                                                                  //10.500001495896 7.8756465463794e-05

        Components.Speciation Speciation(NumberOfSubunitTypes=12)
          annotation (Placement(transformation(extent={{34,-84},{14,-64}})));
        Physiolibrary.Chemical.Components.Substance OxyHm[4](
          solute_start=0,
          Simulation=SimulationType.SteadyState,
          isDependent=true) "Oxygenated subunit of hemoglobin tetramer"
          annotation (Placement(transformation(extent={{-98,-36},{-78,-16}})));
        Physiolibrary.Chemical.Components.ChemicalReaction oxygenation[4](nP=2, K=KO2)
          annotation (Placement(transformation(extent={{-70,-36},{-50,-16}})));
        Physiolibrary.Chemical.Components.Substance DeoxyHm[4](Simulation=
              SimulationType.SteadyState, solute_start=1e-08)
          "Deoxygenated subunit of hemoglobin tetramer"
          annotation (Placement(transformation(extent={{-42,-36},{-22,-16}})));

        Modelica.Blocks.Math.Add add[4] annotation (Placement(transformation(
              extent={{-4,-4},{4,4}},
              rotation=270,
              origin={-66,-54})));
        Interfaces.ChemicalPort_a oxygen annotation (Placement(transformation(extent={{92,2},{
                  112,22}}),           iconTransformation(extent={{90,-10},{110,10}})));
        Interfaces.ChemicalPort_a form annotation (Placement(transformation(extent={{0,
                  -100},{20,-80}}), iconTransformation(extent={{-10,-110},{10,-90}})));
        Types.RealIO.AmountOfSubstanceOutput tFormInside(start=1e-08) annotation (
            Placement(transformation(extent={{-20,-110},{0,-90}}), iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-60,-90})));
        Types.RealIO.AmountOfSubstanceOutput oxy annotation (Placement(transformation(
                extent={{-58,-100},{-38,-80}}),
                                              iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={90,-80})));
        Modelica.Blocks.Math.Sum sum1(nin=4)
          annotation (Placement(transformation(extent={{-82,-100},{-62,-80}})));
        Interfaces.ChemicalPort_a proton annotation (Placement(transformation(extent={{90,90},
                  {110,110}}),        iconTransformation(extent={{90,90},{110,110}})));
        Physiolibrary.Chemical.Components.Substance A[4](                Simulation=
              SimulationType.SteadyState, solute_start=1e-08)
          "residual acid chains of hemoglobin subunits "
          annotation (Placement(transformation(extent={{64,70},{84,90}})));
        Physiolibrary.Chemical.Components.Substance HA[4](
          solute_start=0,
          Simulation=SimulationType.SteadyState,
          isDependent=true) "residual acid chains of hemoglobin subunits "
          annotation (Placement(transformation(extent={{-2,70},{18,90}})));
        Physiolibrary.Chemical.Components.ChemicalReaction protonation[4](nP=2, K=KA)
          annotation (Placement(transformation(extent={{26,70},{46,90}})));
        Modelica.Blocks.Math.Add add1[
                                     4] annotation (Placement(transformation(
              extent={{-4,-4},{4,4}},
              rotation=270,
              origin={44,62})));
        Physiolibrary.Chemical.Components.Substance NH2[4](                Simulation=
             SimulationType.SteadyState, solute_start=1e-08)
          "Val1 terminal of hemoglobin subunits "
          annotation (Placement(transformation(extent={{-4,18},{16,38}})));
        Physiolibrary.Chemical.Components.Substance NH3[
                                                       4](
          solute_start=0,
          Simulation=SimulationType.SteadyState,
          isDependent=true) "Val1 terminal of hemoglobin subunits "
          annotation (Placement(transformation(extent={{-80,18},{-60,38}})));
        Physiolibrary.Chemical.Components.ChemicalReaction protonation2[4](
                                                                          nP=2, K=Kz)
          annotation (Placement(transformation(extent={{-46,18},{-26,38}})));
        Modelica.Blocks.Math.Add3 add2[
                                     4] annotation (Placement(transformation(
              extent={{-4,-4},{4,4}},
              rotation=270,
              origin={6,-10})));
        Interfaces.ChemicalPort_a CO2 annotation (Placement(transformation(extent={{14,
                  40},{34,60}}), iconTransformation(extent={{14,40},{34,60}})));
        Physiolibrary.Chemical.Components.ChemicalReaction carboxylation[4](
          nP=2,
          nS=2,
          K=Kc) "Carboxylation of Valin1 amino terminus of hemogloni subunit"
          annotation (Placement(transformation(extent={{36,18},{56,38}})));
        Physiolibrary.Chemical.Components.Substance NHCOO[4](Simulation=
              SimulationType.SteadyState, solute_start=1e-08)
          "Val1 terminal of hemoglobin subunits "
          annotation (Placement(transformation(extent={{66,18},{86,38}})));
        Modelica.Blocks.Math.Sum sum2(nin=4)
          annotation (Placement(transformation(extent={{70,-22},{90,-2}})));
        Types.RealIO.AmountOfSubstanceOutput carboxy annotation (Placement(
              transformation(extent={{94,-22},{114,-2}}), iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={90,-40})));
        Types.RealIO.AmountOfSubstanceOutput protonated annotation (Placement(
              transformation(extent={{-52,64},{-32,84}}), iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={-100,-40})));
        Modelica.Blocks.Math.Sum sum3(nin=12)
          annotation (Placement(transformation(extent={{-76,64},{-56,84}})));
        Modelica.Blocks.Math.Gain neg[4](k=-1)
          annotation (Placement(transformation(extent={{-66,46},{-78,58}})));
      equation

        connect(OxyHm.solute, add.u2) annotation (Line(
            points={{-88,-36},{-88,-48},{-68.4,-48},{-68.4,-49.2}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(DeoxyHm.solute, add.u1) annotation (Line(
            points={{-32,-36},{-34,-36},{-34,-49.2},{-63.6,-49.2}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(OxyHm.q_out, oxygenation.substrates[1]) annotation (Line(
            points={{-88,-26},{-70,-26}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygenation.products[1], DeoxyHm.q_out) annotation (Line(
            points={{-50,-26.5},{-42,-26.5},{-42,-26},{-32,-26}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(Speciation.species, form) annotation (Line(
            points={{14,-82},{14,-90},{10,-90}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygenation[1].products[2], oxygen) annotation (Line(
            points={{-50,-25.5},{-36,-25.5},{-36,12},{102,12}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygenation[2].products[2], oxygen) annotation (Line(
            points={{-50,-25.5},{-36,-25.5},{-36,12},{102,12}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygenation[3].products[2], oxygen) annotation (Line(
            points={{-50,-25.5},{-36,-25.5},{-36,12},{102,12}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygenation[4].products[2], oxygen) annotation (Line(
            points={{-50,-25.5},{-36,-25.5},{-36,12},{102,12}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(Speciation.totalSubsystemAmount, tFormInside) annotation (Line(
            points={{24,-82},{24,-100},{-10,-100}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(OxyHm.solute, sum1.u) annotation (Line(
            points={{-88,-36},{-88,-90},{-84,-90}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(sum1.y, oxy) annotation (Line(
            points={{-61,-90},{-48,-90}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(HA.q_out, protonation.substrates[1]) annotation (Line(
            points={{8,80},{26,80}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(protonation.products[1], A.q_out) annotation (Line(
            points={{46,79.5},{46,80},{74,80}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(proton, protonation[1].products[2]) annotation (Line(
            points={{100,100},{58,100},{58,80.5},{46,80.5}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(protonation[2].products[2], proton) annotation (Line(
            points={{46,80.5},{58,80.5},{58,100},{100,100}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(protonation[3].products[2], proton) annotation (Line(
            points={{46,80.5},{58,80.5},{58,100},{100,100}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(protonation[4].products[2], proton) annotation (Line(
            points={{46,80.5},{58,80.5},{58,100},{100,100}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(HA.solute, add1.u2) annotation (Line(
            points={{8,70},{8,66.8},{41.6,66.8}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(A.solute, add1.u1) annotation (Line(
            points={{74,70},{74,68},{46.4,68},{46.4,66.8}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(DeoxyHm.q_out, Speciation.subunitSpecies[1:4]) annotation (Line(
            points={{-32,-26},{24,-26},{24,-64.4167}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(A.q_out, Speciation.subunitSpecies[5:8]) annotation (Line(
            points={{74,80},{50,80},{50,-63.75},{24,-63.75}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(add.y, Speciation.totalSubunitAmount[1:4]) annotation (Line(
            points={{-66,-58.4},{-66,-74.8333},{16,-74.8333}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(add1.y, Speciation.totalSubunitAmount[5:8]) annotation (Line(
            points={{44,57.6},{44,-73.5},{16,-73.5}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(NH3.q_out, protonation2.substrates[1]) annotation (Line(
            points={{-70,28},{-46,28}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(protonation2.products[1], NH2.q_out) annotation (Line(
            points={{-26,27.5},{6,27.5},{6,28}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(proton,protonation2 [1].products[2]) annotation (Line(
            points={{100,100},{-16,100},{-16,28.5},{-26,28.5}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(protonation2[2].products[2], proton) annotation (Line(
            points={{-26,28.5},{-16,28.5},{-16,100},{100,100}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(protonation2[3].products[2], proton) annotation (Line(
            points={{-26,28.5},{-16,28.5},{-16,100},{100,100}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(protonation2[4].products[2], proton) annotation (Line(
            points={{-26,28.5},{-16,28.5},{-16,100},{100,100}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(add2.y, Speciation.totalSubunitAmount[9:12]) annotation (Line(
            points={{6,-14.4},{6,-72.1667},{16,-72.1667}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(NH2.q_out, Speciation.subunitSpecies[9:12]) annotation (Line(
            points={{6,28},{24,28},{24,-63.0833}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(NH2.q_out, carboxylation.substrates[1]) annotation (Line(
            points={{6,28},{22,28},{22,27.5},{36,27.5}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(carboxylation.products[1], NHCOO.q_out) annotation (Line(
            points={{56,27.5},{66,27.5},{66,28},{76,28}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(carboxylation[1].products[2], proton) annotation (Line(
            points={{56,28.5},{62,28.5},{62,50},{88,50},{88,100},{100,100}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(carboxylation[1].substrates[2], CO2) annotation (Line(
            points={{36,28.5},{32,28.5},{32,50},{24,50}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
            connect(carboxylation[2].products[2], proton) annotation (Line(
            points={{56,28.5},{62,28.5},{62,50},{88,50},{88,100},{100,100}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(carboxylation[2].substrates[2], CO2) annotation (Line(
            points={{36,28.5},{32,28.5},{32,50},{24,50}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
            connect(carboxylation[3].products[2], proton) annotation (Line(
            points={{56,28.5},{62,28.5},{62,50},{88,50},{88,100},{100,100}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(carboxylation[3].substrates[2], CO2) annotation (Line(
            points={{36,28.5},{32,28.5},{32,50},{24,50}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
            connect(carboxylation[4].products[2], proton) annotation (Line(
            points={{56,28.5},{62,28.5},{62,50},{88,50},{88,100},{100,100}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(carboxylation[4].substrates[2], CO2) annotation (Line(
            points={{36,28.5},{32,28.5},{32,50},{24,50}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(sum2.y, carboxy) annotation (Line(
            points={{91,-12},{104,-12}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(NHCOO.solute, sum2.u) annotation (Line(
            points={{76,18},{76,4},{60,4},{60,-12},{68,-12}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(NH3.solute, add2.u3) annotation (Line(
            points={{-70,18},{-70,2},{2.8,2},{2.8,-5.2}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(NH2.solute, add2.u2) annotation (Line(
            points={{6,18},{6,-5.2}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(NHCOO.solute, add2.u1) annotation (Line(
            points={{76,18},{76,4},{9.2,4},{9.2,-5.2}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(protonated, sum3.y) annotation (Line(
            points={{-42,74},{-55,74}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(HA.solute, sum3.u[1:4]) annotation (Line(
            points={{8,70},{8,68},{-24,68},{-24,92},{-88,92},{-88,73.1667},{-78,
                73.1667}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(NH3.solute, sum3.u[5:8]) annotation (Line(
            points={{-70,18},{-70,8},{-88,8},{-88,74.5},{-78,74.5}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(neg.y, sum3.u[9:12]) annotation (Line(
            points={{-78.6,52},{-88,52},{-88,75.8333},{-78,75.8333}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(neg.u, NHCOO.solute) annotation (Line(
            points={{-64.8,52},{-12,52},{-12,8},{76,8},{76,18}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics),
          Documentation(revisions="<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}),
              graphics));
      end QuaternaryForm;

      model Hemoglobin "Hemoglobin model"
        import Physiolibrary.Types.*;
        import Physiolibrary;

       extends Physiolibrary.SteadyStates.Interfaces.SteadyStateSystem(
                                                Simulation=SimulationType.SteadyState);

      //  parameter GasSolubility alpha =  0.0105 * 1e-3 "oxygen solubility in plasma";   // by Siggaard Andersen: 0.0105 (mmol/l)/kPa

        parameter Fraction L = 7.0529*10^6
          "=[T0]/[R0] .. dissociation constant of relaxed <-> tensed change of deoxyhemoglobin tetramer";
        parameter Fraction Ln = 26884.8
          "quaternaly form ratio for specific stripped species of hemoglobin tetramer";
                                       //L*0.00381188                                                                     //"=L*(fnT/fnR)^4 for pH=7.2464 and CO2=0";
        parameter Fraction c = 0.00431555
          "=KR/KT .. ration between oxygen affinities of relaxed vs. tensed subunit";
        parameter Concentration KR = 0.000671946
          "oxygen dissociation on relaxed(R) hemoglobin subunit";   //*7.875647668393782383419689119171e-5
                                                                  //10.500001495896 7.8756465463794e-05

        parameter Concentration KT=KR/c
          "oxygen dissociation on tensed(T) hemoglobin subunit";

        parameter AmountOfSubstance totalAmountOfHemoglobin=0.001;

        Physiolibrary.Chemical.Components.ChemicalReaction
                                                  quaternaryForm(K=Ln)
          annotation (Placement(transformation(extent={{-18,38},{2,58}})));

        Physiolibrary.Chemical.Examples.Hemoglobin.QuaternaryForm R(
          KO2=KR,
          KA=10^(-6.89 + 3),
          Kz=10^(-7.25 + 3),
          Kc=10^(-8.35 + 3))
          annotation (Placement(transformation(extent={{-70,50},{-50,70}})));
        Physiolibrary.Chemical.Examples.Hemoglobin.QuaternaryForm T(
          KO2=KT,
          KA=10^(-7.52 + 3),
          Kz=10^(-7.73 + 3),
          Kc=10^(-7.54 + 3))
          annotation (Placement(transformation(extent={{70,52},{50,72}})));
        SteadyStates.Components.MolarConservationLaw totalHb(n=2, Total=
              totalAmountOfHemoglobin,
          Simulation=Physiolibrary.Types.SimulationType.SteadyState)
          annotation (Placement(transformation(extent={{76,32},{96,52}})));
        Physiolibrary.Chemical.Interfaces.ChemicalPort_a
                                  proton annotation (Placement(transformation(extent={{-10,72},
                  {10,92}}),          iconTransformation(extent={{90,90},{110,110}})));
        Physiolibrary.Chemical.Interfaces.ChemicalPort_a
                                  CO2 annotation (Placement(transformation(extent={{-50,72},
                  {-30,92}}),    iconTransformation(extent={{14,40},{34,60}})));
        Physiolibrary.Chemical.Interfaces.ChemicalPort_a
                                  oxygen annotation (Placement(transformation(extent={{30,72},
                  {50,92}}),           iconTransformation(extent={{90,-10},{110,10}})));
        Modelica.Blocks.Math.Division saturation
          annotation (Placement(transformation(extent={{26,-72},{46,-52}})));
        Modelica.Blocks.Math.Add oxy
          annotation (Placement(transformation(extent={{-14,-66},{6,-46}})));
        Physiolibrary.Types.RealIO.FractionOutput sO2
          annotation (Placement(transformation(extent={{64,-72},{84,-52}})));
        Modelica.Blocks.Math.Gain gain(k=4)
          annotation (Placement(transformation(extent={{-16,-96},{4,-76}})));
        Modelica.Blocks.Math.Add carboxy
          annotation (Placement(transformation(extent={{-60,-84},{-40,-64}})));
        Physiolibrary.Types.RealIO.FractionOutput sCO2
          annotation (Placement(transformation(extent={{64,-94},{84,-74}})));
        Modelica.Blocks.Math.Division saturation1
          annotation (Placement(transformation(extent={{28,-98},{48,-78}})));
        Modelica.Blocks.Math.Division saturation2
          annotation (Placement(transformation(extent={{28,-44},{48,-24}})));
        Physiolibrary.Types.RealIO.FractionOutput protonation
          annotation (Placement(transformation(extent={{64,-44},{84,-24}})));
        Modelica.Blocks.Math.Add protonated
          annotation (Placement(transformation(extent={{-14,-34},{6,-14}})));
      equation

        connect(R.form, quaternaryForm.substrates[1]) annotation (Line(
            points={{-60,50},{-60,48},{-18,48}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(T.form, quaternaryForm.products[1]) annotation (Line(
            points={{60,52},{60,48},{2,48}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(R.tFormInside, totalHb.fragment[1]) annotation (Line(
            points={{-66,51},{-66,37},{76,37}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(T.tFormInside, totalHb.fragment[2]) annotation (Line(
            points={{66,53},{66,39},{76,39}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(R.CO2, CO2) annotation (Line(
            points={{-57.6,65},{-57.6,64},{-40,64},{-40,82}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(proton, R.proton) annotation (Line(
            points={{0,82},{0,70},{-50,70}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(proton, T.proton) annotation (Line(
            points={{0,82},{0,72},{50,72}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(CO2, T.CO2) annotation (Line(
            points={{-40,82},{-40,67},{57.6,67}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(T.oxygen, oxygen) annotation (Line(
            points={{50,62},{40,62},{40,82}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(R.oxygen, oxygen) annotation (Line(
            points={{-50,60},{40,60},{40,82}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxy.y, saturation.u1) annotation (Line(
            points={{7,-56},{24,-56}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(saturation.y, sO2) annotation (Line(
            points={{47,-62},{74,-62}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(sO2, sO2) annotation (Line(
            points={{74,-62},{74,-62}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(R.oxy, oxy.u2) annotation (Line(
            points={{-51,52},{-36,52},{-36,-62},{-16,-62}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(T.oxy, oxy.u1) annotation (Line(
            points={{51,54},{36,54},{36,24},{-32,24},{-32,-50},{-16,-50}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(saturation.u2, gain.y) annotation (Line(
            points={{24,-68},{10,-68},{10,-86},{5,-86}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(gain.u, totalHb.totalAmountOfSubstance) annotation (Line(
            points={{-18,-86},{-28,-86},{-28,-100},{96,-100},{96,38}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(saturation1.y, sCO2) annotation (Line(
            points={{49,-88},{60,-88},{60,-84},{74,-84}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(gain.y, saturation1.u2) annotation (Line(
            points={{5,-86},{16,-86},{16,-94},{26,-94}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(carboxy.y, saturation1.u1) annotation (Line(
            points={{-39,-74},{16,-74},{16,-82},{26,-82}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(R.carboxy, carboxy.u2) annotation (Line(
            points={{-51,56},{-44,56},{-44,-48},{-76,-48},{-76,-80},{-62,-80}},
            color={0,0,127},
            smooth=Smooth.None));

        connect(T.carboxy, carboxy.u1) annotation (Line(
            points={{51,58},{32,58},{32,30},{-40,30},{-40,-56},{-72,-56},{-72,
                -68},{-62,-68}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(gain.y, saturation2.u2) annotation (Line(
            points={{5,-86},{10,-86},{10,-40},{26,-40}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(protonated.y, saturation2.u1) annotation (Line(
            points={{7,-24},{15.5,-24},{15.5,-28},{26,-28}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(saturation2.y, protonation) annotation (Line(
            points={{49,-34},{74,-34}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(R.protonated, protonated.u2) annotation (Line(
            points={{-70,56},{-78,56},{-78,-30},{-16,-30}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(T.protonated, protonated.u1) annotation (Line(
            points={{70,58},{70,-4},{-24,-4},{-24,-18},{-16,-18}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics),
           Documentation(revisions="<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end Hemoglobin;

      model Hemoglobin_oxygenation "Hemoglobin oxygenation experiment"
        import Physiolibrary.Types.*;
        import Physiolibrary;

       extends Modelica.Icons.Example;

        Physiolibrary.Chemical.Components.Substance
                            oxygen_unbound(Simulation=SimulationType.SteadyState, solute_start=0.000001
              *7.875647668393782383419689119171e-5)
          annotation (Placement(transformation(extent={{-4,-2},{16,18}})));
        Modelica.Blocks.Sources.Clock clock(offset=1e-06)
          annotation (Placement(transformation(extent={{-40,74},{-20,94}})));
        Sources.UnlimitedGasStorage oxygen_in_air(
          Simulation=Physiolibrary.Types.SimulationType.SteadyState,
          usePartialPressureInput=true,
          T=310.15)                                annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={6,60})));
        Components.GasSolubility
                              partialPressure1(          kH_T0(displayUnit="(mmol/l)/kPa at 25degC")=
               0.026029047188736, T=310.15)                             annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={6,32})));
        Sources.UnlimitedSolutionStorage pH(
          q_out(conc(nominal=10^(-7.4 + 3))),
          isIsolatedInSteadyState=false,
          Simulation=Physiolibrary.Types.SimulationType.SteadyState,
          Conc=10^(-7.2464 + 3))                                     annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={62,-10})));
        Physiolibrary.Chemical.Sources.UnlimitedGasStorage
                                    CO2_gas(
            Simulation=Physiolibrary.Types.SimulationType.SteadyState,
            PartialPressure=5332.8954966)
          annotation (Placement(transformation(extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-34,56})));
        Physiolibrary.Chemical.Components.GasSolubility
                                 gasSolubility(C=2400, kH_T0(displayUnit="(mmol/l)/kPa at 25degC")=
               0.81805576878885)
          annotation (Placement(transformation(extent={{-44,20},{-24,40}})));
        Physiolibrary.Chemical.Components.Substance
                             CO2_liquid(Simulation=Physiolibrary.Types.SimulationType.SteadyState,
            isDependent=true)
          annotation (Placement(transformation(extent={{-44,-4},{-24,16}})));
        Physiolibrary.Chemical.Examples.Hemoglobin.Hemoglobin hemoglobin(T(
            HA(solute_start=0.000652),
            A(solute_start=0.000348),
            NH3(solute_start=0.000651),
            NH2(solute_start=0.000214),
            NHCOO(solute_start=0.000135),
            DeoxyHm(solute_start=0.001),
            tFormInside(start=0.001)))
          annotation (Placement(transformation(extent={{-22,-68},{-2,-48}})));
        Physiolibrary.Types.RealIO.FractionOutput sO2
          annotation (Placement(transformation(extent={{68,-76},{88,-56}})));
      equation

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
        connect(gasSolubility.q_in,CO2_liquid. q_out) annotation (Line(
            points={{-34,22},{-34,6}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(CO2_gas.q_out,gasSolubility. q_out) annotation (Line(
            points={{-34,46},{-34,40}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(hemoglobin.proton, pH.q_out) annotation (Line(
            points={{-2,-48},{26,-48},{26,-10},{52,-10}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(hemoglobin.CO2, CO2_liquid.q_out) annotation (Line(
            points={{-9.6,-53},{-9.6,-23.5},{-34,-23.5},{-34,6}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(hemoglobin.oxygen, oxygen_unbound.q_out) annotation (Line(
            points={{-2,-58},{-6,-58},{-6,8},{6,8}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(hemoglobin.sO2, sO2) annotation (Line(
            points={{-4.6,-64.2},{33.4,-64.2},{33.4,-66},{78,-66}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics),
          experiment(StopTime=18000),
          __Dymola_experimentSetupOutput,
          Documentation(revisions="<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end Hemoglobin_oxygenation;

      model Hemoglobin_carboxylation_on_pH
        "Hemoglobin change of carboxylation during titration experiment"
        import Physiolibrary.Types.*;
        import Physiolibrary;

       extends Modelica.Icons.Example;

        Physiolibrary.Chemical.Components.Substance
                            oxygen_unbound(Simulation=SimulationType.SteadyState, solute_start=0.000001
              *7.875647668393782383419689119171e-5)
          annotation (Placement(transformation(extent={{-4,-2},{16,18}})));
        Modelica.Blocks.Sources.Clock clock(offset=6.9)
          annotation (Placement(transformation(extent={{30,34},{50,54}})));
        Sources.UnlimitedGasStorage oxygen_in_air(
          Simulation=Physiolibrary.Types.SimulationType.SteadyState,
          usePartialPressureInput=false,
          PartialPressure=0,
          T=310.15)                                annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={6,60})));
        Components.GasSolubility
                              partialPressure1(T=310.15, kH_T0(displayUnit=
                "(mmol/l)/kPa at 25degC") = 0.024913516594933)          annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={6,32})));
        Sources.UnlimitedSolutionStorage pH(
          q_out(conc(nominal=10^(-7.4 + 3))),
          isIsolatedInSteadyState=false,
          Simulation=Physiolibrary.Types.SimulationType.SteadyState,
          Conc=10^(-7.2464 + 3),
          useConcentrationInput=true)                                annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={62,-10})));
        Physiolibrary.Chemical.Sources.UnlimitedGasStorage
                                    CO2_gas(
            Simulation=Physiolibrary.Types.SimulationType.SteadyState,
          usePartialPressureInput=false,
          PartialPressure=5332.8954966)
          annotation (Placement(transformation(extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-34,56})));
        Physiolibrary.Chemical.Components.GasSolubility
                                 gasSolubility(C=2400, kH_T0(displayUnit="(mmol/l)/kPa at 25degC")=
               0.81805576878885)
          annotation (Placement(transformation(extent={{-44,20},{-24,40}})));
        Physiolibrary.Chemical.Components.Substance
                             CO2_liquid(Simulation=Physiolibrary.Types.SimulationType.SteadyState,
            isDependent=true)
          annotation (Placement(transformation(extent={{-44,-4},{-24,16}})));
        Physiolibrary.Chemical.Examples.Hemoglobin.Hemoglobin hemoglobin
          annotation (Placement(transformation(extent={{-22,-68},{-2,-48}})));
        Physiolibrary.Types.RealIO.FractionOutput sCO2
          annotation (Placement(transformation(extent={{68,-76},{88,-56}})));
        Physiolibrary.Blocks.Math.Exponentiation pow annotation (Placement(
              transformation(
              extent={{-4,-4},{4,4}},
              rotation=270,
              origin={92,38})));
        Modelica.Blocks.Math.Gain gain(k=-1)
          annotation (Placement(transformation(extent={{62,34},{82,54}})));
        Modelica.Blocks.Math.Gain toMolPerM3(k=1000)
          "from mol/liter to mmol/liter (=mol/m3)" annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={92,12})));
      equation

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
        connect(gasSolubility.q_in,CO2_liquid. q_out) annotation (Line(
            points={{-34,22},{-34,6}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(CO2_gas.q_out,gasSolubility. q_out) annotation (Line(
            points={{-34,46},{-34,40}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(hemoglobin.proton, pH.q_out) annotation (Line(
            points={{-2,-48},{26,-48},{26,-10},{52,-10}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(hemoglobin.CO2, CO2_liquid.q_out) annotation (Line(
            points={{-9.6,-53},{-9.6,-23.5},{-34,-23.5},{-34,6}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(hemoglobin.oxygen, oxygen_unbound.q_out) annotation (Line(
            points={{-2,-58},{-6,-58},{-6,8},{6,8}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(hemoglobin.sCO2, sCO2) annotation (Line(
            points={{-4.6,-66.4},{34.7,-66.4},{34.7,-66},{78,-66}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(clock.y, gain.u) annotation (Line(
            points={{51,44},{60,44}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(gain.y, pow.exponent) annotation (Line(
            points={{83,44},{90,44},{90,42},{89.6,42}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(pH.concentration, toMolPerM3.y) annotation (Line(
            points={{72,-10},{92,-10},{92,1}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(toMolPerM3.u, pow.y) annotation (Line(
            points={{92,24},{92,33.6}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics),
          experiment(StopTime=0.6),
          __Dymola_experimentSetupOutput,
          Documentation(revisions="<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end Hemoglobin_carboxylation_on_pH;

      model Hemoglobin_titration "Hemoglobin titration experiment"
        import Physiolibrary.Types.*;
        import Physiolibrary;

       extends Modelica.Icons.Example;

       extends Physiolibrary.SteadyStates.Interfaces.SteadyStateSystem(
                                                Simulation=SimulationType.SteadyState);

      //  parameter GasSolubility alpha =  0.0105 * 1e-3 "oxygen solubility in plasma";   // by Siggaard Andersen: 0.0105 (mmol/l)/kPa

        parameter Fraction L = 7.0529*10^6
          "=[T0]/[R0] .. dissociation constant of relaxed <-> tensed change of deoxyhemoglobin tetramer";
        parameter Fraction Ln = 26884.8
          "quaternaly form ratio for specific stripped species of hemoglobin tetramer";
                                       //L*0.00381188                                                                     //"=L*(fnT/fnR)^4 for pH=7.2464 and CO2=0";
        parameter Fraction c = 0.00431555
          "=KR/KT .. ration between oxygen affinities of relaxed vs. tensed subunit";
        parameter Concentration KR = 0.000671946
          "oxygen dissociation on relaxed(R) hemoglobin subunit";   //*7.875647668393782383419689119171e-5
                                                                  //10.500001495896 7.8756465463794e-05

        parameter Concentration KT=KR/c
          "oxygen dissociation on tensed(T) hemoglobin subunit";

        parameter AmountOfSubstance totalAmountOfHemoglobin=0.001;

        Physiolibrary.Chemical.Components.Substance
                            oxygen_unbound(Simulation=SimulationType.SteadyState, solute_start=0.000001
              *7.875647668393782383419689119171e-5)
          annotation (Placement(transformation(extent={{-4,-2},{16,18}})));
        Modelica.Blocks.Sources.Clock clock(offset=6.7)
          annotation (Placement(transformation(extent={{30,34},{50,54}})));
        Sources.UnlimitedGasStorage oxygen_in_air(
          Simulation=Physiolibrary.Types.SimulationType.SteadyState,
          usePartialPressureInput=false,
          PartialPressure=0,
          T=310.15)                                annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={6,60})));
        Components.GasSolubility
                              partialPressure1(T=310.15, kH_T0(displayUnit=
                "(mmol/l)/kPa at 25degC") = 0.024913516594933)          annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={6,32})));
        Sources.UnlimitedSolutionStorage pH(
          q_out(conc(nominal=10^(-7.4 + 3))),
          isIsolatedInSteadyState=false,
          Simulation=Physiolibrary.Types.SimulationType.SteadyState,
          Conc=10^(-7.2464 + 3),
          useConcentrationInput=true)                                annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={62,-10})));
        Physiolibrary.Chemical.Sources.UnlimitedGasStorage
                                    CO2_gas(
            Simulation=Physiolibrary.Types.SimulationType.SteadyState,
          usePartialPressureInput=false,
          PartialPressure=0)
          annotation (Placement(transformation(extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-34,56})));
        Physiolibrary.Chemical.Components.GasSolubility
                                 gasSolubility(C=2400, kH_T0(displayUnit="(mmol/l)/kPa at 25degC")=
               0.81805576878885)
          annotation (Placement(transformation(extent={{-44,20},{-24,40}})));
        Physiolibrary.Chemical.Components.Substance
                             CO2_liquid(Simulation=Physiolibrary.Types.SimulationType.SteadyState,
            isDependent=true)
          annotation (Placement(transformation(extent={{-44,-4},{-24,16}})));
        Physiolibrary.Chemical.Examples.Hemoglobin.Hemoglobin deoxyhemoglobin
          annotation (Placement(transformation(extent={{-22,-68},{-2,-48}})));
        Physiolibrary.Types.RealIO.FractionOutput protonation
          "allosteric-dependent protonation"
          annotation (Placement(transformation(extent={{68,-76},{88,-56}})));
        Physiolibrary.Blocks.Math.Exponentiation pow annotation (Placement(
              transformation(
              extent={{-4,-4},{4,4}},
              rotation=270,
              origin={92,38})));
        Modelica.Blocks.Math.Gain gain(k=-1)
          annotation (Placement(transformation(extent={{62,34},{82,54}})));
        Modelica.Blocks.Math.Gain toMolPerM3(k=1000)
          "from mol/liter to mmol/liter (=mol/m3)" annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={92,12})));
      equation

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
        connect(gasSolubility.q_in,CO2_liquid. q_out) annotation (Line(
            points={{-34,22},{-34,6}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(CO2_gas.q_out,gasSolubility. q_out) annotation (Line(
            points={{-34,46},{-34,40}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(deoxyhemoglobin.proton, pH.q_out) annotation (Line(
            points={{-2,-48},{26,-48},{26,-10},{52,-10}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(deoxyhemoglobin.CO2, CO2_liquid.q_out) annotation (Line(
            points={{-9.6,-53},{-9.6,-23.5},{-34,-23.5},{-34,6}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(deoxyhemoglobin.oxygen, oxygen_unbound.q_out) annotation (Line(
            points={{-2,-58},{-6,-58},{-6,8},{6,8}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(clock.y, gain.u) annotation (Line(
            points={{51,44},{60,44}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(gain.y, pow.exponent) annotation (Line(
            points={{83,44},{90,44},{90,42},{89.6,42}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(pH.concentration, toMolPerM3.y) annotation (Line(
            points={{72,-10},{92,-10},{92,1}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(toMolPerM3.u, pow.y) annotation (Line(
            points={{92,24},{92,33.6}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(deoxyhemoglobin.protonation, protonation) annotation (Line(
            points={{-4.6,-61.4},{34.7,-61.4},{34.7,-66},{78,-66}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics),
          experiment(StopTime=1.3),
          __Dymola_experimentSetupOutput,
          Documentation(revisions="<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end Hemoglobin_titration;

      model Hemoglobin_titration_shifts
        extends Modelica.Icons.Example;

        Hemoglobin_titration hemoglobin_titration
          annotation (Placement(transformation(extent={{-60,60},{-40,80}})));
        Hemoglobin_titration hemoglobin_titration1(CO2_gas(PartialPressure(
                displayUnit="kPa") = 1470))
          annotation (Placement(transformation(extent={{-28,60},{-8,80}})));
        Hemoglobin_titration hemoglobin_titration2(CO2_gas(PartialPressure(
                displayUnit="kPa") = 4530))
          annotation (Placement(transformation(extent={{0,60},{20,80}})));
        Hemoglobin_titration hemoglobin_titration3(CO2_gas(PartialPressure(
                displayUnit="kPa") = 10670))
          annotation (Placement(transformation(extent={{30,60},{50,80}})));
        Hemoglobin_titration hemoglobin_titration4(CO2_gas(PartialPressure(
                displayUnit="kPa") = 26660))
          annotation (Placement(transformation(extent={{60,60},{80,80}})));
        Hemoglobin_titration hemoglobin_titration5(oxygen_in_air(PartialPressure=19998.35811225))
          annotation (Placement(transformation(extent={{-60,-26},{-40,-6}})));
        Hemoglobin_titration hemoglobin_titration6(oxygen_in_air(PartialPressure=19998.35811225),CO2_gas(PartialPressure(
                displayUnit="kPa") = 1470))
          annotation (Placement(transformation(extent={{-28,-26},{-8,-6}})));
        Hemoglobin_titration hemoglobin_titration7(oxygen_in_air(PartialPressure=19998.35811225),CO2_gas(PartialPressure(
                displayUnit="kPa") = 4530))
          annotation (Placement(transformation(extent={{0,-26},{20,-6}})));
        Hemoglobin_titration hemoglobin_titration8(oxygen_in_air(PartialPressure=19998.35811225),CO2_gas(PartialPressure(
                displayUnit="kPa") = 10670))
          annotation (Placement(transformation(extent={{30,-26},{50,-6}})));
        Hemoglobin_titration hemoglobin_titration9(oxygen_in_air(PartialPressure=19998.35811225),CO2_gas(PartialPressure(
                displayUnit="kPa") = 26660))
          annotation (Placement(transformation(extent={{60,-26},{80,-6}})));
        Modelica.Blocks.Math.Feedback dH
          annotation (Placement(transformation(extent={{-54,22},{-34,42}})));
        Modelica.Blocks.Math.Feedback dH1
          annotation (Placement(transformation(extent={{-26,22},{-6,42}})));
        Modelica.Blocks.Math.Feedback dH2
          annotation (Placement(transformation(extent={{10,22},{30,42}})));
        Modelica.Blocks.Math.Feedback dH3
          annotation (Placement(transformation(extent={{36,22},{56,42}})));
        Modelica.Blocks.Math.Feedback dH4
          annotation (Placement(transformation(extent={{70,20},{90,40}})));
      equation
        connect(hemoglobin_titration.protonation, dH.u1) annotation (Line(
            points={{-42.2,63.4},{-42.2,47.7},{-52,47.7},{-52,32}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(dH.u2, hemoglobin_titration5.protonation) annotation (Line(
            points={{-44,24},{-42,24},{-42,-22.6},{-42.2,-22.6}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(hemoglobin_titration1.protonation, dH1.u1) annotation (Line(
            points={{-10.2,63.4},{-10.2,47.7},{-24,47.7},{-24,32}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(dH1.u2, hemoglobin_titration6.protonation) annotation (Line(
            points={{-16,24},{-14,24},{-14,-22.6},{-10.2,-22.6}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(dH2.u2, hemoglobin_titration7.protonation) annotation (Line(
            points={{20,24},{20,-22.6},{17.8,-22.6}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(hemoglobin_titration2.protonation, dH2.u1) annotation (Line(
            points={{17.8,63.4},{17.8,47.7},{12,47.7},{12,32}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(hemoglobin_titration3.protonation, dH3.u1) annotation (Line(
            points={{47.8,63.4},{47.8,46.7},{38,46.7},{38,32}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(dH3.u2, hemoglobin_titration8.protonation) annotation (Line(
            points={{46,24},{47.8,24},{47.8,-22.6}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(hemoglobin_titration4.protonation, dH4.u1) annotation (Line(
            points={{77.8,63.4},{77.8,46.7},{72,46.7},{72,30}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(dH4.u2, hemoglobin_titration9.protonation) annotation (Line(
            points={{80,22},{80,-22.6},{77.8,-22.6}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (
          Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics),
          experiment(StopTime=1.1),
          __Dymola_experimentSetupOutput);
      end Hemoglobin_titration_shifts;

      model QuaternaryForm2
        "Model of hemoglobin space-structure form (can be parametrized as relaxed or tensed)"
        import Physiolibrary.Types.*;

        parameter Concentration KA = 10^(-6.89+3)
          "dissociation coefficient for acid chains of subunit";
        parameter Concentration Kz = 10^(-7.25+3)
          "valine 1 amino terminus dissociation coefficient of protonation to NH3+";
        parameter Concentration Kc = 10^(-8.35+3)
          "valine 1 amino terminus dissociation coefficient of protonation to NH3+";
        parameter Concentration KO2 = 0.000671946
          "oxygen dissociation coefficient of hemoglobin subunit";   //*7.875647668393782383419689119171e-5
                                                                  //10.500001495896 7.8756465463794e-05

        Components.Speciation Speciation(NumberOfSubunitTypes=12)
          annotation (Placement(transformation(extent={{60,-20},{40,0}})));
        Physiolibrary.Chemical.Components.Substance OxyHm[4](
          solute_start=0,
          Simulation=SimulationType.SteadyState,
          isDependent=true) "Oxygenated subunit of hemoglobin tetramer"
          annotation (Placement(transformation(extent={{-90,-68},{-70,-48}})));
        Physiolibrary.Chemical.Components.ChemicalReaction oxygenation[4](nP=2, K=KO2)
          annotation (Placement(transformation(extent={{-62,-68},{-42,-48}})));
        Physiolibrary.Chemical.Components.Substance DeoxyHm[4](Simulation=
              SimulationType.SteadyState, solute_start=1e-08)
          "Deoxygenated subunit of hemoglobin tetramer"
          annotation (Placement(transformation(extent={{-34,-68},{-14,-48}})));

        Modelica.Blocks.Math.Add add[4] annotation (Placement(transformation(
              extent={{-4,-4},{4,4}},
              rotation=270,
              origin={-58,-80})));
        Interfaces.ChemicalPort_a O2 annotation (Placement(transformation(
                extent={{-26,-50},{-6,-30}}),  iconTransformation(extent={{-26,-50},
                  {-6,-30}})));
        Interfaces.ChemicalPort_a sForm annotation (Placement(transformation(extent={{
                  72,-54},{92,-34}}), iconTransformation(extent={{68,-50},{88,
                  -30}})));
        Interfaces.ChemicalPort_a H "hydrogen ion (proton)" annotation (
            Placement(transformation(extent={{-32,18},{-12,38}}),
              iconTransformation(extent={{-32,18},{-12,38}})));
        Physiolibrary.Chemical.Components.Substance A[4](                Simulation=
              SimulationType.SteadyState, solute_start=1e-08)
          "residual acid chains of hemoglobin subunits "
          annotation (Placement(transformation(extent={{-24,-14},{-4,6}})));
        Physiolibrary.Chemical.Components.Substance HA[4](
          solute_start=0,
          Simulation=SimulationType.SteadyState,
          isDependent=true) "residual acid chains of hemoglobin subunits "
          annotation (Placement(transformation(extent={{-90,-14},{-70,6}})));
        Physiolibrary.Chemical.Components.ChemicalReaction protonation[4](nP=2, K=KA)
          annotation (Placement(transformation(extent={{-62,-14},{-42,6}})));
        Modelica.Blocks.Math.Add add1[
                                     4] annotation (Placement(transformation(
              extent={{-4,-4},{4,4}},
              rotation=270,
              origin={-52,-24})));
        Physiolibrary.Chemical.Components.Substance NH2[4](                Simulation=
             SimulationType.SteadyState, solute_start=1e-08)
          "Val1 terminal of hemoglobin subunits "
          annotation (Placement(transformation(extent={{-10,52},{10,72}})));
        Physiolibrary.Chemical.Components.Substance NH3[
                                                       4](
          solute_start=0,
          Simulation=SimulationType.SteadyState,
          isDependent=true) "Val1 terminal of hemoglobin subunits "
          annotation (Placement(transformation(extent={{-86,52},{-66,72}})));
        Physiolibrary.Chemical.Components.ChemicalReaction protonation2[4](
                                                                          nP=2, K=Kz)
          annotation (Placement(transformation(extent={{-58,52},{-38,72}})));
        Modelica.Blocks.Math.Add3 add2[
                                     4] annotation (Placement(transformation(
              extent={{-4,-4},{4,4}},
              rotation=270,
              origin={0,40})));
        Interfaces.ChemicalPort_a CO2 annotation (Placement(transformation(extent={{-6,76},
                  {14,96}}),     iconTransformation(extent={{-6,76},{14,96}})));
        Physiolibrary.Chemical.Components.ChemicalReaction carboxylation[4](
          nP=2,
          nS=2,
          K=Kc) "Carboxylation of Valin1 amino terminus of hemogloni subunit"
          annotation (Placement(transformation(extent={{36,52},{56,72}})));
        Physiolibrary.Chemical.Components.Substance NHCOO[4](Simulation=
              SimulationType.SteadyState, solute_start=1e-08)
          "Val1 terminal of hemoglobin subunits "
          annotation (Placement(transformation(extent={{66,52},{86,72}})));
        Types.RealIO.AmountOfSubstanceOutput tAmount(start=1e-08) annotation (
            Placement(transformation(extent={{-10,-10},{10,10}},
              rotation=270,
              origin={50,-86}),                                   iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={40,-90})));
      equation

        connect(OxyHm.solute, add.u2) annotation (Line(
            points={{-80,-68},{-80,-74},{-60.4,-74},{-60.4,-75.2}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(DeoxyHm.solute, add.u1) annotation (Line(
            points={{-24,-68},{-26,-68},{-26,-75.2},{-55.6,-75.2}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(OxyHm.q_out, oxygenation.substrates[1]) annotation (Line(
            points={{-80,-58},{-62,-58}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygenation.products[1], DeoxyHm.q_out) annotation (Line(
            points={{-42,-58.5},{-34,-58.5},{-34,-58},{-24,-58}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(Speciation.species, sForm) annotation (Line(
            points={{40,-18},{40,-44},{82,-44}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygenation[1].products[2], O2) annotation (Line(
            points={{-42,-57.5},{-36,-57.5},{-36,-40},{-16,-40}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygenation[2].products[2], O2) annotation (Line(
            points={{-42,-57.5},{-36,-57.5},{-36,-40},{-16,-40}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygenation[3].products[2], O2) annotation (Line(
            points={{-42,-57.5},{-36,-57.5},{-36,-40},{-16,-40}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygenation[4].products[2], O2) annotation (Line(
            points={{-42,-57.5},{-36,-57.5},{-36,-40},{-16,-40}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(HA.q_out, protonation.substrates[1]) annotation (Line(
            points={{-80,-4},{-62,-4}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(protonation.products[1], A.q_out) annotation (Line(
            points={{-42,-4.5},{-42,-4},{-14,-4}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(H, protonation[1].products[2]) annotation (Line(
            points={{-22,28},{-32,28},{-32,-3.5},{-42,-3.5}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(protonation[2].products[2], H) annotation (Line(
            points={{-42,-3.5},{-32,-3.5},{-32,28},{-22,28}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(protonation[3].products[2], H) annotation (Line(
            points={{-42,-3.5},{-32,-3.5},{-32,28},{-22,28}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(protonation[4].products[2], H) annotation (Line(
            points={{-42,-3.5},{-32,-3.5},{-32,28},{-22,28}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(HA.solute, add1.u2) annotation (Line(
            points={{-80,-14},{-80,-19.2},{-54.4,-19.2}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(A.solute, add1.u1) annotation (Line(
            points={{-14,-14},{-14,-16},{-49.6,-16},{-49.6,-19.2}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(DeoxyHm.q_out, Speciation.subunitSpecies[1:4]) annotation (Line(
            points={{-24,-58},{-24,-52},{28,-52},{28,0},{50,0},{50,-0.416667}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(A.q_out, Speciation.subunitSpecies[5:8]) annotation (Line(
            points={{-14,-4},{-14,0.25},{50,0.25}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(add.y, Speciation.totalSubunitAmount[1:4]) annotation (Line(
            points={{-58,-84.4},{-58,-86},{14,-86},{14,-10.8333},{42,-10.8333}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(add1.y, Speciation.totalSubunitAmount[5:8]) annotation (Line(
            points={{-52,-28.4},{-52,-28},{12,-28},{12,-9.5},{42,-9.5}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(NH3.q_out, protonation2.substrates[1]) annotation (Line(
            points={{-76,62},{-58,62}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(protonation2.products[1], NH2.q_out) annotation (Line(
            points={{-38,61.5},{0,61.5},{0,62}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(H, protonation2[1].products[2]) annotation (Line(
            points={{-22,28},{-22,62.5},{-38,62.5}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(protonation2[2].products[2], H) annotation (Line(
            points={{-38,62.5},{-22,62.5},{-22,28}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(protonation2[3].products[2], H) annotation (Line(
            points={{-38,62.5},{-22,62.5},{-22,28}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(protonation2[4].products[2], H) annotation (Line(
            points={{-38,62.5},{-22,62.5},{-22,28}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(add2.y, Speciation.totalSubunitAmount[9:12]) annotation (Line(
            points={{0,35.6},{0,32},{12,32},{12,28},{12,-8.16667},{42,-8.16667},
                {42,-8.16667}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(NH2.q_out, Speciation.subunitSpecies[9:12]) annotation (Line(
            points={{0,62},{0,58},{28,58},{28,0.916667},{50,0.916667}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(NH2.q_out, carboxylation.substrates[1]) annotation (Line(
            points={{0,62},{0,61.5},{36,61.5}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(carboxylation.products[1], NHCOO.q_out) annotation (Line(
            points={{56,61.5},{76,61.5},{76,62}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(carboxylation[1].products[2], H) annotation (Line(
            points={{56,62.5},{62,62.5},{62,28},{-22,28}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(carboxylation[1].substrates[2], CO2) annotation (Line(
            points={{36,62.5},{26,62.5},{26,86},{4,86}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(carboxylation[2].products[2], H) annotation (Line(
            points={{56,62.5},{62,62.5},{62,28},{-22,28}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(carboxylation[2].substrates[2], CO2) annotation (Line(
            points={{36,62.5},{26,62.5},{26,86},{4,86}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(carboxylation[3].products[2], H) annotation (Line(
            points={{56,62.5},{62,62.5},{62,28},{-22,28}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(carboxylation[3].substrates[2], CO2) annotation (Line(
            points={{36,62.5},{26,62.5},{26,86},{4,86}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(carboxylation[4].products[2], H) annotation (Line(
            points={{56,62.5},{62,62.5},{62,28},{-22,28}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(carboxylation[4].substrates[2], CO2) annotation (Line(
            points={{36,62.5},{26,62.5},{26,86},{4,86}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(NH3.solute, add2.u3) annotation (Line(
            points={{-76,52},{-76,44.8},{-3.2,44.8}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(NH2.solute, add2.u2) annotation (Line(
            points={{0,52},{0,44.8}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(NHCOO.solute, add2.u1) annotation (Line(
            points={{76,52},{76,44.8},{3.2,44.8}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(Speciation.totalSubsystemAmount, tAmount) annotation (Line(
            points={{50,-18},{50,-86}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics={
              Ellipse(
                extent={{-94,-44},{4,-80}},
                lineColor={127,0,0},
                fillColor={255,170,170},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{-98,16},{8,-28}},
                lineColor={0,0,255},
                fillColor={179,254,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{-94,80},{98,42}},
                lineColor={127,127,0},
                fillColor={213,255,170},
                fillPattern=FillPattern.Solid)}),
          Documentation(revisions="<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}),
              graphics={
              Rectangle(extent={{-100,100},{100,-100}}, lineColor={0,0,127}),
              Ellipse(
                extent={{-94,78},{98,40}},
                lineColor={127,127,0},
                fillColor={213,255,170},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{-98,14},{8,-30}},
                lineColor={0,0,255},
                fillColor={179,254,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{-94,-46},{4,-82}},
                lineColor={127,0,0},
                fillColor={255,170,170},
                fillPattern=FillPattern.Solid)}));
      end QuaternaryForm2;

      model Hemoglobin2 "Hemoglobin model"
        import Physiolibrary.Types.*;
        import Physiolibrary;

       extends Physiolibrary.SteadyStates.Interfaces.SteadyStateSystem(
                                                Simulation=SimulationType.SteadyState);

      //  parameter GasSolubility alpha =  0.0105 * 1e-3 "oxygen solubility in plasma";   // by Siggaard Andersen: 0.0105 (mmol/l)/kPa

        parameter Fraction L = 7.0529*10^6
          "=[T0]/[R0] .. dissociation constant of relaxed <-> tensed change of deoxyhemoglobin tetramer";
        parameter Fraction Ln = 26884.8
          "quaternaly form ratio for specific stripped species of hemoglobin tetramer";
                                       //L*0.00381188                                                                     //"=L*(fnT/fnR)^4 for pH=7.2464 and CO2=0";
        parameter Fraction c = 0.00431555
          "=KR/KT .. ration between oxygen affinities of relaxed vs. tensed subunit";
        parameter Concentration KR = 0.000671946
          "oxygen dissociation on relaxed(R) hemoglobin subunit";   //*7.875647668393782383419689119171e-5
                                                                  //10.500001495896 7.8756465463794e-05

        parameter Concentration KT=KR/c
          "oxygen dissociation on tensed(T) hemoglobin subunit";

        parameter AmountOfSubstance totalAmountOfHemoglobin=0.001;

        Physiolibrary.Chemical.Components.ChemicalReaction
                                                  quaternaryForm(K=Ln)
          annotation (Placement(transformation(extent={{-16,26},{4,46}})));

        Physiolibrary.Chemical.Examples.Hemoglobin.QuaternaryForm2 R(
          KO2=KR,
          KA=10^(-6.89 + 3),
          Kz=10^(-7.25 + 3),
          Kc=10^(-8.35 + 3))
          annotation (Placement(transformation(extent={{-40,30},{-20,50}})));
        Physiolibrary.Chemical.Examples.Hemoglobin.QuaternaryForm2 T(
          KO2=KT,
          KA=10^(-7.52 + 3),
          Kz=10^(-7.73 + 3),
          Kc=10^(-7.54 + 3))
          annotation (Placement(transformation(extent={{32,30},{12,50}})));
        SteadyStates.Components.MolarConservationLaw totalHb(n=2, Total=
              totalAmountOfHemoglobin,
          Simulation=Physiolibrary.Types.SimulationType.SteadyState)
          annotation (Placement(transformation(extent={{22,2},{42,22}})));
        Physiolibrary.Chemical.Interfaces.ChemicalPort_a H "H+ (proton)"
          annotation (Placement(transformation(extent={{6,66},{26,86}}),
              iconTransformation(extent={{90,90},{110,110}})));
        Physiolibrary.Chemical.Interfaces.ChemicalPort_a
                                  CO2 "carbon dioxide"
                                      annotation (Placement(transformation(extent={{-22,54},
                  {-2,74}}),     iconTransformation(extent={{14,40},{34,60}})));
        Physiolibrary.Chemical.Interfaces.ChemicalPort_a O2 "oxygen"
          annotation (Placement(transformation(extent={{-54,78},{-34,98}}),
              iconTransformation(extent={{90,-10},{110,10}})));
      equation

        connect(R.CO2, CO2) annotation (Line(
            points={{-29.6,48.6},{-29.6,64},{-12,64}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(CO2, T.CO2) annotation (Line(
            points={{-12,64},{22,64},{22,48},{21.6,48},{21.6,48.6}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));

        connect(R.O2, O2) annotation (Line(
            points={{-31.6,36},{-44,36},{-44,88}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(R.H, H) annotation (Line(
            points={{-32.2,42.8},{-32.2,42},{-34,42},{-34,76},{16,76}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(R.sForm, quaternaryForm.substrates[1]) annotation (Line(
            points={{-22.2,36},{-16,36}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(T.O2, O2) annotation (Line(
            points={{23.6,36},{36,36},{36,88},{-44,88}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(T.H, H) annotation (Line(
            points={{24.2,42.8},{26,42.8},{26,76},{16,76}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(T.sForm, quaternaryForm.products[1]) annotation (Line(
            points={{14.2,36},{4,36}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(R.tAmount, totalHb.fragment[1]) annotation (Line(
            points={{-26,31},{-26,7},{22,7}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(T.tAmount, totalHb.fragment[2]) annotation (Line(
            points={{18,31},{18,8},{22,8},{22,9}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics),
           Documentation(revisions="<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end Hemoglobin2;

      model Allosteric_Hemoglobin_MWC22 "Monod,Wyman,Changeux (1965)"
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
          annotation (Placement(transformation(extent={{28,78},{48,98}})));

        Components.Substance                       T1(stateName="T1",Simulation=SimulationType.SteadyState,
          solute_start=0)
          annotation (Placement(transformation(extent={{30,36},{50,56}})));

        Components.Substance                       R1(stateName="R1",Simulation=SimulationType.SteadyState,
          solute_start=0,
          isDependent=true)
          annotation (Placement(transformation(extent={{-24,36},{-4,56}})));

        Components.Substance                       T2(stateName="T2",Simulation=SimulationType.SteadyState,
          solute_start=0)
          annotation (Placement(transformation(extent={{30,-10},{50,10}})));

        Components.Substance                       R2(stateName="R2",Simulation=SimulationType.SteadyState,
          solute_start=0)
          annotation (Placement(transformation(extent={{-24,-10},{-4,10}})));

        Components.Substance                       T3(stateName="T3",Simulation=SimulationType.SteadyState,
          solute_start=0)
          annotation (Placement(transformation(extent={{30,-54},{50,-34}})));

        Components.Substance                       R3(stateName="R3",Simulation=SimulationType.SteadyState,
          solute_start=0)
          annotation (Placement(transformation(extent={{-24,-54},{-4,-34}})));

        Components.Substance                       T4(stateName="T4",Simulation=SimulationType.SteadyState,
          solute_start=0,
          isDependent=true)
          annotation (Placement(transformation(extent={{30,-94},{50,-74}})));

        Components.Substance                       R4(stateName="R4",Simulation=SimulationType.SteadyState,
          solute_start=0)
          annotation (Placement(transformation(extent={{-24,-94},{-4,-74}})));

        Components.Substance                       R0(stateName="R0",Simulation=SimulationType.SteadyState,
          solute_start=0)
          annotation (Placement(transformation(extent={{-24,78},{-4,98}})));

        Components.ChemicalReaction               quaternaryForm(K=L)
          annotation (Placement(transformation(extent={{0,78},{20,98}})));
        Components.ChemicalReaction                oxyR1(nP=2, K=KR/4)
                                                                  annotation (Placement(
              transformation(
              extent={{-10,10},{10,-10}},
              rotation=90,
              origin={-14,64})));
        Components.ChemicalReaction                oxyT1(nP=2, K=KT/4)
                                                                  annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={40,64})));
        Components.ChemicalReaction                oxyR2(nP=2, K=KR/(3/2))
                                                                  annotation (Placement(
              transformation(
              extent={{-10,10},{10,-10}},
              rotation=90,
              origin={-14,22})));
        Components.ChemicalReaction                oxyR3(nP=2, K=KR/(2/3))
                                                                  annotation (Placement(
              transformation(
              extent={{-10,10},{10,-10}},
              rotation=90,
              origin={-14,-24})));
        Components.ChemicalReaction                oxyR4(nP=2, K=KR*4)
                                                                  annotation (Placement(
              transformation(
              extent={{-10,10},{10,-10}},
              rotation=90,
              origin={-14,-68})));
        Components.ChemicalReaction                oxyT2(nP=2, K=KT/(3/2))
                                                                  annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={40,22})));
        Components.ChemicalReaction                oxyT3(nP=2, K=KT/(2/3))
                                                                  annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={40,-24})));
        Components.ChemicalReaction                oxyT4(nP=2, K=KT*4)
                                                                  annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={40,-68})));
        Components.ChemicalReaction               quaternaryForm1(K=c*L)
          annotation (Placement(transformation(extent={{4,36},{24,56}})));
        Components.ChemicalReaction               quaternaryForm2(K=(c^2)*L)
          annotation (Placement(transformation(extent={{4,-10},{24,10}})));
        Components.ChemicalReaction               quaternaryForm3(K=(c^3)*L)
          annotation (Placement(transformation(extent={{4,-54},{24,-34}})));
        Components.ChemicalReaction               quaternaryForm4(K=(c^4)*L)
          annotation (Placement(transformation(extent={{6,-94},{26,-74}})));


        Components.Substance oxygen_unbound(                                      solute_start=0.000001
              *7.875647668393782383419689119171e-5,
          Simulation=SimulationType.SteadyState)
          annotation (Placement(transformation(extent={{66,78},{86,98}})));
        SteadyStates.Components.MolarConservationLaw totalHb(
          n=10,
          Total(displayUnit="mol") = 1,
          Simulation=Physiolibrary.Types.SimulationType.SteadyState)
          annotation (Placement(transformation(extent={{70,-92},{90,-72}})));
      equation
         sO2 = (R1.solute + 2*R2.solute + 3*R3.solute + 4*R4.solute + T1.solute + 2*T2.solute + 3*T3.solute + 4*T4.solute)/(4*totalAmountOfHemoglobin);
         totalAmountOfRforms = R0.solute + R1.solute + R2.solute + R3.solute + R4.solute;
         totalAmountOfTforms = T0.solute + T1.solute + T2.solute + T3.solute + T4.solute;

         totalAmountOfHemoglobin*normalizedState[1] = totalAmountOfRforms + totalAmountOfTforms;

        connect(quaternaryForm.products[1],T0. q_out) annotation (Line(
            points={{20,88},{38,88}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxyR1.substrates[1],R1. q_out) annotation (Line(
            points={{-14,54},{-14,46}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(R1.q_out,oxyR2. products[1]) annotation (Line(
            points={{-14,46},{-14,32},{-14.5,32}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxyR2.substrates[1],R2. q_out) annotation (Line(
            points={{-14,12},{-14,0}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxyR3.substrates[1],R3. q_out) annotation (Line(
            points={{-14,-34},{-14,-44}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxyR3.products[1],R2. q_out) annotation (Line(
            points={{-14.5,-14},{-14.5,-7},{-14,-7},{-14,0}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(R3.q_out,oxyR4. products[1]) annotation (Line(
            points={{-14,-44},{-14,-58},{-14.5,-58}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxyR4.substrates[1],R4. q_out) annotation (Line(
            points={{-14,-78},{-14,-84}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxyT1.products[1],T0. q_out) annotation (Line(
            points={{40.5,74},{40.5,88},{38,88}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxyT1.substrates[1],T1. q_out) annotation (Line(
            points={{40,54},{40,46}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(T1.q_out,oxyT2. products[1]) annotation (Line(
            points={{40,46},{40,32},{40.5,32}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxyT2.substrates[1],T2. q_out) annotation (Line(
            points={{40,12},{40,0}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(T2.q_out,oxyT3. products[1]) annotation (Line(
            points={{40,0},{40,-14},{40.5,-14}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxyT3.substrates[1],T3. q_out) annotation (Line(
            points={{40,-34},{40,-44}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(T3.q_out,oxyT4. products[1]) annotation (Line(
            points={{40,-44},{40,-58},{40.5,-58}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxyT4.substrates[1],T4. q_out) annotation (Line(
            points={{40,-78},{40,-84}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(R0.q_out,quaternaryForm. substrates[1]) annotation (Line(
            points={{-14,88},{0,88}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(R0.q_out,oxyR1. products[1]) annotation (Line(
            points={{-14,88},{-14,74},{-14.5,74}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(R1.q_out,quaternaryForm1. substrates[1]) annotation (Line(
            points={{-14,46},{4,46}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(quaternaryForm1.products[1],T1. q_out) annotation (Line(
            points={{24,46},{40,46}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(R2.q_out,quaternaryForm2. substrates[1]) annotation (Line(
            points={{-14,0},{4,0}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(quaternaryForm2.products[1],T2. q_out) annotation (Line(
            points={{24,0},{40,0}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(R3.q_out,quaternaryForm3. substrates[1]) annotation (Line(
            points={{-14,-44},{4,-44}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(quaternaryForm3.products[1],T3. q_out) annotation (Line(
            points={{24,-44},{40,-44}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(R4.q_out,quaternaryForm4. substrates[1]) annotation (Line(
            points={{-14,-84},{6,-84}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(quaternaryForm4.products[1],T4. q_out) annotation (Line(
            points={{26,-84},{40,-84}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxyR1.products[2],oxygen_unbound. q_out)
                                            annotation (Line(
            points={{-13.5,74},{-28,74},{-28,98},{54,98},{54,88},{76,88}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxyR2.products[2],oxygen_unbound. q_out)
                                            annotation (Line(
            points={{-13.5,32},{-28,32},{-28,98},{54,98},{54,88},{76,88}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxyR3.products[2],oxygen_unbound. q_out)
                                            annotation (Line(
            points={{-13.5,-14},{-28,-14},{-28,98},{54,98},{54,88},{76,88}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxyR4.products[2],oxygen_unbound. q_out)
                                            annotation (Line(
            points={{-13.5,-58},{-28,-58},{-28,98},{54,98},{54,88},{76,88}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygen_unbound.q_out, oxyT1.products[2])
                                            annotation (Line(
            points={{76,88},{54,88},{54,74},{39.5,74}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygen_unbound.q_out, oxyT2.products[2])
                                            annotation (Line(
            points={{76,88},{54,88},{54,32},{39.5,32}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygen_unbound.q_out, oxyT3.products[2])
                                            annotation (Line(
            points={{76,88},{54,88},{54,-14},{39.5,-14}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygen_unbound.q_out, oxyT4.products[2])
                                            annotation (Line(
            points={{76,88},{54,88},{54,-58},{39.5,-58}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(R4.solute, totalHb.fragment[1]) annotation (Line(
            points={{-14,-94},{64,-94},{64,-87.8},{70,-87.8}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(T4.solute, totalHb.fragment[2]) annotation (Line(
            points={{40,-94},{64,-94},{64,-87.4},{70,-87.4}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(R3.solute, totalHb.fragment[3]) annotation (Line(
            points={{-14,-54},{64,-54},{64,-87},{70,-87}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(T3.solute, totalHb.fragment[4]) annotation (Line(
            points={{40,-54},{64,-54},{64,-86.6},{70,-86.6}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(R2.solute, totalHb.fragment[5]) annotation (Line(
            points={{-14,-10},{64,-10},{64,-86.2},{70,-86.2}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(R1.solute, totalHb.fragment[7]) annotation (Line(
            points={{-14,36},{64,36},{64,-85.4},{70,-85.4}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(T1.solute, totalHb.fragment[8]) annotation (Line(
            points={{40,36},{64,36},{64,-85},{70,-85}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(R0.solute, totalHb.fragment[9]) annotation (Line(
            points={{-14,78},{64,78},{64,-84.6},{70,-84.6}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(T0.solute, totalHb.fragment[10]) annotation (Line(
            points={{38,78},{64,78},{64,-84.2},{70,-84.2}},
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
</html>",   revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end Allosteric_Hemoglobin_MWC22;

      model Allosteric_Hemoglobin2_MWC2
        "Monod,Wyman,Changeux (1965) - The same allosteric hemoglobin model implemented by Speciation blocks"
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
          annotation (Placement(transformation(extent={{-10,-98},{10,-78}})));
        Components.Speciation
                           R0_in_R(NumberOfSubunitTypes=4)
          annotation (Placement(transformation(extent={{-28,-90},{-48,-70}})));
        Components.Speciation
                           T0_in_T(NumberOfSubunitTypes=4)
          annotation (Placement(transformation(extent={{70,-90},{50,-70}})));
        Physiolibrary.Chemical.Components.Substance OxyRHm[4](
          each Simulation=SimulationType.SteadyState,
          each isDependent=true,
          each solute_start=4e-19)
          "Oxygenated subunit in R structure of hemoglobin tetramer"
          annotation (Placement(transformation(extent={{-98,-36},{-78,-16}})));
        Physiolibrary.Chemical.Components.ChemicalReaction oxygenation_R[4](each K=KR, each nP=2)
          annotation (Placement(transformation(extent={{-70,-36},{-50,-16}})));
        Physiolibrary.Chemical.Components.Substance DeoxyRHm[4](each Simulation=
              SimulationType.SteadyState, each solute_start=4e-11)
          "Deoxygenated subunit in R structure of hemoglobin tetramer"
          annotation (Placement(transformation(extent={{-42,-36},{-22,-16}})));
        Physiolibrary.Chemical.Components.Substance OxyTHm[4](
          each Simulation=SimulationType.SteadyState,
          each isDependent=true,
          each solute_start=1e-14)
          "Oxygenated subunit in T structure of hemoglobin tetramer"
          annotation (Placement(transformation(extent={{16,-36},{36,-16}})));
        Physiolibrary.Chemical.Components.ChemicalReaction oxygenation_T[4](each K=KT, each nP=2)
          annotation (Placement(transformation(extent={{44,-36},{64,-16}})));
        Physiolibrary.Chemical.Components.Substance DeoxyTHm[4](
                                                 each Simulation=SimulationType.SteadyState,
            each solute_start=0.00025)
          "Deoxygenated subunit in T structure of hemoglobin tetramer"
          annotation (Placement(transformation(extent={{72,-36},{92,-16}})));

        Physiolibrary.Chemical.Components.Substance
                            oxygen_unbound(Simulation=SimulationType.SteadyState, solute_start=0.000001
              *7.875647668393782383419689119171e-5)
          annotation (Placement(transformation(extent={{-10,-4},{10,16}})));
        Modelica.Blocks.Math.Add add[4] annotation (Placement(transformation(
              extent={{-4,-4},{4,4}},
              rotation=270,
              origin={-66,-54})));
        Modelica.Blocks.Math.Add add1[4] annotation (Placement(transformation(
              extent={{-4,-4},{4,4}},
              rotation=270,
              origin={46,-54})));
      equation
        totalAmountOfHemoglobin*normalizedState[1] = sum(OxyRHm.solute) + sum(DeoxyRHm.solute) + sum(OxyTHm.solute) + sum(DeoxyTHm.solute);

        sO2 = (sum(OxyRHm.solute) + sum(OxyTHm.solute))/totalAmountOfHemoglobin;

        connect(R0_in_R.species, quaternaryForm.substrates[1])
                                                         annotation (Line(
            points={{-48,-88},{-10,-88}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(quaternaryForm.products[1], T0_in_T.species)
                                                       annotation (Line(
            points={{10,-88},{50,-88}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(OxyTHm.q_out, oxygenation_T.substrates[1])
                                                 annotation (Line(
            points={{26,-26},{44,-26}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygenation_T.products[1], DeoxyTHm.q_out)
                                               annotation (Line(
            points={{64,-26.5},{74,-26.5},{74,-26},{82,-26}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));

        connect(OxyTHm.solute, add1.u2) annotation (Line(
            points={{26,-36},{26,-42},{43.6,-42},{43.6,-49.2}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(add1.u1, DeoxyTHm.solute) annotation (Line(
            points={{48.4,-49.2},{48.4,-42},{82,-42},{82,-36}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(add.y, R0_in_R.totalSubunitAmount) annotation (Line(
            points={{-66,-58.4},{-66,-80},{-46,-80}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(OxyRHm.solute, add.u2) annotation (Line(
            points={{-88,-36},{-88,-48},{-68.4,-48},{-68.4,-49.2}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(DeoxyRHm.solute, add.u1) annotation (Line(
            points={{-32,-36},{-34,-36},{-34,-49.2},{-63.6,-49.2}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(OxyRHm.q_out, oxygenation_R.substrates[1]) annotation (Line(
            points={{-88,-26},{-70,-26}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(DeoxyRHm.q_out, R0_in_R.subunitSpecies) annotation (Line(
            points={{-32,-26},{-38,-26},{-38,-70}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygenation_R.products[1], DeoxyRHm.q_out) annotation (Line(
            points={{-50,-26.5},{-42,-26.5},{-42,-26},{-32,-26}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygenation_R[1].products[2], oxygen_unbound.q_out) annotation (Line(
            points={{-50,-25.5},{-44,-25.5},{-44,6},{0,6}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygenation_R[2].products[2], oxygen_unbound.q_out) annotation (Line(
            points={{-50,-25.5},{-44,-25.5},{-44,6},{0,6}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygenation_R[3].products[2], oxygen_unbound.q_out) annotation (Line(
            points={{-50,-25.5},{-44,-25.5},{-44,6},{0,6}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygenation_R[4].products[2], oxygen_unbound.q_out) annotation (Line(
            points={{-50,-25.5},{-44,-25.5},{-44,6},{0,6}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygenation_T[1].products[2], oxygen_unbound.q_out) annotation (Line(
            points={{64,-25.5},{70,-25.5},{70,6},{0,6}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygenation_T[2].products[2], oxygen_unbound.q_out) annotation (Line(
            points={{64,-25.5},{70,-25.5},{70,6},{0,6}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
       connect(oxygenation_T[3].products[2], oxygen_unbound.q_out) annotation (Line(
            points={{64,-25.5},{70,-25.5},{70,6},{0,6}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
            connect(oxygenation_T[4].products[2], oxygen_unbound.q_out) annotation (Line(
            points={{64,-25.5},{70,-25.5},{70,6},{0,6}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(T0_in_T.subunitSpecies, DeoxyTHm.q_out)
                                                     annotation (Line(
            points={{60,-70},{86,-70},{86,-26},{82,-26}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(add1.y, T0_in_T.totalSubunitAmount)
                                                 annotation (Line(
            points={{46,-58.4},{46,-80},{52,-80}},
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
      end Allosteric_Hemoglobin2_MWC2;

      model Hemoglobin_oxygenation2 "Hemoglobin oxygenation experiment"
        import Physiolibrary.Types.*;
        import Physiolibrary;

       extends Modelica.Icons.Example;

        Physiolibrary.Chemical.Components.Substance
                            oxygen_unbound(Simulation=SimulationType.SteadyState, solute_start=0.000001
              *7.875647668393782383419689119171e-5)
          annotation (Placement(transformation(extent={{-4,-6},{16,14}})));
        Sources.UnlimitedGasStorage oxygen_in_air(
          Simulation=Physiolibrary.Types.SimulationType.SteadyState,
          T=310.15,
          usePartialPressureInput=false)           annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={6,56})));
        Components.GasSolubility
                              partialPressure1(          kH_T0(displayUnit="(mmol/l)/kPa at 25degC")=
               0.026029047188736, T=310.15)                             annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={6,28})));
        Sources.UnlimitedSolutionStorage pH(
          q_out(conc(nominal=10^(-7.4 + 3))),
          isIsolatedInSteadyState=false,
          Simulation=Physiolibrary.Types.SimulationType.SteadyState,
          Conc=10^(-7.2464 + 3))                                     annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={18,-32})));
        Physiolibrary.Chemical.Sources.UnlimitedGasStorage
                                    CO2_gas(
            Simulation=Physiolibrary.Types.SimulationType.SteadyState,
            PartialPressure=5332.8954966)
          annotation (Placement(transformation(extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-34,56})));
        Physiolibrary.Chemical.Components.GasSolubility
                                 gasSolubility(C=2400, kH_T0(displayUnit="(mmol/l)/kPa at 25degC")=
               0.81805576878885)
          annotation (Placement(transformation(extent={{-44,20},{-24,40}})));
        Physiolibrary.Chemical.Components.Substance
                             CO2_liquid(Simulation=Physiolibrary.Types.SimulationType.SteadyState,
            isDependent=true)
          annotation (Placement(transformation(extent={{-44,-4},{-24,16}})));
        Physiolibrary.Chemical.Examples.Hemoglobin.Hemoglobin2 hemoglobin(
                                                                         T(
            HA(solute_start=0.000652),
            A(solute_start=0.000348),
            NH3(solute_start=0.000651),
            NH2(solute_start=0.000214),
            NHCOO(solute_start=0.000135),
            DeoxyHm(solute_start=0.001),
            tAmount(start=0.001)))
          annotation (Placement(transformation(extent={{-22,-68},{-2,-48}})));
      equation

        connect(partialPressure1.q_out, oxygen_in_air.q_out)
                                                  annotation (Line(
            points={{6,38},{6,46}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(partialPressure1.q_in, oxygen_unbound.q_out) annotation (Line(
            points={{6,20},{6,4}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(gasSolubility.q_in,CO2_liquid. q_out) annotation (Line(
            points={{-34,22},{-34,6}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(CO2_gas.q_out,gasSolubility. q_out) annotation (Line(
            points={{-34,46},{-34,40}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(hemoglobin.CO2, CO2_liquid.q_out) annotation (Line(
            points={{-9.6,-53},{-9.6,-23.5},{-34,-23.5},{-34,6}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(hemoglobin.H, pH.q_out) annotation (Line(
            points={{-2,-48},{-2,-32},{8,-32}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(hemoglobin.O2, oxygen_unbound.q_out) annotation (Line(
            points={{-2,-58},{-6,-58},{-6,4},{6,4}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics),
          experiment(StopTime=18000),
          __Dymola_experimentSetupOutput,
          Documentation(revisions="<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end Hemoglobin_oxygenation2;

      model Allosteric_Hemoglobin2_MWC3
        "Monod,Wyman,Changeux (1965) - The same allosteric hemoglobin model implemented by Speciation blocks"
        import Physiolibrary.Types.*;

       extends Modelica.Icons.Example;

      // extends Physiolibrary.SteadyStates.Interfaces.SteadyStateSystem(
      //                                          Simulation=SimulationType.SteadyState);

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

       // Fraction sO2 "hemoglobin oxygen saturation";

        parameter AmountOfSubstance totalAmountOfHemoglobin=0.001;

        Physiolibrary.Chemical.Components.ChemicalReaction
                                                  quaternaryForm(K=L)
          annotation (Placement(transformation(extent={{-4,-84},{16,-64}})));
        Components.Speciation
                           R0_in_R(NumberOfSubunitTypes=4)
          annotation (Placement(transformation(extent={{-28,-76},{-48,-56}})));
        Components.Speciation
                           T0_in_T(NumberOfSubunitTypes=4)
          annotation (Placement(transformation(extent={{68,-76},{48,-56}})));
        Physiolibrary.Chemical.Components.Substance OxyRHm[4](
          each Simulation=SimulationType.SteadyState,
          each isDependent=true,
          each solute_start=4e-19)
          "Oxygenated subunit in R structure of hemoglobin tetramer"
          annotation (Placement(transformation(extent={{-98,-36},{-78,-16}})));
        Physiolibrary.Chemical.Components.ChemicalReaction oxygenation_R[4](each K=KR, each nP=2)
          annotation (Placement(transformation(extent={{-70,-36},{-50,-16}})));
        Physiolibrary.Chemical.Components.Substance DeoxyRHm[4](each Simulation=
              SimulationType.SteadyState, each solute_start=4e-11)
          "Deoxygenated subunit in R structure of hemoglobin tetramer"
          annotation (Placement(transformation(extent={{-42,-36},{-22,-16}})));
        Physiolibrary.Chemical.Components.Substance OxyTHm[4](
          each Simulation=SimulationType.SteadyState,
          each isDependent=true,
          each solute_start=1e-14)
          "Oxygenated subunit in T structure of hemoglobin tetramer"
          annotation (Placement(transformation(extent={{14,-36},{34,-16}})));
        Physiolibrary.Chemical.Components.ChemicalReaction oxygenation_T[4](each K=KT, each nP=2)
          annotation (Placement(transformation(extent={{42,-36},{62,-16}})));
        Physiolibrary.Chemical.Components.Substance DeoxyTHm[4](
                                                 each Simulation=SimulationType.SteadyState,
            each solute_start=0.00025)
          "Deoxygenated subunit in T structure of hemoglobin tetramer"
          annotation (Placement(transformation(extent={{70,-36},{90,-16}})));

        Physiolibrary.Chemical.Components.Substance
                            oxygen_unbound(Simulation=SimulationType.SteadyState, solute_start=0.000001
              *7.875647668393782383419689119171e-5)
          annotation (Placement(transformation(extent={{-12,-4},{8,16}})));
        Modelica.Blocks.Math.Add add[4] annotation (Placement(transformation(
              extent={{-4,-4},{4,4}},
              rotation=270,
              origin={-66,-54})));
        Modelica.Blocks.Math.Add add1[4] annotation (Placement(transformation(
              extent={{-4,-4},{4,4}},
              rotation=270,
              origin={44,-54})));
        SteadyStates.Components.MolarConservationLaw totalHb(
          Simulation=Physiolibrary.Types.SimulationType.SteadyState,
          Total(displayUnit="mol") = totalAmountOfHemoglobin,
          n=2)
          annotation (Placement(transformation(extent={{72,-92},{92,-72}})));
      equation
      //  totalAmountOfHemoglobin*normalizedState[1] = sum(OxyRHm.solute) + sum(DeoxyRHm.solute) + sum(OxyTHm.solute) + sum(DeoxyTHm.solute);

      //  sO2 = (sum(OxyRHm.solute) + sum(OxyTHm.solute))/totalAmountOfHemoglobin;

        connect(R0_in_R.species, quaternaryForm.substrates[1])
                                                         annotation (Line(
            points={{-48,-74},{-4,-74}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(quaternaryForm.products[1], T0_in_T.species)
                                                       annotation (Line(
            points={{16,-74},{48,-74}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(OxyTHm.q_out, oxygenation_T.substrates[1])
                                                 annotation (Line(
            points={{24,-26},{42,-26}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygenation_T.products[1], DeoxyTHm.q_out)
                                               annotation (Line(
            points={{62,-26.5},{72,-26.5},{72,-26},{80,-26}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));

        connect(OxyTHm.solute, add1.u2) annotation (Line(
            points={{24,-36},{24,-42},{41.6,-42},{41.6,-49.2}},
            color={0,0,127},
            smooth=Smooth.Bezier));
        connect(add1.u1, DeoxyTHm.solute) annotation (Line(
            points={{46.4,-49.2},{46.4,-42},{80,-42},{80,-36}},
            color={0,0,127},
            smooth=Smooth.Bezier));
        connect(add.y, R0_in_R.totalSubunitAmount) annotation (Line(
            points={{-66,-58.4},{-66,-66},{-46,-66}},
            color={0,0,127},
            smooth=Smooth.Bezier));
        connect(OxyRHm.solute, add.u2) annotation (Line(
            points={{-88,-36},{-88,-44},{-68.4,-44},{-68.4,-49.2}},
            color={0,0,127},
            smooth=Smooth.Bezier));
        connect(DeoxyRHm.solute, add.u1) annotation (Line(
            points={{-32,-36},{-32,-36},{-32,-36},{-32,-36},{-32,-44},{-63.6,-44},{-63.6,
                -50},{-63.6,-49.2}},
            color={0,0,127},
            smooth=Smooth.Bezier));
        connect(OxyRHm.q_out, oxygenation_R.substrates[1]) annotation (Line(
            points={{-88,-26},{-70,-26}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(DeoxyRHm.q_out, R0_in_R.subunitSpecies) annotation (Line(
            points={{-32,-26},{-38,-26},{-38,-56}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygenation_R.products[1], DeoxyRHm.q_out) annotation (Line(
            points={{-50,-26.5},{-42,-26.5},{-42,-26},{-32,-26}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygenation_R[1].products[2], oxygen_unbound.q_out) annotation (Line(
            points={{-50,-25.5},{-46,-25.5},{-46,6},{-2,6}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygenation_R[2].products[2], oxygen_unbound.q_out) annotation (Line(
            points={{-50,-25.5},{-46,-25.5},{-46,6},{-2,6}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygenation_R[3].products[2], oxygen_unbound.q_out) annotation (Line(
            points={{-50,-25.5},{-46,-25.5},{-46,6},{-2,6}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygenation_R[4].products[2], oxygen_unbound.q_out) annotation (Line(
            points={{-50,-25.5},{-46,-25.5},{-46,6},{-2,6}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygenation_T[1].products[2], oxygen_unbound.q_out) annotation (Line(
            points={{62,-25.5},{68,-25.5},{68,6},{-2,6}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygenation_T[2].products[2], oxygen_unbound.q_out) annotation (Line(
            points={{62,-25.5},{68,-25.5},{68,6},{-2,6}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
       connect(oxygenation_T[3].products[2], oxygen_unbound.q_out) annotation (Line(
            points={{62,-25.5},{68,-25.5},{68,6},{-2,6}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
            connect(oxygenation_T[4].products[2], oxygen_unbound.q_out) annotation (Line(
            points={{62,-25.5},{68,-25.5},{68,6},{-2,6}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(T0_in_T.subunitSpecies, DeoxyTHm.q_out)
                                                     annotation (Line(
            points={{58,-56},{74,-56},{74,-26},{80,-26}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(add1.y, T0_in_T.totalSubunitAmount)
                                                 annotation (Line(
            points={{44,-58.4},{44,-66},{50,-66}},
            color={0,0,127},
            smooth=Smooth.Bezier));
        connect(R0_in_R.totalSubsystemAmount, totalHb.fragment[1]) annotation (Line(
            points={{-38,-74},{-38,-87},{72,-87}},
            color={0,0,127},
            smooth=Smooth.Bezier));
        connect(T0_in_T.totalSubsystemAmount, totalHb.fragment[2]) annotation (Line(
            points={{58,-74},{58,-74},{58,-85},{72,-85}},
            color={0,0,127},
            smooth=Smooth.Bezier));

        annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics={
              Ellipse(
                extent={{2,-10},{102,-46}},
                lineColor={127,0,0},
                fillColor={255,170,170},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{-102,-8},{-6,-48}},
                lineColor={127,0,0},
                fillColor={255,170,170},
                fillPattern=FillPattern.Solid)}),
          experiment(StopTime=10000),
          __Dymola_experimentSetupOutput,
          Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end Allosteric_Hemoglobin2_MWC3;
    end Hemoglobin;
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
         annotation ( HideResult=true, Dialog(group="Initialization"));

      Physiolibrary.Types.RealIO.AmountOfSubstanceOutput solute(nominal=
          NominalSolute) "Current amount of solute"
        annotation (Placement(transformation(extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,-100})));

      parameter Physiolibrary.Types.AmountOfSubstance
                                        NominalSolute = 0.001
        "Numerical scale. Default is from mmol to mol, but for some substances such as hormones, hydronium or hydroxide ions can be much smaller."
          annotation ( HideResult=true, Dialog(tab="Solver",group="Numerical support of very small concentrations"));

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

      Real KaT "Dissociation constant at current temperature";
      Physiolibrary.Types.MolarFlowRate rr "Reaction molar flow rate";

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

      parameter Real K = 1
        "Fixed dissociation constant [SI-unit] if useDissociationConstantInput=false"
        annotation ( HideResult=true, Dialog(enable=not useDissociationConstantInput));

      parameter Real kf = 10^8 "Forward reaction rate coefficient [SI unit]"
        annotation (Dialog(group="Parameters")); //forward K*(10^rateLevel) at temperature TK

      parameter Integer nS=1 "Number of substrates types"
        annotation ( HideResult=true, Dialog(group="Substrates", tab="Reaction type"));
      parameter Integer nP=1 "Number of products types"
        annotation ( HideResult=true, Dialog(group="Products", tab="Reaction type"));

      parameter Modelica.SIunits.StoichiometricNumber s[nS]=ones(nS)
        "Stoichiometric reaction coefficient for substrates"
        annotation (  HideResult=true, Dialog(group="Substrates", tab="Reaction type"));
      parameter Modelica.SIunits.ActivityCoefficient as[nS]=ones(nS)
        "Activity coefficients of substrates"
        annotation ( HideResult=true, Dialog(group="Substrates", tab="Reaction type"));

      parameter Modelica.SIunits.StoichiometricNumber p[nP]=ones(nP)
        "Stoichiometric reaction coefficients for products"
        annotation ( HideResult=true, Dialog(group="Products", tab="Reaction type"));
       parameter Modelica.SIunits.ActivityCoefficient ap[nP]=ones(nP)
        "Activity coefficients of products"
        annotation ( HideResult=true, Dialog(group="Products", tab="Reaction type"));

     extends Chemical.Interfaces.ConditionalHeatPort;

      parameter Physiolibrary.Types.Temperature TK=298.15 "Base temperature"
        annotation ( HideResult=true, Dialog(tab="Temperature dependence"));

      parameter Modelica.SIunits.MolarInternalEnergy dH=0
        "Standard Enthalpy Change (negative=exothermic)"
        annotation ( HideResult=true, Dialog(tab="Temperature dependence"));

      Real KBase "dissociation constant at TK" annotation (HideResult=true);

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
        "The rate constant of incoming gas to solution" annotation ( HideResult=true);

      Physiolibrary.Types.GasSolubility kH
        "Henry's law coefficient such as liquid-gas concentration ratio";

      parameter Physiolibrary.Types.GasSolubility kH_T0
        "Henry's law coefficient at base temperature (i.e. in (mmol/l)/kPa at 25degC: aO2=0.0105, aCO2=0.33, ..)"
                                                                                                            annotation ( HideResult=true);
      parameter Physiolibrary.Types.Temperature T0=298.15
        "Base temperature for kH_T0"
         annotation (HideResult=true,Dialog(tab="Temperature dependence"));
      parameter Physiolibrary.Types.Temperature C(displayUnit="K") = 1700
        "Gas-liquid specific constant for Van't Hoff's change of kH (i.e.: O2..1700K,CO2..2400K,N2..1300K,CO..1300K,..)"
        annotation (HideResult=true,Dialog(tab="Temperature dependence"));

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

    protected
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
                                               Simulation=Physiolibrary.Types.SimulationType.SteadyState, NumberOfDependentStates=NumberOfSubunitTypes-1);
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

      parameter Real numberOfSubunit[NumberOfSubunitTypes] = ones(NumberOfSubunitTypes)
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
      extends Physiolibrary.Icons.Dilution;

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
                100,100}}), graphics={
            Text(
              extent={{-120,20},{120,-20}},
              textString="%name",
              lineColor={0,0,255},
              origin={0,-60},
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
        annotation (Dialog(enable=not useConcentrationInput));

      parameter Boolean isIsolatedInSteadyState = true
        "=true, if there is no flow at port in steady state"
        annotation (Evaluate=true, HideResult=true, Dialog(group="Simulation",tab="Equilibrium"));

      parameter SimulationType  Simulation=SimulationType.NormalInit
        "If in equilibrium, then zero-flow equation is added."
        annotation (Evaluate=true, HideResult=true, Dialog(group="Simulation",tab="Equilibrium"));

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
              extent={{140,-100},{-140,-160}},
              lineColor={0,0,0},
              textString="%Conc mmol/l")}),
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
        annotation (Evaluate=true, HideResult=true, Dialog(group="Simulation",tab="Equilibrium"));

      parameter SimulationType  Simulation=SimulationType.NormalInit
        "If in equilibrium, then zero-flow equation is added."
        annotation (Evaluate=true, HideResult=true, Dialog(group="Simulation",tab="Equilibrium"));

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
        annotation ( HideResult=true, Dialog(enable=not useHeatPort,tab="Temperature dependence"));

      Physiolibrary.Thermal.Interfaces.HeatPort_a       heatPort(T(start=T)=T_heatPort, Q_flow=-lossHeat) if useHeatPort
        annotation (Placement(transformation(extent={{-10,-10},{10,10}}),
            iconTransformation(extent={{-10,-10},{10,10}})));

      Physiolibrary.Types.Temperature T_heatPort "Temperature of HeatPort";
      Physiolibrary.Types.HeatFlowRate lossHeat
        "Loss heat leaving component via HeatPort";
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

      constant Physiolibrary.Types.Volume NormalSolventVolume=0.001 "1 liter" annotation(Evaluate=true, HideResult=true);

      parameter Boolean useNormalizedVolume = true
        "=true, if solvent volume is 1 liter"
      annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

      Physiolibrary.Types.Volume volume "SolventVolume" annotation(HideResult=useNormalizedVolume);

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
        annotation ( HideResult=not useSolutionFlowInput, Dialog(enable=not useSolutionFlowInput));

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
        annotation (HideResult=not useSoluteFlowInput, Dialog(enable=not useSoluteFlowInput));

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
<p>Copyright &copy; 2008-2014, Marek Matejak, Charles University in Prague.</p>
<p><br><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Physiolibrary.UsersGuide.ModelicaLicense2\">Physiolibrary.UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p>
</html>", info="<html>
<p>In physiology books, chapters about chemical substances are organized by their types. The main reason for this is that each substance in the human body is regulated in a different way. For example the regulation of sodium is different from the regulation of potassium, and from the regulation of glucose, and so on. This view leads to the idea of having separate models of each substance. The origin of different flows and regulations is the (cellular) membrane. Water and solutions can cross it in different directions at the same time. Crossings occur for different reasons: water is driven mostly by osmotic gradients, electrolytes are driven by charge to reach Donnan&apos;s equilibrium, and some solutes can even be actively transported against their concentration or electrical gradients. And all this is specifically driven from the higher levels by neural and hormonal responses.&nbsp; </p>
<p>In Physiolibrary flows and fluxes of solutes are supported mostly by the Chemical package. All parts inside this Physiolibrary.Chemical package use the connector ChemicalPort, which defines the molar concentration and molar flow/flux rate of one solute. This is the supporting infrastructure for modeling membrane diffusion, accumulations of substances, reversal chemical reactions, Henry&apos;s law of gas solubility, dilution with additional solvent flow, membrane reabsorption, chemical degradation and physiological clearance. </p>
</html>"));
end Chemical;

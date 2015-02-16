within Physiolibrary;
package Chemical "Domain with Molar Concentration and Molar Flow"
 extends Modelica.Icons.Package;
  package Examples
    "Examples that demonstrate usage of the Pressure flow components"
  extends Modelica.Icons.ExamplesPackage;

    model SimpleReaction

       extends Modelica.Icons.Example;

      Components.Substance         A(solute_start=0.9)
        annotation (Placement(transformation(extent={{-56,-8},{-36,12}})));
      Components.ChemicalReaction          reaction(K=1,
        useNormalizedVolume=true,
        useDissociationConstantInput=false,
        useHeatPort=false)
        annotation (Placement(transformation(extent={{-10,-8},{10,12}})));
      Components.Substance         B(solute_start=0.1)
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
      annotation ( Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),
        experiment(StopTime=1e-007));
    end SimpleReaction;

    model SimpleReaction2
       extends Modelica.Icons.Example;

      Components.Substance         A(solute_start=0.9)
        annotation (Placement(transformation(extent={{-40,-8},{-20,12}})));
      Components.ChemicalReaction          reaction(K=1, nP=2)
        annotation (Placement(transformation(extent={{-6,-8},{14,12}})));
      Components.Substance         B(solute_start=0.1)
        annotation (Placement(transformation(extent={{36,-8},{56,12}})));
      Components.Substance         C(solute_start=0.1)
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
      annotation ( Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),
        experiment(StopTime=1e-009));
    end SimpleReaction2;

    model ExothermicReaction

       extends Modelica.Icons.Example;

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
      Thermal.Sources.UnlimitedHeat unlimitedHeat(T=310.15)
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
      annotation ( Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),
        experiment(StopTime=5));
    end ExothermicReaction;

    model MichaelisMenten "Basic enzyme kinetics"
      import Physiolibrary;
      extends Modelica.Icons.Example;
      extends SteadyStates.Interfaces.SteadyStateSystem(
                                                 Simulation=Types.SimulationType.SteadyState);

      Chemical.Sources.UnlimitedSolutionStorage
                       P(Conc=0)
        annotation (Placement(transformation(extent={{92,-12},{72,8}})));
      Chemical.Sources.UnlimitedSolutionStorage
                       S(Conc=0.1)
        annotation (Placement(transformation(extent={{-94,-12},{-74,8}})));

         parameter Types.AmountOfSubstance tE=0.01 "total amount of enzyme";
         parameter Real k_cat(unit="1/s", displayUnit="1/min")= 1
        "forward rate of second reaction";
         parameter Types.Concentration Km = 0.1
        "Michaelis constant = substrate concentration at rate of half Vmax";

          Chemical.Components.Substance
                              ES(                       solute_start=0,
            Simulation=Types.SimulationType.SteadyState)
            annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
          Chemical.Components.Substance
                              E(                       solute_start=tE,
            isDependent=true,
            Simulation=Types.SimulationType.SteadyState)
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
          annotation ( Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),
        experiment(StopTime=1));
    end MichaelisMenten;

    package Hemoglobin "Hemoglobin blood gases binding"
      model Allosteric_Hemoglobin_MWC "Monod,Wyman,Changeux (1965)"
      extends Modelica.Icons.Example;

      //extends SteadyStates.Interfaces.SteadyStateSystem(
      //                                         Simulation=SimulationType.SteadyState);

        parameter Types.Temperature T=310.15 "Temperature";
      //  parameter GasSolubility alpha =  Modelica.Constants.R*298.15 * 0.0105 * 1e-3
      //    "oxygen solubility in plasma";
                                         // by Siggaard Andersen: 0.0105 (mmol/l)/kPa

        parameter Types.Fraction L = 7.0529*10^6
          "=[T0]/[R0] .. dissociation constant of relaxed <-> tensed change of deoxyhemoglobin tetramer";
        parameter Types.Fraction c = 0.00431555
          "=KR/KT .. ration between oxygen affinities of relaxed vs. tensed subunit";
        parameter Types.Concentration KR = 0.000671946
          "oxygen dissociation on relaxed(R) hemoglobin subunit";
                                                                    //*7.875647668393782383419689119171e-5
                                                                  //10.500001495896 7.8756465463794e-05

        parameter Types.Concentration KT=KR/c
          "oxygen dissociation on tensed(T) hemoglobin subunit";

      //  Fraction sO2 "hemoglobin oxygen saturation";

        parameter Types.AmountOfSubstance totalAmountOfHemoglobin=1;
      //  AmountOfSubstance totalAmountOfRforms;
      //  AmountOfSubstance totalAmountOfTforms;

        Components.Substance                       T0(stateName="T0",Simulation=Types.SimulationType.SteadyState,
          solute_start=1)
          annotation (Placement(transformation(extent={{32,78},{52,98}})));

        Components.Substance                       T1(stateName="T1",Simulation=Types.SimulationType.SteadyState,
          solute_start=0)
          annotation (Placement(transformation(extent={{34,36},{54,56}})));

        Components.Substance                       R1(stateName="R1",Simulation=Types.SimulationType.SteadyState,
          solute_start=0,
          isDependent=true)
          annotation (Placement(transformation(extent={{-20,36},{0,56}})));

        Components.Substance                       T2(stateName="T2",Simulation=Types.SimulationType.SteadyState,
          solute_start=0)
          annotation (Placement(transformation(extent={{34,-10},{54,10}})));

        Components.Substance                       R2(stateName="R2",Simulation=Types.SimulationType.SteadyState,
          solute_start=0)
          annotation (Placement(transformation(extent={{-20,-10},{0,10}})));

        Components.Substance                       T3(stateName="T3",Simulation=Types.SimulationType.SteadyState,
          solute_start=0)
          annotation (Placement(transformation(extent={{34,-54},{54,-34}})));

        Components.Substance                       R3(stateName="R3",Simulation=Types.SimulationType.SteadyState,
          solute_start=0)
          annotation (Placement(transformation(extent={{-20,-54},{0,-34}})));

        Components.Substance                       T4(stateName="T4",Simulation=Types.SimulationType.SteadyState,
          solute_start=0,
          isDependent=true)
          annotation (Placement(transformation(extent={{34,-92},{54,-72}})));

        Components.Substance                       R4(stateName="R4",Simulation=Types.SimulationType.SteadyState,
          solute_start=0)
          annotation (Placement(transformation(extent={{-20,-92},{0,-72}})));

        Components.Substance                       R0(stateName="R0",Simulation=Types.SimulationType.SteadyState,
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
          Simulation=Types.SimulationType.SteadyState)
          annotation (Placement(transformation(extent={{72,-2},{92,18}})));
        Modelica.Blocks.Math.Sum oxygen_bound(k={1,1,2,2,3,3,4,4}, nin=8)
          annotation (Placement(transformation(extent={{72,-56},{82,-46}})));
        Modelica.Blocks.Math.Division sO2_ "hemoglobin oxygen saturation"
          annotation (Placement(transformation(extent={{86,-60},{96,-50}})));
        Modelica.Blocks.Math.Sum tHb(nin=10, k=4*ones(10))
          annotation (Placement(transformation(extent={{72,-70},{82,-60}})));
        Components.Substance          oxygen_unbound(solute_start=0.000001*
              7.875647668393782383419689119171e-5, Simulation=Types.SimulationType.SteadyState)
          annotation (Placement(transformation(extent={{-56,-44},{-36,-24}})));
        Modelica.Blocks.Sources.Clock clock(offset=10)
          annotation (Placement(transformation(extent={{-94,44},{-74,64}})));
        Sources.UnlimitedGasStorage          O2_in_air(Simulation=Types.SimulationType.SteadyState,
          usePartialPressureInput=true,
          T=310.15)   annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-66,24})));
        Components.GasSolubility          gasSolubility(
                                            useHeatPort=false,
          kH_T0=0.026029047188736,
          C=1700)
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
            points={{-4,-92},{-4,-98},{64,-98},{64,2.2},{72,2.2}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(T4.solute,hemoglobinConservationLaw. fragment[2])        annotation (
            Line(
            points={{50,-92},{50,-98},{64,-98},{64,2.6},{72,2.6}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(R3.solute,hemoglobinConservationLaw. fragment[3])        annotation (
            Line(
            points={{-4,-54},{64,-54},{64,3},{72,3}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(T3.solute,hemoglobinConservationLaw. fragment[4])        annotation (
            Line(
            points={{50,-54},{64,-54},{64,3.4},{72,3.4}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(R2.solute,hemoglobinConservationLaw. fragment[5])        annotation (
            Line(
            points={{-4,-10},{64,-10},{64,3.8},{72,3.8}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(T2.solute,hemoglobinConservationLaw. fragment[6])        annotation (
            Line(
            points={{50,-10},{64,-10},{64,4.2},{72,4.2}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(R1.solute,hemoglobinConservationLaw. fragment[7])        annotation (
            Line(
            points={{-4,36},{64,36},{64,4.6},{72,4.6}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(T1.solute,hemoglobinConservationLaw. fragment[8])        annotation (
            Line(
            points={{50,36},{64,36},{64,5},{72,5}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(R0.solute,hemoglobinConservationLaw. fragment[9])        annotation (
            Line(
            points={{-4,78},{64,78},{64,5.4},{72,5.4}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(T0.solute,hemoglobinConservationLaw. fragment[10])        annotation (
           Line(
            points={{48,78},{64,78},{64,5.8},{72,5.8}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(R1.solute,oxygen_bound. u[1]) annotation (Line(
            points={{-4,36},{64,36},{64,-51.875},{71,-51.875}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(T1.solute,oxygen_bound. u[2]) annotation (Line(
            points={{50,36},{64,36},{64,-51.625},{71,-51.625}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(R2.solute,oxygen_bound. u[3]) annotation (Line(
            points={{-4,-10},{64,-10},{64,-51.375},{71,-51.375}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(T2.solute,oxygen_bound. u[4]) annotation (Line(
            points={{50,-10},{64,-10},{64,-51.125},{71,-51.125}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(R3.solute,oxygen_bound. u[5]) annotation (Line(
            points={{-4,-54},{64,-54},{64,-50.875},{71,-50.875}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(T3.solute,oxygen_bound. u[6]) annotation (Line(
            points={{50,-54},{64,-54},{64,-50.625},{71,-50.625}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(R4.solute,oxygen_bound. u[7]) annotation (Line(
            points={{-4,-92},{-4,-98},{64,-98},{64,-50.375},{71,-50.375}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(T4.solute,oxygen_bound. u[8]) annotation (Line(
            points={{50,-92},{50,-98},{64,-98},{64,-50.125},{71,-50.125}},
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
            points={{-4,78},{64,78},{64,-65.9},{71,-65.9}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(T0.solute,tHb. u[2]) annotation (Line(
            points={{48,78},{64,78},{64,-65.7},{71,-65.7}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(R1.solute,tHb. u[3]) annotation (Line(
            points={{-4,36},{64,36},{64,-65.5},{71,-65.5}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(T1.solute,tHb. u[4]) annotation (Line(
            points={{50,36},{64,36},{64,-65.3},{71,-65.3}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(R2.solute,tHb. u[5]) annotation (Line(
            points={{-4,-10},{64,-10},{64,-65.1},{71,-65.1}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(T2.solute,tHb. u[6]) annotation (Line(
            points={{50,-10},{64,-10},{64,-64.9},{71,-64.9}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(R3.solute,tHb. u[7]) annotation (Line(
            points={{-4,-54},{64,-54},{64,-64.7},{71,-64.7}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(T3.solute,tHb. u[8]) annotation (Line(
            points={{50,-54},{64,-54},{64,-64.5},{71,-64.5}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(R4.solute,tHb. u[9]) annotation (Line(
            points={{-4,-92},{-4,-98},{64,-98},{64,-64.3},{71,-64.3}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(T4.solute,tHb. u[10]) annotation (Line(
            points={{50,-92},{50,-98},{64,-98},{64,-64.1},{71,-64.1}},
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
        annotation (          experiment(
            StopTime=15000,
            Tolerance=1e-014,
            __Dymola_Algorithm="Euler"),                  Documentation(info="<html>
<p>To understand the model is necessary to study the principles of MWC allosteric transitions first published by </p>
<p>[1] Monod,Wyman,Changeux (1965). &QUOT;On the nature of allosteric transitions: a plausible model.&QUOT; Journal of molecular biology 12(1): 88-118.</p>
<p><br>In short it is about binding oxygen to hemoglobin.</p>
<p>Oxgen are driven by its partial pressure using clock source - from very little pressure to pressure of 10kPa.</p>
<p>(Partial pressure of oxygen in air is the air pressure multiplied by the fraction of the oxygen in air.)</p>
<p>Hemoglobin was observed (by Perutz) in two structuraly different forms R and T.</p>
<p>These forms are represented by blocks T0..T4 and R0..R4, where the suffexed index means the number of oxygen bounded to the form.</p>
<p><br>In equilibrated model can be four chemical reactions removed and the results will be the same, but dynamics will change a lot. ;)</p>
<p>If you remove the quaternaryForm1,quaternaryForm2,quaternaryForm3,quaternaryForm4 then the model in equilibrium will be exactly the same as in MWC article.</p>
<p><br>Parameters was fitted to data of Severinghaus article from 1979. (For example at pO2=26mmHg is oxygen saturation sO2 = 48.27 &percnt;).</p>
</html>",   revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end Allosteric_Hemoglobin_MWC;

      model Allosteric_Hemoglobin2_MWC
        "Monod,Wyman,Changeux (1965) - The same allosteric hemoglobin model as Allosteric_Hemoglobin_MWC implemented by Speciation blocks"

       extends Modelica.Icons.Example;

        parameter Types.MolarEnergy dHT=10000
          "Enthalpy of heme oxygenation in T hemoglobin form";
        parameter Types.MolarEnergy dHR=20000
          "Enthalpy of heme oxygenation in R hemoglobin form";
        parameter Types.MolarEnergy dHL=-1000
          "Enthalpy of reaction T->R as hemoglobin tetramer structure change";

        parameter Types.Fraction L = 7.0529*10^6
          "=[T0]/[R0] .. dissociation constant of relaxed <-> tensed change of deoxyhemoglobin tetramer";
        parameter Types.Fraction c = 0.00431555
          "=KR/KT .. ration between oxygen affinities of relaxed vs. tensed subunit";
        parameter Types.Concentration KR = 0.000671946
          "oxygen dissociation on relaxed(R) hemoglobin subunit";
                                                                    //*7.875647668393782383419689119171e-5
                                                                  //10.500001495896 7.8756465463794e-05

        parameter Types.Concentration KT=KR/c
          "oxygen dissociation on tensed(T) hemoglobin subunit";

        parameter Types.AmountOfSubstance totalAmountOfHemoglobin=1;

        Chemical.Components.ChemicalReaction      quaternaryForm(K=L,
          TK=310.15,
          dH=dHL)
          annotation (Placement(transformation(extent={{-2,-76},{18,-56}})));
        Components.Speciation
                           R0_in_R(NumberOfSubunits=4, useInternalHeatsInput=true)
          annotation (Placement(transformation(extent={{-30,-68},{-50,-48}})));
        Components.Speciation
                           T0_in_T(NumberOfSubunits=4, useInternalHeatsInput=true)
          annotation (Placement(transformation(extent={{70,-66},{50,-46}})));
        Chemical.Components.Substance OxyRHm[4](
          each Simulation=Types.SimulationType.SteadyState,
          each isDependent=true,
          each solute_start=4e-19,
          each dH=-dHL/4 - dHR)
          "Oxygenated subunit in R structure of hemoglobin tetramer"
          annotation (Placement(transformation(extent={{-96,-18},{-76,2}})));
        Chemical.Components.ChemicalReaction oxygenation_R[4](each K=KR, each nP=2,
          each TK=310.15,
          each dH=dHR)
          annotation (Placement(transformation(extent={{-68,-18},{-48,2}})));
        Chemical.Components.Substance DeoxyRHm[4](each Simulation=
              Types.SimulationType.SteadyState,
          each solute_start=4e-11,
          each dH=-dHL/4)
          "Deoxygenated subunit in R structure of hemoglobin tetramer"
          annotation (Placement(transformation(extent={{-40,-18},{-20,2}})));
        Chemical.Components.Substance OxyTHm[4](
          each Simulation=Types.SimulationType.SteadyState,
          isDependent={false,true,true,true},
          each dH=-dHT,
          each solute_start=1e-14)
          "Oxygenated subunit in T structure of hemoglobin tetramer"
          annotation (Placement(transformation(extent={{14,-18},{34,2}})));
        Chemical.Components.ChemicalReaction oxygenation_T[4](each K=KT, each nP=2,
          each dH=dHT,
          each TK=310.15)
          annotation (Placement(transformation(extent={{42,-18},{62,2}})));
        Chemical.Components.Substance DeoxyTHm[4](
                                                 each Simulation=Types.SimulationType.SteadyState,
          each solute_start=0.00025,
          each dH=0)
          "Deoxygenated subunit in T structure of hemoglobin tetramer"
          annotation (Placement(transformation(extent={{70,-18},{90,2}})));

        Chemical.Components.Substance
                            oxygen_unbound(Simulation=Types.SimulationType.SteadyState, solute_start=0.000001
              *7.875647668393782383419689119171e-5)
          annotation (Placement(transformation(extent={{-2,6},{18,26}})));
        Modelica.Blocks.Sources.Clock clock(offset=10)
          annotation (Placement(transformation(extent={{-40,74},{-20,94}})));
        Modelica.Blocks.Math.Add add[4] annotation (Placement(transformation(
              extent={{-4,-4},{4,4}},
              rotation=270,
              origin={-58,-36})));
        Modelica.Blocks.Math.Add add1[4] annotation (Placement(transformation(
              extent={{-4,-4},{4,4}},
              rotation=270,
              origin={30,-48})));
        Sources.UnlimitedGasStorage oxygen_in_air(
          Simulation=Types.SimulationType.SteadyState,
          usePartialPressureInput=true,
          isIsolatedInSteadyState=false,
          T=310.15)                                annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={8,68})));
        Components.GasSolubility
                              partialPressure1(          kH_T0(displayUnit="(mmol/l)/kPa at 25degC")=
               0.026029047188736,
          T=310.15,
          C=1700)                                                       annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              origin={8,40})));
        SteadyStates.Components.MolarConservationLaw totalHb(
          Simulation=Types.SimulationType.SteadyState,
          Total(displayUnit="mol") = totalAmountOfHemoglobin,
          n=2)
          annotation (Placement(transformation(extent={{72,-84},{92,-64}})));
        Modelica.Blocks.Math.Sum sum1(nin=8, k=(1/4)*ones(8))
                                             annotation (Placement(transformation(
              extent={{-4,-4},{4,4}},
              rotation=270,
              origin={-72,-74})));
        Modelica.Blocks.Math.Division sO2_ "hemoglobin oxygen saturation"
          annotation (Placement(transformation(extent={{-62,-88},{-52,-78}})));
        Modelica.Blocks.Math.Sum internalHeat(nin=2) "hemoglobin enthalpy heat"
          annotation (Placement(transformation(
              extent={{-4,-4},{4,4}},
              origin={8,-90})));
        Modelica.Blocks.Math.Add add2[
                                     4] annotation (Placement(transformation(
              extent={{-5,-5},{5,5}},
              rotation=270,
              origin={-73,-37})));
        Modelica.Blocks.Math.Add add3[4] annotation (Placement(transformation(
              extent={{-5,-5},{5,5}},
              rotation=270,
              origin={47,-39})));
      equation

        connect(R0_in_R.specificForm, quaternaryForm.substrates[1])
                                                         annotation (Line(
            points={{-50,-66},{-2,-66}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(quaternaryForm.products[1], T0_in_T.specificForm)
                                                       annotation (Line(
            points={{18,-66},{34,-66},{34,-64},{50,-64}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(OxyTHm.q_out, oxygenation_T.substrates[1])
                                                 annotation (Line(
            points={{24,-8},{42,-8}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygenation_T.products[1], DeoxyTHm.q_out)
                                               annotation (Line(
            points={{62,-8.5},{72,-8.5},{72,-8},{80,-8}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));

        connect(OxyTHm.solute, add1.u2) annotation (Line(
            points={{30,-18},{30,-24},{27.6,-24},{27.6,-43.2}},
            color={0,0,127},
            smooth=Smooth.Bezier));
        connect(add1.u1, DeoxyTHm.solute) annotation (Line(
            points={{32.4,-43.2},{32.4,-24},{86,-24},{86,-18}},
            color={0,0,127},
            smooth=Smooth.Bezier));
        connect(partialPressure1.q_out, oxygen_in_air.q_out)
                                                  annotation (Line(
            points={{8,50},{8,58}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(partialPressure1.q_in, oxygen_unbound.q_out) annotation (Line(
            points={{8,32},{8,16}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(clock.y, oxygen_in_air.partialPressure) annotation (Line(
            points={{-19,84},{8,84},{8,78}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(add.y, R0_in_R.amountOfSubunit) annotation (Line(
            points={{-58,-40.4},{-58,-58},{-48,-58}},
            color={0,0,127},
            smooth=Smooth.Bezier));
        connect(OxyRHm.solute, add.u2) annotation (Line(
            points={{-80,-18},{-80,-24},{-60.4,-24},{-60.4,-31.2}},
            color={0,0,127},
            smooth=Smooth.Bezier));
        connect(DeoxyRHm.solute, add.u1) annotation (Line(
            points={{-24,-18},{-30,-18},{-30,-24},{-55.6,-24},{-55.6,-31.2}},
            color={0,0,127},
            smooth=Smooth.Bezier));
        connect(OxyRHm.q_out, oxygenation_R.substrates[1]) annotation (Line(
            points={{-86,-8},{-68,-8}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(DeoxyRHm.q_out, R0_in_R.specificSubunitForm) annotation (Line(
            points={{-30,-8},{-40,-8},{-40,-48}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygenation_R.products[1], DeoxyRHm.q_out) annotation (Line(
            points={{-48,-8.5},{-40,-8.5},{-40,-8},{-30,-8}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygenation_R[1].products[2], oxygen_unbound.q_out) annotation (Line(
            points={{-48,-7.5},{-34,-7.5},{-34,16},{8,16}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygenation_R[2].products[2], oxygen_unbound.q_out) annotation (Line(
            points={{-48,-7.5},{-34,-7.5},{-34,16},{8,16}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygenation_R[3].products[2], oxygen_unbound.q_out) annotation (Line(
            points={{-48,-7.5},{-34,-7.5},{-34,16},{8,16}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygenation_R[4].products[2], oxygen_unbound.q_out) annotation (Line(
            points={{-48,-7.5},{-34,-7.5},{-34,16},{8,16}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygenation_T[1].products[2], oxygen_unbound.q_out) annotation (Line(
            points={{62,-7.5},{78,-7.5},{78,16},{8,16}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygenation_T[2].products[2], oxygen_unbound.q_out) annotation (Line(
            points={{62,-7.5},{78,-7.5},{78,16},{8,16}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
       connect(oxygenation_T[3].products[2], oxygen_unbound.q_out) annotation (Line(
            points={{62,-7.5},{78,-7.5},{78,16},{8,16}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
            connect(oxygenation_T[4].products[2], oxygen_unbound.q_out) annotation (Line(
            points={{62,-7.5},{78,-7.5},{78,16},{8,16}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(T0_in_T.specificSubunitForm, DeoxyTHm.q_out)
                                                     annotation (Line(
            points={{60,-46},{84,-46},{84,-8},{80,-8}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(add1.y, T0_in_T.amountOfSubunit) annotation (Line(
            points={{30,-52.4},{30,-56},{52,-56}},
            color={0,0,127},
            smooth=Smooth.Bezier));
        connect(R0_in_R.amount, totalHb.fragment[1]) annotation (Line(
            points={{-40,-66},{-40,-79},{72,-79}},
            color={0,0,127},
            smooth=Smooth.Bezier));
        connect(T0_in_T.amount, totalHb.fragment[2]) annotation (Line(
            points={{60,-64},{60,-64},{60,-77},{72,-77}},
            color={0,0,127},
            smooth=Smooth.Bezier));
        connect(OxyRHm.solute, sum1.u[1:4]) annotation (Line(
            points={{-80,-18},{-86,-18},{-86,-62},{-72,-62},{-72,-69.2},{-72.1,
                -69.2}},
            color={0,0,127},
            smooth=Smooth.Bezier));

        connect(OxyTHm.solute, sum1.u[5:8]) annotation (Line(
            points={{30,-18},{30,-60},{-71.3,-60},{-71.3,-69.2}},
            color={0,0,127},
            smooth=Smooth.Bezier));
        connect(sO2_.u1, sum1.y) annotation (Line(
            points={{-63,-80},{-72,-80},{-72,-78.4}},
            color={0,0,127},
            smooth=Smooth.Bezier));
        connect(totalHb.totalAmountOfSubstance, sO2_.u2) annotation (Line(
            points={{92,-78},{100,-78},{100,-100},{-76,-100},{-76,-86},{-63,-86}},
            color={0,0,127},
            smooth=Smooth.Bezier));
        connect(R0_in_R.internalHeat, internalHeat.u[1]) annotation (Line(
            points={{-34,-66},{-34,-90.4},{3.2,-90.4}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(T0_in_T.internalHeat, internalHeat.u[2]) annotation (Line(
            points={{66,-64},{66,-74},{-24,-74},{-24,-89.6},{3.2,-89.6}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(add3.y, T0_in_T.subunitInternalHeat) annotation (Line(
            points={{47,-44.5},{47,-50},{52,-50}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(add2.y, R0_in_R.subunitInternalHeat) annotation (Line(
            points={{-73,-42.5},{-73,-52},{-48,-52}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(add3.u1, DeoxyTHm.internalHeat) annotation (Line(
            points={{50,-33},{50,-30},{91.6,-30},{91.6,-12}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(OxyTHm.internalHeat, add3.u2) annotation (Line(
            points={{35.6,-12},{35.6,-30},{44,-30},{44,-33}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(OxyRHm.internalHeat, add2.u2) annotation (Line(
            points={{-74.4,-12},{-74.4,-28},{-76,-28},{-76,-31}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(DeoxyRHm.internalHeat, add2.u1) annotation (Line(
            points={{-18.4,-12},{-18.4,-28},{-70,-28},{-70,-31}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics={Ellipse(
                extent={{2,12},{100,-36}},
                fillColor={255,181,181},
                fillPattern=FillPattern.Solid,
                pattern=LinePattern.None), Ellipse(
                extent={{-102,12},{-4,-36}},
                fillColor={255,181,181},
                fillPattern=FillPattern.Solid,
                pattern=LinePattern.None)}),
          experiment(
            StopTime=15000,
            Tolerance=1e-014,
            __Dymola_Algorithm="Euler"),
          Documentation(revisions=
                        "<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>", info="<html>
<p>Before silumation in &QUOT;Dymola 2014 FD01&QUOT; please chose &QUOT;Euler&QUOT; method!</p>
<p><br>To understand the model is necessary to study the principles of MWC allosteric transitions first published by </p>
<p>[1] Monod,Wyman,Changeux (1965). &QUOT;On the nature of allosteric transitions: a plausible model.&QUOT; Journal of molecular biology 12(1): 88-118.</p>
<p><br>In short it is about binding oxygen to hemoglobin.</p>
<p>Oxgen are driven by its partial pressure using clock source - from very little pressure to pressure of 10kPa.</p>
<p>(Partial pressure of oxygen in air is the air pressure multiplied by the fraction of the oxygen in air.)</p>
<p>Hemoglobin was observed (by Perutz) in two structuraly different forms R and T.</p>
<p>These forms are represented by blocks T0..T4 and R0..R4, where the suffexed index means the number of oxygen bounded to the form.</p>
<p><br>In equilibrated model can be four chemical reactions removed and the results will be the same, but dynamics will change a lot. ;)</p>
<p>If you remove the quaternaryForm1,quaternaryForm2,quaternaryForm3,quaternaryForm4 then the model in equilibrium will be exactly the same as in MWC article.</p>
<p><br>Parameters was fitted to data of Severinghaus article from 1979. (For example at pO2=26mmHg is oxygen saturation sO2 = 48.27 &percnt;).</p>
</html>"));
      end Allosteric_Hemoglobin2_MWC;

      model Hemoglobin_MKM_Specie "Part of model Hemoglobin_MKM_Adair"

      parameter Boolean loadStarts
          "Start values of state variables from data file (to help with initialization)";
      parameter Boolean storeState
          "Save state variables at the end of simulation";
      constant String dirName = Modelica.Utilities.Files.loadResource("modelica://Physiolibrary/Resources/Data/Hemoglobin_MKM")
          "Directory to load start gues values and store final simulation values";

      parameter Real[4] pKz
          "Dissociation coefficient of reaction z (Val1 amino terminal protonation)";
      parameter Real[4] pKc
          "Dissociation coefficient of reaction c (Val1 amino terminal carbamination)";
      parameter Real[4] pKh
          "Dissociation coefficient of reaction h (other Bohr protonation reactions of side chains)";

      parameter Types.MolarEnergy[4] dH_HbuANH2
          "Standard enthalpy of deprotonated and decarboxylated hemoglobin subunit";
      parameter Types.MolarEnergy[4] dHz
          "Enthalpy of reaction z (Val1 amino terminal protonation)";
      parameter Types.MolarEnergy[4] dHc
          "Enthalpy of reaction c (Val1 amino terminal carbamination)";
      parameter Types.MolarEnergy[4] dHh
          "Enthalpy of reaction h (other Bohr protonation reactions of side chains)";

      parameter Boolean isDependent=false
          "contains dependent equation (if solver is not smart enough)";

      Chemical.Interfaces.ChemicalPort_a Hbtn
          annotation (Placement(transformation(extent={{-108,-10},{-88,10}})));
          Chemical.Components.Substance Hbu_A_NH3[4](each Simulation=
              Types.SimulationType.SteadyState,
          dH=dH_HbuANH2 - dHz,
          each dirName = dirName,
          each LOAD_STARTS=loadStarts,
          each SAVE_RESULTS=storeState,
          each solute_start=1e-06)
          annotation (Placement(transformation(extent={{-32,70},{-12,90}})));
      Chemical.Components.Substance Hbu_AH_NH3[4](each Simulation=
              Types.SimulationType.SteadyState,
          each dirName = dirName,
          each LOAD_STARTS=loadStarts,
          each SAVE_RESULTS=storeState,
          each solute_start=1e-06,
          dH=dH_HbuANH2 - dHh - dHz)
          annotation (Placement(transformation(extent={{54,70},{74,90}})));
      Chemical.Components.Substance Hbu_A_NH2[4](each Simulation=
              Types.SimulationType.SteadyState,
          isDependent={isDependent,true,true,true},
          each dirName = dirName,
          each LOAD_STARTS=loadStarts,
          each SAVE_RESULTS=storeState,
          each solute_start=1e-06,
          dH=dH_HbuANH2)
          annotation (Placement(transformation(extent={{-32,-2},{-12,18}})));
      Chemical.Components.Substance Hbu_AH_NH2[4](each Simulation=
              Types.SimulationType.SteadyState,
          each dirName = dirName,
          each LOAD_STARTS=loadStarts,
          each SAVE_RESULTS=storeState,
          each solute_start=1e-06,
          dH=dH_HbuANH2 - dHh)
          annotation (Placement(transformation(extent={{54,-2},{74,18}})));
      Chemical.Components.Substance Hbu_A_NHCOO[4](each Simulation=
              Types.SimulationType.SteadyState,
          dH=dH_HbuANH2 + dHc,
          each dirName = dirName,
          each LOAD_STARTS=loadStarts,
          each SAVE_RESULTS=storeState,
          each solute_start=1e-06)
          annotation (Placement(transformation(extent={{-32,-84},{-12,-64}})));
      Chemical.Components.Substance Hbu_AH_NHCOO[4](each Simulation=
              Types.SimulationType.SteadyState,
          each dirName = dirName,
          each LOAD_STARTS=loadStarts,
          each SAVE_RESULTS=storeState,
          dH=dH_HbuANH2 + dHc,
          each solute_start=1e-06)
          annotation (Placement(transformation(extent={{54,-84},{74,-64}})));
      Chemical.Components.ChemicalReaction h2[4](
          each nS=1,
          each nP=2,
          K=fill(10, 4) .^ (-pKh .+ 3),
          each TK=310.15,
          dH=dHh)
                annotation (Placement(transformation(extent={{32,-2},{12,18}})));
      Chemical.Components.ChemicalReaction z1[4](each nP=2, K=fill(10, 4)
               .^ (-pKz .+ 3),
          dH=dHz,
          each TK=310.15)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-22,44})));
      Chemical.Components.ChemicalReaction z2[4](each nP=2, K=fill(10, 4)
               .^ (-pKz .+ 3),
          each TK=310.15,
          dH=dHz)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={64,44})));
      Chemical.Components.ChemicalReaction c1[4](
          each nS=2,
          each nP=2,
          K=fill(10, 4) .^ (-pKc .+ 3),
          each TK=310.15,
          dH=dHc)
                annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-22,-34})));
      Chemical.Components.ChemicalReaction c2[4](
          each nS=2,
          each nP=2,
          K=fill(10, 4) .^ (-pKc .+ 3),
          each TK=310.15,
          dH=dHc)
                annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={64,-34})));
      Modelica.Blocks.Math.Sum total[4](each nin=6) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={-64,62})));
        Chemical.Interfaces.ChemicalPort_a H(conc(nominal=10^(-7.2+3)))
          "hydrogen ions"
          annotation (Placement(transformation(extent={{90,76},{110,96}})));
        Chemical.Interfaces.ChemicalPort_a CO2
          annotation (Placement(transformation(extent={{90,-70},{110,-50}})));
        Chemical.Components.Speciation Hb_tn(Simulation=Types.SimulationType.SteadyState,
            NumberOfSubunits=4,
          useInternalHeatsInput=true)
          annotation (Placement(transformation(extent={{-54,-22},{-74,-2}})));
      Types.RealIO.AmountOfSubstanceOutput tHb_u annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={-100,-78})));
      Types.RealIO.EnergyOutput internalHeat "internal heat" annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={-100,-100})));
      Modelica.Blocks.Math.Sum total1[
                                     4](each nin=6) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={-64,32})));
      equation
      connect(Hbu_AH_NH3.q_out, z2.substrates[1]) annotation (Line(
          points={{64,80},{64,54}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(Hbu_A_NH3.q_out, z1.substrates[1]) annotation (Line(
          points={{-22,80},{-22,54}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(z1.products[1], Hbu_A_NH2.q_out) annotation (Line(
          points={{-22.5,34},{-22.5,22},{-22,22},{-22,8}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(z2.products[1], Hbu_AH_NH2.q_out) annotation (Line(
          points={{63.5,34},{63.5,22},{64,22},{64,8}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(h2.substrates[1], Hbu_AH_NH2.q_out) annotation (Line(
          points={{32,8},{64,8}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(Hbu_A_NH2.q_out, c1.substrates[1]) annotation (Line(
          points={{-22,8},{-22,-24},{-22.5,-24}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(Hbu_AH_NH2.q_out, c2.substrates[1]) annotation (Line(
          points={{64,8},{64,-24},{63.5,-24}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(c1.products[1], Hbu_A_NHCOO.q_out) annotation (Line(
          points={{-22.5,-44},{-22.5,-60},{-22,-60},{-22,-74}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(c2.products[1], Hbu_AH_NHCOO.q_out) annotation (Line(
          points={{63.5,-44},{63.5,-60},{64,-60},{64,-74}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(Hbu_A_NH3.solute, total.u[1]) annotation (Line(
          points={{-16,70},{-44,70},{-44,63.6667},{-52,63.6667}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Hbu_AH_NH3.solute, total.u[2]) annotation (Line(
          points={{70,70},{-2,70},{-2,63},{-52,63}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Hbu_A_NH2.solute, total.u[3]) annotation (Line(
          points={{-16,-2},{-44,-2},{-44,62.3333},{-52,62.3333}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Hbu_AH_NH2.solute, total.u[4]) annotation (Line(
          points={{70,-2},{-2,-2},{-2,61.6667},{-52,61.6667}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Hbu_A_NHCOO.solute, total.u[5]) annotation (Line(
          points={{-16,-84},{-44,-84},{-44,61},{-52,61}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Hbu_AH_NHCOO.solute, total.u[6]) annotation (Line(
          points={{70,-84},{-2,-84},{-2,60.3333},{-52,60.3333}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(Hbu_A_NH2.q_out, h2.products[1]) annotation (Line(
          points={{-22,8},{-10,8},{-10,7.5},{12,7.5}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));

        connect(Hb_tn.specificForm, Hbtn) annotation (Line(
            points={{-74,-20},{-86,-20},{-86,0},{-98,0}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(total.y, Hb_tn.amountOfSubunit) annotation (Line(
            points={{-75,62},{-78,62},{-78,-12},{-72,-12}},
            color={0,0,127},
            smooth=Smooth.None));

        for i in 1:4 loop
          connect(z1[i].products[2], H) annotation (Line(
            points={{-21.5,34},{-21.5,28},{-4,28},{-4,96},{88,96},{88,86},{100,
                86}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(z2[i].products[2], H) annotation (Line(
            points={{64.5,34},{64.5,28},{-4,28},{-4,96},{88,96},{88,86},{100,86}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));

        connect(c1[i].products[2], H) annotation (Line(
            points={{-21.5,-44},{-21.5,-50},{-4,-50},{-4,96},{88,96},{88,86},{
                100,86}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(c2[i].products[2], H) annotation (Line(
            points={{64.5,-44},{64.5,-50},{-4,-50},{-4,96},{88,96},{88,86},{100,
                86}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));

          connect(H, h2[i].products[2]) annotation (Line(
            points={{100,86},{88,86},{88,96},{-4,96},{-4,8.5},{12,8.5}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));

          connect(CO2, c2[i].substrates[2]) annotation (Line(
            points={{100,-60},{88,-60},{88,-20},{64.5,-20},{64.5,-24}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(CO2, c1[i].substrates[2]) annotation (Line(
            points={{100,-60},{88,-60},{88,-20},{-21.5,-20},{-21.5,-24}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        end for;
        connect(Hb_tn.specificSubunitForm, Hbu_A_NH2.q_out) annotation (Line(
            points={{-64,-2},{-64,8},{-22,8}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(tHb_u, Hb_tn.amount) annotation (Line(
            points={{-100,-78},{-64,-78},{-64,-20}},
            color={0,0,127},
            smooth=Smooth.None));

        connect(Hb_tn.internalHeat, internalHeat) annotation (Line(
            points={{-58,-20},{-58,-100},{-100,-100}},
            color={0,0,127},
            smooth=Smooth.None));

        connect(Hbu_A_NH3.internalHeat, total1.u[1]) annotation (Line(
            points={{-10.4,76},{-44,76},{-44,33.6667},{-52,33.6667}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(Hbu_AH_NH3.internalHeat, total1.u[2]) annotation (Line(
            points={{75.6,76},{-2,76},{-2,33},{-52,33}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(Hbu_A_NH2.internalHeat, total1.u[3]) annotation (Line(
            points={{-10.4,4},{-44,4},{-44,32.3333},{-52,32.3333}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(Hbu_AH_NH2.internalHeat, total1.u[4]) annotation (Line(
            points={{75.6,4},{-2,4},{-2,31.6667},{-52,31.6667}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(Hbu_A_NHCOO.internalHeat, total1.u[5]) annotation (Line(
            points={{-10.4,-78},{-44,-78},{-44,31},{-52,31}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(Hbu_AH_NHCOO.internalHeat, total1.u[6]) annotation (Line(
            points={{75.6,-78},{-2,-78},{-2,30.3333},{-52,30.3333}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(total1.y, Hb_tn.subunitInternalHeat) annotation (Line(
            points={{-75,32},{-76,32},{-76,-6},{-72,-6}},
            color={0,0,127},
            smooth=Smooth.None));
      annotation ( Documentation(revisions="<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>", info="<html>

<p>[1] Mateják M, Kulhánek T, Matouaek S. Adair-Based Hemoglobin Equilibrium with Oxygen, Carbon Dioxide and Hydrogen Ion Activity. Scandinavian Journal of Clinical &AMP; Laboratory Investigation; 2015</p>

<p>[2] Bauer C, Schr&ouml;der E. Carbamino compounds of haemoglobin in human adult and foetal blood. The Journal of physiology 1972;227:457-71.</p>

<p>[3] Siggaard-Andersen O. Oxygen-Linked Hydrogen Ion Binding of Human Hemoglobin. Effects of Carbon Dioxide and 2, 3-Diphosphoglycerate I. Studies on Erythrolysate. Scandinavian Journal of Clinical &AMP; Laboratory Investigation 1971;27:351-60.</p>

</html>"));
      end Hemoglobin_MKM_Specie;

      model Hemoglobin_MKM_Adair "Matejak,Kulhanek,Matousek (2014)"
        extends Modelica.Icons.Example;

        constant Real pKzD=7.73,pKcD=7.54,pKhD=7.52;
        constant Real pKzO=7.25,pKcO=8.35,pKhO=6.89;
        constant Types.MolarEnergy dHzD=-51400, dHzO=7700, dHcD=59100, dHcO=-41100, dHhD=49000, dHhO=-105000, dHo=50000, dH_HbuDANH2=0;
        // dHhD=0, dHhO=-104000, dHo=12700, dH_HbuDANH2=0;                           // dHhD=48600, dHhO=-104000, dHo=50000, dH_HbuDANH2=0;

        parameter Boolean storeResults=false;
        parameter Boolean loadStarts=true;

        Chemical.Components.ChemicalReaction K1(
          K=0.0121,
          nS=1,
          nP=2) annotation (Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=270,
              origin={-44,68})));
        Chemical.Components.ChemicalReaction K2(
          K=0.0117,
          nS=1,
          nP=2) annotation (Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=270,
              origin={-46,28})));
        Chemical.Components.ChemicalReaction K3(
          K=0.0871,
          nS=1,
          nP=2) annotation (Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=270,
              origin={-48,-18})));
        Chemical.Components.ChemicalReaction K4(
          K=0.000386,
          nS=1,
          nP=2) annotation (Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=270,
              origin={-50,-60})));
        Chemical.Examples.Hemoglobin.Hemoglobin_MKM_Specie Hb0(
          pKz=fill(pKzD, 4),
          pKc=fill(pKcD, 4),
          pKh=fill(pKhD, 4),
          isDependent=true,
          dH_HbuANH2(displayUnit="kJ/mol") = fill(dH_HbuDANH2, 4),
          dHz(displayUnit="kJ/mol") = fill(dHzD, 4),
          dHc(displayUnit="kJ/mol") = fill(dHcD, 4),
          dHh(displayUnit="kJ/mol") = fill(dHhD, 4),
          storeState=storeResults,
          loadStarts=loadStarts)
          annotation (Placement(transformation(extent={{-24,78},{-4,98}})));
        Chemical.Examples.Hemoglobin.Hemoglobin_MKM_Specie Hb1(
          pKz=cat(  1,
                    fill(pKzD, 3),
                    fill(pKzO, 1)),
          pKc=cat(  1,
                    fill(pKcD, 3),
                    fill(pKcO, 1)),
          pKh=cat(  1,
                    fill(pKhD, 3),
                    fill(pKhO, 1)),
          dH_HbuANH2(displayUnit="kJ/mol") = cat(  1,
                    fill(dH_HbuDANH2, 3),
                    fill(dH_HbuDANH2-dHo, 1)),
          dHz(displayUnit="kJ/mol") = cat(  1,
                    fill(dHzD, 3),
                    fill(dHzO, 1)),
          dHc(displayUnit="kJ/mol") = cat(  1,
                    fill(dHcD, 3),
                    fill(dHcO, 1)),
          dHh(displayUnit="kJ/mol") = cat(  1,
                    fill(dHhD, 3),
                    fill(dHhO, 1)),
          storeState=storeResults,
          loadStarts=loadStarts)
          annotation (Placement(transformation(extent={{-24,40},{-4,60}})));
        Chemical.Examples.Hemoglobin.Hemoglobin_MKM_Specie Hb2(
          pKz=cat(  1,
                    fill(pKzD, 2),
                    fill(pKzO, 2)),
          pKc=cat(  1,
                    fill(pKcD, 2),
                    fill(pKcO, 2)),
          pKh=cat(  1,
                    fill(pKhD, 2),
                    fill(pKhO, 2)),
          dH_HbuANH2(displayUnit="kJ/mol") = cat(  1,
                    fill(dH_HbuDANH2, 2),
                    fill(dH_HbuDANH2-dHo, 2)),
          dHz(displayUnit="kJ/mol") = cat(  1,
                    fill(dHzD, 2),
                    fill(dHzO, 2)),
          dHc(displayUnit="kJ/mol") = cat(  1,
                    fill(dHcD, 2),
                    fill(dHcO, 2)),
          dHh(displayUnit="kJ/mol") = cat(  1,
                    fill(dHhD, 2),
                    fill(dHhO, 2)),
          storeState=storeResults,
          loadStarts=loadStarts)
          annotation (Placement(transformation(extent={{-24,0},{-4,20}})));
        Chemical.Examples.Hemoglobin.Hemoglobin_MKM_Specie Hb3(
          pKz=cat(  1,
                    fill(pKzD, 1),
                    fill(pKzO, 3)),
          pKc=cat(  1,
                    fill(pKcD, 1),
                    fill(pKcO, 3)),
          pKh=cat(  1,
                    fill(pKhD, 1),
                    fill(pKhO, 3)),
          dH_HbuANH2(displayUnit="kJ/mol") = cat(  1,
                    fill(dH_HbuDANH2, 1),
                    fill(dH_HbuDANH2-dHo, 3)),
          dHz(displayUnit="kJ/mol") = cat(  1,
                    fill(dHzD, 1),
                    fill(dHzO, 3)),
          dHc(displayUnit="kJ/mol") = cat(  1,
                    fill(dHcD, 1),
                    fill(dHcO, 3)),
          dHh(displayUnit="kJ/mol") = cat(  1,
                    fill(dHhD, 1),
                    fill(dHhO, 3)),
          storeState=storeResults,
          loadStarts=loadStarts)
          annotation (Placement(transformation(extent={{-24,-44},{-4,-24}})));
        Chemical.Examples.Hemoglobin.Hemoglobin_MKM_Specie Hb4(
          pKz=fill(pKzO, 4),
          pKc=fill(pKcO, 4),
          pKh=fill(pKhO, 4),
          dH_HbuANH2(displayUnit="kJ/mol") = fill(dH_HbuDANH2-dHo, 4),
          dHz(displayUnit="kJ/mol") = fill(dHzO, 4),
          dHc(displayUnit="kJ/mol") = fill(dHcO, 4),
          dHh(displayUnit="kJ/mol") = fill(dHhO, 4),
          storeState=storeResults,
          loadStarts=loadStarts)
          annotation (Placement(transformation(extent={{-24,-88},{-4,-68}})));
        Chemical.Sources.UnlimitedGasStorage CO2(
          Simulation=Types.SimulationType.SteadyState,
          isIsolatedInSteadyState=false,
          PartialPressure=0)
          annotation (Placement(transformation(extent={{96,72},{76,92}})));
        Chemical.Sources.UnlimitedSolutionStorage pH(
                                         Simulation=Types.SimulationType.SteadyState,
          isIsolatedInSteadyState=false,
          Conc(displayUnit="mol/l") = 10^(-7 + 3))
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={34,82})));
        SteadyStates.Components.MolarConservationLaw totalHemoglobin(
          n=5,
          Total(displayUnit="mol") = 1,
          Simulation=Types.SimulationType.SteadyState)
          annotation (Placement(transformation(extent={{44,6},{64,26}})));
        Modelica.Blocks.Math.Sum sO2(nin=4, k={4/4,3/4,2/4,1/4})
          annotation (Placement(transformation(extent={{62,-30},{82,-10}})));
        Chemical.Components.Substance oxygen_unbound(       Simulation=
              Types.SimulationType.SteadyState, solute_start=1e-08)
          annotation (Placement(transformation(extent={{-94,-28},{-74,-8}})));
        Modelica.Blocks.Sources.Clock clock(offset=10)
          annotation (Placement(transformation(extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-84,70})));
        Chemical.Sources.UnlimitedGasStorage oxygen_in_air(
          Simulation=Types.SimulationType.SteadyState,
          isIsolatedInSteadyState=false,
          PartialPressure(displayUnit="Pa") = 10,
          usePartialPressureInput=true,
          T=310.15) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-84,34})));
        Chemical.Components.GasSolubility partialPressure1(
            kH_T0(displayUnit="(mmol/l)/kPa at 25degC") = 0.026029047188736,
          C=1700,
          T=310.15)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              origin={-84,6})));
        Modelica.Blocks.Math.Sum internalHeat(nin=5)
          annotation (Placement(transformation(extent={{44,-62},{64,-42}})));
        Modelica.Blocks.Math.Gain gain(k=4)
          annotation (Placement(transformation(extent={{38,-92},{46,-84}})));
        Modelica.Blocks.Continuous.Der der1
          annotation (Placement(transformation(extent={{52,-80},{60,-72}})));
        Modelica.Blocks.Continuous.Der der2
          annotation (Placement(transformation(extent={{52,-92},{60,-84}})));
        Modelica.Blocks.Math.Division derInternalHeat_per_derO2
          annotation (Placement(transformation(extent={{72,-92},{92,-72}})));
        Chemical.Components.GasSolubility partialPressure2(
          T=310.15,
          kH_T0(displayUnit="(mmol/l)/kPa at 25degC") = 0.60734443440384,
          C=2400)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              origin={68,62})));
        Chemical.Components.Substance CO2_unbound(Simulation=
              Types.SimulationType.SteadyState, solute_start=
              0.0012)
          annotation (Placement(transformation(extent={{58,30},{78,50}})));
      equation
        connect(oxygen_unbound.q_out, K2.products[1]) annotation (Line(
            points={{-84,-18},{-62,-18},{-62,42},{-46,42},{-46,38},{-46.5,38}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygen_unbound.q_out, K3.products[1]) annotation (Line(
            points={{-84,-18},{-62,-18},{-62,0},{-48.5,0},{-48.5,-8}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(K1.products[1], oxygen_unbound.q_out) annotation (Line(
            points={{-44.5,78},{-44.5,80},{-62,80},{-62,-18},{-84,-18}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygen_unbound.q_out, K4.products[1]) annotation (Line(
            points={{-84,-18},{-62,-18},{-62,-44},{-50.5,-44},{-50.5,-50}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));

        connect(CO2_unbound.q_out, Hb0.CO2) annotation (Line(
            points={{68,40},{4,40},{4,82},{-4,82}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(Hb0.H, pH.q_out) annotation (Line(
            points={{-4,96.6},{10,96.6},{10,82},{24,82}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(Hb1.H, Hb0.H) annotation (Line(
            points={{-4,58.6},{10,58.6},{10,96.6},{-4,96.6}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(Hb3.H, Hb0.H) annotation (Line(
            points={{-4,-25.4},{10,-25.4},{10,96.6},{-4,96.6}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(Hb4.H, Hb0.H) annotation (Line(
            points={{-4,-69.4},{10,-69.4},{10,96.6},{-4,96.6}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(Hb2.H, Hb0.H) annotation (Line(
            points={{-4,18.6},{10,18.6},{10,96.6},{-4,96.6}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(Hb1.CO2, Hb0.CO2) annotation (Line(
            points={{-4,44},{4,44},{4,82},{-4,82}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(Hb2.CO2, Hb0.CO2) annotation (Line(
            points={{-4,4},{4,4},{4,82},{-4,82}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(Hb3.CO2, Hb0.CO2) annotation (Line(
            points={{-4,-40},{4,-40},{4,82},{-4,82}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(Hb4.CO2, Hb0.CO2) annotation (Line(
            points={{-4,-84},{4,-84},{4,82},{-4,82}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(Hb0.Hbtn, K1.products[2]) annotation (Line(
            points={{-23.8,88},{-43.5,88},{-43.5,78}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(Hb1.Hbtn, K1.substrates[1]) annotation (Line(
            points={{-23.8,50},{-44,50},{-44,58}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(Hb1.Hbtn, K2.products[2]) annotation (Line(
            points={{-23.8,50},{-44,50},{-44,38},{-45.5,38}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(Hb2.Hbtn, K2.substrates[1]) annotation (Line(
            points={{-23.8,10},{-46,10},{-46,18}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(Hb2.Hbtn, K3.products[2]) annotation (Line(
            points={{-23.8,10},{-46,10},{-46,-8},{-47.5,-8}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(Hb3.Hbtn, K3.substrates[1]) annotation (Line(
            points={{-23.8,-34},{-48,-34},{-48,-28}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(Hb3.Hbtn, K4.products[2]) annotation (Line(
            points={{-23.8,-34},{-48,-34},{-48,-50},{-49.5,-50}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(Hb4.Hbtn, K4.substrates[1]) annotation (Line(
            points={{-23.8,-78},{-50,-78},{-50,-70}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(Hb4.tHb_u, totalHemoglobin.fragment[1]) annotation (Line(
            points={{-24,-85.8},{-32,-85.8},{-32,-96},{22,-96},{22,10.4},{44,10.4}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(Hb3.tHb_u, totalHemoglobin.fragment[2]) annotation (Line(
            points={{-24,-41.8},{-32,-41.8},{-32,-48},{20,-48},{20,11.2},{44,11.2}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(Hb2.tHb_u, totalHemoglobin.fragment[3]) annotation (Line(
            points={{-24,2.2},{-32,2.2},{-32,-4},{18,-4},{18,12},{44,12}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(Hb1.tHb_u, totalHemoglobin.fragment[4]) annotation (Line(
            points={{-24,42.2},{-28,42.2},{-28,34},{16,34},{16,12.8},{44,12.8}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(Hb0.tHb_u, totalHemoglobin.fragment[5]) annotation (Line(
            points={{-24,80.2},{-28,80.2},{-28,64},{18,64},{18,13.6},{44,13.6}},
            color={0,0,127},
            smooth=Smooth.None));

        connect(Hb1.tHb_u, sO2.u[4]) annotation (Line(
            points={{-24,42.2},{-28,42.2},{-28,34},{16,34},{16,-18.5},{60,-18.5}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(Hb2.tHb_u, sO2.u[3]) annotation (Line(
            points={{-24,2.2},{-32,2.2},{-32,2},{-32,2},{-32,-4},{18,-4},{18,-19.5},{60,
                -19.5}},
            color={0,0,127},
            smooth=Smooth.None));

        connect(Hb3.tHb_u, sO2.u[2]) annotation (Line(
            points={{-24,-41.8},{-32,-41.8},{-32,-48},{20,-48},{20,-20.5},{60,-20.5}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(Hb4.tHb_u, sO2.u[1]) annotation (Line(
            points={{-24,-85.8},{-32,-85.8},{-32,-96},{22,-96},{22,-21.5},{60,-21.5}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(partialPressure1.q_out,oxygen_in_air. q_out)
                                                  annotation (Line(
            points={{-84,16},{-84,24}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(partialPressure1.q_in,oxygen_unbound. q_out) annotation (Line(
            points={{-84,-2},{-84,-18}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(Hb0.internalHeat, internalHeat.u[1]) annotation (Line(
            points={{-24,78},{-24,66},{34,66},{34,-53.6},{42,-53.6}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(Hb1.internalHeat, internalHeat.u[2]) annotation (Line(
            points={{-24,40},{-26,40},{-26,36},{34,36},{34,-52.8},{42,-52.8}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(Hb2.internalHeat, internalHeat.u[3]) annotation (Line(
            points={{-24,0},{-28,0},{-28,-2},{34,-2},{34,-52},{42,-52}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(Hb3.internalHeat, internalHeat.u[4]) annotation (Line(
            points={{-24,-44},{-28,-44},{-28,-46},{34,-46},{34,-51.2},{42,-51.2}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(Hb4.internalHeat, internalHeat.u[5]) annotation (Line(
            points={{-24,-88},{-28,-88},{-28,-90},{34,-90},{34,-52},{42,-52},{42,-50.4}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(gain.u, sO2.y) annotation (Line(
            points={{37.2,-88},{34,-88},{34,-96},{98,-96},{98,-20},{83,-20}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(internalHeat.y, der1.u) annotation (Line(
            points={{65,-52},{68,-52},{68,-66},{48,-66},{48,-76},{51.2,-76}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(gain.y, der2.u) annotation (Line(
            points={{46.4,-88},{51.2,-88}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(clock.y, oxygen_in_air.partialPressure) annotation (Line(
            points={{-84,59},{-84,44}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(derInternalHeat_per_derO2.u2, der2.y) annotation (Line(
            points={{70,-88},{60.4,-88}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(derInternalHeat_per_derO2.u1, der1.y) annotation (Line(
            points={{70,-76},{60.4,-76}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(CO2_unbound.q_out, partialPressure2.q_in) annotation (Line(
            points={{68,40},{68,54}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(CO2.q_out, partialPressure2.q_out) annotation (Line(
            points={{76,82},{68,82},{68,72}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        annotation (          experiment(
            StopTime=15000,
            Tolerance=1e-014,
            __Dymola_Algorithm="Euler"), Documentation(info="<html>
<p>Before silumation in &QUOT;Dymola 2014 FD01&QUOT; please set environment variable &QUOT;<code><b>Advanced.Define.NonLinearIterations&nbsp;=&nbsp;3&QUOT;</b></code> and chose &QUOT;Euler&QUOT; method!</p>

<p>[1] Mateják M, Kulhánek T, Matouaek S. Adair-Based Hemoglobin Equilibrium with Oxygen, Carbon Dioxide and Hydrogen Ion Activity. Scandinavian Journal of Clinical &AMP; Laboratory Investigation; 2015</p>

<p>[2] Bauer C, Schr&ouml;der E. Carbamino compounds of haemoglobin in human adult and foetal blood. The Journal of physiology 1972;227:457-71.</p>

<p>[3] Siggaard-Andersen O. Oxygen-Linked Hydrogen Ion Binding of Human Hemoglobin. Effects of Carbon Dioxide and 2, 3-Diphosphoglycerate I. Studies on Erythrolysate. Scandinavian Journal of Clinical &AMP; Laboratory Investigation 1971;27:351-60.</p>

<p>[4] Severinghaus JW. Simple, accurate equations for human blood O2 dissociation computations. Journal of Applied Physiology 1979;46:599-602.</p>
</html>", revisions="<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end Hemoglobin_MKM_Adair;

      package Develop
        extends Modelica.Icons.UnderConstruction;

        model QuaternaryForm
          "Model of hemoglobin space-structure form (can be parametrized as relaxed or tensed)"

          parameter Boolean isDependent = false;

          parameter Types.Concentration KA = 10^(-6.89+3)
            "dissociation coefficient for acid chains of subunit";
          parameter Types.Concentration Kz = 10^(-7.25+3)
            "valine 1 amino terminus dissociation coefficient of protonation to NH3+";
          parameter Types.Concentration Kc = 10^(-8.35+3)
            "valine 1 amino terminus dissociation coefficient of protonation to NH3+";
          parameter Types.Concentration KO2 = 0.000671946
            "oxygen dissociation coefficient of hemoglobin subunit";

          Chemical.Components.Speciation Speciation(
              NumberOfSubunits=12)
            annotation (Placement(transformation(extent={{60,-20},{40,0}})));
          Chemical.Components.Substance OxyHm[4](
            each solute_start=0,
            each Simulation=Types.SimulationType.SteadyState,
            isDependent={isDependent,true,true,true})
            "Oxygenated subunit of hemoglobin tetramer"
            annotation (Placement(transformation(extent={{-90,-68},{-70,-48}})));
          Chemical.Components.ChemicalReaction oxygenation1[4](each
              nP=2, each K=KO2) annotation (Placement(transformation(extent={{-62,
                    -68},{-42,-48}})));
          Chemical.Components.Substance DeoxyHm[4](each Simulation=
                Types.SimulationType.SteadyState,each  solute_start=1e-08)
            "Deoxygenated subunit of hemoglobin tetramer"
            annotation (Placement(transformation(extent={{-34,-68},{-14,-48}})));

          Modelica.Blocks.Math.Add add[4] annotation (Placement(transformation(
                extent={{-4,-4},{4,4}},
                rotation=270,
                origin={-58,-80})));
          Chemical.Interfaces.ChemicalPort_a O2 annotation (Placement(
                transformation(extent={{-26,-50},{-6,-30}}), iconTransformation(
                  extent={{-26,-50},{-6,-30}})));
          Chemical.Interfaces.ChemicalPort_a sForm annotation (
              Placement(transformation(extent={{72,-54},{92,-34}}),
                iconTransformation(extent={{68,-50},{88,-30}})));
          Chemical.Interfaces.ChemicalPort_a H "hydrogen ion (proton)"
                                    annotation (Placement(transformation(extent={{-32,
                    18},{-12,38}}), iconTransformation(extent={{-32,18},{-12,38}})));
          Chemical.Components.Substance A[4]( each                Simulation=
                Types.SimulationType.SteadyState,each  solute_start=1e-08)
            "residual acid chains of hemoglobin subunits "
            annotation (Placement(transformation(extent={{-24,-14},{-4,6}})));
          Chemical.Components.Substance HA[4](
            each solute_start=0,
            each Simulation=Types.SimulationType.SteadyState,
            each isDependent=true)
            "residual acid chains of hemoglobin subunits "
            annotation (Placement(transformation(extent={{-90,-14},{-70,6}})));
          Chemical.Components.ChemicalReaction protonation1[4](each nP=2,each  K=KA)
            annotation (Placement(transformation(extent={{-62,-14},{-42,6}})));
          Modelica.Blocks.Math.Add add1[
                                       4] annotation (Placement(transformation(
                extent={{-4,-4},{4,4}},
                rotation=270,
                origin={-52,-24})));
          Chemical.Components.Substance NH2[4](each                 Simulation=
               Types.SimulationType.SteadyState,each  solute_start=1e-08)
            "Val1 terminal of hemoglobin subunits "
            annotation (Placement(transformation(extent={{-10,52},{10,72}})));
          Chemical.Components.Substance NH3[             4](
            each solute_start=0,
            each Simulation=Types.SimulationType.SteadyState,
            each isDependent=true) "Val1 terminal of hemoglobin subunits "
            annotation (Placement(transformation(extent={{-86,52},{-66,72}})));
          Chemical.Components.ChemicalReaction protonation2[4](             each nP=2, each K=Kz)
            annotation (Placement(transformation(extent={{-58,52},{-38,72}})));
          Modelica.Blocks.Math.Add3 add2[
                                       4] annotation (Placement(transformation(
                extent={{-4,-4},{4,4}},
                rotation=270,
                origin={0,40})));
          Chemical.Interfaces.ChemicalPort_a CO2 annotation (
              Placement(transformation(extent={{-6,76},{14,96}}),
                iconTransformation(extent={{-6,76},{14,96}})));
          Chemical.Components.ChemicalReaction carboxylation[4](
            each nP=2,
            each nS=2,
            each K=Kc)
            "Carboxylation of Valin1 amino terminus of hemogloni subunit"
            annotation (Placement(transformation(extent={{36,52},{56,72}})));
          Chemical.Components.Substance NHCOO[4](each Simulation=Types.SimulationType.SteadyState, each solute_start=1e-08)
            "Val1 terminal of hemoglobin subunits "
            annotation (Placement(transformation(extent={{66,52},{86,72}})));
          Types.RealIO.AmountOfSubstanceOutput tAmount(start=1e-08)
            annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={50,-86}), iconTransformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={40,-90})));
          Types.RealIO.AmountOfSubstanceOutput protonation annotation (
              Placement(transformation(
                extent={{-10,-10},{10,10}},
                origin={100,14}), iconTransformation(
                extent={{-10,-10},{10,10}},
                origin={90,20})));
          Modelica.Blocks.Math.Sum add3(k=cat(
                1,
                -ones(4),
                ones(8)), nin=12)
            annotation (Placement(transformation(extent={{78,10},{86,18}})));
          Modelica.Blocks.Math.Sum add4(nin=4)
            annotation (Placement(transformation(extent={{-4,-4},{4,4}},
                rotation=270,
                origin={-80,-86})));
          Types.RealIO.AmountOfSubstanceOutput oxygenation
            annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={-80,-110}), iconTransformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={-80,-90})));
        equation

          connect(OxyHm.solute, add.u2) annotation (Line(
              points={{-80,-68},{-80,-74},{-60.4,-74},{-60.4,-75.2}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(DeoxyHm.solute, add.u1) annotation (Line(
              points={{-24,-68},{-26,-68},{-26,-75.2},{-55.6,-75.2}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(OxyHm.q_out, oxygenation1.substrates[1]) annotation (Line(
              points={{-80,-58},{-62,-58}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(oxygenation1.products[1], DeoxyHm.q_out) annotation (Line(
              points={{-42,-58.5},{-34,-58.5},{-34,-58},{-24,-58}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(Speciation.specificForm, sForm) annotation (Line(
              points={{40,-18},{40,-44},{82,-44}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(oxygenation1[1].products[2], O2) annotation (Line(
              points={{-42,-57.5},{-36,-57.5},{-36,-40},{-16,-40}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(oxygenation1[2].products[2], O2) annotation (Line(
              points={{-42,-57.5},{-36,-57.5},{-36,-40},{-16,-40}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(oxygenation1[3].products[2], O2) annotation (Line(
              points={{-42,-57.5},{-36,-57.5},{-36,-40},{-16,-40}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(oxygenation1[4].products[2], O2) annotation (Line(
              points={{-42,-57.5},{-36,-57.5},{-36,-40},{-16,-40}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(HA.q_out, protonation1.substrates[1]) annotation (Line(
              points={{-80,-4},{-62,-4}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(protonation1.products[1], A.q_out) annotation (Line(
              points={{-42,-4.5},{-42,-4},{-14,-4}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(H, protonation1[1].products[2]) annotation (Line(
              points={{-22,28},{-32,28},{-32,-3.5},{-42,-3.5}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(protonation1[2].products[2], H) annotation (Line(
              points={{-42,-3.5},{-32,-3.5},{-32,28},{-22,28}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(protonation1[3].products[2], H) annotation (Line(
              points={{-42,-3.5},{-32,-3.5},{-32,28},{-22,28}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(protonation1[4].products[2], H) annotation (Line(
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
          connect(DeoxyHm.q_out, Speciation.specificSubunitForm[1:4])
            annotation (Line(
              points={{-24,-58},{-24,-52},{28,-52},{28,0},{50,0},{50,-0.416667}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));

          connect(A.q_out, Speciation.specificSubunitForm[5:8]) annotation (
              Line(
              points={{-14,-4},{-14,0.25},{50,0.25}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(add.y, Speciation.amountOfSubunit[1:4]) annotation (Line(
              points={{-58,-84.4},{-58,-86},{14,-86},{14,-10.8333},{42,-10.8333}},
              color={0,0,127},
              smooth=Smooth.None));

          connect(add1.y, Speciation.amountOfSubunit[5:8]) annotation (Line(
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
          connect(add2.y, Speciation.amountOfSubunit[9:12]) annotation (Line(
              points={{0,35.6},{0,32},{12,32},{12,-8.16667},{42,-8.16667}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(NH2.q_out, Speciation.specificSubunitForm[9:12]) annotation (
              Line(
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
          connect(Speciation.amount, tAmount) annotation (Line(
              points={{50,-18},{50,-86}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(HA.solute, add3.u[9:12]) annotation (Line(
              points={{-80,-14},{-80,-20},{-98,-20},{-98,14.7333},{77.2,14.7333}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(NH3.solute, add3.u[5:8]) annotation (Line(
              points={{-76,52},{-76,14.2},{77.2,14.2}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(NHCOO.solute, add3.u[1:4]) annotation (Line(
              points={{76,52},{76,13.6667},{77.2,13.6667}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(add3.y, protonation) annotation (Line(
              points={{86.4,14},{100,14}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(OxyHm.solute, add4.u) annotation (Line(
              points={{-80,-68},{-80,-81.2}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(add4.y, oxygenation) annotation (Line(
              points={{-80,-90.4},{-80,-110}},
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
</html>",   info="<html>
<p>[1] Morrow J, Matthew J, Wittebort R, Gurd F. Carbon 13 resonances of 13CO2 carbamino adducts of alpha and beta chains in human adult hemoglobin. Journal of Biological Chemistry 1976;251:477-84.</p>
<p>[2] Bauer C, Schr&ouml;der E. Carbamino compounds of haemoglobin in human adult and foetal blood. The Journal of physiology 1972;227:457-71.</p>
<p>[3] Antonini E, Wyman J, Brunori M, Fronticelli C, Bucci E, Rossi-Fanelli A. Studies on the relations between molecular and functional properties of hemoglobin V. The influence of temperature on the Bohr effect in human and in horse hemoglobin. Journal of Biological Chemistry 1965;240:1096-103.</p>
</html>"),  Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                    {100,100}}),
                graphics={
                Rectangle(
                  extent={{-100,100},{100,-100}},
                  lineColor={0,0,127},
                  fillColor={215,215,215},
                  fillPattern=FillPattern.Solid),
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
                  fillPattern=FillPattern.Solid),
                Text(
                  extent={{-240,-110},{40,-160}},
                  lineColor={0,0,0},
                  textString="%name")}));
        end QuaternaryForm;

        model Hemoglobin2 "Hemoglobin model"

         extends SteadyStates.Interfaces.SteadyStateSystem(
                                                  Simulation=Types.SimulationType.SteadyState);

        //  parameter GasSolubility alpha =  0.0105 * 1e-3 "oxygen solubility in plasma";   // by Siggaard Andersen: 0.0105 (mmol/l)/kPa

          parameter Types.Fraction L = 7.0529*10^6
            "=[T0]/[R0] .. dissociation constant of relaxed <-> tensed change of deoxyhemoglobin tetramer";
          parameter Types.Fraction Ln = 26884.8
            "quaternaly form ratio for specific stripped species of hemoglobin tetramer";
                                         //L*0.00381188                                                                     //"=L*(fnT/fnR)^4 for pH=7.2464 and CO2=0";
          parameter Types.Fraction c = 0.00431555
            "=KR/KT .. ration between oxygen affinities of relaxed vs. tensed subunit";
          parameter Types.Concentration KR = 0.000671946
            "oxygen dissociation on relaxed(R) hemoglobin subunit";
                                                                      //*7.875647668393782383419689119171e-5
                                                                    //10.500001495896 7.8756465463794e-05

          parameter Types.Concentration KT=KR/c
            "oxygen dissociation on tensed(T) hemoglobin subunit";

          parameter Types.AmountOfSubstance totalAmountOfHemoglobin=0.001;

          Chemical.Components.ChemicalReaction      quaternaryForm(K=Ln)
            annotation (Placement(transformation(extent={{-16,26},{4,46}})));

          Chemical.Examples.Hemoglobin.Develop.QuaternaryForm R(
            KO2=KR,
            KA=10^(-6.89 + 3),
            Kz=10^(-7.25 + 3),
            Kc=10^(-8.35 + 3),
            isDependent=true)
            annotation (Placement(transformation(extent={{-40,30},{-20,50}})));
          Chemical.Examples.Hemoglobin.Develop.QuaternaryForm T(
            KO2=KT,
            KA=10^(-7.52 + 3),
            Kz=10^(-7.73 + 3),
            Kc=10^(-7.54 + 3))
            annotation (Placement(transformation(extent={{32,30},{12,50}})));
          SteadyStates.Components.MolarConservationLaw totalHb(
            n=2,
            Total=totalAmountOfHemoglobin,
            Simulation=Types.SimulationType.SteadyState)
            annotation (Placement(transformation(extent={{-10,-10},{10,10}},
                rotation=270,
                origin={0,2})));
          Chemical.Interfaces.ChemicalPort_a H "H+ (proton)"
            annotation (Placement(transformation(extent={{6,66},{26,86}}),
                iconTransformation(extent={{90,90},{110,110}})));
          Chemical.Interfaces.ChemicalPort_a
                                    CO2 "carbon dioxide"
                                        annotation (Placement(transformation(extent={{-22,54},
                    {-2,74}}),     iconTransformation(extent={{14,40},{34,60}})));
          Chemical.Interfaces.ChemicalPort_a O2 "oxygen"
            annotation (Placement(transformation(extent={{-54,78},{-34,98}}),
                iconTransformation(extent={{90,-10},{110,10}})));
          Types.RealIO.FractionOutput          protonation annotation (
              Placement(transformation(
                extent={{-10,-10},{10,10}},
                origin={100,-40}),iconTransformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={-80,-90})));
          Modelica.Blocks.Math.Add add(k1=1/4, k2=1/4)
            annotation (Placement(transformation(extent={{16,-40},{26,-30}})));
          Modelica.Blocks.Math.Division division
            annotation (Placement(transformation(extent={{42,-46},{54,-34}})));
          Modelica.Blocks.Math.Add add1(
                                       k1=1/4, k2=1/4)
            annotation (Placement(transformation(extent={{42,-62},{54,-50}})));
          Modelica.Blocks.Math.Division division1
            annotation (Placement(transformation(extent={{66,-86},{78,-74}})));
          Types.RealIO.FractionOutput sO2
            annotation (Placement(transformation(extent={{90,-90},{110,-70}})));
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
              points={{-26,31},{-26,18},{-4,18},{-4,12},{-5,12}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(T.tAmount, totalHb.fragment[2]) annotation (Line(
              points={{18,31},{18,18},{-3,18},{-3,12}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(T.protonation, add.u1) annotation (Line(
              points={{13,42},{13,-32},{15,-32}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(R.protonation, add.u2) annotation (Line(
              points={{-21,42},{-21,-38},{15,-38}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(division.u2, totalHb.totalAmountOfSubstance) annotation (Line(
              points={{40.8,-43.6},{-4,-43.6},{-4,-8}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(division.u1, add.y) annotation (Line(
              points={{40.8,-36.4},{38,-36.4},{38,-35},{26.5,-35}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(protonation, division.y) annotation (Line(
              points={{100,-40},{54.6,-40}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(division1.u1, add1.y) annotation (Line(
              points={{64.8,-76.4},{56,-76.4},{56,-56},{54.6,-56}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(R.oxygenation, add1.u2) annotation (Line(
              points={{-38,31},{-38,-59.6},{40.8,-59.6}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(T.oxygenation, add1.u1) annotation (Line(
              points={{30,31},{30,-52.4},{40.8,-52.4}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(totalHb.totalAmountOfSubstance, division1.u2) annotation (
              Line(
              points={{-4,-8},{-4,-83.6},{64.8,-83.6}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(division1.y, sO2) annotation (Line(
              points={{78.6,-80},{100,-80}},
              color={0,0,127},
              smooth=Smooth.None));
          annotation (             Documentation(revisions="<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>",   info="<html>
<p>[1] Monod J, Wyman J, Changeux J-P. On the nature of allosteric transitions: a plausible model. Journal of Molecular Biology 1965;12:88-118.</p>
</html>"));
        end Hemoglobin2;

        model Hemoglobin_oxygenation "Hemoglobin oxygenation experiment"

          import Physiolibrary.Types.*;

         extends Modelica.Icons.Example;

          Chemical.Components.Substance
                              oxygen_unbound(Simulation=SimulationType.SteadyState, solute_start=0.000001
                *7.875647668393782383419689119171e-5)
            annotation (Placement(transformation(extent={{-4,-2},{16,18}})));
          Modelica.Blocks.Sources.Clock clock(offset=1e-06)
            annotation (Placement(transformation(extent={{-40,74},{-20,94}})));
          Chemical.Sources.UnlimitedGasStorage oxygen_in_air(
            Simulation=Types.SimulationType.SteadyState,
            usePartialPressureInput=true,
            T=310.15,
            isIsolatedInSteadyState=false)
                      annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={6,60})));
          Chemical.Components.GasSolubility partialPressure1(kH_T0(
                displayUnit="(mmol/l)/kPa at 25degC") = 0.026029047188736,
            T=310.15,
            C=1700)
            annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                origin={6,32})));
          Chemical.Sources.UnlimitedSolutionStorage pH(
            q_out(conc(nominal=10^(-7.4 + 3))),
            Simulation=Types.SimulationType.SteadyState,
            Conc=10^(-7.2464 + 3),
            isIsolatedInSteadyState=false)
                                   annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=180,
                origin={62,-10})));
          Chemical.Sources.UnlimitedGasStorage
                                      CO2_gas(
              Simulation=Types.SimulationType.SteadyState,
              PartialPressure=5332.8954966)
            annotation (Placement(transformation(extent={{-10,-10},{10,10}},
                rotation=270,
                origin={-34,56})));
          Chemical.Components.GasSolubility
                                   gasSolubility(C=2400, kH_T0(displayUnit="(mmol/l)/kPa at 25degC")=
                 0.81805576878885)
            annotation (Placement(transformation(extent={{-44,20},{-24,40}})));
          Chemical.Components.Substance
                               CO2_liquid(Simulation=Types.SimulationType.SteadyState,
              isDependent=true)
            annotation (Placement(transformation(extent={{-44,-4},{-24,16}})));
          Chemical.Examples.Hemoglobin.Develop.Hemoglobin2 hemoglobin
            annotation (Placement(transformation(extent={{-26,-74},{-6,-54}})));
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
          connect(hemoglobin.CO2, CO2_liquid.q_out) annotation (Line(
              points={{-13.6,-59},{-13.6,-23.5},{-34,-23.5},{-34,6}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(hemoglobin.H, pH.q_out) annotation (Line(
              points={{-6,-54},{26,-54},{26,-10},{52,-10}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(hemoglobin.O2, oxygen_unbound.q_out) annotation (Line(
              points={{-6,-64},{-10,-64},{-10,8},{6,8}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          annotation (            experiment(
              StopTime=18000,
              Tolerance=1e-014,
              __Dymola_Algorithm="Euler"), Documentation(revisions=
                        "<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>",   info="<html>
<p>[1] Severinghaus JW. Simple, accurate equations for human blood O2 dissociation computations. Journal of Applied Physiology 1979;46:599-602.</p>
</html>"));
        end Hemoglobin_oxygenation;

        model Hemoglobin_titration "Hemoglobin titration experiment"

          import Physiolibrary.Types.*;

         extends Modelica.Icons.Example;

         extends SteadyStates.Interfaces.SteadyStateSystem(
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
            "oxygen dissociation on relaxed(R) hemoglobin subunit";
                                                                      //*7.875647668393782383419689119171e-5
                                                                    //10.500001495896 7.8756465463794e-05

          parameter Concentration KT=KR/c
            "oxygen dissociation on tensed(T) hemoglobin subunit";

          parameter AmountOfSubstance totalAmountOfHemoglobin=0.001;

          Chemical.Components.Substance
                              oxygen_unbound(Simulation=SimulationType.SteadyState, solute_start=0.000001
                *7.875647668393782383419689119171e-5)
            annotation (Placement(transformation(extent={{-4,-2},{16,18}})));
          Modelica.Blocks.Sources.Clock clock(offset=6.7)
            annotation (Placement(transformation(extent={{30,34},{50,54}})));
          Chemical.Sources.UnlimitedGasStorage oxygen_in_air(
            Simulation=Types.SimulationType.SteadyState,
            usePartialPressureInput=false,
            PartialPressure=0,
            T=310.15,
            isIsolatedInSteadyState=false)
                      annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={6,60})));
          Chemical.Components.GasSolubility partialPressure1(
              kH_T0(displayUnit="(mmol/l)/kPa at 25degC") = 0.024913516594933,
            T=310.15,
            C=1700)
            annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                origin={6,32})));
          Chemical.Sources.UnlimitedSolutionStorage pH(
            q_out(conc(nominal=10^(-7.4 + 3))),
            isIsolatedInSteadyState=false,
            Simulation=Types.SimulationType.SteadyState,
            Conc=10^(-7.2464 + 3),
            useConcentrationInput=true) annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=180,
                origin={62,-10})));
          Chemical.Sources.UnlimitedGasStorage
                                      CO2_gas(
              Simulation=Types.SimulationType.SteadyState,
            usePartialPressureInput=false,
            PartialPressure=0)
            annotation (Placement(transformation(extent={{-10,-10},{10,10}},
                rotation=270,
                origin={-34,56})));
          Chemical.Components.GasSolubility
                                   gasSolubility(C=2400, kH_T0(displayUnit="(mmol/l)/kPa at 25degC")=
                 0.81805576878885)
            annotation (Placement(transformation(extent={{-44,20},{-24,40}})));
          Chemical.Components.Substance
                               CO2_liquid(Simulation=Types.SimulationType.SteadyState,
              isDependent=true)
            annotation (Placement(transformation(extent={{-44,-4},{-24,16}})));
          Chemical.Examples.Hemoglobin.Develop.Hemoglobin2
            deoxyhemoglobin
            annotation (Placement(transformation(extent={{-22,-68},{-2,-48}})));
          Types.RealIO.FractionOutput protonation
            "allosteric-dependent protonation"
            annotation (Placement(transformation(extent={{68,-76},{88,-56}})));
          Blocks.Math.Power pow annotation (Placement(transformation(
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
          connect(deoxyhemoglobin.CO2, CO2_liquid.q_out) annotation (Line(
              points={{-9.6,-53},{-9.6,-23.5},{-34,-23.5},{-34,6}},
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
          connect(deoxyhemoglobin.H, pH.q_out) annotation (Line(
              points={{-2,-48},{26,-48},{26,-10},{52,-10}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(deoxyhemoglobin.O2, oxygen_unbound.q_out) annotation (Line(
              points={{-2,-58},{-6,-58},{-6,8},{6,8}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(deoxyhemoglobin.protonation, protonation) annotation (Line(
              points={{-20,-67},{-20,-66},{78,-66}},
              color={0,0,127},
              smooth=Smooth.None));
          annotation (            experiment(StopTime=1.3), Documentation(revisions=
                        "<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>",   info="<html>
<p>[1] Siggaard-Andersen O, Garby L. The Bohr effect and the Haldane effect. Scandinavian Journal of Clinical &AMP; Laboratory Investigation 1973;31:1-8.</p>
</html>"));
        end Hemoglobin_titration;

        model Hemoglobin_titration_shifts
          "Hemoglobin titration shift caused by full deoxygenation (Bohr protons binding)"
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
          Hemoglobin_titration hemoglobin_titration5(oxygen_in_air(
                PartialPressure=19998.35811225))
            annotation (Placement(transformation(extent={{-60,-26},{-40,-6}})));
          Hemoglobin_titration hemoglobin_titration6(oxygen_in_air(
                PartialPressure=19998.35811225), CO2_gas(PartialPressure(
                  displayUnit="kPa") = 1470))
            annotation (Placement(transformation(extent={{-28,-26},{-8,-6}})));
          Hemoglobin_titration hemoglobin_titration7(oxygen_in_air(
                PartialPressure=19998.35811225), CO2_gas(PartialPressure(
                  displayUnit="kPa") = 4530))
            annotation (Placement(transformation(extent={{0,-26},{20,-6}})));
          Hemoglobin_titration hemoglobin_titration8(oxygen_in_air(
                PartialPressure=19998.35811225), CO2_gas(PartialPressure(
                  displayUnit="kPa") = 10670))
            annotation (Placement(transformation(extent={{30,-26},{50,-6}})));
          Hemoglobin_titration hemoglobin_titration9(oxygen_in_air(
                PartialPressure=19998.35811225), CO2_gas(PartialPressure(
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
            experiment(
              StopTime=1.1,
              Tolerance=1e-014,
              __Dymola_Algorithm="Euler"), Documentation(info=
                   "<html>
<p>[1] Siggaard-Andersen O. Oxygen-Linked Hydrogen Ion Binding of Human Hemoglobin. Effects of Carbon Dioxide and 2, 3-Diphosphoglycerate I. Studies on Erythrolysate. Scandinavian Journal of Clinical &AMP; Laboratory Investigation 1971;27:351-60.</p>
</html>"));
        end Hemoglobin_titration_shifts;
      end Develop;

    end Hemoglobin;

    package AcidBase
      model WaterSelfIonization
        "2 H2O  <->  OH-   +   H3O+ (It is better to solve this model using Euler solver, because there is only time dependence/no integration needed/)"
          extends Modelica.Icons.Example;
        Components.Substance H3O(
          q_out(conc(nominal=10^(-7 + 3))),
          Simulation=Types.SimulationType.SteadyState,
          solute_start=10^(-7 + 3))
                            annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              origin={-8,12})));
        SteadyStates.Components.ElementaryChargeConservationLaw electroneutrality(
          Simulation=Types.SimulationType.SteadyState,
          NumberOfParticles=2,
          Total=0,
          Charges={1,-1},
          useTotalInput=true) "strong ion difference of solution"
          annotation (Placement(transformation(extent={{46,-94},{66,-74}})));
        Components.Substance OH(
          q_out(conc(nominal=10^(-7.4 + 3))),
          Simulation=Types.SimulationType.SteadyState,
          solute_start=10^(-7 + 3),
          isDependent=true)         annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              origin={-8,-32})));
        Components.Substance H2O(
          q_out(conc(nominal=5.55e+4)),
          Simulation=Types.SimulationType.SteadyState,
          solute_start(displayUnit="mol") = 1/0.018,
          isDependent=true) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              origin={-82,-12})));
        Components.ChemicalReaction waterDissociation(nP=2,
          s={2},
          K=(1e-8)*((18e-6)^2))
          annotation (Placement(transformation(extent={{-56,-22},{-36,-2}})));
        SteadyStates.Components.MolarConservationLaw tH2O(
          Simulation=Types.SimulationType.SteadyState,
          n=3,
          Total(displayUnit="mol") = 1/0.018) "total water concentration"
          annotation (Placement(transformation(extent={{-48,-74},{-28,-54}})));
        Modelica.Blocks.Sources.Clock SID(offset=-1e-6)
          "strong ions difference with respect to albumin charge shift"
          annotation (Placement(transformation(extent={{52,74},{72,94}})));
        Modelica.Blocks.Math.Gain toColoumn(k(unit="C/s")=-Modelica.Constants.F,  y(unit="C"))
          "from elementary charge to electric charge, which is needed in system"
                                              annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={80,-74})));
      equation
        connect(H2O.q_out, waterDissociation.substrates[1]) annotation (Line(
            points={{-82,-12},{-56,-12}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(waterDissociation.products[2], H3O.q_out) annotation (Line(
            points={{-36,-11.5},{-26,-11.5},{-26,12},{-8,12}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(waterDissociation.products[1], OH.q_out) annotation (Line(
            points={{-36,-12.5},{-26,-12.5},{-26,-32},{-8,-32}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(tH2O.fragment[1], H2O.solute) annotation (Line(
            points={{-48,-69.3333},{-76,-69.3333},{-76,-22}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(OH.solute, tH2O.fragment[2]) annotation (Line(
            points={{-2,-42},{-2,-50},{-76,-50},{-76,-68},{-48,-68}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(H3O.solute, tH2O.fragment[3]) annotation (Line(
            points={{-2,2},{-2,-6},{8,-6},{8,-52},{-72,-52},{-72,-66.6667},{-48,
                -66.6667}},
            color={0,0,127},
            smooth=Smooth.None));

        connect(SID.y,toColoumn. u) annotation (Line(
            points={{73,84},{100,84},{100,-74},{92,-74}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(toColoumn.y, electroneutrality.total) annotation (Line(
            points={{69,-74},{56,-74},{56,-76}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(H3O.solute, electroneutrality.fragment[1]) annotation (Line(
            points={{-2,2},{-2,-6},{8,-6},{8,-89},{46,-89}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(OH.solute, electroneutrality.fragment[2]) annotation (Line(
            points={{-2,-42},{-2,-87},{46,-87}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation ( Documentation(info="<html>
<p>Self-ionization of water.</p>
<p>Ions difference (SID) in water causes the acidity/basicity, where pH = -log10(aH+). An activity of hydrogen ions aH+ is approximated with concentration (mol/l) of the oxonium cations H3O+.</p>
<pre><b>plotExpression(apply(-log10(WaterSelfIonization.H3O.solute)),&nbsp;false,&nbsp;&QUOT;pH&QUOT;,&nbsp;1);</b></pre>
<p><br>The titration slope der(pH)/der(SID)=1.48e+6 1/(mol/L) at pH=7.4.</p>
</html>",      revisions="<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),experiment(StopTime=2e-006, __Dymola_Algorithm="Euler"));
      end WaterSelfIonization;

      model CarbonDioxideInWater "CO2 as alone acid-base buffer"
          extends Modelica.Icons.Example;
        Components.Substance HCO3(                  Simulation=Types.SimulationType.SteadyState)
          annotation (Placement(transformation(extent={{-18,46},{2,66}})));
        Components.ChemicalReaction HendersonHasselbalch(
          nP=2,
          K=10^(-6.103 + 3),
          nS=1,
          dH(displayUnit="kJ/mol") = 7300)
          annotation (Placement(transformation(extent={{-58,22},{-38,42}})));
        Sources.UnlimitedGasStorage CO2_gas(
            Simulation=Types.SimulationType.SteadyState,
            PartialPressure=5332.8954966)
          annotation (Placement(transformation(extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-80,82})));
        Components.Substance H3O(
          q_out(conc(nominal=10^(-7.4 + 3))),
          Simulation=Types.SimulationType.SteadyState,
          solute_start=10^(-7 + 3)) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              origin={-8,12})));
        Components.GasSolubility gasSolubility(C=2400, kH_T0(displayUnit="(mmol/l)/kPa at 25degC")=
               0.81805576878885)
          annotation (Placement(transformation(extent={{-90,46},{-70,66}})));
        Components.Substance CO2_liquid(Simulation=Types.SimulationType.SteadyState,
            isDependent=true)
          annotation (Placement(transformation(extent={{-90,22},{-70,42}})));
        SteadyStates.Components.ElementaryChargeConservationLaw electroneutrality(
          Simulation=Types.SimulationType.SteadyState,
          useTotalInput=true,
          NumberOfParticles=3,
          Charges={-1,-2,1},
          Total=2894.560197) "strong ion difference of solution"
          annotation (Placement(transformation(extent={{46,-94},{66,-74}})));
        Components.Substance CO3(
          Simulation=Types.SimulationType.SteadyState,
          isDependent=true,
          solute_start=1e-08)
          annotation (Placement(transformation(extent={{54,46},{74,66}})));
        Components.ChemicalReaction c2(
          nP=2,
          K=10^(-10.33 + 3),
          nS=1,
          dH(displayUnit="kJ/mol") = 14900)
          annotation (Placement(transformation(extent={{16,46},{36,66}})));
        Modelica.Blocks.Math.Gain toColoumn(k(unit="C/s")=-Modelica.Constants.F, y(unit="C"))
          "from elementary charge to to electric charge, which is needed in system"
                                              annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={80,-74})));
        Modelica.Blocks.Sources.Clock SID(offset=-0.01)
          "strong ions difference with respect to albumin charge shift"
          annotation (Placement(transformation(extent={{54,74},{74,94}})));
      equation
        connect(HendersonHasselbalch.products[1], HCO3.q_out) annotation (Line(
            points={{-38,31.5},{-26,31.5},{-26,56},{-8,56}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(H3O.q_out, HendersonHasselbalch.products[2]) annotation (Line(
            points={{-8,12},{-26,12},{-26,32.5},{-38,32.5}},
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
        connect(HCO3.solute, electroneutrality.fragment[1]) annotation (Line(
            points={{-2,46},{-2,38},{16,38},{16,-89.3333},{46,-89.3333}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(CO3.solute, electroneutrality.fragment[2]) annotation (Line(
            points={{70,46},{70,38},{18,38},{18,-88},{46,-88}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(H3O.solute, electroneutrality.fragment[3]) annotation (Line(
            points={{-2,2},{-2,-6},{22,-6},{22,-86.6667},{46,-86.6667}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(H3O.q_out, c2.products[2]) annotation (Line(
            points={{-8,12},{48,12},{48,56.5},{36,56.5}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(HCO3.q_out, c2.substrates[1]) annotation (Line(
            points={{-8,56},{16,56}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(c2.products[1], CO3.q_out) annotation (Line(
            points={{36,55.5},{52,55.5},{52,56},{64,56}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(SID.y,toColoumn. u) annotation (Line(
            points={{75,84},{100,84},{100,-74},{92,-74}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(electroneutrality.total, toColoumn.y) annotation (Line(
            points={{56,-76},{56,-74},{69,-74}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation ( Documentation(info="<html>
<p>CO2 solution in water without any other acid-base buffers.</p>
<pre><b>plotExpression(apply(-log10(CarbonDioxideInWater.H3O.solute)),&nbsp;false,&nbsp;&QUOT;pH&QUOT;,&nbsp;1);</b></pre>
<p><br>Please note, that OH- (and CO3^-2) can be neglected from electroneutrality calculation, because of very small concentrations (in physiological pH) anyway. </p>
<p>And if SID&GT;0 then also H3O+ can be also neglected from electroneutrality, because only bicarbonate anions HCO3- (or CO3^-2) are needed there to balance the electroneutrality.</p>
<p><br>The partial pressure of CO2 in gas are input parameter. Outputs are an amount of free disolved CO2 in liquid and an amount of HCO3-.</p>
<p><br>The titration slope der(pH)/der(SID)=17.5 1/(mol/L) at pH=7.4 and pCO2=40 mmHg.</p>
<p><br>Molar heat of formation (aqueous):</p>
<p>CO2:        -413.5 kJ/mol  (gas: -393.5 kJ/mol )</p>
<p>H2O:        -285.8 kJ/mol</p>
<p>HCO3-:        -692.0 kJ/mol</p>
<p>CO3^-2:        -677.1 kJ/mol</p>
<p><br>Enthalphy of reaction H2O + CO2 &LT;-&GT; HCO3- + H+  :         7.3 kJ/mol</p>
<p>Enthalphy of reaction HCO3- &LT;-&GT; CO3^-2 + H+  :        14.9 kJ/mol</p>
</html>",      revisions="<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),experiment(StopTime=0.02, __Dymola_Algorithm="Euler"));
      end CarbonDioxideInWater;

      model AlbuminTitration "Figge-Fencl model (22. Dec. 2007)"
        extends Modelica.Icons.Example;

        Components.Substance H3O(
          q_out(conc(nominal=10^(-7.4 + 3))),
          Simulation=Types.SimulationType.SteadyState,
          solute_start=10^(-7.4 + 3),
          isDependent=true) "hydrogen ions activity" annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              origin={14,22})));

        SteadyStates.Components.MolarConservationLaw
          molarConservationLaw[n](
          each n=2,
          each Simulation=Types.SimulationType.SteadyState,
          each Total=0.00066)
          annotation (Placement(transformation(extent={{44,-6},{64,14}})));
        SteadyStates.Components.ElementaryChargeConservationLaw electroneutrality(
          Simulation=Types.SimulationType.SteadyState,
          NumberOfParticles=n,
          Charges=ones(n),
          useTotalInput=true,
          Total=6425.92363734) "strong ion difference of solution"
          annotation (Placement(transformation(extent={{46,-94},{66,-74}})));
        Modelica.Blocks.Math.Gain toColoumn(k(unit="C/s")=-Modelica.Constants.F,y(unit="C"))
          "from elementary charge to to electric charge, which is needed in system"
                                              annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={80,-74})));
        Modelica.Blocks.Sources.Clock SID(offset=-0.0832)
          "strong ions difference with respect to albumin charge shift"
          annotation (Placement(transformation(extent={{54,76},{74,96}})));

        parameter Integer n=218 "Number of weak acid group in albumin molecule";
        parameter Real pKAs[n]=cat(1,{8.5},fill(4.0,98),fill(11.7,18),fill(12.5,24),fill(5.8,2),fill(6.0,2),{7.6,7.8,7.8,8,8},fill(10.3,50),{7.19,7.29,7.17,7.56,7.08,7.38,6.82,6.43,4.92,5.83,6.24,6.8,5.89,5.2,6.8,5.5,8,3.1})
          "acid dissociation constants";

        Chemical.Components.Substance A[n](
          each Simulation=Types.SimulationType.SteadyState,
          each isDependent=true,
          each solute_start=0.00033) "deprotonated acid groups"
          annotation (Placement(transformation(extent={{4,-16},{24,4}})));
        Chemical.Components.ChemicalReaction react[n](
          each nP=2,
          K=fill(10.0, n) .^ (-pKAs .+ 3))
          annotation (Placement(transformation(extent={{-44,-2},{-24,18}})));

        Chemical.Components.Substance HA[n](
          each Simulation=Types.SimulationType.SteadyState, each
            solute_start=0.00033) "protonated acid groups"
          annotation (Placement(transformation(extent={{-76,-2},{-56,18}})));

      equation
        connect(react.products[1], A.q_out) annotation (Line(
            points={{-24,7.5},{-12,7.5},{-12,-6},{14,-6}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        for i in 1:n loop
          connect(react[i].products[2], H3O.q_out) annotation (Line(
              points={{-24,8.5},{-14,8.5},{-14,22},{14,22}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
        end for;
        connect(HA.q_out, react.substrates[1]) annotation (Line(
            points={{-66,8},{-44,8}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(A.solute, molarConservationLaw.fragment[1]) annotation (Line(
            points={{20,-16},{20,-20},{36,-20},{36,-1},{44,-1}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(HA.solute, molarConservationLaw.fragment[2]) annotation (Line(
            points={{-60,-2},{-60,-8},{-78,-8},{-78,36},{36,36},{36,0},{44,0},{
                44,1}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(SID.y,toColoumn. u) annotation (Line(
            points={{75,86},{100,86},{100,-74},{92,-74}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(HA.solute, electroneutrality.fragment) annotation (Line(
            points={{-60,-2},{-60,-88},{46,-88}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(toColoumn.y, electroneutrality.total) annotation (Line(
            points={{69,-74},{56,-74},{56,-76}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation ( Documentation(revisions="<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>",       info="<html>
<pre><b>plotExpression(apply(-log10(AlbuminTitration.H3O.solute)),&nbsp;false,&nbsp;&QUOT;pH&QUOT;,&nbsp;1);</b></pre>
<p>The titration slope der(pH)/der(SID)=185 1/(mol/L) at pH=7.4 and tAlb=0.66 mmol/l.</p>
<p><br>Data and model is described in</p>
<p><font style=\"color: #222222; \">Jame Figge: Role of non-volatile weak acids (albumin, phosphate and citrate). In: Stewart&apos;s Textbook of Acid-Base, 2nd Edition, John A. Kellum, Paul WG Elbers editors, &nbsp;AcidBase org, 2009, pp. 216-232.</font></p>
</html>"),experiment(
            StopTime=0.0235,
            __Dymola_fixedstepsize=5e-005,
            __Dymola_Algorithm="Euler"));
      end AlbuminTitration;

      model Phosphate
          extends Modelica.Icons.Example;

        parameter Types.Concentration totalPO4=0.00115
          "Total phosphate concentration";

        Modelica.Blocks.Math.Log10 minusPh "value of minus pH"
          annotation (Placement(transformation(extent={{64,-20},{84,0}})));

        Modelica.Blocks.Sources.Clock SID(offset=0)
          "strong ions difference with respect to albumin charge shift"
          annotation (Placement(transformation(extent={{44,74},{64,94}})));

        Chemical.Components.Substance H(
          q_out(conc(nominal=10^(-7.4 + 3))),
          Simulation=Types.SimulationType.SteadyState,
          solute_start=10^(-7.4 + 3),
          isDependent=true) "hydrogen ions activity" annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              origin={36,-12})));

        Chemical.Components.Substance H3PO4(
          Simulation=Types.SimulationType.SteadyState,
          isDependent=true,
          solute_start=1e-08)
          annotation (Placement(transformation(extent={{-98,-58},{-78,-38}})));
        Chemical.Components.Substance H2PO4(Simulation=Types.SimulationType.SteadyState,
            solute_start=0.0005)
          annotation (Placement(transformation(extent={{-44,-58},{-24,-38}})));
        Chemical.Components.Substance HPO4(Simulation=Types.SimulationType.SteadyState,
            solute_start=0.0006)
          annotation (Placement(transformation(extent={{16,-58},{36,-38}})));
        Chemical.Components.Substance PO4(Simulation=Types.SimulationType.SteadyState,
            solute_start=1e-08)
          annotation (Placement(transformation(extent={{72,-58},{92,-38}})));

        Chemical.Components.ChemicalReaction chemicalReaction(nP=2, K=10
              ^(-1.915 + 3))
          annotation (Placement(transformation(extent={{-70,-58},{-50,-38}})));
        Chemical.Components.ChemicalReaction chemicalReaction1(nP=2, K=10
              ^(-6.66 + 3))
          annotation (Placement(transformation(extent={{-14,-58},{6,-38}})));
        Chemical.Components.ChemicalReaction chemicalReaction2(nP=2, K=10
              ^(-11.78 + 3))
          annotation (Placement(transformation(extent={{44,-58},{64,-38}})));
        SteadyStates.Components.MolarConservationLaw tP04(
          each Simulation=Types.SimulationType.SteadyState,
          each n=4,
          each Total=totalPO4*1)
          annotation (Placement(transformation(extent={{-28,-90},{-8,-70}})));

        SteadyStates.Components.ElementaryChargeConservationLaw
          electroneutrality(
          Simulation=Types.SimulationType.SteadyState,
          Total(displayUnit="meq") = 3502.41783837,
          useTotalInput=true,
          NumberOfParticles=3,
          Charges={-1,-2,-3})
          annotation (Placement(transformation(extent={{48,-94},{68,-74}})));

        Modelica.Blocks.Math.Gain toColoumn(k(unit="C/s")=Modelica.Constants.F,y(unit="C"))
          "from elementary charge to Coloumn" annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={84,-86})));

      equation
        connect(H3PO4.q_out, chemicalReaction.substrates[1]) annotation (Line(
            points={{-88,-48},{-70,-48}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(chemicalReaction.products[1], H2PO4.q_out) annotation (Line(
            points={{-50,-48.5},{-42,-48.5},{-42,-48},{-34,-48}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(H2PO4.q_out, chemicalReaction1.substrates[1]) annotation (Line(
            points={{-34,-48},{-14,-48}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(chemicalReaction1.products[1], HPO4.q_out) annotation (Line(
            points={{6,-48.5},{16,-48.5},{16,-48},{26,-48}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(HPO4.q_out, chemicalReaction2.substrates[1]) annotation (Line(
            points={{26,-48},{44,-48}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(chemicalReaction2.products[1], PO4.q_out) annotation (Line(
            points={{64,-48.5},{74,-48.5},{74,-48},{82,-48}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(chemicalReaction.products[2], H.q_out) annotation (Line(
            points={{-50,-47.5},{-44,-47.5},{-44,-32},{36,-32},{36,-12}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(chemicalReaction1.products[2], H.q_out) annotation (Line(
            points={{6,-47.5},{14,-47.5},{14,-32},{36,-32},{36,-12}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(chemicalReaction2.products[2], H.q_out) annotation (Line(
            points={{64,-47.5},{72,-47.5},{72,-32},{36,-32},{36,-12}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(H3PO4.solute, tP04.fragment[1]) annotation (Line(
            points={{-82,-58},{-82,-86},{-28,-86},{-28,-85.5}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(H2PO4.solute, tP04.fragment[2]) annotation (Line(
            points={{-28,-58},{-28,-62},{-64,-62},{-64,-84.5},{-28,-84.5}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(HPO4.solute, tP04.fragment[3]) annotation (Line(
            points={{32,-58},{32,-64},{-50,-64},{-50,-83.5},{-28,-83.5}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(PO4.solute, tP04.fragment[4]) annotation (Line(
            points={{88,-58},{88,-68},{-40,-68},{-40,-82.5},{-28,-82.5}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(H.solute, minusPh.u) annotation (Line(
            points={{42,-22},{42,-26},{54,-26},{54,-10},{62,-10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(SID.y, toColoumn.u) annotation (Line(
            points={{65,84},{100,84},{100,-86},{96,-86}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(toColoumn.y, electroneutrality.total) annotation (Line(
            points={{73,-86},{70,-86},{70,-76},{58,-76}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(H2PO4.solute, electroneutrality.fragment[1]) annotation (Line(
            points={{-28,-58},{-28,-62},{24,-62},{24,-89.3333},{48,-89.3333}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(HPO4.solute, electroneutrality.fragment[2]) annotation (Line(
            points={{32,-58},{32,-88},{48,-88}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(PO4.solute, electroneutrality.fragment[3]) annotation (Line(
            points={{88,-58},{88,-68},{28,-68},{28,-86.6667},{48,-86.6667}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation ( Documentation(info="<html>
<p>Henderson-Hasselbalch equation in ideal buffered solution, where pH remains constant.</p>
<p>The partial pressure of CO2 in gas are input parameter. Outputs are an amount of free disolved CO2 in liquid and an amount of HCO3-.</p>
</html>",      revisions="<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),experiment(StopTime=0.05));
      end Phosphate;

      class Develop
        extends Modelica.Icons.UnderConstruction;
        model PlasmaAcidBase

          Components.Substance H3O(
            q_out(conc(nominal=10^(-7.4 + 3))),
            Simulation=Types.SimulationType.SteadyState,
            solute_start=10^(-7.4 + 3),
            isDependent=true) "hydrogen ions activity" annotation (Placement(
                transformation(
                extent={{-10,-10},{10,10}},
                origin={38,40})));

          SteadyStates.Components.MolarConservationLaw tAlb[n](
            each n=2,
            each Simulation=Types.SimulationType.SteadyState,
            each Total=0.00066)
            annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
          SteadyStates.Components.ElementaryChargeConservationLaw electroneutrality(
            Simulation=Types.SimulationType.SteadyState,
            useTotalInput=true,
            Charges=cat(
                1,
                {-1,-1,-2,-1},
                ones(n)),
            NumberOfParticles=m + n,
            Total=6425.92363734) "strong ion difference of solution"
            annotation (Placement(transformation(extent={{46,-94},{66,-74}})));
          Modelica.Blocks.Math.Gain toColoumn(k(unit="C/s")=-Modelica.Constants.F,y(unit="C"))
            "from elementary charge to to electric charge, which is needed in system"
                                                annotation (Placement(transformation(
                extent={{-8,-8},{8,8}},
                rotation=180,
                origin={78,-70})));
          Modelica.Blocks.Sources.Clock SID_less_Cl(offset=-0.0832)
            "strong ions difference without chloride with respect to albumin charge shift"
            annotation (Placement(transformation(extent={{68,-42},{88,-22}})));

          constant Integer m=4
            "number of particle types in electroneutrality equation";

          parameter Boolean isDependent[3] = {false,false,false};

          parameter Types.AmountOfSubstance totalPO4=0.00115
            "Total phosphate concentration";
          parameter Types.AmountOfSubstance totalAlb=0.00066
            "Total albumin concentration";

          parameter Integer n=218
            "Number of weak acid group in albumin molecule";
          parameter Real pKAs[n]=cat(1,{8.5},fill(4.0,98),fill(11.7,18),fill(12.5,24),fill(5.8,2),fill(6.0,2),{7.6,7.8,7.8,8,8},fill(10.3,50),{7.19,7.29,7.17,7.56,7.08,7.38,6.82,6.43,4.92,5.83,6.24,6.8,5.89,5.2,6.8,5.5,8,3.1})
            "acid dissociation constants";

          Chemical.Components.Substance A[n](
            each Simulation=Types.SimulationType.SteadyState,
            each isDependent=true,
            each solute_start=0.00033) "deprotonated acid groups"
            annotation (Placement(transformation(extent={{-10,14},{10,34}})));
          Chemical.Components.ChemicalReaction react[n](
            each nP=2,
            K=fill(10.0, n) .^ (-pKAs .+ 3))
            annotation (Placement(transformation(extent={{-44,16},{-24,36}})));

          Chemical.Components.Substance HA[n](
            each Simulation=Types.SimulationType.SteadyState, each
              solute_start=0.00033) "protonated acid groups"
            annotation (Placement(transformation(extent={{-76,16},{-56,36}})));

          Components.Substance CO2_liquid(Simulation=Types.SimulationType.SteadyState,
              isDependent=isDependent[1])
            annotation (Placement(transformation(extent={{-76,64},{-56,84}})));
          Components.Substance HCO3(                  Simulation=Types.SimulationType.SteadyState,
              isDependent=isDependent[2])
            annotation (Placement(transformation(extent={{42,70},{62,90}})));
          Interfaces.ChemicalPort_a substances[3]
            "{free dissolved CO2, bicarbonate, chloride}"
            annotation (Placement(transformation(extent={{-10,70},{10,90}})));
          Components.Substance                        H2PO4(Simulation=Types.SimulationType.SteadyState,
              solute_start=0.0005)
            annotation (Placement(transformation(extent={{-62,-54},{-42,-34}})));
          Components.ChemicalReaction phosphateAcidification(nP=2, K=10^(-6.66 + 3))
            annotation (Placement(transformation(extent={{-32,-54},{-12,-34}})));
          Components.Substance                        HPO4(Simulation=Types.SimulationType.SteadyState,
            isDependent=true,
            solute_start=0.0006)
            annotation (Placement(transformation(extent={{-2,-54},{18,-34}})));
          SteadyStates.Components.MolarConservationLaw               tP04(
            each Simulation=Types.SimulationType.SteadyState,
            each n=2,
            each Total=totalPO4)
            annotation (Placement(transformation(extent={{-28,-80},{-8,-60}})));
          Components.Substance Cl(Simulation=Types.SimulationType.SteadyState,
              isDependent=isDependent[3]) "chloride anion"
            annotation (Placement(transformation(extent={{76,42},{96,62}})));
        equation
          connect(react.products[1], A.q_out) annotation (Line(
              points={{-24,25.5},{-12,25.5},{-12,24},{0,24}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          for i in 1:n loop
            connect(react[i].products[2], H3O.q_out) annotation (Line(
                points={{-24,26.5},{-14,26.5},{-14,40},{38,40}},
                color={107,45,134},
                thickness=1,
                smooth=Smooth.None));
          end for;
          connect(HA.q_out, react.substrates[1]) annotation (Line(
              points={{-66,26},{-44,26}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(A.solute, tAlb.fragment[1]) annotation (Line(
              points={{6,14},{6,10},{-54,10},{-54,-5},{-40,-5}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(HA.solute, tAlb.fragment[2]) annotation (Line(
              points={{-60,16},{-60,-4},{-40,-4},{-40,-3}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(toColoumn.y, electroneutrality.total) annotation (Line(
              points={{69.2,-70},{56,-70},{56,-76}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(substances[1], CO2_liquid.q_out) annotation (Line(
              points={{0,73.3333},{0,74},{-66,74}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(HCO3.q_out, substances[2]) annotation (Line(
              points={{52,80},{0,80}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(H2PO4.q_out, phosphateAcidification.substrates[1]) annotation (Line(
              points={{-52,-44},{-32,-44}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(phosphateAcidification.products[1], HPO4.q_out) annotation (Line(
              points={{-12,-44.5},{-2,-44.5},{-2,-44},{8,-44}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(H2PO4.solute, tP04.fragment[1]) annotation (Line(
              points={{-46,-54},{-46,-75},{-28,-75}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(HPO4.solute, tP04.fragment[2]) annotation (Line(
              points={{14,-54},{14,-60},{-40,-60},{-40,-73},{-28,-73}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(phosphateAcidification.products[2], H3O.q_out) annotation (Line(
              points={{-12,-43.5},{-4,-43.5},{-4,-28},{20,-28},{20,40},{38,40}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(HCO3.solute, electroneutrality.fragment[1]) annotation (Line(
              points={{58,70},{58,-62},{32,-62},{32,-88},{46,-88}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(H2PO4.solute, electroneutrality.fragment[2]) annotation (Line(
              points={{-46,-54},{-46,-86},{46,-86},{46,-88}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(HPO4.solute, electroneutrality.fragment[3]) annotation (Line(
              points={{14,-54},{14,-88},{46,-88}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(Cl.q_out, substances[3]) annotation (Line(
              points={{86,52},{0,52},{0,86.6667}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(HA.solute, electroneutrality.fragment[(m+1):(n+m)]) annotation (Line(
              points={{-60,16},{-60,-88},{46,-88}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(SID_less_Cl.y, toColoumn.u) annotation (Line(
              points={{89,-32},{92,-32},{92,-70},{87.6,-70}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(Cl.solute, electroneutrality.fragment[4]) annotation (Line(
              points={{92,42},{92,10},{54,10},{54,-64},{34,-64},{34,-88},{46,
                  -88}},
              color={0,0,127},
              smooth=Smooth.None));
          annotation ( Documentation(revisions="<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>",         info="<html>
<pre><b>plotExpression(apply(-log10(AlbuminTitration.H3O.solute)),&nbsp;false,&nbsp;&QUOT;pH&QUOT;,&nbsp;1);</b></pre>
<p>The titration slope der(pH)/der(SID)=185 1/(mol/L) at pH=7.4 and tAlb=0.66 mmol/l.</p>
<p><br>Data and model is described in</p>
<p><font style=\"color: #222222; \">Jame Figge: Role of non-volatile weak acids (albumin, phosphate and citrate). In: Stewart&apos;s Textbook of Acid-Base, 2nd Edition, John A. Kellum, Paul WG Elbers editors, &nbsp;AcidBase org, 2009, pp. 216-232.</font></p>
</html>"),  experiment(
              StopTime=0.0235,
              __Dymola_fixedstepsize=5e-005,
              __Dymola_Algorithm="Euler"));
        end PlasmaAcidBase;

        model ErythrocyteAcidBase
          parameter Boolean isDependent[4] = {false,false,false,false};

          Components.Substance H3O(
            q_out(conc(nominal=10^(-7.4 + 3))),
            Simulation=Types.SimulationType.SteadyState,
            solute_start=10^(-7.4 + 3),
            isDependent=isDependent[4]) "hydrogen ions activity" annotation (Placement(
                transformation(
                extent={{-10,-10},{10,10}},
                origin={-12,36})));
          Components.ChemicalReaction HendersonHasselbalch(
            nP=2,
            dH=15.13,
            K=10^(-6.103 + 3),
            nS=1)
            annotation (Placement(transformation(extent={{-60,46},{-40,66}})));
          Components.Substance CO2_liquid(Simulation=Types.SimulationType.SteadyState,
              isDependent=isDependent[1])
            annotation (Placement(transformation(extent={{-90,46},{-70,66}})));
          Components.Substance HCO3(                  Simulation=Types.SimulationType.SteadyState,
              isDependent=isDependent[2])
            annotation (Placement(transformation(extent={{-22,70},{-2,90}})));
          Interfaces.ChemicalPort_a substances[3]
            "{free dissolved CO2, bicarbonate, chloride}"
            annotation (Placement(transformation(extent={{-90,70},{-70,90}})));
          Components.Substance Cl(Simulation=Types.SimulationType.SteadyState,
              isDependent=isDependent[3]) "chloride anion"
            annotation (Placement(transformation(extent={{76,82},{96,102}})));
        equation
          connect(HendersonHasselbalch.products[1],HCO3. q_out) annotation (Line(
              points={{-40,55.5},{-30,55.5},{-30,80},{-12,80}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(H3O.q_out,HendersonHasselbalch. products[2]) annotation (Line(
              points={{-12,36},{-30,36},{-30,56.5},{-40,56.5}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(CO2_liquid.q_out,HendersonHasselbalch. substrates[1]) annotation (
             Line(
              points={{-80,56},{-60,56}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(substances[1], CO2_liquid.q_out) annotation (Line(
              points={{-80,73.3333},{-80,56}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(HCO3.q_out, substances[2]) annotation (Line(
              points={{-12,80},{-80,80}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(Cl.q_out, substances[3]) annotation (Line(
              points={{86,92},{-80,92},{-80,86.6667}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
        end ErythrocyteAcidBase;

        model BloodAcidBase
          PlasmaAcidBase plasmaAcidBase
            annotation (Placement(transformation(extent={{-34,-6},{-14,14}})));
          Develop.ErythrocyteAcidBase erythrocyteAcidBase
            annotation (Placement(transformation(extent={{56,-6},{76,14}})));
          Components.Membrane membrane(NumberOfParticles=3)
            annotation (Placement(transformation(extent={{14,2},{34,22}})));
        equation
          connect(plasmaAcidBase.substances, membrane.particlesInside)
            annotation (Line(
              points={{-24,12},{14,12}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(membrane.particlesOutside, erythrocyteAcidBase.substances)
            annotation (Line(
              points={{34,12},{58,12}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
        end BloodAcidBase;
      end Develop;
    end AcidBase;
  end Examples;

  package Components
    extends Modelica.Icons.Package;
    model Substance "Substance accumulation in solution"
      extends Icons.Substance;
      extends Interfaces.ConditionalVolume;

      extends SteadyStates.Interfaces.SteadyState(
      state(nominal=NominalSolute),
      change(nominal=NominalSolute/60),
      state_start=solute_start,
      storeUnit="mmol");

      parameter Types.AmountOfSubstance solute_start(nominal=NominalSolute) = 1e-8
        "Initial solute amount in compartment"
         annotation ( HideResult=true, Dialog(group="Initialization"));

      Types.RealIO.AmountOfSubstanceOutput solute(nominal=
          NominalSolute) "Current amount of solute"
        annotation (Placement(transformation(extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,-100}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={60,-100})));

      parameter Types.AmountOfSubstance NominalSolute = 0.001
        "Numerical scale. Default is from mmol to mol, but for some substances such as hormones, hydronium or hydroxide ions can be much smaller."
          annotation ( HideResult=true, Dialog(tab="Solver",group="Numerical support of very small concentrations"));

      Chemical.Interfaces.ChemicalPort_b            q_out(conc(start=solute_start/NormalVolume))
        "Concentration and molar flow from/to compartment" annotation (Placement(transformation(extent={{-10,
                -10},{10,10}})));

      parameter Types.MolarEnergy dH=0 "Standard Enthalpy Change"
        annotation ( HideResult=true, Dialog(tab="Energies"));

      Types.RealIO.EnergyOutput internalHeat
        "Internal heat energy = enthalpy*amountOfSubstance" annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={60,-100}), iconTransformation(
            extent={{-20,-20},{20,20}},
            origin={116,-40})));
    equation
      q_out.conc = solute/volume;

      state = solute; // der(solute)=q_out.q
      change = q_out.q;

      internalHeat = dH*solute;

                                                                                                        annotation (
        Icon(coordinateSystem(
              preserveAspectRatio=false,extent={{-100,-100},{100,100}}),
            graphics={Text(
              extent={{-80,90},{280,130}},
              lineColor={0,0,255},
              textString="%name")}),
        Documentation(revisions="<html>
<p>2009-2015 by Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>", info="<html>
<p><b>Solute = Concentration &middot; Volume = &int; MolarFlow</b></p>
<p>The main class from &ldquo;Chemical&rdquo; package is called &QUOT;Substance&QUOT;. It has one chemical connector, where molar concentration and molar flow is presented as usually. An amount of a substance (&QUOT;solute&QUOT;) is accumulated by molar flow inside an instance of this class. In the default setting the volume is set to one liter, so in this setting the concentration at &ldquo;mol/L&rdquo; has the same value as the variable solute at &ldquo;mol&rdquo;. But in the advanced settings the default volume can be changed with external input. The molar flow at the port can be also negative, which means that the solute leaves the Substance instance.&nbsp;</p>
</html>"));
    end Substance;

    model ChemicalReaction "Chemical Reaction"
      import Physiolibrary;

      Real KaT "Dissociation constant at current temperature";
      Types.MolarFlowRate rr "Reaction molar flow rate";

      extends Chemical.Interfaces.ConditionalVolume;

      parameter Boolean useDissociationConstantInput = false
        "=true, if external dissociation ratio is used"
      annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

      parameter Boolean useForwardRateInput = false
        "=true, if external forward rate is used"
      annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

      Modelica.Blocks.Interfaces.RealInput dissociationConstant(start=K) = KBase if useDissociationConstantInput
        "Dissociation coefficient [SI-unit]"
                                          annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,40})));

      Chemical.Interfaces.ChemicalPort_b
                                products[nP] "Products"
                             annotation (Placement(
            transformation(extent={{90,-10},{110,10}})));

      Chemical.Interfaces.ChemicalPort_a
                                substrates[nS] "Substrates"
                                annotation (Placement(
            transformation(extent={{-110,-10},{-90,10}})));

      parameter Real K = 1
        "Fixed dissociation constant [SI-unit] if useDissociationConstantInput=false"
        annotation ( HideResult=true, Dialog(enable=not useDissociationConstantInput));

      parameter Real kf = 10^8 "Forward reaction rate coefficient [SI unit]"
        annotation ( HideResult=true, Dialog(enable=not useForwardRateInput));
      //  annotation (Dialog(group="Parameters")); //forward K*(10^rateLevel) at temperature TK

      parameter Integer nS=1 "Number of substrates types"
        annotation ( HideResult=true, Dialog(group="Substrates", tab="Reaction type"));
      parameter Integer nP=1 "Number of products types"
        annotation ( HideResult=true, Dialog(group="Products", tab="Reaction type"));

      parameter Types.StoichiometricNumber s[nS]=ones(nS)
        "Stoichiometric reaction coefficient for substrates"
        annotation (  HideResult=true, Dialog(group="Substrates", tab="Reaction type"));
      parameter Modelica.SIunits.ActivityCoefficient as[nS]=ones(nS)
        "Activity coefficients of substrates"
        annotation ( HideResult=true, Dialog(group="Substrates", tab="Reaction type"));

      parameter Types.StoichiometricNumber p[nP]=ones(nP)
        "Stoichiometric reaction coefficients for products"
        annotation ( HideResult=true, Dialog(group="Products", tab="Reaction type"));
       parameter Modelica.SIunits.ActivityCoefficient ap[nP]=ones(nP)
        "Activity coefficients of products"
        annotation ( HideResult=true, Dialog(group="Products", tab="Reaction type"));

     extends Chemical.Interfaces.ConditionalHeatPort;

      parameter Types.Temperature TK=298.15 "Base temperature"
        annotation ( HideResult=true, Dialog(tab="Temperature dependence"));

      parameter Types.MolarEnergy dH=0
        "Standard Enthalpy Change (negative=exothermic)"
        annotation ( HideResult=true, Dialog(tab="Temperature dependence"));

      parameter Types.Fraction solventFraction=1
        "Free solvent fraction in liquid (i.e. water fraction in plasma=0.94, in RBC=0.65, in blood=0.81)";

      Real KBase "dissociation constant at TK" annotation (HideResult=true);

      Real forwardRate;
    protected
      parameter Types.Fraction fsp=solventFraction^(sum(s)+sum(p));
      parameter Types.Fraction fs=solventFraction^(sum(s));
      parameter Types.Fraction fp=solventFraction^(sum(p));

    public
      Modelica.Blocks.Interfaces.RealInput forwardRateCoefficient(start=kf)=forwardRate if
                                                                                    useForwardRateInput
        "Reaction forward rate coefficient [SI-unit]" annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={40,40})));
    equation
      if not useDissociationConstantInput then
        KBase = K;
      end if;
      if not useForwardRateInput then
        forwardRate = kf;
      end if;

      KaT = KBase * Modelica.Math.exp(((-dH)/Modelica.Constants.R)*(1/T_heatPort - 1/TK));  //Hoff's equation

      rr*fsp = forwardRate*volume*(product((as.*substrates.conc).^s)*fp - (1/KaT)*product((ap.*products.conc).^p)*fs);  //Elementary first-order rate kinetics - the main equation

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
        Documentation(revisions="<html>
<p><i>2013-2015 by </i>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>",     info="<html>
<p><b>s<sub>1</sub>&middot;S<sub>1</sub> + .. + s<sub>nS</sub>&middot;S<sub>nS</sub> &LT;-&GT; p<sub>1</sub>&middot;P<sub>1</sub> + .. + p<sub>nP</sub>&middot;P<sub>nP</b></sub> </p>
<h4><span style=\"color:#008000\">Relations</span></h4>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"0\"><tr>
<td><p>k<sub>f</sub>&middot;volume&middot;<a href=\"modelica://ModelicaReference.Operators.'product()'\">product</a>(S<a href=\"ModelicaReference.Operators.ElementaryOperators\">.^</a>s)</p></td>
<td><p>forward rate</p></td>
</tr>
<tr>
<td><p>k<sub>b</sub>&middot;volume&middot;<a href=\"modelica://ModelicaReference.Operators.'product()'\">product</a>(P<a href=\"ModelicaReference.Operators.ElementaryOperators\">.^</a>p)</p></td>
<td><p>backward rate</p></td>
</tr>
<tr>
<td><p>K<sub>aT</sub> = k<sub>f</sub>/k<sub>b</sub> = <a href=\"modelica://ModelicaReference.Operators.'product()'\">product</a>(P<a href=\"ModelicaReference.Operators.ElementaryOperators\">.^</a>p) / <a href=\"modelica://ModelicaReference.Operators.'product()'\">product</a>(S<a href=\"ModelicaReference.Operators.ElementaryOperators\">.^</a>s)&nbsp;</p></td>
<td><p>equilibrium</p></td>
</tr>
<tr>
<td><p><a href=\"modelica://ModelicaReference.Operators.'log()'\">log</a>(K<sub>aT</sub>/K<sub>Base</sub>) = (-&Delta;H/<a href=\"modelica://Modelica.Constants\">R</a>)&middot;(1/T<sub>heatPort</sub> - 1/T<sub>K</sub>)&nbsp;</p></td>
<td><p>van&apos;t Hoff&apos;s equation</p></td>
</tr>
<tr>
<td><p>&Delta;<sub>r</sub>G<sup>0</sup>= &Delta;H - T&middot;&Delta;S = -R&middot;T&middot;<a href=\"modelica://ModelicaReference.Operators.'log()'\">log</a>(K<sub>aT</sub>) </p></td>
<td><p>Gibb&apos;s energy </p></td>
</tr>
<tr>
<td><p>&Delta;S = <a href=\"modelica://Modelica.Constants\">k</a>&middot;<a href=\"modelica://ModelicaReference.Operators.'log()'\">log</a>(&omega;) </p></td>
<td><p>entropy </p></td>
</tr>
</table>
<h4><span style=\"color:#008000\">Notations</span></h4>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"0\"><tr>
<td><p>S<sub>i</sub></p></td>
<td><p>molar concentration of i-th substrate</p></td>
</tr>
<tr>
<td><p>s<sub>i</sub></p></td>
<td><p>stochiometric coefficients of i-th substrate</p></td>
</tr>
<tr>
<td><p>nS</p></td>
<td><p>number of substrates</p></td>
</tr>
<tr>
<td><p>P<sub>j</sub></p></td>
<td><p>molar concentration of j-th product</p></td>
</tr>
<tr>
<td><p>p<sub>j</sub></p></td>
<td><p>stochiometric coefficients of j-th product</p></td>
</tr>
<tr>
<td><p>nP</p></td>
<td><p>number of products</p></td>
</tr>
<tr>
<td><p>K<sub>aT</sub></p></td>
<td><p>dissociation constant at current temperature T</p></td>
</tr>
<tr>
<td><p>k<sub>f</sub></p></td>
<td><p>forward rate coefficient at current temperature T</p></td>
</tr>
<tr>
<td><p>k<sub>b</sub></p></td>
<td><p>backward rate coefficient at current temperature T</p></td>
</tr>
<tr>
<td><p>volume &nbsp;</p></td>
<td><p>solution volume</p></td>
</tr>
<tr>
<td><p>&Delta;H</p></td>
<td><p>enthalpy of the reaction</p></td>
</tr>
<tr>
<td><p>T<sub>heatPort</sub></p></td>
<td><p>current temperature T</p></td>
</tr>
<tr>
<td><p>K<sub>Base</sub></p></td>
<td><p>tabulated dissociation constant at base temperature T<sub>K</sub></p></td>
</tr>
<tr>
<td><p>T<sub>K</sub></p></td>
<td><p>base temperature of tabulated coeficients</p></td>
</tr>
<tr>
<td><p>&omega;</p></td>
<td><p>change of number of microstates of particles</p></td>
</tr>
<tr>
<td><p>&Delta;S</p></td>
<td><p>entropy of the reaction</p></td>
</tr>
<tr>
<td><p>&Delta;<sub>r</sub>G<sup>0</sup></p></td>
<td><p>Gibb&apos;s energy of the reaction</p></td>
</tr>
<tr>
<td></td>
<td></td>
</tr>
</table>
</html>"));
    end ChemicalReaction;

    model GasSolubility "Henry's law of gas solubility in liquid."
       //q_in is dissolved in liquid and q_out is in gaseous solution"

      extends Icons.GasSolubility;
      extends Chemical.Interfaces.ConditionalHeatPort;

      parameter Types.DiffusionPermeability solubilityRateCoef=0.01
        "The rate constant of incoming gas to solution (default 10 liter per second)"
                                                                                     annotation ( HideResult=true);

      Types.GasSolubility kH
        "Henry's law coefficient such as liquid-gas concentration ratio";

      parameter Types.GasSolubility kH_T0
        "Henry's law coefficient at base temperature (i.e. in (mmol/l)/kPa at 25degC: aO2=0.011, aCO2=0.245, ..)"
                                                                                                    annotation ( HideResult=true);
      parameter Types.Temperature T0=298.15 "Base temperature for kH_T0"
         annotation (HideResult=true,Dialog(tab="Temperature dependence"));
      parameter Types.Temperature C(displayUnit="K")
        "Gas-liquid specific constant for Van't Hoff's change of kH (i.e.: O2..1700K,CO2..2400K,N2..1300K,CO..1300K,..)"
        annotation (HideResult=true,Dialog(tab="Temperature dependence"));

      parameter Types.Fraction solventFraction=1
        "Free solvent fraction in liquid (i.e. water fraction in plasma=0.94, in RBC=0.65, in blood=0.81)";

      Chemical.Interfaces.ChemicalPort_b
                                q_out "Gaseous solution"
                             annotation (Placement(
            transformation(extent={{-10,90},{10,110}})));

      Chemical.Interfaces.ChemicalPort_a
                                q_in "Dissolved in liquid solution"
                                annotation (Placement(
            transformation(extent={{-10,-90},{10,-70}})));
    equation
      q_in.q + q_out.q = 0;

      kH = kH_T0 * Modelica.Math.exp(C* (1/T_heatPort - 1/T0)); // Van't Hoff equation

      // equilibrium:  liquid.conc = kH * gas.conc;
      q_out.q = solubilityRateCoef*(kH * q_out.conc - q_in.conc/solventFraction); //negative because of outflow

      lossHeat = C*Modelica.Constants.R*q_out.q; //negative = heat are comsumed when change from liquid to gas

       annotation (Documentation(revisions="<html>
<p><i>2009-2015 by </i>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>", info="<html>
<p><b>Concentration<sub>Liquid</sub> = k<sub>H</sub> &middot; Concentration<sub>Gas</b></sub></p>
<p>Henry&apos;s law: The concentration of the gas in the liquid is proportional to the partial pressure of the gas during equilibrium. </p>
<h4><span style=\"color:#008000\">Relations</span></h4>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"0\"><tr>
<td><p>k<sub>d</sub>&middot;A&middot;c<sub>gas</sub></p></td>
<td><p>dissolution rate</p></td>
</tr>
<tr>
<td><p>k<sub>v</sub>&middot;A&middot;c<sub>liquid</sub></p></td>
<td><p>volatility rate</p></td>
</tr>
<tr>
<td><p>k<sub>H</sub> = k<sub>d</sub>/k<sub>v</sub> = c<sub>liquid</sub>/c<sub>gas</sub></p></td>
<td><p>equilibrium</p></td>
</tr>
<tr>
<td><p><a href=\"modelica://ModelicaReference.Operators.'log()'\">log</a>(k<sub>H</sub>/K<sub>H0</sub>) = (-&Delta;H/<a href=\"modelica://Modelica.Constants\">R</a>)&middot;(1/T<sub>heatPort</sub> - 1/T<sub>K</sub>)&nbsp;</p></td>
<td><p>van&apos;t Hoff&apos;s equation</p></td>
</tr>
<tr>
<td><p>&Delta;<sub>r</sub>G<sup>0</sup>= &Delta;H - T&middot;&Delta;S = -R&middot;T&middot;<a href=\"modelica://ModelicaReference.Operators.'log()'\">log</a>(K<sub>H</sub>) </p></td>
<td><p>Gibb&apos;s energy </p></td>
</tr>
<tr>
<td><p>&Delta;S = <a href=\"modelica://Modelica.Constants\">k</a>&middot;<a href=\"modelica://ModelicaReference.Operators.'log()'\">log</a>(&Omega;) </p></td>
<td><p>entropy </p></td>
</tr>
</table>
<h4><span style=\"color:#008000\">Notations</span></h4>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"0\"><tr>
<td><p>c<sub>gas</sub></p></td>
<td><p>gaseous molar concentration of the substance</p></td>
</tr>
<tr>
<td><p>c<sub>liquid</sub></p></td>
<td><p>liquid molar concentration of the substance</p></td>
</tr>
<tr>
<td><p>K<sub>H</sub></p></td>
<td><p>Henry&apos;s coeficient at current temperature T</p></td>
</tr>
<tr>
<td><p>k<sub>d</sub></p></td>
<td><p>dissolution rate coefficient in liquid at current temperature T</p></td>
</tr>
<tr>
<td><p>k<sub>v</sub></p></td>
<td><p>volatility rate coefficient at current temperature T</p></td>
</tr>
<tr>
<td><p>A &nbsp;</p></td>
<td><p>surface area between gas and liquid</p></td>
</tr>
<tr>
<td><p>&Delta;H</p></td>
<td><p>enthalpy of dissolution</p></td>
</tr>
<tr>
<td><p>T<sub>heatPort</sub></p></td>
<td><p>current temperature T</p></td>
</tr>
<tr>
<td><p>K<sub>H0</sub></p></td>
<td><p>tabulated Henry&apos;s constant at base temperature T<sub>K</sub></p></td>
</tr>
<tr>
<td><p>T<sub>K</sub></p></td>
<td><p>base temperature of tabulated coeficients</p></td>
</tr>
<tr>
<td><p>&Omega;</p></td>
<td><p>change of number of ways of arranging molecules</p></td>
</tr>
<tr>
<td><p>&Delta;S</p></td>
<td><p>entropy of the dissolution</p></td>
</tr>
<tr>
<td><p>&Delta;<sub>s</sub>G<sup>0</sup></p></td>
<td><p>Gibb&apos;s energy of the dissolution</p></td>
</tr>
<tr>
<td></td>
<td></td>
</tr>
</table>
<p>Henry&apos;s coefficient <b>k<sub>H</sub></b> depends on temperature and on the identities of all substances present in solution.</p>
<p>Water fraction (W_solution, plasma 0.94, RBC 0.65 =&GT; blood 0.81 ml/ml) in solution can change the solubility of gases in water [1] as c_pure=c_solution/W_solution. </p>
<h4><span style=\"color:#008000\">References</span></h4>
<p>[1] Dash RK, Bassingthwaighte JB. Erratum to: Blood HbO2 and HbCO2 dissociation curves at varied O2, CO2, pH, 2, 3-DPG and temperature levels. Ann Biomed Eng 2010;38:1683-701. </p>
</html>"));
    end GasSolubility;

    model Diffusion "Solute diffusion"
      extends Icons.Diffusion;
      extends Chemical.Interfaces.OnePort;

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

       annotation (                 Documentation(revisions="<html>
<p><i>2009-2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>",     info="<html>
<p><a name=\"firstHeading\">The diffusion conductance parameter can be estimated using the Fick&apos;s laws of diffusion: </a></p>
<p>J= -D*(dPhi)/dx</p>
<p>where</p>
<p>J is molar flow of solute per area [mol/(m2.s)]. </p>
<p>D is diffusion constant [m2/s]. </p>
<p>dPhi is concentration gradient [mol/m3].</p>
<p>dx is length of diffusion [m].</p>
<p><br>The solution on both sides must have the same properties (for example solubilities, chemical activities, osmolarities,...)!</p>
</html>"));
    end Diffusion;

    model Membrane
      "Donnan's equilibrium of electrolytes usable for glomerular membrane, open/leak membrane channels, pores, ..."
      extends Icons.Membrane;
      extends Chemical.Interfaces.ConditionalHeatPort;

      parameter Integer NumberOfParticles = 1
        "Number of penetrating particle types";
      parameter Integer Charges[NumberOfParticles] = zeros(NumberOfParticles)
        "Elementary charges of particles";
      parameter Types.DiffusionPermeability Permeabilities[NumberOfParticles] = zeros(NumberOfParticles)
        "Permeabilities of particles through membrane chanel";

      parameter Boolean usePermeabilityInput = false
        "=true, if external permeability value is used"
        annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

      Interfaces.ChemicalPort_a particlesInside[NumberOfParticles]
        "inner side of membrane, solution"
        annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
      Interfaces.ChemicalPort_b particlesOutside[NumberOfParticles]
        "outer side of membrane, solution"
        annotation (Placement(transformation(extent={{90,-10},{110,10}})));

      Types.RealIO.DiffusionPermeabilityInput permeability[NumberOfParticles] = p if usePermeabilityInput
        annotation (Placement(transformation(extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,100})));

      Types.GasSolubility kH[NumberOfParticles]
        "Concentration ratio at equilibrium";

      parameter Types.GasSolubility kH_T0[NumberOfParticles] = ones( NumberOfParticles)
        "Equilibrated concentration ratio at temperature T0 - can be estimated by Henry's law coefficient ratios (kH1/kH2)"
         annotation ( HideResult=true,Dialog(tab="Different solubilities"));
      parameter Types.Temperature T0=298.15 "Base temperature for kH_T0"
         annotation (HideResult=true,Dialog(tab="Temperature dependence"));
      parameter Types.Temperature C[NumberOfParticles](displayUnit="K") = zeros(NumberOfParticles)
        "Specific constant difference (C1-C2) for Van't Hoff's change of kH"
        annotation (HideResult=true,Dialog(tab="Temperature dependence"));

      parameter Types.Fraction solventFractionInside=1
        "Free solvent fraction inside (i.e. water fraction in plasma=0.94, in cells=0.65, in blood=0.81)";
      parameter Types.Fraction solventFractionOutside=1
        "Free solvent fraction outside (i.e. water fraction in plasma=0.94, in cells=0.65, in blood=0.81)";

    protected
       Real KAdjustment
        "=(Cations-AnionLessProteins)/(Cations+AnionLessProteins)";
       Types.DiffusionPermeability p[NumberOfParticles];

    equation
      if not usePermeabilityInput then
        p=Permeabilities;
      end if;

       //no accumulation of particles:
       particlesInside.q + particlesOutside.q = zeros(NumberOfParticles); //nothing lost inside

       //electroneutrality:
       if abs(Charges.*Charges*p)<=Modelica.Constants.eps then
         KAdjustment=0; //no penetrating electrolytes => KAdjustment and electroneutrality of flux is not needed
       else
         Charges*particlesInside.q = 0; //electroneutrality of flux through membrane
       end if;

       //diffusion, penetration, particle movement:
       for i in 1:NumberOfParticles loop
         if Charges[i]==0 then //normal diffusion
           particlesInside[i].q = p[i] * (particlesInside[i].conc/solventFractionInside - kH[i]*particlesOutside[i].conc/solventFractionOutside);
         elseif Charges[i]>0 then //cation goes to Donnan's equilibrium
           particlesInside[i].q = p[i] * (particlesInside[i].conc/solventFractionInside - (1+KAdjustment)*kH[i]*particlesOutside[i].conc/solventFractionOutside);
         else //anion goes to Donnan's equilibrium
           particlesInside[i].q = p[i] * (particlesInside[i].conc/solventFractionInside - (1-KAdjustment)*kH[i]*particlesOutside[i].conc/solventFractionOutside);
         end if;
       end for;

       //different solubilities:
       kH = kH_T0 .* Modelica.Math.exp(C * (1/T_heatPort - 1/T0));
       lossHeat = Modelica.Constants.R* C*particlesOutside.q; //negative = heat are comsumed when change from liquid to gas

      annotation ( Documentation(info="<html>
<p><u><b><font style=\"color: #008000; \">Filtration throught semipermeable membrane.</font></b></u></p>
<p>The penetrating particles are driven by electric and chemical gradient to reach Donnan&apos;s equilibrium. The permeabilities of particles are used only in dynamic simulation with non-zero fluxes. If zero-flow Donnan&apos;s equilibrium is reached, it is independent on the permeabilities. </p>
<p>This class can be used for glomerular membrane, open(leak) channels (pores) of cellular (or any lipid bilayer) membrane, chloride schift, ...</p>
<p><br>The membrane permeabilities depends on <code>(D/membrameThicknes)*membraneArea</code>, where D is Fick&apos;s diffusion coefficient.<code> </code></p>
<p>................................</p>
<h4><span style=\"color:#008000\">Filtration example of tree particles</span></h4>
<p>ALP .. small penetrating anion</p>
<p>P .. nonpenetrating protein with negative charge</p>
<p>C .. small penetrating cation</p>
<p>In outer side of membrane are not protein P (it leaves inside). </p>
<p>In equilibrium 4 concentration are unknown:</p>
<p>ALP_in, ALP_out, C_in, C_out.</p>
<p>Closed system equilibrium equations:</p>
<p>tALP = ALP_in + ALP_out ... total amount of ALP </p>
<p>tC = C_in + C_out ... total amount of C</p>
<p>P + ALP_in = C_in ... electroneutrality inside</p>
<p>ALP_out = C_out ... electroneutrality outside</p>
<p>----------------------------------------------------</p>
<p>It is possible to write these equations also in form of KAdjustment, which connect also more than tree type of particles with Donnan&apos;s equilibrium equations:</p>
<p>ALP_in/ALP_out = (1-KAdjustment) </p>
<p>C_in/C_out = (1+KAdjustment) </p>
<p>where KAdjustment = P/(2*C_in-P) and C_out=ALP_out=(2*C_in-P)/2, because ALP_in/ALP_out = (C_in - P)/C_out = (2C_in-2P)/(2C_in-P) = 1 - P/(2C_in-P) = 1-KAdjustment and C_in/C_out = (2C_in)/(2C_in-P) = 1 + P/(2C_in-P) = 1+KAdjustment .</p>
<p><br><h4><span style=\"color:#008000\">Problem with different solubilities/Henry constants/ (kH1, kH2)</span></h4></p>
<p>Equilibrated is chemical potential, not concentrations (c1,c2)!</p>
<p>Equality of chemical potential is approximated by equality of partial pressure (p1,p2): </p>
<p>p1=kH1*c1 </p>
<p>p2=kH2*c2</p>
<p><br>c2 = (kH1/kH2) * c1</p>
<p>Henry constant between both side can be defined as<b> kH_T0 = kH1/kH2</b> at temperature T0, where kH1 is Henry constant in first side of membrane and kH2 is Henry constant in second side of membrane.</p>
<h4><span style=\"color:#008000\">Temperature dependence of Henry constants by Van't Hoff</span></h4>
<p><code>kH1&nbsp;=&nbsp;kH1_T0&nbsp;*<font style=\"color: #ff0000; \">&nbsp;Modelica.Math.exp</font>(C1*&nbsp;(1/T&nbsp;-&nbsp;1/T0))</code></p>
<p><code>kH2&nbsp;=&nbsp;kH2_T0&nbsp;*<font style=\"color: #ff0000; \">&nbsp;Modelica.Math.exp</font>(C2*&nbsp;(1/T&nbsp;-&nbsp;1/T0))</code></p>
<p>kH1/kH2 = <code>kH_T0&nbsp;*<font style=\"color: #ff0000; \">&nbsp;Modelica.Math.exp</font>(C *&nbsp;(1/T&nbsp;-&nbsp;1/T0))</code></p>
<p>Specific&nbsp;constant&nbsp;for&nbsp;Van&apos;t&nbsp;Hoff&apos;s&nbsp;change&nbsp;of&nbsp;kH_T0 can be defined as<b> C = C1-C2</b>, where C1 is specific constant in first side of membrane and C2 is specific constant in second side of membrane.</p>
</html>"));
    end Membrane;

    model Speciation
      "Chemical species definition by independent binding sides of macromolecule"
      extends Icons.Speciation;

      extends SteadyStates.Interfaces.SteadyStateSystem(
                                               Simulation=Types.SimulationType.SteadyState, NumberOfDependentStates=NumberOfSubunits-1);
      extends Chemical.Interfaces.ConditionalVolume;

      parameter Integer NumberOfSubunits=1
        "Number of independent subunits occuring in molecule";

      Chemical.Interfaces.ChemicalPort_a specificForm
        "Specific form composed with subunits form of subunitSpiecies"                                                        annotation (Placement(
            transformation(extent={{90,-90},{110,-70}})));
      Chemical.Interfaces.ChemicalPort_a specificSubunitForm[NumberOfSubunits]
        "Specific form of subunits of specific molecule form in connector called spieces"
                                                                                                            annotation (Placement(
            transformation(extent={{-10,90},{10,110}})));
    protected
      Real fractions[NumberOfSubunits];
    public
      Types.RealIO.AmountOfSubstanceInput amountOfSubunit[NumberOfSubunits]
        "Total amount of the subunits in all forms"
        annotation (Placement(transformation(extent={{-20,-20},{20,20}},
            rotation=180,
            origin={80,0})));
      Types.RealIO.AmountOfSubstanceOutput amount
        "Total amount of macromolecules in this system"
       annotation (Placement(
            transformation(extent={{-10,-10},{10,10}},
            rotation=270,
            origin={0,-80})));                                                             //(start=1e-8)
      Types.RealIO.EnergyOutput internalHeat
        "Relative internal heat of all chemical forms in this system"                                                                annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-60,-80}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-60,-80})));

    //system internal heat
      parameter Boolean useInternalHeatsInput = false
        "=true, if subunitInternalHeat inputs are used instead of parameter SubunitEnthalpies"
      annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs",tab="Heat"));

      parameter Types.MolarEnergy SubunitEnthalpies[NumberOfSubunits]=zeros(NumberOfSubunits)
        "Enthalpy changes of substances (can relative to one choosen specific form of chemical substance in the system) if useEnthalpiesInput=false"
        annotation (HideResult=not useInternalHeatsInput, Dialog(enable=not useInternalHeatsInput,tab="Heat"));

      Types.RealIO.EnergyInput subunitInternalHeat[NumberOfSubunits](each start=0)=internalHeatOfSubunit if useInternalHeatsInput
      annotation (Dialog(enable=false),
         Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=180,
            origin={80,60}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=180,
            origin={80,60})));

       Types.Energy internalHeatOfSubunit[NumberOfSubunits]
        "Internal heat of subunits";
    equation

      amount = amountOfSubunit[1];

      fractions = if (amount < Modelica.Constants.eps) then zeros(NumberOfSubunits)
                  else specificSubunitForm.conc ./ (amountOfSubunit/volume);

      specificForm.conc = (amount/volume)*product(fractions); //chemical speciation

      for i in 2:NumberOfSubunits loop
                 normalizedState[i-1]*amount = amountOfSubunit[i];
      end for;

    //molar flow:
      specificSubunitForm.q = -specificForm.q * ones(NumberOfSubunits);

    //heat:
       if not useInternalHeatsInput then
        internalHeatOfSubunit = SubunitEnthalpies.*amountOfSubunit;
      end if;
      internalHeat=sum(internalHeatOfSubunit);

      annotation (defaultComponentName="macromoleculeSpecie_in_macromoleculeGroup",
        Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>",     info="<html>
<p>This block identifies one specific chemical form of one macromolecule defined by forms of its subunits  (one chosen chemical species - called <i>specie</i>).</p>
<p>Only main connector called <b>species </b>is designed for inflow and outflow of macromolecule to/from <i>system</i>. The concentration in this connector is the concentration of its specific <i>specie.</i></p>
<p>Connectors <b>subunitSpecies[:] </b>represent specific forms of the macromolecule subunit types. If the subnunit type occures n-times in macromolecule, the inflow is n-time greater than the inflow of macromolecule.</p>
<p><br>Initial total concentrations of subunits must be set to be right distribution of total macromolecule concentration. So the ratios between subunit concentrations are the ratios of their occurence in macromolecule. In equilibrium are this proporties fullfiled.</p>
<p><br>For example: If the macromolecule has four identical independent subunits and each subunit can occur in two form F1 and F2, then the concentration of macromolecule <i>specie </i>composed only from four subunits in form F1 is <b>species.conc=</b>conc*fF1^4. </p>
<p>Where:</p>
<p>conc is totat concentration of macromolecule in <i>system</i> accumulated by <b>species.q</b>,</p>
<p>fF1 = F1/(F1+F2) is fraction of form F1 in subsystem of subunit,</p>
<p>4 is number of subunits (<b>numberOfSubunit</b>).</p>
<p><br>This block can be connected to chemical reactions such as it was the chosen species with subsystem behind. It is recommended to use this block only as an equilibrated subsystem.</p>
<h4><span style=\"color:#008000\">Heat of chemical system.</span></h4>
<p>Enthalpy of each subunit species can be presented as <b>subunitEnthalpies[:]</b>. Then the total enthalpy of the chemical system can be calculated by equation:</p>
<h4>systemEnthalpy = sum(subunitEnthalpies[i] * totalSubunitAmount[i]) / totalSubsystemAmount</h4>
<p>And the stored heat as enthalpy is <b>systemEnthalpy*totalSubsystemAmount.</b></p>
</html>"));
    end Speciation;

    model Degradation "Degradation of solute"
      extends Interfaces.ConditionalVolume;

      Chemical.Interfaces.ChemicalPort_a
                                q_in "Degraded solute outflow"
                                annotation (Placement(
            transformation(extent={{-110,-10},{-90,10}})));

      parameter Types.Time HalfTime
        "Degradation half time. The time after which will remain half of initial concentration in the defined volume when no other generation nor clearence nor degradation exist.";

    protected
      Types.VolumeFlowRate Clearance;
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
</html>"));
    end Degradation;

    model Clearance "Clearance with or without solvent outflow"

      parameter Types.VolumeFlowRate Clearance=0
        "Clearance of solute if useSolutionFlowInput=false"
        annotation (Dialog(enable=not useSolutionFlowInput));

      parameter Real K(unit="1")=1
        "Coefficient such that Clearance = K*solutionFlow";

      extends Chemical.Interfaces.ConditionalSolutionFlow(SolutionFlow=Clearance/K);

      Chemical.Interfaces.ChemicalPort_a
                                q_in "solute outflow"
                                annotation (Placement(
            transformation(extent={{-110,-10},{-90,10}})));

      Types.VolumeFlowRate clearance;
    equation

      clearance = q*K;

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
              textString="K=%K")}),        Documentation(revisions="<html>
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
</html>"));
    end Clearance;

    model Stream "Flow of whole solution"
      extends Chemical.Interfaces.OnePort;
      extends Chemical.Interfaces.ConditionalSolutionFlow;

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
              rotation=360),
            Polygon(
              points={{-80,25},{80,0},{-80,-25},{-80,25}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              rotation=360),
            Text(
              extent={{-150,-20},{150,20}},
              textString="%name",
              lineColor={0,0,255},
              origin={2,-74},
              rotation=180)}),
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
      extends Chemical.Interfaces.OnePort;
      extends Chemical.Interfaces.ConditionalSoluteFlow;

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
              rotation=360),
            Polygon(
              points={{-80,25},{80,0},{-80,-25},{-80,25}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid,
              rotation=360),
            Text(
              extent={{-150,-20},{150,20}},
              lineColor={0,0,255},
              origin={-10,-76},
              rotation=360,
              textString="%name")}),        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end SolutePump;

    model Dilution "Adding/removing of the solvent to/from running solution"
      extends Chemical.Interfaces.OnePort;
      extends Icons.Dilution;

      parameter Boolean useDilutionInput = false
        "=true, if dilition input is used"
        annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

      parameter Types.Fraction Dilution=1
        "Concentration ratio after per before dilution (0..no solutes, 1..no dilution) if useDilutionInput=false"
        annotation (Dialog(enable=not useSolventFlow));

      Types.RealIO.FractionInput dilution(start=Dilution)= d if useDilutionInput
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
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end Dilution;

    model Reabsorption "Reabsorption as input fraction"
       extends Icons.Reabsorption;

      parameter Boolean useEffect = false
        "=true, if reabsorption fraction is BaseReabsorption^(1/Effect)"
      annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

      parameter Boolean useMaxReabInput = false
        "=true, if external maximum of reabsorption molar flow is used"
      annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

      parameter Boolean useBaseReabsorption = false
        "=false, if BaseReabsorption=1"
      annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

      parameter Types.MolarFlowRate MaxReabsorption = Modelica.Constants.inf
        "Maximal reabsorption molar flow if useMaxReabInput=false"
        annotation (Dialog(enable=not useMaxReabInput));

      Chemical.Interfaces.ChemicalPort_a
                                Inflow "Tubular inflow"              annotation (Placement(
            transformation(extent={{-110,30},{-90,50}})));
      Chemical.Interfaces.ChemicalPort_b
                                Outflow "Tubular outflow"
        annotation (Placement(transformation(extent={{90,30},{110,50}})));

      Chemical.Interfaces.ChemicalPort_b
                                Reabsorption "Reabsorption from tubules"          annotation (Placement(
            transformation(extent={{-10,-110},{10,-90}})));
      Types.RealIO.FractionInput baseReabsorption=baseReabFract if useBaseReabsorption
        "Base fraction of molar inflow for reabsorption flow"
                                   annotation (Placement(transformation(extent={{-20,-20},
                {20,20}},
            rotation=270,
            origin={40,100})));

      Types.RealIO.FractionInput Effect(displayUnit="1")=e if useEffect
        "Effects<1 decrease reabsorption, effects>1 increase reabsorption fraction by equation ReabFract=BaseReabsorption^(1/Effect)"
                                   annotation (Placement(transformation(extent={{-20,-20},
                {20,20}},
            rotation=270,
            origin={0,100})));
      Types.RealIO.MolarFlowRateInput               MaxReab=mr if useMaxReabInput
        "Maximal allowed reabsorption molar flow rate"
                                   annotation (Placement(transformation(extent={{-100,
                -80},{-60,-40}})));
      Types.RealIO.FractionOutput               ReabFract=reabFract if useEffect
        "Actual reabsorbed fraction from solute inflow rate"                                annotation (Placement(transformation(extent={{80,-100},
                {120,-60}})));

      Types.Fraction reabFract,baseReabFract,e;
      Types.MolarFlowRate mr;
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
              textString="%name")}),        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end Reabsorption;

  end Components;

  package Sensors
    extends Modelica.Icons.SensorsPackage;

    model MolarFlowMeasure "Measure of molar flow"
      extends Chemical.Interfaces.OnePort;
      extends Icons.MolarFlowMeasure;

     Types.RealIO.MolarFlowRateOutput molarFlowRate
                             annotation (Placement(transformation(extent={{-20,-20},
                {20,20}},
            rotation=270,
            origin={0,-60})));
    equation
      q_in.conc = q_out.conc;

      molarFlowRate = q_in.q;

     annotation (
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end MolarFlowMeasure;

    model ConcentrationMeasure "Measure of molar concentration"

      Chemical.Interfaces.ChemicalPort_a
                                q_in "For measure only"
                                annotation (Placement(
            transformation(extent={{-10,-30},{10,-10}})));
      Types.RealIO.ConcentrationOutput concentration "Concentration"
                             annotation (Placement(transformation(extent={{-20,-20},
                {20,20}},
            rotation=90,
            origin={0,40})));
    equation

      concentration =         q_in.conc;

      q_in.q = 0;
     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={    Rectangle(
              extent={{-20,20},{20,-20}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end ConcentrationMeasure;

    model IncrementalFlowConcentrationMeasure
      "Incremental flow concentration meassure in circulation after absorption/secretion source (i.e. portal vein concentration)"
      extends Chemical.Interfaces.ConditionalSolutionFlow;

     Types.RealIO.ConcentrationOutput concentration
        "Concentration after absorption source"                           annotation (Placement(transformation(extent={{-12,-86},
                {28,-46}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,-62})));

      Types.RealIO.MolarFlowRateInput addition annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={60,40})));
      Interfaces.ChemicalPort_a q_in
        annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
    equation
      concentration = q_in.conc + addition/q;
      q_in.q=0;

     annotation (
        Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,100}}),
                            graphics={Rectangle(
              extent={{-100,-50},{100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{-88,-50},{80,50}},
              textString="%name",
              lineColor={0,0,255})}),        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end IncrementalFlowConcentrationMeasure;
  end Sensors;

  package Sources
    extends Modelica.Icons.SourcesPackage;

    model UnlimitedSolutePump "Molar pump of solute to system"
      extends Chemical.Interfaces.ConditionalSoluteFlow;

      Chemical.Interfaces.ChemicalPort_b
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
              lineColor={0,0,255})}),        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end UnlimitedSolutePump;

    model UnlimitedSolutionStorage "Constant concentration source"

      Chemical.Interfaces.ChemicalPort_b
                                q_out
        "constant concentration with any possible flow"
                                 annotation (Placement(
            transformation(extent={{90,-10},{110,10}})));

      parameter Boolean useConcentrationInput = false
        "=true, if fixed concentration is from input instead of parameter"
      annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

       parameter Types.Concentration Conc = 0
        "Fixed concentration if useConcentrationInput=false"
        annotation (Dialog(enable=not useConcentrationInput));

      parameter Boolean isIsolatedInSteadyState = true
        "=true, if there is no flow at port in steady state"
        annotation (Evaluate=true, HideResult=true, Dialog(group="Simulation",tab="Equilibrium"));

      parameter Types.SimulationType  Simulation=Types.SimulationType.NormalInit
        "If in equilibrium, then zero-flow equation is added."
        annotation (Evaluate=true, HideResult=true, Dialog(group="Simulation",tab="Equilibrium"));

       Types.RealIO.ConcentrationInput concentration(start=Conc)=c if useConcentrationInput
        annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));

    protected
      Types.Concentration c "Current concentration";

    initial equation
      if isIsolatedInSteadyState and (Simulation==Types.SimulationType.InitSteadyState) then
        q_out.q = 0;
      end if;

    equation
       if not useConcentrationInput then
         c=Conc;
       end if;

      q_out.conc = c;

      if isIsolatedInSteadyState and (Simulation==Types.SimulationType.SteadyState) then
        q_out.q = 0;
      end if;

      annotation ( Icon(coordinateSystem(
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
      Chemical.Interfaces.ChemicalPort_b
                                q_out
        "constant gas concentration with any possible flow"
                                 annotation (Placement(
            transformation(extent={{90,-10},{110,10}})));

      parameter Boolean usePartialPressureInput = false
        "=true, if fixed partial pressure is from input instead of parameter"
      annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

       parameter Types.Pressure PartialPressure = 0
        "Fixed partial pressure if usePartialPressureInput=false"
        annotation (Dialog(enable=not usePartialPressureInput));

      Types.RealIO.PressureInput partialPressure(start=PartialPressure) = p if usePartialPressureInput
        "Partial pressure of Gas = air pressure * gas fraction"
        annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));

     parameter Boolean isIsolatedInSteadyState = true
        "=true, if there is no flow at port in steady state"
        annotation (Evaluate=true, HideResult=true, Dialog(group="Simulation",tab="Equilibrium"));

      parameter Types.SimulationType  Simulation=Types.SimulationType.NormalInit
        "If in equilibrium, then zero-flow equation is added."
        annotation (Evaluate=true, HideResult=true, Dialog(group="Simulation",tab="Equilibrium"));

    protected
      Types.Pressure p "Current partial pressure";

    initial equation
      if isIsolatedInSteadyState and (Simulation==Types.SimulationType.InitSteadyState) then
        q_out.q = 0;
      end if;

    equation
      if not usePartialPressureInput then
        p=PartialPressure;
      end if;

      q_out.conc = p / (Modelica.Constants.R * T_heatPort);  //ideal gas equation

      if isIsolatedInSteadyState and (Simulation==Types.SimulationType.SteadyState) then
         q_out.q = 0;
      end if;

      lossHeat=0; //only read temperature from heat port

      annotation ( Icon(coordinateSystem(
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

    model UnlimitedSolutePumpOut "Molar pump of solute out of system"
      extends Chemical.Interfaces.ConditionalSoluteFlow;

      Interfaces.ChemicalPort_a q_in "Inflow"
        annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));

    equation
      q_in.q = q;

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
              lineColor={0,0,255})}),        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end UnlimitedSolutePumpOut;
  end Sources;

  package Interfaces
    extends Modelica.Icons.InterfacesPackage;

    connector ChemicalPort "Concentration and Solute flow"
      Types.Concentration conc "Solute concentration";
      flow Types.MolarFlowRate q "Solute flow";
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
    end OnePort;

    partial model ConditionalHeatPort
      "Partial model to include a conditional HeatPort in order to describe the power loss via a thermal network"

      parameter Boolean useHeatPort = false "=true, if HeatPort is enabled"
      annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true), Dialog(group="External inputs/outputs"));
      parameter Types.Temperature T=310.15
        "Fixed device temperature if useHeatPort = false"
        annotation ( HideResult=true, Dialog(enable=not useHeatPort,tab="Temperature dependence"));

      Thermal.Interfaces.HeatPort_a       heatPort(T(start=T)=T_heatPort, Q_flow=-lossHeat) if useHeatPort
        annotation (Placement(transformation(extent={{-10,-10},{10,10}}),
            iconTransformation(extent={{-10,-10},{10,10}})));

      Types.Temperature T_heatPort "Temperature of HeatPort";
      Types.HeatFlowRate lossHeat "Loss heat leaving component via HeatPort";
    equation
      if not useHeatPort then
         T_heatPort = T;
      end if;

      annotation (        Documentation(revisions="<html>
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

    partial model ConditionalVolume
      "Chemical processes can be modeled with or without(normalized to 1 liter) variable solution volume"

      constant Types.Volume NormalVolume=0.001 "1 liter" annotation(Evaluate=true, HideResult=true);

      parameter Boolean useNormalizedVolume = true
        "Normalized volume of solution is 1 liter"
      annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

      Types.Volume volume "Solution volume" annotation(HideResult=useNormalizedVolume);

      Types.RealIO.VolumeInput solutionVolume=volume if not useNormalizedVolume
        "Volume of solution"                                                                         annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={-40,40})));
    equation
      if useNormalizedVolume then
        volume = NormalVolume;
      end if;

    end ConditionalVolume;

    partial model ConditionalSolutionFlow
      "Input of solution volumetric flow vs. parametric solution volumetric flow"

      parameter Boolean useSolutionFlowInput = false
        "=true, if solution flow input is used instead of parameter SolutionFlow"
      annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

      parameter Types.VolumeFlowRate SolutionFlow=0
        "Volumetric flow of solution if useSolutionFlowInput=false"
        annotation ( HideResult=not useSolutionFlowInput, Dialog(enable=not useSolutionFlowInput));

      Types.RealIO.VolumeFlowRateInput solutionFlow(start=SolutionFlow)=q if useSolutionFlowInput annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,40}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,70})));

      Types.VolumeFlowRate q "Current solution flow";
    equation
      if not useSolutionFlowInput then
        q = SolutionFlow;
      end if;

    end ConditionalSolutionFlow;

    partial model ConditionalSoluteFlow
      "Input of solute molar flow vs. parametric solute molar flow"

      parameter Boolean useSoluteFlowInput = false
        "=true, if solute flow input is used instead of parameter SoluteFlow"
      annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

      parameter Types.MolarFlowRate SoluteFlow=0
        "Volumetric flow of solute if useSoluteFlowInput=false"
        annotation (HideResult=not useSoluteFlowInput, Dialog(enable=not useSoluteFlowInput));

      Types.RealIO.MolarFlowRateInput soluteFlow(start=SoluteFlow)=q if   useSoluteFlowInput annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={40,40})));

      Types.MolarFlowRate q "Current solute flow";
    equation
      if not useSoluteFlowInput then
        q = SoluteFlow;
      end if;

    end ConditionalSoluteFlow;

    record SubstanceDefinition
      "Invariant properties of substance (molar weight, enthalpy, entropy, ...)"

     parameter String fullName=getInstanceName()
        "Full physiological name of substance";
     parameter String shortName=getInstanceName()
        "Short physiological name of substance";

     parameter Types.MolarMass mw "Molar weight in kg/mol or kDa";
     parameter Types.MolarEnergy dH=0 "Enthalpy";
     parameter Types.MolarEnergy dS=0 "Entropy";

     parameter Types.AmountOfSubstance molpIU=1
        "Pharmacological international unit conversion: mols per IU (or 1 if unknown)";
     parameter Types.AmountOfSubstance molpGU=1
        "Goldblatt unit conversion: mols per GU (or 1 if unknown)";

     parameter String storeUnit="mmol/l"
        "Default substance unit in files or databaseses";

     parameter Types.Utilities.UnitConversions.RealTypeRecord[:] unitConversions = cat(1,
        Types.Utilities.UnitConversions.GenerateSubstanceUnits("g",1e-3/mw),
        Types.Utilities.UnitConversions.GenerateSubstanceUnits("IU",molpIU),
        Types.Utilities.UnitConversions.GenerateSubstanceUnits("GU",molpGU));

    end SubstanceDefinition;
  end Interfaces;

  annotation (Documentation(revisions="<html>
<p>Licensed by Marek Matejak under the Modelica License 2</p>
<p>Copyright &copy; 2008-2014, Marek Matejak, Charles University in Prague.</p>
<p><br><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Physiolibrary.UsersGuide.ModelicaLicense2\">UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p>
</html>", info="<html>
<p>In physiology books, chapters about chemical substances are organized by their types. The main reason for this is that each substance in the human body is regulated in a different way. For example the regulation of sodium is different from the regulation of potassium, and from the regulation of glucose, and so on. This view leads to the idea of having separate models of each substance. The origin of different flows and regulations is the (cellular) membrane. Water and solutions can cross it in different directions at the same time. Crossings occur for different reasons: water is driven mostly by osmotic gradients, electrolytes are driven by charge to reach Donnan&apos;s equilibrium, and some solutes can even be actively transported against their concentration or electrical gradients. And all this is specifically driven from the higher levels by neural and hormonal responses.&nbsp; </p>
<p>In Physiolibrary flows and fluxes of solutes are supported mostly by the Chemical package. All parts inside this Chemical package use the connector ChemicalPort, which defines the molar concentration and molar flow/flux rate of one solute. This is the supporting infrastructure for modeling membrane diffusion, accumulations of substances, reversal chemical reactions, Henry&apos;s law of gas solubility, dilution with additional solvent flow, membrane reabsorption, chemical degradation and physiological clearance. </p>
</html>"));
end Chemical;

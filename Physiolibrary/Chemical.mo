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
      annotation ( Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),
        experiment(StopTime=1e-007));
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
      annotation ( Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),
        experiment(StopTime=1e-009));
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
      annotation ( Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),
        experiment(StopTime=5));
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
          annotation ( Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),
        experiment(StopTime=1));
    end MichaelisMenten;

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
        annotation (          experiment(StopTime=10000), Documentation(info=
                   "<html>
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
        "Monod,Wyman,Changeux (1965) - The same allosteric hemoglobin model as Allosteric_Hemoglobin_MWC implemented by Speciation blocks"
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
          annotation (Placement(transformation(extent={{68,-74},{48,-54}})));
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
            points={{16,-74},{32,-74},{32,-72},{48,-72}},
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
            points={{58,-54},{84,-54},{84,-26},{80,-26}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(add1.y, T0_in_T.totalSubunitAmount)
                                                 annotation (Line(
            points={{44,-58.4},{44,-64},{50,-64}},
            color={0,0,127},
            smooth=Smooth.Bezier));
        connect(R0_in_R.totalSubsystemAmount, totalHb.fragment[1]) annotation (Line(
            points={{-42,-74},{-42,-87},{70,-87}},
            color={0,0,127},
            smooth=Smooth.Bezier));
        connect(T0_in_T.totalSubsystemAmount, totalHb.fragment[2]) annotation (Line(
            points={{58,-72},{58,-72},{58,-85},{70,-85}},
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
                  -100},{100,100}}), graphics={Ellipse(
                extent={{2,-6},{100,-54}},
                fillColor={255,181,181},
                fillPattern=FillPattern.Solid,
                pattern=LinePattern.None), Ellipse(
                extent={{-104,-6},{-6,-54}},
                fillColor={255,181,181},
                fillPattern=FillPattern.Solid,
                pattern=LinePattern.None)}),
          experiment(StopTime=10000),
          Documentation(revisions=
                        "<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>", info="<html>
<p>To understand the model is necessary to study the principles of MWC allosteric transitions first published by </p>
<p>Monod,Wyman,Changeux (1965). &QUOT;On the nature of allosteric transitions: a plausible model.&QUOT; Journal of molecular biology 12(1): 88-118.</p>
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

      parameter Real[4] pKz;
      parameter Real[4]     pKc;
      parameter Real[4]         pKh;
      parameter Boolean isDependent=false;

      Physiolibrary.Chemical.Interfaces.ChemicalPort_a Hbtn
          annotation (Placement(transformation(extent={{-108,-10},{-88,10}})));
          Physiolibrary.Chemical.Components.Substance Hbu_A_NH3[4](each Simulation=
              Physiolibrary.Types.SimulationType.SteadyState, each solute_start=1e-06)
          annotation (Placement(transformation(extent={{-32,70},{-12,90}})));
      Physiolibrary.Chemical.Components.Substance Hbu_AH_NH3[4](each Simulation=
              Physiolibrary.Types.SimulationType.SteadyState, each solute_start=1e-06)
          annotation (Placement(transformation(extent={{54,70},{74,90}})));
      Physiolibrary.Chemical.Components.Substance Hbu_A_NH2[4](each Simulation=
              Physiolibrary.Types.SimulationType.SteadyState,
          isDependent={isDependent,true,true,true},
          each solute_start=1e-06)
          annotation (Placement(transformation(extent={{-32,-2},{-12,18}})));
      Physiolibrary.Chemical.Components.Substance Hbu_AH_NH2[4](each Simulation=
              Physiolibrary.Types.SimulationType.SteadyState, each solute_start=1e-06)
          annotation (Placement(transformation(extent={{54,-2},{74,18}})));
      Physiolibrary.Chemical.Components.Substance Hbu_A_NHCOO[4](each Simulation=
              Physiolibrary.Types.SimulationType.SteadyState, each solute_start=1e-06)
          annotation (Placement(transformation(extent={{-32,-84},{-12,-64}})));
      Physiolibrary.Chemical.Components.Substance Hbu_AH_NHCOO[4](each Simulation=
              Physiolibrary.Types.SimulationType.SteadyState, each solute_start=1e-06)
          annotation (Placement(transformation(extent={{54,-84},{74,-64}})));
      Physiolibrary.Chemical.Components.ChemicalReaction h2[4](
          each nS=1,
          each nP=2,
          K=fill(10, 4) .^ (-pKh .+ 3))
                annotation (Placement(transformation(extent={{32,-2},{12,18}})));
      Physiolibrary.Chemical.Components.ChemicalReaction z1[4](each nP=2, K=fill(10, 4)
               .^ (-pKz .+ 3))
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-22,44})));
      Physiolibrary.Chemical.Components.ChemicalReaction z2[4](each nP=2, K=fill(10, 4)
               .^ (-pKz .+ 3))
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={64,44})));
      Physiolibrary.Chemical.Components.ChemicalReaction c1[4](
          each nS=2,
          each nP=2,
          K=fill(10, 4) .^ (-pKc .+ 3))
                annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-22,-34})));
      Physiolibrary.Chemical.Components.ChemicalReaction c2[4](
          each nS=2,
          each nP=2,
          K=fill(10, 4) .^ (-pKc .+ 3))
                annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={64,-34})));
      Modelica.Blocks.Math.Sum total[4](each nin=6) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={-64,60})));
        Physiolibrary.Chemical.Interfaces.ChemicalPort_a H "hydrogen ions"
          annotation (Placement(transformation(extent={{90,76},{110,96}})));
        Physiolibrary.Chemical.Interfaces.ChemicalPort_a CO2
          annotation (Placement(transformation(extent={{90,-70},{110,-50}})));
        Physiolibrary.Chemical.Components.Speciation Hb_tn(Simulation=Physiolibrary.Types.SimulationType.SteadyState,
            NumberOfSubunitTypes=4)
          annotation (Placement(transformation(extent={{-54,-22},{-74,-2}})));
      Physiolibrary.Types.RealIO.AmountOfSubstanceOutput tHb_u annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={-100,-78})));
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
          points={{-22,70},{-44,70},{-44,61.6667},{-52,61.6667}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Hbu_AH_NH3.solute, total.u[2]) annotation (Line(
          points={{64,70},{-2,70},{-2,61},{-52,61}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Hbu_A_NH2.solute, total.u[3]) annotation (Line(
          points={{-22,-2},{-44,-2},{-44,60.3333},{-52,60.3333}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Hbu_AH_NH2.solute, total.u[4]) annotation (Line(
          points={{64,-2},{-2,-2},{-2,59.6667},{-52,59.6667}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Hbu_A_NHCOO.solute, total.u[5]) annotation (Line(
          points={{-22,-84},{-44,-84},{-44,59},{-52,59}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Hbu_AH_NHCOO.solute, total.u[6]) annotation (Line(
          points={{64,-84},{-2,-84},{-2,58.3333},{-52,58.3333}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(Hbu_A_NH2.q_out, h2.products[1]) annotation (Line(
          points={{-22,8},{-10,8},{-10,7.5},{12,7.5}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));

        connect(Hb_tn.species, Hbtn) annotation (Line(
            points={{-74,-20},{-86,-20},{-86,0},{-98,0}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(total.y, Hb_tn.totalSubunitAmount) annotation (Line(
            points={{-75,60},{-78,60},{-78,-12},{-72,-12}},
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
        connect(Hb_tn.subunitSpecies, Hbu_A_NH2.q_out) annotation (Line(
            points={{-64,-2},{-64,8},{-22,8}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(tHb_u, Hb_tn.totalSubsystemAmount) annotation (Line(
            points={{-100,-78},{-64,-78},{-64,-20}},
            color={0,0,127},
            smooth=Smooth.None));

      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}),     graphics));
      end Hemoglobin_MKM_Specie;

      model Hemoglobin_MKM_Adair "Matejak,Kulhanek,Matousek (2014)"
        extends Modelica.Icons.Example;

        constant Real pKzD=7.73,pKcD=7.54,pKhD=7.52;
        constant Real pKzO=7.25,pKcO=8.35,pKhO=6.89;

        Physiolibrary.Chemical.Components.ChemicalReaction K1(
          K=0.0121,
          nS=1,
          nP=2) annotation (Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=270,
              origin={-14,68})));
        Physiolibrary.Chemical.Components.ChemicalReaction K2(
          K=0.0117,
          nS=1,
          nP=2) annotation (Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=270,
              origin={-16,28})));
        Physiolibrary.Chemical.Components.ChemicalReaction K3(
          K=0.0871,
          nS=1,
          nP=2) annotation (Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=270,
              origin={-18,-18})));
        Physiolibrary.Chemical.Components.ChemicalReaction K4(
          K=0.000386,
          nS=1,
          nP=2) annotation (Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=270,
              origin={-20,-60})));
        Physiolibrary.Chemical.Examples.Hemoglobin.Hemoglobin_MKM_Specie Hb0(
          pKz=fill(pKzD, 4),
          pKc=fill(pKcD, 4),
          pKh=fill(pKhD, 4),
          isDependent=true)
          annotation (Placement(transformation(extent={{6,78},{26,98}})));
        Physiolibrary.Chemical.Examples.Hemoglobin.Hemoglobin_MKM_Specie Hb1(
          pKz=cat(  1,
                    fill(pKzD, 3),
                    fill(pKzO, 1)),
          pKc=cat(  1,
                    fill(pKcD, 3),
                    fill(pKcO, 1)),
          pKh=cat(  1,
                    fill(pKhD, 3),
                    fill(pKhO, 1)))
          annotation (Placement(transformation(extent={{6,40},{26,60}})));
        Physiolibrary.Chemical.Examples.Hemoglobin.Hemoglobin_MKM_Specie Hb2(
          pKz=cat(  1,
                    fill(pKzD, 2),
                    fill(pKzO, 2)),
          pKc=cat(  1,
                    fill(pKcD, 2),
                    fill(pKcO, 2)),
          pKh=cat(  1,
                    fill(pKhD, 2),
                    fill(pKhO, 2)))
          annotation (Placement(transformation(extent={{6,0},{26,20}})));
        Physiolibrary.Chemical.Examples.Hemoglobin.Hemoglobin_MKM_Specie Hb3(
          pKz=cat(  1,
                    fill(pKzD, 1),
                    fill(pKzO, 3)),
          pKc=cat(  1,
                    fill(pKcD, 1),
                    fill(pKcO, 3)),
          pKh=cat(  1,
                    fill(pKhD, 1),
                    fill(pKhO, 3)))
          annotation (Placement(transformation(extent={{6,-44},{26,-24}})));
        Physiolibrary.Chemical.Examples.Hemoglobin.Hemoglobin_MKM_Specie Hb4(
          pKz=fill(pKzO, 4),
          pKc=fill(pKcO, 4),
          pKh=fill(pKhO, 4))
          annotation (Placement(transformation(extent={{6,-88},{26,-68}})));
        Physiolibrary.Chemical.Sources.UnlimitedGasStorage CO2(
                            Simulation=Physiolibrary.Types.SimulationType.SteadyState,
          PartialPressure=5332.8954966,
          isIsolatedInSteadyState=false)
          annotation (Placement(transformation(extent={{94,28},{74,48}})));
        Physiolibrary.Chemical.Sources.UnlimitedSolutionStorage pH(Conc(displayUnit=
               "mol/l") = 10^(-7.4 + 3), Simulation=Physiolibrary.Types.SimulationType.SteadyState,
          isIsolatedInSteadyState=false)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={84,80})));
        Physiolibrary.SteadyStates.Components.MolarConservationLaw totalHemoglobin(
          n=5,
          Total(displayUnit="mol") = 1,
          Simulation=Physiolibrary.Types.SimulationType.SteadyState)
          annotation (Placement(transformation(extent={{74,-48},{94,-28}})));
        Modelica.Blocks.Math.Sum sO2(nin=4, k={4/4,3/4,2/4,1/4})
          annotation (Placement(transformation(extent={{74,-98},{94,-78}})));
        Physiolibrary.Chemical.Components.Substance oxygen_unbound(
                                                            Simulation=
              Physiolibrary.Types.SimulationType.SteadyState, solute_start=
              1e-09)
          annotation (Placement(transformation(extent={{-88,-28},{-68,-8}})));
        Modelica.Blocks.Sources.Clock clock(offset=1)
          annotation (Placement(transformation(extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-78,70})));
        Physiolibrary.Chemical.Sources.UnlimitedGasStorage oxygen_in_air(
          Simulation=Physiolibrary.Types.SimulationType.SteadyState,
          usePartialPressureInput=true,
          isIsolatedInSteadyState=false,
          T=310.15) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-78,34})));
        Physiolibrary.Chemical.Components.GasSolubility partialPressure1(
            kH_T0(displayUnit="(mmol/l)/kPa at 25degC") = 0.026029047188736, T=310.15)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={-78,6})));
      equation
        connect(oxygen_unbound.q_out, K2.products[1]) annotation (Line(
            points={{-78,-18},{-38,-18},{-38,42},{-16,42},{-16,38},{-16.5,38}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygen_unbound.q_out, K3.products[1]) annotation (Line(
            points={{-78,-18},{-38,-18},{-38,0},{-18.5,0},{-18.5,-8}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(K1.products[1], oxygen_unbound.q_out) annotation (Line(
            points={{-14.5,78},{-14.5,80},{-38,80},{-38,-18},{-78,-18}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygen_unbound.q_out, K4.products[1]) annotation (Line(
            points={{-78,-18},{-38,-18},{-38,-44},{-20.5,-44},{-20.5,-50}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));

        connect(CO2.q_out, Hb0.CO2) annotation (Line(
            points={{74,38},{34,38},{34,82},{26,82}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(Hb0.H, pH.q_out) annotation (Line(
            points={{26,96.6},{40,96.6},{40,80},{74,80}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(Hb1.H, Hb0.H) annotation (Line(
            points={{26,58.6},{40,58.6},{40,96.6},{26,96.6}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(Hb3.H, Hb0.H) annotation (Line(
            points={{26,-25.4},{40,-25.4},{40,96.6},{26,96.6}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(Hb4.H, Hb0.H) annotation (Line(
            points={{26,-69.4},{40,-69.4},{40,96.6},{26,96.6}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(Hb2.H, Hb0.H) annotation (Line(
            points={{26,18.6},{40,18.6},{40,96.6},{26,96.6}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(Hb1.CO2, Hb0.CO2) annotation (Line(
            points={{26,44},{34,44},{34,82},{26,82}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(Hb2.CO2, Hb0.CO2) annotation (Line(
            points={{26,4},{34,4},{34,82},{26,82}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(Hb3.CO2, Hb0.CO2) annotation (Line(
            points={{26,-40},{34,-40},{34,82},{26,82}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(Hb4.CO2, Hb0.CO2) annotation (Line(
            points={{26,-84},{34,-84},{34,82},{26,82}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(Hb0.Hbtn, K1.products[2]) annotation (Line(
            points={{6.2,88},{-13.5,88},{-13.5,78}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(Hb1.Hbtn, K1.substrates[1]) annotation (Line(
            points={{6.2,50},{-14,50},{-14,58}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(Hb1.Hbtn, K2.products[2]) annotation (Line(
            points={{6.2,50},{-14,50},{-14,38},{-15.5,38}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(Hb2.Hbtn, K2.substrates[1]) annotation (Line(
            points={{6.2,10},{-16,10},{-16,18}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(Hb2.Hbtn, K3.products[2]) annotation (Line(
            points={{6.2,10},{-16,10},{-16,-8},{-17.5,-8}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(Hb3.Hbtn, K3.substrates[1]) annotation (Line(
            points={{6.2,-34},{-18,-34},{-18,-28}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(Hb3.Hbtn, K4.products[2]) annotation (Line(
            points={{6.2,-34},{-18,-34},{-18,-50},{-19.5,-50}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(Hb4.Hbtn, K4.substrates[1]) annotation (Line(
            points={{6.2,-78},{-20,-78},{-20,-70}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(Hb4.tHb_u, totalHemoglobin.fragment[1]) annotation (Line(
            points={{6,-85.8},{-4,-85.8},{-4,-96},{60,-96},{60,-43.6},{74,-43.6}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(Hb3.tHb_u, totalHemoglobin.fragment[2]) annotation (Line(
            points={{6,-41.8},{-4,-41.8},{-4,-48},{58,-48},{58,-42.8},{74,-42.8}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(Hb2.tHb_u, totalHemoglobin.fragment[3]) annotation (Line(
            points={{6,2.2},{2,2.2},{2,2},{-2,2},{-2,-4},{56,-4},{56,-42},{74,-42}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(Hb1.tHb_u, totalHemoglobin.fragment[4]) annotation (Line(
            points={{6,42.2},{2,42.2},{2,34},{54,34},{54,-41.2},{74,-41.2}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(Hb0.tHb_u, totalHemoglobin.fragment[5]) annotation (Line(
            points={{6,80.2},{4,80.2},{4,80},{2,80},{2,74},{56,74},{56,-40.4},{74,
                -40.4}},
            color={0,0,127},
            smooth=Smooth.None));

        connect(Hb1.tHb_u, sO2.u[4]) annotation (Line(
            points={{6,42.2},{2,42.2},{2,34},{54,34},{54,-86.5},{72,-86.5}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(Hb2.tHb_u, sO2.u[3]) annotation (Line(
            points={{6,2.2},{2,2.2},{2,2},{-2,2},{-2,-4},{56,-4},{56,-87.5},{72,
                -87.5}},
            color={0,0,127},
            smooth=Smooth.None));

        connect(Hb3.tHb_u, sO2.u[2]) annotation (Line(
            points={{6,-41.8},{-4,-41.8},{-4,-48},{58,-48},{58,-88.5},{72,-88.5}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(Hb4.tHb_u, sO2.u[1]) annotation (Line(
            points={{6,-85.8},{2,-85.8},{2,-86},{-4,-86},{-4,-96},{60,-96},{60,
                -89.5},{72,-89.5}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(partialPressure1.q_out,oxygen_in_air. q_out)
                                                  annotation (Line(
            points={{-78,16},{-78,24}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(partialPressure1.q_in,oxygen_unbound. q_out) annotation (Line(
            points={{-78,-2},{-78,-18}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(clock.y,oxygen_in_air. partialPressure) annotation (Line(
            points={{-78,59},{-78,44}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics),
          experiment(
            StopTime=15000,
            Tolerance=1e-014,
            __Dymola_Algorithm="Euler"),
          __Dymola_experimentSetupOutput,
          Documentation(info="<html>
<p>Before Dymola silumation please set environment variable &QUOT;<code><b>Advanced.Define.NonLinearIterations&nbsp;=&nbsp;2&QUOT;</b></code> and chose &QUOT;Euler&QUOT; method!</p>
</html>"));
      end Hemoglobin_MKM_Adair;
    end Hemoglobin;

    package AcidBase
      model WaterSelfIonization
        "2 H2O  <->  OH-   +   H3O+ (It is better to solve this model using Euler solver, because there is only time dependence/no integration needed/)"
          extends Modelica.Icons.Example;
        Components.Substance H3O(
          q_out(conc(nominal=10^(-7 + 3))),
          Simulation=Physiolibrary.Types.SimulationType.SteadyState,
          solute_start=10^(-7 + 3))
                            annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={-8,12})));
        SteadyStates.Components.ElementaryChargeConservationLaw electroneutrality(
          Simulation=Physiolibrary.Types.SimulationType.SteadyState,
          NumberOfParticles=2,
          Total=0,
          Charges={1,-1},
          useTotalInput=true) "strong ion difference of solution"
          annotation (Placement(transformation(extent={{46,-94},{66,-74}})));
        Components.Substance OH(
          q_out(conc(nominal=10^(-7.4 + 3))),
          Simulation=Physiolibrary.Types.SimulationType.SteadyState,
          solute_start=10^(-7 + 3),
          isDependent=true)         annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={-8,-32})));
        Components.Substance H2O(
          q_out(conc(nominal=5.55e+4)),
          Simulation=Physiolibrary.Types.SimulationType.SteadyState,
          solute_start(displayUnit="mol") = 1/0.018,
          isDependent=true) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={-82,-12})));
        Components.ChemicalReaction waterDissociation(nP=2,
          s={2},
          K=(1e-8)*((18e-6)^2))
          annotation (Placement(transformation(extent={{-56,-22},{-36,-2}})));
        SteadyStates.Components.MolarConservationLaw tH2O(
          Simulation=Physiolibrary.Types.SimulationType.SteadyState,
          n=3,
          Total(displayUnit="mol") = 1/0.018) "total water concentration"
          annotation (Placement(transformation(extent={{-48,-74},{-28,-54}})));
        Modelica.Blocks.Sources.Clock SID(offset=-1e-6)
          "strong ions difference with respect to albumin charge shift"
          annotation (Placement(transformation(extent={{52,74},{72,94}})));
        Modelica.Blocks.Math.Gain toColoumn(k=-Modelica.Constants.F)
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
            points={{-48,-69.3333},{-82,-69.3333},{-82,-22}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(OH.solute, tH2O.fragment[2]) annotation (Line(
            points={{-8,-42},{-8,-50},{-76,-50},{-76,-68},{-48,-68}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(H3O.solute, tH2O.fragment[3]) annotation (Line(
            points={{-8,2},{-8,-6},{8,-6},{8,-52},{-72,-52},{-72,-66.6667},{-48,
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
            points={{-8,2},{-8,-6},{8,-6},{8,-89},{46,-89}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(OH.solute, electroneutrality.fragment[2]) annotation (Line(
            points={{-8,-42},{-8,-87},{46,-87}},
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
</html>"),experiment(StopTime=2e-006, __Dymola_Algorithm="Euler"),
          Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                  100}}), graphics),
          __Dymola_experimentSetupOutput);
      end WaterSelfIonization;

      model CarbonDioxideInWater "CO2 as alone acid-base buffer"
          extends Modelica.Icons.Example;
        Components.Substance HCO3(                  Simulation=Physiolibrary.Types.SimulationType.SteadyState)
          annotation (Placement(transformation(extent={{-18,46},{2,66}})));
        Components.ChemicalReaction HendersonHasselbalch(
          nP=2,
          dH=15.13,
          K=10^(-6.103 + 3),
          nS=1)
          annotation (Placement(transformation(extent={{-58,22},{-38,42}})));
        Sources.UnlimitedGasStorage CO2_gas(
            Simulation=Physiolibrary.Types.SimulationType.SteadyState,
            PartialPressure=5332.8954966)
          annotation (Placement(transformation(extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-80,82})));
        Components.Substance H3O(
          q_out(conc(nominal=10^(-7.4 + 3))),
          Simulation=Physiolibrary.Types.SimulationType.SteadyState,
          solute_start=10^(-7 + 3)) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={-8,12})));
        Components.GasSolubility gasSolubility(C=2400, kH_T0(displayUnit="(mmol/l)/kPa at 25degC")=
               0.81805576878885)
          annotation (Placement(transformation(extent={{-90,46},{-70,66}})));
        Components.Substance CO2_liquid(Simulation=Physiolibrary.Types.SimulationType.SteadyState,
            isDependent=true)
          annotation (Placement(transformation(extent={{-90,22},{-70,42}})));
        SteadyStates.Components.ElementaryChargeConservationLaw electroneutrality(
          Simulation=Physiolibrary.Types.SimulationType.SteadyState,
          useTotalInput=true,
          NumberOfParticles=3,
          Charges={-1,-2,1},
          Total=2894.560197) "strong ion difference of solution"
          annotation (Placement(transformation(extent={{46,-94},{66,-74}})));
        Components.Substance CO3(
          Simulation=Physiolibrary.Types.SimulationType.SteadyState,
          isDependent=true,
          solute_start=1e-08)
          annotation (Placement(transformation(extent={{54,46},{74,66}})));
        Components.ChemicalReaction c2(
          nP=2,
          dH=15.13,
          K=10^(-10.33 + 3),
          nS=1)
          annotation (Placement(transformation(extent={{16,46},{36,66}})));
        Modelica.Blocks.Math.Gain toColoumn(k=-Modelica.Constants.F)
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
            points={{-8,46},{-8,38},{16,38},{16,-89.3333},{46,-89.3333}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(CO3.solute, electroneutrality.fragment[2]) annotation (Line(
            points={{64,46},{64,38},{18,38},{18,-88},{46,-88}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(H3O.solute, electroneutrality.fragment[3]) annotation (Line(
            points={{-8,2},{-8,-6},{22,-6},{22,-86.6667},{46,-86.6667}},
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
</html>",      revisions="<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),experiment(StopTime=0.02, __Dymola_Algorithm="Euler"),
          Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}),
                          graphics),
          __Dymola_experimentSetupOutput);
      end CarbonDioxideInWater;

      model AlbuminTitration "Figge-Fencl model (22. Dec. 2007)"
        extends Modelica.Icons.Example;

        Components.Substance H3O(
          q_out(conc(nominal=10^(-7.4 + 3))),
          Simulation=Physiolibrary.Types.SimulationType.SteadyState,
          solute_start=10^(-7.4 + 3),
          isDependent=true) "hydrogen ions activity" annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={14,22})));

        Physiolibrary.SteadyStates.Components.MolarConservationLaw
          molarConservationLaw[n](
          each n=2,
          each Simulation=Physiolibrary.Types.SimulationType.SteadyState,
          each Total=0.00066)
          annotation (Placement(transformation(extent={{44,-6},{64,14}})));
        SteadyStates.Components.ElementaryChargeConservationLaw electroneutrality(
          Simulation=Physiolibrary.Types.SimulationType.SteadyState,
          NumberOfParticles=n,
          Charges=ones(n),
          useTotalInput=true,
          Total=6425.92363734) "strong ion difference of solution"
          annotation (Placement(transformation(extent={{46,-94},{66,-74}})));
        Modelica.Blocks.Math.Gain toColoumn(k=-Modelica.Constants.F)
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

        Physiolibrary.Chemical.Components.Substance A[n](
          each Simulation=Physiolibrary.Types.SimulationType.SteadyState,
          isDependent=true,
          each solute_start=0.00033) "deprotonated acid groups"
          annotation (Placement(transformation(extent={{4,-16},{24,4}})));
        Physiolibrary.Chemical.Components.ChemicalReaction react[n](
          each nP=2,
          K=fill(10.0, n) .^ (-pKAs .+ 3))
          annotation (Placement(transformation(extent={{-44,-2},{-24,18}})));

        Physiolibrary.Chemical.Components.Substance HA[n](
          each Simulation=Physiolibrary.Types.SimulationType.SteadyState, each
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
            points={{14,-16},{14,-20},{36,-20},{36,-1},{44,-1}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(HA.solute, molarConservationLaw.fragment[2]) annotation (Line(
            points={{-66,-2},{-66,-8},{-78,-8},{-78,36},{36,36},{36,0},{44,0},{44,
                1}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(SID.y,toColoumn. u) annotation (Line(
            points={{75,86},{100,86},{100,-74},{92,-74}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(HA.solute, electroneutrality.fragment) annotation (Line(
            points={{-66,-2},{-66,-88},{46,-88}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(toColoumn.y, electroneutrality.total) annotation (Line(
            points={{69,-74},{56,-74},{56,-76}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (                                      Diagram(coordinateSystem(
                preserveAspectRatio=false, extent={{-100,-100},{100,100}},
          experiment(StopTime=4)), graphics), Documentation(revisions="<html>
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
            __Dymola_Algorithm="Euler"),
          __Dymola_experimentSetupOutput);
      end AlbuminTitration;

      model Phosphate
          extends Modelica.Icons.Example;

        parameter Physiolibrary.Types.Pressure pCO2=5332.8954966
          "Partial pressure of CO2";
        parameter Physiolibrary.Types.Concentration totalPO4=0.00115
          "Total phosphate concentration";
        parameter Physiolibrary.Types.Concentration totalAlb=0.00066
          "Total albumin concentration";

        parameter Integer n=218 "Number of weak acid group in albumin molecule";

        Modelica.Blocks.Math.Log10 minusPh "value of minus pH"
          annotation (Placement(transformation(extent={{64,-20},{84,0}})));

        Modelica.Blocks.Sources.Clock SID(offset=0)
          "strong ions difference with respect to albumin charge shift"
          annotation (Placement(transformation(extent={{44,74},{64,94}})));

        Physiolibrary.Chemical.Components.Substance H(
          q_out(conc(nominal=10^(-7.4 + 3))),
          Simulation=Physiolibrary.Types.SimulationType.SteadyState,
          solute_start=10^(-7.4 + 3),
          isDependent=true) "hydrogen ions activity" annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={36,-12})));

        Physiolibrary.Chemical.Components.Substance H3PO4(
          Simulation=Physiolibrary.Types.SimulationType.SteadyState,
          isDependent=true,
          solute_start=1e-08)
          annotation (Placement(transformation(extent={{-98,-58},{-78,-38}})));
        Physiolibrary.Chemical.Components.Substance H2PO4(Simulation=Physiolibrary.Types.SimulationType.SteadyState,
            solute_start=0.0005)
          annotation (Placement(transformation(extent={{-44,-58},{-24,-38}})));
        Physiolibrary.Chemical.Components.Substance HPO4(Simulation=Physiolibrary.Types.SimulationType.SteadyState,
            solute_start=0.0006)
          annotation (Placement(transformation(extent={{16,-58},{36,-38}})));
        Physiolibrary.Chemical.Components.Substance PO4(Simulation=Physiolibrary.Types.SimulationType.SteadyState,
            solute_start=1e-08)
          annotation (Placement(transformation(extent={{72,-58},{92,-38}})));

        Physiolibrary.Chemical.Components.ChemicalReaction chemicalReaction(nP=2, K=10
              ^(-1.915 + 3))
          annotation (Placement(transformation(extent={{-70,-58},{-50,-38}})));
        Physiolibrary.Chemical.Components.ChemicalReaction chemicalReaction1(nP=2, K=10
              ^(-6.66 + 3))
          annotation (Placement(transformation(extent={{-14,-58},{6,-38}})));
        Physiolibrary.Chemical.Components.ChemicalReaction chemicalReaction2(nP=2, K=10
              ^(-11.78 + 3))
          annotation (Placement(transformation(extent={{44,-58},{64,-38}})));
        Physiolibrary.SteadyStates.Components.MolarConservationLaw tP04(
          each Simulation=Physiolibrary.Types.SimulationType.SteadyState,
          each n=4,
          each Total=totalPO4*1)
          annotation (Placement(transformation(extent={{-28,-90},{-8,-70}})));

        Physiolibrary.SteadyStates.Components.ElementaryChargeConservationLaw
          electroneutrality(
          Simulation=Physiolibrary.Types.SimulationType.SteadyState,
          Total(displayUnit="meq") = 3502.41783837,
          NumberOfParticles=n + 4,
          Charges=cat(
                1,
                {-1},
                {-1,-2,-3},
                fill(1, n)),
          useTotalInput=true)
          annotation (Placement(transformation(extent={{48,-94},{68,-74}})));

        Modelica.Blocks.Math.Gain toColoumn(k=Modelica.Constants.F)
          "from elementary charge to Coloumn" annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={84,-86})));

        parameter Real pKAs[n]=cat(1,{8.5},fill(4.0,98),fill(11.7,18),fill(12.5,24),fill(5.8,2),fill(6.0,2),{7.6,7.8,7.8,8,8},fill(10.3,50),{7.19,7.29,7.17,7.56,7.08,7.38,6.82,6.43,4.92,5.83,6.24,6.8,5.89,5.2,6.8,5.5,8,3.1})
          "acid dissociation constants";

      equation
        for i in 1:n loop
        end for;
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
            points={{-88,-58},{-88,-86},{-28,-86},{-28,-85.5}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(H2PO4.solute, tP04.fragment[2]) annotation (Line(
            points={{-34,-58},{-34,-62},{-64,-62},{-64,-84.5},{-28,-84.5}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(HPO4.solute, tP04.fragment[3]) annotation (Line(
            points={{26,-58},{26,-64},{-50,-64},{-50,-83.5},{-28,-83.5}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(PO4.solute, tP04.fragment[4]) annotation (Line(
            points={{82,-58},{82,-68},{-40,-68},{-40,-82.5},{-28,-82.5}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(PO4.solute, electroneutrality.fragment[2]) annotation (Line(
            points={{82,-58},{82,-68},{30,-68},{30,-88},{48,-88}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(HPO4.solute, electroneutrality.fragment[3]) annotation (Line(
            points={{26,-58},{26,-88},{48,-88}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(H2PO4.solute, electroneutrality.fragment[4]) annotation (Line(
            points={{-34,-58},{-34,-62},{22,-62},{22,-88},{48,-88}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(H.solute, minusPh.u) annotation (Line(
            points={{36,-22},{36,-26},{54,-26},{54,-10},{62,-10}},
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
        annotation ( Documentation(info="<html>
<p>Henderson-Hasselbalch equation in ideal buffered solution, where pH remains constant.</p>
<p>The partial pressure of CO2 in gas are input parameter. Outputs are an amount of free disolved CO2 in liquid and an amount of HCO3-.</p>
</html>",      revisions="<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),experiment(StopTime=0.05),
          Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                  100,100}}),
                          graphics));
      end Phosphate;

      model PlasmaAcidBase

        Components.Substance H3O(
          q_out(conc(nominal=10^(-7.4 + 3))),
          Simulation=Physiolibrary.Types.SimulationType.SteadyState,
          solute_start=10^(-7.4 + 3),
          isDependent=true) "hydrogen ions activity" annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={38,40})));

        Physiolibrary.SteadyStates.Components.MolarConservationLaw tAlb[n](
          each n=2,
          each Simulation=Physiolibrary.Types.SimulationType.SteadyState,
          each Total=0.00066)
          annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
        SteadyStates.Components.ElementaryChargeConservationLaw electroneutrality(
          Simulation=Physiolibrary.Types.SimulationType.SteadyState,
          useTotalInput=true,
          NumberOfParticles=n + 3,
          Charges=-cat(
              1,
              {1,1,2},
              ones(n)),
          Total=6425.92363734) "strong ion difference of solution"
          annotation (Placement(transformation(extent={{46,-94},{66,-74}})));
        Modelica.Blocks.Math.Gain toColoumn(k=-Modelica.Constants.F)
          "from elementary charge to to electric charge, which is needed in system"
                                              annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={80,-74})));
        Modelica.Blocks.Sources.Clock SID(offset=-0.0832)
          "strong ions difference with respect to albumin charge shift"
          annotation (Placement(transformation(extent={{72,-48},{92,-28}})));

        parameter Physiolibrary.Types.Concentration totalPO4=0.00115
          "Total phosphate concentration";
        parameter Physiolibrary.Types.Concentration totalAlb=0.00066
          "Total albumin concentration";

        parameter Integer n=218 "Number of weak acid group in albumin molecule";
        parameter Real pKAs[n]=cat(1,{8.5},fill(4.0,98),fill(11.7,18),fill(12.5,24),fill(5.8,2),fill(6.0,2),{7.6,7.8,7.8,8,8},fill(10.3,50),{7.19,7.29,7.17,7.56,7.08,7.38,6.82,6.43,4.92,5.83,6.24,6.8,5.89,5.2,6.8,5.5,8,3.1})
          "acid dissociation constants";

        Physiolibrary.Chemical.Components.Substance A[n](
          each Simulation=Physiolibrary.Types.SimulationType.SteadyState,
          isDependent=true,
          each solute_start=0.00033) "deprotonated acid groups"
          annotation (Placement(transformation(extent={{-10,14},{10,34}})));
        Physiolibrary.Chemical.Components.ChemicalReaction react[n](
          each nP=2,
          K=fill(10.0, n) .^ (-pKAs .+ 3))
          annotation (Placement(transformation(extent={{-44,16},{-24,36}})));

        Physiolibrary.Chemical.Components.Substance HA[n](
          each Simulation=Physiolibrary.Types.SimulationType.SteadyState, each
            solute_start=0.00033) "protonated acid groups"
          annotation (Placement(transformation(extent={{-76,16},{-56,36}})));

        Components.Substance CO2_liquid(Simulation=Physiolibrary.Types.SimulationType.SteadyState,
            isDependent=true)
          annotation (Placement(transformation(extent={{-76,64},{-56,84}})));
        Components.Substance HCO3(                  Simulation=Physiolibrary.Types.SimulationType.SteadyState)
          annotation (Placement(transformation(extent={{48,70},{68,90}})));
        Interfaces.ChemicalPort_a substances[3]
          "{free dissolved CO2, bicarbonate, chloride}"
          annotation (Placement(transformation(extent={{-10,70},{10,90}})));
        Components.Substance                        H2PO4(Simulation=Physiolibrary.Types.SimulationType.SteadyState,
            solute_start=0.0005)
          annotation (Placement(transformation(extent={{-62,-54},{-42,-34}})));
        Components.ChemicalReaction phosphateAcidification(nP=2, K=10^(-6.66 + 3))
          annotation (Placement(transformation(extent={{-32,-54},{-12,-34}})));
        Components.Substance                        HPO4(Simulation=Physiolibrary.Types.SimulationType.SteadyState,
            solute_start=0.0006)
          annotation (Placement(transformation(extent={{-2,-54},{18,-34}})));
        SteadyStates.Components.MolarConservationLaw               tP04(
          each Simulation=Physiolibrary.Types.SimulationType.SteadyState,
          each Total=totalPO4*1,
          each n=2)
          annotation (Placement(transformation(extent={{-28,-80},{-8,-60}})));
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
            points={{0,14},{0,10},{-54,10},{-54,-5},{-40,-5}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(HA.solute, tAlb.fragment[2]) annotation (Line(
            points={{-66,16},{-66,-4},{-40,-4},{-40,-3}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(SID.y,toColoumn. u) annotation (Line(
            points={{93,-38},{100,-38},{100,-74},{92,-74}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(HA.solute, electroneutrality.fragment) annotation (Line(
            points={{-66,16},{-66,-88},{46,-88}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(toColoumn.y, electroneutrality.total) annotation (Line(
            points={{69,-74},{56,-74},{56,-76}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(substances[1], CO2_liquid.q_out) annotation (Line(
            points={{0,73.3333},{0,74},{-66,74}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(HCO3.q_out, substances[2]) annotation (Line(
            points={{58,80},{0,80}},
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
            points={{-52,-54},{-52,-75},{-28,-75}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(HPO4.solute, tP04.fragment[2]) annotation (Line(
            points={{8,-54},{8,-60},{-40,-60},{-40,-73},{-28,-73}},
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
            points={{-52,-54},{-52,-86},{46,-86},{46,-88}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(HPO4.solute, electroneutrality.fragment[3]) annotation (Line(
            points={{8,-54},{8,-88},{46,-88}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (                                      Diagram(coordinateSystem(
                preserveAspectRatio=false, extent={{-100,-100},{100,100}},
          experiment(StopTime=4)), graphics), Documentation(revisions="<html>
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
            __Dymola_Algorithm="Euler"),
          __Dymola_experimentSetupOutput);
      end PlasmaAcidBase;

      model ErythrocyteAcidBase
        Components.Substance H3O(
          q_out(conc(nominal=10^(-7.4 + 3))),
          Simulation=Physiolibrary.Types.SimulationType.SteadyState,
          solute_start=10^(-7.4 + 3),
          isDependent=true) "hydrogen ions activity" annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={-12,36})));
        Components.ChemicalReaction HendersonHasselbalch(
          nP=2,
          dH=15.13,
          K=10^(-6.103 + 3),
          nS=1)
          annotation (Placement(transformation(extent={{-60,46},{-40,66}})));
        Components.Substance CO2_liquid(Simulation=Physiolibrary.Types.SimulationType.SteadyState,
            isDependent=true)
          annotation (Placement(transformation(extent={{-90,46},{-70,66}})));
        Components.Substance HCO3(                  Simulation=Physiolibrary.Types.SimulationType.SteadyState)
          annotation (Placement(transformation(extent={{-22,70},{-2,90}})));
        Interfaces.ChemicalPort_a substances[3]
          "{free dissolved CO2, bicarbonate, chloride}"
          annotation (Placement(transformation(extent={{-90,70},{-70,90}})));
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
        annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}),      graphics));
      end ErythrocyteAcidBase;

      model BloodAcidBase
        PlasmaAcidBase plasmaAcidBase
          annotation (Placement(transformation(extent={{-34,-6},{-14,14}})));
        ErythrocyteAcidBase erythrocyteAcidBase
          annotation (Placement(transformation(extent={{56,-6},{76,14}})));
        Components.Membrane membrane
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
            points={{34,12},{46,12},{46,12},{58,12}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent=
                  {{-100,-100},{100,100}}), graphics));
      end BloodAcidBase;
    end AcidBase;
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
                                        solute_start(nominal=NominalSolute) = 1e-8
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

      Physiolibrary.Chemical.Interfaces.ChemicalPort_b            q_out(conc(start=solute_start/NormalSolventVolume))
        "Flux from/to compartment" annotation (Placement(transformation(extent={{-10,
                -10},{10,10}})));

    equation
      q_out.conc = solute/volume;

      state = solute; // der(solute)=q_out.q
      change = q_out.q;

                                                                                                        annotation (choicesAllMatching=true,
        Icon(coordinateSystem(
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

      parameter Physiolibrary.Types.StoichiometricNumber s[nS]=ones(nS)
        "Stoichiometric reaction coefficient for substrates"
        annotation (  HideResult=true, Dialog(group="Substrates", tab="Reaction type"));
      parameter Modelica.SIunits.ActivityCoefficient as[nS]=ones(nS)
        "Activity coefficients of substrates"
        annotation ( HideResult=true, Dialog(group="Substrates", tab="Reaction type"));

      parameter Physiolibrary.Types.StoichiometricNumber p[nP]=ones(nP)
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
</html>"));
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

    protected
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
              textString="%name")}),        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end Reabsorption;

    model Membrane
      "Donnan's equilibrium of electrolytes usable for glomerular membrane, open/leak membrane channels, pores, ..."
      extends Physiolibrary.Icons.Membrane;
      extends Physiolibrary.Chemical.Interfaces.ConditionalHeatPort;

      parameter Integer NumberOfParticles = 1
        "Number of penetrating particle types";
      parameter Integer Charges[NumberOfParticles] = {0}
        "Elementary charges of particles";
      parameter Types.DiffusionPermeability Permeabilities[NumberOfParticles] = {0}
        "Permeabilities of particles through membrane chanel";

      parameter Boolean usePermeabilityInput = false
        "=true, if external permeability value is used"
        annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

      Interfaces.ChemicalPort_a particlesInside[NumberOfParticles]
        "inner side of membrane"
        annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
      Interfaces.ChemicalPort_b particlesOutside[NumberOfParticles]
        "outer side of membrane"
        annotation (Placement(transformation(extent={{90,-10},{110,10}})));

      Types.RealIO.DiffusionPermeabilityInput permeability[NumberOfParticles] = p if usePermeabilityInput
        annotation (Placement(transformation(extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,100})));

      Physiolibrary.Types.GasSolubility kH[NumberOfParticles]
        "Concentration ratio at equilibrium";

      parameter Physiolibrary.Types.GasSolubility kH_T0[NumberOfParticles] = ones( NumberOfParticles)
        "Equilibrated concentration ratio at temperature T0 - can be estimated by Henry's law coefficient ratios (kH1/kH2)"
         annotation ( HideResult=true,Dialog(tab="Different solubilities"));
      parameter Physiolibrary.Types.Temperature T0=298.15
        "Base temperature for kH_T0"
         annotation (HideResult=true,Dialog(tab="Temperature dependence"));
      parameter Physiolibrary.Types.Temperature C[NumberOfParticles](displayUnit="K") = zeros(NumberOfParticles)
        "Specific constant difference (C1-C2) for Van't Hoff's change of kH"
        annotation (HideResult=true,Dialog(tab="Temperature dependence"));

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
           particlesInside[i].q = p[i] * (particlesInside[i].conc - kH[i]*particlesOutside[i].conc);
         elseif Charges[i]>0 then //cation goes to Donnan's equilibrium
           particlesInside[i].q = p[i] * (particlesInside[i].conc - (1+KAdjustment)*kH[i]*particlesOutside[i].conc);
         else //anion goes to Donnan's equilibrium
           particlesInside[i].q = p[i] * (particlesInside[i].conc - (1-KAdjustment)*kH[i]*particlesOutside[i].conc);
         end if;
       end for;

       //different solubilities:
       kH = kH_T0 .* Modelica.Math.exp(C * (1/T_heatPort - 1/T0));
       lossHeat = Modelica.Constants.R* C*particlesOutside.q; //negative = heat are comsumed when change from liquid to gas

      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics), Documentation(info="<html>
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
              lineColor={0,0,255})}),        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
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
              lineColor={0,0,255})}),        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
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
        annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));

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

within Physiolibrary;
package Obsolete
  package ObsoleteChemical "Obsolete, please use 'Chemical' library instead!"
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
            thickness=1));
        connect(A.q_out, reaction.substrates[1]) annotation (Line(
            points={{-46,2},{-10,2}},
            color={107,45,134},
            thickness=1));
        annotation ( Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
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
            thickness=1));
        connect(reaction.products[1], B.q_out) annotation (Line(
            points={{14,1.5},{24,1.5},{24,2},{46,2}},
            color={107,45,134},
            thickness=1));
        connect(reaction.products[2], C.q_out) annotation (Line(
            points={{14,2.5},{24,2.5},{24,26},{46,26}},
            color={107,45,134},
            thickness=1));
        annotation ( Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
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
            thickness=1));
        connect(A.q_out, reaction.substrates[1]) annotation (Line(
            points={{-46,2},{-10,2}},
            color={107,45,134},
            thickness=1));
        connect(reaction.heatPort, heatFlowSensor.port_a) annotation (Line(
            points={{0,2},{0,-48},{12,-48}},
            color={191,0,0},
            thickness=1));
        connect(unlimitedHeat.port, heatFlowSensor.port_b) annotation (Line(
            points={{54,-48},{32,-48}},
            color={191,0,0},
            thickness=1));
        annotation ( Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end ExothermicReaction;

      model MichaelisMenten "Basic enzyme kinetics"
        import Physiolibrary;
        extends Modelica.Icons.Example;
        extends SteadyStates.Interfaces.SteadyStateSystem(Simulation=
              Physiolibrary.Obsolete.ObsoleteTypes.SimulationType.SteadyState);

        Physiolibrary.Obsolete.ObsoleteChemical.Sources.UnlimitedSolutionStorage
          P(Conc=0)
          annotation (Placement(transformation(extent={{92,-12},{72,8}})));
        Physiolibrary.Obsolete.ObsoleteChemical.Sources.UnlimitedSolutionStorage
          S(Conc=0.1)
          annotation (Placement(transformation(extent={{-94,-12},{-74,8}})));

        parameter Types.AmountOfSubstance tE=
            0.01 "total amount of enzyme";
           parameter Real k_cat(unit="1/s", displayUnit="1/min")= 1
          "forward rate of second reaction";
        parameter Types.Concentration Km=0.1
          "Michaelis constant = substrate concentration at rate of half Vmax";

        Physiolibrary.Obsolete.ObsoleteChemical.Components.Substance ES(
            solute_start=0, Simulation=Physiolibrary.Obsolete.ObsoleteTypes.SimulationType.SteadyState)
          annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
        Physiolibrary.Obsolete.ObsoleteChemical.Components.Substance E(
          solute_start=tE,
          isDependent=true,
          Simulation=Physiolibrary.Obsolete.ObsoleteTypes.SimulationType.SteadyState)
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
            thickness=1));
        connect(chemicalReaction1.products[1], P.q_out) annotation (Line(
            points={{44,-0.5},{54,-0.5},{54,-2},{72,-2}},
            color={107,45,134},
            thickness=1));
        connect(E.q_out, chemicalReaction.substrates[2]) annotation (Line(
            points={{0,48},{-50,48},{-50,0.5},{-42,0.5}},
            color={107,45,134},
            thickness=1));
        connect(E.q_out, chemicalReaction1.products[2]) annotation (Line(
            points={{0,48},{50,48},{50,0.5},{44,0.5}},
            color={107,45,134},
            thickness=1));
        connect(chemicalReaction.products[1], ES.q_out) annotation (Line(
            points={{-22,0},{0,0}},
            color={107,45,134},
            thickness=1));
        connect(ES.q_out, chemicalReaction1.substrates[1]) annotation (Line(
            points={{0,0},{24,0}},
            color={107,45,134},
            thickness=1));
            annotation ( Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end MichaelisMenten;

      package Hemoglobin "Hemoglobin blood gases binding"
        model Allosteric_Hemoglobin_MWC "Monod,Wyman,Changeux (1965)"
        extends Modelica.Icons.Example;

        //extends SteadyStates.Interfaces.SteadyStateSystem(
        //                                         Simulation=ObsoleteTypes.SimulationType.SteadyState);

          parameter Types.Temperature T=310.15 "Temperature";
        //  parameter GasSolubility alpha =  Modelica.Constants.R*298.15 * 0.0105 * 1e-3
        //    "oxygen solubility in plasma";
                                           // by Siggaard Andersen: 0.0105 (mmol/l)/kPa

          parameter Types.Fraction L=7.0529*10^6
            "=[T0]/[R0] .. dissociation constant of relaxed <-> tensed change of deoxyhemoglobin tetramer";
          parameter Types.Fraction c=0.00431555
            "=KR/KT .. ration between oxygen affinities of relaxed vs. tensed subunit";
          parameter Types.Concentration KR=0.000671946
            "oxygen dissociation on relaxed(R) hemoglobin subunit";
                                                                      //*7.875647668393782383419689119171e-5
                                                                    //10.500001495896 7.8756465463794e-05

          parameter Types.Concentration KT=KR/c
            "oxygen dissociation on tensed(T) hemoglobin subunit";

        //  Fraction sO2 "hemoglobin oxygen saturation";

          parameter Types.AmountOfSubstance totalAmountOfHemoglobin=1;
        //  AmountOfSubstance totalAmountOfRforms;
        //  AmountOfSubstance totalAmountOfTforms;

          Components.Substance T0(
            stateName="T0",
            Simulation=ObsoleteTypes.SimulationType.SteadyState,
            solute_start=1)
            annotation (Placement(transformation(extent={{32,78},{52,98}})));

          Components.Substance T1(
            stateName="T1",
            Simulation=ObsoleteTypes.SimulationType.SteadyState,
            solute_start=0)
            annotation (Placement(transformation(extent={{34,36},{54,56}})));

          Components.Substance R1(
            stateName="R1",
            Simulation=ObsoleteTypes.SimulationType.SteadyState,
            solute_start=0,
            isDependent=true)
            annotation (Placement(transformation(extent={{-20,36},{0,56}})));

          Components.Substance T2(
            stateName="T2",
            Simulation=ObsoleteTypes.SimulationType.SteadyState,
            solute_start=0)
            annotation (Placement(transformation(extent={{34,-10},{54,10}})));

          Components.Substance R2(
            stateName="R2",
            Simulation=ObsoleteTypes.SimulationType.SteadyState,
            solute_start=0)
            annotation (Placement(transformation(extent={{-20,-10},{0,10}})));

          Components.Substance T3(
            stateName="T3",
            Simulation=ObsoleteTypes.SimulationType.SteadyState,
            solute_start=0)
            annotation (Placement(transformation(extent={{34,-54},{54,-34}})));

          Components.Substance R3(
            stateName="R3",
            Simulation=ObsoleteTypes.SimulationType.SteadyState,
            solute_start=0)
            annotation (Placement(transformation(extent={{-20,-54},{0,-34}})));

          Components.Substance T4(
            stateName="T4",
            Simulation=ObsoleteTypes.SimulationType.SteadyState,
            solute_start=0,
            isDependent=true)
            annotation (Placement(transformation(extent={{34,-92},{54,-72}})));

          Components.Substance R4(
            stateName="R4",
            Simulation=ObsoleteTypes.SimulationType.SteadyState,
            solute_start=0)
            annotation (Placement(transformation(extent={{-20,-92},{0,-72}})));

          Components.Substance R0(
            stateName="R0",
            Simulation=ObsoleteTypes.SimulationType.SteadyState,
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

          SteadyStates.Components.MolarConservationLaw
            hemoglobinConservationLaw(
            n=10,
            Total(displayUnit="mol") = 1,
            Simulation=ObsoleteTypes.SimulationType.SteadyState)
            annotation (Placement(transformation(extent={{72,-2},{92,18}})));
          Modelica.Blocks.Math.Sum oxygen_bound(k={1,1,2,2,3,3,4,4}, nin=8)
            annotation (Placement(transformation(extent={{72,-56},{82,-46}})));
          Modelica.Blocks.Math.Division sO2_ "hemoglobin oxygen saturation"
            annotation (Placement(transformation(extent={{86,-60},{96,-50}})));
          Modelica.Blocks.Math.Sum tHb(nin=10, k=4*ones(10))
            annotation (Placement(transformation(extent={{72,-70},{82,-60}})));
          Components.Substance oxygen_unbound(solute_start=0.000001*
                7.875647668393782383419689119171e-5, Simulation=ObsoleteTypes.SimulationType.SteadyState)
            annotation (Placement(transformation(extent={{-56,-44},{-36,-24}})));
          Modelica.Blocks.Sources.Clock clock(offset=10)
            annotation (Placement(transformation(extent={{-94,44},{-74,64}})));
          Sources.UnlimitedGasStorage O2_in_air(
            Simulation=ObsoleteTypes.SimulationType.SteadyState,
            usePartialPressureInput=true,
            T=310.15) annotation (Placement(transformation(
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
              thickness=1));
          connect(oxyR1.substrates[1],R1. q_out) annotation (Line(
              points={{-10,54},{-10,46}},
              color={107,45,134},
              thickness=1));
          connect(R1.q_out,oxyR2. products[1]) annotation (Line(
              points={{-10,46},{-10,32},{-10.5,32}},
              color={107,45,134},
              thickness=1));
          connect(oxyR2.substrates[1],R2. q_out) annotation (Line(
              points={{-10,12},{-10,0}},
              color={107,45,134},
              thickness=1));
          connect(oxyR3.substrates[1],R3. q_out) annotation (Line(
              points={{-10,-34},{-10,-44}},
              color={107,45,134},
              thickness=1));
          connect(oxyR3.products[1],R2. q_out) annotation (Line(
              points={{-10.5,-14},{-10.5,-7},{-10,-7},{-10,0}},
              color={107,45,134},
              thickness=1));
          connect(R3.q_out,oxyR4. products[1]) annotation (Line(
              points={{-10,-44},{-10,-56},{-10.5,-56}},
              color={107,45,134},
              thickness=1));
          connect(oxyR4.substrates[1],R4. q_out) annotation (Line(
              points={{-10,-76},{-10,-82}},
              color={107,45,134},
              thickness=1));
          connect(oxyT1.products[1],T0. q_out) annotation (Line(
              points={{44.5,74},{44.5,88},{42,88}},
              color={107,45,134},
              thickness=1));
          connect(oxyT1.substrates[1],T1. q_out) annotation (Line(
              points={{44,54},{44,46}},
              color={107,45,134},
              thickness=1));
          connect(T1.q_out,oxyT2. products[1]) annotation (Line(
              points={{44,46},{44,32},{44.5,32}},
              color={107,45,134},
              thickness=1));
          connect(oxyT2.substrates[1],T2. q_out) annotation (Line(
              points={{44,12},{44,0}},
              color={107,45,134},
              thickness=1));
          connect(T2.q_out,oxyT3. products[1]) annotation (Line(
              points={{44,0},{44,-14},{44.5,-14}},
              color={107,45,134},
              thickness=1));
          connect(oxyT3.substrates[1],T3. q_out) annotation (Line(
              points={{44,-34},{44,-44}},
              color={107,45,134},
              thickness=1));
          connect(T3.q_out,oxyT4. products[1]) annotation (Line(
              points={{44,-44},{44,-56},{44.5,-56}},
              color={107,45,134},
              thickness=1));
          connect(oxyT4.substrates[1],T4. q_out) annotation (Line(
              points={{44,-76},{44,-82}},
              color={107,45,134},
              thickness=1));
          connect(R0.q_out,quaternaryForm. substrates[1]) annotation (Line(
              points={{-10,88},{4,88}},
              color={107,45,134},
              thickness=1));
          connect(R0.q_out,oxyR1. products[1]) annotation (Line(
              points={{-10,88},{-10,74},{-10.5,74}},
              color={107,45,134},
              thickness=1));
          connect(R1.q_out,quaternaryForm1. substrates[1]) annotation (Line(
              points={{-10,46},{8,46}},
              color={107,45,134},
              thickness=1));
          connect(quaternaryForm1.products[1],T1. q_out) annotation (Line(
              points={{28,46},{44,46}},
              color={107,45,134},
              thickness=1));
          connect(R2.q_out,quaternaryForm2. substrates[1]) annotation (Line(
              points={{-10,0},{8,0}},
              color={107,45,134},
              thickness=1));
          connect(quaternaryForm2.products[1],T2. q_out) annotation (Line(
              points={{28,0},{44,0}},
              color={107,45,134},
              thickness=1));
          connect(R3.q_out,quaternaryForm3. substrates[1]) annotation (Line(
              points={{-10,-44},{8,-44}},
              color={107,45,134},
              thickness=1));
          connect(quaternaryForm3.products[1],T3. q_out) annotation (Line(
              points={{28,-44},{44,-44}},
              color={107,45,134},
              thickness=1));
          connect(R4.q_out,quaternaryForm4. substrates[1]) annotation (Line(
              points={{-10,-82},{10,-82}},
              color={107,45,134},
              thickness=1));
          connect(quaternaryForm4.products[1],T4. q_out) annotation (Line(
              points={{30,-82},{44,-82}},
              color={107,45,134},
              thickness=1));
          connect(R4.solute,hemoglobinConservationLaw. fragment[1])        annotation (
              Line(
              points={{-4,-92},{-4,-98},{64,-98},{64,2.2},{72,2.2}},
              color={0,0,127}));
          connect(T4.solute,hemoglobinConservationLaw. fragment[2])        annotation (
              Line(
              points={{50,-92},{50,-98},{64,-98},{64,2.6},{72,2.6}},
              color={0,0,127}));
          connect(R3.solute,hemoglobinConservationLaw. fragment[3])        annotation (
              Line(
              points={{-4,-54},{64,-54},{64,3},{72,3}},
              color={0,0,127}));
          connect(T3.solute,hemoglobinConservationLaw. fragment[4])        annotation (
              Line(
              points={{50,-54},{64,-54},{64,3.4},{72,3.4}},
              color={0,0,127}));
          connect(R2.solute,hemoglobinConservationLaw. fragment[5])        annotation (
              Line(
              points={{-4,-10},{64,-10},{64,3.8},{72,3.8}},
              color={0,0,127}));
          connect(T2.solute,hemoglobinConservationLaw. fragment[6])        annotation (
              Line(
              points={{50,-10},{64,-10},{64,4.2},{72,4.2}},
              color={0,0,127}));
          connect(R1.solute,hemoglobinConservationLaw. fragment[7])        annotation (
              Line(
              points={{-4,36},{64,36},{64,4.6},{72,4.6}},
              color={0,0,127}));
          connect(T1.solute,hemoglobinConservationLaw. fragment[8])        annotation (
              Line(
              points={{50,36},{64,36},{64,5},{72,5}},
              color={0,0,127}));
          connect(R0.solute,hemoglobinConservationLaw. fragment[9])        annotation (
              Line(
              points={{-4,78},{64,78},{64,5.4},{72,5.4}},
              color={0,0,127}));
          connect(T0.solute,hemoglobinConservationLaw. fragment[10])        annotation (
             Line(
              points={{48,78},{64,78},{64,5.8},{72,5.8}},
              color={0,0,127}));
          connect(R1.solute,oxygen_bound. u[1]) annotation (Line(
              points={{-4,36},{64,36},{64,-51.875},{71,-51.875}},
              color={0,0,127}));
          connect(T1.solute,oxygen_bound. u[2]) annotation (Line(
              points={{50,36},{64,36},{64,-51.625},{71,-51.625}},
              color={0,0,127}));
          connect(R2.solute,oxygen_bound. u[3]) annotation (Line(
              points={{-4,-10},{64,-10},{64,-51.375},{71,-51.375}},
              color={0,0,127}));
          connect(T2.solute,oxygen_bound. u[4]) annotation (Line(
              points={{50,-10},{64,-10},{64,-51.125},{71,-51.125}},
              color={0,0,127}));
          connect(R3.solute,oxygen_bound. u[5]) annotation (Line(
              points={{-4,-54},{64,-54},{64,-50.875},{71,-50.875}},
              color={0,0,127}));
          connect(T3.solute,oxygen_bound. u[6]) annotation (Line(
              points={{50,-54},{64,-54},{64,-50.625},{71,-50.625}},
              color={0,0,127}));
          connect(R4.solute,oxygen_bound. u[7]) annotation (Line(
              points={{-4,-92},{-4,-98},{64,-98},{64,-50.375},{71,-50.375}},
              color={0,0,127}));
          connect(T4.solute,oxygen_bound. u[8]) annotation (Line(
              points={{50,-92},{50,-98},{64,-98},{64,-50.125},{71,-50.125}},
              color={0,0,127}));
          connect(oxygen_bound.y,sO2_. u1) annotation (Line(
              points={{82.5,-51},{84,-51},{84,-52},{85,-52}},
              color={0,0,127}));
          connect(sO2_.u2,tHb. y) annotation (Line(
              points={{85,-58},{84,-58},{84,-65},{82.5,-65}},
              color={0,0,127}));
          connect(R0.solute,tHb. u[1]) annotation (Line(
              points={{-4,78},{64,78},{64,-65.9},{71,-65.9}},
              color={0,0,127}));
          connect(T0.solute,tHb. u[2]) annotation (Line(
              points={{48,78},{64,78},{64,-65.7},{71,-65.7}},
              color={0,0,127}));
          connect(R1.solute,tHb. u[3]) annotation (Line(
              points={{-4,36},{64,36},{64,-65.5},{71,-65.5}},
              color={0,0,127}));
          connect(T1.solute,tHb. u[4]) annotation (Line(
              points={{50,36},{64,36},{64,-65.3},{71,-65.3}},
              color={0,0,127}));
          connect(R2.solute,tHb. u[5]) annotation (Line(
              points={{-4,-10},{64,-10},{64,-65.1},{71,-65.1}},
              color={0,0,127}));
          connect(T2.solute,tHb. u[6]) annotation (Line(
              points={{50,-10},{64,-10},{64,-64.9},{71,-64.9}},
              color={0,0,127}));
          connect(R3.solute,tHb. u[7]) annotation (Line(
              points={{-4,-54},{64,-54},{64,-64.7},{71,-64.7}},
              color={0,0,127}));
          connect(T3.solute,tHb. u[8]) annotation (Line(
              points={{50,-54},{64,-54},{64,-64.5},{71,-64.5}},
              color={0,0,127}));
          connect(R4.solute,tHb. u[9]) annotation (Line(
              points={{-4,-92},{-4,-98},{64,-98},{64,-64.3},{71,-64.3}},
              color={0,0,127}));
          connect(T4.solute,tHb. u[10]) annotation (Line(
              points={{50,-92},{50,-98},{64,-98},{64,-64.1},{71,-64.1}},
              color={0,0,127}));
          connect(oxyR1.products[2],oxygen_unbound. q_out)
                                              annotation (Line(
              points={{-9.5,74},{-46,74},{-46,-34}},
              color={107,45,134},
              thickness=1));
          connect(oxyR2.products[2],oxygen_unbound. q_out)
                                              annotation (Line(
              points={{-9.5,32},{-46,32},{-46,-34}},
              color={107,45,134},
              thickness=1));
          connect(oxyR3.products[2],oxygen_unbound. q_out)
                                              annotation (Line(
              points={{-9.5,-14},{-46,-14},{-46,-34}},
              color={107,45,134},
              thickness=1));
          connect(oxyR4.products[2],oxygen_unbound. q_out)
                                              annotation (Line(
              points={{-9.5,-56},{-46,-56},{-46,-34}},
              color={107,45,134},
              thickness=1));
          connect(oxygen_unbound.q_out, oxyT1.products[2])
                                              annotation (Line(
              points={{-46,-34},{-46,74},{43.5,74}},
              color={107,45,134},
              thickness=1));
          connect(oxygen_unbound.q_out, oxyT2.products[2])
                                              annotation (Line(
              points={{-46,-34},{-46,32},{43.5,32}},
              color={107,45,134},
              thickness=1));
          connect(oxygen_unbound.q_out, oxyT3.products[2])
                                              annotation (Line(
              points={{-46,-34},{-46,-14},{43.5,-14}},
              color={107,45,134},
              thickness=1));
          connect(oxygen_unbound.q_out, oxyT4.products[2])
                                              annotation (Line(
              points={{-46,-34},{-46,-56},{43.5,-56}},
              color={107,45,134},
              thickness=1));
          connect(oxygen_unbound.q_out,gasSolubility. q_in) annotation (Line(
              points={{-46,-34},{-66,-34},{-66,-12}},
              color={107,45,134},
              thickness=1));
          connect(O2_in_air.q_out,gasSolubility. q_out) annotation (Line(
              points={{-66,14},{-66,6}},
              color={107,45,134},
              thickness=1));
          connect(clock.y,O2_in_air. partialPressure) annotation (Line(
              points={{-73,54},{-66,54},{-66,34}},
              color={0,0,127}));
          annotation (   Documentation(info="<html>
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
</html>",     revisions="<html>
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

          parameter Types.Fraction L=7.0529*10^6
            "=[T0]/[R0] .. dissociation constant of relaxed <-> tensed change of deoxyhemoglobin tetramer";
          parameter Types.Fraction c=0.00431555
            "=KR/KT .. ration between oxygen affinities of relaxed vs. tensed subunit";
          parameter Types.Concentration KR=0.000671946
            "oxygen dissociation on relaxed(R) hemoglobin subunit";
                                                                      //*7.875647668393782383419689119171e-5
                                                                    //10.500001495896 7.8756465463794e-05

          parameter Types.Concentration KT=KR/c
            "oxygen dissociation on tensed(T) hemoglobin subunit";

          parameter Types.AmountOfSubstance totalAmountOfHemoglobin=1;

          Components.ChemicalReaction quaternaryForm(
            K=L,
            TK=310.15,
            dH=dHL)
            annotation (Placement(transformation(extent={{-2,-76},{18,-56}})));
          Components.Speciation
                             R0_in_R(NumberOfSubunits=4, useInternalHeatsInput=true)
            annotation (Placement(transformation(extent={{-30,-68},{-50,-48}})));
          Components.Speciation
                             T0_in_T(NumberOfSubunits=4, useInternalHeatsInput=true)
            annotation (Placement(transformation(extent={{70,-66},{50,-46}})));
          Components.Substance OxyRHm[4](
            each Simulation=ObsoleteTypes.SimulationType.SteadyState,
            each isDependent=true,
            each solute_start=4e-19,
            each dH=-dHL/4 - dHR)
            "Oxygenated subunit in R structure of hemoglobin tetramer"
            annotation (Placement(transformation(extent={{-96,-18},{-76,2}})));
          Components.ChemicalReaction oxygenation_R[4](
            each K=KR,
            each nP=2,
            each TK=310.15,
            each dH=dHR)
            annotation (Placement(transformation(extent={{-68,-18},{-48,2}})));
          Components.Substance DeoxyRHm[4](
            each Simulation=ObsoleteTypes.SimulationType.SteadyState,
            each solute_start=4e-11,
            each dH=-dHL/4)
            "Deoxygenated subunit in R structure of hemoglobin tetramer"
            annotation (Placement(transformation(extent={{-40,-18},{-20,2}})));
          Components.Substance OxyTHm[4](
            each Simulation=ObsoleteTypes.SimulationType.SteadyState,
            isDependent={false,true,true,true},
            each dH=-dHT,
            each solute_start=1e-14)
            "Oxygenated subunit in T structure of hemoglobin tetramer"
            annotation (Placement(transformation(extent={{14,-18},{34,2}})));
          Components.ChemicalReaction oxygenation_T[4](
            each K=KT,
            each nP=2,
            each dH=dHT,
            each TK=310.15)
            annotation (Placement(transformation(extent={{42,-18},{62,2}})));
          Components.Substance DeoxyTHm[4](
            each Simulation=ObsoleteTypes.SimulationType.SteadyState,
            each solute_start=0.00025,
            each dH=0)
            "Deoxygenated subunit in T structure of hemoglobin tetramer"
            annotation (Placement(transformation(extent={{70,-18},{90,2}})));

          Components.Substance oxygen_unbound(Simulation=ObsoleteTypes.SimulationType.SteadyState,
              solute_start=0.000001*7.875647668393782383419689119171e-5)
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
            Simulation=ObsoleteTypes.SimulationType.SteadyState,
            usePartialPressureInput=true,
            isIsolatedInSteadyState=false,
            T=310.15) annotation (Placement(transformation(
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
            Simulation=ObsoleteTypes.SimulationType.SteadyState,
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
              thickness=1));
          connect(quaternaryForm.products[1], T0_in_T.specificForm)
                                                         annotation (Line(
              points={{18,-66},{34,-66},{34,-64},{50,-64}},
              color={107,45,134},
              thickness=1));
          connect(OxyTHm.q_out, oxygenation_T.substrates[1])
                                                   annotation (Line(
              points={{24,-8},{42,-8}},
              color={107,45,134},
              thickness=1));
          connect(oxygenation_T.products[1], DeoxyTHm.q_out)
                                                 annotation (Line(
              points={{62,-8.5},{72,-8.5},{72,-8},{80,-8}},
              color={107,45,134},
              thickness=1));

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
              thickness=1));
          connect(partialPressure1.q_in, oxygen_unbound.q_out) annotation (Line(
              points={{8,32},{8,16}},
              color={107,45,134},
              thickness=1));
          connect(clock.y, oxygen_in_air.partialPressure) annotation (Line(
              points={{-19,84},{8,84},{8,78}},
              color={0,0,127}));
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
              thickness=1));
          connect(DeoxyRHm.q_out, R0_in_R.specificSubunitForm) annotation (Line(
              points={{-30,-8},{-40,-8},{-40,-48}},
              color={107,45,134},
              thickness=1));
          connect(oxygenation_R.products[1], DeoxyRHm.q_out) annotation (Line(
              points={{-48,-8.5},{-40,-8.5},{-40,-8},{-30,-8}},
              color={107,45,134},
              thickness=1));
          connect(oxygenation_R[1].products[2], oxygen_unbound.q_out) annotation (Line(
              points={{-48,-7.5},{-34,-7.5},{-34,16},{8,16}},
              color={107,45,134},
              thickness=1));
          connect(oxygenation_R[2].products[2], oxygen_unbound.q_out) annotation (Line(
              points={{-48,-7.5},{-34,-7.5},{-34,16},{8,16}},
              color={107,45,134},
              thickness=1));
          connect(oxygenation_R[3].products[2], oxygen_unbound.q_out) annotation (Line(
              points={{-48,-7.5},{-34,-7.5},{-34,16},{8,16}},
              color={107,45,134},
              thickness=1));
          connect(oxygenation_R[4].products[2], oxygen_unbound.q_out) annotation (Line(
              points={{-48,-7.5},{-34,-7.5},{-34,16},{8,16}},
              color={107,45,134},
              thickness=1));
          connect(oxygenation_T[1].products[2], oxygen_unbound.q_out) annotation (Line(
              points={{62,-7.5},{78,-7.5},{78,16},{8,16}},
              color={107,45,134},
              thickness=1));
          connect(oxygenation_T[2].products[2], oxygen_unbound.q_out) annotation (Line(
              points={{62,-7.5},{78,-7.5},{78,16},{8,16}},
              color={107,45,134},
              thickness=1));
         connect(oxygenation_T[3].products[2], oxygen_unbound.q_out) annotation (Line(
              points={{62,-7.5},{78,-7.5},{78,16},{8,16}},
              color={107,45,134},
              thickness=1));
              connect(oxygenation_T[4].products[2], oxygen_unbound.q_out) annotation (Line(
              points={{62,-7.5},{78,-7.5},{78,16},{8,16}},
              color={107,45,134},
              thickness=1));
          connect(T0_in_T.specificSubunitForm, DeoxyTHm.q_out)
                                                       annotation (Line(
              points={{60,-46},{84,-46},{84,-8},{80,-8}},
              color={107,45,134},
              thickness=1));
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
              color={0,0,127}));
          connect(T0_in_T.internalHeat, internalHeat.u[2]) annotation (Line(
              points={{66,-64},{66,-74},{-24,-74},{-24,-89.6},{3.2,-89.6}},
              color={0,0,127}));
          connect(add3.y, T0_in_T.subunitInternalHeat) annotation (Line(
              points={{47,-44.5},{47,-50},{52,-50}},
              color={0,0,127}));
          connect(add2.y, R0_in_R.subunitInternalHeat) annotation (Line(
              points={{-73,-42.5},{-73,-52},{-48,-52}},
              color={0,0,127}));
          connect(add3.u1, DeoxyTHm.internalHeat) annotation (Line(
              points={{50,-33},{50,-30},{91.6,-30},{91.6,-12}},
              color={0,0,127}));
          connect(OxyTHm.internalHeat, add3.u2) annotation (Line(
              points={{35.6,-12},{35.6,-30},{44,-30},{44,-33}},
              color={0,0,127}));
          connect(OxyRHm.internalHeat, add2.u2) annotation (Line(
              points={{-74.4,-12},{-74.4,-28},{-76,-28},{-76,-31}},
              color={0,0,127}));
          connect(DeoxyRHm.internalHeat, add2.u1) annotation (Line(
              points={{-18.4,-12},{-18.4,-28},{-70,-28},{-70,-31}},
              color={0,0,127}));
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
            Documentation(revisions=
                          "<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>",   info="<html>
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

        Interfaces.ChemicalPort_a Hbtn annotation (Placement(transformation(
                  extent={{-108,-10},{-88,10}})));
          Components.Substance Hbu_A_NH3[4](
            each Simulation=ObsoleteTypes.SimulationType.SteadyState,
            dH=dH_HbuANH2 - dHz,
            each dirName=dirName,
            each LOAD_STARTS=loadStarts,
            each SAVE_RESULTS=storeState,
            each solute_start=1e-06)
            annotation (Placement(transformation(extent={{-32,70},{-12,90}})));
          Components.Substance Hbu_AH_NH3[4](
            each Simulation=ObsoleteTypes.SimulationType.SteadyState,
            each dirName=dirName,
            each LOAD_STARTS=loadStarts,
            each SAVE_RESULTS=storeState,
            each solute_start=1e-06,
            dH=dH_HbuANH2 - dHh - dHz)
            annotation (Placement(transformation(extent={{54,70},{74,90}})));
          Components.Substance Hbu_A_NH2[4](
            each Simulation=ObsoleteTypes.SimulationType.SteadyState,
            isDependent={isDependent,true,true,true},
            each dirName=dirName,
            each LOAD_STARTS=loadStarts,
            each SAVE_RESULTS=storeState,
            each solute_start=1e-06,
            dH=dH_HbuANH2)
            annotation (Placement(transformation(extent={{-32,-2},{-12,18}})));
          Components.Substance Hbu_AH_NH2[4](
            each Simulation=ObsoleteTypes.SimulationType.SteadyState,
            each dirName=dirName,
            each LOAD_STARTS=loadStarts,
            each SAVE_RESULTS=storeState,
            each solute_start=1e-06,
            dH=dH_HbuANH2 - dHh)
            annotation (Placement(transformation(extent={{54,-2},{74,18}})));
          Components.Substance Hbu_A_NHCOO[4](
            each Simulation=ObsoleteTypes.SimulationType.SteadyState,
            dH=dH_HbuANH2 + dHc,
            each dirName=dirName,
            each LOAD_STARTS=loadStarts,
            each SAVE_RESULTS=storeState,
            each solute_start=1e-06) annotation (Placement(transformation(
                  extent={{-32,-84},{-12,-64}})));
          Components.Substance Hbu_AH_NHCOO[4](
            each Simulation=ObsoleteTypes.SimulationType.SteadyState,
            each dirName=dirName,
            each LOAD_STARTS=loadStarts,
            each SAVE_RESULTS=storeState,
            dH=dH_HbuANH2 + dHc,
            each solute_start=1e-06)
            annotation (Placement(transformation(extent={{54,-84},{74,-64}})));
        Components.ChemicalReaction h2[4](
            each nS=1,
            each nP=2,
            K=fill(10, 4) .^ (-pKh .+ 3),
            each TK=310.15,
            dH=dHh)
            annotation (Placement(transformation(extent={{32,-2},{12,18}})));
        Components.ChemicalReaction z1[4](
            each nP=2,
            K=fill(10, 4) .^ (-pKz .+ 3),
            dH=dHz,
            each TK=310.15) annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={-22,44})));
        Components.ChemicalReaction z2[4](
            each nP=2,
            K=fill(10, 4) .^ (-pKz .+ 3),
            each TK=310.15,
            dH=dHz) annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={64,44})));
        Components.ChemicalReaction c1[4](
            each nS=2,
            each nP=2,
            K=fill(10, 4) .^ (-pKc .+ 3),
            each TK=310.15,
            dH=dHc) annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={-22,-34})));
        Components.ChemicalReaction c2[4](
            each nS=2,
            each nP=2,
            K=fill(10, 4) .^ (-pKc .+ 3),
            each TK=310.15,
            dH=dHc) annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={64,-34})));
        Modelica.Blocks.Math.Sum totalAmounts[4](each nin=6) annotation (
              Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=180,
                origin={-64,62})));
          Interfaces.ChemicalPort_a H(conc(nominal=10^(-7.2 + 3)))
            "hydrogen ions"
            annotation (Placement(transformation(extent={{90,76},{110,96}})));
          Interfaces.ChemicalPort_a CO2
            annotation (Placement(transformation(extent={{90,-70},{110,-50}})));
          Components.Speciation Hb_tn(
            Simulation=ObsoleteTypes.SimulationType.SteadyState,
            NumberOfSubunits=4,
            useInternalHeatsInput=true)
            annotation (Placement(transformation(extent={{-54,-22},{-74,-2}})));
          Types.RealIO.AmountOfSubstanceOutput tHb_u annotation (
              Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=180,
                origin={-100,-78})));
          Types.RealIO.EnergyOutput internalHeat "internal heat"
            annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=180,
                origin={-100,-98})));
        Modelica.Blocks.Math.Sum totalHeats[4](each nin=6) annotation (Placement(
                transformation(
                extent={{-10,-10},{10,10}},
                rotation=180,
                origin={-64,32})));
        equation
        connect(Hbu_AH_NH3.q_out, z2.substrates[1]) annotation (Line(
            points={{64,80},{64,54}},
            color={107,45,134},
            thickness=1));
        connect(Hbu_A_NH3.q_out, z1.substrates[1]) annotation (Line(
            points={{-22,80},{-22,54}},
            color={107,45,134},
            thickness=1));
        connect(z1.products[1], Hbu_A_NH2.q_out) annotation (Line(
            points={{-22.5,34},{-22.5,22},{-22,22},{-22,8}},
            color={107,45,134},
            thickness=1));
        connect(z2.products[1], Hbu_AH_NH2.q_out) annotation (Line(
            points={{63.5,34},{63.5,22},{64,22},{64,8}},
            color={107,45,134},
            thickness=1));
        connect(h2.substrates[1], Hbu_AH_NH2.q_out) annotation (Line(
            points={{32,8},{64,8}},
            color={107,45,134},
            thickness=1));
        connect(Hbu_A_NH2.q_out, c1.substrates[1]) annotation (Line(
            points={{-22,8},{-22,-24},{-22.5,-24}},
            color={107,45,134},
            thickness=1));
        connect(Hbu_AH_NH2.q_out, c2.substrates[1]) annotation (Line(
            points={{64,8},{64,-24},{63.5,-24}},
            color={107,45,134},
            thickness=1));
        connect(c1.products[1], Hbu_A_NHCOO.q_out) annotation (Line(
            points={{-22.5,-44},{-22.5,-60},{-22,-60},{-22,-74}},
            color={107,45,134},
            thickness=1));
        connect(c2.products[1], Hbu_AH_NHCOO.q_out) annotation (Line(
            points={{63.5,-44},{63.5,-60},{64,-60},{64,-74}},
            color={107,45,134},
            thickness=1));
          connect(Hbu_A_NH3.solute, totalAmounts.u[1]) annotation (Line(
              points={{-16,70},{-44,70},{-44,63.6667},{-52,63.6667}},
              color={0,0,127}));
          connect(Hbu_AH_NH3.solute, totalAmounts.u[2]) annotation (Line(
              points={{70,70},{-2,70},{-2,63},{-52,63}},
              color={0,0,127}));
          connect(Hbu_A_NH2.solute, totalAmounts.u[3]) annotation (Line(
              points={{-16,-2},{-44,-2},{-44,62.3333},{-52,62.3333}},
              color={0,0,127}));
          connect(Hbu_AH_NH2.solute, totalAmounts.u[4]) annotation (Line(
              points={{70,-2},{-2,-2},{-2,61.6667},{-52,61.6667}},
              color={0,0,127}));
          connect(Hbu_A_NHCOO.solute, totalAmounts.u[5]) annotation (Line(
              points={{-16,-84},{-44,-84},{-44,61},{-52,61}},
              color={0,0,127}));
          connect(Hbu_AH_NHCOO.solute, totalAmounts.u[6]) annotation (Line(
              points={{70,-84},{-2,-84},{-2,60.3333},{-52,60.3333}},
              color={0,0,127}));

        connect(Hbu_A_NH2.q_out, h2.products[1]) annotation (Line(
            points={{-22,8},{-10,8},{-10,7.5},{12,7.5}},
            color={107,45,134},
            thickness=1));

          connect(Hb_tn.specificForm, Hbtn) annotation (Line(
              points={{-74,-20},{-86,-20},{-86,0},{-98,0}},
              color={107,45,134},
              thickness=1));
          connect(totalAmounts.y, Hb_tn.amountOfSubunit) annotation (Line(
              points={{-75,62},{-78,62},{-78,-12},{-72,-12}},
              color={0,0,127}));

          for i in 1:4 loop
            connect(z1[i].products[2], H) annotation (Line(
              points={{-21.5,34},{-21.5,28},{-4,28},{-4,96},{88,96},{88,86},{100,
                  86}},
              color={107,45,134},
              thickness=1));
          connect(z2[i].products[2], H) annotation (Line(
              points={{64.5,34},{64.5,28},{-4,28},{-4,96},{88,96},{88,86},{100,86}},
              color={107,45,134},
              thickness=1));

          connect(c1[i].products[2], H) annotation (Line(
              points={{-21.5,-44},{-21.5,-50},{-4,-50},{-4,96},{88,96},{88,86},{
                  100,86}},
              color={107,45,134},
              thickness=1));
          connect(c2[i].products[2], H) annotation (Line(
              points={{64.5,-44},{64.5,-50},{-4,-50},{-4,96},{88,96},{88,86},{100,
                  86}},
              color={107,45,134},
              thickness=1));

            connect(H, h2[i].products[2]) annotation (Line(
              points={{100,86},{88,86},{88,96},{-4,96},{-4,8.5},{12,8.5}},
              color={107,45,134},
              thickness=1));

            connect(CO2, c2[i].substrates[2]) annotation (Line(
              points={{100,-60},{88,-60},{88,-20},{64.5,-20},{64.5,-24}},
              color={107,45,134},
              thickness=1));
          connect(CO2, c1[i].substrates[2]) annotation (Line(
              points={{100,-60},{88,-60},{88,-20},{-21.5,-20},{-21.5,-24}},
              color={107,45,134},
              thickness=1));
          end for;
          connect(Hb_tn.specificSubunitForm, Hbu_A_NH2.q_out) annotation (Line(
              points={{-64,-2},{-64,8},{-22,8}},
              color={107,45,134},
              thickness=1));
          connect(tHb_u, Hb_tn.amount) annotation (Line(
              points={{-100,-78},{-64,-78},{-64,-20}},
              color={0,0,127}));

          connect(Hb_tn.internalHeat, internalHeat) annotation (Line(
              points={{-58,-20},{-58,-98},{-100,-98}},
              color={0,0,127}));

          connect(Hbu_A_NH3.internalHeat, totalHeats.u[1]) annotation (Line(
              points={{-10.4,76},{-44,76},{-44,33.6667},{-52,33.6667}},
              color={0,0,127}));
          connect(Hbu_AH_NH3.internalHeat, totalHeats.u[2]) annotation (Line(
              points={{75.6,76},{-2,76},{-2,33},{-52,33}},
              color={0,0,127}));
          connect(Hbu_A_NH2.internalHeat, totalHeats.u[3]) annotation (Line(
              points={{-10.4,4},{-44,4},{-44,32.3333},{-52,32.3333}},
              color={0,0,127}));
          connect(Hbu_AH_NH2.internalHeat, totalHeats.u[4]) annotation (Line(
              points={{75.6,4},{-2,4},{-2,31.6667},{-52,31.6667}},
              color={0,0,127}));
          connect(Hbu_A_NHCOO.internalHeat, totalHeats.u[5]) annotation (Line(
              points={{-10.4,-78},{-44,-78},{-44,31},{-52,31}},
              color={0,0,127}));
          connect(Hbu_AH_NHCOO.internalHeat, totalHeats.u[6]) annotation (Line(
              points={{75.6,-78},{-2,-78},{-2,30.3333},{-52,30.3333}},
              color={0,0,127}));
          connect(totalHeats.y, Hb_tn.subunitInternalHeat) annotation (Line(
              points={{-75,32},{-76,32},{-76,-6},{-72,-6}},
              color={0,0,127}));
        annotation ( Documentation(revisions="<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>",   info="<html>

<p>[1] Mateják M, Kulhánek T, Matouaek S. Adair-Based Hemoglobin Equilibrium with Oxygen, Carbon Dioxide and Hydrogen Ion Activity. Scandinavian Journal of Clinical &AMP; Laboratory Investigation; 2015</p>

<p>[2] Bauer C, Schr&ouml;der E. Carbamino compounds of haemoglobin in human adult and foetal blood. The Journal of physiology 1972;227:457-71.</p>

<p>[3] Siggaard-Andersen O. Oxygen-Linked Hydrogen Ion Binding of Human Hemoglobin. Effects of Carbon Dioxide and 2, 3-Diphosphoglycerate I. Studies on Erythrolysate. Scandinavian Journal of Clinical &AMP; Laboratory Investigation 1971;27:351-60.</p>

</html>"));
        end Hemoglobin_MKM_Specie;

        model Hemoglobin_MKM_Adair "Matejak,Kulhanek,Matousek (2014)"
          extends Modelica.Icons.Example;

          constant Real pKzD=7.73,pKcD=7.54,pKhD=7.52;
          constant Real pKzO=7.25,pKcO=8.35,pKhO=6.89;
          constant Types.MolarEnergy dHzD=-51400;
          constant Types.MolarEnergy dHzO=7700;
          constant Types.MolarEnergy dHcD=59100;
          constant Types.MolarEnergy dHcO=-41100;
          constant Types.MolarEnergy dHhD=49000;
          constant Types.MolarEnergy dHhO=-105000;
          constant Types.MolarEnergy dHo=50000;
          constant Types.MolarEnergy dH_HbuDANH2=0;
          // dHhD=0, dHhO=-104000, dHo=12700, dH_HbuDANH2=0;                           // dHhD=48600, dHhO=-104000, dHo=50000, dH_HbuDANH2=0;

          parameter Boolean storeResults=false;
          parameter Boolean loadStarts=true;

          Components.ChemicalReaction K1(
            K=0.0121,
            nS=1,
            nP=2) annotation (Placement(transformation(
                extent={{10,-10},{-10,10}},
                rotation=270,
                origin={-44,68})));
          Components.ChemicalReaction K2(
            K=0.0117,
            nS=1,
            nP=2) annotation (Placement(transformation(
                extent={{10,-10},{-10,10}},
                rotation=270,
                origin={-46,28})));
          Components.ChemicalReaction K3(
            K=0.0871,
            nS=1,
            nP=2) annotation (Placement(transformation(
                extent={{10,-10},{-10,10}},
                rotation=270,
                origin={-48,-18})));
          Components.ChemicalReaction K4(
            K=0.000386,
            nS=1,
            nP=2) annotation (Placement(transformation(
                extent={{10,-10},{-10,10}},
                rotation=270,
                origin={-50,-60})));
          Hemoglobin_MKM_Specie Hb0(
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
          Hemoglobin_MKM_Specie Hb1(
            pKz=cat(    1,
                        fill(pKzD, 3),
                        fill(pKzO, 1)),
            pKc=cat(    1,
                        fill(pKcD, 3),
                        fill(pKcO, 1)),
            pKh=cat(    1,
                        fill(pKhD, 3),
                        fill(pKhO, 1)),
            dH_HbuANH2(displayUnit="kJ/mol") = cat(
                      1,
                      fill(dH_HbuDANH2, 3),
                      fill(dH_HbuDANH2 - dHo, 1)),
            dHz(displayUnit="kJ/mol") = cat(
                      1,
                      fill(dHzD, 3),
                      fill(dHzO, 1)),
            dHc(displayUnit="kJ/mol") = cat(
                      1,
                      fill(dHcD, 3),
                      fill(dHcO, 1)),
            dHh(displayUnit="kJ/mol") = cat(
                      1,
                      fill(dHhD, 3),
                      fill(dHhO, 1)),
            storeState=storeResults,
            loadStarts=loadStarts)
            annotation (Placement(transformation(extent={{-24,40},{-4,60}})));
          Hemoglobin_MKM_Specie Hb2(
            pKz=cat(    1,
                        fill(pKzD, 2),
                        fill(pKzO, 2)),
            pKc=cat(    1,
                        fill(pKcD, 2),
                        fill(pKcO, 2)),
            pKh=cat(    1,
                        fill(pKhD, 2),
                        fill(pKhO, 2)),
            dH_HbuANH2(displayUnit="kJ/mol") = cat(
                      1,
                      fill(dH_HbuDANH2, 2),
                      fill(dH_HbuDANH2 - dHo, 2)),
            dHz(displayUnit="kJ/mol") = cat(
                      1,
                      fill(dHzD, 2),
                      fill(dHzO, 2)),
            dHc(displayUnit="kJ/mol") = cat(
                      1,
                      fill(dHcD, 2),
                      fill(dHcO, 2)),
            dHh(displayUnit="kJ/mol") = cat(
                      1,
                      fill(dHhD, 2),
                      fill(dHhO, 2)),
            storeState=storeResults,
            loadStarts=loadStarts)
            annotation (Placement(transformation(extent={{-24,0},{-4,20}})));
          Hemoglobin_MKM_Specie Hb3(
            pKz=cat(    1,
                        fill(pKzD, 1),
                        fill(pKzO, 3)),
            pKc=cat(    1,
                        fill(pKcD, 1),
                        fill(pKcO, 3)),
            pKh=cat(    1,
                        fill(pKhD, 1),
                        fill(pKhO, 3)),
            dH_HbuANH2(displayUnit="kJ/mol") = cat(
                      1,
                      fill(dH_HbuDANH2, 1),
                      fill(dH_HbuDANH2 - dHo, 3)),
            dHz(displayUnit="kJ/mol") = cat(
                      1,
                      fill(dHzD, 1),
                      fill(dHzO, 3)),
            dHc(displayUnit="kJ/mol") = cat(
                      1,
                      fill(dHcD, 1),
                      fill(dHcO, 3)),
            dHh(displayUnit="kJ/mol") = cat(
                      1,
                      fill(dHhD, 1),
                      fill(dHhO, 3)),
            storeState=storeResults,
            loadStarts=loadStarts)
            annotation (Placement(transformation(extent={{-24,-44},{-4,-24}})));
          Hemoglobin_MKM_Specie Hb4(
            pKz=fill(pKzO, 4),
            pKc=fill(pKcO, 4),
            pKh=fill(pKhO, 4),
            dH_HbuANH2(displayUnit="kJ/mol") = fill(dH_HbuDANH2 - dHo, 4),
            dHz(displayUnit="kJ/mol") = fill(dHzO, 4),
            dHc(displayUnit="kJ/mol") = fill(dHcO, 4),
            dHh(displayUnit="kJ/mol") = fill(dHhO, 4),
            storeState=storeResults,
            loadStarts=loadStarts)
            annotation (Placement(transformation(extent={{-24,-88},{-4,-68}})));
          Sources.UnlimitedGasStorage CO2(
            Simulation=ObsoleteTypes.SimulationType.SteadyState,
            isIsolatedInSteadyState=false,
            PartialPressure=0)
            annotation (Placement(transformation(extent={{96,72},{76,92}})));
          Sources.UnlimitedSolutionStorage pH(
            Simulation=ObsoleteTypes.SimulationType.SteadyState,
            isIsolatedInSteadyState=false,
            Conc(displayUnit="mol/l") = 10^(-7 + 3)) annotation (Placement(
                transformation(
                extent={{-10,-10},{10,10}},
                rotation=180,
                origin={34,82})));
          SteadyStates.Components.MolarConservationLaw totalHemoglobin(
            n=5,
            Total(displayUnit="mol") = 1,
            Simulation=ObsoleteTypes.SimulationType.SteadyState)
            annotation (Placement(transformation(extent={{44,6},{64,26}})));
          Modelica.Blocks.Math.Sum sO2(nin=4, k={4/4,3/4,2/4,1/4})
            annotation (Placement(transformation(extent={{62,-30},{82,-10}})));
          Components.Substance oxygen_unbound(Simulation=ObsoleteTypes.SimulationType.SteadyState,
              solute_start=1e-08)
            annotation (Placement(transformation(extent={{-94,-28},{-74,-8}})));
          Modelica.Blocks.Sources.Clock clock(offset=10)
            annotation (Placement(transformation(extent={{-10,-10},{10,10}},
                rotation=270,
                origin={-84,70})));
          Sources.UnlimitedGasStorage oxygen_in_air(
            Simulation=ObsoleteTypes.SimulationType.SteadyState,
            isIsolatedInSteadyState=false,
            PartialPressure(displayUnit="Pa") = 10,
            usePartialPressureInput=true,
            T=310.15) annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={-84,34})));
          Components.GasSolubility partialPressure1(
            kH_T0(displayUnit="(mmol/l)/kPa at 25degC") = 0.026029047188736,
            C=1700,
            T=310.15) annotation (Placement(transformation(extent={{-10,-10},{
                    10,10}}, origin={-84,6})));
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
          Components.GasSolubility partialPressure2(
            T=310.15,
            kH_T0(displayUnit="(mmol/l)/kPa at 25degC") = 0.60734443440384,
            C=2400) annotation (Placement(transformation(extent={{-10,-10},{10,
                    10}}, origin={68,62})));
          Components.Substance CO2_unbound(Simulation=ObsoleteTypes.SimulationType.SteadyState,
              solute_start=0.0012)
            annotation (Placement(transformation(extent={{58,30},{78,50}})));
        equation
          connect(oxygen_unbound.q_out, K2.products[1]) annotation (Line(
              points={{-84,-18},{-62,-18},{-62,42},{-46,42},{-46,38},{-46.5,38}},
              color={107,45,134},
              thickness=1));
          connect(oxygen_unbound.q_out, K3.products[1]) annotation (Line(
              points={{-84,-18},{-62,-18},{-62,0},{-48.5,0},{-48.5,-8}},
              color={107,45,134},
              thickness=1));
          connect(K1.products[1], oxygen_unbound.q_out) annotation (Line(
              points={{-44.5,78},{-44.5,80},{-62,80},{-62,-18},{-84,-18}},
              color={107,45,134},
              thickness=1));
          connect(oxygen_unbound.q_out, K4.products[1]) annotation (Line(
              points={{-84,-18},{-62,-18},{-62,-44},{-50.5,-44},{-50.5,-50}},
              color={107,45,134},
              thickness=1));

          connect(CO2_unbound.q_out, Hb0.CO2) annotation (Line(
              points={{68,40},{4,40},{4,82},{-4,82}},
              color={107,45,134},
              thickness=1));
          connect(Hb0.H, pH.q_out) annotation (Line(
              points={{-4,96.6},{10,96.6},{10,82},{24,82}},
              color={107,45,134},
              thickness=1));
          connect(Hb1.H, Hb0.H) annotation (Line(
              points={{-4,58.6},{10,58.6},{10,96.6},{-4,96.6}},
              color={107,45,134},
              thickness=1));
          connect(Hb3.H, Hb0.H) annotation (Line(
              points={{-4,-25.4},{10,-25.4},{10,96.6},{-4,96.6}},
              color={107,45,134},
              thickness=1));
          connect(Hb4.H, Hb0.H) annotation (Line(
              points={{-4,-69.4},{10,-69.4},{10,96.6},{-4,96.6}},
              color={107,45,134},
              thickness=1));
          connect(Hb2.H, Hb0.H) annotation (Line(
              points={{-4,18.6},{10,18.6},{10,96.6},{-4,96.6}},
              color={107,45,134},
              thickness=1));
          connect(Hb1.CO2, Hb0.CO2) annotation (Line(
              points={{-4,44},{4,44},{4,82},{-4,82}},
              color={107,45,134},
              thickness=1));
          connect(Hb2.CO2, Hb0.CO2) annotation (Line(
              points={{-4,4},{4,4},{4,82},{-4,82}},
              color={107,45,134},
              thickness=1));
          connect(Hb3.CO2, Hb0.CO2) annotation (Line(
              points={{-4,-40},{4,-40},{4,82},{-4,82}},
              color={107,45,134},
              thickness=1));
          connect(Hb4.CO2, Hb0.CO2) annotation (Line(
              points={{-4,-84},{4,-84},{4,82},{-4,82}},
              color={107,45,134},
              thickness=1));
          connect(Hb0.Hbtn, K1.products[2]) annotation (Line(
              points={{-23.8,88},{-43.5,88},{-43.5,78}},
              color={107,45,134},
              thickness=1));
          connect(Hb1.Hbtn, K1.substrates[1]) annotation (Line(
              points={{-23.8,50},{-44,50},{-44,58}},
              color={107,45,134},
              thickness=1));
          connect(Hb1.Hbtn, K2.products[2]) annotation (Line(
              points={{-23.8,50},{-44,50},{-44,38},{-45.5,38}},
              color={107,45,134},
              thickness=1));
          connect(Hb2.Hbtn, K2.substrates[1]) annotation (Line(
              points={{-23.8,10},{-46,10},{-46,18}},
              color={107,45,134},
              thickness=1));
          connect(Hb2.Hbtn, K3.products[2]) annotation (Line(
              points={{-23.8,10},{-46,10},{-46,-8},{-47.5,-8}},
              color={107,45,134},
              thickness=1));
          connect(Hb3.Hbtn, K3.substrates[1]) annotation (Line(
              points={{-23.8,-34},{-48,-34},{-48,-28}},
              color={107,45,134},
              thickness=1));
          connect(Hb3.Hbtn, K4.products[2]) annotation (Line(
              points={{-23.8,-34},{-48,-34},{-48,-50},{-49.5,-50}},
              color={107,45,134},
              thickness=1));
          connect(Hb4.Hbtn, K4.substrates[1]) annotation (Line(
              points={{-23.8,-78},{-50,-78},{-50,-70}},
              color={107,45,134},
              thickness=1));
          connect(Hb4.tHb_u, totalHemoglobin.fragment[1]) annotation (Line(
              points={{-24,-85.8},{-32,-85.8},{-32,-96},{22,-96},{22,10.4},{44,10.4}},
              color={0,0,127}));
          connect(Hb3.tHb_u, totalHemoglobin.fragment[2]) annotation (Line(
              points={{-24,-41.8},{-32,-41.8},{-32,-48},{20,-48},{20,11.2},{44,11.2}},
              color={0,0,127}));
          connect(Hb2.tHb_u, totalHemoglobin.fragment[3]) annotation (Line(
              points={{-24,2.2},{-32,2.2},{-32,-4},{18,-4},{18,12},{44,12}},
              color={0,0,127}));
          connect(Hb1.tHb_u, totalHemoglobin.fragment[4]) annotation (Line(
              points={{-24,42.2},{-28,42.2},{-28,34},{16,34},{16,12.8},{44,12.8}},
              color={0,0,127}));
          connect(Hb0.tHb_u, totalHemoglobin.fragment[5]) annotation (Line(
              points={{-24,80.2},{-28,80.2},{-28,64},{18,64},{18,13.6},{44,13.6}},
              color={0,0,127}));

          connect(Hb1.tHb_u, sO2.u[4]) annotation (Line(
              points={{-24,42.2},{-28,42.2},{-28,34},{16,34},{16,-18.5},{60,-18.5}},
              color={0,0,127}));
          connect(Hb2.tHb_u, sO2.u[3]) annotation (Line(
              points={{-24,2.2},{-32,2.2},{-32,2},{-32,2},{-32,-4},{18,-4},{18,-19.5},{60,
                  -19.5}},
              color={0,0,127}));

          connect(Hb3.tHb_u, sO2.u[2]) annotation (Line(
              points={{-24,-41.8},{-32,-41.8},{-32,-48},{20,-48},{20,-20.5},{60,-20.5}},
              color={0,0,127}));
          connect(Hb4.tHb_u, sO2.u[1]) annotation (Line(
              points={{-24,-85.8},{-32,-85.8},{-32,-96},{22,-96},{22,-21.5},{60,-21.5}},
              color={0,0,127}));
          connect(partialPressure1.q_out,oxygen_in_air. q_out)
                                                    annotation (Line(
              points={{-84,16},{-84,24}},
              color={107,45,134},
              thickness=1));
          connect(partialPressure1.q_in,oxygen_unbound. q_out) annotation (Line(
              points={{-84,-2},{-84,-18}},
              color={107,45,134},
              thickness=1));
          connect(Hb0.internalHeat, internalHeat.u[1]) annotation (Line(
              points={{-24,78.2},{-24,66},{34,66},{34,-53.6},{42,-53.6}},
              color={0,0,127}));
          connect(Hb1.internalHeat, internalHeat.u[2]) annotation (Line(
              points={{-24,40.2},{-26,40.2},{-26,36},{34,36},{34,-52.8},{42,-52.8}},
              color={0,0,127}));
          connect(Hb2.internalHeat, internalHeat.u[3]) annotation (Line(
              points={{-24,0.2},{-28,0.2},{-28,-2},{34,-2},{34,-52},{42,-52}},
              color={0,0,127}));
          connect(Hb3.internalHeat, internalHeat.u[4]) annotation (Line(
              points={{-24,-43.8},{-28,-43.8},{-28,-46},{34,-46},{34,-51.2},{42,
                  -51.2}},
              color={0,0,127}));
          connect(Hb4.internalHeat, internalHeat.u[5]) annotation (Line(
              points={{-24,-87.8},{-28,-87.8},{-28,-90},{34,-90},{34,-52},{42,-52},
                  {42,-50.4}},
              color={0,0,127}));
          connect(gain.u, sO2.y) annotation (Line(
              points={{37.2,-88},{34,-88},{34,-96},{98,-96},{98,-20},{83,-20}},
              color={0,0,127}));
          connect(internalHeat.y, der1.u) annotation (Line(
              points={{65,-52},{68,-52},{68,-66},{48,-66},{48,-76},{51.2,-76}},
              color={0,0,127}));
          connect(gain.y, der2.u) annotation (Line(
              points={{46.4,-88},{51.2,-88}},
              color={0,0,127}));
          connect(clock.y, oxygen_in_air.partialPressure) annotation (Line(
              points={{-84,59},{-84,44}},
              color={0,0,127}));
          connect(derInternalHeat_per_derO2.u2, der2.y) annotation (Line(
              points={{70,-88},{60.4,-88}},
              color={0,0,127}));
          connect(derInternalHeat_per_derO2.u1, der1.y) annotation (Line(
              points={{70,-76},{60.4,-76}},
              color={0,0,127}));
          connect(CO2_unbound.q_out, partialPressure2.q_in) annotation (Line(
              points={{68,40},{68,54}},
              color={107,45,134},
              thickness=1));
          connect(CO2.q_out, partialPressure2.q_out) annotation (Line(
              points={{76,82},{68,82},{68,72}},
              color={107,45,134},
              thickness=1));
          annotation (           Documentation(info="<html>
<p>Before silumation in &QUOT;Dymola 2014 FD01&QUOT; please set environment variable &QUOT;<code><b>Advanced.Define.NonLinearIterations&nbsp;=&nbsp;3&QUOT;</b></code> and chose &QUOT;Euler&QUOT; method!</p>

<p>[1] Mateják M, Kulhánek T, Matouaek S. Adair-Based Hemoglobin Equilibrium with Oxygen, Carbon Dioxide and Hydrogen Ion Activity. Scandinavian Journal of Clinical &AMP; Laboratory Investigation; 2015</p>

<p>[2] Bauer C, Schr&ouml;der E. Carbamino compounds of haemoglobin in human adult and foetal blood. The Journal of physiology 1972;227:457-71.</p>

<p>[3] Siggaard-Andersen O. Oxygen-Linked Hydrogen Ion Binding of Human Hemoglobin. Effects of Carbon Dioxide and 2, 3-Diphosphoglycerate I. Studies on Erythrolysate. Scandinavian Journal of Clinical &AMP; Laboratory Investigation 1971;27:351-60.</p>

<p>[4] Severinghaus JW. Simple, accurate equations for human blood O2 dissociation computations. Journal of Applied Physiology 1979;46:599-602.</p>
</html>",   revisions="<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
        end Hemoglobin_MKM_Adair;

        package Develop
          extends Modelica.Icons.UnderConstruction;

          model QuaternaryForm
            "Model of hemoglobin space-structure form (can be parametrized as relaxed or tensed)"

            parameter Boolean isDependent = false;

            parameter Types.Concentration KA=10^(-6.89 + 3)
              "dissociation coefficient for acid chains of subunit";
            parameter Types.Concentration Kz=10^(-7.25 + 3)
              "valine 1 amino terminus dissociation coefficient of protonation to NH3+";
            parameter Types.Concentration Kc=10^(-8.35 + 3)
              "valine 1 amino terminus dissociation coefficient of protonation to NH3+";
            parameter Types.Concentration KO2=0.000671946
              "oxygen dissociation coefficient of hemoglobin subunit";

            Components.Speciation Speciation(NumberOfSubunits=12)
              annotation (Placement(transformation(extent={{60,-20},{40,0}})));
            Components.Substance OxyHm[4](
              each solute_start=0,
              each Simulation=ObsoleteTypes.SimulationType.SteadyState,
              isDependent={isDependent,true,true,true})
              "Oxygenated subunit of hemoglobin tetramer" annotation (Placement(
                  transformation(extent={{-90,-68},{-70,-48}})));
            Components.ChemicalReaction oxygenation1[4](each nP=2, each K=KO2)
              annotation (Placement(transformation(extent={{-62,-68},{-42,-48}})));
            Components.Substance DeoxyHm[4](each Simulation=ObsoleteTypes.SimulationType.SteadyState,
                each solute_start=1e-08)
              "Deoxygenated subunit of hemoglobin tetramer" annotation (
                Placement(transformation(extent={{-34,-68},{-14,-48}})));

            Modelica.Blocks.Math.Add add[4] annotation (Placement(transformation(
                  extent={{-4,-4},{4,4}},
                  rotation=270,
                  origin={-58,-80})));
            Interfaces.ChemicalPort_a O2 annotation (Placement(transformation(
                    extent={{-26,-50},{-6,-30}}), iconTransformation(extent={{-26,
                      -50},{-6,-30}})));
            Interfaces.ChemicalPort_a sForm annotation (Placement(
                  transformation(extent={{72,-54},{92,-34}}),
                  iconTransformation(extent={{68,-50},{88,-30}})));
            Interfaces.ChemicalPort_a H "hydrogen ion (proton)" annotation (
                Placement(transformation(extent={{-32,18},{-12,38}}),
                  iconTransformation(extent={{-32,18},{-12,38}})));
            Components.Substance A[4](each Simulation=ObsoleteTypes.SimulationType.SteadyState,
                each solute_start=1e-08)
              "residual acid chains of hemoglobin subunits "
              annotation (Placement(transformation(extent={{-24,-14},{-4,6}})));
            Components.Substance HA[4](
              each solute_start=0,
              each Simulation=ObsoleteTypes.SimulationType.SteadyState,
              each isDependent=true)
              "residual acid chains of hemoglobin subunits " annotation (
                Placement(transformation(extent={{-90,-14},{-70,6}})));
            Components.ChemicalReaction protonation1[4](each nP=2, each K=KA)
              annotation (Placement(transformation(extent={{-62,-14},{-42,6}})));
            Modelica.Blocks.Math.Add add1[
                                         4] annotation (Placement(transformation(
                  extent={{-4,-4},{4,4}},
                  rotation=270,
                  origin={-52,-24})));
            Components.Substance NH2[4](each Simulation=ObsoleteTypes.SimulationType.SteadyState,
                each solute_start=1e-08)
              "Val1 terminal of hemoglobin subunits "
              annotation (Placement(transformation(extent={{-10,52},{10,72}})));
            Components.Substance NH3[4](
              each solute_start=0,
              each Simulation=ObsoleteTypes.SimulationType.SteadyState,
              each isDependent=true) "Val1 terminal of hemoglobin subunits "
              annotation (Placement(transformation(extent={{-86,52},{-66,72}})));
            Components.ChemicalReaction protonation2[4](each nP=2, each K=Kz)
              annotation (Placement(transformation(extent={{-58,52},{-38,72}})));
            Modelica.Blocks.Math.Add3 add2[
                                         4] annotation (Placement(transformation(
                  extent={{-4,-4},{4,4}},
                  rotation=270,
                  origin={0,40})));
            Interfaces.ChemicalPort_a CO2 annotation (Placement(transformation(
                    extent={{-6,76},{14,96}}), iconTransformation(extent={{-6,
                      76},{14,96}})));
            Components.ChemicalReaction carboxylation[4](
              each nP=2,
              each nS=2,
              each K=Kc)
              "Carboxylation of Valin1 amino terminus of hemogloni subunit"
              annotation (Placement(transformation(extent={{36,52},{56,72}})));
            Components.Substance NHCOO[4](each Simulation=ObsoleteTypes.SimulationType.SteadyState,
                each solute_start=1e-08)
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
            Types.RealIO.AmountOfSubstanceOutput protonation
              annotation (Placement(transformation(extent={{-10,-10},{10,10}},
                    origin={100,14}), iconTransformation(extent={{-10,-10},{10,
                      10}}, origin={90,20})));
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
                color={0,0,127}));
            connect(DeoxyHm.solute, add.u1) annotation (Line(
                points={{-24,-68},{-26,-68},{-26,-75.2},{-55.6,-75.2}},
                color={0,0,127}));
            connect(OxyHm.q_out, oxygenation1.substrates[1]) annotation (Line(
                points={{-80,-58},{-62,-58}},
                color={107,45,134},
                thickness=1));
            connect(oxygenation1.products[1], DeoxyHm.q_out) annotation (Line(
                points={{-42,-58.5},{-34,-58.5},{-34,-58},{-24,-58}},
                color={107,45,134},
                thickness=1));
            connect(Speciation.specificForm, sForm) annotation (Line(
                points={{40,-18},{40,-44},{82,-44}},
                color={107,45,134},
                thickness=1));
            connect(oxygenation1[1].products[2], O2) annotation (Line(
                points={{-42,-57.5},{-36,-57.5},{-36,-40},{-16,-40}},
                color={107,45,134},
                thickness=1));
            connect(oxygenation1[2].products[2], O2) annotation (Line(
                points={{-42,-57.5},{-36,-57.5},{-36,-40},{-16,-40}},
                color={107,45,134},
                thickness=1));
            connect(oxygenation1[3].products[2], O2) annotation (Line(
                points={{-42,-57.5},{-36,-57.5},{-36,-40},{-16,-40}},
                color={107,45,134},
                thickness=1));
            connect(oxygenation1[4].products[2], O2) annotation (Line(
                points={{-42,-57.5},{-36,-57.5},{-36,-40},{-16,-40}},
                color={107,45,134},
                thickness=1));
            connect(HA.q_out, protonation1.substrates[1]) annotation (Line(
                points={{-80,-4},{-62,-4}},
                color={107,45,134},
                thickness=1));
            connect(protonation1.products[1], A.q_out) annotation (Line(
                points={{-42,-4.5},{-42,-4},{-14,-4}},
                color={107,45,134},
                thickness=1));
            connect(H, protonation1[1].products[2]) annotation (Line(
                points={{-22,28},{-32,28},{-32,-3.5},{-42,-3.5}},
                color={107,45,134},
                thickness=1));
            connect(protonation1[2].products[2], H) annotation (Line(
                points={{-42,-3.5},{-32,-3.5},{-32,28},{-22,28}},
                color={107,45,134},
                thickness=1));
            connect(protonation1[3].products[2], H) annotation (Line(
                points={{-42,-3.5},{-32,-3.5},{-32,28},{-22,28}},
                color={107,45,134},
                thickness=1));
            connect(protonation1[4].products[2], H) annotation (Line(
                points={{-42,-3.5},{-32,-3.5},{-32,28},{-22,28}},
                color={107,45,134},
                thickness=1));
            connect(HA.solute, add1.u2) annotation (Line(
                points={{-80,-14},{-80,-19.2},{-54.4,-19.2}},
                color={0,0,127}));
            connect(A.solute, add1.u1) annotation (Line(
                points={{-14,-14},{-14,-16},{-49.6,-16},{-49.6,-19.2}},
                color={0,0,127}));
            connect(DeoxyHm.q_out, Speciation.specificSubunitForm[1:4])
              annotation (Line(
                points={{-24,-58},{-24,-52},{28,-52},{28,0},{50,0},{50,-0.416667}},
                color={107,45,134},
                thickness=1));

            connect(A.q_out, Speciation.specificSubunitForm[5:8]) annotation (
                Line(
                points={{-14,-4},{-14,0.25},{50,0.25}},
                color={107,45,134},
                thickness=1));
            connect(add.y, Speciation.amountOfSubunit[1:4]) annotation (Line(
                points={{-58,-84.4},{-58,-86},{14,-86},{14,-10.8333},{42,-10.8333}},
                color={0,0,127}));

            connect(add1.y, Speciation.amountOfSubunit[5:8]) annotation (Line(
                points={{-52,-28.4},{-52,-28},{12,-28},{12,-9.5},{42,-9.5}},
                color={0,0,127}));
            connect(NH3.q_out, protonation2.substrates[1]) annotation (Line(
                points={{-76,62},{-58,62}},
                color={107,45,134},
                thickness=1));
            connect(protonation2.products[1], NH2.q_out) annotation (Line(
                points={{-38,61.5},{0,61.5},{0,62}},
                color={107,45,134},
                thickness=1));
            connect(H, protonation2[1].products[2]) annotation (Line(
                points={{-22,28},{-22,62.5},{-38,62.5}},
                color={107,45,134},
                thickness=1));
            connect(protonation2[2].products[2], H) annotation (Line(
                points={{-38,62.5},{-22,62.5},{-22,28}},
                color={107,45,134},
                thickness=1));
            connect(protonation2[3].products[2], H) annotation (Line(
                points={{-38,62.5},{-22,62.5},{-22,28}},
                color={107,45,134},
                thickness=1));
            connect(protonation2[4].products[2], H) annotation (Line(
                points={{-38,62.5},{-22,62.5},{-22,28}},
                color={107,45,134},
                thickness=1));
            connect(add2.y, Speciation.amountOfSubunit[9:12]) annotation (Line(
                points={{0,35.6},{0,32},{12,32},{12,-8.16667},{42,-8.16667}},
                color={0,0,127}));
            connect(NH2.q_out, Speciation.specificSubunitForm[9:12]) annotation (
                Line(
                points={{0,62},{0,58},{28,58},{28,0.916667},{50,0.916667}},
                color={107,45,134},
                thickness=1));
            connect(NH2.q_out, carboxylation.substrates[1]) annotation (Line(
                points={{0,62},{0,61.5},{36,61.5}},
                color={107,45,134},
                thickness=1));
            connect(carboxylation.products[1], NHCOO.q_out) annotation (Line(
                points={{56,61.5},{76,61.5},{76,62}},
                color={107,45,134},
                thickness=1));
            connect(carboxylation[1].products[2], H) annotation (Line(
                points={{56,62.5},{62,62.5},{62,28},{-22,28}},
                color={107,45,134},
                thickness=1));
            connect(carboxylation[1].substrates[2], CO2) annotation (Line(
                points={{36,62.5},{26,62.5},{26,86},{4,86}},
                color={107,45,134},
                thickness=1));
            connect(carboxylation[2].products[2], H) annotation (Line(
                points={{56,62.5},{62,62.5},{62,28},{-22,28}},
                color={107,45,134},
                thickness=1));
            connect(carboxylation[2].substrates[2], CO2) annotation (Line(
                points={{36,62.5},{26,62.5},{26,86},{4,86}},
                color={107,45,134},
                thickness=1));
            connect(carboxylation[3].products[2], H) annotation (Line(
                points={{56,62.5},{62,62.5},{62,28},{-22,28}},
                color={107,45,134},
                thickness=1));
            connect(carboxylation[3].substrates[2], CO2) annotation (Line(
                points={{36,62.5},{26,62.5},{26,86},{4,86}},
                color={107,45,134},
                thickness=1));
            connect(carboxylation[4].products[2], H) annotation (Line(
                points={{56,62.5},{62,62.5},{62,28},{-22,28}},
                color={107,45,134},
                thickness=1));
            connect(carboxylation[4].substrates[2], CO2) annotation (Line(
                points={{36,62.5},{26,62.5},{26,86},{4,86}},
                color={107,45,134},
                thickness=1));
            connect(NH3.solute, add2.u3) annotation (Line(
                points={{-76,52},{-76,44.8},{-3.2,44.8}},
                color={0,0,127}));
            connect(NH2.solute, add2.u2) annotation (Line(
                points={{0,52},{0,44.8}},
                color={0,0,127}));
            connect(NHCOO.solute, add2.u1) annotation (Line(
                points={{76,52},{76,44.8},{3.2,44.8}},
                color={0,0,127}));
            connect(Speciation.amount, tAmount) annotation (Line(
                points={{50,-18},{50,-86}},
                color={0,0,127}));
            connect(HA.solute, add3.u[9:12]) annotation (Line(
                points={{-80,-14},{-80,-20},{-98,-20},{-98,14.7333},{77.2,14.7333}},
                color={0,0,127}));
            connect(NH3.solute, add3.u[5:8]) annotation (Line(
                points={{-76,52},{-76,14.2},{77.2,14.2}},
                color={0,0,127}));
            connect(NHCOO.solute, add3.u[1:4]) annotation (Line(
                points={{76,52},{76,13.6667},{77.2,13.6667}},
                color={0,0,127}));
            connect(add3.y, protonation) annotation (Line(
                points={{86.4,14},{100,14}},
                color={0,0,127}));
            connect(OxyHm.solute, add4.u) annotation (Line(
                points={{-80,-68},{-80,-81.2}},
                color={0,0,127}));
            connect(add4.y, oxygenation) annotation (Line(
                points={{-80,-90.4},{-80,-110}},
                color={0,0,127}));
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
</html>",     info="<html>
<p>[1] Morrow J, Matthew J, Wittebort R, Gurd F. Carbon 13 resonances of 13CO2 carbamino adducts of alpha and beta chains in human adult hemoglobin. Journal of Biological Chemistry 1976;251:477-84.</p>
<p>[2] Bauer C, Schr&ouml;der E. Carbamino compounds of haemoglobin in human adult and foetal blood. The Journal of physiology 1972;227:457-71.</p>
<p>[3] Antonini E, Wyman J, Brunori M, Fronticelli C, Bucci E, Rossi-Fanelli A. Studies on the relations between molecular and functional properties of hemoglobin V. The influence of temperature on the Bohr effect in human and in horse hemoglobin. Journal of Biological Chemistry 1965;240:1096-103.</p>
</html>"),    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
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

            extends SteadyStates.Interfaces.SteadyStateSystem(Simulation=
                  ObsoleteTypes.SimulationType.SteadyState);

          //  parameter GasSolubility alpha =  0.0105 * 1e-3 "oxygen solubility in plasma";   // by Siggaard Andersen: 0.0105 (mmol/l)/kPa

            parameter Types.Fraction L=7.0529*10^6
              "=[T0]/[R0] .. dissociation constant of relaxed <-> tensed change of deoxyhemoglobin tetramer";
            parameter Types.Fraction Ln=26884.8
              "quaternaly form ratio for specific stripped species of hemoglobin tetramer";
                                           //L*0.00381188                                                                     //"=L*(fnT/fnR)^4 for pH=7.2464 and CO2=0";
            parameter Types.Fraction c=0.00431555
              "=KR/KT .. ration between oxygen affinities of relaxed vs. tensed subunit";
            parameter Types.Concentration KR=0.000671946
              "oxygen dissociation on relaxed(R) hemoglobin subunit";
                                                                        //*7.875647668393782383419689119171e-5
                                                                      //10.500001495896 7.8756465463794e-05

            parameter Types.Concentration KT=KR/c
              "oxygen dissociation on tensed(T) hemoglobin subunit";

            parameter Types.AmountOfSubstance totalAmountOfHemoglobin=
                0.001;

            Components.ChemicalReaction quaternaryForm(K=Ln)
              annotation (Placement(transformation(extent={{-16,26},{4,46}})));

            QuaternaryForm R(
              KO2=KR,
              KA=10^(-6.89 + 3),
              Kz=10^(-7.25 + 3),
              Kc=10^(-8.35 + 3),
              isDependent=true) annotation (Placement(transformation(extent={{-40,
                      30},{-20,50}})));
            QuaternaryForm T(
              KO2=KT,
              KA=10^(-7.52 + 3),
              Kz=10^(-7.73 + 3),
              Kc=10^(-7.54 + 3))
              annotation (Placement(transformation(extent={{32,30},{12,50}})));
            SteadyStates.Components.MolarConservationLaw totalHb(
              n=2,
              Total=totalAmountOfHemoglobin,
              Simulation=ObsoleteTypes.SimulationType.SteadyState) annotation (
                Placement(transformation(
                  extent={{-10,-10},{10,10}},
                  rotation=270,
                  origin={0,2})));
            Interfaces.ChemicalPort_a H "H+ (proton)" annotation (Placement(
                  transformation(extent={{6,66},{26,86}}), iconTransformation(
                    extent={{90,90},{110,110}})));
            Interfaces.ChemicalPort_a CO2 "carbon dioxide" annotation (
                Placement(transformation(extent={{-22,54},{-2,74}}),
                  iconTransformation(extent={{14,40},{34,60}})));
            Interfaces.ChemicalPort_a O2 "oxygen" annotation (Placement(
                  transformation(extent={{-54,78},{-34,98}}),
                  iconTransformation(extent={{90,-10},{110,10}})));
            Types.RealIO.FractionOutput protonation annotation (
                Placement(transformation(extent={{-10,-10},{10,10}}, origin={
                      100,-40}), iconTransformation(
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
            Types.RealIO.FractionOutput sO2 annotation (Placement(
                  transformation(extent={{90,-90},{110,-70}})));
          equation

            connect(R.CO2, CO2) annotation (Line(
                points={{-29.6,48.6},{-29.6,64},{-12,64}},
                color={107,45,134},
                thickness=1));
            connect(CO2, T.CO2) annotation (Line(
                points={{-12,64},{22,64},{22,48},{21.6,48},{21.6,48.6}},
                color={107,45,134},
                thickness=1));

            connect(R.O2, O2) annotation (Line(
                points={{-31.6,36},{-44,36},{-44,88}},
                color={107,45,134},
                thickness=1));
            connect(R.H, H) annotation (Line(
                points={{-32.2,42.8},{-32.2,42},{-34,42},{-34,76},{16,76}},
                color={107,45,134},
                thickness=1));
            connect(R.sForm, quaternaryForm.substrates[1]) annotation (Line(
                points={{-22.2,36},{-16,36}},
                color={107,45,134},
                thickness=1));
            connect(T.O2, O2) annotation (Line(
                points={{23.6,36},{36,36},{36,88},{-44,88}},
                color={107,45,134},
                thickness=1));
            connect(T.H, H) annotation (Line(
                points={{24.2,42.8},{26,42.8},{26,76},{16,76}},
                color={107,45,134},
                thickness=1));
            connect(T.sForm, quaternaryForm.products[1]) annotation (Line(
                points={{14.2,36},{4,36}},
                color={107,45,134},
                thickness=1));
            connect(R.tAmount, totalHb.fragment[1]) annotation (Line(
                points={{-26,31},{-26,18},{-4,18},{-4,12},{-5,12}},
                color={0,0,127}));
            connect(T.tAmount, totalHb.fragment[2]) annotation (Line(
                points={{18,31},{18,18},{-3,18},{-3,12}},
                color={0,0,127}));
            connect(T.protonation, add.u1) annotation (Line(
                points={{13,42},{13,-32},{15,-32}},
                color={0,0,127}));
            connect(R.protonation, add.u2) annotation (Line(
                points={{-21,42},{-21,-38},{15,-38}},
                color={0,0,127}));
            connect(division.u2, totalHb.totalAmountOfSubstance) annotation (Line(
                points={{40.8,-43.6},{-4,-43.6},{-4,-8}},
                color={0,0,127}));
            connect(division.u1, add.y) annotation (Line(
                points={{40.8,-36.4},{38,-36.4},{38,-35},{26.5,-35}},
                color={0,0,127}));
            connect(protonation, division.y) annotation (Line(
                points={{100,-40},{54.6,-40}},
                color={0,0,127}));
            connect(division1.u1, add1.y) annotation (Line(
                points={{64.8,-76.4},{56,-76.4},{56,-56},{54.6,-56}},
                color={0,0,127}));
            connect(R.oxygenation, add1.u2) annotation (Line(
                points={{-38,31},{-38,-59.6},{40.8,-59.6}},
                color={0,0,127}));
            connect(T.oxygenation, add1.u1) annotation (Line(
                points={{30,31},{30,-52.4},{40.8,-52.4}},
                color={0,0,127}));
            connect(totalHb.totalAmountOfSubstance, division1.u2) annotation (
                Line(
                points={{-4,-8},{-4,-83.6},{64.8,-83.6}},
                color={0,0,127}));
            connect(division1.y, sO2) annotation (Line(
                points={{78.6,-80},{100,-80}},
                color={0,0,127}));
            annotation (             Documentation(revisions="<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>",     info="<html>
<p>[1] Monod J, Wyman J, Changeux J-P. On the nature of allosteric transitions: a plausible model. Journal of Molecular Biology 1965;12:88-118.</p>
</html>"));
          end Hemoglobin2;

          model Hemoglobin_oxygenation "Hemoglobin oxygenation experiment"

            import Physiolibrary.Types.*;

           extends Modelica.Icons.Example;

            Components.Substance oxygen_unbound(Simulation=ObsoleteTypes.SimulationType.SteadyState,
                solute_start=0.000001*7.875647668393782383419689119171e-5)
              annotation (Placement(transformation(extent={{-4,-2},{16,18}})));
            Modelica.Blocks.Sources.Clock clock(offset=1e-06)
              annotation (Placement(transformation(extent={{-40,74},{-20,94}})));
            Sources.UnlimitedGasStorage oxygen_in_air(
              Simulation=ObsoleteTypes.SimulationType.SteadyState,
              usePartialPressureInput=true,
              T=310.15,
              isIsolatedInSteadyState=false) annotation (Placement(
                  transformation(
                  extent={{-10,-10},{10,10}},
                  rotation=270,
                  origin={6,60})));
            Components.GasSolubility partialPressure1(
              kH_T0(displayUnit="(mmol/l)/kPa at 25degC") = 0.026029047188736,
              T=310.15,
              C=1700) annotation (Placement(transformation(extent={{-10,-10},{
                      10,10}}, origin={6,32})));
            Sources.UnlimitedSolutionStorage pH(
              q_out(conc(nominal=10^(-7.4 + 3))),
              Simulation=ObsoleteTypes.SimulationType.SteadyState,
              Conc=10^(-7.2464 + 3),
              isIsolatedInSteadyState=false) annotation (Placement(
                  transformation(
                  extent={{-10,-10},{10,10}},
                  rotation=180,
                  origin={62,-10})));
            Sources.UnlimitedGasStorage CO2_gas(Simulation=ObsoleteTypes.SimulationType.SteadyState,
                PartialPressure=5332.8954966) annotation (Placement(
                  transformation(
                  extent={{-10,-10},{10,10}},
                  rotation=270,
                  origin={-34,56})));
            Components.GasSolubility gasSolubility(C=2400, kH_T0(displayUnit=
                    "(mmol/l)/kPa at 25degC") = 0.81805576878885) annotation (
                Placement(transformation(extent={{-44,20},{-24,40}})));
            Components.Substance CO2_liquid(Simulation=ObsoleteTypes.SimulationType.SteadyState,
                isDependent=true) annotation (Placement(transformation(extent={
                      {-44,-4},{-24,16}})));
            Hemoglobin2 hemoglobin annotation (Placement(transformation(extent=
                      {{-26,-74},{-6,-54}})));
          equation

            connect(partialPressure1.q_out, oxygen_in_air.q_out)
                                                      annotation (Line(
                points={{6,42},{6,50}},
                color={107,45,134},
                thickness=1));
            connect(partialPressure1.q_in, oxygen_unbound.q_out) annotation (Line(
                points={{6,24},{6,8}},
                color={107,45,134},
                thickness=1));
            connect(clock.y, oxygen_in_air.partialPressure) annotation (Line(
                points={{-19,84},{6,84},{6,70}},
                color={0,0,127}));
            connect(gasSolubility.q_in,CO2_liquid. q_out) annotation (Line(
                points={{-34,22},{-34,6}},
                color={107,45,134},
                thickness=1));
            connect(CO2_gas.q_out,gasSolubility. q_out) annotation (Line(
                points={{-34,46},{-34,40}},
                color={107,45,134},
                thickness=1));
            connect(hemoglobin.CO2, CO2_liquid.q_out) annotation (Line(
                points={{-13.6,-59},{-13.6,-23.5},{-34,-23.5},{-34,6}},
                color={107,45,134},
                thickness=1));
            connect(hemoglobin.H, pH.q_out) annotation (Line(
                points={{-6,-54},{26,-54},{26,-10},{52,-10}},
                color={107,45,134},
                thickness=1));
            connect(hemoglobin.O2, oxygen_unbound.q_out) annotation (Line(
                points={{-6,-64},{-10,-64},{-10,8},{6,8}},
                color={107,45,134},
                thickness=1));
            annotation (             Documentation(revisions=
                          "<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>",     info="<html>
<p>[1] Severinghaus JW. Simple, accurate equations for human blood O2 dissociation computations. Journal of Applied Physiology 1979;46:599-602.</p>
</html>"));
          end Hemoglobin_oxygenation;

          model Hemoglobin_titration "Hemoglobin titration experiment"

            import Physiolibrary.Types.*;

           extends Modelica.Icons.Example;

           extends SteadyStates.Interfaces.SteadyStateSystem(
                                                    Simulation=ObsoleteTypes.SimulationType.SteadyState);

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

            Components.Substance oxygen_unbound(Simulation=ObsoleteTypes.SimulationType.SteadyState,
                solute_start=0.000001*7.875647668393782383419689119171e-5)
              annotation (Placement(transformation(extent={{-4,-2},{16,18}})));
            Modelica.Blocks.Sources.Clock clock(offset=6.7)
              annotation (Placement(transformation(extent={{30,34},{50,54}})));
            Sources.UnlimitedGasStorage oxygen_in_air(
              Simulation=ObsoleteTypes.SimulationType.SteadyState,
              usePartialPressureInput=false,
              PartialPressure=0,
              T=310.15,
              isIsolatedInSteadyState=false) annotation (Placement(
                  transformation(
                  extent={{-10,-10},{10,10}},
                  rotation=270,
                  origin={6,60})));
            Components.GasSolubility partialPressure1(
              kH_T0(displayUnit="(mmol/l)/kPa at 25degC") = 0.024913516594933,
              T=310.15,
              C=1700) annotation (Placement(transformation(extent={{-10,-10},{
                      10,10}}, origin={6,32})));
            Sources.UnlimitedSolutionStorage pH(
              q_out(conc(nominal=10^(-7.4 + 3))),
              isIsolatedInSteadyState=false,
              Simulation=ObsoleteTypes.SimulationType.SteadyState,
              Conc=10^(-7.2464 + 3),
              useConcentrationInput=true) annotation (Placement(transformation(
                  extent={{-10,-10},{10,10}},
                  rotation=180,
                  origin={62,-10})));
            Sources.UnlimitedGasStorage CO2_gas(
              Simulation=ObsoleteTypes.SimulationType.SteadyState,
              usePartialPressureInput=false,
              PartialPressure=0) annotation (Placement(transformation(
                  extent={{-10,-10},{10,10}},
                  rotation=270,
                  origin={-34,56})));
            Components.GasSolubility gasSolubility(C=2400, kH_T0(displayUnit=
                    "(mmol/l)/kPa at 25degC") = 0.81805576878885) annotation (
                Placement(transformation(extent={{-44,20},{-24,40}})));
            Components.Substance CO2_liquid(Simulation=ObsoleteTypes.SimulationType.SteadyState,
                isDependent=true) annotation (Placement(transformation(extent={
                      {-44,-4},{-24,16}})));
            Hemoglobin2 deoxyhemoglobin annotation (Placement(transformation(
                    extent={{-22,-68},{-2,-48}})));
            Types.RealIO.FractionOutput protonation
              "allosteric-dependent protonation" annotation (Placement(
                  transformation(extent={{68,-76},{88,-56}})));
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
                thickness=1));
            connect(partialPressure1.q_in, oxygen_unbound.q_out) annotation (Line(
                points={{6,24},{6,8}},
                color={107,45,134},
                thickness=1));
            connect(gasSolubility.q_in,CO2_liquid. q_out) annotation (Line(
                points={{-34,22},{-34,6}},
                color={107,45,134},
                thickness=1));
            connect(CO2_gas.q_out,gasSolubility. q_out) annotation (Line(
                points={{-34,46},{-34,40}},
                color={107,45,134},
                thickness=1));
            connect(deoxyhemoglobin.CO2, CO2_liquid.q_out) annotation (Line(
                points={{-9.6,-53},{-9.6,-23.5},{-34,-23.5},{-34,6}},
                color={107,45,134},
                thickness=1));
            connect(clock.y, gain.u) annotation (Line(
                points={{51,44},{60,44}},
                color={0,0,127}));
            connect(gain.y, pow.exponent) annotation (Line(
                points={{83,44},{90,44},{90,42},{89.6,42}},
                color={0,0,127}));
            connect(pH.concentration, toMolPerM3.y) annotation (Line(
                points={{72,-10},{92,-10},{92,1}},
                color={0,0,127}));
            connect(toMolPerM3.u, pow.y) annotation (Line(
                points={{92,24},{92,33.6}},
                color={0,0,127}));
            connect(deoxyhemoglobin.H, pH.q_out) annotation (Line(
                points={{-2,-48},{26,-48},{26,-10},{52,-10}},
                color={107,45,134},
                thickness=1));
            connect(deoxyhemoglobin.O2, oxygen_unbound.q_out) annotation (Line(
                points={{-2,-58},{-6,-58},{-6,8},{6,8}},
                color={107,45,134},
                thickness=1));
            connect(deoxyhemoglobin.protonation, protonation) annotation (Line(
                points={{-20,-67},{-20,-66},{78,-66}},
                color={0,0,127}));
            annotation (             Documentation(revisions=
                          "<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>",     info="<html>
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
                color={0,0,127}));
            connect(dH.u2, hemoglobin_titration5.protonation) annotation (Line(
                points={{-44,24},{-42,24},{-42,-22.6},{-42.2,-22.6}},
                color={0,0,127}));
            connect(hemoglobin_titration1.protonation, dH1.u1) annotation (Line(
                points={{-10.2,63.4},{-10.2,47.7},{-24,47.7},{-24,32}},
                color={0,0,127}));
            connect(dH1.u2, hemoglobin_titration6.protonation) annotation (Line(
                points={{-16,24},{-14,24},{-14,-22.6},{-10.2,-22.6}},
                color={0,0,127}));
            connect(dH2.u2, hemoglobin_titration7.protonation) annotation (Line(
                points={{20,24},{20,-22.6},{17.8,-22.6}},
                color={0,0,127}));
            connect(hemoglobin_titration2.protonation, dH2.u1) annotation (Line(
                points={{17.8,63.4},{17.8,47.7},{12,47.7},{12,32}},
                color={0,0,127}));
            connect(hemoglobin_titration3.protonation, dH3.u1) annotation (Line(
                points={{47.8,63.4},{47.8,46.7},{38,46.7},{38,32}},
                color={0,0,127}));
            connect(dH3.u2, hemoglobin_titration8.protonation) annotation (Line(
                points={{46,24},{47.8,24},{47.8,-22.6}},
                color={0,0,127}));
            connect(hemoglobin_titration4.protonation, dH4.u1) annotation (Line(
                points={{77.8,63.4},{77.8,46.7},{72,46.7},{72,30}},
                color={0,0,127}));
            connect(dH4.u2, hemoglobin_titration9.protonation) annotation (Line(
                points={{80,22},{80,-22.6},{77.8,-22.6}},
                color={0,0,127}));
            annotation (
               Documentation(info=
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
            Simulation=ObsoleteTypes.SimulationType.SteadyState,
            solute_start=10^(-7 + 3)) annotation (Placement(transformation(
                  extent={{-10,-10},{10,10}}, origin={-8,12})));
          SteadyStates.Components.ElementaryChargeConservationLaw
            electroneutrality(
            Simulation=ObsoleteTypes.SimulationType.SteadyState,
            NumberOfParticles=2,
            Total=0,
            Charges={1,-1},
            useTotalInput=true) "strong ion difference of solution"
            annotation (Placement(transformation(extent={{46,-94},{66,-74}})));
          Components.Substance OH(
            q_out(conc(nominal=10^(-7.4 + 3))),
            Simulation=ObsoleteTypes.SimulationType.SteadyState,
            solute_start=10^(-7 + 3),
            isDependent=true) annotation (Placement(transformation(extent={{-10,
                    -10},{10,10}}, origin={-8,-32})));
          Components.Substance H2O(
            q_out(conc(nominal=5.55e+4)),
            Simulation=ObsoleteTypes.SimulationType.SteadyState,
            solute_start(displayUnit="mol") = 1/0.018,
            isDependent=true) annotation (Placement(transformation(extent={{-10,
                    -10},{10,10}}, origin={-82,-12})));
          Components.ChemicalReaction waterDissociation(nP=2,
            s={2},
            K=(1e-8)*((18e-6)^2))
            annotation (Placement(transformation(extent={{-56,-22},{-36,-2}})));
          SteadyStates.Components.MolarConservationLaw tH2O(
            Simulation=ObsoleteTypes.SimulationType.SteadyState,
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
              thickness=1));
          connect(waterDissociation.products[2], H3O.q_out) annotation (Line(
              points={{-36,-11.5},{-26,-11.5},{-26,12},{-8,12}},
              color={107,45,134},
              thickness=1));
          connect(waterDissociation.products[1], OH.q_out) annotation (Line(
              points={{-36,-12.5},{-26,-12.5},{-26,-32},{-8,-32}},
              color={107,45,134},
              thickness=1));
          connect(tH2O.fragment[1], H2O.solute) annotation (Line(
              points={{-48,-69.3333},{-76,-69.3333},{-76,-22}},
              color={0,0,127}));
          connect(OH.solute, tH2O.fragment[2]) annotation (Line(
              points={{-2,-42},{-2,-50},{-76,-50},{-76,-68},{-48,-68}},
              color={0,0,127}));
          connect(H3O.solute, tH2O.fragment[3]) annotation (Line(
              points={{-2,2},{-2,-6},{8,-6},{8,-52},{-72,-52},{-72,-66.6667},{-48,
                  -66.6667}},
              color={0,0,127}));

          connect(SID.y,toColoumn. u) annotation (Line(
              points={{73,84},{100,84},{100,-74},{92,-74}},
              color={0,0,127}));
          connect(toColoumn.y, electroneutrality.total) annotation (Line(
              points={{69,-74},{56,-74},{56,-76}},
              color={0,0,127}));
          connect(H3O.solute, electroneutrality.fragment[1]) annotation (Line(
              points={{-2,2},{-2,-6},{8,-6},{8,-89},{46,-89}},
              color={0,0,127}));
          connect(OH.solute, electroneutrality.fragment[2]) annotation (Line(
              points={{-2,-42},{-2,-87},{46,-87}},
              color={0,0,127}));
          annotation ( Documentation(info="<html>
<p>Self-ionization of water.</p>
<p>Ions difference (SID) in water causes the acidity/basicity, where pH = -log10(aH+). An activity of hydrogen ions aH+ is approximated with concentration (mol/l) of the oxonium cations H3O+.</p>
<pre><b>plotExpression(apply(-log10(WaterSelfIonization.H3O.solute)),&nbsp;false,&nbsp;&QUOT;pH&QUOT;,&nbsp;1);</b></pre>
<p><br>The titration slope der(pH)/der(SID)=1.48e+6 1/(mol/L) at pH=7.4.</p>
</html>",        revisions="<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
        end WaterSelfIonization;

        model CarbonDioxideInWater "CO2 as alone acid-base buffer"
            extends Modelica.Icons.Example;
          Components.Substance HCO3(Simulation=ObsoleteTypes.SimulationType.SteadyState)
            annotation (Placement(transformation(extent={{-18,46},{2,66}})));
          Components.ChemicalReaction HendersonHasselbalch(
            nP=2,
            K=10^(-6.103 + 3),
            nS=1,
            dH(displayUnit="kJ/mol") = 7300)
            annotation (Placement(transformation(extent={{-58,22},{-38,42}})));
          Sources.UnlimitedGasStorage CO2_gas(Simulation=ObsoleteTypes.SimulationType.SteadyState,
              PartialPressure=5332.8954966) annotation (Placement(
                transformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={-80,82})));
          Components.Substance H3O(
            q_out(conc(nominal=10^(-7.4 + 3))),
            Simulation=ObsoleteTypes.SimulationType.SteadyState,
            solute_start=10^(-7 + 3)) annotation (Placement(transformation(
                  extent={{-10,-10},{10,10}}, origin={-8,12})));
          Components.GasSolubility gasSolubility(C=2400, kH_T0(displayUnit="(mmol/l)/kPa at 25degC")=
                 0.81805576878885)
            annotation (Placement(transformation(extent={{-90,46},{-70,66}})));
          Components.Substance CO2_liquid(Simulation=ObsoleteTypes.SimulationType.SteadyState,
              isDependent=true)
            annotation (Placement(transformation(extent={{-90,22},{-70,42}})));
          SteadyStates.Components.ElementaryChargeConservationLaw
            electroneutrality(
            Simulation=ObsoleteTypes.SimulationType.SteadyState,
            useTotalInput=true,
            NumberOfParticles=3,
            Charges={-1,-2,1},
            Total=2894.560197) "strong ion difference of solution"
            annotation (Placement(transformation(extent={{46,-94},{66,-74}})));
          Components.Substance CO3(
            Simulation=ObsoleteTypes.SimulationType.SteadyState,
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
              thickness=1));
          connect(H3O.q_out, HendersonHasselbalch.products[2]) annotation (Line(
              points={{-8,12},{-26,12},{-26,32.5},{-38,32.5}},
              color={107,45,134},
              thickness=1));
          connect(CO2_liquid.q_out, HendersonHasselbalch.substrates[1]) annotation (
             Line(
              points={{-80,32},{-58,32}},
              color={107,45,134},
              thickness=1));
          connect(gasSolubility.q_in, CO2_liquid.q_out) annotation (Line(
              points={{-80,48},{-80,32}},
              color={107,45,134},
              thickness=1));
          connect(CO2_gas.q_out, gasSolubility.q_out) annotation (Line(
              points={{-80,72},{-80,66}},
              color={107,45,134},
              thickness=1));
          connect(HCO3.solute, electroneutrality.fragment[1]) annotation (Line(
              points={{-2,46},{-2,38},{16,38},{16,-89.3333},{46,-89.3333}},
              color={0,0,127}));
          connect(CO3.solute, electroneutrality.fragment[2]) annotation (Line(
              points={{70,46},{70,38},{18,38},{18,-88},{46,-88}},
              color={0,0,127}));
          connect(H3O.solute, electroneutrality.fragment[3]) annotation (Line(
              points={{-2,2},{-2,-6},{22,-6},{22,-86.6667},{46,-86.6667}},
              color={0,0,127}));
          connect(H3O.q_out, c2.products[2]) annotation (Line(
              points={{-8,12},{48,12},{48,56.5},{36,56.5}},
              color={107,45,134},
              thickness=1));
          connect(HCO3.q_out, c2.substrates[1]) annotation (Line(
              points={{-8,56},{16,56}},
              color={107,45,134},
              thickness=1));
          connect(c2.products[1], CO3.q_out) annotation (Line(
              points={{36,55.5},{52,55.5},{52,56},{64,56}},
              color={107,45,134},
              thickness=1));
          connect(SID.y,toColoumn. u) annotation (Line(
              points={{75,84},{100,84},{100,-74},{92,-74}},
              color={0,0,127}));
          connect(electroneutrality.total, toColoumn.y) annotation (Line(
              points={{56,-76},{56,-74},{69,-74}},
              color={0,0,127}));
          annotation ( Documentation(info="<html>
<p>CO2 solution in water without any other acid-base buffers.</p>
<pre><b>plotExpression(apply(-log10(CarbonDioxideInWater.H3O.solute)),&nbsp;false,&nbsp;&QUOT;pH&QUOT;,&nbsp;1);</b></pre>
<p><br>Please note, that OH- (and CO3^-2) can be neglected from electroneutrality calculation, because of very small concentrations (in physiological pH) anyway. </p>
<p>And if SID&GT;0 then also H3O+ can be also neglected from electroneutrality, because only bicarbonate anions HCO3- (or CO3^-2) are needed there to balance the electroneutrality.</p>
<p><br>The partial pressure of CO2 in gas are input parameter. Outputs are an amount of free dissolved CO2 in liquid and an amount of HCO3-.</p>
<p><br>The titration slope der(pH)/der(SID)=17.5 1/(mol/L) at pH=7.4 and pCO2=40 mmHg.</p>
<p><br>Molar heat of formation (aqueous):</p>
<p>CO2:        -413.5 kJ/mol  (gas: -393.5 kJ/mol )</p>
<p>H2O:        -285.8 kJ/mol</p>
<p>HCO3-:        -692.0 kJ/mol</p>
<p>CO3^-2:        -677.1 kJ/mol</p>
<p><br>Enthalphy of reaction H2O + CO2 &LT;-&GT; HCO3- + H+  :         7.3 kJ/mol</p>
<p>Enthalphy of reaction HCO3- &LT;-&GT; CO3^-2 + H+  :        14.9 kJ/mol</p>
</html>",        revisions="<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
        end CarbonDioxideInWater;

        model AlbuminTitration "Figge-Fencl model (22. Dec. 2007)"
          extends Modelica.Icons.Example;

          Components.Substance H3O(
            q_out(conc(nominal=10^(-7.4 + 3))),
            Simulation=ObsoleteTypes.SimulationType.SteadyState,
            solute_start=10^(-7.4 + 3),
            isDependent=true) "hydrogen ions activity" annotation (Placement(
                transformation(extent={{-10,-10},{10,10}}, origin={14,22})));

          SteadyStates.Components.MolarConservationLaw molarConservationLaw[n](
            each n=2,
            each Simulation=ObsoleteTypes.SimulationType.SteadyState,
            each Total=0.00066)
            annotation (Placement(transformation(extent={{44,-6},{64,14}})));
          SteadyStates.Components.ElementaryChargeConservationLaw
            electroneutrality(
            Simulation=ObsoleteTypes.SimulationType.SteadyState,
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

          Components.Substance A[n](
            each Simulation=ObsoleteTypes.SimulationType.SteadyState,
            each isDependent=true,
            each solute_start=0.00033) "deprotonated acid groups"
            annotation (Placement(transformation(extent={{4,-16},{24,4}})));
          Components.ChemicalReaction react[n](each nP=2, K=fill(10.0, n) .^ (-
                pKAs .+ 3))
            annotation (Placement(transformation(extent={{-44,-2},{-24,18}})));

          Components.Substance HA[n](each Simulation=ObsoleteTypes.SimulationType.SteadyState,
              each solute_start=0.00033) "protonated acid groups"
            annotation (Placement(transformation(extent={{-76,-2},{-56,18}})));

        equation
          connect(react.products[1], A.q_out) annotation (Line(
              points={{-24,7.5},{-12,7.5},{-12,-6},{14,-6}},
              color={107,45,134},
              thickness=1));
          for i in 1:n loop
            connect(react[i].products[2], H3O.q_out) annotation (Line(
                points={{-24,8.5},{-14,8.5},{-14,22},{14,22}},
                color={107,45,134},
                thickness=1));
          end for;
          connect(HA.q_out, react.substrates[1]) annotation (Line(
              points={{-66,8},{-44,8}},
              color={107,45,134},
              thickness=1));
          connect(A.solute, molarConservationLaw.fragment[1]) annotation (Line(
              points={{20,-16},{20,-20},{36,-20},{36,-1},{44,-1}},
              color={0,0,127}));
          connect(HA.solute, molarConservationLaw.fragment[2]) annotation (Line(
              points={{-60,-2},{-60,-8},{-78,-8},{-78,36},{36,36},{36,0},{44,0},{
                  44,1}},
              color={0,0,127}));
          connect(SID.y,toColoumn. u) annotation (Line(
              points={{75,86},{100,86},{100,-74},{92,-74}},
              color={0,0,127}));
          connect(HA.solute, electroneutrality.fragment) annotation (Line(
              points={{-60,-2},{-60,-88},{46,-88}},
              color={0,0,127}));
          connect(toColoumn.y, electroneutrality.total) annotation (Line(
              points={{69,-74},{56,-74},{56,-76}},
              color={0,0,127}));
          annotation ( Documentation(revisions="<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>",         info="<html>
<pre><b>plotExpression(apply(-log10(AlbuminTitration.H3O.solute)),&nbsp;false,&nbsp;&QUOT;pH&QUOT;,&nbsp;1);</b></pre>
<p>The titration slope der(pH)/der(SID)=185 1/(mol/L) at pH=7.4 and tAlb=0.66 mmol/l.</p>
<p><br>Data and model is described in</p>
<p><font style=\"color: #222222; \">Jame Figge: Role of non-volatile weak acids (albumin, phosphate and citrate). In: Stewart&apos;s Textbook of Acid-Base, 2nd Edition, John A. Kellum, Paul WG Elbers editors, &nbsp;AcidBase org, 2009, pp. 216-232.</font></p>
</html>"));
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

          Components.Substance H(
            q_out(conc(nominal=10^(-7.4 + 3))),
            Simulation=ObsoleteTypes.SimulationType.SteadyState,
            solute_start=10^(-7.4 + 3),
            isDependent=true) "hydrogen ions activity" annotation (Placement(
                transformation(extent={{-10,-10},{10,10}}, origin={36,-12})));

          Components.Substance H3PO4(
            Simulation=ObsoleteTypes.SimulationType.SteadyState,
            isDependent=true,
            solute_start=1e-08) annotation (Placement(transformation(extent={{-98,
                    -58},{-78,-38}})));
          Components.Substance H2PO4(Simulation=ObsoleteTypes.SimulationType.SteadyState,
              solute_start=0.0005) annotation (Placement(transformation(extent=
                    {{-44,-58},{-24,-38}})));
          Components.Substance HPO4(Simulation=ObsoleteTypes.SimulationType.SteadyState,
              solute_start=0.0006)
            annotation (Placement(transformation(extent={{16,-58},{36,-38}})));
          Components.Substance PO4(Simulation=ObsoleteTypes.SimulationType.SteadyState,
              solute_start=1e-08)
            annotation (Placement(transformation(extent={{72,-58},{92,-38}})));

          Components.ChemicalReaction chemicalReaction(nP=2, K=10^(-1.915 + 3))
            annotation (Placement(transformation(extent={{-70,-58},{-50,-38}})));
          Components.ChemicalReaction chemicalReaction1(nP=2, K=10^(-6.66 + 3))
            annotation (Placement(transformation(extent={{-14,-58},{6,-38}})));
          Components.ChemicalReaction chemicalReaction2(nP=2, K=10^(-11.78 + 3))
            annotation (Placement(transformation(extent={{44,-58},{64,-38}})));
          SteadyStates.Components.MolarConservationLaw tP04(
            each Simulation=ObsoleteTypes.SimulationType.SteadyState,
            each n=4,
            each Total=totalPO4*1)
            annotation (Placement(transformation(extent={{-28,-90},{-8,-70}})));

          SteadyStates.Components.ElementaryChargeConservationLaw
            electroneutrality(
            Simulation=ObsoleteTypes.SimulationType.SteadyState,
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
              thickness=1));
          connect(chemicalReaction.products[1], H2PO4.q_out) annotation (Line(
              points={{-50,-48.5},{-42,-48.5},{-42,-48},{-34,-48}},
              color={107,45,134},
              thickness=1));
          connect(H2PO4.q_out, chemicalReaction1.substrates[1]) annotation (Line(
              points={{-34,-48},{-14,-48}},
              color={107,45,134},
              thickness=1));
          connect(chemicalReaction1.products[1], HPO4.q_out) annotation (Line(
              points={{6,-48.5},{16,-48.5},{16,-48},{26,-48}},
              color={107,45,134},
              thickness=1));
          connect(HPO4.q_out, chemicalReaction2.substrates[1]) annotation (Line(
              points={{26,-48},{44,-48}},
              color={107,45,134},
              thickness=1));
          connect(chemicalReaction2.products[1], PO4.q_out) annotation (Line(
              points={{64,-48.5},{74,-48.5},{74,-48},{82,-48}},
              color={107,45,134},
              thickness=1));
          connect(chemicalReaction.products[2], H.q_out) annotation (Line(
              points={{-50,-47.5},{-44,-47.5},{-44,-32},{36,-32},{36,-12}},
              color={107,45,134},
              thickness=1));
          connect(chemicalReaction1.products[2], H.q_out) annotation (Line(
              points={{6,-47.5},{14,-47.5},{14,-32},{36,-32},{36,-12}},
              color={107,45,134},
              thickness=1));
          connect(chemicalReaction2.products[2], H.q_out) annotation (Line(
              points={{64,-47.5},{72,-47.5},{72,-32},{36,-32},{36,-12}},
              color={107,45,134},
              thickness=1));
          connect(H3PO4.solute, tP04.fragment[1]) annotation (Line(
              points={{-82,-58},{-82,-86},{-28,-86},{-28,-85.5}},
              color={0,0,127}));
          connect(H2PO4.solute, tP04.fragment[2]) annotation (Line(
              points={{-28,-58},{-28,-62},{-64,-62},{-64,-84.5},{-28,-84.5}},
              color={0,0,127}));
          connect(HPO4.solute, tP04.fragment[3]) annotation (Line(
              points={{32,-58},{32,-64},{-50,-64},{-50,-83.5},{-28,-83.5}},
              color={0,0,127}));
          connect(PO4.solute, tP04.fragment[4]) annotation (Line(
              points={{88,-58},{88,-68},{-40,-68},{-40,-82.5},{-28,-82.5}},
              color={0,0,127}));
          connect(H.solute, minusPh.u) annotation (Line(
              points={{42,-22},{42,-26},{54,-26},{54,-10},{62,-10}},
              color={0,0,127}));
          connect(SID.y, toColoumn.u) annotation (Line(
              points={{65,84},{100,84},{100,-86},{96,-86}},
              color={0,0,127}));
          connect(toColoumn.y, electroneutrality.total) annotation (Line(
              points={{73,-86},{70,-86},{70,-76},{58,-76}},
              color={0,0,127}));
          connect(H2PO4.solute, electroneutrality.fragment[1]) annotation (Line(
              points={{-28,-58},{-28,-62},{24,-62},{24,-89.3333},{48,-89.3333}},
              color={0,0,127}));
          connect(HPO4.solute, electroneutrality.fragment[2]) annotation (Line(
              points={{32,-58},{32,-88},{48,-88}},
              color={0,0,127}));
          connect(PO4.solute, electroneutrality.fragment[3]) annotation (Line(
              points={{88,-58},{88,-68},{28,-68},{28,-86.6667},{48,-86.6667}},
              color={0,0,127}));
          annotation ( Documentation(info="<html>
<p>Henderson-Hasselbalch equation in ideal buffered solution, where pH remains constant.</p>
<p>The partial pressure of CO2 in gas are input parameter. Outputs are an amount of free dissolved CO2 in liquid and an amount of HCO3-.</p>
</html>",        revisions="<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
        end Phosphate;

        class Develop
          extends Modelica.Icons.UnderConstruction;
          model PlasmaAcidBase

            Components.Substance H3O(
              q_out(conc(nominal=10^(-7.4 + 3))),
              Simulation=ObsoleteTypes.SimulationType.SteadyState,
              solute_start=10^(-7.4 + 3),
              isDependent=true) "hydrogen ions activity" annotation (Placement(
                  transformation(extent={{-10,-10},{10,10}}, origin={38,40})));

            SteadyStates.Components.MolarConservationLaw tAlb[n](
              each n=2,
              each Simulation=ObsoleteTypes.SimulationType.SteadyState,
              each Total=0.00066) annotation (Placement(transformation(extent={
                      {-40,-10},{-20,10}})));
            SteadyStates.Components.ElementaryChargeConservationLaw
              electroneutrality(
              Simulation=ObsoleteTypes.SimulationType.SteadyState,
              useTotalInput=true,
              Charges=cat(  1,
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

            Components.Substance A[n](
              each Simulation=ObsoleteTypes.SimulationType.SteadyState,
              each isDependent=true,
              each solute_start=0.00033) "deprotonated acid groups"
              annotation (Placement(transformation(extent={{-10,14},{10,34}})));
            Components.ChemicalReaction react[n](each nP=2, K=fill(10.0, n) .^
                  (-pKAs .+ 3)) annotation (Placement(transformation(extent={{-44,
                      16},{-24,36}})));

            Components.Substance HA[n](each Simulation=ObsoleteTypes.SimulationType.SteadyState,
                each solute_start=0.00033) "protonated acid groups" annotation (
               Placement(transformation(extent={{-76,16},{-56,36}})));

            Components.Substance CO2_liquid(Simulation=ObsoleteTypes.SimulationType.SteadyState,
                isDependent=isDependent[1]) annotation (Placement(
                  transformation(extent={{-76,64},{-56,84}})));
            Components.Substance HCO3(Simulation=ObsoleteTypes.SimulationType.SteadyState,
                isDependent=isDependent[2])
              annotation (Placement(transformation(extent={{42,70},{62,90}})));
            Interfaces.ChemicalPort_a substances[3]
              "{free dissolved CO2, bicarbonate, chloride}"
              annotation (Placement(transformation(extent={{-10,70},{10,90}})));
            Components.Substance H2PO4(Simulation=ObsoleteTypes.SimulationType.SteadyState,
                solute_start=0.0005) annotation (Placement(transformation(
                    extent={{-62,-54},{-42,-34}})));
            Components.ChemicalReaction phosphateAcidification(nP=2, K=10^(-6.66 + 3))
              annotation (Placement(transformation(extent={{-32,-54},{-12,-34}})));
            Components.Substance HPO4(
              Simulation=ObsoleteTypes.SimulationType.SteadyState,
              isDependent=true,
              solute_start=0.0006) annotation (Placement(transformation(extent=
                      {{-2,-54},{18,-34}})));
            SteadyStates.Components.MolarConservationLaw tP04(
              each Simulation=ObsoleteTypes.SimulationType.SteadyState,
              each n=2,
              each Total=totalPO4) annotation (Placement(transformation(extent=
                      {{-28,-80},{-8,-60}})));
            Components.Substance Cl(Simulation=ObsoleteTypes.SimulationType.SteadyState,
                isDependent=isDependent[3]) "chloride anion"
              annotation (Placement(transformation(extent={{76,42},{96,62}})));
          equation
            connect(react.products[1], A.q_out) annotation (Line(
                points={{-24,25.5},{-12,25.5},{-12,24},{0,24}},
                color={107,45,134},
                thickness=1));
            for i in 1:n loop
              connect(react[i].products[2], H3O.q_out) annotation (Line(
                  points={{-24,26.5},{-14,26.5},{-14,40},{38,40}},
                  color={107,45,134},
                  thickness=1));
            end for;
            connect(HA.q_out, react.substrates[1]) annotation (Line(
                points={{-66,26},{-44,26}},
                color={107,45,134},
                thickness=1));
            connect(A.solute, tAlb.fragment[1]) annotation (Line(
                points={{6,14},{6,10},{-54,10},{-54,-5},{-40,-5}},
                color={0,0,127}));
            connect(HA.solute, tAlb.fragment[2]) annotation (Line(
                points={{-60,16},{-60,-4},{-40,-4},{-40,-3}},
                color={0,0,127}));
            connect(toColoumn.y, electroneutrality.total) annotation (Line(
                points={{69.2,-70},{56,-70},{56,-76}},
                color={0,0,127}));
            connect(substances[1], CO2_liquid.q_out) annotation (Line(
                points={{0,73.3333},{0,74},{-66,74}},
                color={107,45,134},
                thickness=1));
            connect(HCO3.q_out, substances[2]) annotation (Line(
                points={{52,80},{0,80}},
                color={107,45,134},
                thickness=1));
            connect(H2PO4.q_out, phosphateAcidification.substrates[1]) annotation (Line(
                points={{-52,-44},{-32,-44}},
                color={107,45,134},
                thickness=1));
            connect(phosphateAcidification.products[1], HPO4.q_out) annotation (Line(
                points={{-12,-44.5},{-2,-44.5},{-2,-44},{8,-44}},
                color={107,45,134},
                thickness=1));
            connect(H2PO4.solute, tP04.fragment[1]) annotation (Line(
                points={{-46,-54},{-46,-75},{-28,-75}},
                color={0,0,127}));
            connect(HPO4.solute, tP04.fragment[2]) annotation (Line(
                points={{14,-54},{14,-60},{-40,-60},{-40,-73},{-28,-73}},
                color={0,0,127}));
            connect(phosphateAcidification.products[2], H3O.q_out) annotation (Line(
                points={{-12,-43.5},{-4,-43.5},{-4,-28},{20,-28},{20,40},{38,40}},
                color={107,45,134},
                thickness=1));
            connect(HCO3.solute, electroneutrality.fragment[1]) annotation (Line(
                points={{58,70},{58,-62},{32,-62},{32,-88},{46,-88}},
                color={0,0,127}));
            connect(H2PO4.solute, electroneutrality.fragment[2]) annotation (Line(
                points={{-46,-54},{-46,-86},{46,-86},{46,-88}},
                color={0,0,127}));
            connect(HPO4.solute, electroneutrality.fragment[3]) annotation (Line(
                points={{14,-54},{14,-88},{46,-88}},
                color={0,0,127}));
            connect(Cl.q_out, substances[3]) annotation (Line(
                points={{86,52},{0,52},{0,86.6667}},
                color={107,45,134},
                thickness=1));
            connect(HA.solute, electroneutrality.fragment[(m+1):(n+m)]) annotation (Line(
                points={{-60,16},{-60,-88},{46,-88}},
                color={0,0,127}));
            connect(SID_less_Cl.y, toColoumn.u) annotation (Line(
                points={{89,-32},{92,-32},{92,-70},{87.6,-70}},
                color={0,0,127}));
            connect(Cl.solute, electroneutrality.fragment[4]) annotation (Line(
                points={{92,42},{92,10},{54,10},{54,-64},{34,-64},{34,-88},{46,
                    -88}},
                color={0,0,127}));
            annotation ( Documentation(revisions="<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>",           info="<html>
<pre><b>plotExpression(apply(-log10(AlbuminTitration.H3O.solute)),&nbsp;false,&nbsp;&QUOT;pH&QUOT;,&nbsp;1);</b></pre>
<p>The titration slope der(pH)/der(SID)=185 1/(mol/L) at pH=7.4 and tAlb=0.66 mmol/l.</p>
<p><br>Data and model is described in</p>
<p><font style=\"color: #222222; \">Jame Figge: Role of non-volatile weak acids (albumin, phosphate and citrate). In: Stewart&apos;s Textbook of Acid-Base, 2nd Edition, John A. Kellum, Paul WG Elbers editors, &nbsp;AcidBase org, 2009, pp. 216-232.</font></p>
</html>"));
          end PlasmaAcidBase;

          model ErythrocyteAcidBase
            parameter Boolean isDependent[4] = {false,false,false,false};

            Components.Substance H3O(
              q_out(conc(nominal=10^(-7.4 + 3))),
              Simulation=ObsoleteTypes.SimulationType.SteadyState,
              solute_start=10^(-7.4 + 3),
              isDependent=isDependent[4]) "hydrogen ions activity" annotation (
                Placement(transformation(extent={{-10,-10},{10,10}}, origin={-12,
                      36})));
            Components.ChemicalReaction HendersonHasselbalch(
              nP=2,
              dH=15.13,
              K=10^(-6.103 + 3),
              nS=1)
              annotation (Placement(transformation(extent={{-60,46},{-40,66}})));
            Components.Substance CO2_liquid(Simulation=ObsoleteTypes.SimulationType.SteadyState,
                isDependent=isDependent[1]) annotation (Placement(
                  transformation(extent={{-90,46},{-70,66}})));
            Components.Substance HCO3(Simulation=ObsoleteTypes.SimulationType.SteadyState,
                isDependent=isDependent[2])
              annotation (Placement(transformation(extent={{-22,70},{-2,90}})));
            Interfaces.ChemicalPort_a substances[3]
              "{free dissolved CO2, bicarbonate, chloride}"
              annotation (Placement(transformation(extent={{-90,70},{-70,90}})));
            Components.Substance Cl(Simulation=ObsoleteTypes.SimulationType.SteadyState,
                isDependent=isDependent[3]) "chloride anion"
              annotation (Placement(transformation(extent={{76,82},{96,102}})));
          equation
            connect(HendersonHasselbalch.products[1],HCO3. q_out) annotation (Line(
                points={{-40,55.5},{-30,55.5},{-30,80},{-12,80}},
                color={107,45,134},
                thickness=1));
            connect(H3O.q_out,HendersonHasselbalch. products[2]) annotation (Line(
                points={{-12,36},{-30,36},{-30,56.5},{-40,56.5}},
                color={107,45,134},
                thickness=1));
            connect(CO2_liquid.q_out,HendersonHasselbalch. substrates[1]) annotation (
               Line(
                points={{-80,56},{-60,56}},
                color={107,45,134},
                thickness=1));
            connect(substances[1], CO2_liquid.q_out) annotation (Line(
                points={{-80,73.3333},{-80,56}},
                color={107,45,134},
                thickness=1));
            connect(HCO3.q_out, substances[2]) annotation (Line(
                points={{-12,80},{-80,80}},
                color={107,45,134},
                thickness=1));
            connect(Cl.q_out, substances[3]) annotation (Line(
                points={{86,92},{-80,92},{-80,86.6667}},
                color={107,45,134},
                thickness=1));
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
                thickness=1));
            connect(membrane.particlesOutside, erythrocyteAcidBase.substances)
              annotation (Line(
                points={{34,12},{58,12}},
                color={107,45,134},
                thickness=1));
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

        parameter Types.AmountOfSubstance solute_start(nominal=
              NominalSolute) = 1e-8 "Initial solute amount in compartment"
          annotation (HideResult=true, Dialog(group="Initialization"));

        Types.RealIO.AmountOfSubstanceOutput solute(nominal=
              NominalSolute) "Current amount of solute" annotation (Placement(
              transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,-100}), iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={60,-100})));

        parameter Types.AmountOfSubstance NominalSolute=0.001
          "Numerical scale. Default is from mmol to mol, but for some substances such as hormones, hydronium or hydroxide ions can be much smaller."
          annotation (HideResult=true, Dialog(tab="Solver", group=
                "Numerical support of very small concentrations"));

        Interfaces.ChemicalPort_b q_out(conc(start=solute_start/NormalVolume))
          "Concentration and molar flow from/to compartment"
          annotation (Placement(transformation(extent={{-10,-10},{10,10}})));

        parameter Types.MolarEnergy dH=0 "Standard Enthalpy Change"
          annotation (HideResult=true, Dialog(tab="Energies"));

        Types.RealIO.EnergyOutput internalHeat
          "Internal heat energy = enthalpy*amountOfSubstance" annotation (
            Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={60,-100}), iconTransformation(extent={{-20,-20},{20,20}},
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
</html>",   info="<html>
<h4>Solute = Concentration &middot; Volume = &int; MolarFlow</h4>
<p>The main class from &ldquo;Chemical&rdquo; package is called &QUOT;Substance&QUOT;. It has one chemical connector, where molar concentration and molar flow is presented as usually. An amount of a substance (&QUOT;solute&QUOT;) is accumulated by molar flow inside an instance of this class. In the default setting the volume is set to one liter, so in this setting the concentration at &ldquo;mol/L&rdquo; has the same value as the variable solute at &ldquo;mol&rdquo;. But in the advanced settings the default volume can be changed with external input. The molar flow at the port can be also negative, which means that the solute leaves the Substance instance.&nbsp;</p>
<p><br>Having defined amount of all particles in solution as n(solution) and mass of solvent as m(solvent). It can be expressed mole fraction x and molality b as follows:</p>
<p><b>x = Solute / n(solution) = Concentration &middot; Volume /n(solution)</b></p>
<p><b>b = Solute / m(solvent) = Concentration &middot; Volume /m(solvent)</b></p>
<p><br>The activity (mole fraction based) can be expressed using mole-fraction-based activity coefficient gamma as:</p>
<h4>a = gamma * x</h4>
</html>"));
      end Substance;

      model ChemicalReaction "Chemical Reaction"
        import Physiolibrary;

        Real KaT "Dissociation constant at current temperature";
        Types.MolarFlowRate rr
          "Reaction molar flow rate";

        extends
          Physiolibrary.Obsolete.ObsoleteChemical.Interfaces.ConditionalVolume;

        parameter Boolean useDissociationConstantInput = false
          "=true, if external dissociation ratio is used"
        annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Boolean useForwardRateInput = false
          "=true, if external forward rate is used"
        annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));

        Modelica.Blocks.Interfaces.RealInput dissociationConstant(start=K) = KBase if useDissociationConstantInput
          "Dissociation coefficient [SI-unit]"
                                            annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,40})));

        Physiolibrary.Obsolete.ObsoleteChemical.Interfaces.ChemicalPort_b
          products[nP] "Products"
          annotation (Placement(transformation(extent={{90,-10},{110,10}})));

        Physiolibrary.Obsolete.ObsoleteChemical.Interfaces.ChemicalPort_a
          substrates[nS] "Substrates"
          annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));

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

        parameter Types.StoichiometricNumber s[
          nS]=ones(nS) "Stoichiometric reaction coefficient for substrates"
          annotation (HideResult=true, Dialog(group="Substrates", tab=
                "Reaction type"));
        parameter Modelica.SIunits.ActivityCoefficient as[nS]=ones(nS)
          "Activity coefficients of substrates"
          annotation ( HideResult=true, Dialog(group="Substrates", tab="Reaction type"));

        parameter Types.StoichiometricNumber p[
          nP]=ones(nP) "Stoichiometric reaction coefficients for products"
          annotation (HideResult=true, Dialog(group="Products", tab=
                "Reaction type"));
         parameter Modelica.SIunits.ActivityCoefficient ap[nP]=ones(nP)
          "Activity coefficients of products"
          annotation ( HideResult=true, Dialog(group="Products", tab="Reaction type"));

       extends
          Physiolibrary.Obsolete.ObsoleteChemical.Interfaces.ConditionalHeatPort;

        parameter Types.Temperature TK=298.15
          "Base temperature"
          annotation (HideResult=true, Dialog(tab="Temperature dependence"));

        parameter Types.MolarEnergy dH=0
          "Standard Enthalpy Change (negative=exothermic)"
          annotation (HideResult=true, Dialog(tab="Temperature dependence"));

        parameter Types.Fraction solventFraction=
           1
          "Free solvent fraction in liquid (i.e. 'mol/mol' ratio between current solution and pure solvent in one liter; e.g. in plasma=0.96, in RBC=0.717)";

        Real KBase "dissociation constant at TK" annotation (HideResult=true);

        Real forwardRate;
      protected
        parameter Types.Fraction fsp=
            solventFraction^(sum(s) + sum(p));
        parameter Types.Fraction fs=
            solventFraction^(sum(s));
        parameter Types.Fraction fp=
            solventFraction^(sum(p));

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
        //this Hoff's equation is valid in gases reactions with the same number of substrates and products and plus-minus in liquid solutions.
        //for gaseous reaction with dn!=0 (stoichoimetry difference, i.e. the stoichiometru number of products minus the stoichiometry number of reactants) is the Van't Hoff's energy (dE) different from enthalphy of reaction (DH): dE=dH-dn*R*T (Ref: D. M. Golden, "Standard states for thermochemical and activation parameters," Journal of Chemical Education, vol. 48, p. 235, 1971/04/01 1971.)

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
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{54,-8},{54,-6},{-60,-6},{-60,-6},{-24,-16},{-24,-8},{54,-8}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid)}),
          Documentation(revisions="<html>
<p><i>2013-2015 by </i>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>",       info="<html>
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
<td><p>base temperature of tabulated coefficients</p></td>
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
        extends Interfaces.ConditionalHeatPort;

        parameter Types.DiffusionPermeability solubilityRateCoef=0.01
          "The rate constant of incoming gas to solution (default 10 liter per second)"
          annotation (HideResult=true);

        Types.GasSolubility kH
          "Henry's law coefficient such as liquid-gas concentration ratio";

        parameter Types.GasSolubility kH_T0
          "Henry's law coefficient at base temperature (i.e. in (mmol/l)/kPa at 25degC: aO2=0.011, aCO2=0.245, ..)"
          annotation (HideResult=true);
        parameter Types.Temperature T0=298.15
          "Base temperature for kH_T0"
          annotation (HideResult=true, Dialog(tab="Temperature dependence"));
        parameter Types.Temperature C(displayUnit="K")
          "Gas-liquid specific constant for Van't Hoff's change of kH (i.e.: O2..1700K,CO2..2400K,N2..1300K,CO..1300K,..)"
          annotation (HideResult=true, Dialog(tab="Temperature dependence"));

        parameter Types.Fraction solventFraction=1
          "Free solvent fraction in liquid (i.e. 'mol/mol' ratio between current solution and pure solvent in one liter; e.g. in plasma=0.96, in RBC=0.717)";

        Interfaces.ChemicalPort_b q_out "Gaseous solution"
          annotation (Placement(transformation(extent={{-10,90},{10,110}})));

        Interfaces.ChemicalPort_a q_in "Dissolved in liquid solution"
          annotation (Placement(transformation(extent={{-10,-90},{10,-70}})));
      equation
        q_in.q + q_out.q = 0;

        kH = kH_T0 * Modelica.Math.exp(C* (1/T_heatPort - 1/T0)); // Van't Hoff equation

        // equilibrium:  liquid.conc = kH * gas.conc;
        q_out.q = solubilityRateCoef*(kH * q_out.conc - q_in.conc/solventFraction); //negative because of outflow

        lossHeat = C*Modelica.Constants.R*q_out.q; //negative = heat are comsumed when change from liquid to gas

         annotation (Documentation(revisions="<html>
<p><i>2009-2015 by </i>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>",   info="<html>
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
<td><p>base temperature of tabulated coefficients</p></td>
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
        extends Interfaces.OnePort;

        parameter Boolean useConductanceInput = false
          "=true, if external conductance value is used"
          annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Types.DiffusionPermeability Conductance=0
          "Diffusion conductance if useConductanceInput=false"
          annotation (Dialog(enable=not useConductanceInput));

      protected
        Types.DiffusionPermeability c;
      public
        Types.RealIO.DiffusionPermeabilityInput conductance=c if   useConductanceInput
          annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
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
</html>",       info="<html>
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
        extends Interfaces.ConditionalHeatPort;

        parameter Integer NumberOfParticles = 1
          "Number of penetrating particle types";
        parameter Integer Charges[NumberOfParticles] = zeros(NumberOfParticles)
          "Elementary charges of particles";
        parameter Types.DiffusionPermeability Permeabilities[
          NumberOfParticles]=zeros(NumberOfParticles)
          "Permeabilities of particles through membrane chanel";

        parameter Boolean usePermeabilityInput = false
          "=true, if external permeability value is used"
          annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));

        Interfaces.ChemicalPort_a particlesInside[NumberOfParticles]
          "inner side of membrane, solution"
          annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
        Interfaces.ChemicalPort_b particlesOutside[NumberOfParticles]
          "outer side of membrane, solution"
          annotation (Placement(transformation(extent={{90,-10},{110,10}})));

        Types.RealIO.DiffusionPermeabilityInput permeability[
          NumberOfParticles]=p if                                                      usePermeabilityInput
          annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,100})));

        Types.GasSolubility kH[NumberOfParticles]
          "Concentration ratio at equilibrium";

        parameter Types.GasSolubility kH_T0[NumberOfParticles]=ones(
            NumberOfParticles)
          "Equilibrated concentration ratio at temperature T0 - can be estimated by Henry's law coefficient ratios (kH1/kH2)"
          annotation (HideResult=true, Dialog(tab="Different solubilities"));
        parameter Types.Temperature T0=298.15
          "Base temperature for kH_T0"
          annotation (HideResult=true, Dialog(tab="Temperature dependence"));
        parameter Types.Temperature C[NumberOfParticles](displayUnit=
              "K") = zeros(NumberOfParticles)
          "Specific constant difference (C1-C2) for Van't Hoff's change of kH"
          annotation (HideResult=true, Dialog(tab="Temperature dependence"));

        parameter Types.Fraction solventFractionInside=1
          "Free solvent fraction inside (i.e. 'mol/mol' ratio between current solution and pure solvent in one liter; e.g. in plasma=0.96, in RBC=0.717)";
        parameter Types.Fraction solventFractionOutside=1
          "Free solvent fraction outside (i.e. 'mol/mol' ratio between current solution and pure solvent in one liter; e.g. in plasma=0.96, in RBC=0.717)";

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

        extends SteadyStates.Interfaces.SteadyStateSystem(Simulation=
              ObsoleteTypes.SimulationType.SteadyState, NumberOfDependentStates=
             NumberOfSubunits - 1);
        extends Interfaces.ConditionalVolume;

        parameter Integer NumberOfSubunits=1
          "Number of independent subunits occurring in molecule";

        Interfaces.ChemicalPort_a specificForm
          "Specific form composed with subunits form of subunitSpiecies"
          annotation (Placement(transformation(extent={{90,-90},{110,-70}})));
        Interfaces.ChemicalPort_a specificSubunitForm[NumberOfSubunits]
          "Specific form of subunits of specific molecule form in connector called spieces"
          annotation (Placement(transformation(extent={{-10,90},{10,110}})));
      protected
        Real fractions[NumberOfSubunits];
      public
        Types.RealIO.AmountOfSubstanceInput amountOfSubunit[
          NumberOfSubunits] "Total amount of the subunits in all forms"
          annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=180,
              origin={80,0})));
        Types.RealIO.AmountOfSubstanceOutput amount
          "Total amount of macromolecules in this system" annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={0,-80})));                                                             //(start=1e-8)
        Types.RealIO.EnergyOutput internalHeat
          "Relative internal heat of all chemical forms in this system"
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-60,-80}), iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-60,-80})));

      //system internal heat
        parameter Boolean useInternalHeatsInput = false
          "=true, if subunitInternalHeat inputs are used instead of parameter SubunitEnthalpies"
        annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs",tab="Heat"));

        parameter Types.MolarEnergy SubunitEnthalpies[NumberOfSubunits]=
           zeros(NumberOfSubunits)
          "Enthalpy changes of substances (can relative to one chosen specific form of chemical substance in the system) if useEnthalpiesInput=false"
          annotation (HideResult=not useInternalHeatsInput, Dialog(enable=not
                useInternalHeatsInput, tab="Heat"));

        Types.RealIO.EnergyInput subunitInternalHeat[NumberOfSubunits](
            each start=0) = internalHeatOfSubunit if                                                          useInternalHeatsInput
          annotation (Dialog(enable=false), Placement(transformation(
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
</html>",       info="<html>
<p>This block identifies one specific chemical form of one macromolecule defined by forms of its subunits  (one chosen chemical species - called <i>specie</i>).</p>
<p>Only main connector called <b>species </b>is designed for inflow and outflow of macromolecule to/from <i>system</i>. The concentration in this connector is the concentration of its specific <i>specie.</i></p>
<p>Connectors <b>subunitSpecies[:] </b>represent specific forms of the macromolecule subunit types. If the subnunit type occures n-times in macromolecule, the inflow is n-time greater than the inflow of macromolecule.</p>
<p><br>Initial total concentrations of subunits must be set to be right distribution of total macromolecule concentration. So the ratios between subunit concentrations are the ratios of their occurrence in macromolecule. In equilibrium are this proporties fulfilled.</p>
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

        Interfaces.ChemicalPort_a q_in "Degraded solute outflow"
          annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));

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
                lineColor={107,45,134},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-80,26},{62,0},{-80,-26},{-80,26}},
                lineColor={107,45,134},
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
                fillColor={107,45,134},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-46,20},{-46,-20},{-36,-18},{-36,18},{-46,20}},
                lineColor={0,0,127},
                fillColor={107,45,134},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-24,16},{-24,-16},{-14,-14},{-14,14},{-24,16}},
                lineColor={0,0,127},
                fillColor={107,45,134},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-2,12},{-2,-12},{8,-10},{8,10},{-2,12}},
                lineColor={0,0,127},
                fillColor={107,45,134},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{20,8},{20,-8},{30,-6},{30,6},{20,8}},
                lineColor={0,0,127},
                fillColor={107,45,134},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{40,4},{40,-4},{50,-2},{50,2},{40,4}},
                lineColor={0,0,127},
                fillColor={107,45,134},
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

        extends Fluid.Interfaces.ConditionalVolumeFlow(SolutionFlow=
              Clearance/K);

        Interfaces.ChemicalPort_a q_in "solute outflow"
          annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));

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
                lineColor={107,45,134},
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
        extends Interfaces.OnePort;
        extends Fluid.Interfaces.ConditionalVolumeFlow;

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
                lineColor={107,45,134},
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
</html>",       info="<html>
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
        extends Interfaces.OnePort;
        extends Interfaces.ConditionalSoluteFlow;

      equation
        q_in.q = q;

       annotation (
          Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{
                  100,100}}), graphics={
              Rectangle(
                extent={{-100,-50},{100,50}},
                lineColor={107,45,134},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                rotation=360),
              Polygon(
                points={{-80,25},{80,0},{-80,-25},{-80,25}},
                lineColor={0,0,127},
                fillColor={107,45,134},
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
        extends Interfaces.OnePort;
        extends Icons.Dilution;

        parameter Boolean useDilutionInput = false
          "=true, if dilition input is used"
          annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Types.Fraction Dilution=1
          "Concentration ratio after per before dilution (0..no solutes, 1..no dilution) if useDilutionInput=false"
          annotation (Dialog(enable=not useDilutionInput));

        Types.RealIO.FractionInput dilution(start=Dilution) = d if
                                                                  useDilutionInput
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
        annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Boolean useMaxReabInput = false
          "=true, if external maximum of reabsorption molar flow is used"
        annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Boolean useBaseReabsorption = false
          "=false, if BaseReabsorption=1"
        annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Types.MolarFlowRate MaxReabsorption=Modelica.Constants.inf
          "Maximal reabsorption molar flow if useMaxReabInput=false"
          annotation (Dialog(enable=not useMaxReabInput));

        Interfaces.ChemicalPort_a Inflow "Tubular inflow"
          annotation (Placement(transformation(extent={{-110,30},{-90,50}})));
        Interfaces.ChemicalPort_b Outflow "Tubular outflow"
          annotation (Placement(transformation(extent={{90,30},{110,50}})));

        Interfaces.ChemicalPort_b Reabsorption "Reabsorption from tubules"
          annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
        Types.RealIO.FractionInput baseReabsorption=baseReabFract if useBaseReabsorption
          "Base fraction of molar inflow for reabsorption flow" annotation (
            Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={40,100})));

        Types.RealIO.FractionInput Effect(displayUnit="1") = e if
                                                                useEffect
          "Effects<1 decrease reabsorption, effects>1 increase reabsorption fraction by equation ReabFract=BaseReabsorption^(1/Effect)"
          annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,100})));
        Types.RealIO.MolarFlowRateInput MaxReab=mr if       useMaxReabInput
          "Maximal allowed reabsorption molar flow rate"
          annotation (Placement(transformation(extent={{-100,-80},{-60,-40}})));
        Types.RealIO.FractionOutput ReabFract=reabFract if       useEffect
          "Actual reabsorbed fraction from solute inflow rate"
          annotation (Placement(transformation(extent={{80,-100},{120,-60}})));

        Types.Fraction reabFract;
        Types.Fraction baseReabFract;
        Types.Fraction e;
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
        extends Interfaces.OnePort;
        //extends Icons.MolarFlowMeasure;
        extends Modelica.Icons.RotationalSensor;

        Types.RealIO.MolarFlowRateOutput molarFlowRate annotation (
            Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,-60}), iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,-80})));
      equation
        q_in.conc = q_out.conc;

        molarFlowRate = q_in.q;

       annotation (
          Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),   Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics={
              Text(
                extent={{-31,-7},{28,-66}},
                lineColor={0,0,0},
                textString="n'")}));
      end MolarFlowMeasure;

      model ConcentrationMeasure "Measure of molar concentration"
        extends Modelica.Icons.RotationalSensor;

        Interfaces.ChemicalPort_a q_in "For measure only" annotation (Placement(
              transformation(extent={{-10,-10},{10,10}}), iconTransformation(
                extent={{-10,-10},{10,10}})));
        Types.RealIO.ConcentrationOutput concentration "Concentration"
          annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=90,
              origin={0,40}), iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,-80})));
      equation

        concentration =         q_in.conc;

        q_in.q = 0;
       annotation (
          Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{
                  100,100}}), graphics={
              Text(
                extent={{-29,-3},{30,-62}},
                lineColor={0,0,0},
                textString="c")}),
          Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end ConcentrationMeasure;

      model IncrementalFlowConcentrationMeasure
        "Incremental flow concentration meassure in circulation after absorption/secretion source (i.e. portal vein concentration)"
        extends Modelica.Icons.RotationalSensor;

        extends Fluid.Interfaces.ConditionalVolumeFlow;

        Types.RealIO.ConcentrationOutput concentration
          "Concentration after absorption source" annotation (Placement(
              transformation(extent={{-12,-86},{28,-46}}), iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,-62})));

        Types.RealIO.MolarFlowRateInput addition annotation (Placement(
              transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={60,40})));
        Interfaces.ChemicalPort_a q_in
          annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
      equation
        concentration = if (q>0) then q_in.conc + addition/q else q_in.conc;
        q_in.q=0;

       annotation (
          Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,100}}),
                              graphics={        Text(
                extent={{-88,-48},{86,0}},
                textString="%name",
                lineColor={0,0,0})}),          Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end IncrementalFlowConcentrationMeasure;
    end Sensors;

    package Sources
      extends Modelica.Icons.SourcesPackage;

      model UnlimitedSolutePump "Molar pump of solute to system"
        extends Interfaces.ConditionalSoluteFlow;

        Interfaces.ChemicalPort_b q_out "Outflow"
          annotation (Placement(transformation(extent={{90,-10},{110,10}})));

      equation
        q_out.q = - q;

       annotation (
          Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{
                  100,100}}), graphics={
              Rectangle(
                extent={{-100,-42},{100,40}},
                lineColor={107,45,134},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-48,20},{50,0},{-48,-21},{-48,20}},
                lineColor={107,45,134},
                fillColor={107,45,134},
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

        Interfaces.ChemicalPort_b q_out
          "constant concentration with any possible flow"
          annotation (Placement(transformation(extent={{90,-10},{110,10}})));

        parameter Boolean useConcentrationInput = false
          "=true, if fixed concentration is from input instead of parameter"
        annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Types.Concentration Conc=0
          "Fixed concentration if useConcentrationInput=false"
          annotation (Dialog(enable=not useConcentrationInput));

        parameter Boolean isIsolatedInSteadyState = true
          "=true, if there is no flow at port in steady state"
          annotation (Evaluate=true, HideResult=true, Dialog(group="Simulation",tab="Equilibrium"));

        parameter ObsoleteTypes.SimulationType Simulation=ObsoleteTypes.SimulationType.NormalInit
          "If in equilibrium, then zero-flow equation is added." annotation (
          Evaluate=true,
          HideResult=true,
          Dialog(group="Simulation", tab="Equilibrium"));

        Types.RealIO.ConcentrationInput concentration(start=Conc) = c if
                                                                        useConcentrationInput
          annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));

      protected
        Types.Concentration c "Current concentration";

      initial equation
        if isIsolatedInSteadyState and (Simulation == ObsoleteTypes.SimulationType.InitSteadyState) then
          q_out.q = 0;
        end if;

      equation
         if not useConcentrationInput then
           c=Conc;
         end if;

        q_out.conc = c;

        if isIsolatedInSteadyState and (Simulation == ObsoleteTypes.SimulationType.SteadyState) then
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
        Interfaces.ChemicalPort_b q_out
          "constant gas concentration with any possible flow"
          annotation (Placement(transformation(extent={{90,-10},{110,10}})));

        parameter Boolean usePartialPressureInput = false
          "=true, if fixed partial pressure is from input instead of parameter"
        annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Types.Pressure PartialPressure=0
          "Fixed partial pressure if usePartialPressureInput=false"
          annotation (Dialog(enable=not usePartialPressureInput));

        Types.RealIO.PressureInput partialPressure(start=
              PartialPressure) = p if                                            usePartialPressureInput
          "Partial pressure of Gas = air pressure * gas fraction"
          annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));

       parameter Boolean isIsolatedInSteadyState = true
          "=true, if there is no flow at port in steady state"
          annotation (Evaluate=true, HideResult=true, Dialog(group="Simulation",tab="Equilibrium"));

        parameter ObsoleteTypes.SimulationType Simulation=ObsoleteTypes.SimulationType.NormalInit
          "If in equilibrium, then zero-flow equation is added." annotation (
          Evaluate=true,
          HideResult=true,
          Dialog(group="Simulation", tab="Equilibrium"));

      protected
        Types.Pressure p "Current partial pressure";

      initial equation
        if isIsolatedInSteadyState and (Simulation == ObsoleteTypes.SimulationType.InitSteadyState) then
          q_out.q = 0;
        end if;

      equation
        if not usePartialPressureInput then
          p=PartialPressure;
        end if;

        q_out.conc = p / (Modelica.Constants.R * T_heatPort);  //ideal gas equation

        if isIsolatedInSteadyState and (Simulation == ObsoleteTypes.SimulationType.SteadyState) then
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
        extends Interfaces.ConditionalSoluteFlow;

        Interfaces.ChemicalPort_a q_in "Inflow"
          annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));

      equation
        q_in.q = q;

       annotation (
          Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{
                  100,100}}), graphics={
              Rectangle(
                extent={{-100,-42},{100,40}},
                lineColor={107,45,134},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-48,20},{50,0},{-48,-21},{-48,20}},
                lineColor={107,45,134},
                fillColor={107,45,134},
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
</html>", revisions="<html>
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
</html>", revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));

      end ChemicalPort_b;

      partial model OnePort
        "Partial transfer of solute between two ports without its accumulation"

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
        annotation(Evaluate=true, HideResult=true, choices(checkBox=true), Dialog(group="External inputs/outputs"));
        parameter Types.Temperature T=310.15
          "Fixed device temperature if useHeatPort = false" annotation (
            HideResult=true, Dialog(enable=not useHeatPort, tab=
                "Temperature dependence"));

        Thermal.Interfaces.HeatPort_a       heatPort(T(start=T)=T_heatPort, Q_flow=-lossHeat) if useHeatPort
          annotation (Placement(transformation(extent={{-10,-10},{10,10}}),
              iconTransformation(extent={{-10,-10},{10,10}})));

        Types.Temperature T_heatPort "Temperature of HeatPort";
        Types.HeatFlowRate lossHeat
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
</html>",       info="<html>
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

        constant Types.Volume NormalVolume=0.001 "1 liter"
          annotation (Evaluate=true, HideResult=true);

        parameter Boolean useNormalizedVolume = true
          "Normalized volume of solution is 1 liter"
        annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));

        Types.Volume volume "Solution volume";
                                               //annotation(HideResult=useNormalizedVolume);

        Types.RealIO.VolumeInput solutionVolume=volume if not useNormalizedVolume
          "Volume of solution" annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={-40,40})));
      equation
        if useNormalizedVolume then
          volume = NormalVolume;
        end if;

      end ConditionalVolume;

      partial model ConditionalSoluteFlow
        "Input of solute molar flow vs. parametric solute molar flow"

        parameter Boolean useSoluteFlowInput = false
          "=true, if solute flow input is used instead of parameter SoluteFlow"
        annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Types.MolarFlowRate SoluteFlow=0
          "Volumetric flow of solute if useSoluteFlowInput=false" annotation (
            HideResult=not useSoluteFlowInput, Dialog(enable=not
                useSoluteFlowInput));

        Types.RealIO.MolarFlowRateInput soluteFlow(start=SoluteFlow)=
          q if                                                              useSoluteFlowInput
          annotation (Placement(transformation(
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

        parameter ObsoleteTypes.Utilities.UnitConversions.RealTypeRecord[:]
          unitConversions=cat(
                  1,
              ObsoleteTypes.Utilities.UnitConversions.GenerateSubstanceUnits(
              "g", 1e-3/mw),
              ObsoleteTypes.Utilities.UnitConversions.GenerateSubstanceUnits(
              "IU", molpIU),
              ObsoleteTypes.Utilities.UnitConversions.GenerateSubstanceUnits(
              "GU", molpGU));

      end SubstanceDefinition;
    end Interfaces;

    annotation (Documentation(revisions="<html>
<p>Copyright (c) 2008-2015, Marek Matej&aacute;k, Charles University in Prague </p>
<p>All rights reserved. </p>
<p>Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met: </p>
<ol>
<li>Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer. </li>
<li>Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution. </li>
<li>Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission. </li>
</ol>
<p>THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS &QUOT;AS IS&QUOT; AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.</p>
</html>",   info="<html>
<p>In physiology books, chapters about chemical substances are organized by their types. The main reason for this is that each substance in the human body is regulated in a different way. For example the regulation of sodium is different from the regulation of potassium, and from the regulation of glucose, and so on. This view leads to the idea of having separate models of each substance. The origin of different flows and regulations is the (cellular) membrane. Water and solutions can cross it in different directions at the same time. Crossings occur for different reasons: water is driven mostly by osmotic gradients, electrolytes are driven by charge to reach Donnan&apos;s equilibrium, and some solutes can even be actively transported against their concentration or electrical gradients. And all this is specifically driven from the higher levels by neural and hormonal responses.&nbsp; </p>
<p>In Physiolibrary flows and fluxes of solutes are supported mostly by the Chemical package. All parts inside this Chemical package use the connector ChemicalPort, which defines the molar concentration and molar flow/flux rate of one solute. This is the supporting infrastructure for modeling membrane diffusion, accumulations of substances, reversal chemical reactions, Henry&apos;s law of gas solubility, dilution with additional solvent flow, membrane reabsorption, chemical degradation and physiological clearance. </p>
</html>"));
  end ObsoleteChemical;

  package ObsoleteOsmotic "Obsolete, please use 'Chemical' library instead!"
   extends Modelica.Icons.Package;

    package Examples
      "Examples that demonstrate usage of the Osmotic flow components"
    extends Modelica.Icons.ExamplesPackage;

      model Cell
      extends Modelica.Icons.Example;

        Physiolibrary.Obsolete.ObsoleteOsmotic.Components.OsmoticCell cells(
            volume_start(displayUnit="l") = 0.001, ImpermeableSolutes={0.285})
          annotation (Placement(transformation(extent={{-44,36},{-24,56}})));
        Physiolibrary.Obsolete.ObsoleteOsmotic.Components.OsmoticCell interstitium(
            volume_start(displayUnit="l") = 0.001, ImpermeableSolutes={0.28})
          annotation (Placement(transformation(extent={{34,36},{54,56}})));
        Physiolibrary.Obsolete.ObsoleteOsmotic.Components.Membrane membrane(cond=
              1.2501026264094e-10)
          annotation (Placement(transformation(extent={{-4,36},{16,56}})));
        Physiolibrary.Obsolete.ObsoleteOsmotic.Components.OsmoticCell cells1(
            volume_start(displayUnit="l") = 0.001, ImpermeableSolutes={0.285})
          annotation (Placement(transformation(extent={{-44,-64},{-24,-44}})));
        Physiolibrary.Obsolete.ObsoleteOsmotic.Components.OsmoticCell interstitium1(
            volume_start(displayUnit="l") = 0.001, ImpermeableSolutes={0.29})
          annotation (Placement(transformation(extent={{34,-64},{54,-44}})));
        Physiolibrary.Obsolete.ObsoleteOsmotic.Components.Membrane membrane1(cond=
              1.2501026264094e-10)
          annotation (Placement(transformation(extent={{-4,-64},{16,-44}})));
      equation
        connect(cells.q_in[1], membrane.q_in) annotation (Line(
            points={{-34,46},{-4,46}},
            color={127,127,0},
            thickness=1));
        connect(membrane.q_out, interstitium.q_in[1]) annotation (Line(
            points={{16,46},{44,46}},
            color={127,127,0},
            thickness=1));
        connect(cells1.q_in[1], membrane1.q_in) annotation (Line(
            points={{-34,-54},{-4,-54}},
            color={127,127,0},
            thickness=1));
        connect(membrane1.q_out, interstitium1.q_in[1]) annotation (Line(
            points={{16,-54},{44,-54}},
            color={127,127,0},
            thickness=1));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}),      graphics={
              Text(
                extent={{-52,84},{42,76}},
                lineColor={135,135,135},
                textString="Cells in hypotonic environment"),
              Text(
                extent={{-52,-16},{42,-24}},
                lineColor={95,95,95},
                textString="Cells in hypertonic environment"),
              Line(
                points={{-98,8},{98,8}},
                color={135,135,135},
                thickness=1)}),
          Documentation(revisions=
                          "<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end Cell;

      model CerebrospinalFluid
      extends Modelica.Icons.Example;

        Physiolibrary.Obsolete.ObsoleteOsmotic.Components.OsmoticCell CSF_osmotic(
            volume_start(displayUnit="ml") = 0.00015, ImpermeableSolutes={(
              0.286*0.15)}) "cerebro-spinal fluid"
          annotation (Placement(transformation(extent={{-76,-6},{-56,14}})));
        Physiolibrary.Obsolete.ObsoleteOsmotic.Components.Membrane choroid_plexus(
            useHydraulicPressureInputs=true, cond(displayUnit="ml/(mmHg.day)")=
               1.9966916949595e-12) "choroid plexus"
          annotation (Placement(transformation(extent={{-16,-6},{-36,14}})));
        Physiolibrary.Fluid.Components.ElasticVessel CSF_hydraulic(
          volume_start=0.00015,
          ZeroPressureVolume=0.000145,
          Compliance=2.250184727537e-09,
          nPorts=3) "cerebro-spinal fluid"
          annotation (Placement(transformation(extent={{-96,-32},{-76,-12}})));
        Physiolibrary.Fluid.Components.VolumePump choroid_plexus_hydraulic(
            useSolutionFlowInput=true) annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=180,
              origin={8,-22})));
        Physiolibrary.Obsolete.ObsoleteOsmotic.Sensors.FlowMeasure flowMeasure
          annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=180,
              origin={8,4})));
        Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasure
          annotation (Placement(transformation(extent={{-90,64},{-70,84}})));
        Physiolibrary.Obsolete.ObsoleteOsmotic.Sources.UnlimitedSolution ECF_osmotic(Osm=285)
          "extracellular (extracerebrospinal) fluid osmolarity" annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={46,32})));
        Physiolibrary.Fluid.Sources.PressureSource veins(P=0) annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={82,86})));
        Physiolibrary.Obsolete.ObsoleteOsmotic.Components.Membrane arachnoid_villi(
            useHydraulicPressureInputs=true, cond(displayUnit="ml/(mmHg.day)")=
               1.1285648710641e-11) "choroid plexus"
          annotation (Placement(transformation(extent={{-36,46},{-16,66}})));
        Physiolibrary.Fluid.Components.VolumePump arachnoid_villi_hydraulic(
            useSolutionFlowInput=true)
          annotation (Placement(transformation(extent={{-2,96},{18,76}})));
        Physiolibrary.Obsolete.ObsoleteOsmotic.Sensors.FlowMeasure flowMeasure1
          annotation (Placement(transformation(extent={{-2,66},{18,46}})));
        Physiolibrary.Fluid.Sources.PressureSource arteries(P=12665.626804425)
          annotation (Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=180,
              origin={80,26})));
        Physiolibrary.Fluid.Components.Conductor conductor(Conductance(
              displayUnit="ml/(mmHg.min)") = 3.7503078792283e-11) annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={96,0})));
        Physiolibrary.Fluid.Components.ElasticVessel choroidPlexusCapilaries(
          volume_start=1.4e-05,
          Compliance=3.7503078792283e-09,
          nPorts=4)
          annotation (Placement(transformation(extent={{56,-32},{76,-12}})));
        Physiolibrary.Fluid.Components.Conductor conductor1(Conductance=8.750718384866e-11)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={66,50})));
        Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasure1
          annotation (Placement(transformation(extent={{68,64},{48,84}})));
        Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasure2
          annotation (Placement(transformation(extent={{62,-22},{42,-2}})));
      equation
        connect(flowMeasure.q_in, ECF_osmotic.port) annotation (Line(
            points={{18,4},{32,4},{32,32},{36,32}},
            color={127,127,0},
            thickness=1));
        connect(CSF_osmotic.q_in[1], arachnoid_villi.q_in) annotation (Line(
            points={{-66,4},{-66,56},{-36,56}},
            color={127,127,0},
            thickness=1));
        connect(arachnoid_villi_hydraulic.q_out, veins.y) annotation (Line(
            points={{18,86},{72,86}},
            thickness=1));
        connect(arachnoid_villi.q_out, flowMeasure1.q_in) annotation (Line(
            points={{-16,56},{-2,56}},
            color={127,127,0},
            thickness=1));
        connect(flowMeasure1.q_out, ECF_osmotic.port) annotation (Line(
            points={{18,56},{32,56},{32,32},{36,32}},
            color={127,127,0},
            thickness=1));
        connect(veins.y, conductor1.q_out) annotation (Line(
            points={{72,86},{66,86},{66,60}},
            thickness=1));
        connect(arteries.y, conductor.q_in) annotation (Line(
            points={{90,26},{96,26},{96,10}},
            thickness=1));
        connect(pressureMeasure1.q_in, veins.y) annotation (Line(
            points={{62,68},{66,68},{66,86},{72,86}},
            thickness=1));
        connect(CSF_osmotic.q_in[1], choroid_plexus.q_out) annotation (Line(
            points={{-66,4},{-36,4}},
            color={127,127,0},
            thickness=1));
        connect(choroid_plexus.q_in, flowMeasure.q_out) annotation (Line(
            points={{-16,4},{-2,4}},
            color={127,127,0},
            thickness=1));
        connect(pressureMeasure2.pressure, choroid_plexus.hydraulicPressureIn)
          annotation (Line(
            points={{46,-16},{28,-16},{28,20},{-18,20},{-18,12}},
            color={0,0,127}));
        connect(pressureMeasure1.pressure, arachnoid_villi.hydraulicPressureOut)
          annotation (Line(
            points={{52,70},{-18,70},{-18,64}},
            color={0,0,127}));
        connect(pressureMeasure.pressure, arachnoid_villi.hydraulicPressureIn)
          annotation (Line(
            points={{-74,70},{-34,70},{-34,64}},
            color={0,0,127}));
        connect(pressureMeasure.pressure, choroid_plexus.hydraulicPressureOut)
          annotation (Line(
            points={{-74,70},{-52,70},{-52,28},{-34,28},{-34,12}},
            color={0,0,127}));
        connect(flowMeasure1.volumeFlowRate, arachnoid_villi_hydraulic.solutionFlow)
          annotation (Line(
            points={{8,64},{8,79}},
            color={0,0,127}));
        connect(flowMeasure.volumeFlowRate, choroid_plexus_hydraulic.solutionFlow)
          annotation (Line(
            points={{8,-4},{8,-15}},
            color={0,0,127}));
        connect(choroid_plexus_hydraulic.q_out, CSF_hydraulic.q_in[1])
          annotation (Line(
            points={{-2,-22},{-44,-22},{-44,-20.2667},{-86.3,-20.2667}},
            color={127,0,0},
            thickness=0.5));
        connect(CSF_hydraulic.q_in[2], pressureMeasure.q_in) annotation (Line(
            points={{-86.3,-22},{-86.3,23},{-84,23},{-84,68}},
            color={127,0,0},
            thickness=0.5));
        connect(CSF_hydraulic.q_in[3], arachnoid_villi_hydraulic.q_in)
          annotation (Line(
            points={{-86.3,-23.7333},{-94,-23.7333},{-94,86},{-2,86}},
            color={127,0,0},
            thickness=0.5));
        connect(choroidPlexusCapilaries.q_in[1], choroid_plexus_hydraulic.q_in)
          annotation (Line(
            points={{65.7,-20.05},{42,-20.05},{42,-22},{18,-22}},
            color={127,0,0},
            thickness=0.5));
        connect(choroidPlexusCapilaries.q_in[2], pressureMeasure2.q_in)
          annotation (Line(
            points={{65.7,-21.35},{60,-21.35},{60,-18},{56,-18}},
            color={127,0,0},
            thickness=0.5));
        connect(conductor1.q_in, choroidPlexusCapilaries.q_in[3]) annotation (
            Line(
            points={{66,40},{66,8},{66,-22.65},{65.7,-22.65}},
            color={127,0,0},
            thickness=0.5));
        connect(conductor.q_out, choroidPlexusCapilaries.q_in[4]) annotation (
            Line(
            points={{96,-10},{96,-23.95},{65.7,-23.95}},
            color={127,0,0},
            thickness=0.5));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}),      graphics={
              Text(
                extent={{-46,-64},{50,-50}},
                lineColor={215,215,215},
                textString="the same volume of CSF"),
              Line(
                points={{-50,-54},{-62,-14}},
                color={215,215,215},
                arrow={Arrow.None,Arrow.Filled}),
              Line(
                points={{-50,-54},{-72,-30}},
                color={215,215,215},
                arrow={Arrow.None,Arrow.Filled})}),
          Documentation(revisions=
                          "<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>",   info="<html>
<p>Parameters are only manually estimated to reach steady state at 150ml CSF with CSF production and rebsorbtion 550ml/day and osmolarity 285 mosm/l.</p>
<p><br>[1] Dee Unglaub Silverthorn: Human Physiology</p>
<p>The cerebrospinal fluid (CSF) circulation: blood capilaries -&GT; choriod plexus of third and fourth ventricle -&GT; arachnoid villi -&GT; blood in venous sinus.</p>
<p><br><font style=\"color: #222222; \">[2] Hochwald, G. M., Wald, A., DiMattio, J., &AMP; Malhan, C. (1974). The effects of serum osmolarity on cerebrospinal fluid volume flow.&nbsp;<i>Life sciences</i>,&nbsp;<i>15</i>(7), 1309-1316.</font></p>
<p><br><font style=\"color: #2e2e2e; \">The effects of changes in serum osmolarity on cerebrospinal fluid (CSF) formation were studied in cats. CSF production rates were measured by ventriculocisternal perfusion both before and after intravenous infusion of glucose solutions.</font></p>
<p><font style=\"color: #2e2e2e; \">Infusion of glucose, hyperosmolar with respect to serum, increased serum osmolarity and caused a decrease in CSF formation rate; conversely, infusion of hypoosmolar solutions lowered serum osmolarity and increased CSF formation. CSF production and serum osmolarity were found to be linearly related. A 1&percnt; serum osmolarity change resulted in a 6.7&percnt; change in CSF formation. CSF formation increased by 130&percnt; with a serum osmolarity of 265 m0sm/1 and was undetectable with serum of 380 m0sm/1.</font></p>
<p><br><font style=\"color: #2e2e2e; \">[3] https://en.wikipedia.org/wiki/Cerebrospinal_fluid</font></p>
<p>The brain produces roughly 500 mL of cerebrospinal fluid per day. This fluid is constantly reabsorbed, so that only 100-160 mL is present at any one time.&nbsp;<a href=\"https://en.wikipedia.org/wiki/Ependymal_cells\">Ependymal cells</a>&nbsp;of the&nbsp;<a href=\"https://en.wikipedia.org/wiki/Choroid_plexus\">choroid plexus</a>&nbsp;produce more than two thirds of CSF. The&nbsp;<a href=\"https://en.wikipedia.org/wiki/Choroid_plexus\">choroid plexus</a>&nbsp;is a&nbsp;<a href=\"https://en.wikipedia.org/wiki/Venous_plexus\">venous plexus</a>&nbsp;contained within the&nbsp;<a href=\"https://en.wikipedia.org/wiki/Ventricular_system\">four ventricles</a>&nbsp;of the brain, hollow structures inside the brain filled with CSF. The remainder of the CSF is produced by the surfaces of the ventricles and by the lining surrounding the&nbsp;<a href=\"https://en.wikipedia.org/wiki/Subarachnoid_space\">subarachnoid space</a>.&nbsp;</p>
<p>Ependymal cells actively secrete sodium into the lateral ventricles. This creates&nbsp;<a href=\"https://en.wikipedia.org/wiki/Osmotic_pressure\">osmotic pressure</a>&nbsp;and draws water into the CSF space. Chloride, with a negative charge, maintains&nbsp;<a href=\"https://en.wikipedia.org/w/index.php?title=Electroneutrality&action=edit&redlink=1\">electroneutrality</a>&nbsp;and moves with the positively-charged sodium. As a result, CSF contains a higher concentration of sodium and chloride than blood plasma, but less potassium, calcium and glucose and protein.&nbsp;</p>
</html>"));
      end CerebrospinalFluid;

    end Examples;

    package Components
      extends Modelica.Icons.Package;

      model OsmoticCell "Solvent container"
        extends Icons.OsmoticCell;
        extends SteadyStates.Interfaces.SteadyState(
                                           state_start=volume_start, storeUnit=
            "mOsm/l");

        parameter Integer NumberOfMembraneTypes=1
          "Membrane type is determined by membrane permeabilities for substances.";

        Interfaces.OsmoticPort_a
                            q_in[NumberOfMembraneTypes]
          "Flux to/from osmotic compartment"                                               annotation (Placement(
              transformation(extent={{-10,-10},{10,10}})));
        parameter Types.Volume volume_start=0.001
          "Initial volume of compartment"
          annotation (Dialog(group="Initialization"));

        parameter Boolean useImpermeableSolutesInput = false
          "=true, if impermeable substance amount as an input"
          annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Types.AmountOfSubstance ImpermeableSolutes[
          NumberOfMembraneTypes]=zeros(NumberOfMembraneTypes)
          "Amount of impermeable substance if useImpermeableSolutesInput=false"
          annotation (Dialog(enable=not useImpermeableSolutesInput));

        Types.RealIO.AmountOfSubstanceInput impermeableSolutes[
          NumberOfMembraneTypes](start=ImpermeableSolutes) = is if                                                     useImpermeableSolutesInput
          "Amount of impermeable solutes in compartment"
          annotation (Placement(transformation(extent={{-100,40},{-60,80}})));
        Types.RealIO.VolumeOutput volume "Actual volume of compartment"
          annotation (Placement(transformation(extent={{16,-64},{56,-24}}),
              iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={60,-100})));
      protected
        Types.AmountOfSubstance is[NumberOfMembraneTypes]
          "Current amount of impermeable solutes";
      equation
        if not useImpermeableSolutesInput then
          is=ImpermeableSolutes;
        end if;

        q_in.o = is / volume;

        change = ones(NumberOfMembraneTypes) * q_in.q;    //der(volume)=q_in.q
        state = volume;

        //  assert(volume>=-Modelica.Constants.eps,"Collapsed cells by osmotic pressure are not supported!");

        annotation ( Icon(coordinateSystem(
                preserveAspectRatio=false,extent={{-100,-100},{100,100}}),
                                                     graphics={
                                     Text(
                extent={{-80,100},{240,140}},
                textString="%name",
                lineColor={0,0,255})}),
          Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>",   info="<html>
<p>The liquid volume of the penetrating solution is accumulated in &QUOT;OsmoticCell&QUOT;, where the nonpenetrating solutes are held. Instances of this class can represent both sides of the membrane, for example intracellular space, extracellular space, interstitial space, blood plasma or cerebrospinal fluid.</p>
</html>"));
      end OsmoticCell;

      model Membrane "Solvent diffusion through semipermeable membrane"
       extends Interfaces.OnePort;
       extends Icons.Membrane; //Icons.Resistor;

       parameter Boolean useConductanceInput = false
          "=true, if membrane permeability input is used"
          annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Types.OsmoticPermeability cond=1e-15
          "Membrane permeability for solvent if useConductanceInput = false"
          annotation (Dialog(enable=not useConductanceInput));

        parameter Boolean useHydraulicPressureInputs = false
          "=true, if hydraulic pressure inputs is used"
          annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Types.Pressure HydraulicPressureIn=0
          "Hydraulic pressure inside if useHydraulicPressureInputs=false"
          annotation (Dialog(enable=not useHydraulicPressureInputs));
        parameter Types.Pressure HydraulicPressureOut=0
          "Hydraulic pressure outside if useHydraulicPressureInputs=false"
          annotation (Dialog(enable=not useHydraulicPressureInputs));

        Types.RealIO.PressureInput hydraulicPressureIn(start=
              HydraulicPressureIn) = pi if                                              useHydraulicPressureInputs
          annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={-80,80})));
        Types.RealIO.PressureInput hydraulicPressureOut(start=
              HydraulicPressureOut) = po if                                               useHydraulicPressureInputs
          annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={80,80})));

        parameter Boolean useTemperatureInputs = false
          "=true, if temperature on both sides is used"
          annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Types.Temperature T=310.15
          "Temperature on both membrane sides if  useTemperatureInputs=false"
          annotation (Dialog(enable=not useTemperatureInputs));

        Types.RealIO.TemperatureInput temperatureIn(start=T) = ti if
                                                                   useTemperatureInputs
          annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=90,
              origin={-80,-80})));
        Types.RealIO.TemperatureInput temperatureOut(start=T) = to if
                                                                    useTemperatureInputs
          annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=90,
              origin={80,-80})));

        Types.OsmoticPermeability perm;

        Types.Pressure opi "osmotic pressure at q_in";
        Types.Pressure opo "osmotic pressure at q_out";
      protected
        Types.Pressure pi;
        Types.Pressure po;
        Types.Temperature ti;
        Types.Temperature to;

      public
        Types.RealIO.OsmoticPermeabilityInput conduction=perm if useConductanceInput
          annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,80}), iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,80})));
      equation
        if not useHydraulicPressureInputs then
          pi=HydraulicPressureIn;
          po=HydraulicPressureOut;
        end if;
        if not useTemperatureInputs then
          ti=T;
          to=T;
        end if;
        if not useConductanceInput then
          cond=perm;
        end if;

        q_in.q = perm * ( (-po + q_out.o*(Modelica.Constants.R*to)) - (-pi + q_in.o*(Modelica.Constants.R*ti)));

        opi = q_in.o*(Modelica.Constants.R*ti);
        opo = q_out.o*(Modelica.Constants.R*to);
        annotation (        Documentation(revisions="<html>
<p><i>2009-2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>",   info="<html>
<p>The main element of osmotic phenomena is a semipermeable membrane, which generates the flow of penetrating substances together with water. The connector on both sides is composed of molar concentration of non-penetrating solutes (osmolarity), and from penetrating volumetric flow (osmotic flux). Flow through the membrane depends on a pressure gradient, where pressure on both sides is calculated from the osmotic and hydraulic component.</p>
</html>"),   Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                  100}}),      graphics={
                                     Text(
                extent={{-140,112},{140,150}},
                textString="%name",
                lineColor={0,0,255})}));
      end Membrane;

      model SolventFlux "Prescripted solvent flow"
        extends Interfaces.OnePort;
        extends Fluid.Interfaces.ConditionalVolumeFlow;

      equation
        q_in.q = q;

       annotation (
          Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                  100,100}}), graphics={
              Text(
                extent={{-100,-80},{100,-54}},
                textString="%name",
                lineColor={0,0,255}),
              Rectangle(
                extent={{-100,-50},{100,50}},
                lineColor={127,127,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-78,25},{82,0},{-78,-25},{-78,25}},
                lineColor={127,127,0},
                fillColor={127,127,0},
                fillPattern=FillPattern.Solid)}),
          Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end SolventFlux;

      model IdealOverflowFiltration
        "Semipermeable membrane filtration (e.g. flux through capillary membrane) of overflowing solution (e.g. blood microcirculation)"
        extends Icons.FlowFiltration;
        extends Fluid.Interfaces.ConditionalVolumeFlow;
                                                            // "E.g. volumetric inflow to capilary net";

        Interfaces.OsmoticPort_a port_a
          "Inflowing ospomarity and positive filtrate flow rate (e.g. blood osmolarity and flux through capillary membrane from blood to interstitium)"
                                                                                                              annotation (Placement(transformation(extent={{
                  -106,30},{-86,50}}), iconTransformation(extent={{-106,30},{-86,50}})));
        Interfaces.OsmoticPort_b filtrate
          "Outer osmolarity and negative filtrate flow rate (e.g. interstitium osmolarity and flux through capillary membrane from interstitium to blood)"
                                                                                                              annotation (Placement(transformation(extent={{
                  -10,-112},{10,-92}}), iconTransformation(extent={{-10,-112},{10,-92}})));

         parameter Boolean useHydraulicPressureInputs = false
          "=true, if hydraulic pressure inputs is used"
          annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Types.Pressure HydraulicPressureIn=0
          "Hydraulic pressure inside of leaving overflow (e.g. blood pressure after capillary net) if useHydraulicPressureInputs=false"
          annotation (Dialog(enable=not useHydraulicPressureInputs));
        parameter Types.Pressure HydraulicPressureOut=0
          "Hydraulic pressure outside (e.g. interstitium hydraulic pressure) if useHydraulicPressureInputs=false"
          annotation (Dialog(enable=not useHydraulicPressureInputs));

        Types.RealIO.PressureInput hydraulicPressureIn(start=
              HydraulicPressureIn) = pi if                                              useHydraulicPressureInputs
          annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={-80,80})));
        Types.RealIO.PressureInput hydraulicPressureOut(start=
              HydraulicPressureOut) = po if                                               useHydraulicPressureInputs
          annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={80,80}), iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=180,
              origin={100,-80})));

        parameter Boolean useTemperatureInputs = false
          "=true, if temperature on both sides is used"
          annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Types.Temperature T=310.15
          "Temperature on both membrane sides if  useTemperatureInputs=false"
          annotation (Dialog(enable=not useTemperatureInputs));

        Types.RealIO.TemperatureInput temperature(start=T) = t if
                                                                useTemperatureInputs
          annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=90,
              origin={-80,-80}), iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=180,
              origin={100,0})));

      protected
        Types.Pressure pi;
        Types.Pressure po;
        Types.Temperature t;

        Types.Osmolarity osmolarityO;

      equation
       if not useHydraulicPressureInputs then
          pi=HydraulicPressureIn;
          po=HydraulicPressureOut;
        end if;
        if not useTemperatureInputs then
          t=T;
        end if;

        port_a.q+filtrate.q=0; //flux through membrane

        pi - osmolarityO*Modelica.Constants.R*T = po - filtrate.o*Modelica.Constants.R*T; // venous and interstitium pressure is equilibrated

        port_a.o*q = osmolarityO*(q-port_a.q); //definition of venous osmolarity

      //  port_a.o*q = (q-port_a.q)*filtrate.o; //equilibration without hydraulic part

       annotation (
          Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,100}}),
                              graphics={
              Text(
                extent={{-150,-20},{150,20}},
                textString="%name",
                lineColor={0,0,255},
                origin={70,104},
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
</html>",       info="<html>
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
      end IdealOverflowFiltration;

      model Reabsorption "Divide inflow to outflow and reabsorption"
        import Physiolibrary;
        extends Icons.Reabsorption;

        Interfaces.OsmoticPort_a
                             Inflow                    annotation (Placement(
              transformation(extent={{-114,26},{-86,54}})));
        Interfaces.OsmoticPort_b
                             Outflow
          annotation (Placement(transformation(extent={{86,26},{114,54}})));
        Interfaces.OsmoticPort_b
                             Reabsorption                annotation (Placement(
              transformation(extent={{-14,-114},{14,-86}})));

        Types.RealIO.FractionInput FractReab
          annotation (Placement(transformation(extent={{-100,-60},{-60,-20}})));

        parameter Boolean useExternalOutflowMin = false
          "=true, if minimal outflow is garanted"
          annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Types.VolumeFlowRate
          OutflowMin=0 "Minimal outflow if useExternalOutflowMin=false"
          annotation (Dialog(enable=not useExternalOutflowMin));

        Types.RealIO.VolumeFlowRateInput
          outflowMin(start=OutflowMin) = om if                                useExternalOutflowMin
          annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={40,80})));

      protected
        Types.VolumeFlowRate om;
      equation
        if not useExternalOutflowMin then
          om = OutflowMin;
        end if;

        Inflow.o = Outflow.o;
        0 = Inflow.q + Outflow.q + Reabsorption.q;

       // assert(Inflow.q>=-Modelica.Constants.eps,"Only one directional flow is supported!");

        Reabsorption.q = -max(0,FractReab*(Inflow.q-om));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},
                  {100,100}}),       graphics={Text(
                extent={{-100,130},{100,108}},
                lineColor={0,0,255},
                textString="%name")}),        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>",       info="<html>
<p><h4><font color=\"#008000\">Hydraulic Reabsorption</font></h4></p>
<p>If useOutflowMin=false then the next schema is used.</p>
<p><ul>
<li><img src=\"modelica://Physiolibrary/Resources/Images/UserGuide/HydraulicReabsorption.png\"/></li>
</ul></p>
<p><br/>If  useOutflowMin=true then the extended schema is used:</p>
<p><ul>
<li><img src=\"modelica://Physiolibrary/Resources/Images/UserGuide/HydraulicReabsorptionWithOutflowMin.png\"/></li>
</ul></p>
</html>"));
      end Reabsorption;
    end Components;

    package Sensors
      extends Modelica.Icons.SensorsPackage;
      model FlowMeasure "Measurement of flux through semipermeable membrane"
        extends Interfaces.OnePort;
        extends Modelica.Icons.RotationalSensor;
        //extends Icons.FlowMeasure;

        Types.RealIO.VolumeFlowRateOutput volumeFlowRate
          "Flux through membrane" annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,-60}), iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,-80})));
      equation
        q_out.o = q_in.o;

        volumeFlowRate = q_in.q;

       annotation (
          Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),   Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics={
              Text(
                extent={{-29,-7},{30,-66}},
                lineColor={0,0,0},
                textString="V'")}));
      end FlowMeasure;
    end Sensors;

    package Sources
      extends Modelica.Icons.SourcesPackage;
      model SolventInflux "Prescribed solvent inflow"
        extends Fluid.Interfaces.ConditionalVolumeFlow;

        Interfaces.OsmoticPort_b
                            q_out
                               annotation (Placement(
              transformation(extent={{50,-10},{70,10}})));

      equation
        q_out.q = - q;

       annotation (
          Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
                              graphics={
              Rectangle(
                extent={{-60,-30},{60,30}},
                lineColor={127,127,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-48,20},{50,0},{-48,-21},{-48,20}},
                lineColor={127,127,0},
                fillColor={127,127,0},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-92,-58},{80,-34}},
                textString="%name",
                lineColor={0,0,255})}),        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end SolventInflux;

      model SolventOutflux "Prescribed solvent outflow"
       extends Fluid.Interfaces.ConditionalVolumeFlow;
        Interfaces.OsmoticPort_a
                            q_in
                               annotation ( Placement(
              transformation(extent={{-70,-10},{-50,10}})));
      equation
        q_in.q = q;

       annotation (
          Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                  100,100}}), graphics={
              Rectangle(
                extent={{-60,-30},{60,30}},
                lineColor={127,127,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-46,22},{52,0},{-46,-22},{-46,22}},
                lineColor={127,127,0},
                fillColor={127,127,0},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-78,-58},{72,-36}},
                textString="%name",
                lineColor={0,0,255})}),        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end SolventOutflux;

      model UnlimitedSolution "Prescribed osmolarity"

        parameter Boolean useOsmolarityInput = false
          "=true, if fixed osmolarity at port is from input instead of parameter"
        annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Types.Osmolarity Osm=0
          "Fixed osmolarity at port if useOsmolarityInput=false"
          annotation (Dialog(enable=not useOsmolarityInput));

        parameter Boolean isIsolatedInSteadyState = true
          "=true, if there is no flow at port in steady state"
          annotation (Dialog(group="Simulation",tab="Equilibrium"));

        parameter ObsoleteTypes.SimulationType Simulation=ObsoleteTypes.SimulationType.NormalInit
          "If in equilibrium, then zero-flow equation is added."
          annotation (Dialog(group="Simulation", tab="Equilibrium"));

        Interfaces.OsmoticPort_b    port annotation (Placement(transformation(extent={{90,-10},
                  {110,10}})));

      protected
        Types.Osmolarity o "Current osmolarity";
      public
        Types.RealIO.TemperatureInput osmolarity(start=Osmolarity) = o if
                                                                 useOsmolarityInput
          annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));

      initial equation
        if isIsolatedInSteadyState and (Simulation == ObsoleteTypes.SimulationType.InitSteadyState) then
          port.q = 0;
        end if;

      equation
        if not useOsmolarityInput then
          o=Osm;
        end if;

        port.o = o;

        if isIsolatedInSteadyState and (Simulation == ObsoleteTypes.SimulationType.SteadyState) then
            port.q = 0;
        end if;

         annotation (
          Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,100}}),
                              graphics={
              Text(
                extent={{-150,150},{150,110}},
                textString="%name",
                lineColor={0,0,255}),
              Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={0,0,0},
                pattern=LinePattern.None,
                fillColor={127,127,0},
                fillPattern=FillPattern.Backward),
              Text(
                extent={{38,-34},{-100,-100}},
                lineColor={0,0,0},
                textString="Osm"),
              Line(
                points={{-52,0},{56,0}},
                color={191,0,0},
                thickness=0.5),
              Polygon(
                points={{50,-20},{50,20},{90,0},{50,-20}},
                lineColor={191,0,0},
                fillColor={191,0,0},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{140,-100},{-140,-160}},
                lineColor={0,0,0},
                textString="%Osm mosm/l")}),
          Documentation(info="<HTML>
<p>
This model defines a fixed temperature T at its port in Kelvin,
i.e., it defines a fixed temperature as a boundary condition.
</p>
</HTML>
"));
      end UnlimitedSolution;
    end Sources;

    package Interfaces
      extends Modelica.Icons.InterfacesPackage;

       connector OsmoticPort
        "Flux through semipermeable membrane by osmotic pressure gradient"
        Types.Concentration o
          "Osmolarity is the molar concentration of the impermeable solutes";
        flow Types.VolumeFlowRate q
          "The flux of the permeable solvent (!not the impermeable solutes!)";
        annotation (Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
       end OsmoticPort;

      connector OsmoticPort_a "Influx"
        extends OsmoticPort;

      annotation (
          defaultComponentName="port_a",
          Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,
                  100}}),     graphics={Rectangle(
                extent={{-20,10},{20,-10}},
                lineColor={127,127,0},
                lineThickness=1),       Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={127,127,0},
                fillColor={127,127,0},
                fillPattern=FillPattern.Solid)}),
          Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}),
              graphics={Rectangle(
                extent={{-40,40},{40,-40}},
                lineColor={127,127,0},
                fillColor={127,127,0},
                fillPattern=FillPattern.Solid),
          Text(extent = {{-160,110},{40,50}}, lineColor = {127,127,0}, textString = "%name")}),
          Documentation(info="<html>
<p>
Connector with one flow signal of type Real.
</p>
</html>", revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));

      end OsmoticPort_a;

      connector OsmoticPort_b "Outflux"
        extends OsmoticPort;

      annotation (
          defaultComponentName="port_b",
          Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,
                  100}}),     graphics={Rectangle(
                extent={{-20,10},{20,-10}},
                lineColor={127,127,0},
                lineThickness=1),       Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={127,127,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
          Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}),
              graphics={Rectangle(
                extent={{-40,40},{40,-40}},
                lineColor={127,127,0},
               fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
          Text(extent = {{-160,110},{40,50}}, lineColor = {127,127,0}, textString = "%name")}),
          Documentation(info="<html>
<p>
Connector with one flow signal of type Real.
</p>
</html>", revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));

      end OsmoticPort_b;

      partial model OnePort "Osmotic one port"

       OsmoticPort_a       q_in "Forward flux through membrane"
                              annotation (Placement(
              transformation(extent={{-110,-10},{-90,10}})));
        OsmoticPort_b       q_out "Backward flux through membrane"
                               annotation (Placement(
              transformation(extent={{90,-10},{110,10}})));
      equation
        q_in.q + q_out.q = 0;
        annotation ( Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end OnePort;

    end Interfaces;
    annotation (Documentation(revisions="<html>
<p>Copyright (c) 2008-2015, Marek Matej&aacute;k, Charles University in Prague </p>
<p>All rights reserved. </p>
<p>Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met: </p>
<ol>
<li>Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer. </li>
<li>Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution. </li>
<li>Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission. </li>
</ol>
<p>THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS &QUOT;AS IS&QUOT; AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.</p>
</html>",   info="<html>
<p>One of the basic phenomenon of biological systems is the osmotically-driven flow of water. This is always connected with semipermeable membranes. The different concentrations of impermeable solutes on both sides of the membrane causes the hydrostatic pressure at the concentrated side to rise. This pressure difference is called osmotic pressure. Osmotic pressure is linearly proportional to the concentration gradient of impermeable solutes. The osmolarity (osmotic concentration) is also one of the main indexes of human body balance, called homeostasis. Its value should not significantly deviate for a long period of time from a value of 285-295 mosm/l. </p>
<p>In Physiolibrary the osmotic connector OsmoticPort is composed of the osmotic concentration and the volumetric flux of permeable liquid. The two main blocks are called Membrane and OsmoticCell. Here, inside the membrane blocks, it is of course possible to also define hydraulic pressure and temperatures effects on both sides of membrane. </p>
</html>"));
  end ObsoleteOsmotic;

  package SteadyStates "Dynamic Simulation / Steady State"
    extends Modelica.Icons.Package;
    package Examples
      "Examples that demonstrate usage of the Pressure flow components"
    extends Modelica.Icons.ExamplesPackage;
      model SimpleReaction_in_Equilibrium
        import Physiolibrary.Obsolete.ObsoleteChemical;
        extends Modelica.Icons.Example;

        SteadyStates.Components.MolarConservationLaw
          amountOfSubstanceConservationLaw(
          n=2,
          Total(displayUnit="mol") = 1,
          Simulation=ObsoleteTypes.SimulationType.SteadyState)
          annotation (Placement(transformation(extent={{68,-44},{88,-24}})));
        ObsoleteChemical.Components.Substance A(Simulation=ObsoleteTypes.SimulationType.SteadyState,
            solute_start=0.9)
          annotation (Placement(transformation(extent={{-58,-10},{-38,10}})));
        ObsoleteChemical.Components.ChemicalReaction reaction(K=1)
          annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
        ObsoleteChemical.Components.Substance B(
          Simulation=ObsoleteTypes.SimulationType.SteadyState,
          isDependent=true,
          solute_start=0.1)
          annotation (Placement(transformation(extent={{42,-10},{62,10}})));

      equation
        connect(A.solute, amountOfSubstanceConservationLaw.fragment[1]) annotation (
            Line(
            points={{-42,-10},{-42,-39},{68,-39}},
            color={0,0,127}));
        connect(B.solute, amountOfSubstanceConservationLaw.fragment[2]) annotation (
            Line(
            points={{58,-10},{58,-37},{68,-37}},
            color={0,0,127}));
        connect(B.q_out,reaction. products[1]) annotation (Line(
            points={{52,0},{10,0}},
            color={107,45,134},
            thickness=1));
        connect(A.q_out,reaction. substrates[1]) annotation (Line(
            points={{-48,0},{-10,0}},
            color={107,45,134},
            thickness=1));
        annotation (Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end SimpleReaction_in_Equilibrium;

      model SimpleReaction_NormalInit
        import Physiolibrary.Obsolete.ObsoleteChemical;
        extends Modelica.Icons.Example;

        import Physiolibrary.Types.*;

        SteadyStates.Components.MolarConservationLaw
          amountOfSubstanceConservationLaw(
          n=2,
          Total(displayUnit="mol") = 1,
          Simulation=ObsoleteTypes.SimulationType.NormalInit)
          annotation (Placement(transformation(extent={{68,-44},{88,-24}})));
        ObsoleteChemical.Components.Substance A(Simulation=ObsoleteTypes.SimulationType.NormalInit,
            solute_start=0.9)
          annotation (Placement(transformation(extent={{-58,-10},{-38,10}})));
        ObsoleteChemical.Components.ChemicalReaction reaction(K=1)
          annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
        ObsoleteChemical.Components.Substance B(
          isDependent=true,
          Simulation=ObsoleteTypes.SimulationType.NormalInit,
          solute_start=0.1)
          annotation (Placement(transformation(extent={{42,-10},{62,10}})));

      equation
        connect(A.solute, amountOfSubstanceConservationLaw.fragment[1]) annotation (
            Line(
            points={{-42,-10},{-42,-39},{68,-39}},
            color={0,0,127}));
        connect(B.solute, amountOfSubstanceConservationLaw.fragment[2]) annotation (
            Line(
            points={{58,-10},{58,-37},{68,-37}},
            color={0,0,127}));
        connect(B.q_out,reaction. products[1]) annotation (Line(
            points={{52,0},{10,0}},
            color={107,45,134},
            thickness=1));
        connect(A.q_out,reaction. substrates[1]) annotation (Line(
            points={{-48,0},{-10,0}},
            color={107,45,134},
            thickness=1));
        annotation (Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end SimpleReaction_NormalInit;

      model SimpleReaction_InitSteadyState
        import Physiolibrary.Obsolete.ObsoleteChemical;
        extends Modelica.Icons.Example;

        import Physiolibrary.Types.*;

        SteadyStates.Components.MolarConservationLaw
          amountOfSubstanceConservationLaw(
          n=2,
          Total(displayUnit="mol") = 1,
          Simulation=ObsoleteTypes.SimulationType.InitSteadyState)
          annotation (Placement(transformation(extent={{68,-44},{88,-24}})));
        ObsoleteChemical.Components.Substance A(Simulation=ObsoleteTypes.SimulationType.InitSteadyState,
            solute_start=0.9)
          annotation (Placement(transformation(extent={{-58,-10},{-38,10}})));
        ObsoleteChemical.Components.ChemicalReaction reaction(K=1)
          annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
        ObsoleteChemical.Components.Substance B(
          isDependent=true,
          Simulation=ObsoleteTypes.SimulationType.InitSteadyState,
          solute_start=0.1)
          annotation (Placement(transformation(extent={{42,-10},{62,10}})));

      equation
        connect(A.solute, amountOfSubstanceConservationLaw.fragment[1]) annotation (
            Line(
            points={{-42,-10},{-42,-39},{68,-39}},
            color={0,0,127}));
        connect(B.solute, amountOfSubstanceConservationLaw.fragment[2]) annotation (
            Line(
            points={{58,-10},{58,-37},{68,-37}},
            color={0,0,127}));
        connect(B.q_out,reaction. products[1]) annotation (Line(
            points={{52,0},{10,0}},
            color={107,45,134},
            thickness=1));
        connect(A.q_out,reaction. substrates[1]) annotation (Line(
            points={{-48,0},{-10,0}},
            color={107,45,134},
            thickness=1));
        annotation (Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end SimpleReaction_InitSteadyState;

      model SimpleReaction2_in_Equilibrium
        import Physiolibrary.Obsolete.ObsoleteChemical;
      extends Modelica.Icons.Example;

        import Physiolibrary.Types.*;

        ObsoleteChemical.Components.Substance A(Simulation=ObsoleteTypes.SimulationType.SteadyState,
            solute_start=0.9)
          annotation (Placement(transformation(extent={{-68,-8},{-48,12}})));
        ObsoleteChemical.Components.ChemicalReaction reaction(K=1, nP=2)
          annotation (Placement(transformation(extent={{-34,-8},{-14,12}})));
        ObsoleteChemical.Components.Substance B(
          Simulation=ObsoleteTypes.SimulationType.SteadyState,
          isDependent=true,
          solute_start=0.1)
          annotation (Placement(transformation(extent={{2,-10},{22,10}})));

        ObsoleteChemical.Components.Substance C(
          Simulation=ObsoleteTypes.SimulationType.SteadyState,
          isDependent=true,
          solute_start=0.1)
          annotation (Placement(transformation(extent={{2,18},{22,38}})));

        Components.MolarConservationLaw totalB_ConservationLaw(
          n=2,
          Total(displayUnit="mol") = 1,
          Simulation=ObsoleteTypes.SimulationType.SteadyState)
          annotation (Placement(transformation(extent={{34,-10},{54,10}})));
        Components.MolarConservationLaw totalC_ConservationLaw(
          n=2,
          Total(displayUnit="mol") = 1,
          Simulation=ObsoleteTypes.SimulationType.SteadyState)
          annotation (Placement(transformation(extent={{34,18},{54,38}})));
      equation
        connect(A.q_out,reaction. substrates[1]) annotation (Line(
            points={{-58,2},{-34,2}},
            color={107,45,134},
            thickness=1));
        connect(reaction.products[1],B. q_out) annotation (Line(
            points={{-14,1.5},{-4,1.5},{-4,0},{12,0}},
            color={107,45,134},
            thickness=1));
        connect(reaction.products[2],C. q_out) annotation (Line(
            points={{-14,2.5},{-4,2.5},{-4,28},{12,28}},
            color={107,45,134},
            thickness=1));
        connect(A.solute, totalB_ConservationLaw.fragment[1])           annotation (
            Line(
            points={{-52,-8},{-52,-16},{26,-16},{26,-5},{34,-5}},
            color={0,0,127}));
        connect(B.solute, totalB_ConservationLaw.fragment[2])           annotation (
            Line(
            points={{18,-10},{18,-14},{24,-14},{24,-3},{34,-3}},
            color={0,0,127}));
        connect(C.solute, totalC_ConservationLaw.fragment[1]) annotation (Line(
            points={{18,18},{18,14},{26,14},{26,23},{34,23}},
            color={0,0,127}));
        connect(A.solute, totalC_ConservationLaw.fragment[2]) annotation (Line(
            points={{-52,-8},{-52,-16},{-70,-16},{-70,40},{26,40},{26,25},{34,
                25}},
            color={0,0,127}));

        annotation (Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end SimpleReaction2_in_Equilibrium;

      model O2_in_water
        import Physiolibrary.Obsolete.ObsoleteChemical;
      extends Modelica.Icons.Example;

        import Physiolibrary.Types.*;

      public
        ObsoleteChemical.Components.Substance oxygen_dissolved(
          Simulation=ObsoleteTypes.SimulationType.SteadyState,
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
        ObsoleteChemical.Components.GasSolubility gasSolubility(
          useHeatPort=true,
          kH_T0(displayUnit="(mmol/l)/kPa at 25degC") = 0.026029047188736,
          C=1700)
          annotation (Placement(transformation(extent={{-12,-28},{8,-8}})));
        ObsoleteChemical.Sources.UnlimitedGasStorage unlimitedGasStorage(
          Simulation=ObsoleteTypes.SimulationType.SteadyState,
          usePartialPressureInput=true,
          useHeatPort=true,
          T=295.15)
          annotation (Placement(transformation(extent={{-40,60},{-20,80}})));
      equation

        connect(temperature.y, prescribedTemperature.T) annotation (Line(
            points={{-73,-18},{-58,-18}},
            color={0,0,127}));
        connect(oxygen_dissolved.q_out, gasSolubility.q_in) annotation (Line(
            points={{-2,-46},{-2,-26}},
            color={107,45,134},
            thickness=1));
        connect(prescribedTemperature.port, gasSolubility.heatPort) annotation (
            Line(
            points={{-36,-18},{-2,-18}},
            color={191,0,0}));
        connect(oxygenPartialPressure.y, unlimitedGasStorage.partialPressure)
          annotation (Line(
            points={{-59,70},{-40,70}},
            color={0,0,127}));
        connect(unlimitedGasStorage.q_out, gasSolubility.q_out) annotation (Line(
            points={{-20,70},{-2,70},{-2,-8}},
            color={107,45,134},
            thickness=1));
        connect(prescribedTemperature.port, unlimitedGasStorage.heatPort)
          annotation (Line(
            points={{-36,-18},{-30,-18},{-30,70}},
            color={191,0,0}));
        annotation (         Documentation(info=
                     "<html>
<p>Partial pressure of oxygen in air is the air pressure multiplied by the fraction of the oxygen in air. Oxygen solubility</p>
</html>",   revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end O2_in_water;

      model Allosteric_Hemoglobin_MWC
        import Physiolibrary.Obsolete.ObsoleteChemical;
      extends Modelica.Icons.Example;

        import Physiolibrary.Types.*;

      //extends SteadyStates.Interfaces.SteadyStateSystem(
      //                                         Simulation=SteadyStates.SimulationType.SteadyState);
      //=States.SimulationType.NoInit); for dynamic simulation
      protected
        parameter Types.GasSolubility alpha=0.0105*1e-3
          "oxygen solubility in plasma"; // by Siggaard Andersen: 0.0105 (mmol/l)/kPa
        parameter Types.Fraction L=7.0529*10^6
          "=[T0]/[R0] .. dissociation constant of relaxed <-> tensed change of deoxyhemoglobin tetramer";
        parameter Types.Fraction c=0.00431555
          "=KR/KT .. ration between oxygen affinities of relaxed vs. tensed subunit";
        parameter Types.Concentration KR=0.000671946
          "oxygen dissociation on relaxed(R) hemoglobin subunit";   //*7.875647668393782383419689119171e-5
                                                                  //10.500001495896 7.8756465463794e-05

        parameter Types.Concentration KT=KR/c
          "oxygen dissociation on tensed(T) hemoglobin subunit";
      //  Types.Fraction sO2 "hemoglobin oxygen saturation";

      //  parameter Types.AmountOfSubstance totalAmountOfHemoglobin=1;
      //  Types.AmountOfSubstance totalAmountOfRforms;
      //  Types.AmountOfSubstance totalAmountOfTforms;

      public
        ObsoleteChemical.Components.Substance T0(
          stateName="T0",
          Simulation=ObsoleteTypes.SimulationType.SteadyState,
          solute_start=1)
          annotation (Placement(transformation(extent={{32,78},{52,98}})));

        ObsoleteChemical.Components.Substance T1(
          stateName="T1",
          Simulation=ObsoleteTypes.SimulationType.SteadyState,
          solute_start=0)
          annotation (Placement(transformation(extent={{34,36},{54,56}})));

        ObsoleteChemical.Components.Substance R1(
          stateName="R1",
          Simulation=ObsoleteTypes.SimulationType.SteadyState,
          solute_start=0,
          isDependent=true)
          annotation (Placement(transformation(extent={{-20,36},{0,56}})));

        ObsoleteChemical.Components.Substance T2(
          stateName="T2",
          Simulation=ObsoleteTypes.SimulationType.SteadyState,
          solute_start=0)
          annotation (Placement(transformation(extent={{34,-10},{54,10}})));

        ObsoleteChemical.Components.Substance R2(
          stateName="R2",
          Simulation=ObsoleteTypes.SimulationType.SteadyState,
          solute_start=0)
          annotation (Placement(transformation(extent={{-20,-10},{0,10}})));

        ObsoleteChemical.Components.Substance T3(
          stateName="T3",
          Simulation=ObsoleteTypes.SimulationType.SteadyState,
          solute_start=0)
          annotation (Placement(transformation(extent={{34,-54},{54,-34}})));

        ObsoleteChemical.Components.Substance R3(
          stateName="R3",
          Simulation=ObsoleteTypes.SimulationType.SteadyState,
          solute_start=0)
          annotation (Placement(transformation(extent={{-20,-54},{0,-34}})));

        ObsoleteChemical.Components.Substance T4(
          stateName="T4",
          Simulation=ObsoleteTypes.SimulationType.SteadyState,
          solute_start=0,
          isDependent=true)
          annotation (Placement(transformation(extent={{34,-92},{54,-72}})));

        ObsoleteChemical.Components.Substance R4(
          stateName="R4",
          Simulation=ObsoleteTypes.SimulationType.SteadyState,
          solute_start=0)
          annotation (Placement(transformation(extent={{-20,-92},{0,-72}})));

        ObsoleteChemical.Components.Substance R0(
          stateName="R0",
          Simulation=ObsoleteTypes.SimulationType.SteadyState,
          solute_start=0)
          annotation (Placement(transformation(extent={{-20,78},{0,98}})));

        ObsoleteChemical.Components.ChemicalReaction quaternaryForm(K=L)
          annotation (Placement(transformation(extent={{4,78},{24,98}})));
        ObsoleteChemical.Components.ChemicalReaction oxyR1(nP=2, K=KR/4) annotation (
            Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=90,
              origin={-10,64})));
        ObsoleteChemical.Components.ChemicalReaction oxyT1(nP=2, K=KT/4) annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={44,64})));
        ObsoleteChemical.Components.ChemicalReaction oxyR2(nP=2, K=KR/(3/2)) annotation (
            Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=90,
              origin={-10,22})));
        ObsoleteChemical.Components.ChemicalReaction oxyR3(nP=2, K=KR/(2/3)) annotation (
            Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=90,
              origin={-10,-24})));
        ObsoleteChemical.Components.ChemicalReaction oxyR4(nP=2, K=KR*4) annotation (
            Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=90,
              origin={-10,-66})));
        ObsoleteChemical.Components.ChemicalReaction oxyT2(nP=2, K=KT/(3/2)) annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={44,22})));
        ObsoleteChemical.Components.ChemicalReaction oxyT3(nP=2, K=KT/(2/3)) annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={44,-24})));
        ObsoleteChemical.Components.ChemicalReaction oxyT4(nP=2, K=KT*4) annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={44,-66})));
        ObsoleteChemical.Components.ChemicalReaction quaternaryForm1(K=c*L)
          annotation (Placement(transformation(extent={{8,36},{28,56}})));
        ObsoleteChemical.Components.ChemicalReaction quaternaryForm2(K=(c^2)*L)
          annotation (Placement(transformation(extent={{8,-10},{28,10}})));
        ObsoleteChemical.Components.ChemicalReaction quaternaryForm3(K=(c^3)*L)
          annotation (Placement(transformation(extent={{8,-54},{28,-34}})));
        ObsoleteChemical.Components.ChemicalReaction quaternaryForm4(K=(c^4)*L)
          annotation (Placement(transformation(extent={{10,-92},{30,-72}})));

        ObsoleteChemical.Components.Substance oxygen_unbound(solute_start=0.000001*
              7.875647668393782383419689119171e-5, Simulation=ObsoleteTypes.SimulationType.SteadyState)
          annotation (Placement(transformation(extent={{-56,-36},{-36,-16}})));
        Modelica.Blocks.Sources.Clock clock(offset=60)
          annotation (Placement(transformation(extent={{-94,52},{-74,72}})));
        SteadyStates.Components.MolarConservationLaw hemoglobinConservationLaw(
          n=10,
          Total(displayUnit="mol") = 1,
          Simulation=ObsoleteTypes.SimulationType.SteadyState)
          annotation (Placement(transformation(extent={{72,-2},{92,18}})));

        ObsoleteChemical.Sources.UnlimitedGasStorage O2_in_air(
          Simulation=ObsoleteTypes.SimulationType.SteadyState,
          T=295.15,
          usePartialPressureInput=true) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-66,32})));
        ObsoleteChemical.Components.GasSolubility gasSolubility(
          useHeatPort=false,
          kH_T0=0.026029047188736,
          C=1700)
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
            thickness=1));
        connect(oxyR1.products[2], oxygen_unbound.q_out)
                                            annotation (Line(
            points={{-9.5,74},{-46,74},{-46,-26}},
            color={107,45,134},
            thickness=1));
        connect(oxyR2.products[2], oxygen_unbound.q_out)
                                            annotation (Line(
            points={{-9.5,32},{-46,32},{-46,-26}},
            color={107,45,134},
            thickness=1));
        connect(oxyR3.products[2], oxygen_unbound.q_out)
                                            annotation (Line(
            points={{-9.5,-14},{-46,-14},{-46,-26}},
            color={107,45,134},
            thickness=1));
        connect(oxyR4.products[2], oxygen_unbound.q_out)
                                            annotation (Line(
            points={{-9.5,-56},{-46,-56},{-46,-26}},
            color={107,45,134},
            thickness=1));
        connect(oxyR1.substrates[1],R1. q_out) annotation (Line(
            points={{-10,54},{-10,46}},
            color={107,45,134},
            thickness=1));
        connect(R1.q_out,oxyR2. products[1]) annotation (Line(
            points={{-10,46},{-10,32},{-10.5,32}},
            color={107,45,134},
            thickness=1));
        connect(oxyR2.substrates[1],R2. q_out) annotation (Line(
            points={{-10,12},{-10,0}},
            color={107,45,134},
            thickness=1));
        connect(oxyR3.substrates[1],R3. q_out) annotation (Line(
            points={{-10,-34},{-10,-44}},
            color={107,45,134},
            thickness=1));
        connect(oxyR3.products[1],R2. q_out) annotation (Line(
            points={{-10.5,-14},{-10.5,-7},{-10,-7},{-10,0}},
            color={107,45,134},
            thickness=1));
        connect(R3.q_out,oxyR4. products[1]) annotation (Line(
            points={{-10,-44},{-10,-56},{-10.5,-56}},
            color={107,45,134},
            thickness=1));
        connect(oxyR4.substrates[1],R4. q_out) annotation (Line(
            points={{-10,-76},{-10,-82}},
            color={107,45,134},
            thickness=1));
        connect(oxyT1.products[1],T0. q_out) annotation (Line(
            points={{44.5,74},{44.5,88},{42,88}},
            color={107,45,134},
            thickness=1));
        connect(oxyT1.substrates[1],T1. q_out) annotation (Line(
            points={{44,54},{44,46}},
            color={107,45,134},
            thickness=1));
        connect(oxygen_unbound.q_out, oxyT1.products[2])
                                            annotation (Line(
            points={{-46,-26},{-46,74},{43.5,74}},
            color={107,45,134},
            thickness=1));
        connect(oxygen_unbound.q_out, oxyT2.products[2])
                                            annotation (Line(
            points={{-46,-26},{-46,32},{43.5,32}},
            color={107,45,134},
            thickness=1));
        connect(oxygen_unbound.q_out, oxyT3.products[2])
                                            annotation (Line(
            points={{-46,-26},{-46,-14},{43.5,-14}},
            color={107,45,134},
            thickness=1));
        connect(oxygen_unbound.q_out, oxyT4.products[2])
                                            annotation (Line(
            points={{-46,-26},{-46,-56},{43.5,-56}},
            color={107,45,134},
            thickness=1));
        connect(T1.q_out,oxyT2. products[1]) annotation (Line(
            points={{44,46},{44,32},{44.5,32}},
            color={107,45,134},
            thickness=1));
        connect(oxyT2.substrates[1],T2. q_out) annotation (Line(
            points={{44,12},{44,0}},
            color={107,45,134},
            thickness=1));
        connect(T2.q_out,oxyT3. products[1]) annotation (Line(
            points={{44,0},{44,-14},{44.5,-14}},
            color={107,45,134},
            thickness=1));
        connect(oxyT3.substrates[1],T3. q_out) annotation (Line(
            points={{44,-34},{44,-44}},
            color={107,45,134},
            thickness=1));
        connect(T3.q_out,oxyT4. products[1]) annotation (Line(
            points={{44,-44},{44,-56},{44.5,-56}},
            color={107,45,134},
            thickness=1));
        connect(oxyT4.substrates[1],T4. q_out) annotation (Line(
            points={{44,-76},{44,-82}},
            color={107,45,134},
            thickness=1));
        connect(R0.q_out,quaternaryForm. substrates[1]) annotation (Line(
            points={{-10,88},{4,88}},
            color={107,45,134},
            thickness=1));
        connect(R0.q_out,oxyR1. products[1]) annotation (Line(
            points={{-10,88},{-10,74},{-10.5,74}},
            color={107,45,134},
            thickness=1));
        connect(R1.q_out,quaternaryForm1. substrates[1]) annotation (Line(
            points={{-10,46},{8,46}},
            color={107,45,134},
            thickness=1));
        connect(quaternaryForm1.products[1],T1. q_out) annotation (Line(
            points={{28,46},{44,46}},
            color={107,45,134},
            thickness=1));
        connect(R2.q_out,quaternaryForm2. substrates[1]) annotation (Line(
            points={{-10,0},{8,0}},
            color={107,45,134},
            thickness=1));
        connect(quaternaryForm2.products[1],T2. q_out) annotation (Line(
            points={{28,0},{44,0}},
            color={107,45,134},
            thickness=1));
        connect(R3.q_out,quaternaryForm3. substrates[1]) annotation (Line(
            points={{-10,-44},{8,-44}},
            color={107,45,134},
            thickness=1));
        connect(quaternaryForm3.products[1],T3. q_out) annotation (Line(
            points={{28,-44},{44,-44}},
            color={107,45,134},
            thickness=1));
        connect(R4.q_out,quaternaryForm4. substrates[1]) annotation (Line(
            points={{-10,-82},{10,-82}},
            color={107,45,134},
            thickness=1));
        connect(quaternaryForm4.products[1],T4. q_out) annotation (Line(
            points={{30,-82},{44,-82}},
            color={107,45,134},
            thickness=1));
        connect(R4.solute, hemoglobinConservationLaw.fragment[1])        annotation (
            Line(
            points={{-4,-92},{-4,-98},{64,-98},{64,2.2},{72,2.2}},
            color={0,0,127}));
        connect(T4.solute, hemoglobinConservationLaw.fragment[2])        annotation (
            Line(
            points={{50,-92},{50,-98},{64,-98},{64,2.6},{72,2.6}},
            color={0,0,127}));
        connect(R3.solute, hemoglobinConservationLaw.fragment[3])        annotation (
            Line(
            points={{-4,-54},{64,-54},{64,3},{72,3}},
            color={0,0,127}));
        connect(T3.solute, hemoglobinConservationLaw.fragment[4])        annotation (
            Line(
            points={{50,-54},{64,-54},{64,3.4},{72,3.4}},
            color={0,0,127}));
        connect(R2.solute, hemoglobinConservationLaw.fragment[5])        annotation (
            Line(
            points={{-4,-10},{64,-10},{64,3.8},{72,3.8}},
            color={0,0,127}));
        connect(T2.solute, hemoglobinConservationLaw.fragment[6])        annotation (
            Line(
            points={{50,-10},{64,-10},{64,4.2},{72,4.2}},
            color={0,0,127}));
        connect(R1.solute, hemoglobinConservationLaw.fragment[7])        annotation (
            Line(
            points={{-4,36},{64,36},{64,4.6},{72,4.6}},
            color={0,0,127}));
        connect(T1.solute, hemoglobinConservationLaw.fragment[8])        annotation (
            Line(
            points={{50,36},{64,36},{64,5},{72,5}},
            color={0,0,127}));
        connect(R0.solute, hemoglobinConservationLaw.fragment[9])        annotation (
            Line(
            points={{-4,78},{64,78},{64,5.4},{72,5.4}},
            color={0,0,127}));
        connect(T0.solute, hemoglobinConservationLaw.fragment[10])        annotation (
           Line(
            points={{48,78},{64,78},{64,5.8},{72,5.8}},
            color={0,0,127}));
        connect(oxygen_unbound.q_out, gasSolubility.q_in) annotation (Line(
            points={{-46,-26},{-66,-26},{-66,-4}},
            color={107,45,134},
            thickness=1));
        connect(O2_in_air.q_out, gasSolubility.q_out) annotation (Line(
            points={{-66,22},{-66,14}},
            color={107,45,134},
            thickness=1));
        connect(clock.y, O2_in_air.partialPressure) annotation (Line(
            points={{-73,62},{-66,62},{-66,42}},
            color={0,0,127}));
        connect(R1.solute, oxygen_bound.u[1]) annotation (Line(
            points={{-4,36},{64,36},{64,-51.875},{71,-51.875}},
            color={0,0,127}));
        connect(T1.solute, oxygen_bound.u[2]) annotation (Line(
            points={{50,36},{64,36},{64,-51.625},{71,-51.625}},
            color={0,0,127}));
        connect(R2.solute, oxygen_bound.u[3]) annotation (Line(
            points={{-4,-10},{64,-10},{64,-51.375},{71,-51.375}},
            color={0,0,127}));
        connect(T2.solute, oxygen_bound.u[4]) annotation (Line(
            points={{50,-10},{64,-10},{64,-51.125},{71,-51.125}},
            color={0,0,127}));
        connect(R3.solute, oxygen_bound.u[5]) annotation (Line(
            points={{-4,-54},{64,-54},{64,-50.875},{71,-50.875}},
            color={0,0,127}));
        connect(T3.solute, oxygen_bound.u[6]) annotation (Line(
            points={{50,-54},{64,-54},{64,-50.625},{71,-50.625}},
            color={0,0,127}));
        connect(R4.solute, oxygen_bound.u[7]) annotation (Line(
            points={{-4,-92},{-4,-98},{64,-98},{64,-50.375},{71,-50.375}},
            color={0,0,127}));
        connect(T4.solute, oxygen_bound.u[8]) annotation (Line(
            points={{50,-92},{50,-98},{64,-98},{64,-50.125},{71,-50.125}},
            color={0,0,127}));
        connect(oxygen_bound.y, sO2_.u1) annotation (Line(
            points={{82.5,-51},{84,-51},{84,-52},{85,-52}},
            color={0,0,127}));
        connect(sO2_.u2, tHb.y) annotation (Line(
            points={{85,-58},{84,-58},{84,-65},{82.5,-65}},
            color={0,0,127}));
        connect(R0.solute, tHb.u[1]) annotation (Line(
            points={{-4,78},{64,78},{64,-65.9},{71,-65.9}},
            color={0,0,127}));
        connect(T0.solute, tHb.u[2]) annotation (Line(
            points={{48,78},{64,78},{64,-65.7},{71,-65.7}},
            color={0,0,127}));
        connect(R1.solute, tHb.u[3]) annotation (Line(
            points={{-4,36},{64,36},{64,-65.5},{71,-65.5}},
            color={0,0,127}));
        connect(T1.solute, tHb.u[4]) annotation (Line(
            points={{50,36},{64,36},{64,-65.3},{71,-65.3}},
            color={0,0,127}));
        connect(R2.solute, tHb.u[5]) annotation (Line(
            points={{-4,-10},{64,-10},{64,-65.1},{71,-65.1}},
            color={0,0,127}));
        connect(T2.solute, tHb.u[6]) annotation (Line(
            points={{50,-10},{64,-10},{64,-64.9},{71,-64.9}},
            color={0,0,127}));
        connect(R3.solute, tHb.u[7]) annotation (Line(
            points={{-4,-54},{64,-54},{64,-64.7},{71,-64.7}},
            color={0,0,127}));
        connect(T3.solute, tHb.u[8]) annotation (Line(
            points={{50,-54},{64,-54},{64,-64.5},{71,-64.5}},
            color={0,0,127}));
        connect(R4.solute, tHb.u[9]) annotation (Line(
            points={{-4,-92},{-4,-98},{64,-98},{64,-64.3},{71,-64.3}},
            color={0,0,127}));
        connect(T4.solute, tHb.u[10]) annotation (Line(
            points={{50,-92},{50,-98},{64,-98},{64,-64.1},{71,-64.1}},
            color={0,0,127}));
        annotation (         Documentation(info=
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
        "Allosteric hemoglobin model implemented by Speciation blocks"
        import Physiolibrary.Obsolete.ObsoleteChemical;

       extends
          Physiolibrary.Obsolete.ObsoleteChemical.Examples.Hemoglobin.Allosteric_Hemoglobin2_MWC;

      end Allosteric_Hemoglobin2_MWC;

      model Cells_SteadyState
        extends ObsoleteOsmotic.Examples.Cell(
          cells(Simulation=ObsoleteTypes.SimulationType.SteadyState,
              isDependent=true),
          interstitium(Simulation=ObsoleteTypes.SimulationType.SteadyState),
          interstitium1(Simulation=ObsoleteTypes.SimulationType.SteadyState),
          cells1(Simulation=ObsoleteTypes.SimulationType.SteadyState,
              isDependent=true));
        Components.MassConservationLaw waterConservationLaw(
          n=2,
          Simulation=ObsoleteTypes.SimulationType.SteadyState,
          Total(displayUnit="l") = 0.002)
          annotation (Placement(transformation(extent={{72,14},{92,34}})));
        Components.MassConservationLaw waterConservationLaw1(
          n=2,
          Simulation=ObsoleteTypes.SimulationType.SteadyState,
          Total(displayUnit="l") = 0.002)
          annotation (Placement(transformation(extent={{70,-92},{90,-72}})));
      equation

        connect(cells.volume, waterConservationLaw.fragment[1])
                                                           annotation (Line(
            points={{-28,36},{-28,19},{72,19}},
            color={0,0,127}));
        connect(interstitium.volume, waterConservationLaw.fragment[2])
                                                                  annotation (Line(
            points={{50,36},{50,21},{72,21}},
            color={0,0,127}));
        connect(cells1.volume, waterConservationLaw1.fragment[1])
                                                             annotation (Line(
            points={{-28,-64},{-28,-87},{70,-87}},
            color={0,0,127}));
        connect(interstitium1.volume, waterConservationLaw1.fragment[2])
                                                                    annotation (Line(
            points={{50,-64},{50,-85},{70,-85}},
            color={0,0,127}));
        annotation ();
      end Cells_SteadyState;
    end Examples;

    package Components
      extends Modelica.Icons.Package;

      model EnergyConservationLaw "System Energy conservation law"
        extends Interfaces.SteadyStateSystem; //(Simulation=ObsoleteTypes.SimulationType.SteadyState);
        extends Icons.ConservationLaw;

        parameter Integer n "Number of mass/energy fragments";

        Types.RealIO.EnergyInput fragment[n] "Mass/Energy fragment"
          annotation (Placement(transformation(extent={{-120,-60},{-80,-20}}),
              iconTransformation(extent={{-120,-60},{-80,-20}})));

        parameter Boolean useTotalInput = false
          "=true, if total mass/energy is used as an input"
          annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Types.Energy Total=1
          "Total mass/energy if useTotalAsInput=false"
          annotation (Dialog(enable=not useTotalInput));

        Types.RealIO.EnergyInput total(start=Total) = t if useTotalInput
          annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,80})));

        Types.Energy t "Current Mass/Energy";

      equation
        if not useTotalInput then
          t=Total;
        end if;

        t*normalizedState[1] = sum(fragment);

        //fragment[1] = homotopy( actual=Total*normalizedState[1] - sum(fragment[i] for i in 2:n), simplified=Total*normalizedState[1]*firstFragmentFraction);

        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics={Text(
                extent={{-160,-110},{160,-140}},
                lineColor={0,0,255},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid,
                textString="%name"),
              Text(
                extent={{-100,50},{100,24}},
                lineColor={0,0,0},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid,
                textString="Total(%Total)")}),
          Documentation(info="<html>
</html>"));
      end EnergyConservationLaw;

      model MassConservationLaw
        "System Mass (incompresible volume) conservation law"
        extends Interfaces.SteadyStateSystem; //(Simulation=ObsoleteTypes.SimulationType.SteadyState);
        extends Icons.ConservationLaw;

        parameter Integer n "Number of mass/energy fragments";

        Types.RealIO.VolumeInput fragment[n] "Mass/Energy fragment"
          annotation (Placement(transformation(extent={{-120,-60},{-80,-20}}),
              iconTransformation(extent={{-120,-60},{-80,-20}})));

        parameter Boolean useTotalInput = false
          "=true, if total mass/energy is used as an input"
          annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Types.Volume Total=1
          "Total mass/energy if useTotalAsInput=false"
          annotation (Dialog(enable=not useTotalInput));

        Types.RealIO.VolumeInput total(start=Total) = t if useTotalInput
          annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,80})));

        Types.Volume t "Current Mass/Energy";
      equation
        if not useTotalInput then
          t=Total;
        end if;

        t*normalizedState[1] = sum(abs(fragment));

        //fragment[1] = homotopy( actual=Total*normalizedState[1] - sum(fragment[i] for i in 2:n), simplified=Total*normalizedState[1]*firstFragmentFraction);

        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics={Text(
                extent={{-160,-110},{160,-140}},
                lineColor={0,0,255},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid,
                textString="%name"),
              Text(
                extent={{-100,50},{100,24}},
                lineColor={0,0,0},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid,
                textString="Total(%Total)")}),
          Documentation(info="<html>
</html>"));
      end MassConservationLaw;

      model MolarConservationLaw
        "System Amount of substance (=number of molecules) conservation law"
        extends Interfaces.SteadyStateSystem; //(Simulation=ObsoleteTypes.SimulationType.SteadyState);
        extends Icons.ConservationLaw;

        parameter Integer n "Number of mass/energy fragments";

        Types.RealIO.AmountOfSubstanceInput fragment[n]
          "Mass/Energy fragment" annotation (Placement(transformation(extent={{
                  -120,-60},{-80,-20}}), iconTransformation(extent={{-120,-60},
                  {-80,-20}})));

        parameter Boolean useTotalInput = false
          "=true, if total mass/energy is used as an input"
          annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Types.AmountOfSubstance Total=1
          "Total mass/energy if useTotalAsInput=false"
          annotation (Dialog(enable=not useTotalInput));

        Types.RealIO.AmountOfSubstanceInput total(start=Total) = t if useTotalInput
          annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,80})));

        Types.AmountOfSubstance t "Current Mass/Energy";
        Types.RealIO.AmountOfSubstanceOutput totalAmountOfSubstance
          annotation (Placement(transformation(extent={{90,-50},{110,-30}})));
      equation
        if not useTotalInput then
          t=Total;
        end if;

        t*normalizedState[1] = sum(abs(fragment));

        //fragment[1] = homotopy( actual=Total*normalizedState[1] - sum(fragment[i] for i in 2:n), simplified=Total*normalizedState[1]*firstFragmentFraction);
        totalAmountOfSubstance = t;

        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics={Text(
                extent={{-160,-110},{160,-140}},
                lineColor={0,0,255},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid,
                textString="%name"),
              Text(
                extent={{-100,50},{100,24}},
                lineColor={0,0,0},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid,
                textString="Total(%Total)")}),
          Documentation(info="<html>
</html>"));
      end MolarConservationLaw;

      model ElectricChargeConservationLaw
        "System amount of electric charge (=number of elementary charges) conservation law"
        extends Interfaces.SteadyStateSystem; //(Simulation=ObsoleteTypes.SimulationType.SteadyState);
        extends Icons.ConservationLaw;

        parameter Integer n "Number of mass/energy fragments";

        Types.RealIO.ElectricChargeInput fragment[n]
          "Mass/Energy fragment" annotation (Placement(transformation(extent={{
                  -120,-60},{-80,-20}}), iconTransformation(extent={{-120,-60},
                  {-80,-20}})));

        parameter Boolean useTotalInput = false
          "=true, if total mass/energy is used as an input"
          annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Types.ElectricCharge Total=1
          "Total mass/energy if useTotalAsInput=false"
          annotation (Dialog(enable=not useTotalInput));

        Types.RealIO.ElectricChargeInput total(start=Total) = t if useTotalInput
          annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,80})));

        Types.ElectricCharge t "Current Mass/Energy";
      equation
        if not useTotalInput then
          t=Total;
        end if;

        t*normalizedState[1] = sum(fragment);

        //fragment[1] = homotopy( actual=Total*normalizedState[1] - sum(fragment[i] for i in 2:n), simplified=Total*normalizedState[1]*firstFragmentFraction);

        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics={Text(
                extent={{-160,-110},{160,-140}},
                lineColor={0,0,255},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid,
                textString="%name"),
              Text(
                extent={{-100,50},{100,24}},
                lineColor={0,0,0},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid,
                textString="Total(%Total)")}),
          Documentation(info="<html>
</html>"));
      end ElectricChargeConservationLaw;

      model ElementaryChargeConservationLaw
        "System amount of electric charge (=number of elementary charges) conservation law"
        extends SteadyStates.Interfaces.SteadyStateSystem;
                                              //(Simulation=ObsoleteTypes.SimulationType.SteadyState);
        extends Icons.ConservationLaw;

        parameter Integer NumberOfParticles=1 "Number of mass/energy fragments";
        parameter Integer Charges[NumberOfParticles] = {1}
          "Elementary charges of particles";

        Types.RealIO.AmountOfSubstanceInput fragment[NumberOfParticles]
          "Mass/Energy fragment" annotation (Placement(transformation(extent={{
                  -120,-60},{-80,-20}}), iconTransformation(extent={{-120,-60},
                  {-80,-20}})));

        parameter Boolean useTotalInput = false
          "=true, if total mass/energy is used as an input"
          annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Types.ElectricCharge Total=1
          "Total mass/energy if useTotalAsInput=false"
          annotation (Dialog(enable=not useTotalInput));

        Types.RealIO.ElectricChargeInput total(start=Total) = t if
          useTotalInput annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,80})));

        Types.ElectricCharge t "Current Mass/Energy";
      equation
        if not useTotalInput then
          t=Total;
        end if;

        //original meaning:
        t*normalizedState[1] = Modelica.Constants.F*Charges*abs(fragment); //elementary charge from Eq to C

        //hacked, but still the same:  (because Dymola find steady state solution for specific problems in negative concentrations, when abs() not used)
        //t*normalizedState[1] = Modelica.Constants.F*(Charges[1]*(if noEvent(fragment[1]>=0) then fragment[1] else -fragment[1]) + sum(Charges[i]*fragment[i] for i in 2:NumberOfParticles));

         annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics={Text(
                extent={{-160,-110},{160,-140}},
                lineColor={0,0,255},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid,
                textString="%name"),
              Text(
                extent={{-100,50},{100,24}},
                lineColor={0,0,0},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid,
                textString="Total(%Total)")}),
          Documentation(info="<html>
</html>"));
      end ElementaryChargeConservationLaw;
    end Components;

    package Interfaces
      extends Modelica.Icons.InterfacesPackage;

      partial model SteadyState
        "Abstract class for any dynamic state calculation (for any derivation), which is driven by ObsoleteTypes.SimulationType option."
        //allow to switch between dynamic mode 'der(y)=x' and steady-state mode 'der(y)=0'

        replaceable package Utilities = ObsoleteTypes.FilesUtilities (
                                                             directoryName=dirName)
                                                                        constrainedby
          ObsoleteTypes.Utilities
                          "How to store or load the values"
                       annotation (Dialog(group="Functions to read or store",tab="IO"));

        parameter ObsoleteTypes.SimulationType Simulation=ObsoleteTypes.SimulationType.NormalInit
          "Dynamic with Initialization or Steady State" annotation (
          Evaluate=true,
          HideResult=true,
          Dialog(group="Simulation", tab="Equilibrium"));

        parameter Boolean isDependent = false
          "=true, If zero flow is propagated in eqiulibrium through resistors, impedances, reactions, etc."
          annotation (Evaluate=true, HideResult=true, Dialog(group="Simulation",tab="Equilibrium"));

        parameter Real state_start "State start or init value"
         annotation (HideResult=true,Dialog(enable=false,group="Initialization", tab="IO"));

        Real state(start=if LOAD_STARTS then Utilities.readReal(stateName, storeUnit) else
       state_start, stateSelect=StateSelect.prefer)
          "This state must be connected in inherited class definition"
          annotation (HideResult=true);
        Real change "Dynamic change of state value per minute" annotation (HideResult=true);

        constant String dirName = "io" "Directory name to save and load values"
          annotation (HideResult=true, Dialog(group="Value I/O",tab="IO"));

        parameter String storeUnit="" "Unit in Utilities input/output function"
           annotation (Evaluate=true, HideResult=true, Dialog(group="Value I/O",tab="IO"));

        parameter String stateName=getInstanceName()
          "Name in Utilities input/output function"
           annotation (Evaluate=true, HideResult=true, Dialog(group="Value I/O",tab="IO"));

        parameter Boolean LOAD_STARTS = false "Load start value of state"
           annotation (Evaluate=true, HideResult=true, Dialog(group="Value I/O",tab="IO"));

        parameter Boolean SAVE_RESULTS = false "Save final state values"
           annotation (Evaluate=true, HideResult=true, Dialog(group="Value I/O",tab="IO"));

        parameter Boolean SAVE_COMPARISON = false
          "Compare final state values with original values"
           annotation (Evaluate=true, HideResult=true, Dialog(group="Value I/O",tab="IO"));

      protected
        parameter Real defaultValue(fixed=false) "Default value of state.";
        parameter Real initialValue(fixed=false) "Initial value of state.";

      initial equation

        if Simulation == ObsoleteTypes.SimulationType.NormalInit then
          state = state_start;
        elseif Simulation == ObsoleteTypes.SimulationType.ReadInit then
          state = Utilities.readReal(stateName, storeUnit);
        elseif Simulation == ObsoleteTypes.SimulationType.InitSteadyState and
            not isDependent then
          der(state)=0;  //here it have the same meaning as "change = 0", because of equation "der(state) = change"
        end if;

        initialValue = state; //in causality such as initialValue:=state
        if SAVE_COMPARISON then
          defaultValue = Utilities.readReal(stateName, storeUnit);
        else
          defaultValue = Modelica.Constants.N_A;
        end if;
      equation

        when terminal() then
          if SAVE_RESULTS then
            Utilities.writeReal(
              stateName,
              state,
              storeUnit);
          end if;
          if SAVE_COMPARISON then
            Utilities.writeComparison(
              stateName,
              defaultValue,
              initialValue,
              state,
              storeUnit);
          end if;
        end when;

        if Simulation <> ObsoleteTypes.SimulationType.SteadyState then
          der(state) = change;
        elseif not isDependent then   /*** this test and equation exclusion could be done automatically, if the solver will be so smart that it removes all this dependent equations from the total equilibrated system. The most probable form of this dependent equation in equilibrium setting is (0 = 0). ***/
           change = 0;
        end if;

        annotation (Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end SteadyState;

      partial model SteadyStates
        "Abstract class for any dynamic states calculation (for any derivations), which is driven by ObsoleteTypes.SimulationType option."
        //allow to switch between dynamic mode 'der(y)=x' and steady-state mode 'der(y)=0'

        replaceable package Utilities = ObsoleteTypes.FilesUtilities    constrainedby
          ObsoleteTypes.Utilities
                          "How to store or load the values"
                       annotation (Dialog(group="Functions to read or store",tab="IO"));

        parameter Integer n "Number of states"
          annotation (Dialog(group="Simulation"));

        Real state[n](start=state_start, stateSelect=StateSelect.prefer)
          "This state must be connected in inherited class definition";

        Real change[n] "Dynamic change of state value per minute";

        parameter Real state_start[n] "State start or init value"
         annotation (Dialog(enable=false,group="Initialization", tab="IO"));

        parameter ObsoleteTypes.SimulationType Simulation=ObsoleteTypes.SimulationType.NormalInit
          "Dynamic with Initialization or Steady State"
          annotation (Dialog(group="Simulation", tab="Equilibrium"));

        constant String dirName = "io" "Directory name to save and load values"
          annotation (HideResult=true, Dialog(group="Value I/O",tab="IO"));

        parameter Boolean SAVE_RESULTS = false
          "save and test final state values with original values"
           annotation (Dialog(group="Value I/O",tab="IO"));
        parameter Boolean SAVE_COMPARISON = false
          "Compare final state values with original values"
           annotation (Evaluate=true, HideResult=true, Dialog(group="Value I/O",tab="IO"));

        parameter String storeUnit[n]=fill("",n)
          "Unit in Utilities input/output function"
           annotation (Dialog(group="Value I/O",tab="IO"));

        parameter String stateName[n]=fill(getInstanceName(),n)
          "Name in Utilities input/output function"
           annotation (Dialog(group="Value I/O",tab="IO"));

        parameter Boolean isDependent[n]= fill(false,n)
          "=true, If zero flow is propagated in eqiulibrium through resistors, impedances, reactions, etc."
          annotation (Dialog(group="Simulation",tab="Equilibrium"));

      protected
        parameter Real defaultValue[n](fixed=false) "Default value of state.";
        parameter Real initialValue[n](fixed=false) "Initial value of state.";

      initial equation
        for i in 1:n loop
          if Simulation == ObsoleteTypes.SimulationType.NormalInit then
          state[i] = state_start[i];
          elseif Simulation == ObsoleteTypes.SimulationType.ReadInit then
            state[i] = Utilities.readReal(stateName[i] + "[" +String(i)+"]", storeUnit[i]);
          elseif Simulation == ObsoleteTypes.SimulationType.InitSteadyState
               and not isDependent[i] then
          der(state[i])=0;  //here it have the same meaning as "change = 0", because of equation "der(state) = change"
        end if;

        initialValue = state; //in causality such as initialValue:=state
        if SAVE_COMPARISON then
          defaultValue[i] = Utilities.readReal(stateName[i]+ "[" +String(i)+"]", storeUnit[i]);
        else
          defaultValue[i] = Modelica.Constants.N_A;
        end if;
        end for;
      equation

        when terminal() then
          if SAVE_RESULTS then
            for i in 1:n loop
              Utilities.writeReal(
                stateName[i]+ "[" +String(i)+"]",
                state[i],
                storeUnit[i]);
            end for;
          end if;
          if SAVE_COMPARISON then
            for i in 1:n loop
              Utilities.writeComparison(
                stateName[i]+ "[" +String(i)+"]",
                defaultValue[i],
                initialValue[i],
                state[i],
                storeUnit[i]);
            end for;
          end if;
        end when;

        if Simulation <> ObsoleteTypes.SimulationType.SteadyState then
          der(state) = change;
        else
          for i in 1:n loop
            if not isDependent[n] then   /*** this test and equation exclusion could be done automatically, if the solver will be so smart that it removes all this dependent equations from the total equilibrated system. The most probable form of this dependent equation in equilibrium setting is (0 = 0). ***/
              change[i] = 0;
            end if;
          end for;
        end if;

        annotation (Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end SteadyStates;

      partial class SteadyStateSystem
        "Global abstract class, for additional global state equations"

        parameter ObsoleteTypes.SimulationType Simulation(start=ObsoleteTypes.SimulationType.NormalInit)
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
        if (Simulation == ObsoleteTypes.SimulationType.SteadyState) or (
            Simulation == ObsoleteTypes.SimulationType.InitSteadyState) then
          state=ones(NumberOfDependentStates);
        end if;
      equation

        if Simulation == ObsoleteTypes.SimulationType.SteadyState then
          normalizedState = ones(NumberOfDependentStates); //add additional global steady-state equations
          der(state)=zeros(NumberOfDependentStates);       //remove 'state' from system calculations
        else
          normalizedState = state; //nothing special, just definition of 'state' variable

          //Correct definition of normalizedState should fulfill the equation 'normalizedState=ones(NumberOfDependentStates)' during simulation.
          //The difference from vector 'ones(NumberOfDependentStates)' could be used as the solver calculation error vector.
        end if;

        annotation ( Documentation(revisions="<html>
<p><i>2013-2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end SteadyStateSystem;
    end Interfaces;
    annotation (Documentation(revisions="<html>
<p>Copyright (c) 2008-2015, Marek Matej&aacute;k, Charles University in Prague </p>
<p>All rights reserved. </p>
<p>Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met: </p>
<ol>
<li>Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer. </li>
<li>Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution. </li>
<li>Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission. </li>
</ol>
<p>THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS &QUOT;AS IS&QUOT; AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.</p>
</html>",   info="<html>
<p>One of the main question in clinical medicine is how to stabilize the patient. In the fact of the oscillating heart, breathing, circadian rhythm or menstruation cycle the model could be designed as non-oscillating with variables such as period times, amplitudes, frequencies, mean values and other phase space variables. This type of model has better numerical stability for longer simulation time and even more it can be &QUOT;stabilized&QUOT;. This stabilization we called steady state. </p>
<p>To be mathematically exact, we define an <i><b>steady state system</b></i> (SSS) as a non-differential system derived from a original differential system (DS) by using zero derivations and by adding <b>additional steady state equations</b> (ASSE). The number of the ASSE must be the same as the number of algebraically dependent equations in the non-differential system derived from DS by setting zero derivations. The ASSE describes the system from the top view mostly such as the equations of mass conservation laws or the boundary equation of environment sources. To define a model as an SSS the user must switch each Simulation parameter in each block to value ObsoleteTypes.SimulationType.SteadyState and must have correctly defined all necessary ASSE. This setting caused to ignoring any start values for any state and add zero derivation equations instead. Today does not exist Modelica environment, which could automatically find and remove generated dependent equations by this way. So the correct number of states must be marked as dependent (parameter isDependent) and the same number of ASSE must be inserted. Despite the fact, that model in this steady-state setting will be not locally balanced it should be globally balanced and without any dependent equation.</p>
<p>Adding of one ASSE is possible by inserting and connecting of the energy or mass conservation law block from package SteadyState.Components. Other possibilities is in blocks of environment&nbsp; sources, where the setting of parameter isIsolatedInSteadyState&nbsp; add the equation of the zero mass/volume/energy flow from or to environment. </p>
<p>The model in steady state often changes to one big nonlinear strong component, but without solver stiff or convergence problems. Especially in quick chemical reaction kinetics is not necessary to have very rapid molar fluxes, when it always reach equilibrium. This design also approve to create steady stated parts in dynamical model without huge rebuilding. It also&nbsp; brings other benefits. To see these possibilities, one have to realize that conservation laws could be invariances in a dynamical simulation. This is really useful for debugging. </p>
<p>It is always a big challenge to nicely solve initial values of differential system. However, it should be possible to solve the SSS in initial phase. And this is the idea behind the ObsoleteTypes.SimulationTypes.InitSteadyState option for models already extended with ASSE to support SSS. </p>
</html>"));
  end SteadyStates;

  package ObsoleteTypes
    "Obsolete types and classes from previous Physiolibrary versions"
    //extends Modelica.Icons.TypesPackage;
    extends Modelica.Icons.Package;
  //If you have an idea to add the next physiological type to the next version, please write me at marek@matfyz.cz. Thank you

    package UsersGuide "User's Guide"
      extends Modelica.Icons.Information;

    class NewType "Adding new type"
      extends Modelica.Icons.Information;

     annotation (Documentation(info="<html>
<p>Definition of new type (&QUOT;QuantityX&QUOT;) in Physiolibrary:</p>
<ul>
<li>Define base type Types.QuantityX with SI units in &QUOT;final unit&QUOT;, default display units and nominal (e.g. value of one display unit at SI units). </li>
</ul>
<p>Optional: </p>
<ul>
<li>Define typed input and output connectors for QuantityX: Types.RealIO.QuantityXInput and Types.RealIO.QuantityXOutput. </li>
<li>Define typed constant for QuantityX: Types.Constants.QuantityXConst </li>
<li>Define typed RealInputParameter for QuantityX: Types.RealInputParameters.QuantityX </li>
<li>Define typed replaceable variable RealTypes for QuantityX: Types.RealTypes.QuantityX </li>
</ul>
</html>"));
    end NewType;

    annotation (DocumentationClass=true, Documentation(info="<html>
<p>Package <b>Physiolibrary</b> is a modelica package for <b>Human Physiology</b> that is developed from <b>HumMod</b> modelica implementation, see <a href=\"http://patf-biokyb.lf1.cuni.cz/wiki/hummod/hummod\">http://hummod.org</a>. It provides constants, types, connectors, partial models and model components fitted for physiological models of human body. </p>
<p>This is a short <b>User&apos;s Guide</b> for the overall library. Some of the main sublibraries have their own User&apos;s Guides that can be accessed by the following links: </p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td valign=\"top\"><p>Types </p></td>
<td valign=\"top\"><p>Physiological types. Physiological unit vs. SI units, nominals, inputs/outputs, typed constants.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>Blocks</p></td>
<td valign=\"top\"><p>Useful blocks, that are missing in package Modelica.Blocks (MSL 3.2), cubic interpolation curves, multiplication factors.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>Chemical</p></td>
<td valign=\"top\"><p>Library to chemical subsystems such as intravascular, interstitial or intracellular chemical substances in fluxes and interactions.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>Hydraulic</p></td>
<td valign=\"top\"><p>Library to hydraulic subsystems such as in cardiovascular system.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>Thermal</p></td>
<td valign=\"top\"><p>Library of termoregulation support.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>Osmotic</p></td>
<td valign=\"top\"><p>Library to model water fluxes through semipermeable membrane caused by osmotic pressure.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>Mixed</p></td>
<td valign=\"top\"><p>Library to join domains above together.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>Icons</p></td>
<td valign=\"top\"><p>Icons</p></td>
</tr>
<tr>
<td valign=\"top\"><p>FileUtilities</p></td>
<td valign=\"top\"><p>Read/write values from/to file. </p></td>
</tr>
</table>
</html>"));
    end UsersGuide;

    package Examples
      "Examples that demonstrate usage of the Pressure flow components"
    extends Modelica.Icons.ExamplesPackage;
      model Units
      extends Modelica.Icons.Example;
       model ParametricClass

         import Physiolibrary.Types.*;

        parameter Temperature temperature;
        parameter Heat heat;
        parameter Pressure pressure;
        parameter Volume volume;
        parameter AmountOfSubstance amountOfSubstance;
        parameter ElectricCharge electricCharge;
        parameter ElectricCurrent electricCurrent;

        parameter Time time_;
        parameter Energy energy;
        parameter Mass mass;
        parameter ElectricPotential electricalPotential;
        parameter MassFlowRate massFlowRate;
        parameter Density density;
        parameter Height height;
        parameter Acceleration acceleration;

        parameter VolumeFlowRate volumeFlowRate;
        parameter Concentration concentration;
        parameter Osmolarity osmolarity;

        parameter MolarFlowRate molarFlowRate;
         parameter HeatFlowRate heatFlowRate;
        parameter ThermalConductance thermalConductance;
        parameter SpecificHeatCapacity specificHeatCapacity;
        parameter SpecificEnergy specificEnergy(displayUnit="cal/g");

        parameter Fraction fraction;
        parameter OsmoticPermeability osmoticPermeability;
        parameter DiffusionPermeability diffusionPermeability;
        parameter HydraulicConductance hydraulicConductance;
        parameter HydraulicInertance hydraulicInertance;
        parameter GasSolubility gasSolubility;

        parameter AmountOfSubstance gasSTP(displayUnit="litre_STP");
        parameter AmountOfSubstance gasSATP(displayUnit="litre_SATP");
        parameter AmountOfSubstance gasNIST(displayUnit="litre_NIST");

       end ParametricClass;

        ParametricClass parametricClass(
          acceleration=1,
          concentration=1,
          osmolarity=1,
          gasSTP(displayUnit="litre_STP") = 0.0440316172572,
          mass(displayUnit="ug") = 1e-09,
          temperature=274.15,
          heat=4186.8,
          pressure=133.322387415,
          volume=1e-06,
          amountOfSubstance=0.001,
          electricCharge=96.4853399,
          electricCurrent=1.6080889983333,
          time_=60,
          energy=4186.8,
          electricalPotential=0.001,
          massFlowRate=1.6666666666667e-08,
          density=1000,
          height=0.01,
          volumeFlowRate=1.6666666666667e-08,
          molarFlowRate=1.6666666666667e-05,
          heatFlowRate=69.78,
          thermalConductance=69.78,
          specificHeatCapacity=4186.8,
          specificEnergy=4186.8,
          fraction=0.01,
          osmoticPermeability=1.2501026264094e-10,
          diffusionPermeability=1.6666666666667e-08,
          hydraulicConductance=1.2501026264094e-10,
          hydraulicInertance=479960594694.0,
          gasSolubility=2.4789568751177,
          gasSATP=0.040339548059044,
          gasNIST=0.041571199502531)
          annotation (Placement(transformation(extent={{-14,8},{6,28}})));
        annotation (
       Documentation(info="<html>
<p>If your environment fully support the physiological units, then the user dialog of setting parameters should display only values &QUOT;1&QUOT; of physiological unit.</p>
</html>"));
      end Units;

      package IO_Bus
        import Physiolibrary;
        extends Physiolibrary.Obsolete.ObsoleteTypes.IO_Bus;

        redeclare model extends Variables "Example of subsystem outputs"

          T.Pressure Bone_PO2(varName="Bone-Flow.PO2")
            "Partial oxygen pressure in bone blood venules."
          annotation (Placement(transformation(extent={{-80,24},{2,106}})));
          T.VolumeFlowRate BoneBloodFlow(varName="Bone-Flow.BloodFlow")
            "Blood flow through bones"
          annotation (Placement(transformation(extent={{-80,-10},{2,72}})));
          T.MolarFlowRate BoneO2Need(varName="Bone-Metabolism.O2-Need")
            "Current desired delivery flow of oxygen to bone metabolism"
          annotation (Placement(transformation(extent={{-80,-50},{2,32}})));
          T.Volume BoneLiquidVol(varName="Bone-Tissue.LiquidVol")
            "The extravascular water in bones. "
          annotation (Placement(transformation(extent={{-80,-92},{2,-10}})));

        equation
          connect(Bone_PO2.y, busConnector.Bone_PO2) annotation (Line(
              points={{6.1,65},{70.05,65},{70.05,-2},{90,-2}},
              color={0,0,127}), Text(
              string="%second",
              index=1,
              extent={{6,3},{6,3}}));
          connect(BoneBloodFlow.y, busConnector.Bone_BloodFlow)
                                                           annotation (Line(
              points={{6.1,31},{71.05,31},{71.05,-2},{90,-2}},
              color={0,0,127}), Text(
              string="%second",
              index=1,
              extent={{6,3},{6,3}}));
          connect(BoneO2Need.y, busConnector.Bone_O2Need)
                                                        annotation (Line(
              points={{6.1,-9},{71.05,-9},{71.05,-2},{90,-2}},
              color={0,0,127}), Text(
              string="%second",
              index=1,
              extent={{6,3},{6,3}}));
          connect(BoneLiquidVol.y, busConnector.Bone_LiquidVol)
                                                           annotation (Line(
              points={{6.1,-51},{71.05,-51},{71.05,-2},{90,-2}},
              color={0,0,127}), Text(
              string="%second",
              index=1,
              extent={{6,3},{6,3}}));
          annotation ();
        end Variables;

        model Test
          import Physiolibrary;
          extends Modelica.Icons.Example;

          Physiolibrary.Types.BusConnector busConnector
            annotation (Placement(transformation(extent={{-4,-2},{36,38}})));
          IO_Bus.OutputToFile outputToFile
            annotation (Placement(transformation(extent={{70,48},{90,68}})));
          Physiolibrary.Types.Constants.PressureConst
                     Bone_PO2(k=5599.54027143)
            "Partial oxygen pressure in bone blood venules."
          annotation (Placement(transformation(extent={{-90,70},{-70,90}})));
          Physiolibrary.Types.Constants.VolumeFlowRateConst
                           BoneBloodFlow(k=5.3333333333333e-06)
            "Blood flow through bones"
          annotation (Placement(transformation(extent={{-90,30},{-70,50}})));
          Physiolibrary.Types.Constants.MolarFlowRateConst
                          BoneO2Need(k(displayUnit="ml_STP/min") = 1.027404402668e-05)
            "Current desired delivery flow of oxygen to bone metabolism"
          annotation (Placement(transformation(extent={{-90,-34},{-70,-14}})));
          Physiolibrary.Types.Constants.VolumeConst
                   BoneLiquidVol(k=0.0027) "The extravascular water in bones. "
          annotation (Placement(transformation(extent={{-90,-70},{-70,-50}})));
          IO_Bus.OutputToFile_SI outputToFile_SI
            annotation (Placement(transformation(extent={{72,-26},{92,-6}})));
        equation
          connect(busConnector, outputToFile.busConnector) annotation (Line(
              points={{16,18},{48,18},{48,58},{80,58}},
              color={255,204,51},
              thickness=0.5));
          connect(Bone_PO2.y, busConnector.Bone_PO2) annotation (Line(
              points={{-67.5,80},{-11.95,80},{-11.95,18},{16,18}},
              color={0,0,127}), Text(
              string="%second",
              index=1,
              extent={{6,3},{6,3}}));
          connect(BoneBloodFlow.y, busConnector.Bone_BloodFlow)
                                                           annotation (Line(
              points={{-67.5,40},{-10.95,40},{-10.95,18},{16,18}},
              color={0,0,127}), Text(
              string="%second",
              index=1,
              extent={{6,3},{6,3}}));
          connect(BoneO2Need.y, busConnector.Bone_O2Need)
                                                        annotation (Line(
              points={{-67.5,-24},{-10.95,-24},{-10.95,18},{16,18}},
              color={0,0,127}), Text(
              string="%second",
              index=1,
              extent={{6,3},{6,3}}));
          connect(BoneLiquidVol.y, busConnector.Bone_LiquidVol)
                                                           annotation (Line(
              points={{-67.5,-60},{-10.95,-60},{-10.95,18},{16,18}},
              color={0,0,127}), Text(
              string="%second",
              index=1,
              extent={{6,3},{6,3}}));
          connect(busConnector, outputToFile_SI.busConnector) annotation (Line(
              points={{16,18},{48,18},{48,-16},{82,-16}},
              color={255,204,51},
              thickness=0.5), Text(
              string="%first",
              index=-1,
              extent={{-6,3},{-6,3}}));
        end Test;
        annotation (Documentation(info="<html>
<p>Subsystem initial and terminal data manipulations using busConnector (Physiomodel expandable connector).</p>
<h4>Be surre, that the directory &QUOT;io&QUOT; is in working directory (File-&GT;Change Directory...)!</h4>
<p>Implementation:</p>
<p>Model should be divided into subsystems, which has <b>output</b> variables grouped to busConnector (variables, which are inputs to other subsystems). For each subsystem S: <b>all</b> these variables should be defined in <b>extended redeclared</b> class S.IO_Bus.Variables, where package S.IO_Bus is <b>extended</b> from Physiolibrary.Types.IO_Bus. </p>
<p>Usage:</p>
<p>For loading values in SI units of these variables from file &QUOT;io/input_SI.txt&QUOT; use block S.IO_Bus.InputFromFile_SI.</p>
<p>For loading values in non-SI units of these variables from file &QUOT;io/input.txt&QUOT; use block S.IO_Bus.InputFromFile.</p>
<p>For storing values in SI units of these variables from file &QUOT;io/output_SI.txt&QUOT; use block S.IO_Bus.OutputToFile_SI.</p>
<p>For storing values in non-SI units of these variables from file &QUOT;io/output.txt&QUOT; use block S.IO_Bus.OutputToFile.</p>
<p>For comparison values in SI units of these variables with file &QUOT;io/input_SI.txt&QUOT; use block S.IO_Bus.OutputComparison_SI and result will be stored as &QUOT;io/comparison_SI.txt&QUOT;.</p>
<p>For comparison values in non-SI units of these variables with file &QUOT;io/input.txt&QUOT; use block S.IO_Bus.OutputComparison and result will be stored as &QUOT;io/comparison.txt&QUOT;.</p>
</html>"));
      end IO_Bus;
    end Examples;

    package ScaleConstants
        extends Modelica.Icons.SourcesPackage;

    block Power "Constant signal of type Power per Mass"
     import Physiolibrary.Types.*;
     parameter PowerPerMass k "Constant Power output value";
          RealIO.PowerOutput y "Power constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
      RealIO.MassInput mass annotation (Placement(transformation(extent={{-20,20},{20,
                60}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,40})));
    equation
          y=k*mass;
      annotation (defaultComponentName="power",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end Power;
    end ScaleConstants;

    partial package IO_Bus "Subsystem outputs manipulation"
      extends Modelica.Icons.VariantsPackage;

      replaceable package PhysiolibTypesRealTypes = RealTypes
        "Redefine this package only if there are not possible to use Physiolibrary types for variables!";

      replaceable partial model Variables
        "Subsystem output busConnector variables"
        package T = PhysiolibTypesRealTypes;

        replaceable block BooleanVariable =
          BooleanExtension.Parameter constrainedby
          Physiolibrary.Obsolete.ObsoleteTypes.AbstractBoolean;

        Physiolibrary.Types.BusConnector busConnector annotation (Placement(transformation(extent={{
                  80,-12},{100,8}}), iconTransformation(extent={{-10,-10},{10,10}})));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                  -100,-100},{100,100}}), graphics={Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={0,0,255},
                fillColor={215,215,215},
                fillPattern=FillPattern.Solid), Text(
                extent={{-200,-100},{200,-140}},
                lineColor={0,0,255},
                fillColor={215,215,215},
                fillPattern=FillPattern.Solid,
                textString="%name")}),        Documentation(revisions="<html>
</html>"));
      end Variables;

      model InputFromFile = Variables(T(
        redeclare block Variable =
              RealExtension.InputParameter),
        redeclare block BooleanVariable =
              BooleanExtension.InputParameter)
        "Load values in non-SI units from file io/input.txt"                                                            annotation (
          Documentation(revisions="<html>
</html>"));

      model OutputToFile = Variables(T(
        redeclare block Variable =
              RealExtension.OutputFinal),
        redeclare block BooleanVariable =
              BooleanExtension.OutputFinal)
        "Store values in non-SI units to file io/output.txt"                                                         annotation (
          Documentation(revisions="<html>
</html>"));

      model OutputComparison = Variables(T(
        redeclare block Variable =
              RealExtension.OutputComparison),
        redeclare block BooleanVariable =
              BooleanExtension.OutputComparison)
        "Compare values in non-SI units with file io/input.txt and store results to io/comparison.txt"      annotation (
          Documentation(revisions="<html>
</html>"));

      model InputFromFile_SI = Variables(T(
        redeclare block Variable =
              RealExtension.InputParameter_SI),
        redeclare block BooleanVariable =
              BooleanExtension.InputParameter)
        "Load values in SI units from file io/input_SI.txt"                                                            annotation (
          Documentation(revisions="<html>
</html>"));

      model OutputToFile_SI = Variables(T(
        redeclare block Variable =
              RealExtension.OutputFinal_SI),
        redeclare block BooleanVariable =
              BooleanExtension.OutputFinal)
        "Store values in SI units to file io/output_SI.txt"                                                         annotation (
          Documentation(revisions="<html>
</html>"));

      model OutputComparison_SI = Variables(T(
        redeclare block Variable =
              RealExtension.OutputComparison_SI),
        redeclare block BooleanVariable =
              BooleanExtension.OutputComparison)
        "Compare values in SI units with file io/input_SI.txt and store results to io/comparison_SI.txt"    annotation (
          Documentation(revisions="<html>
</html>"));

      annotation (Documentation(revisions="<html>
</html>",     info="<html>
<p>Subsystem initial and terminal data manipulations using busConnector (Physiomodel expandable connector).</p>
<h4>Be surre, that the directory &QUOT;io&QUOT; is in working directory (File-&GT;Change Directory...)!</h4>
<p>Implementation:</p>
<p>Model should be divided into subsystems, which has <b>output</b> variables grouped to busConnector (variables, which are inputs to other subsystems). For each subsystem S: <b>all</b> these variables should be defined in <b>extended redeclared</b> class S.IO_Bus.Variables, where package S.IO_Bus is <b>extended</b> from Physiolibrary.Types.IO_Bus. </p>
<p>Usage:</p>
<p>For loading values in SI units of these variables from file &QUOT;io/input_SI.txt&QUOT; use block S.IO_Bus.InputFromFile_SI.</p>
<p>For loading values in non-SI units of these variables from file &QUOT;io/input.txt&QUOT; use block S.IO_Bus.InputFromFile.</p>
<p>For storing values in SI units of these variables from file &QUOT;io/output_SI.txt&QUOT; use block S.IO_Bus.OutputToFile_SI.</p>
<p>For storing values in non-SI units of these variables from file &QUOT;io/output.txt&QUOT; use block S.IO_Bus.OutputToFile.</p>
<p>For comparison values in SI units of these variables with file &QUOT;io/input_SI.txt&QUOT; use block S.IO_Bus.OutputComparison_SI and result will be stored as &QUOT;io/comparison_SI.txt&QUOT;.</p>
<p>For comparison values in non-SI units of these variables with file &QUOT;io/input.txt&QUOT; use block S.IO_Bus.OutputComparison and result will be stored as &QUOT;io/comparison.txt&QUOT;.</p>
</html>"));
    end IO_Bus;

    expandable connector TorsoBusConnector
      "Upper, Middle or Lower Torso properties"

      annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.2), graphics={
            Rectangle(
              extent={{-20,2},{20,-2}},
              lineColor={129,194,194},
              lineThickness=1),
            Polygon(
              points={{-80,50},{80,50},{100,30},{80,-40},{60,-50},{-60,-50},{-80,
                  -40},{-100,30},{-80,50}},
              lineColor={0,0,0},
              fillColor={115,172,172},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-65,25},{-55,15}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-5,25},{5,15}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{55,25},{65,15}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-35,-15},{-25,-25}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{25,-15},{35,-25}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.2), graphics={
            Polygon(
              points={{-40,25},{40,25},{50,15},{40,-20},{30,-25},{-30,-25},{-40,
                  -20},{-50,15},{-40,25}},
              lineColor={0,0,0},
              fillColor={170,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-32.5,7.5},{-27.5,12.5}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-2.5,12.5},{2.5,7.5}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{27.5,12.5},{32.5,7.5}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-17.5,-7.5},{-12.5,-12.5}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{12.5,-7.5},{17.5,-12.5}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-150,70},{150,40}},
              lineColor={0,0,0},
              textString="%name")}),
        Documentation(info="<html>
<p>
This icon is designed for a <b>signal bus</b> connector.
</p>
</html>"));

    end TorsoBusConnector;

    expandable connector TissueBusConnector "Tissue properties"

      annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.2), graphics={
            Rectangle(
              extent={{-20,2},{20,-2}},
              lineColor={127,0,0},
              lineThickness=0.5),
            Polygon(
              points={{-80,50},{80,50},{100,30},{80,-40},{60,-50},{-60,-50},{-80,
                  -40},{-100,30},{-80,50}},
              lineColor={0,0,0},
              fillColor={127,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-65,25},{-55,15}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-5,25},{5,15}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{55,25},{65,15}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-35,-15},{-25,-25}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{25,-15},{35,-25}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.2), graphics={
            Polygon(
              points={{-40,25},{40,25},{50,15},{40,-20},{30,-25},{-30,-25},{-40,
                  -20},{-50,15},{-40,25}},
              lineColor={0,0,0},
              fillColor={127,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-32.5,7.5},{-27.5,12.5}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-2.5,12.5},{2.5,7.5}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{27.5,12.5},{32.5,7.5}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-17.5,-7.5},{-12.5,-12.5}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{12.5,-7.5},{17.5,-12.5}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-150,70},{150,40}},
              lineColor={0,0,0},
              textString="%name")}),
        Documentation(info="<html>
<p>
This icon is designed for a <b>signal bus</b> connector.
</p>
</html>"));

    end TissueBusConnector;

    partial block AbstractReal
      "Abstract parameter or the value at defined time (final) of the model - can be input or output parameter"

      replaceable type T=Real
       constrainedby Real "Real type with units"
       annotation (Dialog(group="Simple type",tab="Types"));

      parameter String varName=
      "Stored name"
      annotation (Dialog(group="Value I/O",tab="IO"));
                               //getInstanceName()
      parameter String storeUnit="" "Stored units"
      annotation (Dialog(group="Value I/O",tab="IO"));

      parameter T k(fixed=true) = 0 "Value"
        annotation (Evaluate=true, HideResult=true, Dialog(group="Parameters"));

      parameter Utilities.UnitConversions.RealTypeRecord[:] unitConversions = Utilities.UnitConversions.RealTypeDef
        "Unit conversions"  annotation(Evaluate=true, HideResult=true);
    end AbstractReal;

    package RealTypeInputParameters
      extends Modelica.Icons.SourcesPackage;

      import Physiolibrary.Types.*;

      replaceable package Utilities = FilesUtilities constrainedby Utilities
                     annotation (Dialog(group="Functions to read or store",tab="Types"));
       block Base
         parameter String varName=
         "Stored name"
         annotation (Dialog(group="Value I/O",tab="IO"));
                                  //getInstanceName()
         parameter String storeUnit="" "Stored units"
         annotation (Dialog(group="Value I/O",tab="IO"));
         annotation (Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Text(         extent={{-44,6},{36,-14}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString=""),   Rectangle(
             extent={{-40,12},{40,-14}},
             lineColor={0,0,255},
             fillPattern=FillPattern.Solid,
             fillColor={170,255,170}), Text(
             extent={{-40,-8},{40,6}},
             lineColor={0,0,0},
             fillColor={255,255,255},
             fillPattern=FillPattern.Solid,
                textString="%varName")}));
       end Base;

    block Velocity "Constant signal of type Velocity"

      extends Base(storeUnit="m/s");
     parameter Types.Velocity k=Utilities.readReal(varName, storeUnit)
          "Constant Velocity output value";
          RealIO.VelocityOutput y "Velocity input parameter"
          annotation (Placement(transformation(extent={{40,-10},{60,10}}),
              iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="velocity");
    end Velocity;

    block Acceleration "Constant signal of type Acceleration"

      extends Base(storeUnit="m/s2");
     parameter Types.Acceleration k=Utilities.readReal(varName, storeUnit)
          "Constant Acceleration output value";
          RealIO.AccelerationOutput y "Acceleration input parameter"
          annotation (Placement(transformation(extent={{40,-10},{60,10}}),
              iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="acceleration");
    end Acceleration;

    block AmountOfSubstance "Constant signal of type AmountOfSubstance"

      extends Base(storeUnit="mmol");
     parameter Types.AmountOfSubstance k=Utilities.readReal(varName, storeUnit)
          "Constant AmountOfSubstance output value";
          RealIO.AmountOfSubstanceOutput y "AmountOfSubstance input parameter"
                                              annotation (Placement(transformation(
                extent={{40,-10},{60,10}}), iconTransformation(extent={{40,-10},{60,
                  10}})));
    equation
          y=k;
      annotation (defaultComponentName="amountOfSubstance");
    end AmountOfSubstance;

    block Concentration "Constant signal of type Concentration"

      extends Base(storeUnit="mmol/l");
     parameter Types.Concentration k=Utilities.readReal(varName, storeUnit, unitConversions)
          "Constant Concentration output value";
          RealIO.ConcentrationOutput y "Concentration input parameter"
          annotation (Placement(transformation(extent={{40,-10},{60,10}}),
              iconTransformation(extent={{40,-10},{60,10}})));
      parameter Utilities.UnitConversions.RealTypeRecord[:] unitConversions = Utilities.UnitConversions.RealTypeDef
          "Unit conversions"
                            annotation(Evaluate=true, HideResult=true);
    equation
          y=k;
      annotation (defaultComponentName="concentration");
    end Concentration;

    block MassConcentration "Constant signal of type MassConcentration"

      extends Base(storeUnit="mmol/l");
     parameter Types.MassConcentration k=Utilities.readReal(varName, storeUnit)
          "Constant Concentration output value";
          RealIO.MassConcentrationOutput y "Concentration input parameter"
          annotation (Placement(transformation(extent={{40,-10},{60,10}}),
              iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="concentration");
    end MassConcentration;

    block Density "Constant signal of type Density"

      extends Base(storeUnit="kg/l");
     parameter Types.Density k=Utilities.readReal(varName, storeUnit)
          "Constant Density output value";
          RealIO.DensityOutput y "Density input parameter" annotation (
            Placement(transformation(extent={{40,-10},{60,10}}), iconTransformation(
                extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="density");
    end Density;

    block DiffusionPermeability "Constant signal of type DiffusionPermeability"

      extends Base(storeUnit="ml/min");
     parameter Types.DiffusionPermeability k=Utilities.readReal(varName,
            storeUnit) "Constant DiffusionPermeability output value";
          RealIO.DiffusionPermeabilityOutput y
          "DiffusionPermeability input parameter" annotation (Placement(
              transformation(extent={{40,-10},{60,10}}), iconTransformation(extent={
                  {40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="diffusionPermeability");
    end DiffusionPermeability;

    block ElectricCharge "Constant signal of type ElectricCharge"

      extends Base(storeUnit="meq");
     parameter Types.ElectricCharge k=Utilities.readReal(varName, storeUnit)
          "Constant ElectricCharge output value";
          RealIO.ElectricChargeOutput y "ElectricCharge input parameter"
          annotation (Placement(transformation(extent={{40,-10},{60,10}}),
              iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="electricCharge");
    end ElectricCharge;

    block ElectricCurrent "Constant signal of type ElectricCurrent"

      extends Base(storeUnit="meq/min");
     parameter Types.ElectricCurrent k=Utilities.readReal(varName, storeUnit)
          "Constant ElectricCurrent output value";
          RealIO.ElectricCurrentOutput y "ElectricCurrent input parameter"
          annotation (Placement(transformation(extent={{40,-10},{60,10}}),
              iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="electricCurrent");
    end ElectricCurrent;

    block ElectricPotential "Constant signal of type ElectricPotential"

      extends Base(storeUnit="mV");
     parameter Types.ElectricPotential k=Utilities.readReal(varName, storeUnit)
          "Constant ElectricPotential output value";
          RealIO.ElectricPotentialOutput y "ElectricPotential input parameter"
                                              annotation (Placement(transformation(
                extent={{40,-10},{60,10}}), iconTransformation(extent={{40,-10},{60,
                  10}})));
    equation
          y=k;
      annotation (defaultComponentName="electricPotential");
    end ElectricPotential;

      block Energy "Constant signal of type Energy"

        extends Base(storeUnit="kcal");
        parameter Types.Energy k=Utilities.readReal(varName, storeUnit)
          "Constant Energy output value";
          RealIO.EnergyOutput y "Energy input parameter" annotation (
            Placement(transformation(extent={{40,-10},{60,10}}), iconTransformation(
                extent={{40,-10},{60,10}})));
      equation
          y=k;
      annotation (defaultComponentName="energy");
      end Energy;

    block Fraction "Constant signal of type Fraction"

      extends Base(storeUnit="");
     parameter Types.Fraction k=Utilities.readReal(varName, storeUnit)
          "Constant Fraction output value";
          RealIO.FractionOutput y "Fraction input parameter" annotation (
            Placement(transformation(extent={{40,-10},{60,10}}), iconTransformation(
                extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="fraction");
    end Fraction;

    block Frequency "Constant signal of type Frequency"

      extends Base(storeUnit="1/min");
     parameter Types.Frequency k=Utilities.readReal(varName, storeUnit)
          "Constant Frequency output value";
          RealIO.FrequencyOutput y "Frequency input parameter" annotation (
            Placement(transformation(extent={{40,-10},{60,10}}), iconTransformation(
                extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="frequency");
    end Frequency;

    block GasSolubility "Constant signal of type GasSolubility"

      extends Base(storeUnit="(mmol/l)/kPa at 25degC");
     parameter Types.GasSolubility k=Utilities.readReal(varName, storeUnit)
          "Constant GasSolubility output value";
          RealIO.GasSolubilityOutput y "GasSolubility input parameter"
          annotation (Placement(transformation(extent={{40,-10},{60,10}}),
              iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="gasSolubility");
    end GasSolubility;

    block Heat "Constant signal of type Heat"

       extends Base(storeUnit="kcal");
     parameter Types.Heat k=Utilities.readReal(varName, storeUnit)
          "Constant Heat output value";
          RealIO.HeatOutput y "Heat input parameter" annotation (Placement(
              transformation(extent={{40,-10},{60,10}}), iconTransformation(extent={
                  {40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="heat");
    end Heat;

    block Height "Constant signal of type Height"

      extends Base(storeUnit="cm");
     parameter Types.Height k=Utilities.readReal(varName, storeUnit)
          "Constant Height output value";
          RealIO.HeightOutput y "Height input parameter" annotation (
            Placement(transformation(extent={{40,-10},{60,10}}), iconTransformation(
                extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="height");
    end Height;

    block HeatFlowRate "Constant signal of type HeatFlowRate"

      extends Base(storeUnit="kcal/min");
     parameter Types.HeatFlowRate k=Utilities.readReal(varName, storeUnit)
          "Constant HeatFlowRate output value";
          RealIO.HeatFlowRateOutput y "HeatFlowRate input parameter"
          annotation (Placement(transformation(extent={{40,-10},{60,10}}),
              iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="heatFlowRate");
    end HeatFlowRate;

    block HydraulicCompliance "Constant signal of type HydraulicCompliance"

      extends Base(storeUnit="ml/mmHg");
     parameter Types.HydraulicCompliance k=Utilities.readReal(varName, storeUnit)
          "Constant HydraulicCompliance output value";
          RealIO.HydraulicComplianceOutput y
          "HydraulicCompliance input parameter" annotation (Placement(
              transformation(extent={{40,-10},{60,10}}), iconTransformation(extent={
                  {40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="hydraulicCompliance");
    end HydraulicCompliance;

    block HydraulicConductance "Constant signal of type HydraulicConductance"

      extends Base(storeUnit="ml/(mmHg.min)");
     parameter Types.HydraulicConductance k=Utilities.readReal(varName,
            storeUnit) "Constant HydraulicConductance output value";
          RealIO.HydraulicConductanceOutput y
          "HydraulicConductance input parameter" annotation (Placement(
              transformation(extent={{40,-10},{60,10}}), iconTransformation(extent={
                  {40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="hydraulicConductance");
    end HydraulicConductance;

    block HydraulicInertance "Constant signal of type HydraulicInertance"

      extends Base(storeUnit="mmHg.min2/ml");
     parameter Types.HydraulicInertance k=Utilities.readReal(varName, storeUnit)
          "Constant HydraulicInertance output value";
          RealIO.HydraulicInertanceOutput y "HydraulicInertance input parameter"
                                               annotation (Placement(transformation(
                extent={{40,-10},{60,10}}), iconTransformation(extent={{40,-10},{60,
                  10}})));
    equation
          y=k;
      annotation (defaultComponentName="hydraulicInertance");
    end HydraulicInertance;

    block Mass "Constant signal of type Mass"

      extends Base(storeUnit="g");
     parameter Types.Mass k=Utilities.readReal(varName, storeUnit)
          "Constant Mass output value";
          RealIO.MassOutput y "Mass input parameter" annotation (Placement(
              transformation(extent={{40,-10},{60,10}}), iconTransformation(extent={
                  {40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="mass");
    end Mass;

    block MassFlowRate "Constant signal of type MassFlowRate"

      extends Base(storeUnit="g/min");
     parameter Types.MassFlowRate k=Utilities.readReal(varName, storeUnit)
          "Constant MassFlowRate output value";
          RealIO.MassFlowRateOutput y "MassFlowRate input parameter"
          annotation (Placement(transformation(extent={{40,-10},{60,10}}),
              iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="massFlowRate");
    end MassFlowRate;

    block MolarFlowRate "Constant signal of type MolarFlowRate"

      extends Base(storeUnit="mmol/min");
     parameter Types.MolarFlowRate k=Utilities.readReal(varName, storeUnit)
          "Constant MolarFlowRate output value";
          RealIO.MolarFlowRateOutput y "MolarFlowRate input parameter"
          annotation (Placement(transformation(extent={{40,-10},{60,10}}),
              iconTransformation(extent={{40,-10},{60,10}})));
      parameter Utilities.UnitConversions.RealTypeRecord[:] unitConversions = Utilities.UnitConversions.RealTypeDef
          "Unit conversions"
                            annotation(Evaluate=true, HideResult=true);
    equation
          y=k;
      annotation (defaultComponentName="molarFlowRate");
    end MolarFlowRate;

    block Osmolarity "Constant signal of type Osmolarity"

      extends Base(storeUnit="mosm/l");
     parameter Types.Osmolarity k=Utilities.readReal(varName, storeUnit)
          "Constant Osmolarity output value";
          RealIO.OsmolarityOutput y "Osmolarity input parameter" annotation (
           Placement(transformation(extent={{40,-10},{60,10}}), iconTransformation(
                extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="osmolarity");
    end Osmolarity;

    block OsmoticPermeability "Constant signal of type OsmoticPermeability"

      extends Base(storeUnit="ml/(mmHg.min)");
     parameter Types.OsmoticPermeability k=Utilities.readReal(varName, storeUnit)
          "Constant OsmoticPermeability output value";
          RealIO.OsmoticPermeabilityOutput y
          "OsmoticPermeability input parameter" annotation (Placement(
              transformation(extent={{40,-10},{60,10}}), iconTransformation(extent={
                  {40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="osmoticPermeability");
    end OsmoticPermeability;

    block Pressure "Constant signal of type Pressure"

      extends Base(storeUnit="mmHg");
     parameter Types.Pressure k=Utilities.readReal(varName, storeUnit)
          "Constant Pressure output value";
          RealIO.PressureOutput y "Pressure input parameter" annotation (
            Placement(transformation(extent={{40,-10},{60,10}}), iconTransformation(
                extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="pressure");
    end Pressure;

    block SpecificEnergy "Constant signal of type SpecificEnergy"

      extends Base(storeUnit="kcal/kg");
     parameter Types.SpecificEnergy k=Utilities.readReal(varName, storeUnit)
          "Constant SpecificEnergy output value";
          RealIO.SpecificEnergyOutput y "SpecificEnergy input parameter"
          annotation (Placement(transformation(extent={{40,-10},{60,10}}),
              iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="specificEnergy");
    end SpecificEnergy;

    block SpecificHeatCapacity "Constant signal of type SpecificHeatCapacity"

      extends Base(storeUnit="kcal/(kg.K)");
     parameter Types.SpecificHeatCapacity k=Utilities.readReal(varName,
            storeUnit) "Constant SpecificHeatCapacity output value";
          RealIO.SpecificHeatCapacityOutput y
          "SpecificHeatCapacity input parameter" annotation (Placement(
              transformation(extent={{40,-10},{60,10}}), iconTransformation(extent={
                  {40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="specificHeatCapacity");
    end SpecificHeatCapacity;

    block Temperature "Constant signal of type Temperature"

      extends Base(storeUnit="degC");
     parameter Types.Temperature k=Utilities.readReal(varName, storeUnit)
          "Constant Temperature output value";
          RealIO.TemperatureOutput y "Temperature input parameter"
          annotation (Placement(transformation(extent={{40,-10},{60,10}}),
              iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="temperature");
    end Temperature;

    block ThermalConductance "Constant signal of type ThermalConductance"

      extends Base(storeUnit="kcal/(min.K)");
     parameter Types.ThermalConductance k=Utilities.readReal(varName, storeUnit)
          "Constant ThermalConductance output value";
          RealIO.ThermalConductanceOutput y "ThermalConductance input parameter"
                                               annotation (Placement(transformation(
                extent={{40,-10},{60,10}}), iconTransformation(extent={{40,-10},{60,
                  10}})));
    equation
          y=k;
      annotation (defaultComponentName="thermalConductance");
    end ThermalConductance;

    block Time "Constant signal of type Time"

      extends Base(storeUnit="min");
     parameter Types.Time k=Utilities.readReal(varName, storeUnit)
          "Constant Time output value";
          RealIO.TimeOutput y "Time input parameter" annotation (Placement(
              transformation(extent={{40,-10},{60,10}}), iconTransformation(extent={
                  {40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="time");
    end Time;

    block VolumeFlowRate "Constant signal of type VolumeFlowRate"

      extends Base(storeUnit="ml/min");
     parameter Types.VolumeFlowRate k=Utilities.readReal(varName, storeUnit)
          "Constant VolumeFlowRate output value";
          RealIO.VolumeFlowRateOutput y "VolumeFlowRate input parameter"
          annotation (Placement(transformation(extent={{40,-10},{60,10}}),
              iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="volumeFlowRate");
    end VolumeFlowRate;

    block Volume "Constant signal of type Volume"

      extends Base(storeUnit="ml");
     parameter Types.Volume k=Utilities.readReal(varName, storeUnit)
          "Constant Volume output value";
          RealIO.VolumeOutput y "Volume input parameter" annotation (
            Placement(transformation(extent={{40,-10},{60,10}}), iconTransformation(
                extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="volume");
    end Volume;

    block pH "Constant signal of type pH"

      extends Base(storeUnit="");
     parameter Types.pH k=Utilities.readReal(varName, storeUnit)
          "Constant pH output value";
          RealIO.pHOutput y "pH input parameter" annotation (Placement(
              transformation(extent={{40,-10},{60,10}}), iconTransformation(extent={
                  {40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="pH");
    end pH;

    block VolumeDensityOfCharge "Constant signal of type VolumeDensityOfCharge"

      extends Base(storeUnit="meq/l");
     parameter Types.VolumeDensityOfCharge k=Utilities.readReal(varName,
            storeUnit) "Constant VolumeDensityOfCharge output value";
          RealIO.VolumeDensityOfChargeOutput y
          "VolumeDensityOfCharge input parameter" annotation (Placement(
              transformation(extent={{40,-10},{60,10}}), iconTransformation(extent={
                  {40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="volumeDensityOfCharge");
    end VolumeDensityOfCharge;

    block Power "Constant signal of type Power"

      extends Base(storeUnit="kcal/min");
     parameter Types.Power k=Utilities.readReal(varName, storeUnit)
          "Constant Power output value";
          RealIO.PowerOutput y "Power input parameter"
          annotation (Placement(transformation(extent={{40,-10},{60,10}}),
              iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="heatFlowRate");
    end Power;

    block Position "Constant signal of type Position"

      extends Base(storeUnit="cm");
     parameter Types.Position k=Utilities.readReal(varName, storeUnit)
          "Constant Position output value";
          RealIO.PositionOutput y "Position input parameter" annotation (
            Placement(transformation(extent={{40,-10},{60,10}}), iconTransformation(
                extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="height");
    end Position;

      block MolarEnergy "Constant signal of type MolarEnergy"

        extends Base(storeUnit="kcal/mol");
        parameter Types.MolarEnergy k=Utilities.readReal(varName, storeUnit)
          "Constant MolarEnergy output value";
          RealIO.MolarEnergyOutput y "MolarEnergy input parameter" annotation (
            Placement(transformation(extent={{40,-10},{60,10}}), iconTransformation(
                extent={{40,-10},{60,10}})));
      equation
          y=k;
      annotation (defaultComponentName="molarEnergy");
      end MolarEnergy;

      block Population "Constant signal of type Population"

        extends Base(storeUnit="");
        parameter Types.Population k=Utilities.readReal(varName, storeUnit)
          "Constant Population output value";
          RealIO.PopulationOutput y "Population input parameter" annotation (
            Placement(transformation(extent={{40,-10},{60,10}}), iconTransformation(
                extent={{40,-10},{60,10}})));
      equation
          y=k;
      annotation (defaultComponentName="population");
      end Population;

      block PopulationChange "Constant signal of type PopulationChange"

        extends Base(storeUnit="1/d");
        parameter Types.PopulationChange k=Utilities.readReal(varName, storeUnit)
          "Constant PopulationChange output value";
          RealIO.PopulationChangeOutput y "PopulationChange input parameter" annotation (
            Placement(transformation(extent={{40,-10},{60,10}}), iconTransformation(
                extent={{40,-10},{60,10}})));
      equation
          y=k;
      annotation (defaultComponentName="populationChange");
      end PopulationChange;

      block PopulationChangePerMember
        "Constant signal of type PopulationChangePerMember"
        extends Base(storeUnit="1/d");
        parameter Types.PopulationChangePerMember k=Utilities.readReal(varName, storeUnit)
          "Constant PopulationChangePerMember output value";
          RealIO.PopulationChangePerMemberOutput y
          "PopulationChangePerMember input parameter"                                 annotation (
            Placement(transformation(extent={{40,-10},{60,10}}), iconTransformation(
                extent={{40,-10},{60,10}})));
      equation
          y=k;
      annotation (defaultComponentName="populationChangePerMember");
      end PopulationChangePerMember;
    end RealTypeInputParameters;

    package RealExtension
      extends Modelica.Icons.VariantsPackage;
          block Parameter "Generate constant signal in SI units from file"
            extends AbstractReal;

            replaceable package IO = RealExtension.IO (
              redeclare type Type = T) "Real type with units"
               annotation (Dialog(group="Packages",tab="Types"));

            IO.Output y "Connector of Real output signal"
              annotation (Placement(transformation(extent={{100,-10},{120,10}})));

          equation
            y = k;
            annotation (
              Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={Rectangle(
                extent={{-100,20},{100,-20}},
                lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={255,255,255}), Text(
                extent={{-100,-10},{100,10}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString="%varName")}),
          Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
          end Parameter;

          block InputParameter "Generate constant signal from file"
            extends AbstractReal(                   k = Utilities.readReal( varName, storeUnit, unitConversions));

            replaceable package IO = RealExtension.IO (
              redeclare type Type = T)
                           annotation (Dialog(group="Real type with units",tab="Types"));
            replaceable package Utilities = FilesUtilities(inputFileName="input.txt")
              constrainedby Utilities
                           annotation (Dialog(group="Functions to read or store",tab="Types"));

            IO.Output y "Connector of Real output signal"
              annotation (Placement(transformation(extent={{100,-10},{120,10}})));

          equation
          /*  when initial() then
    Modelica.Utilities.Streams.print(" ii " + varName + " = " + String(y) + " SI , store as " + storeUnit);
  end when;
  when terminal() then
    Modelica.Utilities.Streams.print(" it " + varName + " = " + String(y) + " SI , store as " + storeUnit);
  end when;
*/
            y = k;
            annotation (
              Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={Rectangle(
                extent={{-100,20},{100,-20}},
                lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={255,255,255}), Text(
                extent={{-100,-10},{100,10}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString="%varName")}),
          Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
          end InputParameter;

          block InputParameter_SI
            "Generate constant signal in SI units from file"
            extends AbstractReal(                   k = Utilities.readReal_SI( varName));

            replaceable package IO = RealExtension.IO (
              redeclare type Type = T)
                           annotation (Dialog(group="Real type with units",tab="Types"));
            replaceable package Utilities = FilesUtilities(inputSIFileName="input_SI.txt")
              constrainedby Utilities
                           annotation (Dialog(group="Functions to read or store",tab="Types"));

            IO.Output y "Connector of Real output signal"
              annotation (Placement(transformation(extent={{100,-10},{120,10}})));

          equation
            y = k;
            annotation (
              Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={Rectangle(
                extent={{-100,20},{100,-20}},
                lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={255,255,255}), Text(
                extent={{-100,-10},{100,10}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString="%varName")}),
          Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
          end InputParameter_SI;

          block OutputFinal "Save variable to Output"
          //  import Physiolibrary;
            extends AbstractReal;
            replaceable package IO = RealExtension.IO (
                                              redeclare type Type=T);
            replaceable package Utilities = FilesUtilities(outputFileName="outputFinal.txt")
                                                           constrainedby Utilities;
            IO.Input              y "Connector of Real input signal"
              annotation (Placement(transformation(extent={{-100,-10},{-80,10}}), iconTransformation(extent={{-120,-10},{-100,10}})));

          equation
            when terminal() then
              //Modelica.Utilities.Streams.print(" < " + varName + " = " + String(y) + " SI , store as " + storeUnit);
              Utilities.writeReal(
                varName,
                y,
                storeUnit,
                unitConversions);
            end when;
            annotation (
              Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2},
              initialScale=0.04), graphics={Rectangle(
                extent={{-100,20},{100,-20}},
                lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={255,255,255}), Text(
                extent={{-100,-10},{100,10}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString="%varName")}),
          Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
          end OutputFinal;

          block OutputFinal_SI "Save variable to Output"
          //  import Physiolibrary;
            extends AbstractReal;
            replaceable package IO = RealExtension.IO (
                                              redeclare type Type=T);
            replaceable package Utilities = FilesUtilities(outputSIFileName="outputFinal_SI.txt")
                                                           constrainedby Utilities;
            IO.Input              y "Connector of Real input signal"
              annotation (Placement(transformation(extent={{-100,-10},{-80,10}}), iconTransformation(extent={{-120,-10},{-100,10}})));

          equation
            when terminal() then
              Utilities.writeReal_SI(
                varName,
                y);
            end when;
            annotation (
              Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2},
              initialScale=0.04), graphics={Rectangle(
                extent={{-100,20},{100,-20}},
                lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={255,255,255}), Text(
                extent={{-100,-10},{100,10}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString="%varName")}),
          Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
          end OutputFinal_SI;

          block OutputInitial "Save variable to Output"
          //  import Physiolibrary;
            extends AbstractReal;
            replaceable package IO = RealExtension.IO (
                                              redeclare type Type=T);
            replaceable package Utilities = FilesUtilities(outputFileName="outputInitial.txt")
                                                           constrainedby Utilities;
            IO.Input              y "Connector of Real input signal"
              annotation (Placement(transformation(extent={{-100,-10},{-80,10}}), iconTransformation(extent={{-120,-10},{-100,10}})));

          equation
            when initial() then
              //Modelica.Utilities.Streams.print(" < " + varName + " = " + String(y) + " SI , store as " + storeUnit);
              Utilities.writeReal(
                varName,
                y,
                storeUnit,
                unitConversions);
            end when;
            annotation (
              Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2},
              initialScale=0.04), graphics={Rectangle(
                extent={{-100,20},{100,-20}},
                lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={255,255,255}), Text(
                extent={{-100,-10},{100,10}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString="%varName")}),
          Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
          end OutputInitial;

          block OutputInitial_SI "Save variable to Output"
           // import Physiolibrary;
            extends AbstractReal;
            replaceable package IO = RealExtension.IO (
                                              redeclare type Type=T);
            replaceable package Utilities = FilesUtilities(outputSIFileName="outputInitial_SI.txt")
                                                           constrainedby Utilities;
            IO.Input              y "Connector of Real input signal"
              annotation (Placement(transformation(extent={{-100,-10},{-80,10}}), iconTransformation(extent={{-120,-10},{-100,10}})));

          equation
            when initial() then
              Utilities.writeReal_SI(
                varName,
                y);
            end when;
            annotation (
              Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2},
              initialScale=0.04), graphics={Rectangle(
                extent={{-100,20},{100,-20}},
                lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={255,255,255}), Text(
                extent={{-100,-10},{100,10}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString="%varName")}),
          Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
          end OutputInitial_SI;

          block OutputComparison "Save variable comparison to file"
          //  import Physiolibrary;
            extends AbstractReal(             k=Utilities.readReal(varName,storeUnit,unitConversions));
            replaceable package IO = RealExtension.IO (
                                              redeclare type Type=T);
            replaceable package Utilities = FilesUtilities(comparisonFileName="comparison.txt")
                                                           constrainedby Utilities
             annotation (Dialog(group="Functions to read or store",tab="Types"));

            Modelica.Blocks.Interfaces.RealInput
                                  y "Connector of Real input signal"
              annotation (Placement(transformation(extent={{-100,-10},{-80,10}}), iconTransformation(extent={{-120,-10},{-100,10}})));

      protected
            parameter T initialValue(fixed=false);
          initial equation
            initialValue = y;
          equation
            when terminal() then
             Utilities.writeComparison(
              varName,
              k,
              initialValue,
              y,
              storeUnit,
              unitConversions);
            end when;

              annotation (
              Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2},
              initialScale=0.04), graphics={Rectangle(
                extent={{-100,20},{100,-20}},
                lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={255,255,255}), Text(
                extent={{-100,-10},{100,10}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString="%varName")}),
          Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
          end OutputComparison;

          block OutputComparison_SI
            "Save variable comparison to file using SI units during input and output"
          //  import Physiolibrary;
            extends AbstractReal(             k=Utilities.readReal_SI(varName));
            replaceable package IO = RealExtension.IO (
                                              redeclare type Type=T);
            replaceable package Utilities = FilesUtilities(comparisonSIFileName="comparison_SI.txt")
                                                           constrainedby Utilities
             annotation (Dialog(group="Functions to read or store",tab="Types"));

            Modelica.Blocks.Interfaces.RealInput
                                  y "Connector of Real input signal"
              annotation (Placement(transformation(extent={{-100,-10},{-80,10}}), iconTransformation(extent={{-120,-10},{-100,10}})));

      protected
            parameter T initialValue(fixed=false);
          initial equation
            initialValue = y;
          equation
            when terminal() then
             Utilities.writeComparison_SI(
              varName,
              k,
              initialValue,
              y);
            end when;

              annotation (
              Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2},
              initialScale=0.04), graphics={Rectangle(
                extent={{-100,20},{100,-20}},
                lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={255,255,255}), Text(
                extent={{-100,-10},{100,10}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString="%varName")}),
          Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
          end OutputComparison_SI;

          block OutputInitialComparison "Save variable comparison to file"
          //  import Physiolibrary;
            extends AbstractReal(             k=Utilities.readReal(varName,storeUnit,unitConversions));
            replaceable package IO = RealExtension.IO (
                                              redeclare type Type=T);
            replaceable package Utilities = FilesUtilities(comparisonFileName="comparisonInitial.txt")
                                                           constrainedby Utilities
             annotation (Dialog(group="Functions to read or store",tab="Types"));

            Modelica.Blocks.Interfaces.RealInput
                                  y "Connector of Real input signal"
              annotation (Placement(transformation(extent={{-100,-10},{-80,10}}), iconTransformation(extent={{-120,-10},{-100,10}})));

      protected
            parameter T initialValue(fixed=false);
          initial equation
            initialValue = y;
          equation
            when initial() then
             Utilities.writeComparison(
              varName,
              k,
              initialValue,
              y,
              storeUnit,
              unitConversions);
            end when;

              annotation (
              Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2},
              initialScale=0.04), graphics={Rectangle(
                extent={{-100,20},{100,-20}},
                lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={255,255,255}), Text(
                extent={{-100,-10},{100,10}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString="%varName")}),
          Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
          end OutputInitialComparison;

          block OutputInitialComparison_SI
            "Save variable comparison to file using SI units"
           // import Physiolibrary;
            extends AbstractReal(             k=Utilities.readReal_SI(varName));
            replaceable package IO = RealExtension.IO (
                                              redeclare type Type=T);
            replaceable package Utilities = FilesUtilities(comparisonSIFileName="comparisonInitial_SI.txt")
                                                           constrainedby Utilities
             annotation (Dialog(group="Functions to read or store",tab="Types"));

            Modelica.Blocks.Interfaces.RealInput
                                  y "Connector of Real input signal"
              annotation (Placement(transformation(extent={{-100,-10},{-80,10}}), iconTransformation(extent={{-120,-10},{-100,10}})));

      protected
            parameter T initialValue(fixed=false);
          initial equation
            initialValue = y;
          equation
            when initial() then
             Utilities.writeComparison_SI(
              varName,
              k,
              initialValue,
              y);
            end when;

              annotation (
              Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2},
              initialScale=0.04), graphics={Rectangle(
                extent={{-100,20},{100,-20}},
                lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={255,255,255}), Text(
                extent={{-100,-10},{100,10}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString="%varName")}),
          Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
          end OutputInitialComparison_SI;

      package IO
        extends Modelica.Icons.BasesPackage;

        replaceable type Type=Real;
        connector Input = input Type "input connector"
          annotation (defaultComponentName="i",
          Icon(graphics={Polygon(
                  points={{-100,100},{100,0},{-100,-100},{-100,100}},
                  lineColor={0,0,127},
                  fillColor={0,0,127},
                  fillPattern=FillPattern.Solid)},
               coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
          Diagram(coordinateSystem(
                preserveAspectRatio=true, initialScale=0.2,
                extent={{-100,-100},{100,100}},
                grid={1,1}), graphics={Polygon(
                  points={{0,50},{100,0},{0,-50},{0,50}},
                  lineColor={0,0,127},
                  fillColor={0,0,127},
                  fillPattern=FillPattern.Solid), Text(
                  extent={{-10,85},{-10,60}},
                  lineColor={0,0,127},
                  textString="%name")}),
            Documentation(info="<html>
    <p>
    Connector with one input signal of type Energy.
    </p>
    </html>"));

        connector Output = output Type "output connector"
          annotation (defaultComponentName="o",
          Icon(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={1,1}), graphics={Polygon(
                  points={{-100,100},{100,0},{-100,-100},{-100,100}},
                  lineColor={0,0,127},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid)}),
          Diagram(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={1,1}), graphics={Polygon(
                  points={{-100,50},{0,0},{-100,-50},{-100,50}},
                  lineColor={0,0,127},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid), Text(
                  extent={{30,110},{30,60}},
                  lineColor={0,0,127},
                  textString="%name")}),
            Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
      end IO;
    end RealExtension;

    package RealTypes
      extends Modelica.Icons.BasesPackage;
      import Physiolibrary;

        replaceable block Variable = RealExtension.Parameter constrainedby
        AbstractReal;

        block Energy = Variable(redeclare type T=Types.Energy, storeUnit="kcal");
        block Time = Variable(redeclare type T=Types.Time, storeUnit="min");
        block Frequency = Variable(redeclare type T=Types.Frequency, storeUnit="1/min");

        block Mass = Variable(redeclare type T=Types.Mass, storeUnit="g");
        block MassFlowRate = Variable(redeclare type T =
              Types.MassFlowRate, storeUnit="g/min");
        block Density = Variable(redeclare type T=Types.Density, storeUnit="kg/l");

        block Height = Variable(redeclare type T=Types.Height, storeUnit="cm");
        block Velocity = Variable(redeclare type T=Types.Velocity, storeUnit="km/h");
        block Acceleration = Variable(redeclare type T =
              Types.Acceleration, storeUnit="m/s");

        block Pressure = Variable(redeclare type T=Types.Pressure,storeUnit="mmHg");
        block Volume = Variable(redeclare type T=Types.Volume,storeUnit="ml");
        block VolumeFlowRate = Variable(redeclare type T =
              Types.VolumeFlowRate,storeUnit="ml/min");

        block Concentration = Variable(redeclare type T =
              Types.Concentration, storeUnit="mmol/l");
        block MassConcentration = Variable (redeclare type T =
              Types.MassConcentration, storeUnit="mg/l");
        block AmountOfSubstance = Variable(redeclare type T =
              Types.AmountOfSubstance,storeUnit="mmol");
        block MolarFlowRate = Variable(redeclare type T =
              Types.MolarFlowRate,storeUnit="mmol/min");

        block Heat = Variable(redeclare type T=Types.Heat,storeUnit="kcal");
        block Temperature = Variable(redeclare type T =
            Types.Temperature,  storeUnit="degC");
        block HeatFlowRate = Variable(redeclare type T =
              Types.HeatFlowRate,storeUnit="kcal/min");
        block Power = Variable(redeclare type T =
              Types.Power,storeUnit="kcal/min");
        block ThermalConductance = Variable(redeclare type T =
              Types.ThermalConductance, storeUnit="kcal/(min.K)");
        block SpecificHeatCapacity = Variable(redeclare type T =
              Types.SpecificHeatCapacity,storeUnit="kcal/(kg.K)");
        block SpecificEnergy = Variable(redeclare type T =
              Types.SpecificEnergy,storeUnit="kcal/kg");

        block ElectricPotential = Variable(redeclare type T =
              Types.ElectricPotential,storeUnit="mV");
        block ElectricCharge = Variable(redeclare type T =
              Types.ElectricCharge,storeUnit="meq");
        block VolumeDensityOfCharge =
                               Variable(redeclare type T =
              Types.VolumeDensityOfCharge,storeUnit="meq/l");
        block ElectricCurrent = Variable(redeclare type T =
              Types.ElectricCurrent,storeUnit="meq/min");

        block Fraction = Variable(redeclare type T=Types.Fraction,storeUnit="");

        block pH =       Variable(redeclare type T=Types.pH,storeUnit="log10(mol/l)");
        block OsmoticPermeability = Variable(redeclare type T =
              Types.OsmoticPermeability,storeUnit="ml/(mmHg.min)");
        block DiffusionPermeability =         Variable(redeclare type T =
              Types.DiffusionPermeability,storeUnit="ml/min");

        block HydraulicConductance = Variable(redeclare type T =
              Types.HydraulicConductance,storeUnit="ml/(mmHg.min)");
        block HydraulicCompliance = Variable(redeclare type T =
              Types.HydraulicCompliance,storeUnit="ml/mmHg");
        block HydraulicInertance = Variable(redeclare type T =
              Types.HydraulicInertance,storeUnit="mmHg.min2/ml");

        block GasSolubility = Variable(redeclare type T =
              Types.GasSolubility,storeUnit="(mmol/l)/kPa at 25degC");

        block Osmolarity =    Variable(redeclare type T =
              Types.Osmolarity,storeUnit="mosm/l");
        block Position=Variable(redeclare type T=Types.Position, storeUnit="cm");
        block MolarEnergy =
                       Variable(redeclare type T=Types.MolarEnergy, storeUnit="kcal/mol");
        block Population =    Variable(redeclare type T =
              Types.Population,storeUnit="1");
        block PopulationChange =
                              Variable(redeclare type T =
              Types.PopulationChange,storeUnit="1/d");
        block PopulationChangePerMember =
                              Variable(redeclare type T =
              Types.PopulationChangePerMember,storeUnit="1/d");
    end RealTypes;

    partial block AbstractBoolean
      "Abstract parameter or the value at defined time of the model - can be input or output parameter"

      parameter String varName="" "Name of stored variable"
      annotation (Dialog(group="Value I/O",tab="IO"));
                                  //getInstanceName()
       parameter Boolean k(fixed=true)=false "Value"
        annotation (Dialog(group="Parameters"));

    end AbstractBoolean;

    package FilesUtilities "File input/output/test"
      import Physiolibrary;
      extends Utilities;
      extends Modelica.Icons.VariantsPackage;

      constant String directoryName="io";

      constant String inputFileName="input.txt"
        "File to load values with (non-)SI units";
      constant String outputFileName="output.txt"
        "File to save values with (non-)SI units";
      constant String comparisonFileName="comparison.txt"
        "File to save comparison from loaded values and simulation results with (non-)SI units";

      constant String inputSIFileName="input_SI.txt"
        "File to load values in SI units";
      constant String outputSIFileName="output_SI.txt"
        "File to save values in SI units";
      constant String comparisonSIFileName="comparison_SI.txt"
        "File to save comparison in SI units from loaded values and simulation results";

      redeclare function extends readReal
        import Modelica.Utilities.*;

      protected
        String fn;
        String line;
        Integer nextIndex;
        Integer lineLen;
        Integer iline=1;
        Boolean found = false;
        Boolean endOfFile=false;
        String str;
        Real inputValue;
        Integer typeDef;
      algorithm
        fn:=directoryName + "/" + inputFileName;

        if not Files.exist(fn) then
           Streams.error("readRealParameter(\""+name+"\", \""+ fn + "\")  Error: the file does not exist.\n");
        else

        typeDef:=UnitConversions.findUnit(storeUnit,unitConversions);

        //Format "<variableName>\n<value> <unit>"
        (line, endOfFile) :=Streams.readLine(fn, iline);
        while not found and not endOfFile loop
             if line == name then
                 // name found, get value of "name = value;"
                 (line, endOfFile) :=Streams.readLine(fn, iline+1);
                 lineLen := Strings.length(line);
                 nextIndex:=1;

      /*
other wariant: //Format "<variableName>=<value><unit>"
  while not found and not endOfFile loop
       iline:=iline+1;
       (line, endOfFile) :=Streams.readLine(fn, iline);
       lineLen := Strings.length(line);

       if lineLen>3 then

         nextIndex:=1; //because Coleman does not use the right identifiers, scanIdentifier can not be used :(
         str:=Strings.substring(line,nextIndex,nextIndex);
         while ((nextIndex+1)<lineLen and (not Strings.isEqual(str," ")) and (not Strings.isEqual(str,"=")) and (not Strings.isEqual(str,"\t"))) loop
            nextIndex:=nextIndex+1;
            str:=Strings.substring(line,nextIndex,nextIndex);
         end while;
         str := Strings.substring(line,1,nextIndex-1);

         if str==name then

           nextIndex:=Strings.Advanced.skipWhiteSpace(line,nextIndex);
           nextIndex:=Strings.Advanced.skipWhiteSpace(line,nextIndex+1); //skip '=' and white-spaces before/after
*/

                 (inputValue,nextIndex) := Strings.scanReal(line, nextIndex);

                 nextIndex:=Strings.Advanced.skipWhiteSpace(line,nextIndex);
                 if nextIndex>lineLen then
                     if Strings.length(unitConversions[typeDef].DisplayUnit) > 0 then
                       Streams.error("No units detected for variable '" + name +
                                      "' in file '" + fn + "'. Expected unis are '" + unitConversions[typeDef].DisplayUnit + "'!\n");
                     end if;
                     //Streams.print(" > " + name + "\t " + String(inputValue) + " (no units)");
                 else
                     str :=Strings.substring(line, Strings.Advanced.skipWhiteSpace(line,nextIndex),  Strings.length(line));
                     if str <> unitConversions[typeDef].DisplayUnit then
                        Streams.error("Units '" + str + "' not expected for variable '"
                         + name + "' in file '" + fn + "'. Expected unis are '" +
                        unitConversions[typeDef].DisplayUnit + "'!\n");
                     end if;
                     //Streams.print(" > " + name + "\t " + String(inputValue) + " " + str);
                 end if;
                 value :=inputValue*unitConversions[typeDef].Scale + unitConversions[typeDef].Offset;
                 //Streams.print("\t\t =" + String(value) + " " + unitConversions[typeDef].Unit);
                 found := true;
                 // end if;  //Format "<variableName>=<value><unit>"

                 //Format "<variableName>\n<value><unit>"
             else
                 // wrong name, skip lines
                 iline := iline + 2;
                 // read next variable name
                 (line, endOfFile) :=Streams.readLine(fn, iline);
             end if;
           end while;

           if not found then
              Streams.error("Parameter \"" + name + "\" not found in file \"" + fn + "\"\n");
           end if;
         end if;

      end readReal;

      redeclare function extends readReal_SI
        import Modelica.Utilities.*;

      protected
        String fn;
        String line;
        Integer nextIndex;
        Integer iline=1;
        Boolean found = false;
        Boolean endOfFile=false;

      algorithm
        fn:=directoryName + "/" +inputSIFileName;

        if not Files.exist(fn) then
           Streams.error("readRealParameter(\""+name+"\", \""+ fn + "\")  Error: the file does not exist.\n");
        else

        //Format "<variableName>\n<value> <unit>"
        (line, endOfFile) :=Streams.readLine(fn, iline);
        while not found and not endOfFile loop
             if line == name then
                 // name found, get value of "name = value;"
                 (line, endOfFile) :=Streams.readLine(fn, iline+1);
                 nextIndex:=1;

                 (value,nextIndex) := Strings.scanReal(line, nextIndex);
                 found := true;

               else
               // wrong name, skip lines
                 iline := iline + 2;
                 // read next variable name
                 (line, endOfFile) :=Streams.readLine(fn, iline);

               end if;
           end while;

           if not found then
              Streams.error("Parameter \"" + name + "\" not found in file \"" + fn + "\"\n");
           end if;
         end if;

      end readReal_SI;

      redeclare function extends readBoolean
        import Modelica.Utilities.*;

      algorithm
        value:=(readReal(name,"")>0.005);
      end readBoolean;

      redeclare function extends writeReal "Write the value to file"
        import Modelica.Utilities.*;

      protected
        String fn;
        Integer typeDef "Variable type";

      algorithm
        fn:=directoryName + "/" +outputFileName;

        if not Files.exist(fn) then
           if not Files.exist(directoryName) then
               Files.createDirectory(directoryName);
           end if;
        end if;

        typeDef:=UnitConversions.findUnit(storeUnit,unitConversions);

        Streams.print(name + "\n" + String(((value - unitConversions[typeDef].Offset)/unitConversions[typeDef].Scale))
        + " " + unitConversions[typeDef].DisplayUnit, fn);

      end writeReal;

      redeclare function extends writeReal_SI
        "Write the value to file using SI unit"
        import Modelica.Utilities.*;

      protected
        String fn;
        Integer typeDef "Variable type";

      algorithm
        fn:=directoryName + "/" +outputSIFileName;

        if not Files.exist(fn) then
           if not Files.exist(directoryName) then
               Files.createDirectory(directoryName);
           end if;
        end if;

         Streams.print(name + "\n" + String(value), fn);

      end writeReal_SI;

      redeclare function extends writeBoolean
        import Modelica.Utilities.*;
      protected
        String fn;

      algorithm
        fn:=directoryName + "/" +outputFileName;

        if not Files.exist(fn) then
           if not Files.exist(directoryName) then
               Files.createDirectory(directoryName);
           end if;
        end if;

        Streams.print( name + "\n" + String(if value then 1 else 0),      fn);

      end writeBoolean;

      redeclare function extends writeComparison
        "Compare and write the result and the value to file"
        import Modelica.Utilities.*;

      protected
        String fn;
        Real outputInitialValue;
        Real outputFinalValue;
        Real outputDefaultValue;
        Integer typeDef "Variable output units";

      algorithm
        fn:=directoryName + "/" +comparisonFileName;

        if not Files.exist(fn) then
           if not Files.exist("output") then
               Files.createDirectory("output");
           end if;
        end if;

        typeDef:=UnitConversions.findUnit(storeUnit,unitConversions);

      outputDefaultValue :=((defaultValue - unitConversions[typeDef].Offset)/unitConversions[typeDef].Scale);
      outputInitialValue :=((initialValue - unitConversions[typeDef].Offset)/unitConversions[typeDef].Scale);
      outputFinalValue :=((finalValue - unitConversions[typeDef].Offset)/unitConversions[typeDef].Scale);

        Streams.print((if (abs(outputDefaultValue) > Modelica.Constants.eps)
           then String(abs((outputFinalValue - outputDefaultValue)/
          outputDefaultValue)) else "Zero vs. " + String(outputFinalValue)) +
          " ; " + name + " : default=" + String(outputDefaultValue) + " " +
          unitConversions[typeDef].DisplayUnit
           + ", initial=" + String(outputInitialValue) + " " + unitConversions[
          typeDef].DisplayUnit + ", final=" + String(outputFinalValue) + " " +
          unitConversions[typeDef].DisplayUnit,
          fn);

      end writeComparison;

      redeclare function extends writeComparison_SI
        "Compare and write the result and the value to file using SI units"
        import Modelica.Utilities.*;

      protected
        String fn;
        Real outputInitialValue;
        Real outputFinalValue;
        Real outputDefaultValue;

      algorithm
        fn:=directoryName + "/" +comparisonSIFileName;

        if not Files.exist(fn) then
           if not Files.exist("output") then
               Files.createDirectory("output");
           end if;
        end if;

      outputDefaultValue := defaultValue;
      outputInitialValue := initialValue;
      outputFinalValue := finalValue;

      Streams.print((if (abs(outputDefaultValue) > Modelica.Constants.eps) then
        String(abs((outputFinalValue - outputDefaultValue)/outputDefaultValue))
         else "Zero vs. " + String(outputFinalValue)) + " ; " + name +
        " : default=" + String(outputDefaultValue) + ", initial=" + String(outputInitialValue)
         + ", final=" + String(outputFinalValue), fn);

      end writeComparison_SI;

      redeclare function extends writeBooleanComparison
        "Compare and write the result and the value to file"
        import Modelica.Utilities.*;

      protected
        String fn;
        Real outputInitialValue;
        Real outputFinalValue;
        Real outputDefaultValue;
      algorithm
        fn:=directoryName + "/" +comparisonFileName;

        if not Files.exist(fn) then
           if not Files.exist("output") then
               Files.createDirectory("output");
           end if;
        end if;
         if (defaultValue==finalValue) then

             Streams.print("0 ; "+ name + " : default=" + String(if defaultValue then 1 else 0) +", initial=" + String(if initialValue then 1 else 0) + ", final=" + String(if finalValue then 1 else 0), "differences.txt");
           else
             Streams.print("! ; " + name + " : default=" + String(if defaultValue then 1 else 0) +", initial=" + String(if initialValue then 1 else 0)+ ", final=" + String(if finalValue then 1 else 0), "differences.txt");
         end if;

      end writeBooleanComparison;

      annotation (Documentation(revisions="<html>
<p>Licensed by Marek Matejak under the Modelica License 2</p>
<p>Copyright &copy; 2008-2013, Marek Matejak, Charles University in Prague.</p>
<p><br/><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Physiolibrary.UsersGuide.ModelicaLicense2\">UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p>
</html>",     info="<html>
<p>During the creation and debugging of huge integrated models it is necessary to easily define consistent input, output and test sets of all output variables for some subsystems. Let&apos;s imagine that we have a model composed only of subsystems that converge from some constant inputs to constant outputs. It should be possible to substitute each main subsystem for its chosen constant output values as parameters. Comparing the model with these parametric values and the original subsystem can show the wrong part of the simulation. </p>
<p>For example in the huge HumMod model it is necessary to debug smaller parts separately. These tools could be use, because HumMod is the type of constant-converged model. Each subsystem in the first level has the constant input values set for its output variables. Simulating, for example, the cardiovascular subsystem is possible by creating the high-level system with the original cardiovascular subsystem, but with a constant metabolic, constant thermoregulation, constant hormonal, constant water, constant proteins, constant gases, constant electrolytes and constant status subsystem. </p>
<p>Because the number of output variables for each subsytem changes during development, it is a good idea to have only one list for each subsystem. And generating consistent sets to store, restore, compare initial and final values is possible by the same pattern as presented in the package Types.Example. In this package it is also possible to define a customized &nbsp;way to save and load the variables that connect subsystems together. For this purpose, one has to redeclare the package ObsoleteTypes.Utilities with simple functions for reading and writing values, such as is done in the default package FileUtilities. </p>
</html>"));
    end FilesUtilities;

    package BooleanExtension
      extends Modelica.Icons.VariantsPackage;
          block Parameter "Read constant boolean signal"
            extends AbstractBoolean;

            Modelica.Blocks.Interfaces.BooleanOutput y
          "Connector of Real output signal"
              annotation (Placement(transformation(extent={{100,-10},{120,10}})));

          equation
            y = k;
            annotation (
              Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={Rectangle(
                extent={{-100,20},{100,-20}},
                lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={255,255,255}), Text(
                extent={{-100,-10},{100,10}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString="%varName")}),
          Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
          end Parameter;

          block InputParameter "Read constant boolean signal"
            extends AbstractBoolean(k=
              Utilities.readBoolean(varName));

            Modelica.Blocks.Interfaces.BooleanOutput y
          "Connector of Real output signal"
              annotation (Placement(transformation(extent={{100,-10},{120,10}})));
            replaceable package Utilities = FilesUtilities;

          equation
            y = k;
            annotation (
              Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={Rectangle(
                extent={{-100,20},{100,-20}},
                lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={255,255,255}), Text(
                extent={{-100,-10},{100,10}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString="%varName")}),
          Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
          end InputParameter;

          block OutputFinal "Save boolean value to file"
           extends AbstractBoolean;

            replaceable package Utilities = FilesUtilities;

            Modelica.Blocks.Interfaces.BooleanInput
                                                  y
          "Connector of Real output signal"
              annotation (Placement(transformation(extent={{-100,-10},{-80,10}}), iconTransformation(extent={{-100,-10},{-80,10}})));

          equation
            when terminal() then
               Utilities.writeBoolean(varName,y);
            end when;

            annotation (
              Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={Rectangle(
                extent={{-100,20},{100,-20}},
                lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={255,255,255}), Text(
                extent={{-100,-10},{100,10}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString="%varName")}),
          Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
          end OutputFinal;

          block OutputComparison "Save variable comparison to file"
            import Physiolibrary;
            extends AbstractBoolean(          k=Utilities.readBoolean(varName));
            replaceable package Utilities = FilesUtilities
             annotation (Dialog(group="Functions to read or store",tab="Types"));

            Modelica.Blocks.Interfaces.BooleanInput
                                  y "Connector of Real input signal"
              annotation (Placement(transformation(extent={{-100,-10},{-80,10}}), iconTransformation(extent={{-120,-10},{-100,10}})));

      protected
            parameter Boolean initialValue(fixed=false);
          initial equation
            initialValue = y;
          equation
            when terminal() then
             Utilities.writeBooleanComparison(
              varName,
              k,
              initialValue,
              y);
            end when;

              annotation (
              Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2},
              initialScale=0.04), graphics={Rectangle(
                extent={{-100,20},{100,-20}},
                lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={255,255,255}), Text(
                extent={{-100,-10},{100,10}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString="%varName")}),
          Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
          end OutputComparison;
    end BooleanExtension;

    package Utilities "Value input/output/test support"
      extends Modelica.Icons.BasesPackage;
      replaceable function readReal "Read the real value of parameter from file with lines in format:
  <parameterName>
  <value> <unit>"
        extends Modelica.Icons.Function;

        input String name "Name of parameter";
        input String storeUnit "Preferred units to store variable value";
        input UnitConversions.RealTypeRecord[:] unitConversions = UnitConversions.RealTypeDef
          "Unit conversions";

        output Real value=0 "Actual value of parameter in SI units";
      //algorithm
      end readReal;

      replaceable function readReal_SI "Read the real value in SI units of parameter from file with lines in format:
  <parameterName>\\n<value>"
        extends Modelica.Icons.Function;

        input String name "Name of parameter";

        output Real value=0 "Actual value of parameter in SI units";
      //algorithm
      end readReal_SI;

      replaceable function readBoolean "Read the boolean value of parameter from file with lines in format:
  <parameterName>
  <value> <unit>"
        extends Modelica.Icons.Function;

        input String name "Variable name";
        output Boolean value "Variable value";
      //algorithm
      end readBoolean;

      replaceable function writeReal "Write the real value to file"
        extends Modelica.Icons.Function;

        input String name "Variable name";
        input Real value "Variable value";
        input String storeUnit "Preferred units to store variable value";
        input UnitConversions.RealTypeRecord[:] unitConversions = UnitConversions.RealTypeDef
          "Unit conversions";
      //algorithm
      end writeReal;

      replaceable function writeReal_SI
        "Write the real value using SI unit to file"
        extends Modelica.Icons.Function;

        input String name "Variable name";
        input Real value "Variable value";
      //algorithm
      end writeReal_SI;

      replaceable function writeBoolean "Write the boolean value to file"
        extends Modelica.Icons.Function;

        input String name "Variable name";
        input Boolean value "Variable value";
      //algorithm
      end writeBoolean;

      replaceable function writeComparison
        "Compare and write the result and the value to file"

        extends Modelica.Icons.Function;

        input String name "Variable name";
        input Real defaultValue
          "Original value[in SIunits] to compare with final value";
        input Real initialValue "Initial variable value[in SI units]";
        input Real finalValue "Final variable value[in SI units]";

        input String storeUnit "Preferred units to store variable value";
        input UnitConversions.RealTypeRecord[:] unitConversions = UnitConversions.RealTypeDef
          "Unit conversions";
      //algorithm
      end writeComparison;

      replaceable function writeComparison_SI
        "Compare and write the result and the value to file using SI units"

        extends Modelica.Icons.Function;

        input String name "Variable name";
        input Real defaultValue
          "Original value[in SIunits] to compare with final value";
        input Real initialValue "Initial variable value[in SI units]";
        input Real finalValue "Final variable value[in SI units]";

      //algorithm
      end writeComparison_SI;

      replaceable function writeBooleanComparison
        "Compare and write the result and the value to file"
        extends Modelica.Icons.Function;

        input String name "Variable name";
        input Boolean defaultValue
          "Original value[in SIunits] to compare with final value";
        input Boolean initialValue "Initial variable value[in SI units]";
        input Boolean finalValue "Final variable value[in SI units]";
      //algorithm
      end writeBooleanComparison;

      package UnitConversions "Conversions non-SI units at input/output"

       function findUnit
         input String unitToFind "display unit to find in unitConversions";
         input UnitConversions.RealTypeRecord[:] unitConversions = UnitConversions.RealTypeDef
            "Unit conversions";
         output Integer typeDef "index in unitConversions";
       algorithm
         typeDef:=0;
         for i in 1:size(unitConversions,1) loop
           if unitConversions[i].DisplayUnit == unitToFind then
             typeDef:=i;
             break;
           end if;
         end for;
         if typeDef==0 then
            Modelica.Utilities.Streams.print("Unit \"" + unitToFind + "\" not defined. Do not hesitate to contact me. marek@matfyz.cz\n");
         end if;
       end findUnit;

       record RealTypeRecord "The Real Type definition"
         parameter String Quantity="" "Quantity";
         parameter String Unit="1" "SI unit";
         parameter String DisplayUnit="" "Display unit";

         parameter Real Scale=1
            "Scale from display unit to SI unit such that x <d> = x*s+o <u>";
         parameter Real Offset=0
            "Offset from display unit to SI unit such that x <d> = x*s+o <u>";

         parameter Real Min=-Modelica.Constants.inf "minimal value";
         parameter Real Max=+Modelica.Constants.inf; // Inf denotes a large value
         parameter Real Start = Offset; // Initial value
         parameter Real Nominal = Scale; // Nominal value
         parameter StateSelect StateSelection = StateSelect.default;
       end RealTypeRecord;

        constant RealTypeRecord RealTypeDef[:]={RealTypeRecord(),
            RealTypeRecord(),RealTypeRecord(
              Quantity="pH",
              Unit="log10(mol/l)",
              DisplayUnit="log10(mol/l)",
              Scale=1),RealTypeRecord(
              Quantity="Energy",
              Unit="J",
              DisplayUnit="kcal",
              Scale=4186.8),RealTypeRecord(
              Quantity="Time",
              Unit="s",
              DisplayUnit="min",
              Scale=60),RealTypeRecord(
              Quantity="Frequency",
              Unit="1/s",
              DisplayUnit="Hz",
              Scale=1),RealTypeRecord(
              Quantity="Frequency",
              Unit="1/s",
              DisplayUnit="1/min",
              Scale=1/60),RealTypeRecord(
              Quantity="Mass",
              Unit="kg",
              Min=0,
              DisplayUnit="g",
              Scale=1e-3),RealTypeRecord(
              Quantity="Mass",
              Unit="kg",
              Min=0,
              DisplayUnit="mg",
              Scale=1e-6),RealTypeRecord(
              Quantity="MassFlowRate",
              Unit="kg/s",
              DisplayUnit="mg/min",
              Scale=(1e-6)/60),RealTypeRecord(
              Quantity="MassFlowRate",
              Unit="kg/s",
              DisplayUnit="g/min",
              Scale=(1e-3)/60),RealTypeRecord(
              Quantity="Density",
              Unit="kg/m3",
              Min=0,
              DisplayUnit="kg/l",
              Scale=1e3),RealTypeRecord(
              Quantity="Density",
              Unit="kg/m3",
              Min=0,
              DisplayUnit="g/l",
              Scale=1),RealTypeRecord(
              Quantity="MassConcentration",
              Unit="kg/m3",
              Min=0,
              DisplayUnit="mg/l",
              Scale=1e-3),RealTypeRecord(
              Quantity="MassConcentration",
              Unit="kg/m3",
              Min=0,
              DisplayUnit="mg/dl",
              Scale=1e-6/1e-4),RealTypeRecord(
              Quantity="MassConcentration",
              Unit="kg/m3",
              Min=0,
              DisplayUnit="ng/l",
              Scale=1e-12/1e-3),RealTypeRecord(
              Quantity="MassConcentration",
              Unit="kg/m3",
              Min=0,
              DisplayUnit="ng/dl",
              Scale=1e-12/1e-4),RealTypeRecord(
              Quantity="MassConcentration",
              Unit="kg/m3",
              Min=0,
              DisplayUnit="ng/ml",
              Scale=1e-12/1e-6),RealTypeRecord(
              Quantity="Length",
              Unit="m",
              DisplayUnit="cm",
              Scale=1e-2),RealTypeRecord(
              Quantity="Velocity",
              Unit="m/s",
              DisplayUnit="MPH",
              Scale=0.44704),RealTypeRecord(
              Quantity="Acceleration",
              Unit="m/s2",
              DisplayUnit="m/s2",
              Scale=1),RealTypeRecord(
              Quantity="Pressure",
              Unit="Pa",
              DisplayUnit="mmHg",
              Scale=101325/760),RealTypeRecord(
              Quantity="Volume",
              Unit="m3",
              DisplayUnit="ml",
              Scale=1e-6),RealTypeRecord(
              Quantity="VolumeFlowRate",
              Unit="m3/s",
              DisplayUnit="ml/min",
              Scale=(1e-6)/60),RealTypeRecord(
              Quantity="Concentration",
              Unit="mol/m3",
              DisplayUnit="mol/l",
              Scale=1e+3),RealTypeRecord(
              Quantity="Concentration",
              Unit="mol/m3",
              DisplayUnit="mmol/l",
              Scale=1),RealTypeRecord(
              Quantity="Concentration",
              Unit="mol/m3",
              DisplayUnit="pmol/l",
              Scale=1e-12/1e-3),RealTypeRecord(
              Quantity="Concentration",
              Unit="mol/m3",
              DisplayUnit="uU_Insulin/ml",
              Scale=6.622e-9),RealTypeRecord(
              Quantity="Concentration",
              Unit="mol/m3",
              DisplayUnit="U_EPO/l",
              Scale=0.45e-9),RealTypeRecord(
              Quantity="AmountOfSubstance",
              Unit="mol",
              DisplayUnit="mmol",
              Scale=1e-3),RealTypeRecord(
              Quantity="AmountOfSubstance",
              Unit="mol",
              DisplayUnit="osm",
              Scale=1),RealTypeRecord(
              Quantity="AmountOfSubstance",
              Unit="mol",
              DisplayUnit="mosm",
              Scale=1e-3),RealTypeRecord(
              Quantity="MolarFlowRate",
              Unit="mol/s",
              DisplayUnit="mmol/min",
              Scale=(1e-3)/60),RealTypeRecord(
              Quantity="MolarFlowRate",
              Unit="mol/s",
              DisplayUnit="ml_STP/min",
              Scale=1/1362657.193569),RealTypeRecord(
              Quantity="Energy",
              Unit="J",
              DisplayUnit="kcal",
              Scale=4186.8),RealTypeRecord(
              Quantity="ThermodynamicTemperature",
              Unit="K",
              DisplayUnit="K",
              Scale=1,
              Start=310.15),RealTypeRecord(
              Quantity="ThermodynamicTemperature",
              Unit="K",
              DisplayUnit="degC",
              Scale=1,
              Offset=273.15,
              Start=310.15),RealTypeRecord(
              Quantity="Power",
              Unit="W",
              DisplayUnit="W",
              Scale=1),RealTypeRecord(
              Quantity="Power",
              Unit="W",
              DisplayUnit="kcal/min",
              Scale=4186.8/60),RealTypeRecord(
              Quantity="Power",
              Unit="W",
              DisplayUnit="cal/min",
              Scale=4.1868/60),RealTypeRecord(
              Quantity="ThermalConductance",
              Unit="W/K",
              DisplayUnit="kcal/(min.degC)",
              Scale=4186.8/60),RealTypeRecord(
              Quantity="SpecificHeatCapacity",
              Unit="J/(kg.K)",
              DisplayUnit="kcal/(degC.kg)",
              Scale=4186.8),RealTypeRecord(
              Quantity="SpecificEnergy",
              Unit="J/kg",
              DisplayUnit="kcal/kg",
              Scale=4186.8),RealTypeRecord(
              Quantity="ElectricPotential",
              Unit="V",
              DisplayUnit="mV",
              Scale=1e-3),RealTypeRecord(
              Quantity="ElectricCharge",
              Unit="C",
              DisplayUnit="meq",
              Scale=(1e-3)*(9.64853399*10^4)),RealTypeRecord(
              Quantity="VolumeDensityOfCharge",
              Unit="C/m3",
              DisplayUnit="meq/l",
              Scale=(1e-3)*(9.64853399*10^4)/1e-3),RealTypeRecord(
              Quantity="VolumeDensityOfCharge",
              Unit="C/m3",
              DisplayUnit="eq/l",
              Scale=(9.64853399*10^4)/1e-3),RealTypeRecord(
              Quantity="ElectricCurrent",
              Unit="A",
              DisplayUnit="meq/min",
              Scale=(1e-3)*(9.64853399*10^4)/60),RealTypeRecord(
              Quantity="Fraction",
              Unit="1",
              DisplayUnit="%",
              Scale=1e-2),RealTypeRecord(
              Quantity="OsmoticMembramePermeability",
              Unit="m6/(mol.s)",
              DisplayUnit="ml/(mOsmol.min)",
              Scale=(1e-6)/((1e-3)*60)),RealTypeRecord(
              Quantity="DiffusionMembranePermeability",
              Unit="m3/s",
              DisplayUnit="ml/min",
              Scale=(1e-3)/60),RealTypeRecord(
              Quantity="HydraulicConductance",
              Unit="m3/(Pa.s)",
              DisplayUnit="ml/(mmHg.min)",
              Scale=(1e-6)/((101325/760)*60)),RealTypeRecord(
              Quantity="HydraulicCompliance",
              Unit="m3/Pa",
              DisplayUnit="ml/mmHg",
              Scale=(1e-6)/(101325/760)),RealTypeRecord(
              Quantity="HydraulicInertance",
              Unit="Pa.s2/m3",
              DisplayUnit="mmHg.min2/ml",
              Scale=((101325/760)*(60^2)/(1e-6))),RealTypeRecord(
              Quantity="GasSolubility",
              Unit="mol/(m3.Pa)",
              DisplayUnit="mmol/(l.mmHg)",
              Scale=(1e-3)/((1e-3)*(101325/760))),RealTypeRecord(
              Quantity="Osmolarity",
              Unit="mol/m3",
              DisplayUnit="mosm/l",
              Scale=1),RealTypeRecord(
              Quantity="Osmolarity",
              Unit="mol/m3",
              DisplayUnit="osm/l",
              Scale=1000),RealTypeRecord(
              Quantity="MolarEnergy",
              Unit="J/mol",
              DisplayUnit="kcal/mol",
              Scale=4186.8),RealTypeRecord(
              Quantity="Pharmacology Concentration",
              Unit="1/m3",
              DisplayUnit="iu/l",
              Scale=1000),RealTypeRecord(
              Quantity="Pharmacology Concentration",
              Unit="1/m3",
              DisplayUnit="uiu/ml",
              Scale=1),RealTypeRecord(
              Quantity="PopulationChange",
              Unit="1/s",
              DisplayUnit="1/min",
              Scale=1/60),RealTypeRecord(
              Quantity="PopulationChange",
              Unit="1/s",
              DisplayUnit="1/d",
              Scale=1/(60*60*24))}
          "All defined Real types - units, displayUnits, conversions, nominals";

         constant String[:] Prefix =    {"","m", "u", "n", "p"};
         constant Real[:]   PrefixScale={1.0, 1e-3,1e-6,1e-9,1e-12};

         constant String[:] SuffixSI= {"","/m3","/m3","/m3","/s"};
         constant String[:] Suffix =  {"","/l", "/dl","/ml","/min"};
         constant Real[:]   SuffixScale={1, 1e+3, 1e+4, 1e+6, 1/60};

        function GenerateSubstanceUnits
           input String nonSIunit "non-SI unit";
           input Real scale "1 mol = 'scale' 'nonSIunit'";
           output RealTypeRecord[size(Prefix,1)*size(Suffix,1)] units
            "generated conversions for mili-, micro-, .. amount/concentration/flow";
        protected
         constant Integer np = size(Prefix,1);
         constant Integer ns = size(Suffix,1);
        algorithm
          units:={
              RealTypeRecord(
                Unit="mol"+SuffixSI[integer(1+mod(i,ns))],
                DisplayUnit=Prefix[integer(1+div(i,ns))] + nonSIunit + Suffix[integer(1+mod(i,ns))],
                Scale=PrefixScale[integer(1+div(i,ns))]*scale*SuffixScale[integer(1+mod(i,ns))])
              for i in 0:(np*ns-1)};
        end GenerateSubstanceUnits;

      end UnitConversions;
    end Utilities;

    package ZeroUtilities "No input/output/test"
      import Physiolibrary;
      extends Utilities;
      extends Modelica.Icons.VariantsPackage;

      redeclare function extends readReal
      algorithm
      end readReal;

      redeclare function extends readReal_SI
      algorithm
      end readReal_SI;

      redeclare function extends readBoolean
      algorithm
      end readBoolean;

      redeclare function extends writeReal
      algorithm
      end writeReal;

      redeclare function extends writeReal_SI
      algorithm
      end writeReal_SI;

      redeclare function extends writeBoolean
      algorithm
      end writeBoolean;

      redeclare function extends writeComparison
      algorithm
      end writeComparison;

      redeclare function extends writeComparison_SI
      algorithm
      end writeComparison_SI;

      redeclare function extends writeBooleanComparison
      algorithm
      end writeBooleanComparison;

    end ZeroUtilities;

    type SimulationType = enumeration(
        NoInit "Use start values only as a guess of state values",
        NormalInit "Initialization by start values",
        ReadInit "Initialization by function Utilities.readReal('state name')",
        InitSteadyState
          "Initialization in Steady State (initial derivations are zeros)",
        SteadyState "Steady State = Derivations are zeros during simulation")
      "Initialization or Steady state options (to determine model type before simulating)"
        annotation (Evaluate=true);
    type VolumetricHydraulicInertance = Real(final quantity="HydraulicInertance",final unit="Pa.s2/m3", displayUnit="mmHg.min2/ml", nominal=((133.322387415)*(60^2)/(1e-6)));
     annotation (Documentation(revisions="<html>
<p>Copyright (c) 2008-2015, Marek Matej&aacute;k, Charles University in Prague </p>
<p>All rights reserved. </p>
<p>Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met: </p>
<ol>
<li>Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer. </li>
<li>Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution. </li>
<li>Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission. </li>
</ol>
<p>THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS &QUOT;AS IS&QUOT; AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.</p>
</html>",   info="<html>
<p>The main problem of medical research, articles, and experiments is using obscure units from medicine, pharmacology, biology and non-physics disciplines. The Physiolibrary fulfills the Modelica ideal of using SI units as the main unit for each variable, and the previously described physiological units are also implemented as the displayUnits for each variable. Using these displayUnits the user sets and sees the &QUOT;physiological&QUOT; values. The implementation can also be joined to any unit-correct Modelica models and physical equations without crashing due to unit incompatibilities. The unit support of Physiolibrary is so strong that you even can chose the right unit-typed &ldquo;input real&rdquo;/&rdquo;output real&rdquo; from the library package Types.RealIO. As can be expected, only the non-specific packages States and Blocks in the Physiolibrary have variables without units.</p>
</html>"));
  end ObsoleteTypes;
end Obsolete;

within Physiolibrary;
package Chemical "Molar Concentration Physiological Domain"
 extends Modelica.Icons.Package;
  package Examples
    "Examples that demonstrate usage of the Pressure flow components"
  extends Modelica.Icons.ExamplesPackage;

    model SimpleReaction

       extends Modelica.Icons.Example;

      Components.Substance         A(solute_start=0.9)
        annotation (Placement(transformation(extent={{-56,-8},{-36,12}})));
      Components.ChemicalReaction
                                reaction(K=1)
        annotation (Placement(transformation(extent={{-10,-8},{10,12}})));
      Components.Substance         B(solute_start=0.1)
        annotation (Placement(transformation(extent={{44,-8},{64,12}})));
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
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics), Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end SimpleReaction;

    model SimpleReaction_Equilibrated
      extends SimpleReaction(
        A(Simulation=Simulation),
        B(Simulation=Simulation, isDependent=true),
        reaction);
      extends States.StateSystem(Simulation=States.SimulationType.Equilibrated);

      parameter Types.AmountOfSubstance totalSystemSubstance=0.01;
    equation
      normalizedState[1]*totalSystemSubstance = A.solute + B.solute;
      annotation (Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end SimpleReaction_Equilibrated;

    model SimpleReaction2

       extends Modelica.Icons.Example;

      Components.Substance         A(solute_start=0.9)
        annotation (Placement(transformation(extent={{-56,-8},{-36,12}})));
      Components.ChemicalReaction
                                reaction(K=1, nP=2)
        annotation (Placement(transformation(extent={{-10,-8},{10,12}})));
      Components.Substance         B(solute_start=0.1)
        annotation (Placement(transformation(extent={{44,-8},{64,12}})));
      Components.Substance         C(solute_start=0.1)
        annotation (Placement(transformation(extent={{44,16},{64,36}})));
    equation

      connect(A.q_out, reaction.substrates[1]) annotation (Line(
          points={{-46,2},{-10,2}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(reaction.products[1], B.q_out) annotation (Line(
          points={{10,1.5},{32,1.5},{32,2},{54,2}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(reaction.products[2], C.q_out) annotation (Line(
          points={{10,2.5},{32,2.5},{32,26},{54,26}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics), Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end SimpleReaction2;

    model SimpleReaction2_Equilibrated
      extends SimpleReaction2(
        A(Simulation=Simulation),
        reaction,
        B(Simulation=Simulation, isDependent=true),
        C(Simulation=Simulation, isDependent=true));
      extends States.StateSystem(NumberOfNormalizedStates=2, Simulation=States.SimulationType.Equilibrated);

      parameter Types.AmountOfSubstance totalBSubstance=0.01,totalCSubstance=0.01;
    equation
      normalizedState[1]*totalBSubstance = A.solute + B.solute;
      normalizedState[1]*totalCSubstance = A.solute + C.solute;
      annotation (Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end SimpleReaction2_Equilibrated;

    model Allosteric_Hemoglobin_MWC
    extends Modelica.Icons.Example;
    extends States.StateSystem(Simulation=States.SimulationType.Equilibrated);
    //=States.SimulationType.NoInit); for dynamic simulation

      parameter Types.GasSolubility alpha =  0.0105 * 1e-3
        "oxygen solubility in plasma"; // by Siggaard Andersen: 0.0105 (mmol/l)/kPa
      parameter Types.Fraction L = 7.0529*10^6
        "=[T0]/[R0] .. dissociation constant of relaxed <-> tensed change of deoxyhemoglobin tetramer";
      parameter Types.Fraction c = 0.00431555
        "=KR/KT .. ration between oxygen affinities of relaxed vs. tensed subunit";
      parameter Types.Concentration KR = 0.000671946
        "oxygen dissociation on relaxed(R) hemoglobin subunit";   //*7.875647668393782383419689119171e-5
                                                                //10.500001495896 7.8756465463794e-05

      parameter Types.Concentration KT=KR/c
        "oxygen dissociation on tensed(T) hemoglobin subunit";

      Types.Fraction sO2 "hemoglobin oxygen saturation";

      parameter Types.AmountOfSubstance totalAmountOfHemoglobin=1;
      Types.AmountOfSubstance totalAmountOfRforms;
      Types.AmountOfSubstance totalAmountOfTforms;

      Components.Substance                       T0(stateName="T0",Simulation=Simulation,
        solute_start=1)
        annotation (Placement(transformation(extent={{52,78},{72,98}})));

      Components.Substance                       T1(stateName="T1",Simulation=Simulation,
        solute_start=0)
        annotation (Placement(transformation(extent={{54,36},{74,56}})));

      Components.Substance                       R1(stateName="R1",Simulation=Simulation,
        solute_start=0,
        isDependent=true)
        annotation (Placement(transformation(extent={{0,36},{20,56}})));

      Components.Substance                       T2(stateName="T2",Simulation=Simulation,
        solute_start=0)
        annotation (Placement(transformation(extent={{54,-10},{74,10}})));

      Components.Substance                       R2(stateName="R2",Simulation=Simulation,
        solute_start=0)
        annotation (Placement(transformation(extent={{0,-10},{20,10}})));

      Components.Substance                       T3(stateName="T3",Simulation=Simulation,
        solute_start=0)
        annotation (Placement(transformation(extent={{54,-54},{74,-34}})));

      Components.Substance                       R3(stateName="R3",Simulation=Simulation,
        solute_start=0)
        annotation (Placement(transformation(extent={{0,-54},{20,-34}})));

      Components.Substance                       T4(stateName="T4",Simulation=Simulation,
        solute_start=0)
        annotation (Placement(transformation(extent={{54,-92},{74,-72}})));

      Components.Substance                       R4(stateName="R4",Simulation=Simulation,
        solute_start=0)
        annotation (Placement(transformation(extent={{0,-92},{20,-72}})));

      Components.Substance                       R0(stateName="R0",
        solute_start=0,
        Simulation=Simulation)
        annotation (Placement(transformation(extent={{0,78},{20,98}})));

      Components.ChemicalReaction               quaternaryForm(K=L)
        annotation (Placement(transformation(extent={{24,78},{44,98}})));
      Components.ChemicalReaction                oxyR1(nP=2, K=KR/4)
                                                                annotation (Placement(
            transformation(
            extent={{-10,10},{10,-10}},
            rotation=90,
            origin={10,64})));
      Components.ChemicalReaction                oxyT1(nP=2, K=KT/4)
                                                                annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={64,64})));
      Components.ChemicalReaction                oxyR2(nP=2, K=KR/(3/2))
                                                                annotation (Placement(
            transformation(
            extent={{-10,10},{10,-10}},
            rotation=90,
            origin={10,22})));
      Components.ChemicalReaction                oxyR3(nP=2, K=KR/(2/3))
                                                                annotation (Placement(
            transformation(
            extent={{-10,10},{10,-10}},
            rotation=90,
            origin={10,-24})));
      Components.ChemicalReaction                oxyR4(nP=2, K=KR*4)
                                                                annotation (Placement(
            transformation(
            extent={{-10,10},{10,-10}},
            rotation=90,
            origin={10,-66})));
      Components.ChemicalReaction                oxyT2(nP=2, K=KT/(3/2))
                                                                annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={64,22})));
      Components.ChemicalReaction                oxyT3(nP=2, K=KT/(2/3))
                                                                annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={64,-24})));
      Components.ChemicalReaction                oxyT4(nP=2, K=KT*4)
                                                                annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={64,-66})));
      Components.ChemicalReaction               quaternaryForm1(K=c*L)
        annotation (Placement(transformation(extent={{28,36},{48,56}})));
      Components.ChemicalReaction               quaternaryForm2(K=(c^2)*L)
        annotation (Placement(transformation(extent={{28,-10},{48,10}})));
      Components.ChemicalReaction               quaternaryForm3(K=(c^3)*L)
        annotation (Placement(transformation(extent={{28,-54},{48,-34}})));
      Components.ChemicalReaction               quaternaryForm4(K=(c^4)*L)
        annotation (Placement(transformation(extent={{30,-92},{50,-72}})));

    public
      Components.Substance oxygen_unbound(
                                         Simulation=Simulation, solute_start=0.000001
            *7.875647668393782383419689119171e-5,
        isDependent=true)
        annotation (Placement(transformation(extent={{-36,-36},{-16,-16}})));
      Mixed.Components.PartialPressure
                            partialPressure(
        alpha_T0=alpha, T=310.15)                                     annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={-50,-8})));
      Hydraulic.Sources.UnlimitedVolume airOxygen(Simulation=Simulation)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-50,34})));
      Modelica.Blocks.Sources.Clock clock(offset=1e-06)
        annotation (Placement(transformation(extent={{-88,54},{-68,74}})));
    equation

      sO2 = (R1.solute + 2*R2.solute + 3*R3.solute + 4*R4.solute + T1.solute + 2*T2.solute + 3*T3.solute + 4*T4.solute)/(4*totalAmountOfHemoglobin);
      totalAmountOfRforms = R0.solute + R1.solute + R2.solute + R3.solute + R4.solute;
      totalAmountOfTforms = T0.solute + T1.solute + T2.solute + T3.solute + T4.solute;

      totalAmountOfHemoglobin*normalizedState[1] = totalAmountOfRforms + totalAmountOfTforms;

      connect(quaternaryForm.products[1],T0. q_out) annotation (Line(
          points={{44,88},{62,88}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(oxyR1.products[2], oxygen_unbound.q_out)
                                          annotation (Line(
          points={{10.5,74},{-26,74},{-26,-26}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(oxyR2.products[2], oxygen_unbound.q_out)
                                          annotation (Line(
          points={{10.5,32},{-26,32},{-26,-26}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(oxyR3.products[2], oxygen_unbound.q_out)
                                          annotation (Line(
          points={{10.5,-14},{-26,-14},{-26,-26}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(oxyR4.products[2], oxygen_unbound.q_out)
                                          annotation (Line(
          points={{10.5,-56},{-26,-56},{-26,-26}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(oxyR1.substrates[1],R1. q_out) annotation (Line(
          points={{10,54},{10,46}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(R1.q_out,oxyR2. products[1]) annotation (Line(
          points={{10,46},{10,32},{9.5,32}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(oxyR2.substrates[1],R2. q_out) annotation (Line(
          points={{10,12},{10,0}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(oxyR3.substrates[1],R3. q_out) annotation (Line(
          points={{10,-34},{10,-44}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(oxyR3.products[1],R2. q_out) annotation (Line(
          points={{9.5,-14},{9.5,-7},{10,-7},{10,0}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(R3.q_out,oxyR4. products[1]) annotation (Line(
          points={{10,-44},{10,-56},{9.5,-56}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(oxyR4.substrates[1],R4. q_out) annotation (Line(
          points={{10,-76},{10,-82}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(oxyT1.products[1],T0. q_out) annotation (Line(
          points={{64.5,74},{64.5,88},{62,88}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(oxyT1.substrates[1],T1. q_out) annotation (Line(
          points={{64,54},{64,46}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(oxygen_unbound.q_out, oxyT1.products[2])
                                          annotation (Line(
          points={{-26,-26},{-26,74},{63.5,74}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(oxygen_unbound.q_out, oxyT2.products[2])
                                          annotation (Line(
          points={{-26,-26},{-26,32},{63.5,32}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(oxygen_unbound.q_out, oxyT3.products[2])
                                          annotation (Line(
          points={{-26,-26},{-26,-14},{63.5,-14}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(oxygen_unbound.q_out, oxyT4.products[2])
                                          annotation (Line(
          points={{-26,-26},{-26,-56},{63.5,-56}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(T1.q_out,oxyT2. products[1]) annotation (Line(
          points={{64,46},{64,32},{64.5,32}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(oxyT2.substrates[1],T2. q_out) annotation (Line(
          points={{64,12},{64,0}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(T2.q_out,oxyT3. products[1]) annotation (Line(
          points={{64,0},{64,-14},{64.5,-14}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(oxyT3.substrates[1],T3. q_out) annotation (Line(
          points={{64,-34},{64,-44}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(T3.q_out,oxyT4. products[1]) annotation (Line(
          points={{64,-44},{64,-56},{64.5,-56}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(oxyT4.substrates[1],T4. q_out) annotation (Line(
          points={{64,-76},{64,-82}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(R0.q_out,quaternaryForm. substrates[1]) annotation (Line(
          points={{10,88},{24,88}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(R0.q_out,oxyR1. products[1]) annotation (Line(
          points={{10,88},{10,74},{9.5,74}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(R1.q_out,quaternaryForm1. substrates[1]) annotation (Line(
          points={{10,46},{28,46}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(quaternaryForm1.products[1],T1. q_out) annotation (Line(
          points={{48,46},{64,46}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(R2.q_out,quaternaryForm2. substrates[1]) annotation (Line(
          points={{10,0},{28,0}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(quaternaryForm2.products[1],T2. q_out) annotation (Line(
          points={{48,0},{64,0}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(R3.q_out,quaternaryForm3. substrates[1]) annotation (Line(
          points={{10,-44},{28,-44}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(quaternaryForm3.products[1],T3. q_out) annotation (Line(
          points={{48,-44},{64,-44}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(R4.q_out,quaternaryForm4. substrates[1]) annotation (Line(
          points={{10,-82},{30,-82}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(quaternaryForm4.products[1],T4. q_out) annotation (Line(
          points={{50,-82},{64,-82}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(airOxygen.y, partialPressure.v)       annotation (Line(
          points={{-50,24},{-50,2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(clock.y, airOxygen.pressure)       annotation (Line(
          points={{-67,64},{-50,64},{-50,44}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(partialPressure.n, oxygen_unbound.q_out) annotation (Line(
          points={{-50,-14},{-50,-26},{-26,-26}},
          color={107,45,134},
          thickness=1,
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
      import Physiolibrary;
     extends Modelica.Icons.Example;
     extends States.StateSystem(Simulation=States.SimulationType.Equilibrated);

      parameter Types.GasSolubility alpha =  0.0105 * 1e-3
        "oxygen solubility in plasma"; // by Siggaard Andersen: 0.0105 (mmol/l)/kPa
      parameter Types.Fraction L = 7.0529*10^6
        "=[T0]/[R0] .. dissociation constant of relaxed <-> tensed change of deoxyhemoglobin tetramer";
      parameter Types.Fraction c = 0.00431555
        "=KR/KT .. ration between oxygen affinities of relaxed vs. tensed subunit";
      parameter Types.Concentration KR = 0.000671946
        "oxygen dissociation on relaxed(R) hemoglobin subunit";   //*7.875647668393782383419689119171e-5
                                                                //10.500001495896 7.8756465463794e-05

      parameter Types.Concentration KT=KR/c
        "oxygen dissociation on tensed(T) hemoglobin subunit";

      Types.Fraction sO2 "hemoglobin oxygen saturation";

      parameter Types.AmountOfSubstance totalAmountOfHemoglobin=0.001;

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
                          OxyRHm(solute_start=0, Simulation=Simulation)
        "Oxygenated subunit in R structure of hemoglobin tetramer"
        annotation (Placement(transformation(extent={{-98,-36},{-78,-16}})));
      Physiolibrary.Chemical.Components.ChemicalReaction
                       oxygenation_R(K=KR, nP=2)
        annotation (Placement(transformation(extent={{-70,-36},{-50,-16}})));
      Physiolibrary.Chemical.Components.Substance
                          DeoxyRHm(Simulation=Simulation,
        isDependent=true,
        solute_start=1e-08)
        "Deoxygenated subunit in R structure of hemoglobin tetramer"
        annotation (Placement(transformation(extent={{-42,-36},{-22,-16}})));
      Physiolibrary.Chemical.Components.Substance
                          OxyTHm(solute_start=0, Simulation=Simulation)
        "Oxygenated subunit in T structure of hemoglobin tetramer"
        annotation (Placement(transformation(extent={{22,-36},{42,-16}})));
      Physiolibrary.Chemical.Components.ChemicalReaction
                       oxygenation_T(K=KT, nP=2)
        annotation (Placement(transformation(extent={{50,-36},{70,-16}})));
      Physiolibrary.Chemical.Components.Substance
                          DeoxyTHm(solute_start=totalAmountOfHemoglobin - 0.00001,
          Simulation=Simulation)
        "Deoxygenated subunit in T structure of hemoglobin tetramer"
        annotation (Placement(transformation(extent={{78,-36},{98,-16}})));
    public
      Physiolibrary.Chemical.Components.Substance
                          oxygen_unbound(Simulation=Simulation, solute_start=0.000001
            *7.875647668393782383419689119171e-5,
        isDependent=true)
        annotation (Placement(transformation(extent={{-4,-2},{16,18}})));
      Physiolibrary.Mixed.Components.PartialPressure
                            partialPressure(
        alpha_T0=alpha,
        T=310.15)                                     annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={6,38})));
      Physiolibrary.Hydraulic.Sources.UnlimitedVolume airOxygen(Simulation=
            Simulation)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},
            rotation=270,
            origin={6,66})));
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
          points={{-32,-26},{-42,-26},{-42,-80}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(T0_in_T.subunitSpecies[1], DeoxyTHm.q_out)
                                                   annotation (Line(
          points={{74,-80},{82,-80},{82,-26},{88,-26}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(airOxygen.y, partialPressure.v)       annotation (Line(
          points={{6,56},{6,48}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(clock.y, airOxygen.pressure)       annotation (Line(
          points={{-19,84},{6,84},{6,76}},
          color={0,0,127},
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
          points={{-54,-58.4},{-54,-72}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(DeoxyRHm.solute, add.u1) annotation (Line(
          points={{-32,-33.8},{-32,-42},{-52,-42},{-52,-49.2},{-51.6,-49.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(OxyRHm.solute, add.u2) annotation (Line(
          points={{-88,-33.8},{-88,-42},{-56,-42},{-56,-50},{-56.4,-50},{
              -56.4,-49.2}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(add1.y, T0_in_T.totalSubunitAmount[1])
                                               annotation (Line(
          points={{62,-58.4},{62,-72}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(OxyTHm.solute, add1.u2) annotation (Line(
          points={{32,-33.8},{32,-42},{59.6,-42},{59.6,-49.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add1.u1, DeoxyTHm.solute) annotation (Line(
          points={{64.4,-49.2},{64.4,-42},{88,-42},{88,-33.8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(partialPressure.n, oxygen_unbound.q_out) annotation (Line(
          points={{6,32},{6,8}},
          color={107,45,134},
          thickness=1,
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

    model MichaelisMentenExample "Basic enzyme kinetics"
      import Physiolibrary;
    extends Modelica.Icons.Example;

      Physiolibrary.Chemical.Sources.UnlimitedStorage
                       P(Concentration=0)
        annotation (Placement(transformation(extent={{58,8},{38,28}})));
      Physiolibrary.Chemical.Sources.UnlimitedStorage
                       S(Concentration=10)
        annotation (Placement(transformation(extent={{-62,8},{-42,28}})));

      Physiolibrary.Chemical.Components.MichaelisMenten
                      michaelisMenten(
        Km=1.5,
        tE=0.001,
        k_cat=0.06)
        annotation (Placement(transformation(extent={{-8,14},{12,34}})));
    equation

      connect(S.q_out, michaelisMenten.p) annotation (Line(
          points={{-42,18},{-8,18}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(michaelisMenten.n, P.q_out) annotation (Line(
          points={{12,18},{38,18}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics), Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end MichaelisMentenExample;

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
        annotation (Placement(transformation(extent={{68,-58},{48,-38}})));
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
          points={{48,-48},{32,-48}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics), Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end ExothermicReaction;
  end Examples;

  package Components
    extends Modelica.Icons.Package;
    model Diffusion "Solute diffusion"
      extends Icons.Diffusion;
      extends Interfaces.OnePort;

      parameter Physiolibrary.Types.DiffusionPermeability cond
        "Diffusion conductance";

    equation
       q_in.q = cond * (q_in.conc - q_out.conc);

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
</html>"));
    end Diffusion;

    model MolarStream "Molar flow of solute in stream"
      extends Interfaces.OnePort;

      Physiolibrary.Types.RealIO.VolumeFlowRateInput solventFlow
        "Solvent flow (solution volume flow = solventFlow + solute volume flow)!"
        annotation (Placement(transformation(extent={{-20,26},{20,66}}),
            iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,60})));

    equation
    //  assert(solventFlow>=-Modelica.Constants.eps,"In MolarStream must be always the forward flow in forward direction! Not 'solventFlow<0'!");
      q_in.q = solventFlow*q_in.conc
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
              rotation=180)}),        Diagram(coordinateSystem(preserveAspectRatio=true,
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
<td><p align=\"center\">forward flow</p></td>
<td><p align=\"center\">backward flow</p></td>
</tr>
<tr>
<td><p align=\"center\"><h4>solventFlow</h4></p></td>
<td><p align=\"center\">&GT;=0</p></td>
<td><p align=\"center\">&LT;0</p></td>
</tr>
<tr>
<td><p align=\"center\"><h4>q_in.q</h4></p></td>
<td><p align=\"center\">=solventFlow*q_in.conc</p></td>
<td><p align=\"center\">=solventFlow*q_out.conc</p></td>
</tr>
<tr>
<td><p align=\"center\"><h4>q_out.q</h4></p></td>
<td><p align=\"center\">=-q_in.q</p></td>
<td><p align=\"center\">=-q_in.q</p></td>
</tr>
</table>
</html>"),        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics));

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}),       graphics));
    end MolarStream;

    model Clearance "Clearance with solvent outflow"

      Interfaces.PositiveConcentrationFlow
                                q_in "solute outflow"
                                annotation (Placement(
            transformation(extent={{-120,-20},{-80,20}}), iconTransformation(extent=
               {{-110,-10},{-90,10}})));

      parameter Boolean useSolventFlow = false
        "=true, if clearence is expressed from outflow"
      annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

      parameter Physiolibrary.Types.VolumeFlowRate Clearance=0
        "Clearance of solute if useSolventFlow=false"
        annotation (Dialog(enable=not useSolventFlow));

      Physiolibrary.Types.RealIO.VolumeFlowRateInput solventFlow(start=Clearance/K) = clearance/K if useSolventFlow
        "solvent outflow"
       annotation (Placement(transformation(extent={{-20,20},{20,60}}),
            iconTransformation(
            extent={{-20,-20},{20,20}},
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

    //  assert(clearance>=-Modelica.Constants.eps, "Clearancecan not be negative!");

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
              textString="K=%K")}),   Diagram(coordinateSystem(preserveAspectRatio=true,
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

    model Degradation "Degradation of solvent in defined volume"

      Physiolibrary.Types.RealIO.VolumeInput volume
        "Degradation volume, where degradation takes place."
         annotation (Placement(transformation(extent={{-20,20},{20,60}}),
            iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,40})));

      Interfaces.PositiveConcentrationFlow
                                q_in "Degraded solute outflow"
                                annotation (Placement(
            transformation(extent={{-120,-20},{-80,20}}), iconTransformation(extent=
               {{-110,-10},{-90,10}})));

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
                                      Diagram(coordinateSystem(preserveAspectRatio=true,
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

    model SoluteFlowPump "Active pumping of solute"
      extends Interfaces.OnePort;

      Physiolibrary.Types.RealIO.MolarFlowRateInput soluteFlow
        "Solute flow rate"
        annotation (Placement(transformation(extent={{-20,40},{20,80}}),
            iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,60})));

    equation
       q_in.q = soluteFlow;

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
              textString="%name")}),  Diagram(coordinateSystem(preserveAspectRatio=true,
                       extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics));
    end SoluteFlowPump;

    model Substance "Concentration accumulation in solvent "
      import Physiolibrary;
      extends Physiolibrary.Icons.Substance;
      extends Physiolibrary.States.State(
      state(nominal=NominalSolute),
      change(nominal=NominalSolute/60),
      state_start=solute_start,
      storeUnit="mmol");
      extends Chemical.Interfaces.ConditionalSolventVolume;

      Physiolibrary.Chemical.Interfaces.NegativeConcentrationFlow
                                q_out(conc(nominal=NominalSolute/0.001), q(
            nominal=NominalSolute/60)) "Flux from/to compartment"
                                 annotation (Placement(
            transformation(extent={{62,-32},{102,8}}),  iconTransformation(extent={{-10,-10},
                {10,10}})));
      parameter Physiolibrary.Types.AmountOfSubstance
                                        solute_start(nominal=NominalSolute)
        "Initial solute amount in compartment"
         annotation (Dialog(group="Initialization"));

      Physiolibrary.Types.RealIO.AmountOfSubstanceOutput solute(nominal=
          NominalSolute) "Current amount of solute"
        annotation (Placement(transformation(extent={{-20,-120},{20,-80}}, rotation=
               -90,
            origin={102,-102}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,-78})));

      parameter Physiolibrary.Types.AmountOfSubstance
                                        NominalSolute = 0.001
        "Numerical scale. Default is from mmol to mol, but for some substances such as hormones, hydronium or hydroxide ions can be much smaller."
          annotation (Dialog(tab="Solver",group="Numerical support of very small concentrations"));

    equation
      q_out.conc = solute/volume;

      state = solute; // der(solute)=q_out.q
      change = q_out.q;

                                                                                                        annotation (choicesAllMatching=true,
                  Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics), Icon(coordinateSystem(
              preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
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

      parameter Real kf = 10^11 "Forward reaction rate coefficient [SI unit]"
        annotation (Dialog(group="Parameters")); //forward K*(10^rateLevel) at temperature TK

      parameter Integer nS=1 "Number of substrates types"
        annotation (Dialog(group="Substrates", tab="Reaction type"));
      parameter Integer nP=1 "Number of products types"
        annotation (Dialog(group="Products", tab="Reaction type"));

      parameter Modelica.SIunits.StoichiometricNumber s[nS]=ones(nS)
        "Stoichiometric reaction coefficient for substrates"
        annotation (Dialog(group="Substrates", tab="Reaction type"));

      parameter Modelica.SIunits.StoichiometricNumber p[nP]=ones(nP)
        "Stoichiometric reaction coefficients for products"
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
        "Dissociation constant [SI-unit]"    annotation (Placement(transformation(
            extent={{-12,28},{28,68}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,40})));

      Physiolibrary.Chemical.Interfaces.NegativeConcentrationFlow
                                products[nP] "Products"
                             annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{90,-10},{110,10}}),iconTransformation(extent={{90,-10},
                {110,10}})));

      Physiolibrary.Chemical.Interfaces.PositiveConcentrationFlow
                                substrates[nS] "Substrates"
                                annotation (Placement(
            transformation(extent={{-120,-20},{-80,20}}), iconTransformation(extent=
               {{-110,-10},{-90,10}})));  /*s[nS]*/
    protected
      Physiolibrary.Types.MolarFlowRate rr "Reaction molar flow rate";

      Real KaT "Dissociation constant in current temperature";
      Real KBase "dissociation constant at TK";

    equation
      if not useDissociationConstantInput then
        KBase = K;
      end if;

      KaT = KBase * Modelica.Math.exp(((-dH)/Modelica.Constants.R)*(1/T_heatPort - 1/TK));  //Hoff's equation

      rr = kf*volume*(product(substrates.conc.^s) - (1/KaT)*product(products.conc.^p));  //Elementary first-order rate kinetics - the main equation

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

    model GasSolubility
      "Henry's law about the solubility of a gas in a liquid. q_in is dissolved in liquid and q_out is in gaseous solution"

      extends Physiolibrary.Icons.GasSolubility;
      extends Interfaces.ConditionalHeatPort;

      parameter Types.DiffusionPermeability solubilityRateCoef=10^3
        "The rate constant of incoming gas to solution";

      Physiolibrary.Types.Fraction kH
        "Henry's law coefficient such as liquid-gas concentration ratio";

      parameter Physiolibrary.Types.Fraction kH_T0
        "Henry's law coefficient at base temperature";
      parameter Physiolibrary.Types.Temperature T0=298.15
        "Base temperature for kH_T0"
         annotation (Dialog(tab="Temperature dependence"));
      parameter Physiolibrary.Types.Temperature C(displayUnit="K") = 1700
        "Gas-liquid specific constant for Van't Hoff's change of kH (i.e.: O2..1700K,CO2..2400K,N2..1300K,CO..1300K,..)"
        annotation (Dialog(tab="Temperature dependence"));

      Interfaces.NegativeConcentrationFlow
                                q_out "Gaseous solution"
                             annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{18,-10},{38,10}}), iconTransformation(
              extent={{-10,70},{10,90}})));

      Interfaces.PositiveConcentrationFlow
                                q_in "Dissolved in liquid"
                                annotation (Placement(
            transformation(extent={{-120,-20},{-80,20}}), iconTransformation(extent={{-10,-90},
                {10,-70}})));
    equation
      q_in.q + q_out.q = 0;

      kH = kH_T0 * Modelica.Math.exp(C* (1/T_heatPort - 1/T0)); // Van't Hoff equation

      // equilibrium:  gas.conc = kH * liquid.conc;
      q_out.q = solubilityRateCoef*(q_out.conc - kH * q_in.conc); //negative because of outflow

      lossHeat = C*Modelica.Constants.R*q_out.q; //negative = heat are comsumed when change from liquid to gas

       annotation (Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},
                {100,100}}),       graphics={
            Text(
              extent={{0,-100},{240,-140}},
              textString="%name",
              lineColor={0,0,255})}),             Documentation(revisions="<html>
<p><i>2009-2012</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),
        Diagram(graphics));
    end GasSolubility;

    model Dilution "Adding the solvent to solution"
      extends Interfaces.OnePort;

      Physiolibrary.Types.RealIO.FractionInput dilution
        "Fraction of final undilutes solution"
        annotation (Placement(transformation(extent={{-16,8},{24,48}}),
            iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=0,
            origin={-100,60})));
    equation

      q_out.conc = dilution * q_in.conc;

     annotation (
        Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{
                100,100}}), graphics={Bitmap(extent={{-100,101},{100,-101}},
                fileName="modelica://Physiolibrary/Resources/Icons/dilution.png",
              origin={0,33},
              rotation=270),
            Text(
              extent={{-120,20},{120,-20}},
              textString="%name",
              lineColor={0,0,255},
              origin={-2,-60},
              rotation=180)}),        Diagram(coordinateSystem(preserveAspectRatio=true,
                       extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics));
    end Dilution;

    model MichaelisMenten "Basic enzyme kinetics"
      extends Icons.MichaelisMenten;
    protected
    extends States.StateSystem(Simulation=States.SimulationType.Equilibrated);

    public
     parameter Types.AmountOfSubstance tE "total enzyme concentration";
     parameter Real k_cat(unit="m3/s", displayUnit="l/min")
        "forward rate of second reaction";
     parameter Types.Concentration Km
        "Michaelis constant = substrate concentration at rate of half Vmax";

      Substance           ES(Simulation=Simulation, solute_start=0)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
      Substance           E(Simulation=Simulation, solute_start=tE,
        isDependent=true)
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
      Interfaces.PositiveConcentrationFlow
                                p
        annotation (Placement(transformation(extent={{-110,-70},{-90,-50}}),
            iconTransformation(extent={{-110,-70},{-90,-50}})));
      Interfaces.NegativeConcentrationFlow
                                n
        annotation (Placement(transformation(extent={{90,-70},{110,-50}}),
            iconTransformation(extent={{90,-70},{110,-50}})));
    equation
      normalizedState[1]*tE = E.solute + ES.solute;

     //Michaelis-Menton: v=((E.q_out.conc + ES.q_out.conc)*k_cat)*S.concentration/(Km+S.concentration);
      connect(E.q_out, chemicalReaction.substrates[2]) annotation (Line(
          points={{0,48},{-58,48},{-58,0.5},{-42,0.5}},
          color={200,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(chemicalReaction.products[1], ES.q_out) annotation (Line(
          points={{-22,0},{0,0}},
          color={200,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(ES.q_out, chemicalReaction1.substrates[1]) annotation (Line(
          points={{0,0},{24,0}},
          color={200,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(chemicalReaction1.products[2], E.q_out) annotation (Line(
          points={{44,0.5},{52,0.5},{52,48},{0,48}},
          color={200,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(p, chemicalReaction.substrates[1]) annotation (Line(
          points={{-100,-60},{-72,-60},{-72,-0.5},{-42,-0.5}},
          color={200,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(chemicalReaction1.products[1], n) annotation (Line(
          points={{44,-0.5},{74,-0.5},{74,-60},{100,-60}},
          color={200,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics), Icon(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
            Text(
              extent={{-100,-100},{100,-126}},
              lineColor={0,0,255},
              textString="%name")}));
    end MichaelisMenten;

    model Speciation
      "Chemical species definition by independent binding sides of macromolecule"
      extends Icons.Speciation;
      extends Physiolibrary.States.StateSystem(Simulation=States.SimulationType.Equilibrated,NumberOfNormalizedStates=NumberOfSubunitTypes-1);
      extends Physiolibrary.Chemical.Interfaces.ConditionalSolventVolume;

      parameter Integer NumberOfSubunitTypes=1
        "Number of subunit types occuring in macromolecule";

      Physiolibrary.Chemical.Interfaces.PositiveConcentrationFlow
                                                       species
        "Defined macromolecule form"                                                        annotation (Placement(
            transformation(extent={{90,-90},{110,-70}}),iconTransformation(extent={{90,-90},
                {110,-70}})));
      Physiolibrary.Chemical.Interfaces.PositiveConcentrationFlow
                                                       subunitSpecies[NumberOfSubunitTypes]
        "Definid species of macromolecule subunit types (in NormalSolventVolume)"
                                                                                                            annotation (Placement(
            transformation(extent={{-10,90},{10,110}}),   iconTransformation(extent={{-10,-10},
                {10,10}},
            rotation=270,
            origin={-80,0})));

      parameter Real numberOfSubunit[NumberOfSubunitTypes]
        "Number of identical subunits instances in macromolecule. First should be non-zero.";

    protected
      Real fractions[NumberOfSubunitTypes];
    public
      Types.RealIO.AmountOfSubstanceInput totalSubunitAmount[NumberOfSubunitTypes]
        annotation (Placement(transformation(extent={{-120,60},{-80,100}}),
            iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={40,80})));
      Types.RealIO.AmountOfSubstanceOutput totalSubsystemAmount
       annotation (Placement(
            transformation(extent={{-10,-90},{10,-70}}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={0,-100})));                                 //(start=1e-8)
    equation
      totalSubsystemAmount = totalSubunitAmount[1]/numberOfSubunit[1];

      fractions = if
                    (totalSubsystemAmount < Modelica.Constants.eps) then zeros(NumberOfSubunitTypes) else subunitSpecies.conc ./ (totalSubunitAmount/volume);

      species.conc = (totalSubsystemAmount/volume)*product(fractions.^numberOfSubunit);

      for i in 2:NumberOfSubunitTypes loop
             normalizedState[i-1]*totalSubsystemAmount*numberOfSubunit[i] = totalSubunitAmount[i];
      end for;

      subunitSpecies.q = -species.q * numberOfSubunit;

      annotation (defaultComponentName="macromoleculeSpecie_in_macromoleculeGroup",Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics), Icon(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics),
                  Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics), Icon(coordinateSystem(
              preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
            graphics={                                    Text(
              extent={{-22,-102},{220,-136}},
              lineColor={0,0,255},
              textString="%name")}),
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

    model Reabsorption "Reabsorption of input fraction"
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

      Interfaces.PositiveConcentrationFlow
                                Inflow "Tubular inflow"              annotation (Placement(
            transformation(extent={{-120,-20},{-80,20}}), iconTransformation(
              extent={{-108,30},{-88,50}})));
      Interfaces.NegativeConcentrationFlow
                                Outflow "Tubular outflow"
        annotation (Placement(transformation(extent={{80,-20},{120,20}}),
            iconTransformation(extent={{88,30},{108,50}})));

      Interfaces.NegativeConcentrationFlow
                                Reabsorption "Reabsorption from tubules"          annotation (Placement(
            transformation(extent={{-20,-100},{20,-60}}),iconTransformation(
              extent={{-10,-110},{10,-90}})));
      Physiolibrary.Types.RealIO.FractionInput baseReabsorption=baseReabFract if useBaseReabsorption
        "Base fraction of molar inflow for reabsorption flow"
                                   annotation (Placement(transformation(extent={{-90,-66},
                {-70,-46}}),
                       iconTransformation(extent={{-20,-20},{20,20}},
                                                                    rotation=-90,
            origin={40,80})));

      Types.RealIO.FractionInput Effect(displayUnit="1")=e if useEffect
        "Effects<1 decrease reabsorption, effects>1 increase reabsorption fraction by equation ReabFract=BaseReabsorption^(1/Effect)"
                                   annotation (Placement(transformation(extent={{-98,58},
                {-78,78}}),
                       iconTransformation(extent={{-20,-20},{20,20}},
                                                                    rotation=-90,
            origin={0,80})));
      Types.RealIO.MolarFlowRateInput               MaxReab=mr if useMaxReabInput
        "Maximal allowed reabsorption molar flow rate"
                                   annotation (Placement(transformation(extent={{-22,38},
                {-2,58}}),
                       iconTransformation(extent={{-20,-20},{20,20}},
                                                                    rotation=0,
            origin={-80,-60})));
      Types.RealIO.FractionOutput               ReabFract=reabFract if useEffect
        "Actual reabsorbed fraction from solute inflow rate"                                annotation (Placement(transformation(extent={{76,50},
                {92,66}}),   iconTransformation(extent={{80,-100},{120,-60}})));

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
      extends Interfaces.OnePort;
      extends Icons.MolarFlowMeasure;

     Physiolibrary.Types.RealIO.MolarFlowRateOutput actualFlow
                             annotation (Placement(transformation(extent={{-20,30},{20,70}}),
            iconTransformation(extent={{-20,-20},{20,20}},
                                                         rotation=270,
            origin={0,-42})));
    equation
      q_in.conc = q_out.conc;

      actualFlow = q_in.q;

     annotation (
        Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{
                100,100}}), graphics),Diagram(coordinateSystem(preserveAspectRatio=true,
                       extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end MolarFlowMeasure;

    model ConcentrationMeasure "Measure of molar concentration"

      Interfaces.PositiveConcentrationFlow
                                q_in "For measure only"
                                annotation (Placement(
            transformation(extent={{-120,-20},{-80,20}}), iconTransformation(extent={{-10,-10},
                {10,10}})));
      Physiolibrary.Types.RealIO.ConcentrationOutput actualConc
        "Actual concentration"
                             annotation (Placement(transformation(extent={{-20,30},{20,70}}),
            iconTransformation(extent={{-20,-20},{20,20}},
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
                                      Diagram(coordinateSystem(preserveAspectRatio=true,
                       extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end ConcentrationMeasure;

    model FlowConcentrationMeasure
      "The outflow concentration from absorption (i.e. portal vein concentration)"

      Interfaces.PositiveConcentrationFlow
                                q_in "Concentration before absorption source"
                             annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{-110,-8},{-90,12}}), iconTransformation(extent=
                {{-110,-10},{-90,10}})));
      Physiolibrary.Types.RealIO.VolumeFlowRateInput SolventFlow
        "Solvent flow through absorption source"                                                      annotation ( extent = [-10,50;10,70], rotation = -90);

      Physiolibrary.Types.RealIO.MolarFlowRateInput AdditionalSoluteFlow
        "Absorbed molar flow rate"                                          annotation (Placement(
            transformation(extent={{-60,60},{-20,100}}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={0,-60})));
      Physiolibrary.Types.RealIO.ConcentrationOutput Conc
        "Concentration after absorption source"                           annotation (Placement(transformation(extent=
               {{82,-20},{122,20}}), iconTransformation(extent={{82,-20},{122,
                20}})));
    equation
      Conc = q_in.conc + AdditionalSoluteFlow/SolventFlow;
      q_in.q = 0;
     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Rectangle(
              extent={{-100,-50},{100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{-88,-50},{80,50}},
              textString="%name",
              lineColor={0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio=true,
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

    model MolarInflux "Molar pump of solute"

      Interfaces.NegativeConcentrationFlow
                                q_out "Outflow"
                             annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{90,-10},{110,10}}), iconTransformation(extent={
                {50,-10},{70,10}})));
      Physiolibrary.Types.RealIO.MolarFlowRateInput desiredFlow
        "Solute flow rate"
          annotation (Placement(transformation(extent={{-20,20},{20,60}}),
            iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,40})));

    equation
      q_out.q = - desiredFlow;

     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={
            Rectangle(
              extent={{-60,-30},{60,30}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-48,20},{50,0},{-48,-21},{-48,20}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-92,-54},{80,-30}},
              textString="%name",
              lineColor={0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio=true,
                       extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics));
    end MolarInflux;

    model UnlimitedStorage "Constant concentration source"
     //extends Icons.Substance;

      Interfaces.NegativeConcentrationFlow
                                q_out
        "constant concentration with any possible flow"
                                 annotation (Placement(
            transformation(extent={{62,-32},{102,8}}),  iconTransformation(extent={{90,-10},
                {110,10}})));
      parameter Physiolibrary.Types.Concentration Concentration;

      parameter Physiolibrary.States.SimulationType Simulation=States.SimulationType.NoInit
        "If in equilibrium, then zero-flow equation is added."
        annotation (Dialog(group="Simulation",tab="Equilibrium"));

    equation
      q_out.conc = Concentration;

      if Simulation==States.SimulationType.Equilibrated then
        q_out.q = 0;
      end if;

      annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics), Icon(coordinateSystem(
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
              textString="Conc=%Concentration")}),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end UnlimitedStorage;
  end Sources;

  package Interfaces
    extends Modelica.Icons.InterfacesPackage;

    connector ConcentrationFlow "Concentration and Solute flow"
      Physiolibrary.Types.Concentration conc "Solute concentration";
      flow Physiolibrary.Types.MolarFlowRate q "Solute flow";
      annotation (Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end ConcentrationFlow;

    connector PositiveConcentrationFlow "Concentration and Solute inflow"
      extends Interfaces.ConcentrationFlow;

    annotation (
        defaultComponentName="p",
        Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,
                100}}),     graphics={Rectangle(
              extent={{-20,10},{20,-10}},
              lineColor={107,45,134},
              lineThickness=1),       Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={107,45,134},
              fillColor={107,45,134},
              fillPattern=FillPattern.Solid)}),
        Diagram(Polygon(points=[-21,-3; 5,23; 31,-3; 5,-29; -21,-3],   style(
              color=74,
              rgbcolor={0,0,0},
              fillColor=0,
              rgbfillColor={0,0,0})), Text(
            extent=[-105,-38; 115,-83],
            string="%name",
            style(color=0, rgbcolor={0,0,0}))),
        Documentation(info="<html>
<p>
Connector with one flow signal of type Real.
</p>
</html>",
        revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));

    end PositiveConcentrationFlow;

    connector NegativeConcentrationFlow
      "Concentration and negative Solute outflow"
      extends Interfaces.ConcentrationFlow;

    annotation (
        defaultComponentName="n",
        Icon(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=false),
            graphics={Rectangle(
              extent={{-20,10},{20,-10}},
              lineColor={107,45,134},
              lineThickness=1),       Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={107,45,134},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
        Diagram(Polygon(points=[-21,-3; 5,23; 31,-3; 5,-29; -21,-3],   style(
              color=74,
              rgbcolor={0,0,0},
              fillColor=0,
              rgbfillColor={255,255,255})), Text(
            extent=[-105,-38; 115,-83],
            string="%name",
            style(color=0, rgbcolor={0,0,0}))),
        Documentation(info="<html>
<p>
Connector with one flow signal of type Real.
</p>
</html>",
        revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));

    end NegativeConcentrationFlow;

    partial model OnePort

      Interfaces.NegativeConcentrationFlow
                                q_out "Solute outflow"
                             annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{18,-10},{38,10}}), iconTransformation(
              extent={{90,-12},{110,8}})));

      Interfaces.PositiveConcentrationFlow
                                q_in "Solute inflow"
                                annotation (Placement(
            transformation(extent={{-120,-20},{-80,20}}), iconTransformation(extent={{-110,
                -12},{-90,8}})));
    equation
      q_in.q + q_out.q = 0;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),
                             graphics));
    end OnePort;

    partial model ConditionalHeatPort
      "Partial model to include a conditional HeatPort in order to describe the power loss via a thermal network"

      parameter Boolean useHeatPort = false "=true, if HeatPort is enabled"
      annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true), Dialog(group="External inputs/outputs"));
      parameter Physiolibrary.Types.Temperature T=310.15
        "Fixed device temperature if useHeatPort = false"
        annotation (Dialog(enable=not useHeatPort,tab="Temperature dependence"));

      Physiolibrary.Thermal.Interfaces.PositiveHeatFlow heatPort(T(start=T)=T_heatPort, Q_flow=-lossHeat) if useHeatPort
        annotation (Placement(transformation(extent={{-10,-10},{10,10}}),
            iconTransformation(extent={{-10,-10},{10,10}})));
      Modelica.SIunits.Power lossHeat
        "Loss heat leaving component via HeatPort";
      Modelica.SIunits.Temperature T_heatPort "Temperature of HeatPort";
    equation
      if not useHeatPort then
         T_heatPort = T;
      end if;

      annotation (Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},
                {100,100}}),                                                                       graphics),
        Documentation(revisions="<html>
<ul>
<li><i> February 17, 2009   </i>
       by Christoph Clauss<br> initially implemented<br>
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
</html>"),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                100}}), graphics));
    end ConditionalHeatPort;

    partial model ConditionalSolventVolume
      "Chemical processes can be modeled with or without(normalized to 1 liter) variable solvent volume"

      constant Physiolibrary.Types.Volume NormalSolventVolume=0.001 "1 liter";

      parameter Boolean isNormalizedVolume = true
        "=true, if solvent volume is 1 liter"
      annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

      Physiolibrary.Types.RealIO.VolumeInput solventVolume=volume if not isNormalizedVolume annotation (Placement(
            transformation(extent={{-52,28},{-12,68}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={-40,40})));

      Physiolibrary.Types.Volume volume "SolventVolume";

    equation
      if isNormalizedVolume then
        volume = NormalSolventVolume;
      end if;

      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}),                                                                 graphics),
        Documentation(revisions="<html>
<ul>
<li><i> February 17, 2009   </i>
       by Christoph Clauss<br> initially implemented<br>
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
    end ConditionalSolventVolume;
  end Interfaces;
  annotation (Documentation(revisions="<html>
<p>Licensed by Marek Matejak under the Modelica License 2</p>
<p>Copyright &copy; 2008-2013, Marek Matejak, Charles University in Prague.</p>
<p><br/><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Physiolibrary.UsersGuide.ModelicaLicense2\">Physiolibrary.UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p>
</html>", info="<html>
<p>In physiology books, chapters about chemical substances are organized by their types. The main reason for this is that each substance in the human body is regulated in a different way. For example the regulation of sodium is different from the regulation of potassium, and from the regulation of glucose, and so on. This view leads to the idea of having separate models of each substance. The origin of different flows and regulations is the (cellular) membrane. Water and solutions can cross it in different directions at the same time. Crossings occur for different reasons: water is driven mostly by osmotic gradients, electrolytes are driven by charge to reach Donnan&apos;s equilibrium, and some solutes can even be actively transported against their concentration or electrical gradients. And all this is specifically driven from the higher levels by neural and hormonal responses.&nbsp; </p>
<p>In Physiolibrary flows and fluxes of solutes are supported mostly by the Chemical package. All parts inside this Physiolibrary.Chemical package use the connector ConcentrationFlow, which defines the molar concentration and molar flow/flux rate of one solute. This is the supporting infrastructure for modeling membrane diffusion, accumulations of substances, reversal chemical reactions, Henry&apos;s law of gas solubility, dilution with additional solvent flow, membrane reabsorption, chemical degradation and physiological clearance. For usage examples, please open the Chemical.Examples package.</p>
</html>"));
end Chemical;

within Physiolibrary;
package Chemical "Molar Concentration Physiological Domain"

  package Examples
    "Examples that demonstrate usage of the Pressure flow components"
  extends Modelica.Icons.ExamplesPackage;

    model SimpleReaction

       extends Modelica.Icons.Example;

      Chemical.NormalizedSubstance A(solute_start=0.9)
        annotation (Placement(transformation(extent={{-56,-8},{-36,12}})));
      Chemical.ChemicalReaction reaction(K=1)
        annotation (Placement(transformation(extent={{-10,-8},{10,12}})));
      Chemical.NormalizedSubstance B(solute_start=0.1)
        annotation (Placement(transformation(extent={{44,-8},{64,12}})));
    equation

      connect(A.q_out, reaction.substrates[1]) annotation (Line(
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
    end SimpleReaction;

    model SimpleReaction_Equilibrated
      extends SimpleReaction(
        A(Simulation=Simulation),
        B(Simulation=Simulation),
        reaction(Simulation=Simulation, isSubstrateFlowIncludedInEquilibrium={false}));
      extends States.StateSystem(Simulation=States.SimulationType.Equilibrated);

      parameter Types.AmountOfSubstance totalSystemSubstance=0.01;
    equation
      normalizedState[1]*totalSystemSubstance = A.solute + B.solute;
    end SimpleReaction_Equilibrated;

    model SimpleReaction2

       extends Modelica.Icons.Example;

      Chemical.NormalizedSubstance A(solute_start=0.9)
        annotation (Placement(transformation(extent={{-56,-8},{-36,12}})));
      Chemical.ChemicalReaction reaction(K=1, nP=2)
        annotation (Placement(transformation(extent={{-10,-8},{10,12}})));
      Chemical.NormalizedSubstance B(solute_start=0.1)
        annotation (Placement(transformation(extent={{44,-8},{64,12}})));
      Chemical.NormalizedSubstance C(solute_start=0.1)
        annotation (Placement(transformation(extent={{44,16},{64,36}})));
    equation

      connect(A.q_out, reaction.substrates[1]) annotation (Line(
          points={{-46,2},{-10,2}},
          color={200,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(reaction.products[1], B.q_out) annotation (Line(
          points={{10,1.5},{32,1.5},{32,2},{54,2}},
          color={200,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(reaction.products[2], C.q_out) annotation (Line(
          points={{10,2.5},{32,2.5},{32,26},{54,26}},
          color={200,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics));
    end SimpleReaction2;

    model SimpleReaction2_Equilibrated
      extends SimpleReaction2(
        A(Simulation=Simulation),
        B(Simulation=Simulation),
        reaction(Simulation=Simulation, isProductFlowIncludedInEquilibrium={false,false}));
      extends States.StateSystem(NumberOfNormalizedStates=2, Simulation=States.SimulationType.Equilibrated);

      parameter Types.AmountOfSubstance totalBSubstance=0.01,totalCSubstance=0.01;
    equation
      normalizedState[1]*totalBSubstance = A.solute + B.solute;
      normalizedState[1]*totalCSubstance = A.solute + C.solute;
    end SimpleReaction2_Equilibrated;
    model MWC_Allosteric_Hemoglobin
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

      NormalizedSubstance                        T0(stateName="T0",Simulation=Simulation,
        solute_start=1)
        annotation (Placement(transformation(extent={{52,78},{72,98}})));

      NormalizedSubstance                        T1(stateName="T1",Simulation=Simulation,
        solute_start=0)
        annotation (Placement(transformation(extent={{54,36},{74,56}})));

      NormalizedSubstance                        R1(stateName="R1",Simulation=Simulation,
        solute_start=0)
        annotation (Placement(transformation(extent={{0,36},{20,56}})));

      NormalizedSubstance                        T2(stateName="T2",Simulation=Simulation,
        solute_start=0)
        annotation (Placement(transformation(extent={{54,-10},{74,10}})));

      NormalizedSubstance                        R2(stateName="R2",Simulation=Simulation,
        solute_start=0)
        annotation (Placement(transformation(extent={{0,-10},{20,10}})));

      NormalizedSubstance                        T3(stateName="T3",Simulation=Simulation,
        solute_start=0)
        annotation (Placement(transformation(extent={{54,-54},{74,-34}})));

      NormalizedSubstance                        R3(stateName="R3",Simulation=Simulation,
        solute_start=0)
        annotation (Placement(transformation(extent={{0,-54},{20,-34}})));

      NormalizedSubstance                        T4(stateName="T4",Simulation=Simulation,
        solute_start=0)
        annotation (Placement(transformation(extent={{54,-92},{74,-72}})));

      NormalizedSubstance                        R4(stateName="R4",Simulation=Simulation,
        solute_start=0)
        annotation (Placement(transformation(extent={{0,-92},{20,-72}})));

      NormalizedSubstance                        R0(stateName="R0",
        solute_start=0,
        Simulation=Simulation)
        annotation (Placement(transformation(extent={{0,78},{20,98}})));

      ChemicalReaction                          quaternaryForm(K=L)
        annotation (Placement(transformation(extent={{24,78},{44,98}})));
      ChemicalReaction                           oxyR1(nP=2, K=KR/4)
                                                                annotation (Placement(
            transformation(
            extent={{-10,10},{10,-10}},
            rotation=90,
            origin={10,64})));
      ChemicalReaction                           oxyT1(nP=2, K=KT/4)
                                                                annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={64,64})));
      ChemicalReaction                           oxyR2(nP=2, K=KR/(3/2))
                                                                annotation (Placement(
            transformation(
            extent={{-10,10},{10,-10}},
            rotation=90,
            origin={10,22})));
      ChemicalReaction                           oxyR3(nP=2, K=KR/(2/3))
                                                                annotation (Placement(
            transformation(
            extent={{-10,10},{10,-10}},
            rotation=90,
            origin={10,-24})));
      ChemicalReaction                           oxyR4(nP=2, K=KR*4)
                                                                annotation (Placement(
            transformation(
            extent={{-10,10},{10,-10}},
            rotation=90,
            origin={10,-66})));
      ChemicalReaction                           oxyT2(nP=2, K=KT/(3/2))
                                                                annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={64,22})));
      ChemicalReaction                           oxyT3(nP=2, K=KT/(2/3))
                                                                annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={64,-24})));
      ChemicalReaction                           oxyT4(nP=2, K=KT*4)
                                                                annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={64,-66})));
      ChemicalReaction                          quaternaryForm1(K=c*L)
        annotation (Placement(transformation(extent={{28,36},{48,56}})));
      ChemicalReaction                          quaternaryForm2(K=(c^2)*L)
        annotation (Placement(transformation(extent={{28,-10},{48,10}})));
      ChemicalReaction                          quaternaryForm3(K=(c^3)*L)
        annotation (Placement(transformation(extent={{28,-54},{48,-34}})));
      ChemicalReaction                          quaternaryForm4(K=(c^4)*L,
        Simulation=Simulation,
        isSubstrateFlowIncludedInEquilibrium={false})
        annotation (Placement(transformation(extent={{30,-92},{50,-72}})));

    public
      NormalizedSubstance oxygen_unbound(Simulation=Simulation, solute_start=0.000001
            *7.875647668393782383419689119171e-5)
        annotation (Placement(transformation(extent={{-36,-36},{-16,-16}})));
      Mixed.PartialPressure partialPressure(
        alpha=alpha,
        T=310.15,
        Simulation=Simulation)                        annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-50,-8})));
      Hydraulic.UnlimitedVolume unlimitedVolume(Simulation=Simulation)
        annotation (Placement(transformation(extent={{-82,16},{-62,36}})));
      Modelica.Blocks.Sources.Clock clock(offset=0.000001)
        annotation (Placement(transformation(extent={{-100,60},{-80,80}})));
    equation

      sO2 = (R1.solute + 2*R2.solute + 3*R3.solute + 4*R4.solute + T1.solute + 2*T2.solute + 3*T3.solute + 4*T4.solute)/(4*totalAmountOfHemoglobin);
      totalAmountOfRforms = R0.solute + R1.solute + R2.solute + R3.solute + R4.solute;
      totalAmountOfTforms = T0.solute + T1.solute + T2.solute + T3.solute + T4.solute;

      totalAmountOfHemoglobin*normalizedState[1] = totalAmountOfRforms + totalAmountOfTforms;

      connect(quaternaryForm.products[1],T0. q_out) annotation (Line(
          points={{44,88},{62,88}},
          color={200,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(oxyR1.products[2], oxygen_unbound.q_out)
                                          annotation (Line(
          points={{10.5,74},{-26,74},{-26,-26}},
          color={200,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(oxyR2.products[2], oxygen_unbound.q_out)
                                          annotation (Line(
          points={{10.5,32},{-26,32},{-26,-26}},
          color={200,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(oxyR3.products[2], oxygen_unbound.q_out)
                                          annotation (Line(
          points={{10.5,-14},{-26,-14},{-26,-26}},
          color={200,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(oxyR4.products[2], oxygen_unbound.q_out)
                                          annotation (Line(
          points={{10.5,-56},{-26,-56},{-26,-26}},
          color={200,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(oxyR1.substrates[1],R1. q_out) annotation (Line(
          points={{10,54},{10,46}},
          color={200,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(R1.q_out,oxyR2. products[1]) annotation (Line(
          points={{10,46},{10,32},{9.5,32}},
          color={200,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(oxyR2.substrates[1],R2. q_out) annotation (Line(
          points={{10,12},{10,0}},
          color={200,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(oxyR3.substrates[1],R3. q_out) annotation (Line(
          points={{10,-34},{10,-44}},
          color={200,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(oxyR3.products[1],R2. q_out) annotation (Line(
          points={{9.5,-14},{9.5,-7},{10,-7},{10,0}},
          color={200,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(R3.q_out,oxyR4. products[1]) annotation (Line(
          points={{10,-44},{10,-56},{9.5,-56}},
          color={200,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(oxyR4.substrates[1],R4. q_out) annotation (Line(
          points={{10,-76},{10,-82}},
          color={200,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(oxyT1.products[1],T0. q_out) annotation (Line(
          points={{64.5,74},{64.5,88},{62,88}},
          color={200,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(oxyT1.substrates[1],T1. q_out) annotation (Line(
          points={{64,54},{64,46}},
          color={200,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(oxygen_unbound.q_out, oxyT1.products[2])
                                          annotation (Line(
          points={{-26,-26},{-26,74},{63.5,74}},
          color={200,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(oxygen_unbound.q_out, oxyT2.products[2])
                                          annotation (Line(
          points={{-26,-26},{-26,32},{63.5,32}},
          color={200,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(oxygen_unbound.q_out, oxyT3.products[2])
                                          annotation (Line(
          points={{-26,-26},{-26,-14},{63.5,-14}},
          color={200,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(oxygen_unbound.q_out, oxyT4.products[2])
                                          annotation (Line(
          points={{-26,-26},{-26,-56},{63.5,-56}},
          color={200,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(T1.q_out,oxyT2. products[1]) annotation (Line(
          points={{64,46},{64,32},{64.5,32}},
          color={200,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(oxyT2.substrates[1],T2. q_out) annotation (Line(
          points={{64,12},{64,0}},
          color={200,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(T2.q_out,oxyT3. products[1]) annotation (Line(
          points={{64,0},{64,-14},{64.5,-14}},
          color={200,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(oxyT3.substrates[1],T3. q_out) annotation (Line(
          points={{64,-34},{64,-44}},
          color={200,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(T3.q_out,oxyT4. products[1]) annotation (Line(
          points={{64,-44},{64,-56},{64.5,-56}},
          color={200,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(oxyT4.substrates[1],T4. q_out) annotation (Line(
          points={{64,-76},{64,-82}},
          color={200,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(R0.q_out,quaternaryForm. substrates[1]) annotation (Line(
          points={{10,88},{24,88}},
          color={200,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(R0.q_out,oxyR1. products[1]) annotation (Line(
          points={{10,88},{10,74},{9.5,74}},
          color={200,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(R1.q_out,quaternaryForm1. substrates[1]) annotation (Line(
          points={{10,46},{28,46}},
          color={200,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(quaternaryForm1.products[1],T1. q_out) annotation (Line(
          points={{48,46},{64,46}},
          color={200,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(R2.q_out,quaternaryForm2. substrates[1]) annotation (Line(
          points={{10,0},{28,0}},
          color={200,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(quaternaryForm2.products[1],T2. q_out) annotation (Line(
          points={{48,0},{64,0}},
          color={200,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(R3.q_out,quaternaryForm3. substrates[1]) annotation (Line(
          points={{10,-44},{28,-44}},
          color={200,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(quaternaryForm3.products[1],T3. q_out) annotation (Line(
          points={{48,-44},{64,-44}},
          color={200,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(R4.q_out,quaternaryForm4. substrates[1]) annotation (Line(
          points={{10,-82},{30,-82}},
          color={200,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(quaternaryForm4.products[1],T4. q_out) annotation (Line(
          points={{50,-82},{64,-82}},
          color={200,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(partialPressure.n, oxygen_unbound.q_out)      annotation (Line(
          points={{-50,-18},{-50,-26},{-26,-26}},
          color={200,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(unlimitedVolume.y, partialPressure.v) annotation (Line(
          points={{-72,26},{-50,26},{-50,2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(clock.y, unlimitedVolume.pressure) annotation (Line(
          points={{-79,70},{-72,70},{-72,36}},
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
    end MWC_Allosteric_Hemoglobin;

    package Speciation
      extends Modelica.Icons.ExamplesPackage;

      model SubunitSpeciation "Speciation by subunit species"
        extends Physiolibrary.States.StateSystem(Simulation=States.SimulationType.Equilibrated,NumberOfNormalizedStates=NumberOfSubunitTypes-1);

        parameter Integer NumberOfSubunitTypes=1
          "Number of subunit types occuring in macromolecule";

        Physiolibrary.Chemical.PositiveConcentrationFlow species
          "Defined macromolecule form"                                                        annotation (Placement(
              transformation(extent={{-10,-10},{10,10}}), iconTransformation(extent={{-10,-10},
                  {10,10}})));
        Physiolibrary.Chemical.PositiveConcentrationFlow subunitSpecies[NumberOfSubunitTypes]
          "Definid species of macromolecule subunit types (in NormalSolventVolume)"
                                                                                                              annotation (Placement(
              transformation(extent={{-10,90},{10,110}}),   iconTransformation(extent={{-10,-10},
                  {10,10}},
              rotation=270,
              origin={0,100})));

        parameter Real numberOfSubunit[NumberOfSubunitTypes]
          "Number of identical subunits instances in macromolecule. First should be non-zero.";

        constant Physiolibrary.Types.Volume NormalSolventVolume=0.001 "1 liter";

        parameter Boolean isSubunitFlowIncludedInEquilibrium(start=true)
          "Is subunit flow equation included in equilibrium calculation?"
          annotation (Dialog(group="Simulation type", tab="Simulation"));

      protected
        Real fractions[NumberOfSubunitTypes];
      public
        Types.RealIO.AmountOfSubstanceInput totalSubunitAmount[NumberOfSubunitTypes]
          annotation (Placement(transformation(extent={{-120,60},{-80,100}}),
              iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={-60,100})));
        Types.RealIO.AmountOfSubstanceOutput totalSubsystemAmount
         annotation (Placement(
              transformation(extent={{-10,-90},{10,-70}}), iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={0,-100})));                                 //(start=1e-8)
      equation
        totalSubsystemAmount = totalSubunitAmount[1]/numberOfSubunit[1];

        fractions = if
                      (totalSubsystemAmount < Modelica.Constants.eps) then zeros(NumberOfSubunitTypes) else subunitSpecies.conc ./ (totalSubunitAmount/NormalSolventVolume);

        species.conc = (totalSubsystemAmount/NormalSolventVolume)*product(fractions.^numberOfSubunit);

        for i in 2:NumberOfSubunitTypes loop
               normalizedState[i-1]*totalSubsystemAmount*numberOfSubunit[i] = totalSubunitAmount[i];
        end for;

        /*** this could be done automatically, if the solver will be so smart that it removes all this dependend equations from the total equilibrated system. The most probable form of this dependent equation in equilibrium setting is (0 = 0), where both zeros are values from parameters. ***/
        if Simulation==Physiolibrary.States.SimulationType.Equilibrated
                                                          or (initial() and Simulation==
            Physiolibrary.States.SimulationType.InitSteadyState) then

           if isSubunitFlowIncludedInEquilibrium then
              subunitSpecies[1].q = -species.q * numberOfSubunit[1];
           end if;
        else  //Simulation<>States.SimulationType.Equilibrated and ((not initial()) or Simulation<>States.SimulationType.InitSteadyState) then
        /*** ***/
           subunitSpecies.q = -species.q * numberOfSubunit;
        end if;

        annotation (defaultComponentName="macromoleculeSpecie_in_macromoleculeGroup",Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics), Icon(coordinateSystem(
                preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Text(
                extent={{-98,62},{100,34}},
                lineColor={0,0,255},
                textString="%name"), Rectangle(extent={{-100,100},{100,-100}},
                  lineColor={0,0,255})}),
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
</html>",       info="<html>
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
      end SubunitSpeciation;

      model MWC
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

        ChemicalReaction                          quaternaryForm(K=L,
          Simulation=Simulation,
          isSubstrateFlowIncludedInEquilibrium={false})
          annotation (Placement(transformation(extent={{-6,-88},{14,-68}})));
        SubunitSpeciation  R0_in_R(numberOfSubunit={4})
          annotation (Placement(transformation(extent={{-66,-88},{-46,-68}})));
        SubunitSpeciation  T0_in_T(numberOfSubunit={4})
          annotation (Placement(transformation(extent={{58,-88},{78,-68}})));
        NormalizedSubstance OxyRHm(solute_start=0, Simulation=Simulation)
          "Oxygenated subunit in R structure of hemoglobin tetramer"
          annotation (Placement(transformation(extent={{-98,-36},{-78,-16}})));
        ChemicalReaction oxygenation_R(K=KR, nP=2,
          Simulation=Simulation)
          annotation (Placement(transformation(extent={{-70,-36},{-50,-16}})));
        NormalizedSubstance DeoxyRHm(Simulation=Simulation, solute_start=1e-08)
          "Deoxygenated subunit in R structure of hemoglobin tetramer"
          annotation (Placement(transformation(extent={{-42,-36},{-22,-16}})));
        NormalizedSubstance OxyTHm(solute_start=0, Simulation=Simulation)
          "Oxygenated subunit in T structure of hemoglobin tetramer"
          annotation (Placement(transformation(extent={{22,-36},{42,-16}})));
        ChemicalReaction oxygenation_T(K=KT, nP=2,
          Simulation=Simulation)
          annotation (Placement(transformation(extent={{50,-36},{70,-16}})));
        NormalizedSubstance DeoxyTHm(solute_start=totalAmountOfHemoglobin - 0.00001,
            Simulation=Simulation)
          "Deoxygenated subunit in T structure of hemoglobin tetramer"
          annotation (Placement(transformation(extent={{78,-36},{98,-16}})));
      public
        NormalizedSubstance oxygen_unbound(Simulation=Simulation, solute_start=0.000001
              *7.875647668393782383419689119171e-5)
          annotation (Placement(transformation(extent={{-4,6},{16,26}})));
        Mixed.PartialPressure partialPressure(
          alpha=alpha,
          T=310.15,
          gasSolubility(Simulation=Simulation, isFlowIncludedInEquilibrium=false))
                                                        annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={6,34})));
        Hydraulic.UnlimitedVolume unlimitedVolume(Simulation=Simulation)
          annotation (Placement(transformation(extent={{-4,50},{16,70}})));
        Modelica.Blocks.Sources.Clock clock(offset=1e-06)
          annotation (Placement(transformation(extent={{-44,70},{-24,90}})));
        Modelica.Blocks.Math.Add add annotation (Placement(transformation(
              extent={{-4,-4},{4,4}},
              rotation=270,
              origin={-62,-54})));
        Modelica.Blocks.Math.Add add1 annotation (Placement(transformation(
              extent={{-4,-4},{4,4}},
              rotation=270,
              origin={62,-54})));
      equation
        totalAmountOfHemoglobin*normalizedState[1] = OxyRHm.solute + DeoxyRHm.solute + OxyTHm.solute + DeoxyTHm.solute;

        sO2 = (OxyRHm.solute + OxyTHm.solute)/totalAmountOfHemoglobin;

        connect(R0_in_R.species, quaternaryForm.substrates[1])
                                                         annotation (Line(
            points={{-56,-78},{-6,-78}},
            color={200,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(quaternaryForm.products[1], T0_in_T.species)
                                                       annotation (Line(
            points={{14,-78},{68,-78}},
            color={200,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(OxyRHm.q_out, oxygenation_R.substrates[1])
                                                 annotation (Line(
            points={{-88,-26},{-70,-26}},
            color={200,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygenation_R.products[1], DeoxyRHm.q_out)
                                               annotation (Line(
            points={{-50,-26.5},{-42,-26.5},{-42,-26},{-32,-26}},
            color={200,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(OxyTHm.q_out, oxygenation_T.substrates[1])
                                                 annotation (Line(
            points={{32,-26},{50,-26}},
            color={200,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygenation_T.products[1], DeoxyTHm.q_out)
                                               annotation (Line(
            points={{70,-26.5},{80,-26.5},{80,-26},{88,-26}},
            color={200,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(DeoxyRHm.q_out, R0_in_R.subunitSpecies[1])
                                                     annotation (Line(
            points={{-32,-26},{-42,-26},{-42,-62},{-56,-62},{-56,-68}},
            color={200,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(T0_in_T.subunitSpecies[1], DeoxyTHm.q_out)
                                                     annotation (Line(
            points={{68,-68},{68,-62},{82,-62},{82,-26},{88,-26}},
            color={200,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(partialPressure.n,oxygen_unbound. q_out)      annotation (Line(
            points={{6,24},{6,16}},
            color={200,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(unlimitedVolume.y,partialPressure. v) annotation (Line(
            points={{6,60},{6,44}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(clock.y,unlimitedVolume. pressure) annotation (Line(
            points={{-23,80},{6,80},{6,70}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(oxygenation_R.products[2], oxygen_unbound.q_out) annotation (Line(
            points={{-50,-25.5},{-44,-25.5},{-44,16},{6,16}},
            color={200,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygenation_T.products[2], oxygen_unbound.q_out) annotation (Line(
            points={{70,-25.5},{76,-25.5},{76,16},{6,16}},
            color={200,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(add.y, R0_in_R.totalSubunitAmount[1])
                                                annotation (Line(
            points={{-62,-58.4},{-62,-68}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(DeoxyRHm.solute, add.u1) annotation (Line(
            points={{-32,-33.8},{-32,-42},{-60,-42},{-60,-49.2},{-59.6,-49.2}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(OxyRHm.solute, add.u2) annotation (Line(
            points={{-88,-33.8},{-88,-42},{-64,-42},{-64,-50},{-64.4,-50},{-64.4,-49.2}},
            color={0,0,127},
            smooth=Smooth.None));

        connect(add1.y, T0_in_T.totalSubunitAmount[1])
                                                 annotation (Line(
            points={{62,-58.4},{62,-68}},
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
        annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics),
          experiment(StopTime=10000),
          __Dymola_experimentSetupOutput);
      end MWC;
    end Speciation;

    model MichaelisMentenExample "Basic enzyme kinetics"
      import Physiolibrary;
    extends Modelica.Icons.Example;

      UnlimitedStorage P(concentration=0)
        annotation (Placement(transformation(extent={{74,8},{94,28}})));
      UnlimitedStorage S(concentration=10)
        annotation (Placement(transformation(extent={{-84,8},{-64,28}})));

      Physiolibrary.Chemical.MichaelisMenten
                      michaelisMenten(
        Km=1.5,
        tE=0.001,
        k_cat=0.06)
        annotation (Placement(transformation(extent={{-8,14},{12,34}})));
    equation

      connect(S.q_out, michaelisMenten.p) annotation (Line(
          points={{-73.8,18},{-8,18}},
          color={200,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(michaelisMenten.n, P.q_out) annotation (Line(
          points={{12,18},{84.2,18}},
          color={200,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics));
    end MichaelisMentenExample;

    model AcidBaseReactions
      "Test of nominal values, because different order of substrates concentrations (1 vs. 10^(-7.4))"
     model Buffer
      parameter Real Nominal = 0.0000001;

      parameter Real cHo = (0.0000001 * At) / (Ka1 + 0.0000001)
          "Acid form of buffer at pH=7";
      parameter Real cHnAdded = 0.0001 "added hydrogen ions at the beggining";
      parameter Real cHn = cHo + cHnAdded "Total acid conncetration";
      parameter Real Ka1 = 0.000001;
      parameter Real At = 0.001;
      parameter Real Kw(unit = "Mol2") = 0.00000000000001
          "water disociation constant = H*OH in equilibrium";
      parameter Real k(unit = "1/(s.Mol)") = 1000000.0
          "rate constant of water formation from H and OH";
      parameter Real r(unit = "1/(s.Mol)") = k / Kw
          "rate of water disociation to H and OH";
      parameter Real Hn(start = 10 ^ (-12), fixed = false, nominal = Nominal);
      //pri inicializaci teprve pocita hodnotu
      parameter Real pHn(fixed = false);
      Real HnFree(nominal = Nominal);
      Real pHnFree(start = -Modelica.Math.log10(cHnAdded), fixed = true);
      Real HnBound(nominal = Nominal);
      Real pHnBound;
     initial equation
      cHn = Hn - Kw / Hn + (Hn * At) / (Ka1 + Hn);
      Hn = 10 ^ (-pHn);
      //HnFree = 0.5e-4;
     equation
      //cHn = Hn - Kw/Hn + Hn*At/(Ka1 + Hn);
      der(pHnFree) = pHn - pHnFree;
      //only dynamic parameter is pHnFree
      cHn = HnFree - Kw / HnFree + (HnBound * At) / (Ka1 + HnBound);
      //logs
      pHnFree = -Modelica.Math.log10(HnFree);
      pHnBound = -Modelica.Math.log10(HnBound);
     end Buffer;

    end AcidBaseReactions;
  end Examples;

  connector ConcentrationFlow "Concentration and Solute flow"
    Physiolibrary.Types.Concentration conc "Solute concentration";
    flow Physiolibrary.Types.MolarFlowRate q "Solute flow";
    annotation (Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
  end ConcentrationFlow;

  connector PositiveConcentrationFlow "Concentration and Solute inflow"
    extends ConcentrationFlow;

  annotation (
      defaultComponentName="p",
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
              100,100}}), graphics={Rectangle(
            extent={{-20,10},{20,-10}},
            lineColor={200,0,0},
            lineThickness=1), Polygon(
            points={{0,100},{100,0},{0,-100},{-100,0},{0,100}},
            lineColor={200,0,0},
            smooth=Smooth.None,
            fillPattern=FillPattern.Solid,
            fillColor={200,0,0})}),
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
    extends ConcentrationFlow;

  annotation (
      defaultComponentName="n",
      Icon(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=false),
          graphics={Rectangle(
            extent={{-20,10},{20,-10}},
            lineColor={200,0,0},
            lineThickness=1), Polygon(
            points={{-100,0},{0,100},{100,0},{0,-100},{-100,0}},
            lineColor={200,0,0},
            smooth=Smooth.None,
            fillPattern=FillPattern.Solid,
            fillColor={255,240,240})}),
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

    NegativeConcentrationFlow q_out "Solute outflow"
                           annotation (extent=[-10, -110; 10, -90], Placement(
          transformation(extent={{18,-10},{38,10}}), iconTransformation(
            extent={{-10,90},{10,110}})));

    PositiveConcentrationFlow q_in "Solute inflow"
                              annotation (Placement(
          transformation(extent={{-120,-20},{-80,20}}), iconTransformation(extent={{-10,
              -110},{10,-90}})));

    parameter Physiolibrary.States.SimulationType
                                    Simulation=Physiolibrary.States.SimulationType.NoInit
      "False, instead of one reaction in equilibrated (with zero reaction rates) system."
      annotation (Dialog(group="Simulation type", tab="Simulation"));
    parameter Boolean isFlowIncludedInEquilibrium=true
      "Is substrate flow equation included in equilibrium calculation?"
      annotation (Dialog(group="Simulation type", tab="Simulation"));

  equation
     /*** this could be done automatically, if the solver will be so smart that it removes all this dependend equations from the total equilibrated system. The most probable form of this dependent equation in equilibrium setting is (0+0 = 0). ***/
     if Simulation<>States.SimulationType.Equilibrated or isFlowIncludedInEquilibrium then
        q_in.q + q_out.q = 0;
     end if;
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
              {100,100}}), graphics));
  end OnePort;

  model FlowMeasure "Measure of molar flow"
    extends OnePort;
    extends Icons.MolarFlowMeasure;

   Physiolibrary.Types.RealIO.MolarFlowRateOutput actualFlow
                           annotation (Placement(transformation(extent={{-20,30},{20,70}}),
          iconTransformation(extent={{-20,-20},{20,20}},
                                                       rotation=0,
          origin={80,0})));
  equation
    q_in.conc = q_out.conc;

    actualFlow = q_in.q;

   annotation (
      Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,
              100}}),     graphics),Diagram(coordinateSystem(preserveAspectRatio=true,
                     extent={{-100,-100},{100,100}}), graphics),
      Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
  end FlowMeasure;

  model ConcentrationMeasure "Measure of molar concentration"

    PositiveConcentrationFlow q_in "For measure only"
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

    PositiveConcentrationFlow q_in "Concentration before absorption source"
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
</html>"),      Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
              -100},{100,100}}), graphics));
  end FlowConcentrationMeasure;

  model Diffusion "Solute diffusion"
    extends Icons.Diffusion;
    extends OnePort;

    parameter Physiolibrary.Types.DiffusionPermeability cond
      "Diffusion conductance";

  equation
     q_in.q = cond * (q_in.conc - q_out.conc);

     annotation (Icon(graphics),                 Documentation(revisions="<html>
<p><i>2009-2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>",   info="<html>
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

  model MolarInflux "Molar pump of solute"

    NegativeConcentrationFlow q_out "Outflow"
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
</html>"),      Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
              -100},{100,100}}), graphics));
  end MolarInflux;

  model MolarStream "Molar flow of solute in stream"
    extends OnePort;

    Physiolibrary.Types.RealIO.VolumeFlowRateInput solventFlow
      "Solvent flow (solution volume flow = solventFlow + solute volume flow)!"
      annotation (Placement(transformation(extent={{-80,-20},{-40,20}}),
          iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=0,
          origin={-60,0})));

  equation
    assert(solventFlow>=-Modelica.Constants.eps,"In MolarStream must be always the forward flow direction! Not 'solventFlow<0'!");
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
            rotation=90),
          Polygon(
            points={{-80,25},{80,0},{-80,-25},{-80,25}},
            lineColor={0,0,127},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={0,0},
            rotation=90),
          Text(
            extent={{-150,-20},{150,20}},
            textString="%name",
            lineColor={0,0,255},
            origin={80,-2},
            rotation=90)}),         Diagram(coordinateSystem(preserveAspectRatio=true,
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
</html>",   info="<html>
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
</html>"),      Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
              -100},{100,100}}), graphics));

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics));
  end MolarStream;

  model Clearance "Clearance"

    PositiveConcentrationFlow q_in "solute outflow"
                              annotation (Placement(
          transformation(extent={{-120,-20},{-80,20}}), iconTransformation(extent=
             {{-110,-10},{-90,10}})));

    parameter Physiolibrary.Types.VolumeFlowRate Clearance
      "Clearance of solute";
  equation
    q_in.q = Clearance*q_in.conc;

   // assert(Clearance>=-Modelica.Constants.eps, "Clearance can not be negative!");

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
</html>"),      Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
              -100},{100,100}}), graphics));
  end Clearance;

  model Clearance2 "Clearance with solvent outflow"

    Physiolibrary.Types.RealIO.VolumeFlowRateInput solventFlow
      "solvent outflow"
     annotation (Placement(transformation(extent={{-20,20},{20,60}}),
          iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=270,
          origin={0,40})));

    PositiveConcentrationFlow q_in "solute outflow"
                              annotation (Placement(
          transformation(extent={{-120,-20},{-80,20}}), iconTransformation(extent=
             {{-110,-10},{-90,10}})));

    parameter Real K(unit="1")=1
      "Coefficient such that Clearance = K*solventFlow";

    Physiolibrary.Types.VolumeFlowRate Clearance;
  equation
    Clearance=K*solventFlow;
    q_in.q = Clearance*q_in.conc;

    assert(solventFlow>=-Modelica.Constants.eps, "Solvent flow can not be negative!");

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
</html>"),      Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
              -100},{100,100}}), graphics));
  end Clearance2;

  model Degradation "Degradation of solvent in defined volume"

    Physiolibrary.Types.RealIO.VolumeInput volume
      "Degradation volume, where degradation takes place."
       annotation (Placement(transformation(extent={{-20,20},{20,60}}),
          iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=270,
          origin={0,40})));

    PositiveConcentrationFlow q_in "Degraded solute outflow"
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
</html>"),      Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
              -100},{100,100}}), graphics));
  end Degradation;

  model SoluteFlowPump "Active pumping of solute"
    extends OnePort;

    Physiolibrary.Types.RealIO.MolarFlowRateInput soluteFlow "Solute flow rate"
      annotation (Placement(transformation(extent={{-80,-20},{-40,20}}),
          iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=0,
          origin={-60,0})));

  equation
     q_in.q = soluteFlow;

   annotation (
      Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,
              100}}),     graphics={
          Rectangle(
            extent={{-100,-50},{100,50}},
            lineColor={0,0,127},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={0,0},
            rotation=90),
          Polygon(
            points={{-80,25},{80,0},{-80,-25},{-80,25}},
            lineColor={0,0,127},
            fillColor={0,0,127},
            fillPattern=FillPattern.Solid,
            origin={0,0},
            rotation=90),
          Text(
            extent={{-150,-20},{150,20}},
            textString="%name",
            lineColor={0,0,255},
            origin={86,4},
            rotation=90)}),         Diagram(coordinateSystem(preserveAspectRatio=true,
                     extent={{-100,-100},{100,100}}), graphics),
      Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),      Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
              -100},{100,100}}), graphics));
  end SoluteFlowPump;

  model UnlimitedStorage "Constant concentration source"
   extends Icons.ConcentrationCompartment;

    NegativeConcentrationFlow q_out
      "constant concentration with any possible flow"
                               annotation (Placement(
          transformation(extent={{62,-32},{102,8}}),  iconTransformation(extent={{-8,-10},
              {12,10}})));
    parameter Physiolibrary.Types.Concentration concentration;

    parameter Physiolibrary.States.SimulationType
                                    Simulation=Physiolibrary.States.SimulationType.NoInit
      "If Equilibrated, then zero flow rate is added."
      annotation (Dialog(group="Simulation type", tab="Simulation"));

  equation
    q_out.conc = concentration;

/*** this could be done automatically, if the solver will be so smart that it removes all this dependend equations from the total equilibrated system. The most probable form of this dependent equation in equilibrium setting is (0 = 0). ***/
    if Simulation==States.SimulationType.Equilibrated then
      q_out.q=0;
    end if;

    annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
              -100},{100,100}}), graphics), Icon(coordinateSystem(
            preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
          graphics={Text(
            extent={{-100,102},{100,124}},
            lineColor={0,0,0},
            fillPattern=FillPattern.VerticalCylinder,
            fillColor={215,215,215},
            textString="(%concentration)")}),
      Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
  end UnlimitedStorage;

  model Substance "Concentration accumulation in solvent "
    import Physiolibrary;
    extends Physiolibrary.Icons.ConcentrationCompartment;
    extends Physiolibrary.States.State(
    state(nominal=NominalSolute),
    change(nominal=NominalSolute/60),
    state_start=solute_start,
    storeUnit="mmol");

   // replaceable package Types = Physiolibrary.Types;

    NegativeConcentrationFlow q_out(conc(nominal=NominalSolute/0.001), q(
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

    Physiolibrary.Types.RealIO.VolumeInput solventVolume "Volume of solvent"
                                                                       annotation (Placement(transformation(extent={{-120,68},{-80,108}}),
          iconTransformation(extent={{-100,40},{-60,80}})));

    parameter Physiolibrary.Types.AmountOfSubstance
                                      NominalSolute = 0.001
      "Numerical scale. Default is from mmol to mol, but for some substances such as hormones, hydronium or hydroxide ions can be much smaller."
        annotation (Dialog(tab="Solver",group="Numerical support of very small concentrations"));

  equation
    q_out.conc = solute/solventVolume;

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

  model NormalizedSubstance
    "Concentration accumulation in one liter of solvent"
    extends Icons.ConcentrationCompartment;
    extends Physiolibrary.States.State(
    state(nominal=NominalSolute),
    change(nominal=NominalSolute/60),
    state_start=solute_start,
    storeUnit="mmol");

    NegativeConcentrationFlow q_out(conc(nominal=NominalSolute/0.001), q(
          nominal=NominalSolute/60)) "Flux from/to compartment"
                               annotation (Placement(
          transformation(extent={{62,-32},{102,8}}),  iconTransformation(extent={{-10,-10},
              {10,10}})));
    parameter Physiolibrary.Types.AmountOfSubstance solute_start(nominal=
        NominalSolute) "Initial solute amount in compartment"
      annotation (Dialog(group="Initialization"));

    Physiolibrary.Types.RealIO.AmountOfSubstanceOutput solute(nominal=
        NominalSolute, start=solute_start) "Current amount of solute"
      annotation (Placement(transformation(extent={{-20,-120},{20,-80}}, rotation=
             -90,
          origin={102,-102}), iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=270,
          origin={0,-78})));                                                 //, min=0)
    constant Physiolibrary.Types.Volume NormalSolventVolume=0.001 "1 liter";

    parameter Physiolibrary.Types.AmountOfSubstance NominalSolute=0.001
      "Numerical scale. Default is from mmol to mol."
       annotation (Dialog(group="Numerical support of very small concentrations", tab="Solver"));

  equation
    q_out.conc = solute/NormalSolventVolume;

    state = solute; // der(solute)=q_out.q
    change = q_out.q;
    annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
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
  end NormalizedSubstance;

  partial model ChemicalReactionBase "Chemical Reaction"
    import Physiolibrary;

    parameter Integer nS=1 "Number of substrates types"
      annotation (Dialog(group="Substrates", tab="Reaction type"));
    parameter Integer nP=1 "Number of products types"
      annotation (Dialog(group="Products", tab="Reaction type"));

    parameter Modelica.SIunits.StoichiometricNumber s[nS]=ones(nS)
      "stoichiometric reaction coefficient for substrates"
      annotation (Dialog(group="Substrates", tab="Reaction type"));

    parameter Modelica.SIunits.StoichiometricNumber p[nP]=ones(nP)
      "stoichiometric reaction coefficients for products"
      annotation (Dialog(group="Products", tab="Reaction type"));

    parameter Real kf = 10^8 "forward reaction rate coefficient [SI unit]"
      annotation (Dialog(group="Parameters")); //forward K*(10^rateLevel) at temperature TK

    parameter Physiolibrary.States.SimulationType
                                    Simulation=Physiolibrary.States.SimulationType.NoInit
      "Equilibrium?"
      annotation (Dialog(group="Simulation type", tab="Simulation"));
                    // "False, instead of one reaction in equilibrated (with zero reaction rates) system."
    parameter Boolean isSubstrateFlowIncludedInEquilibrium[nS](each start=true)
      "Is substrate flow equation independent?"
       annotation (Dialog(group="Dependences in Equilibrium", tab="Simulation"));
    parameter Boolean isProductFlowIncludedInEquilibrium[nP](each start=true)
      "Is product flow equation independent?"
       annotation (Dialog(group="Dependences in Equilibrium", tab="Simulation"));

    NegativeConcentrationFlow products[nP] "products"
                           annotation (extent=[-10, -110; 10, -90], Placement(
          transformation(extent={{90,-10},{110,10}}),iconTransformation(extent={{90,-10},
              {110,10}})));

    PositiveConcentrationFlow substrates[nS] "substrates"
                              annotation (Placement(
          transformation(extent={{-120,-20},{-80,20}}), iconTransformation(extent=
             {{-110,-10},{-90,10}})));  /*s[nS]*/
    Physiolibrary.Types.MolarFlowRate rr "reaction rate";

    Real KaT "dissociation constant in current temperature";

    parameter Physiolibrary.Types.Temperature TK=298.15 "base temperature"
      annotation (Dialog(tab="Temperature dependence"));

    parameter Modelica.SIunits.MolarInternalEnergy dH=0 "enthalpy change"
      annotation (Dialog(tab="Temperature dependence"));

  equation
    rr = kf*(product(substrates.conc.^s) - (1/KaT)*product(products.conc.^p));

     /*** this could be done automatically, if the solver will be so smart that it removes all this dependend equations from the total equilibrated system. The most probable form of this dependent equation in equilibrium setting is (0 = 0). ***/
     if Simulation==Physiolibrary.States.SimulationType.Equilibrated
                                                      or (initial() and Simulation==
        Physiolibrary.States.SimulationType.InitSteadyState) then
       for i in 1:nS loop
         if isSubstrateFlowIncludedInEquilibrium[i] then
           rr*s[i] = substrates[i].q;
         end if;
       end for;
       for j in 1:nP loop
         if isProductFlowIncludedInEquilibrium[j] then
           rr*p[j] = -products[j].q;
         end if;
       end for;
    else //Simulation<>States.SimulationType.Equilibrated and ((not initial()) or Simulation<>States.SimulationType.InitSteadyState) then
        rr*s = substrates.q;
        rr*p = -products.q;
    end if;

    annotation (
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
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
                                    Diagram(coordinateSystem(preserveAspectRatio=true,
                     extent={{-100,-100},{100,100}}), graphics),
      Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>",   info="<html>
<pre>The Chemical reaction

Schema of chemical reaction:
s[1]*S[1] + .. + s[nS]*S[nS]  &LT;-&GT;  p[1]*P[1] + .. + p[nP]*P[nP] 

where
S are substrates, 
s are stochiometric coefficients of substrates,  
P are products, 
p are stochiometric coefficients of products.  

In equilibrium (at zero reaction flow) it fullfil, the dissociation constant K equation:
<p><br/><code></p><p><br/>K = <font style=\"color: #ff0000; \">&nbsp;product</font>(P.^p) / <font style=\"color: #ff0000; \">product</font>(S.^s)</code></p>
<pre> 
The dissociation constant is dependent on temperature by Hoff&apos;s equation using reaction enthalphy change parameter dH.
<p><br/><code></p><p><br/>The forward rate is (10^rateLevel)*K*<font style=\"color: #ff0000; \">product</font>(S.^s), where kf=(10^rateLevel)*K. </code></p>
<p><code>The backward rate is (10^rateLevel)*<font style=\"color: #ff0000; \">product</font>(P.^p), where kb=(10^rateLevel).</code></p>
<pre> 

It works in two modes:


1. Dynamic mode, if EQUILIBRIUM=false.

2. Equilibrium mode, if EQUILIBRIUM=true and all ConcentrationCompartments are in STEADY mode. But some zero flows must be removed instead of additional steady-state equation. 

For easy switch between dynamic and equilibrium mode is recommmended to use one global boolean parameter, which set all EQUILIBRIUM parameters of the system instances.  </pre>
</html>"),      Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
              -100},{100,100}}), graphics));
  end ChemicalReactionBase;

  model ChemicalReaction "Chemical Reaction"
    extends ChemicalReactionBase;

    parameter Real K "dissociation constant [SI-unit]";
    parameter Physiolibrary.Types.Temperature T=310.15 "current temperature"
       annotation (Dialog(tab="Temperature dependence"));
                     //body temperature

  equation
    KaT = K * Modelica.Math.exp(((-dH)/Modelica.Constants.R)*(1/T - 1/TK));  //Hoff's equation

  end ChemicalReaction;

  model ChemicalReaction2 "Chemical Reaction"
    extends ChemicalReactionBase;

    parameter Real K "dissociation constant [SI-unit]";
    Physiolibrary.Types.RealIO.TemperatureInput T "temperature"
                                                       annotation (Placement(
          transformation(extent={{10,30},{50,70}}), iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=270,
          origin={40,40})));
  equation
    KaT = K * Modelica.Math.exp(((-dH)/Modelica.Constants.R)*(1/T - 1/TK));  //Hoff's equation

  end ChemicalReaction2;

  model ChemicalReaction3 "Chemical Reaction"
    extends ChemicalReactionBase;

    Modelica.Blocks.Interfaces.RealInput K "dissociation constant [SI-unit]"
                                           annotation (Placement(transformation(
            extent={{-12,28},{28,68}}), iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=270,
          origin={-20,40})));
    Physiolibrary.Types.RealIO.TemperatureInput T "temperature"
                                                       annotation (Placement(
          transformation(extent={{10,30},{50,70}}), iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=270,
          origin={40,40})));

  equation
    KaT = K * Modelica.Math.exp(((-dH)/Modelica.Constants.R)*(1/T - 1/TK));  //Hoff's equation

  end ChemicalReaction3;

  model Dilution "Adding the solvent to solution"
    extends OnePort;

    Physiolibrary.Types.RealIO.FractionInput dilution
      "Fraction of final undilutes solution"
      annotation (Placement(transformation(extent={{-16,8},{24,48}}),
          iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=0,
          origin={-100,-80})));
  equation

    q_out.conc = dilution * q_in.conc;

   annotation (
      Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,
              100}}),     graphics={Bitmap(extent={{-134,102},{66,-100}},
              fileName="modelica://Physiolibrary/Resources/Icons/dilution.png"),
          Text(
            extent={{-120,20},{120,-20}},
            textString="%name",
            lineColor={0,0,255},
            origin={70,-2},
            rotation=90)}),         Diagram(coordinateSystem(preserveAspectRatio=true,
                     extent={{-100,-100},{100,100}}), graphics),
      Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),      Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
              -100},{100,100}}), graphics));
  end Dilution;

  model GasSolubility
    "Henry's law about the solubility of a gas in a liquid. q_in is dissolved in liquid and q_out is in gaseous solution"

    extends OnePort; //q_in is dissolved in liquid and q_out is in gaseous solution"
    extends Physiolibrary.Icons.GasSolubility;

    parameter Physiolibrary.Types.Fraction kH
      "Henry's law constant such as liquid-gas concentration ratio";

    parameter Types.DiffusionPermeability solubilityRateCoef=10^3
      "The rate constant of incoming gas to solution";

  equation
    // equilibrium:  gas.conc = kH * liquid.conc;
    q_out.q = solubilityRateCoef*(q_out.conc - kH * q_in.conc);

     annotation (Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,
              -100},{100,100}}), graphics={
          Text(
            extent={{0,-100},{240,-140}},
            textString="%name",
            lineColor={0,0,255})}),             Documentation(revisions="<html>
<p><i>2009-2012</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),
      Diagram(graphics));
  end GasSolubility;

  model GasSolubility2 "Henry's law about the solubility of a gas in a liquid"
   extends OnePort;  //q_in is dissolved in liquid and q_out is in gaseous solution
   extends Physiolibrary.Icons.GasSolubility;

    Physiolibrary.Types.Fraction kH
      "Henry's law coefficient such as liquid-gas concentration ratio";

    parameter Types.DiffusionPermeability solubilityRate=10^3
      "The rate of incoming gas to solution";

    parameter Physiolibrary.Types.Fraction kH_T0
      "Henry's law coefficient at temperature T0";
    parameter Physiolibrary.Types.Temperature T0=298.15
      "Base temperature for kH_T0"
       annotation (Dialog(group="Temperature dependence"));
    parameter Physiolibrary.Types.Temperature C(displayUnit="K")
      "Gas-liquid specific constant for Van't Hoff's change of kH (i.e.: O2..1700K,CO2..2400K,N2..1300K,CO..1300K,..)"
      annotation (Dialog(group="Temperature dependence"));
    Physiolibrary.Types.RealIO.TemperatureInput T "temperature"
                                                       annotation (Placement(
          transformation(extent={{-8,-88},{32,-48}}),   iconTransformation(extent={{-20,-20},
              {20,20}},
          rotation=0,
          origin={-60,0})));

  equation
    kH = kH_T0 * Modelica.Math.exp(C* (1/T - 1/T0)); // Van't Hoff equation
    //gas.conc = kH * liquid.conc;
    // equilibrium:  gas.conc = kH * liquid.conc;
    q_out.q = solubilityRate*(q_out.conc - kH * q_in.conc);

     annotation (Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,
              -100},{100,100}}), graphics={
          Text(
            extent={{0,-98},{240,-138}},
            textString="%name",
            lineColor={0,0,255})}),             Documentation(revisions="<html>
<p><i>2009-2012</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),
      Diagram(graphics));
  end GasSolubility2;

  model Reabsorption "Reabsorption of input fraction"
     extends Icons.Reabsorption;
    PositiveConcentrationFlow Inflow "Tubular inflow"              annotation (Placement(
          transformation(extent={{-120,-20},{-80,20}}), iconTransformation(
            extent={{-108,30},{-88,50}})));
    NegativeConcentrationFlow Outflow "Tubular outflow"
      annotation (Placement(transformation(extent={{80,-20},{120,20}}),
          iconTransformation(extent={{88,30},{108,50}})));

    NegativeConcentrationFlow Reabsorption "Reabsorption from tubules"          annotation (Placement(
          transformation(extent={{-20,-100},{20,-60}}),iconTransformation(
            extent={{-10,-110},{10,-90}})));
    Physiolibrary.Types.RealIO.FractionInput ReabsorbedFract
      "Fraction of molar inflow, that is reabsorbed"
                                 annotation (Placement(transformation(extent={{-90,-66},
              {-70,-46}}),
                     iconTransformation(extent={{-20,-20},{20,20}},
                                                                  rotation=-90,
          origin={32,80})));

    FlowMeasure flowMeasure
      annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
    Modelica.Blocks.Math.Product product1
      annotation (Placement(transformation(extent={{-44,-50},{-24,-30}})));
    SoluteFlowPump soluteFlowPump annotation (Placement(transformation(
          extent={{-10,10},{10,-10}},
          rotation=270,
          origin={0,-40})));
  equation

    connect(Inflow, flowMeasure.q_in) annotation (Line(
        points={{-100,0},{-85,0},{-85,-10},{-70,-10}},
        color={200,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(ReabsorbedFract, product1.u2) annotation (Line(
        points={{-80,-56},{-56,-56},{-56,-46},{-46,-46}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(flowMeasure.actualFlow, product1.u1) annotation (Line(
        points={{-62,0},{-46,0},{-46,-34}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(soluteFlowPump.q_out, Reabsorption) annotation (Line(
        points={{-10,-40},{0,-40},{0,-80}},
        color={200,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(product1.y, soluteFlowPump.soluteFlow) annotation (Line(
        points={{-23,-40},{-11.5,-40},{-11.5,-34},{8.88178e-016,-34}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(flowMeasure.q_out, Outflow) annotation (Line(
        points={{-70,10},{15,10},{15,0},{100,0}},
        color={200,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(flowMeasure.q_out, soluteFlowPump.q_in) annotation (Line(
        points={{-70,10},{10,10},{10,-40}},
        color={200,0,0},
        thickness=1,
        smooth=Smooth.None));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,
              -100},{100,100}}), graphics={
          Text(
            extent={{0,-102},{154,-132}},
            lineColor={0,0,255},
            textString="%name")}), Diagram(coordinateSystem(preserveAspectRatio=true,
                    extent={{-100,-100},{100,100}}), graphics),
      Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
  end Reabsorption;

  model Reabsorption2 "Reabsorption of input fraction"
    extends Icons.Reabsorption2;
    import Physiolibrary;

    PositiveConcentrationFlow Inflow "Tubular inflow"              annotation (Placement(
          transformation(extent={{-120,-18},{-80,22}}), iconTransformation(
            extent={{-110,30},{-90,50}})));
    NegativeConcentrationFlow Outflow "Tubular outflow"
      annotation (Placement(transformation(extent={{80,-18},{120,22}}),
          iconTransformation(extent={{90,30},{110,50}})));
    NegativeConcentrationFlow Reabsorption "Reabsorption from tubules"          annotation (Placement(
          transformation(extent={{-20,-100},{20,-60}}),iconTransformation(
            extent={{-10,-110},{10,-90}})));
    Physiolibrary.Types.RealIO.FractionInput Normal
      "Reabsorption fraction if Effects=1"
                                 annotation (Placement(transformation(extent={{-100,76},
              {-80,96}}),
                     iconTransformation(extent={{-20,-20},{20,20}},
                                                                  rotation=0,
          origin={-80,-20})));
    Modelica.Blocks.Interfaces.RealInput Effects(
                                                final unit="1")
      "Effects<1 decrease reabsorption, effects>1 increase reabsorption fraction by equation ReabFract=Normal^(1/Effects)"
                                 annotation (Placement(transformation(extent={{-100,58},
              {-80,78}}),
                     iconTransformation(extent={{-20,-20},{20,20}},
                                                                  rotation=-90,
          origin={0,80})));

    Physiolibrary.Types.RealIO.MolarFlowRateInput MaxReab
      "Maximal allowed reabsorption molar flow rate"
                                 annotation (Placement(transformation(extent={{-24,38},
              {-4,58}}),
                     iconTransformation(extent={{-20,-20},{20,20}},
                                                                  rotation=0,
          origin={-80,-60})));
    Physiolibrary.Types.RealIO.FractionOutput ReabFract
      "Actual reabsorbed fraction from solute inflow rate"                                annotation (Placement(transformation(extent={{72,60},
              {88,76}}),   iconTransformation(extent={{80,-100},{120,-60}})));
    FlowMeasure flowMeasure
      annotation (Placement(transformation(extent={{-78,-8},{-58,12}})));
    SoluteFlowPump soluteFlowPump annotation (Placement(transformation(
          extent={{-10,10},{10,-10}},
          rotation=270,
          origin={0,-40})));
    Modelica.Blocks.Math.Product product1
      annotation (Placement(transformation(extent={{-44,-50},{-24,-30}})));
    Physiolibrary.Blocks.Math.Reciprocal
                      reciprocal
      annotation (Placement(transformation(extent={{-62,58},{-42,78}})));
    Physiolibrary.Blocks.Math.Pow2
                avg1
      annotation (Placement(transformation(extent={{-10,80},{-2,88}})));
    Modelica.Blocks.Math.Min min1
      annotation (Placement(transformation(extent={{16,58},{36,78}})));
  equation

    connect(Inflow, flowMeasure.q_in) annotation (Line(
        points={{-100,2},{-84,2},{-84,-8},{-68,-8}},
        color={200,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(flowMeasure.actualFlow, product1.u1) annotation (Line(
        points={{-60,2},{-46,2},{-46,-34}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(soluteFlowPump.q_out, Reabsorption) annotation (Line(
        points={{-10,-40},{0,-40},{0,-80}},
        color={200,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(product1.y, soluteFlowPump.soluteFlow) annotation (Line(
        points={{-23,-40},{-11.5,-40},{-11.5,-34},{8.88178e-016,-34}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(flowMeasure.q_out, Outflow) annotation (Line(
        points={{-68,12},{16,12},{16,2},{100,2}},
        color={200,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(flowMeasure.q_out, soluteFlowPump.q_in) annotation (Line(
        points={{-68,12},{10,12},{10,-40}},
        color={200,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(Effects, reciprocal.u) annotation (Line(
        points={{-90,68},{-64,68}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Normal, avg1.base) annotation (Line(
        points={{-90,86},{-78,86},{-82,86.4},{-10,86.4}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(reciprocal.y, avg1.exponent) annotation (Line(
        points={{-41,68},{-26,68},{-26,81.6},{-10,81.6}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(avg1.y, min1.u1) annotation (Line(
        points={{-1.6,84},{6,84},{6,74},{14,74}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(MaxReab, min1.u2) annotation (Line(
        points={{-14,48},{0,48},{0,62},{14,62}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(min1.y, product1.u2) annotation (Line(
        points={{37,68},{46,68},{46,32},{-86,32},{-86,-46},{-46,-46}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(min1.y, ReabFract) annotation (Line(
        points={{37,68},{80,68}},
        color={0,0,127},
        smooth=Smooth.None));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,
              -100},{100,100}}), graphics={
          Text(
            extent={{2,-100},{196,-134}},
            lineColor={0,0,255},
            textString="%name")}), Diagram(coordinateSystem(preserveAspectRatio=true,
                    extent={{-100,-100},{100,100}}), graphics),
      Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
  end Reabsorption2;

  model FullReabsorption "Full reabsorption with limit (i.e. renal glucose)"
    extends Icons.Reabsorption;
    parameter Physiolibrary.Types.MolarFlowRate MaxReab
      "Maximal reabsorption solute flow rate";

    PositiveConcentrationFlow Inflow "Tubular inflow"              annotation (Placement(
          transformation(extent={{-120,-20},{-80,20}}), iconTransformation(
            extent={{-108,30},{-88,50}})));
    NegativeConcentrationFlow Outflow "Tubular outflow"
      annotation (Placement(transformation(extent={{80,-20},{120,20}}),
          iconTransformation(extent={{88,30},{108,50}})));

    NegativeConcentrationFlow Reabsorption "Reabsorption from tubules"          annotation (Placement(
          transformation(extent={{-20,-100},{20,-60}}),iconTransformation(
            extent={{-8,-110},{12,-90}})));

    FlowMeasure flowMeasure
      annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
    Modelica.Blocks.Math.Min     product1
      annotation (Placement(transformation(extent={{-44,-50},{-24,-30}})));
    SoluteFlowPump soluteFlowPump annotation (Placement(transformation(
          extent={{-10,10},{10,-10}},
          rotation=270,
          origin={0,-40})));
    Modelica.Blocks.Sources.Constant molarFlowConstant(k=MaxReab)
      annotation (Placement(transformation(extent={{-90,-62},{-70,-42}})));
  equation

    connect(Inflow, flowMeasure.q_in) annotation (Line(
        points={{-100,0},{-85,0},{-85,-10},{-70,-10}},
        color={200,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(flowMeasure.actualFlow, product1.u1) annotation (Line(
        points={{-62,0},{-46,0},{-46,-34}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(soluteFlowPump.q_out, Reabsorption) annotation (Line(
        points={{-10,-40},{0,-40},{0,-80}},
        color={200,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(product1.y, soluteFlowPump.soluteFlow) annotation (Line(
        points={{-23,-40},{-11.5,-40},{-11.5,-34},{8.88178e-016,-34}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(flowMeasure.q_out, Outflow) annotation (Line(
        points={{-70,10},{0,10},{0,-30},{100,-30},{100,0}},
        color={200,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(flowMeasure.q_out, soluteFlowPump.q_in) annotation (Line(
        points={{-70,10},{10,10},{10,-40}},
        color={200,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(molarFlowConstant.y, product1.u2) annotation (Line(
        points={{-69,-52},{-58,-52},{-58,-46},{-46,-46}},
        color={0,0,127},
        smooth=Smooth.None));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,
              -100},{100,100}}), graphics={
          Text(
            extent={{0,-102},{180,-130}},
            lineColor={0,0,255},
            textString="%name")}), Diagram(coordinateSystem(preserveAspectRatio=true,
                    extent={{-100,-100},{100,100}}), graphics),
      Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
  end FullReabsorption;

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

    NormalizedSubstance ES(Simulation=Simulation, solute_start=0)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
    NormalizedSubstance E(Simulation=Simulation, solute_start=tE)
      annotation (Placement(transformation(extent={{-10,38},{10,58}})));
    ChemicalReaction chemicalReaction(nS=2,
      K=2/Km,
      kf=2*k_cat/Km)
      annotation (Placement(transformation(extent={{-42,-10},{-22,10}})));
    ChemicalReaction chemicalReaction1(nP=2,
      Simulation=Simulation,
      K=Modelica.Constants.inf,
      kf=k_cat,
      isSubstrateFlowIncludedInEquilibrium={false})
      annotation (Placement(transformation(extent={{24,-10},{44,10}})));

   // Real v(unit="mol/s", displayUnit="mmol/min") "test of MM equation";
    PositiveConcentrationFlow p
      annotation (Placement(transformation(extent={{-110,-70},{-90,-50}}),
          iconTransformation(extent={{-110,-70},{-90,-50}})));
    NegativeConcentrationFlow n
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
  annotation (Documentation(revisions="<html>
<p>Licensed by Marek Matejak under the Modelica License 2</p>
<p>Copyright &copy; 2008-2013, Marek Matejak, Charles University in Prague.</p>
<p><br/><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Physiolibrary.UsersGuide.ModelicaLicense2\">Physiolibrary.UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p>
</html>", info="<html>
<p>In physiology books, chapters about chemical substances are organized by their types. The main reason for this is that each substance in the human body is regulated in a different way. For example the regulation of sodium is different from the regulation of potassium, and from the regulation of glucose, and so on. This view leads to the idea of having separate models of each substance. The origin of different flows and regulations is the (cellular) membrane. Water and solutions can cross it in different directions at the same time. Crossings occur for different reasons: water is driven mostly by osmotic gradients, electrolytes are driven by charge to reach Donnan&apos;s equilibrium, and some solutes can even be actively transported against their concentration or electrical gradients. And all this is specifically driven from the higher levels by neural and hormonal responses.&nbsp; </p>
<p>In Physiolibrary flows and fluxes of solutes are supported mostly by the Chemical package. All parts inside this Physiolibrary.Chemical package use the connector ConcentrationFlow, which defines the molar concentration and molar flow/flux rate of one solute. This is the supporting infrastructure for modeling membrane diffusion, accumulations of substances, reversal chemical reactions, Henry&apos;s law of gas solubility, dilution with additional solvent flow, membrane reabsorption, chemical degradation and physiological clearance. For usage examples, please open the Chemical.Examples package.</p>
</html>"));
end Chemical;

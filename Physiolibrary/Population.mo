within Physiolibrary;
package Population
  "Domain for populatiom models for cells, viruses, bacterias, tissues, organism etc."
  extends Modelica.Icons.Package;
  package Examples "Examples that demonstrate usage of the Population models"
     extends Modelica.Icons.ExamplesPackage;

    model PredatorPrey "Lotka–Volterra equations"
      extends Modelica.Icons.Example;

      Components.Population predator(population_start=2)
        annotation (Placement(transformation(extent={{-8,42},{12,62}})));
      Components.Reproduction reproduction2(useChangePerMemberInput=true)
        annotation (Placement(transformation(extent={{-52,42},{-32,62}})));
      Components.Mortality mortality2(LifeTime(displayUnit="s") = 1)
        annotation (Placement(transformation(extent={{34,42},{54,62}})));
      Components.Reproduction reproduction1(LifeTime(displayUnit="s") = 1)
        annotation (Placement(transformation(extent={{-56,-40},{-36,-20}})));
      Components.Mortality mortality1(useChangePerMemberInput=true)
        annotation (Placement(transformation(extent={{32,-40},{52,-20}})));
      Components.Population prey(population_start=1)
        annotation (Placement(transformation(extent={{-12,-40},{8,-20}})));
      Types.Constants.PopulationChangePerMemberConst
                                            preyMortality(LifeTime(displayUnit=
              "s") = 1)
        annotation (Placement(transformation(extent={{28,-4},{36,4}})));
      Blocks.Factors.Normalization predatorEffect
        annotation (Placement(transformation(extent={{52,-24},{32,-4}})));
      Types.Constants.PopulationChangePerMemberConst
                                            predatorReproduction(LifeTime(
            displayUnit="s") = 1)
        annotation (Placement(transformation(extent={{-56,80},{-48,88}})));
      Blocks.Factors.Normalization preyEffekt
        annotation (Placement(transformation(extent={{-52,60},{-32,80}})));
    equation
      connect(preyMortality.y, predatorEffect.yBase) annotation (Line(
          points={{37,0},{42,0},{42,-12}},
          color={0,0,127}));
      connect(predator.population, predatorEffect.u) annotation (Line(
          points={{8,42},{8,20},{56,20},{56,-14},{50,-14}},
          color={0,0,127}));
      connect(predatorReproduction.y, preyEffekt.yBase) annotation (Line(
          points={{-47,84},{-42,84},{-42,72}},
          color={0,0,127}));
      connect(prey.population, preyEffekt.u) annotation (Line(
          points={{4,-40},{4,-48},{-66,-48},{-66,70},{-50,70}},
          color={0,0,127}));
      connect(reproduction2.port_b, predator.port) annotation (Line(
          points={{-32,52},{2,52}},
          color={0,127,127},
          thickness=1));
      connect(predator.port, mortality2.port_a) annotation (Line(
          points={{2,52},{34.2,52}},
          color={0,127,127},
          thickness=1));
      connect(reproduction1.port_b, prey.port) annotation (Line(
          points={{-36,-30},{-2,-30}},
          color={0,127,127},
          thickness=1));
      connect(prey.port, mortality1.port_a) annotation (Line(
          points={{-2,-30},{32.2,-30}},
          color={0,127,127},
          thickness=1));
      connect(preyEffekt.y, reproduction2.changePerMember) annotation (Line(
          points={{-42,66},{-42,56}},
          color={0,0,127}));
      connect(predatorEffect.y, mortality1.changePerMember) annotation (Line(
          points={{42,-18},{42,-26}},
          color={0,0,127}));
      annotation (
        experiment(StopTime=20),
        __Dymola_experimentSetupOutput(equdistant=false));
    end PredatorPrey;

    model testChangeDivider "Divides population change into two compartments at given ratio"
      extends Modelica.Icons.Example;
      Components.Population population(population_start=1)
        annotation (Placement(transformation(extent={{-80,0},{-60,20}})));
      Components.Population population1(population_start=0)
        annotation (Placement(transformation(extent={{20,20},{40,40}})));
      Components.Population population2(population_start=0)
        annotation (Placement(transformation(extent={{20,-20},{40,0}})));
      Components.StreamWithDivider streamWithDivider(
        LifeTime(displayUnit="s") = 1,
        num_outflows=2,
        ratios={1/3},
        limitFlow_max(displayUnit="1/s") = 0.5)
        annotation (Placement(transformation(extent={{-14,0},{6,20}})));
    equation
      connect(streamWithDivider.port_b[1], population1.port) annotation (Line(
          points={{6,9.5},{18,9.5},{18,30},{30,30}},
          color={0,127,127},
          thickness=1));
      connect(streamWithDivider.port_b[2], population2.port) annotation (Line(
          points={{6,10.5},{18,10.5},{18,-10},{30,-10}},
          color={0,127,127},
          thickness=1));
      connect(streamWithDivider.port_a, population.port) annotation (Line(
          points={{-14,10},{-70,10}},
          color={0,127,127},
          thickness=1));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end testChangeDivider;

    package dev
      model Covid_SEIRS "A simple model replicating the Python implementation in https://towardsdatascience.com/social-distancing-to-slow-the-coronavirus-768292f04296 "

        Physiolibrary.Population.Components.Population Susceptible(population_start=1)
          "Susceptible population"
          annotation (Placement(transformation(extent={{-100,30},{-80,50}})));
        Physiolibrary.Population.Components.Population Exposed
          annotation (Placement(transformation(extent={{-48,30},{-28,50}})));
        Physiolibrary.Population.Components.Population Infectious(population_start=1e-4)
          annotation (Placement(transformation(extent={{26,30},{6,50}})));
        Physiolibrary.Population.Components.Stream Stream(LifeTime(displayUnit="s")=
               t_incubation)
          annotation (Placement(transformation(extent={{-20,30},{0,50}})));
        Physiolibrary.Population.Components.Population Sick
          annotation (Placement(transformation(extent={{80,30},{100,50}})));
        parameter Real alpha=1/t_incubation "inverse of the incubation period";
        parameter Real beta=1.75 "average contact rate";
        parameter Real gamma=1/t_infectious "inverse of the mean infectious period";
        parameter Real t_incubation=5;
        parameter Real t_infectious=2;
        parameter Types.Fraction needs_hosp=0.3   "Fraction of severe cases";
        parameter Types.Fraction mortality_untreated=0.6   "Mortality of severe cases, which are left untreated";
        parameter Types.Fraction mortality_treated=0.05   "Mortality of treated severe cases";
        parameter Types.Fraction mortality_unhospitalized=0.005   "Mortality of apparently mild cases, which does not require hospitalization";
        parameter Real first_seen=10 "first measured ill patients";

        Physiolibrary.Population.Components.Stream infection(useChangePerMemberInput=true)
          annotation (Placement(transformation(extent={{-74,30},{-54,50}})));
        Modelica.Blocks.Math.Gain gain(k=beta)
          annotation (Placement(transformation(extent={{0,60},{-20,80}})));
        Components.StreamWithDivider               streamWithDivider(LifeTime(
              displayUnit="s") = t_infectious, num_outflows=1,
                   ratios=zeros(0))
          annotation (Placement(transformation(extent={{32,30},{52,50}})));
        Physiolibrary.Population.Components.Population Recovered
          annotation (Placement(transformation(extent={{50,-100},{70,-80}})));
        Components.StreamWithDivider               streamWithDivider1(
                                                           LifeTime(displayUnit="s")=
               10,
          num_outflows=1,
                   ratios=zeros(0))
                   annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={90,-40})));
        Modelica.Blocks.Sources.CombiTimeTable
                                          data_positive(table=[0,3; 1,3; 2,5; 3,5; 4,8;
              5,19; 6,26; 7,32; 8,38; 9,63; 10,94; 11,116; 12,141; 13,189; 14,298; 15,
              383; 16,450; 17,560; 18,765; 19,889; 20,1047],
          extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint,
                                                             startTime=first_seen)
          annotation (Placement(transformation(extent={{-94,-22},{-74,-2}})));

        Modelica.Blocks.Sources.TimeTable data_dead(table=[0,0],
                                                    startTime=first_seen)
          annotation (Placement(transformation(extent={{-94,-94},{-74,-74}})));
        Modelica.Blocks.Sources.TimeTable data_recovered(table=[0,0],
                                                         startTime=first_seen)
          annotation (Placement(transformation(extent={{-94,-56},{-74,-36}})));
      equation
        connect(Susceptible.port, infection.port_a) annotation (Line(
            points={{-90,40},{-74,40}},
            color={0,127,127},
            thickness=1));
        connect(Exposed.port, infection.port_b) annotation (Line(
            points={{-38,40},{-54,40}},
            color={0,127,127},
            thickness=1));
        connect(Infectious.population, gain.u) annotation (Line(points={{10,30},{22,30},
                {22,70},{2,70}}, color={0,0,127}));
        connect(gain.y, infection.changePerMember)
          annotation (Line(points={{-21,70},{-64,70},{-64,44}},
                                                              color={0,0,127}));
        connect(Exposed.port, Stream.port_a) annotation (Line(
            points={{-38,40},{-20,40}},
            color={0,127,127},
            thickness=1));
        connect(Stream.port_b, Infectious.port) annotation (Line(
            points={{0,40},{16,40}},
            color={0,127,127},
            thickness=1));
        connect(Infectious.port, streamWithDivider.port_a) annotation (Line(
            points={{16,40},{32,40}},
            color={0,127,127},
            thickness=1));
        connect(streamWithDivider.port_b[1], Sick.port) annotation (Line(
            points={{52,40},{90,40}},
            color={0,127,127},
            thickness=1));
        connect(Sick.port, streamWithDivider1.port_a) annotation (Line(
            points={{90,40},{90,-30}},
            color={0,127,127},
            thickness=1));
        connect(Recovered.port, streamWithDivider1.port_b[1]) annotation (Line(
            points={{60,-90},{90,-90},{90,-50}},
            color={0,127,127},
            thickness=1));
        annotation (Documentation(info="<html>
<p>As modelled in <a href=\"https://towardsdatascience.com/social-distancing-to-slow-the-coronavirus-768292f04296\">https://towardsdatascience.com/social-distancing-to-slow-the-coronavirus-768292f04296</a></p>
</html>"));
      end Covid_SEIRS;

      model Covid_SEIRS_Ext
        extends Covid_SEIRS(streamWithDivider(num_outflows=2, ratios={1 - 0.1}),
            streamWithDivider1(num_outflows=2, ratios={1 - 0.05}));

        Physiolibrary.Population.Components.Population admittance
          annotation (Placement(transformation(extent={{34,-10},{54,10}})));
        Physiolibrary.Population.Components.Population Dead
          annotation (Placement(transformation(extent={{50,-70},{70,-50}})));
        parameter Real alpha=1/t_incubation "inverse of the incubation period";
        parameter Real beta=1.75 "average contact rate";
        parameter Real gamma=1/t_infectious "inverse of the mean infectious period";
        parameter Real t_incubation=5;
        parameter Real t_infectious=2;
        parameter Types.Fraction needs_hosp=0.3   "Fraction of severe cases";
        parameter Types.Fraction mortality_untreated=0.6   "Mortality of severe cases, which are left untreated";
        parameter Types.Fraction mortality_treated=0.05   "Mortality of treated severe cases";
        parameter Types.Fraction mortality_unhospitalized=0.005   "Mortality of apparently mild cases, which does not require hospitalization";
        parameter Real first_seen=10 "first measured ill patients";

        Physiolibrary.Population.Components.Population Recovered
          annotation (Placement(transformation(extent={{50,-100},{70,-80}})));

        Components.StreamWithDivider               streamWithDivider2(LifeTime(
              displayUnit="s") = 10, ratios={1 - mortality_untreated})
                   annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=270,
              origin={26,-44})));
        Components.Stream admittance_stream(useChangePerMemberInput=true)
          annotation (Placement(transformation(extent={{14,10},{-6,-10}})));
        HospitalCapacityLimit hospitalCapacityLimit(LifeTime(displayUnit="s") = 0.1,
          t_hospital_stay=t_hospital_stay,
            hospitalLimit=0.01,
          k_att=1000000.0)
          annotation (Placement(transformation(extent={{-22,-30},{-2,-10}})));
        Components.Population Hospitalized
          annotation (Placement(transformation(extent={{-46,-10},{-26,10}})));
        Components.StreamWithDivider               streamWithDivider3(LifeTime(
              displayUnit="s") = t_hospital_stay,
                                     ratios={1 - mortality_treated})
                   annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=270,
              origin={-36,-44})));
        Modelica.Blocks.Math.Gain relative_population(k=1/10000)
          annotation (Placement(transformation(extent={{-64,-18},{-52,-6}})));
        parameter Types.Time t_hospital_stay=10;
      equation
        connect(streamWithDivider2.port_a, admittance.port) annotation (Line(
            points={{26,-34},{26,0},{44,0}},
            color={0,127,127},
            thickness=1));
        connect(streamWithDivider2.port_b[1], Recovered.port) annotation (Line(
            points={{26,-54},{26,-90},{60,-90}},
            color={0,127,127},
            thickness=1));
        connect(streamWithDivider2.port_b[2], Dead.port) annotation (Line(
            points={{26,-54},{26,-60},{60,-60}},
            color={0,127,127},
            thickness=1));
        connect(admittance_stream.port_a, admittance.port) annotation (Line(
            points={{14,0},{44,0}},
            color={0,127,127},
            thickness=1));
        connect(admittance_stream.port_b, Hospitalized.port) annotation (Line(
            points={{-6,0},{-36,0}},
            color={0,127,127},
            thickness=1));
        connect(Hospitalized.port, streamWithDivider3.port_a) annotation (Line(
            points={{-36,0},{-36,-34}},
            color={0,127,127},
            thickness=1));
        connect(streamWithDivider3.port_b[1], Recovered.port) annotation (Line(
            points={{-36,-54},{-36,-90},{60,-90}},
            color={0,127,127},
            thickness=1));
        connect(streamWithDivider3.port_b[2], Dead.port) annotation (Line(
            points={{-36,-54},{-36,-60},{60,-60}},
            color={0,127,127},
            thickness=1));
        connect(hospitalCapacityLimit.admissionPerMember, admittance_stream.changePerMember)
          annotation (Line(points={{-2,-20},{4,-20},{4,-4}}, color={0,0,127}));
        connect(hospitalCapacityLimit.population, Hospitalized.population)
          annotation (Line(points={{-22,-20},{-30,-20},{-30,-10}}, color={0,0,127}));
        connect(admittance.port, streamWithDivider.port_b[2]) annotation (Line(
            points={{44,0},{60,0},{60,40},{52,40}},
            color={0,127,127},
            thickness=1));
        connect(Dead.port, streamWithDivider1.port_b[2]) annotation (Line(
            points={{60,-60},{88,-60},{88,-50},{90,-50}},
            color={0,127,127},
            thickness=1));
        connect(data_positive.y[1], relative_population.u)
          annotation (Line(points={{-73,-12},{-65.2,-12}}, color={0,0,127}));
        annotation (Documentation(info="<html>
<p>As modelled in <a href=\"https://towardsdatascience.com/social-distancing-to-slow-the-coronavirus-768292f04296\">https://towardsdatascience.com/social-distancing-to-slow-the-coronavirus-768292f04296</a></p>
</html>"), experiment(
            StopTime=100,
            Tolerance=1e-09,
            __Dymola_Algorithm="Dassl"));
      end Covid_SEIRS_Ext;

      model HospitalCapacityLimit
        extends Interfaces.ConditionalLifeTime;
        Types.RealIO.PopulationInput population annotation (Placement(transformation(
                extent={{-104,-10},{-84,10}}),iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=0,
              origin={-100,0})));
        Types.RealIO.PopulationChangePerMemberOutput admissionPerMember                                                                                                      annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=0,
              origin={100,0}),iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=0,
              origin={100,0})));

        parameter Types.Time t_hospital_stay;

      parameter Types.Population hospitalLimit = 1e9;
      parameter Real k_att = 1000 "attentuation factor";
      Real overflow = (population - hospitalLimit);
      Types.PopulationChange limitedFlow;
      equation
        limitedFlow = changePerPopulationMember*population/(1 + k_att*max(overflow, 0));
        admissionPerMember = if overflow < 0 then (
          changePerPopulationMember*population) else limitedFlow;
        annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
              coordinateSystem(preserveAspectRatio=false)));
      end HospitalCapacityLimit;
    end dev;
  end Examples;

  package Components
    extends Modelica.Icons.Package;
    model Population
      extends Icons.Population;
      extends SteadyStates.Interfaces.SteadyState(
      state(nominal=NominalPopulation),
      change(nominal=NominalPopulationChange),
      state_start=population_start);

      parameter Types.Population population_start(nominal=NominalPopulation) = 1e-8
        "Initial population size in compartment"
         annotation ( HideResult=true, Dialog(group="Initialization"));

      parameter Types.Population NominalPopulation = 1
        "Numerical scale. Default is 1, but for huge amount of cells it should be any number in the appropriate numerical order of typical amount."
          annotation ( HideResult=true, Dialog(tab="Solver",group="Numerical support of very huge populations"));
      parameter Types.PopulationChange NominalPopulationChange = 1/(60*60*24)
        "Numerical scale. Default change is 1 individual per day, but for much faster or much slower chnages should be different."
          annotation ( HideResult=true, Dialog(tab="Solver",group="Numerical support of very fast or very slow changes"));

      Interfaces.PopulationPort_b port(population(nominal=NominalPopulation),change(nominal=NominalPopulationChange)) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}}), iconTransformation(extent={{-10,-10},{10,
                10}})));

      Types.RealIO.PopulationOutput population(nominal=NominalPopulation) annotation (Placement(transformation(
              extent={{46,-102},{66,-82}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={60,-100})));
    equation
      port.population = population;

      state = population; //der(population) = port.change;
      change = port.change;
      annotation (Icon(graphics={
                      Text(
              extent={{-112,100},{248,140}},
              lineColor={0,0,255},
              textString="%name")}), Documentation(revisions="<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end Population;

    model Reproduction "As population change per one individual"
       extends Interfaces.ConditionalLifeTime;
      Interfaces.PopulationPort_b port_b annotation (Placement(transformation(
              extent={{90,-10},{110,10}}), iconTransformation(extent={{90,-10},{110,
                10}})));
    equation
      port_b.change = - changePerPopulationMember * port_b.population;
      annotation (Icon(graphics={
            Rectangle(
              extent={{-100,-52},{100,48}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              rotation=360),
            Polygon(
              points={{-80,23},{80,-2},{-80,-27},{-80,23}},
              lineColor={0,127,127},
              rotation=360),
            Text(
              extent={{-150,-20},{150,20}},
              lineColor={0,0,255},
              origin={-8,-78},
              rotation=360,
              textString="%name")}));
    end Reproduction;

    model Mortality "As population change per one individual"
       extends Interfaces.ConditionalLifeTime;
      Interfaces.PopulationPort_a port_a annotation (Placement(transformation(
              extent={{-108,-10},{-88,10}}), iconTransformation(extent={{-108,-10},{
                -88,10}})));
    equation
      port_a.change = changePerPopulationMember*port_a.population;
      annotation (Icon(graphics={
            Rectangle(
              extent={{-100,-50},{100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              rotation=360),
            Polygon(
              points={{-80,25},{80,0},{-80,-25},{-80,25}},
              lineColor={0,127,127},
              rotation=360),
            Text(
              extent={{-150,-20},{150,20}},
              lineColor={0,0,255},
              origin={-8,-76},
              rotation=360,
              textString="%name")}));
    end Mortality;

    model Stream "As population change per one individual"
      extends Interfaces.OnePort;
      extends Interfaces.ConditionalLifeTime;

    equation
      port_a.change = if (changePerPopulationMember>0) then changePerPopulationMember*port_a.population else changePerPopulationMember*port_b.population;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={
            Rectangle(
              extent={{-100,-50},{100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              rotation=360),
            Polygon(
              points={{-80,25},{80,0},{-80,-25},{-80,25}},
              lineColor={0,127,127},
              rotation=360),
            Text(
              extent={{-150,-20},{150,20}},
              lineColor={0,0,255},
              origin={-8,-76},
              rotation=360,
              textString="%name")}));
    end Stream;

    model Change
      extends Interfaces.OnePort;
      extends Interfaces.ConditionalChange;

    equation
      port_a.change = change;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={
            Rectangle(
              extent={{-100,-50},{100,50}},
              lineColor={0,127,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              rotation=360),
            Polygon(
              points={{-80,25},{80,0},{-80,-25},{-80,25}},
              lineColor={0,127,127},
              fillColor={0,127,127},
              fillPattern=FillPattern.Solid,
              rotation=360),
            Text(
              extent={{-150,-20},{150,20}},
              lineColor={0,0,255},
              origin={-8,-76},
              rotation=360,
              textString="%name")}));
    end Change;

    model StreamWithDivider
      extends Interfaces.ConditionalLifeTime;

      Interfaces.PopulationPort_a port_a
        annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
    //  parameter Types.PopulationChangePerMember change = 0 "Prescribed change (sum)";
      Interfaces.PopulationPort_b port_b[num_outflows]  annotation (Placement(transformation(extent={{90,-10},
                {110,10}}), iconTransformation(extent={{90,-10},{110,10}})));
    //   Types.PopulationChange changes[num_outflows];
    //   Types.PopulationChange sum_b =  sum(changes) "Sum of all outflows";
      parameter Integer num_outflows = 2 "number of outgoing flows";
      parameter Types.Fraction ratios[num_outflows - 1] = {0.5} "division of flows. The last one is given automatically, so that it sums up to one";
      parameter Types.PopulationChangePerMember limitFlow_max = Modelica.Constants.inf "Maximal flow limitation";
      Types.PopulationChange limitedChange = min(port_a.population*changePerPopulationMember, limitFlow_max) "Already limited flow";
    equation

      for i in 1:num_outflows - 1 loop
        port_b[i].change = - limitedChange*ratios[i];
      end for;

      port_b[end].change = - limitedChange*(1 - sum(ratios));

      port_a.change + sum(port_b[:].change) = 0;


    //   for i in 1:num_outflows-1 loop
    //     changes[i] = port_b[i].change*ratios[i];
    //   end for;
    //   // the ratios with the last one sum up to one
    //   changes[end] = port_b[end].change*(1 - sum(ratios));
    //
    //   port_a.change + sum_b = 0;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
            Rectangle(
              extent={{-100,-50},{100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              rotation=360),
            Text(
              extent={{-150,-20},{150,20}},
              lineColor={0,0,255},
              origin={-8,-76},
              rotation=360,
              textString="%name"),
            Polygon(
              points={{-76,30},{84,18},{-76,-1},{-76,30}},
              lineColor={0,127,127},
              rotation=360),
            Polygon(
              points={{-76,0},{84,-12},{-76,-31},{-76,0}},
              lineColor={0,127,127},
              rotation=360)}),                                       Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end StreamWithDivider;
  end Components;

  package Sources
    extends Modelica.Icons.SourcesPackage;
    model Growth
     extends Interfaces.ConditionalChange;
      Interfaces.PopulationPort_b port_b annotation (Placement(transformation(
              extent={{90,-10},{110,10}}), iconTransformation(extent={{90,-10},{110,
                10}})));
    equation
      port_b.change = - change;
      annotation (Icon(graphics={
            Rectangle(
              extent={{-100,-52},{100,48}},
              lineColor={0,127,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              rotation=360),
            Polygon(
              points={{-80,23},{80,-2},{-80,-27},{-80,23}},
              rotation=360,
              fillColor={0,127,127},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None,
              lineColor={0,127,127}),
            Text(
              extent={{-150,-20},{150,20}},
              lineColor={0,0,255},
              origin={-8,-78},
              rotation=360,
              textString="%name")}));
    end Growth;

    model Loss
     extends Interfaces.ConditionalChange;
      Interfaces.PopulationPort_a port_a annotation (Placement(transformation(
              extent={{-110,-10},{-90,10}}),
                                           iconTransformation(extent={{-110,-10},{
                -90,10}})));
    equation
      port_a.change = change;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}),
                       graphics={
            Rectangle(
              extent={{-100,-52},{100,48}},
              lineColor={0,127,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              rotation=360),
            Polygon(
              points={{-80,23},{80,-2},{-80,-27},{-80,23}},
              lineColor={0,127,127},
              rotation=360,
              fillColor={0,127,127},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-150,-20},{150,20}},
              lineColor={0,0,255},
              origin={-8,-78},
              rotation=360,
              textString="%name")}));
    end Loss;
  end Sources;

  package Interfaces
    extends Modelica.Icons.InterfacesPackage;
    connector PopulationPort
      "Average number of population members and their change"
      Types.Population population "Average number of population individuals";
      flow Types.PopulationChange change
        "Average population change = change of population individuals";
      annotation (Documentation(revisions="<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end PopulationPort;

    connector PopulationPort_a "Increase (or decrease) of population"
      extends PopulationPort;

    annotation (
        defaultComponentName="port_a",
        Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,
                100}}),     graphics={Rectangle(
              extent={{-20,10},{20,-10}},
              lineColor={0,127,127},
              lineThickness=1),       Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,127,127},
              fillColor={0,127,127},
              fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}),
            graphics={Rectangle(
              extent={{-40,40},{40,-40}},
              lineColor={0,127,127},
              fillColor={0,127,127},
              fillPattern=FillPattern.Solid),
        Text(extent = {{-160,110},{40,50}}, lineColor={0,127,127},
              textString="%name")}),
        Documentation(info="<html>
<p>
Connector with one flow signal of type Real.
</p>
</html>",
        revisions="<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));

    end PopulationPort_a;

    connector PopulationPort_b "Decrease (or increase) of population"
      extends PopulationPort;

    annotation (
        defaultComponentName="port_b",
        Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,
                100}}),     graphics={Rectangle(
              extent={{-20,10},{20,-10}},
              lineColor={0,127,127},
              lineThickness=1),       Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,127,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}),
            graphics={Rectangle(
              extent={{-40,40},{40,-40}},
              lineColor={0,127,127},
              fillColor={0,127,127},
              fillPattern=FillPattern.Solid),
        Text(extent={{-160,112},{40,52}},   lineColor={0,127,127},
              fillColor={0,127,127},
              fillPattern=FillPattern.Solid,
              textString="%name")}),
        Documentation(info="<html>
<p>
Connector with one flow signal of type Real.
</p>
</html>",
        revisions="<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));

    end PopulationPort_b;

    partial model OnePort
      "Partial change of population between two ports without its accumulation"

      PopulationPort_b port_b
        annotation (Placement(transformation(extent={{90,-10},{110,10}})));
      PopulationPort_a port_a
        annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
    equation
      port_a.change + port_b.change = 0;
    end OnePort;

    partial model ConditionalChange
      "Input of population change vs. parametric constant change"

      parameter Boolean useChangeInput = false
        "=true, if real input connector is used instead of parameter PopulationChange"
      annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));

      parameter Types.PopulationChange PopulationChange=0
        "Population change if useChangeInput=false"
        annotation (HideResult=not useChangeInput, Dialog(enable=not useChangeInput));

      Types.RealIO.PopulationChangeInput populationChange(start=PopulationChange)=change if   useChangeInput annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,60}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,40})));

      Types.PopulationChange change "Current population change";
    equation
      if not useChangeInput then
        change = PopulationChange;
      end if;

    end ConditionalChange;

    partial model ConditionalLifeTime
      "Input of population change per one population member vs. parametric lifetime"

      parameter Boolean useChangePerMemberInput = false
        "=true, if real input connector is used instead of parameter LifeTime"
      annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));

      parameter Types.Time LifeTime=1e-8
        "Mean life time for population (=1.44*halftime) if useChangePerMember=false"
        annotation (HideResult=not useChangePerMemberInput, Dialog(enable=not useChangePerMemberInput));

      Types.RealIO.PopulationChangePerMemberInput changePerMember(start=1/LifeTime)=changePerPopulationMember if useChangePerMemberInput annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,60}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,40})));

      Types.PopulationChangePerMember changePerPopulationMember
        "Current population change per individual";
    equation
      if not useChangePerMemberInput then
        changePerPopulationMember = 1/LifeTime;
      end if;

    end ConditionalLifeTime;
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
<p>THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS &quot;AS IS&quot; AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.</p>
</html>"));
end Population;

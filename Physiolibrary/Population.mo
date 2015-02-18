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
          color={0,0,127},
          smooth=Smooth.None));
      connect(predator.population, predatorEffect.u) annotation (Line(
          points={{8,42},{8,20},{56,20},{56,-14},{50,-14}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(predatorReproduction.y, preyEffekt.yBase) annotation (Line(
          points={{-47,84},{-42,84},{-42,72}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(prey.population, preyEffekt.u) annotation (Line(
          points={{4,-40},{4,-48},{-66,-48},{-66,70},{-50,70}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(reproduction2.port_b, predator.port) annotation (Line(
          points={{-32,52},{2,52}},
          color={0,127,127},
          thickness=1,
          smooth=Smooth.None));
      connect(predator.port, mortality2.port_a) annotation (Line(
          points={{2,52},{34.2,52}},
          color={0,127,127},
          thickness=1,
          smooth=Smooth.None));
      connect(reproduction1.port_b, prey.port) annotation (Line(
          points={{-36,-30},{-2,-30}},
          color={0,127,127},
          thickness=1,
          smooth=Smooth.None));
      connect(prey.port, mortality1.port_a) annotation (Line(
          points={{-2,-30},{32.2,-30}},
          color={0,127,127},
          thickness=1,
          smooth=Smooth.None));
      connect(preyEffekt.y, reproduction2.changePerMember) annotation (Line(
          points={{-42,66},{-42,56}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(predatorEffect.y, mortality1.changePerMember) annotation (Line(
          points={{42,-18},{42,-26}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (
        experiment(StopTime=20),
        __Dymola_experimentSetupOutput(equdistant=false));
    end PredatorPrey;
  end Examples;

  package Components
    extends Modelica.Icons.Package;
    model Population
      extends Icons.Population;
      extends SteadyStates.Interfaces.SteadyState(
      state(nominal=NominalPopulation),
      change(nominal=NominalPopulationChange),
      state_start=population_start,
      storeUnit="1");

      parameter Types.Population population_start(nominal=NominalPopulation) = 1e-8
        "Initial population size in compartment"
         annotation ( HideResult=true, Dialog(group="Initialization"));

      parameter Types.Population NominalPopulation = 1
        "Numerical scale. Default is 1, but for huge amount of cells it should be any number in the apropriate numerical order of typical amount."
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
              lineColor={0,0,127},
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
              lineColor={0,0,127},
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
              lineColor={0,0,127},
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
        Text(extent=  {{-160,110},{40,50}}, lineColor={0,127,127},
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
      "Partial change of population beween two ports without its accumulation"

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
      annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

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
      annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

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
<p>Licensed by Marek Matejak under the Modelica License 2</p>
<p>Copyright &copy; 2015, Marek Matejak, Charles University in Prague.</p>
<p><br><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Physiolibrary.UsersGuide.ModelicaLicense2\">UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p>
</html>"));
end Population;

within Physiolibrary;
package Population
  package Components
    model Population

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

      Interfaces.PopulationPort_a port_a(population(nominal=NominalPopulation),change(nominal=NominalPopulationChange)) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}}), iconTransformation(extent={{-10,-10},{10,
                10}})));

      Types.RealIO.PopulationOutput population(nominal=NominalPopulation) annotation (Placement(transformation(
              extent={{46,-102},{66,-82}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={60,-100})));
    equation
      port_a.population = population;

      state = population; //der(population) = port_a.change;
      change = port_a.change;
    end Population;

    model Change
      extends Interfaces.OnePort;
      extends Interfaces.ConditionalChange;

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
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid,
              rotation=360),
            Text(
              extent={{-150,-20},{150,20}},
              lineColor={0,0,255},
              origin={-8,-76},
              rotation=360,
              textString="%name")}));

    equation
      port_a.change = change;
    end Change;
  end Components;

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
              lineColor={127,127,0},
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
              lineColor={127,127,0},
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
        "=true, if population change input is used instead of parameter PopulationChange"
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

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}), graphics), Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics));
    end ConditionalChange;
  end Interfaces;
end Population;

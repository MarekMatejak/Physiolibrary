within Physiolibrary;
package Thermal "Temperature Physical Domain"

  connector HeatFlowConnector "Heat flow connector"
    Physiolibrary.Types.Temperature T "Temperature";
    flow Physiolibrary.Types.HeatFlowRate q "Heat flow";
    annotation (Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
  end HeatFlowConnector;

  connector PositiveHeatFlow "Heat inflow"
    extends HeatFlowConnector;

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Rectangle(
            extent={{-18,10},{22,-10}},
            lineColor={255,128,0},
            lineThickness=1), Ellipse(
            extent={{-100,100},{100,-100}},
            lineColor={176,88,0},
            fillColor={255,128,0},
            fillPattern=FillPattern.Solid)}), Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
  end PositiveHeatFlow;

  connector NegativeHeatFlow "Heat outflow"
    extends HeatFlowConnector;

  annotation (
      defaultComponentName="q_out",
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[1, 1],
        component=[20, 20],
        scale=0.2),
      Icon(coordinateSystem(extent={{-100,-100},{100,100}},
            preserveAspectRatio=true),                      Polygon(points=[-100,0;
              0,100; 100,0; 0,-100; -100,0],            style(
            color=74,
            rgbcolor={200,200,0},
            fillColor=0,
            rgbfillColor={255,240,240})),
        graphics={Rectangle(
            extent={{-20,10},{20,-10}},
            lineColor={255,128,0},
            lineThickness=1), Ellipse(
            extent={{-100,100},{100,-100}},
            lineColor={176,88,0},
            fillColor={255,170,85},
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
  end NegativeHeatFlow;

  partial model OnePort "Heat one port"

    PositiveHeatFlow q_in annotation (extent=[-10, -110; 10, -90], Placement(
          transformation(extent={{-110,-10},{-90,10}})));
    NegativeHeatFlow q_out annotation (extent=[-10, -110; 10, -90], Placement(
          transformation(extent={{90,-10},{110,10}})));
  equation
    q_in.q + q_out.q = 0;
    annotation (Icon(graphics), Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
  end OnePort;

  model Conductor "Heat resistor"
   extends Icons.Resistor;
   extends OnePort;
   parameter Physiolibrary.Types.ThermalConductance conductance;
  equation
    q_in.q = conductance * (q_in.T - q_out.T);
    annotation (Icon(graphics={Text(
            extent={{-70,-8},{70,10}},
            lineColor={0,0,0},
            textString="%cond (kcal/min)/K")}),
                                    Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}),
                      graphics));
  end Conductor;

  model Conductor2 "Heat resistor with input heat conductance"
   extends OnePort;
   extends Icons.Resistor;

    Physiolibrary.Types.RealIO.ThermalConductanceInput conductance
                                                          annotation (Placement(
          transformation(extent={{-40,20},{0,60}}), iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=270,
          origin={0,40})));
  equation
    q_in.q = conductance * (q_in.T - q_out.T);
    annotation (Icon(graphics={Text(
            extent={{-70,-30},{70,30}},
            textString="%name",
            lineColor={0,0,255})}), Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
  end Conductor2;

  model HeatInflux "Heat energy input"

    NegativeHeatFlow q_out annotation (extent=[-10, -110; 10, -90], Placement(
          transformation(extent={{90,-10},{110,10}}), iconTransformation(extent={
              {50,-10},{70,10}})));
    Physiolibrary.Types.RealIO.HeatFlowRateInput desiredFlow_
      "Heat inflow rate"                                        annotation ( extent = [-10,30;10,50], rotation = -90);

  equation
    q_out.q = - desiredFlow_;

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
  end HeatInflux;

  model HeatStream "Mass flow circuit with different temperatures"
    extends OnePort;

    parameter Physiolibrary.Types.SpecificHeatCapacity specificHeat_
      "Of flow circuit medium";

    Physiolibrary.Types.RealIO.MassFlowRateInput substanceFlow
      "Flowing speed in circuit. Can not be negative!"
      annotation (Placement(transformation(extent={{-50,42},{-10,82}}),
          iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=270,
          origin={0,60})));
  equation
    assert(substanceFlow>=-Modelica.Constants.eps,"In HeatStream must be always the forward flow direction! Not 'substanceFlow<0'!");
    q_in.q = substanceFlow*q_in.T*specificHeat_;

   annotation (
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
                          graphics={
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
            extent={{20,-84},{320,-44}},
            textString="%name",
            lineColor={0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio=true,
                     extent={{-100,-100},{100,100}}), graphics),
      Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),      Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
              -100},{100,100}}), graphics));
  end HeatStream;

  model HeatOutstream "Heat outflow through outflowing vaporized mass"

    PositiveHeatFlow q_in "flow circuit"     annotation (Placement(
          transformation(extent={{-120,-20},{-80,20}}), iconTransformation(extent=
             {{-110,-10},{-90,10}})));
    parameter Physiolibrary.Types.SpecificEnergy VaporizationHeat=0
      "Used for whole outflow stream";                                            // or 2428344 for water vaporization
    parameter Physiolibrary.Types.SpecificHeatCapacity specificHeat_=4186.8
      "Of outflowing medium";  //default heat capacity of water is 1 kcal/(degC.kg)

    Physiolibrary.Types.RealIO.MassFlowRateInput liquidOutflow_
      "Mass outflow. Can not be negative!"
      annotation (Placement(transformation(extent={{-42,38},{-2,78}}),
          iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=270,
          origin={0,60})));
  equation
    assert(liquidOutflow_>=-Modelica.Constants.eps,"HeatOutstream must have always one forward flow direction! Not 'liquidOutflow_<0'!");
    q_in.q = liquidOutflow_*(q_in.T*specificHeat_ + VaporizationHeat);

   annotation (
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
                          graphics={
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
            extent={{20,-84},{320,-44}},
            textString="%name",
            lineColor={0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio=true,
                     extent={{-100,-100},{100,100}}), graphics),
      Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),      Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
              -100},{100,100}}), graphics));
  end HeatOutstream;

  model IdealRadiator
    "Mass flow radiator, which outflowed temperature is the same as the ambient temperature"
    extends OnePort;

    parameter Physiolibrary.Types.SpecificHeatCapacity specificHeat_=3851.856
      "Of flow circuit medium";  //default heat capacity of blood is used as 0.92 kcal/(degC.kg)

    Physiolibrary.Types.RealIO.MassFlowRateInput substanceFlow
      "Flowing speed in circuit. Can not be negative!"
      annotation (Placement(transformation(extent={{-50,42},{-10,82}}),
          iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=0,
          origin={-100,40})));
  equation
    assert(substanceFlow>=-Modelica.Constants.eps,"In IdealRadiator must be always the forward flow direction! Not 'substanceFlow<0'!");
    q_in.q = substanceFlow*(q_in.T-q_out.T)*specificHeat_;

   annotation (
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
                          graphics={
          Rectangle(
            extent={{-100,-50},{100,50}},
            lineColor={0,0,127},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-18,40},{18,40},{2,-40},{-18,40}},
            lineColor={0,0,127},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={-50,-4},
            rotation=360),
          Text(
            extent={{20,-84},{320,-44}},
            textString="%name",
            lineColor={0,0,255}),
          Line(
            points={{0,-4},{10,10},{18,-12},{18,-10},{26,10},{38,-10},{46,12},{54,
                2},{54,22},{76,0},{54,-22},{54,2}},
            color={255,128,0},
            smooth=Smooth.None),
          Polygon(
            points={{54,22},{54,-22},{76,0},{54,22}},
            lineColor={255,128,0},
            smooth=Smooth.None,
            fillColor={255,255,170},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-11,22},{-11,-22},{11,0},{-11,22}},
            lineColor={255,128,0},
            smooth=Smooth.None,
            fillColor={255,255,170},
            fillPattern=FillPattern.Solid,
            origin={-11,0},
            rotation=180)}),        Diagram(coordinateSystem(preserveAspectRatio=true,
                     extent={{-100,-100},{100,100}}), graphics),
      Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>",   info="<html>
<p>The real inflow to radiator can be described by substanceFlow and temperature q_in.T.</p>
<p><b>q_in.q=q_out.q is not the heat inflow to Radiator input</b>, but the heat convected from radiator to environment!</p>
<p>The environment temperature is the same as radiator output temperature q_out.T. </p>
<p>And the flow of heat from radiator to environment is driven by Fick principle.</p>
</html>"),      Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
              -100},{100,100}}), graphics));
  end IdealRadiator;

  model HeatAccumulation
    "Accumulating of heat to substance mass with specific heat constant"
    extends Physiolibrary.States.State(state_start=heat_start, storeUnit=
        "kcal");
    PositiveHeatFlow q_in "Heat inflow/outflow connector"
      annotation (Placement(transformation(extent={{-20,-20},{20,20}})));

    parameter Physiolibrary.Types.Heat heat_start
      "Heat start value can be solved as weight*initialTemperature*specificHeat"
       annotation (Dialog(group="Initialization"));

    parameter Physiolibrary.Types.SpecificHeatCapacity specificHeat_=4186.8
      "Of the mass, where the heat are accumulated";
    Physiolibrary.Types.Heat heatMass "Accumulated heat";

    Physiolibrary.Types.RealIO.MassInput weight
      "Weight of mass, where the heat are accumulated"                            annotation (Placement(transformation(extent={{-122,60},
              {-82,100}}), iconTransformation(extent={{-120,60},{-80,100}})));
    Physiolibrary.Types.RealIO.TemperatureOutput T_ "Actual temperature"
                                                                annotation (Placement(transformation(
          extent={{-20,-20},{20,20}},
          rotation=270,
          origin={0,-100})));
  equation
    q_in.T=heatMass/(weight*specificHeat_);
    T_ = q_in.T;

    state = heatMass;  // der(heatMass)=q_in.q
    change = q_in.q;
    annotation (Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),
       Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics),
      Icon(graphics={Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,255},
            fillColor={255,255,170},
            fillPattern=FillPattern.Solid)}));
  end HeatAccumulation;

  model UnlimitedHeat "Constant temperature, undefinned heat flow"

    PositiveHeatFlow q_in "Heat inflow/outflow connector"
      annotation (Placement(transformation(extent={{-20,-20},{20,20}})));

    parameter Physiolibrary.Types.Temperature Temperature=295.37
      "Default ambient temperature is 22 degC";

  equation
    q_in.T=Temperature;
    annotation (Icon(graphics={Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,255},
            fillColor={255,255,170},
            fillPattern=FillPattern.Solid)}),
                                Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
  end UnlimitedHeat;
  annotation (Documentation(revisions="<html>
<p>Licensed by Marek Matejak under the Modelica License 2</p>
<p>Copyright &copy; 2008-2013, Marek Matejak.</p>
<p><br/><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Physiolibrary.UsersGuide.ModelicaLicense2\">Physiolibrary.UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p>
</html>"));
end Thermal;

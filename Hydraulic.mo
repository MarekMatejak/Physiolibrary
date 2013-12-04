within Physiolibrary2013;
package Hydraulic "Hydraulic Physical Domain"

  connector PressureFlow "Hydraulical Pressure-VolumeFlow connector"
    Physiolibrary2013.Types.Pressure
                  pressure "Pressure";
    flow Physiolibrary2013.Types.VolumeFlowRate
                             q "Volume flow";
    annotation (Documentation(revisions="<html>
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
<td>Charles University, Prague, Czech Republic</td>
</tr>
<tr>
<td>Date of:</td>
<td>january 2009-2013</td>
</tr>
</table>
</html>",
      info="<html>
<p><font style=\"font-size: 9pt; \">This connector connects hydraulic domains elements. The elements contains one equation for each his pressure-flow connector. The equation defines relation between variables in the connector. Variables are hydraulic pressure and volume flow of hydraulic medium. The pressure is the same in each connector that are connected together. The sum of flow in connectors connected together is zero (</font><b><font style=\"font-size: 9pt; \">Kirchhoff&apos;s circuit laws</font></b><font style=\"font-size: 9pt; \">).</font> </p>
</html>"));
  end PressureFlow;

  connector PositivePressureFlow "Hydraulical inflow connector"
    extends PressureFlow;

  annotation (
      defaultComponentName="q_in",
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
              100,100}}), graphics={Rectangle(
            extent={{-20,10},{20,-10}},
            lineColor={0,0,0},
            lineThickness=1), Polygon(
            points={{0,100},{100,0},{0,-100},{-100,0},{0,100}},
            lineColor={0,0,0},
            smooth=Smooth.None,
            fillPattern=FillPattern.Solid,
            fillColor={0,0,0})}),
      Diagram(Polygon(points=[-21,-3; 5,23; 31,-3; 5,-29; -21,-3],   style(
            color=74,
            rgbcolor={0,0,0},
            fillColor=0,
            rgbfillColor={0,0,0})), Text(
          extent=[-105,-38; 115,-83],
          string="%name",
          style(color=0, rgbcolor={0,0,0}))));
  end PositivePressureFlow;

  connector NegativePressureFlow "Hydraulical inflow connector"
    extends PressureFlow;

  annotation (
      defaultComponentName="q_out",
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
              100,100}}), graphics={Rectangle(
            extent={{-20,10},{20,-10}},
            lineColor={0,0,0},
            lineThickness=1), Polygon(
            points={{0,100},{100,0},{0,-100},{-100,0},{0,100}},
            lineColor={0,0,0},
            smooth=Smooth.None,
            fillPattern=FillPattern.Solid,
            fillColor={200,200,200})}),
      Diagram(Polygon(points=[-21,-3; 5,23; 31,-3; 5,-29; -21,-3],   style(
            color=74,
            rgbcolor={0,0,0},
            fillColor=0,
            rgbfillColor={0,0,0})), Text(
          extent=[-105,-38; 115,-83],
          string="%name",
          style(color=0, rgbcolor={0,0,0}))));
  end NegativePressureFlow;

  partial model OnePort "Hydraulical OnePort"

    PositivePressureFlow q_in "Volume inflow" annotation (Placement(
          transformation(extent={{-120,-20},{-80,20}}), iconTransformation(extent={{-70,-10},
              {-50,10}})));
    NegativePressureFlow q_out "Volume outflow"
                           annotation (extent=[-10, -110; 10, -90], Placement(
          transformation(extent={{18,-10},{38,10}}), iconTransformation(
            extent={{50,-10},{70,10}})));

  equation
    q_in.q + q_out.q = 0;
  end OnePort;

  model FlowMeasure "Convert connector volume flow value to signal flow value"
    extends OnePort;

    Physiolibrary2013.Types.RealIO.VolumeFlowRateOutput
                                           actualFlow "Actual volume flow rate"
                           annotation (Placement(transformation(extent={{-20,30},{20,70}}),
          iconTransformation(extent={{-20,-20},{20,20}},
                                                       rotation=90,
          origin={0,54})));
  equation
    q_out.pressure = q_in.pressure;

    actualFlow = q_in.q;

   annotation (
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-60,60},{60,-60}},
              fileName="icons/flowMeassure.png")}),
                                    Diagram(coordinateSystem(preserveAspectRatio=true,
                     extent={{-100,-100},{100,100}}), graphics),
      Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
  end FlowMeasure;

  model PressureMeasure
    "Convert connector hydraulic pressure value to signal flow value"

    Hydraulic.PositivePressureFlow q_in
                              annotation (Placement(
          transformation(extent={{-120,-20},{-80,20}}), iconTransformation(extent={{-30,-50},
              {-10,-30}})));
    Physiolibrary2013.Types.RealIO.PressureOutput
                                     actualPressure "Actual pressure"
                           annotation (Placement(transformation(extent={{-20,30},{20,70}}),
          iconTransformation(extent={{-20,-20},{20,20}},
                                                       rotation=0,
          origin={52,-20})));
  equation

    actualPressure = q_in.pressure;
    q_in.q = 0;
   annotation (
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-56,60},{64,-60}},
              fileName="icons/pressureMeassure.png")}),
                                    Diagram(coordinateSystem(preserveAspectRatio=true,
                     extent={{-100,-100},{100,100}}), graphics),
      Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
  end PressureMeasure;

  model Resistor "Simple hydraulic resistance with constant conductance."
   extends OnePort;
   extends Icons.Resistor;

   parameter Physiolibrary2013.Types.HydraulicConductance
                                             cond;
  equation
    q_in.q = cond * (q_in.pressure - q_out.pressure);

    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}),
                        graphics), Icon(graphics={
          Text(
            extent={{-70,0},{70,30}},
            lineColor={0,0,0},
            textString="%cond"),
          Text(
            extent={{-134,-90},{154,-30}},
            textString="%name",
            lineColor={0,0,255}),
          Text(
            extent={{-70,-20},{70,0}},
            lineColor={0,0,0},
            textString="ml/min/mmHg")}),
      Documentation(info="<html>
<p>This hydraulic conductance (resistance) element contains two connector sides. No hydraulic medium volume is changing in this element during simulation. That means that sum of flow in both connector sides is zero. The flow through element is determined by <b>Ohm&apos;s law</b>. It is used conductance (=1/resistance) because it could be numerical zero better then infinity in resistance. </p>
</html>"));
  end Resistor;

  model Resistor2
   extends OnePort;
   extends Icons.Resistor;
    Physiolibrary2013.Types.RealIO.HydraulicConductanceInput
                                                cond annotation (Placement(
          transformation(extent={{-58,26},{-18,66}}), iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=270,
          origin={0,40})));
  equation
    q_in.q = cond * (q_in.pressure - q_out.pressure);
    annotation (Icon(graphics={Text(
            extent={{-70,-30},{70,30}},
            textString="%name",
            lineColor={0,0,255})}));
  end Resistor2;

  model InputPump

    NegativePressureFlow q_out
                           annotation (extent=[-10, -110; 10, -90], Placement(
          transformation(extent={{90,0},{110,20}}),   iconTransformation(
            extent={{90,0},{110,20}})));
    Physiolibrary2013.Types.RealIO.VolumeFlowRateInput
                          desiredFlow "Desired volume flow value"                                    annotation (Placement(transformation(
            extent={{-66,50},{-26,90}}), iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=270,
          origin={0,60})));

  equation
    q_out.q = - desiredFlow;

   annotation (
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
              100,100}}), graphics={
          Rectangle(
            extent={{-100,-40},{100,60}},
            lineColor={0,0,127},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-80,35},{80,10},{-80,-15},{-80,35}},
            lineColor={0,0,127},
            fillColor={0,0,127},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-150,-90},{150,-50}},
            textString="%name",
            lineColor={0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio=true,
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
<td>Charles University, Prague, Czech Republic</td>
</tr>
<tr>
<td>Date of:</td>
<td>january 2009</td>
</tr>
</table>
</html>",   info="<html>
<p><font style=\"font-size: 9pt; \">This element needs to be connected only to next hydraulic elements, which contain calculation of hydraulic pressure in connector. It is because equation contains only </font><b><font style=\"font-size: 9pt; \">hydraulic volume flow</font></b><font style=\"font-size: 9pt; \"> variable, which is set to value of input signal variable. </font></p>
</html>"));
  end InputPump;

  model OutputPump

    PositivePressureFlow q_in
                           annotation (extent=[-10, -110; 10, -90], Placement(
          transformation(extent={{-110,-8},{-90,12}}), iconTransformation(extent=
              {{-110,-10},{-90,10}})));
    Physiolibrary2013.Types.RealIO.VolumeFlowRateInput
                          desiredFlow "Desired volume flow value"                                    annotation (Placement(transformation(
            extent={{-66,50},{-26,90}}), iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=270,
          origin={0,60})));
  equation
    q_in.q = desiredFlow;
   annotation (
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
              100,100}}), graphics={
          Rectangle(
            extent={{-100,-40},{100,60}},
            lineColor={0,0,127},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-80,35},{80,10},{-80,-15},{-80,35}},
            lineColor={0,0,127},
            fillColor={0,0,127},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-150,-90},{150,-50}},
            textString="%name",
            lineColor={0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio=true,
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
<td>Charles University, Prague, Czech Republic</td>
</tr>
<tr>
<td>Date of:</td>
<td>january 2009</td>
</tr>
</table>
</html>",   info="<html>
<p><font style=\"font-size: 9pt; \">This element needs to be connected only to next hydraulic elements, which contain calculation of hydraulic pressure in connector. It is because equation contains only </font><b><font style=\"font-size: 9pt; \">hydraulic volume flow</font></b><font style=\"font-size: 9pt; \"> variable, which is set to value of input signal variable. </font></p>
</html>"));
  end OutputPump;

  model Pump
    extends OnePort;
    Physiolibrary2013.Types.RealIO.VolumeFlowRateInput
                          desiredFlow "Desired volume flow value"                                    annotation (Placement(transformation(
            extent={{-66,50},{-26,90}}), iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=270,
          origin={0,60})));
  equation
    q_in.q = desiredFlow;

   annotation (
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
              100,100}}), graphics={
          Rectangle(
            extent={{-100,-40},{100,60}},
            lineColor={0,0,127},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-80,35},{80,10},{-80,-15},{-80,35}},
            lineColor={0,0,127},
            fillColor={0,0,127},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-150,-90},{150,-50}},
            textString="%name",
            lineColor={0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio=true,
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
<td>Charles University, Prague, Czech Republic</td>
</tr>
<tr>
<td>Date of:</td>
<td>january 2009</td>
</tr>
</table>
</html>",   info="<html>
<p><font style=\"font-size: 9pt; \">This element needs to be connected only to next hydraulic elements, which contain calculation of hydraulic pressure in connector. It is because equation contains only </font><b><font style=\"font-size: 9pt; \">hydraulic volume flow</font></b><font style=\"font-size: 9pt; \"> variable, which is set to value of input signal variable. </font></p>
</html>"));
  end Pump;

  model Reabsorbtion "Divide inflow to outflow and reabsorbtion"

    PositivePressureFlow Inflow                    annotation (Placement(
          transformation(extent={{-106,-18},{-66,22}}), iconTransformation(
            extent={{-110,-10},{-90,10}})));
    NegativePressureFlow Outflow
      annotation (Placement(transformation(extent={{50,-18},{90,22}}),
          iconTransformation(extent={{90,-10},{110,10}})));
    NegativePressureFlow Reabsorbtion                annotation (Placement(
          transformation(extent={{-20,-100},{20,-60}}),iconTransformation(
            extent={{-10,-110},{10,-90}})));
    Modelica.Blocks.Interfaces.RealInput FractReab
                                 annotation (Placement(transformation(extent={{-74,-38},
              {-58,-22}}), iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=180,
          origin={104,-46})));
    FlowMeasure flowMeasure
      annotation (Placement(transformation(extent={{-48,12},{-28,-8}})));
    Blocks.Factors.Effect  simpleMultiply annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-38,-30})));
    Pump pump annotation (Placement(transformation(
          extent={{-10,10},{10,-10}},
          rotation=270,
          origin={0,-44})));
  equation
    connect(Inflow, flowMeasure.q_in) annotation (Line(
        points={{-86,2},{-44,2}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(flowMeasure.actualFlow, simpleMultiply.yBase) annotation (Line(
        points={{-38,-3.4},{-38,-28}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(simpleMultiply.u, FractReab) annotation (Line(
        points={{-47.8,-30},{-66,-30}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(pump.q_out, Reabsorbtion) annotation (Line(
        points={{-1.10218e-015,-50},{0,-50},{0,-80},{0,-80}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(simpleMultiply.y, pump.desiredFlow) annotation (Line(
        points={{-38,-32},{-38,-44},{-6,-44}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(flowMeasure.q_out, Outflow) annotation (Line(
        points={{-32,2},{70,2}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(flowMeasure.q_out, pump.q_in) annotation (Line(
        points={{-32,2},{1.10218e-015,2},{1.10218e-015,-38}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
              -100},{100,100}}), graphics={Text(
            extent={{-100,130},{100,108}},
            lineColor={0,0,255},
            textString="%name"), Bitmap(extent={{-100,100},{100,-100}},
              fileName="icons/reabsorbtion.png")}),
                                   Diagram(coordinateSystem(preserveAspectRatio=true,
                    extent={{-100,-100},{100,100}}), graphics),
      Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
  end Reabsorbtion;

  model Reabsorbtion2
    "Divide inflow to outflow and reabsorbtion if it is under defined treshold"

    PositivePressureFlow Inflow                    annotation (Placement(
          transformation(extent={{-100,40},{-60,80}}),  iconTransformation(
            extent={{-110,-10},{-90,10}})));
    NegativePressureFlow Outflow
      annotation (Placement(transformation(extent={{58,40},{98,80}}),
          iconTransformation(extent={{90,-10},{110,10}})));
    NegativePressureFlow Reabsorbtion                annotation (Placement(
          transformation(extent={{-12,-98},{28,-58}}), iconTransformation(
            extent={{-10,-110},{10,-90}})));
    Physiolibrary2013.Types.RealIO.FractionInput
                                    FractReab
                                 annotation (Placement(transformation(extent={{-60,-26},
              {-48,-14}}), iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=180,
          origin={94,-56})));
    Physiolibrary2013.Types.RealIO.VolumeFlowRateInput
                                          OutflowMin     annotation (Placement(transformation(extent={{-44,84},
              {-32,96}}),  iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=180,
          origin={34,50})));
    FlowMeasure flowMeasure
      annotation (Placement(transformation(extent={{-38,22},{-18,2}})));
    Blocks.Factors.Effect  simpleMultiply annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-28,-20})));
    Pump reabsorbtion annotation (Placement(transformation(
          extent={{-10,10},{10,-10}},
          rotation=270,
          origin={10,-34})));
    Pump MinimalFlow annotation (Placement(transformation(
          extent={{10,10},{-10,-10}},
          rotation=180,
          origin={-2,60})));
    FlowMeasure flowMeasure1
      annotation (Placement(transformation(extent={{-66,50},{-46,70}})));
    Modelica.Blocks.Math.Min min
      annotation (Placement(transformation(extent={{-24,82},{-14,92}})));
  equation
    connect(flowMeasure.actualFlow, simpleMultiply.yBase) annotation (Line(
        points={{-28,6.6},{-28,-18}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(simpleMultiply.u, FractReab) annotation (Line(
        points={{-37.8,-20},{-54,-20}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(reabsorbtion.q_out, Reabsorbtion) annotation (Line(
        points={{10,-40},{10,-78},{8,-78}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(simpleMultiply.y, reabsorbtion.desiredFlow) annotation (Line(
        points={{-28,-22},{-28,-34},{4,-34}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(flowMeasure.q_out, Outflow) annotation (Line(
        points={{-22,12},{43,12},{43,60},{78,60}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(flowMeasure.q_out, reabsorbtion.q_in) annotation (Line(
        points={{-22,12},{10,12},{10,-28}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(Inflow, flowMeasure1.q_in) annotation (Line(
        points={{-80,60},{-62,60}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(flowMeasure1.q_out, flowMeasure.q_in) annotation (Line(
        points={{-50,60},{-42,60},{-42,12},{-34,12}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(flowMeasure1.q_out, MinimalFlow.q_in) annotation (Line(
        points={{-50,60},{-8,60}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(MinimalFlow.q_out, Outflow) annotation (Line(
        points={{4,60},{78,60}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(OutflowMin, min.u1) annotation (Line(
        points={{-38,90},{-25,90}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(flowMeasure1.actualFlow, min.u2) annotation (Line(
        points={{-56,65.4},{-56,84},{-25,84}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(min.y, MinimalFlow.desiredFlow) annotation (Line(
        points={{-13.5,87},{-2,87},{-2,66}},
        color={0,0,127},
        smooth=Smooth.None));
    annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
              -100},{100,100}}), graphics={Text(
            extent={{-100,134},{100,106}},
            lineColor={0,0,255},
            textString="%name"), Bitmap(extent={{-100,100},{100,-100}},
              fileName="icons/reabsorbtion2.jpg")}),
                                   Diagram(coordinateSystem(preserveAspectRatio=true,
                    extent={{-100,-100},{100,100}}), graphics),
      Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
  end Reabsorbtion2;

  model Hydrostatic
    "Create hydrostatic pressure between connectors in different altitude"

    PositivePressureFlow q_up "Top site"
                           annotation (extent=[-10, -110; 10, -90], Placement(
          transformation(extent={{-110,-8},{-90,12}}), iconTransformation(extent={{62,38},
              {82,58}})));

    PositivePressureFlow q_down "Bottom site"
                           annotation (extent=[-10, -110; 10, -90], Placement(
          transformation(extent={{-110,-8},{-90,12}}), iconTransformation(extent={{60,-66},
              {80,-46}})));
    Physiolibrary2013.Types.RealIO.HeightInput
                                  height
      "Vertical distance between top and bottom connector"
                                                 annotation (Placement(transformation(extent={{22,
              -18},{62,22}}), iconTransformation(extent={{15,-15},{-15,15}},
          rotation=180,
          origin={-61,-5})));

    parameter Modelica.SIunits.Density ro=1060; //liquid density

     //Blood density = 1060 kg/m3: Cutnell, John & Johnson, Kenneth. Physics, Fourth Edition. Wiley, 1998: 308.

    parameter Physiolibrary2013.Types.Acceleration
                                G=9.81 "Gravity acceleration"                      annotation (Placement(transformation(extent={{22,
              -18},{62,22}}), iconTransformation(extent={{15,-15},{-15,15}},
          rotation=270,
          origin={15,-85})));
  equation
    q_down.pressure = q_up.pressure + G*ro*(height/100)*(760/101325);
    q_up.q + q_down.q = 0;

   annotation (
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
              100,100}}), graphics={
          Rectangle(
            extent={{-30,-58},{30,72}},
            lineColor={0,0,127},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-62,-21},{62,21}},
            textString="%name",
            lineColor={0,0,255},
            origin={0,5},
            rotation=90),
          Bitmap(extent={{-100,100},{100,-100}}, fileName=
                "icons/hydrostaticGradient.png")}),
                                    Diagram(coordinateSystem(preserveAspectRatio=true,
                     extent={{-100,-100},{100,100}}), graphics),
      Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),      Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
              -100},{100,100}}), graphics));
  end Hydrostatic;

  model Hydrostatic2
    "Create hydrostatic pressure between connectors in different altitude"

    PositivePressureFlow q_up "Top site"
                           annotation (extent=[-10, -110; 10, -90], Placement(
          transformation(extent={{-110,-8},{-90,12}}), iconTransformation(extent={{62,38},
              {82,58}})));

    PositivePressureFlow q_down "Bottom site"
                           annotation (extent=[-10, -110; 10, -90], Placement(
          transformation(extent={{-110,-8},{-90,12}}), iconTransformation(extent={{60,-66},
              {80,-46}})));
    Physiolibrary2013.Types.RealIO.HeightInput
                                  height
      "Vertical distance between top and bottom connector"
                                                 annotation (Placement(transformation(extent={{22,
              -18},{62,22}}), iconTransformation(extent={{15,-15},{-15,15}},
          rotation=180,
          origin={-61,-5})));

    parameter Modelica.SIunits.Density ro=1060; //liquid density

     //Blood density = 1060 kg/m3: Cutnell, John & Johnson, Kenneth. Physics, Fourth Edition. Wiley, 1998: 308.

    Physiolibrary2013.Types.RealIO.AccelerationInput
                                        G "Gravity acceleration"                      annotation (Placement(transformation(extent={{22,
              -18},{62,22}}), iconTransformation(extent={{15,-15},{-15,15}},
          rotation=90,
          origin={1,85})));
  equation
    q_down.pressure = q_up.pressure + G*ro*(height/100)*(760/101325);
    q_up.q + q_down.q = 0;

   annotation (
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
              100}}),     graphics={
          Rectangle(
            extent={{-30,-58},{30,72}},
            lineColor={0,0,127},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-62,-21},{62,21}},
            textString="%name",
            lineColor={0,0,255},
            origin={0,5},
            rotation=90),
          Bitmap(extent={{-100,100},{100,-100}}, fileName=
                "icons/hydrostaticGradient.png")}),
                                    Diagram(coordinateSystem(preserveAspectRatio=true,
                     extent={{-100,-100},{100,100}}), graphics),
      Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),      Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
              -100},{100,100}}), graphics));
  end Hydrostatic2;

  model HydrostaticWithPumpEffect
    "Create hydrostatic pressure between connectors in different altitude with specific pressure pump effect"

    PositivePressureFlow q_up "Top site"
                           annotation (extent=[-10, -110; 10, -90], Placement(
          transformation(extent={{-110,-8},{-90,12}}), iconTransformation(extent={{62,38},
              {82,58}})));

    PositivePressureFlow q_down "Bottom site"
                           annotation (extent=[-10, -110; 10, -90], Placement(
          transformation(extent={{-110,-8},{-90,12}}), iconTransformation(extent={{60,-66},
              {80,-46}})));
    Physiolibrary2013.Types.RealIO.HeightInput
                                  height
      "Vertical distance between top and bottom connector"
                                                 annotation (Placement(transformation(extent={{22,
              -18},{62,22}}), iconTransformation(extent={{15,-15},{-15,15}},
          rotation=180,
          origin={-61,-5})));

    parameter Modelica.SIunits.Density ro=1060; //liquid density

     //Blood density = 1060 kg/m3: Cutnell, John & Johnson, Kenneth. Physics, Fourth Edition. Wiley, 1998: 308.

    Physiolibrary2013.Types.RealIO.AccelerationInput
                                        G "Gravity acceleration"                      annotation (Placement(transformation(extent={{22,
              -18},{62,22}}), iconTransformation(extent={{15,-15},{-15,15}},
          rotation=90,
          origin={1,85})));

    Modelica.Blocks.Interfaces.RealInput
                          pumpEffect             annotation (Placement(transformation(extent={{22,
              -18},{62,22}}), iconTransformation(extent={{15,-15},{-15,15}},
          rotation=270,
          origin={1,-85})));

  equation
    q_down.pressure = q_up.pressure + G*ro*(height/100)*(760/101325)
      *pumpEffect;
    q_up.q + q_down.q = 0;

   annotation (
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
                          graphics={
          Rectangle(
            extent={{-30,-58},{30,72}},
            lineColor={0,0,127},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-62,-21},{62,21}},
            textString="%name",
            lineColor={0,0,255},
            origin={0,5},
            rotation=90),
          Line(
            points={{-28,44},{0,72},{28,44}},
            color={0,0,255},
            smooth=Smooth.None,
            thickness=0.5),
          Bitmap(extent={{-100,100},{100,-100}},fileName=
                "icons/hydrostaticGradient.png")}),
                                    Diagram(coordinateSystem(preserveAspectRatio=true,
                     extent={{-100,-100},{100,100}}), graphics),
      Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),      Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
              -100},{100,100}}), graphics));
  end HydrostaticWithPumpEffect;

  model ElacticBalloon "Elastic balloon"
   extends Icons.ElasticBalloon;
   extends Physiolibrary2013.States.State(
                           state_start=volume_start,storeUnit="ml");

    Hydraulic.PositivePressureFlow q_in
                          annotation (extent=[-10, -110; 10, -90], Placement(
          transformation(extent={{-12,-8},{8,12}}), iconTransformation(extent={{-10,
              -10},{10,10}})));
    parameter Physiolibrary2013.Types.Volume
                          volume_start "Volume start value"
       annotation (Dialog(group="Initialization"));
    parameter Physiolibrary2013.Types.Volume
                          zeroPressureVolume
      "Maximal volume, that does not generate pressure";

    parameter Physiolibrary2013.Types.HydraulicCompliance
                                       compliance "Compliance";

    parameter Physiolibrary2013.Types.Pressure
                            externalPressure=0
      "External pressure. Set zero if internal pressure is relative to external.";

    Physiolibrary2013.Types.Volume
                excessVolume "Additional volume, that generate pressure";

    Physiolibrary2013.Types.RealIO.VolumeOutput
                                   volume annotation (Placement(transformation(
            extent={{-12,-100},{8,-80}}), iconTransformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={2,-100})));
  equation
    excessVolume = max( 0, volume - zeroPressureVolume);
    q_in.pressure = excessVolume/compliance + externalPressure;

    state = volume; // der(volume) =  q_in.q;
    change = q_in.q;

   annotation (
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
              100}}),     graphics={Text(
            extent={{-150,-150},{150,-110}},
            textString="%name",
            lineColor={0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio=false,
                     extent={{-100,-100},{100,100}}), graphics),
                Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
              -100},{100,100}}), graphics));
  end ElacticBalloon;

  model ElacticBalloon2 "Elastic balloon"
   extends Icons.ElasticBalloon;
   extends Physiolibrary2013.States.State(
                           state_start=volume_start,storeUnit="ml");

    Hydraulic.PositivePressureFlow q_in
                          annotation (extent=[-10, -110; 10, -90], Placement(
          transformation(extent={{-12,-8},{8,12}}), iconTransformation(extent={{-10,
              -10},{10,10}})));
    parameter Physiolibrary2013.Types.Volume
                          volume_start "Volume start value"
       annotation (Dialog(group="Initialization"));

    Physiolibrary2013.Types.Volume
                excessVolume "Additional volume, that generate pressure";

     Physiolibrary2013.Types.RealIO.VolumeInput
                                   zeroPressureVolume annotation (Placement(transformation(
            extent={{-120,60},{-80,100}}), iconTransformation(extent={{-120,60},{-80,
              100}})));
    Physiolibrary2013.Types.RealIO.HydraulicComplianceInput
                                               compliance annotation (Placement(
          transformation(extent={{-120,0},{-80,40}}), iconTransformation(extent={{
              -120,0},{-80,40}})));
    Physiolibrary2013.Types.RealIO.PressureInput
                                    externalPressure annotation (Placement(transformation(
            extent={{-120,-60},{-80,-20}}), iconTransformation(extent={{-120,-60},
              {-80,-20}})));
    Physiolibrary2013.Types.RealIO.VolumeOutput
                                   volume annotation (Placement(transformation(
            extent={{-12,-100},{8,-80}}), iconTransformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={0,-100})));
  equation
    excessVolume = max( 0, volume - zeroPressureVolume);
    q_in.pressure = excessVolume/compliance + externalPressure;

    state = volume; // der(volume) =  q_in.q;
    change = q_in.q;

   annotation (
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
              100}}),     graphics={Text(
            extent={{-150,-150},{150,-110}},
            textString="%name",
            lineColor={0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio=true,
                     extent={{-100,-100},{100,100}}), graphics),
                Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
              -100},{100,100}}), graphics));
  end ElacticBalloon2;

  model InternalElasticBalloon "Elastic balloon in closed space"
   extends Physiolibrary2013.States.State(
                           state_start=volume_start,storeUnit="ml");

    PositivePressureFlow q_int "Internal space"
      annotation (Placement(transformation(extent={{-86,-10},{-66,10}}),
          iconTransformation(extent={{-86,-10},{-66,10}})));
    NegativePressureFlow q_ext "External space" annotation (Placement(transformation(extent={{64,-10},
              {84,10}}),  iconTransformation(extent={{64,-10},{84,10}})));

   parameter Physiolibrary2013.Types.HydraulicCompliance
                                            Compliance "Compliance";
   parameter Physiolibrary2013.Types.Volume
                         zeroPressureVolume=0
      "Maximal volume, that does not generate pressure";
   parameter Physiolibrary2013.Types.Volume
                         volume_start "Volume start value"
       annotation (Dialog(group="Initialization"));
   Physiolibrary2013.Types.Volume
               volume;
   Physiolibrary2013.Types.Volume
               stressedVolume;

   parameter Physiolibrary2013.Types.Volume
                         NominalVolume=1e-6
      "Scale numerical calculation from quadratic meter to miniliters.";

  equation
    q_int.q + q_ext.q = 0;
    q_int.pressure = (stressedVolume/Compliance) + q_ext.pressure;
    stressedVolume = max(volume-zeroPressureVolume,0);

    state = volume; // der(volume) =  q_int.q;
    change = q_int.q;

    annotation (Icon(coordinateSystem(preserveAspectRatio=true,  extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-80,84},{120,-116}},
              fileName="icons/ventilatorCapacitance.png")}));
  end InternalElasticBalloon;

  model Inertance "Inertance of the flow"
    extends Physiolibrary2013.States.State(
                            state_start=volumeFlow_start,storeUnit="ml/min");
    extends OnePort;

    parameter Physiolibrary2013.Types.VolumeFlowRate
                                  volumeFlow_start=5*(1e-3)*60
      "Volumetric flow start value"
       annotation (Dialog(group="Initialization"));                                                          //5 l/min is normal volumetric flow in aorta

    parameter Physiolibrary2013.Types.HydraulicInertance
                                   I "Inertance";

  equation
    state = q_in.q;      // I*der(q_in.q) = (q_in.pressure - q_out.pressure);
    change = (q_in.pressure - q_out.pressure)/I;
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
              fileName="icons/ventilatorInertance.png")}), Documentation(info="<html>
<p>Inertance I of the simple tube could be calculated as I=ro*l/A, where ro is fuid density, l is tube length and A is tube cross-section area.</p>
</html>"));
  end Inertance;

    model UnlimitedVolume
    "Boundary compartment with defined pressure and any volume in/outflow"

      Physiolibrary2013.Types.RealIO.PressureInput
                                       pressure "Pressure"
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
            rotation=0), iconTransformation(extent={{-20,-20},{20,20}},
          rotation=270,
          origin={0,100})));
      Hydraulic.PositivePressureFlow y "PressureFlow output connectors"
        annotation (Placement(transformation(extent={{100,-20},{140,20}},
            rotation=0), iconTransformation(extent={{-20,-20},{20,20}})));

    equation
      y.pressure = pressure;

      annotation (Documentation(info="<html>
<p>Model has a vector of continuous Real input signals as pressures for vector of pressure-flow connectors. </p>
<p>Usage in tests: Set defaul volume&GT;0 and try to set STEADY in instances to &QUOT;false&QUOT;!</p>
</html>",
       revisions=
         "<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true,  extent={{-100,-100},{
              100,100}}),
                        graphics={Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,255},
            fillColor={170,255,255},
            fillPattern=FillPattern.Solid)}));
    end UnlimitedVolume;

  annotation (Documentation(revisions="<html>
<p>Licensed by Marek Matejak under the Modelica License 2</p>
<p>Copyright &copy; 2008-2013, Marek Matejak.</p>
<p><br/><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Physiolibrary2013.UsersGuide.ModelicaLicense2\">Physiolibrary2013.UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p>
</html>"));
end Hydraulic;

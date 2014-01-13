within Physiolibrary;
package Hydraulic "Hydraulic Physical Domain"

  package Examples
    "Examples that demonstrate usage of the Pressure flow components"
  extends Modelica.Icons.ExamplesPackage;

    model Guyton1972_CardiovascularSystem
      "Cardiovascular part of Guyton's model from 1972"
       extends Modelica.Icons.Example;

      ElasticBalloon pulmonaryVeins(
        volume_start(displayUnit="l") = 0.0004,
        zeroPressureVolume(displayUnit="l") = 0.0004,
        compliance(displayUnit="l/mmHg") = 7.5006157584566e-08)
        annotation (Placement(transformation(extent={{34,64},{54,84}})));
      ElasticBalloon pulmonaryArteries(
        zeroPressureVolume(displayUnit="l") = 0.00030625,
        compliance(displayUnit="l/mmHg") = 3.6002955640592e-08,
        volume_start(displayUnit="l") = 0.00038)
        annotation (Placement(transformation(extent={{-32,64},{-12,84}})));
      Resistor pulmonary(cond(displayUnit="l/(mmHg.min)") = 4.1665920538226e-08)
        annotation (Placement(transformation(extent={{0,64},{20,84}})));
      ElasticBalloon arteries(
        volume_start(displayUnit="l") = 0.00085,
        zeroPressureVolume(displayUnit="l") = 0.000495,
        compliance(displayUnit="l/mmHg") = 2.6627185942521e-08)
        annotation (Placement(transformation(extent={{44,-56},{64,-36}})));
      ElasticBalloon veins(
        compliance(displayUnit="l/mmHg") = 6.1880080007267e-07,
        volume_start(displayUnit="l") = 0.00325,
        zeroPressureVolume(displayUnit="l") = 0.00295)
        annotation (Placement(transformation(extent={{-34,-56},{-14,-36}})));
      Resistor nonMuscle(cond(displayUnit="l/(mmHg.min)") = 3.5627924852669e-09)
        annotation (Placement(transformation(extent={{6,-56},{26,-36}})));
      PressureMeasure pressureMeasure
        annotation (Placement(transformation(extent={{-48,16},{-28,36}})));
      Pump rightHeart
        annotation (Placement(transformation(extent={{-26,-2},{-6,18}})));
      Types.Constants.VolumeFlowRateConst RNormalCO(k(displayUnit="l/min") = 8.3333333333333e-05)
        annotation (Placement(transformation(extent={{-30,30},{-22,38}})));
      PressureMeasure pressureMeasure1
        annotation (Placement(transformation(extent={{22,16},{42,36}})));
      Pump leftHeart
        annotation (Placement(transformation(extent={{46,-2},{66,18}})));
      Types.Constants.VolumeFlowRateConst LNormalCO(k(displayUnit="l/min") = 8.3333333333333e-05)
        annotation (Placement(transformation(extent={{42,32},{50,40}})));
      Resistor kidney(cond(displayUnit="l/(mmHg.min)") = 1.4126159678427e-09)
        annotation (Placement(transformation(extent={{6,-74},{26,-54}})));
      Resistor muscle(cond(displayUnit="l/(mmHg.min)") = 1.3001067314658e-09)
        annotation (Placement(transformation(extent={{6,-38},{26,-18}})));
      Resistor largeVeins(cond(displayUnit="l/(mmHg.min)") = 1.6888886482791e-07)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-54,-18})));
      ElasticBalloon rightAtrium(
        volume_start(displayUnit="l") = 0.0001,
        zeroPressureVolume(displayUnit="l") = 0.0001,
        compliance(displayUnit="l/mmHg") = 3.7503078792283e-08)
        annotation (Placement(transformation(extent={{-52,-2},{-32,18}})));
      Blocks.Factors.Input2Effect rightStarling(data={{-6,0,0},{-3,0.15,0.104},{-1,0.52,
            0.48},{2,1.96,0.48},{4,2.42,0.123},{8,2.7,0}})
        annotation (Placement(transformation(extent={{-26,12},{-6,32}})));
      Blocks.Factors.Input2Effect leftStarling(data={{-4,0,0},{-1,0.72,0.29},{0,1.01,
            0.29},{3,1.88,0.218333},{10,2.7,0}})
        annotation (Placement(transformation(extent={{46,12},{66,32}})));
    equation
      connect(pulmonaryArteries.q_in,pulmonary. q_in) annotation (Line(
          points={{-22,74},{0,74}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pulmonary.q_out,pulmonaryVeins. q_in) annotation (Line(
          points={{20,74},{44,74}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(veins.q_in, nonMuscle.q_in)  annotation (Line(
          points={{-24,-46},{6,-46}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(nonMuscle.q_out, arteries.q_in)  annotation (Line(
          points={{26,-46},{54,-46}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(rightHeart.q_out,pulmonaryArteries. q_in) annotation (Line(
          points={{-6,8},{2,8},{2,50},{-40,50},{-40,74},{-22,74}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(leftHeart.q_in,pulmonaryVeins. q_in) annotation (Line(
          points={{46,8},{26,8},{26,50},{62,50},{62,74},{44,74}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(leftHeart.q_out,arteries. q_in) annotation (Line(
          points={{66,8},{66,8},{68,8},{68,-46},{54,-46}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pressureMeasure.q_in,rightHeart. q_in) annotation (Line(
          points={{-41.6,20},{-42,20},{-42,8},{-26,8}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pressureMeasure1.q_in,pulmonaryVeins. q_in) annotation (Line(
          points={{28.4,20},{26,20},{26,50},{62,50},{62,74},{44,74}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(muscle.q_out, arteries.q_in) annotation (Line(
          points={{26,-28},{40,-28},{40,-46},{54,-46}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(kidney.q_out, arteries.q_in) annotation (Line(
          points={{26,-64},{40,-64},{40,-46},{54,-46}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(kidney.q_in, nonMuscle.q_in) annotation (Line(
          points={{6,-64},{-4,-64},{-4,-46},{6,-46}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(muscle.q_in, nonMuscle.q_in) annotation (Line(
          points={{6,-28},{-4,-28},{-4,-46},{6,-46}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(veins.q_in, largeVeins.q_out) annotation (Line(
          points={{-24,-46},{-54,-46},{-54,-28}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(largeVeins.q_in, rightAtrium.q_in) annotation (Line(
          points={{-54,-8},{-54,8},{-42,8}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(rightAtrium.q_in, rightHeart.q_in) annotation (Line(
          points={{-42,8},{-26,8}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(rightHeart.desiredFlow, rightStarling.y) annotation (Line(
          points={{-16,14},{-16,20}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(RNormalCO.y, rightStarling.yBase) annotation (Line(
          points={{-21,34},{-16,34},{-16,24}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pressureMeasure.actualPressure, rightStarling.u) annotation (Line(
          points={{-32,22},{-25.8,22}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(LNormalCO.y, leftStarling.yBase) annotation (Line(
          points={{51,36},{56,36},{56,24}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(leftHeart.desiredFlow, leftStarling.y) annotation (Line(
          points={{56,14},{56,20}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pressureMeasure1.actualPressure, leftStarling.u) annotation (Line(
          points={{38,22},{46.2,22}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pressureMeasure.q_in, rightAtrium.q_in) annotation (Line(
          points={{-41.6,20},{-42,20},{-42,8}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics), Documentation(info="<html>
<p>Cardiovascular subsystem in famous Guyton-Coleman-Granger model from 1972. </p>
<p><br/>Model, all parameters and all initial values are from article: </p>
<p>A.C. Guyton, T.G. Coleman, H.J. Granger (1972). &QUOT;Circulation: overall regulation.&QUOT; Annual review of physiology 34(1): 13-44.</p>
</html>"));
    end Guyton1972_CardiovascularSystem;

  end Examples;

  connector PressureFlow "Hydraulical Pressure-VolumeFlow connector"
    Physiolibrary.Types.Pressure pressure "Pressure";
    flow Physiolibrary.Types.VolumeFlowRate q "Volume flow";
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
          transformation(extent={{-120,-20},{-80,20}}), iconTransformation(extent={{-110,
              -10},{-90,10}})));
    NegativePressureFlow q_out "Volume outflow"
                           annotation (extent=[-10, -110; 10, -90], Placement(
          transformation(extent={{18,-10},{38,10}}), iconTransformation(
            extent={{90,-10},{110,10}})));

    parameter Physiolibrary.States.SimulationType
                                    Simulation=Physiolibrary.States.SimulationType.NoInit
      "False, instead of one reaction in equilibrated (with zero reaction rates) system."
      annotation (Dialog(group="Simulation type", tab="Simulation"));
    parameter Boolean isFlowIncludedInEquilibrium=true
      "Is substrate flow equation included in equilibrium calculation?"
      annotation (Dialog(group="Simulation type", tab="Simulation"));

  equation
    /*** this could be done automatically, if the solver will be so smart that it remove all this dependend equations from the total equilibrated system. The most probable form of this dependent equation in equilibrium setting is (0+0 = 0). ***/
     if Simulation<>States.SimulationType.Equilibrated or isFlowIncludedInEquilibrium then
        q_in.q + q_out.q = 0;
     end if;
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
              {100,100}}), graphics));
  end OnePort;

  model FlowMeasure "Convert connector volume flow value to signal flow value"
    extends OnePort;
    extends Icons.FlowMeasure;

    Physiolibrary.Types.RealIO.VolumeFlowRateOutput actualFlow
      "Actual volume flow rate"
                           annotation (Placement(transformation(extent={{-20,30},{20,70}}),
          iconTransformation(extent={{-20,-20},{20,20}},
                                                       rotation=90,
          origin={0,80})));
  equation
    q_out.pressure = q_in.pressure;

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

  model PressureMeasure
    "Convert connector hydraulic pressure value to signal flow value"
    extends Icons.PressureMeasure;

    PositivePressureFlow q_in annotation (Placement(
          transformation(extent={{-120,-20},{-80,20}}), iconTransformation(extent={{-46,-70},
              {-26,-50}})));
    Physiolibrary.Types.RealIO.PressureOutput actualPressure "Actual pressure"
                           annotation (Placement(transformation(extent={{-20,30},{20,70}}),
          iconTransformation(extent={{-20,-20},{20,20}},
                                                       rotation=0,
          origin={60,-40})));
  equation

    actualPressure = q_in.pressure;
    q_in.q = 0;
   annotation (
      Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,
              100}}),     graphics),Diagram(coordinateSystem(preserveAspectRatio=true,
                     extent={{-100,-100},{100,100}}), graphics),
      Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
  end PressureMeasure;

  model Resistor "Simple hydraulic resistance with constant conductance."
   extends OnePort;
   extends Icons.HydraulicResistor;

   parameter Physiolibrary.Types.HydraulicConductance cond;
  equation
    q_in.q = cond * (q_in.pressure - q_out.pressure);

    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}),
                        graphics), Icon(graphics={
          Text(
            extent={{-140,-100},{148,-40}},
            textString="%name",
            lineColor={0,0,255})}),
      Documentation(info="<html>
<p>This hydraulic conductance (resistance) element contains two connector sides. No hydraulic medium volume is changing in this element during simulation. That means that sum of flow in both connector sides is zero. The flow through element is determined by <b>Ohm&apos;s law</b>. It is used conductance (=1/resistance) because it could be numerical zero better then infinity in resistance. </p>
</html>"));
  end Resistor;

  model Resistor2
   extends OnePort;
   extends Icons.HydraulicResistor;
    Physiolibrary.Types.RealIO.HydraulicConductanceInput cond
                                                     annotation (Placement(
          transformation(extent={{-58,26},{-18,66}}), iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=270,
          origin={0,40})));
  equation
    q_in.q = cond * (q_in.pressure - q_out.pressure);
    annotation (Icon(graphics));
  end Resistor2;

  model InputPump

    NegativePressureFlow q_out
                           annotation (extent=[-10, -110; 10, -90], Placement(
          transformation(extent={{90,0},{110,20}}),   iconTransformation(
            extent={{90,0},{110,20}})));
    Physiolibrary.Types.RealIO.VolumeFlowRateInput desiredFlow
      "Desired volume flow value"                                                                    annotation (Placement(transformation(
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
    Physiolibrary.Types.RealIO.VolumeFlowRateInput desiredFlow
      "Desired volume flow value"                                                                    annotation (Placement(transformation(
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
    Physiolibrary.Types.RealIO.VolumeFlowRateInput desiredFlow
      "Desired volume flow value"                                                                    annotation (Placement(transformation(
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

  model Reabsorption "Divide inflow to outflow and reabsorption"
    import Physiolibrary;
    extends Icons.Reabsorption;
    PositivePressureFlow Inflow                    annotation (Placement(
          transformation(extent={{-106,-18},{-66,22}}), iconTransformation(
            extent={{-110,-10},{-90,10}})));
    NegativePressureFlow Outflow
      annotation (Placement(transformation(extent={{50,-18},{90,22}}),
          iconTransformation(extent={{90,-10},{110,10}})));
    NegativePressureFlow Reabsorption                annotation (Placement(
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
    Physiolibrary.Blocks.Factors.Effect
                           simpleMultiply annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-38,-30})));
    Pump pump annotation (Placement(transformation(
          extent={{-10,10},{10,-10}},
          rotation=270,
          origin={0,-44})));
  equation
    connect(Inflow, flowMeasure.q_in) annotation (Line(
        points={{-86,2},{-48,2}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(flowMeasure.actualFlow, simpleMultiply.yBase) annotation (Line(
        points={{-38,-6},{-38,-28}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(simpleMultiply.u, FractReab) annotation (Line(
        points={{-47.8,-30},{-66,-30}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(pump.q_out, Reabsorption) annotation (Line(
        points={{-1.10218e-015,-54},{0,-54},{0,-80},{0,-80}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(simpleMultiply.y, pump.desiredFlow) annotation (Line(
        points={{-38,-32},{-38,-44},{-6,-44}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(flowMeasure.q_out, Outflow) annotation (Line(
        points={{-28,2},{70,2}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(flowMeasure.q_out, pump.q_in) annotation (Line(
        points={{-28,2},{1.10218e-015,2},{1.10218e-015,-34}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,
              -100},{100,100}}), graphics={Text(
            extent={{-100,130},{100,108}},
            lineColor={0,0,255},
            textString="%name")}), Diagram(coordinateSystem(preserveAspectRatio=true,
                    extent={{-100,-100},{100,100}}), graphics),
      Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
  end Reabsorption;

  model Reabsorption2
    "Divide inflow to outflow and reabsorption if it is under defined treshold"
    import Physiolibrary;
    extends Icons.Reabsorption2;

    PositivePressureFlow Inflow                    annotation (Placement(
          transformation(extent={{-100,40},{-60,80}}),  iconTransformation(
            extent={{-110,-10},{-90,10}})));
    NegativePressureFlow Outflow
      annotation (Placement(transformation(extent={{58,40},{98,80}}),
          iconTransformation(extent={{90,-10},{110,10}})));
    NegativePressureFlow Reabsorption                annotation (Placement(
          transformation(extent={{-12,-98},{28,-58}}), iconTransformation(
            extent={{-10,-110},{10,-90}})));
    Physiolibrary.Types.RealIO.FractionInput FractReab
                                 annotation (Placement(transformation(extent={{-60,-26},
              {-48,-14}}), iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=180,
          origin={94,-56})));
    Physiolibrary.Types.RealIO.VolumeFlowRateInput OutflowMin
                                                         annotation (Placement(transformation(extent={{-44,84},
              {-32,96}}),  iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=270,
          origin={38,80})));
    FlowMeasure flowMeasure
      annotation (Placement(transformation(extent={{-38,22},{-18,2}})));
    Physiolibrary.Blocks.Factors.Effect
                           simpleMultiply annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-28,-20})));
    Pump reabsorption annotation (Placement(transformation(
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
        points={{-28,4},{-28,-18}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(simpleMultiply.u, FractReab) annotation (Line(
        points={{-37.8,-20},{-54,-20}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(reabsorption.q_out, Reabsorption) annotation (Line(
        points={{10,-44},{10,-78},{8,-78}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(simpleMultiply.y, reabsorption.desiredFlow) annotation (Line(
        points={{-28,-22},{-28,-34},{4,-34}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(flowMeasure.q_out, Outflow) annotation (Line(
        points={{-18,12},{43,12},{43,60},{78,60}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(flowMeasure.q_out, reabsorption.q_in) annotation (Line(
        points={{-18,12},{10,12},{10,-24}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(Inflow, flowMeasure1.q_in) annotation (Line(
        points={{-80,60},{-66,60}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(flowMeasure1.q_out, flowMeasure.q_in) annotation (Line(
        points={{-46,60},{-42,60},{-42,12},{-38,12}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(flowMeasure1.q_out, MinimalFlow.q_in) annotation (Line(
        points={{-46,60},{-12,60}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(MinimalFlow.q_out, Outflow) annotation (Line(
        points={{8,60},{78,60}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(OutflowMin, min.u1) annotation (Line(
        points={{-38,90},{-25,90}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(flowMeasure1.actualFlow, min.u2) annotation (Line(
        points={{-56,68},{-56,84},{-25,84}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(min.y, MinimalFlow.desiredFlow) annotation (Line(
        points={{-13.5,87},{-2,87},{-2,66}},
        color={0,0,127},
        smooth=Smooth.None));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,
              -100},{100,100}}), graphics={Text(
            extent={{-100,134},{100,106}},
            lineColor={0,0,255},
            textString="%name")}), Diagram(coordinateSystem(preserveAspectRatio=true,
                    extent={{-100,-100},{100,100}}), graphics),
      Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
  end Reabsorption2;

  model Hydrostatic
    "Create hydrostatic pressure between connectors in different altitude"
    extends Icons.HydrostaticGradient;

    PositivePressureFlow q_up "Top site"
                           annotation (extent=[-10, -110; 10, -90], Placement(
          transformation(extent={{-110,-8},{-90,12}}), iconTransformation(extent={{62,38},
              {82,58}})));

    PositivePressureFlow q_down "Bottom site"
                           annotation (extent=[-10, -110; 10, -90], Placement(
          transformation(extent={{-110,-8},{-90,12}}), iconTransformation(extent={{60,-66},
              {80,-46}})));
    Physiolibrary.Types.RealIO.HeightInput height
      "Vertical distance between top and bottom connector"
                                                 annotation (Placement(transformation(extent={{22,
              -18},{62,22}}), iconTransformation(extent={{15,-15},{-15,15}},
          rotation=180,
          origin={-61,-5})));

    parameter Modelica.SIunits.Density ro=1060; //liquid density

     //Blood density = 1060 kg/m3: Cutnell, John & Johnson, Kenneth. Physics, Fourth Edition. Wiley, 1998: 308.

    parameter Physiolibrary.Types.Acceleration G=9.81 "Gravity acceleration"       annotation (Placement(transformation(extent={{22,
              -18},{62,22}}), iconTransformation(extent={{15,-15},{-15,15}},
          rotation=270,
          origin={15,-85})));
  equation
    q_down.pressure = q_up.pressure + G*ro*height;
    q_up.q + q_down.q = 0;

   annotation (
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
              100,100}}), graphics),Diagram(coordinateSystem(preserveAspectRatio=true,
                     extent={{-100,-100},{100,100}}), graphics),
      Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),      Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
              -100},{100,100}}), graphics));
  end Hydrostatic;

  model Hydrostatic2
    "Create hydrostatic pressure between connectors in different altitude"
    extends Icons.HydrostaticGradient;
    PositivePressureFlow q_up "Top site"
                           annotation (extent=[-10, -110; 10, -90], Placement(
          transformation(extent={{-110,-8},{-90,12}}), iconTransformation(extent={{62,38},
              {82,58}})));

    PositivePressureFlow q_down "Bottom site"
                           annotation (extent=[-10, -110; 10, -90], Placement(
          transformation(extent={{-110,-8},{-90,12}}), iconTransformation(extent={{60,-66},
              {80,-46}})));
    Physiolibrary.Types.RealIO.HeightInput height
      "Vertical distance between top and bottom connector"
                                                 annotation (Placement(transformation(extent={{22,
              -18},{62,22}}), iconTransformation(extent={{15,-15},{-15,15}},
          rotation=180,
          origin={-61,-5})));

    parameter Modelica.SIunits.Density ro=1060; //liquid density

     //Blood density = 1060 kg/m3: Cutnell, John & Johnson, Kenneth. Physics, Fourth Edition. Wiley, 1998: 308.

    Physiolibrary.Types.RealIO.AccelerationInput G "Gravity acceleration"             annotation (Placement(transformation(extent={{22,
              -18},{62,22}}), iconTransformation(extent={{15,-15},{-15,15}},
          rotation=90,
          origin={1,85})));
  equation
    q_down.pressure = q_up.pressure + G*ro*height;
    q_up.q + q_down.q = 0;

   annotation (
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
              100}}),     graphics),Diagram(coordinateSystem(preserveAspectRatio=true,
                     extent={{-100,-100},{100,100}}), graphics),
      Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),      Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
              -100},{100,100}}), graphics));
  end Hydrostatic2;

  model HydrostaticWithPumpEffect
    "Create hydrostatic pressure between connectors in different altitude with specific pressure pump effect"
    extends Icons.HydrostaticGradient;
    PositivePressureFlow q_up "Top site"
                           annotation (extent=[-10, -110; 10, -90], Placement(
          transformation(extent={{-110,-8},{-90,12}}), iconTransformation(extent={{62,38},
              {82,58}})));

    PositivePressureFlow q_down "Bottom site"
                           annotation (extent=[-10, -110; 10, -90], Placement(
          transformation(extent={{-110,-8},{-90,12}}), iconTransformation(extent={{60,-66},
              {80,-46}})));
    Physiolibrary.Types.RealIO.HeightInput height
      "Vertical distance between top and bottom connector"
                                                 annotation (Placement(transformation(extent={{22,
              -18},{62,22}}), iconTransformation(extent={{15,-15},{-15,15}},
          rotation=180,
          origin={-61,-5})));

    parameter Modelica.SIunits.Density ro=1060; //liquid density

     //Blood density = 1060 kg/m3: Cutnell, John & Johnson, Kenneth. Physics, Fourth Edition. Wiley, 1998: 308.

    Physiolibrary.Types.RealIO.AccelerationInput G "Gravity acceleration"             annotation (Placement(transformation(extent={{22,
              -18},{62,22}}), iconTransformation(extent={{15,-15},{-15,15}},
          rotation=90,
          origin={1,85})));

    Modelica.Blocks.Interfaces.RealInput
                          pumpEffect             annotation (Placement(transformation(extent={{22,
              -18},{62,22}}), iconTransformation(extent={{15,-15},{-15,15}},
          rotation=270,
          origin={1,-85})));

  equation
    q_down.pressure = q_up.pressure + G*ro*height*pumpEffect;
    q_up.q + q_down.q = 0;

   annotation (
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
                          graphics),Diagram(coordinateSystem(preserveAspectRatio=true,
                     extent={{-100,-100},{100,100}}), graphics),
      Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),      Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
              -100},{100,100}}), graphics));
  end HydrostaticWithPumpEffect;

  model ElasticBalloon "Elastic balloon"
   extends Icons.ElasticBalloon;
   extends Physiolibrary.States.State(state_start=volume_start, storeUnit=
        "ml");

    PositivePressureFlow q_in
                          annotation (extent=[-10, -110; 10, -90], Placement(
          transformation(extent={{-12,-8},{8,12}}), iconTransformation(extent={{-10,
              -10},{10,10}})));
    parameter Physiolibrary.Types.Volume volume_start "Volume start value"
       annotation (Dialog(group="Initialization"));
    parameter Physiolibrary.Types.Volume zeroPressureVolume
      "Maximal volume, that does not generate pressure";

    parameter Physiolibrary.Types.HydraulicCompliance compliance "Compliance";

    parameter Physiolibrary.Types.Pressure externalPressure=0
      "External pressure. Set zero if internal pressure is relative to external.";

    Physiolibrary.Types.Volume excessVolume
      "Additional volume, that generate pressure";

    Physiolibrary.Types.RealIO.VolumeOutput volume
                                          annotation (Placement(transformation(
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
  end ElasticBalloon;

  model ElasticBalloon2 "Elastic balloon"
   extends Icons.ElasticBalloon;
   extends Physiolibrary.States.State(state_start=volume_start, storeUnit=
        "ml");

    PositivePressureFlow q_in
                          annotation (extent=[-10, -110; 10, -90], Placement(
          transformation(extent={{-12,-8},{8,12}}), iconTransformation(extent={{-10,
              -10},{10,10}})));
    parameter Physiolibrary.Types.Volume volume_start "Volume start value"
       annotation (Dialog(group="Initialization"));

    Physiolibrary.Types.Volume excessVolume
      "Additional volume, that generate pressure";

     Physiolibrary.Types.RealIO.VolumeInput zeroPressureVolume
                                                      annotation (Placement(transformation(
            extent={{-120,60},{-80,100}}), iconTransformation(extent={{-120,60},{-80,
              100}})));
    Physiolibrary.Types.RealIO.HydraulicComplianceInput compliance
                                                          annotation (Placement(
          transformation(extent={{-120,0},{-80,40}}), iconTransformation(extent={{
              -120,0},{-80,40}})));
    Physiolibrary.Types.RealIO.PressureInput externalPressure
                                                     annotation (Placement(transformation(
            extent={{-120,-60},{-80,-20}}), iconTransformation(extent={{-120,-60},
              {-80,-20}})));
    Physiolibrary.Types.RealIO.VolumeOutput volume
                                          annotation (Placement(transformation(
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
  end ElasticBalloon2;

  model InternalElasticBalloon "Elastic balloon in closed space"
   extends Physiolibrary.States.State(state_start=volume_start, storeUnit=
        "ml");
   extends Icons.InternalElasticBalloon;
    PositivePressureFlow q_int "Internal space"
      annotation (Placement(transformation(extent={{-82,2},{-62,22}}),
          iconTransformation(extent={{-82,2},{-62,22}})));
    NegativePressureFlow q_ext "External space" annotation (Placement(transformation(extent={{26,2},{
              46,22}}),   iconTransformation(extent={{26,2},{46,22}})));

   parameter Physiolibrary.Types.HydraulicCompliance Compliance "Compliance";
   parameter Physiolibrary.Types.Volume zeroPressureVolume=0
      "Maximal volume, that does not generate pressure";
   parameter Physiolibrary.Types.Volume volume_start "Volume start value"
       annotation (Dialog(group="Initialization"));
   Physiolibrary.Types.Volume volume;
   Physiolibrary.Types.Volume stressedVolume;

   parameter Physiolibrary.Types.Volume NominalVolume=1e-6
      "Scale numerical calculation from quadratic meter to miniliters.";

  equation
    q_int.q + q_ext.q = 0;
    q_int.pressure = (stressedVolume/Compliance) + q_ext.pressure;
    stressedVolume = max(volume-zeroPressureVolume,0);

    state = volume; // der(volume) =  q_int.q;
    change = q_int.q;

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics));
  end InternalElasticBalloon;

  model Inertia "Inertia of the volumetric flow"
    extends Physiolibrary.States.State(state_start=volumeFlow_start,
      storeUnit="ml/min",Simulation=Physiolibrary.States.SimulationType.NoInit);
    extends OnePort(Simulation=Physiolibrary.States.SimulationType.NoInit);
    extends Icons.Inertance;

    parameter Physiolibrary.Types.VolumeFlowRate volumeFlow_start=5*(1e-3)*60
      "Volumetric flow start value"
       annotation (Dialog(group="Initialization"));                                                          //5 l/min is normal volumetric flow in aorta

    parameter Physiolibrary.Types.HydraulicInertance I "Inertance";

  equation
    state = q_in.q;      // I*der(q_in.q) = (q_in.pressure - q_out.pressure);
    change = (q_in.pressure - q_out.pressure)/I;
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics),                Documentation(info="<html>
<p>Inertance I of the simple tube could be calculated as I=ro*l/A, where ro is fuid density, l is tube length and A is tube cross-section area.</p>
</html>"));
  end Inertia;

    model UnlimitedVolume
    "Boundary compartment with defined pressure and any volume in/outflow"

      Physiolibrary.Types.RealIO.PressureInput pressure "Pressure"
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
            rotation=0), iconTransformation(extent={{-20,-20},{20,20}},
          rotation=270,
          origin={0,100})));
      PositivePressureFlow y "PressureFlow output connectors"
        annotation (Placement(transformation(extent={{100,-20},{140,20}},
            rotation=0), iconTransformation(extent={{-20,-20},{20,20}})));

      parameter Physiolibrary.States.SimulationType
                                      Simulation=Physiolibrary.States.SimulationType.NoInit
      "If Equilibrated, then zero flow rate is added."
        annotation (Dialog(group="Simulation type", tab="Simulation"));

    equation
      y.pressure = pressure;

      if Simulation==States.SimulationType.Equilibrated then
        y.q=0;
      end if;

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
<p>Copyright &copy; 2008-2013, Marek Matejak, Charles University in Prague.</p>
<p><br/><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Physiolibrary.UsersGuide.ModelicaLicense2\">Physiolibrary.UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p>
</html>", info="<html>
<p>The main usage of the hydraulic domain in human physiology is modeling of the cardio-vascular system. And because there are no extreme thermodynamic conditions, the system can be really simple &mdash;it is only necessary to model conditions for incompressible water, at normal liquid-water temperatures and with relative pressure 5-20kPa. This boring thermodynamic state leads to the very simple blocks of hydraulic resistance, hydrostatic pressure, volumetric flow, inertia and finally the ideal block of blood accumulation called ElasticBalloon.</p>
</html>"));
end Hydraulic;

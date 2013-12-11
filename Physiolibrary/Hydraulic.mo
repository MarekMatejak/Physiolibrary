within Physiolibrary;
package Hydraulic "Hydraulic Physical Domain"

  package Examples
    "Examples that demonstrate usage of the Pressure flow components"
  extends Modelica.Icons.ExamplesPackage;

    model CardiovascularSystem
    extends Modelica.Icons.Example;

      model RightHeart
        extends Icons.RightHeart;

        parameter Types.VolumeFlowRate NormalCardiacOutput;
        parameter Types.Pressure NormalFillingPressure;

        PressureMeasure pressureMeasure
          annotation (Placement(transformation(extent={{-84,-50},{-64,-30}})));
        Modelica.Blocks.Math.Division division
          annotation (Placement(transformation(extent={{-8,-30},{12,-10}})));
        Types.Constants.PressureConst normalFP(k=NormalFillingPressure)
          annotation (Placement(transformation(extent={{-40,-30},{-32,-22}})));
        Pump rightHeart
          annotation (Placement(transformation(extent={{34,-60},{54,-40}})));
        Blocks.Factors.Effect effect
          annotation (Placement(transformation(extent={{34,-30},{54,-10}})));
        PositivePressureFlow q_in annotation (Placement(transformation(extent={{-86,-66},
                  {-68,-50}}), iconTransformation(extent={{-16,-10},{4,10}})));
        NegativePressureFlow q_out annotation (Placement(transformation(extent={{82,-58},
                  {98,-42}}), iconTransformation(extent={{34,54},{54,74}})));
        Types.Constants.VolumeFlowRateConst normalCO(k=NormalCardiacOutput)
          annotation (Placement(transformation(extent={{26,8},{34,16}})));
      equation
        connect(pressureMeasure.actualPressure,division. u1) annotation (Line(
            points={{-68.2,-43.2},{-62,-43.2},{-62,-14},{-10,-14}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(rightHeart.desiredFlow,effect. y) annotation (Line(
            points={{44,-44},{44,-22}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(division.y, effect.u) annotation (Line(
            points={{13,-20},{34.2,-20}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(normalFP.y, division.u2)      annotation (Line(
            points={{-31,-26},{-10,-26}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(rightHeart.q_out, q_out) annotation (Line(
            points={{54,-50},{90,-50}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(q_in, pressureMeasure.q_in) annotation (Line(
            points={{-77,-58},{-77,-47},{-77.8,-47}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(q_in, rightHeart.q_in) annotation (Line(
            points={{-77,-58},{-14,-58},{-14,-50},{34,-50}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(normalCO.y, effect.yBase) annotation (Line(
            points={{35,12},{44,12},{44,-18}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics), Icon(coordinateSystem(
                preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
      end RightHeart;

      model LeftHeart
        extends Icons.LeftHeart;

        parameter Types.VolumeFlowRate NormalCardiacOutput;
        parameter Types.Pressure NormalFillingPressure;

        PressureMeasure pressureMeasure
          annotation (Placement(transformation(extent={{-90,-44},{-70,-24}})));
        Modelica.Blocks.Math.Division division
          annotation (Placement(transformation(extent={{-14,-24},{6,-4}})));
        Pump rightHeart
          annotation (Placement(transformation(extent={{32,-54},{52,-34}})));
        Blocks.Factors.Effect effect
          annotation (Placement(transformation(extent={{32,-24},{52,-4}})));
        PositivePressureFlow q_in annotation (Placement(transformation(extent={{-92,-60},
                  {-74,-44}}), iconTransformation(extent={{-26,14},{-6,34}})));
        NegativePressureFlow q_out annotation (Placement(transformation(extent={{76,-52},
                  {92,-36}}), iconTransformation(extent={{-58,88},{-38,108}})));
        Types.Constants.PressureConst normalFP(k=NormalFillingPressure)
          annotation (Placement(transformation(extent={{-36,-24},{-28,-16}})));
        Types.Constants.VolumeFlowRateConst normalCO(k=NormalCardiacOutput)
          annotation (Placement(transformation(extent={{30,14},{38,22}})));
      equation
        connect(pressureMeasure.actualPressure,division. u1) annotation (Line(
            points={{-74.2,-37.2},{-68,-37.2},{-68,-8},{-16,-8}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(rightHeart.desiredFlow,effect. y) annotation (Line(
            points={{42,-38},{42,-16}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(division.y, effect.u) annotation (Line(
            points={{7,-14},{32.2,-14}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(rightHeart.q_out, q_out) annotation (Line(
            points={{52,-44},{84,-44}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(q_in, pressureMeasure.q_in) annotation (Line(
            points={{-83,-52},{-83,-41},{-83.8,-41}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(q_in, rightHeart.q_in) annotation (Line(
            points={{-83,-52},{-20,-52},{-20,-44},{32,-44}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(normalFP.y, division.u2) annotation (Line(
            points={{-27,-20},{-16,-20}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(normalCO.y, effect.yBase) annotation (Line(
            points={{39,18},{42,18},{42,-12}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics), Diagram(coordinateSystem(
                preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
      end LeftHeart;

      model PulmonaryCirculation
        extends Icons.PulmonaryCirculation;

        parameter Types.HydraulicConductance PulmonaryConductance=6.9838233326989e-08;

        ElacticBalloon pulmonaryVeins(
          zeroPressureVolume=0,
          volume_start=0.0004,
          compliance=6.0004926067653e-07)
          annotation (Placement(transformation(extent={{20,-8},{40,12}})));
        ElacticBalloon pulmonaryArteries(
          zeroPressureVolume=0,
          volume_start=0.0001,
          compliance=5.0029107108905e-08)
          annotation (Placement(transformation(extent={{-46,-8},{-26,12}})));
        Resistor pulmonary(cond=PulmonaryConductance)
          annotation (Placement(transformation(extent={{-14,-8},{6,12}})));
        NegativePressureFlow q_out annotation (Placement(transformation(extent={{86,-6},
                  {102,10}}), iconTransformation(extent={{88,-10},{108,10}})));
        PositivePressureFlow q_in annotation (Placement(transformation(extent={{-88,-6},
                  {-70,10}}),  iconTransformation(extent={{-110,-10},{-90,10}})));
      equation

        connect(pulmonaryArteries.q_in,pulmonary. q_in) annotation (Line(
            points={{-36,2},{-14,2}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(pulmonary.q_out,pulmonaryVeins. q_in) annotation (Line(
            points={{6,2},{30,2}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(q_in, pulmonary.q_in) annotation (Line(
            points={{-79,2},{-14,2}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(q_out, pulmonaryVeins.q_in) annotation (Line(
            points={{94,2},{30,2}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics), Icon(coordinateSystem(
                preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
      end PulmonaryCirculation;

      model SystemicCirculation
        extends Icons.SystemicCirculation;

        parameter Types.HydraulicConductance SystemicConductance=7.1430864073035e-09;
        ElacticBalloon arteries(
          zeroPressureVolume=0,
          volume_start=0.001,
          compliance=7.5006157584566e-08)
          annotation (Placement(transformation(extent={{50,-64},{70,-44}})));
        ElacticBalloon veins(
          zeroPressureVolume=0,
          volume_start=0.0035,
          compliance=1.3126077577299e-05)
          annotation (Placement(transformation(extent={{-52,-64},{-32,-44}})));
        Resistor peripheral(cond=SystemicConductance)
          annotation (Placement(transformation(extent={{4,-64},{24,-44}})));
        PositivePressureFlow q_in annotation (Placement(transformation(extent={{82,-62},
                  {100,-46}}), iconTransformation(extent={{90,-10},{110,10}})));
        NegativePressureFlow q_out annotation (Placement(transformation(extent={{-100,
                  -62},{-84,-46}}),
                              iconTransformation(extent={{-110,-8},{-90,12}})));
      equation

        connect(veins.q_in,peripheral. q_in) annotation (Line(
            points={{-42,-54},{4,-54}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(peripheral.q_out,arteries. q_in) annotation (Line(
            points={{24,-54},{60,-54}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(q_out, veins.q_in) annotation (Line(
            points={{-92,-54},{-42,-54}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(arteries.q_in, q_in) annotation (Line(
            points={{60,-54},{91,-54}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics), Icon(coordinateSystem(
                preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
      end SystemicCirculation;

      RightHeart rightHeart1(NormalCardiacOutput=9.3333333333333e-05,
          NormalFillingPressure=266.64477483)
        annotation (Placement(transformation(extent={{-18,-6},{2,14}})));
      LeftHeart leftHeart1(NormalCardiacOutput=9.3333333333333e-05,
          NormalFillingPressure=933.256711905)
        annotation (Placement(transformation(extent={{-2,-6},{18,14}})));
      PulmonaryCirculation pulmonaryCirculation
        annotation (Placement(transformation(extent={{-10,32},{10,52}})));
      SystemicCirculation systemicCirculation
        annotation (Placement(transformation(extent={{-8,-38},{12,-18}})));
    equation
      connect(systemicCirculation.q_out, rightHeart1.q_in) annotation (Line(
          points={{-8,-27.8},{-22,-27.8},{-22,4},{-8.6,4}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(rightHeart1.q_out, pulmonaryCirculation.q_in) annotation (Line(
          points={{-3.6,10.4},{-3.6,12},{-22,12},{-22,42},{-10,42}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(leftHeart1.q_out, systemicCirculation.q_in) annotation (Line(
          points={{3.2,13.8},{28,13.8},{28,-28},{12,-28}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(leftHeart1.q_in, pulmonaryCirculation.q_out) annotation (Line(
          points={{6.4,6.4},{20,6.4},{20,42},{9.8,42}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-40,-40},
                {40,60}}),              graphics), Icon(coordinateSystem(extent={{-100,
                -100},{100,100}})));
    end CardiovascularSystem;

    model CardiovascularSystem_Equilibrated
      extends CardiovascularSystem(
        peripheral(Simulation=Simulation, isFlowIncludedInEquilibrium=false),
        pulmonaryArteries(Simulation=Simulation),
        pulmonaryVeins(Simulation=Simulation),
        arteries(Simulation=Simulation),
        veins(Simulation=Simulation));
      extends States.StateSystem(Simulation=States.SimulationType.Equilibrated);

      parameter Types.Volume BloodVolume = 0.0056 "total blood volume";

    equation
      normalizedState[1]*BloodVolume = arteries.volume + veins.volume + pulmonaryArteries.volume + pulmonaryVeins.volume;
    end CardiovascularSystem_Equilibrated;
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
    /*** this could be done automatically, if the solver will be so smart that he remove all this dependend equations from the total equilibrated system. The most probable form of this dependent equation in equilibrium setting is (0+0 = 0). ***/
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
          transformation(extent={{-120,-20},{-80,20}}), iconTransformation(extent={{-48,-80},
              {-28,-60}})));
    Physiolibrary.Types.RealIO.PressureOutput actualPressure "Actual pressure"
                           annotation (Placement(transformation(extent={{-20,30},{20,70}}),
          iconTransformation(extent={{-20,-20},{20,20}},
                                                       rotation=0,
          origin={58,-32})));
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
   extends Icons.Resistor;
    Physiolibrary.Types.RealIO.HydraulicConductanceInput cond
                                                     annotation (Placement(
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

  model Reabsorbtion "Divide inflow to outflow and reabsorbtion"
    import Physiolibrary;
    extends Icons.Reabsorbtion;
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
    connect(pump.q_out, Reabsorbtion) annotation (Line(
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
    annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
              -100},{100,100}}), graphics={Text(
            extent={{-100,130},{100,108}},
            lineColor={0,0,255},
            textString="%name")}), Diagram(coordinateSystem(preserveAspectRatio=true,
                    extent={{-100,-100},{100,100}}), graphics),
      Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
  end Reabsorbtion;

  model Reabsorbtion2
    "Divide inflow to outflow and reabsorbtion if it is under defined treshold"
    import Physiolibrary;
    extends Icons.Reabsorbtion2;

    PositivePressureFlow Inflow                    annotation (Placement(
          transformation(extent={{-100,40},{-60,80}}),  iconTransformation(
            extent={{-110,-10},{-90,10}})));
    NegativePressureFlow Outflow
      annotation (Placement(transformation(extent={{58,40},{98,80}}),
          iconTransformation(extent={{90,-10},{110,10}})));
    NegativePressureFlow Reabsorbtion                annotation (Placement(
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
          rotation=180,
          origin={34,50})));
    FlowMeasure flowMeasure
      annotation (Placement(transformation(extent={{-38,22},{-18,2}})));
    Physiolibrary.Blocks.Factors.Effect
                           simpleMultiply annotation (Placement(transformation(
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
        points={{-28,4},{-28,-18}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(simpleMultiply.u, FractReab) annotation (Line(
        points={{-37.8,-20},{-54,-20}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(reabsorbtion.q_out, Reabsorbtion) annotation (Line(
        points={{10,-44},{10,-78},{8,-78}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(simpleMultiply.y, reabsorbtion.desiredFlow) annotation (Line(
        points={{-28,-22},{-28,-34},{4,-34}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(flowMeasure.q_out, Outflow) annotation (Line(
        points={{-18,12},{43,12},{43,60},{78,60}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(flowMeasure.q_out, reabsorbtion.q_in) annotation (Line(
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
    annotation (Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},
              {100,100}}),       graphics={Text(
            extent={{-100,134},{100,106}},
            lineColor={0,0,255},
            textString="%name")}), Diagram(coordinateSystem(preserveAspectRatio=true,
                    extent={{-100,-100},{100,100}}), graphics),
      Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
  end Reabsorbtion2;

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

  model ElacticBalloon "Elastic balloon"
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
  end ElacticBalloon;

  model ElacticBalloon2 "Elastic balloon"
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
  end ElacticBalloon2;

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
      "False, instead of one reaction in equilibrated (with zero reaction rates) system."
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

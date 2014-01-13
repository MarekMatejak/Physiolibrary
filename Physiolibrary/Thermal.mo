within Physiolibrary;
package Thermal "Temperature Physical Domain"

  package Examples
    "Examples that demonstrate usage of the Pressure flow components"
  extends Modelica.Icons.ExamplesPackage;

    model MuscleHeating
    extends Modelica.Icons.Example;
    //extends States.StateSystem;//(Simulation=States.SimulationType.Equilibrated);

      HeatAccumulation muscle(heat_start=19478040)
        annotation (Placement(transformation(extent={{38,12},{58,32}})));
      IdealRadiator muscleBloodFlow
        annotation (Placement(transformation(extent={{38,-42},{58,-22}})));
      Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow
                 heatInflux
        annotation (Placement(transformation(extent={{0,10},{20,30}})));
      HeatAccumulation nonMuscle(heat_start=77912161.2)
        annotation (Placement(transformation(extent={{-6,-38},{14,-18}})));
      Modelica.Blocks.Sources.Sine sine(
        freqHz=0.01,
        offset=15,
        amplitude=15)
        annotation (Placement(transformation(extent={{-36,10},{-16,30}})));
      Modelica.Thermal.HeatTransfer.Sources.FixedTemperature
                    environment(T(displayUnit="degC") = 295.15)
        annotation (Placement(transformation(extent={{-72,-40},{-52,-20}})));
      Conductor conductor(conductance=1)
        annotation (Placement(transformation(extent={{-38,-40},{-18,-20}})));
      Types.Constants.MassConst muscleWeight(k(displayUnit="kg") = 15)
        annotation (Placement(transformation(extent={{14,36},{22,44}})));
      Types.Constants.MassConst nonMuscleWeight(k(displayUnit="kg") = 60)
        annotation (Placement(transformation(extent={{-28,-10},{-20,-2}})));
      Types.Constants.MassFlowRateConst massflowrate(k(displayUnit="g/min")=
          0.002) annotation (Placement(transformation(extent={{24,-12},{32,-4}})));
    equation
      connect(muscleBloodFlow.q_out, muscle.q_in) annotation (Line(
          points={{47.8,-21.8},{48,-21.8},{48,20}},
          color={255,128,0},
          thickness=1,
          smooth=Smooth.None));
      connect(muscleBloodFlow.q_in, nonMuscle.q_in)
                                               annotation (Line(
          points={{38,-30},{4,-30}},
          color={255,128,0},
          thickness=1,
          smooth=Smooth.None));
      connect(conductor.q_out, nonMuscle.q_in)
                                          annotation (Line(
          points={{-18,-30},{4,-30}},
          color={255,128,0},
          thickness=1,
          smooth=Smooth.None));
      connect(massflowrate.y, muscleBloodFlow.substanceFlow) annotation (Line(
          points={{33,-8},{40,-8},{40,-26}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(muscleWeight.y, muscle.weight) annotation (Line(
          points={{23,40},{30,40},{30,30},{38,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(nonMuscleWeight.y, nonMuscle.weight)
                                              annotation (Line(
          points={{-19,-6},{-14,-6},{-14,-20},{-6,-20}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(muscle.q_in, heatInflux.port) annotation (Line(
          points={{48,20},{20,20}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(sine.y, heatInflux.Q_flow) annotation (Line(
          points={{-15,20},{0,20}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(conductor.q_in, environment.port) annotation (Line(
          points={{-38,-30},{-52,-30}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),      graphics));
    end MuscleHeating;

    model Coleman_Termoregulation
      import Physiolibrary;
      extends Modelica.Icons.Example;
      HeatAccumulation0 core(
        heat_start=11586131.64,
        specificHeat_=3475.044,
        weight=10.75)
        annotation (Placement(transformation(extent={{-10,-42},{10,-22}})));
      HeatAccumulation0 GILumen(heat_start=1298536.02, weight=1)
        annotation (Placement(transformation(extent={{42,-90},{62,-70}})));
      HeatStream foodAbsorption(specificHeat_=4186.8)
        annotation (Placement(transformation(extent={{46,-74},{26,-54}})));
      HeatAccumulation0 skeletalMuscle(
        heat_start=7599879.36,
        specificHeat_=3475.044,
        weight=7.05)
        annotation (Placement(transformation(extent={{38,4},{58,24}})));
      IdealRadiator muscleBloodFlow(specificHeat_=3851.856)
                                    annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={34,-8})));
      HeatOutstream urination
        annotation (Placement(transformation(extent={{-26,-98},{-46,-78}})));
      HeatOutstream lungsVapor(VaporizationHeat(displayUnit="kcal/g") = 2428344,
          specificHeat_(displayUnit="kcal/(kg.K)"))
        annotation (Placement(transformation(extent={{14,28},{34,48}})));
      HeatAccumulation0 skin(
        heat_start=587826.72,
        specificHeat_=3475.044,
        weight=0.56)
        annotation (Placement(transformation(extent={{-66,-34},{-46,-14}})));
      IdealRadiator skinBloodFlow(specificHeat_=3851.856)
                                  annotation (Placement(transformation(
            extent={{10,-10},{-10,10}},
            rotation=0,
            origin={-30,-36})));
      HeatOutstream insensibleVapor(VaporizationHeat(displayUnit="kcal/g") = 2428344,
          specificHeat_(displayUnit="kcal/(kg.K)"))
        annotation (Placement(transformation(extent={{-42,-6},{-22,14}})));
      HeatOutstream sweating(VaporizationHeat(displayUnit="kcal/g") = 2428344,
          specificHeat_(displayUnit="kcal/(kg.K)"))
        annotation (Placement(transformation(extent={{-42,20},{-22,40}})));
      Modelica.Thermal.HeatTransfer.Components.ThermalConductor lumenVolume(G=1)
        annotation (Placement(transformation(extent={{34,-98},{14,-78}})));
      Modelica.Thermal.HeatTransfer.Components.ThermalConductor air(G(displayUnit="kcal/(min.K)")=
             12.5604)                                               annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-74,12})));
      Modelica.Thermal.HeatTransfer.Sources.FixedTemperature ambient(T=295.15)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-74,46})));
      Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow skinMetabolicHeat(Q_flow=
            1.95384)
        annotation (Placement(transformation(extent={{-90,-36},{-70,-16}})));
      Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow coreMetabolicHeat(Q_flow=
            55.824)
        annotation (Placement(transformation(extent={{88,-44},{68,-24}})));
      Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow muscleMetabolicHeat(Q_flow=
            9.7692)
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={76,-8})));
      Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow foodHeatIntake(Q_flow=0)
                                                                     annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={80,-76})));
      Types.Constants.MassFlowRateConst muscleBF(k(displayUnit="g/min") = 0.0114)
        "muscle blood flow"
        annotation (Placement(transformation(extent={{12,2},{20,10}})));
      Types.Constants.MassFlowRateConst skinBF(k(displayUnit="g/min") = 0.0028333333333333)
        "skin blood flow"
        annotation (Placement(transformation(extent={{-34,-20},{-26,-12}})));
      Types.Constants.MassFlowRateConst voiding(k=0)
        annotation (Placement(transformation(extent={{-50,-78},{-42,-70}})));
      Types.Constants.MassFlowRateConst absorption(k=0)
        annotation (Placement(transformation(extent={{24,-52},{32,-44}})));
      Types.Constants.MassFlowRateConst lungsVaporization(k=4.6666666666667e-09)
        annotation (Placement(transformation(extent={{8,48},{16,56}})));
      Types.Constants.MassFlowRateConst sweatVaporization(k=0)
        annotation (Placement(transformation(extent={{-48,38},{-40,46}})));
      Types.Constants.MassFlowRateConst insensibleVaporization(k=6.5e-09)
        annotation (Placement(transformation(extent={{-48,12},{-40,20}})));
      Physiolibrary.Thermal.Examples.Hypothalamus hypothalamus
        annotation (Placement(transformation(extent={{-10,72},{10,92}})));
    equation
      connect(GILumen.q_in, foodAbsorption.q_in)
                                             annotation (Line(
          points={{52,-82},{52,-64},{46,-64}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(foodAbsorption.q_out, core.q_in)
                                           annotation (Line(
          points={{26,-64},{4,-64},{4,-34},{0,-34}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));

      connect(core.q_in, muscleBloodFlow.q_in) annotation (Line(
          points={{0,-34},{0,-6},{24,-6}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(skeletalMuscle.q_in, muscleBloodFlow.q_out) annotation (Line(
          points={{48,12},{33.8,12},{33.8,2.2}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(core.q_in, urination.q_in) annotation (Line(
          points={{0,-34},{-4,-34},{-4,-88},{-26,-88}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(core.q_in, lungsVapor.q_in) annotation (Line(
          points={{0,-34},{0,38},{14,38}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(skinBloodFlow.q_in, lungsVapor.q_in) annotation (Line(
          points={{-20,-34},{0,-34},{0,38},{14,38}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(skin.q_in, skinBloodFlow.q_out) annotation (Line(
          points={{-56,-26},{-29.8,-26},{-29.8,-25.8}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(skin.q_in, insensibleVapor.q_in) annotation (Line(
          points={{-56,-26},{-56,4},{-42,4}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(sweating.q_in, insensibleVapor.q_in) annotation (Line(
          points={{-42,30},{-56,30},{-56,4},{-42,4}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(GILumen.q_in, lumenVolume.port_a) annotation (Line(
          points={{52,-82},{42,-82},{42,-88},{34,-88}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(core.q_in, lumenVolume.port_b) annotation (Line(
          points={{0,-34},{4,-34},{4,-88},{14,-88}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(skin.q_in, air.port_b) annotation (Line(
          points={{-56,-26},{-56,-8},{-74,-8},{-74,2}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(ambient.port, air.port_a) annotation (Line(
          points={{-74,36},{-74,22}},
          color={191,0,0},
          smooth=Smooth.None));
      connect(skin.q_in, skinMetabolicHeat.port)
                                              annotation (Line(
          points={{-56,-26},{-70,-26}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(GILumen.q_in, foodHeatIntake.port)
                                             annotation (Line(
          points={{52,-82},{62,-82},{62,-76},{70,-76}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(skeletalMuscle.q_in, muscleMetabolicHeat.port)
                                                          annotation (Line(
          points={{48,12},{60,12},{60,-8},{66,-8}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(core.q_in, coreMetabolicHeat.port)
                                              annotation (Line(
          points={{0,-34},{68,-34}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(muscleBF.y, muscleBloodFlow.substanceFlow) annotation (Line(
          points={{21,6},{26,6},{26,-2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(skinBF.y, skinBloodFlow.substanceFlow) annotation (Line(
          points={{-25,-16},{-22,-16},{-22,-30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(voiding.y, urination.liquidOutflow_) annotation (Line(
          points={{-41,-74},{-36,-74},{-36,-82}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(absorption.y, foodAbsorption.substanceFlow) annotation (Line(
          points={{33,-48},{36,-48},{36,-58}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(lungsVaporization.y, lungsVapor.liquidOutflow_) annotation (Line(
          points={{17,52},{24,52},{24,44}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(sweatVaporization.y, sweating.liquidOutflow_) annotation (Line(
          points={{-39,42},{-32,42},{-32,36}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(insensibleVaporization.y, insensibleVapor.liquidOutflow_) annotation (
         Line(
          points={{-39,16},{-32,16},{-32,10}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(skin.T_, hypothalamus.skinTemperature) annotation (Line(
          points={{-56,-34},{-56,-52},{-96,-52},{-96,86},{-10,86}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(core.T_, hypothalamus.coreTemperature) annotation (Line(
          points={{0,-42},{0,-54},{-98,-54},{-98,76},{-10,76}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(skinBloodFlow.q_in, core.q_in) annotation (Line(
          points={{-20,-34},{0,-34}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),      graphics));
    end Coleman_Termoregulation;

    model Hypothalamus

      Types.RealIO.FrequencyOutput shiveringNeuralActivity annotation (
          Placement(transformation(extent={{92,50},{112,70}}),
            iconTransformation(extent={{92,50},{112,70}})));
      Types.RealIO.FrequencyOutput sweatingNeuralActivity annotation (Placement(
            transformation(extent={{92,-10},{112,10}}), iconTransformation(
              extent={{92,-10},{112,10}})));
      Types.RealIO.FrequencyOutput skinBloodFlowNeuralActivity annotation (
          Placement(transformation(extent={{92,-70},{112,-50}}),
            iconTransformation(extent={{92,-70},{112,-50}})));
      Types.RealIO.TemperatureInput skinTemperature annotation (Placement(
            transformation(extent={{-120,20},{-80,60}}), iconTransformation(
              extent={{-120,20},{-80,60}})));
      Types.RealIO.TemperatureInput coreTemperature annotation (Placement(
            transformation(extent={{-120,-80},{-80,-40}}), iconTransformation(
              extent={{-120,-80},{-80,-40}})));
      Blocks.Curves.Curve skinBloodFlowReflex(
        x={-2.0,0,2.0},
        y={0,1,4},
        slope={0,1.8,0})
        annotation (Placement(transformation(extent={{56,-70},{76,-50}})));
      Types.Constants.TemperatureConst baseTemperature(k=310.15)
        annotation (Placement(transformation(extent={{-58,-82},{-50,-74}})));
      Modelica.Blocks.Math.Feedback dT
        annotation (Placement(transformation(extent={{-54,-70},{-34,-50}})));
      Blocks.Curves.Curve shiveringReflex(
        x={-2,0},
        y={4,0},
        slope={0,0})
        annotation (Placement(transformation(extent={{58,50},{78,70}})));
      Modelica.Blocks.Math.Feedback TemperatureDifference
        annotation (Placement(transformation(extent={{4,10},{24,-10}})));
      Types.Constants.TemperatureConst baseTemperature1(k=310.15)
        annotation (Placement(transformation(extent={{-48,60},{-40,68}})));
      Blocks.Factors.Input2EffectDelayed HypothalamusHeatAcclimation(data={{20,
            0.3,0},{28,0.0,-0.04},{39,-0.3,0}}, HalfTime=432000)
        annotation (Placement(transformation(extent={{-54,0},{-34,20}})));
      Blocks.Curves.Curve sweatingReflex(
        slope={0,0},
        x={0,2},
        y={0,4})
        annotation (Placement(transformation(extent={{56,-10},{76,10}})));
      Modelica.Blocks.Math.Sum SetPoint(nin=3)
        annotation (Placement(transformation(extent={{-12,50},{8,30}})));
      Blocks.Curves.Curve SkinTempOffset1(
        slope={0,0},
        x={24,32},
        y={0,-1})
        annotation (Placement(transformation(extent={{-54,30},{-34,50}})));
      Types.Constants.TemperatureConst temperature(k=274.15)
        annotation (Placement(transformation(extent={{-54,18},{-46,26}})));
    equation
      connect(coreTemperature, dT.u1) annotation (Line(
          points={{-100,-60},{-52,-60}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(baseTemperature.y, dT.u2) annotation (Line(
          points={{-49,-78},{-44,-78},{-44,-68}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(dT.y, skinBloodFlowReflex.u) annotation (Line(
          points={{-35,-60},{56,-60}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(skinBloodFlowReflex.val, skinBloodFlowNeuralActivity) annotation
        (Line(
          points={{76.2,-60},{102,-60}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(shiveringReflex.val, shiveringNeuralActivity) annotation (Line(
          points={{78.2,60},{102,60}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(coreTemperature, TemperatureDifference.u1) annotation (Line(
          points={{-100,-60},{-60,-60},{-60,0},{6,0}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(TemperatureDifference.y, shiveringReflex.u) annotation (Line(
          points={{23,0},{48,0},{48,60},{58,60}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(skinTemperature, HypothalamusHeatAcclimation.u) annotation (Line(
          points={{-100,40},{-70,40},{-70,10},{-53.8,10}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(sweatingReflex.val, sweatingNeuralActivity) annotation (Line(
          points={{76.2,0},{102,0}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(baseTemperature1.y, SetPoint.u[1]) annotation (Line(
          points={{-39,64},{-26,64},{-26,41.3333},{-14,41.3333}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(SkinTempOffset1.val, SetPoint.u[2]) annotation (Line(
          points={{-33.8,40},{-14,40}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(skinTemperature, SkinTempOffset1.u) annotation (Line(
          points={{-100,40},{-54,40}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(SetPoint.y, TemperatureDifference.u2) annotation (Line(
          points={{9,40},{14,40},{14,8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(TemperatureDifference.y, sweatingReflex.u) annotation (Line(
          points={{23,0},{56,0}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(HypothalamusHeatAcclimation.y, SetPoint.u[3]) annotation (Line(
          points={{-44,8},{-44,4},{-26,4},{-26,38.6667},{-14,38.6667}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(temperature.y, HypothalamusHeatAcclimation.yBase) annotation (
          Line(
          points={{-45,22},{-44,22},{-44,12}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}), graphics), Icon(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics));
    end Hypothalamus;
  end Examples;

  connector HeatFlowConnector =
                       Modelica.Thermal.HeatTransfer.Interfaces.HeatPort(T(displayUnit="degC"),Q_flow(displayUnit="kcal/min", nominal=4186.8/60));

  connector PositiveHeatFlow "Heat inflow"
    extends HeatFlowConnector;

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Rectangle(
            extent={{-18,10},{22,-10}},
            lineColor={191,0,0},
            lineThickness=1),       Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={191,0,0},
            fillColor={191,0,0},
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
            lineColor={191,0,0},
            lineThickness=1),       Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={191,0,0},
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
  end NegativeHeatFlow;

  partial model OnePort "Heat one port"

    PositiveHeatFlow q_in annotation (extent=[-10, -110; 10, -90], Placement(
          transformation(extent={{-110,-10},{-90,10}})));
    NegativeHeatFlow q_out annotation (extent=[-10, -110; 10, -90], Placement(
          transformation(extent={{90,-10},{110,10}})));
  equation
    q_in.Q_flow + q_out.Q_flow = 0;
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
    q_in.Q_flow = conductance * (q_in.T - q_out.T);
    annotation (Icon(graphics),     Documentation(revisions="<html>
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
    q_in.Q_flow = conductance * (q_in.T - q_out.T);
    annotation (Icon(graphics={Text(
            extent={{-70,-30},{70,30}},
            textString="%name",
            lineColor={0,0,255})}), Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
  end Conductor2;

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
    q_in.Q_flow = substanceFlow*q_in.T*specificHeat_;

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
    q_in.Q_flow = liquidOutflow_*(q_in.T*specificHeat_ + VaporizationHeat);

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

    extends Icons.Radiator;

    parameter Physiolibrary.Types.SpecificHeatCapacity specificHeat_=3851.856
      "Of flow circuit medium";  //default heat capacity of blood is used as 0.92 kcal/(degC.kg)

    Physiolibrary.Types.RealIO.MassFlowRateInput substanceFlow
      "Flowing speed in circuit. Can not be negative!"
      annotation (Placement(transformation(extent={{-50,42},{-10,82}}),
          iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=270,
          origin={-80,60})));

    PositiveHeatFlow q_in annotation (extent=[-10, -110; 10, -90], Placement(
          transformation(extent={{-110,10},{-90,30}}), iconTransformation(extent={{-110,10},
              {-90,30}})));
    NegativeHeatFlow q_out annotation (extent=[-10, -110; 10, -90], Placement(
          transformation(extent={{-12,92},{8,112}}), iconTransformation(extent=
              {{-12,92},{8,112}})));
  equation
    q_in.Q_flow + q_out.Q_flow = 0;
    assert(substanceFlow>=-Modelica.Constants.eps,"In IdealRadiator must be always the forward flow direction! Not 'substanceFlow<0'!");
    q_in.Q_flow = substanceFlow*(q_in.T-q_out.T)*specificHeat_;

   annotation (
      Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,
              100}}),     graphics={
          Text(
            extent={{-144,-142},{156,-102}},
            textString="%name",
            lineColor={0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio=true,
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

  model HeatAccumulation0
    "Accumulating of heat to substance mass with specific heat constant"
    extends Icons.HeatAccumulation;
    extends Physiolibrary.States.State(state_start=heat_start, storeUnit=
        "kcal");
    PositiveHeatFlow q_in "Heat inflow/outflow connector"
      annotation (Placement(transformation(extent={{-20,-40},{20,0}}),
          iconTransformation(extent={{-20,-40},{20,0}})));

    parameter Physiolibrary.Types.Heat heat_start
      "Heat start value can be solved as weight*initialTemperature*specificHeat"
       annotation (Dialog(group="Initialization"));

    parameter Physiolibrary.Types.SpecificHeatCapacity specificHeat_=4186.8
      "Of the mass, where the heat are accumulated";
    Physiolibrary.Types.Heat heatMass "Accumulated heat";

    Physiolibrary.Types.RealIO.TemperatureOutput T_ "Actual temperature"
                                                                annotation (Placement(transformation(
          extent={{-20,-20},{20,20}},
          rotation=270,
          origin={0,-100})));
    parameter Types.Mass weight "Total mass weight";
  equation
    q_in.T=heatMass/(weight*specificHeat_);
    T_ = q_in.T;

    state = heatMass;  // der(heatMass)=q_in.q
    change = q_in.Q_flow;
    annotation (Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),
       Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
              100}}),            graphics),
      Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
              100}}),
           graphics={
          Text(
            extent={{-20,-140},{280,-100}},
            textString="%name",
            lineColor={0,0,255})}));
  end HeatAccumulation0;

  model HeatAccumulation
    "Accumulating of heat to substance mass with specific heat constant"
    extends Icons.HeatAccumulation;
    extends Physiolibrary.States.State(state_start=heat_start, storeUnit=
        "kcal");
    PositiveHeatFlow q_in "Heat inflow/outflow connector"
      annotation (Placement(transformation(extent={{-20,-40},{20,0}}),
          iconTransformation(extent={{-20,-40},{20,0}})));

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
    change = q_in.Q_flow;
    annotation (Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),
       Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics),
      Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
              100}}),
           graphics={
          Text(
            extent={{-20,-140},{280,-100}},
            textString="%name",
            lineColor={0,0,255})}));
  end HeatAccumulation;

  annotation (Documentation(revisions="<html>
<p>Licensed by Marek Matejak under the Modelica License 2</p>
<p>Copyright &copy; 2008-2013, Marek Matejak, Charles University in Prague.</p>
<p><br/><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Physiolibrary.UsersGuide.ModelicaLicense2\">Physiolibrary.UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p>
</html>", info="<html>
<p>For the human body to function optimally, it is critical to hold the core temperature at 35&ndash;39&deg;&nbsp;C. A fever of 41&deg;&nbsp;C for more than a short period of time causes brain damage. If the core temperature falls below 10&deg; C, the heart stops. As in the hydraulic domain, the thermal domain is simplified to these conditions. In the Physiolibrary.Thermal package, the connector HeatConnector is composed of temperature and thermal flow. The main blocks are: Conductor, IdealRadiator and HeatAccumulation. The heat conductor conducts the heat from the source, such us muscles or metabolically active tissue, to its surrounding. IdealRadiator delivers heat to tissues by blood circulation. HeatAccumulation plays a role in accumulating thermal energy in each tissue mass driven by its heat capacity.</p>
</html>"));
end Thermal;

within Physiolibrary;
package Thermal "Temperature Physical Domain"
 extends Modelica.Icons.Package;
  package Examples
    "Examples that demonstrate usage of the Pressure flow components"
  extends Modelica.Icons.ExamplesPackage;

    model MuscleHeat
    extends Modelica.Icons.Example;
    //extends States.StateSystem;//(Simulation=States.SimulationType.Equilibrated);

      Components.HeatAccumulation
                       muscle(SpecificHeat=3475.044)
        annotation (Placement(transformation(extent={{16,22},{36,42}})));
      Components.IdealRadiator
                    muscleCirculation "Blood circulation in skeletal muscle"
        annotation (Placement(transformation(extent={{16,-32},{36,-12}})));
      Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow generatedHeat(Q_flow=13.956)
        "Heat energy created by muscle"
        annotation (Placement(transformation(extent={{-32,20},{-12,40}})));
      Modelica.Thermal.HeatTransfer.Sources.FixedTemperature body(T(displayUnit="degC")=
             310.15)
        annotation (Placement(transformation(extent={{-32,-30},{-12,-10}})));
      Types.Constants.MassConst muscleWeight(k(displayUnit="kg") = 15)
        annotation (Placement(transformation(extent={{-8,46},{0,54}})));
      Types.Constants.MassFlowRateConst muscleBloodFlow(k(displayUnit="g/min") = 0.0114)
                 annotation (Placement(transformation(extent={{2,-2},{10,6}})));
    equation
      connect(muscleBloodFlow.y, muscleCirculation.substanceFlow)
                                                             annotation (Line(
          points={{11,2},{18,2},{18,-16}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(muscleWeight.y, muscle.weight) annotation (Line(
          points={{1,50},{8,50},{8,40},{16,40}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(muscle.q_in, generatedHeat.port)
                                            annotation (Line(
          points={{26,30},{-12,30}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(muscleCirculation.q_in, body.port) annotation (Line(
          points={{16,-20},{-12,-20}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(muscle.q_in, muscleCirculation.q_out) annotation (Line(
          points={{26,30},{26,-11.8},{25.8,-11.8}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),      graphics),
        experiment(StopTime=10000, Tolerance=1e-006),
        __Dymola_experimentSetupOutput,
        Documentation(revisions="<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end MuscleHeat;

    model ThermalBody_QHP
      import Physiolibrary;
      extends Modelica.Icons.Example;
      Physiolibrary.Thermal.Components.HeatAccumulation0
                        core(SpecificHeat=3475.044, Weight=10.75)
        annotation (Placement(transformation(extent={{-10,-42},{10,-22}})));
      Physiolibrary.Thermal.Components.HeatAccumulation0
                        GILumen(Weight=1)
        annotation (Placement(transformation(extent={{42,-90},{62,-70}})));
      Physiolibrary.Thermal.Components.HeatStream
                 foodAbsorption(SpecificHeat=4186.8)
        annotation (Placement(transformation(extent={{46,-74},{26,-54}})));
      Physiolibrary.Thermal.Components.HeatAccumulation0
                        skeletalMuscle(SpecificHeat=3475.044, Weight=7.05)
        annotation (Placement(transformation(extent={{38,4},{58,24}})));
      Physiolibrary.Thermal.Components.IdealRadiator
                    muscleBloodFlow(SpecificHeat=3851.856)
                                    annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={34,-8})));
      Physiolibrary.Thermal.Components.HeatOutstream
                    urination
        annotation (Placement(transformation(extent={{-26,-98},{-46,-78}})));
      Physiolibrary.Thermal.Components.HeatOutstream
                    lungsVapor(VaporizationHeat(displayUnit="kcal/g") = 2428344,
          SpecificHeat(displayUnit="kcal/(kg.K)"))
        annotation (Placement(transformation(extent={{14,28},{34,48}})));
      Physiolibrary.Thermal.Components.HeatAccumulation0
                        skin(SpecificHeat=3475.044, Weight=0.56)
        annotation (Placement(transformation(extent={{-66,-34},{-46,-14}})));
      Physiolibrary.Thermal.Components.IdealRadiator
                    skinBloodFlow(SpecificHeat=3851.856)
                                  annotation (Placement(transformation(
            extent={{10,-10},{-10,10}},
            rotation=0,
            origin={-30,-36})));
      Physiolibrary.Thermal.Components.HeatOutstream
                    insensibleVapor(VaporizationHeat(displayUnit="kcal/g") = 2428344,
          SpecificHeat(displayUnit="kcal/(kg.K)"))
        annotation (Placement(transformation(extent={{-42,-6},{-22,14}})));
      Physiolibrary.Thermal.Components.HeatOutstream
                    sweating(VaporizationHeat(displayUnit="kcal/g") = 2428344,
          SpecificHeat(displayUnit="kcal/(kg.K)"))
        annotation (Placement(transformation(extent={{-42,20},{-22,40}})));
      Modelica.Thermal.HeatTransfer.Components.ThermalConductor lumenVolume(G(
            displayUnit="kcal/(min.K)") = 1)
        annotation (Placement(transformation(extent={{34,-98},{14,-78}})));
      Modelica.Thermal.HeatTransfer.Components.ThermalConductor air(G(
            displayUnit="kcal/(min.K)") = 7.6758)                   annotation (
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
      Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow muscleMetabolicHeat(Q_flow(
            displayUnit="kcal/min") = 9.7692)
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
      connect(skinBloodFlow.q_in, core.q_in) annotation (Line(
          points={{-20,-34},{0,-34}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),      graphics), Documentation(revisions="<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),
        experiment(StopTime=1000),
        __Dymola_experimentSetupOutput);
    end ThermalBody_QHP;

  end Examples;

  package Components
    extends Modelica.Icons.Package;
    model Conductor "Heat resistor"
     extends Icons.Resistor;
     extends Interfaces.OnePort;
     parameter Physiolibrary.Types.ThermalConductance Conductance;
    equation
      q_in.Q_flow = Conductance * (q_in.T - q_out.T);
      annotation (Icon(graphics),     Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),
                        graphics));
    end Conductor;

    model Conductor2 "Heat resistor with input heat conductance"
     extends Interfaces.OnePort;
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
      extends Interfaces.OnePort;

      parameter Physiolibrary.Types.SpecificHeatCapacity SpecificHeat
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
      q_in.Q_flow = substanceFlow*q_in.T*SpecificHeat;

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
</html>"),        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics));
    end HeatStream;

    model HeatOutstream "Heat outflow through outflowing vaporized mass"

      Interfaces.PositiveHeatFlow
                       q_in "flow circuit"     annotation (Placement(
            transformation(extent={{-120,-20},{-80,20}}), iconTransformation(extent=
               {{-110,-10},{-90,10}})));
      parameter Physiolibrary.Types.SpecificEnergy VaporizationHeat=0
        "Used for whole outflow stream";                                            // or 2428344 for water vaporization
      parameter Physiolibrary.Types.SpecificHeatCapacity SpecificHeat=4186.8
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
      q_in.Q_flow = liquidOutflow_*(q_in.T*SpecificHeat + VaporizationHeat);

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
</html>"),        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics));
    end HeatOutstream;

    model IdealRadiator
      "Mass flow radiator, which outflowed temperature is the same as the ambient temperature"

      extends Icons.Radiator;

      parameter Physiolibrary.Types.SpecificHeatCapacity SpecificHeat=3851.856
        "Of flow circuit medium";  //default heat capacity of blood is used as 0.92 kcal/(degC.kg)

      Physiolibrary.Types.RealIO.MassFlowRateInput substanceFlow
        "Flowing speed in circuit. Can not be negative!"
        annotation (Placement(transformation(extent={{-50,42},{-10,82}}),
            iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={-80,60})));

      Interfaces.PositiveHeatFlow
                       q_in annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{-110,10},{-90,30}}), iconTransformation(extent={{-110,10},
                {-90,30}})));
      Interfaces.NegativeHeatFlow
                       q_out annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{-12,92},{8,112}}), iconTransformation(extent=
                {{-12,92},{8,112}})));
    equation
      q_in.Q_flow + q_out.Q_flow = 0;
      assert(substanceFlow>=-Modelica.Constants.eps,"In IdealRadiator must be always the forward flow direction! Not 'substanceFlow<0'!");
      q_in.Q_flow = substanceFlow*(q_in.T-q_out.T)*SpecificHeat;

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
</html>",     info="<html>
<p>The real inflow to radiator can be described by substanceFlow and temperature q_in.T.</p>
<p><b>q_in.q=q_out.q is not the heat inflow to Radiator input</b>, but the heat convected from radiator to environment!</p>
<p>The environment temperature is the same as radiator output temperature q_out.T. </p>
<p>And the flow of heat from radiator to environment is driven by Fick principle.</p>
</html>"),        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics));
    end IdealRadiator;

    model HeatAccumulation0
      "Accumulating of heat to substance mass with specific heat constant"
      extends Icons.HeatAccumulation;
      extends Physiolibrary.States.State(state_start=relativeHeat_start, storeUnit=
          "kcal");
      Interfaces.PositiveHeatFlow
                       q_in "Heat inflow/outflow connector"
        annotation (Placement(transformation(extent={{-20,-40},{20,0}}),
            iconTransformation(extent={{-20,-40},{20,0}})));

      parameter Physiolibrary.Types.Heat relativeHeat_start = 0
        "Heat start value = weight*(initialTemperature - 37degC)*specificHeat"
         annotation (Dialog(group="Initialization"));

      parameter Physiolibrary.Types.SpecificHeatCapacity SpecificHeat= 4186.8
        "Mass specific heat";
      Physiolibrary.Types.Heat relativeHeat
        "Current accumulated heat = weight*(T - 37degC)*specificHeat";
        //absoluteHeat =  weight*310.15*specificHeat + relativeHeat

      Physiolibrary.Types.RealIO.TemperatureOutput T "Current temperature"
                                                                  annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,-100})));                                            //nominal=1
      parameter Types.Mass Weight "Total mass weight";

      constant Types.Temperature NormalBodyTemperature = 310.15
        "Shift of absolute zero temperature to normal body values";

    equation
      q_in.T=NormalBodyTemperature + relativeHeat/(Weight*SpecificHeat);
      T = q_in.T;

      state = relativeHeat;  // der(relativeHeat)=q_in.q
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
      extends Physiolibrary.States.State(state_start=relativeHeat_start, storeUnit=
          "kcal");
      Interfaces.PositiveHeatFlow
                       q_in "Heat inflow/outflow connector"
        annotation (Placement(transformation(extent={{-20,-40},{20,0}}),
            iconTransformation(extent={{-20,-40},{20,0}})));

      parameter Physiolibrary.Types.Heat relativeHeat_start = 0
        "Heat start value = weight*(initialTemperature - 37degC)*specificHeat"
         annotation (Dialog(group="Initialization"));

      parameter Physiolibrary.Types.SpecificHeatCapacity SpecificHeat=4186.8
        "Mass specific heat";
      Physiolibrary.Types.Heat relativeHeat
        "Current accumulated heat = weight*(T - 37degC)*specificHeat";

      Physiolibrary.Types.RealIO.MassInput weight
        "Weight of mass, where the heat are accumulated"                            annotation (Placement(transformation(extent={{-122,60},
                {-82,100}}), iconTransformation(extent={{-120,60},{-80,100}})));
      Physiolibrary.Types.RealIO.TemperatureOutput T "Actual temperature"
                                                                  annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,-100})));
      constant Types.Temperature NormalBodyTemperature = 310.15
        "Shift of absolute zero temperature to normal body values";

    equation
      q_in.T=NormalBodyTemperature + relativeHeat/(weight*SpecificHeat);
      T = q_in.T;

      state = relativeHeat;  // der(relativeHeat)=q_in.q
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
  end Components;

  package Interfaces
    extends Modelica.Icons.InterfacesPackage;

    connector HeatFlowConnector =
                         Modelica.Thermal.HeatTransfer.Interfaces.HeatPort(T(displayUnit="degC"),Q_flow(displayUnit="kcal/min", nominal=4186.8/60));
    connector PositiveHeatFlow "Heat inflow"
      extends Interfaces.HeatFlowConnector;

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
      extends Interfaces.HeatFlowConnector;

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

      Interfaces.PositiveHeatFlow
                       q_in annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{-110,-10},{-90,10}})));
      Interfaces.NegativeHeatFlow
                       q_out annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{90,-10},{110,10}})));
    equation
      q_in.Q_flow + q_out.Q_flow = 0;
      annotation (Icon(graphics), Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end OnePort;
  end Interfaces;
  annotation (Documentation(revisions="<html>
<p>Licensed by Marek Matejak under the Modelica License 2</p>
<p>Copyright &copy; 2008-2013, Marek Matejak, Charles University in Prague.</p>
<p><br/><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Physiolibrary.UsersGuide.ModelicaLicense2\">Physiolibrary.UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p>
</html>", info="<html>
<p>For the human body to function optimally, it is critical to hold the core temperature at 35&ndash;39&deg;&nbsp;C. A fever of 41&deg;&nbsp;C for more than a short period of time causes brain damage. If the core temperature falls below 10&deg; C, the heart stops. As in the hydraulic domain, the thermal domain is simplified to these conditions. In the Physiolibrary.Thermal package, the connector HeatConnector is composed of temperature and thermal flow. The main blocks are: Conductor, IdealRadiator and HeatAccumulation. The heat conductor conducts the heat from the source, such us muscles or metabolically active tissue, to its surrounding. IdealRadiator delivers heat to tissues by blood circulation. HeatAccumulation plays a role in accumulating thermal energy in each tissue mass driven by its heat capacity.</p>
</html>"));
end Thermal;

within Physiolibrary;
package Thermal "Temperature and Heat Flow"
 extends Modelica.Icons.Package;
  package Examples
    "Examples that demonstrate usage of the Pressure flow components"
  extends Modelica.Icons.ExamplesPackage;

    model MuscleHeat
    extends Modelica.Icons.Example;

      Components.HeatAccumulation
                       muscle(
        relativeHeat_start=52125.66,
        SpecificHeat=3475.044,
        Weight(displayUnit="kg") = 15)
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
      Types.Constants.MassFlowRateConst muscleBloodFlow(k(displayUnit="g/min") = 0.0114)
                 annotation (Placement(transformation(extent={{2,-2},{10,6}})));
    equation
      connect(muscleBloodFlow.y, muscleCirculation.substanceFlow)
                                                             annotation (Line(
          points={{11,2},{18,2},{18,-15}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(muscle.q_in, generatedHeat.port)
                                            annotation (Line(
          points={{26,32},{8,32},{8,30},{-12,30}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(muscleCirculation.q_in, body.port) annotation (Line(
          points={{16,-20},{-12,-20}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(muscle.q_in, muscleCirculation.q_out) annotation (Line(
          points={{26,32},{26,-12},{26,-12}},
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
      Physiolibrary.Thermal.Components.HeatAccumulation
                        core(SpecificHeat=3475.044, Weight=10.75)
        annotation (Placement(transformation(extent={{-10,-42},{10,-22}})));
      Physiolibrary.Thermal.Components.HeatAccumulation
                        GILumen(Weight=1)
        annotation (Placement(transformation(extent={{42,-90},{62,-70}})));
      Physiolibrary.Thermal.Components.HeatStream
                 foodAbsorption(SpecificHeat=4186.8)
        annotation (Placement(transformation(extent={{46,-74},{26,-54}})));
      Physiolibrary.Thermal.Components.HeatAccumulation
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
      Physiolibrary.Thermal.Components.HeatAccumulation
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
          points={{52,-80},{52,-64},{46,-64}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(foodAbsorption.q_out, core.q_in)
                                           annotation (Line(
          points={{26,-64},{4,-64},{4,-32},{0,-32}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));

      connect(core.q_in, muscleBloodFlow.q_in) annotation (Line(
          points={{0,-32},{0,-6},{24,-6}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(skeletalMuscle.q_in, muscleBloodFlow.q_out) annotation (Line(
          points={{48,14},{34,14},{34,2}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(core.q_in, urination.q_in) annotation (Line(
          points={{0,-32},{-4,-32},{-4,-88},{-26,-88}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(core.q_in, lungsVapor.q_in) annotation (Line(
          points={{0,-32},{0,38},{14,38}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(skinBloodFlow.q_in, lungsVapor.q_in) annotation (Line(
          points={{-20,-34},{0,-34},{0,38},{14,38}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(skin.q_in, skinBloodFlow.q_out) annotation (Line(
          points={{-56,-24},{-30,-24},{-30,-26}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(skin.q_in, insensibleVapor.q_in) annotation (Line(
          points={{-56,-24},{-56,4},{-42,4}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(sweating.q_in, insensibleVapor.q_in) annotation (Line(
          points={{-42,30},{-56,30},{-56,4},{-42,4}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(GILumen.q_in, lumenVolume.port_a) annotation (Line(
          points={{52,-80},{42,-80},{42,-88},{34,-88}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(core.q_in, lumenVolume.port_b) annotation (Line(
          points={{0,-32},{4,-32},{4,-88},{14,-88}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(skin.q_in, air.port_b) annotation (Line(
          points={{-56,-24},{-56,-8},{-74,-8},{-74,2}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(ambient.port, air.port_a) annotation (Line(
          points={{-74,36},{-74,22}},
          color={191,0,0},
          smooth=Smooth.None));
      connect(skin.q_in, skinMetabolicHeat.port)
                                              annotation (Line(
          points={{-56,-24},{-64,-24},{-64,-26},{-70,-26}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(GILumen.q_in, foodHeatIntake.port)
                                             annotation (Line(
          points={{52,-80},{62,-80},{62,-76},{70,-76}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(skeletalMuscle.q_in, muscleMetabolicHeat.port)
                                                          annotation (Line(
          points={{48,14},{60,14},{60,-8},{66,-8}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(core.q_in, coreMetabolicHeat.port)
                                              annotation (Line(
          points={{0,-32},{34,-32},{34,-34},{68,-34}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(muscleBF.y, muscleBloodFlow.substanceFlow) annotation (Line(
          points={{21,6},{26,6},{26,-1}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(skinBF.y, skinBloodFlow.substanceFlow) annotation (Line(
          points={{-25,-16},{-22,-16},{-22,-29}},
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
          points={{-20,-34},{-10,-34},{-10,-32},{0,-32}},
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

    model Conductor "Heat resistor with input heat conductance"
     extends Interfaces.OnePort;
     extends Icons.Resistor;

      parameter Boolean useConductanceInput = false
        "=true, if external conductance value is used"
        annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

      parameter Types.ThermalConductance Conductance=0
        "Thermal conductance if useConductanceInput=false"
        annotation (Dialog(enable=not useConductanceInput));

      Physiolibrary.Types.RealIO.ThermalConductanceInput conductance(start=Conductance)=c if useConductanceInput
                                                       annotation (Placement(
            transformation(extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,40})));

       Types.ThermalConductance c;
    equation
      if not useConductanceInput then
        c=Conductance;
      end if;

      q_in.Q_flow = c * (q_in.T - q_out.T);
      annotation (Icon(graphics={Text(
              extent={{-70,-30},{70,30}},
              textString="%name",
              lineColor={0,0,255})}), Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics));
    end Conductor;

    model HeatStream "Mass flow circuit with different temperatures"
      extends Interfaces.OnePort;

      parameter Physiolibrary.Types.SpecificHeatCapacity SpecificHeat
        "Of flow circuit medium";

      Physiolibrary.Types.RealIO.MassFlowRateInput substanceFlow
        "Flowing speed in circuit. Can not be negative!"
        annotation (Placement(transformation(extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,60})));
    equation
    //  assert(substanceFlow>=-Modelica.Constants.eps,"In HeatStream must be always the forward flow direction! Not 'substanceFlow<0'!");
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
              lineColor={0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio=false,
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
            transformation(extent={{-110,-10},{-90,10}})));
      parameter Physiolibrary.Types.SpecificEnergy VaporizationHeat=0
        "Used for whole outflow stream";                                            // or 2428344 for water vaporization
      parameter Physiolibrary.Types.SpecificHeatCapacity SpecificHeat=4186.8
        "Of outflowing medium";  //default heat capacity of water is 1 kcal/(degC.kg)

      Physiolibrary.Types.RealIO.MassFlowRateInput liquidOutflow_
        "Mass outflow. Can not be negative!"
        annotation (Placement(transformation(extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,60})));
    equation
    //  assert(liquidOutflow_>=-Modelica.Constants.eps,"HeatOutstream must have always one forward flow direction! Not 'liquidOutflow_<0'!");
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
              lineColor={0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio=false,
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
        annotation (Placement(transformation(extent={{-20,-20},{20,20}},
            rotation=270,
            origin={-80,70})));

      Physiolibrary.Thermal.Interfaces.PositiveHeatFlow
                       q_in annotation (Placement(
            transformation(extent={{-110,10},{-90,30}})));
      Physiolibrary.Thermal.Interfaces.NegativeHeatFlow
                       q_out annotation (Placement(
            transformation(extent={{-10,90},{10,110}})));
    equation
      q_in.Q_flow + q_out.Q_flow = 0;
    //  assert(substanceFlow>=-Modelica.Constants.eps,"In IdealRadiator must be always the forward flow direction! Not 'substanceFlow<0'!");
      q_in.Q_flow = substanceFlow*(q_in.T-q_out.T)*SpecificHeat;

     annotation (
        Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,
                100}}),     graphics={
            Text(
              extent={{-144,-142},{156,-102}},
              textString="%name",
              lineColor={0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio=false,
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

    model HeatAccumulation
      "Accumulating of heat to substance mass with specific heat constant"
      extends Icons.HeatAccumulation;
      extends Physiolibrary.SteadyStates.Interfaces.SteadyState(
                                         state_start=relativeHeat_start, storeUnit=
          "kcal");
      Interfaces.PositiveHeatFlow
                       q_in "Heat inflow/outflow connector"
        annotation (Placement(transformation(extent={{-10,-10},{10,10}})));

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

      constant Types.Temperature NormalBodyTemperature = 310.15
        "Shift of absolute zero temperature to normal body values";

      parameter Boolean useMassInput = false "=true, if mass input is used"
        annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

      parameter Types.Mass Weight=1 "Total mass weight if useMassInput=false"
        annotation (Dialog(enable=not useMassInput));
      Physiolibrary.Types.RealIO.MassInput weight(start=Weight)=m if useMassInput
        "Weight of mass, where the heat are accumulated"                            annotation (Placement(transformation(extent={{-120,60},
                {-80,100}})));
    protected
      Types.Mass m;

    equation
      if not useMassInput then
        m=Weight;
      end if;

      q_in.T=NormalBodyTemperature + relativeHeat/(m*SpecificHeat);
      T = q_in.T;

      state = relativeHeat;  // der(relativeHeat)=q_in.q
      change = q_in.Q_flow;
      annotation (Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),
         Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}),       graphics),
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                100}}),
             graphics={
            Text(
              extent={{-20,-140},{280,-100}},
              textString="%name",
              lineColor={0,0,255})}));
    end HeatAccumulation;

  end Components;

  package Sources
    extends Modelica.Icons.SourcesPackage;
    model UnlimitedHeat
      //extends Modelica.Thermal.HeatTransfer.Sources.FixedTemperature;

      parameter Types.Temperature T "Fixed temperature at port";

      parameter Physiolibrary.SteadyStates.Interfaces.SimulationType
                                                    Simulation=Physiolibrary.SteadyStates.Interfaces.SimulationType.NormalInit
        "If in equilibrium, then zero-flow equation is added."
        annotation (Dialog(group="Simulation",tab="Equilibrium"));

      Interfaces.NegativeHeatFlow port annotation (Placement(transformation(extent={{90,-10},
                {110,10}})));
    equation
      port.T = T;

      if Simulation==Physiolibrary.SteadyStates.Interfaces.SimulationType.SteadyState then
        port.Q_flow = 0;
      end if;

       annotation (
        Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,100}}),
                            graphics={
            Text(
              extent={{-150,150},{150,110}},
              textString="%name",
              lineColor={0,0,255}),
            Text(
              extent={{-150,-110},{150,-140}},
              lineColor={0,0,0},
              textString="T=%T"),
            Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,0},
              pattern=LinePattern.None,
              fillColor={159,159,223},
              fillPattern=FillPattern.Backward),
            Text(
              extent={{0,0},{-100,-100}},
              lineColor={0,0,0},
              textString="K"),
            Line(
              points={{-52,0},{56,0}},
              color={191,0,0},
              thickness=0.5),
            Polygon(
              points={{50,-20},{50,20},{90,0},{50,-20}},
              lineColor={191,0,0},
              fillColor={191,0,0},
              fillPattern=FillPattern.Solid)}),
        Documentation(info="<HTML>
<p>
This model defines a fixed temperature T at its port in Kelvin,
i.e., it defines a fixed temperature as a boundary condition.
</p>
</HTML>
"),     Diagram(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},
                {100,100}}),graphics));
    end UnlimitedHeat;
  end Sources;

  package Interfaces
    extends Modelica.Icons.InterfacesPackage;

    connector HeatFlowConnector =
                         Modelica.Thermal.HeatTransfer.Interfaces.HeatPort(T(displayUnit="degC"),Q_flow(displayUnit="kcal/min", nominal=4186.8/60));
    connector PositiveHeatFlow "Heat inflow"
      extends Interfaces.HeatFlowConnector;

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Rectangle(
              extent={{-20,10},{20,-10}},
              lineColor={191,0,0},
              lineThickness=1),       Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={191,0,0},
              fillColor={191,0,0},
              fillPattern=FillPattern.Solid)}),
        Diagram(graphics={
                      Rectangle(
              extent={{-40,40},{40,-40}},
              lineColor={191,0,0},
              fillColor={191,0,0},
              fillPattern=FillPattern.Solid),
       Text(extent={{-160,110},{40,50}},   lineColor = {191,0,0}, textString = "%name")}));
    end PositiveHeatFlow;

    connector NegativeHeatFlow "Heat outflow"
      extends Interfaces.HeatFlowConnector;

    annotation (
        defaultComponentName="q_out",
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Rectangle(
              extent={{-20,10},{20,-10}},
              lineColor={191,0,0},
              lineThickness=1),       Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={191,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
        Diagram(graphics={
                      Rectangle(
              extent={{-40,40},{40,-40}},
              lineColor={191,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
       Text(extent={{-160,110},{40,50}},   lineColor = {191,0,0}, textString = "%name")}));

    end NegativeHeatFlow;

    partial model OnePort "Heat one port"

      Interfaces.PositiveHeatFlow
                       q_in annotation (Placement(
            transformation(extent={{-110,-10},{-90,10}})));
      Interfaces.NegativeHeatFlow
                       q_out annotation (Placement(
            transformation(extent={{90,-10},{110,10}})));
    equation
      q_in.Q_flow + q_out.Q_flow = 0;
      annotation (Icon(graphics), Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics));
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

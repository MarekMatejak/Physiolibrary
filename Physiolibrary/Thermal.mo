within Physiolibrary;
package Thermal
  "Domain with Temperature and Heat Flow - extension of Modelica.Thermal.HeatTransfer"
 extends Modelica.Icons.Package;
  package Examples
    "Examples that demonstrate usage of the Pressure flow components"
  extends Modelica.Icons.ExamplesPackage;

    model SkinHeatFlow
    extends Modelica.Icons.Example;

      Components.IdealRadiator skinCirculation(MassFlow(displayUnit="g/min")=
          0.0028333333333333) "Blood flow through skin"
        annotation (Placement(transformation(extent={{16,-32},{36,-12}})));
      Sources.UnlimitedHeat bodyCore(T(displayUnit="degC") = 310.15)
        annotation (Placement(transformation(extent={{-20,-30},{0,-10}})));
      Sources.UnlimitedHeat skin(T(displayUnit="degC") = 301.15)
        annotation (Placement(transformation(extent={{-8,4},{12,24}})));
    equation
      connect(skinCirculation.q_in, bodyCore.port) annotation (Line(
          points={{16,-20},{0,-20}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(skin.port, skinCirculation.q_out) annotation (Line(
          points={{12,14},{26,14},{26,-12}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (        experiment(StopTime=10000, Tolerance=1e-006),
Documentation(revisions="<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end SkinHeatFlow;

    model MuscleHeat
    extends Modelica.Icons.Example;

      Components.HeatAccumulation
                       muscle(
        relativeHeat_start=52125.66,
        SpecificHeat=3475.044,
        Weight(displayUnit="kg") = 15)
        annotation (Placement(transformation(extent={{16,22},{36,42}})));
      Components.IdealRadiator
                    muscleCirculation(MassFlow(displayUnit="g/min") = 0.0114)
        "Blood circulation in skeletal muscle"
        annotation (Placement(transformation(extent={{16,-32},{36,-12}})));
      Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow generatedHeat(Q_flow=13.956)
        "Heat energy created by muscle"
        annotation (Placement(transformation(extent={{-32,20},{-12,40}})));
      Sources.UnlimitedHeat                                  body(T(displayUnit="degC")=
             310.15)
        annotation (Placement(transformation(extent={{-32,-30},{-12,-10}})));
    equation
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
          points={{26,32},{26,-12}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (        experiment(StopTime=10000, Tolerance=1e-006),
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
        annotation (Placement(transformation(extent={{-12,-4},{8,16}})));
      Physiolibrary.Thermal.Components.HeatAccumulation
                        GILumen(Weight=1)
        annotation (Placement(transformation(extent={{40,-52},{60,-32}})));
      Physiolibrary.Thermal.Components.HeatAccumulation
                        skeletalMuscle(SpecificHeat=3475.044, Weight=7.05)
        annotation (Placement(transformation(extent={{36,42},{56,62}})));
      Physiolibrary.Thermal.Components.IdealRadiator
                    muscleBloodFlow(
        MassFlow(displayUnit="g/min") = 0.0114,
        useMassFlowInput=false,
        SpecificHeat=3851.856)      annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            origin={32,30})));
      Physiolibrary.Thermal.Components.HeatOutstream
                    urination
        annotation (Placement(transformation(extent={{-28,-60},{-48,-40}})));
      Physiolibrary.Thermal.Components.HeatOutstream
                    lungsVapor(VaporizationHeat(displayUnit="kcal/g") = 2428344,
          SpecificHeat(displayUnit="kcal/(kg.K)"),
        MassFlow(displayUnit="g/min") = 4.6666666666667e-06)
        annotation (Placement(transformation(extent={{12,66},{32,86}})));
      Physiolibrary.Thermal.Components.HeatAccumulation
                        skin(
        relativeHeat_start=-8373.6,
        SpecificHeat=3475.044,
        Weight=0.56)
        annotation (Placement(transformation(extent={{-68,4},{-48,24}})));
      Physiolibrary.Thermal.Components.IdealRadiator
                    skinBloodFlow(
        MassFlow(displayUnit="g/min") = 0.0028333333333333,
        useMassFlowInput=false,
        SpecificHeat=3851.856)    annotation (Placement(transformation(
            extent={{10,-10},{-10,10}},
            origin={-28,2})));
      Physiolibrary.Thermal.Components.HeatOutstream
                    insensibleVapor(VaporizationHeat(displayUnit="kcal/g") = 2428344,
          SpecificHeat(displayUnit="kcal/(kg.K)"),
        MassFlow(displayUnit="g/min") = 6.5e-06)
        annotation (Placement(transformation(extent={{-48,32},{-28,52}})));
      Physiolibrary.Thermal.Components.HeatOutstream
                    sweating(VaporizationHeat(displayUnit="kcal/g") = 2428344,
          SpecificHeat(displayUnit="kcal/(kg.K)"))
        annotation (Placement(transformation(extent={{-44,58},{-24,78}})));
      Modelica.Thermal.HeatTransfer.Components.ThermalConductor lumenVolume(G(
            displayUnit="kcal/(min.K)") = 1)
        annotation (Placement(transformation(extent={{32,-60},{12,-40}})));
      Modelica.Thermal.HeatTransfer.Components.ThermalConductor air(G(
            displayUnit="kcal/(min.K)") = 2.4423)                   annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-76,50})));
      Physiolibrary.Thermal.Sources.UnlimitedHeat            ambient(T=295.15)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-76,84})));
      Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow skinMetabolicHeat(Q_flow=
            1.95384)
        annotation (Placement(transformation(extent={{-92,2},{-72,22}})));
      Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow coreMetabolicHeat(Q_flow=
            55.824)
        annotation (Placement(transformation(extent={{86,-6},{66,14}})));
      Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow muscleMetabolicHeat(Q_flow(
            displayUnit="kcal/min") = 9.7692)
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={78,60})));
      Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow foodHeatIntake(Q_flow=0)
                                                                     annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={78,-38})));
      Physiolibrary.Thermal.Components.Stream
                 foodAbsorption(SpecificHeat=4186.8)
        annotation (Placement(transformation(extent={{44,-32},{24,-12}})));
    equation

      connect(core.q_in, muscleBloodFlow.q_in) annotation (Line(
          points={{-2,6},{-2,32},{22,32}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(skeletalMuscle.q_in, muscleBloodFlow.q_out) annotation (Line(
          points={{46,52},{32,52},{32,40}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(core.q_in, urination.q_in) annotation (Line(
          points={{-2,6},{-6,6},{-6,-50},{-28,-50}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(core.q_in, lungsVapor.q_in) annotation (Line(
          points={{-2,6},{-2,76},{12,76}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(skinBloodFlow.q_in, lungsVapor.q_in) annotation (Line(
          points={{-18,4},{-2,4},{-2,76},{12,76}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(skin.q_in, skinBloodFlow.q_out) annotation (Line(
          points={{-58,14},{-28,14},{-28,12}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(skin.q_in, insensibleVapor.q_in) annotation (Line(
          points={{-58,14},{-58,42},{-48,42}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(sweating.q_in, insensibleVapor.q_in) annotation (Line(
          points={{-44,68},{-58,68},{-58,42},{-48,42}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(GILumen.q_in, lumenVolume.port_a) annotation (Line(
          points={{50,-42},{40,-42},{40,-50},{32,-50}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(core.q_in, lumenVolume.port_b) annotation (Line(
          points={{-2,6},{2,6},{2,-50},{12,-50}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(skin.q_in, air.port_b) annotation (Line(
          points={{-58,14},{-58,30},{-76,30},{-76,40}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(skin.q_in, skinMetabolicHeat.port)
                                              annotation (Line(
          points={{-58,14},{-66,14},{-66,12},{-72,12}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(GILumen.q_in, foodHeatIntake.port)
                                             annotation (Line(
          points={{50,-42},{60,-42},{60,-38},{68,-38}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(skeletalMuscle.q_in, muscleMetabolicHeat.port)
                                                          annotation (Line(
          points={{46,52},{58,52},{58,60},{68,60}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(core.q_in, coreMetabolicHeat.port)
                                              annotation (Line(
          points={{-2,6},{32,6},{32,4},{66,4}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(skinBloodFlow.q_in, core.q_in) annotation (Line(
          points={{-18,4},{-12,4},{-12,6},{-2,6}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(GILumen.q_in,foodAbsorption. q_in)
                                             annotation (Line(
          points={{50,-42},{50,-22},{44,-22}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(foodAbsorption.q_out, core.q_in)
                                           annotation (Line(
          points={{24,-22},{2,-22},{2,6},{-2,6}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(ambient.port, air.port_a) annotation (Line(
          points={{-76,74},{-76,60}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation ( Documentation(revisions="<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),
        experiment(StopTime=3600));
    end ThermalBody_QHP;

    model SkinHeatTransferOnBloodFlow
    extends Modelica.Icons.Example;

      Components.IdealRadiator skinCirculation(MassFlow(displayUnit="g/min")=
          0.0028333333333333) "Blood circulation through skin"
        annotation (Placement(transformation(extent={{16,-32},{36,-12}})));
      Sources.UnlimitedHeat                                  core(T(displayUnit="degC")=
             310.15)
        annotation (Placement(transformation(extent={{-32,-30},{-12,-10}})));
      Sources.UnlimitedHeat skin(T(displayUnit="degC") = 301.15)
        annotation (Placement(transformation(extent={{-12,2},{8,22}})));
    equation
      connect(skinCirculation.q_in, core.port) annotation (Line(
          points={{16,-20},{-12,-20}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(skin.port, skinCirculation.q_out) annotation (Line(
          points={{8,12},{26,12},{26,-12}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (        experiment(StopTime=10000, Tolerance=1e-006),
Documentation(revisions="<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end SkinHeatTransferOnBloodFlow;
  end Examples;

  package Components
    extends Modelica.Icons.Package;

    model IdealRadiator
      "Closed circiut radiator, where outflowed = ambient temperature"
      extends Interfaces.ConditionalMassFlow;
      extends Icons.Radiator;

      parameter Physiolibrary.Types.SpecificHeatCapacity SpecificHeat=3851.856
        "Specific heat of flow circuit medium";  //default heat capacity of blood is used as 0.92 kcal/(degC.kg)

      Physiolibrary.Thermal.Interfaces.HeatPort_a
                       q_in annotation (Placement(
            transformation(extent={{-110,10},{-90,30}})));
      Physiolibrary.Thermal.Interfaces.HeatPort_b
                       q_out annotation (Placement(
            transformation(extent={{-10,90},{10,110}})));
    equation
      q_in.Q_flow + q_out.Q_flow = 0;
    //  assert(substanceFlow>=-Modelica.Constants.eps,"In IdealRadiator must be always the forward flow direction! Not 'substanceFlow<0'!");
      q_in.Q_flow = q*(q_in.T-q_out.T)*SpecificHeat;

     annotation (
        Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,
                100}}),     graphics={
            Text(
              extent={{-144,-142},{156,-102}},
              textString="%name",
              lineColor={0,0,255})}),        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>",     info="<html>
<p>The real inflow to radiator can be described by substanceFlow and temperature q_in.T.</p>
<p><b>q_in.q=q_out.q is not the heat inflow to Radiator input</b>, but the heat convected from radiator to environment!</p>
<p>The environment temperature is the same as radiator output temperature q_out.T. </p>
<p>And the flow of heat from radiator to environment is driven by Fick principle.</p>
</html>"));
    end IdealRadiator;

    model HeatAccumulation "Accumulating of heat to substance"
      extends Icons.HeatAccumulation;
      extends Physiolibrary.SteadyStates.Interfaces.SteadyState(
                                         state_start=relativeHeat_start, storeUnit=
          "kcal");
      Interfaces.HeatPort_a
                       q_in "Heat inflow/outflow connector"
        annotation (Placement(transformation(extent={{-10,-10},{10,10}})));

      parameter Physiolibrary.Types.Heat relativeHeat_start = 0
        "Heat start value = weight*(initialTemperature - 37degC)*specificHeat"
         annotation (Dialog(group="Initialization"));

      parameter Physiolibrary.Types.SpecificHeatCapacity SpecificHeat= 4186.8
        "Mass specific heat";
      Physiolibrary.Types.Temperature T "Current temperature";

      Physiolibrary.Types.RealIO.HeatOutput relativeHeat
        "Current accumulated heat = weight*(T - 37degC)*specificHeat"
                                                                  annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,-100})));                                            //nominal=1
     //absoluteHeat =  weight*310.15*specificHeat + relativeHeat

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
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                100}}),
             graphics={
            Text(
              extent={{-20,-140},{280,-100}},
              textString="%name",
              lineColor={0,0,255})}));
    end HeatAccumulation;

    model Conductor "Heat resistor"
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

    protected
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
</html>"));
    end Conductor;

    model Stream "Flow of whole heated mass"
      extends Interfaces.OnePort;
      extends Interfaces.ConditionalMassFlow;

      parameter Physiolibrary.Types.SpecificHeatCapacity SpecificHeat
        "Of flow circuit medium";

    equation
      q_in.Q_flow = if (q>0) then q*q_in.T*SpecificHeat else q*q_out.T*SpecificHeat;

     annotation (
        Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{
                100,100}}), graphics={
            Rectangle(
              extent={{-100,-50},{100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-80,25},{80,0},{-80,-25},{-80,25}},
              lineColor={191,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{20,-84},{320,-44}},
              textString="%name",
              lineColor={0,0,255})}),        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>", info="<html>
<p><h4><font color=\"#008000\">Bidirectional heated mass flow by temperature</font></h4></p>
<p>Possible field values: </p>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"0.1\"><tr>
<td></td>
<td><p align=\"center\"><h4>forward flow</h4></p></td>
<td><p align=\"center\"><h4>backward flow</h4></p></td>
</tr>
<tr>
<td><p align=\"center\"><h4>massFlow</h4></p></td>
<td><p align=\"center\">&GT;=0</p></td>
<td><p align=\"center\">&LT;=0</p></td>
</tr>
<tr>
<td><p align=\"center\"><h4>q_in.q</h4></p></td>
<td><p align=\"center\">=massFlow*q_in.T*SpecificHeat</p></td>
<td><p align=\"center\">=-q_out.q</p></td>
</tr>
<tr>
<td><p align=\"center\"><h4>q_out.q</h4></p></td>
<td><p align=\"center\">=-q_in.q</p></td>
<td><p align=\"center\">=massFlow*q_out.T*SpecificHeat</p></td>
</tr>
</table>
<br/>
</html>"));
    end Stream;

    model HeatOutstream
      "One-directional outflow of heated mass (with effect of vaporization)"
      extends Interfaces.ConditionalMassFlow;

      Interfaces.HeatPort_a
                       q_in "flow circuit"     annotation (Placement(
            transformation(extent={{-110,-10},{-90,10}})));
      parameter Physiolibrary.Types.SpecificEnergy VaporizationHeat=0
        "Used for whole outflow stream";                                            // or 2428344 for water vaporization
      parameter Physiolibrary.Types.SpecificHeatCapacity SpecificHeat=4186.8
        "Of outflowing medium";  //default heat capacity of water is 1 kcal/(degC.kg)

    equation
    //  assert(liquidOutflow_>=-Modelica.Constants.eps,"HeatOutstream must have always one forward flow direction! Not 'liquidOutflow_<0'!");
      q_in.Q_flow = q*(q_in.T*SpecificHeat + VaporizationHeat);

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
              lineColor={191,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{20,-84},{320,-44}},
              textString="%name",
              lineColor={0,0,255})}),        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end HeatOutstream;

  end Components;

  package Sources
    extends Modelica.Icons.SourcesPackage;
    model UnlimitedHeat "Prescribed temperature"
      //extends Modelica.Thermal.HeatTransfer.Sources.FixedTemperature;
      import Physiolibrary.Types.*;

      parameter Boolean useTemperatureInput = false
        "=true, if fixed temperature is from input instead of parameter"
      annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

       parameter Temperature T = 0
        "Fixed temperature at port if useTemperatureInput=false"
        annotation (Dialog(enable=not useTemperatureInput));

      parameter Boolean isIsolatedInSteadyState = false
        "=true, if there is no flow at port in steady state"
        annotation (Dialog(group="Simulation",tab="Equilibrium"));

      parameter SimulationType  Simulation=SimulationType.NormalInit
        "If in equilibrium, then zero-flow equation is added."
        annotation (Dialog(group="Simulation",tab="Equilibrium"));

      Interfaces.HeatPort_b       port annotation (Placement(transformation(extent={{90,-10},
                {110,10}})));

    protected
      Temperature t "Current temperature";
    public
      Types.RealIO.TemperatureInput temperature(start=T)= t if useTemperatureInput
        annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));

    initial equation
      if isIsolatedInSteadyState and (Simulation==SimulationType.InitSteadyState) then
        port.Q_flow = 0;
      end if;

    equation
      if not useTemperatureInput then
        t=T;
      end if;

      port.T = t;

      if isIsolatedInSteadyState and (Simulation==SimulationType.SteadyState) then
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
", revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end UnlimitedHeat;
  end Sources;

  package Interfaces
    extends Modelica.Icons.InterfacesPackage;

    connector HeatPort = Modelica.Thermal.HeatTransfer.Interfaces.HeatPort(T(displayUnit="degC"),Q_flow(displayUnit="kcal/min", nominal=4186.8/60));
    connector HeatPort_a "Heat inflow"
      extends HeatPort;

      annotation (
        defaultComponentName="port_a",
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
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
       Text(extent={{-160,110},{40,50}},   lineColor=  {191,0,0}, textString=  "%name")}));
    end HeatPort_a;

    connector HeatPort_b "Heat outflow"
      extends HeatPort;

    annotation (
        defaultComponentName="port_b",
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
       Text(extent={{-160,110},{40,50}},   lineColor=  {191,0,0}, textString=  "%name")}));

    end HeatPort_b;

    partial model OnePort "Heat OnePort"

      HeatPort_a       q_in annotation (Placement(
            transformation(extent={{-110,-10},{-90,10}})));
      HeatPort_b       q_out annotation (Placement(
            transformation(extent={{90,-10},{110,10}})));
    equation
      q_in.Q_flow + q_out.Q_flow = 0;
      annotation ( Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end OnePort;

    partial model ConditionalMassFlow
      "Input of mass flow vs. parametric mass flow"

      parameter Boolean useMassFlowInput = false
        "=true, if mass flow input is used instead of parameter MassFlow"
      annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

      parameter Physiolibrary.Types.MassFlowRate MassFlow=0
        "Mass flow if useMassFlowInput=false"
        annotation (Dialog(enable=not useSolventFlowInput));

      Physiolibrary.Types.RealIO.MassFlowRateInput massFlow(start=MassFlow)=q if useMassFlowInput annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={-80,70})));

      Physiolibrary.Types.MassFlowRate q "Current mass flow";
    equation
      if not useMassFlowInput then
        q = MassFlow;
      end if;

    end ConditionalMassFlow;
  end Interfaces;
  annotation (Documentation(revisions="<html>
<p>Licensed by Marek Matejak under the Modelica License 2</p>
<p>Copyright &copy; 2008-2014, Marek Matejak, Charles University in Prague.</p>
<p><br><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Physiolibrary.UsersGuide.ModelicaLicense2\">Physiolibrary.UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p>
</html>", info="<html>
<p>For the human body to function optimally, it is critical to hold the core temperature at 35&ndash;39&deg;C. A fever of 41&deg;C for more than a short period of time causes brain damage. If the core temperature falls below 10&deg;C, the heart stops. As in the hydraulic domain, the thermal domain is simplified to these conditions. </p>
<p>In the Physiolibrary.Thermal package extends the package Modelica.Thermal.HeatTransfer from Modelica Standard Library 3.2 (MSL), where the connector is composed of temperature and heat flow. The main blocks in Physiolibrary.Thermal are: Conductor, IdealRadiator and HeatAccumulation. The heat conductor conducts the heat from the source, such us muscles or metabolically active tissue, to its surrounding. IdealRadiator delivers heat to tissues by blood circulation. HeatAccumulation plays a role in accumulating thermal energy in each tissue mass driven by its heat capacity. We recommend to use this block instead of Modelica.Thermal.HeatTransfer.HeatCapacitor to have possibility of variable mass amount or to have a support for calculation of steady state. </p>
</html>"));
end Thermal;

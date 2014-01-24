within Physiolibrary;
package Osmotic "Osmorarity and Solvent Volumetric Flow"
 extends Modelica.Icons.Package;
  package Examples
    "Examples that demonstrate usage of the Osmotic flow components"
  extends Modelica.Icons.ExamplesPackage;

    model Cell
    extends Modelica.Icons.Example;

      Components.OsmoticCell
                  cells(volume_start(displayUnit="l") = 0.001,
          ImpermeableSolutes=0.285)
        annotation (Placement(transformation(extent={{-44,36},{-24,56}})));
      Components.OsmoticCell
                  interstitium(volume_start(displayUnit="l") = 0.001,
          ImpermeableSolutes=0.28)
        annotation (Placement(transformation(extent={{34,36},{54,56}})));
      Components.Membrane
               membrane(cond=1.2501026264094e-10)
        annotation (Placement(transformation(extent={{-4,36},{16,56}})));
      Components.OsmoticCell
                  cells1(volume_start(displayUnit="l") = 0.001,
          ImpermeableSolutes=0.285)
        annotation (Placement(transformation(extent={{-38,-76},{-18,-56}})));
      Components.OsmoticCell
                  interstitium1(volume_start(displayUnit="l") = 0.001,
          ImpermeableSolutes=0.29)
        annotation (Placement(transformation(extent={{34,-76},{54,-56}})));
      Components.Membrane
               membrane1(cond=1.2501026264094e-10)
        annotation (Placement(transformation(extent={{-2,-76},{18,-56}})));
    equation
      connect(cells.q_in, membrane.q_in) annotation (Line(
          points={{-34,46},{-4,46}},
          color={127,127,0},
          thickness=1,
          smooth=Smooth.None));
      connect(membrane.q_out, interstitium.q_in) annotation (Line(
          points={{16,46},{44,46}},
          color={127,127,0},
          thickness=1,
          smooth=Smooth.None));
      connect(cells1.q_in, membrane1.q_in) annotation (Line(
          points={{-28,-66},{-2,-66}},
          color={127,127,0},
          thickness=1,
          smooth=Smooth.None));
      connect(membrane1.q_out, interstitium1.q_in) annotation (Line(
          points={{18,-66},{44,-66}},
          color={127,127,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),      graphics={
            Text(
              extent={{-54,96},{40,88}},
              lineColor={135,135,135},
              textString="Cells in hypotonic environment"),
            Text(
              extent={{-52,-22},{42,-30}},
              lineColor={95,95,95},
              textString="Cells in hypertonic environment"),
            Line(
              points={{-98,8},{98,8}},
              color={135,135,135},
              smooth=Smooth.None,
              thickness=1)}),
        experiment(StopTime=60),
        __Dymola_experimentSetupOutput,
        Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end Cell;
  end Examples;

  package Components
    extends Modelica.Icons.Package;
    model OsmoticCell "Solvent container"
      extends Icons.OsmoticCell;
      extends Physiolibrary.SteadyStates.Interfaces.SteadyState(
                                         state_start=volume_start, storeUnit=
          "mOsm/l");

      Interfaces.PositiveOsmoticFlow
                          q_in "Flux to/from osmotic compartment" annotation (Placement(
            transformation(extent={{-10,-10},{10,10}})));
      parameter Physiolibrary.Types.Volume volume_start = 0.001
        "Initial volume of compartment"
         annotation (Dialog(group="Initialization"));

      parameter Boolean useImpermeableSolutesInput = false
        "=true, if impermeable substance amount as an input"
        annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

      parameter Types.AmountOfSubstance ImpermeableSolutes=0
        "Amount of impermeable substance if useImpermeableSolutesInput=false"
        annotation (Dialog(enable=not useImpermeableSolutesInput));

      Physiolibrary.Types.RealIO.AmountOfSubstanceInput impermeableSolutes(start=ImpermeableSolutes)= is if useImpermeableSolutesInput
        "Amount of impermeable solutes in compartment"                                                                                    annotation (Placement(transformation(extent={{-100,40},
                {-60,80}})));
      Physiolibrary.Types.RealIO.VolumeOutput volume
        "Actual volume of compartment"
        annotation (Placement(transformation(extent={{-20,-120},{20,-80}}, rotation=
               -90)));
    protected
      Types.AmountOfSubstance is "Current amount of impermeable solutes";
    equation
      if not useImpermeableSolutesInput then
        is=ImpermeableSolutes;
      end if;

      q_in.o = is / volume;

      change = q_in.q;    //der(volume)=q_in.q
      state = volume;
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false,extent={{-100,
                -100},{100,100}}), graphics), Icon(coordinateSystem(
              preserveAspectRatio=false,extent={{-100,-100},{100,100}}),
                                                   graphics={
                                   Text(
              extent={{-40,-138},{280,-100}},
              textString="%name",
              lineColor={0,0,255})}),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end OsmoticCell;

    model Membrane "Solvent diffusion on semipermeable membrane"
     extends Interfaces.OnePort;
     extends Icons.Membrane; //Icons.Resistor;

     parameter Physiolibrary.Types.OsmoticPermeability cond
        "Membrane permeability for solvent";

      parameter Boolean useHydraulicPressureInputs = false
        "=true, if hydraulic pressure inputs is used"
        annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

      parameter Types.Pressure HydraulicPressureIn=0
        "Hydraulic pressure inside if useHydraulicPressureInputs=false"
        annotation (Dialog(enable=not useHydraulicPressureInputs));
      parameter Types.Pressure HydraulicPressureOut=0
        "Hydraulic pressure outside if useHydraulicPressureInputs=false"
        annotation (Dialog(enable=not useHydraulicPressureInputs));

      Types.RealIO.PressureInput hydraulicPressureIn(start=HydraulicPressureIn)=pi if useHydraulicPressureInputs annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={-80,80})));
      Types.RealIO.PressureInput hydraulicPressureOut(start=HydraulicPressureOut)=po if useHydraulicPressureInputs annotation (Placement(
            transformation(extent={{-20,-20},{20,20}},
            rotation=270,
            origin={80,80})));

      parameter Boolean useTemperatureInputs = false
        "=true, if temperature on both sides is used"
        annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

      parameter Types.Temperature T=310.15
        "Temperature on both membrane sides if  useTemperatureInputs=false"
        annotation (Dialog(enable=not  useTemperatureInputs));

      Types.RealIO.TemperatureInput temperatureIn(start=T)=ti if useTemperatureInputs annotation (Placement(
            transformation(extent={{-20,-20},{20,20}},
            rotation=90,
            origin={-80,-80})));
      Types.RealIO.TemperatureInput temperatureOut(start=T)=to if useTemperatureInputs annotation (Placement(
            transformation(extent={{-20,-20},{20,20}},
            rotation=90,
            origin={80,-80})));

    protected
      Types.Pressure pi,po;
      Types.Temperature ti,to;
    equation
      if not useHydraulicPressureInputs then
        pi=HydraulicPressureIn;
        po=HydraulicPressureOut;
      end if;
      if not useTemperatureInputs then
        ti=T;
        to=T;
      end if;

      q_in.q = cond * ( (po + q_out.o*(Modelica.Constants.R*to)) - (pi + q_in.o*(Modelica.Constants.R*ti)));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),
                          graphics), Icon(coordinateSystem(preserveAspectRatio=false,
              extent={{-100,-100},{100,100}}),
                                          graphics),
        Documentation(revisions="<html>
<p><i>2009-2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end Membrane;

    model SolventFlux "Prescripted flow of solvent"
      extends Interfaces.OnePort;
      extends Chemical.Interfaces.ConditionalSolutionFlow;

    equation
      q_in.q = q;

     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={
            Text(
              extent={{-100,-80},{100,-54}},
              textString="%name",
              lineColor={0,0,255}),
            Rectangle(
              extent={{-100,-50},{100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-78,25},{82,0},{-78,-25},{-78,25}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid)}),
                                      Diagram(coordinateSystem(preserveAspectRatio=false,
                       extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics));
    end SolventFlux;
  end Components;

  package Sensors
    extends Modelica.Icons.SensorsPackage;
    model FlowMeasure "Measurement of flux through semipermeable membrane"
      extends Interfaces.OnePort;
      extends Icons.FlowMeasure;

      Physiolibrary.Types.RealIO.VolumeFlowRateOutput actualFlow
        "Flux through membrane"
        annotation (Placement(transformation(extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,-60})));
    equation
      q_out.o = q_in.o;

      actualFlow = q_in.q;

     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
                            graphics),Diagram(coordinateSystem(preserveAspectRatio=false,
                       extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end FlowMeasure;
  end Sensors;

  package Sources
    extends Modelica.Icons.SourcesPackage;
    model SolventInflux "Permeable solution inflow to the system"
      extends Chemical.Interfaces.ConditionalSolutionFlow;

      Interfaces.NegativeOsmoticFlow
                          q_out
                             annotation (Placement(
            transformation(extent={{50,-10},{70,10}})));

    equation
      q_out.q = - q;

     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
                            graphics={
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
              extent={{-92,-58},{80,-34}},
              textString="%name",
              lineColor={0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio=false,
                       extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics));
    end SolventInflux;

    model SolventOutflux "Permeable solution outflow from the system"
     extends Chemical.Interfaces.ConditionalSolutionFlow;
      Interfaces.PositiveOsmoticFlow
                          q_in
                             annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{-70,-10},{-50,10}})));
    equation
      q_in.q = q;

     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={
            Rectangle(
              extent={{-60,-32},{60,30}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-48,18},{50,-2},{-48,-26},{-48,18}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-78,-58},{72,-36}},
              textString="%name",
              lineColor={0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio=false,
                       extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics));
    end SolventOutflux;

    model UnlimitedSolution
      //extends Modelica.Thermal.HeatTransfer.Sources.FixedTemperature;
      import Physiolibrary.Types.*;

      parameter Boolean useOsmolarityInput = false
        "=true, if fixed osmolarity at port is from input instead of parameter"
      annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

       parameter Physiolibrary.Types.Osmolarity Osm = 0
        "Fixed osmolarity at port if useOsmolarityInput=false"
        annotation (Dialog(enable=not useOsmolarityInput));

      parameter SimulationType  Simulation=SimulationType.NormalInit
        "If in equilibrium, then zero-flow equation is added."
        annotation (Dialog(group="Simulation",tab="Equilibrium"));

      Interfaces.NegativeOsmoticFlow
                                  port annotation (Placement(transformation(extent={{90,-10},
                {110,10}})));

    protected
      Physiolibrary.Types.Osmolarity o "Current osmolarity";
    public
      Types.RealIO.TemperatureInput osmolarity(start=Osmolarity)=o if
                                                               useOsmolarityInput
        annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));
    equation
      if not useOsmolarityInput then
        o=Osm;
      end if;

      port.o = o;

      if Simulation==SimulationType.SteadyState or (initial() and Simulation==SimulationType.InitSteadyState) then
        port.q = 0;
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
              fillColor={127,127,0},
              fillPattern=FillPattern.Backward),
            Text(
              extent={{38,-34},{-100,-100}},
              lineColor={0,0,0},
              textString="Osm"),
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
"),     Diagram(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,
                100}}),     graphics));
    end UnlimitedSolution;
  end Sources;

  package Interfaces
    extends Modelica.Icons.InterfacesPackage;

     connector OsmoticFlowConnector
      "Flux through semipermeable membrane by osmotic pressure gradient"
      Physiolibrary.Types.Concentration o
        "Osmolarity is the molar concentration of the impermeable solutes";
      flow Physiolibrary.Types.VolumeFlowRate q
        "The flux of the permeable solvent (!not the impermeable solutes!)";
      annotation (Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
     end OsmoticFlowConnector;

    connector PositiveOsmoticFlow "Influx"
      extends Interfaces.OsmoticFlowConnector;

    annotation (
        defaultComponentName="q_in",
        Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,
                100}}),     graphics={Rectangle(
              extent={{-20,10},{20,-10}},
              lineColor={127,127,0},
              lineThickness=1),       Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={127,127,0},
              fillColor={127,127,0},
              fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}),
            graphics={Rectangle(
              extent={{-40,40},{40,-40}},
              lineColor={127,127,0},
              fillColor={127,127,0},
              fillPattern=FillPattern.Solid),
        Text(extent = {{-160,110},{40,50}}, lineColor = {127,127,0}, textString = "%name")}),
        Documentation(info="<html>
<p>
Connector with one flow signal of type Real.
</p>
</html>",
        revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));

    end PositiveOsmoticFlow;

    connector NegativeOsmoticFlow "Outflux"
      extends Interfaces.OsmoticFlowConnector;

    annotation (
        defaultComponentName="q_out",
        Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,
                100}}),     graphics={Rectangle(
              extent={{-20,10},{20,-10}},
              lineColor={127,127,0},
              lineThickness=1),       Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={127,127,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}),
            graphics={Rectangle(
              extent={{-40,40},{40,-40}},
              lineColor={127,127,0},
             fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
        Text(extent = {{-160,110},{40,50}}, lineColor = {127,127,0}, textString = "%name")}),
        Documentation(info="<html>
<p>
Connector with one flow signal of type Real.
</p>
</html>",
        revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));

    end NegativeOsmoticFlow;

    partial model OnePort "Osmotic one port"

     Interfaces.PositiveOsmoticFlow
                         q_in "Forward flux through membrane"
                            annotation (Placement(
            transformation(extent={{-110,-10},{-90,10}})));
      Interfaces.NegativeOsmoticFlow
                          q_out "Backward flux through membrane"
                             annotation (Placement(
            transformation(extent={{90,-10},{110,10}})));
    equation
      q_in.q + q_out.q = 0;
      annotation (Icon(graphics), Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end OnePort;

    partial model ConditionalSolventFlow
      "Input of solvent volumetric flow vs. parametric solvent volumetric flow"

      parameter Boolean useSolventFlowInput = false
        "=true, if solvent flow input is used instead of parameter SolventFlow"
      annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

      parameter Physiolibrary.Types.VolumeFlowRate SolventFlow=0
        "Volumetric flow of solvent if useSolventFlowInput=false"
        annotation (Dialog(enable=not useSolventFlowInput));

      Physiolibrary.Types.RealIO.VolumeFlowRateInput solventFlow(start=SolventFlow)=q if useSolventFlowInput annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,40})));

      Physiolibrary.Types.VolumeFlowRate q "Current solvent flow";
    equation
      if not useSolventFlowInput then
        q = SolventFlow;
      end if;

      annotation (Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},
                {100,100}}),                                                                       graphics),
                 Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
    end ConditionalSolventFlow;
  end Interfaces;
  annotation (Documentation(revisions="<html>
<p>Licensed by Marek Matejak under the Modelica License 2</p>
<p>Copyright &copy; 2008-2013, Marek Matejak, Charles University in Prague.</p>
<p><br/><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Physiolibrary.UsersGuide.ModelicaLicense2\">Physiolibrary.UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p>
</html>", info="<html>
<p>One of the basic phenomenon of biological systems is the osmotically-driven flow of water. This is always connected with semipermeable membranes. The different concentrations of impermeable solutes on both sides of the membrane causes the pressure at the concentrated side to rise. This pressure difference is called osmotic pressure. Osmotic pressure is linearly proportional to the concentration gradient of impermeable solutes. The osmolarity (osmotic concentration) is also one of the main indexes of human body balance, called homeostasis. Its value should not significantly deviate for a long period of time from a value of 285-295 mOsm/l. In Physiolibrary the osmotic connector OsmoticFlowConnector is composed of the osmotic concentration and the volumetric flux of permeable liquid. The two main blocks are called Membrane and OsmoticCell. Here, inside the membrane blocks, it is of course possible to also define hydraulic pressure and temperatures effects on both sides of membrane.</p>
</html>"));
end Osmotic;

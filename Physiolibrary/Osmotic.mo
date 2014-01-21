within Physiolibrary;
package Osmotic "Osmorarity and Solvent Volumetric Flow"
 extends Modelica.Icons.Package;
  package Examples
    "Examples that demonstrate usage of the Osmotic flow components"
  extends Modelica.Icons.ExamplesPackage;

    model Cell
    extends Modelica.Icons.Example;
    //extends States.StateSystem; //(Simulation=States.SimulationType.Equilibrated);

      Components.OsmoticCell
                  cells(volume_start(displayUnit="l") = 0.01)
        annotation (Placement(transformation(extent={{-44,36},{-24,56}})));
      Components.OsmoticCell
                  interstitium(volume_start(displayUnit="l") = 0.005)
        annotation (Placement(transformation(extent={{34,36},{54,56}})));
      Components.Membrane
               membrane(cond=1.2501026264094e-10)
        annotation (Placement(transformation(extent={{-4,36},{16,56}})));
      Components.OsmoticCell
                  cells1(volume_start(displayUnit="l") = 0.01)
        annotation (Placement(transformation(extent={{-54,-76},{-34,-56}})));
      Components.OsmoticCell
                  interstitium1(volume_start(displayUnit="l") = 0.005)
        annotation (Placement(transformation(extent={{52,-76},{72,-56}})));
      Components.Membrane
               membrane1(cond=1.2501026264094e-10)
        annotation (Placement(transformation(extent={{-2,-76},{18,-56}})));
      Types.Constants.AmountOfSubstanceConst cellularProteins(k=0.285)
        annotation (Placement(transformation(extent={{-62,68},{-54,76}})));
      Types.Constants.AmountOfSubstanceConst interstitialProteins(k=0.28)
        annotation (Placement(transformation(extent={{16,68},{24,76}})));
      Types.Constants.AmountOfSubstanceConst cellularProteins1(k=0.285)
        annotation (Placement(transformation(extent={{-72,-48},{-64,-40}})));
      Types.Constants.AmountOfSubstanceConst interstitialProteins1(k=0.29)
        annotation (Placement(transformation(extent={{30,-50},{38,-42}})));
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
          points={{-44,-66},{-2,-66}},
          color={127,127,0},
          thickness=1,
          smooth=Smooth.None));
      connect(membrane1.q_out, interstitium1.q_in) annotation (Line(
          points={{18,-66},{62,-66}},
          color={127,127,0},
          thickness=1,
          smooth=Smooth.None));
      connect(cellularProteins.y, cells.impermeableSolutes) annotation (Line(
          points={{-53,72},{-48,72},{-48,52},{-42,52}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(interstitialProteins.y, interstitium.impermeableSolutes)
        annotation (Line(
          points={{25,72},{30,72},{30,52},{36,52}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(cellularProteins1.y, cells1.impermeableSolutes) annotation (Line(
          points={{-63,-44},{-58,-44},{-58,-60},{-52,-60}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(interstitialProteins1.y, interstitium1.impermeableSolutes)
        annotation (Line(
          points={{39,-46},{46,-46},{46,-60},{54,-60}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),      graphics),
        experiment(StopTime=900),
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
      extends Physiolibrary.States.State(state_start=volume_start, storeUnit=
          "mOsm/l");

      Interfaces.PositiveOsmoticFlow
                          q_in "Flux to/from osmotic compartment" annotation (Placement(
            transformation(extent={{62,-32},{102,8}}),  iconTransformation(extent={{-10,-10},
                {10,10}})));
      parameter Physiolibrary.Types.Volume volume_start
        "Initial volume of compartment"
         annotation (Dialog(group="Initialization"));

      Physiolibrary.Types.RealIO.AmountOfSubstanceInput impermeableSolutes
        "Amount of impermeable solutes in compartment"                                                                                    annotation (Placement(transformation(extent={{-100,40},
                {-60,80}}),
            iconTransformation(extent={{-100,40},{-60,80}})));
      Physiolibrary.Types.RealIO.VolumeOutput volume
        "Actual volume of compartment"
        annotation (Placement(transformation(extent={{-20,-120},{20,-80}}, rotation=
               -90)));

    equation
      q_in.o = impermeableSolutes / volume;

      change = q_in.q;    //der(volume)=q_in.q
      state = volume;
      annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
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
            rotation=0,
            origin={-80,78}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={-80,80})));
      Types.RealIO.PressureInput hydraulicPressureOut(start=HydraulicPressureOut)=po if useHydraulicPressureInputs annotation (Placement(
            transformation(extent={{28,56},{68,96}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={80,80})));

      parameter Boolean useTemperatureInputs = false
        "=true, if temperature on both sides is used"
        annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

      parameter Types.Temperature T=310.15
        "Temperature on both membrane sides if  useTemperatureInputs=false"
        annotation (Dialog(enable=not  useTemperatureInputs));

      Types.RealIO.TemperatureInput temperatureIn(start=T)=ti if useTemperatureInputs annotation (Placement(
            transformation(extent={{-100,-80},{-60,-40}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={-80,-80})));
      Types.RealIO.TemperatureInput temperatureOut(start=T)=to if useTemperatureInputs annotation (Placement(
            transformation(extent={{32,-80},{72,-40}}),    iconTransformation(
            extent={{-20,-20},{20,20}},
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

      Physiolibrary.Types.RealIO.VolumeFlowRateInput desiredFlow
        "Permeable solution flow through membrane"
                                     annotation (Placement(transformation(extent={{-20,20},{20,60}}),
            iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,40})));

    equation
      q_in.q = desiredFlow;

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
                                      Diagram(coordinateSystem(preserveAspectRatio=true,
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
        annotation (Placement(transformation(extent={{-54,60},{-34,80}}),
            iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={0,66})));
    equation
      q_out.o = q_in.o;

      actualFlow = q_in.q;

     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
                            graphics),Diagram(coordinateSystem(preserveAspectRatio=true,
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

      Interfaces.NegativeOsmoticFlow
                          q_out
                             annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{90,-10},{110,10}}), iconTransformation(extent={
                {50,-10},{70,10}})));

      Physiolibrary.Types.RealIO.VolumeFlowRateInput desiredFlow
        "Permeable solution inflow"
        annotation (Placement(transformation(extent={{-20,20},{20,60}}),
            iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,40})));
    equation
      q_out.q = - desiredFlow;

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
              extent={{-92,-54},{80,-30}},
              textString="%name",
              lineColor={0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio=true,
                       extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics));
    end SolventInflux;

    model SolventOutflux "Permeable solution outflow from the system"

      Interfaces.PositiveOsmoticFlow
                          q_in
                             annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{-110,-8},{-90,12}}), iconTransformation(extent={{-70,-10},
                {-50,10}})));
       Physiolibrary.Types.RealIO.VolumeFlowRateInput desiredFlow
        "Permeable solution outflow"
        annotation (Placement(transformation(extent={{-20,20},{20,60}}),
            iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,40})));
    equation
      q_in.q = desiredFlow;

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
              extent={{-78,-54},{72,-32}},
              textString="%name",
              lineColor={0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio=true,
                       extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics));
    end SolventOutflux;
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
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Rectangle(
              extent={{-20,10},{20,-10}},
              lineColor={127,127,0},
              lineThickness=1),       Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={127,127,0},
              fillColor={127,127,0},
              fillPattern=FillPattern.Solid)}),
        Diagram(Polygon(points=[-21,-3; 5,23; 31,-3; 5,-29; -21,-3],   style(
              color=74,
              rgbcolor={0,0,0},
              fillColor=0,
              rgbfillColor={0,0,0})), Text(
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

    end PositiveOsmoticFlow;

    connector NegativeOsmoticFlow "Outflux"
      extends Interfaces.OsmoticFlowConnector;

    annotation (
        defaultComponentName="q_out",
        Icon(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=false),
            graphics={Rectangle(
              extent={{-20,10},{20,-10}},
              lineColor={127,127,0},
              lineThickness=1),       Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={127,127,0},
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

    end NegativeOsmoticFlow;

    partial model OnePort "Osmotic one port"

     Interfaces.PositiveOsmoticFlow
                         q_in "Forward flux through membrane"
                            annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{-110,-10},{-90,10}})));
      Interfaces.NegativeOsmoticFlow
                          q_out "Backward flux through membrane"
                             annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{90,-10},{110,10}})));
    equation
      q_in.q + q_out.q = 0;
      annotation (Icon(graphics), Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),        Icon(graphics), Documentation(revisions="<html>
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
<p>One of the basic phenomenon of biological systems is the osmotically-driven flow of water. This is always connected with semipermeable membranes. The different concentrations of impermeable solutes on both sides of the membrane causes the pressure at the concentrated side to rise. This pressure difference is called osmotic pressure. Osmotic pressure is linearly proportional to the concentration gradient of impermeable solutes. The osmolarity (osmotic concentration) is also one of the main indexes of human body balance, called homeostasis. Its value should not significantly deviate for a long period of time from a value of 285-295 mOsm/l. In Physiolibrary the osmotic connector OsmoticFlowConnector is composed of the osmotic concentration and the volumetric flux of permeable liquid. The two main blocks are called Membrane and OsmoticCell. Here, inside the membrane blocks, it is of course possible to also define hydraulic pressure and temperatures effects on both sides of membrane.</p>
</html>"));
end Osmotic;

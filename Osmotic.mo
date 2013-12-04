within Physiolibrary2013;
package Osmotic "Osmotic Physical Domain"

   connector OsmoticFlowConnector
    "Flux throught semipermeable membrane by osmotic pressure gradient"
    Physiolibrary2013.Types.Concentration
                       o
      "Osmolarity is the molar concentration of the impermeable solutes";
    flow Physiolibrary2013.Types.VolumeFlowRate
                             q
      "The flux of the permeable solvent (!not the impermeable solutes!)";
    annotation (Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
   end OsmoticFlowConnector;

  connector PositiveOsmoticFlow "Influx"
    extends Osmotic.OsmoticFlowConnector;

  annotation (
      defaultComponentName="q_in",
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
              100,100}}), graphics={Rectangle(
            extent={{-20,10},{20,-10}},
            lineColor={127,127,0},
            lineThickness=1), Polygon(
            points={{0,100},{100,0},{0,-100},{-100,0},{0,100}},
            lineColor={0,0,0},
            smooth=Smooth.None,
            fillPattern=FillPattern.Solid,
            fillColor={127,127,0})}),
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
    extends Osmotic.OsmoticFlowConnector;

  annotation (
      defaultComponentName="q_out",
      Icon(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=false),
          graphics={Rectangle(
            extent={{-20,10},{20,-10}},
            lineColor={127,127,0},
            lineThickness=1), Polygon(
            points={{-100,0},{0,100},{100,0},{0,-100},{-100,0}},
            smooth=Smooth.None,
            fillPattern=FillPattern.Solid,
            fillColor={225,235,129},
            pattern=LinePattern.None)}),
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

   PositiveOsmoticFlow q_in "Forward flux through membrane"
                          annotation (extent=[-10, -110; 10, -90], Placement(
          transformation(extent={{-110,-10},{-90,10}})));
    NegativeOsmoticFlow q_out "Backward flux through membrane"
                           annotation (extent=[-10, -110; 10, -90], Placement(
          transformation(extent={{90,-10},{110,10}})));
  equation
    q_in.q + q_out.q = 0;
    annotation (Icon(graphics), Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),      Icon(graphics), Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
  end OnePort;

  model FlowMeasure "Measurement of flux through semipermeable membrane"
    extends Osmotic.OnePort;
    extends Icons.FlowMeasure;

    Physiolibrary2013.Types.RealIO.VolumeFlowRateOutput
                                           actualFlow "Flux through membrane"
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

  model Membrane "Semipermeable membrane diffusion"
   extends Osmotic.OnePort;
   extends Icons.Resistor;
   parameter Physiolibrary2013.Types.OsmoticMembranePermeability
                                                    cond
      "Membrane permeability for solvent";
  equation
    q_in.q = cond * (q_out.o - q_in.o);
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}),
                        graphics), Icon(graphics={Text(
            extent={{-70,-30},{70,30}},
            lineColor={0,0,0},
            textString="%cond"), Text(
            extent={{-134,-90},{154,-30}},
            textString="%name",
            lineColor={0,0,255})}),
      Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
  end Membrane;

  model SolventInflux "Permeable solution inflow to the system"

    NegativeOsmoticFlow q_out
                           annotation (extent=[-10, -110; 10, -90], Placement(
          transformation(extent={{90,-10},{110,10}}), iconTransformation(extent={
              {50,-10},{70,10}})));

    Physiolibrary2013.Types.RealIO.VolumeFlowRateInput
                                          desiredFlow
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
</html>"),      Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
              -100},{100,100}}), graphics));
  end SolventInflux;

  model SolventOutflux "Permeable solution outflow from the system"

    PositiveOsmoticFlow q_in
                           annotation (extent=[-10, -110; 10, -90], Placement(
          transformation(extent={{-110,-8},{-90,12}}), iconTransformation(extent={{-70,-10},
              {-50,10}})));
     Physiolibrary2013.Types.RealIO.VolumeFlowRateInput
                                           desiredFlow
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
</html>"),      Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
              -100},{100,100}}), graphics));
  end SolventOutflux;

  model SolventFlux
    extends OnePort;

    Physiolibrary2013.Types.RealIO.VolumeFlowRateInput
                                          desiredFlow
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
</html>"),      Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
              -100},{100,100}}), graphics));
  end SolventFlux;

  model OsmoticCell
    extends Physiolibrary2013.States.State(
                            state_start=volume_start,storeUnit="mOsm/l");

    PositiveOsmoticFlow q_in "Flux to/from osmotic compartment" annotation (Placement(
          transformation(extent={{62,-32},{102,8}}),  iconTransformation(extent={{-10,-10},
              {10,10}})));
    parameter Physiolibrary2013.Types.Volume
                          volume_start "Initial volume of compartment"
       annotation (Dialog(group="Initialization"));

    Physiolibrary2013.Types.RealIO.AmountOfSubstanceInput
                                             impermeableSolutes
      "Amount of impermeable solutes in compartment"                                                                                    annotation (Placement(transformation(extent={{-120,60},
              {-80,100}}),
          iconTransformation(extent={{-120,60},{-80,100}})));
    Physiolibrary2013.Types.RealIO.VolumeOutput
                                   volume "Actual volume of compartment"
      annotation (Placement(transformation(extent={{-20,-120},{20,-80}}, rotation=
             -90)));

  equation
    q_in.o = impermeableSolutes / volume;

    change = q_in.q;    //der(volume)=q_in.q
    state = volume;
    annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
              -100},{100,100}}), graphics), Icon(coordinateSystem(
            preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
                                                 graphics={
                     Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,255},
            fillColor={71,127,8},
            fillPattern=FillPattern.Solid)}),
      Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
  end OsmoticCell;

  annotation (Documentation(revisions="<html>
<p>Licensed by Marek Matejak under the Modelica License 2</p>
<p>Copyright &copy; 2008-2013, Marek Matejak.</p>
<p><br/><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Physiolibrary2013.UsersGuide.ModelicaLicense2\">Physiolibrary2013.UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p>
</html>"));
end Osmotic;

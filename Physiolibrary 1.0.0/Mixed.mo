within Physiolibrary;
package Mixed
  model IdealGas
    "Ideal gas conversion from partial pressure with volumetric flow to amount of substance with molar flow"
    import Physiolibrary;

    Physiolibrary.Hydraulic.PositivePressureFlow
                                    v
      "Hydraulic pressure connector with volumetric flow"
                                           annotation (Placement(transformation(
            extent={{-110,-12},{-90,8}}), iconTransformation(extent={{-110,-10},{-90,
              10}})));
    Physiolibrary.Chemical.NegativeConcentrationFlow  n
      "Molar concentratio connector with substance amount flow"
                                               annotation (Placement(
          transformation(extent={{90,-10},{110,10}}),  iconTransformation(extent={
              {90,-10},{110,10}})));

    parameter Physiolibrary.Types.Temperature T "Temperature";

  equation
    v.pressure = n.conc * Modelica.Constants.R * T;  // P*V = n*R*T
    //assert(abs(v.pressures)>Modelica.Constants.eps, "Zero or negative partial pressure or concentrations are not supported!")
    n.q + n.conc * v.q=0;

     annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
              {100,100}}),       graphics={
          Text(
            extent={{-120,-100},{120,-140}},
            textString="%name",
            lineColor={0,0,255})}),             Documentation(revisions="<html>
<p><i>2009-2012</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),
      Diagram(graphics));
  end IdealGas;

  model IdealGas2
    "Ideal gas conversion from partial pressure with volumetric flow to amount of substance with molar flow"
    import Physiolibrary;

    Physiolibrary.Hydraulic.PositivePressureFlow
                                    v
      "Hydraulic pressure connector with volumetric flow"
                                           annotation (Placement(transformation(
            extent={{-110,-12},{-90,8}}), iconTransformation(extent={{-110,-10},{-90,
              10}})));
    Physiolibrary.Chemical.NegativeConcentrationFlow  n
      "Molar concentratio connector with substance amount flow"
                                               annotation (Placement(
          transformation(extent={{90,-10},{110,10}}),  iconTransformation(extent={
              {90,-10},{110,10}})));

    Physiolibrary.Types.RealIO.TemperatureInput T "Temperature"
                                                        annotation (Placement(transformation(extent={{22,
              -18},{62,22}}), iconTransformation(extent={{20,-20},{-20,20}},
          rotation=90,
          origin={0,80})));

  equation
    v.pressure = n.conc * Modelica.Constants.R * T;  // P*V = n*R*T
    n.q + n.conc * v.q = 0;

     annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
              {100,100}}),       graphics={
          Text(
            extent={{-120,-100},{120,-140}},
            textString="%name",
            lineColor={0,0,255})}),             Documentation(revisions="<html>
<p><i>2009-2012</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),
      Diagram(graphics));
  end IdealGas2;

  model PartialPressure
    "Conversion between partial pressure and concentration of the gas in liquid"
    import Physiolibrary;

    Physiolibrary.Hydraulic.PositivePressureFlow
                                    v
      "Partial pressure and volumetric flow of pure substance"
                                           annotation (Placement(transformation(
            extent={{-10,90},{10,110}}),  iconTransformation(extent={{-110,-10},{-90,
              10}})));
    Physiolibrary.Chemical.NegativeConcentrationFlow  n
      "Molar concentratio and substance amount flow"
                                               annotation (Placement(
          transformation(extent={{-10,-110},{10,-90}}),iconTransformation(extent={
              {90,-10},{110,10}})));
    parameter Physiolibrary.Types.GasSolubility alpha
      "Gas solubility in solvent in temperature T";
    parameter Physiolibrary.Types.Temperature T "Temperature";

    Physiolibrary.Chemical.GasSolubility  gasSolubility(kH=alpha*Modelica.Constants.R
        *T)
      annotation (Placement(transformation(extent={{-10,-68},{10,-48}})));
    IdealGas idealGas(T=T)
                      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=-90,
          origin={0,26})));
  equation

    connect(idealGas.v, v) annotation (Line(
        points={{1.83697e-015,36},{0,36},{0,100}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(idealGas.n, gasSolubility.q_out) annotation (Line(
        points={{0,16},{0,-48}},
        color={200,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(gasSolubility.q_in, n) annotation (Line(
        points={{0,-68},{0,-100}},
        color={200,0,0},
        thickness=1,
        smooth=Smooth.None));
     annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
              {100,100}}),       graphics={
          Text(
            extent={{-120,-100},{120,-140}},
            textString="%name",
            lineColor={0,0,255})}),             Documentation(revisions="<html>
<p><i>2009-2012</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}),
              graphics));
  end PartialPressure;

  model PartialPressure2
    "Conversion between partial pressure and concentration of the gas in liquid"
    import Physiolibrary;

    Physiolibrary.Hydraulic.PositivePressureFlow
                                    v
      "Partial pressure and volumetric flow of pure substance"
                                           annotation (Placement(transformation(
            extent={{-10,90},{10,110}}),  iconTransformation(extent={{-110,-10},{-90,
              10}})));
    Physiolibrary.Chemical.NegativeConcentrationFlow  n
      "Molar concentratio and substance amount flow"
                                               annotation (Placement(
          transformation(extent={{-10,-110},{10,-90}}),iconTransformation(extent={
              {90,-10},{110,10}})));
    parameter Real alpha_T0 "Gas solubility in solvent in temperature T0";
    parameter Physiolibrary.Types.Temperature T0=298.15
      "Base temperature of alpha";

    Physiolibrary.Chemical.GasSolubility2  gasSolubility(kH_T0=alpha_T0*
        Modelica.Constants.R*T0, T0=T0)
      annotation (Placement(transformation(extent={{-10,-68},{10,-48}})));
    IdealGas2 idealGas annotation (Placement(transformation(
          extent={{-10,10},{10,-10}},
          rotation=-90,
          origin={0,26})));
    Physiolibrary.Types.RealIO.TemperatureInput T "temperature"
                                                       annotation (Placement(
          transformation(extent={{10,-10},{-10,10}},
          rotation=180,
          origin={-50,26}),                           iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=270,
          origin={0,80})));
  equation

    connect(idealGas.v, v) annotation (Line(
        points={{1.83697e-015,36},{0,36},{0,100}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(T, idealGas.T) annotation (Line(
        points={{-50,26},{-8,26}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(T, gasSolubility.T) annotation (Line(
        points={{-50,26},{-30,26},{-30,-58},{-6,-58}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(gasSolubility.q_in, n) annotation (Line(
        points={{0,-68},{0,-100}},
        color={200,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(idealGas.n, gasSolubility.q_out) annotation (Line(
        points={{0,16},{0,-48}},
        color={200,0,0},
        thickness=1,
        smooth=Smooth.None));
     annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
              {100,100}}),       graphics={
          Text(
            extent={{-120,-100},{120,-140}},
            textString="%name",
            lineColor={0,0,255})}),             Documentation(revisions="<html>
<p><i>2009-2012</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}),
              graphics));
  end PartialPressure2;
  annotation (Documentation(revisions="<html>
<p>Licensed by Marek Matejak under the Modelica License 2</p>
<p>Copyright &copy; 2008-2013, Marek Matejak, Charles University in Prague.</p>
<p><br/><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Physiolibrary.UsersGuide.ModelicaLicense2\">Physiolibrary.UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p>
</html>", info="<html>
<p>Some physical events take place between these domains. For these events, Physiolibrary includes an additional package called Mixed. For example, the Mixed package contains the block for the ideal gas equation, which connects the molar and pressure connector. Another example is the block PartialPressure, which combines the ideal gas equation with Henry&apos;s law of gas solubility already implemented in the Chemical.GasSolubility block.</p>
</html>"));
end Mixed;

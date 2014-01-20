within Physiolibrary;
package Mixed "Blocks between domains"
  extends Modelica.Icons.Package;
  package Examples
    "Examples that demonstrate usage of the Pressure flow components"
  extends Modelica.Icons.ExamplesPackage;

    model O2_in_water
    extends Modelica.Icons.Example;
    //extends States.StateSystem(Simulation=States.SimulationType.Equilibrated);
    //=States.SimulationType.NoInit); for dynamic simulation

      parameter Physiolibrary.States.SimulationType Simulation=States.SimulationType.Equilibrated;

      parameter Types.GasSolubility alpha =  0.0105 * 1e-3
        "oxygen solubility in plasma"; // by Siggaard Andersen: 0.0105 (mmol/l)/kPa

    public
      Chemical.Components.Substance oxygen_dissolved(
                                                    Simulation=Simulation,
          solute_start=0.000001*7.875647668393782383419689119171e-5)
        annotation (Placement(transformation(extent={{-12,-56},{8,-36}})));
      Chemical.Components.GasSolubility
                            partialPressure(
        useHeatPort=true,
        kH_T0=1/(alpha*Modelica.Constants.R*310.15),
        T0=310.15)                                     annotation (Placement(
            transformation(
            extent={{10,-10},{-10,10}},
            rotation=0,
            origin={-2,-18})));
      Hydraulic.Sources.UnlimitedVolume
                                unlimitedVolume
        annotation (Placement(transformation(extent={{-56,36},{-36,56}})));
      Modelica.Blocks.Sources.Clock oxygenPartialPressure(offset=1e-06)
        annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
      Modelica.Blocks.Sources.Sine temperature(
        amplitude=10,
        freqHz=1/60,
        offset=310.15)
        annotation (Placement(transformation(extent={{-94,-28},{-74,-8}})));
      Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature
        prescribedTemperature
        annotation (Placement(transformation(extent={{-56,-28},{-36,-8}})));
      Components.IdealGas idealGas(useHeatPort=true)
        annotation (Placement(transformation(extent={{-28,32},{-8,52}})));
    equation

      connect(oxygenPartialPressure.y, unlimitedVolume.pressure)
                                                 annotation (Line(
          points={{-59,70},{-46,70},{-46,56}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(temperature.y, prescribedTemperature.T) annotation (Line(
          points={{-73,-18},{-58,-18}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(partialPressure.heatPort, prescribedTemperature.port) annotation (
         Line(
          points={{-2,-18},{-36,-18}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(partialPressure.q_in, oxygen_dissolved.q_out) annotation (Line(
          points={{-2,-26},{-2,-46}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(unlimitedVolume.y, idealGas.v) annotation (Line(
          points={{-46,46},{-28,46}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(idealGas.n, partialPressure.q_out) annotation (Line(
          points={{-8,46},{-2,46},{-2,-10}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(idealGas.heatPort, prescribedTemperature.port) annotation (Line(
          points={{-18,42},{-18,-18},{-36,-18}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics),
        experiment(StopTime=100),
        __Dymola_experimentSetupOutput,
        Documentation(info="<html>
<p>Partial pressure of oxygen in air is the air pressure multiplied by the fraction of the oxygen in air. Oxygen solubility</p>
</html>", revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end O2_in_water;

    model O2_in_water2
    extends Modelica.Icons.Example;
    //extends States.StateSystem(Simulation=States.SimulationType.Equilibrated);
    //=States.SimulationType.NoInit); for dynamic simulation

      parameter Physiolibrary.States.SimulationType Simulation=States.SimulationType.Equilibrated;

      parameter Types.GasSolubility alpha =  0.0105 * 1e-3
        "oxygen solubility in plasma"; // by Siggaard Andersen: 0.0105 (mmol/l)/kPa

    public
      Chemical.Components.Substance oxygen_dissolved(
                                                    Simulation=Simulation,
          solute_start=0.000001*7.875647668393782383419689119171e-5)
        annotation (Placement(transformation(extent={{-12,-56},{8,-36}})));
      Components.PartialPressure
                            partialPressure(useHeatPort=true, T0=310.15, alpha_T0=alpha)
                                                       annotation (Placement(
            transformation(
            extent={{10,-10},{-10,10}},
            rotation=0,
            origin={-2,-18})));
      Hydraulic.Sources.UnlimitedVolume
                                unlimitedVolume
        annotation (Placement(transformation(extent={{-56,36},{-36,56}})));
      Modelica.Blocks.Sources.Clock oxygenPartialPressure(offset=1e-06)
        annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
      Modelica.Blocks.Sources.Sine temperature(
        amplitude=10,
        freqHz=1/60,
        offset=310.15)
        annotation (Placement(transformation(extent={{-94,-28},{-74,-8}})));
      Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature
        prescribedTemperature
        annotation (Placement(transformation(extent={{-56,-28},{-36,-8}})));
    equation

      connect(oxygenPartialPressure.y, unlimitedVolume.pressure)
                                                 annotation (Line(
          points={{-59,70},{-46,70},{-46,56}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(temperature.y, prescribedTemperature.T) annotation (Line(
          points={{-73,-18},{-58,-18}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(partialPressure.heatPort, prescribedTemperature.port) annotation (
          Line(
          points={{-2,-18},{-36,-18}},
          color={191,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(partialPressure.n, oxygen_dissolved.q_out) annotation (Line(
          points={{-2,-24},{-2,-46}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(partialPressure.v, unlimitedVolume.y) annotation (Line(
          points={{-2,-8},{-2,46},{-46,46}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics),
        experiment(StopTime=100),
        __Dymola_experimentSetupOutput,
        Documentation(info="<html>
<p>Partial pressure of oxygen in air is the air pressure multiplied by the fraction of the oxygen in air. Oxygen solubility</p>
</html>", revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end O2_in_water2;
  end Examples;

  package Components
    extends Modelica.Icons.Package;
    model IdealGas
      "Ideal gas conversion from partial pressure with volumetric flow to amount of substance with molar flow"
      extends Icons.IdealGas;
      import Physiolibrary;
      extends Physiolibrary.Chemical.Interfaces.ConditionalHeatPort;

      Physiolibrary.Hydraulic.Interfaces.PositivePressureFlow
                                      v
        "Hydraulic pressure connector with volumetric flow"
                                             annotation (Placement(transformation(
              extent={{-110,-12},{-90,8}}), iconTransformation(extent={{-110,30},
                {-90,50}})));
      Physiolibrary.Chemical.Interfaces.NegativeConcentrationFlow
                                                        n
        "Molar concentratio connector with substance amount flow"
                                                 annotation (Placement(
            transformation(extent={{90,30},{110,50}}),   iconTransformation(extent={{90,30},
                {110,50}})));

      //parameter Physiolibrary.Types.Temperature T "Temperature";

    equation
      v.pressure = n.conc * Modelica.Constants.R * T_heatPort;  // P*V = n*R*T
      //assert(abs(v.pressures)>Modelica.Constants.eps, "Zero or negative partial pressure or concentrations are not supported!")
      n.q + n.conc * v.q=0;

      lossHeat = 0;

       annotation (Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,
                -100},{100,100}}), graphics={
            Text(
              extent={{-120,142},{120,102}},
              textString="%name",
              lineColor={0,0,255})}),             Documentation(revisions="<html>
<p><i>2009-2012</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),
        Diagram(graphics));
    end IdealGas;

    model PartialPressure
      "Conversion between partial pressure and concentration of the gas in liquid"
      extends Icons.PartialPressure;
      extends Physiolibrary.Chemical.Interfaces.ConditionalHeatPort;
      import Physiolibrary;

      Physiolibrary.Hydraulic.Interfaces.PositivePressureFlow
                                      v
        "Partial pressure and volumetric flow of pure substance"
                                             annotation (Placement(transformation(
              extent={{-80,-26},{-60,-6}}), iconTransformation(extent={{-10,90},{
                10,110}})));
      Physiolibrary.Chemical.Interfaces.NegativeConcentrationFlow
                                                        n
        "Molar concentratio and substance amount flow"
                                                 annotation (Placement(
            transformation(extent={{-10,-96},{10,-76}}), iconTransformation(extent={{-10,-70},
                {10,-50}})));
      parameter Physiolibrary.Types.GasSolubility alpha_T0
        "Gas solubility in solvent in temperature T0";

      parameter Physiolibrary.Types.Temperature T0=298.15
        "Base temperature for alpha_T0"
         annotation (Dialog(tab="Temperature dependence"));
      parameter Physiolibrary.Types.Temperature C(displayUnit="K") = 1700
        "Gas-liquid specific constant for Van't Hoff's change of kH (i.e.: O2..1700K,CO2..2400K,N2..1300K,CO..1300K,..)"
        annotation (Dialog(tab="Temperature dependence"));

      parameter Types.DiffusionPermeability solubilityRateCoef=10^3
        "The rate constant of incoming gas to solution";

    //protected
      parameter Types.Fraction kH_T0=1/(alpha_T0*Modelica.Constants.R*T0)
        "Henry's law coefficient at base temperature";
      Types.Fraction kH
        "Henry's law coefficient such as liquid-gas concentration ratio";
      Types.Concentration nc "gas concentration";
    equation

      v.pressure = nc * Modelica.Constants.R * T_heatPort;  // P*V = n*R*T
      //assert(abs(v.pressures)>Modelica.Constants.eps, "Zero or negative partial pressure or concentrations are not supported!")
      n.q + nc * v.q=0;

      kH = kH_T0 * Modelica.Math.exp(C* (1/T_heatPort - 1/T0)); // Van't Hoff equation

      // equilibrium:  gas.conc = kH * liquid.conc;
      n.q = solubilityRateCoef*(nc - kH * n.conc); //negative because of outflow

      lossHeat = C*Modelica.Constants.R*n.q; //negative = heat are comsumed when change from liquid to gas

       annotation (Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},
                {100,100}}),       graphics={
            Text(
              extent={{-120,20},{120,-20}},
              textString="%name",
              lineColor={0,0,255},
              origin={100,0},
              rotation=90)}),                     Documentation(revisions="<html>
<p><i>2009-2012</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>", info="<html>
<p>Schema for partial pressure calculation is </p>
<p><img src=\"modelica://Physiolibrary/Resources/Documentation/partialPressure.png\"/></p>
<p>where gas solubility &QUOT;alpha&QUOT; can be recalculated to Henry&apos;s coefficient &QUOT;kH&QUOT; by equation <code>kH=1/(alpha*R*T) using gas constant R and temperature T.&nbsp;</code></p>
</html>"),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                100}}),
                graphics));
    end PartialPressure;
  end Components;
  annotation (Documentation(revisions="<html>
<p>Licensed by Marek Matejak under the Modelica License 2</p>
<p>Copyright &copy; 2008-2013, Marek Matejak, Charles University in Prague.</p>
<p><br/><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Physiolibrary.UsersGuide.ModelicaLicense2\">Physiolibrary.UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p>
</html>", info="<html>
<p>Some physical events take place between these domains. For these events, Physiolibrary includes an additional package called Mixed. For example, the Mixed package contains the block for the ideal gas equation, which connects the molar and pressure connector. Another example is the block PartialPressure, which combines the ideal gas equation with Henry&apos;s law of gas solubility already implemented in the Chemical.GasSolubility block.</p>
</html>"));
end Mixed;

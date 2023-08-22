within Physiolibrary;
package Types "Physiological units with nominals"
  //extends Modelica.Icons.TypesPackage;
  extends Modelica.Icons.Package;
  //If you have an idea to add the next physiological type to the next version, please write me at marek@matfyz.cz. Thank you

  package UsersGuide "User's Guide"
    extends Modelica.Icons.Information;

    class NewType "Adding new type"
      extends Modelica.Icons.Information;
      annotation (
        Documentation(info = "<html>
	<p>Definition of new type (&quot;QuantityX&quot;) in Physiolibrary:</p>
	<ul>
	<li>Define base type Types.QuantityX with SI units in &quot;final unit&quot;, default display units and nominal (e.g. value of one display unit at SI units). </li>
	</ul>
	<p>Optional: </p>
	<ul>
	<li>Define typed input and output connectors for QuantityX: Types.RealIO.QuantityXInput and Types.RealIO.QuantityXOutput. </li>
	<li>Define typed constant for QuantityX: Types.Constants.QuantityXConst </li>
	<li>Define typed RealInputParameter for QuantityX: Types.RealInputParameters.QuantityX </li>
	<li>Define typed replaceable variable RealTypes for QuantityX: Types.RealTypes.QuantityX </li>
	</ul>
	</html>"));
    end NewType;
    annotation (
      DocumentationClass = true,
      Documentation(info = "<html>
	<p>Package <b>Physiolibrary</b> is a modelica package for <b>Human Physiology</b> that is developed from <b>HumMod</b> modelica implementation, see <a href=\"http://patf-biokyb.lf1.cuni.cz/wiki/hummod/hummod\">http://hummod.org</a>. It provides constants, types, connectors, partial models and model components fitted for physiological models of human body. </p>
	<p>This is a short <b>User&apos;s Guide</b> for the overall library. Some of the main sublibraries have their own User&apos;s Guides that can be accessed by the following links: </p>
	<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
	<td valign=\"top\"><p>Types </p></td>
	<td valign=\"top\"><p>Physiological types. Physiological unit vs. SI units, nominals, inputs/outputs, typed constants.</p></td>
	</tr>
	<tr>
	<td valign=\"top\"><p>Blocks</p></td>
	<td valign=\"top\"><p>Useful blocks, that are missing in package Modelica.Blocks (MSL 3.2), cubic interpolation curves, multiplication factors.</p></td>
	</tr>
	<tr>
	<td valign=\"top\"><p>Chemical</p></td>
	<td valign=\"top\"><p>Library to chemical subsystems such as intravascular, interstitial or intracellular chemical substances in fluxes and interactions.</p></td>
	</tr>
	<tr>
	<td valign=\"top\"><p>Hydraulic</p></td>
	<td valign=\"top\"><p>Library to hydraulic subsystems such as in cardiovascular system.</p></td>
	</tr>
	<tr>
	<td valign=\"top\"><p>Thermal</p></td>
	<td valign=\"top\"><p>Library of termoregulation support.</p></td>
	</tr>
	<tr>
	<td valign=\"top\"><p>Osmotic</p></td>
	<td valign=\"top\"><p>Library to model water fluxes through semipermeable membrane caused by osmotic pressure.</p></td>
	</tr>
	<tr>
	<td valign=\"top\"><p>Mixed</p></td>
	<td valign=\"top\"><p>Library to join domains above together.</p></td>
	</tr>
	<tr>
	<td valign=\"top\"><p>Icons</p></td>
	<td valign=\"top\"><p>Icons</p></td>
	</tr>
	<tr>
	<td valign=\"top\"><p>FileUtilities</p></td>
	<td valign=\"top\"><p>Read/write values from/to file. </p></td>
	</tr>
	</table>
	</html>"));
  end UsersGuide;

  package Constants
    extends Modelica.Icons.SourcesPackage;

    block AccelerationConst "Constant signal of type Acceleration"
      parameter Types.Acceleration k "Constant Acceleration output value";
      RealIO.AccelerationOutput y "Acceleration constant" annotation (
        Placement(transformation(extent = {{40, -10}, {60, 10}}), iconTransformation(extent = {{40, -10}, {60, 10}})));
    equation
      y = k;
      annotation (
        defaultComponentName = "acceleration",
        Diagram(coordinateSystem(extent = {{-40, -40}, {40, 40}})),
        Icon(coordinateSystem(extent = {{-40, -40}, {40, 40}}, preserveAspectRatio = false), graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0}, radius = 10, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid), Text(extent = {{-100, -44}, {100, -64}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "%name"), Text(extent = {{-40, 10}, {40, -10}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "Const")}));
    end AccelerationConst;

    block AmountOfSubstanceConst "Constant signal of type AmountOfSubstance"
      parameter Types.AmountOfSubstance k "Constant AmountOfSubstance output value";
      RealIO.AmountOfSubstanceOutput y "AmountOfSubstance constant" annotation (
        Placement(transformation(extent = {{40, -10}, {60, 10}}), iconTransformation(extent = {{40, -10}, {60, 10}})));
    equation
      y = k;
      annotation (
        defaultComponentName = "amountOfSubstance",
        Diagram(coordinateSystem(extent = {{-40, -40}, {40, 40}})),
        Icon(coordinateSystem(extent = {{-40, -40}, {40, 40}}, preserveAspectRatio = false), graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0}, radius = 10, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid), Text(extent = {{-100, -44}, {100, -64}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "%name"), Text(extent = {{-40, 10}, {40, -10}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "Const")}));
    end AmountOfSubstanceConst;

    block ConcentrationConst "Constant signal of type Concentration"
      parameter Types.Concentration k "Constant Concentration output value";
      RealIO.ConcentrationOutput y "Concentration constant" annotation (
        Placement(transformation(extent = {{40, -10}, {60, 10}}), iconTransformation(extent = {{40, -10}, {60, 10}})));
    equation
      y = k;
      annotation (
        defaultComponentName = "concentration",
        Diagram(coordinateSystem(extent = {{-40, -40}, {40, 40}})),
        Icon(coordinateSystem(extent = {{-40, -40}, {40, 40}}, preserveAspectRatio = false), graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0}, radius = 10, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid), Text(extent = {{-100, -44}, {100, -64}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "%name"), Text(extent = {{-40, 10}, {40, -10}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "Const")}));
    end ConcentrationConst;

    block DensityConst "Constant signal of type Density"
      parameter Types.Density k "Constant Density output value";
      RealIO.DensityOutput y "Density constant" annotation (
        Placement(transformation(extent = {{40, -10}, {60, 10}}), iconTransformation(extent = {{40, -10}, {60, 10}})));
    equation
      y = k;
      annotation (
        defaultComponentName = "density",
        Diagram(coordinateSystem(extent = {{-40, -40}, {40, 40}})),
        Icon(coordinateSystem(extent = {{-40, -40}, {40, 40}}, preserveAspectRatio = false), graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0}, radius = 10, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid), Text(extent = {{-100, -44}, {100, -64}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "%name"), Text(extent = {{-40, 10}, {40, -10}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "Const")}));
    end DensityConst;

    block DiffusionPermeabilityConst "Constant signal of type DiffusionPermeability"
      parameter Types.DiffusionPermeability k "Constant DiffusionPermeability output value";
      RealIO.DiffusionPermeabilityOutput y "DiffusionPermeability constant" annotation (
        Placement(transformation(extent = {{40, -10}, {60, 10}}), iconTransformation(extent = {{40, -10}, {60, 10}})));
    equation
      y = k;
      annotation (
        defaultComponentName = "diffusionPermeability",
        Diagram(coordinateSystem(extent = {{-40, -40}, {40, 40}})),
        Icon(coordinateSystem(extent = {{-40, -40}, {40, 40}}, preserveAspectRatio = false), graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0}, radius = 10, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid), Text(extent = {{-100, -44}, {100, -64}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "%name"), Text(extent = {{-40, 10}, {40, -10}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "Const")}));
    end DiffusionPermeabilityConst;

    block ElectricChargeConst "Constant signal of type ElectricCharge"
      parameter Types.ElectricCharge k "Constant ElectricCharge output value";
      RealIO.ElectricChargeOutput y "ElectricCharge constant" annotation (
        Placement(transformation(extent = {{40, -10}, {60, 10}}), iconTransformation(extent = {{40, -10}, {60, 10}})));
    equation
      y = k;
      annotation (
        defaultComponentName = "electricCharge",
        Diagram(coordinateSystem(extent = {{-40, -40}, {40, 40}})),
        Icon(coordinateSystem(extent = {{-40, -40}, {40, 40}}, preserveAspectRatio = false), graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0}, radius = 10, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid), Text(extent = {{-100, -44}, {100, -64}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "%name"), Text(extent = {{-40, 10}, {40, -10}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "Const")}));
    end ElectricChargeConst;

    block ElectricCurrentConst "Constant signal of type ElectricCurrent"
      parameter Types.ElectricCurrent k "Constant ElectricCurrent output value";
      RealIO.ElectricCurrentOutput y "ElectricCurrent constant" annotation (
        Placement(transformation(extent = {{40, -10}, {60, 10}}), iconTransformation(extent = {{40, -10}, {60, 10}})));
    equation
      y = k;
      annotation (
        defaultComponentName = "electricCurrent",
        Diagram(coordinateSystem(extent = {{-40, -40}, {40, 40}})),
        Icon(coordinateSystem(extent = {{-40, -40}, {40, 40}}, preserveAspectRatio = false), graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0}, radius = 10, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid), Text(extent = {{-100, -44}, {100, -64}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "%name"), Text(extent = {{-40, 10}, {40, -10}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "Const")}));
    end ElectricCurrentConst;

    block ElectricPotentialConst "Constant signal of type ElectricPotential"
      parameter Types.ElectricPotential k "Constant ElectricPotential output value";
      RealIO.ElectricPotentialOutput y "ElectricPotential constant" annotation (
        Placement(transformation(extent = {{40, -10}, {60, 10}}), iconTransformation(extent = {{40, -10}, {60, 10}})));
    equation
      y = k;
      annotation (
        defaultComponentName = "electricPotential",
        Diagram(coordinateSystem(extent = {{-40, -40}, {40, 40}})),
        Icon(coordinateSystem(extent = {{-40, -40}, {40, 40}}, preserveAspectRatio = false), graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0}, radius = 10, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid), Text(extent = {{-100, -44}, {100, -64}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "%name"), Text(extent = {{-40, 10}, {40, -10}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "Const")}));
    end ElectricPotentialConst;

    block EnergyConst "Constant signal of type Energy"
      parameter Types.Energy k "Constant Energy output value";
      RealIO.EnergyOutput y "Energy constant" annotation (
        Placement(transformation(extent = {{40, -10}, {60, 10}}), iconTransformation(extent = {{40, -10}, {60, 10}})));
    equation
      y = k;
      annotation (
        defaultComponentName = "energy",
        Diagram(coordinateSystem(extent = {{-40, -40}, {40, 40}})),
        Icon(coordinateSystem(extent = {{-40, -40}, {40, 40}}, preserveAspectRatio = false), graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0}, radius = 10, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid), Text(extent = {{-100, -44}, {100, -64}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "%name"), Text(extent = {{-40, 10}, {40, -10}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "Const")}));
    end EnergyConst;

    block EnthalpyConst "Constant signal of type Enthalpy"
      parameter Types.Enthalpy k "Constant Enthalpy output value";
      RealIO.EnthalpyOutput y "Enthalpy constant" annotation (
        Placement(transformation(extent = {{40, -10}, {60, 10}}), iconTransformation(extent = {{40, -10}, {60, 10}})));
    equation
      y = k;
      annotation (
        defaultComponentName = "enthalpy",
        Diagram(coordinateSystem(extent = {{-40, -40}, {40, 40}})),
        Icon(coordinateSystem(extent = {{-40, -40}, {40, 40}}, preserveAspectRatio = false), graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0}, radius = 10, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid), Text(extent = {{-100, -44}, {100, -64}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "%name"), Text(extent = {{-40, 10}, {40, -10}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "Const")}));
    end EnthalpyConst;

    block MolarEnthalpyConst "Constant signal of type MolarEnthalpy"
      parameter Types.MolarEnthalpy k "Constant Enthalpy output value";
      RealIO.MolarEnthalpyOutput y "Molar Enthalpy constant" annotation (
        Placement(transformation(extent = {{40, -10}, {60, 10}}), iconTransformation(extent = {{40, -10}, {60, 10}})));
    equation
      y = k;
      annotation (
        defaultComponentName = "molarEnthalpy",
        Diagram(coordinateSystem(extent = {{-40, -40}, {40, 40}})),
        Icon(coordinateSystem(extent = {{-40, -40}, {40, 40}}, preserveAspectRatio = false), graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0}, radius = 10, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid), Text(extent = {{-100, -44}, {100, -64}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "%name"), Text(extent = {{-40, 10}, {40, -10}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "Const")}));
    end MolarEnthalpyConst;

    block FractionConst "Constant signal of type Fraction"
      parameter Types.Fraction k "Constant Fraction output value";
      RealIO.FractionOutput y "Fraction constant" annotation (
        Placement(transformation(extent = {{40, -10}, {60, 10}}), iconTransformation(extent = {{40, -10}, {60, 10}})));
    equation
      y = k;
      annotation (
        defaultComponentName = "fraction",
        Diagram(coordinateSystem(extent = {{-40, -40}, {40, 40}})),
        Icon(coordinateSystem(extent = {{-40, -40}, {40, 40}}, preserveAspectRatio = false), graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0}, radius = 10, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid), Text(extent = {{-100, -44}, {100, -64}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "%name"), Text(extent = {{-40, 10}, {40, -10}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "Const")}));
    end FractionConst;

    block FrequencyConst "Constant signal of type Frequency"
      parameter Types.Frequency k "Constant Frequency output value";
      RealIO.FrequencyOutput y "Frequency constant" annotation (
        Placement(transformation(extent = {{40, -10}, {60, 10}}), iconTransformation(extent = {{40, -10}, {60, 10}})));
    equation
      y = k;
      annotation (
        defaultComponentName = "frequency",
        Diagram(coordinateSystem(extent = {{-40, -40}, {40, 40}})),
        Icon(coordinateSystem(extent = {{-40, -40}, {40, 40}}, preserveAspectRatio = false), graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0}, radius = 10, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid), Text(extent = {{-100, -44}, {100, -64}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "%name"), Text(extent = {{-40, 10}, {40, -10}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "Const")}));
    end FrequencyConst;

    block GasSolubilityConst "Constant signal of type GasSolubility"
      parameter Types.GasSolubility k "Constant GasSolubility output value";
      RealIO.GasSolubilityOutput y "GasSolubility constant" annotation (
        Placement(transformation(extent = {{40, -10}, {60, 10}}), iconTransformation(extent = {{40, -10}, {60, 10}})));
    equation
      y = k;
      annotation (
        defaultComponentName = "gasSolubility",
        Diagram(coordinateSystem(extent = {{-40, -40}, {40, 40}})),
        Icon(coordinateSystem(extent = {{-40, -40}, {40, 40}}, preserveAspectRatio = false), graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0}, radius = 10, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid), Text(extent = {{-100, -44}, {100, -64}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "%name"), Text(extent = {{-40, 10}, {40, -10}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "Const")}));
    end GasSolubilityConst;

    block HeatConst "Constant signal of type Heat"
      parameter Types.Heat k "Constant Heat output value";
      RealIO.HeatOutput y "Heat constant" annotation (
        Placement(transformation(extent = {{40, -10}, {60, 10}}), iconTransformation(extent = {{40, -10}, {60, 10}})));
    equation
      y = k;
      annotation (
        defaultComponentName = "heat",
        Diagram(coordinateSystem(extent = {{-40, -40}, {40, 40}})),
        Icon(coordinateSystem(extent = {{-40, -40}, {40, 40}}, preserveAspectRatio = false), graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0}, radius = 10, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid), Text(extent = {{-100, -44}, {100, -64}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "%name"), Text(extent = {{-40, 10}, {40, -10}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "Const")}));
    end HeatConst;

    block HeightConst "Constant signal of type Height"
      parameter Types.Height k "Constant Height output value";
      RealIO.HeightOutput y "Height constant" annotation (
        Placement(transformation(extent = {{40, -10}, {60, 10}}), iconTransformation(extent = {{40, -10}, {60, 10}})));
    equation
      y = k;
      annotation (
        defaultComponentName = "height",
        Diagram(coordinateSystem(extent = {{-40, -40}, {40, 40}})),
        Icon(coordinateSystem(extent = {{-40, -40}, {40, 40}}, preserveAspectRatio = false), graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0}, radius = 10, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid), Text(extent = {{-100, -44}, {100, -64}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "%name"), Text(extent = {{-40, 10}, {40, -10}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "Const")}));
    end HeightConst;

    block HeatFlowRateConst "Constant signal of type HeatFlowRate"
      parameter Types.HeatFlowRate k "Constant HeatFlowRate output value";
      RealIO.HeatFlowRateOutput y "HeatFlowRate constant" annotation (
        Placement(transformation(extent = {{40, -10}, {60, 10}}), iconTransformation(extent = {{40, -10}, {60, 10}})));
    equation
      y = k;
      annotation (
        defaultComponentName = "heatFlowRate",
        Diagram(coordinateSystem(extent = {{-40, -40}, {40, 40}})),
        Icon(coordinateSystem(extent = {{-40, -40}, {40, 40}}, preserveAspectRatio = false), graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0}, radius = 10, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid), Text(extent = {{-100, -44}, {100, -64}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "%name"), Text(extent = {{-40, 10}, {40, -10}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "Const")}));
    end HeatFlowRateConst;

    block HydraulicComplianceConst "Constant signal of type HydraulicCompliance"
      parameter Types.HydraulicCompliance k "Constant HydraulicCompliance output value";
      RealIO.HydraulicComplianceOutput y "HydraulicCompliance constant" annotation (
        Placement(transformation(extent = {{40, -10}, {60, 10}}), iconTransformation(extent = {{40, -10}, {60, 10}})));
    equation
      y = k;
      annotation (
        defaultComponentName = "hydraulicCompliance",
        Diagram(coordinateSystem(extent = {{-40, -40}, {40, 40}})),
        Icon(coordinateSystem(extent = {{-40, -40}, {40, 40}}, preserveAspectRatio = false), graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0}, radius = 10, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid), Text(extent = {{-100, -44}, {100, -64}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "%name"), Text(extent = {{-40, 10}, {40, -10}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "Const")}));
    end HydraulicComplianceConst;

    block HydraulicElastanceConst "Obsolete, please use HydraulicCompliance instead!"
      extends Modelica.Icons.ObsoleteModel;
      parameter Types.HydraulicElastance k "Hydraulic elastance";
      RealIO.HydraulicElastanceOutput y "HydraulicElastance constant" annotation (
        Placement(transformation(extent = {{40, -10}, {60, 10}}), iconTransformation(extent = {{40, -10}, {60, 10}})));
    equation
      y = k;
      annotation (
        defaultComponentName = "hydraulicElastance",
        Icon(coordinateSystem(extent = {{-40, -40}, {40, 40}}, preserveAspectRatio = false), graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0}, radius = 10, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid), Text(extent = {{-100, -44}, {100, -64}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "%name"), Text(extent = {{-40, 10}, {40, -10}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "Const")}),
        Documentation(info = "<html>
        <p>Please use the reciprocal value of hydraulic elastance, wich is called hydraulic compliance for the compatibility with other blocks and models!</p>
        <p>Even it is not recommended, you can use this block, but do not forget to make reciprocal value (in example using Blocks.Math.Reciprocal) before connecting to library components!</p>
        </html>"));
    end HydraulicElastanceConst;

    block HydraulicElastanceToComplianceConst "Constant signal of type HydraulicCompliance from HydraulicElastance constant"
      parameter Types.HydraulicElastance k "Reciprocal constant value of hydraulic compliance";
      RealIO.HydraulicComplianceOutput y "HydraulicCompliance constant" annotation (
        Placement(transformation(extent = {{40, -10}, {60, 10}}), iconTransformation(extent = {{40, -10}, {60, 10}})));
    equation
      y = 1 / k;
      annotation (
        defaultComponentName = "hydraulicElastance2Compliance",
        Diagram(coordinateSystem(extent = {{-40, -40}, {40, 40}})),
        Icon(coordinateSystem(extent = {{-40, -40}, {40, 40}}, preserveAspectRatio = false), graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0}, radius = 10, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid), Text(extent = {{-100, -44}, {100, -64}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "%name"), Text(extent = {{-40, 10}, {40, -10}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "Const")}));
    end HydraulicElastanceToComplianceConst;

    block HydraulicConductanceConst "Constant signal of type HydraulicConductance"
      parameter Types.HydraulicConductance k "Constant HydraulicConductance output value";
      RealIO.HydraulicConductanceOutput y "HydraulicConductance constant" annotation (
        Placement(transformation(extent = {{40, -10}, {60, 10}}), iconTransformation(extent = {{40, -10}, {60, 10}})));
    equation
      y = k;
      annotation (
        defaultComponentName = "hydraulicConductance",
        Diagram(coordinateSystem(extent = {{-40, -40}, {40, 40}})),
        Icon(coordinateSystem(extent = {{-40, -40}, {40, 40}}, preserveAspectRatio = false), graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0}, radius = 10, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid), Text(extent = {{-100, -44}, {100, -64}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "%name"), Text(extent = {{-40, 10}, {40, -10}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "Const")}));
    end HydraulicConductanceConst;

    block HydraulicResistanceConst "Obsolete, please use HydraulicConductance instead!"
      parameter Types.HydraulicResistance k "Hydraulic resistance";
      Modelica.Blocks.Interfaces.RealOutput y(final quantity = "HydraulicConductance", final unit = "(Pa.s)/m3", displayUnit = "(mmHg.min)/ml", nominal = 1e+6 * 133.322387415 * 60) "HydraulicResistance constant" annotation (
        Placement(transformation(extent = {{40, -10}, {60, 10}}), iconTransformation(extent = {{40, -10}, {60, 10}})));
    equation
      y = k;
      annotation (
        defaultComponentName = "hydraulicResistance",
        Icon(coordinateSystem(extent = {{-40, -40}, {40, 40}}, preserveAspectRatio = false), graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0}, radius = 10, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid), Text(extent = {{-100, -44}, {100, -64}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "%name"), Text(extent = {{-40, 10}, {40, -10}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "Const")}),
        Documentation(info = "<html>
        <p>Please use the reciprocal value of hydraulic resistance, wich is called hydraulic conductance for the compatibility with other blocks and models!</p>
        <p>Because zero hydraulic conductance means zero volumetric flow, it is much better to use this reciprocal value of hydraulic resistance.</p>
        <p>Even it is not recommended, you can use this block, but do not forget to make reciprocal value (in example using Blocks.Math.Reciprocal) before connecting to library components!</p>
        </html>"));
    end HydraulicResistanceConst;

    block HydraulicResistanceToConductanceConst "Constant signal of type HydraulicConductance from HydraulicResistance parameter"
      parameter Types.HydraulicResistance k "Reciprocal constant value of hydraulic conductance";
      RealIO.HydraulicConductanceOutput y "HydraulicConductance constant" annotation (
        Placement(transformation(extent = {{40, -10}, {60, 10}}), iconTransformation(extent = {{40, -10}, {60, 10}})));
    equation
      y = 1 / k;
      annotation (
        defaultComponentName = "hydraulicResistance2conductance",
        Diagram(coordinateSystem(extent = {{-40, -40}, {40, 40}})),
        Icon(coordinateSystem(extent = {{-40, -40}, {40, 40}}, preserveAspectRatio = false), graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0}, radius = 10, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid), Text(extent = {{-100, -44}, {100, -64}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "%name"), Text(extent = {{-40, 10}, {40, -10}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "Const")}));
    end HydraulicResistanceToConductanceConst;

    block HydraulicInertanceConst "Constant signal of type HydraulicInertance"
      parameter Types.HydraulicInertance k "Constant HydraulicInertance output value";
      RealIO.HydraulicInertanceOutput y "HydraulicInertance constant" annotation (
        Placement(transformation(extent = {{40, -10}, {60, 10}}), iconTransformation(extent = {{40, -10}, {60, 10}})));
    equation
      y = k;
      annotation (
        defaultComponentName = "hydraulicInertance",
        Diagram(coordinateSystem(extent = {{-40, -40}, {40, 40}})),
        Icon(coordinateSystem(extent = {{-40, -40}, {40, 40}}, preserveAspectRatio = false), graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0}, radius = 10, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid), Text(extent = {{-100, -44}, {100, -64}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "%name"), Text(extent = {{-40, 10}, {40, -10}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "Const")}));
    end HydraulicInertanceConst;

    block MassConst "Constant signal of type Mass"
      parameter Types.Mass k "Constant Mass output value";
      RealIO.MassOutput y "Mass constant" annotation (
        Placement(transformation(extent = {{40, -10}, {60, 10}}), iconTransformation(extent = {{40, -10}, {60, 10}})));
    equation
      y = k;
      annotation (
        defaultComponentName = "mass",
        Diagram(coordinateSystem(extent = {{-40, -40}, {40, 40}})),
        Icon(coordinateSystem(extent = {{-40, -40}, {40, 40}}, preserveAspectRatio = false), graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0}, radius = 10, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid), Text(extent = {{-100, -44}, {100, -64}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "%name"), Text(extent = {{-40, 10}, {40, -10}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "Const")}));
    end MassConst;

    block MassConcentrationConst "Constant signal of type MassConcentration"
      parameter Types.MassConcentration k "Constant MassConcentration output value";
      RealIO.MassConcentrationOutput y "MassConcentration constant" annotation (
        Placement(transformation(extent = {{40, -10}, {60, 10}}), iconTransformation(extent = {{40, -10}, {60, 10}})));
    equation
      y = k;
      annotation (
        defaultComponentName = "massConcentration",
        Diagram(coordinateSystem(extent = {{-40, -40}, {40, 40}})),
        Icon(coordinateSystem(extent = {{-40, -40}, {40, 40}}, preserveAspectRatio = false), graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0}, radius = 10, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid), Text(extent = {{-100, -44}, {100, -64}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "%name"), Text(extent = {{-40, 10}, {40, -10}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "Const")}));
    end MassConcentrationConst;

    block MassFlowRateConst "Constant signal of type MassFlowRate"
      parameter Types.MassFlowRate k "Constant MassFlowRate output value";
      RealIO.MassFlowRateOutput y "MassFlowRate constant" annotation (
        Placement(transformation(extent = {{40, -10}, {60, 10}}), iconTransformation(extent = {{40, -10}, {60, 10}})));
    equation
      y = k;
      annotation (
        defaultComponentName = "massFlowRate",
        Diagram(coordinateSystem(extent = {{-40, -40}, {40, 40}})),
        Icon(coordinateSystem(extent = {{-40, -40}, {40, 40}}, preserveAspectRatio = false), graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0}, radius = 10, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid), Text(extent = {{-100, -44}, {100, -64}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "%name"), Text(extent = {{-40, 10}, {40, -10}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "Const")}));
    end MassFlowRateConst;

    block MolarFlowRateConst "Constant signal of type MolarFlowRate"
      parameter Types.MolarFlowRate k "Constant MolarFlowRate output value";
      RealIO.MolarFlowRateOutput y "MolarFlowRate constant" annotation (
        Placement(transformation(extent = {{40, -10}, {60, 10}}), iconTransformation(extent = {{40, -10}, {60, 10}})));
    equation
      y = k;
      annotation (
        defaultComponentName = "molarFlowRate",
        Diagram(coordinateSystem(extent = {{-40, -40}, {40, 40}})),
        Icon(coordinateSystem(extent = {{-40, -40}, {40, 40}}, preserveAspectRatio = false), graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0}, radius = 10, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid), Text(extent = {{-100, -44}, {100, -64}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "%name"), Text(extent = {{-40, 10}, {40, -10}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "Const")}));
    end MolarFlowRateConst;

    block OsmolarityConst "Constant signal of type Osmolarity"
      parameter Types.Osmolarity k "Constant Osmolarity output value";
      RealIO.OsmolarityOutput y "Osmolarity constant" annotation (
        Placement(transformation(extent = {{40, -10}, {60, 10}}), iconTransformation(extent = {{40, -10}, {60, 10}})));
    equation
      y = k;
      annotation (
        defaultComponentName = "osmolarity",
        Diagram(coordinateSystem(extent = {{-40, -40}, {40, 40}})),
        Icon(coordinateSystem(extent = {{-40, -40}, {40, 40}}, preserveAspectRatio = false), graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0}, radius = 10, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid), Text(extent = {{-100, -44}, {100, -64}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "%name"), Text(extent = {{-40, 10}, {40, -10}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "Const")}));
    end OsmolarityConst;

    block OsmoticPermeabilityConst "Constant signal of type OsmoticPermeability"
      parameter Types.OsmoticPermeability k "Constant OsmoticPermeability output value";
      RealIO.OsmoticPermeabilityOutput y "OsmoticPermeability constant" annotation (
        Placement(transformation(extent = {{40, -10}, {60, 10}}), iconTransformation(extent = {{40, -10}, {60, 10}})));
    equation
      y = k;
      annotation (
        defaultComponentName = "osmoticPermeability",
        Diagram(coordinateSystem(extent = {{-40, -40}, {40, 40}})),
        Icon(coordinateSystem(extent = {{-40, -40}, {40, 40}}, preserveAspectRatio = false), graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0}, radius = 10, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid), Text(extent = {{-100, -44}, {100, -64}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "%name"), Text(extent = {{-40, 10}, {40, -10}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "Const")}));
    end OsmoticPermeabilityConst;

    block PressureConst "Constant signal of type Pressure"
      parameter Types.Pressure k "Constant Pressure output value";
      RealIO.PressureOutput y "Pressure constant" annotation (
        Placement(transformation(extent = {{40, -10}, {60, 10}}), iconTransformation(extent = {{40, -10}, {60, 10}})));
    equation
      y = k;
      annotation (
        defaultComponentName = "pressure",
        Diagram(coordinateSystem(extent = {{-40, -40}, {40, 40}})),
        Icon(coordinateSystem(extent = {{-40, -40}, {40, 40}}, preserveAspectRatio = false), graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0}, radius = 10, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid), Text(extent = {{-100, -44}, {100, -64}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "%name"), Text(extent = {{-40, 10}, {40, -10}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "Const")}));
    end PressureConst;

    block SpecificEnergyConst "Constant signal of type SpecificEnergy"
      parameter Types.SpecificEnergy k "Constant SpecificEnergy output value";
      RealIO.SpecificEnergyOutput y "SpecificEnergy constant" annotation (
        Placement(transformation(extent = {{40, -10}, {60, 10}}), iconTransformation(extent = {{40, -10}, {60, 10}})));
    equation
      y = k;
      annotation (
        defaultComponentName = "specificEnergy",
        Diagram(coordinateSystem(extent = {{-40, -40}, {40, 40}})),
        Icon(coordinateSystem(extent = {{-40, -40}, {40, 40}}, preserveAspectRatio = false), graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0}, radius = 10, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid), Text(extent = {{-100, -44}, {100, -64}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "%name"), Text(extent = {{-40, 10}, {40, -10}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "Const")}));
    end SpecificEnergyConst;

    block SpecificEnthalpyConst "Constant signal of type SpecificEnthalpy"
      parameter Types.SpecificEnthalpy k "Constant SpecificEnthalpy output value";
      RealIO.SpecificEnthalpyOutput y "SpecificEnthalpy constant" annotation (
        Placement(transformation(extent = {{40, -10}, {60, 10}}), iconTransformation(extent = {{40, -10}, {60, 10}})));
    equation
      y = k;
      annotation (
        defaultComponentName = "specificEnthalpy",
        Diagram(coordinateSystem(extent = {{-40, -40}, {40, 40}})),
        Icon(coordinateSystem(extent = {{-40, -40}, {40, 40}}, preserveAspectRatio = false), graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0}, radius = 10, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid), Text(extent = {{-100, -44}, {100, -64}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "%name"), Text(extent = {{-40, 10}, {40, -10}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "Const")}));
    end SpecificEnthalpyConst;

    block SpecificHeatCapacityConst "Constant signal of type SpecificHeatCapacity"
      parameter Types.SpecificHeatCapacity k "Constant SpecificHeatCapacity output value";
      RealIO.SpecificHeatCapacityOutput y "SpecificHeatCapacity constant" annotation (
        Placement(transformation(extent = {{40, -10}, {60, 10}}), iconTransformation(extent = {{40, -10}, {60, 10}})));
    equation
      y = k;
      annotation (
        defaultComponentName = "specificHeatCapacity",
        Diagram(coordinateSystem(extent = {{-40, -40}, {40, 40}})),
        Icon(coordinateSystem(extent = {{-40, -40}, {40, 40}}, preserveAspectRatio = false), graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0}, radius = 10, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid), Text(extent = {{-100, -44}, {100, -64}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "%name"), Text(extent = {{-40, 10}, {40, -10}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "Const")}));
    end SpecificHeatCapacityConst;

    block TemperatureConst "Constant signal of type Temperature"
      parameter Types.Temperature k "Constant Temperature output value";
      RealIO.TemperatureOutput y "Temperature constant" annotation (
        Placement(transformation(extent = {{40, -10}, {60, 10}}), iconTransformation(extent = {{40, -10}, {60, 10}})));
    equation
      y = k;
      annotation (
        defaultComponentName = "temperature",
        Diagram(coordinateSystem(extent = {{-40, -40}, {40, 40}})),
        Icon(coordinateSystem(extent = {{-40, -40}, {40, 40}}, preserveAspectRatio = false), graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0}, radius = 10, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid), Text(extent = {{-100, -44}, {100, -64}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "%name"), Text(extent = {{-40, 10}, {40, -10}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "Const")}));
    end TemperatureConst;

    block ThermalConductanceConst "Constant signal of type ThermalConductance"
      parameter Types.ThermalConductance k "Constant ThermalConductance output value";
      RealIO.ThermalConductanceOutput y "ThermalConductance constant" annotation (
        Placement(transformation(extent = {{40, -10}, {60, 10}}), iconTransformation(extent = {{40, -10}, {60, 10}})));
    equation
      y = k;
      annotation (
        defaultComponentName = "thermalConductance",
        Diagram(coordinateSystem(extent = {{-40, -40}, {40, 40}})),
        Icon(coordinateSystem(extent = {{-40, -40}, {40, 40}}, preserveAspectRatio = false), graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0}, radius = 10, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid), Text(extent = {{-100, -44}, {100, -64}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "%name"), Text(extent = {{-40, 10}, {40, -10}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "Const")}));
    end ThermalConductanceConst;

    block TimeConst "Constant signal of type Time"
      parameter Types.Time k "Constant Time output value";
      RealIO.TimeOutput y "Time constant" annotation (
        Placement(transformation(extent = {{40, -10}, {60, 10}}), iconTransformation(extent = {{40, -10}, {60, 10}})));
    equation
      y = k;
      annotation (
        defaultComponentName = "time",
        Diagram(coordinateSystem(extent = {{-40, -40}, {40, 40}})),
        Icon(coordinateSystem(extent = {{-40, -40}, {40, 40}}, preserveAspectRatio = false), graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0}, radius = 10, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid), Text(extent = {{-100, -44}, {100, -64}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "%name"), Text(extent = {{-40, 10}, {40, -10}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "Const")}));
    end TimeConst;

    block VolumeFlowRateConst "Constant signal of type VolumeFlowRate"
      parameter Types.VolumeFlowRate k "Constant VolumeFlowRate output value";
      RealIO.VolumeFlowRateOutput y "VolumeFlowRate constant" annotation (
        Placement(transformation(extent = {{40, -10}, {60, 10}}), iconTransformation(extent = {{40, -10}, {60, 10}})));
    equation
      y = k;
      annotation (
        defaultComponentName = "volumeFlowRate",
        Diagram(coordinateSystem(extent = {{-40, -40}, {40, 40}})),
        Icon(coordinateSystem(extent = {{-40, -40}, {40, 40}}, preserveAspectRatio = false), graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0}, radius = 10, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid), Text(extent = {{-100, -44}, {100, -64}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "%name"), Text(extent = {{-40, 10}, {40, -10}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "Const")}));
    end VolumeFlowRateConst;

    block VolumeConst "Constant signal of type Volume"
      parameter Types.Volume k "Constant Volume output value";
      RealIO.VolumeOutput y "Volume constant" annotation (
        Placement(transformation(extent = {{40, -10}, {60, 10}}), iconTransformation(extent = {{40, -10}, {60, 10}})));
    equation
      y = k;
      annotation (
        defaultComponentName = "volume",
        Diagram(coordinateSystem(extent = {{-40, -40}, {40, 40}})),
        Icon(coordinateSystem(extent = {{-40, -40}, {40, 40}}, preserveAspectRatio = false), graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0}, radius = 10, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid), Text(extent = {{-100, -44}, {100, -64}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "%name"), Text(extent = {{-40, 10}, {40, -10}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "Const")}));
    end VolumeConst;

    block DeprecatedUntypedConstant "Deprecated Untyped Constant for automatic conversion from initial versions of Physiolibrary"
      extends Modelica.Icons.ObsoleteModel;
      parameter Real k "Untyped constant output value";
      parameter String varName = "";
      parameter String units = "1";
      Modelica.Blocks.Interfaces.RealOutput y "Untyped constant" annotation (
        Placement(transformation(extent = {{40, -10}, {60, 10}}), iconTransformation(extent = {{40, -10}, {60, 10}})));
    equation
      y = k;
      annotation (
        defaultComponentName = "acceleration",
        Icon(coordinateSystem(extent = {{-40, -40}, {40, 40}}, preserveAspectRatio = false), graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0}, radius = 10, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid), Text(extent = {{-100, -44}, {100, -64}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "%name"), Text(extent = {{-40, 10}, {40, -10}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "Const")}));
    end DeprecatedUntypedConstant;

    block pHConst "Constant signal of type pH"
      parameter Types.pH k "Constant pH output value";
      Types.RealIO.pHOutput y "pH constant" annotation (
        Placement(transformation(extent = {{40, -10}, {60, 10}}), iconTransformation(extent = {{40, -10}, {60, 10}})));
    equation
      y = k;
      annotation (
        defaultComponentName = "pH",
        Diagram(coordinateSystem(extent = {{-40, -40}, {40, 40}})),
        Icon(coordinateSystem(extent = {{-40, -40}, {40, 40}}, preserveAspectRatio = false), graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0}, radius = 10, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid), Text(extent = {{-100, -44}, {100, -64}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "%name"), Text(extent = {{-40, 10}, {40, -10}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "Const")}));
    end pHConst;

    block VolumeDensityOfChargeConst "Constant signal of type VolumeDensityOfCharge"
      parameter Types.VolumeDensityOfCharge k "Constant VolumeDensityOfCharge output value";
      Types.RealIO.VolumeDensityOfChargeOutput y "VolumeDensityOfCharge constant" annotation (
        Placement(transformation(extent = {{40, -10}, {60, 10}}), iconTransformation(extent = {{40, -10}, {60, 10}})));
    equation
      y = k;
      annotation (
        defaultComponentName = "volumeDensityOfCharge",
        Diagram(coordinateSystem(extent = {{-40, -40}, {40, 40}})),
        Icon(coordinateSystem(extent = {{-40, -40}, {40, 40}}, preserveAspectRatio = false), graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0}, radius = 10, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid), Text(extent = {{-100, -44}, {100, -64}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "%name"), Text(extent = {{-40, 10}, {40, -10}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "Const")}));
    end VolumeDensityOfChargeConst;

    block VelocityConst "Constant signal of type Velocity"
      parameter Types.Velocity k "Constant Velocity output value";
      Types.RealIO.VelocityOutput y "Velocity constant" annotation (
        Placement(transformation(extent = {{40, -10}, {60, 10}}), iconTransformation(extent = {{40, -10}, {60, 10}})));
    equation
      y = k;
      annotation (
        defaultComponentName = "velocity",
        Diagram(coordinateSystem(extent = {{-40, -40}, {40, 40}})),
        Icon(coordinateSystem(extent = {{-40, -40}, {40, 40}}, preserveAspectRatio = false), graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0}, radius = 10, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid), Text(extent = {{-100, -44}, {100, -64}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "%name"), Text(extent = {{-40, 10}, {40, -10}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "Const")}));
    end VelocityConst;

    block PowerConst "Constant signal of type Power"
      parameter Types.Power k "Constant Power output value";
      RealIO.PowerOutput y "Power constant" annotation (
        Placement(transformation(extent = {{40, -10}, {60, 10}}), iconTransformation(extent = {{40, -10}, {60, 10}})));
    equation
      y = k;
      annotation (
        defaultComponentName = "power",
        Diagram(coordinateSystem(extent = {{-40, -40}, {40, 40}})),
        Icon(coordinateSystem(extent = {{-40, -40}, {40, 40}}, preserveAspectRatio = false), graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0}, radius = 10, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid), Text(extent = {{-100, -44}, {100, -64}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "%name"), Text(extent = {{-40, 10}, {40, -10}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "Const")}));
    end PowerConst;

    block PositionConst "Constant signal of type Position"
      parameter Types.Position k "Constant Position output value";
      RealIO.PositionOutput y "Position constant" annotation (
        Placement(transformation(extent = {{40, -10}, {60, 10}}), iconTransformation(extent = {{40, -10}, {60, 10}})));
    equation
      y = k;
      annotation (
        defaultComponentName = "height",
        Diagram(coordinateSystem(extent = {{-40, -40}, {40, 40}})),
        Icon(coordinateSystem(extent = {{-40, -40}, {40, 40}}, preserveAspectRatio = false), graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0}, radius = 10, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid), Text(extent = {{-100, -44}, {100, -64}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "%name"), Text(extent = {{-40, 10}, {40, -10}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "Const")}));
    end PositionConst;

    block MolarEnergyConst "Constant signal of type MolarEnergy"
      parameter Types.MolarEnergy k "Constant MolarEnergy output value";
      RealIO.MolarEnergyOutput y "MolarEnergy constant" annotation (
        Placement(transformation(extent = {{40, -10}, {60, 10}}), iconTransformation(extent = {{40, -10}, {60, 10}})));
    equation
      y = k;
      annotation (
        defaultComponentName = "molarEnergy",
        Diagram(coordinateSystem(extent = {{-40, -40}, {40, 40}})),
        Icon(coordinateSystem(extent = {{-40, -40}, {40, 40}}, preserveAspectRatio = false), graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0}, radius = 10, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid), Text(extent = {{-100, -44}, {100, -64}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "%name"), Text(extent = {{-40, 10}, {40, -10}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "Const")}));
    end MolarEnergyConst;

    block OneConst "1"
      RealIO.FractionOutput y "=1" annotation (
        Placement(transformation(extent = {{40, -10}, {60, 10}}), iconTransformation(extent = {{40, -10}, {60, 10}})));
    equation
      y = 1;
      annotation (
        defaultComponentName = "one",
        Diagram(coordinateSystem(extent = {{-40, -40}, {40, 40}})),
        Icon(coordinateSystem(extent = {{-40, -40}, {40, 40}}, preserveAspectRatio = false), graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0}, radius = 10, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid), Text(extent = {{-100, -44}, {100, -64}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "%name"), Text(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "1")}));
    end OneConst;

    block PopulationConst "Constant signal of type Population"
      parameter Types.Population k "Constant Population output value";
      RealIO.PopulationOutput y "Population constant" annotation (
        Placement(transformation(extent = {{40, -10}, {60, 10}}), iconTransformation(extent = {{40, -10}, {60, 10}})));
    equation
      y = k;
      annotation (
        defaultComponentName = "population",
        Diagram(coordinateSystem(extent = {{-40, -40}, {40, 40}})),
        Icon(coordinateSystem(extent = {{-40, -40}, {40, 40}}, preserveAspectRatio = false), graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0}, radius = 10, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid), Text(extent = {{-100, -44}, {100, -64}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "%name"), Text(extent = {{-40, 10}, {40, -10}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "Const")}));
    end PopulationConst;

    block PopulationChangeConst "Constant signal of type PopulationChange"
      parameter Types.PopulationChange k "Constant PopulationChange output value";
      RealIO.PopulationChangeOutput y "PopulationChange constant" annotation (
        Placement(transformation(extent = {{40, -10}, {60, 10}}), iconTransformation(extent = {{40, -10}, {60, 10}})));
    equation
      y = k;
      annotation (
        defaultComponentName = "populationChange",
        Diagram(coordinateSystem(extent = {{-40, -40}, {40, 40}})),
        Icon(coordinateSystem(extent = {{-40, -40}, {40, 40}}, preserveAspectRatio = false), graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0}, radius = 10, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid), Text(extent = {{-100, -44}, {100, -64}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "%name"), Text(extent = {{-40, 10}, {40, -10}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "Const")}));
    end PopulationChangeConst;

    block PopulationChangePerMemberConst "Constant signal of type PopulationChangePerMember"
      parameter Types.Time LifeTime "Mean lifetime as 1/PopulationChangePerMember output value";
      RealIO.PopulationChangePerMemberOutput y "PopulationChangePerMember constant" annotation (
        Placement(transformation(extent = {{40, -10}, {60, 10}}), iconTransformation(extent = {{40, -10}, {60, 10}})));
    equation
      y = 1 / LifeTime;
      annotation (
        defaultComponentName = "populationChangePerMember",
        Diagram(coordinateSystem(extent = {{-40, -40}, {40, 40}})),
        Icon(coordinateSystem(extent = {{-40, -40}, {40, 40}}, preserveAspectRatio = false), graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0}, radius = 10, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid), Text(extent = {{-100, -44}, {100, -64}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "%name"), Text(extent = {{-40, 10}, {40, -10}}, lineColor = {0, 0, 0}, fillColor = {236, 236, 236}, fillPattern = FillPattern.Solid, textString = "Const")}));
    end PopulationChangePerMemberConst;
  end Constants;

  package RealIO
    extends Modelica.Icons.Package;
    connector AccelerationInput = input Acceleration "input Acceleration as connector" annotation (
      defaultComponentName = "acceleration",
      Icon(graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid)}, coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.2)),
      Diagram(coordinateSystem(preserveAspectRatio = true, initialScale = 0.2, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid), Text(extent = {{-10, 85}, {-10, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
            <p>
            Connector with one input signal of type Acceleration.
            </p>
            </html>"));
    connector AccelerationOutput = output Acceleration "output Acceleration as connector" annotation (
      defaultComponentName = "acceleration",
      Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 50}, {0, 0}, {-100, -50}, {-100, 50}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{30, 110}, {30, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
    connector AmountOfSubstanceInput = input AmountOfSubstance "input AmountOfSubstance as connector" annotation (
      defaultComponentName = "amountofsubstance",
      Icon(graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid)}, coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.2)),
      Diagram(coordinateSystem(preserveAspectRatio = true, initialScale = 0.2, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid), Text(extent = {{-10, 85}, {-10, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
            <p>
            Connector with one input signal of type AmountOfSubstance.
            </p>
            </html>"));
    connector AmountOfSubstanceOutput = output AmountOfSubstance "output AmountOfSubstance as connector" annotation (
      defaultComponentName = "amountofsubstance",
      Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 50}, {0, 0}, {-100, -50}, {-100, 50}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{30, 110}, {30, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
    connector ConcentrationInput = input Concentration "input Concentration as connector" annotation (
      defaultComponentName = "concentration",
      Icon(graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid)}, coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.2)),
      Diagram(coordinateSystem(preserveAspectRatio = true, initialScale = 0.2, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid), Text(extent = {{-10, 85}, {-10, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
            <p>
            Connector with one input signal of type Concentration.
            </p>
            </html>"));
    connector ConcentrationOutput = output Concentration "output Concentration as connector" annotation (
      defaultComponentName = "concentration",
      Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 50}, {0, 0}, {-100, -50}, {-100, 50}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{30, 110}, {30, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
    connector DiffusionPermeabilityInput = input DiffusionPermeability "input DiffusionPermeability as connector" annotation (
      defaultComponentName = "diffusionmembranepermeability",
      Icon(graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid)}, coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.2)),
      Diagram(coordinateSystem(preserveAspectRatio = true, initialScale = 0.2, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid), Text(extent = {{-10, 85}, {-10, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
            <p>
            Connector with one input signal of type DiffusionMembranePermeability.
            </p>
            </html>"));
    connector DiffusionPermeabilityOutput = output DiffusionPermeability "output DiffusionPermeability as connector" annotation (
      defaultComponentName = "diffusionmembranepermeability",
      Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 50}, {0, 0}, {-100, -50}, {-100, 50}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{30, 110}, {30, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
    connector ElectricCurrentInput = input ElectricCurrent "input ElectricCurrent as connector" annotation (
      defaultComponentName = "electriccurrent",
      Icon(graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid)}, coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.2)),
      Diagram(coordinateSystem(preserveAspectRatio = true, initialScale = 0.2, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid), Text(extent = {{-10, 85}, {-10, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
            <p>
            Connector with one input signal of type ElectricCurrent.
            </p>
            </html>"));
    connector ElectricCurrentOutput = output ElectricCurrent "output ElectricCurrent as connector" annotation (
      defaultComponentName = "electriccurrent",
      Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 50}, {0, 0}, {-100, -50}, {-100, 50}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{30, 110}, {30, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
    connector ElectricChargeInput = input ElectricCharge "input ElectricCharge as connector" annotation (
      defaultComponentName = "electriccharge",
      Icon(graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid)}, coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.2)),
      Diagram(coordinateSystem(preserveAspectRatio = true, initialScale = 0.2, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid), Text(extent = {{-10, 85}, {-10, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
            <p>
            Connector with one input signal of type ElectricCharge.
            </p>
            </html>"));
    connector ElectricChargeOutput = output ElectricCharge "output ElectricCharge as connector" annotation (
      defaultComponentName = "electriccharge",
      Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 50}, {0, 0}, {-100, -50}, {-100, 50}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{30, 110}, {30, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
    connector EnergyInput = input Energy "input Energy as connector" annotation (
      defaultComponentName = "energy",
      Icon(graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid)}, coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.2)),
      Diagram(coordinateSystem(preserveAspectRatio = true, initialScale = 0.2, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid), Text(extent = {{-10, 85}, {-10, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
            <p>
            Connector with one input signal of type Energy.
            </p>
            </html>"));
    connector EnergyOutput = output Energy "output Energy as connector" annotation (
      defaultComponentName = "energy",
      Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 50}, {0, 0}, {-100, -50}, {-100, 50}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{30, 110}, {30, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
    connector EnthalpyInput = input Enthalpy "input Enthalpy as connector" annotation (
      defaultComponentName = "enthalpy",
      Icon(graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid)}, coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.2)),
      Diagram(coordinateSystem(preserveAspectRatio = true, initialScale = 0.2, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid), Text(extent = {{-10, 85}, {-10, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
            <p>
            Connector with one input signal of type Enthalpy.
            </p>
            </html>"));
    connector EnthalpyOutput = output Enthalpy "output Enthalpy as connector" annotation (
      defaultComponentName = "enthalpy",
      Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 50}, {0, 0}, {-100, -50}, {-100, 50}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{30, 110}, {30, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
    connector MolarEnthalpyInput = input MolarEnthalpy "input MolarEnthalpy as connector" annotation (
      defaultComponentName = "molarEnthalpy",
      Icon(graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid)}, coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.2)),
      Diagram(coordinateSystem(preserveAspectRatio = true, initialScale = 0.2, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid), Text(extent = {{-10, 85}, {-10, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
            <p>
            Connector with one input signal of type MolarEnthalpy.
            </p>
            </html>"));
    connector MolarEnthalpyOutput = output MolarEnthalpy "output MolarEnthalpy as connector" annotation (
      defaultComponentName = "molarEnthalpy",
      Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 50}, {0, 0}, {-100, -50}, {-100, 50}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{30, 110}, {30, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
    connector HeatInput = input Heat "input Heat as connector" annotation (
      defaultComponentName = "heat",
      Icon(graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid)}, coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.2)),
      Diagram(coordinateSystem(preserveAspectRatio = true, initialScale = 0.2, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid), Text(extent = {{-10, 85}, {-10, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
            <p>
            Connector with one input signal of type Heat.
            </p>
            </html>"));
    connector HeatOutput = output Heat "output Heat as connector" annotation (
      defaultComponentName = "heat",
      Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 50}, {0, 0}, {-100, -50}, {-100, 50}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{30, 110}, {30, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
    connector HeatFlowRateInput = input HeatFlowRate "input HeatFlowRate as connector" annotation (
      defaultComponentName = "heatflowrate",
      Icon(graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid)}, coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.2)),
      Diagram(coordinateSystem(preserveAspectRatio = true, initialScale = 0.2, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid), Text(extent = {{-10, 85}, {-10, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
            <p>
            Connector with one input signal of type HeatFlowRate.
            </p>
            </html>"));
    connector HeatFlowRateOutput = output HeatFlowRate "output HeatFlowRate as connector" annotation (
      defaultComponentName = "heatflowrate",
      Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 50}, {0, 0}, {-100, -50}, {-100, 50}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{30, 110}, {30, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
    connector HeightInput = input Height "input Height as connector" annotation (
      defaultComponentName = "height",
      Icon(graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid)}, coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.2)),
      Diagram(coordinateSystem(preserveAspectRatio = true, initialScale = 0.2, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid), Text(extent = {{-10, 85}, {-10, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
            <p>
            Connector with one input signal of type Height.
            </p>
            </html>"));
    connector HeightOutput = output Height "output Height as connector" annotation (
      defaultComponentName = "height",
      Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 50}, {0, 0}, {-100, -50}, {-100, 50}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{30, 110}, {30, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
    connector MassInput = input Mass "input Mass as connector" annotation (
      defaultComponentName = "mass",
      Icon(graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid)}, coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.2)),
      Diagram(coordinateSystem(preserveAspectRatio = true, initialScale = 0.2, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid), Text(extent = {{-10, 85}, {-10, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
            <p>
            Connector with one input signal of type Mass.
            </p>
            </html>"));
    connector MassOutput = output Mass "output Mass as connector" annotation (
      defaultComponentName = "mass",
      Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 50}, {0, 0}, {-100, -50}, {-100, 50}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{30, 110}, {30, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
    connector MassFractionInput = input MassFraction "input Mass Fraction as connector" annotation (
      defaultComponentName = "massFraction",
      Icon(graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid)}, coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.2)),
      Diagram(coordinateSystem(preserveAspectRatio = true, initialScale = 0.2, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid), Text(extent = {{-10, 85}, {-10, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
            <p>
            Connector with one input signal of type MassFraction.
            </p>
            </html>"));
    connector MassFractionOutput = output MassFraction "output MassFraction as connector" annotation (
      defaultComponentName = "massFraction",
      Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 50}, {0, 0}, {-100, -50}, {-100, 50}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{30, 110}, {30, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
    connector MassFlowRateInput = input MassFlowRate "input MassFlowRate as connector" annotation (
      defaultComponentName = "massflowrate",
      Icon(graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid)}, coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.2)),
      Diagram(coordinateSystem(preserveAspectRatio = true, initialScale = 0.2, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid), Text(extent = {{-10, 85}, {-10, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
            <p>
            Connector with one input signal of type MassFlowRate.
            </p>
            </html>"));
    connector MassFlowRateOutput = output MassFlowRate "output MassFlowRate as connector" annotation (
      defaultComponentName = "massflowrate",
      Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 50}, {0, 0}, {-100, -50}, {-100, 50}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{30, 110}, {30, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
    connector MolarFlowRateInput = input MolarFlowRate "input MolarFlowRate as connector" annotation (
      defaultComponentName = "molarflowrate",
      Icon(graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid)}, coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.2)),
      Diagram(coordinateSystem(preserveAspectRatio = true, initialScale = 0.2, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid), Text(extent = {{-10, 85}, {-10, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
            <p>
            Connector with one input signal of type MolarFlowRate.
            </p>
            </html>"));
    connector MolarFlowRateOutput = output MolarFlowRate "output MolarFlowRate as connector" annotation (
      defaultComponentName = "molarflowrate",
      Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 50}, {0, 0}, {-100, -50}, {-100, 50}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{30, 110}, {30, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
    connector OsmolarityInput = input Osmolarity "input Concentration as connector" annotation (
      defaultComponentName = "osmolarity",
      Icon(graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid)}, coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.2)),
      Diagram(coordinateSystem(preserveAspectRatio = true, initialScale = 0.2, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid), Text(extent = {{-10, 85}, {-10, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
            <p>
            Connector with one input signal of type Concentration.
            </p>
            </html>"));
    connector OsmolarityOutput = output Osmolarity "output Concentration as connector" annotation (
      defaultComponentName = "osmolarity",
      Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 50}, {0, 0}, {-100, -50}, {-100, 50}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{30, 110}, {30, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
    connector PressureInput = input Pressure "input Pressure as connector" annotation (
      defaultComponentName = "pressure",
      Icon(graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid)}, coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.2)),
      Diagram(coordinateSystem(preserveAspectRatio = true, initialScale = 0.2, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid), Text(extent = {{-10, 85}, {-10, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
            <p>
            Connector with one input signal of type Pressure.
            </p>
            </html>"));
    connector PressureOutput = output Pressure "output Pressure as connector" annotation (
      defaultComponentName = "pressure",
      Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 50}, {0, 0}, {-100, -50}, {-100, 50}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{30, 110}, {30, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
    connector VolumeInput = input Volume "input Volume as connector" annotation (
      defaultComponentName = "volume",
      Icon(graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid)}, coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.2)),
      Diagram(coordinateSystem(preserveAspectRatio = true, initialScale = 0.2, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid), Text(extent = {{-10, 85}, {-10, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
            <p>
            Connector with one input signal of type Volume.
            </p>
            </html>"));
    connector VolumeOutput = output Volume "output Volume as connector" annotation (
      defaultComponentName = "volume",
      Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 50}, {0, 0}, {-100, -50}, {-100, 50}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{30, 110}, {30, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
    connector VolumeFlowRateInput = input VolumeFlowRate "input VolumeFlowRate as connector" annotation (
      defaultComponentName = "volumeflowrate",
      Icon(graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid)}, coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.2)),
      Diagram(coordinateSystem(preserveAspectRatio = true, initialScale = 0.2, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid), Text(extent = {{-10, 85}, {-10, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
            <p>
            Connector with one input signal of type VolumeFlowRate.
            </p>
            </html>"));
    connector VolumeFlowRateOutput = output VolumeFlowRate "output VolumeFlowRate as connector" annotation (
      defaultComponentName = "volumeflowrate",
      Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 50}, {0, 0}, {-100, -50}, {-100, 50}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{30, 110}, {30, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
    connector TemperatureInput = input Temperature "input Temperature as connector" annotation (
      defaultComponentName = "temperature",
      Icon(graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid)}, coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.2)),
      Diagram(coordinateSystem(preserveAspectRatio = true, initialScale = 0.2, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid), Text(extent = {{-10, 85}, {-10, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
            <p>
            Connector with one input signal of type Temperature.
            </p>
            </html>"));
    connector TemperatureOutput = output Temperature "output Temperature as connector" annotation (
      defaultComponentName = "temperature",
      Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 50}, {0, 0}, {-100, -50}, {-100, 50}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{30, 110}, {30, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
    connector TimeInput = input Time "input Time as connector" annotation (
      defaultComponentName = "time",
      Icon(graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid)}, coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.2)),
      Diagram(coordinateSystem(preserveAspectRatio = true, initialScale = 0.2, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid), Text(extent = {{-10, 85}, {-10, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
            <p>
            Connector with one input signal of type Time.
            </p>
            </html>"));
    connector TimeOutput = output Time "output Time as connector" annotation (
      defaultComponentName = "time",
      Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 50}, {0, 0}, {-100, -50}, {-100, 50}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{30, 110}, {30, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
    connector ThermalConductanceInput = input ThermalConductance "input ThermalConductance as connector" annotation (
      defaultComponentName = "thermalconductance",
      Icon(graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid)}, coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.2)),
      Diagram(coordinateSystem(preserveAspectRatio = true, initialScale = 0.2, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid), Text(extent = {{-10, 85}, {-10, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
            <p>
            Connector with one input signal of type ThermalConductance.
            </p>
            </html>"));
    connector ThermalConductanceOutput = output ThermalConductance "output ThermalConductance as connector" annotation (
      defaultComponentName = "thermalconductance",
      Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 50}, {0, 0}, {-100, -50}, {-100, 50}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{30, 110}, {30, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
    connector ElectricPotentialInput = input ElectricPotential "input ElectricPotential as connector" annotation (
      defaultComponentName = "electricpotential",
      Icon(graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid)}, coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.2)),
      Diagram(coordinateSystem(preserveAspectRatio = true, initialScale = 0.2, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid), Text(extent = {{-10, 85}, {-10, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
            <p>
            Connector with one input signal of type ElectricPotential.
            </p>
            </html>"));
    connector ElectricPotentialOutput = output ElectricPotential "output ElectricPotential as connector" annotation (
      defaultComponentName = "electricpotential",
      Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 50}, {0, 0}, {-100, -50}, {-100, 50}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{30, 110}, {30, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
    connector FractionInput = input Fraction "input Fraction as connector" annotation (
      defaultComponentName = "fraction",
      Icon(graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid)}, coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.2)),
      Diagram(coordinateSystem(preserveAspectRatio = true, initialScale = 0.2, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid), Text(extent = {{-10, 85}, {-10, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
            <p>
            Connector with one input signal of type Fraction.
            </p>
            </html>"));
    connector FractionOutput = output Fraction "output Fraction as connector" annotation (
      defaultComponentName = "fraction",
      Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 50}, {0, 0}, {-100, -50}, {-100, 50}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{30, 110}, {30, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
    connector FrequencyInput = input Frequency "input Frequency as connector" annotation (
      defaultComponentName = "frequency",
      Icon(graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid)}, coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.2)),
      Diagram(coordinateSystem(preserveAspectRatio = true, initialScale = 0.2, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid), Text(extent = {{-10, 85}, {-10, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
            <p>
            Connector with one input signal of type Frequency.
            </p>
            </html>"));
    connector FrequencyOutput = output Frequency "output Frequency as connector" annotation (
      defaultComponentName = "frequency",
      Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 50}, {0, 0}, {-100, -50}, {-100, 50}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{30, 110}, {30, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
          <p>
          Connector with one output signal of type Frequency.
          </p>
          </html>"));
    connector OsmoticPermeabilityInput = input OsmoticPermeability "input OsmoticPermeability as connector" annotation (
      defaultComponentName = "osmoticmembranepermeability",
      Icon(graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid)}, coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.2)),
      Diagram(coordinateSystem(preserveAspectRatio = true, initialScale = 0.2, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid), Text(extent = {{-10, 85}, {-10, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
            <p>
            Connector with one input signal of type OsmoticMembranePermeability.
            </p>
            </html>"));
    connector OsmoticPermeabilityOutput = output OsmoticPermeability "output OsmoticPermeability as connector" annotation (
      defaultComponentName = "osmoticmembranepermeability",
      Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 50}, {0, 0}, {-100, -50}, {-100, 50}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{30, 110}, {30, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
    connector HydraulicConductanceInput = input HydraulicConductance "input HydraulicConductance as connector" annotation (
      defaultComponentName = "hydraulicconductance",
      Icon(graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid)}, coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.2)),
      Diagram(coordinateSystem(preserveAspectRatio = true, initialScale = 0.2, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid), Text(extent = {{-10, 85}, {-10, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
            <p>
            Connector with one input signal of type HydraulicConductance.
            </p>
            </html>"));
    connector HydraulicConductanceOutput = output HydraulicConductance "output HydraulicConductance as connector" annotation (
      defaultComponentName = "hydraulicconductance",
      Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 50}, {0, 0}, {-100, -50}, {-100, 50}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{30, 110}, {30, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
    connector HydraulicResistanceInput = input HydraulicResistance "input HydraulicResistance as connector" annotation (
      defaultComponentName = "hydraulicResistance",
      Icon(graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid)}, coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.2)),
      Diagram(coordinateSystem(preserveAspectRatio = true, initialScale = 0.2, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid), Text(extent = {{-10, 85}, {-10, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
            <p>
            Connector with one input signal of type HydraulicResistance.
            </p>
            </html>"));
    connector HydraulicResistanceOutput = output HydraulicResistance "output HydraulicResistance as connector" annotation (
      defaultComponentName = "hydraulicResistance",
      Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 50}, {0, 0}, {-100, -50}, {-100, 50}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{30, 110}, {30, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
    connector HydraulicComplianceInput = input HydraulicCompliance "input HydraulicCompliance as connector" annotation (
      defaultComponentName = "hydrauliccompliance",
      Icon(graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid)}, coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.2)),
      Diagram(coordinateSystem(preserveAspectRatio = true, initialScale = 0.2, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid), Text(extent = {{-10, 85}, {-10, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
            <p>
            Connector with one input signal of type HydraulicCompliance.
            </p>
            </html>"));
    connector HydraulicComplianceOutput = output HydraulicCompliance "output HydraulicCompliance as connector" annotation (
      defaultComponentName = "hydrauliccompliance",
      Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 50}, {0, 0}, {-100, -50}, {-100, 50}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{30, 110}, {30, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
    connector HydraulicElastanceInput = input HydraulicElastance "input HydraulicElastance as connector" annotation (
      defaultComponentName = "hydraulicelastance",
      Icon(graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid)}, coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.2)),
      Diagram(coordinateSystem(preserveAspectRatio = true, initialScale = 0.2, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid), Text(extent = {{-10, 85}, {-10, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
            <p>
            Connector with one input signal of type HydraulicElastance.
            </p>
            </html>"));
    connector HydraulicElastanceOutput = output HydraulicElastance "output HydraulicElastance as connector" annotation (
      defaultComponentName = "hydraulicelastance",
      Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 50}, {0, 0}, {-100, -50}, {-100, 50}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{30, 110}, {30, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
    connector DensityInput = input Density "input Density as connector" annotation (
      defaultComponentName = "density",
      Icon(graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid)}, coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.2)),
      Diagram(coordinateSystem(preserveAspectRatio = true, initialScale = 0.2, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid), Text(extent = {{-10, 85}, {-10, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
            <p>
            Connector with one input signal of type Volume.
            </p>
            </html>"));
    connector DensityOutput = output Density "output Density as connector" annotation (
      defaultComponentName = "density",
      Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 50}, {0, 0}, {-100, -50}, {-100, 50}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{30, 110}, {30, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
    connector HydraulicInertanceInput = input HydraulicInertance "input HydraulicInertance as connector" annotation (
      defaultComponentName = "hydraulicinertance",
      Icon(graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid)}, coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.2)),
      Diagram(coordinateSystem(preserveAspectRatio = true, initialScale = 0.2, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid), Text(extent = {{-10, 85}, {-10, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
            <p>
            Connector with one input signal of type HydraulicInertance.
            </p>
            </html>"));
    connector HydraulicInertanceOutput = output HydraulicInertance "output HydraulicInertance as connector" annotation (
      defaultComponentName = "hydraulicinertance",
      Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 50}, {0, 0}, {-100, -50}, {-100, 50}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{30, 110}, {30, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
    connector GasSolubilityInput = input GasSolubility "input GasSolubility as connector" annotation (
      defaultComponentName = "gassolubility",
      Icon(graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid)}, coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.2)),
      Diagram(coordinateSystem(preserveAspectRatio = true, initialScale = 0.2, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid), Text(extent = {{-10, 85}, {-10, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
            <p>
            Connector with one input signal of type GasSolubility.
            </p>
            </html>"));
    connector GasSolubilityOutput = output GasSolubility "output GasSolubility as connector" annotation (
      defaultComponentName = "gassolubility",
      Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 50}, {0, 0}, {-100, -50}, {-100, 50}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{30, 110}, {30, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
    connector SpecificEnergyInput = input SpecificEnergy "input SpecificEnergy as connector" annotation (
      defaultComponentName = "specificEnergy",
      Icon(graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid)}, coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.2)),
      Diagram(coordinateSystem(preserveAspectRatio = true, initialScale = 0.2, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid), Text(extent = {{-10, 85}, {-10, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
            <p>
            Connector with one input signal of type Volume.
            </p>
            </html>"));
    connector SpecificEnergyOutput = output SpecificEnergy "output SpecificEnergy as connector" annotation (
      defaultComponentName = "specificEnergy",
      Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 50}, {0, 0}, {-100, -50}, {-100, 50}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{30, 110}, {30, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
    connector SpecificEnthalpyInput = input SpecificEnthalpy "input SpecificEnthalpy as connector" annotation (
      defaultComponentName = "specificEnthalpy",
      Icon(graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid)}, coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.2)),
      Diagram(coordinateSystem(preserveAspectRatio = true, initialScale = 0.2, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid), Text(extent = {{-10, 85}, {-10, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
            <p>
            Connector with one input signal of type SpecificEnthalpy.
            </p>
            </html>"));
    connector SpecificEnthalpyOutput = output SpecificEnthalpy "output SpecificEnthalpy as connector" annotation (
      defaultComponentName = "specificEnthalpy",
      Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 50}, {0, 0}, {-100, -50}, {-100, 50}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{30, 110}, {30, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
    connector SpecificHeatCapacityInput = input SpecificHeatCapacity "input SpecificHeatCapacity as connector" annotation (
      defaultComponentName = "specificHeatCapacity",
      Icon(graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid)}, coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.2)),
      Diagram(coordinateSystem(preserveAspectRatio = true, initialScale = 0.2, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid), Text(extent = {{-10, 85}, {-10, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
            <p>
            Connector with one input signal of type Volume.
            </p>
            </html>"));
    connector SpecificHeatCapacityOutput = output SpecificHeatCapacity "output SpecificHeatCapacity as connector" annotation (
      defaultComponentName = "specificHeatCapacity",
      Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 50}, {0, 0}, {-100, -50}, {-100, 50}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{30, 110}, {30, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
    connector pHInput = input pH "input pH as connector" annotation (
      defaultComponentName = "pH",
      Icon(graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid)}, coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.2)),
      Diagram(coordinateSystem(preserveAspectRatio = true, initialScale = 0.2, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid), Text(extent = {{-10, 85}, {-10, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
            <p>
            Connector with one input signal of type pH.
            </p>
            </html>"));
    connector pHOutput = output pH "output pH as connector" annotation (
      defaultComponentName = "pH",
      Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 50}, {0, 0}, {-100, -50}, {-100, 50}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{30, 110}, {30, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
          <p>
          Connector with one output signal of type pH.
          </p>
          </html>"));
    connector VolumeDensityOfChargeInput = input VolumeDensityOfCharge "input VolumeDensityOfCharge as connector" annotation (
      defaultComponentName = "volumeDensityOfCharge",
      Icon(graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid)}, coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.2)),
      Diagram(coordinateSystem(preserveAspectRatio = true, initialScale = 0.2, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid), Text(extent = {{-10, 85}, {-10, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
            <p>
            Connector with one input signal of type VolumeDensityOfCharge.
            </p>
            </html>"));
    connector VolumeDensityOfChargeOutput = output VolumeDensityOfCharge "output VolumeDensityOfCharge as connector" annotation (
      defaultComponentName = "volumeDensityOfCharge",
      Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 50}, {0, 0}, {-100, -50}, {-100, 50}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{30, 110}, {30, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
          <p>
          Connector with one output signal of type VolumeDensityOfCharge.
          </p>
          </html>"));
    connector MassConcentrationInput = input MassConcentration "input MassConcentration as connector" annotation (
      defaultComponentName = "massConcentration",
      Icon(graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid)}, coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.2)),
      Diagram(coordinateSystem(preserveAspectRatio = true, initialScale = 0.2, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid), Text(extent = {{-10, 85}, {-10, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
            <p>
            Connector with one input signal of type MassConcentration.
            </p>
            </html>"));
    connector MassConcentrationOutput = output MassConcentration "output MassConcentration as connector" annotation (
      defaultComponentName = "massConcentration",
      Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 50}, {0, 0}, {-100, -50}, {-100, 50}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{30, 110}, {30, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
          <p>
          Connector with one output signal of type MassConcentration.
          </p>
          </html>"));
    connector VelocityInput = input Velocity "input Velocity as connector" annotation (
      defaultComponentName = "velocity",
      Icon(graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid)}, coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.2)),
      Diagram(coordinateSystem(preserveAspectRatio = true, initialScale = 0.2, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid), Text(extent = {{-10, 85}, {-10, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
            <p>
            Connector with one input signal of type Velocity.
            </p>
            </html>"));
    connector VelocityOutput = output Velocity "output Velocity as connector" annotation (
      defaultComponentName = "velocity",
      Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 50}, {0, 0}, {-100, -50}, {-100, 50}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{30, 110}, {30, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
          <p>
          Connector with one output signal of type Velocity.
          </p>
          </html>"));
    connector PowerInput = input Power "input Power as connector" annotation (
      defaultComponentName = "power",
      Icon(graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid)}, coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.2)),
      Diagram(coordinateSystem(preserveAspectRatio = true, initialScale = 0.2, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid), Text(extent = {{-10, 85}, {-10, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
            <p>
            Connector with one input signal of type Power.
            </p>
            </html>"));
    connector PowerOutput = output Power "output Power as connector" annotation (
      defaultComponentName = "power",
      Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 50}, {0, 0}, {-100, -50}, {-100, 50}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{30, 110}, {30, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
          <p>
          Connector with one output signal of type Power.
          </p>
          </html>"));
    connector PositionInput = input Position "input Position as connector" annotation (
      defaultComponentName = "position",
      Icon(graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid)}, coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.2)),
      Diagram(coordinateSystem(preserveAspectRatio = true, initialScale = 0.2, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid), Text(extent = {{-10, 85}, {-10, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
            <p>
            Connector with one input signal of type Position.
            </p>
            </html>"));
    connector PositionOutput = output Position "output Position as connector" annotation (
      defaultComponentName = "position",
      Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 50}, {0, 0}, {-100, -50}, {-100, 50}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{30, 110}, {30, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
          <p>
          Connector with one output signal of type Position.
          </p>
          </html>"));
    connector MolarEnergyInput = input MolarEnergy "input MolarEnergy as connector" annotation (
      defaultComponentName = "molarEnergy",
      Icon(graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid)}, coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.2)),
      Diagram(coordinateSystem(preserveAspectRatio = true, initialScale = 0.2, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid), Text(extent = {{-10, 85}, {-10, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
            <p>
            Connector with one input signal of type MolarEnergy.
            </p>
            </html>"));
    connector MolarEnergyOutput = output MolarEnergy "output MolarEnergy as connector" annotation (
      defaultComponentName = "molarEnergy",
      Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 50}, {0, 0}, {-100, -50}, {-100, 50}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{30, 110}, {30, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
          <p>
          Connector with one output signal of type MolarEnergy.
          </p>
          </html>"));
    connector PopulationInput = input Population "input Population as connector" annotation (
      defaultComponentName = "population",
      Icon(graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid)}, coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.2)),
      Diagram(coordinateSystem(preserveAspectRatio = true, initialScale = 0.2, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid), Text(extent = {{-10, 85}, {-10, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
            <p>
            Connector with one input signal of type Population.
            </p>
            </html>"));
    connector PopulationOutput = output Population "output Population as connector" annotation (
      defaultComponentName = "population",
      Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 50}, {0, 0}, {-100, -50}, {-100, 50}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{30, 110}, {30, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
          <p>
          Connector with one output signal of type Population.
          </p>
          </html>"));
    connector PopulationChangeInput = input PopulationChange "input PopulationChange as connector" annotation (
      defaultComponentName = "populationChange",
      Icon(graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid)}, coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.2)),
      Diagram(coordinateSystem(preserveAspectRatio = true, initialScale = 0.2, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid), Text(extent = {{-10, 85}, {-10, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
            <p>
            Connector with one input signal of type PopulationChange.
            </p>
            </html>"));
    connector PopulationChangeOutput = output PopulationChange "output PopulationChange as connector" annotation (
      defaultComponentName = "populationChange",
      Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 50}, {0, 0}, {-100, -50}, {-100, 50}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{30, 110}, {30, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
          <p>
          Connector with one output signal of type PopulationChange.
          </p>
          </html>"));
    connector PopulationChangePerMemberInput = input PopulationChangePerMember "input PopulationChangePerMember as connector" annotation (
      defaultComponentName = "populationChangePerMember",
      Icon(graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid)}, coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.2)),
      Diagram(coordinateSystem(preserveAspectRatio = true, initialScale = 0.2, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid), Text(extent = {{-10, 85}, {-10, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
            <p>
            Connector with one input signal of type PopulationChangePerMember.
            </p>
            </html>"));
    connector PopulationChangePerMemberOutput = output PopulationChangePerMember "output PopulationChangePerMember as connector" annotation (
      defaultComponentName = "populationChangePerMember",
      Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={  Polygon(points = {{-100, 50}, {0, 0}, {-100, -50}, {-100, 50}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{30, 110}, {30, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
          <p>
          Connector with one output signal of type PopulationChangePerMember.
          </p>
          </html>"));
  end RealIO;

  expandable connector BusConnector "Empty control bus that is adapted to the signals connected to it"
    annotation (
      Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}, initialScale = 0.2), graphics={  Rectangle(extent = {{-20, 2}, {20, -2}}, lineColor = {0, 0, 255}, lineThickness = 0.5), Polygon(points = {{-80, 50}, {80, 50}, {100, 30}, {80, -40}, {60, -50}, {-60, -50}, {-80, -40}, {-100, 30}, {-80, 50}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid), Ellipse(extent = {{-65, 25}, {-55, 15}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid), Ellipse(extent = {{-5, 25}, {5, 15}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid), Ellipse(extent = {{55, 25}, {65, 15}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid), Ellipse(extent = {{-35, -15}, {-25, -25}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid), Ellipse(extent = {{25, -15}, {35, -25}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}, initialScale = 0.2), graphics={  Polygon(points = {{-40, 25}, {40, 25}, {50, 15}, {40, -20}, {30, -25}, {-30, -25}, {-40, -20}, {-50, 15}, {-40, 25}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid), Ellipse(extent = {{-32.5, 7.5}, {-27.5, 12.5}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid), Ellipse(extent = {{-2.5, 12.5}, {2.5, 7.5}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid), Ellipse(extent = {{27.5, 12.5}, {32.5, 7.5}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid), Ellipse(extent = {{-17.5, -7.5}, {-12.5, -12.5}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid), Ellipse(extent = {{12.5, -7.5}, {17.5, -12.5}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid), Text(extent = {{-150, 70}, {150, 40}}, lineColor = {0, 0, 0}, textString = "%name")}),
      Documentation(info = "<html>
        <p>
        This connector defines the \"expandable connector\" that
        is used as bus in the Physiomodel (www.physiomodel.org).
        Note, this connector is \"empty\". When using it, the actual content is
        constructed by the signals connected to this bus.
        </p>
        </html>"));
  end BusConnector;

  expandable connector TissueBusConnector "Empty control bus that is adapted to the signals connected to it"
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}, initialScale = 0.2), graphics={  Rectangle(extent = {{-20, 2}, {20, -2}}, lineColor = {0, 0, 255}, lineThickness = 0.5), Polygon(
          points={{-80,50},{80,50},{100,30},{80,-40},{60,-50},{-60,-50},{-80,
              -40},{-100,30},{-80,50}},
          lineColor={0,0,0},
          fillColor={0,255,0},
          fillPattern=FillPattern.Solid),                                                                                                                                                                                                        Ellipse(extent = {{-65, 25}, {-55, 15}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid), Ellipse(extent = {{-5, 25}, {5, 15}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid), Ellipse(extent = {{55, 25}, {65, 15}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid), Ellipse(extent = {{-35, -15}, {-25, -25}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid), Ellipse(extent = {{25, -15}, {35, -25}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid)}),
    Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}, initialScale = 0.2), graphics={  Polygon(
          points={{-40,25},{40,25},{50,15},{40,-20},{30,-25},{-30,-25},{-40,-20},
              {-50,15},{-40,25}},
          lineColor={0,0,0},
          fillColor={0,255,0},
          fillPattern=FillPattern.Solid),                                                                                                                                                                                                        Ellipse(extent = {{-32.5, 7.5}, {-27.5, 12.5}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid), Ellipse(extent = {{-2.5, 12.5}, {2.5, 7.5}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid), Ellipse(extent = {{27.5, 12.5}, {32.5, 7.5}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid), Ellipse(extent = {{-17.5, -7.5}, {-12.5, -12.5}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid), Ellipse(extent = {{12.5, -7.5}, {17.5, -12.5}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid), Text(extent = {{-150, 70}, {150, 40}}, lineColor = {0, 0, 0}, textString = "%name")}),
    Documentation(info = "<html>
        <p>
        This connector defines the \"expandable connector\" that
        is used as bus in the Physiomodel (www.physiomodel.org).
        Note, this connector is \"empty\". When using it, the actual content is
        constructed by the signals connected to this bus.
        </p>
        </html>"));
  end TissueBusConnector;

  type Energy = Modelica.Units.SI.Energy(displayUnit = "kcal", nominal = 4186.8);
  type Time = Modelica.Units.SI.Time(displayUnit = "min", nominal = 60);
  type Frequency = Modelica.Units.SI.Frequency(displayUnit = "1/min");
  type Mass = Modelica.Units.SI.Mass(displayUnit = "g", nominal = 1e-3, min = 0, max = Modelica.Constants.inf);
  type MassFraction = Modelica.Units.SI.MassFraction(nominal = 0.1, min = ModelicaServices.Machine.small, max = Modelica.Constants.inf);
  type MassFlowRate = Modelica.Units.SI.MassFlowRate(displayUnit = "mg/min", nominal = 0.001);
  type Density = Modelica.Units.SI.Density(displayUnit = "kg/l", nominal = 1e-3);
  type MolarMass = Modelica.Units.SI.MolarMass(displayUnit = "kDa", nominal = 1);
  type Height = Modelica.Units.SI.Height(displayUnit = "cm", nominal = 1e-2);
  type Position = Modelica.Units.SI.Position(displayUnit = "cm", nominal = 1e-2);
  type Velocity = Modelica.Units.SI.Velocity(displayUnit = "km/h", nominal = 1);
  type Acceleration = Modelica.Units.SI.Acceleration(displayUnit = "m/s2", nominal = 1);
  type AbsolutePressure = Modelica.Units.SI.AbsolutePressure(displayUnit = "mmHg", nominal = 101325, min = 0, max = Modelica.Constants.inf);
  type Pressure = Modelica.Units.SI.Pressure(displayUnit = "mmHg", nominal = 1e5);
  type Volume = Modelica.Units.SI.Volume(displayUnit = "ml", nominal = 1e-6, min = 0, max = Modelica.Constants.inf);
  type VolumeFlowRate = Modelica.Units.SI.VolumeFlowRate(displayUnit = "ml/min", nominal = 1e-6 / 60);
  type VolumeFraction = Modelica.Units.SI.VolumeFraction(nominal = 1e-2, min = ModelicaServices.Machine.small, max = Modelica.Constants.inf);
  type MoleFraction = Modelica.Units.SI.MoleFraction(nominal = 1e-2, min = ModelicaServices.Machine.small, max = Modelica.Constants.inf);
  replaceable type Concentration = Modelica.Units.SI.Concentration(displayUnit = "mmol/l", min = ModelicaServices.Machine.small, max = Modelica.Constants.inf) constrainedby Real;
  replaceable type AmountOfSubstance = Modelica.Units.SI.AmountOfSubstance(displayUnit = "mmol", min = 0, max = Modelica.Constants.inf) constrainedby Real;
  replaceable type MolarFlowRate = Modelica.Units.SI.MolarFlowRate(displayUnit = "mmol/min") constrainedby Real;
  replaceable type MolarEnergy = Modelica.Units.SI.MolarEnergy(displayUnit = "kcal/mol", nominal = 4186.8) constrainedby Real "chemical internal energy, chemical enthalpy, Gibb's energy ..";
  type MassConcentration = Modelica.Units.SI.MassConcentration(displayUnit = "mg/l", nominal = 1e-3, min = ModelicaServices.Machine.small, max = Modelica.Constants.inf);
  type Osmolarity = Modelica.Units.SI.Concentration(displayUnit = "mosm/l", nominal = 1, min = ModelicaServices.Machine.small, max = Modelica.Constants.inf);
  type Heat = Modelica.Units.SI.Heat(displayUnit = "kcal", nominal = 4186800);
  //needed to heat 1 liter of water by 1 degC
  type Temperature = Modelica.Units.SI.Temperature(displayUnit = "degC", nominal = 1, min = 0);
  type HeatFlowRate = Modelica.Units.SI.HeatFlowRate(displayUnit = "kcal/min", nominal = 4186.8 / 60);
  type Power = Modelica.Units.SI.Power(displayUnit = "kcal/min", nominal = 4186.8 / 60);
  type PowerPerMass = Real(final quantity = "Power per Mass", final unit = "W/kg", displayUnit = "cal/(g.min)", nominal = 4.1868 / (0.001 * 60));
  type ThermalConductance = Modelica.Units.SI.ThermalConductance(displayUnit = "kcal/(min.K)", nominal = 4186.8 / 60);
  type SpecificHeatCapacity = Modelica.Units.SI.SpecificHeatCapacity(displayUnit = "kcal/(kg.K)", nominal = 4186.8);
  type SpecificEnergy = Modelica.Units.SI.SpecificEnergy(displayUnit = "kcal/kg", nominal = 4186.8) "vaporization, ..";
  type SpecificEnthalpy = Modelica.Units.SI.SpecificEnthalpy(displayUnit = "kcal/kg", nominal = 1e5);
  type ElectricPotential = Modelica.Units.SI.ElectricPotential(displayUnit = "mV", nominal = 1e-3);
  type ElectricCharge = Modelica.Units.SI.ElectricCharge(displayUnit = "meq", nominal = 1e-3);
  type VolumeDensityOfCharge = Modelica.Units.SI.VolumeDensityOfCharge(displayUnit = "meq/l", nominal = 9.64853399 * 10 ^ 4);
  type ElectricCurrent = Modelica.Units.SI.ElectricCurrent(displayUnit = "meq/min", nominal = 9.64853399 * 10 ^ 4 / 1000 / 60);
  //unknown units in Standard Modelica Library 3.2
  type Fraction = Real(final quantity = "Fraction", final unit = "1", displayUnit = "%", nominal = 1e-2);
  type pH = Real(final quantity = "pH", final unit = "1", final displayUnit = "1", nominal = 7, min = 0, max = 14);
  type Permeability = Real(final quantity = "Permeability", final unit = "mol2.s-1.J-1", displayUnit = "mol2.min-1.kJ-1", nominal = 1e-6, min = 0);
  type OsmoticPermeability = Real(final quantity = "OsmoticPermeability", final unit = "m3/(Pa.s)", displayUnit = "ml/(mmHg.min)", nominal = 1e-6 / (133.322387415 * 60), min = 0);
  type DiffusionPermeability = Real(final quantity = "DiffusionPermeability", final unit = "m3/s", displayUnit = "ml/min", nominal = 1e-6 / 60, min = 0);
  type HydraulicConductance = Real(final quantity = "HydraulicConductance", final unit = "m3/(Pa.s)", displayUnit = "l/(mmHg.min)", nominal = 1e-3 / (133.322387415 * 60), min = 0);
  type HydraulicResistance = Real(final quantity = "HydraulicConductance", final unit = "(Pa.s)/m3", displayUnit = "(mmHg.min)/l", nominal = 1e+3 * 133.322387415 * 60, min = 0);
  type HydraulicCompliance = Real(final quantity = "HydraulicCompliance", final unit = "m3/Pa", displayUnit = "ml/mmHg", nominal = 1e-6 / 133.322387415);
  type HydraulicElastance = Real(final quantity = "HydraulicElastance", final unit = "Pa/m3", displayUnit = "mmHg/ml", nominal = 133.322387415 / 1e-6);
  type HydraulicInertance = Real(final quantity = "HydraulicInertance", final unit = "Pa.s2/kg", displayUnit = "mmHg.min2/g", nominal = 133.322387415 * 60 ^ 2 / 1e-3);
  type GasSolubility = Real(final quantity = "GasSolubility", final unit = "(mol/m3)/(mol/m3)", displayUnit = "(mmol/l)/kPa at 25degC", nominal = 1e-2, min = 0) "Gas solubility in liquid";
  type GasSolubilityPa = Real(final quantity = "GasSolubilityPa", final unit = "(mol/m3)/Pa", nominal = 1e-4, min = 0) "Gas solubility in liquid by partial pressure";
  type StoichiometricNumber = Modelica.Units.SI.StoichiometricNumber;
  // Integer(final quantity="StoichiometricNumber", min=1);
  type Population = Real(final quantity = "Population", final unit = "1", displayUnit = "1", min = 0) "Average number of population individuals";
  type PopulationChange = Real(final quantity = "PopulationChange", final unit = "1/s", displayUnit = "1/d") "Average change of population individuals";
  type PopulationChangePerMember = Real(final quantity = "PopulationChangePerMember", final unit = "1/s", displayUnit = "1/d") "Average change per population individual";
  type Area = Modelica.Units.SI.Area(displayUnit = "cm2", nominal = 1e-4) "Type for area";
  type Length = Modelica.Units.SI.Length(displayUnit = "cm", nominal = 1e-2) "Type for length and radius";
  type Enthalpy = Modelica.Units.SI.Enthalpy(displayUnit = "kcal", nominal = 4186.8) "Heat energy";
  type MolarEnthalpy = Modelica.Units.SI.MolarEnthalpy(displayUnit = "kcal/mol", nominal = 4186.8) "Heat energy of substance";
  annotation (
    Documentation(revisions = "<html>
        <p>Copyright (c) 2017-2018, Marek Matej&aacute;k, http://www.physiolib.com </p>
        </html>"));
end Types;

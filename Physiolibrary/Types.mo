within Physiolibrary;
package Types "Physiological units with nominals"
  //extends Modelica.Icons.TypesPackage;
  extends Modelica.Icons.Package;
//If you have an idea to add the next physiological type to the next version, please write me at marek@matfyz.cz. Thank you

  package UsersGuide "User's Guide"
    extends Modelica.Icons.Information;

  class NewType "Adding new type"
    extends Modelica.Icons.Information;

   annotation (Documentation(info="<html>
<p>Definition of new type (&QUOT;QuantityX&QUOT;) in Physiolibrary:</p>
<ul>
<li>Define base type Types.QuantityX with SI units in &QUOT;final unit&QUOT;, default display units and nominal (e.g. value of one display unit at SI units). </li>
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

  annotation (__Dymola_DocumentationClass=true, Documentation(info="<html>
<p>Package <b>Physiolibrary</b> is a modelica package for <b>Human Physiology</b> that is developed from <b>HumMod</b> modelica implementation, see <a href=\"http://patf-biokyb.lf1.cuni.cz/wiki/hummod/hummod\">http://hummod.org</a>. It provides constants, types, connectors, partial models and model components fitted for physiological models of human body. </p>
<p>This is a short <b>User&apos;s Guide</b> for the overall library. Some of the main sublibraries have their own User&apos;s Guides that can be accessed by the following links: </p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td valign=\"top\"><p>Types </p></td>
<td valign=\"top\"><p>Physiological types. Physiological unit vs. SI units, nominals, inputs/outputs, typed constants.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>Blocks</p></td>
<td valign=\"top\"><p>Usefull blocks, that are missing in package Modelica.Blocks (MSL 3.2), cubic interpolation curves, multiplication factors.</p></td>
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

  package Examples
    "Examples that demonstrate usage of the Pressure flow components"
  extends Modelica.Icons.ExamplesPackage;
    model Units
    extends Modelica.Icons.Example;
     model ParametricClass

      parameter Temperature temperature;
      parameter Heat heat;
      parameter Pressure pressure;
      parameter Volume volume;
      parameter AmountOfSubstance amountOfSubstance;
      parameter ElectricCharge electricCharge;
      parameter ElectricCurrent electricCurrent;

      parameter Time time_;
      parameter Energy energy;
      parameter Mass mass;
      parameter ElectricPotential electricalPotential;
      parameter MassFlowRate massFlowRate;
      parameter Density density;
      parameter Height height;
      parameter Acceleration acceleration;

      parameter VolumeFlowRate volumeFlowRate;
      parameter Concentration concentration;
      parameter Osmolarity osmolarity;

      parameter MolarFlowRate molarFlowRate;
       parameter HeatFlowRate heatFlowRate;
      parameter ThermalConductance thermalConductance;
      parameter SpecificHeatCapacity specificHeatCapacity;
      parameter SpecificEnergy specificEnergy(displayUnit="cal/g");

      parameter Fraction fraction;
      parameter OsmoticPermeability osmoticPermeability;
      parameter DiffusionPermeability diffusionPermeability;
      parameter HydraulicConductance hydraulicConductance;
      parameter HydraulicInertance hydraulicInertance;
      parameter GasSolubility gasSolubility;

      parameter AmountOfSubstance gasSTP(displayUnit="litre_STP");
      parameter AmountOfSubstance gasSATP(displayUnit="litre_SATP");
      parameter AmountOfSubstance gasNIST(displayUnit="litre_NIST");

     end ParametricClass;

      ParametricClass parametricClass(
        acceleration=1,
        concentration=1,
        osmolarity=1,
        gasSTP(displayUnit="litre_STP") = 0.0440316172572,
        mass(displayUnit="ug") = 1e-09,
        temperature=274.15,
        heat=4186.8,
        pressure=133.322387415,
        volume=1e-06,
        amountOfSubstance=0.001,
        electricCharge=96.4853399,
        electricCurrent=1.6080889983333,
        time_=60,
        energy=4186.8,
        electricalPotential=0.001,
        massFlowRate=1.6666666666667e-08,
        density=1000,
        height=0.01,
        volumeFlowRate=1.6666666666667e-08,
        molarFlowRate=1.6666666666667e-05,
        heatFlowRate=69.78,
        thermalConductance=69.78,
        specificHeatCapacity=4186.8,
        specificEnergy=4186.8,
        fraction=0.01,
        osmoticPermeability=1.2501026264094e-10,
        diffusionPermeability=1.6666666666667e-08,
        hydraulicConductance=1.2501026264094e-10,
        hydraulicInertance=479960594694,
        gasSolubility=2.4789568751177,
        gasSATP=0.040339548059044,
        gasNIST=0.041571199502531)
        annotation (Placement(transformation(extent={{-14,8},{6,28}})));
      annotation (experiment(StopTime=1),
     Documentation(info="<html>
<p>If your environment fully support the physiological units, then the user dialog of setting parameters should display only values &QUOT;1&QUOT; of physiological unit.</p>
</html>"));
    end Units;

    package IO_Bus
      import Physiolibrary;
      extends Physiolibrary.Types.IO_Bus;

      redeclare model extends Variables "Example of subsystem outputs"

        T.Pressure Bone_PO2(varName="Bone-Flow.PO2")
          "Partial oxygen pressure in bone blood venules."
        annotation (Placement(transformation(extent={{-80,24},{2,106}})));
        T.VolumeFlowRate BoneBloodFlow(varName="Bone-Flow.BloodFlow")
          "Blood flow through bones"
        annotation (Placement(transformation(extent={{-80,-10},{2,72}})));
        T.MolarFlowRate BoneO2Need(varName="Bone-Metabolism.O2-Need")
          "Current desired delivery flow of oxygen to bone metabolism"
        annotation (Placement(transformation(extent={{-80,-50},{2,32}})));
        T.Volume BoneLiquidVol(varName="Bone-Tissue.LiquidVol")
          "The extravascular water in bones. "
        annotation (Placement(transformation(extent={{-80,-92},{2,-10}})));

      equation
        connect(Bone_PO2.y, busConnector.Bone_PO2) annotation (Line(
            points={{6.1,65},{70.05,65},{70.05,-2},{90,-2}},
            color={0,0,127},
            smooth=Smooth.None), Text(
            string="%second",
            index=1,
            extent={{6,3},{6,3}}));
        connect(BoneBloodFlow.y, busConnector.Bone_BloodFlow)
                                                         annotation (Line(
            points={{6.1,31},{71.05,31},{71.05,-2},{90,-2}},
            color={0,0,127},
            smooth=Smooth.None), Text(
            string="%second",
            index=1,
            extent={{6,3},{6,3}}));
        connect(BoneO2Need.y, busConnector.Bone_O2Need)
                                                      annotation (Line(
            points={{6.1,-9},{71.05,-9},{71.05,-2},{90,-2}},
            color={0,0,127},
            smooth=Smooth.None), Text(
            string="%second",
            index=1,
            extent={{6,3},{6,3}}));
        connect(BoneLiquidVol.y, busConnector.Bone_LiquidVol)
                                                         annotation (Line(
            points={{6.1,-51},{71.05,-51},{71.05,-2},{90,-2}},
            color={0,0,127},
            smooth=Smooth.None), Text(
            string="%second",
            index=1,
            extent={{6,3},{6,3}}));
        annotation (experiment(StopTime=1));
      end Variables;

      model Test
        import Physiolibrary;
        extends Modelica.Icons.Example;

        Physiolibrary.Types.BusConnector busConnector
          annotation (Placement(transformation(extent={{-4,-2},{36,38}})));
        Physiolibrary.Types.Examples.IO_Bus.OutputToFile outputToFile
          annotation (Placement(transformation(extent={{70,48},{90,68}})));
        Physiolibrary.Types.Constants.PressureConst
                   Bone_PO2(k=5599.54027143)
          "Partial oxygen pressure in bone blood venules."
        annotation (Placement(transformation(extent={{-90,70},{-70,90}})));
        Physiolibrary.Types.Constants.VolumeFlowRateConst
                         BoneBloodFlow(k=5.3333333333333e-06)
          "Blood flow through bones"
        annotation (Placement(transformation(extent={{-90,30},{-70,50}})));
        Physiolibrary.Types.Constants.MolarFlowRateConst
                        BoneO2Need(k(displayUnit="ml_STP/min") = 1.027404402668e-05)
          "Current desired delivery flow of oxygen to bone metabolism"
        annotation (Placement(transformation(extent={{-90,-34},{-70,-14}})));
        Physiolibrary.Types.Constants.VolumeConst
                 BoneLiquidVol(k=0.0027) "The extravascular water in bones. "
        annotation (Placement(transformation(extent={{-90,-70},{-70,-50}})));
        Physiolibrary.Types.Examples.IO_Bus.OutputToFile_SI outputToFile_SI
          annotation (Placement(transformation(extent={{72,-26},{92,-6}})));
      equation
        connect(busConnector, outputToFile.busConnector) annotation (Line(
            points={{16,18},{48,18},{48,58},{80,58}},
            color={255,204,51},
            thickness=0.5,
            smooth=Smooth.None));
        connect(Bone_PO2.y, busConnector.Bone_PO2) annotation (Line(
            points={{-67.5,80},{-11.95,80},{-11.95,18},{16,18}},
            color={0,0,127},
            smooth=Smooth.None), Text(
            string="%second",
            index=1,
            extent={{6,3},{6,3}}));
        connect(BoneBloodFlow.y, busConnector.Bone_BloodFlow)
                                                         annotation (Line(
            points={{-67.5,40},{-10.95,40},{-10.95,18},{16,18}},
            color={0,0,127},
            smooth=Smooth.None), Text(
            string="%second",
            index=1,
            extent={{6,3},{6,3}}));
        connect(BoneO2Need.y, busConnector.Bone_O2Need)
                                                      annotation (Line(
            points={{-67.5,-24},{-10.95,-24},{-10.95,18},{16,18}},
            color={0,0,127},
            smooth=Smooth.None), Text(
            string="%second",
            index=1,
            extent={{6,3},{6,3}}));
        connect(BoneLiquidVol.y, busConnector.Bone_LiquidVol)
                                                         annotation (Line(
            points={{-67.5,-60},{-10.95,-60},{-10.95,18},{16,18}},
            color={0,0,127},
            smooth=Smooth.None), Text(
            string="%second",
            index=1,
            extent={{6,3},{6,3}}));
        connect(busConnector, outputToFile_SI.busConnector) annotation (Line(
            points={{16,18},{48,18},{48,-16},{82,-16}},
            color={255,204,51},
            thickness=0.5,
            smooth=Smooth.None), Text(
            string="%first",
            index=-1,
            extent={{-6,3},{-6,3}}));
      end Test;
      annotation (Documentation(info="<html>
<p>Subsystem initial and terminal data manipulations using busConnector (Physiomodel expandable connector).</p>
<h4>Be surre, that the directory &QUOT;io&QUOT; is in working directory (File-&GT;Change Directory...)!</h4>
<p>Implementation:</p>
<p>Model should be divided into subsystems, which has <b>output</b> variables grouped to busConnector (variables, which are inputs to other subsystems). For each subsystem S: <b>all</b> these variables should be defined in <b>extended redeclared</b> class S.IO_Bus.Variables, where package S.IO_Bus is <b>extended</b> from Physiolibrary.Types.IO_Bus. </p>
<p>Usage:</p>
<p>For loading values in SI units of these variables from file &QUOT;io/input_SI.txt&QUOT; use block S.IO_Bus.InputFromFile_SI.</p>
<p>For loading values in non-SI units of these variables from file &QUOT;io/input.txt&QUOT; use block S.IO_Bus.InputFromFile.</p>
<p>For storing values in SI units of these variables from file &QUOT;io/output_SI.txt&QUOT; use block S.IO_Bus.OutputToFile_SI.</p>
<p>For storing values in non-SI units of these variables from file &QUOT;io/output.txt&QUOT; use block S.IO_Bus.OutputToFile.</p>
<p>For comparison values in SI units of these variables with file &QUOT;io/input_SI.txt&QUOT; use block S.IO_Bus.OutputComparison_SI and result will be stored as &QUOT;io/comparison_SI.txt&QUOT;.</p>
<p>For comparison values in non-SI units of these variables with file &QUOT;io/input.txt&QUOT; use block S.IO_Bus.OutputComparison and result will be stored as &QUOT;io/comparison.txt&QUOT;.</p>
</html>"));
    end IO_Bus;
  end Examples;

  package Constants
    extends Modelica.Icons.SourcesPackage;

  block AccelerationConst "Constant signal of type Acceleration"
   parameter Types.Acceleration k "Constant Acceleration output value";
        RealIO.AccelerationOutput y "Acceleration constant"
      annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                  iconTransformation(extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="acceleration",
               Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
          coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
              graphics={
          Rectangle(extent={{-40,40},{40,-40}},
            lineColor={0,0,0},
                radius=10,
            fillColor={236,236,236},
                            fillPattern=FillPattern.Solid),
          Text( extent={{-100,-44},{100,-64}},
            lineColor={0,0,0},
                    fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                textString="%name"),
          Text(         extent={{-40,10},{40,-10}},
            lineColor={0,0,0},
                fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                    textString="Const")}));
  end AccelerationConst;

  block AmountOfSubstanceConst "Constant signal of type AmountOfSubstance"
   parameter Types.AmountOfSubstance k
        "Constant AmountOfSubstance output value";
        RealIO.AmountOfSubstanceOutput y "AmountOfSubstance constant"
      annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                  iconTransformation(extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="amountOfSubstance",
               Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
          coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
              graphics={
          Rectangle(extent={{-40,40},{40,-40}},
            lineColor={0,0,0},
                radius=10,
            fillColor={236,236,236},
                            fillPattern=FillPattern.Solid),
          Text( extent={{-100,-44},{100,-64}},
            lineColor={0,0,0},
                    fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                textString="%name"),
          Text(         extent={{-40,10},{40,-10}},
            lineColor={0,0,0},
                fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                    textString="Const")}));
  end AmountOfSubstanceConst;

  block ConcentrationConst "Constant signal of type Concentration"
   parameter Types.Concentration k "Constant Concentration output value";
        RealIO.ConcentrationOutput y "Concentration constant"
      annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                  iconTransformation(extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="concentration",
               Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
          coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
              graphics={
          Rectangle(extent={{-40,40},{40,-40}},
            lineColor={0,0,0},
                radius=10,
            fillColor={236,236,236},
                            fillPattern=FillPattern.Solid),
          Text( extent={{-100,-44},{100,-64}},
            lineColor={0,0,0},
                    fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                textString="%name"),
          Text(         extent={{-40,10},{40,-10}},
            lineColor={0,0,0},
                fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                    textString="Const")}));
  end ConcentrationConst;

  block DensityConst "Constant signal of type Density"
   parameter Types.Density k "Constant Density output value";
        RealIO.DensityOutput y "Density constant"
      annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                  iconTransformation(extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="density",
               Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
          coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
              graphics={
          Rectangle(extent={{-40,40},{40,-40}},
            lineColor={0,0,0},
                radius=10,
            fillColor={236,236,236},
                            fillPattern=FillPattern.Solid),
          Text( extent={{-100,-44},{100,-64}},
            lineColor={0,0,0},
                    fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                textString="%name"),
          Text(         extent={{-40,10},{40,-10}},
            lineColor={0,0,0},
                fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                    textString="Const")}));
  end DensityConst;

  block DiffusionPermeabilityConst
      "Constant signal of type DiffusionPermeability"
   parameter Types.DiffusionPermeability k
        "Constant DiffusionPermeability output value";
        RealIO.DiffusionPermeabilityOutput y "DiffusionPermeability constant"
      annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                  iconTransformation(extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="diffusionPermeability",
               Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
          coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
              graphics={
          Rectangle(extent={{-40,40},{40,-40}},
            lineColor={0,0,0},
                radius=10,
            fillColor={236,236,236},
                            fillPattern=FillPattern.Solid),
          Text( extent={{-100,-44},{100,-64}},
            lineColor={0,0,0},
                    fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                textString="%name"),
          Text(         extent={{-40,10},{40,-10}},
            lineColor={0,0,0},
                fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                    textString="Const")}));
  end DiffusionPermeabilityConst;

  block ElectricChargeConst "Constant signal of type ElectricCharge"
   parameter Types.ElectricCharge k "Constant ElectricCharge output value";
        RealIO.ElectricChargeOutput y "ElectricCharge constant"
      annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                  iconTransformation(extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="electricCharge",
               Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
          coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
              graphics={
          Rectangle(extent={{-40,40},{40,-40}},
            lineColor={0,0,0},
                radius=10,
            fillColor={236,236,236},
                            fillPattern=FillPattern.Solid),
          Text( extent={{-100,-44},{100,-64}},
            lineColor={0,0,0},
                    fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                textString="%name"),
          Text(         extent={{-40,10},{40,-10}},
            lineColor={0,0,0},
                fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                    textString="Const")}));
  end ElectricChargeConst;

  block ElectricCurrentConst "Constant signal of type ElectricCurrent"
   parameter Types.ElectricCurrent k "Constant ElectricCurrent output value";
        RealIO.ElectricCurrentOutput y "ElectricCurrent constant"
      annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                  iconTransformation(extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="electricCurrent",
               Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
          coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
              graphics={
          Rectangle(extent={{-40,40},{40,-40}},
            lineColor={0,0,0},
                radius=10,
            fillColor={236,236,236},
                            fillPattern=FillPattern.Solid),
          Text( extent={{-100,-44},{100,-64}},
            lineColor={0,0,0},
                    fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                textString="%name"),
          Text(         extent={{-40,10},{40,-10}},
            lineColor={0,0,0},
                fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                    textString="Const")}));
  end ElectricCurrentConst;

  block ElectricPotentialConst "Constant signal of type ElectricPotential"
   parameter Types.ElectricPotential k
        "Constant ElectricPotential output value";
        RealIO.ElectricPotentialOutput y "ElectricPotential constant"
      annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                  iconTransformation(extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="electricPotential",
               Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
          coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
              graphics={
          Rectangle(extent={{-40,40},{40,-40}},
            lineColor={0,0,0},
                radius=10,
            fillColor={236,236,236},
                            fillPattern=FillPattern.Solid),
          Text( extent={{-100,-44},{100,-64}},
            lineColor={0,0,0},
                    fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                textString="%name"),
          Text(         extent={{-40,10},{40,-10}},
            lineColor={0,0,0},
                fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                    textString="Const")}));
  end ElectricPotentialConst;

    block EnergyConst "Constant signal of type Energy"
      parameter Types.Energy k "Constant Energy output value";
        RealIO.EnergyOutput y "Energy constant"
      annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                  iconTransformation(extent={{40,-10},{60,10}})));
    equation
        y=k;
    annotation (defaultComponentName="energy",
               Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
          coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
              graphics={
          Rectangle(extent={{-40,40},{40,-40}},
            lineColor={0,0,0},
                radius=10,
            fillColor={236,236,236},
                            fillPattern=FillPattern.Solid),
          Text( extent={{-100,-44},{100,-64}},
            lineColor={0,0,0},
                    fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                textString="%name"),
          Text(         extent={{-40,10},{40,-10}},
            lineColor={0,0,0},
                fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                    textString="Const")}));
    end EnergyConst;

  block FractionConst "Constant signal of type Fraction"
   parameter Types.Fraction k "Constant Fraction output value";
        RealIO.FractionOutput y "Fraction constant"
      annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                  iconTransformation(extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="fraction",
               Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
          coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
              graphics={
          Rectangle(extent={{-40,40},{40,-40}},
            lineColor={0,0,0},
                radius=10,
            fillColor={236,236,236},
                            fillPattern=FillPattern.Solid),
          Text( extent={{-100,-44},{100,-64}},
            lineColor={0,0,0},
                    fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                textString="%name"),
          Text(         extent={{-40,10},{40,-10}},
            lineColor={0,0,0},
                fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                    textString="Const")}));
  end FractionConst;

  block FrequencyConst "Constant signal of type Frequency"
   parameter Types.Frequency k "Constant Frequency output value";
        RealIO.FrequencyOutput y "Frequency constant"
      annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                  iconTransformation(extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="frequency",
               Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
          coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
              graphics={
          Rectangle(extent={{-40,40},{40,-40}},
            lineColor={0,0,0},
                radius=10,
            fillColor={236,236,236},
                            fillPattern=FillPattern.Solid),
          Text( extent={{-100,-44},{100,-64}},
            lineColor={0,0,0},
                    fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                textString="%name"),
          Text(         extent={{-40,10},{40,-10}},
            lineColor={0,0,0},
                fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                    textString="Const")}));
  end FrequencyConst;

  block GasSolubilityConst "Constant signal of type GasSolubility"
   parameter Types.GasSolubility k "Constant GasSolubility output value";
        RealIO.GasSolubilityOutput y "GasSolubility constant"
      annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                  iconTransformation(extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="gasSolubility",
               Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
          coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
              graphics={
          Rectangle(extent={{-40,40},{40,-40}},
            lineColor={0,0,0},
                radius=10,
            fillColor={236,236,236},
                            fillPattern=FillPattern.Solid),
          Text( extent={{-100,-44},{100,-64}},
            lineColor={0,0,0},
                    fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                textString="%name"),
          Text(         extent={{-40,10},{40,-10}},
            lineColor={0,0,0},
                fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                    textString="Const")}));
  end GasSolubilityConst;

  block HeatConst "Constant signal of type Heat"
   parameter Types.Heat k "Constant Heat output value";
        RealIO.HeatOutput y "Heat constant"
      annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                  iconTransformation(extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="heat",
               Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
          coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
              graphics={
          Rectangle(extent={{-40,40},{40,-40}},
            lineColor={0,0,0},
                radius=10,
            fillColor={236,236,236},
                            fillPattern=FillPattern.Solid),
          Text( extent={{-100,-44},{100,-64}},
            lineColor={0,0,0},
                    fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                textString="%name"),
          Text(         extent={{-40,10},{40,-10}},
            lineColor={0,0,0},
                fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                    textString="Const")}));
  end HeatConst;

  block HeightConst "Constant signal of type Height"
   parameter Types.Height k "Constant Height output value";
        RealIO.HeightOutput y "Height constant"
      annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                  iconTransformation(extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="height",
               Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
          coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
              graphics={
          Rectangle(extent={{-40,40},{40,-40}},
            lineColor={0,0,0},
                radius=10,
            fillColor={236,236,236},
                            fillPattern=FillPattern.Solid),
          Text( extent={{-100,-44},{100,-64}},
            lineColor={0,0,0},
                    fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                textString="%name"),
          Text(         extent={{-40,10},{40,-10}},
            lineColor={0,0,0},
                fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                    textString="Const")}));
  end HeightConst;

  block HeatFlowRateConst "Constant signal of type HeatFlowRate"
   parameter Types.HeatFlowRate k "Constant HeatFlowRate output value";
        RealIO.HeatFlowRateOutput y "HeatFlowRate constant"
      annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                  iconTransformation(extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="heatFlowRate",
               Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
          coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
              graphics={
          Rectangle(extent={{-40,40},{40,-40}},
            lineColor={0,0,0},
                radius=10,
            fillColor={236,236,236},
                            fillPattern=FillPattern.Solid),
          Text( extent={{-100,-44},{100,-64}},
            lineColor={0,0,0},
                    fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                textString="%name"),
          Text(         extent={{-40,10},{40,-10}},
            lineColor={0,0,0},
                fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                    textString="Const")}));
  end HeatFlowRateConst;

  block HydraulicComplianceConst "Constant signal of type HydraulicCompliance"
   parameter Types.HydraulicCompliance k
        "Constant HydraulicCompliance output value";
        RealIO.HydraulicComplianceOutput y "HydraulicCompliance constant"
      annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                  iconTransformation(extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="hydraulicCompliance",
               Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
          coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
              graphics={
          Rectangle(extent={{-40,40},{40,-40}},
            lineColor={0,0,0},
                radius=10,
            fillColor={236,236,236},
                            fillPattern=FillPattern.Solid),
          Text( extent={{-100,-44},{100,-64}},
            lineColor={0,0,0},
                    fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                textString="%name"),
          Text(         extent={{-40,10},{40,-10}},
            lineColor={0,0,0},
                fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                    textString="Const")}));
  end HydraulicComplianceConst;

  block HydraulicElastanceConst
      "Obsolete, please use HydraulicCompliance instead!"
    extends Modelica.Icons.ObsoleteModel;
   parameter Types.HydraulicElastance k "Hydraulic elastance";
        Modelica.Blocks.Interfaces.RealOutput
                                         y(final quantity="HydraulicCompliance",final unit="Pa/m3", displayUnit="mmHg/ml", nominal=(133.322387415)/(1e-6))
        "HydraulicElastance constant"
      annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                  iconTransformation(extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="hydraulicElastance",
                    Icon(
          coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
              graphics={
          Rectangle(extent={{-40,40},{40,-40}},
            lineColor={0,0,0},
                radius=10,
            fillColor={236,236,236},
                            fillPattern=FillPattern.Solid),
          Text( extent={{-100,-44},{100,-64}},
            lineColor={0,0,0},
                    fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                textString="%name"),
          Text(         extent={{-40,10},{40,-10}},
            lineColor={0,0,0},
                fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                    textString="Const")}),
        Documentation(info="<html>
<p>Please use the reciprocal value of hydraulic elastance, wich is called hydraulic compliance for the compatibility with other blocks and models!</p>
<p>Even it is not recommended, you can use this block, but do not forget to make reciprocal value (in example using Blocks.Math.Reciprocal) before connecting to library components!</p>
</html>"));
  end HydraulicElastanceConst;

  block HydraulicElastanceToComplianceConst
      "Constant signal of type HydraulicCompliance from HydraulicElastance constant"
   parameter Types.HydraulicElastance k
        "Reciprocal constant value of hydraulic compliance";
        RealIO.HydraulicComplianceOutput y "HydraulicCompliance constant"
      annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                  iconTransformation(extent={{40,-10},{60,10}})));
  equation
        y=1/k;
    annotation (defaultComponentName="hydraulicElastance2Compliance",
               Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
          coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
              graphics={
          Rectangle(extent={{-40,40},{40,-40}},
            lineColor={0,0,0},
                radius=10,
            fillColor={236,236,236},
                            fillPattern=FillPattern.Solid),
          Text( extent={{-100,-44},{100,-64}},
            lineColor={0,0,0},
                    fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                textString="%name"),
          Text(         extent={{-40,10},{40,-10}},
            lineColor={0,0,0},
                fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                    textString="Const")}));
  end HydraulicElastanceToComplianceConst;

  block HydraulicConductanceConst
      "Constant signal of type HydraulicConductance"
   parameter Types.HydraulicConductance k
        "Constant HydraulicConductance output value";
        RealIO.HydraulicConductanceOutput y "HydraulicConductance constant"
      annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                  iconTransformation(extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="hydraulicConductance",
               Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
          coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
              graphics={
          Rectangle(extent={{-40,40},{40,-40}},
            lineColor={0,0,0},
                radius=10,
            fillColor={236,236,236},
                            fillPattern=FillPattern.Solid),
          Text( extent={{-100,-44},{100,-64}},
            lineColor={0,0,0},
                    fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                textString="%name"),
          Text(         extent={{-40,10},{40,-10}},
            lineColor={0,0,0},
                fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                    textString="Const")}));
  end HydraulicConductanceConst;

  block HydraulicResistanceConst
      "Obsolete, please use HydraulicConductance instead!"

   parameter Types.HydraulicResistance k "Hydraulic resistance";
        Modelica.Blocks.Interfaces.RealOutput
                                          y(final quantity="HydraulicConductance",final unit="(Pa.s)/m3", displayUnit="(mmHg.min)/ml", nominal=(1e+6)*(133.322387415)*60)
        "HydraulicResistance constant"
      annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                  iconTransformation(extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="hydraulicResistance",
                    Icon(
          coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
              graphics={
          Rectangle(extent={{-40,40},{40,-40}},
            lineColor={0,0,0},
                radius=10,
            fillColor={236,236,236},
                            fillPattern=FillPattern.Solid),
          Text( extent={{-100,-44},{100,-64}},
            lineColor={0,0,0},
                    fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                textString="%name"),
          Text(         extent={{-40,10},{40,-10}},
            lineColor={0,0,0},
                fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                    textString="Const")}),
        Documentation(info="<html>
<p>Please use the reciprocal value of hydraulic resistance, wich is called hydraulic conductance for the compatibility with other blocks and models!</p>
<p>Because zero hydraulic conductance means zero volumetric flow, it is much better to use this reciprocal value of hydraulic resistance.</p>
<p>Even it is not recommended, you can use this block, but do not forget to make reciprocal value (in example using Blocks.Math.Reciprocal) before connecting to library components!</p>
</html>"));
  end HydraulicResistanceConst;

  block HydraulicResistanceToConductanceConst
      "Constant signal of type HydraulicConductance from HydraulicResistance parameter"
   parameter Types.HydraulicResistance k
        "Reciprocal constant value of hydraulic conductance";
        RealIO.HydraulicConductanceOutput y "HydraulicConductance constant"
      annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                  iconTransformation(extent={{40,-10},{60,10}})));
  equation
        y=1/k;
    annotation (defaultComponentName="hydraulicResistance2conductance",
               Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
          coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
              graphics={
          Rectangle(extent={{-40,40},{40,-40}},
            lineColor={0,0,0},
                radius=10,
            fillColor={236,236,236},
                            fillPattern=FillPattern.Solid),
          Text( extent={{-100,-44},{100,-64}},
            lineColor={0,0,0},
                    fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                textString="%name"),
          Text(         extent={{-40,10},{40,-10}},
            lineColor={0,0,0},
                fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                    textString="Const")}));
  end HydraulicResistanceToConductanceConst;

  block HydraulicInertanceConst "Constant signal of type HydraulicInertance"
   parameter Types.HydraulicInertance k
        "Constant HydraulicInertance output value";
        RealIO.HydraulicInertanceOutput y "HydraulicInertance constant"
      annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                  iconTransformation(extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="hydraulicInertance",
               Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
          coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
              graphics={
          Rectangle(extent={{-40,40},{40,-40}},
            lineColor={0,0,0},
                radius=10,
            fillColor={236,236,236},
                            fillPattern=FillPattern.Solid),
          Text( extent={{-100,-44},{100,-64}},
            lineColor={0,0,0},
                    fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                textString="%name"),
          Text(         extent={{-40,10},{40,-10}},
            lineColor={0,0,0},
                fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                    textString="Const")}));
  end HydraulicInertanceConst;

  block MassConst "Constant signal of type Mass"
   parameter Types.Mass k "Constant Mass output value";
        RealIO.MassOutput y "Mass constant"
      annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                  iconTransformation(extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="mass",
               Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
          coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
              graphics={
          Rectangle(extent={{-40,40},{40,-40}},
            lineColor={0,0,0},
                radius=10,
            fillColor={236,236,236},
                            fillPattern=FillPattern.Solid),
          Text( extent={{-100,-44},{100,-64}},
            lineColor={0,0,0},
                    fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                textString="%name"),
          Text(         extent={{-40,10},{40,-10}},
            lineColor={0,0,0},
                fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                    textString="Const")}));
  end MassConst;

  block MassConcentrationConst "Constant signal of type MassConcentration"
   parameter Types.MassConcentration k
        "Constant MassConcentration output value";
        RealIO.MassConcentrationOutput y "MassConcentration constant"
      annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                  iconTransformation(extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="massConcentration",
               Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
          coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
              graphics={
          Rectangle(extent={{-40,40},{40,-40}},
            lineColor={0,0,0},
                radius=10,
            fillColor={236,236,236},
                            fillPattern=FillPattern.Solid),
          Text( extent={{-100,-44},{100,-64}},
            lineColor={0,0,0},
                    fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                textString="%name"),
          Text(         extent={{-40,10},{40,-10}},
            lineColor={0,0,0},
                fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                    textString="Const")}));
  end MassConcentrationConst;

  block MassFlowRateConst "Constant signal of type MassFlowRate"
   parameter Types.MassFlowRate k "Constant MassFlowRate output value";
        RealIO.MassFlowRateOutput y "MassFlowRate constant"
      annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                  iconTransformation(extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="massFlowRate",
               Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
          coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
              graphics={
          Rectangle(extent={{-40,40},{40,-40}},
            lineColor={0,0,0},
                radius=10,
            fillColor={236,236,236},
                            fillPattern=FillPattern.Solid),
          Text( extent={{-100,-44},{100,-64}},
            lineColor={0,0,0},
                    fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                textString="%name"),
          Text(         extent={{-40,10},{40,-10}},
            lineColor={0,0,0},
                fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                    textString="Const")}));
  end MassFlowRateConst;

  block MolarFlowRateConst "Constant signal of type MolarFlowRate"
   parameter Types.MolarFlowRate k "Constant MolarFlowRate output value";
        RealIO.MolarFlowRateOutput y "MolarFlowRate constant"
      annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                  iconTransformation(extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="molarFlowRate",
               Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
          coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
              graphics={
          Rectangle(extent={{-40,40},{40,-40}},
            lineColor={0,0,0},
                radius=10,
            fillColor={236,236,236},
                            fillPattern=FillPattern.Solid),
          Text( extent={{-100,-44},{100,-64}},
            lineColor={0,0,0},
                    fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                textString="%name"),
          Text(         extent={{-40,10},{40,-10}},
            lineColor={0,0,0},
                fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                    textString="Const")}));
  end MolarFlowRateConst;

  block OsmolarityConst "Constant signal of type Osmolarity"
   parameter Types.Osmolarity k "Constant Osmolarity output value";
        RealIO.OsmolarityOutput y "Osmolarity constant"
      annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                  iconTransformation(extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="osmolarity",
               Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
          coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
              graphics={
          Rectangle(extent={{-40,40},{40,-40}},
            lineColor={0,0,0},
                radius=10,
            fillColor={236,236,236},
                            fillPattern=FillPattern.Solid),
          Text( extent={{-100,-44},{100,-64}},
            lineColor={0,0,0},
                    fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                textString="%name"),
          Text(         extent={{-40,10},{40,-10}},
            lineColor={0,0,0},
                fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                    textString="Const")}));
  end OsmolarityConst;

  block OsmoticPermeabilityConst "Constant signal of type OsmoticPermeability"
   parameter Types.OsmoticPermeability k
        "Constant OsmoticPermeability output value";
        RealIO.OsmoticPermeabilityOutput y "OsmoticPermeability constant"
      annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                  iconTransformation(extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="osmoticPermeability",
               Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
          coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
              graphics={
          Rectangle(extent={{-40,40},{40,-40}},
            lineColor={0,0,0},
                radius=10,
            fillColor={236,236,236},
                            fillPattern=FillPattern.Solid),
          Text( extent={{-100,-44},{100,-64}},
            lineColor={0,0,0},
                    fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                textString="%name"),
          Text(         extent={{-40,10},{40,-10}},
            lineColor={0,0,0},
                fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                    textString="Const")}));
  end OsmoticPermeabilityConst;

  block PressureConst "Constant signal of type Pressure"
   parameter Types.Pressure k "Constant Pressure output value";
        RealIO.PressureOutput y "Pressure constant"
      annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                  iconTransformation(extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="pressure",
               Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
          coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
              graphics={
          Rectangle(extent={{-40,40},{40,-40}},
            lineColor={0,0,0},
                radius=10,
            fillColor={236,236,236},
                            fillPattern=FillPattern.Solid),
          Text( extent={{-100,-44},{100,-64}},
            lineColor={0,0,0},
                    fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                textString="%name"),
          Text(         extent={{-40,10},{40,-10}},
            lineColor={0,0,0},
                fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                    textString="Const")}));
  end PressureConst;

  block SpecificEnergyConst "Constant signal of type SpecificEnergy"
   parameter Types.SpecificEnergy k "Constant SpecificEnergy output value";
        RealIO.SpecificEnergyOutput y "SpecificEnergy constant"
      annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                  iconTransformation(extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="specificEnergy",
               Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
          coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
              graphics={
          Rectangle(extent={{-40,40},{40,-40}},
            lineColor={0,0,0},
                radius=10,
            fillColor={236,236,236},
                            fillPattern=FillPattern.Solid),
          Text( extent={{-100,-44},{100,-64}},
            lineColor={0,0,0},
                    fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                textString="%name"),
          Text(         extent={{-40,10},{40,-10}},
            lineColor={0,0,0},
                fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                    textString="Const")}));
  end SpecificEnergyConst;

  block SpecificHeatCapacityConst
      "Constant signal of type SpecificHeatCapacity"
   parameter Types.SpecificHeatCapacity k
        "Constant SpecificHeatCapacity output value";
        RealIO.SpecificHeatCapacityOutput y "SpecificHeatCapacity constant"
      annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                  iconTransformation(extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="specificHeatCapacity",
               Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
          coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
              graphics={
          Rectangle(extent={{-40,40},{40,-40}},
            lineColor={0,0,0},
                radius=10,
            fillColor={236,236,236},
                            fillPattern=FillPattern.Solid),
          Text( extent={{-100,-44},{100,-64}},
            lineColor={0,0,0},
                    fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                textString="%name"),
          Text(         extent={{-40,10},{40,-10}},
            lineColor={0,0,0},
                fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                    textString="Const")}));
  end SpecificHeatCapacityConst;

  block TemperatureConst "Constant signal of type Temperature"
   parameter Types.Temperature k "Constant Temperature output value";
        RealIO.TemperatureOutput y "Temperature constant"
      annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                  iconTransformation(extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="temperature",
               Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
          coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
              graphics={
          Rectangle(extent={{-40,40},{40,-40}},
            lineColor={0,0,0},
                radius=10,
            fillColor={236,236,236},
                            fillPattern=FillPattern.Solid),
          Text( extent={{-100,-44},{100,-64}},
            lineColor={0,0,0},
                    fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                textString="%name"),
          Text(         extent={{-40,10},{40,-10}},
            lineColor={0,0,0},
                fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                    textString="Const")}));
  end TemperatureConst;

  block ThermalConductanceConst "Constant signal of type ThermalConductance"
   parameter Types.ThermalConductance k
        "Constant ThermalConductance output value";
        RealIO.ThermalConductanceOutput y "ThermalConductance constant"
      annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                  iconTransformation(extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="thermalConductance",
               Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
          coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
              graphics={
          Rectangle(extent={{-40,40},{40,-40}},
            lineColor={0,0,0},
                radius=10,
            fillColor={236,236,236},
                            fillPattern=FillPattern.Solid),
          Text( extent={{-100,-44},{100,-64}},
            lineColor={0,0,0},
                    fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                textString="%name"),
          Text(         extent={{-40,10},{40,-10}},
            lineColor={0,0,0},
                fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                    textString="Const")}));
  end ThermalConductanceConst;

  block TimeConst "Constant signal of type Time"
   parameter Types.Time k "Constant Time output value";
        RealIO.TimeOutput y "Time constant"
      annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                  iconTransformation(extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="time",
               Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
          coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
              graphics={
          Rectangle(extent={{-40,40},{40,-40}},
            lineColor={0,0,0},
                radius=10,
            fillColor={236,236,236},
                            fillPattern=FillPattern.Solid),
          Text( extent={{-100,-44},{100,-64}},
            lineColor={0,0,0},
                    fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                textString="%name"),
          Text(         extent={{-40,10},{40,-10}},
            lineColor={0,0,0},
                fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                    textString="Const")}));
  end TimeConst;

  block VolumeFlowRateConst "Constant signal of type VolumeFlowRate"
   parameter Types.VolumeFlowRate k "Constant VolumeFlowRate output value";
        RealIO.VolumeFlowRateOutput y "VolumeFlowRate constant"
      annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                  iconTransformation(extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="volumeFlowRate",
               Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
          coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
              graphics={
          Rectangle(extent={{-40,40},{40,-40}},
            lineColor={0,0,0},
                radius=10,
            fillColor={236,236,236},
                            fillPattern=FillPattern.Solid),
          Text( extent={{-100,-44},{100,-64}},
            lineColor={0,0,0},
                    fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                textString="%name"),
          Text(         extent={{-40,10},{40,-10}},
            lineColor={0,0,0},
                fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                    textString="Const")}));
  end VolumeFlowRateConst;

  block VolumeConst "Constant signal of type Volume"
   parameter Types.Volume k "Constant Volume output value";
        RealIO.VolumeOutput y "Volume constant"
      annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                  iconTransformation(extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="volume",
               Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
          coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
              graphics={
          Rectangle(extent={{-40,40},{40,-40}},
            lineColor={0,0,0},
                radius=10,
            fillColor={236,236,236},
                            fillPattern=FillPattern.Solid),
          Text( extent={{-100,-44},{100,-64}},
            lineColor={0,0,0},
                    fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                textString="%name"),
          Text(         extent={{-40,10},{40,-10}},
            lineColor={0,0,0},
                fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                    textString="Const")}));
  end VolumeConst;

  block DeprecatedUntypedConstant
      "Deprecated Untyped Constant for automatic conversion from initial versions of Physiolibrary"
    extends Modelica.Icons.ObsoleteModel;
   parameter Real k "Untyped constant output value";
   parameter String varName="";
   parameter String units="1";

        Modelica.Blocks.Interfaces.RealOutput
                                  y "Untyped constant"
      annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                  iconTransformation(extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="acceleration",
                    Icon(
          coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
              graphics={
          Rectangle(extent={{-40,40},{40,-40}},
            lineColor={0,0,0},
                radius=10,
            fillColor={236,236,236},
                            fillPattern=FillPattern.Solid),
          Text( extent={{-100,-44},{100,-64}},
            lineColor={0,0,0},
                    fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                textString="%name"),
          Text(         extent={{-40,10},{40,-10}},
            lineColor={0,0,0},
                fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                    textString="Const")}));
  end DeprecatedUntypedConstant;

  block pHConst "Constant signal of type pH"
   parameter Types.pH k "Constant pH output value";
        Types.RealIO.pHOutput y "pH constant" annotation (Placement(
          transformation(extent={{40,-10},{60,10}}), iconTransformation(extent={{40,
              -10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="pH",
               Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
          coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
              graphics={
          Rectangle(extent={{-40,40},{40,-40}},
            lineColor={0,0,0},
                radius=10,
            fillColor={236,236,236},
                            fillPattern=FillPattern.Solid),
          Text( extent={{-100,-44},{100,-64}},
            lineColor={0,0,0},
                    fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                textString="%name"),
          Text(         extent={{-40,10},{40,-10}},
            lineColor={0,0,0},
                fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                    textString="Const")}));
  end pHConst;

  block VolumeDensityOfChargeConst
      "Constant signal of type VolumeDensityOfCharge"
   parameter Types.VolumeDensityOfCharge k
        "Constant VolumeDensityOfCharge output value";
        Types.RealIO.VolumeDensityOfChargeOutput y
        "VolumeDensityOfCharge constant"
                                       annotation (Placement(transformation(
            extent={{40,-10},{60,10}}), iconTransformation(extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="volumeDensityOfCharge",
               Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
          coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
              graphics={
          Rectangle(extent={{-40,40},{40,-40}},
            lineColor={0,0,0},
                radius=10,
            fillColor={236,236,236},
                            fillPattern=FillPattern.Solid),
          Text( extent={{-100,-44},{100,-64}},
            lineColor={0,0,0},
                    fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                textString="%name"),
          Text(         extent={{-40,10},{40,-10}},
            lineColor={0,0,0},
                fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                    textString="Const")}));
  end VolumeDensityOfChargeConst;

  block VelocityConst "Constant signal of type Velocity"
   parameter Types.Velocity k "Constant Velocity output value";
        Types.RealIO.VelocityOutput y "Velocity constant"
                                       annotation (Placement(transformation(
            extent={{40,-10},{60,10}}), iconTransformation(extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="velocity",
               Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
          coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
              graphics={
          Rectangle(extent={{-40,40},{40,-40}},
            lineColor={0,0,0},
                radius=10,
            fillColor={236,236,236},
                            fillPattern=FillPattern.Solid),
          Text( extent={{-100,-44},{100,-64}},
            lineColor={0,0,0},
                    fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                textString="%name"),
          Text(         extent={{-40,10},{40,-10}},
            lineColor={0,0,0},
                fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                    textString="Const")}));
  end VelocityConst;

  block PowerConst "Constant signal of type Power"
   parameter Types.Power k "Constant Power output value";
        RealIO.PowerOutput y "Power constant"
      annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                  iconTransformation(extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="power",
               Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
          coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
              graphics={
          Rectangle(extent={{-40,40},{40,-40}},
            lineColor={0,0,0},
                radius=10,
            fillColor={236,236,236},
                            fillPattern=FillPattern.Solid),
          Text( extent={{-100,-44},{100,-64}},
            lineColor={0,0,0},
                    fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                textString="%name"),
          Text(         extent={{-40,10},{40,-10}},
            lineColor={0,0,0},
                fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                    textString="Const")}));
  end PowerConst;

  block PositionConst "Constant signal of type Position"
   parameter Types.Position k "Constant Position output value";
        RealIO.PositionOutput y "Position constant"
      annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                  iconTransformation(extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="height",
               Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
          coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
              graphics={
          Rectangle(extent={{-40,40},{40,-40}},
            lineColor={0,0,0},
                radius=10,
            fillColor={236,236,236},
                            fillPattern=FillPattern.Solid),
          Text( extent={{-100,-44},{100,-64}},
            lineColor={0,0,0},
                    fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                textString="%name"),
          Text(         extent={{-40,10},{40,-10}},
            lineColor={0,0,0},
                fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                    textString="Const")}));
  end PositionConst;

    block MolarEnergyConst "Constant signal of type MolarEnergy"
      parameter Types.MolarEnergy k "Constant MolarEnergy output value";
        RealIO.MolarEnergyOutput y "MolarEnergy constant"
      annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                  iconTransformation(extent={{40,-10},{60,10}})));
    equation
        y=k;
    annotation (defaultComponentName="molarEnergy",
               Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
          coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
              graphics={
          Rectangle(extent={{-40,40},{40,-40}},
            lineColor={0,0,0},
                radius=10,
            fillColor={236,236,236},
                            fillPattern=FillPattern.Solid),
          Text( extent={{-100,-44},{100,-64}},
            lineColor={0,0,0},
                    fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                textString="%name"),
          Text(         extent={{-40,10},{40,-10}},
            lineColor={0,0,0},
                fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                    textString="Const")}));
    end MolarEnergyConst;

  block OneConst "1"

        RealIO.FractionOutput     y "=1"
      annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                  iconTransformation(extent={{40,-10},{60,10}})));
  equation
        y=1;
    annotation (defaultComponentName="one",
               Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
          coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
              graphics={
          Rectangle(extent={{-40,40},{40,-40}},
            lineColor={0,0,0},
                radius=10,
            fillColor={236,236,236},
                            fillPattern=FillPattern.Solid),
          Text( extent={{-100,-44},{100,-64}},
            lineColor={0,0,0},
                    fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                textString="%name"),
          Text(         extent={{-40,40},{40,-40}},
            lineColor={0,0,0},
                fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
            textString="1")}));
  end OneConst;

    block PopulationConst "Constant signal of type Population"
      parameter Types.Population k "Constant Population output value";
        RealIO.PopulationOutput y "Population constant"
      annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                  iconTransformation(extent={{40,-10},{60,10}})));
    equation
        y=k;
    annotation (defaultComponentName="population",
               Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
          coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
              graphics={
          Rectangle(extent={{-40,40},{40,-40}},
            lineColor={0,0,0},
                radius=10,
            fillColor={236,236,236},
                            fillPattern=FillPattern.Solid),
          Text( extent={{-100,-44},{100,-64}},
            lineColor={0,0,0},
                    fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                textString="%name"),
          Text(         extent={{-40,10},{40,-10}},
            lineColor={0,0,0},
                fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                    textString="Const")}));
    end PopulationConst;

    block PopulationChangeConst "Constant signal of type PopulationChange"
      parameter Types.PopulationChange k
        "Constant PopulationChange output value";
        RealIO.PopulationChangeOutput y "PopulationChange constant"
      annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                  iconTransformation(extent={{40,-10},{60,10}})));
    equation
        y=k;
    annotation (defaultComponentName="populationChange",
               Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
          coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
              graphics={
          Rectangle(extent={{-40,40},{40,-40}},
            lineColor={0,0,0},
                radius=10,
            fillColor={236,236,236},
                            fillPattern=FillPattern.Solid),
          Text( extent={{-100,-44},{100,-64}},
            lineColor={0,0,0},
                    fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                textString="%name"),
          Text(         extent={{-40,10},{40,-10}},
            lineColor={0,0,0},
                fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                    textString="Const")}));
    end PopulationChangeConst;

    block PopulationChangePerMemberConst
      "Constant signal of type PopulationChangePerMember"
      parameter Types.Time LifeTime
        "Mean lifetime as 1/PopulationChangePerMember output value";
        RealIO.PopulationChangePerMemberOutput y
        "PopulationChangePerMember constant"
      annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                  iconTransformation(extent={{40,-10},{60,10}})));
    equation
        y=1/LifeTime;
    annotation (defaultComponentName="populationChangePerMember",
               Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
          coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
              graphics={
          Rectangle(extent={{-40,40},{40,-40}},
            lineColor={0,0,0},
                radius=10,
            fillColor={236,236,236},
                            fillPattern=FillPattern.Solid),
          Text( extent={{-100,-44},{100,-64}},
            lineColor={0,0,0},
                    fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                textString="%name"),
          Text(         extent={{-40,10},{40,-10}},
            lineColor={0,0,0},
                fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                    textString="Const")}));
    end PopulationChangePerMemberConst;
  end Constants;

  package ScaleConstants
      extends Modelica.Icons.SourcesPackage;

  block Power "Constant signal of type Power per Mass"
   parameter Types.PowerPerMass k "Constant Power output value";
        RealIO.PowerOutput y "Power constant"
      annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                  iconTransformation(extent={{40,-10},{60,10}})));
    RealIO.MassInput mass annotation (Placement(transformation(extent={{-20,20},{20,
              60}}), iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=270,
          origin={0,40})));
  equation
        y=k*mass;
    annotation (defaultComponentName="power",
               Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
          coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
              graphics={
          Rectangle(extent={{-40,40},{40,-40}},
            lineColor={0,0,0},
                radius=10,
            fillColor={236,236,236},
                            fillPattern=FillPattern.Solid),
          Text( extent={{-100,-44},{100,-64}},
            lineColor={0,0,0},
                    fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                textString="%name"),
          Text(         extent={{-40,10},{40,-10}},
            lineColor={0,0,0},
                fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                    textString="Const")}));
  end Power;
  end ScaleConstants;

  package RealIO
    extends Modelica.Icons.Package;

    connector AccelerationInput = input Acceleration
      "input Acceleration as connector"
      annotation (defaultComponentName="acceleration",
      Icon(graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid)},
           coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
      Diagram(coordinateSystem(
            preserveAspectRatio=true, initialScale=0.2,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{0,50},{100,0},{0,-50},{0,50}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid), Text(
              extent={{-10,85},{-10,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
    <p>
    Connector with one input signal of type Acceleration.
    </p>
    </html>"));
    connector AccelerationOutput = output Acceleration
      "output Acceleration as connector"
      annotation (defaultComponentName="acceleration",
      Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,50},{0,0},{-100,-50},{-100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{30,110},{30,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
    connector AmountOfSubstanceInput = input AmountOfSubstance
      "input AmountOfSubstance as connector"
      annotation (defaultComponentName="amountofsubstance",
      Icon(graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid)},
           coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
      Diagram(coordinateSystem(
            preserveAspectRatio=true, initialScale=0.2,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{0,50},{100,0},{0,-50},{0,50}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid), Text(
              extent={{-10,85},{-10,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
    <p>
    Connector with one input signal of type AmountOfSubstance.
    </p>
    </html>"));
    connector AmountOfSubstanceOutput = output AmountOfSubstance
      "output AmountOfSubstance as connector"
      annotation (defaultComponentName="amountofsubstance",
      Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,50},{0,0},{-100,-50},{-100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{30,110},{30,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
    connector ConcentrationInput = input Concentration
      "input Concentration as connector"
      annotation (defaultComponentName="concentration",
      Icon(graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid)},
           coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
      Diagram(coordinateSystem(
            preserveAspectRatio=true, initialScale=0.2,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{0,50},{100,0},{0,-50},{0,50}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid), Text(
              extent={{-10,85},{-10,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
    <p>
    Connector with one input signal of type Concentration.
    </p>
    </html>"));
    connector ConcentrationOutput = output Concentration
      "output Concentration as connector"
      annotation (defaultComponentName="concentration",
      Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,50},{0,0},{-100,-50},{-100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{30,110},{30,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
    connector DiffusionPermeabilityInput = input DiffusionPermeability
      "input DiffusionPermeability as connector"
      annotation (defaultComponentName="diffusionmembranepermeability",
      Icon(graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid)},
           coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
      Diagram(coordinateSystem(
            preserveAspectRatio=true, initialScale=0.2,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{0,50},{100,0},{0,-50},{0,50}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid), Text(
              extent={{-10,85},{-10,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
    <p>
    Connector with one input signal of type DiffusionMembranePermeability.
    </p>
    </html>"));
    connector DiffusionPermeabilityOutput = output DiffusionPermeability
      "output DiffusionPermeability as connector"
      annotation (defaultComponentName="diffusionmembranepermeability",
      Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,50},{0,0},{-100,-50},{-100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{30,110},{30,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
    connector ElectricCurrentInput = input ElectricCurrent
      "input ElectricCurrent as connector"
      annotation (defaultComponentName="electriccurrent",
      Icon(graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid)},
           coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
      Diagram(coordinateSystem(
            preserveAspectRatio=true, initialScale=0.2,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{0,50},{100,0},{0,-50},{0,50}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid), Text(
              extent={{-10,85},{-10,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
    <p>
    Connector with one input signal of type ElectricCurrent.
    </p>
    </html>"));
    connector ElectricCurrentOutput = output ElectricCurrent
      "output ElectricCurrent as connector"
      annotation (defaultComponentName="electriccurrent",
      Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,50},{0,0},{-100,-50},{-100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{30,110},{30,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
    connector ElectricChargeInput = input ElectricCharge
      "input ElectricCharge as connector"
      annotation (defaultComponentName="electriccharge",
      Icon(graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid)},
           coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
      Diagram(coordinateSystem(
            preserveAspectRatio=true, initialScale=0.2,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{0,50},{100,0},{0,-50},{0,50}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid), Text(
              extent={{-10,85},{-10,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
    <p>
    Connector with one input signal of type ElectricCharge.
    </p>
    </html>"));
    connector ElectricChargeOutput = output ElectricCharge
      "output ElectricCharge as connector"
      annotation (defaultComponentName="electriccharge",
      Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,50},{0,0},{-100,-50},{-100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{30,110},{30,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
    connector EnergyInput = input Energy "input Energy as connector"
      annotation (defaultComponentName="energy",
      Icon(graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid)},
           coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
      Diagram(coordinateSystem(
            preserveAspectRatio=true, initialScale=0.2,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{0,50},{100,0},{0,-50},{0,50}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid), Text(
              extent={{-10,85},{-10,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
    <p>
    Connector with one input signal of type Energy.
    </p>
    </html>"));

    connector EnergyOutput = output Energy "output Energy as connector"
      annotation (defaultComponentName="energy",
      Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,50},{0,0},{-100,-50},{-100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{30,110},{30,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));

    connector HeatInput = input Heat "input Heat as connector"
      annotation (defaultComponentName="heat",
      Icon(graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid)},
           coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
      Diagram(coordinateSystem(
            preserveAspectRatio=true, initialScale=0.2,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{0,50},{100,0},{0,-50},{0,50}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid), Text(
              extent={{-10,85},{-10,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
    <p>
    Connector with one input signal of type Heat.
    </p>
    </html>"));
    connector HeatOutput = output Heat "output Heat as connector"
      annotation (defaultComponentName="heat",
      Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,50},{0,0},{-100,-50},{-100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{30,110},{30,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
    connector HeatFlowRateInput = input HeatFlowRate
      "input HeatFlowRate as connector"
      annotation (defaultComponentName="heatflowrate",
      Icon(graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid)},
           coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
      Diagram(coordinateSystem(
            preserveAspectRatio=true, initialScale=0.2,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{0,50},{100,0},{0,-50},{0,50}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid), Text(
              extent={{-10,85},{-10,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
    <p>
    Connector with one input signal of type HeatFlowRate.
    </p>
    </html>"));
    connector HeatFlowRateOutput = output HeatFlowRate
      "output HeatFlowRate as connector"
      annotation (defaultComponentName="heatflowrate",
      Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,50},{0,0},{-100,-50},{-100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{30,110},{30,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
    connector HeightInput = input Height "input Height as connector"
      annotation (defaultComponentName="height",
      Icon(graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid)},
           coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
      Diagram(coordinateSystem(
            preserveAspectRatio=true, initialScale=0.2,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{0,50},{100,0},{0,-50},{0,50}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid), Text(
              extent={{-10,85},{-10,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
    <p>
    Connector with one input signal of type Height.
    </p>
    </html>"));
    connector HeightOutput = output Height "output Height as connector"
      annotation (defaultComponentName="height",
      Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,50},{0,0},{-100,-50},{-100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{30,110},{30,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
    connector MassInput = input Mass "input Mass as connector"
      annotation (defaultComponentName="mass",
      Icon(graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid)},
           coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
      Diagram(coordinateSystem(
            preserveAspectRatio=true, initialScale=0.2,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{0,50},{100,0},{0,-50},{0,50}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid), Text(
              extent={{-10,85},{-10,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
    <p>
    Connector with one input signal of type Mass.
    </p>
    </html>"));

    connector MassOutput = output Mass "output Mass as connector"
      annotation (defaultComponentName="mass",
      Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,50},{0,0},{-100,-50},{-100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{30,110},{30,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));

    connector MassFlowRateInput = input MassFlowRate
      "input MassFlowRate as connector"
      annotation (defaultComponentName="massflowrate",
      Icon(graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid)},
           coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
      Diagram(coordinateSystem(
            preserveAspectRatio=true, initialScale=0.2,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{0,50},{100,0},{0,-50},{0,50}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid), Text(
              extent={{-10,85},{-10,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
    <p>
    Connector with one input signal of type MassFlowRate.
    </p>
    </html>"));

    connector MassFlowRateOutput = output MassFlowRate
      "output MassFlowRate as connector"
      annotation (defaultComponentName="massflowrate",
      Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,50},{0,0},{-100,-50},{-100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{30,110},{30,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));

    connector MolarFlowRateInput = input MolarFlowRate
      "input MolarFlowRate as connector"
      annotation (defaultComponentName="molarflowrate",
      Icon(graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid)},
           coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
      Diagram(coordinateSystem(
            preserveAspectRatio=true, initialScale=0.2,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{0,50},{100,0},{0,-50},{0,50}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid), Text(
              extent={{-10,85},{-10,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
    <p>
    Connector with one input signal of type MolarFlowRate.
    </p>
    </html>"));
    connector MolarFlowRateOutput = output MolarFlowRate
      "output MolarFlowRate as connector"
      annotation (defaultComponentName="molarflowrate",
      Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,50},{0,0},{-100,-50},{-100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{30,110},{30,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
    connector OsmolarityInput = input Osmolarity
      "input Concentration as connector"
      annotation (defaultComponentName="osmolarity",
      Icon(graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid)},
           coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
      Diagram(coordinateSystem(
            preserveAspectRatio=true, initialScale=0.2,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{0,50},{100,0},{0,-50},{0,50}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid), Text(
              extent={{-10,85},{-10,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
    <p>
    Connector with one input signal of type Concentration.
    </p>
    </html>"));
    connector OsmolarityOutput = output Osmolarity
      "output Concentration as connector"
      annotation (defaultComponentName="osmolarity",
      Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,50},{0,0},{-100,-50},{-100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{30,110},{30,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
    connector PressureInput = input Pressure "input Pressure as connector"
      annotation (defaultComponentName="pressure",
      Icon(graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid)},
           coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
      Diagram(coordinateSystem(
            preserveAspectRatio=true, initialScale=0.2,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{0,50},{100,0},{0,-50},{0,50}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid), Text(
              extent={{-10,85},{-10,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
    <p>
    Connector with one input signal of type Pressure.
    </p>
    </html>"));

    connector PressureOutput = output Pressure "output Pressure as connector"
      annotation (defaultComponentName="pressure",
      Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,50},{0,0},{-100,-50},{-100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{30,110},{30,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));

    connector VolumeInput = input Volume "input Volume as connector"
      annotation (defaultComponentName="volume",
      Icon(graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid)},
           coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
      Diagram(coordinateSystem(
            preserveAspectRatio=true, initialScale=0.2,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{0,50},{100,0},{0,-50},{0,50}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid), Text(
              extent={{-10,85},{-10,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
    <p>
    Connector with one input signal of type Volume.
    </p>
    </html>"));

    connector VolumeOutput = output Volume "output Volume as connector"
      annotation (defaultComponentName="volume",
      Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,50},{0,0},{-100,-50},{-100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{30,110},{30,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));

    connector VolumeFlowRateInput = input VolumeFlowRate
      "input VolumeFlowRate as connector"
      annotation (defaultComponentName="volumeflowrate",
      Icon(graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid)},
           coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
      Diagram(coordinateSystem(
            preserveAspectRatio=true, initialScale=0.2,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{0,50},{100,0},{0,-50},{0,50}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid), Text(
              extent={{-10,85},{-10,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
    <p>
    Connector with one input signal of type VolumeFlowRate.
    </p>
    </html>"));

    connector VolumeFlowRateOutput = output VolumeFlowRate
      "output VolumeFlowRate as connector"
      annotation (defaultComponentName="volumeflowrate",
      Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,50},{0,0},{-100,-50},{-100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{30,110},{30,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));

    connector TemperatureInput = input Temperature
      "input Temperature as connector"
      annotation (defaultComponentName="temperature",
      Icon(graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid)},
           coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
      Diagram(coordinateSystem(
            preserveAspectRatio=true, initialScale=0.2,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{0,50},{100,0},{0,-50},{0,50}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid), Text(
              extent={{-10,85},{-10,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
    <p>
    Connector with one input signal of type Temperature.
    </p>
    </html>"));

    connector TemperatureOutput = output Temperature
      "output Temperature as connector"
      annotation (defaultComponentName="temperature",
      Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,50},{0,0},{-100,-50},{-100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{30,110},{30,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
    connector TimeInput = input Time "input Time as connector"
      annotation (defaultComponentName="time",
      Icon(graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid)},
           coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
      Diagram(coordinateSystem(
            preserveAspectRatio=true, initialScale=0.2,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{0,50},{100,0},{0,-50},{0,50}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid), Text(
              extent={{-10,85},{-10,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
    <p>
    Connector with one input signal of type Time.
    </p>
    </html>"));
    connector TimeOutput = output Time "output Time as connector"
      annotation (defaultComponentName="time",
      Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,50},{0,0},{-100,-50},{-100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{30,110},{30,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));

    connector ThermalConductanceInput = input ThermalConductance
      "input ThermalConductance as connector"
      annotation (defaultComponentName="thermalconductance",
      Icon(graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid)},
           coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
      Diagram(coordinateSystem(
            preserveAspectRatio=true, initialScale=0.2,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{0,50},{100,0},{0,-50},{0,50}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid), Text(
              extent={{-10,85},{-10,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
    <p>
    Connector with one input signal of type ThermalConductance.
    </p>
    </html>"));

    connector ThermalConductanceOutput = output ThermalConductance
      "output ThermalConductance as connector"
      annotation (defaultComponentName="thermalconductance",
      Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,50},{0,0},{-100,-50},{-100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{30,110},{30,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));

    connector ElectricPotentialInput = input ElectricPotential
      "input ElectricPotential as connector"
      annotation (defaultComponentName="electricpotential",
      Icon(graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid)},
           coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
      Diagram(coordinateSystem(
            preserveAspectRatio=true, initialScale=0.2,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{0,50},{100,0},{0,-50},{0,50}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid), Text(
              extent={{-10,85},{-10,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
    <p>
    Connector with one input signal of type ElectricPotential.
    </p>
    </html>"));

    connector ElectricPotentialOutput = output ElectricPotential
      "output ElectricPotential as connector"
      annotation (defaultComponentName="electricpotential",
      Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,50},{0,0},{-100,-50},{-100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{30,110},{30,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));

    connector FractionInput = input Fraction "input Fraction as connector"
      annotation (defaultComponentName="fraction",
      Icon(graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid)},
           coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
      Diagram(coordinateSystem(
            preserveAspectRatio=true, initialScale=0.2,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{0,50},{100,0},{0,-50},{0,50}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid), Text(
              extent={{-10,85},{-10,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
    <p>
    Connector with one input signal of type Fraction.
    </p>
    </html>"));

    connector FractionOutput = output Fraction "output Fraction as connector"
      annotation (defaultComponentName="fraction",
      Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,50},{0,0},{-100,-50},{-100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{30,110},{30,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));

    connector FrequencyInput = input Frequency "input Frequency as connector"
      annotation (defaultComponentName="frequency",
      Icon(graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid)},
           coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
      Diagram(coordinateSystem(
            preserveAspectRatio=true, initialScale=0.2,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{0,50},{100,0},{0,-50},{0,50}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid), Text(
              extent={{-10,85},{-10,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
    <p>
    Connector with one input signal of type Frequency.
    </p>
    </html>"));

    connector FrequencyOutput = output Frequency
      "output Frequency as connector"
      annotation (defaultComponentName="frequency",
      Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,50},{0,0},{-100,-50},{-100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{30,110},{30,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
  <p>
  Connector with one output signal of type Frequency.
  </p>
  </html>"));

    connector OsmoticPermeabilityInput = input OsmoticPermeability
      "input OsmoticPermeability as connector"
      annotation (defaultComponentName="osmoticmembranepermeability",
      Icon(graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid)},
           coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
      Diagram(coordinateSystem(
            preserveAspectRatio=true, initialScale=0.2,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{0,50},{100,0},{0,-50},{0,50}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid), Text(
              extent={{-10,85},{-10,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
    <p>
    Connector with one input signal of type OsmoticMembranePermeability.
    </p>
    </html>"));

    connector OsmoticPermeabilityOutput = output OsmoticPermeability
      "output OsmoticPermeability as connector"
      annotation (defaultComponentName="osmoticmembranepermeability",
      Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,50},{0,0},{-100,-50},{-100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{30,110},{30,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));

    connector HydraulicConductanceInput = input HydraulicConductance
      "input HydraulicConductance as connector"
      annotation (defaultComponentName="hydraulicconductance",
      Icon(graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid)},
           coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
      Diagram(coordinateSystem(
            preserveAspectRatio=true, initialScale=0.2,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{0,50},{100,0},{0,-50},{0,50}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid), Text(
              extent={{-10,85},{-10,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
    <p>
    Connector with one input signal of type HydraulicConductance.
    </p>
    </html>"));

    connector HydraulicConductanceOutput = output HydraulicConductance
      "output HydraulicConductance as connector"
      annotation (defaultComponentName="hydraulicconductance",
      Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,50},{0,0},{-100,-50},{-100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{30,110},{30,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));

    connector HydraulicComplianceInput = input HydraulicCompliance
      "input HydraulicCompliance as connector"
      annotation (defaultComponentName="hydrauliccompliance",
      Icon(graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid)},
           coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
      Diagram(coordinateSystem(
            preserveAspectRatio=true, initialScale=0.2,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{0,50},{100,0},{0,-50},{0,50}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid), Text(
              extent={{-10,85},{-10,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
    <p>
    Connector with one input signal of type HydraulicCompliance.
    </p>
    </html>"));

    connector HydraulicComplianceOutput = output HydraulicCompliance
      "output HydraulicCompliance as connector"
      annotation (defaultComponentName="hydrauliccompliance",
      Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,50},{0,0},{-100,-50},{-100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{30,110},{30,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));

    connector DensityInput =input Density "input Density as connector"
      annotation (defaultComponentName="density",
      Icon(graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid)},
           coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
      Diagram(coordinateSystem(
            preserveAspectRatio=true, initialScale=0.2,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{0,50},{100,0},{0,-50},{0,50}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid), Text(
              extent={{-10,85},{-10,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
    <p>
    Connector with one input signal of type Volume.
    </p>
    </html>"));
    connector DensityOutput =output Density "output Density as connector"
      annotation (defaultComponentName="density",
      Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,50},{0,0},{-100,-50},{-100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{30,110},{30,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
    connector HydraulicInertanceInput = input HydraulicInertance
      "input HydraulicInertance as connector"
      annotation (defaultComponentName="hydraulicinertance",
      Icon(graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid)},
           coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
      Diagram(coordinateSystem(
            preserveAspectRatio=true, initialScale=0.2,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{0,50},{100,0},{0,-50},{0,50}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid), Text(
              extent={{-10,85},{-10,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
    <p>
    Connector with one input signal of type HydraulicInertance.
    </p>
    </html>"));

    connector HydraulicInertanceOutput = output HydraulicInertance
      "output HydraulicInertance as connector"
      annotation (defaultComponentName="hydraulicinertance",
      Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,50},{0,0},{-100,-50},{-100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{30,110},{30,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
    connector GasSolubilityInput = input GasSolubility
      "input GasSolubility as connector"
      annotation (defaultComponentName="gassolubility",
      Icon(graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid)},
           coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
      Diagram(coordinateSystem(
            preserveAspectRatio=true, initialScale=0.2,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{0,50},{100,0},{0,-50},{0,50}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid), Text(
              extent={{-10,85},{-10,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
    <p>
    Connector with one input signal of type GasSolubility.
    </p>
    </html>"));

    connector GasSolubilityOutput = output GasSolubility
      "output GasSolubility as connector"
      annotation (defaultComponentName="gassolubility",
      Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,50},{0,0},{-100,-50},{-100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{30,110},{30,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));

    connector SpecificEnergyInput =
                            input SpecificEnergy
      "input SpecificEnergy as connector"
      annotation (defaultComponentName="specificEnergy",
      Icon(graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid)},
           coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
      Diagram(coordinateSystem(
            preserveAspectRatio=true, initialScale=0.2,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{0,50},{100,0},{0,-50},{0,50}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid), Text(
              extent={{-10,85},{-10,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
    <p>
    Connector with one input signal of type Volume.
    </p>
    </html>"));
    connector SpecificEnergyOutput =
                             output SpecificEnergy
      "output SpecificEnergy as connector"
      annotation (defaultComponentName="specificEnergy",
      Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,50},{0,0},{-100,-50},{-100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{30,110},{30,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
    connector SpecificHeatCapacityInput =
                            input SpecificHeatCapacity
      "input SpecificHeatCapacity as connector"
      annotation (defaultComponentName="specificHeatCapacity",
      Icon(graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid)},
           coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
      Diagram(coordinateSystem(
            preserveAspectRatio=true, initialScale=0.2,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{0,50},{100,0},{0,-50},{0,50}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid), Text(
              extent={{-10,85},{-10,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
    <p>
    Connector with one input signal of type Volume.
    </p>
    </html>"));
    connector SpecificHeatCapacityOutput =
                             output SpecificHeatCapacity
      "output SpecificHeatCapacity as connector"
      annotation (defaultComponentName="specificHeatCapacity",
      Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,50},{0,0},{-100,-50},{-100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{30,110},{30,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));

    connector pHInput =           input pH "input pH as connector"
      annotation (defaultComponentName="pH",
      Icon(graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid)},
           coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
      Diagram(coordinateSystem(
            preserveAspectRatio=true, initialScale=0.2,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{0,50},{100,0},{0,-50},{0,50}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid), Text(
              extent={{-10,85},{-10,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
    <p>
    Connector with one input signal of type pH.
    </p>
    </html>"));
    connector pHOutput =           output pH "output pH as connector"
      annotation (defaultComponentName="pH",
      Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,50},{0,0},{-100,-50},{-100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{30,110},{30,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
  <p>
  Connector with one output signal of type pH.
  </p>
  </html>"));
    connector VolumeDensityOfChargeInput =           input
        VolumeDensityOfCharge "input VolumeDensityOfCharge as connector"
      annotation (defaultComponentName="volumeDensityOfCharge",
      Icon(graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid)},
           coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
      Diagram(coordinateSystem(
            preserveAspectRatio=true, initialScale=0.2,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{0,50},{100,0},{0,-50},{0,50}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid), Text(
              extent={{-10,85},{-10,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
    <p>
    Connector with one input signal of type VolumeDensityOfCharge.
    </p>
    </html>"));
    connector VolumeDensityOfChargeOutput =           output
        VolumeDensityOfCharge "output VolumeDensityOfCharge as connector"
      annotation (defaultComponentName="volumeDensityOfCharge",
      Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,50},{0,0},{-100,-50},{-100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{30,110},{30,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
  <p>
  Connector with one output signal of type VolumeDensityOfCharge.
  </p>
  </html>"));
    connector MassConcentrationInput =
                                   input MassConcentration
      "input MassConcentration as connector"
      annotation (defaultComponentName="massConcentration",
      Icon(graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid)},
           coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
      Diagram(coordinateSystem(
            preserveAspectRatio=true, initialScale=0.2,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{0,50},{100,0},{0,-50},{0,50}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid), Text(
              extent={{-10,85},{-10,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
    <p>
    Connector with one input signal of type MassConcentration.
    </p>
    </html>"));
    connector MassConcentrationOutput =
                                    output MassConcentration
      "output MassConcentration as connector"
      annotation (defaultComponentName="massConcentration",
      Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,50},{0,0},{-100,-50},{-100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{30,110},{30,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
  <p>
  Connector with one output signal of type MassConcentration.
  </p>
  </html>"));

    connector VelocityInput =      input Velocity "input Velocity as connector"
      annotation (defaultComponentName="velocity",
      Icon(graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid)},
           coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
      Diagram(coordinateSystem(
            preserveAspectRatio=true, initialScale=0.2,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{0,50},{100,0},{0,-50},{0,50}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid), Text(
              extent={{-10,85},{-10,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
    <p>
    Connector with one input signal of type Velocity.
    </p>
    </html>"));
    connector VelocityOutput =      output Velocity
      "output Velocity as connector"
      annotation (defaultComponentName="velocity",
      Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,50},{0,0},{-100,-50},{-100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{30,110},{30,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
  <p>
  Connector with one output signal of type Velocity.
  </p>
  </html>"));

    connector PowerInput = input Power "input Power as connector"
      annotation (defaultComponentName="power",
      Icon(graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid)},
           coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
      Diagram(coordinateSystem(
            preserveAspectRatio=true, initialScale=0.2,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{0,50},{100,0},{0,-50},{0,50}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid), Text(
              extent={{-10,85},{-10,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
    <p>
    Connector with one input signal of type Power.
    </p>
    </html>"));
    connector PowerOutput = output Power "output Power as connector"
      annotation (defaultComponentName="power",
      Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,50},{0,0},{-100,-50},{-100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{30,110},{30,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
  <p>
  Connector with one output signal of type Power.
  </p>
  </html>"));

    connector PositionInput = input Position "input Position as connector"
      annotation (defaultComponentName="position",
      Icon(graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid)},
           coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
      Diagram(coordinateSystem(
            preserveAspectRatio=true, initialScale=0.2,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{0,50},{100,0},{0,-50},{0,50}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid), Text(
              extent={{-10,85},{-10,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
    <p>
    Connector with one input signal of type Position.
    </p>
    </html>"));
    connector PositionOutput = output Position "output Position as connector"
      annotation (defaultComponentName="position",
      Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,50},{0,0},{-100,-50},{-100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{30,110},{30,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
  <p>
  Connector with one output signal of type Position.
  </p>
  </html>"));
     connector MolarEnergyInput = input MolarEnergy
      "input MolarEnergy as connector"
      annotation (defaultComponentName="molarEnergy",
      Icon(graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid)},
           coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
      Diagram(coordinateSystem(
            preserveAspectRatio=true, initialScale=0.2,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{0,50},{100,0},{0,-50},{0,50}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid), Text(
              extent={{-10,85},{-10,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
    <p>
    Connector with one input signal of type MolarEnergy.
    </p>
    </html>"));

    connector MolarEnergyOutput = output MolarEnergy
      "output MolarEnergy as connector"
      annotation (defaultComponentName="molarEnergy",
      Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,50},{0,0},{-100,-50},{-100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{30,110},{30,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
  <p>
  Connector with one output signal of type MolarEnergy.
  </p>
  </html>"));
     connector PopulationInput =  input Population
      "input Population as connector"
      annotation (defaultComponentName="population",
      Icon(graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid)},
           coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
      Diagram(coordinateSystem(
            preserveAspectRatio=true, initialScale=0.2,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{0,50},{100,0},{0,-50},{0,50}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid), Text(
              extent={{-10,85},{-10,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
    <p>
    Connector with one input signal of type Population.
    </p>
    </html>"));
    connector PopulationOutput =  output Population
      "output Population as connector"
      annotation (defaultComponentName="population",
      Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,50},{0,0},{-100,-50},{-100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{30,110},{30,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
  <p>
  Connector with one output signal of type Population.
  </p>
  </html>"));

     connector PopulationChangeInput =
                                  input PopulationChange
      "input PopulationChange as connector"
      annotation (defaultComponentName="populationChange",
      Icon(graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid)},
           coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
      Diagram(coordinateSystem(
            preserveAspectRatio=true, initialScale=0.2,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{0,50},{100,0},{0,-50},{0,50}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid), Text(
              extent={{-10,85},{-10,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
    <p>
    Connector with one input signal of type PopulationChange.
    </p>
    </html>"));
    connector PopulationChangeOutput =
                                  output PopulationChange
      "output PopulationChange as connector"
      annotation (defaultComponentName="populationChange",
      Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,50},{0,0},{-100,-50},{-100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{30,110},{30,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
  <p>
  Connector with one output signal of type PopulationChange.
  </p>
  </html>"));

    connector PopulationChangePerMemberInput =
                                  input PopulationChangePerMember
      "input PopulationChangePerMember as connector"
      annotation (defaultComponentName="populationChangePerMember",
      Icon(graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid)},
           coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
      Diagram(coordinateSystem(
            preserveAspectRatio=true, initialScale=0.2,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{0,50},{100,0},{0,-50},{0,50}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid), Text(
              extent={{-10,85},{-10,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
    <p>
    Connector with one input signal of type PopulationChangePerMember.
    </p>
    </html>"));
    connector PopulationChangePerMemberOutput =
                                  output PopulationChangePerMember
      "output PopulationChangePerMember as connector"
      annotation (defaultComponentName="populationChangePerMember",
      Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,50},{0,0},{-100,-50},{-100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{30,110},{30,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
  <p>
  Connector with one output signal of type PopulationChangePerMember.
  </p>
  </html>"));
  end RealIO;

    expandable connector BusConnector
    "Empty control bus that is adapted to the signals connected to it"

    annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.2), graphics={
            Rectangle(
              extent={{-20,2},{20,-2}},
              lineColor={0,0,255},
              lineThickness=0.5),
            Polygon(
              points={{-80,50},{80,50},{100,30},{80,-40},{60,-50},{-60,-50},{
                -80,-40},{-100,30},{-80,50}},
              lineColor={0,0,0},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-65,25},{-55,15}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-5,25},{5,15}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{55,25},{65,15}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-35,-15},{-25,-25}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{25,-15},{35,-25}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.2), graphics={
            Polygon(
              points={{-40,25},{40,25},{50,15},{40,-20},{30,-25},{-30,-25},{-40,
                  -20},{-50,15},{-40,25}},
              lineColor={0,0,0},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-32.5,7.5},{-27.5,12.5}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-2.5,12.5},{2.5,7.5}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{27.5,12.5},{32.5,7.5}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-17.5,-7.5},{-12.5,-12.5}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{12.5,-7.5},{17.5,-12.5}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-150,70},{150,40}},
              lineColor={0,0,0},
              textString="%name")}),
        Documentation(info="<html>
<p>
This connector defines the \"expandable connector\" that
is used as bus in the Physiomodel (www.physiomodel.org).
Note, this connector is \"empty\". When using it, the actual content is
constructed by the signals connected to this bus.
</p>
</html>"));

    end BusConnector;

  partial package IO_Bus "Subsystem outputs manipulation"
    extends Modelica.Icons.VariantsPackage;

    replaceable package PhysiolibTypesRealTypes = Physiolibrary.Types.RealTypes
      "Redefine this package only if there are not possible to use Physiolibrary types for variables!";

    replaceable partial model Variables
      "Subsystem output busConnector variables"
      package T = PhysiolibTypesRealTypes;

      replaceable block BooleanVariable =
        Physiolibrary.Types.BooleanExtension.Parameter constrainedby
        Physiolibrary.Types.AbstractBoolean;

      BusConnector busConnector annotation (Placement(transformation(extent={{
                80,-12},{100,8}}), iconTransformation(extent={{-10,-10},{10,10}})));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}), graphics={Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,255},
              fillColor={215,215,215},
              fillPattern=FillPattern.Solid), Text(
              extent={{-200,-100},{200,-140}},
              lineColor={0,0,255},
              fillColor={215,215,215},
              fillPattern=FillPattern.Solid,
              textString="%name")}),        Documentation(revisions="<html>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"0\"><tr>
<td><p>Author:</p></td>
<td><p>Marek Matejak</p></td>
</tr>
<tr>
<td><p>License:</p></td>
<td><p>GPL 3.0</p></td>
</tr>
<tr>
<td><p>By:</p></td>
<td><p>Charles University, Prague</p></td>
</tr>
<tr>
<td><p>Date of:</p></td>
<td><p>2014</p></td>
</tr>
</table>
<p>Copyright &copy; 2014 Marek Matejak</p>
</html>"));
    end Variables;

    model InputFromFile = Variables(T(
      redeclare block Variable =
            Physiolibrary.Types.RealExtension.InputParameter),
      redeclare block BooleanVariable =
            Physiolibrary.Types.BooleanExtension.InputParameter)
      "Load values in non-SI units from file io/input.txt"                                                            annotation (
        Documentation(revisions="<html>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"0\"><tr>
<td><p>Author:</p></td>
<td><p>Marek Matejak</p></td>
</tr>
<tr>
<td><p>License:</p></td>
<td><p>GPL 3.0</p></td>
</tr>
<tr>
<td><p>By:</p></td>
<td><p>Charles University, Prague</p></td>
</tr>
<tr>
<td><p>Date of:</p></td>
<td><p>2014</p></td>
</tr>
</table>
<p>Copyright &copy; 2014 Marek Matejak</p>
</html>"));

    model OutputToFile = Variables(T(
      redeclare block Variable =
            Physiolibrary.Types.RealExtension.OutputFinal),
      redeclare block BooleanVariable =
            Physiolibrary.Types.BooleanExtension.OutputFinal)
      "Store values in non-SI units to file io/output.txt"                                                         annotation (
        Documentation(revisions="<html>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"0\"><tr>
<td><p>Author:</p></td>
<td><p>Marek Matejak</p></td>
</tr>
<tr>
<td><p>License:</p></td>
<td><p>GPL 3.0</p></td>
</tr>
<tr>
<td><p>By:</p></td>
<td><p>Charles University, Prague</p></td>
</tr>
<tr>
<td><p>Date of:</p></td>
<td><p>2014</p></td>
</tr>
</table>
<p>Copyright &copy; 2014 Marek Matejak</p>
</html>"));

    model OutputComparison = Variables(T(
      redeclare block Variable =
            Physiolibrary.Types.RealExtension.OutputComparison),
      redeclare block BooleanVariable =
            Physiolibrary.Types.BooleanExtension.OutputComparison)
      "Compare values in non-SI units with file io/input.txt and store results to io/comparison.txt"
                                                                                                          annotation (
        Documentation(revisions="<html>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"0\"><tr>
<td><p>Author:</p></td>
<td><p>Marek Matejak</p></td>
</tr>
<tr>
<td><p>License:</p></td>
<td><p>GPL 3.0</p></td>
</tr>
<tr>
<td><p>By:</p></td>
<td><p>Charles University, Prague</p></td>
</tr>
<tr>
<td><p>Date of:</p></td>
<td><p>2014</p></td>
</tr>
</table>
<p>Copyright &copy; 2014 Marek Matejak</p>
</html>"));

    model InputFromFile_SI = Variables(T(
      redeclare block Variable =
            Physiolibrary.Types.RealExtension.InputParameter_SI),
      redeclare block BooleanVariable =
            Physiolibrary.Types.BooleanExtension.InputParameter)
      "Load values in SI units from file io/input_SI.txt"                                                            annotation (
        Documentation(revisions="<html>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"0\"><tr>
<td><p>Author:</p></td>
<td><p>Marek Matejak</p></td>
</tr>
<tr>
<td><p>License:</p></td>
<td><p>GPL 3.0</p></td>
</tr>
<tr>
<td><p>By:</p></td>
<td><p>Charles University, Prague</p></td>
</tr>
<tr>
<td><p>Date of:</p></td>
<td><p>2014</p></td>
</tr>
</table>
<p>Copyright &copy; 2014 Marek Matejak</p>
</html>"));

    model OutputToFile_SI = Variables(T(
      redeclare block Variable =
            Physiolibrary.Types.RealExtension.OutputFinal_SI),
      redeclare block BooleanVariable =
            Physiolibrary.Types.BooleanExtension.OutputFinal)
      "Store values in SI units to file io/output_SI.txt"                                                         annotation (
        Documentation(revisions="<html>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"0\"><tr>
<td><p>Author:</p></td>
<td><p>Marek Matejak</p></td>
</tr>
<tr>
<td><p>License:</p></td>
<td><p>GPL 3.0</p></td>
</tr>
<tr>
<td><p>By:</p></td>
<td><p>Charles University, Prague</p></td>
</tr>
<tr>
<td><p>Date of:</p></td>
<td><p>2014</p></td>
</tr>
</table>
<p>Copyright &copy; 2014 Marek Matejak</p>
</html>"));

    model OutputComparison_SI = Variables(T(
      redeclare block Variable =
            Physiolibrary.Types.RealExtension.OutputComparison_SI),
      redeclare block BooleanVariable =
            Physiolibrary.Types.BooleanExtension.OutputComparison)
      "Compare values in SI units with file io/input_SI.txt and store results to io/comparison_SI.txt"
                                                                                                          annotation (
        Documentation(revisions="<html>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"0\"><tr>
<td><p>Author:</p></td>
<td><p>Marek Matejak</p></td>
</tr>
<tr>
<td><p>License:</p></td>
<td><p>GPL 3.0</p></td>
</tr>
<tr>
<td><p>By:</p></td>
<td><p>Charles University, Prague</p></td>
</tr>
<tr>
<td><p>Date of:</p></td>
<td><p>2014</p></td>
</tr>
</table>
<p>Copyright &copy; 2014 Marek Matejak</p>
</html>"));

    annotation (Documentation(revisions="<html>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"0\"><tr>
<td><p>Author:</p></td>
<td><p>Marek Matejak</p></td>
</tr>
<tr>
<td><p>License:</p></td>
<td><p>GPL 3.0</p></td>
</tr>
<tr>
<td><p>By:</p></td>
<td><p>Charles University, Prague</p></td>
</tr>
<tr>
<td><p>Date of:</p></td>
<td><p>2014</p></td>
</tr>
</table>
<p>Copyright &copy; 2014 Marek Matejak</p>
</html>",   info="<html>
<p>Subsystem initial and terminal data manipulations using busConnector (Physiomodel expandable connector).</p>
<h4>Be surre, that the directory &QUOT;io&QUOT; is in working directory (File-&GT;Change Directory...)!</h4>
<p>Implementation:</p>
<p>Model should be divided into subsystems, which has <b>output</b> variables grouped to busConnector (variables, which are inputs to other subsystems). For each subsystem S: <b>all</b> these variables should be defined in <b>extended redeclared</b> class S.IO_Bus.Variables, where package S.IO_Bus is <b>extended</b> from Physiolibrary.Types.IO_Bus. </p>
<p>Usage:</p>
<p>For loading values in SI units of these variables from file &QUOT;io/input_SI.txt&QUOT; use block S.IO_Bus.InputFromFile_SI.</p>
<p>For loading values in non-SI units of these variables from file &QUOT;io/input.txt&QUOT; use block S.IO_Bus.InputFromFile.</p>
<p>For storing values in SI units of these variables from file &QUOT;io/output_SI.txt&QUOT; use block S.IO_Bus.OutputToFile_SI.</p>
<p>For storing values in non-SI units of these variables from file &QUOT;io/output.txt&QUOT; use block S.IO_Bus.OutputToFile.</p>
<p>For comparison values in SI units of these variables with file &QUOT;io/input_SI.txt&QUOT; use block S.IO_Bus.OutputComparison_SI and result will be stored as &QUOT;io/comparison_SI.txt&QUOT;.</p>
<p>For comparison values in non-SI units of these variables with file &QUOT;io/input.txt&QUOT; use block S.IO_Bus.OutputComparison and result will be stored as &QUOT;io/comparison.txt&QUOT;.</p>
</html>"));
  end IO_Bus;

  expandable connector TorsoBusConnector
    "Upper, Middle or Lower Torso properties"

    annotation (
      Icon(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}},
          grid={2,2},
          initialScale=0.2), graphics={
          Rectangle(
            extent={{-20,2},{20,-2}},
            lineColor={129,194,194},
            lineThickness=1),
          Polygon(
            points={{-80,50},{80,50},{100,30},{80,-40},{60,-50},{-60,-50},{-80,
                -40},{-100,30},{-80,50}},
            lineColor={0,0,0},
            fillColor={115,172,172},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-65,25},{-55,15}},
            lineColor={0,0,0},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-5,25},{5,15}},
            lineColor={0,0,0},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{55,25},{65,15}},
            lineColor={0,0,0},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-35,-15},{-25,-25}},
            lineColor={0,0,0},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{25,-15},{35,-25}},
            lineColor={0,0,0},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}},
          grid={2,2},
          initialScale=0.2), graphics={
          Polygon(
            points={{-40,25},{40,25},{50,15},{40,-20},{30,-25},{-30,-25},{-40,
                -20},{-50,15},{-40,25}},
            lineColor={0,0,0},
            fillColor={170,255,255},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-32.5,7.5},{-27.5,12.5}},
            lineColor={0,0,0},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-2.5,12.5},{2.5,7.5}},
            lineColor={0,0,0},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{27.5,12.5},{32.5,7.5}},
            lineColor={0,0,0},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-17.5,-7.5},{-12.5,-12.5}},
            lineColor={0,0,0},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{12.5,-7.5},{17.5,-12.5}},
            lineColor={0,0,0},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-150,70},{150,40}},
            lineColor={0,0,0},
            textString="%name")}),
      Documentation(info="<html>
<p>
This icon is designed for a <b>signal bus</b> connector.
</p>
</html>"));

  end TorsoBusConnector;

  expandable connector TissueBusConnector "Tissue properties"

    annotation (
      Icon(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}},
          grid={2,2},
          initialScale=0.2), graphics={
          Rectangle(
            extent={{-20,2},{20,-2}},
            lineColor={127,0,0},
            lineThickness=0.5),
          Polygon(
            points={{-80,50},{80,50},{100,30},{80,-40},{60,-50},{-60,-50},{-80,
                -40},{-100,30},{-80,50}},
            lineColor={0,0,0},
            fillColor={127,0,0},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-65,25},{-55,15}},
            lineColor={0,0,0},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-5,25},{5,15}},
            lineColor={0,0,0},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{55,25},{65,15}},
            lineColor={0,0,0},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-35,-15},{-25,-25}},
            lineColor={0,0,0},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{25,-15},{35,-25}},
            lineColor={0,0,0},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}},
          grid={2,2},
          initialScale=0.2), graphics={
          Polygon(
            points={{-40,25},{40,25},{50,15},{40,-20},{30,-25},{-30,-25},{-40,
                -20},{-50,15},{-40,25}},
            lineColor={0,0,0},
            fillColor={127,0,0},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-32.5,7.5},{-27.5,12.5}},
            lineColor={0,0,0},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-2.5,12.5},{2.5,7.5}},
            lineColor={0,0,0},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{27.5,12.5},{32.5,7.5}},
            lineColor={0,0,0},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-17.5,-7.5},{-12.5,-12.5}},
            lineColor={0,0,0},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{12.5,-7.5},{17.5,-12.5}},
            lineColor={0,0,0},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-150,70},{150,40}},
            lineColor={0,0,0},
            textString="%name")}),
      Documentation(info="<html>
<p>
This icon is designed for a <b>signal bus</b> connector.
</p>
</html>"));

  end TissueBusConnector;

  type Energy = Modelica.SIunits.Energy(displayUnit="kcal", nominal=4186.8);
  type Time = Modelica.SIunits.Time(displayUnit="min", nominal=60);
  type Frequency = Modelica.SIunits.Frequency(displayUnit="1/min");

  type Mass = Modelica.SIunits.Mass(displayUnit="g", nominal=1e-3, min=0);
  type MassFlowRate = Modelica.SIunits.MassFlowRate(displayUnit="mg/min", nominal=(1e-6)/60);
  type Density = Modelica.SIunits.Density(displayUnit="kg/l", nominal=1e3);
  type MolarMass = Modelica.SIunits.MolarMass(displayUnit="kDa", nominal=1);

  type Height = Modelica.SIunits.Height(displayUnit="cm", nominal=1e-2);
  type Position = Modelica.SIunits.Position(displayUnit="cm", nominal=1e-2);
  type Velocity = Modelica.SIunits.Velocity(displayUnit="km/h", nominal=1);
  type Acceleration = Modelica.SIunits.Acceleration(displayUnit="m/s2", nominal=1);

  type Pressure =  Modelica.SIunits.Pressure(displayUnit="mmHg", nominal=133.322387415);
  type Volume =  Modelica.SIunits.Volume(displayUnit="ml", nominal=1e-6, min=0);
  type VolumeFlowRate = Modelica.SIunits.VolumeFlowRate(displayUnit="ml/min", nominal=(1e-6)/60);

  replaceable type Concentration = Modelica.SIunits.Concentration (displayUnit="mmol/l", min=0) constrainedby Real;
  replaceable type AmountOfSubstance = Modelica.SIunits.AmountOfSubstance (displayUnit="mmol", min=0) constrainedby Real;
  replaceable type MolarFlowRate = Modelica.SIunits.MolarFlowRate(displayUnit="mmol/min") constrainedby Real;
  replaceable type MolarEnergy = Modelica.SIunits.MolarEnergy(displayUnit="kcal/mol", nominal=4186.8) constrainedby Real
    "chemical internal energy, chemical enthalpy, Gibb's energy ..";
  type MassConcentration =
                 Modelica.SIunits.MassConcentration(displayUnit="mg/l", nominal=1e-3, min=0);

  type Osmolarity = Modelica.SIunits.Concentration (displayUnit="mosm/l", nominal=1);

  type Heat = Modelica.SIunits.Heat(displayUnit="kcal", nominal=4186800); //needed to heat 1 liter of water by 1 degC
  type Temperature = Modelica.SIunits.Temperature(displayUnit="degC", nominal=1, min=0);
  type HeatFlowRate = Modelica.SIunits.HeatFlowRate(displayUnit="kcal/min", nominal=4186.8/60);
  type Power = Modelica.SIunits.Power(displayUnit="kcal/min", nominal=4186.8/60);
  type PowerPerMass = Real(final quantity="Power per Mass",final unit="W/kg",displayUnit="cal/(g.min)", nominal=4.1868/(0.001*60));
  type ThermalConductance = Modelica.SIunits.ThermalConductance(displayUnit="kcal/(min.K)", nominal=4186.8/60);
  type SpecificHeatCapacity = Modelica.SIunits.SpecificHeatCapacity(displayUnit="kcal/(kg.K)", nominal=4186.8);
  type SpecificEnergy = Modelica.SIunits.SpecificEnergy(displayUnit="kcal/kg", nominal=4186.8)
    "vaporization, ..";

  type ElectricPotential = Modelica.SIunits.ElectricPotential(displayUnit="mV", nominal=1e-3);
  type ElectricCharge = Modelica.SIunits.ElectricCharge(displayUnit="meq", nominal=(9.64853399*10^4)/1000);
  type VolumeDensityOfCharge =
                        Modelica.SIunits.VolumeDensityOfCharge(displayUnit="meq/l", nominal=(9.64853399*10^4));
  type ElectricCurrent = Modelica.SIunits.ElectricCurrent(displayUnit="meq/min", nominal=(9.64853399*10^4/1000)/60);

//unknown units in Standard Modelica Library 3.2
  type Fraction = Real(final quantity="Fraction",final unit="1", displayUnit="%", nominal=1e-2);

  type pH =       Real(final quantity="pH",final unit="1",final displayUnit="1", nominal=7, min=0, max=14);
  type OsmoticPermeability = Real(final quantity="OsmoticPermeability",final unit="m3/(Pa.s)", displayUnit="ml/(mmHg.min)", nominal=(1e-6)/((133.322387415)*60), min=0);
  type DiffusionPermeability = Real(final quantity="DiffusionPermeability", final unit="m3/s", displayUnit="ml/min", nominal=(1e-6)/60, min=0);

  type HydraulicConductance = Real(final quantity="HydraulicConductance",final unit="m3/(Pa.s)", displayUnit="ml/(mmHg.min)", nominal=(1e-6)/((133.322387415)*60), min=0);
  type HydraulicResistance = Real(final quantity="HydraulicConductance",final unit="(Pa.s)/m3", displayUnit="(mmHg.min)/ml", nominal=(1e+6)*(133.322387415)*60, min=0);

  type HydraulicCompliance =  Real(final quantity="HydraulicCompliance",final unit="m3/Pa", displayUnit="ml/mmHg", nominal=(1e-6)/(133.322387415));
  type HydraulicElastance = Real(final quantity="HydraulicElastance",final unit="Pa/m3", displayUnit="mmHg/ml", nominal=(133.322387415)/(1e-6));

  type HydraulicInertance =  Real(final quantity="HydraulicInertance",final unit="Pa.s2/m3", displayUnit="mmHg.min2/ml", nominal=((133.322387415)*(60^2)/(1e-6)));

  type GasSolubility = Real(final quantity="GasSolubility", final unit="(mol/m3)/(mol/m3)", displayUnit="(mmol/l)/kPa at 25degC", nominal=1e-2, min=0)
    "Gas solubility in liquid";

  type StoichiometricNumber = Modelica.SIunits.StoichiometricNumber; // Integer(final quantity="StoichiometricNumber", min=1);

  type Population = Real (final quantity="Population", final unit="1", displayUnit="1", min=0)
    "Average number of population individuals";
  type PopulationChange = Real (final quantity="PopulationChange", final unit="1/s", displayUnit="1/d")
    "Average change of population individuals";
  type PopulationChangePerMember = Real (final quantity="PopulationChangePerMember", final unit="1/s", displayUnit="1/d")
    "Average change per population individual";

  partial block AbstractReal
    "Abstract parameter or the value at defined time (final) of the model - can be input or output parameter"

    replaceable type T=Real
     constrainedby Real "Real type with units"
     annotation (Dialog(group="Simple type",tab="Types"));

    parameter String varName=
    "Stored name"
    annotation (Dialog(group="Value I/O",tab="IO"));
                             //getInstanceName()
    parameter String storeUnit="" "Stored units"
    annotation (Dialog(group="Value I/O",tab="IO"));

    parameter T k(fixed=true) = 0 "Value"
      annotation (Evaluate=true, HideResult=true, Dialog(group="Parameters"));

    parameter Utilities.UnitConversions.RealTypeRecord[:] unitConversions = Utilities.UnitConversions.RealTypeDef
      "Unit conversions"  annotation(Evaluate=true, HideResult=true);
  end AbstractReal;

  package RealTypeInputParameters
    extends Modelica.Icons.SourcesPackage;

    replaceable package Utilities = Types.FilesUtilities constrainedby
      Types.Utilities
                   annotation (Dialog(group="Functions to read or store",tab="Types"));
     block Base
       parameter String varName=
       "Stored name"
       annotation (Dialog(group="Value I/O",tab="IO"));
                                //getInstanceName()
       parameter String storeUnit="" "Stored units"
       annotation (Dialog(group="Value I/O",tab="IO"));
       annotation (Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
          coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
              graphics={
          Text(         extent={{-44,6},{36,-14}},
            lineColor={0,0,0},
                fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                    textString=""),   Rectangle(
           extent={{-40,12},{40,-14}},
           lineColor={0,0,255},
           fillPattern=FillPattern.Solid,
           fillColor={170,255,170}), Text(
           extent={{-40,-8},{40,6}},
           lineColor={0,0,0},
           fillColor={255,255,255},
           fillPattern=FillPattern.Solid,
              textString="%varName")}));
     end Base;

  block Velocity "Constant signal of type Velocity"

    extends Base(storeUnit="m/s");
   parameter Types.Velocity k=Utilities.readReal(varName, storeUnit)
        "Constant Velocity output value";
        RealIO.VelocityOutput y "Velocity input parameter"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
            iconTransformation(extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="velocity");
  end Velocity;

  block Acceleration "Constant signal of type Acceleration"

    extends Base(storeUnit="m/s2");
   parameter Types.Acceleration k=Utilities.readReal(varName, storeUnit)
        "Constant Acceleration output value";
        RealIO.AccelerationOutput y "Acceleration input parameter"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
            iconTransformation(extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="acceleration");
  end Acceleration;

  block AmountOfSubstance "Constant signal of type AmountOfSubstance"

    extends Base(storeUnit="mmol");
   parameter Types.AmountOfSubstance k=Utilities.readReal(varName, storeUnit)
        "Constant AmountOfSubstance output value";
        RealIO.AmountOfSubstanceOutput y "AmountOfSubstance input parameter"
                                            annotation (Placement(transformation(
              extent={{40,-10},{60,10}}), iconTransformation(extent={{40,-10},{60,
                10}})));
  equation
        y=k;
    annotation (defaultComponentName="amountOfSubstance");
  end AmountOfSubstance;

  block Concentration "Constant signal of type Concentration"

    extends Base(storeUnit="mmol/l");
   parameter Types.Concentration k=Utilities.readReal(varName, storeUnit)
        "Constant Concentration output value";
        RealIO.ConcentrationOutput y "Concentration input parameter"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
            iconTransformation(extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="concentration");
  end Concentration;

  block MassConcentration "Constant signal of type MassConcentration"

    extends Base(storeUnit="mmol/l");
   parameter Types.MassConcentration k=Utilities.readReal(varName, storeUnit)
        "Constant Concentration output value";
        RealIO.MassConcentrationOutput y "Concentration input parameter"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
            iconTransformation(extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="concentration");
  end MassConcentration;

  block Density "Constant signal of type Density"

    extends Base(storeUnit="kg/l");
   parameter Types.Density k=Utilities.readReal(varName, storeUnit)
        "Constant Density output value";
        RealIO.DensityOutput y "Density input parameter" annotation (
          Placement(transformation(extent={{40,-10},{60,10}}), iconTransformation(
              extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="density");
  end Density;

  block DiffusionPermeability "Constant signal of type DiffusionPermeability"

    extends Base(storeUnit="ml/min");
   parameter Types.DiffusionPermeability k=Utilities.readReal(varName,
          storeUnit) "Constant DiffusionPermeability output value";
        RealIO.DiffusionPermeabilityOutput y
        "DiffusionPermeability input parameter" annotation (Placement(
            transformation(extent={{40,-10},{60,10}}), iconTransformation(extent={
                {40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="diffusionPermeability");
  end DiffusionPermeability;

  block ElectricCharge "Constant signal of type ElectricCharge"

    extends Base(storeUnit="meq");
   parameter Types.ElectricCharge k=Utilities.readReal(varName, storeUnit)
        "Constant ElectricCharge output value";
        RealIO.ElectricChargeOutput y "ElectricCharge input parameter"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
            iconTransformation(extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="electricCharge");
  end ElectricCharge;

  block ElectricCurrent "Constant signal of type ElectricCurrent"

    extends Base(storeUnit="meq/min");
   parameter Types.ElectricCurrent k=Utilities.readReal(varName, storeUnit)
        "Constant ElectricCurrent output value";
        RealIO.ElectricCurrentOutput y "ElectricCurrent input parameter"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
            iconTransformation(extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="electricCurrent");
  end ElectricCurrent;

  block ElectricPotential "Constant signal of type ElectricPotential"

    extends Base(storeUnit="mV");
   parameter Types.ElectricPotential k=Utilities.readReal(varName, storeUnit)
        "Constant ElectricPotential output value";
        RealIO.ElectricPotentialOutput y "ElectricPotential input parameter"
                                            annotation (Placement(transformation(
              extent={{40,-10},{60,10}}), iconTransformation(extent={{40,-10},{60,
                10}})));
  equation
        y=k;
    annotation (defaultComponentName="electricPotential");
  end ElectricPotential;

    block Energy "Constant signal of type Energy"

      extends Base(storeUnit="kcal");
      parameter Types.Energy k=Utilities.readReal(varName, storeUnit)
        "Constant Energy output value";
        RealIO.EnergyOutput y "Energy input parameter" annotation (
          Placement(transformation(extent={{40,-10},{60,10}}), iconTransformation(
              extent={{40,-10},{60,10}})));
    equation
        y=k;
    annotation (defaultComponentName="energy");
    end Energy;

  block Fraction "Constant signal of type Fraction"

    extends Base(storeUnit="1");
   parameter Types.Fraction k=Utilities.readReal(varName, storeUnit)
        "Constant Fraction output value";
        RealIO.FractionOutput y "Fraction input parameter" annotation (
          Placement(transformation(extent={{40,-10},{60,10}}), iconTransformation(
              extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="fraction");
  end Fraction;

  block Frequency "Constant signal of type Frequency"

    extends Base(storeUnit="1/min");
   parameter Types.Frequency k=Utilities.readReal(varName, storeUnit)
        "Constant Frequency output value";
        RealIO.FrequencyOutput y "Frequency input parameter" annotation (
          Placement(transformation(extent={{40,-10},{60,10}}), iconTransformation(
              extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="frequency");
  end Frequency;

  block GasSolubility "Constant signal of type GasSolubility"

    extends Base(storeUnit="(mmol/l)/kPa at 25degC");
   parameter Types.GasSolubility k=Utilities.readReal(varName, storeUnit)
        "Constant GasSolubility output value";
        RealIO.GasSolubilityOutput y "GasSolubility input parameter"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
            iconTransformation(extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="gasSolubility");
  end GasSolubility;

  block Heat "Constant signal of type Heat"

     extends Base(storeUnit="kcal");
   parameter Types.Heat k=Utilities.readReal(varName, storeUnit)
        "Constant Heat output value";
        RealIO.HeatOutput y "Heat input parameter" annotation (Placement(
            transformation(extent={{40,-10},{60,10}}), iconTransformation(extent={
                {40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="heat");
  end Heat;

  block Height "Constant signal of type Height"

    extends Base(storeUnit="cm");
   parameter Types.Height k=Utilities.readReal(varName, storeUnit)
        "Constant Height output value";
        RealIO.HeightOutput y "Height input parameter" annotation (
          Placement(transformation(extent={{40,-10},{60,10}}), iconTransformation(
              extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="height");
  end Height;

  block HeatFlowRate "Constant signal of type HeatFlowRate"

    extends Base(storeUnit="kcal/min");
   parameter Types.HeatFlowRate k=Utilities.readReal(varName, storeUnit)
        "Constant HeatFlowRate output value";
        RealIO.HeatFlowRateOutput y "HeatFlowRate input parameter"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
            iconTransformation(extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="heatFlowRate");
  end HeatFlowRate;

  block HydraulicCompliance "Constant signal of type HydraulicCompliance"

    extends Base(storeUnit="ml/mmHg");
   parameter Types.HydraulicCompliance k=Utilities.readReal(varName, storeUnit)
        "Constant HydraulicCompliance output value";
        RealIO.HydraulicComplianceOutput y
        "HydraulicCompliance input parameter" annotation (Placement(
            transformation(extent={{40,-10},{60,10}}), iconTransformation(extent={
                {40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="hydraulicCompliance");
  end HydraulicCompliance;

  block HydraulicConductance "Constant signal of type HydraulicConductance"

    extends Base(storeUnit="ml/(mmHg.min)");
   parameter Types.HydraulicConductance k=Utilities.readReal(varName,
          storeUnit) "Constant HydraulicConductance output value";
        RealIO.HydraulicConductanceOutput y
        "HydraulicConductance input parameter" annotation (Placement(
            transformation(extent={{40,-10},{60,10}}), iconTransformation(extent={
                {40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="hydraulicConductance");
  end HydraulicConductance;

  block HydraulicInertance "Constant signal of type HydraulicInertance"

    extends Base(storeUnit="mmHg.min2/ml");
   parameter Types.HydraulicInertance k=Utilities.readReal(varName, storeUnit)
        "Constant HydraulicInertance output value";
        RealIO.HydraulicInertanceOutput y "HydraulicInertance input parameter"
                                             annotation (Placement(transformation(
              extent={{40,-10},{60,10}}), iconTransformation(extent={{40,-10},{60,
                10}})));
  equation
        y=k;
    annotation (defaultComponentName="hydraulicInertance");
  end HydraulicInertance;

  block Mass "Constant signal of type Mass"

    extends Base(storeUnit="g");
   parameter Types.Mass k=Utilities.readReal(varName, storeUnit)
        "Constant Mass output value";
        RealIO.MassOutput y "Mass input parameter" annotation (Placement(
            transformation(extent={{40,-10},{60,10}}), iconTransformation(extent={
                {40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="mass");
  end Mass;

  block MassFlowRate "Constant signal of type MassFlowRate"

    extends Base(storeUnit="g/min");
   parameter Types.MassFlowRate k=Utilities.readReal(varName, storeUnit)
        "Constant MassFlowRate output value";
        RealIO.MassFlowRateOutput y "MassFlowRate input parameter"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
            iconTransformation(extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="massFlowRate");
  end MassFlowRate;

  block MolarFlowRate "Constant signal of type MolarFlowRate"

    extends Base(storeUnit="mmol/min");
   parameter Types.MolarFlowRate k=Utilities.readReal(varName, storeUnit)
        "Constant MolarFlowRate output value";
        RealIO.MolarFlowRateOutput y "MolarFlowRate input parameter"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
            iconTransformation(extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="molarFlowRate");
  end MolarFlowRate;

  block Osmolarity "Constant signal of type Osmolarity"

    extends Base(storeUnit="mosm/l");
   parameter Types.Osmolarity k=Utilities.readReal(varName, storeUnit)
        "Constant Osmolarity output value";
        RealIO.OsmolarityOutput y "Osmolarity input parameter" annotation (
         Placement(transformation(extent={{40,-10},{60,10}}), iconTransformation(
              extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="osmolarity");
  end Osmolarity;

  block OsmoticPermeability "Constant signal of type OsmoticPermeability"

    extends Base(storeUnit="ml/(mmHg.min)");
   parameter Types.OsmoticPermeability k=Utilities.readReal(varName, storeUnit)
        "Constant OsmoticPermeability output value";
        RealIO.OsmoticPermeabilityOutput y
        "OsmoticPermeability input parameter" annotation (Placement(
            transformation(extent={{40,-10},{60,10}}), iconTransformation(extent={
                {40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="osmoticPermeability");
  end OsmoticPermeability;

  block Pressure "Constant signal of type Pressure"

    extends Base(storeUnit="mmHg");
   parameter Types.Pressure k=Utilities.readReal(varName, storeUnit)
        "Constant Pressure output value";
        RealIO.PressureOutput y "Pressure input parameter" annotation (
          Placement(transformation(extent={{40,-10},{60,10}}), iconTransformation(
              extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="pressure");
  end Pressure;

  block SpecificEnergy "Constant signal of type SpecificEnergy"

    extends Base(storeUnit="kcal/kg");
   parameter Types.SpecificEnergy k=Utilities.readReal(varName, storeUnit)
        "Constant SpecificEnergy output value";
        RealIO.SpecificEnergyOutput y "SpecificEnergy input parameter"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
            iconTransformation(extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="specificEnergy");
  end SpecificEnergy;

  block SpecificHeatCapacity "Constant signal of type SpecificHeatCapacity"

    extends Base(storeUnit="kcal/(kg.K)");
   parameter Types.SpecificHeatCapacity k=Utilities.readReal(varName,
          storeUnit) "Constant SpecificHeatCapacity output value";
        RealIO.SpecificHeatCapacityOutput y
        "SpecificHeatCapacity input parameter" annotation (Placement(
            transformation(extent={{40,-10},{60,10}}), iconTransformation(extent={
                {40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="specificHeatCapacity");
  end SpecificHeatCapacity;

  block Temperature "Constant signal of type Temperature"

    extends Base(storeUnit="degC");
   parameter Types.Temperature k=Utilities.readReal(varName, storeUnit)
        "Constant Temperature output value";
        RealIO.TemperatureOutput y "Temperature input parameter"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
            iconTransformation(extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="temperature");
  end Temperature;

  block ThermalConductance "Constant signal of type ThermalConductance"

    extends Base(storeUnit="kcal/(min.K)");
   parameter Types.ThermalConductance k=Utilities.readReal(varName, storeUnit)
        "Constant ThermalConductance output value";
        RealIO.ThermalConductanceOutput y "ThermalConductance input parameter"
                                             annotation (Placement(transformation(
              extent={{40,-10},{60,10}}), iconTransformation(extent={{40,-10},{60,
                10}})));
  equation
        y=k;
    annotation (defaultComponentName="thermalConductance");
  end ThermalConductance;

  block Time "Constant signal of type Time"

    extends Base(storeUnit="min");
   parameter Types.Time k=Utilities.readReal(varName, storeUnit)
        "Constant Time output value";
        RealIO.TimeOutput y "Time input parameter" annotation (Placement(
            transformation(extent={{40,-10},{60,10}}), iconTransformation(extent={
                {40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="time");
  end Time;

  block VolumeFlowRate "Constant signal of type VolumeFlowRate"

    extends Base(storeUnit="ml/min");
   parameter Types.VolumeFlowRate k=Utilities.readReal(varName, storeUnit)
        "Constant VolumeFlowRate output value";
        RealIO.VolumeFlowRateOutput y "VolumeFlowRate input parameter"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
            iconTransformation(extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="volumeFlowRate");
  end VolumeFlowRate;

  block Volume "Constant signal of type Volume"

    extends Base(storeUnit="ml");
   parameter Types.Volume k=Utilities.readReal(varName, storeUnit)
        "Constant Volume output value";
        RealIO.VolumeOutput y "Volume input parameter" annotation (
          Placement(transformation(extent={{40,-10},{60,10}}), iconTransformation(
              extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="volume");
  end Volume;

  block pH "Constant signal of type pH"

    extends Base(storeUnit="1");
   parameter Types.pH k=Utilities.readReal(varName, storeUnit)
        "Constant pH output value";
        RealIO.pHOutput y "pH input parameter" annotation (Placement(
            transformation(extent={{40,-10},{60,10}}), iconTransformation(extent={
                {40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="pH");
  end pH;

  block VolumeDensityOfCharge "Constant signal of type VolumeDensityOfCharge"

    extends Base(storeUnit="meq/l");
   parameter Types.VolumeDensityOfCharge k=Utilities.readReal(varName,
          storeUnit) "Constant VolumeDensityOfCharge output value";
        RealIO.VolumeDensityOfChargeOutput y
        "VolumeDensityOfCharge input parameter" annotation (Placement(
            transformation(extent={{40,-10},{60,10}}), iconTransformation(extent={
                {40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="volumeDensityOfCharge");
  end VolumeDensityOfCharge;

  block Power "Constant signal of type Power"

    extends Base(storeUnit="kcal/min");
   parameter Types.Power k=Utilities.readReal(varName, storeUnit)
        "Constant Power output value";
        RealIO.PowerOutput y "Power input parameter"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
            iconTransformation(extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="heatFlowRate");
  end Power;

  block Position "Constant signal of type Position"

    extends Base(storeUnit="cm");
   parameter Types.Position k=Utilities.readReal(varName, storeUnit)
        "Constant Position output value";
        RealIO.PositionOutput y "Position input parameter" annotation (
          Placement(transformation(extent={{40,-10},{60,10}}), iconTransformation(
              extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="height");
  end Position;

    block MolarEnergy "Constant signal of type MolarEnergy"

      extends Base(storeUnit="kcal/mol");
      parameter Types.MolarEnergy k=Utilities.readReal(varName, storeUnit)
        "Constant MolarEnergy output value";
        RealIO.MolarEnergyOutput y "MolarEnergy input parameter" annotation (
          Placement(transformation(extent={{40,-10},{60,10}}), iconTransformation(
              extent={{40,-10},{60,10}})));
    equation
        y=k;
    annotation (defaultComponentName="molarEnergy");
    end MolarEnergy;

    block Population "Constant signal of type Population"

      extends Base(storeUnit="1");
      parameter Types.Population k=Utilities.readReal(varName, storeUnit)
        "Constant Population output value";
        RealIO.PopulationOutput y "Population input parameter" annotation (
          Placement(transformation(extent={{40,-10},{60,10}}), iconTransformation(
              extent={{40,-10},{60,10}})));
    equation
        y=k;
    annotation (defaultComponentName="population");
    end Population;

    block PopulationChange "Constant signal of type PopulationChange"

      extends Base(storeUnit="1/d");
      parameter Types.PopulationChange k=Utilities.readReal(varName, storeUnit)
        "Constant PopulationChange output value";
        RealIO.PopulationChangeOutput y "PopulationChange input parameter" annotation (
          Placement(transformation(extent={{40,-10},{60,10}}), iconTransformation(
              extent={{40,-10},{60,10}})));
    equation
        y=k;
    annotation (defaultComponentName="populationChange");
    end PopulationChange;

    block PopulationChangePerMember
      "Constant signal of type PopulationChangePerMember"
      extends Base(storeUnit="1/d");
      parameter Types.PopulationChangePerMember k=Utilities.readReal(varName, storeUnit)
        "Constant PopulationChangePerMember output value";
        RealIO.PopulationChangePerMemberOutput y
        "PopulationChangePerMember input parameter"                                 annotation (
          Placement(transformation(extent={{40,-10},{60,10}}), iconTransformation(
              extent={{40,-10},{60,10}})));
    equation
        y=k;
    annotation (defaultComponentName="populationChangePerMember");
    end PopulationChangePerMember;
  end RealTypeInputParameters;

  package RealExtension
    extends Modelica.Icons.VariantsPackage;
        block Parameter "Generate constant signal in SI units from file"
          extends AbstractReal;

          replaceable package IO = Types.RealExtension.IO (
            redeclare type Type = T) "Real type with units"
             annotation (Dialog(group="Packages",tab="Types"));

          IO.Output y "Connector of Real output signal"
            annotation (Placement(transformation(extent={{100,-10},{120,10}})));

        equation
          y = k;
          annotation (
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Rectangle(
              extent={{-100,20},{100,-20}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}), Text(
              extent={{-100,-10},{100,10}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%varName")}),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
        end Parameter;

        block InputParameter "Generate constant signal from file"
          extends AbstractReal(                   k = Utilities.readReal( varName, storeUnit, unitConversions));

          replaceable package IO = Types.RealExtension.IO (
            redeclare type Type = T)
                         annotation (Dialog(group="Real type with units",tab="Types"));
          replaceable package Utilities = Types.FilesUtilities(inputFileName="input.txt")
            constrainedby Types.Utilities
                         annotation (Dialog(group="Functions to read or store",tab="Types"));

          IO.Output y "Connector of Real output signal"
            annotation (Placement(transformation(extent={{100,-10},{120,10}})));

        equation
        /*  when initial() then
    Modelica.Utilities.Streams.print(" ii " + varName + " = " + String(y) + " SI , store as " + storeUnit);
  end when;
  when terminal() then
    Modelica.Utilities.Streams.print(" it " + varName + " = " + String(y) + " SI , store as " + storeUnit);
  end when;
*/
          y = k;
          annotation (
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Rectangle(
              extent={{-100,20},{100,-20}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}), Text(
              extent={{-100,-10},{100,10}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%varName")}),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
        end InputParameter;

        block InputParameter_SI
      "Generate constant signal in SI units from file"
          extends AbstractReal(                   k = Utilities.readReal_SI( varName));

          replaceable package IO = Types.RealExtension.IO (
            redeclare type Type = T)
                         annotation (Dialog(group="Real type with units",tab="Types"));
          replaceable package Utilities = Types.FilesUtilities(inputSIFileName="input_SI.txt")
            constrainedby Types.Utilities
                         annotation (Dialog(group="Functions to read or store",tab="Types"));

          IO.Output y "Connector of Real output signal"
            annotation (Placement(transformation(extent={{100,-10},{120,10}})));

        equation
          y = k;
          annotation (
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Rectangle(
              extent={{-100,20},{100,-20}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}), Text(
              extent={{-100,-10},{100,10}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%varName")}),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
        end InputParameter_SI;

        block OutputFinal "Save variable to Output"
        //  import Physiolibrary;
          extends Types.AbstractReal;
          replaceable package IO = Types.RealExtension.IO (
                                            redeclare type Type=T);
          replaceable package Utilities = Types.FilesUtilities(outputFileName="outputFinal.txt")
                                                         constrainedby
        Types.Utilities;
          IO.Input              y "Connector of Real input signal"
            annotation (Placement(transformation(extent={{-100,-10},{-80,10}}), iconTransformation(extent={{-120,-10},{-100,10}})));

        equation
          when terminal() then
            //Modelica.Utilities.Streams.print(" < " + varName + " = " + String(y) + " SI , store as " + storeUnit);
            Utilities.writeReal(
              varName,
              y,
              storeUnit,
              unitConversions);
          end when;
          annotation (
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.04), graphics={Rectangle(
              extent={{-100,20},{100,-20}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}), Text(
              extent={{-100,-10},{100,10}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%varName")}),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
        end OutputFinal;

        block OutputFinal_SI "Save variable to Output"
        //  import Physiolibrary;
          extends Types.AbstractReal;
          replaceable package IO = Types.RealExtension.IO (
                                            redeclare type Type=T);
          replaceable package Utilities = Types.FilesUtilities(outputSIFileName="outputFinal_SI.txt")
                                                         constrainedby
        Types.Utilities;
          IO.Input              y "Connector of Real input signal"
            annotation (Placement(transformation(extent={{-100,-10},{-80,10}}), iconTransformation(extent={{-120,-10},{-100,10}})));

        equation
          when terminal() then
            Utilities.writeReal_SI(
              varName,
              y);
          end when;
          annotation (
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.04), graphics={Rectangle(
              extent={{-100,20},{100,-20}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}), Text(
              extent={{-100,-10},{100,10}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%varName")}),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
        end OutputFinal_SI;

        block OutputInitial "Save variable to Output"
        //  import Physiolibrary;
          extends Types.AbstractReal;
          replaceable package IO = Types.RealExtension.IO (
                                            redeclare type Type=T);
          replaceable package Utilities = Types.FilesUtilities(outputFileName="outputInitial.txt")
                                                         constrainedby
        Types.Utilities;
          IO.Input              y "Connector of Real input signal"
            annotation (Placement(transformation(extent={{-100,-10},{-80,10}}), iconTransformation(extent={{-120,-10},{-100,10}})));

        equation
          when initial() then
            //Modelica.Utilities.Streams.print(" < " + varName + " = " + String(y) + " SI , store as " + storeUnit);
            Utilities.writeReal(
              varName,
              y,
              storeUnit,
              unitConversions);
          end when;
          annotation (
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.04), graphics={Rectangle(
              extent={{-100,20},{100,-20}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}), Text(
              extent={{-100,-10},{100,10}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%varName")}),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
        end OutputInitial;

        block OutputInitial_SI "Save variable to Output"
         // import Physiolibrary;
          extends Types.AbstractReal;
          replaceable package IO = Types.RealExtension.IO (
                                            redeclare type Type=T);
          replaceable package Utilities = Types.FilesUtilities(outputSIFileName="outputInitial_SI.txt")
                                                         constrainedby
        Types.Utilities;
          IO.Input              y "Connector of Real input signal"
            annotation (Placement(transformation(extent={{-100,-10},{-80,10}}), iconTransformation(extent={{-120,-10},{-100,10}})));

        equation
          when initial() then
            Utilities.writeReal_SI(
              varName,
              y);
          end when;
          annotation (
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.04), graphics={Rectangle(
              extent={{-100,20},{100,-20}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}), Text(
              extent={{-100,-10},{100,10}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%varName")}),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
        end OutputInitial_SI;

        block OutputComparison "Save variable comparison to file"
        //  import Physiolibrary;
          extends Types.AbstractReal(             k=Utilities.readReal(varName,storeUnit,unitConversions));
          replaceable package IO = Types.RealExtension.IO (
                                            redeclare type Type=T);
          replaceable package Utilities = Types.FilesUtilities(comparisonFileName="comparison.txt")
                                                         constrainedby
        Types.Utilities
           annotation (Dialog(group="Functions to read or store",tab="Types"));

          Modelica.Blocks.Interfaces.RealInput
                                y "Connector of Real input signal"
            annotation (Placement(transformation(extent={{-100,-10},{-80,10}}), iconTransformation(extent={{-120,-10},{-100,10}})));

    protected
          parameter T initialValue(fixed=false);
        initial equation
          initialValue = y;
        equation
          when terminal() then
           Utilities.writeComparison(
            varName,
            k,
            initialValue,
            y,
            storeUnit,
            unitConversions);
          end when;

            annotation (
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.04), graphics={Rectangle(
              extent={{-100,20},{100,-20}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}), Text(
              extent={{-100,-10},{100,10}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%varName")}),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
        end OutputComparison;

        block OutputComparison_SI
      "Save variable comparison to file using SI units during input and output"
        //  import Physiolibrary;
          extends Types.AbstractReal(             k=Utilities.readReal_SI(varName));
          replaceable package IO = Types.RealExtension.IO (
                                            redeclare type Type=T);
          replaceable package Utilities = Types.FilesUtilities(comparisonSIFileName="comparison_SI.txt")
                                                         constrainedby
        Types.Utilities
           annotation (Dialog(group="Functions to read or store",tab="Types"));

          Modelica.Blocks.Interfaces.RealInput
                                y "Connector of Real input signal"
            annotation (Placement(transformation(extent={{-100,-10},{-80,10}}), iconTransformation(extent={{-120,-10},{-100,10}})));

    protected
          parameter T initialValue(fixed=false);
        initial equation
          initialValue = y;
        equation
          when terminal() then
           Utilities.writeComparison_SI(
            varName,
            k,
            initialValue,
            y);
          end when;

            annotation (
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.04), graphics={Rectangle(
              extent={{-100,20},{100,-20}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}), Text(
              extent={{-100,-10},{100,10}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%varName")}),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
        end OutputComparison_SI;

        block OutputInitialComparison "Save variable comparison to file"
        //  import Physiolibrary;
          extends Types.AbstractReal(             k=Utilities.readReal(varName,storeUnit,unitConversions));
          replaceable package IO = Types.RealExtension.IO (
                                            redeclare type Type=T);
          replaceable package Utilities = Types.FilesUtilities(comparisonFileName="comparisonInitial.txt")
                                                         constrainedby
        Types.Utilities
           annotation (Dialog(group="Functions to read or store",tab="Types"));

          Modelica.Blocks.Interfaces.RealInput
                                y "Connector of Real input signal"
            annotation (Placement(transformation(extent={{-100,-10},{-80,10}}), iconTransformation(extent={{-120,-10},{-100,10}})));

    protected
          parameter T initialValue(fixed=false);
        initial equation
          initialValue = y;
        equation
          when initial() then
           Utilities.writeComparison(
            varName,
            k,
            initialValue,
            y,
            storeUnit,
            unitConversions);
          end when;

            annotation (
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.04), graphics={Rectangle(
              extent={{-100,20},{100,-20}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}), Text(
              extent={{-100,-10},{100,10}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%varName")}),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
        end OutputInitialComparison;

        block OutputInitialComparison_SI
      "Save variable comparison to file using SI units"
         // import Physiolibrary;
          extends Types.AbstractReal(             k=Utilities.readReal_SI(varName));
          replaceable package IO = Types.RealExtension.IO (
                                            redeclare type Type=T);
          replaceable package Utilities = Types.FilesUtilities(comparisonSIFileName="comparisonInitial_SI.txt")
                                                         constrainedby
        Types.Utilities
           annotation (Dialog(group="Functions to read or store",tab="Types"));

          Modelica.Blocks.Interfaces.RealInput
                                y "Connector of Real input signal"
            annotation (Placement(transformation(extent={{-100,-10},{-80,10}}), iconTransformation(extent={{-120,-10},{-100,10}})));

    protected
          parameter T initialValue(fixed=false);
        initial equation
          initialValue = y;
        equation
          when initial() then
           Utilities.writeComparison_SI(
            varName,
            k,
            initialValue,
            y);
          end when;

            annotation (
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.04), graphics={Rectangle(
              extent={{-100,20},{100,-20}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}), Text(
              extent={{-100,-10},{100,10}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%varName")}),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
        end OutputInitialComparison_SI;

    package IO
      extends Modelica.Icons.BasesPackage;

      replaceable type Type=Real;
      connector Input = input Type "input connector"
        annotation (defaultComponentName="i",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type Energy.
    </p>
    </html>"));

      connector Output = output Type "output connector"
        annotation (defaultComponentName="o",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
    end IO;
  end RealExtension;

  package RealTypes
    extends Modelica.Icons.BasesPackage;
    import Physiolibrary;

      replaceable block Variable = RealExtension.Parameter constrainedby
      AbstractReal;

      block Energy = Variable(redeclare type T=Types.Energy, storeUnit="kcal");
      block Time = Variable(redeclare type T=Types.Time, storeUnit="min");
      block Frequency = Variable(redeclare type T=Types.Frequency, storeUnit="1/min");

      block Mass = Variable(redeclare type T=Types.Mass, storeUnit="g");
      block MassFlowRate = Variable(redeclare type T =
            Types.MassFlowRate, storeUnit="g/min");
      block Density = Variable(redeclare type T=Types.Density, storeUnit="kg/l");

      block Height = Variable(redeclare type T=Types.Height, storeUnit="cm");
      block Velocity = Variable(redeclare type T=Types.Velocity, storeUnit="km/h");
      block Acceleration = Variable(redeclare type T =
            Types.Acceleration, storeUnit="m/s");

      block Pressure = Variable(redeclare type T=Types.Pressure,storeUnit="mmHg");
      block Volume = Variable(redeclare type T=Types.Volume,storeUnit="ml");
      block VolumeFlowRate = Variable(redeclare type T =
            Types.VolumeFlowRate,storeUnit="ml/min");

      block Concentration = Variable(redeclare type T =
            Types.Concentration, storeUnit="mmol/l");
      block MassConcentration = Variable (redeclare type T =
            Types.MassConcentration, storeUnit="mg/l");
      block AmountOfSubstance = Variable(redeclare type T =
            Types.AmountOfSubstance,storeUnit="mmol");
      block MolarFlowRate = Variable(redeclare type T =
            Types.MolarFlowRate,storeUnit="mmol/min");

      block Heat = Variable(redeclare type T=Types.Heat,storeUnit="kcal");
      block Temperature = Variable(redeclare type T =
          Types.Temperature,  storeUnit="degC");
      block HeatFlowRate = Variable(redeclare type T =
            Types.HeatFlowRate,storeUnit="kcal/min");
      block Power = Variable(redeclare type T =
            Types.Power,storeUnit="kcal/min");
      block ThermalConductance = Variable(redeclare type T =
            Types.ThermalConductance, storeUnit="kcal/(min.K)");
      block SpecificHeatCapacity = Variable(redeclare type T =
            Types.SpecificHeatCapacity,storeUnit="kcal/(kg.K)");
      block SpecificEnergy = Variable(redeclare type T =
            Types.SpecificEnergy,storeUnit="kcal/kg");

      block ElectricPotential = Variable(redeclare type T =
            Types.ElectricPotential,storeUnit="mV");
      block ElectricCharge = Variable(redeclare type T =
            Types.ElectricCharge,storeUnit="meq");
      block VolumeDensityOfCharge =
                             Variable(redeclare type T =
            Types.VolumeDensityOfCharge,storeUnit="meq/l");
      block ElectricCurrent = Variable(redeclare type T =
            Types.ElectricCurrent,storeUnit="meq/min");

      block Fraction = Variable(redeclare type T=Types.Fraction,storeUnit="");

      block pH =       Variable(redeclare type T=Types.pH,storeUnit="log10(mol/l)");
      block OsmoticPermeability = Variable(redeclare type T =
            Types.OsmoticPermeability,storeUnit="ml/(mmHg.min)");
      block DiffusionPermeability =         Variable(redeclare type T =
            Types.DiffusionPermeability,storeUnit="ml/min");

      block HydraulicConductance = Variable(redeclare type T =
            Types.HydraulicConductance,storeUnit="ml/(mmHg.min)");
      block HydraulicCompliance = Variable(redeclare type T =
            Types.HydraulicCompliance,storeUnit="ml/mmHg");
      block HydraulicInertance = Variable(redeclare type T =
            Types.HydraulicInertance,storeUnit="mmHg.min2/ml");

      block GasSolubility = Variable(redeclare type T =
            Types.GasSolubility,storeUnit="(mmol/l)/kPa at 25degC");

      block Osmolarity =    Variable(redeclare type T =
            Types.Osmolarity,storeUnit="mosm/l");
      block Position=Variable(redeclare type T=Types.Position, storeUnit="cm");
      block MolarEnergy =
                     Variable(redeclare type T=Types.MolarEnergy, storeUnit="kcal/mol");
      block Population =    Variable(redeclare type T =
            Types.Population,storeUnit="1");
      block PopulationChange =
                            Variable(redeclare type T =
            Types.PopulationChange,storeUnit="1/d");
      block PopulationChangePerMember =
                            Variable(redeclare type T =
            Types.PopulationChangePerMember,storeUnit="1/d");
  end RealTypes;

  partial block AbstractBoolean
    "Abstract parameter or the value at defined time of the model - can be input or output parameter"

    parameter String varName="" "Name of stored variable"
    annotation (Dialog(group="Value I/O",tab="IO"));
                                //getInstanceName()
     parameter Boolean k(fixed=true)=false "Value"
      annotation (Dialog(group="Parameters"));

  end AbstractBoolean;

  package FilesUtilities "File input/output/test"
    import Physiolibrary;
    extends Types.Utilities;
    extends Modelica.Icons.VariantsPackage;

    constant String directoryName="io";

    constant String inputFileName="input.txt"
      "File to load values with (non-)SI units";
    constant String outputFileName="output.txt"
      "File to save values with (non-)SI units";
    constant String comparisonFileName="comparison.txt"
      "File to save comparison from loaded values and simulation results with (non-)SI units";

    constant String inputSIFileName="input_SI.txt"
      "File to load values in SI units";
    constant String outputSIFileName="output_SI.txt"
      "File to save values in SI units";
    constant String comparisonSIFileName="comparison_SI.txt"
      "File to save comparison in SI units from loaded values and simulation results";

    redeclare function extends readReal
      import Modelica.Utilities.*;

    protected
      String fn;
      String line;
      Integer nextIndex;
      Integer lineLen;
      Integer iline=1;
      Boolean found = false;
      Boolean endOfFile=false;
      String str;
      Real inputValue;
      Integer typeDef;
    algorithm
      fn:=directoryName + "/" + inputFileName;

      if not Files.exist(fn) then
         Streams.error("readRealParameter(\""+name+"\", \""+ fn + "\")  Error: the file does not exist.\n");
      else

      typeDef:=UnitConversions.findUnit(storeUnit,unitConversions);

      //Format "<variableName>\n<value> <unit>"
      (line, endOfFile) :=Streams.readLine(fn, iline);
      while not found and not endOfFile loop
           if line == name then
               // name found, get value of "name = value;"
               (line, endOfFile) :=Streams.readLine(fn, iline+1);
               lineLen := Strings.length(line);
               nextIndex:=1;

    /*
other wariant: //Format "<variableName>=<value><unit>"
  while not found and not endOfFile loop
       iline:=iline+1;
       (line, endOfFile) :=Streams.readLine(fn, iline);
       lineLen := Strings.length(line);

       if lineLen>3 then

         nextIndex:=1; //because Coleman does not use the right identifiers, scanIdentifier can not be used :(
         str:=Strings.substring(line,nextIndex,nextIndex);
         while ((nextIndex+1)<lineLen and (not Strings.isEqual(str," ")) and (not Strings.isEqual(str,"=")) and (not Strings.isEqual(str,"\t"))) loop
            nextIndex:=nextIndex+1;
            str:=Strings.substring(line,nextIndex,nextIndex);
         end while;
         str := Strings.substring(line,1,nextIndex-1);

         if str==name then

           nextIndex:=Strings.Advanced.skipWhiteSpace(line,nextIndex);
           nextIndex:=Strings.Advanced.skipWhiteSpace(line,nextIndex+1); //skip '=' and white-spaces before/after
*/

               (inputValue,nextIndex) := Strings.scanReal(line, nextIndex);

               nextIndex:=Strings.Advanced.skipWhiteSpace(line,nextIndex);
               if nextIndex>lineLen then
                   if Strings.length(unitConversions[typeDef].DisplayUnit) > 0 then
                     Streams.error("No units detected for variable '" + name +
                                    "' in file '" + fn + "'. Expected unis are '" + unitConversions[typeDef].DisplayUnit + "'!\n");
                   end if;
                   //Streams.print(" > " + name + "\t " + String(inputValue) + " (no units)");
               else
                   str :=Strings.substring(line, Strings.Advanced.skipWhiteSpace(line,nextIndex),  Strings.length(line));
                   if str <> unitConversions[typeDef].DisplayUnit then
                      Streams.error("Units '" + str + "' not expected for variable '"
                       + name + "' in file '" + fn + "'. Expected unis are '" +
                      unitConversions[typeDef].DisplayUnit + "'!\n");
                   end if;
                   //Streams.print(" > " + name + "\t " + String(inputValue) + " " + str);
               end if;
               value :=inputValue*unitConversions[typeDef].Scale + unitConversions[typeDef].Offset;
               //Streams.print("\t\t =" + String(value) + " " + unitConversions[typeDef].Unit);
               found := true;
               // end if;  //Format "<variableName>=<value><unit>"

               //Format "<variableName>\n<value><unit>"
           else
               // wrong name, skip lines
               iline := iline + 2;
               // read next variable name
               (line, endOfFile) :=Streams.readLine(fn, iline);
           end if;
         end while;

         if not found then
            Streams.error("Parameter \"" + name + "\" not found in file \"" + fn + "\"\n");
         end if;
       end if;

    end readReal;

    redeclare function extends readReal_SI
      import Modelica.Utilities.*;

    protected
      String fn;
      String line;
      Integer nextIndex;
      Integer iline=1;
      Boolean found = false;
      Boolean endOfFile=false;

    algorithm
      fn:=directoryName + "/" +inputSIFileName;

      if not Files.exist(fn) then
         Streams.error("readRealParameter(\""+name+"\", \""+ fn + "\")  Error: the file does not exist.\n");
      else

      //Format "<variableName>\n<value> <unit>"
      (line, endOfFile) :=Streams.readLine(fn, iline);
      while not found and not endOfFile loop
           if line == name then
               // name found, get value of "name = value;"
               (line, endOfFile) :=Streams.readLine(fn, iline+1);
               nextIndex:=1;

               (value,nextIndex) := Strings.scanReal(line, nextIndex);
               found := true;

             else
             // wrong name, skip lines
               iline := iline + 2;
               // read next variable name
               (line, endOfFile) :=Streams.readLine(fn, iline);

             end if;
         end while;

         if not found then
            Streams.error("Parameter \"" + name + "\" not found in file \"" + fn + "\"\n");
         end if;
       end if;

    end readReal_SI;

    redeclare function extends readBoolean
      import Modelica.Utilities.*;

    algorithm
      value:=(readReal(name,"")>0.005);
    end readBoolean;

    redeclare function extends writeReal "Write the value to file"
      import Modelica.Utilities.*;

    protected
      String fn;
      Integer typeDef "Variable type";

    algorithm
      fn:=directoryName + "/" +outputFileName;

      if not Files.exist(fn) then
         if not Files.exist(directoryName) then
             Files.createDirectory(directoryName);
         end if;
      end if;

      typeDef:=UnitConversions.findUnit(storeUnit,unitConversions);

      Streams.print(name + "\n" + String(((value - unitConversions[typeDef].Offset)/unitConversions[typeDef].Scale))
      + " " + unitConversions[typeDef].DisplayUnit, fn);

    end writeReal;

    redeclare function extends writeReal_SI
      "Write the value to file using SI unit"
      import Modelica.Utilities.*;

    protected
      String fn;
      Integer typeDef "Variable type";

    algorithm
      fn:=directoryName + "/" +outputSIFileName;

      if not Files.exist(fn) then
         if not Files.exist(directoryName) then
             Files.createDirectory(directoryName);
         end if;
      end if;

       Streams.print(name + "\n" + String(value), fn);

    end writeReal_SI;

    redeclare function extends writeBoolean
      import Modelica.Utilities.*;
    protected
      String fn;

    algorithm
      fn:=directoryName + "/" +outputFileName;

      if not Files.exist(fn) then
         if not Files.exist(directoryName) then
             Files.createDirectory(directoryName);
         end if;
      end if;

      Streams.print( name + "\n" + String(if value then 1 else 0),      fn);

    end writeBoolean;

    redeclare function extends writeComparison
      "Compare and write the result and the value to file"
      import Modelica.Utilities.*;

    protected
      String fn;
      Real outputInitialValue;
      Real outputFinalValue;
      Real outputDefaultValue;
      Integer typeDef "Variable output units";

    algorithm
      fn:=directoryName + "/" +comparisonFileName;

      if not Files.exist(fn) then
         if not Files.exist("output") then
             Files.createDirectory("output");
         end if;
      end if;

      typeDef:=UnitConversions.findUnit(storeUnit,unitConversions);

    outputDefaultValue :=((defaultValue - unitConversions[typeDef].Offset)/unitConversions[typeDef].Scale);
    outputInitialValue :=((initialValue - unitConversions[typeDef].Offset)/unitConversions[typeDef].Scale);
    outputFinalValue :=((finalValue - unitConversions[typeDef].Offset)/unitConversions[typeDef].Scale);

      Streams.print((if (abs(outputDefaultValue) > Modelica.Constants.eps)
         then String(abs((outputFinalValue - outputDefaultValue)/
        outputDefaultValue)) else "Zero vs. " + String(outputFinalValue)) +
        " ; " + name + " : default=" + String(outputDefaultValue) + " " +
        unitConversions[typeDef].DisplayUnit
         + ", initial=" + String(outputInitialValue) + " " + unitConversions[
        typeDef].DisplayUnit + ", final=" + String(outputFinalValue) + " " +
        unitConversions[typeDef].DisplayUnit,
        fn);

    end writeComparison;

    redeclare function extends writeComparison_SI
      "Compare and write the result and the value to file using SI units"
      import Modelica.Utilities.*;

    protected
      String fn;
      Real outputInitialValue;
      Real outputFinalValue;
      Real outputDefaultValue;

    algorithm
      fn:=directoryName + "/" +comparisonSIFileName;

      if not Files.exist(fn) then
         if not Files.exist("output") then
             Files.createDirectory("output");
         end if;
      end if;

    outputDefaultValue := defaultValue;
    outputInitialValue := initialValue;
    outputFinalValue := finalValue;

    Streams.print((if (abs(outputDefaultValue) > Modelica.Constants.eps) then
      String(abs((outputFinalValue - outputDefaultValue)/outputDefaultValue))
       else "Zero vs. " + String(outputFinalValue)) + " ; " + name +
      " : default=" + String(outputDefaultValue) + ", initial=" + String(outputInitialValue)
       + ", final=" + String(outputFinalValue), fn);

    end writeComparison_SI;

    redeclare function extends writeBooleanComparison
      "Compare and write the result and the value to file"
      import Modelica.Utilities.*;

    protected
      String fn;
      Real outputInitialValue;
      Real outputFinalValue;
      Real outputDefaultValue;
    algorithm
      fn:=directoryName + "/" +comparisonFileName;

      if not Files.exist(fn) then
         if not Files.exist("output") then
             Files.createDirectory("output");
         end if;
      end if;
       if (defaultValue==finalValue) then

           Streams.print("0 ; "+ name + " : default=" + String(if defaultValue then 1 else 0) +", initial=" + String(if initialValue then 1 else 0) + ", final=" + String(if finalValue then 1 else 0), "differences.txt");
         else
           Streams.print("! ; " + name + " : default=" + String(if defaultValue then 1 else 0) +", initial=" + String(if initialValue then 1 else 0)+ ", final=" + String(if finalValue then 1 else 0), "differences.txt");
       end if;

    end writeBooleanComparison;

    annotation (Documentation(revisions="<html>
<p>Licensed by Marek Matejak under the Modelica License 2</p>
<p>Copyright &copy; 2008-2013, Marek Matejak, Charles University in Prague.</p>
<p><br/><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Physiolibrary.UsersGuide.ModelicaLicense2\">UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p>
</html>",   info="<html>
<p>During the creation and debugging of huge integrated models it is necessary to easily define consistent input, output and test sets of all output variables for some subsystems. Let&apos;s imagine that we have a model composed only of subsystems that converge from some constant inputs to constant outputs. It should be possible to substitute each main subsystem for its chosen constant output values as parameters. Comparing the model with these parametric values and the original subsystem can show the wrong part of the simulation. </p>
<p>For example in the huge HumMod model it is necessary to debug smaller parts separately. These tools could be use, because HumMod is the type of constant-converged model. Each subsystem in the first level has the constant input values set for its output variables. Simulating, for example, the cardiovascular subsystem is possible by creating the high-level system with the original cardiovascular subsystem, but with a constant metabolic, constant thermoregulation, constant hormonal, constant water, constant proteins, constant gases, constant electrolytes and constant status subsystem. </p>
<p>Because the number of output variables for each subsytem changes during development, it is a good idea to have only one list for each subsystem. And generating consistent sets to store, restore, compare initial and final values is possible by the same pattern as presented in the package Types.Example. In this package it is also possible to define a customized &nbsp;way to save and load the variables that connect subsystems together. For this purpose, one has to redeclare the package Types.Utilities with simple functions for reading and writing values, such as is done in the default package FileUtilities. </p>
</html>"));
  end FilesUtilities;

  package BooleanExtension
    extends Modelica.Icons.VariantsPackage;
        block Parameter "Read constant boolean signal"
          extends Types.AbstractBoolean;

          Modelica.Blocks.Interfaces.BooleanOutput y
        "Connector of Real output signal"
            annotation (Placement(transformation(extent={{100,-10},{120,10}})));

        equation
          y = k;
          annotation (
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Rectangle(
              extent={{-100,20},{100,-20}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}), Text(
              extent={{-100,-10},{100,10}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%varName")}),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
        end Parameter;

        block InputParameter "Read constant boolean signal"
          extends Types.AbstractBoolean(k=
            Utilities.readBoolean(varName));

          Modelica.Blocks.Interfaces.BooleanOutput y
        "Connector of Real output signal"
            annotation (Placement(transformation(extent={{100,-10},{120,10}})));
          replaceable package Utilities = Types.FilesUtilities;

        equation
          y = k;
          annotation (
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Rectangle(
              extent={{-100,20},{100,-20}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}), Text(
              extent={{-100,-10},{100,10}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%varName")}),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
        end InputParameter;

        block OutputFinal "Save boolean value to file"
         extends Types.AbstractBoolean;

          replaceable package Utilities = Types.FilesUtilities;

          Modelica.Blocks.Interfaces.BooleanInput
                                                y
        "Connector of Real output signal"
            annotation (Placement(transformation(extent={{-100,-10},{-80,10}}), iconTransformation(extent={{-100,-10},{-80,10}})));

        equation
          when terminal() then
             Utilities.writeBoolean(varName,y);
          end when;

          annotation (
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Rectangle(
              extent={{-100,20},{100,-20}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}), Text(
              extent={{-100,-10},{100,10}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%varName")}),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
        end OutputFinal;

        block OutputComparison "Save variable comparison to file"
          import Physiolibrary;
          extends Types.AbstractBoolean(          k=Utilities.readBoolean(varName));
          replaceable package Utilities = Types.FilesUtilities
           annotation (Dialog(group="Functions to read or store",tab="Types"));

          Modelica.Blocks.Interfaces.BooleanInput
                                y "Connector of Real input signal"
            annotation (Placement(transformation(extent={{-100,-10},{-80,10}}), iconTransformation(extent={{-120,-10},{-100,10}})));

    protected
          parameter Boolean initialValue(fixed=false);
        initial equation
          initialValue = y;
        equation
          when terminal() then
           Utilities.writeBooleanComparison(
            varName,
            k,
            initialValue,
            y);
          end when;

            annotation (
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.04), graphics={Rectangle(
              extent={{-100,20},{100,-20}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}), Text(
              extent={{-100,-10},{100,10}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%varName")}),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
        end OutputComparison;
  end BooleanExtension;

  package Utilities "Value input/output/test support"
    extends Modelica.Icons.BasesPackage;
    replaceable function readReal "Read the real value of parameter from file with lines in format:
  <parameterName>
  <value> <unit>"
      extends Modelica.Icons.Function;

      input String name "Name of parameter";
      input String storeUnit "Prefered units to store variable value";
      input UnitConversions.RealTypeRecord[:] unitConversions = UnitConversions.RealTypeDef
        "Unit conversions";

      output Real value=0 "Actual value of parameter in SI units";
    //algorithm
    end readReal;

    replaceable function readReal_SI "Read the real value in SI units of parameter from file with lines in format:
  <parameterName>\\n<value>"
      extends Modelica.Icons.Function;

      input String name "Name of parameter";

      output Real value=0 "Actual value of parameter in SI units";
    //algorithm
    end readReal_SI;

    replaceable function readBoolean "Read the boolean value of parameter from file with lines in format:
  <parameterName>
  <value> <unit>"
      extends Modelica.Icons.Function;

      input String name "Variable name";
      output Boolean value "Variable value";
    //algorithm
    end readBoolean;

    replaceable function writeReal "Write the real value to file"
      extends Modelica.Icons.Function;

      input String name "Variable name";
      input Real value "Variable value";
      input String storeUnit "Prefered units to store variable value";
      input UnitConversions.RealTypeRecord[:] unitConversions = UnitConversions.RealTypeDef
        "Unit conversions";
    //algorithm
    end writeReal;

    replaceable function writeReal_SI
      "Write the real value using SI unit to file"
      extends Modelica.Icons.Function;

      input String name "Variable name";
      input Real value "Variable value";
    //algorithm
    end writeReal_SI;

    replaceable function writeBoolean "Write the boolean value to file"
      extends Modelica.Icons.Function;

      input String name "Variable name";
      input Boolean value "Variable value";
    //algorithm
    end writeBoolean;

    replaceable function writeComparison
      "Compare and write the result and the value to file"

      extends Modelica.Icons.Function;

      input String name "Variable name";
      input Real defaultValue
        "Original value[in SIunits] to compare with final value";
      input Real initialValue "Initial variable value[in SI units]";
      input Real finalValue "Final variable value[in SI units]";

      input String storeUnit "Prefered units to store variable value";
      input UnitConversions.RealTypeRecord[:] unitConversions = UnitConversions.RealTypeDef
        "Unit conversions";
    //algorithm
    end writeComparison;

    replaceable function writeComparison_SI
      "Compare and write the result and the value to file using SI units"

      extends Modelica.Icons.Function;

      input String name "Variable name";
      input Real defaultValue
        "Original value[in SIunits] to compare with final value";
      input Real initialValue "Initial variable value[in SI units]";
      input Real finalValue "Final variable value[in SI units]";

    //algorithm
    end writeComparison_SI;

    replaceable function writeBooleanComparison
      "Compare and write the result and the value to file"
      extends Modelica.Icons.Function;

      input String name "Variable name";
      input Boolean defaultValue
        "Original value[in SIunits] to compare with final value";
      input Boolean initialValue "Initial variable value[in SI units]";
      input Boolean finalValue "Final variable value[in SI units]";
    //algorithm
    end writeBooleanComparison;

    package UnitConversions "Conversions non-SI units at input/output"

     function findUnit
       input String unitToFind "display unit to find in unitConversions";
       input UnitConversions.RealTypeRecord[:] unitConversions = UnitConversions.RealTypeDef
          "Unit conversions";
       output Integer typeDef "index in unitConversions";
     algorithm
       typeDef:=0;
       for i in 1:size(unitConversions,1) loop
         if unitConversions[i].DisplayUnit == unitToFind then
           typeDef:=i;
           break;
         end if;
       end for;
       if typeDef==0 then
          Modelica.Utilities.Streams.print("Unit \"" + unitToFind + "\" not defined. Do not hesitate to contact me. marek@matfyz.cz\n");
       end if;
     end findUnit;

     record RealTypeRecord "The Real Type definition"
       parameter String Quantity="" "Quantity";
       parameter String Unit="1" "SI unit";
       parameter String DisplayUnit="" "Display unit";

       parameter Real Scale=1
          "Scale from display unit to SI unit such that x <d> = x*s+o <u>";
       parameter Real Offset=0
          "Offset from display unit to SI unit such that x <d> = x*s+o <u>";

       parameter Real Min=-Modelica.Constants.inf "minimal value";
       parameter Real Max=+Modelica.Constants.inf; // Inf denotes a large value
       parameter Real Start = Offset; // Initial value
       parameter Real Nominal = Scale; // Nominal value
       parameter StateSelect StateSelection = StateSelect.default;
     end RealTypeRecord;

      constant RealTypeRecord RealTypeDef[:]={RealTypeRecord(),
          RealTypeRecord(),RealTypeRecord(
            Quantity="pH",
            Unit="log10(mol/l)",
            DisplayUnit="log10(mol/l)",
            Scale=1),RealTypeRecord(
            Quantity="Energy",
            Unit="J",
            DisplayUnit="kcal",
            Scale=4186.8),RealTypeRecord(
            Quantity="Time",
            Unit="s",
            DisplayUnit="min",
            Scale=60),RealTypeRecord(
            Quantity="Frequency",
            Unit="1/s",
            DisplayUnit="Hz",
            Scale=1),RealTypeRecord(
            Quantity="Frequency",
            Unit="1/s",
            DisplayUnit="1/min",
            Scale=1/60),RealTypeRecord(
            Quantity="Mass",
            Unit="kg",
            Min=0,
            DisplayUnit="g",
            Scale=1e-3),RealTypeRecord(
            Quantity="Mass",
            Unit="kg",
            Min=0,
            DisplayUnit="mg",
            Scale=1e-6),RealTypeRecord(
            Quantity="MassFlowRate",
            Unit="kg/s",
            DisplayUnit="mg/min",
            Scale=(1e-6)/60),RealTypeRecord(
            Quantity="MassFlowRate",
            Unit="kg/s",
            DisplayUnit="g/min",
            Scale=(1e-3)/60),RealTypeRecord(
            Quantity="Density",
            Unit="kg/m3",
            Min=0,
            DisplayUnit="kg/l",
            Scale=1e3),RealTypeRecord(
            Quantity="Density",
            Unit="kg/m3",
            Min=0,
            DisplayUnit="g/l",
            Scale=1),RealTypeRecord(
            Quantity="MassConcentration",
            Unit="kg/m3",
            Min=0,
            DisplayUnit="mg/l",
            Scale=1e-3),RealTypeRecord(
            Quantity="MassConcentration",
            Unit="kg/m3",
            Min=0,
            DisplayUnit="mg/dl",
            Scale=1e-6/1e-4),RealTypeRecord(
            Quantity="MassConcentration",
            Unit="kg/m3",
            Min=0,
            DisplayUnit="ng/l",
            Scale=1e-12/1e-3),RealTypeRecord(
            Quantity="MassConcentration",
            Unit="kg/m3",
            Min=0,
            DisplayUnit="ng/dl",
            Scale=1e-12/1e-4),RealTypeRecord(
            Quantity="MassConcentration",
            Unit="kg/m3",
            Min=0,
            DisplayUnit="ng/ml",
            Scale=1e-12/1e-6),RealTypeRecord(
            Quantity="Length",
            Unit="m",
            DisplayUnit="cm",
            Scale=1e-2),RealTypeRecord(
            Quantity="Velocity",
            Unit="m/s",
            DisplayUnit="MPH",
            Scale=0.44704),RealTypeRecord(
            Quantity="Acceleration",
            Unit="m/s2",
            DisplayUnit="m/s2",
            Scale=1),RealTypeRecord(
            Quantity="Pressure",
            Unit="Pa",
            DisplayUnit="mmHg",
            Scale=101325/760),RealTypeRecord(
            Quantity="Volume",
            Unit="m3",
            DisplayUnit="ml",
            Scale=1e-6),RealTypeRecord(
            Quantity="VolumeFlowRate",
            Unit="m3/s",
            DisplayUnit="ml/min",
            Scale=(1e-6)/60),RealTypeRecord(
            Quantity="Concentration",
            Unit="mol/m3",
            DisplayUnit="mol/l",
            Scale=1e+3),RealTypeRecord(
            Quantity="Concentration",
            Unit="mol/m3",
            DisplayUnit="mmol/l",
            Scale=1),RealTypeRecord(
            Quantity="Concentration",
            Unit="mol/m3",
            DisplayUnit="pmol/l",
            Scale=1e-12/1e-3),RealTypeRecord(
            Quantity="Concentration",
            Unit="mol/m3",
            DisplayUnit="uU_Insulin/ml",
            Scale=6.622e-9),RealTypeRecord(
            Quantity="Concentration",
            Unit="mol/m3",
            DisplayUnit="U_EPO/l",
            Scale=0.45e-9),RealTypeRecord(
            Quantity="AmountOfSubstance",
            Unit="mol",
            DisplayUnit="mmol",
            Scale=1e-3),RealTypeRecord(
            Quantity="AmountOfSubstance",
            Unit="mol",
            DisplayUnit="osm",
            Scale=1),RealTypeRecord(
            Quantity="AmountOfSubstance",
            Unit="mol",
            DisplayUnit="mosm",
            Scale=1e-3),RealTypeRecord(
            Quantity="MolarFlowRate",
            Unit="mol/s",
            DisplayUnit="mmol/min",
            Scale=(1e-3)/60),RealTypeRecord(
            Quantity="MolarFlowRate",
            Unit="mol/s",
            DisplayUnit="ml_STP/min",
            Scale=1/1362657.193569),RealTypeRecord(
            Quantity="Energy",
            Unit="J",
            DisplayUnit="kcal",
            Scale=4186.8),RealTypeRecord(
            Quantity="ThermodynamicTemperature",
            Unit="K",
            DisplayUnit="K",
            Scale=1,
            Start=310.15),RealTypeRecord(
            Quantity="ThermodynamicTemperature",
            Unit="K",
            DisplayUnit="degC",
            Scale=1,
            Offset=273.15,
            Start=310.15),RealTypeRecord(
            Quantity="Power",
            Unit="W",
            DisplayUnit="W",
            Scale=1),RealTypeRecord(
            Quantity="Power",
            Unit="W",
            DisplayUnit="kcal/min",
            Scale=4186.8/60),RealTypeRecord(
            Quantity="Power",
            Unit="W",
            DisplayUnit="cal/min",
            Scale=4.1868/60),RealTypeRecord(
            Quantity="ThermalConductance",
            Unit="W/K",
            DisplayUnit="kcal/(min.degC)",
            Scale=4186.8/60),RealTypeRecord(
            Quantity="SpecificHeatCapacity",
            Unit="J/(kg.K)",
            DisplayUnit="kcal/(degC.kg)",
            Scale=4186.8),RealTypeRecord(
            Quantity="SpecificEnergy",
            Unit="J/kg",
            DisplayUnit="kcal/kg",
            Scale=4186.8),RealTypeRecord(
            Quantity="ElectricPotential",
            Unit="V",
            DisplayUnit="mV",
            Scale=1e-3),RealTypeRecord(
            Quantity="ElectricCharge",
            Unit="C",
            DisplayUnit="meq",
            Scale=(1e-3)*(9.64853399*10^4)),RealTypeRecord(
            Quantity="VolumeDensityOfCharge",
            Unit="C/m3",
            DisplayUnit="meq/l",
            Scale=(1e-3)*(9.64853399*10^4)/1e-3),RealTypeRecord(
            Quantity="VolumeDensityOfCharge",
            Unit="C/m3",
            DisplayUnit="eq/l",
            Scale=(9.64853399*10^4)/1e-3),RealTypeRecord(
            Quantity="ElectricCurrent",
            Unit="A",
            DisplayUnit="meq/min",
            Scale=(1e-3)*(9.64853399*10^4)/60),RealTypeRecord(
            Quantity="Fraction",
            Unit="1",
            DisplayUnit="%",
            Scale=1e-2),RealTypeRecord(
            Quantity="OsmoticMembramePermeability",
            Unit="m6/(mol.s)",
            DisplayUnit="ml/(mOsmol.min)",
            Scale=(1e-6)/((1e-3)*60)),RealTypeRecord(
            Quantity="DiffusionMembranePermeability",
            Unit="m3/s",
            DisplayUnit="ml/min",
            Scale=(1e-3)/60),RealTypeRecord(
            Quantity="HydraulicConductance",
            Unit="m3/(Pa.s)",
            DisplayUnit="ml/(mmHg.min)",
            Scale=(1e-6)/((101325/760)*60)),RealTypeRecord(
            Quantity="HydraulicCompliance",
            Unit="m3/Pa",
            DisplayUnit="ml/mmHg",
            Scale=(1e-6)/(101325/760)),RealTypeRecord(
            Quantity="HydraulicInertance",
            Unit="Pa.s2/m3",
            DisplayUnit="mmHg.min2/ml",
            Scale=((101325/760)*(60^2)/(1e-6))),RealTypeRecord(
            Quantity="GasSolubility",
            Unit="mol/(m3.Pa)",
            DisplayUnit="mmol/(l.mmHg)",
            Scale=(1e-3)/((1e-3)*(101325/760))),RealTypeRecord(
            Quantity="Osmolarity",
            Unit="mol/m3",
            DisplayUnit="mosm/l",
            Scale=1),RealTypeRecord(
            Quantity="Osmolarity",
            Unit="mol/m3",
            DisplayUnit="osm/l",
            Scale=1000),RealTypeRecord(
            Quantity="MolarEnergy",
            Unit="J/mol",
            DisplayUnit="kcal/mol",
            Scale=4186.8),RealTypeRecord(
            Quantity="Pharmacology Concentration",
            Unit="1/m3",
            DisplayUnit="iu/l",
            Scale=1000),RealTypeRecord(
            Quantity="Pharmacology Concentration",
            Unit="1/m3",
            DisplayUnit="uiu/ml",
            Scale=1),RealTypeRecord(
            Quantity="PopulationChange",
            Unit="1/s",
            DisplayUnit="1/min",
            Scale=1/60),RealTypeRecord(
            Quantity="PopulationChange",
            Unit="1/s",
            DisplayUnit="1/d",
            Scale=1/(60*60*24))}
        "All defined Real types - units, displayUnits, conversions, nominals";

       constant String[:] Prefix =    {"","m", "u", "n", "p"};
       constant Real[:]   PrefixScale={1.0, 1e-3,1e-6,1e-9,1e-12};

       constant String[:] SuffixSI= {"","/m3","/m3","/m3","/s"};
       constant String[:] Suffix =  {"","/l", "/dl","/ml","/min"};
       constant Real[:]   SuffixScale={1, 1e+3, 1e+4, 1e+6, 1/60};

      function GenerateSubstanceUnits
         input String nonSIunit "non-SI unit";
         input Real scale "1 mol = 'scale' 'nonSIunit'";
         output RealTypeRecord[size(Prefix,1)*size(Suffix,1)] units
          "generated conversions for mili-, micro-, .. amount/concentration/flow";
      protected
       constant Integer np = size(Prefix,1);
       constant Integer ns = size(Suffix,1);
      algorithm
        units:={
            RealTypeRecord(
              Unit="mol"+SuffixSI[integer(1+mod(i,ns))],
              DisplayUnit=Prefix[integer(1+div(i,ns))] + nonSIunit + Suffix[integer(1+mod(i,ns))],
              Scale=PrefixScale[integer(1+div(i,ns))]*scale*SuffixScale[integer(1+mod(i,ns))])
            for i in 0:(np*ns-1)};
      end GenerateSubstanceUnits;

    end UnitConversions;
  end Utilities;

  package ZeroUtilities "No input/output/test"
    import Physiolibrary;
    extends Types.Utilities;
    extends Modelica.Icons.VariantsPackage;

    redeclare function extends readReal
    algorithm
    end readReal;

    redeclare function extends readReal_SI
    algorithm
    end readReal_SI;

    redeclare function extends readBoolean
    algorithm
    end readBoolean;

    redeclare function extends writeReal
    algorithm
    end writeReal;

    redeclare function extends writeReal_SI
    algorithm
    end writeReal_SI;

    redeclare function extends writeBoolean
    algorithm
    end writeBoolean;

    redeclare function extends writeComparison
    algorithm
    end writeComparison;

    redeclare function extends writeComparison_SI
    algorithm
    end writeComparison_SI;

    redeclare function extends writeBooleanComparison
    algorithm
    end writeBooleanComparison;

  end ZeroUtilities;

  type SimulationType = enumeration(
      NoInit "Use start values only as a guess of state values",
      NormalInit "Initialization by start values",
      ReadInit "Initialization by function Utilities.readReal('state name')",
      InitSteadyState
        "Initialization in Steady State (initial derivations are zeros)",
      SteadyState "Steady State = Derivations are zeros during simulation")
    "Initialization or Steady state options (to determine model type before simulating)"
      annotation (Evaluate=true);

  annotation (Documentation(revisions="<html>
<p>Licensed by Marek Matejak under the Modelica License 2</p>
<p>Copyright &copy; 2008-2014, Marek Matejak, Charles University in Prague.</p>
<p><br><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Physiolibrary.UsersGuide.ModelicaLicense2\">UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p>
</html>", info="<html>
<p>The main problem of medical research, articles, and experiments is using obscure units from medicine, pharmacology, biology and non-physics disciplines. The Physiolibrary fulfills the Modelica ideal of using SI units as the main unit for each variable, and the previously described physiological units are also implemented as the displayUnits for each variable. Using these displayUnits the user sets and sees the &QUOT;physiological&QUOT; values. The implementation can also be joined to any unit-correct Modelica models and physical equations without crashing due to unit incompatibilities. The unit support of Physiolibrary is so strong that you even can chose the right unit-typed &ldquo;input real&rdquo;/&rdquo;output real&rdquo; from the library package Types.RealIO. As can be expected, only the non-specific packages States and Blocks in the Physiolibrary have variables without units.</p>
</html>"));
end Types;

within Physiolibrary;
package Types "Physiological units with nominals"
  //extends Modelica.Icons.TypesPackage;
  extends Modelica.Icons.Package;
//If you have an idea to add the next physiological type to the next version, please write me at marek@matfyz.cz. Thank you

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
        gasSolubility=0.0075006157584566,
        gasSATP=0.040339548059044,
        gasNIST=0.041571199502531)
        annotation (Placement(transformation(extent={{-14,8},{6,28}})));
      annotation (experiment(StopTime=1),
     Documentation(info="<html>
<p>If your environment fully support the physiological units, then the user dialog of setting parameters should display only values &QUOT;1&QUOT; of physiological unit.</p>
</html>"));
    end Units;

    model ParameterSet
    extends Modelica.Icons.Example;

      replaceable package T = RealTypes
            constrainedby RealTypes;

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
      BusConnector busConnector annotation (Placement(transformation(extent={{52,-20},
                {90,18}}), iconTransformation(extent={{-12,-18},{28,22}})));
    equation
      connect(Bone_PO2.y, busConnector.Bone_PO2) annotation (Line(
          points={{6.1,65},{70.05,65},{70.05,-1},{71,-1}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      connect(BoneBloodFlow.y, busConnector.Bone_BloodFlow)
                                                       annotation (Line(
          points={{6.1,31},{71.05,31},{71.05,-1},{71,-1}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      connect(BoneO2Need.y, busConnector.Bone_O2Need)
                                                    annotation (Line(
          points={{6.1,-9},{71.05,-9},{71.05,-1},{71,-1}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      connect(BoneLiquidVol.y, busConnector.Bone_LiquidVol)
                                                       annotation (Line(
          points={{6.1,-51},{71.05,-51},{71.05,-1},{71,-1}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      annotation (experiment(StopTime=1),
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics), Icon(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
    end ParameterSet;

    model InputParameterSet
    extends ParameterSet( T(redeclare block Variable =
              RealExtension.InputParameter (                                       redeclare
                package Utilities = Physiolibrary.Types.ZeroUtilities)));

    end InputParameterSet;

    model OutputFinalSet
    extends ParameterSet( T(redeclare block Variable =
            RealExtension.OutputFinal (
              redeclare package Utilities = Physiolibrary.Types.ZeroUtilities)));
    end OutputFinalSet;

    model OutputComparisonSet
    extends ParameterSet( T(redeclare block Variable =
              RealExtension.OutputComparison (
              redeclare package Utilities = Physiolibrary.Types.ZeroUtilities)));
    end OutputComparisonSet;
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
               Diagram(coordinateSystem(extent={{-40,-40},{40,40}},
            preserveAspectRatio=false), graphics),                    Icon(
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
<p>Even it is not recommended, you can use this block, but do not forget to make reciprocal value (in example using Physiolibrary.Blocks.Math.Reciprocal) before connecting to library components!</p>
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
               Diagram(coordinateSystem(extent={{-40,-40},{40,40}},
            preserveAspectRatio=false), graphics),                    Icon(
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
<p>Even it is not recommended, you can use this block, but do not forget to make reciprocal value (in example using Physiolibrary.Blocks.Math.Reciprocal) before connecting to library components!</p>
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

  end Constants;

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
              lineColor={255,204,51},
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
This connector defines the \"expandable connector\" ControlBus that
is used as bus in the HuMod model.
Note, this connector is \"empty\". When using it, the actual content is
constructed by the signals connected to this bus.
</p>
</html>"));
    /*
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
          {100,100}}), graphics={Rectangle(
        extent={{-20,2},{22,-2}},
        lineColor={0,0,255},
        lineThickness=0.5)}),
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
          -100},{100,100}}),
            graphics),
    ));
*/
    end BusConnector;

  type Energy = Modelica.SIunits.Energy(displayUnit="kcal", nominal=4186.8);
  type Time = Modelica.SIunits.Time(displayUnit="min", nominal=60);
  type Frequency = Modelica.SIunits.Frequency(displayUnit="1/min");

  type Mass = Modelica.SIunits.Mass(displayUnit="g", nominal=1e-3);
  type MassFlowRate = Modelica.SIunits.MassFlowRate(displayUnit="mg/min", nominal=(1e-6)/60);
  type Density = Modelica.SIunits.Density(displayUnit="kg/l", nominal=1e3);

  type Height = Modelica.SIunits.Height(displayUnit="cm", nominal=1e-2);
  type Acceleration = Modelica.SIunits.Acceleration(displayUnit="m/s2", nominal=1);

  type Pressure =  Modelica.SIunits.Pressure(displayUnit="mmHg", nominal=133.322387415);
  type Volume =  Modelica.SIunits.Volume(displayUnit="ml", nominal=1e-6);
  type VolumeFlowRate = Modelica.SIunits.VolumeFlowRate(displayUnit="ml/min", nominal=(1e-6)/60);

  type Concentration = Modelica.SIunits.Concentration (displayUnit="mmol/l");
  type AmountOfSubstance = Modelica.SIunits.AmountOfSubstance (displayUnit="mmol");
  type MolarFlowRate = Modelica.SIunits.MolarFlowRate(displayUnit="mmol/min");

  type Osmolarity = Modelica.SIunits.Concentration (displayUnit="mosm/l", nominal=1);

  type Heat = Modelica.SIunits.Heat(displayUnit="kcal", nominal=4186800); //needed to heat 1 liter of water by 1 degC
  type Temperature = Modelica.SIunits.Temperature(displayUnit="degC", nominal=1);
  type HeatFlowRate = Modelica.SIunits.HeatFlowRate(displayUnit="kcal/min", nominal=4186.8/60);
  type ThermalConductance = Modelica.SIunits.ThermalConductance(displayUnit="kcal/(min.K)", nominal=4186.8/60);
  type SpecificHeatCapacity = Modelica.SIunits.SpecificHeatCapacity(displayUnit="kcal/(kg.K)", nominal=4186.8);
  type SpecificEnergy = Modelica.SIunits.SpecificEnergy(displayUnit="kcal/kg", nominal=4186.8)
    "vaporization, ..";

  type ElectricPotential = Modelica.SIunits.ElectricPotential(displayUnit="mV", nominal=1e-3);
  type ElectricCharge = Modelica.SIunits.ElectricCharge(displayUnit="meq", nominal=96.4853365);
  type ElectricCurrent = Modelica.SIunits.ElectricCurrent(displayUnit="meq/min", nominal=1.60808894);

//unknown units in Standard Modelica Library 3.2
  type Fraction = Real(final quantity="Fraction",final unit="1", displayUnit="%", nominal=1e-2);

  type OsmoticPermeability = Real(final quantity="OsmoticPermeability",final unit="m3/(Pa.s)", displayUnit="ml/(mmHg.min)", nominal=(1e-6)/((133.322387415)*60));
  type DiffusionPermeability = Real(final quantity="DiffusionPermeability", final unit="m3/s", displayUnit="ml/min", nominal=(1e-6)/60);

  type HydraulicConductance = Real(final quantity="HydraulicConductance",final unit="m3/(Pa.s)", displayUnit="ml/(mmHg.min)", nominal=(1e-6)/((133.322387415)*60));
  type HydraulicResistance = Real(final quantity="HydraulicConductance",final unit="(Pa.s)/m3", displayUnit="(mmHg.min)/ml", nominal=(1e+6)*(133.322387415)*60);

  type HydraulicCompliance =  Real(final quantity="HydraulicCompliance",final unit="m3/Pa", displayUnit="ml/mmHg", nominal=(1e-6)/(133.322387415));
  type HydraulicElastance = Real(final quantity="HydraulicElastance",final unit="Pa/m3", displayUnit="mmHg/ml", nominal=(133.322387415)/(1e-6));

  type HydraulicInertance =  Real(final quantity="HydraulicInertance",final unit="Pa.s2/m3", displayUnit="mmHg.min2/ml", nominal=((133.322387415)*(60^2)/(1e-6)));

  type GasSolubility = Real(final quantity="GasSolubility", final unit="(mol/m3)/(mol/m3)", displayUnit="(mmol/l)/kPa at 25degC", nominal=1e-2)
    "Gas solubility in liquid";

  partial block AbstractReal
    "Abstract parameter or the value at defined time (final) of the model - can be input or output parameter"

    replaceable type T=Real
     constrainedby Real "Real type with units"
     annotation (Dialog(group="Simple type",tab="Types"));

    parameter T k(fixed=true) = 0 "Value"
    annotation (Dialog(group="Parameters"));

    parameter String varName=
    "Stored name"
    annotation (Dialog(group="Value I/O",tab="IO"));
                             //getInstanceName()
    parameter String storeUnit="" "Stored units"
    annotation (Dialog(group="Value I/O",tab="IO"));
  end AbstractReal;

  package RealExtension
    extends Modelica.Icons.VariantsPackage;
        block Parameter "Generate constant signal in SI units from file"
          extends AbstractReal;

          replaceable package IO = Physiolibrary.Types.RealExtension.IO (
            redeclare type Type = T) "Real type with units"
             annotation (Dialog(group="Packages",tab="Types"));

          IO.Output y "Connector of Real output signal"
            annotation (Placement(transformation(extent={{100,-10},{120,10}},
                rotation=0)));

        equation
          y = k;
          annotation (
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.1), graphics={Rectangle(
              extent={{-100,20},{100,-20}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}), Text(
              extent={{-100,-10},{100,10}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%varName")}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.1), graphics),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
        end Parameter;

        block InputParameter "Generate constant signal in SI units from file"
          extends AbstractReal(                   k = Utilities.readReal( varName, storeUnit));

          replaceable package IO = Physiolibrary.Types.RealExtension.IO (
            redeclare type Type = T)
                         annotation (Dialog(group="Real type with units",tab="Types"));
          replaceable package Utilities = Physiolibrary.Types.FilesUtilities
        constrainedby Physiolibrary.Types.Utilities
                         annotation (Dialog(group="Functions to read or store",tab="Types"));

          IO.Output y "Connector of Real output signal"
            annotation (Placement(transformation(extent={{100,-10},{120,10}},
                rotation=0)));

        equation
          y = k;
          annotation (
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.1), graphics={Rectangle(
              extent={{-100,20},{100,-20}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}), Text(
              extent={{-100,-10},{100,10}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%varName")}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.1), graphics),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
        end InputParameter;

        block OutputFinal "Save variable to Output"
      import Physiolibrary;
          extends Physiolibrary.Types.AbstractReal;
          replaceable package IO = Physiolibrary.Types.RealExtension.IO (
                                            redeclare type Type=T);
          replaceable package Utilities = Physiolibrary.Types.FilesUtilities
                                                         constrainedby
        Physiolibrary.Types.Utilities;
          IO.Input              y "Connector of Real input signal"
            annotation (Placement(transformation(extent={{-100,-10},{-80,10}},
                rotation=0), iconTransformation(extent={{-120,-10},{-100,10}})));

        equation
          when terminal() then
            Utilities.writeReal(
              varName,
              y,
              storeUnit);
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
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.04), graphics),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
        end OutputFinal;

        block OutputComparison "Save variable comparison to file"
      import Physiolibrary;
          extends Physiolibrary.Types.AbstractReal(
                                                  k=Utilities.readReal(varName,storeUnit));
          replaceable package IO = Physiolibrary.Types.RealExtension.IO (
                                            redeclare type Type=T);
          replaceable package Utilities = Physiolibrary.Types.FilesUtilities
                                                         constrainedby
        Physiolibrary.Types.Utilities
           annotation (Dialog(group="Functions to read or store",tab="Types"));

          Modelica.Blocks.Interfaces.RealInput
                                y "Connector of Real input signal"
            annotation (Placement(transformation(extent={{-100,-10},{-80,10}},
                rotation=0), iconTransformation(extent={{-120,-10},{-100,10}})));

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
            storeUnit);
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
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.04), graphics),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
        end OutputComparison;

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

      block Energy = Variable(redeclare type T=Physiolibrary.Types.Energy);
      block Time = Variable(redeclare type T=Physiolibrary.Types.Time);
      block Frequency = Variable(redeclare type T=Physiolibrary.Types.Frequency);

      block Mass = Variable(redeclare type T=Physiolibrary.Types.Mass);
      block MassFlowRate = Variable(redeclare type T =
            Physiolibrary.Types.MassFlowRate);
      block Density = Variable(redeclare type T=Physiolibrary.Types.Density);

      block Height = Variable(redeclare type T=Physiolibrary.Types.Height);
      block Acceleration = Variable(redeclare type T =
            Physiolibrary.Types.Acceleration);

      block Pressure = Variable(redeclare type T=Physiolibrary.Types.Pressure);
      block Volume = Variable(redeclare type T=Physiolibrary.Types.Volume);
      block VolumeFlowRate = Variable(redeclare type T =
            Physiolibrary.Types.VolumeFlowRate);

      block Concentration = Variable(redeclare type T =
            Physiolibrary.Types.Concentration);
      block AmountOfSubstance = Variable(redeclare type T =
            Physiolibrary.Types.AmountOfSubstance);
      block MolarFlowRate = Variable(redeclare type T =
            Physiolibrary.Types.MolarFlowRate);

      block Heat = Variable(redeclare type T=Physiolibrary.Types.Heat);
      block Temperature = Variable(redeclare type T =
          Physiolibrary.Types.Temperature,                             k=310.15);
      block HeatFlowRate = Variable(redeclare type T =
            Physiolibrary.Types.HeatFlowRate);
      block ThermalConductance = Variable(redeclare type T =
            Physiolibrary.Types.ThermalConductance);
      block SpecificHeatCapacity = Variable(redeclare type T =
            Physiolibrary.Types.SpecificHeatCapacity);
      block SpecificEnergy = Variable(redeclare type T =
            Physiolibrary.Types.SpecificEnergy);

      block ElectricPotential = Variable(redeclare type T =
            Physiolibrary.Types.ElectricPotential);
      block ElectricCharge = Variable(redeclare type T =
            Physiolibrary.Types.ElectricCharge);
      block ElectricCurrent = Variable(redeclare type T =
            Physiolibrary.Types.ElectricCurrent);

      block Fraction = Variable(redeclare type T=Physiolibrary.Types.Fraction);

      block OsmoticPermeability = Variable(redeclare type T =
            Physiolibrary.Types.OsmoticPermeability);
      block DiffusionPermeability =         Variable(redeclare type T =
            Physiolibrary.Types.DiffusionPermeability);

      block HydraulicConductance = Variable(redeclare type T =
            Physiolibrary.Types.HydraulicConductance);
      block HydraulicCompliance = Variable(redeclare type T =
            Physiolibrary.Types.HydraulicCompliance);
      block HydraulicInertance = Variable(redeclare type T =
            Physiolibrary.Types.HydraulicInertance);

      block GasSolubility = Variable(redeclare type T =
            Physiolibrary.Types.GasSolubility);

  end RealTypes;

  partial block AbstractBoolean
    "Abstract parameter or the value at defined time of the model - can be input or output parameter"

    parameter String varName="" "Name of stored variable"
    annotation (Dialog(group="Value I/O",tab="IO"));
                                //getInstanceName()
     parameter Boolean k(fixed=true)=false "Value"
      annotation (Dialog(group="Parameters"));

  end AbstractBoolean;

  package BooleanExtension
    extends Modelica.Icons.VariantsPackage;
        block Parameter "Read constant boolean signal"
          extends Physiolibrary.Types.AbstractBoolean;

          Modelica.Blocks.Interfaces.BooleanOutput y
        "Connector of Real output signal"
            annotation (Placement(transformation(extent={{100,-10},{120,10}},
                rotation=0)));

        equation
          y = k;
          annotation (
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.1), graphics={Rectangle(
              extent={{-100,20},{100,-20}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}), Text(
              extent={{-100,-10},{100,10}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%varName")}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.1), graphics),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
        end Parameter;

        block InputParameter "Read constant boolean signal"
          extends Physiolibrary.Types.AbstractBoolean(k=
            Utilities.readBoolean(varName));

          Modelica.Blocks.Interfaces.BooleanOutput y
        "Connector of Real output signal"
            annotation (Placement(transformation(extent={{100,-10},{120,10}},
                rotation=0)));
          replaceable package Utilities = Physiolibrary.Types.Utilities;

        equation
          y = k;
          annotation (
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.1), graphics={Rectangle(
              extent={{-100,20},{100,-20}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}), Text(
              extent={{-100,-10},{100,10}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%varName")}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.1), graphics),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
        end InputParameter;

        block OutputFinal "Save boolean value to file"
         extends Physiolibrary.Types.AbstractBoolean;

          replaceable package Utilities = Physiolibrary.Types.Utilities;

          Modelica.Blocks.Interfaces.BooleanInput
                                                y
        "Connector of Real output signal"
            annotation (Placement(transformation(extent={{-100,-10},{-80,10}},
                rotation=0), iconTransformation(extent={{-100,-10},{-80,10}})));

        equation
          when terminal() then
             Utilities.writeBoolean(varName,y);
          end when;

          annotation (
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.1), graphics={Rectangle(
              extent={{-100,20},{100,-20}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}), Text(
              extent={{-100,-10},{100,10}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%varName")}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.1), graphics),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
        end OutputFinal;

        block OutputComparison "Save variable comparison to file"
      import Physiolibrary;
          extends Physiolibrary.Types.AbstractBoolean(
                                                  k=Utilities.readBoolean(varName));
          replaceable package Utilities = Physiolibrary.Types.Utilities
           annotation (Dialog(group="Functions to read or store",tab="Types"));

          Modelica.Blocks.Interfaces.BooleanInput
                                y "Connector of Real input signal"
            annotation (Placement(transformation(extent={{-100,-10},{-80,10}},
                rotation=0), iconTransformation(extent={{-120,-10},{-100,10}})));

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
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.04), graphics),
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

      output Real value=0 "Actual value of parameter in SI units";
    //algorithm
    end readReal;

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
    //algorithm
    end writeReal;

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
    //algorithm
    end writeComparison;

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
  end Utilities;

  package ZeroUtilities "No input/output/test"
    import Physiolibrary;
    extends Physiolibrary.Types.Utilities;
    extends Modelica.Icons.VariantsPackage;

    redeclare function extends readReal
    algorithm
    end readReal;

    redeclare function extends readBoolean
    algorithm
    end readBoolean;

    redeclare function extends writeReal
    algorithm
    end writeReal;

    redeclare function extends writeBoolean
    algorithm
    end writeBoolean;

    redeclare function extends writeComparison
    algorithm
    end writeComparison;

    redeclare function extends writeBooleanComparison
    algorithm
    end writeBooleanComparison;

  end ZeroUtilities;

  package FilesUtilities "File input/output/test"
    import Physiolibrary;
    extends Physiolibrary.Types.Utilities;
    extends Modelica.Icons.VariantsPackage;

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
      fn:="io/input.txt";

      if not Files.exist(fn) then
         Streams.error("readRealParameter(\""+name+"\", \""+ fn + "\")  Error: the file does not exist.\n");
      else

      typeDef:=UnitDerivations.findUnit(storeUnit);

      //Format "<variableName>\n<value><unit>"
      (line, endOfFile) :=Streams.readLine(fn, iline);
      while not found and not endOfFile loop
           if line == name then
               // name found, get value of "name = value;"
               (line, endOfFile) :=Streams.readLine(fn, iline+1);
               lineLen := Strings.length(line);
               nextIndex:=1;

               /* 
  //Format "<variableName>=<value><unit>" 
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
            if Strings.length(Physiolibrary.Types.FilesUtilities.UnitDerivations.RealTypeDef[
                  typeDef].DisplayUnit)
                                      > 0 then
              Streams.error("No units detected for variable '" + name +
                "' in file '" + fn + "'. Expected unis are '" +Physiolibrary.Types.FilesUtilities.UnitDerivations.RealTypeDef[
                  typeDef].DisplayUnit
                                     + "'!\n");
                 end if;
               else
                 str :=Strings.substring(line, Strings.Advanced.skipWhiteSpace(line,nextIndex),  Strings.length(line));
            if str <>Physiolibrary.Types.FilesUtilities.UnitDerivations.RealTypeDef[
                  typeDef].DisplayUnit then
              Streams.error("Units '" + str + "' not expected for variable '"
                 + name + "' in file '" + fn + "'. Expected unis are '" +
                  Physiolibrary.Types.FilesUtilities.UnitDerivations.RealTypeDef[
                  typeDef].DisplayUnit
                                     + "'!\n");
                 end if;
               end if;
          value := inputValue*Physiolibrary.Types.FilesUtilities.UnitDerivations.RealTypeDef[
              typeDef].Scale
                           +Physiolibrary.Types.FilesUtilities.UnitDerivations.RealTypeDef[
              typeDef].Offset;
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

    redeclare function extends readBoolean

    algorithm
      value:=(readReal(name,"")>0.005);
    end readBoolean;

    redeclare function extends writeReal "Write the value to file"
      import Modelica.Utilities.*;

    protected
      String fn;
      Integer typeDef "Variable type";

    algorithm
      fn:="io/output.txt";

      if not Files.exist(fn) then
         if not Files.exist("io") then
             Files.createDirectory("io");
         end if;
      end if;

      typeDef:=UnitDerivations.findUnit(storeUnit);

    Streams.print(name + "\n" + String(((value -Physiolibrary.Types.FilesUtilities.UnitDerivations.RealTypeDef[
        typeDef].Offset)
                      /Physiolibrary.Types.FilesUtilities.UnitDerivations.RealTypeDef[
        typeDef].Scale))
                       + " " +Physiolibrary.Types.FilesUtilities.UnitDerivations.RealTypeDef[
        typeDef].DisplayUnit,
                            fn);

    end writeReal;

    redeclare function extends writeBoolean
      import Modelica.Utilities.*;
    protected
      String fn;

    algorithm
      fn:="io/output.txt";

      if not Files.exist(fn) then
         if not Files.exist("io") then
             Files.createDirectory("io");
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
      fn:="io/comparison.txt";

      if not Files.exist(fn) then
         if not Files.exist("output") then
             Files.createDirectory("output");
         end if;
      end if;

      typeDef:=UnitDerivations.findUnit(storeUnit);

    outputDefaultValue := ((defaultValue -Physiolibrary.Types.FilesUtilities.UnitDerivations.RealTypeDef[
        typeDef].Offset)
                      /Physiolibrary.Types.FilesUtilities.UnitDerivations.RealTypeDef[
        typeDef].Scale);
    outputInitialValue := ((initialValue -Physiolibrary.Types.FilesUtilities.UnitDerivations.RealTypeDef[
        typeDef].Offset)
                      /Physiolibrary.Types.FilesUtilities.UnitDerivations.RealTypeDef[
        typeDef].Scale);
    outputFinalValue := ((finalValue -Physiolibrary.Types.FilesUtilities.UnitDerivations.RealTypeDef[
        typeDef].Offset)
                      /Physiolibrary.Types.FilesUtilities.UnitDerivations.RealTypeDef[
        typeDef].Scale);

    Streams.print((if (abs(outputDefaultValue) > Modelica.Constants.eps) then
      String(abs((outputFinalValue - outputDefaultValue)/outputDefaultValue))
       else "Zero vs. " + String(outputFinalValue)) + " ; " + name +
      " : default=" + String(outputDefaultValue) + " " +Physiolibrary.Types.FilesUtilities.UnitDerivations.RealTypeDef[
        typeDef].DisplayUnit
                           + ", initial=" + String(outputInitialValue) + " " +
        Physiolibrary.Types.FilesUtilities.UnitDerivations.RealTypeDef[typeDef].DisplayUnit
       + ", final=" + String(outputFinalValue) + " " +Physiolibrary.Types.FilesUtilities.UnitDerivations.RealTypeDef[
        typeDef].DisplayUnit,
                            fn);

    end writeComparison;

    redeclare function extends writeBooleanComparison
      "Compare and write the result and the value to file"
      import Modelica.Utilities.*;

    protected
      String fn;
      Real outputInitialValue;
      Real outputFinalValue;
      Real outputDefaultValue;
    algorithm
      fn:="io/comparison.txt";

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

    package UnitDerivations

     function findUnit
       input String unitToFind "display unit to find in RealTypeDef";
       output Integer typeDef "index in RealTypeDef";
     algorithm
       typeDef:=0;
       for i in 1:size(RealTypeDef,1) loop
         if RealTypeDef[i].DisplayUnit == unitToFind then
           typeDef:=i;
           break;
         end if;
       end for;
       if typeDef==0 then
          Modelica.Utilities.Streams.error("Unit \"" + unitToFind + "\" not defined in FileUtilities.UnitDerivations.RealTypeRecord.\n");
       end if;
     end findUnit;

     record RealTypeRecord "The Real Type definition"
       parameter String Quantity="" "Quantity";
       parameter String Unit="1" "SI unit";
       parameter String DisplayUnit="1" "Display unit";

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
            Quantity="Energy",
            Unit="J",
            DisplayUnit="kcal",
            Scale=4186.8),RealTypeRecord(
            Quantity="Time",
            Unit="s",
            DisplayUnit="min",
            Scale=1/60),RealTypeRecord(
            Quantity="Mass",
            Unit="kg",
            Min=0,
            DisplayUnit="g",
            Scale=1e-3),RealTypeRecord(
            Quantity="MassFlowRate",
            Unit="kg/s",
            DisplayUnit="mg/min",
            Scale=(1e-6)*60),RealTypeRecord(
            Quantity="Density",
            Unit="kg/m3",
            Min=0,
            DisplayUnit="kg/l",
            Scale=1e3),RealTypeRecord(
            Quantity="Length",
            Unit="m",
            DisplayUnit="cm",
            Scale=1e-2),RealTypeRecord(
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
            Scale=(1e-6)*60),RealTypeRecord(
            Quantity="Concentration",
            Unit="mol/m3",
            DisplayUnit="mmol/l",
            Scale=1,
            Start=1),RealTypeRecord(
            Quantity="AmountOfSubstance",
            Unit="mol",
            DisplayUnit="mmol",
            Scale=1e-3),RealTypeRecord(
            Quantity="MolarFlowRate",
            Unit="mol/s",
            DisplayUnit="mmol/min",
            Scale=(1e-3)/60),RealTypeRecord(
            Quantity="Energy",
            Unit="J",
            DisplayUnit="kcal",
            Scale=4186.8),RealTypeRecord(
            Quantity="ThermodynamicTemperature",
            Unit="K",
            DisplayUnit="degC",
            Scale=1,
            Offset=273.15,
            Start=310.15),RealTypeRecord(
            Quantity="Power",
            Unit="W",
            DisplayUnit="kcal/min",
            Scale=4186.8*60),RealTypeRecord(
            Quantity="ThermalConductance",
            Unit="W/K",
            DisplayUnit="kcal/(min.degC)",
            Scale=4186.8*60),RealTypeRecord(
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
            DisplayUnit="mEq",
            Scale=(1e-3)*(9.64853399*10^4)),RealTypeRecord(
            Quantity="ElectricCurrent",
            Unit="A",
            DisplayUnit="mEq/min",
            Scale=(1e-3)*(9.64853399*10^4)*60),RealTypeRecord(
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
            Scale=(1e-3)*60),RealTypeRecord(
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
            Unit="mol",
            DisplayUnit="mOsm",
            Scale=(1e-3))}
        "All defined Real types - units, displayUnits, conversions, nominals";

    end UnitDerivations;
    annotation (Documentation(revisions="<html>
<p>Licensed by Marek Matejak under the Modelica License 2</p>
<p>Copyright &copy; 2008-2013, Marek Matejak, Charles University in Prague.</p>
<p><br/><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Physiolibrary.UsersGuide.ModelicaLicense2\">Physiolibrary.UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p>
</html>",   info="<html>
<p>During the creation and debugging of huge integrated models it is necessary to easily define consistent input, output and test sets of all output variables for some subsystems. Let&apos;s imagine that we have a model composed only of subsystems that converge from some constant inputs to constant outputs. It should be possible to substitute each main subsystem for its chosen constant output values as parameters. Comparing the model with these parametric values and the original subsystem can show the wrong part of the simulation. </p>
<p>For example in the huge HumMod model it is necessary to debug smaller parts separately. These tools could be use, because HumMod is the type of constant-converged model. Each subsystem in the first level has the constant input values set for its output variables. Simulating, for example, the cardiovascular subsystem is possible by creating the high-level system with the original cardiovascular subsystem, but with a constant metabolic, constant thermoregulation, constant hormonal, constant water, constant proteins, constant gases, constant electrolytes and constant status subsystem. </p>
<p>Because the number of output variables for each subsytem changes during development, it is a good idea to have only one list for each subsystem. And generating consistent sets to store, restore, compare initial and final values is possible by the same pattern as presented in the package Types.Example. In this package it is also possible to define a customized &nbsp;way to save and load the variables that connect subsystems together. For this purpose, one has to redeclare the package Types.Utilities with simple functions for reading and writing values, such as is done in the default package FileUtilities. </p>
</html>"));
  end FilesUtilities;

  type SimulationType = enumeration(
      NoInit "Use start values only as a guess of state values",
      NormalInit "Initialization by start values",
      ReadInit "Initialization by function Utilities.readReal('state name')",
      InitSteadyState
        "Initialization in Steady State (initial derivations are zeros)",
      SteadyState "Steady State = Derivations are zeros during simulation")
    "Initialization or Steady state options (to determine model type before simulating)"
      annotation (Evaluate=true, Diagram(coordinateSystem(preserveAspectRatio=
           false, extent={{-100,-100},{100,100}}), graphics));
  annotation (Documentation(revisions="<html>
<p>Licensed by Marek Matejak under the Modelica License 2</p>
<p>Copyright &copy; 2008-2014, Marek Matejak, Charles University in Prague.</p>
<p><br><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Physiolibrary.UsersGuide.ModelicaLicense2\">Physiolibrary.UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p>
</html>", info="<html>
<p>The main problem of medical research, articles, and experiments is using obscure units from medicine, pharmacology, biology and non-physics disciplines. The Physiolibrary fulfills the Modelica ideal of using SI units as the main unit for each variable, and the previously described physiological units are also implemented as the displayUnits for each variable. Using these displayUnits the user sets and sees the &QUOT;physiological&QUOT; values. The implementation can also be joined to any unit-correct Modelica models and physical equations without crashing due to unit incompatibilities. The unit support of Physiolibrary is so strong that you even can chose the right unit-typed &ldquo;input real&rdquo;/&rdquo;output real&rdquo; from the library package Types.RealIO. As can be expected, only the non-specific packages States and Blocks in the Physiolibrary have variables without units.</p>
</html>"));
end Types;

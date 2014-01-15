within Physiolibrary;
package Types "Physiological units with nominals"
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
      parameter SpecificEnergy specificEnergy;

      parameter Fraction fraction;
      parameter OsmoticPermeability osmoticPermeability;
      parameter DiffusionPermeability diffusionPermeability;
      parameter HydraulicConductance hydraulicConductance;
      parameter HydraulicInertance hydraulicInertance;
      parameter GasSolubility gasSolubility;
     end ParametricClass;

      ParametricClass parametricClass(
        temperature=274.15,
        heat=4186.8,
        pressure=133.322387415,
        volume=1e-06,
        amountOfSubstance=0.001,
        electricCharge=96.4853399,
        electricCurrent=1.6080889983333,
        time_=60,
        energy=4186.8,
        mass=0.001,
        electricalPotential=0.001,
        massFlowRate=1.6666666666667e-08,
        density=1000,
        height=0.01,
        acceleration=1,
        volumeFlowRate=1.6666666666667e-08,
        concentration=1,
        osmolarity=1,
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
        gasSolubility=0.0075006157584566)
        annotation (Placement(transformation(extent={{-14,8},{6,28}})));
      annotation (Documentation(info="<html>
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
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics), Icon(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
    end ParameterSet;

    model InputParameterSet
    extends Modelica.Icons.Example;
    extends ParameterSet( T(redeclare block Variable =
              RealExtension.InputParameter (                                       redeclare
                package Utilities = Physiolibrary.Types.Utilities)));

    end InputParameterSet;

    model OutputFinalSet
    extends Modelica.Icons.Example;
    extends ParameterSet( T(redeclare block Variable =
            RealExtension.OutputFinal (
              redeclare package Utilities = Physiolibrary.Types.Utilities)));
    end OutputFinalSet;

    model OutputComparisonSet
    extends Modelica.Icons.Example;
    extends ParameterSet( T(redeclare block Variable =
              RealExtension.OutputComparison (
              redeclare package Utilities = Physiolibrary.Types.Utilities)));
    end OutputComparisonSet;
  end Examples;

  package Constants
    extends Modelica.Icons.Package;

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
    annotation (defaultComponentName="amountofsubstance",
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
    annotation (defaultComponentName="diffusionpermeability",
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
    annotation (defaultComponentName="electriccharge",
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
    annotation (defaultComponentName="electriccurrent",
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
    annotation (defaultComponentName="electricpotential",
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
    annotation (defaultComponentName="gassolubility",
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
    annotation (defaultComponentName="heatflowrate",
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

  block HydraulicConductanceConst
      "Constant signal of type HydraulicConductance"
   parameter Types.HydraulicConductance k
        "Constant HydraulicConductance output value";
        RealIO.HydraulicConductanceOutput y "HydraulicConductance constant"
      annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                  iconTransformation(extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="hydraulicconductance",
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

  block HydraulicComplianceConst "Constant signal of type HydraulicCompliance"
   parameter Types.HydraulicCompliance k
        "Constant HydraulicCompliance output value";
        RealIO.HydraulicComplianceOutput y "HydraulicCompliance constant"
      annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                  iconTransformation(extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="hydrauliccompliance",
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

  block HydraulicInertanceConst "Constant signal of type HydraulicInertance"
   parameter Types.HydraulicInertance k
        "Constant HydraulicInertance output value";
        RealIO.HydraulicInertanceOutput y "HydraulicInertance constant"
      annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                  iconTransformation(extent={{40,-10},{60,10}})));
  equation
        y=k;
    annotation (defaultComponentName="hydraulicinertance",
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
    annotation (defaultComponentName="massflowrate",
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
    annotation (defaultComponentName="molarflowrate",
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
    annotation (defaultComponentName="osmoticpermeability",
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
    annotation (defaultComponentName="specificenergy",
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
    annotation (defaultComponentName="specificheatcapacity",
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
    annotation (defaultComponentName="thermalconductance",
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
    annotation (defaultComponentName="volumeflowrate",
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

  type Osmolarity = Modelica.SIunits.Concentration (displayUnit="mOsm/l", nominal=1);

  type Heat = Modelica.SIunits.Heat(displayUnit="kcal", nominal=4186800); //needed to heat 1 liter of water by 1 degC
  type Temperature = Modelica.SIunits.Temperature(displayUnit="degC", nominal=1);
  type HeatFlowRate = Modelica.SIunits.HeatFlowRate(displayUnit="kcal/min", nominal=4186.8/60);
  type ThermalConductance = Modelica.SIunits.ThermalConductance(displayUnit="kcal/(min.K)", nominal=4186.8/60);
  type SpecificHeatCapacity = Modelica.SIunits.SpecificHeatCapacity(displayUnit="kcal/(kg.K)", nominal=4186.8);
  type SpecificEnergy = Modelica.SIunits.SpecificEnergy(displayUnit="kcal/kg", nominal=4186.8)
    "vaporization, ..";

  type ElectricPotential = Modelica.SIunits.ElectricPotential(displayUnit="mV", nominal=1e-3);
  type ElectricCharge = Modelica.SIunits.ElectricCharge(displayUnit="mEq", nominal=96.4853365);
  type ElectricCurrent = Modelica.SIunits.ElectricCurrent(displayUnit="mEq/min", nominal=1.60808894);

//unknown units in Standard Modelica Library 3.2
  type Fraction = Real(final quantity="Fraction",final unit="1", displayUnit="%", nominal=1e-2);

  type OsmoticPermeability = Real(final quantity="OsmoticPermeability",final unit="m3/(Pa.s)", displayUnit="ml/(mmHg.min)", nominal=(1e-6)/((133.322387415)*60));
  type DiffusionPermeability = Real(final quantity="DiffusionPermeability", final unit="m3/s", displayUnit="ml/min", nominal=(1e-6)/60);

  type HydraulicConductance = Real(final quantity="HydraulicConductance",final unit="m3/(Pa.s)", displayUnit="ml/(mmHg.min)", nominal=(1e-6)/((133.322387415)*60));
  type HydraulicCompliance =  Real(final quantity="HydraulicCompliance",final unit="m3/Pa", displayUnit="ml/mmHg", nominal=(1e-6)/(133.322387415));
  type HydraulicInertance =  Real(final quantity="HydraulicInertance",final unit="Pa.s2/m3", displayUnit="mmHg.min2/ml", nominal=((133.322387415)*(60^2)/(1e-6)));

  type GasSolubility = Real(final quantity="GasSolubility", final unit="mol/(m3.Pa)", displayUnit="mmol/(l.mmHg)", nominal=(1e-3)/((1e-3)*(133.322387415)))
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
          replaceable package Utilities = Physiolibrary.FilesUtilities
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
          replaceable package Utilities = Physiolibrary.FilesUtilities
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
          replaceable package Utilities = Physiolibrary.FilesUtilities
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

  package Utilities
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
  annotation (Documentation(revisions="<html>
<p>Licensed by Marek Matejak under the Modelica License 2</p>
<p>Copyright &copy; 2008-2013, Marek Matejak, Charles University in Prague.</p>
<p><br/><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Physiolibrary.UsersGuide.ModelicaLicense2\">Physiolibrary.UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p>
</html>", info="<html>
<p>The main problem of medical research, articles, and experiments is using obscure units from medicine, pharmacology, biology and non-physics disciplines. The Physiolibrary fulfills the Modelica ideal of using SI units as the main unit for each variable, and the previously described physiological units are also implemented as the displayUnits for each variable. Using these displayUnits the user sets and sees the &QUOT;physiological&QUOT; values. The implementation can also be joined to any unit-correct Modelica models and physical equations without crashing due to unit incompatibilities. The unit support of Physiolibrary is so strong that you even can chose the right unit-typed &ldquo;input real&rdquo;/&rdquo;output real&rdquo; from the library package Types.RealIO. As can be expected, only the non-specific packages States and Blocks in the Physiolibrary have variables without units.</p>
</html>"));
end Types;

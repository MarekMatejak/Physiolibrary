within Physiolibrary;
package Organs "Prototypes of human physiological organ models"
  package Heart "Heart Components"

    model Heart
       extends Physiolibrary.Icons.Heart;
       import Physiolibrary.Types.*;

       replaceable package Blood = Physiolibrary.Media.Blood                    constrainedby
        Physiolibrary.Media.Interfaces.PartialMedium                                                                                       "Blood medium model" annotation ( choicesAllMatching = true);

        parameter Types.HydraulicConductance RightCoronaryLarge(displayUnit=
            "ml/(mmHg.min)")=1.2501026264094e-09           "Conductance of lagre coronary vessels" annotation(Dialog(tab="Right heart",group="Coronary blood suply"));
        parameter Types.HydraulicConductance RightCoronarySmall(displayUnit=
            "ml/(mmHg.min)")=6.2505131320471e-11           "Conductance of small coronary vessels" annotation(Dialog(tab="Right heart",group="Coronary blood suply"));
        parameter Types.HydraulicConductance LeftCoronaryLarge(displayUnit=
            "ml/(mmHg.min)")=5.0004105056377e-09           "Conductance of lagre coronary vessels" annotation(Dialog(tab="Left heart", group="Coronary blood suply"));
        parameter Types.HydraulicConductance LeftCoronarySmall(displayUnit=
            "ml/(mmHg.min)")=3.1252565660236e-10           "Conductance of small coronary vessels" annotation(Dialog(tab="Left heart", group="Coronary blood suply"));

        parameter Volume RightAtriumBlood_initial=5.16454e-05 "Initial blood volume in right atrium" annotation(Dialog(tab="Right heart", group="Atrium"));
        parameter HydraulicCompliance RightAtriumCompliance=9.3757696980707e-08 "Mean compliance of right atrium" annotation(Dialog(tab="Right heart", group="Atrium"));
        parameter Volume RightVentricle_initial=8.75e-05 "Initial blood volume in right ventricle" annotation(Dialog(tab="Right heart", group="Ventricle"));
        parameter HydraulicCompliance RightVentricleBasicCompliance=
          2.1901798014693e-07                                                           "Basic compliance od right ventricle" annotation(Dialog(tab="Right heart", group="Ventricle"));

        parameter Volume LeftAtriumBlood_initial=5.05035e-05 "Initial blood volume in left atrium" annotation(Dialog(tab="Left heart", group="Atrium"));
        parameter HydraulicCompliance LeftAtriumCompliance=4.6878848490354e-08 "Mean compliance of left atrium" annotation(Dialog(tab="Left heart", group="Atrium"));
        parameter Volume LeftVentricle_initial=8.75e-05 "Initial blood volume in left ventricle" annotation(Dialog(tab="Left heart", group="Ventricle"));
        parameter HydraulicCompliance LeftVentricleBasicCompliance=
          1.0950899007347e-07                                                          "Basic compliance od left ventricle" annotation(Dialog(tab="Left heart", group="Ventricle"));

        parameter Frequency BaseHeartRate=1.3666666666667
                                          "Base heart rate" annotation(Dialog(group="Sinoatrial node"));
        parameter Real SA_SympatheticRateIncrease[:,3]={{0.0,0,0},{1.0,10,10},{5.0,120,0}} "Heart rate increase on sympathetic neural activity" annotation(Dialog(group="Sinoatrial node"));
        parameter Real SA_ParasympatheticRateIncrease[:,3]={{ 0.0,    0,  0}, { 2.0,  -20,  -8}, { 8.0,  -40,  0}} "Heart rate increase on parasympathetic neural activity" annotation(Dialog(group="Sinoatrial node"));

        parameter Real AdaptationOnNA[:,3]={{-4.0,0.0,0},{0.0,1.0,0.3},{12.0,4.0,0}} "Neural activity effect based on mean atrial pressure change" annotation(Dialog(group="Baroreceptors"));
        parameter Pressure AdaptivePressure(displayUnit="mmHg")=799.93432449   "Initial value of adapted mean atrial pressure" annotation(Dialog(group="Baroreceptors"));
        parameter Time AdaptationTau(displayUnit="d")=2592000   "Delay coefficient of baroreceptors adaptation" annotation(Dialog(group="Baroreceptors"));

        parameter Physiolibrary.Types.Pressure NormalPericardiumPressure=-446
        "Typical value of pericardium cavity pressure (relative to environment ambient pressure)";

        parameter Physiolibrary.Types.Volume RV_NormalEndDiastolicVolume=0.000125
      "Typical value of blood volume in ventricle after filling"
        annotation (Dialog(tab="Right heart", group="Diastole"));
        parameter Physiolibrary.Types.Pressure RV_NormalFillingPressure=
          95.9921189388
      "Typical value of filling pressure relative to pericardium pressure"
        annotation (Dialog(tab="Right heart", group="Diastole"));                   //(0.00051*101325/760)*(RV_NormalEndDiastolicVolume^(1/RV_n_Diastole))
        parameter Physiolibrary.Types.Fraction RV_stiffnes=1
      "Relative stiffnes (1 if normal)"
        annotation (Dialog(tab="Right heart", group="Diastole"));
        parameter Physiolibrary.Types.Fraction RV_n_Diastole(displayUnit="1")=2
      "Exponent of P-V characteristic of EDV curve on filling pressure"
        annotation (Dialog(tab="Right heart", group="Diastole"));
        parameter Physiolibrary.Types.Pressure RV_NormalSystolicPressure=
          1666.5298426875
      "Typical value of systolic pressure relative to pericardium pressure"
        annotation (Dialog(tab="Right heart",group="Systole"));
        parameter Physiolibrary.Types.Volume RV_NormalEndSystolicVolume=5.122e-05
      "Typical value of blood volume in ventricle after ejection"
        annotation (Dialog(tab="Right heart",group="Systole"));                //(RV_NormalSystolicPressure/(17.39*101325/760))^(RV_n_Systole)
        parameter Physiolibrary.Types.Pressure RV_additionalPressure_Systolic=
          1199.901486735
      "Pressure difference between mean and systolic pressure"
        annotation (Dialog(tab="Right heart",group="Systole"));     //= 24
        parameter Physiolibrary.Types.Fraction RV_contractilityBasic=1
      "Relative contractility (1 if normal)"
         annotation (Dialog(tab="Right heart",group="Systole"));       //= 1
        parameter Physiolibrary.Types.Fraction RV_n_Systole(displayUnit="1")=
        0.5
      "Exponent of P-V characteristic of ESV curve on systolic pressure"
        annotation (Dialog(tab="Right heart",group="Systole"));
        parameter Physiolibrary.Types.Frequency RV_K=1
        "time adaptation coeficient of average ventricle blood volume"
        annotation (Dialog(tab="Right heart", group="Ventricle"));

          parameter Physiolibrary.Types.Volume LV_NormalEndDiastolicVolume=0.000125
      "Typical value of blood volume in ventricle after filling"
        annotation (Dialog(tab="Left heart", group="Diastole"));
        parameter Physiolibrary.Types.Pressure LV_NormalFillingPressure=
          615.9494298573
      "Typical value of filling pressure relative to pericardium pressure"
        annotation (Dialog(tab="Left heart", group="Diastole"));                   //(0.00051*101325/760)*(LV_NormalEndDiastolicVolume^(1/LV_n_Diastole))
        parameter Physiolibrary.Types.Fraction LV_stiffnes=1
      "Relative stiffnes (1 if normal)"
        annotation (Dialog(tab="Left heart", group="Diastole"));
        parameter Physiolibrary.Types.Fraction LV_n_Diastole(displayUnit="1")=2
      "Exponent of P-V characteristic of EDV curve on filling pressure"
        annotation (Dialog(tab="Left heart", group="Diastole"));
        parameter Physiolibrary.Types.Pressure LV_NormalSystolicPressure=
          12665.626804425
      "Typical value of systolic pressure relative to pericardium pressure"
        annotation (Dialog(tab="Left heart",group="Systole"));
        parameter Physiolibrary.Types.Volume LV_NormalEndSystolicVolume=5.087e-05
      "Typical value of blood volume in ventricle after ejection"
        annotation (Dialog(tab="Left heart",group="Systole"));                //(LV_NormalSystolicPressure/(17.39*101325/760))^(LV_n_Systole)
        parameter Physiolibrary.Types.Pressure LV_additionalPressure_Systolic=
          3199.73729796
      "Pressure difference between mean and systolic pressure"
        annotation (Dialog(tab="Left heart",group="Systole"));     //= 24
        parameter Physiolibrary.Types.Fraction LV_contractilityBasic=1
      "Relative contractility (1 if normal)"
         annotation (Dialog(tab="Left heart",group="Systole"));       //= 1
        parameter Physiolibrary.Types.Fraction LV_n_Systole(displayUnit="1")=
        0.5
      "Exponent of P-V characteristic of ESV curve on systolic pressure"
        annotation (Dialog(tab="Left heart",group="Systole"));
        parameter Physiolibrary.Types.Frequency LV_K=0.016666666666667
        "time adaptation coeficient of average ventricle blood volume"
        annotation (Dialog(tab="Left heart", group="Ventricle"));

     //
    //
    //    Abasic_Diastole=0.00026,
    //    Abasic_Systole=3.53,
    //    MaxContractionCompliance(displayUnit="ml/mmHg") = 1.5001231516913e-08,
    //    Cond1=60000000,
    //    Cond2=60000000,
     //
     //
     //   MaxContractionCompliance(displayUnit="ml/mmHg") = 3.0002463033826e-09,
       // Abasic_Diastole=0.00051,
    //    Cond1(displayUnit="ml/(mmHg.min)") = 0.0075006157584566,
    //    Cond2(displayUnit="ml/(mmHg.min)") = 0.0075006157584566,
    Physiolibrary.Fluid.Interfaces.FluidPort_a rightAtrium(redeclare package Medium =
            Blood)
      "blood inflow to right atrium" annotation (Placement(transformation(
            extent={{-102,58},{-82,78}}),  iconTransformation(extent={{-90,50},
                {-70,70}})));
    Physiolibrary.Fluid.Interfaces.FluidPort_b rightVentricle(redeclare package
          Medium = Blood) "blood outflow to pulmonary circulation" annotation (
          Placement(transformation(extent={{-26,72},{-6,92}}),
            iconTransformation(extent={{-90,-70},{-70,-50}})));
    Physiolibrary.Fluid.Interfaces.FluidPort_b leftVentricle(redeclare package
          Medium = Blood) "blood outflow to aorta" annotation (Placement(
            transformation(extent={{8,72},{28,92}}), iconTransformation(extent=
                {{70,-70},{90,-50}})));
    Physiolibrary.Fluid.Interfaces.FluidPort_a leftAtrium(redeclare package Medium =
            Blood)
      "blood inflow to left atrium" annotation (Placement(transformation(
            extent={{84,60},{104,80}}), iconTransformation(extent={{68,48},{88,
                68}})));
      Components.SA_Node SA_node(
        BaseHeartRate=BaseHeartRate,
        SympatheticEffect=SA_SympatheticRateIncrease,
        ParasympatheticEffect=SA_ParasympatheticRateIncrease)
        annotation (Placement(transformation(extent={{62,-62},{42,-42}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasure(redeclare package
          Medium = Blood)
      annotation (Placement(transformation(extent={{-92,-74},{-72,-54}})));
      Components.BaroReceptors lowPressureReceptors(
        PressureChangeOnNA=AdaptationOnNA,
        AdaptivePressure(displayUnit="mmHg") = AdaptivePressure,
        Tau(displayUnit="d") = AdaptationTau) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}}, origin={-38,-74})));
      inner Modelica.Fluid.System system(T_ambient=310.15)            "Human body system setting" annotation (
        Placement(transformation(extent={{70,-92},{90,-72}})));
      Fluid.Components.ElasticVessel RightAtrium(
        redeclare package Medium = Blood,
        massFractions_start=Blood.VenousDefault,
        stateName="RightAtrium.Vol",
        useExternalPressureInput=true,
        useV0Input=false,
        useComplianceInput=false,
        volume_start=RightAtriumBlood_initial,
        Compliance=RightAtriumCompliance,
        nPorts=3) "Heart atrium"
        annotation (Placement(transformation(extent={{-79,57},{-59,77}})));
      Components.Ventricle RightVentricle(
        redeclare package Medium = Blood,
        massFractions_start=Blood.VenousDefault,
        NormalExternalPressure=NormalPericardiumPressure,
        stateName="RightVentricle.Vol",
        n_Diastole=RV_n_Diastole,
        n_Systole=RV_n_Systole,
        BasicCompliance(displayUnit="ml/mmHg") = RightVentricleBasicCompliance,
        additionalPressure_Systolic(displayUnit="mmHg")=
          RV_additionalPressure_Systolic,
        initialVol=RightVentricle_initial,
        NormalEndDiastolicVolume=RV_NormalEndDiastolicVolume,
        NormalFillingPressure=RV_NormalFillingPressure,
        stiffnes=RV_stiffnes,
        NormalSystolicPressure=RV_NormalSystolicPressure,
        NormalEndSystolicVolume=RV_NormalEndSystolicVolume,
        contractilityBasic=RV_contractilityBasic,
        K=RV_K,
        AmbientPressure=system.p_ambient)
        annotation (Placement(transformation(extent={{-14,34},{-54,74}})));

      Components.Tissue rightTissue(
        redeclare package Blood = Blood,
        BasicLargeVeselsConductance=RightCoronaryLarge,
        BasicSmallVeselsConductance=RightCoronarySmall)
        annotation (Placement(transformation(extent={{-72,-2},{-52,18}})));
    Fluid.Sensors.PressureMeasure leftAtriumTMP(redeclare package Medium =
            Blood)
        annotation (Placement(transformation(extent={{-80,-88},{-60,-68}})));
      Components.Ventricle LeftVentricle(
        redeclare package Medium = Blood,
        massFractions_start=Blood.ArterialDefault,
        NormalExternalPressure=NormalPericardiumPressure,
        stateName="LeftVentricle.Vol",
        n_Diastole=LV_n_Diastole,
        n_Systole=LV_n_Systole,
        BasicCompliance(displayUnit="ml/mmHg") = LeftVentricleBasicCompliance,
        additionalPressure_Systolic(displayUnit="mmHg")=
          LV_additionalPressure_Systolic,
        initialVol=LeftVentricle_initial,
        NormalEndDiastolicVolume=LV_NormalEndDiastolicVolume,
        NormalFillingPressure=LV_NormalFillingPressure,
        stiffnes=LV_stiffnes,
        NormalSystolicPressure=LV_NormalSystolicPressure,
        NormalEndSystolicVolume=LV_NormalEndSystolicVolume,
        contractilityBasic=LV_contractilityBasic,
        K=LV_K,
        AmbientPressure=system.p_ambient)
        annotation (Placement(transformation(extent={{20,34},{60,74}})));
      Fluid.Components.ElasticVessel LeftAtrium(
        redeclare package Medium = Blood,
        massFractions_start=Blood.ArterialDefault,
        stateName="LeftAtrium.Vol",
        useExternalPressureInput=true,
        useV0Input=false,
        useComplianceInput=false,
        volume_start=LeftAtriumBlood_initial,
        Compliance=LeftAtriumCompliance,
        nPorts=3) "Heart atrium"
        annotation (Placement(transformation(extent={{59,63},{79,83}})));
      Components.Tissue leftTissue(
        redeclare package Blood = Blood,
        BasicLargeVeselsConductance=LeftCoronaryLarge,
        BasicSmallVeselsConductance=LeftCoronarySmall)
        annotation (Placement(transformation(extent={{70,-4},{50,16}})));
      Physiolibrary.Organs.Components.BetaReceptors betaReceptors(redeclare package
          Blood =         Blood,                                  useBase=false)
        annotation (Placement(transformation(extent={{86,-54},{66,-34}})));
      Types.RealIO.PressureInput Pericardium "pericardium pressure" annotation (
         Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={40,100}),iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={40,100})));
      Types.RealIO.FrequencyInput Sympathicus "Ganglia general neural activity"
        annotation (Placement(transformation(extent={{-18,10},{2,30}}),
            iconTransformation(extent={{-18,10},{2,30}})));
      Types.RealIO.FrequencyInput Parasympathicus "Vagus neural activity"
        annotation (Placement(transformation(extent={{2,-74},{22,-54}}),
            iconTransformation(extent={{-72,-30},{-52,-10}})));
      Types.RealIO.FractionOutput AtrialLowPressureReceptors annotation (
          Placement(transformation(
            extent={{-9,-9},{9,9}},
            rotation=0,
            origin={11,-87}),iconTransformation(
            extent={{-9,-9},{9,9}},
            rotation=0,
            origin={11,-87})));
    equation
    //  rightHeart.atriumBlood = sum3.u[1];
    //  leftHeart.atriumBlood = sum2.u[1];
      connect(leftVentricle, leftVentricle) annotation (Line(
          points={{18,82},{18,82}},
          color={127,0,0},
          thickness=0.5));
      connect(pressureMeasure.port, rightAtrium) annotation (Line(
          points={{-82,-74},{-92,-74},{-92,68}},
          color={127,0,0},
          thickness=0.5));
      connect(pressureMeasure.pressure, lowPressureReceptors.pericardiumPressure)
        annotation (Line(points={{-76,-68},{-47.8,-68}},
                                                       color={0,0,127}));
      connect(RightVentricle.port_a, RightAtrium.q_in[1]) annotation (Line(
          points={{-38,70},{-38,80},{-68,80},{-68,66.1333},{-69.1,66.1333}},
          color={127,0,0},
          thickness=0.5));
      connect(rightAtrium, RightAtrium.q_in[2]) annotation (Line(
          points={{-92,68},{-69.1,68},{-69.1,67}},
          color={127,0,0},
          thickness=0.5));
      connect(RightVentricle.port_b, rightVentricle) annotation (Line(
          points={{-30,74},{-30,82},{-16,82}},
          color={127,0,0},
          thickness=0.5));
      connect(RightVentricle.MotionPower, rightTissue.motionPower) annotation (
          Line(points={{-46,54},{-46,22},{-69,22},{-69,17}},       color={0,0,
              127}));
      connect(rightTissue.port_b, RightAtrium.q_in[3]) annotation (Line(
          points={{-77.8,8},{-76,8},{-76,52},{-80,52},{-80,80},{-69.1,80},{
              -69.1,67.8667}},
          color={127,0,0},
          thickness=0.5));

      connect(leftAtriumTMP.pressure, lowPressureReceptors.leftAtriumPressure)
        annotation (Line(points={{-64,-82},{-64,-80},{-48,-80}},
                                                              color={0,0,127}));
      connect(leftAtriumTMP.port, leftAtrium) annotation (Line(
          points={{-70,-88},{-70,-94},{94,-94},{94,70}},
          color={127,0,0},
          thickness=0.5));
      connect(leftVentricle, rightTissue.port_a) annotation (Line(
          points={{18,82},{18,6},{-42,6},{-42,8},{-46,8}},
          color={127,0,0},
          thickness=0.5));
      connect(leftAtrium, LeftAtrium.q_in[1]) annotation (Line(
          points={{94,70},{94,72.1333},{68.9,72.1333}},
          color={127,0,0},
          thickness=0.5));
      connect(LeftAtrium.q_in[2], LeftVentricle.port_a) annotation (Line(
          points={{68.9,73},{68.9,72},{44,72},{44,70}},
          color={127,0,0},
          thickness=0.5));
      connect(LeftVentricle.port_b, leftVentricle) annotation (Line(
          points={{36,74},{34,74},{34,82},{18,82}},
          color={127,0,0},
          thickness=0.5));
      connect(leftTissue.port_a, leftVentricle) annotation (Line(
          points={{44,6},{18,6},{18,82}},
          color={127,0,0},
          thickness=0.5));
      connect(leftTissue.port_b, rightAtrium) annotation (Line(
          points={{75.8,6},{84,6},{84,-12},{-92,-12},{-92,68}},
          color={127,0,0},
          thickness=0.5));
      connect(LeftVentricle.MotionPower, leftTissue.motionPower) annotation (
          Line(points={{52,54},{64,54},{64,15},{67,15}},       color={0,0,127}));
      connect(betaReceptors.port_a, LeftAtrium.q_in[3]) annotation (Line(
          points={{86,-46},{92,-46},{92,56},{82,56},{82,73.8667},{68.9,73.8667}},
          color={127,0,0},
          thickness=0.5));
      connect(betaReceptors.y, SA_node.BetaReceptorsEffect)
        annotation (Line(points={{76,-51},{76,-54},{62,-54}}, color={0,0,127}));
      connect(SA_node.Rate, RightVentricle.HeartRate) annotation (Line(points={{42.2,
              -52},{44,-52},{44,36},{-38.4,36},{-38.4,40}},   color={0,0,127}));
      connect(SA_node.Rate, LeftVentricle.HeartRate) annotation (Line(points={{42.2,
              -52},{44.4,-52},{44.4,40}},  color={0,0,127}));
      connect(Pericardium, RightAtrium.externalPressure)
        annotation (Line(points={{40,100},{-62,100},{-62,76}},
                                                             color={0,0,127}));
      connect(Pericardium, LeftAtrium.externalPressure)
        annotation (Line(points={{40,100},{76,100},{76,82}},
                                                           color={0,0,127}));
      connect(RightVentricle.Pericardium, Pericardium) annotation (Line(points={{-27,54},
              {2,54},{2,100},{40,100}},           color={0,0,127}));
      connect(LeftVentricle.Pericardium, Pericardium) annotation (Line(points={{33,54},
              {2,54},{2,100},{40,100}},         color={0,0,127}));
      connect(Sympathicus, LeftVentricle.GangliaGeneral) annotation (Line(
            points={{-8,20},{-8,46.2},{32.8,46.2}},    color={0,0,127}));
      connect(Sympathicus, RightVentricle.GangliaGeneral) annotation (Line(
            points={{-8,20},{-8,46.2},{-26.8,46.2}},    color={0,0,127}));
      connect(Sympathicus, betaReceptors.GangliaGeneral) annotation (Line(
            points={{-8,20},{90,20},{90,-50},{85.8,-50}},  color={0,0,127}));
      connect(Pericardium, lowPressureReceptors.rightAtriumPressure)
        annotation (Line(points={{40,100},{-100,100},{-100,-74},{-48,-74}},
                                                                          color=
             {0,0,127}));
      connect(Sympathicus, leftTissue.Ganglia)
        annotation (Line(points={{-8,20},{56,20},{56,11}},  color={0,0,127}));
      connect(Sympathicus, rightTissue.Ganglia) annotation (Line(points={{-8,20},
              {-58,20},{-58,13}},     color={0,0,127}));
      connect(Parasympathicus, SA_node.VagusNerve_NA_Hz) annotation (Line(
            points={{12,-64},{38,-64},{38,-66},{68,-66},{68,-58},{62,-58}},
            color={0,0,127}));
      connect(lowPressureReceptors.NA, AtrialLowPressureReceptors) annotation (
          Line(points={{-28,-74},{11,-74},{11,-87}},      color={0,0,127}));
      annotation ( Icon(coordinateSystem(
              preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
            graphics={                Text(
              extent={{-154,-82},{166,-110}},
              lineColor={162,29,33},
              textString="%name")}),
        Documentation(info="<html>
<p>Calculates hearth pumping (left and right atria and ventricles, as wel as coronary circulation). By pressure-flow connectors communicate with pulmonary and systemic circulation.</p>
<p>Blood volume (and pressure) distributions between </p>
<ul>
<li>right/left atrium and</li>
<li>right/left ventricle.</li>
</ul>
<p>Generate average blood flow throught ventricles.</p>
<p>On the contrary of Tom Coleman models: coronary circulation outflows to right atrium, average blood volume in the hearth are calculated more simple (with the same results in steady state).</p>
<p><h4></p><p>New heart energy balance</h4></p>
<p><br>left: 1.41 W(const BasalCals), HR*P*V 1.4 W </p>
<p>right: 0.21 W (const BasalCals), HR*P*V 0.19 W </p>
<p><br>Effeciency by</p>
<p>https://www.ahajournals.org/doi/10.1161/CIRCULATIONAHA.106.660639</p>
<p>is 25&percnt; (basal metabolism included).</p>
<p><br>Optimal values:</p>
<p>Left heart:</p>
<p>90mmHg= 12000Pa</p>
<p>75ml = 0.000075m3</p>
<p>75bpm = 1.25Hz</p>
<p>= 1.125 W (mechanical work)</p>
<p>4.5 W (total energy for 25&percnt; effeciency with basal metabolism)</p>
<p>1.41 W (basal metabolism)</p>
<p>36&percnt; motion effeciency without basal metabolism (new parameter for heart)</p>
<p><br>Right heart:</p>
<p>12.4mmHg=1653Pa</p>
<p>75ml= 0.000075m3</p>
<p>75bpm=1.25Hz</p>
<p>= 0.155 W (mechanical work)</p>
<p>/0.25 = 0.62 W (total energy for 25&percnt; effeciency with basal metabolism)</p>
<p>0.21 W (basal metabolism)</p>
<p>38&percnt; motion effeciency without basal metabolism (new parameter for heart)</p>
<p><br><b>Old estimation of heart energy balance</b></p>
<p><br>left: 1.67 W (const MotionCals) , 6.07 W (const HeatCals), 1.41 W(const BasalCals) = 7.74 W + 1.41 W = 9.15 W</p>
<p>right: 0.35 W (const MotionCals) , 1.19 W (const HeatCals), 0.21 W (const BasalCals) = 1.54 W + 0.21 W</p>
</html>",
        revisions="<html>

<table cellspacing=\"2\" cellpadding=\"0\" border=\"0\"><tr>
<td><p>Author:</p></td>
<td><p>Marek Matejak</p></td>
</tr>
<tr>
<td><p>Design:</p></td>
<td><p>Zuzana Rubaninska</p></td>
</tr>
<tr>
<td><p>License:</p></td>
<td><p><a href=\"http://www.physiomodel.org/license.html\">Physiomodel License 1.0</a> </p></td>
</tr>

<tr>
<td><p>Date of:</p></td>
<td><p>january 2009, August 2010</p></td>
</tr>
<tr>
<td><p>References:</p></td>
<td><p>Tom Coleman: QHP 2008 beta 3,, Physiomodel 2010, University of Mississippi Medical Center</p></td>
</tr>
</table>
<br/><p>Copyright &copy; 2014 Marek Matejak, Charles University in Prague.</p><br/>

</html>"));
    end Heart;

    package Components

      model Ventricle
      // extends Physiolibrary.Organs.Heart.Interfaces.IVentricle(q_in(redeclare
      //        package Medium = Medium), q_out(redeclare package Medium = Medium));
       extends Physiolibrary.Fluid.Interfaces.CompositionSetup(redeclare package Medium = Physiolibrary.Media.Blood);

       parameter String stateName;

       parameter Physiolibrary.Types.Pressure AmbientPressure
        "Environment ambient pressure";

          extends Physiolibrary.Icons.HeartVentricle;
        parameter Physiolibrary.Types.Volume initialVol=9e-05
        "Initial blood volume in ventricle";
      //  parameter Physiolibrary.Types.Volume initialESV = 50e-6;

      parameter Physiolibrary.Types.Volume NormalEndDiastolicVolume=7e-05
        "Typical value of blood volume in ventricle after filling"
          annotation (Dialog(group="Diastole"));
      parameter Physiolibrary.Types.Pressure NormalFillingPressure = (0.00051*101325/760)*(NormalEndDiastolicVolume^(1/n_Diastole))
        "Typical value of filling pressure relative to pericardium pressure"
          annotation (Dialog(group="Diastole"));
      parameter Physiolibrary.Types.Fraction stiffnes=1
        "Relative stiffnes (1 if normal)"
          annotation (Dialog(group="Diastole"));
      parameter Physiolibrary.Types.Fraction n_Diastole(displayUnit="1")=2
        "Exponent of P-V characteristic of EDV curve on filling pressure"
          annotation (Dialog(group="Diastole"));
      //parameter Real Abasic_Diastole = 0.00051
      //    "parametrization of end diastolic volume curve"
      //    annotation (Dialog(group="Diastole"));

      parameter Physiolibrary.Types.Pressure NormalSystolicPressure=15998.684210526
        "Typical value of systolic pressure relative to pericardium pressure"
          annotation (Dialog(group="Systole"));
      parameter Physiolibrary.Types.Volume NormalEndSystolicVolume = (NormalSystolicPressure/(17.39*101325/760))^(n_Systole)
        "Typical value of blood volume in ventricle after ejection"
          annotation (Dialog(group="Systole"));
      //parameter Real Abasic_Systole = 17.39
      //    "parametrization of end systolic volume curve";
      parameter Physiolibrary.Types.Pressure additionalPressure_Systolic
        "Pressure difference between mean and systolic pressure"
          annotation (Dialog(group="Systole"));     //= 24
      parameter Physiolibrary.Types.Fraction contractilityBasic
        "Relative contractility (1 if normal)"
           annotation (Dialog(group="Systole"));       //= 1
      parameter Physiolibrary.Types.Fraction n_Systole(displayUnit="1")=0.5
        "Exponent of P-V characteristic of ESV curve on systolic pressure"
          annotation (Dialog(group="Systole"));

      parameter Physiolibrary.Types.Frequency K
        "time adaptation coeficient of average ventricle blood volume";
                                                    // = 1
      parameter Physiolibrary.Types.HydraulicCompliance BasicCompliance; //(final quantity="Compliance", final displayUnit="ml/mmHg") = 1;

      parameter Physiolibrary.Types.Pressure NormalExternalPressure=-446
        "Typical value of pericardium cavity pressure (relative to environment ambient pressure)";
                                                                               //-446 Pa = -3.34522 mmHg

      //parameter Physiolibrary.Types.HydraulicCompliance MaxContractionCompliance; //=1;
      //parameter Physiolibrary.Types.HydraulicConductance Cond1;//=1;
      //parameter Physiolibrary.Types.HydraulicConductance Cond2;//=1;

      Physiolibrary.Fluid.Interfaces.FluidPort_a port_a(redeclare package
            Medium =                                                               Medium) annotation (Placement(transformation(extent={{-110,-10},{-90,10}},
                rotation=0), iconTransformation(extent={{10,70},{30,90}})));
      Physiolibrary.Fluid.Interfaces.FluidPort_b port_b(redeclare package
            Medium =
              Medium) annotation (Placement(transformation(extent={{90,-10},{110,10}},
                rotation=0), iconTransformation(extent={{-30,90},{-10,110}})));

      Physiolibrary.Types.Constants.FractionConst
        basicContractility(k=contractilityBasic)
        annotation (Placement(transformation(extent={{60,6},{68,14}})));

        Physiolibrary.Organs.Components.BetaReceptors sympatheticReceptors(
            redeclare package Blood = Medium)
          annotation (Placement(transformation(extent={{62,-20},{82,0}})));

        Modelica.Blocks.Math.Add Vol_SteadyState(k1=0.5, k2=0.5)
                                                   annotation (Placement(
              transformation(
              extent={{10,-10},{-10,10}},
              rotation=270,
              origin={-34,18})));

        Physiolibrary.Organs.Heart.Components.Diastole diastole(
          redeclare package Medium = Medium,
          stiffnes=stiffnes,
          n_Diastole=n_Diastole,
          NormalFillingPressure=NormalFillingPressure,
          NormalEndDiastolicVolume=NormalEndDiastolicVolume,
          NormalExternalPressure(displayUnit="Pa") = NormalExternalPressure,
          AmbientPressure=AmbientPressure)
          annotation (Placement(transformation(extent={{-76,-44},{-56,-24}})));
      //    ,Abasic_Diastole=Abasic_Diastole

        Components.Systole systole(
          redeclare package Medium = Medium,
          n_Systole=n_Systole,
          additionalPressure_Systolic=additionalPressure_Systolic,
          NormalSystolicPressure=NormalSystolicPressure,
          NormalEndSystolicVolume=NormalEndSystolicVolume,
          NormalExternalPressure=NormalExternalPressure,
          AmbientPressure=AmbientPressure)
          annotation (Placement(transformation(extent={{52,-44},{72,-24}})));
       //   Abasic_Systole=Abasic_Systole,

        Modelica.Blocks.Math.Feedback StrokeVolume
          annotation (Placement(transformation(extent={{-10,-10},{10,10}},
              origin={-8,-6})));

        VentricleVolumeAndPumping ventricle(
          massFractions_start=massFractions_start,
          extraConcentration_start=extraConcentration_start,
                                            stateName=stateName, K=K,
          redeclare package Medium = Medium)
          annotation (Placement(transformation(extent={{-8,70},{12,90}})));
        //  BasicCompliance=BasicCompliance,
      //

        Modelica.Blocks.Math.Product BloodFlow     annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={16,30})));

        Modelica.Fluid.Sensors.RelativePressure StrokePressure(redeclare package
                    Medium =
                     Medium) "Pressure difference between systole and diastole"
          annotation (Placement(transformation(extent={{2,-70},{-18,-50}})));
        Modelica.Blocks.Math.Product EW "External work - energy of heart cycle"
          annotation (Placement(transformation(extent={{26,-100},{44,-82}})));
        Modelica.Blocks.Math.Product power
          annotation (Placement(transformation(extent={{74,-86},{94,-66}})));
        Types.RealIO.PowerOutput MotionPower annotation (Placement(transformation(
                extent={{92,-98},{98,-92}}),iconTransformation(extent={{40,-20},{80,20}},
                rotation=0)));
        Types.RealIO.FrequencyInput HeartRate annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={22,-70}),iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={22,-70})));
        Types.RealIO.FrequencyInput GangliaGeneral
          "Sympathicus neural activity from general ganglia" annotation (
            Placement(transformation(extent={{22,-26},{42,-6}}),
              iconTransformation(extent={{-46,-49},{-26,-29}})));
        Types.RealIO.PressureInput Pericardium "pericardium pressure"
          annotation (Placement(transformation(extent={{-96,-92},{-76,-72}}),
              iconTransformation(extent={{-45,-10},{-25,10}})));
      equation
        connect(basicContractility.y, sympatheticReceptors.yBase) annotation (
            Line(
            points={{69,10},{72,10},{72,-3}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(sympatheticReceptors.y, systole.contractility) annotation (Line(
            points={{72,-17},{72,-24},{70,-24}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(diastole.EDV,StrokeVolume. u1) annotation (Line(
            points={{-56,-26},{-40,-26},{-40,-6},{-16,-6}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(Vol_SteadyState.u2, diastole.EDV) annotation (Line(
            points={{-40,6},{-40,-26},{-56,-26}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(systole.ESV, Vol_SteadyState.u1) annotation (Line(
            points={{52,-26},{-28,-26},{-28,6}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(systole.ESV,StrokeVolume. u2) annotation (Line(
            points={{52,-26},{-8,-26},{-8,-14}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(StrokeVolume.y, BloodFlow.u1)     annotation (Line(
            points={{1,-6},{8,-6},{8,12},{4,12},{4,18},{10,18}},
            color={0,0,127},
            smooth=Smooth.None));

        connect(diastole.port, port_a) annotation (Line(
            points={{-66,-44},{-66,-60},{-100,-60},{-100,0}},
            color={127,0,0},
            thickness=0.5));
        connect(systole.port, port_b) annotation (Line(
            points={{62,-44},{62,-60},{100,-60},{100,0}},
            color={127,0,0},
            thickness=0.5));
        connect(BloodFlow.y, ventricle.BloodFlow) annotation (Line(points={{16,
                41},{16,64},{10,64},{10,70}}, color={0,0,127}));
        connect(Vol_SteadyState.y, ventricle.VentricleSteadyStateVolume)
          annotation (Line(points={{-34,29},{-34,70},{-6,70}}, color={0,0,127}));
        connect(port_a, ventricle.port_a) annotation (Line(
            points={{-100,0},{-100,80},{-8,80}},
            color={127,0,0},
            thickness=0.5));
        connect(ventricle.port_b, port_b) annotation (Line(
            points={{12,80},{100,80},{100,0}},
            color={127,0,0},
            thickness=0.5));
        connect(port_a, StrokePressure.port_b) annotation (Line(
            points={{-100,0},{-100,-60},{-18,-60}},
            color={127,0,0},
            thickness=0.5));
        connect(port_b, StrokePressure.port_a) annotation (Line(
            points={{100,0},{100,-60},{2,-60}},
            color={127,0,0},
            thickness=0.5));
        connect(StrokePressure.p_rel, EW.u1) annotation (Line(points={{-8,-69},{-8,-85.6},
                {24.2,-85.6}}, color={0,0,127}));
        connect(StrokeVolume.y, EW.u2) annotation (Line(points={{1,-6},{8,-6},{8,-96.4},
                {24.2,-96.4}},          color={0,0,127}));
        connect(EW.y, power.u2) annotation (Line(points={{44.9,-91},{60,-91},{60,-82},
                {72,-82}},         color={0,0,127}));
        connect(power.y, MotionPower)
          annotation (Line(points={{95,-76},{95,-95}},         color={0,0,127}));
        connect(HeartRate, power.u1) annotation (Line(points={{22,-70},{72,-70}},
                                    color={0,0,127}));
        connect(HeartRate, BloodFlow.u2) annotation (Line(points={{22,-70},{22,18}},
                                               color={0,0,127}));
        connect(GangliaGeneral, sympatheticReceptors.GangliaGeneral)
          annotation (Line(points={{32,-16},{62.2,-16}},
              color={0,0,127}));
        connect(Pericardium, systole.externalPressure) annotation (Line(points={{-86,-82},
                {-50,-82},{-50,-46},{32,-46},{32,-40},{52,-40}},
                                                      color={0,0,127}));
        connect(diastole.externalPressure, Pericardium) annotation (Line(points={{-56,-40},
                {-50,-40},{-50,-82},{-86,-82}},       color={0,0,127}));
        connect(sympatheticReceptors.port_a, ventricle.port_c) annotation (Line(
              points={{62,-12},{34,-12},{34,70},{12.2,70}}, color={0,127,255}));
       annotation (
          Documentation(info="<HTML>
<PRE>
Heart ventricle.

like
QHP 2008 / VascularCompartments/LeftVentricle/*



The pressure-volume characteristics of both ventricles in diastole
and systole will be described using a power function.

  P = A * (V ^ n)

P = Pressure
V = Volume
A = Scale Factor
n = curvature

The function is invertable.

  V = (P/A) ^ (1/n)

Some typical values

                                 Right                 Left
                           ---------------------- ------------------------
Nominal Vol                     87.5                  87.5
Nominal TMP                      3.0                   6.0
Compliance                      29.2                  14.6
Pericardial P                   -3.0                  -3.0

DIASTOLE
  EDP                            1.0                   5.0
  EDV                          125.0                 125.0
  TMP                            4.0                   8.0
  n                              2.0                   2.0
  V^n                        15625.0               15625.0
  A                              0.00026               0.00051

SYSTOLE
  ESP                           22.0                 120.0
  ESV                           50.0                  50.0
  TMP                           25.0                 123.0
  n                              0.5                   0.5
  V^n                            7.07                  7.07
  A                              3.53                 17.39
</PRE>
</HTML>
",     revisions="<html>

<table>
<tr>
<td>Author:</td>
<td>Marek Matejak</td>
</tr>
<tr>
<td>License:</td>
<td><a href=\"http://www.physiomodel.org/license.html\">Physiomodel License 1.0</a> </td>
</tr>
<tr>
<td>By:</td>
<td>Charles University, Prague</td>
</tr>
<tr>
<td>Date of:</td>
<td>january 2009</td>
</tr>
<tr>
<td>References:</td>
<td>Tom Coleman: QHP 2008 beta 3, University of Mississippi Medical Center</td>
</tr>
</table>
<br/><p>Copyright &copy; 2014 Marek Matejak, Charles University in Prague. </p><br/>

</html>"),                                        Diagram(coordinateSystem(preserveAspectRatio=false,
                         extent={{-100,-100},{100,100}}), graphics={Text(
                extent={{-42,62},{-18,60}},
                lineColor={0,0,0},
              textString="Mass_SteadyState"),     Text(
                extent={{8,62},{32,60}},
                lineColor={0,0,0},
                textString="Blood_Inflow")}),
          Icon(graphics={Text(
                extent={{-98,-100},{100,-120}},
                textColor={162,29,33},
                textString="%name")}));
      end Ventricle;

      model SA_Node
        extends Physiolibrary.Icons.SinoatrialNode;
        parameter Types.Frequency BaseHeartRate(displayUnit="1/min") = 1.3666666666667;
        parameter Real SympatheticEffect[:,3]={{ 0.0,    0,  0}, { 1.0,   10,  10}, { 5.0,  120,  0}};
        parameter Real ParasympatheticEffect[:,3]={{ 0.0,    0,  0}, { 2.0,  -20,  -8}, { 8.0,  -40,  0}};

        Modelica.Blocks.Interfaces.RealInput BetaReceptorsEffect
          annotation (Placement(transformation(extent={{-120,-40},{-80,0}})));
      Physiolibrary.Blocks.Interpolation.Curve parasympatheticEffect(
        x=ParasympatheticEffect[:, 1],
        y=ParasympatheticEffect[:, 2],
        slope=ParasympatheticEffect[:, 3],
        Yscale=1/60)
        annotation (Placement(transformation(extent={{-50,-70},{-30,-50}})));
        Modelica.Blocks.Math.Sum rate(nin=3)
          annotation (Placement(transformation(extent={{64,-10},{84,10}})));
        Types.RealIO.FrequencyOutput          Rate
          annotation (Placement(transformation(extent={{78,-20},{118,20}})));
        Physiolibrary.Types.RealIO.FrequencyInput VagusNerve_NA_Hz
          annotation (Placement(transformation(extent={{-120,-80},{-80,-40}})));
      Physiolibrary.Types.Constants.FrequencyConst            Constant1(k(
            displayUnit="1/min") = BaseHeartRate)
        annotation (Placement(transformation(extent={{-6,-10},{14,10}})));
      Physiolibrary.Blocks.Interpolation.Curve sympatheticEffect(
        x=SympatheticEffect[:, 1],
        y=SympatheticEffect[:, 2],
        slope=SympatheticEffect[:, 3],
        Yscale=1/60)
        annotation (Placement(transformation(extent={{26,20},{46,40}})));
      equation
        connect(parasympatheticEffect.val, rate.u[2])      annotation (Line(
            points={{-30,-60},{54.1,-60},{54.1,1.11022e-016},{62,1.11022e-016}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(VagusNerve_NA_Hz, parasympatheticEffect.u)
                                              annotation (Line(
            points={{-100,-60},{-50,-60}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(rate.y, Rate) annotation (Line(
            points={{85,0},{98,0}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(Constant1.y, rate.u[1]) annotation (Line(
            points={{16.5,0},{14,0},{14,-0.666667},{62,-0.666667}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(sympatheticEffect.val, rate.u[3]) annotation (Line(
            points={{46,30},{54,30},{54,0.666667},{62,0.666667}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(BetaReceptorsEffect, sympatheticEffect.u) annotation (Line(
              points={{-100,-20},{-12,-20},{-12,30},{26,30}}, color={0,0,127}));
        annotation ( Icon(coordinateSystem(
                preserveAspectRatio=true,  extent={{-100,-100},{100,100}}),
              graphics={
              Text(
                extent={{-102,134},{100,102}},
                lineColor={0,0,0},
                fillColor={213,255,170},
                fillPattern=FillPattern.Solid,
                textString="%name")}));
      end SA_Node;

      model ANP
        extends Physiolibrary.Icons.Heart;
      // outer parameter Real ECF_Vol(final displayUnit="ml");

      //  stateName="ANPPool.Mass",
      //  useNormalizedVolume=false,
      Physiolibrary.Blocks.Factors.Spline LAPEffect(data={{0.0,0.0,0},{8.0,1.0,
            0.4},{20.0,10.0,0}}, Xscale=101325/760)
        annotation (Placement(transformation(extent={{54,62},{34,82}})));
      Physiolibrary.Types.Constants.MolarFlowRateConst hormoneFlowConstant(k=
            6.8333333333333e-13)
        annotation (Placement(transformation(extent={{6,82},{-2,90}})));
      Physiolibrary.Blocks.Factors.Spline RAPEffect(data={{0.0,0.0,0},{4.0,1.0,
            0.4},{20.0,10.0,0}}, Xscale=101325/760)
        annotation (Placement(transformation(extent={{-16,60},{4,80}})));
        Modelica.Blocks.Math.Gain DegradeK(k=0.223/60)
          annotation (Placement(transformation(extent={{-3,-3},{3,3}},
              origin={7,-65})));
      Physiolibrary.Types.Constants.MolarFlowRateConst hormoneFlowConstant1(k=
            4.3333333333333e-13)
        annotation (Placement(transformation(extent={{56,82},{48,90}})));
        Modelica.Blocks.Math.Add SteadyState annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={38,42})));
      Physiolibrary.Blocks.Math.Integrator integrator(
        k=(1/20)/60,
        y_start=67e-12/60)
                     annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={38,-12})));
       // stateName="ANPSecretion.NaturalRate",
        Modelica.Blocks.Math.Feedback feedback annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={38,18})));
      Physiolibrary.Types.BusConnector busConnector annotation (Placement(
            transformation(extent={{-104,84},{-84,104}}), iconTransformation(
              extent={{-90,-70},{-70,-50}})));
        Modelica.Blocks.Interfaces.RealOutput ANP(
                                           quantity="Concentration", final displayUnit=
              "pmol/l",
        nominal=1e-8)                                           annotation (
            Placement(transformation(extent={{-24,2},{-4,22}}),
              iconTransformation(extent={{80,-20},{120,20}})));
      Physiolibrary.Blocks.Math.Log10AsEffect log10_1
        annotation (Placement(transformation(extent={{-32,6},{-44,18}})));
      Physiolibrary.Blocks.Math.Log10AsEffect log10_2
        annotation (Placement(transformation(extent={{-52,-88},{-64,-76}})));
      Physiolibrary.Blocks.Math.Integrator integrator1(
        k=(1/20)/60,
        y_start=20e-9) "initial 20 pmol/l"
                     annotation (Placement(transformation(
            extent={{-5,-5},{5,5}},
            rotation=270,
            origin={-35,-65})));
       // stateName="NephronANP.[ANPDelayed]",
        Modelica.Blocks.Math.Feedback feedback1
                                               annotation (Placement(
              transformation(
              extent={{-7,-7},{7,7}},
              rotation=270,
              origin={-35,-47})));
        Modelica.Blocks.Interfaces.RealOutput NephronANP_Log10Conc
                          annotation (Placement(transformation(extent={{-78,-64},
                  {-58,-44}}), iconTransformation(extent={{80,-60},{120,-20}})));
      Physiolibrary.Blocks.Math.Integrator ANPPool(y_start=2.85895e-10)
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={82,-72})));
      Modelica.Blocks.Math.Feedback feedback2
        annotation (Placement(transformation(extent={{50,-42},{70,-22}})));
      Modelica.Blocks.Math.Division division
        annotation (Placement(transformation(extent={{-68,30},{-48,50}})));
      equation
        connect(hormoneFlowConstant1.y, LAPEffect.yBase) annotation (Line(
            points={{47,86},{44,86},{44,74}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(hormoneFlowConstant.y, RAPEffect.yBase) annotation (Line(
            points={{-3,86},{-6,86},{-6,72}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(RAPEffect.y, SteadyState.u2) annotation (Line(
            points={{-6,66},{-6,60},{32,60},{32,54}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(LAPEffect.y, SteadyState.u1) annotation (Line(
            points={{44,68},{44,54}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(feedback.y,integrator. u) annotation (Line(
            points={{38,9},{38,0}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(integrator.y,feedback. u2) annotation (Line(
            points={{38,-23},{38,-34},{14,-34},{14,18},{30,18}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(SteadyState.y, feedback.u1) annotation (Line(
            points={{38,31},{38,26}},
            color={0,0,127},
            smooth=Smooth.None));

        connect(busConnector.NephronANP_Log10Conc, log10_2.y) annotation (Line(
            points={{-94,94},{-94,-82},{-64.6,-82}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None), Text(
            string="%first",
            index=-1,
            extent={{-6,3},{-6,3}}));
        connect(busConnector.ANPPool_Log10Conc, log10_1.y) annotation (Line(
            points={{-94,94},{-94,12},{-44.6,12}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None), Text(
            string="%first",
            index=-1,
            extent={{-6,3},{-6,3}}));
        connect(feedback1.y, integrator1.u)
                                          annotation (Line(
            points={{-35,-53.3},{-36,-54},{-35,-54},{-35,-59}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(integrator1.y, feedback1.u2)
                                           annotation (Line(
            points={{-35,-70.5},{-35,-74},{-50,-74},{-50,-47},{-40.6,-47}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(integrator1.y, log10_2.u) annotation (Line(
            points={{-35,-70.5},{-35,-82},{-50.8,-82}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(log10_2.y, NephronANP_Log10Conc) annotation (Line(
            points={{-64.6,-82},{-68,-82},{-68,-54}},
            color={0,0,127},
            smooth=Smooth.None));
      connect(busConnector.rightAtrium_TMP, RAPEffect.u) annotation (Line(
          points={{-94,94},{-94,70},{-14,70},{-14,70}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}}));
      connect(LAPEffect.u, busConnector.leftAtrium_TMP) annotation (Line(
          points={{52,72},{86,72},{86,94},{-94,94}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      connect(feedback2.y, ANPPool.u)
        annotation (Line(points={{69,-32},{82,-32},{82,-60}}, color={0,0,127}));
      connect(integrator.y, feedback2.u1)
        annotation (Line(points={{38,-23},{38,-32},{52,-32}}, color={0,0,127}));
      connect(DegradeK.y, feedback2.u2) annotation (Line(points={{10.3,-65},{60,
              -65},{60,-40}}, color={0,0,127}));
      connect(ANPPool.y, DegradeK.u) annotation (Line(points={{82,-83},{82,-98},{
              -18,-98},{-18,-65},{3.4,-65}}, color={0,0,127}));
      connect(busConnector.ECFV_Vol, division.u2) annotation (Line(
          points={{-94,94},{-94,28},{-70,28},{-70,34}},
          color={0,0,255},
          thickness=0.5));
      connect(ANPPool.y, division.u1) annotation (Line(points={{82,-83},{82,-98},
              {-116,-98},{-116,46},{-70,46}}, color={0,0,127}));
      connect(division.y, ANP) annotation (Line(points={{-47,40},{-26,40},{-26,12},
              {-14,12}}, color={0,0,127}));
      connect(division.y, log10_1.u) annotation (Line(points={{-47,40},{-26,40},{
              -26,12},{-30.8,12}}, color={0,0,127}));
      connect(busConnector.ANP, division.y) annotation (Line(
          points={{-94,94},{-94,64},{-34,64},{-34,40},{-47,40}},
          color={0,0,255},
          thickness=0.5));
      connect(division.y, feedback1.u1) annotation (Line(points={{-47,40},{-28,40},
              {-28,-41.4},{-35,-41.4}}, color={0,0,127}));
        annotation ( Icon(coordinateSystem(
                preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
              graphics={Text(
                extent={{-120,94},{114,72}},
                lineColor={0,0,255},
                textString="%name")}));
      end ANP;

      model BaroReceptors
        extends Physiolibrary.Icons.Barroreceptor;
        // TODO: Tau without default value
        Physiolibrary.Types.RealIO.PressureInput rightAtriumPressure
          annotation (Placement(transformation(extent={{-120,40},{-80,80}}),
              iconTransformation(extent={{-110,-10},{-90,10}})));
      Physiolibrary.Blocks.Math.Integrator adaptivePressure(
        y_start=AdaptivePressure,
          k=1/Tau)
        annotation (Placement(transformation(extent={{0,-10},{20,10}})));
       // stateName="Baroreflex.AdaptedPressure",
        Modelica.Blocks.Math.Feedback pressureChange
          annotation (Placement(transformation(extent={{-36,-10},{-16,10}})));
      Physiolibrary.Blocks.Interpolation.Curve pressureChangeOnNA(
        x=PressureChangeOnNA[:, 1],
        y=PressureChangeOnNA[:, 2],
        slope=PressureChangeOnNA[:, 3],
          Xscale=101325/760)
        annotation (Placement(transformation(extent={{38,-18},{74,18}})));
        Physiolibrary.Types.RealIO.FractionOutput NA
          annotation (Placement(transformation(extent={{80,-20},{120,20}})));
        parameter Physiolibrary.Types.Pressure AdaptivePressure(displayUnit="mmHg");
        parameter Physiolibrary.Types.Time Tau(displayUnit="h")=3600;
        parameter Real PressureChangeOnNA[3,:];

        Modelica.Blocks.Math.Feedback rightAtrium_TMP
          annotation (Placement(transformation(extent={{-78,52},{-62,68}})));
        Modelica.Blocks.Math.Feedback leftAtrium_TMP
        annotation (Placement(transformation(extent={{8,-8},{-8,8}},
              rotation=180,
              origin={-70,-60})));
        Modelica.Blocks.Math.Add avePressure(k1=0.5, k2=0.5)
          annotation (Placement(transformation(extent={{-56,-6},{-44,6}})));
        Types.RealIO.PressureInput leftAtriumPressure annotation (Placement(
              transformation(extent={{-120,-80},{-80,-40}}), iconTransformation(
                extent={{-110,-70},{-90,-50}})));
        Types.RealIO.PressureInput pericardiumPressure annotation (Placement(
              transformation(extent={{-120,-20},{-80,20}}), iconTransformation(
                extent={{-108,50},{-88,70}})));
      equation
        connect(pressureChange.u2, adaptivePressure.y) annotation (Line(
            points={{-26,-8},{-26,-20},{26,-20},{26,0},{21,0}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(pressureChange.y, adaptivePressure.u) annotation (Line(
            points={{-17,0},{-2,0}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(pressureChangeOnNA.val, NA) annotation (Line(
            points={{74,0},{100,0}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(pressureChange.y, pressureChangeOnNA.u) annotation (Line(
            points={{-17,0},{-8,0},{-8,16},{30,16},{30,0},{38,0}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(rightAtriumPressure, rightAtrium_TMP.u1)
          annotation (Line(points={{-100,60},{-76.4,60}}, color={0,0,127}));
        connect(pericardiumPressure, rightAtrium_TMP.u2) annotation (Line(
              points={{-100,0},{-70,0},{-70,53.6}}, color={0,0,127}));
        connect(rightAtrium_TMP.y, avePressure.u1) annotation (Line(points={{
                -62.8,60},{-58,60},{-58,12},{-62,12},{-62,4},{-57.2,4},{-57.2,
                3.6}}, color={0,0,127}));
        connect(leftAtriumPressure, leftAtrium_TMP.u1)
          annotation (Line(points={{-100,-60},{-76.4,-60}}, color={0,0,127}));
        connect(pericardiumPressure, leftAtrium_TMP.u2) annotation (Line(points=
               {{-100,0},{-70,0},{-70,-53.6}}, color={0,0,127}));
        connect(leftAtrium_TMP.y, avePressure.u2) annotation (Line(points={{
                -62.8,-60},{-58,-60},{-58,-10},{-62,-10},{-62,-3.6},{-57.2,-3.6}},
              color={0,0,127}));
        connect(avePressure.y, pressureChange.u1)
          annotation (Line(points={{-43.4,0},{-34,0}}, color={0,0,127}));
        annotation ( Icon(coordinateSystem(
                preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
              graphics={
              Text(
                extent={{-122,130},{118,102}},
                lineColor={0,0,0},
                fillColor={213,255,170},
                fillPattern=FillPattern.Solid,
                textString="%name")}));
      end BaroReceptors;

      model Diastole
        extends Physiolibrary.Fluid.Interfaces.PartialAbsoluteSensor;
      /*  Real iconPoint[20,2](final displayUnit="mm");
  Real iconActualPoint[2,2](final displayUnit="mm");
  */
        /*
Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a inflow annotation (
    Placement(transformation(extent={{-122,-24},{-82,16}}),
      iconTransformation(extent={{-120,20},{-80,60}})));
*/
        Physiolibrary.Types.RealIO.PressureInput externalPressure
        "pericardium pressure around ventricle"
                                       annotation ( Placement(transformation(extent={{94,-58},
                  {114,-38}}), iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={100,-60})));

      parameter Physiolibrary.Types.Fraction stiffnes
        "parametrization of end diastolic volume curve";
      parameter Physiolibrary.Types.Fraction n_Diastole(displayUnit="1")
        "parametrization of end systolic volume curve";
      //parameter Real Abasic_Diastole "parametrization of end diastolic volume curve";
      parameter Physiolibrary.Types.Pressure NormalFillingPressure
        "Typicall value of mean arterial filling pressure (relative to environment ambient pressure)";
      parameter Physiolibrary.Types.Pressure NormalExternalPressure = -446
        "Typical value of pericardium cavity pressure (relative to environment ambient pressure)";
      parameter Physiolibrary.Types.Volume NormalEndDiastolicVolume
        "= (NormalDiastolicPressure/Abasic_Diastole)^n_Diastole";
      //Abasic_Diastole "parametrization of end diastolic volume curve";
      parameter Physiolibrary.Types.Pressure AmbientPressure
        "Environment ambient pressure";

        Physiolibrary.Types.RealIO.VolumeOutput
                                            EDV   annotation (Placement(transformation(extent={{-74,-74},
                  {-34,-34}}), iconTransformation(
              extent={{-10,-10},{10,10}},
              origin={100,80})));

      equation
      //  inflow.q = 0;
      //  P = inflow.pressure;
      //  EDV = ((inflow.pressure-externalPressure)/(stiffnes*Abasic_Diastole))^(1/n_Diastole);
        EDV = NormalEndDiastolicVolume*((port.p-externalPressure-AmbientPressure)/(stiffnes*(NormalFillingPressure-NormalExternalPressure)))^(1/n_Diastole);

        //  Stiffness = stiffnes;

      // drawing icon
      /*  for i in 1:size(iconPoint,1) loop
    iconPoint[i,1]=((i-1)/(size(iconPoint,1)))*180 - 90;
    (iconPoint[i,1]+90)*200/180 = ( ( ( (iconPoint[i,2]+40)*200/130)-externalPressure)/(stiffnes*Abasic_Diastole))^(1/n_Diastole);
  end for;
  iconActualPoint[1,1]=EDV*180/200-90 -2;
  iconActualPoint[1,2]=inflow.pressure*130/200-40 -2;
  iconActualPoint[2,1]=iconActualPoint[1,1]+4;
  iconActualPoint[2,2]=iconActualPoint[1,2]+4;*/
                                   /*,
        Line(
          points=DynamicSelect({{-100,0},{100,0}}, iconPoint),
          color={0,0,255},
          smooth=Smooth.None),
        Ellipse(
          extent=DynamicSelect({{0,0},{0,0}}, iconActualPoint),
          lineColor={0,0,0},
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid)*/
        annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={
              Rectangle(
                extent={{-100,100},{100,-60}},
                lineColor={255,0,0},
                fillPattern=FillPattern.HorizontalCylinder,
                fillColor={255,255,255}),
              Text(
                extent={{-100,-60},{100,-100}},
                lineColor={0,0,255},
                textString="%name")}));
      end Diastole;

      model Systole
        extends Physiolibrary.Fluid.Interfaces.PartialAbsoluteSensor;

      //  Real iconPoint[20,2](each final displayUnit="mm");
      //  Real iconActualPoint[2,2](each final displayUnit="mm");
      /*
Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b outflow annotation (
    Placement(transformation(extent={{80,20},{120,60}}),
      iconTransformation(extent={{80,20},{120,60}})));
*/
        Physiolibrary.Types.RealIO.FractionInput contractility
        "heart muscle contractility"   annotation (
        Placement(transformation(
            origin={80,100},
            extent={{-10,-10},{10,10}},
            rotation=270)));

      parameter Physiolibrary.Types.Fraction n_Systole(displayUnit="1")
        "parametrization of end diastolic volume curve";
      //parameter Real Abasic_Systole "parametrization of end systolic volume curve";
      parameter Physiolibrary.Types.Pressure NormalSystolicPressure
        "Typical value of mean arterial pressure (relative to environment ambient pressure)";
          parameter Physiolibrary.Types.Pressure NormalExternalPressure = -446
        "Typical value of pericardium cavity pressure (relative to environment ambient pressure)";
                                                                               //-446 Pa = -3.34522 mmHg
      parameter Physiolibrary.Types.Volume NormalEndSystolicVolume
        "= 2.64 ml for left ventricle, parametrization of end systolic volume curve";
      parameter Physiolibrary.Types.Pressure additionalPressure_Systolic
        "parametrization of end systolic volume curve";

      parameter Physiolibrary.Types.Pressure AmbientPressure
        "Environment ambient pressure";

        Physiolibrary.Types.RealIO.VolumeOutput
                                            ESV   annotation (Placement(transformation(extent={{-74,-74},
                  {-34,-34}}), iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={-100,80})));

        Physiolibrary.Types.RealIO.PressureInput externalPressure
        "pressure around ventricle"                                             annotation (
      Placement(transformation(extent={{-110,-70},{-90,-50}}), iconTransformation(
                extent={{-110,-70},{-90,-50}})));
                Physiolibrary.Types.Pressure systolicPressure;
                Real coef;
      equation
      //  outflow.q = 0;
      //  P=outflow.pressure;
      //  ESV = ((outflow.pressure+additionalPressure_Systolic-externalPressure)/(contractility*Abasic_Systole))^(1/n_Systole);
        systolicPressure= (port.p-AmbientPressure);
        coef=(port.p+additionalPressure_Systolic-externalPressure-AmbientPressure)/(contractility*(NormalSystolicPressure+additionalPressure_Systolic-NormalExternalPressure));
        ESV = NormalEndSystolicVolume*((port.p+additionalPressure_Systolic-externalPressure-AmbientPressure)/(contractility*(NormalSystolicPressure+additionalPressure_Systolic-NormalExternalPressure)))^(1/n_Systole);

      // drawing icon
      /*  for i in 1:size(iconPoint,1) loop
    iconPoint[i,1]=((i-1)/(size(iconPoint,1)))*180 - 90;
    (iconPoint[i,1]+90)*200/180= ((((iconPoint[i,2]+40)*200/130)+additionalPressure_Systolic-externalPressure)/(contractility*Abasic_Systole))^(1/n_Systole);
  end for;
  iconActualPoint[1,1]=ESV*180/200-90 -2;
  iconActualPoint[1,2]=outflow.pressure*130/200-40 -2;
  iconActualPoint[2,1]=iconActualPoint[1,1]+4;
  iconActualPoint[2,2]=iconActualPoint[1,2]+4;*/
                                   /*,
        Line(
          points=DynamicSelect({{-100,0},{100,0}}, iconPoint),
          color={0,0,255},
          smooth=Smooth.None),
        Ellipse(
          extent=DynamicSelect({{0,0},{0,0}}, iconActualPoint),
          lineColor={0,0,0},
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid)*/
        annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={
              Rectangle(
                extent={{-100,100},{100,-60}},
                lineColor={255,0,0},
                fillPattern=FillPattern.HorizontalCylinder,
                fillColor={255,255,255}),
              Text(
                extent={{-100,-60},{100,-100}},
                lineColor={0,0,255},
                textString="%name")}));
      end Systole;

        model VentricleVolumeAndPumping
        "Multiple PressureFlow connector with pressures from multiple inputs"
                  extends Physiolibrary.Icons.Pump;
                  extends Physiolibrary.Fluid.Interfaces.CompositionSetup;

                     Physiolibrary.Types.RealIO.VolumeFlowRateInput BloodFlow( displayUnit=
                         "l/min") "heart cardiac output"
                      annotation (Placement(transformation(extent={{-20,-20},{20,20}},
                rotation=90,
                origin={60,-100}),                                                         iconTransformation(extent={{-20,-20},{20,20}},
                        rotation=90,
                        origin={80,-100})));

                     Physiolibrary.Types.RealIO.VolumeInput VentricleSteadyStateVolume(
                                                                             displayUnit="ml")
        "heart ventricle steady state volume"
                      annotation (Placement(transformation(extent={{-20,-20},{20,20}},
                rotation=90,
                origin={-20,-100}),                                                        iconTransformation(extent={{-20,-20},{20,20}},
                        rotation=90,
                        origin={-80,-100})));

                    parameter Physiolibrary.Types.Frequency K( displayUnit="1/min") = 0.01666666666666666666666666666667;
                    Physiolibrary.Types.RealIO.VolumeOutput Volume( displayUnit="ml") annotation (Placement(transformation(
                            extent={{84,-70},{124,-30}}), iconTransformation(extent={{84,-70},{
                              124,-30}})));

                  parameter String stateName="";
                  replaceable package Medium = Media.Water constrainedby Media.Interfaces.PartialMedium "Medium model" annotation (choicesAllMatching=true);
          outer Modelica.Fluid.System system "System wide properties";
          Physiolibrary.Fluid.Interfaces.FluidPort_a port_a(redeclare package
            Medium =
                Medium) "Inflow"
            annotation (Placement(transformation(extent={{-114,-14},{-86,14}})));
          Physiolibrary.Fluid.Interfaces.FluidPort_b port_b(redeclare package
            Medium =
                Medium) "Outflow"
            annotation (Placement(transformation(extent={{86,-14},{114,14}})));
          Fluid.Components.VolumePump volumePump(redeclare package Medium =
              Medium,                            useSolutionFlowInput=true)
            annotation (Placement(transformation(extent={{-28,-8},{-8,12}})));
          Fluid.Components.VolumePump volumePump1(redeclare package Medium =
              Medium,                             useSolutionFlowInput=true)
            annotation (Placement(transformation(extent={{54,-10},{74,10}})));
        Modelica.Blocks.Math.Feedback feedback
          annotation (Placement(transformation(extent={{-16,-52},{4,-32}})));
        Modelica.Blocks.Math.Add add annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={4,82})));
        Modelica.Blocks.Math.Gain gain(k=K) annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={54,76})));
        Fluid.Components.ElasticVessel elasticVessel(
          redeclare package Medium = Medium,
            massFractions_start=massFractions_start,
            extraConcentration_start=extraConcentration_start,
            volume_start=8.8e-05,                    nPorts=3)
          annotation (Placement(transformation(extent={{4,-6},{24,14}})));
          Fluid.Interfaces.FluidPort_b port_c(redeclare package Medium = Medium)
          "Measurement port"
          annotation (Placement(transformation(extent={{88,-114},{116,-86}})));
        equation

          connect(port_a, volumePump.q_in) annotation (Line(
              points={{-100,0},{-98,0},{-98,2},{-28,2}},
              color={127,0,0},
              thickness=0.5));
          connect(volumePump1.q_out, port_b) annotation (Line(
              points={{74,0},{100,0}},
              color={127,0,0},
              thickness=0.5));
        connect(VentricleSteadyStateVolume, feedback.u1) annotation (Line(
              points={{-20,-100},{-20,-42},{-14,-42}}, color={0,0,127}));
        connect(BloodFlow, add.u2) annotation (Line(points={{60,-100},{60,-12},
                {80,-12},{80,16},{38,16},{38,88},{16,88}}, color={0,0,127}));
        connect(add.u1, gain.y)
          annotation (Line(points={{16,76},{43,76}}, color={0,0,127}));
        connect(gain.u, feedback.y) annotation (Line(points={{66,76},{72,76},{
                72,14},{36,14},{36,-28},{3,-28},{3,-42}}, color={0,0,127}));
        connect(volumePump.q_out, elasticVessel.q_in[1]) annotation (Line(
            points={{-8,2},{0,2},{0,3.13333},{13.9,3.13333}},
            color={127,0,0},
            thickness=0.5));
        connect(volumePump1.q_in, elasticVessel.q_in[2]) annotation (Line(
            points={{54,0},{26,0},{26,4},{13.9,4}},
            color={127,0,0},
            thickness=0.5));
        connect(elasticVessel.fluidVolume, Volume) annotation (Line(points={{24,-4},{50,
                  -4},{50,-14},{78,-14},{78,-50},{104,-50}},       color={0,0,
                127}));
        connect(elasticVessel.fluidVolume, feedback.u2) annotation (Line(points={{24,-4},
                  {36,-4},{36,-64},{-6,-64},{-6,-50}},                color={0,
                0,127}));
        connect(BloodFlow, volumePump1.solutionFlow)
          annotation (Line(points={{60,-100},{60,7},{64,7}}, color={0,0,127}));
        connect(add.y, volumePump.solutionFlow) annotation (Line(points={{-7,82},
                {-18,82},{-18,9}}, color={0,0,127}));
        connect(elasticVessel.q_in[3], port_c) annotation (Line(
            points={{13.9,4.86667},{16,4.86667},{16,-100},{102,-100}},
            color={127,0,0},
            thickness=0.5));
                   annotation (Documentation(info="<HTML>
<p>
Model has a vector of continuous Real input signals as pressures for
vector of pressure-flow connectors.
</p>
</HTML>
"));
        end VentricleVolumeAndPumping;

      model Metabolism
        import Physiolibrary;
        extends Icons.Heart;
        extends Icons.MetabolismPart;

        Physiolibrary.Fluid.Sensors.MassConcentration
                                               thyroxine(redeclare function
            GetMassConcentration = Physiolibrary.Media.Blood.thyroxine,
                                                         redeclare package
            Medium =
              Blood)
          annotation (Placement(transformation(extent={{-46,56},{-26,76}})));
        Blocks.Factors.Spline Thyroid(data={{0,0.7,0},{8,1.0,0.4},{40,1.5,0}}, Xscale
            =1e-5)
                "8 ug/dl = 8e-9/1e-4 kg/m3"
          annotation (Placement(transformation(extent={{60,18},{80,38}})));
        Blocks.Factors.Spline HeatMetabolism_Skin(data={{10 + 273.15,0.0,0},{37 + 273.15,
              1.0,0.12},{40 + 273.15,1.5,0},{46 + 273.15,0.0,0}})
          annotation (Placement(transformation(extent={{60,12},{80,32}})));
        Blocks.Factors.Normalization StructureEffect__
          annotation (Placement(transformation(extent={{60,0},{80,20}})));
        Types.Constants.PowerConst BasalPower(k=BasalPowerPerKg*TissueSize)
          "Rate of energy during basal metabolism (BasalCalsUsed*TissueSize)"
          annotation (Placement(transformation(
              extent={{-4,-4},{4,4}},
              rotation=270,
              origin={69,37})));
        Modelica.Blocks.Math.Sum TotalCaloriesUse(nin=3) annotation (Placement(
              transformation(
              extent={{-4.5,-4.5},{3.5,3.5}},
              rotation=270,
              origin={71.5,-20.5})));
        Modelica.Blocks.Sources.Constant structureEffect(k=StructureEffect)
          annotation (Placement(transformation(extent={{36,12},{48,24}})));
          replaceable package Blood = Physiolibrary.Media.Blood  constrainedby
          Media.Interfaces.PartialMedium                                                                                                     "Blood medium model" annotation ( choicesAllMatching = true);
          parameter Types.Fraction StructureEffect=1 "Structure effect on metabolism (1..OK, 0..zero basal functions)";
          parameter Types.PowerPerMass BasalPowerPerKg=5.5398342
                                                       "Rate of energy consumption by basal metabolism in 1 kg of tissue";
          parameter Types.Mass TissueSize=0.0385
                                          "Tissue mass";
       /*   parameter Types.Power MotionCals(displayUnit="cal/min")=0.3489
                                     "Rate of energy consumption caused by motion";
    parameter Types.Power HeatCals(displayUnit="cal/min")=1.18626
    "Rate of energy consumption caused by heat prosuction"; */

          parameter Types.Fraction MotionEffeciency = 0.37 "Motion effeciency without basal metabolism";
        Modelica.Blocks.Interfaces.RealOutput y annotation (Placement(transformation(
                rotation=0, extent={{96,70},{116,90}})));
        Physiolibrary.Fluid.Interfaces.FluidPort_a a_port(redeclare package
            Medium =                                                                 Blood) annotation (
          Placement(transformation(extent={{90,-10},{110,10}}),         iconTransformation(extent={{90,-10},
                  {110,10}})));
        Physiolibrary.Fluid.Interfaces.FluidPort_b b_port(redeclare package
            Medium =                                                                 Blood) annotation (
          Placement(transformation(extent={{-110,-10},{-90,10}}),     iconTransformation(extent={{-110,
                  -10},{-90,10}})));

        Types.RealIO.PowerInput motionPower "Power needed for motion"
          annotation (Placement(transformation(extent={{-122,60},{-82,100}})));
        Modelica.Blocks.Math.Gain motionHeat(k=1 - MotionEffeciency)
          annotation (Placement(transformation(extent={{-20,-26},{0,-6}})));
        Physiolibrary.Fluid.Sensors.Temperature temperature1(redeclare package
            Medium = Blood)
          annotation (Placement(transformation(extent={{-16,38},{4,58}})));
      equation
        connect(Thyroid.y,HeatMetabolism_Skin. yBase)       annotation (Line(
            points={{70,24},{70,24}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(HeatMetabolism_Skin.y,StructureEffect__. yBase) annotation (Line(
            points={{70,18},{72,18},{72,12},{70,12}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(BasalPower.y,Thyroid. yBase) annotation (Line(
            points={{69,32},{70,32},{70,30}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(StructureEffect__.y,TotalCaloriesUse. u[1]) annotation (Line(points={{70,6},{
                70,-10},{70.7333,-10},{70.7333,-15.2}},        color={0,0,127}));
        connect(structureEffect.y,StructureEffect__. u) annotation (Line(points={{48.6,18},
                {54,18},{54,10},{62,10}},   color={0,0,127}));
        connect(y, TotalCaloriesUse.y) annotation (Line(points={{106,80},{90,80},
                {90,14},{114,14},{114,-30},{71,-30},{71,-24.4}},
                                  color={0,0,127}));
        connect(motionPower, TotalCaloriesUse.u[2]) annotation (Line(points={{-102,80},
                {84,80},{84,-10},{71,-10},{71,-15.2}},
                                               color={0,0,127}));
        connect(motionHeat.y, TotalCaloriesUse.u[3]) annotation (Line(points={{1,-16},
                {62,-16},{62,-8},{71.2667,-8},{71.2667,-15.2}},
                                                      color={0,0,127}));
        connect(motionPower, motionHeat.u) annotation (Line(points={{-102,80},{
                -60,80},{-60,-16},{-22,-16}},
                                     color={0,0,127}));
        connect(thyroxine.R, Thyroid.u) annotation (Line(points={{-25,66},{56,
                66},{56,36},{54,36},{54,28},{62,28}},
                                  color={0,0,127}));
        connect(a_port, thyroxine.port) annotation (Line(
            points={{100,0},{-36,0},{-36,56}},
            color={127,0,0},
            thickness=0.5));
        connect(a_port, b_port) annotation (Line(
            points={{100,0},{-100,0}},
            color={127,0,0},
            thickness=0.5));
        connect(a_port, temperature1.port) annotation (Line(
            points={{100,0},{-6,0},{-6,38}},
            color={127,0,0},
            thickness=0.5));
        connect(HeatMetabolism_Skin.u, temperature1.T) annotation (Line(points=
                {{62,22},{52,22},{52,48},{5,48}}, color={0,0,127}));
      end Metabolism;

      model Tissue "Heart tissue"

         extends Physiolibrary.Icons.PerfusionDO;
         extends Physiolibrary.Icons.LeftHeart;
         extends Icons.MetabolismPart;

        replaceable package Blood = Physiolibrary.Media.Blood   constrainedby
          Physiolibrary.Media.Interfaces.PartialMedium                                                                                     annotation ( choicesAllMatching = true);
          //Physiolibrary.Media.BloodBySiggaardAndersen

        parameter Physiolibrary.Types.HydraulicConductance BasicLargeVeselsConductance( displayUnit="ml/(min.mmHg)") = 5.0004105056377e-09;
        parameter Physiolibrary.Types.HydraulicConductance BasicSmallVeselsConductance( displayUnit="ml/(min.mmHg)") = 3.1252565660236e-10;

        parameter Boolean FunctionFailed=false "true if function failed";

          parameter Types.Fraction StructureEffect=1 "Structure effect on metabolism (1..OK, 0..zero basal functions)";
          parameter Types.PowerPerMass BasalPowerPerKg=5.5398342
                                                       "Rate of energy consumption by basal metabolism in 1 kg of tissue";
          parameter Types.Mass TissueSize=0.0385
                                          "Tissue mass";
       /*   parameter Types.Power MotionCals(displayUnit="cal/min")=0.3489
                                     "Rate of energy consumption caused by motion";
    parameter Types.Power HeatCals(displayUnit="cal/min")=1.18626
    "Rate of energy consumption caused by heat prosuction"; */

          parameter Types.Fraction MotionEffeciency = 0.37 "Motion effeciency without basal metabolism";

        Fluid.Sensors.PartialPressure pO2(
          redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
          substanceData=Chemical.Substances.Oxygen_gas(),
          redeclare package Medium = Blood)
          annotation (Placement(transformation(extent={{-8,28},{-28,48}})));
        Fluid.Sensors.Concentration            vasopressin(redeclare function
            GetConcentration = Physiolibrary.Media.Blood.vasopressin,
                                                           redeclare package
            Medium =
              Blood)
          annotation (Placement(transformation(extent={{-38,58},{-18,78}})));
        Fluid.Sensors.Fraction                 anesthesiaVascularConductance(
            redeclare function GetFraction =
              Physiolibrary.Media.Blood.anesthesiaVascularConductance,
            redeclare package Medium = Blood)
          annotation (Placement(transformation(extent={{-54,78},{-34,98}})));
        Types.RealIO.PowerInput motionPower(displayUnit="cal/min")
          "Total rate of motion energy (external work per time)" annotation (
            Placement(transformation(
              rotation=0,
              extent={{-10,-10},{10,10}},
              origin={14,24}),   iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-70,90})));

         Modelica.Blocks.Math.Gain CalToO2(k=0.2093/(4.1864*22710.95322615))
        "0.2093 ml/cal,  4.1864 J/cal, 22710.95322615 ml/mol"
          annotation (Placement(transformation(extent={{4,-4},{-4,4}},
              rotation=180,
              origin={52,20})));
      Blocks.Factors.Spline               PO2Effect(data={{12,2.0,0},{17,1.0,-0.04},{30,
              0.8,0}}, Xscale=101325/760)
        annotation (Placement(transformation(extent={{60,20},{80,40}})));
      Blocks.Factors.Spline               ADHEffect2(data={{0.8,1.0,0},{3.0,0.1,0}},
          Xscale=1e-9,
            UsePositiveLog10=true)
        annotation (Placement(transformation(extent={{60,58},{80,78}})));
      Blocks.Factors.Spline               MetabolismEffect(data={{30,1.0,0},{100,3.0,0}},
            Xscale=1/1362657.193569)
        "O2Need 1 ml_STP/min = 1/1362657.193569 mol/s"
        annotation (Placement(transformation(extent={{60,10},{80,30}})));
      Blocks.Factors.Normalization               Anesthesia
        annotation (Placement(transformation(extent={{60,66},{80,86}})));
      Types.Constants.HydraulicConductanceConst
        LargeVesselBasicConductance(k=BasicLargeVeselsConductance)
        annotation (Placement(transformation(extent={{-54,18},{-66,30}})));
      Types.Constants.HydraulicConductanceConst
        SmallVesselBasicConductance(k=BasicSmallVeselsConductance)
        annotation (Placement(transformation(extent={{90,86},{78,98}})));
      Blocks.Factors.DamagedFraction               Infraction
        annotation (Placement(transformation(extent={{60,2},{80,22}})));
        Blocks.Factors.SplineLagOrZero                            Vasculature(
          FunctionFailed=FunctionFailed,
          data={{41,1.2,0},{51,1.0,-0.03},{61,0.8,0}},
          HalfTime=30*86400*Modelica.Math.log(2),
          integrator(y_start=1.2),
          Xscale=101325/760)
          annotation (Placement(transformation(extent={{60,30},{80,50}})));
      Physiolibrary.Organs.Components.ViscosityConductance
                                                 Viscosity(redeclare package
            Blood = Blood)
        annotation (Placement(transformation(extent={{60,74},{80,94}})));
      Fluid.Components.Conductor               resistor2_1(redeclare package
            Medium =
              Blood, useConductanceInput=true)
        annotation (Placement(transformation(extent={{60,-10},{80,10}})));
      Fluid.Components.Conductor               resistor2_2(redeclare package
            Medium =
              Blood, useConductanceInput=true)
        annotation (Placement(transformation(extent={{-78,-10},{-58,10}})));
        Fluid.Components.ElasticVessel capillarries(
          redeclare package Medium = Blood,
          useSubstances=true,
          volume_start=1e-06,
          Compliance=7.5006157584566e-10,
          nPorts=7)
          annotation (Placement(transformation(extent={{-28,-10},{-8,10}})));

        Physiolibrary.Organs.Components.AlphaReceptors
          aplhaReceptorsActivityFactor2_1(redeclare package Blood = Blood)
          annotation (Placement(transformation(extent={{60,46},{80,66}})));
      Fluid.Interfaces.FluidPort_a port_a(redeclare package Medium = Blood)
          "Blood inflow" annotation (Placement(transformation(extent={{100,-10},
                  {120,10}}, rotation=0), iconTransformation(extent={{150,-10},
                  {170,10}})));
      Fluid.Interfaces.FluidPort_b port_b(redeclare package Medium = Blood)
          "Blood outflow" annotation (Placement(transformation(extent={{-110,-10},
                  {-90,10}}, rotation=0), iconTransformation(extent={{-168,-10},
                  {-148,10}})));
        Metabolism metabolism(
          redeclare package Blood = Blood,
          StructureEffect=StructureEffect,
          BasalPowerPerKg=BasalPowerPerKg,
          TissueSize=TissueSize,
          MotionEffeciency=MotionEffeciency)
                                 annotation (Placement(transformation(rotation=0,
                extent={{18,-10},{38,10}})));
        Types.RealIO.FrequencyInput Ganglia
          "Sympathetic ganglia general neural activity" annotation (Placement(
              transformation(extent={{30,40},{50,60}}),iconTransformation(
                extent={{30,40},{50,60}})));
        Physiolibrary.Organs.Components.ViscosityConductance viscosity(
            redeclare package Blood = Blood) annotation (Placement(
              transformation(rotation=0, extent={{-58,6},{-78,26}})));
      equation
        connect(CalToO2.y, MetabolismEffect.u) annotation (Line(points={{56.4,20},{62,
                20}},                                   color={0,0,127}));
        connect(pO2.port, capillarries.q_in[2]) annotation (Line(
            points={{-18,28},{-18,26},{-18.1,26},{-18.1,-0.742857}},
            color={127,0,0},
            thickness=0.5));
        connect(pO2.partialPressure, PO2Effect.u) annotation (Line(points={{-8,38},
                {54,38},{54,30},{62,30}},             color={0,0,127}));
        connect(pO2.partialPressure, Vasculature.u)
          annotation (Line(points={{-8,38},{60,38}},         color={0,0,127}));
        connect(capillarries.substances.O2, pO2.port_a) annotation (
            Line(points={{-28,0},{-28,26},{-34,26},{-34,38},{-28,38}},
                                                                  color={158,66,
                200}));
        connect(anesthesiaVascularConductance.port, capillarries.q_in[2])
          annotation (Line(points={{-44,78},{-44,16},{-18.1,16},{-18.1,0}},
                                                                         color=
                {0,127,255}));
        connect(LargeVesselBasicConductance.y, viscosity.yBase) annotation (
            Line(
            points={{-67.5,24},{-67.5,21},{-68,21},{-68,18}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(Viscosity.y,Anesthesia. yBase) annotation (Line(
            points={{70,80},{70,78}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(Viscosity.yBase,SmallVesselBasicConductance. y) annotation (
            Line(
            points={{70,86},{70,92},{76.5,92}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(Anesthesia.y,ADHEffect2. yBase) annotation (Line(
            points={{70,72},{70,70}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(Vasculature.y,PO2Effect. yBase) annotation (Line(
            points={{70,34},{70,32}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(PO2Effect.y,MetabolismEffect. yBase) annotation (Line(
            points={{70,26},{70,22}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(MetabolismEffect.y,Infraction. yBase) annotation (Line(
            points={{70,16},{70,14}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(port_b, resistor2_2.q_in) annotation (Line(
            points={{-100,0},{-78,0}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(resistor2_1.cond,Infraction. y) annotation (Line(
            points={{70,6},{70,8}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(resistor2_2.cond, viscosity.y) annotation (Line(
            points={{-68,6},{-68,12}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(resistor2_2.q_out, capillarries.q_in[1]) annotation (Line(
            points={{-58,0},{-58,-1.11429},{-18.1,-1.11429}},
            color={127,0,0},
            thickness=0.5));
        connect(ADHEffect2.y,aplhaReceptorsActivityFactor2_1. yBase) annotation (Line(
              points={{70,64},{70,63}},                      color={0,0,127}));
        connect(Vasculature.yBase, aplhaReceptorsActivityFactor2_1.y)
          annotation (Line(points={{70,46},{70,49}}, color={0,0,127}));
        connect(CalToO2.u, metabolism.y) annotation (Line(points={{47.2,20},{44,
                20},{44,8},{38.6,8}},
                                color={0,0,127}));
        connect(motionPower, metabolism.motionPower)
          annotation (Line(points={{14,24},{17.8,24},{17.8,8}},
                                                        color={0,0,127}));
        connect(Ganglia, aplhaReceptorsActivityFactor2_1.GangliaGeneral)
          annotation (Line(points={{40,50},{60.2,50}}, color={0,0,127}));
        connect(Viscosity.port, capillarries.q_in[3]) annotation (Line(points={{60,84},
                {4,84},{4,18},{-18,18},{-18,0},{-18.1,0},{-18.1,-0.371429}},
                                                            color={0,127,255}));
        connect(viscosity.port, capillarries.q_in[4]) annotation (Line(points={{-58,16},
                {-18,16},{-18,-5.55112e-17},{-18.1,-5.55112e-17}},
                                                             color={0,127,255}));
        connect(aplhaReceptorsActivityFactor2_1.port_a, capillarries.q_in[5])
          annotation (Line(points={{60,54},{4,54},{4,18},{-18.1,18},{-18.1,
                0.371429}},
              color={0,127,255}));
        connect(vasopressin.port, capillarries.q_in[6]) annotation (Line(points={{-28,58},
                {-44,58},{-44,16},{-18.1,16},{-18.1,0.742857}},
                                                  color={0,127,255}));
        connect(resistor2_1.q_out, port_a) annotation (Line(
            points={{80,0},{110,0}},
            color={127,0,0},
            thickness=0.5));
        connect(anesthesiaVascularConductance.F, Anesthesia.u) annotation (Line(
              points={{-33,88},{6,88},{6,76},{62,76}},  color={0,0,127}));
        connect(vasopressin.C, ADHEffect2.u)
          annotation (Line(points={{-17,68},{62,68}},color={0,0,127}));
        connect(metabolism.a_port, resistor2_1.q_in) annotation (Line(
            points={{38,0},{60,0}},
            color={127,0,0},
            thickness=0.5));
        connect(metabolism.b_port, capillarries.q_in[7]) annotation (Line(
            points={{18,0},{-18,0},{-18,1.11429},{-18.1,1.11429}},
            color={127,0,0},
            thickness=0.5));
        annotation (Icon(graphics={Text(
                extent={{-160,-100},{160,-140}},
                textColor={127,0,0},
                textString="%name")}));
      end Tissue;
    end Components;

    package Examples
      model VentricleTest

        replaceable package Blood = Physiolibrary.Media.Blood                   constrainedby
          Physiolibrary.Media.Interfaces.PartialMedium                                                                                     annotation ( choicesAllMatching = true);
        Components.Ventricle                            rightVentricle(
          redeclare package Medium = Blood,
          stateName="RightVentricle.Vol",
          n_Diastole=2.0,
          n_Systole=0.5,
          BasicCompliance(displayUnit="ml/mmHg") = 2.1901798014693e-07,
          additionalPressure_Systolic(displayUnit="mmHg") = 1199.901486735,
          initialVol=8.75e-05,
          NormalEndDiastolicVolume=0.000125,
          NormalFillingPressure=95.9921189388,
          stiffnes=1,
          NormalSystolicPressure=1666.5298426875,
          NormalEndSystolicVolume=5.122e-05,
          contractilityBasic=1,
          K=1,
          AmbientPressure=101325.0144354)
               annotation (Placement(transformation(extent={{46,-56},{2,-12}})));
        Fluid.Sources.PressureSource rightAtrium(pressure_start(displayUnit=
                "mmHg") = 101422.97689116, redeclare package Medium = Blood)
          annotation (Placement(transformation(extent={{-62,-8},{-42,-28}})));
        Fluid.Sources.PressureSource pulmonaryArtery(pressure_start(displayUnit=
               "mmHg") = 102991.54427809, redeclare package Medium = Blood)
          annotation (Placement(transformation(extent={{-58,22},{-38,2}})));
        Components.SA_Node SA_node
          annotation (Placement(transformation(extent={{-54,30},{-34,50}})));
        Types.Constants.PressureConst pericardium(k=-445.2967739661)
          annotation (Placement(transformation(extent={{-90,68},{-82,76}})));
        Types.Constants.FrequencyConst Sympathicus(k(displayUnit="Hz") = 1.5)
          annotation (Placement(transformation(extent={{-90,60},{-82,52}})));
        Types.Constants.FrequencyConst Parasymphaticus(k(displayUnit="Hz") = 2)
          annotation (Placement(transformation(extent={{-90,30},{-82,38}})));
      equation
        connect(rightAtrium.y, rightVentricle.port_a) annotation (Line(
            points={{-42,-18},{-16,-18},{-16,-18},{19.6,-18},{19.6,-16.4}},
            color={127,0,0},
            thickness=0.5));
        connect(rightVentricle.port_b, pulmonaryArtery.y) annotation (Line(
            points={{28.4,-12},{28.4,12},{-38,12}},
            color={127,0,0},
            thickness=0.5));
        connect(SA_node.Rate, rightVentricle.HeartRate) annotation (Line(points=
               {{-34.2,40},{-10,40},{-10,-52},{19.16,-52},{19.16,-49.4}}, color=
               {0,0,127}));
        connect(pericardium.y, rightVentricle.Pericardium) annotation (Line(
              points={{-81,72},{56,72},{56,-34},{31.7,-34}}, color={0,0,127}));
        connect(Sympathicus.y, SA_node.BetaReceptorsEffect) annotation (Line(
              points={{-81,56},{-66,56},{-66,38},{-54,38}}, color={0,0,127}));
        connect(Sympathicus.y, rightVentricle.GangliaGeneral) annotation (Line(
              points={{-81,56},{66,56},{66,-42},{31.92,-42},{31.92,-42.58}},
              color={0,0,127}));
        connect(Parasymphaticus.y, SA_node.VagusNerve_NA_Hz)
          annotation (Line(points={{-81,34},{-54,34}}, color={0,0,127}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
              coordinateSystem(preserveAspectRatio=false)),
              Documentation(revisions = "<html>
        <p><i>2022</i></p>
        <p>Marek Matejak, marek@matfyz.cz </p>
        </html>"),
          experiment(StopTime = 5));
      end VentricleTest;

      model DiastoleTest
        replaceable package Blood = Physiolibrary.Media.Blood                   constrainedby
          Physiolibrary.Media.Interfaces.PartialMedium                                                                                     annotation ( choicesAllMatching = true);
        Fluid.Sources.PressureSource rightAtrium(pressure_start(displayUnit=
                "mmHg") = 101422.97689116, redeclare package Medium = Blood)
          annotation (Placement(transformation(extent={{-82,-20},{-62,0}})));
      Types.BusConnector busConnector "signals of organ bood flow resistence"
          annotation (Placement(transformation(extent={{2,32},{22,52}}),
              iconTransformation(extent={{-108,-38},{-92,-22}})));
        Components.Diastole                            diastole(
          redeclare package Medium = Blood,
          stiffnes=1,
          n_Diastole=2,
          NormalFillingPressure=95.9921189388,
          NormalEndDiastolicVolume=0.000125,
          NormalExternalPressure(displayUnit="mmHg") = -445.2967739661,
          AmbientPressure=101325.0144354)
          annotation (Placement(transformation(extent={{-28,14},{-8,34}})));
        Fluid.Sensors.PressureMeasure pressureMeasure(redeclare package Medium =
              Blood)
          annotation (Placement(transformation(extent={{52,-12},{72,8}})));
      equation
        connect(diastole.externalPressure, busConnector.Pericardium_Pressure)
          annotation (Line(
            points={{-8,18},{12,18},{12,42}},
            color={0,0,127},
            smooth=Smooth.None), Text(
            string="%second",
            index=1,
            extent={{6,3},{6,3}}));
        connect(rightAtrium.y, diastole.port) annotation (Line(
            points={{-62,-10},{-18,-10},{-18,14}},
            color={127,0,0},
            thickness=0.5));
        connect(rightAtrium.y,pressureMeasure.port)  annotation (Line(
            points={{-62,-10},{48,-10},{48,-16},{62,-16},{62,-12}},
            color={127,0,0},
            thickness=0.5));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
              coordinateSystem(preserveAspectRatio=false)),
              Documentation(revisions = "<html>
        <p><i>2022</i></p>
        <p>Marek Matejak, marek@matfyz.cz </p>
        </html>"),
          experiment(StopTime = 5));
      end DiastoleTest;

      model RightHeartTest
        replaceable package Blood = Physiolibrary.Media.Blood                   constrainedby
          Physiolibrary.Media.Interfaces.PartialMedium                                                                                     annotation ( choicesAllMatching = true);
        Components.Ventricle                            rightVentricle(
          redeclare package Medium = Blood,
          stateName="RightVentricle.Vol",
          n_Diastole=2.0,
          n_Systole=0.5,
          BasicCompliance(displayUnit="ml/mmHg") = 2.1901798014693e-07,
          additionalPressure_Systolic(displayUnit="mmHg") = 1199.901486735,
          initialVol=8.75e-05,
          NormalEndDiastolicVolume=0.000125,
          NormalFillingPressure=95.9921189388,
          stiffnes=1,
          NormalSystolicPressure=1666.5298426875,
          NormalEndSystolicVolume=5.122e-05,
          contractilityBasic=1,
          K=1,
          AmbientPressure=101325.0144354)
               annotation (Placement(transformation(extent={{32,-56},{-12,-12}})));
        Fluid.Sources.PressureSource pulmonaryArtery(pressure_start(displayUnit=
               "mmHg") = 102991.54427809, redeclare package Medium = Blood)
          annotation (Placement(transformation(extent={{-58,-10},{-38,10}})));
        Components.SA_Node SA_node
          annotation (Placement(transformation(extent={{-48,30},{-28,50}})));
      Types.Constants.VolumeConst               RightAtriumV0(k=0)
        annotation (Placement(transformation(extent={{-60,-32},{-52,-24}})));
         Fluid.Components.ElasticVessel               RightAtrium(
          redeclare package Medium = Blood,
          stateName="RightAtrium.Vol",
          useExternalPressureInput=true,
          useV0Input=true,
          useComplianceInput=false,
          volume_start=5.1e-05,
          Compliance=9.3757696980707e-08,
          nPorts=2)                     "right atrium"
        annotation (Placement(transformation(extent={{-45,-55},{-25,-35}})));
        Fluid.Sources.PressureSource systemicArtery(pressure_start(displayUnit=
                "mmHg") = 113990.64123983, redeclare package Medium = Blood)
          annotation (Placement(transformation(extent={{-100,-96},{-80,-76}})));
        Fluid.Components.Conductor systemic(redeclare package Medium = Blood,
            Conductance=1.250102626409427e-07*(5/90))
                   annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={-54,-86})));
        Types.Constants.PressureConst pericardium(k=-445.2967739661)
          annotation (Placement(transformation(extent={{32,-26},{40,-18}})));
        Types.Constants.FrequencyConst Sympathicus(k(displayUnit="Hz") = 1.5)
          annotation (Placement(transformation(extent={{-92,52},{-84,60}})));
        Types.Constants.FrequencyConst Parasymphaticus(k(displayUnit="Hz") = 2)
          annotation (Placement(transformation(extent={{-92,30},{-84,38}})));
      equation
        connect(rightVentricle.port_b, pulmonaryArtery.y) annotation (Line(
            points={{14.4,-12},{14.4,0},{-38,0}},
            color={127,0,0},
            thickness=0.5));
      connect(RightAtrium.zeroPressureVolume,RightAtriumV0. y) annotation (Line(
          points={{-42,-36},{-42,-28},{-51,-28}},
          color={0,0,127},
          smooth=Smooth.None));
        connect(RightAtrium.q_in[1], rightVentricle.port_a) annotation (Line(
            points={{-35.1,-45.65},{-32,-45.65},{-32,-46},{-18,-46},{-18,-16},{
                5.6,-16},{5.6,-16.4}},
            color={127,0,0},
            thickness=0.5));
        connect(systemicArtery.y, systemic.q_out) annotation (Line(
            points={{-80,-86},{-64,-86}},
            color={127,0,0},
            thickness=0.5));
        connect(systemic.q_in, RightAtrium.q_in[2]) annotation (Line(
            points={{-44,-86},{-35.1,-86},{-35.1,-44.35}},
            color={127,0,0},
            thickness=0.5));
        connect(SA_node.Rate, rightVentricle.HeartRate) annotation (Line(points=
               {{-28.2,40},{-14,40},{-14,-54},{5.16,-54},{5.16,-49.4}}, color={
                0,0,127}));
        connect(Sympathicus.y, SA_node.BetaReceptorsEffect) annotation (Line(
              points={{-83,56},{-56,56},{-56,38},{-48,38}}, color={0,0,127}));
        connect(Sympathicus.y, rightVentricle.GangliaGeneral) annotation (Line(
              points={{-83,56},{64,56},{64,-42},{17.92,-42},{17.92,-42.58}},
              color={0,0,127}));
        connect(Parasymphaticus.y, SA_node.VagusNerve_NA_Hz)
          annotation (Line(points={{-83,34},{-48,34}}, color={0,0,127}));
        connect(pericardium.y, rightVentricle.Pericardium) annotation (Line(
              points={{41,-22},{46,-22},{46,-34},{17.7,-34}}, color={0,0,127}));
        connect(pericardium.y, RightAtrium.externalPressure) annotation (Line(
              points={{41,-22},{46,-22},{46,-8},{-28,-8},{-28,-36}}, color={0,0,
                127}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
              coordinateSystem(preserveAspectRatio=false)),
              Documentation(revisions = "<html>
        <p><i>2022</i></p>
        <p>Marek Matejak, marek@matfyz.cz </p>
        </html>"),
          experiment(StopTime = 5));
      end RightHeartTest;

      model RightAtriumTest
        replaceable package Blood = Physiolibrary.Media.Blood                   constrainedby
          Physiolibrary.Media.Interfaces.PartialMedium                                                                                     annotation ( choicesAllMatching = true);
      Types.Constants.VolumeConst               RightAtriumV0(k=0)
        annotation (Placement(transformation(extent={{-60,-46},{-52,-38}})));
         Fluid.Components.ElasticVessel               RightAtrium(
          redeclare package Medium = Blood,
          stateName="RightAtrium.Vol",
          useExternalPressureInput=true,
          useV0Input=true,
          useComplianceInput=false,
          volume_start=5.16454e-05,
          Compliance=9.3757696980707e-08,
          nPorts=2)                     "right atrium"
        annotation (Placement(transformation(extent={{-45,-65},{-25,-45}})));
        Fluid.Components.Conductor systemic(redeclare package Medium = Blood,
            Conductance=1.250102626409427e-07*(5/90))
                   annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={-54,-86})));
        Types.Constants.PressureConst pericardium(k=-445.2967739661)
          annotation (Placement(transformation(extent={{-42,-6},{-34,2}})));
        Fluid.Sources.VolumeOutflowSource bloodFlow(SolutionFlow(displayUnit=
                "l/min") = 9.1666666666667e-05,
                                   redeclare package Medium = Blood)
          annotation (Placement(transformation(extent={{14,-64},{34,-44}})));
        Fluid.Sources.PressureSource systemicArtery(pressure_start(displayUnit=
                "mmHg") = 113990.64123983, redeclare package Medium = Blood)
          annotation (Placement(transformation(extent={{-96,-96},{-76,-76}})));
      equation
      connect(RightAtrium.zeroPressureVolume,RightAtriumV0. y) annotation (Line(
          points={{-42,-46},{-46,-46},{-46,-42},{-51,-42}},
          color={0,0,127},
          smooth=Smooth.None));
        connect(systemic.q_in, RightAtrium.q_in[1]) annotation (Line(
            points={{-44,-86},{-35.1,-86},{-35.1,-55.65}},
            color={127,0,0},
            thickness=0.5));
        connect(pericardium.y, RightAtrium.externalPressure) annotation (Line(
              points={{-33,-2},{-28,-2},{-28,-46}}, color={0,0,127}));
        connect(RightAtrium.q_in[2], bloodFlow.q_in) annotation (Line(
            points={{-35.1,-54.35},{16,-54.35},{16,-54},{14,-54}},
            color={127,0,0},
            thickness=0.5));
        connect(systemicArtery.y, systemic.q_out) annotation (Line(
            points={{-76,-86},{-64,-86}},
            color={127,0,0},
            thickness=0.5));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
              coordinateSystem(preserveAspectRatio=false)),
              Documentation(revisions = "<html>
        <p><i>2022</i></p>
        <p>Marek Matejak, marek@matfyz.cz </p>
        </html>"),
          experiment(StopTime = 5));
      end RightAtriumTest;

      model RightHearTissue
        Components.Tissue rightHeartTissue(redeclare package Blood =
              Physiolibrary.Media.Blood)
          annotation (Placement(transformation(extent={{-20,0},{0,20}})));
        Fluid.Sources.PressureSource rightAtrium(pressure_start(displayUnit=
                "mmHg") = 101422.97689116, redeclare package Medium =
              Physiolibrary.Media.Blood)
          annotation (Placement(transformation(extent={{-78,18},{-58,-2}})));
        Fluid.Sources.PressureSource systemicArtery(pressure_start(displayUnit=
                "mmHg") = 114657.2531769, redeclare package Medium =
              Physiolibrary.Media.Blood)
          annotation (Placement(transformation(extent={{36,72},{56,52}})));
        Types.Constants.FrequencyConst Sympathicus(k(displayUnit="Hz") = 1.5)
          annotation (Placement(transformation(extent={{-22,62},{-14,54}})));
        Types.Constants.PowerConst power(k(displayUnit="W") = 0.15)
          annotation (Placement(transformation(extent={{-64,38},{-56,46}})));
        inner Modelica.Fluid.System system(T_ambient=310.15)
          annotation (Placement(transformation(extent={{66,-74},{86,-54}})));
      equation
        connect(rightAtrium.y, rightHeartTissue.port_b) annotation (Line(
            points={{-58,8},{-40,8},{-40,10},{-25.8,10}},
            color={127,0,0},
            thickness=0.5));
        connect(systemicArtery.y, rightHeartTissue.port_a) annotation (Line(
            points={{56,62},{68,62},{68,10},{6,10}},
            color={127,0,0},
            thickness=0.5));
        connect(Sympathicus.y, rightHeartTissue.Ganglia) annotation (Line(
              points={{-13,58},{-6,58},{-6,15}}, color={0,0,127}));
        connect(power.y, rightHeartTissue.motionPower) annotation (Line(points=
                {{-55,42},{-17,42},{-17,19}}, color={0,0,127}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
              coordinateSystem(preserveAspectRatio=false)));
      end RightHearTissue;
    end Examples;

    class References "References"
      extends Modelica.Icons.References;

      annotation (Documentation(info="<html>
<table>

	<tr>
		<td>[Bazett1997]</td>
		<td>H. C. Bazett, \"AN ANALYSIS OF THE TIME-RELATIONS OF ELECTROCARDIOGRAMS,\" Annals of Noninvasive Electrocardiology, vol. 2, pp. 177-194, 1997. </td>
	</tr>
	<tr>
		<td>[Bootsma1994]</td>
		<td>M. Bootsma, C. A. Swenne, H. H. Van Bolhuis, P. C. Chang, V. M. Cats, and A. Bruschke, \"Heart rate and heart rate variability as indexes of sympathovagal balance,\" American Journal of Physiology, vol. 266, pp. H1565-H1565, 1994. </td>
	</tr>
	<tr>
		<td>[Braunwald1976]</td>
		<td>E. Braunwald, J. Ross, and E. H. Sonnenblick, Mechanisms of contraction of the normal and failing heart: Little, Brown Boston, 1976. </td>
	</tr>
	<tr>
		<td>[Carter1998]</td>
		<td>Y. M. Carter, C. X. Jia, P. F. Soto, J. P. Starr, D. G. Rabkin, D. T. Hsu, et al., \"Diastolic properties, myocardial water content, and histologic condition of the rat left ventricle: effect of varied osmolarity of a coronary perfusate,\" The Journal of heart and lung transplantation : the official publication of the International Society for Heart Transplantation, vol. 17, pp. 140-149, 1998/02// 1998. </td>
	</tr>
	<tr>
		<td>[Collins-Nakai1994]</td>
		<td>R. L. Collins-Nakai, D. Noseworthy, and G. D. Lopaschuk, \"Epinephrine increases ATP production in hearts by preferentially increasing glucose metabolism,\" Am J Physiol, vol. 267, pp. H1862-71, Nov 1994. </td>
	</tr>
	<tr>
		<td>[Fatema2002]</td>
		<td>K. Fatema, O. Hirono, Y. Takeishi, J. Nitobe, K. Kaneko, M. Ito, et al., \"Hemodialysis improves myocardial interstitial edema and left ventricular diastolic function in patients with end-stage renal disease: noninvasive assessment by ultrasonic tissue characterization,\" Heart and vessels, vol. 16, pp. 227-231, 2002. </td>
	</tr>
	<tr>
		<td>[Ferguson1985]</td>
		<td>D. W. Ferguson, F. M. Abboud, and A. L. Mark, \"Relative contribution of aortic and carotid baroreflexes to heart rate control in man during steady state and dynamic increases in arterial pressure,\" The Journal of Clinical Investigation, vol. 76, pp. 2265-2274, 1985. </td>
	</tr>
	<tr>
		<td>[Gaasch1975]</td>
		<td>W. H. Gaasch, J. S. Cole, M. A. Quinones, and J. Alexander, \"Dynamic determinants of letf ventricular diastolic pressure-volume relations in man,\" Circulation, vol. 51, pp. 317-323, 1975. </td>
	</tr>
	<tr>
		<td>[Guyton1961]</td>
		<td>A. C. Guyton and K. Sagawa, \"Compensations of cardiac output and other circulatory functions in areflex dogs with large AV fistulas,\" The American journal of physiology, vol. 200, p. 1157, 1961. </td>
	</tr>
	<tr>
		<td>[Kumagai1994]</td>
		<td>K. Kumagai and I. A. Reid, \"Angiotensin II exerts differential actions on renal nerve activity and heart rate,\" Hypertension, vol. 24, pp. 451-456, 1994. </td>
	</tr>
	<tr>
		<td>[Langer1997]</td>
		<td>G. A. Langer, The myocardium: Academic Press, 1997. </td>
	</tr>
	<tr>
		<td>[Little1993]</td>
		<td>W. C. Little and C. P. Cheng, \"Effect of exercise on left ventricular-arterial coupling assessed in the pressure-volume plane,\" AMERICAN JOURNAL OF PHYSIOLOGY, vol. 264, pp. H1629-H1629, 1993. </td>
	</tr>
	<tr>
		<td>[McKeever1958]</td>
		<td>W. McKeever, D. Gregg, and P. Canney, \"Oxygen uptake of the nonworking left ventricle,\" Circulation research, vol. 6, pp. 612-623, 1958. </td>
	</tr>
	<tr>
		<td>[MCKEEVER1958]</td>
		<td>W. P. MCKEEVER, D. E. GREGG, and P. C. CANNEY, \"Oxygen Uptake of the Nonworking Left Ventricle,\" Circulation Research, vol. 6, pp. 612-623, September 1, 1958 1958. </td>
	</tr>
	<tr>
		<td>[MONROE1960]</td>
		<td>R. G. MONROE and G. FRENCH, \"Ventricular Pressure-Volume Relationships and Oxygen Consumption in Fibrillation and Arrest,\" Circulation Research, vol. 8, pp. 260-266, January 1, 1960 1960. </td>
	</tr>
	<tr>
		<td>[MONROE1961]</td>
		<td>R. G. MONROE and G. N. FRENCH, \"Left ventricular pressure-volume relationships and myocardial oxygen consumption in the isolated heart,\" Circulation research, vol. 9, pp. 362-373, 1961. </td>
	</tr>
	<tr>
		<td>[Murphy2008]</td>
		<td>E. Murphy and C. Steenbergen, \"Ion transport and energetics during cell death and protection,\" Physiology (Bethesda), vol. 23, pp. 115-23, Apr 2008. </td>
	</tr>
	<tr>
		<td>[NODA1993]</td>
		<td>T. NODA, C.-P. CHENG, P. P. DE TOMBE, and W. C. LITTLE, \"Curvilinearity of LV end-systolic pressure-volume and dP/dt,-end-diastolic volume relations,\" 1993. </td>
	</tr>
	<tr>
		<td>[Pogátsa1982]</td>
		<td>G. Pogátsa, M. Z. Koltai, and G. Grósz, \"The role of the myocardial water content in heart function,\" Acta physiologica Academiae Scientiarum Hungaricae, vol. 59, pp. 305-309, 1982 1982. </td>
	</tr>
	<tr>
		<td>[Prabhu1993]</td>
		<td>S. D. Prabhu and G. L. Freeman, \"Left ventricular energetics in closed-chest dogs,\" Am J Physiol, vol. 265, pp. H1048-55, Oct 1993. </td>
	</tr>
	<tr>
		<td>[Raeder1995]</td>
		<td>E. A. Raeder, P. Albrecht, M. Perrott, and R. J. Cohen, \"Kinetics of Cycle Length Dependence of Ventricular Repolarization,\" Journal of Cardiovascular Electrophysiology, vol. 6, pp. 163-169, 1995. </td>
	</tr>
	<tr>
		<td>[ROSS1965]</td>
		<td>J. ROSS, J. W. LINHART, and E. BRAUNWALD, \"Effects of Changing Heart Rate in Man by Electrical Stimulation of the Right Atrium: Studies at Rest, during Exercise, and with Isoproterenol,\" Circulation, vol. 32, pp. 549-558, October 1, 1965 1965. </td>
	</tr>
	<tr>
		<td>[Sagawa1988]</td>
		<td>K. Sagawa, L. Maughan, H. Suga, and K. Sunagawa, Cardiac contraction and the pressure-volume relationship vol. 480: Oxford University Press New York, 1988. </td>
	</tr>
	<tr>
		<td>[Suga1979]</td>
		<td>H. Suga, Total mechanical energy of a ventricle model and cardiac oxygen consumption vol. 236, 1979. </td>
	</tr>
	<tr>
		<td>[SUGA1974]</td>
		<td>H. SUGA and K. SAGAWA, \"Instantaneous Pressure-Volume Relationships and Their Ratio in the Excised, Supported Canine Left Ventricle,\" Circulation Research, vol. 35, pp. 117-126, July 1, 1974 1974. </td>
	</tr>
	<tr>
		<td>[SUGA1976]</td>
		<td>H. SUGA, K. SAGAWA, and D. P. KOSTIUK, \"Controls of ventricular contractility assessed by pressure-volume ratio, Emax,\" Cardiovascular Research, vol. 10, pp. 582-592, September 1, 1976 1976. </td>
	</tr>
	<tr>
		<td>[Sugimoto1966]</td>
		<td>T. Sugimoto, K. Sagawa, and A. Guyton, Effect of tachycardia on cardiac output during normal and increased venous return vol. 211, 1966. </td>
	</tr>
	<tr>
		<td>[Takeshita1979]</td>
		<td>A. Takeshita, A. L. Mark, D. L. Eckberg, and F. M. Abboud, Effect of central venous pressure on arterial baroreflex control of heart rate vol. 236, 1979. </td>
	</tr>
	<tr>
		<td>[Warner1962]</td>
		<td>H. R. Warner and A. Cox, A mathematical model of heart rate control by sympathetic and vagus efferent information vol. 17, 1962. </td>
	</tr>
	<tr>
		<td>[Weber1977]</td>
		<td>K. T. Weber and J. S. Janicki, Myocardial oxygen consumption: the role of wall force and shortening vol. 233, 1977. </td>
	</tr>
	<tr>
		<td>[Woo1972]</td>
		<td>S. L. Y. Woo, A. S. Kobayashi, C. Lawrence, and W. A. Schlegel, \"Mathematical model of the corneo-scleral shell as applied to intraocular pressure-volume relations and applanation tonometry,\" Annals of Biomedical Engineering, vol. 1, pp. 87-98, 1972/09/01 1972. </td>
	</tr>
	<tr>
		<td>[Xenopoulos1994]</td>
		<td>N. P. Xenopoulos and R. J. Applegate, \"The effect of vagal stimulation on left ventricular systolic and diastolic performance,\" American Journal of Physiology-Heart and Circulatory Physiology, vol. 35, p. H2167, 1994.  </td>
	</tr>

</table>
</html>"));
    end References;

  end Heart;

  package Lungs

    model Lungs
       extends Icons.Lungs;
      import Physiolibrary.Types.*;

      replaceable package Air = Media.Air constrainedby
        Physiolibrary.Media.Interfaces.PartialMedium                                                 annotation (
         choicesAllMatching = true, Dialog( group = "Ventilation"));
      replaceable package PleuralFluid = Physiolibrary.Media.Water constrainedby
        Physiolibrary.Media.Interfaces.PartialMedium                                                                          annotation (
         choicesAllMatching = true, Dialog( group = "Thorax"));
      replaceable package Blood = Physiolibrary.Media.Blood  constrainedby
        Physiolibrary.Media.Interfaces.PartialMedium                                                                                     annotation (
         choicesAllMatching = true, Dialog( group = "Perfusion"));

      parameter Integer NRU=1 "Number of respiratory units";

      parameter Integer nPorts=0   "Number of airways ports" annotation (
        Evaluate = true,
        Dialog(connectorSizing = true, group = "Ports"));

      parameter Types.Volume LungsAirVolume_initial=0.00302   "Initial volume of alveolar space" annotation (Dialog( group = "Ventilation"));
      parameter Real Air_initial[Air.nS] = {100,40,47,760 - 187} "Initial composition of air inside alveoli"
         annotation (Dialog( group = "Ventilation"));
      parameter Types.Volume FunctionalResidualCapacity=0.00231   "Functional residual capacity" annotation (Dialog( group = "Ventilation"));
      parameter Types.HydraulicCompliance TotalCompliance=1.0197162129779e-06   "Pulmonary compliance" annotation (Dialog( group = "Ventilation"));

      parameter Types.Volume ResidualVolume=0.0013   "Residual volume"
        annotation (Dialog( group = "Ventilation"));
      parameter Types.Volume TotalLungCapacity=0.00623   "Total Capacity" annotation (Dialog( group = "Ventilation"));
      parameter Types.Volume BaseTidalVolume=0.0005   "Base Tidal Volume" annotation (Dialog( group = "Ventilation"));

      parameter Types.HydraulicResistance AirwaysResistances[NRU]=fill(NRU*147099.75,NRU)   "Airways resistances per respiratory unit" annotation (Dialog( group = "Ventilation"));

      parameter Real ArterialBloodComposition[Blood.nS]  = Blood.ArterialDefault
      "Initial composition of arterial blood" annotation (Dialog( group = "Perfusion"));

      parameter Real VenousBloodComposition[Blood.nS]  = Blood.VenousDefault
      "Initial composition of venous blood" annotation (Dialog( group = "Perfusion"));

      parameter Types.Volume ArteriesVolume_initial=0.000200488  "Initial volume of blood in arteries"
       annotation (Dialog( group = "Perfusion"));
      parameter Types.Volume ArteriesZeroPressureVolume=0.00011 "Blood arteries zero pressure volume"
       annotation (Dialog( group = "Perfusion"));
      parameter Types.HydraulicCompliance ArteriesCompliance=3.975326351982e-08 "Blood arteries compliance"
       annotation (Dialog( group = "Perfusion"));
      parameter Types.HydraulicConductance ArteriesConductance=1.6876385456527e-07   "Blood arteries conductance"
       annotation (Dialog( group = "Perfusion"));

      parameter Types.Volume CapillariesVolume_initial=0.000200141 "Initial volume of blood in capillaries"
      annotation (Dialog( group = "Perfusion"));
      parameter Types.Volume CapillariesZeroPressureVolume=0.00014 "Maximal volume of blood capillaries zero at zero blood pressure inside"
      annotation (Dialog( group = "Perfusion"));
      parameter Types.HydraulicCompliance CapillariesCompliance=3.45028324889e-08   "Blood capillaries compliance"
       annotation (Dialog( group = "Perfusion"));
      parameter Types.HydraulicConductance CapillariesConductance=2.250184727537e-07   "Blood capillaries conductance"
      annotation (Dialog( group = "Perfusion"));

      parameter Types.Volume VeinsVolume_initial=0.000210463  "Initial volume of blood in veins"
       annotation (Dialog( group = "Perfusion"));
      parameter Types.Volume VeinsZeroPressureVolume=0.00015 "Blood venous zero pressure volume"
       annotation (Dialog( group = "Perfusion"));
      parameter Types.HydraulicCompliance VeinsCompliance=4.5003694550739e-08 "Blood venous compliance"
       annotation (Dialog( group = "Perfusion"));
      parameter Types.HydraulicConductance VeinsConductance=6.7505541826109e-07   "Blood venous conductance"
       annotation (Dialog( group = "Perfusion"));

      parameter Real Diffusions[NRU](unit="mol2.s-1.J-1")=fill(1e-4,NRU)         "Gasses diffussions per respiratory unit" annotation (Dialog( group = "Diffusion"));

      parameter Volume PleuralFluidVolume_initial=0.0001   "Initial volume of pleural fluid volume" annotation(Dialog( group = "Thorax"));
      parameter Volume PleuralCavityVolume = PleuralFluidVolume_initial + LungsAirVolume_initial "Volume of relaxed pleural cavity" annotation(Dialog( group = "Thorax"));


     // parameter MolarFlowRate O2_consumption=1.666666666666667e-05*(2*7.71)       "Tissue consumption of O2 by metabolism";
     // parameter MolarFlowRate CO2_production=1.666666666666667e-05*(2*6.17)       "Tissue production of CO2 by metabolism";
     // parameter Pressure IntrathoraxPressure=-700   "Intrathorax pressure relative to ambient pressure";
      //parameter Volume ResidualVolume = 0.0013 "Lungs residual volume" annotation(Dialog( group = "Ventilation"));
      //parameter Volume TotalLungCapacity = 0.00623 "Total Lung Capacity" annotation(Dialog( group = "Ventilation"));
      //parameter Volume BaseTidalVolume = 0.0005 "Base Tidal Volume" annotation(Dialog( group = "Ventilation"));
      //parameter Volume LungsAirVolume_initial = 0.00302 "Initial volume of alveolar space" annotation(Dialog( group = "Ventilation"));
      //parameter Volume FunctionalResidualCapacity = 0.00231 "Functional residual capacity" annotation(Dialog( group = "Ventilation"));
      //parameter HydraulicResistance TotalResistance=147099.75   "Total lungs pathways resistance" annotation(Dialog( group = "Ventilation"));
      /*
  parameter Real BronchiResistanceFraction = 0.3 annotation(Dialog( group = "Ventilation"));
  parameter Real AlveoliDuctResistanceFraction = 0.2 annotation(Dialog( group = "Ventilation"));
  parameter Real TracheaResistanceFraction = 1 - (BronchiResistanceFraction + AlveoliDuctResistanceFraction) / 2 annotation(Dialog( group = "Ventilation"));
  parameter HydraulicResistance TracheaResistance = TotalResistance * TracheaResistanceFraction "Left Bronchi Resistance" annotation(Dialog( group = "Ventilation"));
  parameter HydraulicResistance LeftBronchiResistance = TotalResistance * BronchiResistanceFraction "Left Bronchi Resistance" annotation(Dialog( group = "Ventilation"));
  parameter HydraulicResistance LeftAlveoliResistance = TotalResistance * AlveoliDuctResistanceFraction "Left Alveoli Resistance" annotation(Dialog( group = "Ventilation"));
  parameter HydraulicResistance RightBronchiResistance = TotalResistance * BronchiResistanceFraction "Right Bronchi Resistance" annotation(Dialog( group = "Ventilation"));
  parameter HydraulicResistance RightAlveoliResistance = TotalResistance * AlveoliDuctResistanceFraction "Right Alveoli Resistance" annotation(Dialog( group = "Ventilation"));
  */
      //parameter HydraulicCompliance TotalCompliance=1.0197162129779e-06   "Total lungs compliance" annotation(Dialog( group = "Ventilation"));

    public
    Physiolibrary.Fluid.Components.ElasticVessel pulmArty(
        redeclare package Medium = Blood,
        massFractions_start=VenousBloodComposition,
        stateName="PulmArty.Vol",
        Compliance=ArteriesCompliance,
        ZeroPressureVolume=ArteriesZeroPressureVolume,
        useComplianceInput=false,
        useExternalPressureInput=true,
        useV0Input=false,
        volume_start=ArteriesVolume_initial,
        nPorts=1+NRU)
      annotation (Placement(transformation(extent={{-90,-28},{-70,-8}})));

    Physiolibrary.Fluid.Components.ElasticVessel pulmVeins(
        redeclare package Medium = Blood,
        massFractions_start=ArterialBloodComposition,
        stateName="PulmVeins.Vol",
        Compliance=VeinsCompliance,
        ZeroPressureVolume=VeinsZeroPressureVolume,
        useComplianceInput=false,
        useExternalPressureInput=true,
        useV0Input=false,
        volume_start=VeinsVolume_initial,
        nPorts=1+NRU)               "pulmonary veins"
      annotation (Placement(transformation(extent={{30,-26},{50,-6}})));

    Physiolibrary.Fluid.Components.Conductor pulmVeinsConductance(redeclare package
                  Medium =                                                                   Blood,
          Conductance=VeinsConductance)
      annotation (Placement(transformation(extent={{68,-27},{90,-5}})));
    Physiolibrary.Types.BusConnector busConnector
      "signals of organ bood flow resistence" annotation (Placement(
          transformation(extent={{84,-68},{104,-48}}),
                                                    iconTransformation(extent={{-120,20},
                {-80,60}})));
      Types.Constants.VolumeConst
                               volume(k=1e-06*(110 + 140 + 150))
        annotation (Placement(transformation(extent={{-26,-96},{-18,-88}})));
      Modelica.Blocks.Math.Sum sum2(nin=1+NRU)
        annotation (Placement(transformation(extent={{-26,-84},{-18,-76}})));
      Modelica.Blocks.Math.Gain PulmonaryCirculation_DeoxygenatedBloodVolume(k=1)
        annotation (Placement(transformation(extent={{-26,-70},{-18,-62}})));
      inner Modelica.Fluid.System system                              "Human body system setting" annotation (
        Placement(transformation(extent={{76,64},{96,84}})));
      Fluid.Components.ElasticVessel pleuralSpace(
        redeclare package Medium = PleuralFluid,
        volume_start=PleuralFluidVolume_initial,
        useThermalPort=false,
        ZeroPressureVolume=PleuralCavityVolume,
        Compliance=TotalCompliance,
        useExternalPressureInput=true,
        useSigmoidCompliance=false,
        useSubstances=false,
        useInternalSpaceInput=true,
        InternalSpace(displayUnit="l") = PleuralCavityVolume,
        nPorts=1) "Pleural space"
        annotation (Placement(transformation(extent={{-32,20},{-52,40}})));
      Fluid.Sensors.PressureMeasure pleauralPressure(redeclare package Medium =
            PleuralFluid, GetAbsolutePressure=false) "Pleaural pressure"
        annotation (Placement(transformation(
            extent={{10,-10},{-10,10}},
            rotation=0,
            origin={-64,40})));
      Fluid.Interfaces.FluidPort_a blood_in(redeclare package Medium = Blood)
        annotation (Placement(transformation(extent={{-110,-26},{-90,-6}}),
            iconTransformation(extent={{-110,-50},{-90,-30}})));
      Fluid.Interfaces.FluidPort_b blood_out(redeclare package Medium = Blood)
        annotation (Placement(transformation(extent={{90,-26},{110,-6}}),
            iconTransformation(extent={{90,-50},{110,-30}})));
      Types.RealIO.PressureInput respiratotyMusclePressure annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={-50,86}),iconTransformation(
            extent={{20,-20},{-20,20}},
            rotation=0,
            origin={80,40})));
      Components.RespiratoryUnit respiratoryUnit[NRU](
        redeclare package Air = Air,
        redeclare package Blood = Blood,
        AirVolume_initial=fill(LungsAirVolume_initial/NRU, NRU),
        Air_initial=fill(Air_initial, NRU),
        TotalCapacity=fill(TotalLungCapacity/NRU, NRU),
        TotalResistance=AirwaysResistances,
        CapillariesVolume_initial=fill(CapillariesVolume_initial/NRU, NRU),
        Blood_initial=fill(ArterialBloodComposition, NRU),
        ResidualVolume=fill(ResidualVolume/NRU, NRU),
        BaseTidalVolume=fill(BaseTidalVolume/NRU, NRU),
        FunctionalResidualCapacity=fill(FunctionalResidualCapacity/NRU, NRU),
        TotalCompliance=fill(TotalCompliance/NRU, NRU),
        CapillariesZeroPressureVolume=fill(CapillariesZeroPressureVolume/NRU, NRU),
        CapillariesCompliance=fill(CapillariesCompliance/NRU, NRU),
        CapillariesConductance=fill(CapillariesConductance/NRU, NRU),
        ArteriesConductance=fill(ArteriesConductance/NRU, NRU),
        Diffusion=Diffusions,
        each nPorts=nPorts) annotation (Placement(transformation(rotation=0, extent={{-10,-24},
                {10,-4}})));

      Fluid.Interfaces.FluidPorts_a airways[nPorts](redeclare package Medium = Air)
        annotation (Placement(transformation(rotation=0, extent={{-6,60},{6,94}}),
            iconTransformation(extent={{-6,82},{6,116}})));
      Modelica.Blocks.Math.Sum lungsVolume(nin=NRU) annotation (Placement(
            transformation(
            extent={{-4,-4},{4,4}},
            rotation=180,
            origin={-36,-2})));
      Modelica.Blocks.Math.Gain pericardium(k=0.84)
        annotation (Placement(transformation(extent={{-26,-56},{-18,-48}})));
    equation

      sum2.u[1]=pulmVeins.volume;
      PulmonaryCirculation_DeoxygenatedBloodVolume.u = pulmArty.volume;

      for i in 1:NRU loop
        sum2.u[1+i]=respiratoryUnit[i].pulmCapysVentilated.volume;

        connect(respiratoryUnit[i].blood_in, pulmArty.q_in[1+i]) annotation (Line(
          points={{-10,-18.4},{-70,-18.4},{-70,-18},{-80.1,-18}},
          color={127,0,0},
          thickness=0.5));
        connect(respiratoryUnit[i].blood_out, pulmVeins.q_in[1+i]) annotation (Line(
          points={{10.2,-18},{26,-18},{26,-16},{39.9,-16}},
          color={127,0,0},
          thickness=0.5));

        connect(pleauralPressure.pressure, respiratoryUnit[i].thoraxPressure)
        annotation (Line(points={{-70,36},{-74,36},{-74,6},{-4.1,6},{-4.1,-6.3}},
            color={0,0,127}));

        connect(airways, respiratoryUnit[i].airways) annotation (Line(
          points={{0,77},{0,-4.1}},
          color={127,0,0},
          thickness=0.5));
      end for;

      connect(volume.y, busConnector.PulmonaryCirculation_V0) annotation (Line(
          points={{-17,-92},{80,-92},{80,-58},{94,-58}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));

      connect(pulmVeinsConductance.q_in, pulmVeins.q_in[1]) annotation (Line(
          points={{68,-16},{54,-16},{54,-16},{39.9,-16}},
          color={127,0,0},
          thickness=0.5));

      connect(pleuralSpace.q_in[1],pleauralPressure.port)  annotation (Line(
          points={{-41.9,30},{-42,30},{-42,30},{-64,30}},
          color={127,0,0},
          thickness=0.5));
      connect(pleuralSpace.externalPressure,respiratotyMusclePressure)  annotation (
         Line(points={{-49,39},{-49,46},{-50,46},{-50,86}},
                                                       color={0,0,127}));
      connect(blood_in, pulmArty.q_in[1]) annotation (Line(
          points={{-100,-16},{-98,-16},{-98,-18},{-80.1,-18}},
          color={127,0,0},
          thickness=0.5));
      connect(pulmVeinsConductance.q_out, blood_out) annotation (Line(
          points={{90,-16},{100,-16}},
          color={127,0,0},
          thickness=0.5));
      connect(pleauralPressure.pressure, pulmVeins.externalPressure) annotation (
          Line(points={{-70,36},{-74,36},{-74,6},{47,6},{47,-7}},  color={0,0,127}));
      connect(pleauralPressure.pressure, pulmArty.externalPressure) annotation (
          Line(points={{-70,36},{-74,36},{-74,-4},{-73,-4},{-73,-9}},    color={0,0,
              127}));
      connect(sum2.y, busConnector.PulmonaryCirculation_OxygenatedBloodVolume)
        annotation (Line(points={{-17.6,-80},{78,-80},{78,-58},{94,-58}}, color={0,0,
              127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(PulmonaryCirculation_DeoxygenatedBloodVolume.y, busConnector.PulmonaryCirculation_DeoxygenatedBloodVolume)
        annotation (Line(points={{-17.6,-66},{76,-66},{76,-58},{94,-58}}, color={0,0,
              127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));

      connect(lungsVolume.y, pleuralSpace.internalSpace) annotation (Line(points={{-40.4,
              -2},{-62,-2},{-62,36},{-51,36}}, color={0,0,127}));
      connect(respiratoryUnit.volume, lungsVolume.u) annotation (Line(points={{4.8,
              -6.6},{4.8,-2},{-31.2,-2}},
                                    color={0,0,127}));
      connect(pleauralPressure.pressure, pericardium.u) annotation (Line(points=
             {{-70,36},{-74,36},{-74,-52},{-26.8,-52}}, color={0,0,127}));
      connect(pericardium.y, busConnector.Pericardium_Pressure) annotation (
          Line(points={{-17.6,-52},{78,-52},{78,-58},{94,-58}}, color={0,0,127}),
          Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      annotation ( Icon(coordinateSystem(
              preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
            graphics={
            Text(
              extent={{-108,-48},{106,-70}},
              lineColor={0,0,255},
              textString="%name")}),
      Documentation(revisions="<html>

<table>
<tr>
<td>Author:</td>
<td>Marek Matejak</td>
</tr>

<tr>
<td>License:</td>
<td><a href=\"http://www.physiomodel.org/license.html\">Physiomodel License 1.0</a> </td>
</tr>
<tr>
<td>By:</td>
<td>Charles University, Prague</td>
</tr>
<tr>
<td>Date of:</td>
<td>january 2009</td>
</tr>
<tr>
<td>References:</td>
<td>Tom Coleman: QHP 2008 beta 3, University of Mississippi Medical Center</td>
</tr>
</table>
<br/><p>Copyright &copy; 2014 Marek Matejak, Charles University in Prague.</p><br/>

</html>",
        info="<html>
<p>Blood volume (and pressures) distribution between </p>
<p><ul>
<li>pulmonary arteries, </li>
<li>pulmonary veins and </li>
<li>pulmonary capilaries.</li>
</ul></p>
<p>Blood flow through ventilated alveoli.</p>
</html>"));
    end Lungs;

    package Components
      model RespiratoryUnit "Lungs respiratory unit"
        extends Physiolibrary.Icons.PulmonaryCirculation;

        parameter Integer nPorts=0   "Number of airways ports" annotation (
          Evaluate = true,
          Dialog(connectorSizing = true, group = "Ports"));

        replaceable package Air = Media.Air
            constrainedby Media.Interfaces.PartialMedium  "Air medium model"
               annotation ( choicesAllMatching = true, Dialog( group = "Ventilation"));
        replaceable package Blood = Media.Blood
            constrainedby Media.Interfaces.PartialMedium "Blood medium model"
               annotation ( choicesAllMatching = true, Dialog( group = "Perfusion"));

        parameter Types.Volume AirVolume_initial=0.00302   "Initial volume of alveolar space" annotation (Dialog( group = "Ventilation"));
        parameter Types.MassFraction Air_initial[Air.nS] = Air.X(100,40,47,760 - 187) "Initial composition of air inside alveoli"
           annotation (Dialog( group = "Ventilation"));
        parameter Types.Volume FunctionalResidualCapacity=0.00231   "Functional residual capacity" annotation (Dialog( group = "Ventilation"));
        parameter Types.HydraulicCompliance TotalCompliance=1.0197162129779e-06   "Pulmonary compliance" annotation (Dialog( group = "Ventilation"));

        parameter Types.Volume ResidualVolume=0.0013   "Residual volume"
          annotation (Dialog( group = "Ventilation"));
        parameter Types.Volume TotalCapacity=0.00623   "Total Capacity" annotation (Dialog( group = "Ventilation"));
        parameter Types.Volume BaseTidalVolume=0.0005   "Base Tidal Volume" annotation (Dialog( group = "Ventilation"));

        parameter Types.HydraulicResistance TotalResistance=147099.75   "Total airways resistance" annotation (Dialog( group = "Ventilation"));

        parameter Types.Volume CapillariesVolume_initial=0.000200141 "Initial volume of blood in capillaries"
        annotation (Dialog( group = "Perfusion"));
        parameter Types.MassFraction Blood_initial[Blood.nS] = Blood.ArterialDefault "Initial composition of blood" annotation (Dialog( group = "Perfusion"));
        parameter Types.Volume CapillariesZeroPressureVolume=0.00014 "Maximal volume of blood capillaries zero at zero blood pressure inside"
        annotation (Dialog( group = "Perfusion"));
        parameter Types.HydraulicCompliance CapillariesCompliance=3.45028324889e-08   "Blood capillaries compliance"
         annotation (Dialog( group = "Perfusion"));

        parameter Types.HydraulicConductance CapillariesConductance=2.250184727537e-07   "Blood capillaries conductance"
        annotation (Dialog( group = "Perfusion"));
        parameter Types.HydraulicConductance ArteriesConductance=1.6876385456527e-07   "Blood arteries conductance"
         annotation (Dialog( group = "Perfusion"));

        parameter Real Diffusion(unit="mol2.s-1.J-1")=1e-4         "Gasses diffussion" annotation (Dialog( group = "Diffusion"));

       Fluid.Components.ElasticVessel pulmCapysVentilated(
          redeclare package Medium = Blood,
          massFractions_start=Blood_initial,
          useSubstances=true,
          stateName="PulmCapys.Vol",
          Compliance=CapillariesCompliance,
          ZeroPressureVolume=CapillariesZeroPressureVolume,
          useComplianceInput=false,
          useExternalPressureInput=true,
          useV0Input=false,
          volume_start=CapillariesVolume_initial,
          nPorts=2) "pulmonary capilaries"
          annotation (Placement(transformation(extent={{0,-48},{20,-28}})));

        Fluid.Components.Conductor pulmArty(redeclare package Medium = Blood,
            Conductance=ArteriesConductance)
          annotation (Placement(transformation(extent={{-73,-55},{-51,-33}})));
        Fluid.Components.Conductor pulmCapys(redeclare package Medium = Blood,
            Conductance=CapillariesConductance)
          annotation (Placement(transformation(extent={{64,-51},{86,-29}})));
        Fluid.Components.ElasticVessel alveoli(
          redeclare package Medium = Air,
          volume_start=AirVolume_initial,
          massFractions_start=Air_initial,
          useThermalPort=false,
          ZeroPressureVolume=FunctionalResidualCapacity,
          ResidualVolume=ResidualVolume,
          Compliance=TotalCompliance,
          useExternalPressureInput=true,
          useSigmoidCompliance=true,
          VitalCapacity=TotalCapacity - ResidualVolume,
          BaseTidalVolume=BaseTidalVolume,
          useSubstances=true,
          nPorts=nPorts)
                    "Alveolar space" annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={0,24})));
        Chemical.Components.GasSolubility O2_diffusion(KC=Diffusion)
          annotation (Placement(transformation(extent={{-54,-16},{-34,4}})));
        Chemical.Components.GasSolubility CO2_diffusion(KC=Diffusion)
          annotation (Placement(transformation(extent={{-22,-16},{-2,4}})));
        Fluid.Sensors.BloodGasesMeasurement alveolar(redeclare package Medium =
              Blood)
          annotation (Placement(transformation(extent={{32,-26},{52,-6}})));


      public
        Types.RealIO.PressureInput thoraxPressure(start=alveoli.ExternalPressure)
          annotation (Placement(transformation(
              rotation=270,
              extent={{-9,-9},{9,9}},
              origin={-41,77}), iconTransformation(
              extent={{-9,-9},{9,9}},
              rotation=270,
              origin={-41,77})));
        Types.RealIO.VolumeOutput volume annotation (Placement(transformation(
              rotation=90,
              extent={{-10,-10},{10,10}},
              origin={48,74}), iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={48,74})));
        Fluid.Interfaces.FluidPorts_a airways[nPorts](redeclare package Medium = Air)
          annotation (Placement(transformation(rotation=0, extent={{-6,82},{6,116}}),
              iconTransformation(extent={{-6,82},{6,116}})));
        Fluid.Interfaces.FluidPort_a blood_in(redeclare package Medium = Blood)
          annotation (Placement(transformation(rotation=0, extent={{-110,-54},{-90,-34}}),
              iconTransformation(extent={{-110,-54},{-90,-34}})));
        Fluid.Interfaces.FluidPort_b blood_out(redeclare package Medium = Blood)
          annotation (Placement(transformation(rotation=0, extent={{92,-50},{112,-30}}),
              iconTransformation(extent={{92,-50},{112,-30}})));
        Fluid.Components.Resistor airway[nPorts](redeclare package Medium = Air,
            each Resistance=TotalResistance) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={0,70})));
      equation
        if nPorts>0 then
          connect(airways, airway.q_in) annotation (Line(
              points={{0,99},{0,89.5},{1.77636e-15,89.5},{1.77636e-15,80}},
              color={127,0,0},
              thickness=0.5));
          connect(airway.q_out, alveoli.q_in) annotation (Line(
              points={{-1.77636e-15,60},{-1.77636e-15,40},{0,40},{0,23.9}},
              color={127,0,0},
              thickness=0.5));
        end if;
        connect(pulmArty.q_out, pulmCapysVentilated.q_in[1]) annotation (Line(
            points={{-51,-44},{10,-44},{10,-38.65},{9.9,-38.65}},
            color={127,0,0},
            thickness=0.5));
        connect(O2_diffusion.gas_port,alveoli. substances.O2) annotation (Line(
              points={{-44,4},{-44,12},{-12,12},{-12,14},{-8.88178e-16,14}},
                                                                           color={158,
                66,200}));
        connect(CO2_diffusion.gas_port,alveoli. substances.CO2) annotation (
            Line(points={{-12,4},{-12,14},{-8.88178e-16,14}},
                                                        color={158,66,200}));
        connect(alveolar.b_port, pulmCapys.q_in) annotation (Line(
            points={{48.2,-26.2},{48.2,-40},{64,-40}},
            color={127,0,0},
            thickness=0.5));
        connect(pulmCapysVentilated.substances.O2,O2_diffusion. liquid_port)
          annotation (Line(points={{0,-38},{-44,-38},{-44,-16}},         color={
                158,66,200}));
        connect(pulmCapysVentilated.substances.CO2,CO2_diffusion. liquid_port)
          annotation (Line(points={{0,-38},{-12,-38},{-12,-16}},
              color={158,66,200}));
        connect(pulmCapysVentilated.q_in[2],alveolar. a_port) annotation (Line(
            points={{9.9,-37.35},{36,-37.35},{36,-26.2}},
            color={127,0,0},
            thickness=0.5));
        connect(thoraxPressure, alveoli.externalPressure)
          annotation (Line(points={{-41,77},{-41,31},{-9,31}}, color={0,0,127}));
        connect(volume, alveoli.fluidVolume)
          annotation (Line(points={{48,74},{48,40},{8,40},{8,34}}, color={0,0,127}));
        connect(blood_in, pulmArty.q_in)
          annotation (Line(points={{-100,-44},{-73,-44}}, color={127,0,0}));
        connect(blood_out, pulmCapys.q_out)
          annotation (Line(points={{102,-40},{86,-40}}, color={127,0,0}));
        connect(thoraxPressure, pulmCapysVentilated.externalPressure) annotation (
            Line(points={{-41,77},{-41,50},{18,50},{18,-29},{17,-29}}, color={0,0,127}));

        connect(alveolar.substances, pulmCapysVentilated.substances)
          annotation (Line(
            points={{32,-16},{0,-16},{0,-38},{0,-38}},
            color={158,66,200},
            thickness=0.5));
           annotation (Dialog( group = "Perfusion"));
      end RespiratoryUnit;

      model LungBloodFlow
          extends Physiolibrary.Icons.LungShunt;
        Physiolibrary.Types.RealIO.VolumeFlowRateInput   CardiacOutput
          annotation (Placement(transformation(extent={{-120,40},{-80,80}})));

        parameter Physiolibrary.Types.Fraction BasicRLShuntFraction(displayUnit="%") =  0.02
        "basic percentage of total blood flow not exposed to lung air";                                                            //
      //  parameter Real BasicRLShunt(final displayUnit="ml/min") =  110; // 220.0;
        parameter Physiolibrary.Types.Pressure RightHemithorax_Pressure( displayUnit="mmHg") =   -533.28954966;
        parameter Physiolibrary.Types.Pressure LeftHemithorax_Pressure( displayUnit="mmHg") =   -533.28954966;

        Physiolibrary.Types.Pressure PressureGradientRightLeft(displayUnit="mmHg")
        "difference between right and left hemithorax pressure";
        Physiolibrary.Types.Fraction Thorax_RightLungFlowFract(displayUnit="1")
        "fraction of blood flow to right lung";
        Physiolibrary.Types.Fraction Thorax_LeftLungFlowFract(displayUnit="1")
        "fraction of blood flow to left lung";
        Physiolibrary.Types.Fraction RightHemithorax_LungInflation(displayUnit="1")
        "dammage effect of right hemithorax inflation";
        Physiolibrary.Types.Fraction LeftHemithorax_LungInflation(displayUnit="1")
        "dammage effect of left hemithorax inflation";
        Physiolibrary.Types.VolumeFlowRate Total(displayUnit="ml/min")
        "cardiac output";

        Physiolibrary.Types.VolumeFlowRate RightLeftShunt(displayUnit="ml/min")
        "blood flow not exposed to lung air without dammage effect";
        Physiolibrary.Types.VolumeFlowRate Alveolar(displayUnit="ml/min")
        "blood flow exposed to lung air without dammage effect";

      //  Real RightLungTotal(final displayUnit="ml/min") "right lung blood flow exposed to lung air without dammage effect";
      //  Real RightLungVentilated(final displayUnit="ml/min") "right lung blood flow exposed to lung air";
      //  Real RightLungShunt(final displayUnit="ml/min");
      //  Real LeftLungTotal(final displayUnit="ml/min");
      //  Real LeftLungVentilated(final displayUnit="ml/min");
      //  Real LeftLungShunt(final displayUnit="ml/min");
      //  Real AlveolarShunt(final displayUnit="ml/min");
      //  Real TotalShunt(final displayUnit="ml/min");

        parameter Real[:,3] PressureOnInflation =   {{ -4.0,  1.0,  0}, {  4.0,  0.0,  0}};
        parameter Real[:,3] PressureGradientOnFlowDist =   {{ -25,  0.0,  0}, {   0,  0.5,  0.03}, {  25,  1.0,  0}};

        Physiolibrary.Types.RealIO.VolumeFlowRateOutput AlveolarVentilated(
                                                          final displayUnit="ml/min") annotation (Placement(transformation(extent={{80,40},{120,80}}),
              iconTransformation(extent={{80,40},{120,80}})));
      Physiolibrary.Blocks.Interpolation.Curve
        Thorax_PressureGradientOnFlowDist(
        x=PressureGradientOnFlowDist[:, 1],
        y=PressureGradientOnFlowDist[:, 2],
        slope=PressureGradientOnFlowDist[:, 3],
          Xscale=101325/760)
        annotation (Placement(transformation(extent={{-40,52},{-20,72}})));
      Physiolibrary.Blocks.Interpolation.Curve Thorax_PressureOnInflationR(
        x=PressureOnInflation[:, 1],
        y=PressureOnInflation[:, 2],
        slope=PressureOnInflation[:, 3],
          Xscale=101325/760)
        annotation (Placement(transformation(extent={{52,46},{72,66}})));
      Physiolibrary.Blocks.Interpolation.Curve Thorax_PressureOnInflationL(
        x=PressureOnInflation[:, 1],
        y=PressureOnInflation[:, 2],
        slope=PressureOnInflation[:, 3],
          Xscale=101325/760)
        annotation (Placement(transformation(extent={{-2,-24},{18,-4}})));
      equation
             PressureGradientRightLeft  =  RightHemithorax_Pressure - LeftHemithorax_Pressure;

      //division between left and rigth lung blood flow by hemithorax pressure
             Thorax_PressureGradientOnFlowDist.u = PressureGradientRightLeft;
             Thorax_LeftLungFlowFract  =  Thorax_PressureGradientOnFlowDist.val;
             Thorax_RightLungFlowFract  =  1.0 - Thorax_LeftLungFlowFract;

      //damage effect of hemithorax pressure
             Thorax_PressureOnInflationR.u = RightHemithorax_Pressure;
             RightHemithorax_LungInflation = Thorax_PressureOnInflationR.val;
             Thorax_PressureOnInflationL.u = LeftHemithorax_Pressure;
             LeftHemithorax_LungInflation = Thorax_PressureOnInflationL.val;

             Total  =  CardiacOutput;
             RightLeftShunt  = BasicRLShuntFraction*Total; //min(BasicRLShunt,Total);
             Alveolar  =  Total - RightLeftShunt;
      //       RightLungTotal  =  Alveolar * Thorax_RightLungFlowFract;
      //       RightLungVentilated  =  RightLungTotal * RightHemithorax_LungInflation;
      //       RightLungShunt  =  RightLungTotal - RightLungVentilated;
      //       LeftLungTotal  =  Alveolar * Thorax_LeftLungFlowFract;
      //       LeftLungVentilated  =  LeftLungTotal * LeftHemithorax_LungInflation;
      //       LeftLungShunt  =  LeftLungTotal - LeftLungVentilated;
      //       AlveolarVentilated  =  RightLungVentilated + LeftLungVentilated;
      //       AlveolarShunt  =  RightLungShunt + LeftLungShunt;
      //       TotalShunt  =  RightLeftShunt + AlveolarShunt;
             AlveolarVentilated  = Alveolar * ( Thorax_RightLungFlowFract * RightHemithorax_LungInflation + Thorax_LeftLungFlowFract * LeftHemithorax_LungInflation);
        annotation ( Documentation(revisions="<html>

<table>
<tr>
<td>Author:</td>
<td>Marek Matejak</td>
</tr>
<tr>
<td>License:</td>
<td><a href=\"http://www.physiomodel.org/license.html\">Physiomodel License 1.0</a> </td>
</tr>
<tr>
<td>By:</td>
<td>Charles University, Prague</td>
</tr>
<tr>
<td>Date of:</td>
<td>january 2009</td>
</tr>
<tr>
<td>References:</td>
<td>Tom Coleman: QHP 2008 beta 3, University of Mississippi Medical Center</td>
</tr>
</table>
<br/><p>Copyright &copy; 2014 Marek Matejak, Charles University in Prague.</p><br/>

</html>", info="<html>
<p>Calculation of blood flow fraction through ventilated alveoli.</p>
</html>"),Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics={                             Text(
                extent={{-102,-92},{112,-114}},
                lineColor={0,0,255},
                textString="%name")}));
      end LungBloodFlow;

      model Angiotensine2
      //  extends Library.Interfaces.Tissues.Liver;
      //  extends Library.Interfaces.Tissues.Kidney;
        extends Physiolibrary.Icons.Lungs;

      // outer parameter Real ECF_Vol(final displayUnit="ml");

      Physiolibrary.Blocks.Factors.Normalization A2 annotation (Placement(transformation(extent={{-2,-2},{18,18}})));
      Physiolibrary.Types.Constants.ConcentrationConst A2CONC(k=0.3333e-9/
            1.046) "0.3333 pg/ml = 0.3333*1e-15/1e-6 kg/m3"
        annotation (Placement(transformation(extent={{-24,52},{-4,72}})));
      Physiolibrary.Types.BusConnector busConnector annotation (Placement(
            transformation(extent={{-88,78},{-68,98}}), iconTransformation(extent=
               {{-90,-70},{-70,-50}})));
        Modelica.Blocks.Interfaces.RealInput Renin annotation (Placement(transformation(extent={{-74,8},{-54,28}}),
              iconTransformation(extent={{-100,20},{-60,60}})));
        Modelica.Blocks.Interfaces.RealOutput Angiotensine2(
                                                     final displayUnit="pg/ml", quantity="Concentration")
                                                                annotation (
            Placement(transformation(extent={{18,-66},{38,-46}}),
              iconTransformation(extent={{80,-20},{120,20}})));
      Modelica.Blocks.Sources.Constant
          CEBase_ReninConc(k=1e6/30) "1 Gu/ml = 1e6 Gu/m3"
          annotation (Placement(transformation(extent={{-66,-12},{-46,8}})));
        Modelica.Blocks.Math.Division EndogenousRate
          annotation (Placement(transformation(extent={{-30,-2},{-10,18}})));
      equation
        connect(A2CONC.y, A2.yBase)
          annotation (Line(
            points={{-1.5,62},{8,62},{8,10}},
            color={0,0,127},
            smooth=Smooth.None));

        connect(CEBase_ReninConc.y, EndogenousRate.u2) annotation (Line(
            points={{-45,-2},{-40,-2},{-40,2},{-32,2}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(Renin, EndogenousRate.u1) annotation (Line(
            points={{-64,18},{-40,18},{-40,14},{-32,14}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(A2.u, EndogenousRate.y)
          annotation (Line(
            points={{0,8},{-9,8}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(A2.y, Angiotensine2)
          annotation (Line(
            points={{8,4},{8,-56},{28,-56}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(A2.y, busConnector.Angiotensin2) annotation (Line(
            points={{8,4},{8,-10},{28,-10},{28,88},{-78,88}},
            color={0,0,127},
            smooth=Smooth.None), Text(
            string="%second",
            index=1,
            extent={{6,3},{6,3}}));
      connect(A2.y, busConnector.AngiotensinII) annotation (Line(
          points={{8,4},{10,4},{10,-2},{72,-2},{72,88},{-78,88}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
        annotation ( Icon(coordinateSystem(
                preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
              graphics={Text(
                extent={{-128,102},{106,80}},
                lineColor={0,0,255},
                textString="%name")}));
      end Angiotensine2;

      model PulmonaryCirculation

         extends Physiolibrary.Icons.PulmonaryCirculation;

         replaceable package Blood =
            Physiolibrary.Media.Blood                                            constrainedby
          Physiolibrary.Media.Interfaces.PartialMedium                                                                                      annotation ( choicesAllMatching = true);

        //Can not be one port, because for example whole periferal resistance is taken as ResistorBases, but blood can accumulate inside

      Physiolibrary.Fluid.Interfaces.FluidPort_a q_in(redeclare package Medium =
              Blood)                                  "Blood inflow"
        annotation ( Placement(transformation(extent={{-110,
                -10},{-90,10}},  rotation=0),
                                        iconTransformation(extent={{-110,-10},{
                -90,10}})));
      Physiolibrary.Fluid.Interfaces.FluidPort_b q_out(redeclare package Medium =
              Blood)                                   "Blood outflow"
        annotation ( Placement(transformation(extent={{94,-10},
                {114,10}},       rotation=0),
                                      iconTransformation(extent={{90,-10},{110,
                10}})));

      Physiolibrary.Fluid.Components.ElasticVessel pulmCapys(
          redeclare package Medium = Blood,
        stateName="PulmCapys.Vol",
        useComplianceInput=true,
        useExternalPressureInput=true,
        useV0Input=true,
          volume_start=0.000200141,
        nPorts=3)                 "pulmonary capilaries"
        annotation (Placement(transformation(extent={{-22,-10},{-2,10}})));

      Physiolibrary.Fluid.Components.ElasticVessel pulmArty(
          redeclare package Medium = Blood,
        stateName="PulmArty.Vol",
        useComplianceInput=true,
        useExternalPressureInput=true,
        useV0Input=true,
          volume_start=0.000200488,
        nPorts=2)
        annotation (Placement(transformation(extent={{-86,-10},{-66,10}})));

      Physiolibrary.Fluid.Components.ElasticVessel pulmVeins(
          redeclare package Medium = Blood,
        stateName="PulmVeins.Vol",
        useComplianceInput=true,
        useExternalPressureInput=true,
        useV0Input=true,
          volume_start=0.000210463,
          nPorts=2)               "pulmonary veins"
        annotation (Placement(transformation(extent={{38,-10},{58,10}})));

      Physiolibrary.Fluid.Components.Conductor pulmArtyConductance(redeclare package
                    Medium = Blood, Conductance=1.6876385456527e-07)
        annotation (Placement(transformation(extent={{-67,-11},{-45,11}})));
      Physiolibrary.Types.Constants.VolumeConst ArtysV0(k=0.00011)
        annotation (Placement(transformation(extent={{-94,16},{-86,24}})));
      Physiolibrary.Types.Constants.HydraulicComplianceConst ArtysCompliance(k=
            3.975326351982e-08)
        annotation (Placement(transformation(extent={{-54,16},{-62,24}})));
      Physiolibrary.Types.Constants.VolumeConst               CapysV0(k=0.00014)
        annotation (Placement(transformation(extent={{-28,16},{-20,24}})));
      Physiolibrary.Types.Constants.HydraulicComplianceConst CapysCompliance(k=
            3.450283248890036e-008)
        annotation (Placement(transformation(extent={{4,16},{-4,24}})));
      Physiolibrary.Fluid.Components.Conductor pulmCapysConductance(redeclare package
                    Medium = Blood, Conductance=2.250184727537e-07)
        annotation (Placement(transformation(extent={{4,-11},{26,11}})));
      Physiolibrary.Types.Constants.VolumeConst               VeinsV0(k=0.00015)
        annotation (Placement(transformation(extent={{30,16},{38,24}})));
      Physiolibrary.Types.Constants.HydraulicComplianceConst VeinsCompliance(k=
            4.50036945507396e-008)
        annotation (Placement(transformation(extent={{66,14},{58,22}})));
      Physiolibrary.Fluid.Components.Conductor pulmVeinsConductance(redeclare package
                    Medium = Blood, Conductance=6.7505541826109e-07)
        annotation (Placement(transformation(extent={{62,-11},{84,11}})));
      Physiolibrary.Types.BusConnector busConnector
        "signals of organ bood flow resistence" annotation (Placement(
            transformation(extent={{18,66},{38,86}}), iconTransformation(extent=
               {{-108,42},{-92,58}})));
        Components.LungBloodFlow lungBloodFlow
          annotation (Placement(transformation(extent={{-26,74},{-6,94}})));
      Fluid.Sensors.VolumeFlowMeasure         volumeFlowMeasure(
                                                          redeclare package
            Medium = Blood)
        annotation (Placement(transformation(extent={{-42,-10},{-22,10}})));
        Modelica.Blocks.Math.Sum sum1(nin=3)
          annotation (Placement(transformation(extent={{-28,28},{-20,36}})));
        Modelica.Blocks.Math.Sum sum2(nin=2)
          annotation (Placement(transformation(extent={{50,-38},{42,-30}})));
      Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasure(redeclare package
                    Medium = Blood)
        annotation (Placement(transformation(extent={{-8,-26},{12,-6}})));
        Modelica.Blocks.Math.Gain PulmonaryCirculation_DeoxygenatedBloodVolume(k=1)
          annotation (Placement(transformation(extent={{-6,-68},{14,-48}})));
      equation
        connect(pulmArty.externalPressure,busConnector. Thorax_AvePressure) annotation (Line(
            points={{-69,9},{-69,14},{28,14},{28,76}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(pulmCapys.externalPressure,busConnector. Thorax_AvePressure) annotation (Line(
            points={{-5,9},{-5,14},{28,14},{28,76}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(pulmVeins.externalPressure,busConnector. Thorax_AvePressure) annotation (Line(
            points={{55,9},{55,14},{28,14},{28,76}},
            color={0,0,127},
            smooth=Smooth.None));
      connect(pulmArty.zeroPressureVolume, ArtysV0.y) annotation (Line(
          points={{-83,9},{-83,20},{-85,20}},
          color={0,0,127},
          smooth=Smooth.None));
        connect(pulmArty.compliance, ArtysCompliance.y)
                                                annotation (Line(
            points={{-76,9},{-76,20},{-63,20}},
            color={0,0,127},
            smooth=Smooth.None));
      connect(CapysV0.y, pulmCapys.zeroPressureVolume) annotation (Line(
          points={{-19,20},{-19,20},{-19,9}},
          color={0,0,127},
          smooth=Smooth.None));
        connect(CapysCompliance.y,pulmCapys.compliance)
                                                 annotation (Line(
            points={{-5,20},{-12,20},{-12,9}},
            color={0,0,127},
            smooth=Smooth.None));
      connect(pulmVeins.zeroPressureVolume, VeinsV0.y) annotation (Line(
          points={{41,9},{41,20},{39,20}},
          color={0,0,127},
          smooth=Smooth.None));
        connect(VeinsCompliance.y,pulmVeins.compliance)
                                                 annotation (Line(
            points={{57,18},{48,18},{48,9}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(lungBloodFlow.AlveolarVentilated, busConnector.AlveolarVentilated_BloodFlow)
          annotation (Line(
            points={{-6,90},{28,90},{28,76}},
            color={0,0,127},
            smooth=Smooth.None), Text(
            string="%second",
            index=1,
            extent={{6,3},{6,3}}));

        connect(pulmArtyConductance.q_out, volumeFlowMeasure.q_in) annotation (
            Line(
            points={{-45,0},{-42,0}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(ArtysV0.y, sum1.u[1]) annotation (Line(
            points={{-85,20},{-82,20},{-82,32},{-28,32},{-28,31.7333},{-28.8,
                31.7333}},
            color={0,0,127},
            smooth=Smooth.None));

        connect(CapysV0.y, sum1.u[2]) annotation (Line(
            points={{-19,20},{-18,20},{-18,26},{-80,26},{-80,32},{-28.8,32}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(VeinsV0.y, sum1.u[3]) annotation (Line(
            points={{39,20},{42,20},{42,26},{-78,26},{-78,32.2667},{-28.8,
                32.2667}},
            color={0,0,127},
            smooth=Smooth.None));
        sum2.u[1]=pulmCapys.volume;
        sum2.u[2]=pulmVeins.volume;

        connect(sum1.y, busConnector.PulmonaryCirculation_V0) annotation (Line(
            points={{-19.6,32},{28,32},{28,76}},
            color={0,0,127},
            smooth=Smooth.None), Text(
            string="%second",
            index=1,
            extent={{6,3},{6,3}}));
            PulmonaryCirculation_DeoxygenatedBloodVolume.u = pulmArty.volume;

        connect(busConnector.PulmonaryCirculation_OxygenatedBloodVolume, sum2.y)
          annotation (Line(
            points={{28,76},{28,-34},{41.6,-34}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None), Text(
            string="%first",
            index=-1,
            extent={{-6,3},{-6,3}}));
      connect(pressureMeasure.pressure, busConnector.PulmCapys_Pressure)
        annotation (Line(
          points={{8,-20},{28,-20},{28,76}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      connect(q_in, pulmArty.q_in[1]) annotation (Line(
          points={{-100,0},{-88,0},{-88,-0.65},{-76.1,-0.65}},
          color={127,0,0},
          thickness=0.5));
      connect(pulmArtyConductance.q_in, pulmArty.q_in[2]) annotation (Line(
          points={{-67,0},{-68,0},{-68,0.65},{-76.1,0.65}},
          color={127,0,0},
          thickness=0.5));
        connect(volumeFlowMeasure.q_out, pulmCapys.q_in[1]) annotation (Line(
            points={{-22,0},{-18,0},{-18,-0.866667},{-12.1,-0.866667}},
            color={127,0,0},
            thickness=0.5));
      connect(pulmCapys.q_in[2], pulmCapysConductance.q_in) annotation (Line(
          points={{-12.1,-2.22045e-16},{-6,-2.22045e-16},{-6,0},{4,0}},
          color={127,0,0},
          thickness=0.5));
      connect(pulmVeinsConductance.q_out, q_out) annotation (Line(
          points={{84,0},{104,0}},
          color={127,0,0},
          thickness=0.5));
        connect(pulmVeinsConductance.q_in, pulmVeins.q_in[1]) annotation (Line(
            points={{62,0},{54,0},{54,-0.65},{47.9,-0.65}},
            color={127,0,0},
            thickness=0.5));
        connect(PulmonaryCirculation_DeoxygenatedBloodVolume.y, busConnector.PulmonaryCirculation_DeoxygenatedBloodVolume)
          annotation (Line(points={{15,-58},{94,-58},{94,76},{28,76}}, color={0,0,127}));
      connect(pressureMeasure.port, pulmCapys.q_in[3]) annotation (Line(
          points={{2,-26},{-12,-26},{-12,0.866667},{-12.1,0.866667}},
          color={127,0,0},
          thickness=0.5));
      connect(pulmCapysConductance.q_out, pulmVeins.q_in[2]) annotation (Line(
          points={{26,2.22045e-16},{38,2.22045e-16},{38,0.65},{47.9,0.65}},
          color={127,0,0},
          thickness=0.5));
        connect(q_in, q_in) annotation (Line(
            points={{-100,0},{-100,0}},
            color={127,0,0},
            thickness=0.5));
        connect(volumeFlowMeasure.volumeFlow, lungBloodFlow.CardiacOutput)
          annotation (Line(points={{-32,12},{-46,12},{-46,90},{-26,90}}, color=
                {0,0,127}));
        annotation ( Icon(coordinateSystem(
                preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
              graphics={
              Text(
                extent={{-108,-48},{106,-70}},
                lineColor={0,0,255},
                textString="%name")}),
        Documentation(revisions="<html>

<table>
<tr>
<td>Author:</td>
<td>Marek Matejak</td>
</tr>

<tr>
<td>License:</td>
<td><a href=\"http://www.physiomodel.org/license.html\">Physiomodel License 1.0</a> </td>
</tr>
<tr>
<td>By:</td>
<td>Charles University, Prague</td>
</tr>
<tr>
<td>Date of:</td>
<td>january 2009</td>
</tr>
<tr>
<td>References:</td>
<td>Tom Coleman: QHP 2008 beta 3, University of Mississippi Medical Center</td>
</tr>
</table>
<br/><p>Copyright &copy; 2014 Marek Matejak, Charles University in Prague.</p><br/>

</html>", info="<html>
<p>Blood volume (and pressures) distribution between </p>
<p><ul>
<li>pulmonary arteries, </li>
<li>pulmonary veins and </li>
<li>pulmonary capilaries.</li>
</ul></p>
<p>Blood flow through ventilated alveoli.</p>
</html>"));
      end PulmonaryCirculation;
    end Components;

    package Examples
      model LungsTest

        replaceable package Air = Media.Air;
        //Chemical.Media.SimpleAir_C; //Kitware.Air_IdealGas; //Chemical.Media.SimpleAir_C; //Chemical.Media.Air_MixtureGasNasa;
        replaceable package PleuralFluid = Physiolibrary.Media.Water;
        replaceable package Blood = Physiolibrary.Media.Blood                   constrainedby
          Physiolibrary.Media.Interfaces.PartialMedium                                                                                     annotation ( choicesAllMatching = true);

        parameter Real ArterialBloodComposition[Blood.nS] = Blood.ArterialDefault
        "Initial composition of arterial blood" annotation (Dialog( group = "Perfusion"));

        parameter Real VenousBloodComposition[Blood.nS] = Blood.VenousDefault
        "Initial composition of venous blood" annotation (Dialog( group = "Perfusion"));


        parameter Types.Frequency RespirationRate(displayUnit="1/min")=0.2     "Respiration rate";
        parameter Types.Pressure Pmin(displayUnit="Pa")=-1000
                                       "Negative pressure gradient caused by respiratory muscles";
        parameter Types.Pressure Pmax(displayUnit="Pa")=0     "Positive presure gradient caused by respiratory muscles";
        parameter Real RespiratoryMusclePressureCycle[:, 3] = {{0, Pmax, 0}, {3 / 8, Pmin, 0}, {1, Pmax, 0}} "Absolute external lungs pressure during respiration cycle scaled to time period (0,1)";

        Fluid.Sources.PressureSource               environment(redeclare package
                    Medium =
                     Air, y(m_flow(start=0.0050764996707716465)))                                "External environment" annotation (
          Placement(transformation(extent={{-94,70},{-74,90}})));
        Fluid.Sensors.FlowMeasure               flowMeasure(redeclare package
            Medium =
              Air)                                                                          annotation (
          Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin={2,46})));
        Types.Constants.FrequencyConst               frequency(k=RespirationRate)   annotation (
          Placement(transformation(extent={{14,22},{22,30}})));
        Blocks.Source.PeriodicCurveSource               respiratoryMusclePressureCycle(data=
              RespiratoryMusclePressureCycle)                                                                                 "Relative position in respiratory cycle (0,1) to absolute external lungs pressure" annotation (
          Placement(transformation(extent={{34,16},{54,36}})));
        inner Modelica.Fluid.System system(T_ambient=310.15)            "Human body system setting" annotation (
          Placement(transformation(extent={{74,-32},{94,-12}})));
        Fluid.Sources.PressureSource
                               pulmonaryVeinsOutput(redeclare package Medium = Blood)
                   annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={56,-82})));
        Lungs lungs(
          redeclare package Blood = Blood,
          redeclare package Air = Air,
          redeclare package PleuralFluid = PleuralFluid,
          NRU=1,
          ArterialBloodComposition=ArterialBloodComposition,
          VenousBloodComposition=VenousBloodComposition,
          nPorts=1)
          annotation (Placement(transformation(extent={{-8,-8},{12,12}})));
        Fluid.Sources.VolumeInflowSource pulmonaryAtrysInput(
          SolutionFlow(displayUnit="l/min") = 9.1666666666667e-05,
          redeclare package Medium = Blood,
          massFractions_start=VenousBloodComposition,
          pressure_start=system.p_ambient + 2199.8193923475)
          annotation (Placement(transformation(extent={{-78,-92},{-58,-72}})));
      equation
        connect(environment.y,flowMeasure. q_in) annotation (
          Line(points={{-74,80},{2,80},{2,56}},               color = {127, 0, 0}, thickness = 0.5));
        connect(frequency.y,respiratoryMusclePressureCycle. frequence) annotation (
          Line(points={{23,26},{34,26}},        color = {0, 0, 127}));
        connect(respiratoryMusclePressureCycle.val, lungs.respiratotyMusclePressure)
          annotation (Line(points={{54,26},{60,26},{60,6},{10,6}}, color={0,0,
                127}));
        connect(pulmonaryVeinsOutput.y, lungs.blood_out) annotation (Line(
            points={{46,-82},{18,-82},{18,-2},{12,-2}},
            color={127,0,0},
            thickness=0.5));
        connect(pulmonaryAtrysInput.q_out, lungs.blood_in) annotation (Line(
            points={{-58,-82},{-14,-82},{-14,-2},{-8,-2}},
            color={127,0,0},
            thickness=0.5));
        connect(flowMeasure.q_out, lungs.airways[1]) annotation (Line(
            points={{2,36},{2,23.95},{2,23.95},{2,11.9}},
            color={127,0,0},
            thickness=0.5));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
              coordinateSystem(preserveAspectRatio=false)),
          Documentation(revisions = "<html>
        <p><i>2014-2018</i></p>
        <p>Marek Matejak, marek@matfyz.cz </p>
        </html>"),
          experiment(StopTime=60));
      end LungsTest;

      model MeanLungsTest

        replaceable package Air = Media.Air;
        //Chemical.Media.SimpleAir_C; //Kitware.Air_IdealGas; //Chemical.Media.SimpleAir_C; //Chemical.Media.Air_MixtureGasNasa;
        replaceable package PleuralFluid = Physiolibrary.Media.Water;
        replaceable package Blood = Physiolibrary.Media.Blood                   constrainedby
          Physiolibrary.Media.Interfaces.PartialMedium                                                                                     annotation ( choicesAllMatching = true);

        parameter Real ArterialBloodComposition[Blood.nS] = Blood.ArterialDefault "Initial composition of arterial blood";
        parameter Real VenousBloodComposition[Blood.nS] = Blood.VenousDefault "Initial composition of venous blood";

        parameter Types.Frequency RespirationRate(displayUnit="1/min")=0.2     "Respiration rate";
        parameter Types.Pressure Pmin(displayUnit="Pa")=-1000
                                       "Negative pressure gradient caused by respiratory muscles";
        parameter Types.Pressure Pmax(displayUnit="Pa")=0     "Positive presure gradient caused by respiratory muscles";
        parameter Real RespiratoryMusclePressureCycle[:, 3] = {{0, Pmax, 0}, {3 / 8, Pmin, 0}, {1, Pmax, 0}} "Absolute external lungs pressure during respiration cycle scaled to time period (0,1)";

        Fluid.Sources.PressureSource               environment(redeclare package
                    Medium =
                     Air, y(m_flow(start=0.0050764996707716465)))                                "External environment" annotation (
          Placement(transformation(extent={{-94,70},{-74,90}})));
        inner Modelica.Fluid.System system(T_ambient=310.15)            "Human body system setting" annotation (
          Placement(transformation(extent={{74,-32},{94,-12}})));
        Fluid.Sources.PressureSource
                               pulmonaryVeinsOutput(redeclare package Medium = Blood)
                   annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={56,-82})));
        Lungs lungs(
          redeclare package Blood = Blood,
          redeclare package Air = Air,
          redeclare package PleuralFluid = PleuralFluid,
          NRU=10,
          ArterialBloodComposition=ArterialBloodComposition,
          VenousBloodComposition=VenousBloodComposition,
          nPorts=2)
          annotation (Placement(transformation(extent={{-8,-10},{12,10}})));
        Fluid.Sources.VolumeInflowSource pulmonaryAtrysInput(
          SolutionFlow(displayUnit="l/min") = 9.1666666666667e-05,
          redeclare package Medium = Blood,
          massFractions_start=VenousBloodComposition,
          pressure_start=system.p_ambient + 2199.8193923475)
          annotation (Placement(transformation(extent={{-78,-92},{-58,-72}})));
        Types.Constants.PressureConst pressure(k(displayUnit="Pa") = -300)
          annotation (Placement(transformation(extent={{34,12},{42,20}})));
        Fluid.Sources.VolumeOutflowSource volumeOutflowSource(SolutionFlow(
              displayUnit="l/min") = 0.000109, redeclare package Medium = Air)
          annotation (Placement(transformation(extent={{46,70},{66,90}})));
      equation
        connect(pulmonaryVeinsOutput.y, lungs.blood_out) annotation (Line(
            points={{46,-82},{18,-82},{18,-4},{12,-4}},
            color={127,0,0},
            thickness=0.5));
        connect(pulmonaryAtrysInput.q_out, lungs.blood_in) annotation (Line(
            points={{-58,-82},{-14,-82},{-14,-4},{-8,-4}},
            color={127,0,0},
            thickness=0.5));
        connect(pressure.y, lungs.respiratotyMusclePressure) annotation (Line(
              points={{43,16},{48,16},{48,4},{10,4}}, color={0,0,127}));
        connect(volumeOutflowSource.q_in, lungs.airways[1]) annotation (Line(
            points={{46,80},{2,80},{2,9.475}},
            color={127,0,0},
            thickness=0.5));
        connect(environment.y, lungs.airways[2]) annotation (Line(
            points={{-74,80},{2,80},{2,10.325}},
            color={127,0,0},
            thickness=0.5));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
              coordinateSystem(preserveAspectRatio=false)),
          experiment(StopTime=60, __Dymola_Algorithm="Dassl"));
      end MeanLungsTest;
    end Examples;

  end Lungs;

  package Liver
    model Liver
      extends Physiolibrary.Organs.Interfaces.BaseTissue;
      extends Physiolibrary.Icons.Liver;

    Physiolibrary.Fluid.Interfaces.FluidPort_a portalVein(redeclare package
          Medium = Blood)                                 annotation (
        Placement(transformation(extent={{-10,-110},
              {10,-90}}, rotation=0),
                        iconTransformation(extent={{12,-58},{32,-38}})));
    Physiolibrary.Fluid.Components.Conductor liverPortalConductance(redeclare package
                  Medium = Blood, Conductance=2.2251826750088e-08)
      "corrected to flow 1250ml/min in pressure gradient 1 mmHg"
      annotation (Placement(transformation(extent={{-52,-8},{-68,8}})));
    Physiolibrary.Fluid.Sensors.VolumeFlowMeasure flowMeasure1(redeclare package
                  Medium = Blood)                              annotation (
        Placement(transformation(
          extent={{-10,10},{10,-10}},
          rotation=180,
          origin={-84,0})));
    Physiolibrary.Fluid.Sensors.VolumeFlowMeasure flowMeasure2(redeclare package
                  Medium = Blood)                              annotation (
        Placement(transformation(
          extent={{-10,10},{10,-10}},
          rotation=180,
          origin={-24,-16})));
    Physiolibrary.Fluid.Components.Conductor HepaticArtyConductance(redeclare package
                  Medium = Blood, Conductance=3.5002873539464e-10)
      annotation (Placement(transformation(extent={{0,36},{-20,56}})));
    Physiolibrary.Fluid.Sensors.VolumeFlowMeasure flowMeasure3(redeclare package
                  Medium = Blood)                              annotation (
        Placement(transformation(
          extent={{-10,10},{10,-10}},
          rotation=180,
          origin={12,46})));
    equation
      connect(flowMeasure1.volumeFlow, busConnector.Liver_BloodFlow)
        annotation (Line(
          points={{-84,12},{-84,90},{-90,90}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(flowMeasure2.volumeFlow, busConnector.PortalVein_BloodFlow)
        annotation (Line(
          points={{-24,-4},{-24,90},{-90,90}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(flowMeasure3.volumeFlow, busConnector.HepaticArty_BloodFlow)
        annotation (Line(
          points={{12,58},{12,90},{-90,90}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      connect(portalVein, flowMeasure2.q_in) annotation (Line(
          points={{0,-100},{0,-16},{-14,-16}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(flowMeasure.q_out, flowMeasure3.q_in) annotation (Line(
          points={{78,0},{32,0},{32,46},{22,46}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(flowMeasure3.q_out, HepaticArtyConductance.q_in) annotation (
          Line(
          points={{2,46},{0,46}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
    connect(liverPortalConductance.q_out, flowMeasure1.q_in) annotation (Line(
        points={{-68,0},{-67,0},{-67,-7.34788e-016},{-74,-7.34788e-016}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
      connect(flowMeasure1.q_out, port_b) annotation (Line(
          points={{-94,7.34788e-16},{-94,0},{-100,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
    connect(flowMeasure2.q_out, liverPortalConductance.q_in) annotation (Line(
        points={{-34,-16},{-50,-16},{-50,0},{-52,0}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(liverPortalConductance.q_in, HepaticArtyConductance.q_out)
      annotation (Line(
        points={{-52,2.22045e-016},{-50,2.22045e-016},{-50,46},{-20,46}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    end Liver;
  end Liver;

  package Kidney
    model Kidney
      extends Physiolibrary.Organs.Interfaces.BaseTissue;
      extends Physiolibrary.Icons.Kidney;

    Physiolibrary.Blocks.Factors.Normalization
      NephronCountEffect_AfferentArtery
      annotation (Placement(transformation(extent={{20,34},{40,54}})));
    Physiolibrary.Types.Constants.HydraulicConductanceConst
      Afferent_BasicConductance(k=4.2503489297921e-09)
      annotation (Placement(transformation(extent={{16,48},{28,60}})));
      Components.VariableResistorWithMyogenicResponse AfferentArtery(
        redeclare package Medium = Blood,
        PressureChangeOnMyogenicCondEffect={{-20.0,1.2,0.0},{0.0,1.0,-0.02},{
            20.0,0.8,0.0}},
        pressureChange(start=0),
        InitialPressureChange(displayUnit="mmHg") = 9.33256711905,
        K_PressureChange(displayUnit="Hz"))
        annotation (Placement(transformation(extent={{44,-12},{20,12}})));
    Physiolibrary.Blocks.Factors.Spline A2Effect2(
      data={{0.0,1.2,0.0},{1.3,1.0,-0.4},{3.0,0.6,0.0}},
      Xscale=1e-9/1.046,
      UsePositiveLog10=true)
      annotation (Placement(transformation(extent={{-56,18},{-36,38}})));
     // Xscale=1e-9/1.046,
    Physiolibrary.Types.Constants.HydraulicConductanceConst
      Efferent_BasicConductance(k=3.1377575922877e-9)
      annotation (Placement(transformation(extent={{-60,48},{-48,60}})));
    Physiolibrary.Blocks.Factors.Normalization
      NephronCountEffect_KidneyEfferentArtery
      annotation (Placement(transformation(extent={{-56,34},{-36,54}})));
    Physiolibrary.Fluid.Components.Conductor EfferentArtery(redeclare package
          Medium = Blood,
        useConductanceInput=true)
      annotation (Placement(transformation(extent={{-34,-12},{-58,12}})));
    Physiolibrary.Fluid.Components.Conductor ArcuateArtery(redeclare package
          Medium = Blood, Conductance=7.5006157584566e-08)
      annotation (Placement(transformation(extent={{74,-8},{58,8}})));
      Components.AlphaReceptors AplhaReceptors_KidneyAfferentArtery(redeclare package
                  Blood = Blood, data={{1.5,1.0,0.0},{7.0,0.9,0.0}})
        annotation (Placement(transformation(extent={{20,14},{40,34}})));
      Components.AlphaReceptors AplhaReceptors_KidneyEfferentArtery(redeclare package
                  Blood = Blood, data={{1.5,1.0,0.0},{7.0,0.9,0.0}})
        annotation (Placement(transformation(extent={{-56,6},{-36,26}})));
    Physiolibrary.Blocks.Factors.Normalization
      Anesthesia_KidneyEfferentArtery
      annotation (Placement(transformation(extent={{-56,26},{-36,46}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasure(redeclare package
                  Medium = Blood)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          origin={-22,12})));
      Modelica.Blocks.Math.Product KidneyPlasmaFlow annotation (Placement(
            transformation(
            extent={{-5,-5},{5,5}},
            rotation=90,
            origin={83,67})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasure1(redeclare package
                  Medium = Blood)
      annotation (Placement(transformation(
          extent={{10,-10},{-10,10}},
          origin={52,-10})));
      Modelica.Blocks.Math.Gain IFP(k=0.042)
        annotation (Placement(transformation(extent={{-36,-26},{-44,-18}})));
      Physiolibrary.Blocks.Factors.LagSpline     TGFEffect(
                                                 data={{0.0,1.2,0.0},{1.3,1.0,
            -0.4},{3.0,0.6,0.0}},
        initialValue=1.01309,
        HalfTime=60*Modelica.Math.log(2),integrator(stateName="TGF-Vascular.Signal"))
      "Macula Densa TGF vascular signal delay and effect to afferent arteriole"
        annotation (Placement(transformation(extent={{40,26},{20,46}})));
      //
    Physiolibrary.Blocks.Factors.Spline FurosemideEffect(data={{0.0,1.0,0.0},
          {1.3,0.2,0.0}}, Xscale=1e-3/0.33075)
      "furosemide outflow on Macula Densa Na sensibility"
      annotation (Placement(transformation(extent={{42,60},{62,80}})));
    Physiolibrary.Blocks.Factors.Spline NaEffect_MaculaDensa(data={{0,0.0,0.0},
          {48,1.0,0.03},{100,3.0,0.0}})
      annotation (Placement(transformation(extent={{42,64},{62,84}})));
    Physiolibrary.Blocks.Factors.Spline ANP_Effect(data={{0.0,1.2,0.0},{1.3,
          1.0,-0.3},{2.7,0.8,0.0}},
      UsePositiveLog10=true,
      Xscale=1e-9)
      annotation (Placement(transformation(extent={{42,56},{62,76}})));
    Physiolibrary.Blocks.Factors.Spline A2Effect3(
      data={{0.0,0.0,0.0},{0.2,0.6,0.05},{1.3,1.0,0.1},{3.0,8.0,0.0}},
       Xscale=1e-9/1.046,
      UsePositiveLog10=true)
      annotation (Placement(transformation(extent={{42,52},{62,72}})));
      //Xscale=1e-9/1.046,
    Physiolibrary.Types.Constants.FractionConst
      MedulaDensa_BaseTGFSignal(k=1)
      annotation (Placement(transformation(extent={{42,78},{50,86}})));
    Physiolibrary.Fluid.Components.Conductor resistorWithCond(redeclare package
          Medium = Blood,
        useConductanceInput=true)
      annotation (Placement(transformation(extent={{-18,-90},{2,-70}})));
    Physiolibrary.Blocks.Factors.Spline OsmOnConductance(data={{600,1.4,0},{
          1100,1.0,-0.0006},{2000,0.8,0}})
      annotation (Placement(transformation(extent={{-18,-60},{2,-40}})));
    Physiolibrary.Blocks.Factors.Spline A2OnConductance(
      data={{0.0,1.3,0},{1.3,1.0,-0.6},{2.0,0.5,0}},
      Xscale=1e-9/1.046,
      UsePositiveLog10=true)
      annotation (Placement(transformation(extent={{-18,-72},{2,-52}})));
    Physiolibrary.Blocks.Factors.Spline SympsOnConductance(data={{0.0,1.1,0},
          {1.0,1.0,-0.13},{1.4,0.6,0}})
      annotation (Placement(transformation(extent={{-18,-80},{2,-60}})));
    Physiolibrary.Types.Constants.HydraulicConductanceConst condConstant(k(
          displayUnit="ml/(mmHg.min)") = 2.5002052528189e-8)
      annotation (Placement(transformation(extent={{-24,-36},{-12,-24}})));
    Physiolibrary.Fluid.Sensors.VolumeFlowMeasure flowMeasure1(redeclare package
                  Medium = Blood)
      annotation (Placement(transformation(extent={{54,-70},{74,-90}})));
      Modelica.Blocks.Math.Add Osm
        annotation (Placement(transformation(extent={{-34,-54},{-26,-46}})));
    Physiolibrary.Blocks.Factors.LagSpline
                                        NephroneADHOnConductance(
      data={{0.0,1.4,0},{0.3,1.0,-0.4},{1.0,0.9,0}},
      Xscale=1e-9/1.084,
      HalfTime=Modelica.Math.log(2)*20*60,
      initialValue=2e-9/1.084)
      "initial 2pg/ml = 2e-9 kg/m3, NephronADH.Tau = 20 min"
      annotation (Placement(transformation(extent={{-18,-52},{2,-32}})));
    equation
      connect(Afferent_BasicConductance.y, NephronCountEffect_AfferentArtery.yBase)
                                                                 annotation (Line(
          points={{29.5,54},{30,54},{30,46}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(busConnector.Kidney_NephronCount_Total_xNormal,
        NephronCountEffect_AfferentArtery.u) annotation (Line(
          points={{-90,90},{-14,90},{-14,66},{-14,44},{22,44}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}}));
      connect(busConnector.Kidney_NephronCount_Total_xNormal,
        NephronCountEffect_KidneyEfferentArtery.u) annotation (Line(
          points={{-90,90},{-92,90},{-92,44},{-54,44}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}}));
      connect(busConnector.Anesthesia_VascularConductance,
        Anesthesia_KidneyEfferentArtery.u) annotation (Line(
          points={{-90,90},{-92,90},{-92,36},{-54,36}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}}));
      connect(Efferent_BasicConductance.y,
        NephronCountEffect_KidneyEfferentArtery.yBase) annotation (Line(
          points={{-46.5,54},{-46,54},{-46,46}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(A2Effect2.y, AplhaReceptors_KidneyEfferentArtery.yBase)
        annotation (Line(
          points={{-46,24},{-46,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(NephronCountEffect_KidneyEfferentArtery.y,
        Anesthesia_KidneyEfferentArtery.yBase) annotation (Line(
          points={{-46,40},{-46,38}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Anesthesia_KidneyEfferentArtery.y, A2Effect2.yBase) annotation (
         Line(
          points={{-46,32},{-46,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(AplhaReceptors_KidneyEfferentArtery.y, EfferentArtery.cond)
        annotation (Line(
          points={{-46,9},{-46,7.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(AplhaReceptors_KidneyAfferentArtery.y, AfferentArtery.cond)
        annotation (Line(
          points={{30,17},{30,4.8},{32,4.8}},
          color={0,0,127},
          smooth=Smooth.None));
    connect(pressureMeasure.pressure, busConnector.GlomerulusBloodPressure)
      annotation (Line(
        points={{-16,8},{-16,-12},{-90,-12},{-90,90}},
        color={0,0,127},
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,-3},{6,-3}}));
      connect(busConnector.BloodVol_PVCrit, KidneyPlasmaFlow.u2)
        annotation (Line(
          points={{-90,90},{96,90},{96,56},{86,56},{86,61}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{6,-3},{6,-3}}));
      connect(KidneyPlasmaFlow.y, busConnector.KidneyPlasmaFlow)
        annotation (Line(
          points={{83,72.5},{83,90},{-90,90}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{3,3},{3,3}}));
      connect(ArcuateArtery.q_out, AfferentArtery.q_in) annotation (Line(
          points={{58,2.22045e-16},{42,2.22045e-16},{42,0},{44,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(AfferentArtery.q_in,pressureMeasure1.port)  annotation (Line(
          points={{44,0},{58,0},{58,-20},{52,-20}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
    connect(IFP.u, pressureMeasure1.pressure) annotation (Line(
        points={{-35.2,-22},{6,-22},{6,-14},{46,-14}},
        color={0,0,127},
        smooth=Smooth.None));
      connect(ANP_Effect.y,A2Effect3. yBase) annotation (Line(
          points={{52,62},{52,64}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(FurosemideEffect.y,ANP_Effect. yBase) annotation (Line(
          points={{52,66},{52,68}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(NaEffect_MaculaDensa.y,FurosemideEffect. yBase) annotation (
          Line(
          points={{52,70},{52,72}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(MedulaDensa_BaseTGFSignal.y,NaEffect_MaculaDensa. yBase)
        annotation (Line(
          points={{51,82},{52,82},{52,76}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(A2Effect3.y,TGFEffect. u) annotation (Line(
          points={{52,58},{52,36},{38,36}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(NephronCountEffect_AfferentArtery.y, TGFEffect.yBase) annotation (
          Line(
          points={{30,40},{30,38}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(TGFEffect.y, AplhaReceptors_KidneyAfferentArtery.yBase) annotation (
          Line(
          points={{30,32},{30,31}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(busConnector.FurosemidePool_Loss, FurosemideEffect.u)
        annotation (Line(
          points={{-90,90},{-90,70},{44,70}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}}));
      connect(flowMeasure.volumeFlow, KidneyPlasmaFlow.u1) annotation (Line(
          points={{88,12},{88,50},{80,50},{80,61}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(flowMeasure.q_out,ArcuateArtery. q_in) annotation (Line(
          points={{78,0},{78,2.22045e-16},{74,2.22045e-16}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(busConnector.NephronIFP_Pressure, IFP.y) annotation (
          Line(
          points={{-90,90},{-90,-22},{-44.4,-22}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}}));
    connect(busConnector.Angiotensin2, A2Effect2.u) annotation (Line(
        points={{-90,90},{-92,90},{-92,28},{-54,28}},
        color={0,0,255},
        thickness=0.5,
        smooth=Smooth.None), Text(
        string="%first",
        index=-1,
        extent={{-6,3},{-6,3}}));
    connect(busConnector.Angiotensin2, A2Effect3.u) annotation (Line(
        points={{-90,90},{-90,62},{44,62}},
        color={0,0,255},
        thickness=0.5,
        smooth=Smooth.None), Text(
        string="%first",
        index=-1,
        extent={{-6,3},{-6,3}}));
    connect(busConnector.ANP, ANP_Effect.u) annotation (Line(
        points={{-90,90},{-90,66},{44,66}},
        color={0,0,255},
        thickness=0.5,
        smooth=Smooth.None), Text(
        string="%first",
        index=-1,
        extent={{-6,3},{-6,3}}));
      connect(SympsOnConductance.y,resistorWithCond. cond) annotation (Line(
          points={{-8,-74},{-8,-74}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(A2OnConductance.y,SympsOnConductance. yBase) annotation (Line(
          points={{-8,-66},{-8,-68}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(OsmOnConductance.y,A2OnConductance. yBase) annotation (Line(
          points={{-8,-54},{-8,-62},{-10,-62},{-10,-60},{-8,-60}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(busConnector.Kidney_Alpha_NA,SympsOnConductance. u) annotation (Line(
          points={{-90,90},{-80,90},{-80,-70},{-16,-70}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}}));
    connect(resistorWithCond.q_out, flowMeasure1.q_in) annotation (Line(
        points={{2,-80},{54,-80}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(flowMeasure1.volumeFlow, busConnector.VasaRecta_Outflow)
      annotation (Line(
        points={{64,-92},{-94,-92},{-94,90},{-90,90}},
        color={0,0,127},
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,-12},{6,-12}}));
      connect(Osm.y,OsmOnConductance. u) annotation (Line(
          points={{-25.6,-50},{-16,-50}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(busConnector.MedullaNa_Osmolarity,Osm. u1) annotation (Line(
          points={{-90,90},{-62,90},{-62,-47.6},{-34.8,-47.6}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}}));
      connect(busConnector.MedullaUrea_Osmolarity,Osm. u2) annotation (Line(
          points={{-90,90},{-62,90},{-62,-52.4},{-34.8,-52.4}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}}));
      connect(NephroneADHOnConductance.y,OsmOnConductance. yBase) annotation (
         Line(
          points={{-8,-46},{-6,-46},{-6,-48},{-8,-48}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(condConstant.y,NephroneADHOnConductance. yBase) annotation (
          Line(
          points={{-10.5,-30},{-8,-30},{-8,-40}},
          color={0,0,127},
          smooth=Smooth.None));
    connect(busConnector.Angiotensin2,A2OnConductance. u) annotation (Line(
        points={{-90,90},{-80,90},{-80,-62},{-16,-62}},
        color={0,0,255},
        thickness=0.5,
        smooth=Smooth.None), Text(
        string="%first",
        index=-1,
        extent={{-6,3},{-6,3}}));
    connect(busConnector.Vasopressin,NephroneADHOnConductance. u) annotation (
       Line(
        points={{-90,90},{-80,90},{-80,-42},{-16,-42}},
        color={0,0,255},
        thickness=0.5,
        smooth=Smooth.None), Text(
        string="%first",
        index=-1,
        extent={{-6,3},{-6,3}}));
    connect(EfferentArtery.q_out, resistorWithCond.q_in) annotation (Line(
        points={{-58,0},{-92,0},{-92,-80},{-18,-80}},
        color={0,0,0},
        thickness=1));
      connect(flowMeasure1.q_out, port_b) annotation (Line(
          points={{74,-80},{84,-80},{84,-98},{-92,-98},{-92,0},{-100,0}},
          color={0,0,0},
          thickness=1));
    connect(EfferentArtery.q_in,pressureMeasure.port)  annotation (Line(
        points={{-34,0},{-30,0},{-30,2},{-22,2}},
        color={0,0,0},
        thickness=1));
    connect(busConnector.MD_Na, NaEffect_MaculaDensa.u) annotation (Line(
        points={{-90,90},{-24,90},{-24,74},{44,74}},
        color={0,0,255},
        thickness=0.5), Text(
        string="%first",
        index=-1,
        extent={{-6,3},{-6,3}},
        horizontalAlignment=TextAlignment.Right));
    connect(AfferentArtery.q_out, EfferentArtery.q_in) annotation (Line(
        points={{20,0},{-34,0}},
        color={0,0,0},
        thickness=1));
      connect(AplhaReceptors_KidneyEfferentArtery.GangliaGeneral, busConnector.GangliaGeneral_NA)
        annotation (Line(points={{-55.8,10},{-90,10},{-90,90}}, color={0,0,127}),
          Text(
          string="%second",
          index=1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(AplhaReceptors_KidneyAfferentArtery.GangliaGeneral, busConnector.GangliaGeneral_NA)
        annotation (Line(points={{20.2,18},{-6,18},{-6,90},{-90,90}}, color={0,
              0,127}), Text(
          string="%second",
          index=1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(AplhaReceptors_KidneyAfferentArtery.port_a, port_a) annotation (
          Line(
          points={{20,22},{26,22},{26,14},{110,14},{110,0}},
          color={127,0,0},
          thickness=0.5));
      connect(AplhaReceptors_KidneyEfferentArtery.port_a, port_a) annotation (
          Line(
          points={{-56,14},{110,14},{110,0}},
          color={127,0,0},
          thickness=0.5));
      annotation (
        Documentation(info="<HTML>
<PRE>
Blood resistance in kidneys.

QHP 2008 / Kidney-Flow

</PRE>
</HTML>
",   revisions="<html>

<table>
<tr>
<td>Author:</td>
<td>Marek Matejak</td>
</tr>
<tr>
<td>License:</td>
<td><a href=\"http://www.physiomodel.org/license.html\">Physiomodel License 1.0</a> </td>
</tr>
<tr>
<td>By:</td>
<td>Charles University, Prague</td>
</tr>
<tr>
<td>Date of:</td>
<td>2009</td>
</tr>
<tr>
<td>References:</td>
<td>Tom Coleman: QHP 2008 beta 3, University of Mississippi Medical Center</td>
</tr>
</table>
<br/><p>Copyright &copy; 2014 Marek Matejak, Charles University in Prague.</p><br/>

</html>"),
        Diagram(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},
              {100,100}}),   graphics={Rectangle(extent={{34,88},{70,50}},
                lineColor={127,0,0}), Text(
              extent={{34,50},{70,56}},
              lineColor={0,0,255},
              textString="Macula Densa")}),         Icon(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics={Text(
              extent={{-100,-100},{100,-80}},
              lineColor={0,0,255},
              textString="%name")}));
    end Kidney;

    model EPO
      extends Physiolibrary.Icons.Kidney;
    // outer parameter Real ECF_Vol(final displayUnit="ml");

      //NominalSolute=Substances.Erythropoietin.molpIU

    Physiolibrary.Blocks.Factors.Normalization CountEffect
      annotation (Placement(transformation(extent={{56,24},{76,44}})));
    Physiolibrary.Types.Constants.FractionConst             hormoneFlowConstant(k=1)
             annotation (Placement(transformation(extent={{-4,32},{-12,40}})));
    Physiolibrary.Blocks.Factors.Spline PO2Effect(data={{0.0,4.0,0},{35.0,0.0,-0.14},
          {60.0,-1.0,0}}, Xscale=101325/760)
      "cortex pO2=50 mmHg; medulla pO2 = 10-20 mmHg [Brezis&Rosen1995]; erythropoietin-producing cells are in the interstitium of the cortex and outer medulla [Maxwell1993]"
      annotation (Placement(transformation(extent={{-24,14},{-4,34}})));    //(toAnotherUnitCoef=1000, unitsString="U/l")
      Modelica.Blocks.Math.Gain K(k(unit="1/s")=0.00555/60)
        annotation (Placement(transformation(extent={{-3,-3},{3,3}},
            origin={-31,-77})));
    Modelica.Blocks.Sources.Constant hormoneFlowConstant1(k=(0.67)/
            60) annotation (Placement(transformation(extent={{82,42},{70,54}})));
      Modelica.Blocks.Math.Gain VODIST(k=0.4)
        annotation (Placement(transformation(extent={{-6,-6},{6,6}},
            origin={-64,-40})));
    Physiolibrary.Blocks.Math.Power avg1
      annotation (Placement(transformation(extent={{-8,10},{0,18}})));
    Physiolibrary.Blocks.Factors.Normalization FunctionEffect
      annotation (Placement(transformation(extent={{56,14},{76,34}})));
    Physiolibrary.Blocks.Factors.Normalization PO2Effect_
      annotation (Placement(transformation(extent={{56,4},{76,24}})));
    Physiolibrary.Types.BusConnector busConnector annotation (Placement(
          transformation(extent={{-88,78},{-68,98}}), iconTransformation(extent=
             {{-90,-70},{-70,-50}})));
     Modelica.Blocks.Interfaces.RealOutput Erythropoetin
        annotation (Placement(transformation(extent={{-2,-38},{18,-18}}),
            iconTransformation(extent={{80,-20},{120,20}})));
      Modelica.Blocks.Math.Feedback feedback
        annotation (Placement(transformation(extent={{24,-78},{44,-58}})));
      Modelica.Blocks.Continuous.Integrator integrator
        annotation (Placement(transformation(extent={{64,-90},{84,-70}})));
      Modelica.Blocks.Math.Division division
        annotation (Placement(transformation(extent={{-10,-60},{10,-40}})));
    equation
      connect(busConnector.KidneyO2_TubulePO2, PO2Effect.u)
                                            annotation (Line(
          points={{-78,88},{-64.9,88},{-64.9,24},{-22,24}},
          color={0,0,127},
          smooth=Smooth.None), Text(
     string="%first",
     index=-1,
     extent={{-6,3},{-6,3}}));
      connect(busConnector.Kidney_NephronCount_Total_xNormal, CountEffect.u)
                                           annotation (Line(
          points={{-78,88},{5.1,88},{5.1,34},{58,34}},
          color={0,0,127},
          smooth=Smooth.None), Text(
     string="%first",
     index=-1,
     extent={{-6,3},{-6,3}}));
      connect(hormoneFlowConstant1.y, CountEffect.yBase)
                                                       annotation (Line(
          points={{69.4,48},{66,48},{66,36}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(hormoneFlowConstant.y,PO2Effect. yBase) annotation (Line(
          points={{-13,36},{-14,36},{-14,26}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(busConnector.ECFV_Vol, VODIST.u) annotation (Line(
          points={{-78,88},{-90.6,88},{-90.6,-40},{-71.2,-40}},
          color={0,0,127},
          smooth=Smooth.None), Text(
     string="%first",
     index=-1,
     extent={{-6,3},{-6,3}}));

      connect(CountEffect.y, FunctionEffect.yBase) annotation (Line(
          points={{66,30},{66,26}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(FunctionEffect.y, PO2Effect_.yBase) annotation (Line(
          points={{66,20},{66,16}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(avg1.y, PO2Effect_.u) annotation (Line(
          points={{0.4,14},{58,14}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(FunctionEffect.u, busConnector. KidneyFunctionEffect) annotation (Line(
          points={{58,24},{5.1,24},{5.1,88},{-78,88}},
          color={0,0,127},
          smooth=Smooth.None), Text(
     string="%second",
     index=1,
     extent={{6,3},{6,3}}));

      connect(PO2Effect.y, avg1.exponent)
        annotation (Line(
          points={{-14,20},{-14,11.6},{-8,11.6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(PO2Effect_.y, feedback.u1) annotation (Line(points={{66,10},{66,
              -30},{80,-30},{80,-60},{48,-60},{48,-54},{20,-54},{20,-68},{26,
              -68}}, color={0,0,127}));
      connect(K.y, feedback.u2) annotation (Line(points={{-27.7,-77},{-26,-77},
              {-26,-72},{18,-72},{18,-82},{34,-82},{34,-76}}, color={0,0,127}));
      connect(feedback.y, integrator.u) annotation (Line(points={{43,-68},{54,
              -68},{54,-80},{62,-80}}, color={0,0,127}));
      connect(integrator.y, K.u) annotation (Line(points={{85,-80},{92,-80},{92,
              -98},{-48,-98},{-48,-77},{-34.6,-77}}, color={0,0,127}));
      connect(VODIST.y, division.u2) annotation (Line(points={{-57.4,-40},{-52,
              -40},{-52,-56},{-12,-56}}, color={0,0,127}));
      connect(division.u1, K.u) annotation (Line(points={{-12,-44},{-24,-44},{
              -24,-70},{-34.6,-70},{-34.6,-77}}, color={0,0,127}));
      connect(division.y, Erythropoetin)
        annotation (Line(points={{11,-50},{8,-50},{8,-28}}, color={0,0,127}));
      connect(division.y, busConnector.Erythropoietin) annotation (Line(points=
              {{11,-50},{24,-50},{24,4},{-36,4},{-36,88},{-78,88}}, color={0,0,
              127}), Text(
          string="%second",
          index=1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      annotation ( Icon(coordinateSystem(
              preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
            graphics={Text(
              extent={{-116,104},{118,82}},
              lineColor={0,0,255},
              textString="%name")}));
    end EPO;

    model Kidney2
      extends Physiolibrary.Organs.Interfaces.BaseTissue;
      extends Physiolibrary.Icons.Kidney;

    Physiolibrary.Blocks.Factors.Normalization
      NephronCountEffect_AfferentArtery
      annotation (Placement(transformation(extent={{20,34},{40,54}})));
    Physiolibrary.Types.Constants.HydraulicConductanceConst
      Afferent_BasicConductance(k=4.2503489297921e-09)
      annotation (Placement(transformation(extent={{16,48},{28,60}})));
      Components.VariableResistorWithMyogenicResponse AfferentArtery(
        redeclare package Medium = Blood,
        PressureChangeOnMyogenicCondEffect={{-20.0,1.2,0.0},{0.0,1.0,-0.02},{
            20.0,0.8,0.0}},
        pressureChange(start=0),
        InitialPressureChange(displayUnit="mmHg") = 9.33256711905,
        K_PressureChange(displayUnit="Hz"))
        annotation (Placement(transformation(extent={{44,-12},{20,12}})));
    Physiolibrary.Blocks.Factors.Spline A2Effect2(
      data={{0.0,1.2,0.0},{1.3,1.0,-0.4},{3.0,0.6,0.0}},
      Xscale=1e-9/1.046,
      UsePositiveLog10=true)
      annotation (Placement(transformation(extent={{-56,18},{-36,38}})));
     // Xscale=1e-9/1.046,
    Physiolibrary.Types.Constants.HydraulicConductanceConst
      Efferent_BasicConductance(k=3.1377575922877e-9)
      annotation (Placement(transformation(extent={{-60,48},{-48,60}})));
    Physiolibrary.Blocks.Factors.Normalization
      NephronCountEffect_KidneyEfferentArtery
      annotation (Placement(transformation(extent={{-56,34},{-36,54}})));
    Physiolibrary.Fluid.Components.Conductor EfferentArtery(redeclare package
          Medium = Blood,
        useConductanceInput=true)
      annotation (Placement(transformation(extent={{-34,-12},{-58,12}})));
    Physiolibrary.Fluid.Components.Conductor ArcuateArtery(redeclare package
          Medium = Blood, Conductance=7.5006157584566e-08)
      annotation (Placement(transformation(extent={{74,-8},{58,8}})));
      Components.AlphaReceptors AplhaReceptors_KidneyAfferentArtery(redeclare package
                  Blood = Blood, data={{1.5,1.0,0.0},{7.0,0.9,0.0}})
        annotation (Placement(transformation(extent={{20,14},{40,34}})));
      Components.AlphaReceptors AplhaReceptors_KidneyEfferentArtery(redeclare package
                  Blood = Blood, data={{1.5,1.0,0.0},{7.0,0.9,0.0}})
        annotation (Placement(transformation(extent={{-56,6},{-36,26}})));
    Physiolibrary.Blocks.Factors.Normalization
      Anesthesia_KidneyEfferentArtery
      annotation (Placement(transformation(extent={{-56,26},{-36,46}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasure(redeclare package
                  Medium = Blood)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          origin={-22,12})));
      Modelica.Blocks.Math.Product KidneyPlasmaFlow annotation (Placement(
            transformation(
            extent={{-5,-5},{5,5}},
            rotation=90,
            origin={83,67})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasure1(redeclare package
                  Medium = Blood)
      annotation (Placement(transformation(
          extent={{10,-10},{-10,10}},
          origin={52,-10})));
      Modelica.Blocks.Math.Gain IFP(k=0.042)
        annotation (Placement(transformation(extent={{-36,-26},{-44,-18}})));
      Physiolibrary.Blocks.Factors.LagSpline     TGFEffect(
                                                 data={{0.0,1.2,0.0},{1.3,1.0,
            -0.4},{3.0,0.6,0.0}},
        initialValue=1.01309,
        HalfTime=60*Modelica.Math.log(2),integrator(stateName="TGF-Vascular.Signal"))
      "Macula Densa TGF vascular signal delay and effect to afferent arteriole"
        annotation (Placement(transformation(extent={{40,26},{20,46}})));
      //
    Physiolibrary.Blocks.Factors.Spline FurosemideEffect(data={{0.0,1.0,0.0},
          {1.3,0.2,0.0}}, Xscale=1e-3/0.33075)
      "furosemide outflow on Macula Densa Na sensibility"
      annotation (Placement(transformation(extent={{42,60},{62,80}})));
    Physiolibrary.Blocks.Factors.Spline NaEffect_MaculaDensa(data={{0,0.0,0.0},
          {48,1.0,0.03},{100,3.0,0.0}})
      annotation (Placement(transformation(extent={{42,64},{62,84}})));
    Physiolibrary.Blocks.Factors.Spline ANP_Effect(data={{0.0,1.2,0.0},{1.3,
          1.0,-0.3},{2.7,0.8,0.0}},
      UsePositiveLog10=true,
      Xscale=1e-9)
      annotation (Placement(transformation(extent={{42,56},{62,76}})));
    Physiolibrary.Blocks.Factors.Spline A2Effect3(
      data={{0.0,0.0,0.0},{0.2,0.6,0.05},{1.3,1.0,0.1},{3.0,8.0,0.0}},
       Xscale=1e-9/1.046,
      UsePositiveLog10=true)
      annotation (Placement(transformation(extent={{42,52},{62,72}})));
      //Xscale=1e-9/1.046,
    Physiolibrary.Types.Constants.FractionConst
      MedulaDensa_BaseTGFSignal(k=1)
      annotation (Placement(transformation(extent={{42,78},{50,86}})));
    Physiolibrary.Fluid.Components.Conductor resistorWithCond(redeclare package
          Medium = Blood,
        useConductanceInput=true)
      annotation (Placement(transformation(extent={{-18,-90},{2,-70}})));
    Physiolibrary.Blocks.Factors.Spline OsmOnConductance(data={{600,1.4,0},{
          1100,1.0,-0.0006},{2000,0.8,0}})
      annotation (Placement(transformation(extent={{-18,-60},{2,-40}})));
    Physiolibrary.Blocks.Factors.Spline A2OnConductance(
      data={{0.0,1.3,0},{1.3,1.0,-0.6},{2.0,0.5,0}},
      Xscale=1e-9/1.046,
      UsePositiveLog10=true)
      annotation (Placement(transformation(extent={{-18,-72},{2,-52}})));
    Physiolibrary.Blocks.Factors.Spline SympsOnConductance(data={{0.0,1.1,0},
          {1.0,1.0,-0.13},{1.4,0.6,0}})
      annotation (Placement(transformation(extent={{-18,-80},{2,-60}})));
    Physiolibrary.Types.Constants.HydraulicConductanceConst condConstant(k(
          displayUnit="ml/(mmHg.min)") = 2.5002052528189e-8)
      annotation (Placement(transformation(extent={{-24,-36},{-12,-24}})));
    Physiolibrary.Fluid.Sensors.VolumeFlowMeasure flowMeasure1(redeclare package
                  Medium = Blood)
      annotation (Placement(transformation(extent={{54,-70},{74,-90}})));
    Physiolibrary.Fluid.Sources.VolumeInflowSource
                                              inputPump(
        useSolutionFlowInput=true, redeclare package Medium = Blood)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=90,
          origin={24,-98})));
      Modelica.Blocks.Math.Add Osm
        annotation (Placement(transformation(extent={{-34,-54},{-26,-46}})));
    Physiolibrary.Blocks.Factors.LagSpline
                                        NephroneADHOnConductance(
      data={{0.0,1.4,0},{0.3,1.0,-0.4},{1.0,0.9,0}},
      Xscale=1e-9/1.084,
      HalfTime=Modelica.Math.log(2)*20*60,
      initialValue=2e-9/1.084)
      "initial 2pg/ml = 2e-9 kg/m3, NephronADH.Tau = 20 min"
      annotation (Placement(transformation(extent={{-18,-52},{2,-32}})));
    Physiolibrary.Fluid.Sources.VolumeOutflowSource  unlimitedOutflowPump(
        useSolutionFlowInput=true, redeclare package Medium = Blood)
      annotation (Placement(transformation(extent={{22,-46},{42,-26}})));
    equation
      connect(Afferent_BasicConductance.y, NephronCountEffect_AfferentArtery.yBase)
                                                                 annotation (Line(
          points={{29.5,54},{30,54},{30,46}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(busConnector.Kidney_NephronCount_Total_xNormal,
        NephronCountEffect_AfferentArtery.u) annotation (Line(
          points={{-90,90},{-14,90},{-14,66},{-14,44},{22,44}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}}));
      connect(busConnector.Kidney_NephronCount_Total_xNormal,
        NephronCountEffect_KidneyEfferentArtery.u) annotation (Line(
          points={{-90,90},{-92,90},{-92,44},{-54,44}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}}));
      connect(busConnector.Anesthesia_VascularConductance,
        Anesthesia_KidneyEfferentArtery.u) annotation (Line(
          points={{-90,90},{-92,90},{-92,36},{-54,36}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}}));
      connect(Efferent_BasicConductance.y,
        NephronCountEffect_KidneyEfferentArtery.yBase) annotation (Line(
          points={{-46.5,54},{-46,54},{-46,46}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(A2Effect2.y, AplhaReceptors_KidneyEfferentArtery.yBase)
        annotation (Line(
          points={{-46,24},{-46,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(NephronCountEffect_KidneyEfferentArtery.y,
        Anesthesia_KidneyEfferentArtery.yBase) annotation (Line(
          points={{-46,40},{-46,38}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Anesthesia_KidneyEfferentArtery.y, A2Effect2.yBase) annotation (
         Line(
          points={{-46,32},{-46,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(AplhaReceptors_KidneyEfferentArtery.y, EfferentArtery.cond)
        annotation (Line(
          points={{-46,9},{-46,7.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(AplhaReceptors_KidneyAfferentArtery.y, AfferentArtery.cond)
        annotation (Line(
          points={{30,17},{30,4.8},{32,4.8}},
          color={0,0,127},
          smooth=Smooth.None));
    connect(pressureMeasure.pressure, busConnector.GlomerulusBloodPressure)
      annotation (Line(
        points={{-16,8},{-16,-12},{-90,-12},{-90,90}},
        color={0,0,127},
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,-3},{6,-3}}));
      connect(busConnector.BloodVol_PVCrit, KidneyPlasmaFlow.u2)
        annotation (Line(
          points={{-90,90},{96,90},{96,56},{86,56},{86,61}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{6,-3},{6,-3}}));
      connect(KidneyPlasmaFlow.y, busConnector.KidneyPlasmaFlow)
        annotation (Line(
          points={{83,72.5},{83,90},{-90,90}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{3,3},{3,3}}));
      connect(ArcuateArtery.q_out, AfferentArtery.q_in) annotation (Line(
          points={{58,2.22045e-16},{42,2.22045e-16},{42,0},{44,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(AfferentArtery.q_in,pressureMeasure1.port)  annotation (Line(
          points={{44,0},{58,0},{58,-20},{52,-20}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
    connect(IFP.u, pressureMeasure1.pressure) annotation (Line(
        points={{-35.2,-22},{6,-22},{6,-14},{46,-14}},
        color={0,0,127},
        smooth=Smooth.None));
      connect(ANP_Effect.y,A2Effect3. yBase) annotation (Line(
          points={{52,62},{52,64}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(FurosemideEffect.y,ANP_Effect. yBase) annotation (Line(
          points={{52,66},{52,68}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(NaEffect_MaculaDensa.y,FurosemideEffect. yBase) annotation (
          Line(
          points={{52,70},{52,72}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(MedulaDensa_BaseTGFSignal.y,NaEffect_MaculaDensa. yBase)
        annotation (Line(
          points={{51,82},{52,82},{52,76}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(A2Effect3.y,TGFEffect. u) annotation (Line(
          points={{52,58},{52,36},{38,36}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(NephronCountEffect_AfferentArtery.y, TGFEffect.yBase) annotation (
          Line(
          points={{30,40},{30,38}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(TGFEffect.y, AplhaReceptors_KidneyAfferentArtery.yBase) annotation (
          Line(
          points={{30,32},{30,31}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(busConnector.FurosemidePool_Loss, FurosemideEffect.u)
        annotation (Line(
          points={{-90,90},{-90,70},{44,70}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}}));
      connect(flowMeasure.volumeFlow, KidneyPlasmaFlow.u1) annotation (Line(
          points={{88,12},{88,50},{80,50},{80,61}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(flowMeasure.q_out,ArcuateArtery. q_in) annotation (Line(
          points={{78,0},{78,2.22045e-16},{74,2.22045e-16}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(busConnector.NephronIFP_Pressure, IFP.y) annotation (
          Line(
          points={{-90,90},{-90,-22},{-44.4,-22}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}}));
    connect(busConnector.Angiotensin2, A2Effect2.u) annotation (Line(
        points={{-90,90},{-92,90},{-92,28},{-54,28}},
        color={0,0,255},
        thickness=0.5,
        smooth=Smooth.None), Text(
        string="%first",
        index=-1,
        extent={{-6,3},{-6,3}}));
    connect(busConnector.Angiotensin2, A2Effect3.u) annotation (Line(
        points={{-90,90},{-90,62},{44,62}},
        color={0,0,255},
        thickness=0.5,
        smooth=Smooth.None), Text(
        string="%first",
        index=-1,
        extent={{-6,3},{-6,3}}));
    connect(busConnector.ANP, ANP_Effect.u) annotation (Line(
        points={{-90,90},{-90,66},{44,66}},
        color={0,0,255},
        thickness=0.5,
        smooth=Smooth.None), Text(
        string="%first",
        index=-1,
        extent={{-6,3},{-6,3}}));
      connect(SympsOnConductance.y,resistorWithCond. cond) annotation (Line(
          points={{-8,-74},{-8,-74}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(A2OnConductance.y,SympsOnConductance. yBase) annotation (Line(
          points={{-8,-66},{-8,-68}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(OsmOnConductance.y,A2OnConductance. yBase) annotation (Line(
          points={{-8,-54},{-8,-62},{-10,-62},{-10,-60},{-8,-60}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(busConnector.Kidney_Alpha_NA,SympsOnConductance. u) annotation (Line(
          points={{-90,90},{-80,90},{-80,-70},{-16,-70}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}}));
    connect(resistorWithCond.q_out, flowMeasure1.q_in) annotation (Line(
        points={{2,-80},{54,-80}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(flowMeasure1.volumeFlow, busConnector.VasaRecta_Outflow)
      annotation (Line(
        points={{64,-92},{-94,-92},{-94,90},{-90,90}},
        color={0,0,127},
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,-12},{6,-12}}));
    connect(inputPump.q_out, flowMeasure1.q_in) annotation (Line(
        points={{24,-88},{24,-80},{54,-80}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
      connect(Osm.y,OsmOnConductance. u) annotation (Line(
          points={{-25.6,-50},{-16,-50}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(busConnector.MedullaNa_Osmolarity,Osm. u1) annotation (Line(
          points={{-90,90},{-62,90},{-62,-47.6},{-34.8,-47.6}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}}));
      connect(busConnector.MedullaUrea_Osmolarity,Osm. u2) annotation (Line(
          points={{-90,90},{-62,90},{-62,-52.4},{-34.8,-52.4}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}}));
      connect(NephroneADHOnConductance.y,OsmOnConductance. yBase) annotation (
         Line(
          points={{-8,-46},{-6,-46},{-6,-48},{-8,-48}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(condConstant.y,NephroneADHOnConductance. yBase) annotation (
          Line(
          points={{-10.5,-30},{-8,-30},{-8,-40}},
          color={0,0,127},
          smooth=Smooth.None));
    connect(busConnector.Angiotensin2,A2OnConductance. u) annotation (Line(
        points={{-90,90},{-80,90},{-80,-62},{-16,-62}},
        color={0,0,255},
        thickness=0.5,
        smooth=Smooth.None), Text(
        string="%first",
        index=-1,
        extent={{-6,3},{-6,3}}));
    connect(busConnector.Vasopressin,NephroneADHOnConductance. u) annotation (
       Line(
        points={{-90,90},{-80,90},{-80,-42},{-16,-42}},
        color={0,0,255},
        thickness=0.5,
        smooth=Smooth.None), Text(
        string="%first",
        index=-1,
        extent={{-6,3},{-6,3}}));
    connect(busConnector.CD_H2O_Reab,inputPump. solutionFlow) annotation (
        Line(
        points={{-90,90},{-80,90},{-80,-98},{17,-98}},
        color={0,0,255},
        thickness=0.5,
        smooth=Smooth.None), Text(
        string="%first",
        index=-1,
        extent={{-6,3},{-6,3}}));
    connect(EfferentArtery.q_out, resistorWithCond.q_in) annotation (Line(
        points={{-58,0},{-92,0},{-92,-80},{-18,-80}},
        color={0,0,0},
        thickness=1));
      connect(flowMeasure1.q_out, port_b) annotation (Line(
          points={{74,-80},{76,-80},{76,-102},{-92,-102},{-92,0},{-100,0}},
          color={0,0,0},
          thickness=1));
    connect(EfferentArtery.q_in,pressureMeasure.port)  annotation (Line(
        points={{-34,0},{-30,0},{-30,2},{-22,2}},
        color={0,0,0},
        thickness=1));
    connect(busConnector.MD_Na, NaEffect_MaculaDensa.u) annotation (Line(
        points={{-90,90},{-24,90},{-24,74},{44,74}},
        color={0,0,255},
        thickness=0.5), Text(
        string="%first",
        index=-1,
        extent={{-6,3},{-6,3}},
        horizontalAlignment=TextAlignment.Right));
    connect(AfferentArtery.q_out, EfferentArtery.q_in) annotation (Line(
        points={{20,0},{-34,0}},
        color={0,0,0},
        thickness=1));
    connect(unlimitedOutflowPump.q_in, EfferentArtery.q_in) annotation (Line(
        points={{22,-36},{10,-36},{10,0},{-34,0}},
        color={0,0,0},
        thickness=1));
    connect(busConnector.Glomerulus_GFR, unlimitedOutflowPump.solutionFlow)
      annotation (Line(
        points={{-90,90},{-30,90},{-30,-29},{32,-29}},
        color={0,0,255},
        thickness=0.5), Text(
        string="%first",
        index=-1,
        extent={{-6,3},{-6,3}},
        horizontalAlignment=TextAlignment.Right));
      connect(AplhaReceptors_KidneyEfferentArtery.port_a, EfferentArtery.q_in)
        annotation (Line(
          points={{-56,14},{-34,14},{-34,0}},
          color={127,0,0},
          thickness=0.5));
      connect(AplhaReceptors_KidneyAfferentArtery.port_a, AfferentArtery.q_in)
        annotation (Line(
          points={{20,22},{42,22},{42,0},{44,0}},
          color={127,0,0},
          thickness=0.5));
      connect(AplhaReceptors_KidneyAfferentArtery.GangliaGeneral, busConnector.GangliaGeneral_NA)
        annotation (Line(points={{20.2,18},{-6,18},{-6,90},{-90,90}}, color={0,
              0,127}), Text(
          string="%second",
          index=1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(AplhaReceptors_KidneyEfferentArtery.GangliaGeneral, busConnector.GangliaGeneral_NA)
        annotation (Line(points={{-55.8,10},{-86,10},{-86,26},{-90,26},{-90,90}},
            color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      annotation (
        Documentation(info="<HTML>
<PRE>
Blood resistance in kidneys.

QHP 2008 / Kidney-Flow

</PRE>
</HTML>
",   revisions="<html>

<table>
<tr>
<td>Author:</td>
<td>Marek Matejak</td>
</tr>
<tr>
<td>License:</td>
<td><a href=\"http://www.physiomodel.org/license.html\">Physiomodel License 1.0</a> </td>
</tr>
<tr>
<td>By:</td>
<td>Charles University, Prague</td>
</tr>
<tr>
<td>Date of:</td>
<td>2009</td>
</tr>
<tr>
<td>References:</td>
<td>Tom Coleman: QHP 2008 beta 3, University of Mississippi Medical Center</td>
</tr>
</table>
<br/><p>Copyright &copy; 2014 Marek Matejak, Charles University in Prague.</p><br/>

</html>"),
        Diagram(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},
              {100,100}}),   graphics={Rectangle(extent={{34,88},{70,50}},
                lineColor={127,0,0}), Text(
              extent={{34,50},{70,56}},
              lineColor={0,0,255},
              textString="Macula Densa")}),         Icon(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics={Text(
              extent={{-100,-100},{100,-80}},
              lineColor={0,0,255},
              textString="%name")}));
    end Kidney2;
  end Kidney;

  package Skin
    model Skin
      extends Physiolibrary.Organs.Interfaces.BaseTissue;
      extends Physiolibrary.Icons.Skin;

    Physiolibrary.Fluid.Components.Conductor skin(redeclare package Medium =
            Blood,                                useConductanceInput=
          true)
      annotation (Placement(transformation(extent={{80,-26},{56,-2}})));
    Physiolibrary.Blocks.Factors.Spline A2Effect_Skin(
      data={{0.0,1.05,0},{1.3,1.00,-0.08},{3.5,0.50,0}},
      Xscale=1e-9/1.046,
      UsePositiveLog10=true)
      annotation (Placement(transformation(extent={{58,30},{78,50}})));
    Physiolibrary.Blocks.Factors.Spline ADHEffect_Skin(
      data={{0.8,1.0,0},{3.0,0.1,0}},
      Xscale=1e-9/1.084,
      UsePositiveLog10=true)
      annotation (Placement(transformation(extent={{58,16},{78,36}})));
    Physiolibrary.Types.Constants.HydraulicConductanceConst BasicConductance(k=
          2.0001642022551e-10)
      annotation (Placement(transformation(extent={{54,72},{66,84}})));
    Components.ViscosityConductance            Viscosity_Skin(redeclare package
          Blood = Blood)
      annotation (Placement(transformation(extent={{78,58},{58,78}})));
    Physiolibrary.Blocks.Factors.Normalization Anesthesia_Skin
      annotation (Placement(transformation(extent={{58,50},{78,70}})));
      Physiolibrary.Blocks.Factors.SplineLagOrZero
        Vasculature_Skin(
        useFunctionFailedInput=true,
        HalfTime=30*86400*Modelica.Math.log(2),                  data={{41,1.2,0},{51,1.0,-0.03},{61,0.8,0}},
        stateName="Skin-Vasculature.Effect")
        annotation (Placement(transformation(extent={{58,40},{78,60}})));
    Physiolibrary.Blocks.Factors.Normalization TermoregulationEffect
      annotation (Placement(transformation(extent={{58,-2},{78,18}})));
    equation
      connect(Anesthesia_Skin.yBase,Viscosity_Skin. y) annotation (Line(
          points={{68,62},{68,64}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Anesthesia_Skin.y,Vasculature_Skin. yBase) annotation (Line(
          points={{68,56},{68,56}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Vasculature_Skin.y,A2Effect_Skin. yBase) annotation (Line(
          points={{68,44},{68,42}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(BasicConductance.y, Viscosity_Skin.yBase)      annotation (Line(
          points={{67.5,78},{68,78},{68,70}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(busConnector.Anesthesia_VascularConductance, Anesthesia_Skin.u)
        annotation (Line(
          points={{-90,90},{-12,90},{-12,60},{60,60}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}}));
      connect(busConnector.Skin_Function_Failed, Vasculature_Skin.Failed)
        annotation (Line(
          points={{-90,90},{-12,90},{-12,54},{58,54}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}}));
      connect(busConnector.Skin_PO2, Vasculature_Skin.u) annotation (Line(
          points={{-90,90},{-12,90},{-12,48},{58,48}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}}));
      connect(skin.q_out, port_b) annotation (Line(
          points={{56,-14},{-24,-14},{-24,0},{-100,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(skin.q_in, flowMeasure.q_out) annotation (Line(
          points={{80,-14},{80,0},{78,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(ADHEffect_Skin.y, busConnector.skin_conductanceWithoutTermoregulationEffect)
        annotation (Line(
          points={{68,22},{-90,22},{-90,90}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      connect(busConnector.skinFlow_termoregulationEffect,
        TermoregulationEffect.u) annotation (Line(
          points={{-90,90},{-88,90},{-88,8},{60,8}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}}));
      connect(ADHEffect_Skin.y, TermoregulationEffect.yBase) annotation (Line(
          points={{68,22},{68,10}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(TermoregulationEffect.y, skin.cond) annotation (Line(
          points={{68,4},{68,-6.8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(A2Effect_Skin.y, ADHEffect_Skin.yBase) annotation (Line(
          points={{68,36},{68,28}},
          color={0,0,127},
          smooth=Smooth.None));
    connect(busConnector.Angiotensin2, A2Effect_Skin.u) annotation (Line(
        points={{-90,90},{-12,90},{-12,40},{60,40}},
        color={0,0,255},
        thickness=0.5,
        smooth=Smooth.None), Text(
        string="%first",
        index=-1,
        extent={{-6,3},{-6,3}}));
    connect(busConnector.Vasopressin, ADHEffect_Skin.u) annotation (Line(
        points={{-90,90},{-12,90},{-12,26},{60,26}},
        color={0,0,255},
        thickness=0.5,
        smooth=Smooth.None), Text(
        string="%first",
        index=-1,
        extent={{-6,3},{-6,3}}));
      connect(Viscosity_Skin.port, port_a) annotation (Line(points={{78,68},{
              110,68},{110,0}}, color={0,127,255}));
       annotation (
        Documentation(info="<HTML>
<PRE>
Blood resistance in skin.

QHP 2008 / Skin-Flow

</PRE>
</HTML>
",   revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> january 2009 </i><br>
       by Marek Matejak in Modelica initially implemented (consulted with Jiri Kofranek), Charles University, Prague<br>
       orginaly described by Tom Coleman in QHP 2008 beta 3, University of Mississippi Medical Center
       </li>
</ul>
</html>"),
         Icon(graphics={Text(
              extent={{-100,-100},{100,-80}},
              lineColor={0,0,255},
              textString="%name")}));
    end Skin;
  end Skin;

  package Blood "Red Cells and Blood Properties"
    class References "References"
      extends Modelica.Icons.References;

      annotation (Documentation(info="<html>
<table>

	<tr>
		<td>[Begg1966]</td>
		<td>T. Begg and J. Hearns, \"Components in blood viscosity. The relative contribution of haematocrit, plasma fibrinogen and other proteins,\" Clinical science, vol. 31, pp. 87-93, 1966. </td>
	</tr>
	<tr>
		<td>[Brezis1995]</td>
		<td>M. Brezis and S. Rosen, \"Hypoxia of the Renal Medulla — Its Implications for Disease,\" New England Journal of Medicine, vol. 332, pp. 647-655, 1995. </td>
	</tr>
	<tr>
		<td>[Fan1980]</td>
		<td>F. C. Fan, R. Y. Chen, G. B. Schuessler, and S. Chien, Effects of hematocrit variations on regional hemodynamics and oxygen transport in the dog vol. 238, 1980. </td>
	</tr>
	<tr>
		<td>[Jan1977]</td>
		<td>K. M. Jan and S. Chien, Effect of hematocrit variations on coronary hemodynamics and oxygen utilization vol. 233, 1977. </td>
	</tr>
	<tr>
		<td>[Schrier1970]</td>
		<td>R. W. Schrier, K. M. McDonald, R. Wells, and D. P. Lauler, \"Influence of hematocrit and colloid on whole blood viscosity during volume expansion,\" Am. J. Physiol, vol. 218, p. 77, 1970. </td>
	</tr>
	<tr>
		<td>[Stone1968]</td>
		<td>H. Stone, Thompson HK, and K. Schmidt-Nielsen, Influence of erythrocytes on blood viscosity vol. 214, 1968. </td>
	</tr>
	<tr>
		<td>[Whittaker1933]</td>
		<td>S. R. F. Whittaker and F. R. Winton, \"The apparent viscosity of blood flowing in the isolated hindlimb of the dog, and its variation with corpuscular concentration,\" The Journal of Physiology, vol. 78, pp. 339-369, July 10, 1933 1933.  </td>
	</tr>


</table>
</html>"));
    end References;

    model BloodPropertiesBase
        extends Physiolibrary.Icons.Blood;

      Modelica.Blocks.Math.Add BloodVolume
        annotation (Placement(transformation(extent={{10,-70},{18,-62}})));
      Modelica.Blocks.Math.Min CollapsedEffect
        annotation (Placement(transformation(extent={{50,-84},{58,-76}})));
      Modelica.Blocks.Math.Division division
        annotation (Placement(transformation(extent={{38,-78},{46,-70}})));
    Physiolibrary.Types.Constants.OneConst one
      annotation (Placement(transformation(extent={{26,-94},{34,-86}})));
      Modelica.Blocks.Math.Division HtcFract
        annotation (Placement(transformation(extent={{32,-46},{40,-38}})));
    Physiolibrary.Types.Constants.OneConst one2
      annotation (Placement(transformation(extent={{28,-14},{36,-6}})));
      Modelica.Blocks.Math.Feedback PVCrit
        annotation (Placement(transformation(extent={{38,-14},{46,-6}})));
    Physiolibrary.Types.Constants.ConcentrationConst Hb(k=9.3)
      annotation (Placement(transformation(extent={{-20,8},{-28,16}})));
    Physiolibrary.Blocks.Factors.Normalization hematocritEffect(NormalValue=
          0.44)
      annotation (Placement(transformation(extent={{-44,-10},{-24,10}})));
    Physiolibrary.Types.Constants.ConcentrationConst DPG(k=5.4)
      annotation (Placement(transformation(extent={{26,90},{18,98}})));
    Physiolibrary.Types.Constants.FractionConst FMetHb(k=0.005)
      annotation (Placement(transformation(extent={{26,82},{18,90}})));
    Physiolibrary.Types.Constants.FractionConst FHbF(k=0.005)
      annotation (Placement(transformation(extent={{26,74},{18,82}})));
    Physiolibrary.Types.BusConnector busConnector
      annotation (Placement(transformation(extent={{-104,58},{-84,78}})));
      Modelica.Blocks.Math.Division division3(y(displayUnit="mmol/l"))
        annotation (Placement(transformation(extent={{-4,-4},{4,4}},
            origin={-4,2})));
      Modelica.Blocks.Math.Feedback feedback
        annotation (Placement(transformation(extent={{-20,32},{-40,52}})));
      Modelica.Blocks.Math.Add BloodVolume1
        annotation (Placement(transformation(extent={{-46,24},{-38,32}})));
      Modelica.Blocks.Math.Product product
        annotation (Placement(transformation(extent={{66,2},{74,10}})));
      Modelica.Blocks.Math.Sum V0(nin=5)
        annotation (Placement(transformation(extent={{-30,-90},{-22,-82}})));
      Modelica.Blocks.Math.Sum VeinsVol(nin=5) "volume of deoxygenated blood"
        annotation (Placement(transformation(extent={{-26,-54},{-18,-46}})));
      Modelica.Blocks.Math.Sum ArtysVol(nin=4) "volume of oxygenated blood"
        annotation (Placement(transformation(extent={{-26,-34},{-18,-26}})));
      ViscosityConductanceEffect viscosityConductanceEffect annotation (
          Placement(transformation(rotation=0, extent={{58,-44},{78,-24}})));
    equation
      connect(busConnector.PlasmaVol_Vol, BloodVolume.u2)
                                                  annotation (Line(
          points={{-94,68},{-94,-68.4},{9.2,-68.4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(busConnector.RBCVol_Vol, BloodVolume.u1)
                                                annotation (Line(
          points={{-94,68},{-94,-63.6},{9.2,-63.6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(division.y, CollapsedEffect.u1)
                                  annotation (Line(
          points={{46.4,-74},{47.8,-74},{47.8,-77.6},{49.2,-77.6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(BloodVolume.y, division.u1)
                                  annotation (Line(
          points={{18.4,-66},{28,-66},{28,-71.6},{37.2,-71.6}},
          color={0,0,127},
          smooth=Smooth.None));
    connect(one.y, CollapsedEffect.u2) annotation (Line(
        points={{35,-90},{42,-90},{42,-82.4},{49.2,-82.4}},
        color={0,0,127},
        smooth=Smooth.None));
      connect(CollapsedEffect.y, busConnector.BloodVol_CollapsedEffect)
                                                            annotation (Line(
          points={{58.4,-80},{90,-80},{90,68},{-94,68}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(HtcFract.u2, BloodVolume.y)
                                  annotation (Line(
          points={{31.2,-44.4},{26,-44.4},{26,-66},{18.4,-66}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(HtcFract.u1,busConnector. RBCVol_Vol) annotation (Line(
          points={{31.2,-39.6},{-94,-39.6},{-94,68}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(HtcFract.y, viscosityConductanceEffect.hematocrit) annotation (
          Line(
          points={{40.4,-42},{50,-42},{50,-38},{58,-38}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(viscosityConductanceEffect.effect, busConnector.Viscosity_ConductanceEffect)
        annotation (Line(
          points={{78,-34},{90,-34},{90,68},{-94,68}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(HtcFract.y,busConnector. BloodVol_Hct) annotation (Line(
          points={{40.4,-42},{42,-42},{42,-20},{-94,-20},{-94,68}},
          color={0,0,127},
          smooth=Smooth.None));
    connect(one2.y, PVCrit.u1) annotation (Line(
        points={{37,-10},{38.8,-10}},
        color={0,0,127},
        smooth=Smooth.None));
      connect(HtcFract.y,PVCrit. u2) annotation (Line(
          points={{40.4,-42},{42,-42},{42,-13.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(PVCrit.y,busConnector. BloodVol_PVCrit) annotation (Line(
          points={{45.6,-10},{90,-10},{90,68},{-94,68}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
    connect(Hb.y, hematocritEffect.yBase) annotation (Line(
        points={{-29,12},{-34,12},{-34,2}},
        color={0,0,127},
        smooth=Smooth.None));
      connect(hematocritEffect.y,busConnector. ctHb) annotation (Line(
          points={{-34,-4},{-34,-10},{-94,-10},{-94,68}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
    connect(busConnector.cDPG, DPG.y) annotation (Line(
        points={{-94,68},{-4,68},{-4,94},{17,94}},
        color={0,0,255},
        thickness=0.5,
        smooth=Smooth.None), Text(
        string="%first",
        index=-1,
        extent={{-6,3},{-6,3}}));
    connect(busConnector.FMetHb, FMetHb.y) annotation (Line(
        points={{-94,68},{-4,68},{-4,86},{17,86}},
        color={0,0,255},
        thickness=0.5,
        smooth=Smooth.None), Text(
        string="%first",
        index=-1,
        extent={{-6,3},{-6,3}}));
    connect(busConnector.FHbF, FHbF.y) annotation (Line(
        points={{-94,68},{-4,68},{-4,78},{17,78}},
        color={0,0,255},
        thickness=0.5,
        smooth=Smooth.None), Text(
        string="%first",
        index=-1,
        extent={{-6,3},{-6,3}}));
    connect(Hb.y, division3.u1) annotation (Line(
        points={{-29,12},{-34,12},{-34,4},{-8.8,4},{-8.8,4.4}},
        color={0,0,127},
        smooth=Smooth.None));
      connect(HtcFract.y, division3.u2) annotation (Line(
          points={{40.4,-42},{42,-42},{42,-20},{-18,-20},{-18,-0.4},{-8.8,
            -0.4}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(division3.y, busConnector.ctHb_ery) annotation (Line(
          points={{0.4,2},{20,2},{20,68},{-94,68}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      connect(BloodVolume.y, feedback.u1) annotation (Line(
          points={{18.4,-66},{26,-66},{26,42},{-22,42}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(busConnector.ArtysVol, BloodVolume1.u1) annotation (Line(
          points={{-94,68},{-94,30},{-46.8,30},{-46.8,30.4}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}}));
      connect(busConnector.VeinsVol, BloodVolume1.u2) annotation (Line(
          points={{-94,68},{-94,26},{-46.8,26},{-46.8,25.6}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}}));
      connect(BloodVolume1.y, feedback.u2) annotation (Line(
          points={{-37.6,28},{-30,28},{-30,34}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(PVCrit.y, product.u2) annotation (Line(
          points={{45.6,-10},{54,-10},{54,3.6},{65.2,3.6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(busConnector.PortalVein_BloodFlow, product.u1) annotation (Line(
          points={{-94,68},{54,68},{54,8.4},{65.2,8.4}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None));
      connect(product.y, busConnector.PortalVein_PlasmaFlow) annotation (Line(
          points={{74.4,6},{90,6},{90,68},{-94,68}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(busConnector.PulmonaryCirculation_V0,V0. u[1])
        annotation (Line(
          points={{-94,68},{-94,-82},{-32,-82},{-32,-86.32},{-30.8,-86.32}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,6},{-6,6}}));
      connect(busConnector.Heart_V0,V0. u[2]) annotation (
          Line(
          points={{-94,68},{-94,-86.16},{-30.8,-86.16}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,2},{-6,2}}));
      connect(busConnector.SystemicArtys_V0,V0. u[3])
        annotation (Line(
          points={{-94,68},{-94,-90},{-32,-90},{-32,-86},{-30.8,-86}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,-2},{-6,-2}}));
      connect(busConnector.PortalVein_V0,V0. u[4]) annotation (Line(
          points={{-94,68},{-94,-94},{-32,-94},{-32,-85.84},{-30.8,-85.84}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,-6},{-6,-6}}));
      connect(busConnector.SystemicVeins_V0,V0. u[5]) annotation (Line(
          points={{-94,68},{-94,-98},{-32,-98},{-32,-85.68},{-30.8,-85.68}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,-10},{-6,-10}}));
      connect(VeinsVol.y, busConnector.VeinsVol) annotation (Line(
          points={{-17.6,-50},{2,-50},{2,-42},{-94,-42},{-94,68}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      connect(busConnector.PulmonaryCirculation_DeoxygenatedBloodVolume,VeinsVol. u[1])
        annotation (Line(
          points={{-94,68},{-94,-46},{-28,-46},{-28,-50.32},{-26.8,-50.32}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,6},{-6,6}}));
      connect(busConnector.Heart_DeoxygenatedBloodVolume,VeinsVol. u[2]) annotation (
          Line(
          points={{-94,68},{-94,-50.16},{-26.8,-50.16}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,2},{-6,2}}));
      connect(busConnector.SplanchnicCirculation_DeoxygenatedBloodVolume,VeinsVol. u[3])
        annotation (Line(
          points={{-94,68},{-94,-54},{-28,-54},{-28,-50},{-26.8,-50}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,-2},{-6,-2}}));
      connect(busConnector.SystemicVeins_DeoxygenatedBloodVolume,VeinsVol. u[4])
        annotation (Line(
          points={{-94,68},{-94,-58},{-28,-58},{-28,-49.84},{-26.8,-49.84}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,-6},{-6,-6}}));
      connect(ArtysVol.y, busConnector.ArtysVol) annotation (Line(
          points={{-17.6,-30},{2,-30},{2,-22},{-94,-22},{-94,68}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      connect(busConnector.PulmonaryCirculation_OxygenatedBloodVolume,ArtysVol. u[1])
        annotation (Line(
          points={{-94,68},{-94,-26},{-28,-26},{-28,-30.3},{-26.8,-30.3}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,6},{-6,6}}));
      connect(busConnector.Heart_OxygenatedBloodVolume,ArtysVol. u[2]) annotation (
          Line(
          points={{-94,68},{-94,-30.1},{-26.8,-30.1}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,2},{-6,2}}));
      connect(busConnector.SystemicArtys_OxygenatedBloodVolume,ArtysVol. u[3])
        annotation (Line(
          points={{-94,68},{-94,-34},{-28,-34},{-28,-29.9},{-26.8,-29.9}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,-2},{-6,-2}}));
      connect(feedback.y, busConnector.BloodVolume_change) annotation (Line(
          points={{-39,42},{-66,42},{-66,68},{-94,68}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
    connect(BloodVolume.y, busConnector.BloodVolume) annotation (Line(
        points={{18.4,-66},{90,-66},{90,68},{-94,68}},
        color={0,0,127},
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    connect(HtcFract.y, hematocritEffect.u) annotation (Line(
        points={{40.4,-42},{42,-42},{42,-20},{-52,-20},{-52,0},{-42,0}},
        color={0,0,127},
        smooth=Smooth.None));
      connect(busConnector.LegArtys_OxygenatedBloodVolume, ArtysVol.u[4])
        annotation (Line(
          points={{-94,68},{-94,-38},{-26.8,-38},{-26.8,-29.7}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,-6},{-6,-6}}));
      connect(busConnector.LegVeins_DeoxygenatedBloodVolume, VeinsVol.u[5])
        annotation (Line(
          points={{-94,68},{-94,-62},{-28,-62},{-28,-49.68},{-26.8,-49.68}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,-10},{-6,-10}}));
    connect(V0.y, division.u2) annotation (Line(
        points={{-21.6,-86},{8,-86},{8,-76.4},{37.2,-76.4}},
        color={0,0,127},
        smooth=Smooth.None));
      annotation ( Icon(coordinateSystem(
              preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
            graphics={                          Text(
              extent={{-142,-108},{142,-130}},
              lineColor={0,0,255},
              textString="%name")}),
        Documentation(info="<html>
<p>BloodVolume .. whole blood volume</p>
<p>BloodVol_Hct .. haematocrit</p>
<p>BloodVol_PVCrit .. 1-BloodVol_Hct, plamacrit</p>
<p>ctHb_ery .. concentration of heme group in erythrocytes = 4 * MCHC (mean corpuscular hemoglobin concentration)</p>
<p>ctHb .. concentration of heme group in whole blood</p>
<p>FHbF .. featal Hb fraction from all Hb</p>
<p>FMetHb .. metha-Hb fraction from all Hb</p>
<p>cDPG .. concentration of 2,3-diphosphoglycerate in erythrocytes</p>
<p>Viscosity_ConductanceEffect .. multiply coeficient of blood resistance through vesseles</p>
<p>BloodVol_CollapsedEffect .. effect of small blood volume on systemic veins collasping</p>
<p>Vesseles_V0 .. volume of no-pressure generating blood in all vessels.</p>
<p>ArtysVol .. volume of all oxigenated blood</p>
<p>VeinsVol .. volume of all deoxigenated blood</p>
</html>",
        revisions="<html>

<table>
<tr>
<td>Author:</td>
<td>Marek Matejak</td>
</tr>
<tr>
<td>License:</td>
<td><a href=\"http://www.physiomodel.org/license.html\">Physiomodel License 1.0</a> </td>
</tr>
<tr>
<td>By:</td>
<td>Charles University, Prague</td>
</tr>
<tr>
<td>Date of:</td>
<td>2009</td>
</tr>
<tr>
<td>References:</td>
<td>Tom Coleman: QHP 2008 beta 3, University of Mississippi Medical Center</td>
</tr>
</table>
<br/><p>Copyright &copy; 2014 Marek Matejak, Charles University in Prague.</p><br/>

</html>"));
    end BloodPropertiesBase;

    model RedCells
      extends Physiolibrary.Icons.RedCells;
      Physiolibrary.Blocks.Factors.SplineLag      EPOEffect(
        HalfTime=3*86400*Modelica.Math.log(2),
        data={{0.0,0.0,0},{1.3,1.0,1.0},{4.0,4.0,0}},
        stateName="[EPO]Delay.Effect",
      UsePositiveLog10=true,
      Xscale=1e3) "20 miu/ml = 20e3 iu/m3"
        annotation (Placement(transformation(extent={{-46,-16},{-26,4}})));
    Physiolibrary.Types.BusConnector busConnector
      annotation (Placement(transformation(extent={{-88,58},{-68,78}})));
      Physiolibrary.Blocks.Math.FractionGain
                                H2O(f=0.66)
        annotation (Placement(transformation(extent={{-4,-4},{4,4}},
          origin={54,-84})));
      Physiolibrary.Organs.Kidney.EPO EPO
        annotation (Placement(transformation(extent={{-74,-16},{-54,4}})));
    Physiolibrary.Population.Sources.Growth transfusion(useChangeInput=true)
      annotation (Placement(transformation(extent={{-46,-52},{-26,-32}})));
    Physiolibrary.Population.Sources.Growth erythropoiesis(useChangeInput=
          true)
      annotation (Placement(transformation(extent={{-46,-30},{-26,-10}})));
    Physiolibrary.Population.Sources.Loss hemorrhage(useChangeInput=true)
      annotation (Placement(transformation(extent={{58,-32},{78,-12}})));
    Physiolibrary.Population.Components.Mortality mortality(LifeTime(
          displayUnit="d") = 10368000)
      annotation (Placement(transformation(extent={{58,-52},{78,-32}})));
    Physiolibrary.Population.Components.Population erythrocytes(
      population_start=12e12,
      NominalPopulation=1e12,
      NominalPopulationChange=1e6)
      "red cell count (with density of 5e6 per one uL)"
      annotation (Placement(transformation(extent={{4,-42},{24,-22}})));
      Modelica.Blocks.Math.Gain RBCVol(k=2.4e-3/12e12) "12e12 cells == 2.4 L"
      annotation (Placement(transformation(
          extent={{-4,-4},{4,4}},
          origin={30,-76})));
    Physiolibrary.Types.Constants.PopulationChangeConst RBCBaseSecretionRate(
        k=1.16e6) "13.7 ml/day (12e12 cells == 2.4 L)"
      annotation (Placement(transformation(extent={{-50,8},{-42,16}})));
      Modelica.Blocks.Math.Gain RBCVolToCells(k=12e12/2.4e-3)
      "12e12 cells == 2.4 L" annotation (Placement(transformation(
          extent={{-4,-4},{4,4}},
          origin={-58,-36})));
      Modelica.Blocks.Math.Gain RBCVol2(k=12e12/2.4e-3)
      "12e12 cells == 2.4 L" annotation (Placement(transformation(
          extent={{-4,-4},{4,4}},
          rotation=270,
          origin={68,0})));
    equation

      connect(H2O.y, busConnector.RBCH2O_Vol) annotation (Line(
          points={{58.4,-84},{98,-84},{98,68},{-78,68}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
    connect(EPOEffect.u, EPO.Erythropoetin) annotation (Line(
        points={{-44,-6},{-54,-6}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(busConnector, EPO.busConnector) annotation (Line(
        points={{-78,68},{-78,-12},{-72,-12}},
        color={255,204,51},
        thickness=0.5,
        smooth=Smooth.None));
    connect(EPOEffect.y, erythropoiesis.populationChange) annotation (Line(
        points={{-36,-10},{-36,-16}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(erythropoiesis.port_b, erythrocytes.port) annotation (Line(
        points={{-26,-20},{-6,-20},{-6,-32},{14,-32}},
        color={0,127,127},
        thickness=1,
        smooth=Smooth.None));
    connect(transfusion.port_b, erythrocytes.port) annotation (Line(
        points={{-26,-42},{-6,-42},{-6,-32},{14,-32}},
        color={0,127,127},
        thickness=1,
        smooth=Smooth.None));
    connect(erythrocytes.port, hemorrhage.port_a) annotation (Line(
        points={{14,-32},{34,-32},{34,-22},{58,-22}},
        color={0,127,127},
        thickness=1,
        smooth=Smooth.None));
    connect(erythrocytes.port, mortality.port_a) annotation (Line(
        points={{14,-32},{34,-32},{34,-42},{58.2,-42}},
        color={0,127,127},
        thickness=1,
        smooth=Smooth.None));
    connect(RBCVol.y, H2O.u) annotation (Line(
        points={{34.4,-76},{42,-76},{42,-84},{49.2,-84}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(erythrocytes.population, RBCVol.u) annotation (Line(
        points={{20,-42},{20,-76},{25.2,-76}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(RBCVol.y, busConnector.RBCVol_Vol) annotation (Line(
        points={{34.4,-76},{98,-76},{98,68},{-78,68}},
        color={0,0,127},
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    connect(RBCBaseSecretionRate.y, EPOEffect.yBase) annotation (Line(
        points={{-41,12},{-36,12},{-36,-4}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(transfusion.populationChange, RBCVolToCells.y) annotation (Line(
        points={{-36,-38},{-36,-36},{-53.6,-36}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(busConnector.Transfusion_RBCRate, RBCVolToCells.u) annotation (
        Line(
        points={{-78,68},{-78,-36},{-62.8,-36}},
        color={255,204,51},
        thickness=0.5,
        smooth=Smooth.None), Text(
        string="%first",
        index=-1,
        extent={{-6,3},{-6,3}}));
    connect(busConnector.Hemorrhage_RBCRate, RBCVol2.u) annotation (Line(
        points={{-78,68},{68,68},{68,4.8}},
        color={255,204,51},
        thickness=0.5,
        smooth=Smooth.None), Text(
        string="%first",
        index=-1,
        extent={{-6,3},{-6,3}}));
    connect(RBCVol2.y, hemorrhage.populationChange) annotation (Line(
        points={{68,-4.4},{68,-18}},
        color={0,0,127},
        smooth=Smooth.None));
      annotation ( Icon(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics={                  Text(
              extent={{-136,-46},{148,-68}},
              lineColor={0,0,255},
              textString="%name")}),
        Documentation(revisions="<html>

<table>
<tr>
<td>Author:</td>
<td>Marek Matejak</td>
</tr>
<tr>
<td>License:</td>
<td><a href=\"http://www.physiomodel.org/license.html\">Physiomodel License 1.0</a> </td>
</tr>
<tr>
<td>By:</td>
<td>Charles University, Prague</td>
</tr>
<tr>
<td>Date of:</td>
<td>2009</td>
</tr>
<tr>
<td>References:</td>
<td>Tom Coleman: QHP 2008 beta 3, University of Mississippi Medical Center</td>
</tr>
</table>
<br/><p>Copyright &copy; 2014 Marek Matejak, Charles University in Prague.</p><br/>

</html>"));
    end RedCells;

    model ViscosityConductanceEffect
      Blocks.Interpolation.Curve HtcOnVisc(
        x={0,0.44,0.8},
        y={0.5,1,5},
        slope={0.8,3,30})
        annotation (Placement(transformation(extent={{46,-52},{66,-32}})));
      Modelica.Blocks.Math.Division division1
        annotation (Placement(transformation(extent={{78,-40},{86,-32}})));
      Types.Constants.OneConst one1
        annotation (Placement(transformation(extent={{64,-30},{72,-22}})));
      Modelica.Blocks.Interfaces.RealInput hematocrit annotation (Placement(
            transformation(rotation=0, extent={{-110,-50},{-90,-30}})));
      Modelica.Blocks.Interfaces.RealOutput effect annotation (Placement(
            transformation(rotation=0, extent={{90,-10},{110,10}})));
    equation
    connect(one1.y,division1. u1) annotation (Line(
        points={{73,-26},{74,-26},{74,-33.6},{77.2,-33.6}},
        color={0,0,127},
        smooth=Smooth.None));
      connect(HtcOnVisc.val,division1. u2) annotation (Line(
          points={{66,-42},{75.5,-42},{75.5,-38.4},{77.2,-38.4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(hematocrit, HtcOnVisc.u) annotation (Line(points={{-100,-40},{-28,
              -40},{-28,-42},{46,-42}}, color={0,0,127}));
      connect(effect, division1.y) annotation (Line(points={{100,0},{94,0},{94,
              -36},{86.4,-36}}, color={0,0,127}));
    end ViscosityConductanceEffect;
  end Blood;

  package Systems
    model Cardiovascular
      extends Physiolibrary.Icons.CardioVascular;
      //  extends Physiomodel.Library.Utilities.DynamicState(stateName="BloodVol.Vol", initType=Library.Utilities.Init.NoInit);

      replaceable package Blood = Physiolibrary.Media.Blood                   constrainedby
        Physiolibrary.Media.Interfaces.PartialMedium                                                                                     annotation ( choicesAllMatching = true);

      Heart.Heart heart(redeclare package Blood = Blood)
        annotation (Placement(transformation(extent={{-2,-6},{24,20}})));
      Physiolibrary.Organs.Lungs.Components.PulmonaryCirculation pulmonary(
          redeclare package Blood = Blood)
        annotation (Placement(transformation(extent={{2,50},{30,78}})));
      Systemic systemic(redeclare package Blood = Blood)
        annotation (Placement(transformation(extent={{-4,-70},{30,-36}})));
    Physiolibrary.Types.BusConnector busConnector
      "signals of organ bood flow resistence" annotation (Placement(
          transformation(extent={{-38,-10},{-16,12}}),iconTransformation(extent=
             {{-100,60},{-60,100}})));
      Physiolibrary.Organs.Blood.RedCells redCells
        annotation (Placement(transformation(extent={{-34,24},{-54,44}})));

    /*initial equation
  if STEADY then
     bloodProperties.feedback.y = 0;
  end if;
*/

    equation
      connect(busConnector, pulmonary.busConnector) annotation (Line(
          points={{-27,1},{-26,1},{-26,71},{2,71}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None));
      connect(busConnector, systemic.busConnector) annotation (Line(
          points={{-27,1},{-26,1},{-26,-46.2},{-4.34,-46.2}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None));
      connect(busConnector, redCells.busConnector)    annotation (Line(
          points={{-27,1},{-26,1},{-26,40.8},{-36.2,40.8}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None));
      connect(heart.leftVentricle, systemic.port_a) annotation (Line(
          points={{21.4,-0.8},{21.4,0},{30,0},{30,-53}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(systemic.port_b, heart.rightAtrium) annotation (Line(
          points={{-4,-53},{-4,14.8},{0.6,14.8}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pulmonary.q_in, heart.rightVentricle) annotation (Line(
          points={{2,64},{-8,64},{-8,0},{0.6,0},{0.6,-0.8}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pulmonary.q_out, heart.leftAtrium) annotation (Line(
          points={{30,64},{36,64},{36,16},{20,16},{20,14.54},{21.14,14.54}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));

    //  stateValue = bloodProperties.BloodVolume1.y;

      connect(heart.Pericardium, busConnector.Pericardium_Pressure) annotation (
         Line(points={{16.2,20},{16.2,24},{-27,24},{-27,1}}, color={0,0,127}));
      connect(heart.Sympathicus, busConnector.GangliaGeneral_NA) annotation (
          Line(points={{9.96,9.6},{9.96,10},{-26,10},{-26,6},{-27,6},{-27,1}},
            color={0,0,127}));
      connect(heart.Parasympathicus, busConnector.VagusNerve_NA_Hz) annotation (
         Line(points={{2.94,4.4},{2.94,4},{-28,4},{-28,1},{-27,1}}, color={0,0,
              127}));
      annotation ( Documentation(info="<html>
<p><h4><font color=\"#008000\">Cardiovascular system</font></h4></p>
<p><font style=\"color: #008000; \">Connect heart with pulmonary and systemic part. This connection contains pressures and blood flows before and after heart.</font></p>
<p><font style=\"color: #008000; \">Output signal variables about blood volume between lungs capilaries and systemic tissue capilaries are used in gass transport submodels like O2 or CO2.</font></p>
<p><font style=\"color: #008000; \">Output signal Vesseles_V0 is used for systemic veins collapsing in massive blood lost.</font></p>
<p><font style=\"color: #008000; \">The blood properties convert known variables values to another meanings (haematocrit, viscosity, ..).</font></p>
<p><font style=\"color: #008000; \">Red cells contains volume, loss and gains all red blood cells.</font></p>
</html>", revisions="<html>

<table>
<tr>
<td>Author:</td>
<td>Marek Matejak</td>
</tr>
<tr>
<td>License:</td>
<td><a href=\"http://www.physiomodel.org/license.html\">Physiomodel License 1.0</a> </td>
</tr>
<tr>
<td>By:</td>
<td>Charles University, Prague</td>
</tr>
<tr>
<td>Date of:</td>
<td>2009</td>
</tr>
<tr>
<td>References:</td>
<td>Tom Coleman: QHP 2008 beta 3, University of Mississippi Medical Center</td>
</tr>
</table>
<br/><p>Copyright &copy; 2014 Marek Matejak, Charles University in Prague.</p><br/>

</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true,  extent={{-100,-100},{
                100,100}}), graphics={Text(
              extent={{-116,-96},{126,-130}},
              lineColor={0,0,255},
              textString="%name")}));
    end Cardiovascular;

    model Systemic
      extends Physiolibrary.Icons.SystemicCirculation;

      replaceable package Blood = Physiolibrary.Media.Blood                   constrainedby
        Physiolibrary.Media.Interfaces.PartialMedium                                                                                     annotation ( choicesAllMatching = true);

    Physiolibrary.Fluid.Interfaces.FluidPort_a port_a(redeclare package Medium =
            Blood) "Blood inflow" annotation (Placement(transformation(extent={
                {98,-10},{118,10}}, rotation=0), iconTransformation(extent={{90,
                -10},{110,10}})));
    Physiolibrary.Fluid.Interfaces.FluidPort_b port_b(redeclare package Medium =
            Blood) "Blood outflow" annotation (Placement(transformation(extent=
                {{-104,4},{-84,24}}, rotation=0), iconTransformation(extent={{-110,
                -10},{-90,10}})));

      /*
  Library.PressureFlow.NegativePressureFlow fromSystemicVeins annotation (
      Placement(transformation(extent={{-110,-10},{-90,10}}),iconTransformation(
          extent={{-112,44},{-92,64}})));
  Library.PressureFlow.PositivePressureFlow systemicArteries
    annotation (Placement(transformation(extent={{88,-10},{108,10}}),
        iconTransformation(extent={{90,46},{110,66}})));
*/

    Physiolibrary.Fluid.Components.ElasticVessel systemicArtys(redeclare package
                  Medium =                                                                Blood,
        massFractions_start=Blood.ArterialDefault,
        useSubstances=true,
      stateName="SystemicArtys.Vol",
      useV0Input=true,
      useComplianceInput=false,
        volume_start=0.00100036,
        Compliance=1.1625954425608e-08,
      useExternalPressureInput=false,
      ExternalPressure=0,
        nPorts=15)
      annotation (Placement(transformation(extent={{65,-10},{86,11}})));
    Physiolibrary.Types.Constants.VolumeConst               V0_artys(k=0.00085)
      annotation (Placement(transformation(extent={{98,18},{88,28}})));
    Physiolibrary.Types.Constants.HydraulicComplianceConst
      SystemicVeinsCompliance(k=6.645545561992547e-007)
      annotation (Placement(transformation(extent={{-27,10},{-35,18}})));
      Physiolibrary.Organs.Systems.Peripheral peripheral(redeclare package
          Blood = Blood)
        annotation (Placement(transformation(extent={{-2,0},{26,28}})));
      Physiolibrary.Organs.Components.SystemicVeinsElacticBloodCompartment
        systemicVeinsElacticBloodCompartment(
        redeclare package Medium = Blood,
        massFractions_start=Blood.VenousDefault,
          nPorts=8)
        annotation (Placement(transformation(extent={{-56,-10},{-36,10}})));
    Physiolibrary.Types.Constants.PressureConst SystemicVeinsExternalPressure(
        k=0)
      annotation (Placement(transformation(extent={{-36,16},{-43,23}})));
    Physiolibrary.Types.BusConnector busConnector
      "signals of organ bood flow resistence" annotation (Placement(
          transformation(extent={{36,40},{56,60}}), iconTransformation(extent=
             {{-110,32},{-94,48}})));
      Physiolibrary.Organs.Components.CollapsingVeins collapsedVeins(redeclare package
                  Medium = Blood)                                                                     annotation (
          Placement(transformation(
            extent={{-10,10.5},{10,-10.5}},
            rotation=180,
            origin={-84.5,0})));
    Physiolibrary.Fluid.Components.HydrostaticColumn
      gravityHydrostaticDifference(redeclare package Medium = Blood,     useHeightInput=true)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          origin={61,35})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasure(redeclare package
                  Medium = Blood)
      annotation (Placement(transformation(
          extent={{8.5,-8.5},{-8.5,8.5}},
          origin={78.5,45.5})));
      Modelica.Blocks.Math.Gain G(k=9.81) annotation (Placement(transformation(
            extent={{4,-4},{-4,4}},
            rotation=90,
            origin={34,26})));
      Physiolibrary.Organs.Systems.Splanchnic splanchnicCirculation(redeclare package
                  Blood = Blood)
        annotation (Placement(transformation(extent={{-2,-42},{36,-4}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasure1(redeclare package
                  Medium =                                                                  Blood)
      annotation (Placement(transformation(extent={{76,-38},{96,-18}})));
      Chemical.Sources.SubstanceOutflow O2_left(SubstanceFlow(displayUnit=
              "mmol/min") = 1.666666666666667e-05*(2*7.71))                                          annotation (
        Placement(transformation(extent={{76,-90},{96,-70}})));
      Chemical.Sources.SubstanceInflowT CO2_left(
        SubstanceFlow(displayUnit="mmol/min") = 1.666666666666667e-05*(2*6.17),
        redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
        substanceData=Chemical.Substances.CarbonDioxide_gas())
        annotation (Placement(transformation(extent={{28,-90},{48,-70}})));

      Fluid.Sensors.PartialPressure pCO2(
        redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
        substanceData=Chemical.Substances.CarbonDioxide_gas(),
        redeclare package Medium = Blood)
        annotation (Placement(transformation(extent={{14,-50},{34,-70}})));
      Fluid.Sensors.PartialPressure pO2(
        redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
        substanceData=Chemical.Substances.Oxygen_gas(),
        redeclare package Medium = Blood)
        annotation (Placement(transformation(extent={{94,-52},{74,-72}})));
    equation
    connect(systemicArtys.zeroPressureVolume, V0_artys.y) annotation (Line(
        points={{68.15,9.95},{68.15,23},{86.75,23}},
        color={0,0,127},
        smooth=Smooth.None));
      connect(busConnector, peripheral.busConnector)          annotation (
          Line(
          points={{46,50},{46,23.38},{4.3,23.38}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None));
      connect(SystemicVeinsCompliance.y, systemicVeinsElacticBloodCompartment.Compliance)
        annotation (Line(
          points={{-36,14},{-38.2,14},{-38.2,10},{-40,10}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(busConnector,systemicVeinsElacticBloodCompartment. busConnector)
        annotation (Line(
          points={{46,50},{-26,50},{-26,6.1},{-36.2,6.1}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None));
      connect(systemicVeinsElacticBloodCompartment.ExternalPressure,
        SystemicVeinsExternalPressure.y)
        annotation (Line(
          points={{-46,10},{-46,19.5},{-43.875,19.5}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(collapsedVeins.ExternalPressure, busConnector.Thorax_AvePressure)
        annotation (Line(
          points={{-90.5,2.1},{-80,2.1},{-80,50},{46,50}},
          color={0,0,127},
          smooth=Smooth.None));
    connect(pressureMeasure.pressure, busConnector.CarotidSinus_Pressure)
      annotation (Line(
        points={{73.4,42.1},{46,42.1},{46,50}},
        color={0,0,127},
        smooth=Smooth.None));
      connect(gravityHydrostaticDifference.height, busConnector.CarotidSinusHeight)
        annotation (Line(
          points={{50,35},{46,35},{46,50}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(gravityHydrostaticDifference.q_up,pressureMeasure.port)
        annotation (Line(
          points={{71,39},{80,39},{80,37},{78.5,37}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
    connect(pressureMeasure.pressure, busConnector.CarotidSinusArteryPressure)
      annotation (Line(
        points={{73.4,42.1},{46,42.1},{46,50}},
        color={0,0,127},
        smooth=Smooth.None));
      connect(systemicVeinsElacticBloodCompartment.Pressure, busConnector.SystemicVeins_Pressure)
        annotation (Line(
          points={{-56,-4},{-56,-28},{46,-28},{46,50}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      connect(systemicVeinsElacticBloodCompartment.V0, busConnector.SystemicVeins_V0)
        annotation (Line(
          points={{-52.8,10},{-52.8,50},{46,50}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(V0_artys.y, busConnector.SystemicArtys_V0) annotation (Line(
          points={{86.75,23},{70,23},{70,22},{46,22},{46,50}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(collapsedVeins.q_out, port_b) annotation (Line(
          points={{-94.5,-1.22465e-15},{-96.25,-1.22465e-15},{-96.25,14},{-94,
              14}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(busConnector.Gravity_Gz, G.u) annotation (Line(
          points={{46,50},{46,38},{34,38},{34,30.8}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}}));

      connect(splanchnicCirculation.busConnector, busConnector) annotation (
          Line(
          points={{-2,-13.5},{-2,50},{46,50}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None));

    connect(systemicArtys.fluidVolume, busConnector.SystemicArtys_OxygenatedBloodVolume)
      annotation (Line(
        points={{86,-7.9},{72,-7.9},{72,-28},{46,-28},{46,50}},
        color={0,0,127},
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    connect(systemicVeinsElacticBloodCompartment.Vol, busConnector.SystemicVeins_DeoxygenatedBloodVolume)
      annotation (Line(
        points={{-50,-10},{-50,-28},{46,-28},{46,50}},
        color={0,0,127},
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    connect(pressureMeasure1.pressure, busConnector.SystemicArtys_Pressure)
      annotation (Line(
        points={{92,-32},{98,-32},{98,-42},{46,-42},{46,50}},
        color={0,0,127},
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
      connect(systemicArtys.q_in[1], gravityHydrostaticDifference.q_down)
        annotation (Line(
          points={{75.395,-0.774},{52,-0.774},{52,14},{102,14},{102,30.8},{70.8,
              30.8}},
          color={127,0,0},
          thickness=0.5));

      connect(pressureMeasure1.port, systemicArtys.q_in[2]) annotation (Line(
          points={{86,-38},{86,-44},{64,-44},{64,-14},{60,-14},{60,-0.592},{
              75.395,-0.592}},
          color={127,0,0},
          thickness=0.5));

      connect(port_a, systemicArtys.q_in[3]) annotation (Line(
          points={{108,0},{108,14},{54,14},{54,-0.41},{75.395,-0.41}},
          color={127,0,0},
          thickness=0.5));
      connect(port_a, port_a) annotation (Line(
          points={{108,0},{108,0}},
          color={127,0,0},
          thickness=0.5));

      connect(peripheral.port_a, systemicArtys.q_in[4:11]) annotation (Line(
          points={{34.4,14},{52,14},{52,1.046},{75.395,1.046}},
          color={127,0,0},
          thickness=0.5));
      connect(splanchnicCirculation.port_a, systemicArtys.q_in[12:13])
        annotation (Line(
          points={{36,-23},{50,-23},{50,1.41},{75.395,1.41}},
          color={127,0,0},
          thickness=0.5));
      connect(systemicVeinsElacticBloodCompartment.port_b, collapsedVeins.q_in)
        annotation (Line(
          points={{-56,0},{-64.25,0},{-64.25,-1.66533e-15},{-74.5,-1.66533e-15}},
          color={127,0,0},
          thickness=0.5));

      connect(collapsedVeins.q_in, splanchnicCirculation.port_b) annotation (
          Line(
          points={{-74.5,-1.55431e-15},{-68,-1.55431e-15},{-68,-23},{-2,-23}},
          color={127,0,0},
          thickness=0.5));

      connect(systemicVeinsElacticBloodCompartment.port_a[1:8], peripheral.port_b)
        annotation (Line(
          points={{-36,0.4375},{-18,0.4375},{-18,14},{-10.12,14}},
          color={127,0,0},
          thickness=0.5));
      connect(peripheral.Sympathicus, busConnector.GangliaGeneral_NA)
        annotation (Line(points={{13.4,21},{13.4,50},{46,50}}, color={0,0,127}));
      connect(pCO2.port, systemicArtys.q_in[14]) annotation (Line(points={{24,
              -50},{62,-50},{62,-44},{64,-44},{64,-14},{60,-14},{60,1.592},{
              75.395,1.592}}, color={0,127,255}));
      connect(pO2.port, systemicArtys.q_in[15]) annotation (Line(points={{84,
              -52},{84,-44},{64,-44},{64,-14},{60,-14},{60,1.774},{75.395,1.774}},
            color={0,127,255}));
      connect(O2_left.port_a, systemicArtys.substances.O2) annotation (
         Line(points={{76,-80},{60,-80},{60,-16},{58,-16},{58,0.5},{65,0.5}},
            color={158,66,200}));
      connect(pO2.port_a, O2_left.port_a) annotation (Line(points={{74,-62},{74,
              -80},{76,-80}}, color={158,66,200}));
      connect(CO2_left.port_b, systemicArtys.substances.CO2)
        annotation (Line(points={{48,-80},{60,-80},{60,-16},{58,-16},{58,0.5},{
              65,0.5}}, color={158,66,200}));
      connect(pCO2.port_a, CO2_left.port_b) annotation (Line(points={{34,-60},{
              60,-60},{60,-80},{48,-80}}, color={158,66,200}));
     annotation (Diagram(coordinateSystem(preserveAspectRatio=false,extent={{-100,
              -100},{100,100}}),   graphics={Text(
              extent={{42,46},{74,46}},
              lineColor={0,0,255},
              textString="Carotid Artery Pressure")}),
                                     Icon(coordinateSystem(
              preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
            graphics={
            Text(
              extent={{-104,-54},{110,-76}},
              lineColor={0,0,255},
              textString="%name")}),
      Documentation(revisions="<html>

<table>
<tr>
<td>Author:</td>
<td>Marek Matejak</td>
</tr>
<tr>
<td>License:</td>
<td><a href=\"http://www.physiomodel.org/license.html\">Physiomodel License 1.0</a> </td>
</tr>
<tr>
<td>By:</td>
<td>Charles University, Prague</td>
</tr>
<tr>
<td>Date of:</td>
<td>january 2009</td>
</tr>
<tr>
<td>References:</td>
<td>Tom Coleman: QHP 2008 beta 3, University of Mississippi Medical Center</td>
</tr>
</table>
<br/><p>Copyright &copy; 2014 Marek Matejak, Charles University in Prague.</p><br/>

</html>",
        info="<html>
<p>Blood volume (and pressure) distributions between </p>
<p><ul>
<li>systemic arteries, </li>
<li>systemic veins and</li>
<li>portal (splanchnic) vein.</li>
</ul></p>
<p>Blood flow throught: </p>
<p><ul>
<li>GIT, hepatic artery, liver</li>
<li>Kidney</li>
<li>CNS</li>
<li>Skeletal muscle</li>
<li>Respiratory muscle</li>
<li>Skin</li>
<li>Bones</li>
<li>Adipose tissue</li>
<li>Other tissue</li>
</ul></p>
</html>"));
    end Systemic;

    model Peripheral
      extends Physiolibrary.Icons.PerfusionDO;
      extends Physiolibrary.Icons.PeripheralCirculation;

    replaceable package Blood = Physiolibrary.Media.Blood  constrainedby
        Physiolibrary.Media.Interfaces.PartialMedium                                                                                   annotation ( choicesAllMatching = true); //BloodBySiggaardAndersen
    Physiolibrary.Fluid.Interfaces.FluidPort_a port_a[8](redeclare package
          Medium = Blood) "Blood inflow" annotation (Placement(transformation(
              extent={{90,-10},{110,10}}, rotation=0), iconTransformation(
              extent={{150,-10},{170,10}})));
    Physiolibrary.Fluid.Interfaces.FluidPort_b port_b[8](redeclare package
          Medium = Blood) "Blood outflow" annotation (Placement(transformation(
              extent={{-110,-10},{-90,10}}, rotation=0), iconTransformation(
              extent={{-168,-10},{-148,10}})));

    Physiolibrary.Types.BusConnector busConnector
      "signals of organ bood flow resistence" annotation (Placement(
          transformation(extent={{-100,80},{-80,100}}), iconTransformation(
            extent={{-64,58},{-46,76}})));

      Components.Tissue bone(redeclare package Blood = Blood, Cond=
            4.536109889163e-10)
        annotation (Placement(transformation(extent={{-38,62},{-12,88}})));
      Components.Tissue brain(
        redeclare package Blood = Blood,
        onAnesthesia=false,
        onAngiotensinII=false,
        onVasopressin=false,
        onCatecholamines=false,
        onOxygenAndCarbonDioxide=true,
        VasculatureConductanceOnPO2={{27,1.2,0},{37,1.0,-0.03},{47,0.8,0}},
        onOxygenOnly=false,
        Cond=1.1375933900326e-09)
        annotation (Placement(transformation(extent={{12,44},{38,70}})));
      Components.Tissue fat(redeclare package Blood = Blood, Cond=
            3.3752770913055e-10)
        annotation (Placement(transformation(extent={{-38,26},{-12,52}})));
      Skin.Skin skin(redeclare package Blood = Blood)
        annotation (Placement(transformation(extent={{22,-34},{46,-10}})));
      Components.Tissue otherTissue(redeclare package Blood = Blood, Cond=
            5.2504310309196e-10)
        annotation (Placement(transformation(extent={{-36,-98},{-10,-72}})));
      Components.Tissue skeletalMuscle(
        redeclare package Blood = Blood,
        Cond=9.0007389101479e-10,
        onOxygenNeed=true,
        onExercise=true)
        annotation (Placement(transformation(extent={{-34,-54},{-8,-28}})));
      Components.Tissue respiratoryMuscle(
        redeclare package Blood = Blood,
        Cond=1.3751128890504e-10,
        onOxygenNeed=true)
        annotation (Placement(transformation(extent={{20,-78},{46,-52}})));
    /*Physiolibrary.Types.BusConnector busConnector
  "signals of organ bood flow resistence" annotation (Placement(
      transformation(extent={{-68,84},{-48,104}}),  iconTransformation(
        extent={{60,10},{78,28}})));*/
      Kidney.Kidney kidney(redeclare package Blood = Blood)
        annotation (Placement(transformation(extent={{16,12},{36,32}})));
      Types.RealIO.FrequencyInput Sympathicus
        "Sympathetic ganglia general neural activity" annotation (Placement(
            transformation(extent={{-110,50},{-90,70}}), iconTransformation(
              extent={{0,40},{20,60}})));
    equation

      connect(busConnector, otherTissue.busConnector)  annotation (Line(
          points={{-90,90},{52,90},{52,-12},{50,-12},{50,-48},{-2,-48},{-2,
              -77.2},{-12.6,-77.2}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None));
      connect(busConnector, skin.busConnector) annotation (Line(
          points={{-90,90},{52,90},{52,-6},{27.4,-6},{27.4,-13.96}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None));
      connect(busConnector, kidney.busConnector) annotation (Line(
          points={{-90,90},{52,90},{52,34},{40,34},{40,36},{20.5,36},{20.5,28.7}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None));
      connect(busConnector, fat.busConnector) annotation (Line(
          points={{-90,90},{52,90},{52,42},{42,42},{42,40},{-6,40},{-6,46.8},{
              -14.6,46.8}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None));
      connect(busConnector, brain.busConnector) annotation (Line(
          points={{-90,90},{52,90},{52,64.8},{35.4,64.8}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None));
      connect(busConnector, bone.busConnector) annotation (Line(
          points={{-90,90},{-8,90},{-8,82.8},{-14.6,82.8}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None));
      connect(busConnector, skeletalMuscle.busConnector)  annotation (Line(
          points={{-90,90},{52,90},{52,-12},{50,-12},{50,-38},{-2,-38},{-2,
              -33.2},{-10.6,-33.2}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None));
      connect(busConnector, respiratoryMuscle.busConnector) annotation (
          Line(
          points={{-90,90},{52,90},{52,-12},{50,-12},{50,-57.2},{43.4,-57.2}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None));
      connect(bone.BloodFlow, busConnector.bone_BloodFlow)
        annotation (Line(
          points={{-15.9,68.5},{-14,68.5},{-14,58},{-50,58},{-50,80},{-90,80},{
              -90,90}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(brain.BloodFlow, busConnector.brain_BloodFlow)
        annotation (Line(
          points={{34.1,50.5},{52,50.5},{52,90},{-90,90}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(fat.BloodFlow, busConnector.fat_BloodFlow) annotation (
         Line(
          points={{-15.9,32.5},{-14,32.5},{-14,24},{-46,24},{-46,80},{-44,80},{
              -44,90},{-90,90}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(kidney.BloodFlow, busConnector.kidney_BloodFlow)
        annotation (Line(
          points={{33,17},{52,17},{52,90},{-90,90}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(skin.BloodFlow, busConnector.skin_BloodFlow)
        annotation (Line(
          points={{42.4,-28},{48,-28},{48,90},{-90,90}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(skeletalMuscle.BloodFlow, busConnector.skeletalMuscle_BloodFlow)
        annotation (Line(
          points={{-11.9,-47.5},{-10,-47.5},{-10,-58},{-50,-58},{-50,58},{-54,
              58},{-54,78},{-90,78},{-90,90}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(respiratoryMuscle.BloodFlow, busConnector.respiratoryMuscle_BloodFlow)
        annotation (Line(
          points={{42.1,-71.5},{50,-71.5},{50,90},{-90,90}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(otherTissue.BloodFlow, busConnector.otherTissue_BloodFlow)
        annotation (Line(
          points={{-13.9,-91.5},{-12,-91.5},{-12,-102},{-86,-102},{-86,76},{-90,
              76},{-90,90}},
          color={0,0,127},
          smooth=Smooth.None));

        connect(bone.BloodFlow, busConnector.Bone_BloodFlow)
        annotation (Line(
          points={{-15.9,68.5},{-14,68.5},{-14,58},{-50,58},{-50,80},{-90,80},{
              -90,90}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(brain.BloodFlow, busConnector.Brain_BloodFlow)
        annotation (Line(
          points={{34.1,50.5},{52,50.5},{52,90},{-90,90}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(fat.BloodFlow, busConnector.Fat_BloodFlow) annotation (
         Line(
          points={{-15.9,32.5},{-14,32.5},{-14,24},{-46,24},{-46,80},{-44,80},{
              -44,90},{-90,90}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(kidney.BloodFlow, busConnector.Kidney_BloodFlow)
        annotation (Line(
          points={{33,17},{52,17},{52,90},{-90,90}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(skin.BloodFlow, busConnector.Skin_BloodFlow)
        annotation (Line(
          points={{42.4,-28},{48,-28},{48,90},{-90,90}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(skeletalMuscle.BloodFlow, busConnector.SkeletalMuscle_BloodFlow)
        annotation (Line(
          points={{-11.9,-47.5},{-10,-47.5},{-10,-58},{-50,-58},{-50,58},{-54,
              58},{-54,78},{-90,78},{-90,90}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(respiratoryMuscle.BloodFlow, busConnector.RespiratoryMuscle_BloodFlow)
        annotation (Line(
          points={{42.1,-71.5},{42.1,-70},{50,-70},{50,90},{-90,90}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(otherTissue.BloodFlow, busConnector.OtherTissue_BloodFlow)
        annotation (Line(
          points={{-13.9,-91.5},{-12,-91.5},{-12,-102},{-86,-102},{-86,76},{-90,
              76},{-90,90}},
          color={0,0,127},
          smooth=Smooth.None));

    connect(bone.tissueConnector, busConnector.bone) annotation (Line(
        points={{-25,85.4},{-25,90},{-90,90}},
        color={127,0,0},
        thickness=0.5,
        smooth=Smooth.None));
    connect(fat.tissueConnector, busConnector.fat) annotation (Line(
        points={{-25,49.4},{-25,90},{-90,90}},
        color={127,0,0},
        thickness=0.5,
        smooth=Smooth.None));
    connect(skeletalMuscle.tissueConnector, busConnector.skeletalMuscle)
      annotation (Line(
        points={{-21,-30.6},{-21,88},{-22,88},{-22,90},{-90,90}},
        color={127,0,0},
        thickness=0.5,
        smooth=Smooth.None));
    connect(otherTissue.tissueConnector, busConnector.otherTissue)
      annotation (Line(
        points={{-23,-74.6},{-23,90},{-90,90}},
        color={127,0,0},
        thickness=0.5,
        smooth=Smooth.None));
    connect(brain.tissueConnector, busConnector.brain) annotation (Line(
        points={{25,67.4},{24,67.4},{24,90},{-90,90}},
        color={127,0,0},
        thickness=0.5,
        smooth=Smooth.None));
    connect(respiratoryMuscle.tissueConnector, busConnector.respiratoryMuscle)
      annotation (Line(
        points={{33,-54.6},{32,-54.6},{32,-36},{2,-36},{2,90},{-90,90}},
        color={127,0,0},
        thickness=0.5,
        smooth=Smooth.None));
      connect(bone.port_a, port_a[1]) annotation (Line(
          points={{-12,75},{-12,76},{72,76},{72,-4.375},{100,-4.375}},
          color={127,0,0},
          thickness=0.5));
      connect(brain.port_a, port_a[2]) annotation (Line(
          points={{38,57},{38,58},{72,58},{72,-3.125},{100,-3.125}},
          color={127,0,0},
          thickness=0.5));
      connect(fat.port_a, port_a[3]) annotation (Line(
          points={{-12,39},{-12,40},{72,40},{72,-1.875},{100,-1.875}},
          color={127,0,0},
          thickness=0.5));
      connect(kidney.port_a, port_a[4]) annotation (Line(
          points={{42,22},{72,22},{72,-0.625},{100,-0.625}},
          color={127,0,0},
          thickness=0.5));
      connect(skin.port_a, port_a[5]) annotation (Line(
          points={{53.2,-22},{72,-22},{72,0.625},{100,0.625}},
          color={127,0,0},
          thickness=0.5));
      connect(skeletalMuscle.port_a, port_a[6]) annotation (Line(
          points={{-8,-41},{72,-41},{72,1.875},{100,1.875}},
          color={127,0,0},
          thickness=0.5));
      connect(respiratoryMuscle.port_a, port_a[7]) annotation (Line(
          points={{46,-65},{72,-65},{72,3.125},{100,3.125}},
          color={127,0,0},
          thickness=0.5));
      connect(otherTissue.port_a, port_a[8]) annotation (Line(
          points={{-10,-85},{72,-85},{72,4.375},{100,4.375}},
          color={127,0,0},
          thickness=0.5));
      connect(bone.port_b, port_b[1]) annotation (Line(
          points={{-38,75},{-38,74},{-56,74},{-56,-4.375},{-100,-4.375}},
          color={127,0,0},
          thickness=0.5));
      connect(brain.port_b, port_b[2]) annotation (Line(
          points={{12,57},{12,56},{-56,56},{-56,-3.125},{-100,-3.125}},
          color={127,0,0},
          thickness=0.5));
      connect(fat.port_b, port_b[3]) annotation (Line(
          points={{-38,39},{-38,38},{-56,38},{-56,-1.875},{-100,-1.875}},
          color={127,0,0},
          thickness=0.5));
      connect(kidney.port_b, port_b[4]) annotation (Line(
          points={{10.2,22},{-56,22},{-56,-0.625},{-100,-0.625}},
          color={127,0,0},
          thickness=0.5));
      connect(skin.port_b, port_b[5]) annotation (Line(
          points={{15.04,-22},{-56,-22},{-56,0.625},{-100,0.625}},
          color={127,0,0},
          thickness=0.5));
      connect(skeletalMuscle.port_b, port_b[6]) annotation (Line(
          points={{-34,-41},{-56,-41},{-56,1.875},{-100,1.875}},
          color={127,0,0},
          thickness=0.5));
      connect(respiratoryMuscle.port_b, port_b[7]) annotation (Line(
          points={{20,-65},{-56,-65},{-56,3.125},{-100,3.125}},
          color={127,0,0},
          thickness=0.5));
      connect(otherTissue.port_b, port_b[8]) annotation (Line(
          points={{-36,-85},{-56,-85},{-56,4.375},{-100,4.375}},
          color={127,0,0},
          thickness=0.5));
      connect(Sympathicus, bone.Ganglia) annotation (Line(points={{-100,60},{
              -48,60},{-48,92},{-23.7,92},{-23.7,81.5}}, color={0,0,127}));
      connect(Sympathicus, fat.Ganglia) annotation (Line(points={{-100,60},{-14,
              60},{-14,54},{-8,54},{-8,45.5},{-23.7,45.5}}, color={0,0,127}));
      connect(Sympathicus, brain.Ganglia) annotation (Line(points={{-100,60},{
              -48,60},{-48,92},{26.3,92},{26.3,63.5}}, color={0,0,127}));
      connect(Sympathicus, skeletalMuscle.Ganglia) annotation (Line(points={{
              -100,60},{-14,60},{-14,54},{-8,54},{-8,38},{-6,38},{-6,-24},{
              -19.7,-24},{-19.7,-34.5}}, color={0,0,127}));
      connect(Sympathicus, otherTissue.Ganglia) annotation (Line(points={{-100,
              60},{-100,-78.5},{-21.7,-78.5}}, color={0,0,127}));
      connect(Sympathicus, respiratoryMuscle.Ganglia) annotation (Line(points={
              {-100,60},{-14,60},{-14,54},{-8,54},{-8,38},{-6,38},{-6,-24},{4,
              -24},{4,-42},{34.3,-42},{34.3,-58.5}}, color={0,0,127}));
      annotation (
        Documentation(info="<HTML>
<PRE>
Blood resistance in peripheral organs except hepatic artery, gastro interstitional tract, vena porte, liver and liver veins.
</PRE>
</HTML>
",   revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> january 2009 </i><br>
       by Marek Matejak in Modelica initially implemented (consulted with Jiri Kofranek), Charles University, Prague<br>
       orginaly described by Tom Coleman in QHP 2008 beta 3, University of Mississippi Medical Center
       </li>
</ul>
</html>"),
         Icon(graphics={Text(
              extent={{-100,-128},{100,-100}},
              lineColor={0,0,255},
              textString="%name")}));
    end Peripheral;

    model Splanchnic
      extends Physiolibrary.Icons.PerfusionDO;
      extends Physiolibrary.Icons.GITract;

      replaceable package Blood = Physiolibrary.Media.Blood                   constrainedby
        Physiolibrary.Media.Interfaces.PartialMedium                                                                                     annotation ( choicesAllMatching = true);

    Physiolibrary.Fluid.Interfaces.FluidPort_a port_a[2](redeclare package
          Medium = Blood) "Blood inflow" annotation (Placement(transformation(
              extent={{90,-10},{110,10}}, rotation=0), iconTransformation(
              extent={{90,-10},{110,10}})));
    Physiolibrary.Fluid.Interfaces.FluidPort_b port_b(redeclare package Medium =
            Blood) "Blood outflow" annotation (Placement(transformation(extent=
                {{-110,-10},{-90,10}}, rotation=0), iconTransformation(extent={
                {-110,-10},{-90,10}})));

    Physiolibrary.Types.BusConnector busConnector
      "signals of organ bood flow resistence" annotation (Placement(
          transformation(extent={{56,-56},{76,-36}}), iconTransformation(
            extent={{-108,42},{-92,58}})));

    Physiolibrary.Fluid.Components.ElasticVessel portalVein(
        redeclare package Medium = Blood,
        massFractions_start=Blood.VenousDefault,
      stateName="SplanchnicVeins.Vol",
      useExternalPressureInput=true,
      useV0Input=true,
      useComplianceInput=false,
        volume_start=0.00100999,
        Compliance=4.6878848490354e-07,
      nPorts=3)
      annotation (Placement(transformation(extent={{-16,-10},{5,11}})));
      Components.Tissue GITract(redeclare package Blood = Blood, Cond=
            1.4001149415786e-09)
        annotation (Placement(transformation(extent={{34,-12},{58,12}})));
    Physiolibrary.Types.Constants.PressureConst ExternalPressure(k=0)
      annotation (Placement(transformation(extent={{24,20},{16,28}})));
    Physiolibrary.Types.Constants.HydraulicComplianceConst Compliance(k=
          4.6878848490354e-07)
      annotation (Placement(transformation(extent={{10,32},{2,40}})));
    Physiolibrary.Types.Constants.VolumeConst               V0(k(displayUnit=
            "ml") = 0.0005)
      annotation (Placement(transformation(extent={{-27,11},{-19,19}})));
      Liver.Liver liver(redeclare package Blood = Blood)
        annotation (Placement(transformation(extent={{-56,34},{-32,58}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasure(redeclare package
                  Medium = Blood)
      annotation (Placement(transformation(extent={{6,-42},{26,-22}})));
    Modelica.Blocks.Math.Gain SplanchnicCirculation_DeoxygenatedBloodVolume(k=
         1) annotation (Placement(transformation(extent={{-8,-78},{12,-58}})));
    equation

      connect(GITract.busConnector,busConnector)           annotation (Line(
          points={{55.6,7.2},{66,7.2},{66,-46}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None));
      connect(portalVein.externalPressure, ExternalPressure.y)
                                                         annotation (Line(
          points={{1.85,9.95},{1.85,24},{15,24}},
          color={0,0,127},
          smooth=Smooth.None));
    connect(portalVein.zeroPressureVolume, V0.y) annotation (Line(
        points={{-12.85,9.95},{-12.85,15},{-18,15}},
        color={0,0,127},
        smooth=Smooth.None));
      connect(GITract.BloodFlow, busConnector.GITract_BloodFlow) annotation (
          Line(
          points={{54.4,-6},{66,-6},{66,-46}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(V0.y, busConnector.PortalVein_V0)      annotation (Line(
          points={{-18,15},{-12,15},{-12,-46},{66,-46}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
          portalVein.volume = SplanchnicCirculation_DeoxygenatedBloodVolume.u;
      connect(busConnector, liver.busConnector) annotation (Line(
          points={{66,-46},{66,54.04},{-50.6,54.04}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None));
    connect(pressureMeasure.pressure, busConnector.SplanchnicVeins_Pressure)
      annotation (Line(
        points={{22,-36},{44,-36},{44,-46},{66,-46}},
        color={0,0,127},
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    connect(GITract.tissueConnector, busConnector.GITract) annotation (
        Line(
        points={{46,9.6},{66,9.6},{66,-46}},
        color={127,0,0},
        thickness=0.5,
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    connect(portalVein.q_in[1], liver.portalVein) annotation (Line(
        points={{-5.605,-0.41},{-41.36,-0.41},{-41.36,40.24}},
        color={127,0,0},
        thickness=0.5));
      connect(portalVein.q_in[2], GITract.port_b) annotation (Line(
          points={{-5.605,0.5},{18,0.5},{18,0},{34,0}},
          color={127,0,0},
          thickness=0.5));
    connect(portalVein.q_in[3],pressureMeasure.port)  annotation (Line(
        points={{-5.605,1.41},{10,1.41},{10,-42},{16,-42}},
        color={127,0,0},
        thickness=0.5));
      connect(SplanchnicCirculation_DeoxygenatedBloodVolume.y, busConnector.SplanchnicCirculation_DeoxygenatedBloodVolume)
        annotation (Line(points={{13,-68},{66,-68},{66,-46}}, color={0,0,127}),
          Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(port_a[1], liver.port_a) annotation (Line(
          points={{100,-2.5},{82,-2.5},{82,46},{-24.8,46}},
          color={127,0,0},
          thickness=0.5));
      connect(port_a[2], GITract.port_a) annotation (Line(
          points={{100,2.5},{80,2.5},{80,0},{58,0}},
          color={127,0,0},
          thickness=0.5));
      connect(liver.port_b, port_b) annotation (Line(
          points={{-62.96,46},{-86,46},{-86,0},{-100,0}},
          color={127,0,0},
          thickness=0.5));
      connect(GITract.Ganglia, busConnector.GangliaGeneral_NA) annotation (Line(
            points={{47.2,6},{47.2,-46},{66,-46}}, color={0,0,127}));
      annotation (       Icon(coordinateSystem(
              preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
            graphics={
            Text(
              extent={{-104,-76},{110,-98}},
              lineColor={0,0,255},
              textString="%name")}),
      Documentation(revisions="<html>

<table>
<tr>
<td>Author:</td>
<td>Marek Matejak</td>
</tr>
<tr>
<td>License:</td>
<td><a href=\"http://www.physiomodel.org/license.html\">Physiomodel License 1.0</a> </td>
</tr>
<tr>
<td>By:</td>
<td>Charles University, Prague</td>
</tr>
<tr>
<td>Date of:</td>
<td>january 2009</td>
</tr>
<tr>
<td>References:</td>
<td>Tom Coleman: QHP 2008 beta 3, University of Mississippi Medical Center</td>
</tr>
</table>
<br/><p>Copyright &copy; 2014 Marek Matejak, Charles University in Prague.</p><br/>

</html>",
        info="<html>
<p>Blood volume (and pressures) distribution between </p>
<p><ul>
<li>pulmonary arteries, </li>
<li>pulmonary veins and </li>
<li>pulmonary capilaries.</li>
</ul></p>
<p>Blood flow through ventilated alveoli.</p>
</html>"));
    end Splanchnic;

    model SystemicCirculationFullDynamic
      extends Physiolibrary.Icons.SystemicCirculation;

      replaceable package Blood = Physiolibrary.Media.Blood                   constrainedby
        Physiolibrary.Media.Interfaces.PartialMedium                                                                                     annotation ( choicesAllMatching = true);

    Physiolibrary.Fluid.Interfaces.FluidPort_a port_a(redeclare package Medium =
            Blood) "Blood inflow" annotation (Placement(transformation(extent={
                {98,-10},{118,10}}, rotation=0), iconTransformation(extent={{90,
                -10},{110,10}})));
    Physiolibrary.Fluid.Interfaces.FluidPort_b port_b(redeclare package Medium =
            Blood) "Blood outflow" annotation (Placement(transformation(extent=
                {{-104,4},{-84,24}}, rotation=0), iconTransformation(extent={{-110,
                -10},{-90,10}})));

      /*
  Library.PressureFlow.NegativePressureFlow fromSystemicVeins annotation (
      Placement(transformation(extent={{-110,-10},{-90,10}}),iconTransformation(
          extent={{-112,44},{-92,64}})));
  Library.PressureFlow.PositivePressureFlow systemicArteries
    annotation (Placement(transformation(extent={{88,-10},{108,10}}),
        iconTransformation(extent={{90,46},{110,66}})));
*/

    Physiolibrary.Fluid.Components.ElasticVessel systemicArtys(redeclare package
                  Medium =                                                                Blood,
      stateName="SystemicArtys.Vol",
      useV0Input=true,
      useComplianceInput=false,
      volume_start=0.00100036,
      Compliance=1.1625954425608e-08,
      useExternalPressureInput=false,
      ExternalPressure=0,
        nPorts=14)
      annotation (Placement(transformation(extent={{65,-10},{86,11}})));
    Physiolibrary.Types.Constants.VolumeConst               V0_artys(k=0.00085)
      annotation (Placement(transformation(extent={{98,18},{88,28}})));
    Physiolibrary.Types.Constants.HydraulicComplianceConst
      SystemicVeinsCompliance(k=6.645545561992547e-007)
      annotation (Placement(transformation(extent={{-27,10},{-35,18}})));
      Physiolibrary.Organs.Systems.Peripheral peripheral(redeclare package
          Blood = Blood)
        annotation (Placement(transformation(extent={{-2,0},{26,28}})));
    Fluid.Sources.VolumeInflowSource              volumeCorrections(redeclare package
                  Medium =                                                                     Blood,
        useSolutionFlowInput=true)
      annotation (Placement(transformation(extent={{-28,24},{-42,38}})));
      Physiolibrary.Organs.Components.SystemicVeinsElacticBloodCompartment
        systemicVeinsElacticBloodCompartment(
        redeclare package Medium = Blood,
        massFractions_start=Blood.VenousDefault,
          nPorts=10)
        annotation (Placement(transformation(extent={{-56,-10},{-36,10}})));
    Physiolibrary.Types.Constants.PressureConst SystemicVeinsExternalPressure(
        k=0)
      annotation (Placement(transformation(extent={{-36,16},{-43,23}})));
    Physiolibrary.Types.BusConnector busConnector
      "signals of organ bood flow resistence" annotation (Placement(
          transformation(extent={{36,40},{56,60}}), iconTransformation(extent=
             {{-110,32},{-94,48}})));
      Physiolibrary.Organs.Components.CollapsingVeins collapsedVeins(redeclare package
                  Medium = Blood)                                                                     annotation (
          Placement(transformation(
            extent={{-10,10.5},{10,-10.5}},
            rotation=180,
            origin={-84.5,0})));
    Physiolibrary.Fluid.Components.HydrostaticColumn
      gravityHydrostaticDifference(redeclare package Medium = Blood,     useHeightInput=true)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          origin={61,35})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasure(redeclare package
                  Medium = Blood)
      annotation (Placement(transformation(
          extent={{8.5,-8.5},{-8.5,8.5}},
          origin={78.5,45.5})));
      Modelica.Blocks.Math.Gain G(k=9.81) annotation (Placement(transformation(
            extent={{4,-4},{-4,4}},
            rotation=90,
            origin={34,26})));
      Physiolibrary.Organs.Systems.Splanchnic splanchnicCirculation(redeclare package
                  Blood = Blood)
        annotation (Placement(transformation(extent={{-2,-42},{36,-4}})));
        Physiolibrary.Fluid.Components.Conductor legsArtys(redeclare package
          Medium =                                                                    Blood, Conductance=
          5.0004105056377e-09)
      annotation (Placement(transformation(extent={{80,-86},{64,-70}})));
    Physiolibrary.Types.Constants.PressureConst const8(k=0)
      annotation (Placement(transformation(extent={{93,-68},{86,-61}})));
    Physiolibrary.Fluid.Components.HydrostaticColumn
      hydrostaticDifference(redeclare package Medium = Blood,                   useHeightInput=true)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          origin={50,-62})));
      Physiolibrary.Organs.Components.SequesteredBlood sequesteredBlood(redeclare package
                  Blood =                                                                         Blood,
        data={{0,0,10^(-10)},{50,97,1.0},{200,150,0.5}},
        pressureControledCompartment(stateName="BVSeqArtys.Vol"),
        initialVol=5.00044e-05)
        annotation (Placement(transformation(extent={{80,-88},{100,-68}})));
      Physiolibrary.Organs.Components.SequesteredBlood sequesteredBlood1(redeclare package
                  Blood =                                                                          Blood,
        data={{0,-100,2.00},{150,11,0.11},{600,50,0.15}},
        pressureControledCompartment(stateName="BVSeqVeins.Vol"),
        initialVol=0.000120691)
        annotation (Placement(transformation(extent={{-62,-82},{-44,-64}})));
        Physiolibrary.Fluid.Components.Conductor legsVeins(redeclare package
          Medium =                                                                    Blood, Conductance=
          1.2501026264094e-08)
      annotation (Placement(transformation(extent={{-42,-80},{-28,-66}})));
    Physiolibrary.Fluid.Components.HydrostaticColumn
      hydrostaticDifference1(redeclare package Medium = Blood,
      useHeightInput=true,
      usePumpEffect=true)
      annotation (Placement(transformation(extent={{-5,-78},{-25,-58}})));
    Physiolibrary.Types.Constants.PressureConst             const12(k=0)
      annotation (Placement(transformation(extent={{-52,-60},{-59,-53}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasure1(redeclare package
                  Medium =                                                                  Blood)
      annotation (Placement(transformation(extent={{76,-38},{96,-18}})));
    equation
    connect(systemicArtys.zeroPressureVolume, V0_artys.y) annotation (Line(
        points={{68.15,9.95},{68.15,23},{86.75,23}},
        color={0,0,127},
        smooth=Smooth.None));
      connect(busConnector, peripheral.busConnector)          annotation (
          Line(
          points={{46,50},{46,23.38},{4.3,23.38}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None));
      connect(SystemicVeinsCompliance.y, systemicVeinsElacticBloodCompartment.Compliance)
        annotation (Line(
          points={{-36,14},{-38.2,14},{-38.2,10},{-40,10}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(busConnector,systemicVeinsElacticBloodCompartment. busConnector)
        annotation (Line(
          points={{46,50},{-26,50},{-26,6.1},{-36.2,6.1}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None));
      connect(systemicVeinsElacticBloodCompartment.ExternalPressure,
        SystemicVeinsExternalPressure.y)
        annotation (Line(
          points={{-46,10},{-46,19.5},{-43.875,19.5}},
          color={0,0,127},
          smooth=Smooth.None));
    connect(busConnector.BloodVolume_change, volumeCorrections.solutionFlow)
      annotation (Line(
        points={{46,50},{-35,50},{-35,35.9}},
        color={0,0,255},
        thickness=0.5,
        smooth=Smooth.None));
      connect(collapsedVeins.ExternalPressure, busConnector.Thorax_AvePressure)
        annotation (Line(
          points={{-90.5,2.1},{-80,2.1},{-80,50},{46,50}},
          color={0,0,127},
          smooth=Smooth.None));
    connect(pressureMeasure.pressure, busConnector.CarotidSinus_Pressure)
      annotation (Line(
        points={{73.4,42.1},{46,42.1},{46,50}},
        color={0,0,127},
        smooth=Smooth.None));
      connect(gravityHydrostaticDifference.height, busConnector.CarotidSinusHeight)
        annotation (Line(
          points={{50,35},{46,35},{46,50}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(gravityHydrostaticDifference.q_up,pressureMeasure.port)
        annotation (Line(
          points={{71,39},{80,39},{80,37},{78.5,37}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
    connect(pressureMeasure.pressure, busConnector.CarotidSinusArteryPressure)
      annotation (Line(
        points={{73.4,42.1},{46,42.1},{46,50}},
        color={0,0,127},
        smooth=Smooth.None));
      connect(systemicVeinsElacticBloodCompartment.Pressure, busConnector.SystemicVeins_Pressure)
        annotation (Line(
          points={{-56,-4},{-56,-28},{46,-28},{46,50}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      connect(systemicVeinsElacticBloodCompartment.V0, busConnector.SystemicVeins_V0)
        annotation (Line(
          points={{-52.8,10},{-52.8,50},{46,50}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(V0_artys.y, busConnector.SystemicArtys_V0) annotation (Line(
          points={{86.75,23},{70,23},{70,22},{46,22},{46,50}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(collapsedVeins.q_out, port_b) annotation (Line(
          points={{-94.5,-1.22465e-15},{-96.25,-1.22465e-15},{-96.25,14},{-94,
              14}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(busConnector.Gravity_Gz, G.u) annotation (Line(
          points={{46,50},{46,38},{34,38},{34,30.8}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}}));

      connect(splanchnicCirculation.busConnector, busConnector) annotation (
          Line(
          points={{-2,-13.5},{-2,50},{46,50}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None));

      connect(legsArtys.q_in,sequesteredBlood. referencePoint) annotation (Line(
          points={{80,-78},{90,-78}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(sequesteredBlood.ExternalPressure,const8. y) annotation (Line(
          points={{81,-68},{81,-64.5},{85.125,-64.5}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(legsArtys.q_out,hydrostaticDifference. q_down) annotation (Line(
          points={{64,-78},{58,-78},{58,-70},{62,-70},{62,-66},{64,-66},{64,-66.2},{
              59.8,-66.2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(sequesteredBlood1.ExternalPressure,const12. y) annotation (Line(
          points={{-61.1,-64},{-61.1,-56.5},{-59.875,-56.5}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(sequesteredBlood1.referencePoint,legsVeins. q_in) annotation (
          Line(
          points={{-53,-73},{-42,-73}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(legsVeins.q_out,hydrostaticDifference1. q_down) annotation (
          Line(
          points={{-28,-73},{-28,-72.2},{-24.8,-72.2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(hydrostaticDifference1.height, busConnector.LowerTorsoVeinHeight)
        annotation (Line(
          points={{-4,-68},{46,-68},{46,50}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      connect(hydrostaticDifference1.pumpEffect, busConnector.Exercise_MusclePump_Effect)
        annotation (Line(
          points={{-15,-58},{46,-58},{46,50}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      connect(hydrostaticDifference.height, busConnector.LowerTorsoArtyHeight)
        annotation (Line(
          points={{39,-62},{32,-62},{32,-46},{36,-46},{36,-30},{46,-30},{46,50}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(sequesteredBlood1.Vol, busConnector.LegVeins_DeoxygenatedBloodVolume)
        annotation (Line(
          points={{-62,-69.4},{-58,-69.4},{-58,-90},{46,-90},{46,50}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(sequesteredBlood.Vol, busConnector.LegArtys_OxygenatedBloodVolume)
        annotation (Line(
          points={{80,-74},{80,-90},{46,-90},{46,50}},
          color={0,0,127},
          smooth=Smooth.None));

    connect(systemicArtys.fluidVolume, busConnector.SystemicArtys_OxygenatedBloodVolume)
      annotation (Line(
        points={{86,-7.9},{72,-7.9},{72,-28},{46,-28},{46,50}},
        color={0,0,127},
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    connect(systemicVeinsElacticBloodCompartment.Vol, busConnector.SystemicVeins_DeoxygenatedBloodVolume)
      annotation (Line(
        points={{-50,-10},{-50,-28},{46,-28},{46,50}},
        color={0,0,127},
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    connect(pressureMeasure1.pressure, busConnector.SystemicArtys_Pressure)
      annotation (Line(
        points={{92,-32},{98,-32},{98,-42},{46,-42},{46,50}},
        color={0,0,127},
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
      connect(systemicArtys.q_in[1], gravityHydrostaticDifference.q_down)
        annotation (Line(
          points={{75.395,-0.7675},{52,-0.7675},{52,14},{102,14},{102,30.8},{
              70.8,30.8}},
          color={127,0,0},
          thickness=0.5));

      connect(hydrostaticDifference.q_up, systemicArtys.q_in[2]) annotation (Line(
          points={{60,-58},{64,-58},{64,-14},{60,-14},{60,-0.5725},{75.395,
              -0.5725}},
          color={127,0,0},
          thickness=0.5));
      connect(pressureMeasure1.port, systemicArtys.q_in[3]) annotation (Line(
          points={{86,-38},{86,-44},{64,-44},{64,-14},{60,-14},{60,-0.3775},{
              75.395,-0.3775}},
          color={127,0,0},
          thickness=0.5));

      connect(port_a, systemicArtys.q_in[4]) annotation (Line(
          points={{108,0},{108,14},{54,14},{54,-0.1825},{75.395,-0.1825}},
          color={127,0,0},
          thickness=0.5));
      connect(port_a, port_a) annotation (Line(
          points={{108,0},{108,0}},
          color={127,0,0},
          thickness=0.5));

      connect(peripheral.port_a, systemicArtys.q_in[5:12]) annotation (Line(
          points={{34.4,14},{52,14},{52,1.3775},{75.395,1.3775}},
          color={127,0,0},
          thickness=0.5));
      connect(splanchnicCirculation.port_a, systemicArtys.q_in[13:14])
        annotation (Line(
          points={{36,-23},{50,-23},{50,1.7675},{75.395,1.7675}},
          color={127,0,0},
          thickness=0.5));
      connect(systemicVeinsElacticBloodCompartment.port_b, collapsedVeins.q_in)
        annotation (Line(
          points={{-56,0},{-64.25,0},{-64.25,-1.66533e-15},{-74.5,-1.66533e-15}},
          color={127,0,0},
          thickness=0.5));

      connect(collapsedVeins.q_in, splanchnicCirculation.port_b) annotation (
          Line(
          points={{-74.5,-1.55431e-15},{-68,-1.55431e-15},{-68,-23},{-2,-23}},
          color={127,0,0},
          thickness=0.5));
      connect(systemicVeinsElacticBloodCompartment.port_a[1], volumeCorrections.q_out)
        annotation (Line(
          points={{-36,-0.45},{-18,-0.45},{-18,40},{-48,40},{-48,31},{-42,31}},
          color={127,0,0},
          thickness=0.5));

      connect(systemicVeinsElacticBloodCompartment.port_a[2],
        hydrostaticDifference1.q_up) annotation (Line(
          points={{-36,-0.35},{-25,-0.35},{-25,-64}},
          color={127,0,0},
          thickness=0.5));
      connect(systemicVeinsElacticBloodCompartment.port_a[3:10], peripheral.port_b)
        annotation (Line(
          points={{-36,0.45},{-18,0.45},{-18,14},{-10.12,14}},
          color={127,0,0},
          thickness=0.5));
      connect(peripheral.Sympathicus, busConnector.GangliaGeneral_NA)
        annotation (Line(points={{13.4,21},{13.4,50},{46,50}}, color={0,0,127}));
     annotation (Diagram(coordinateSystem(preserveAspectRatio=false,extent={{-100,
              -100},{100,100}}),   graphics={Text(
              extent={{42,46},{74,46}},
              lineColor={0,0,255},
              textString="Carotid Artery Pressure")}),
                                     Icon(coordinateSystem(
              preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
            graphics={
            Text(
              extent={{-104,-54},{110,-76}},
              lineColor={0,0,255},
              textString="%name")}),
      Documentation(revisions="<html>

<table>
<tr>
<td>Author:</td>
<td>Marek Matejak</td>
</tr>
<tr>
<td>License:</td>
<td><a href=\"http://www.physiomodel.org/license.html\">Physiomodel License 1.0</a> </td>
</tr>
<tr>
<td>By:</td>
<td>Charles University, Prague</td>
</tr>
<tr>
<td>Date of:</td>
<td>january 2009</td>
</tr>
<tr>
<td>References:</td>
<td>Tom Coleman: QHP 2008 beta 3, University of Mississippi Medical Center</td>
</tr>
</table>
<br/><p>Copyright &copy; 2014 Marek Matejak, Charles University in Prague.</p><br/>

</html>",
        info="<html>
<p>Blood volume (and pressure) distributions between </p>
<p><ul>
<li>systemic arteries, </li>
<li>systemic veins and</li>
<li>portal (splanchnic) vein.</li>
</ul></p>
<p>Blood flow throught: </p>
<p><ul>
<li>GIT, hepatic artery, liver</li>
<li>Kidney</li>
<li>CNS</li>
<li>Skeletal muscle</li>
<li>Respiratory muscle</li>
<li>Skin</li>
<li>Bones</li>
<li>Adipose tissue</li>
<li>Other tissue</li>
</ul></p>
</html>"));
    end SystemicCirculationFullDynamic;

    model CardioVascularSystem
      extends Physiolibrary.Icons.CardioVascular;
      //  extends Physiomodel.Library.Utilities.DynamicState(stateName="BloodVol.Vol", initType=Library.Utilities.Init.NoInit);

      replaceable package Blood = Physiolibrary.Media.Blood                   constrainedby
        Physiolibrary.Media.Interfaces.PartialMedium                                                                                     annotation ( choicesAllMatching = true);

      Heart.Heart heart(redeclare package Blood = Blood)
        annotation (Placement(transformation(extent={{-2,-6},{24,20}})));
      Physiolibrary.Organs.Lungs.Components.PulmonaryCirculation pulmonary(
          redeclare package Blood = Blood)
        annotation (Placement(transformation(extent={{2,50},{30,78}})));
      Systemic systemic(redeclare package Blood = Blood)
        annotation (Placement(transformation(extent={{-2,-68},{32,-34}})));
    Physiolibrary.Types.BusConnector busConnector
      "signals of organ bood flow resistence" annotation (Placement(
          transformation(extent={{-38,-10},{-16,12}}),iconTransformation(extent=
             {{-100,60},{-60,100}})));
      Physiolibrary.Organs.Blood.RedCells redCells
        annotation (Placement(transformation(extent={{-34,24},{-54,44}})));

    /*initial equation
  if STEADY then
     bloodProperties.feedback.y = 0;
  end if;
*/

      Physiolibrary.Organs.Blood.BloodPropertiesBase bloodProperties
        annotation (Placement(transformation(extent={{-36,-50},{-56,-30}})));
    equation
      connect(busConnector, pulmonary.busConnector) annotation (Line(
          points={{-27,1},{-26,1},{-26,71},{2,71}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None));
      connect(busConnector, systemic.busConnector) annotation (Line(
          points={{-27,1},{-26,1},{-26,-44.2},{-2.34,-44.2}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None));
      connect(busConnector, redCells.busConnector)    annotation (Line(
          points={{-27,1},{-26,1},{-26,40.8},{-36.2,40.8}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None));
      connect(heart.leftVentricle, systemic.port_a) annotation (Line(
          points={{21.4,-0.8},{21.4,0},{32,0},{32,-51}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(systemic.port_b, heart.rightAtrium) annotation (Line(
          points={{-2,-51},{-4,-51},{-4,14.8},{0.6,14.8}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pulmonary.q_in, heart.rightVentricle) annotation (Line(
          points={{2,64},{-8,64},{-8,0},{0.6,0},{0.6,-0.8}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pulmonary.q_out, heart.leftAtrium) annotation (Line(
          points={{30,64},{36,64},{36,16},{20,16},{20,14.54},{21.14,14.54}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));

    //  stateValue = bloodProperties.BloodVolume1.y;

      connect(bloodProperties.busConnector, busConnector) annotation (Line(
          points={{-36.6,-33.2},{-36.6,-32},{-27,-32},{-27,1}},
          color={0,0,255},
          thickness=0.5));
      connect(heart.Pericardium, busConnector.Pericardium_Pressure) annotation (
         Line(points={{16.2,20},{16.2,24},{-27,24},{-27,1}}, color={0,0,127}));
      connect(heart.Sympathicus, busConnector.GangliaGeneral_NA) annotation (
          Line(points={{9.96,9.6},{9.96,10},{-26,10},{-26,6},{-27,6},{-27,1}},
            color={0,0,127}));
      connect(heart.Parasympathicus, busConnector.VagusNerve_NA_Hz) annotation (
         Line(points={{2.94,4.4},{2.94,4},{-28,4},{-28,1},{-27,1}}, color={0,0,
              127}));
      annotation ( Documentation(info="<html>
<p><h4><font color=\"#008000\">Cardiovascular system</font></h4></p>
<p><font style=\"color: #008000; \">Connect heart with pulmonary and systemic part. This connection contains pressures and blood flows before and after heart.</font></p>
<p><font style=\"color: #008000; \">Output signal variables about blood volume between lungs capilaries and systemic tissue capilaries are used in gass transport submodels like O2 or CO2.</font></p>
<p><font style=\"color: #008000; \">Output signal Vesseles_V0 is used for systemic veins collapsing in massive blood lost.</font></p>
<p><font style=\"color: #008000; \">The blood properties convert known variables values to another meanings (haematocrit, viscosity, ..).</font></p>
<p><font style=\"color: #008000; \">Red cells contains volume, loss and gains all red blood cells.</font></p>
</html>", revisions="<html>

<table>
<tr>
<td>Author:</td>
<td>Marek Matejak</td>
</tr>
<tr>
<td>License:</td>
<td><a href=\"http://www.physiomodel.org/license.html\">Physiomodel License 1.0</a> </td>
</tr>
<tr>
<td>By:</td>
<td>Charles University, Prague</td>
</tr>
<tr>
<td>Date of:</td>
<td>2009</td>
</tr>
<tr>
<td>References:</td>
<td>Tom Coleman: QHP 2008 beta 3, University of Mississippi Medical Center</td>
</tr>
</table>
<br/><p>Copyright &copy; 2014 Marek Matejak, Charles University in Prague.</p><br/>

</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true,  extent={{-100,-100},{
                100,100}}), graphics={Text(
              extent={{-116,-96},{126,-130}},
              lineColor={0,0,255},
              textString="%name")}));
    end CardioVascularSystem;

  end Systems;

  package Components
    model Tissue
      extends Physiolibrary.Icons.Microcirculation;

      replaceable package Blood = Physiolibrary.Media.Blood                   constrainedby
        Physiolibrary.Media.Interfaces.PartialMedium                                                                                     annotation ( choicesAllMatching = true);

      parameter Physiolibrary.Types.HydraulicConductance Cond;

      parameter Boolean onViscosity=true, onAnesthesia=true, onAngiogenesis=true, onAngiotensinII=true, onVasopressin=true, onCatecholamines=true, onOxygenOnly=true, onOxygenAndCarbonDioxide=false, onOxygenNeed=false, onExercise=false;

      parameter Real[:,3] VasculatureConductanceOnPO2 = {{41,1.2,0},{51,1.0,-0.03},{61,0.8,0}};
      parameter Real[:,3] PO2OnConductance = {{10,2.0,0},{30,1.0,0}};
      parameter Real[:,3] Angiotensin2Effect = {{0.0,1.05,0},{1.3,1.00,-0.08},{3.5,0.50,0}};
      parameter Real[:,3] AlphaReceptorsEffect = {{0.0,1.3,0},{1.0,1.0,-0.3},{5.0,0.1,0}};
      parameter Real[:,3] VasopressinEffect = {{0.8,1.0,0},{3.0,0.1,0}};
      parameter Physiolibrary.Types.Time VasculatureHalfTime=30*86400*Modelica.Math.log(2);

      parameter Boolean FunctionFailed=false "Function failed";

    Physiolibrary.Blocks.Factors.Spline A2Effect(
        Xscale=1e-9,
      UsePositiveLog10=true,
        data=Angiotensin2Effect,
        enabled=onAngiotensinII)
      annotation (Placement(transformation(extent={{-8,40},{12,60}})));
    //  Xscale=1e-9/1.046,
    Physiolibrary.Blocks.Factors.Spline ADHEffect(
        Xscale=1e-9,
      UsePositiveLog10=true,
        data=VasopressinEffect,
        enabled=onVasopressin) "0.8 pg/ml = 0.8e-9 kg/m3"
      annotation (Placement(transformation(extent={{-8,30},{12,50}})));
    //  Xscale=1e-9/1.084,
    Physiolibrary.Types.Constants.HydraulicConductanceConst BasicConductance(k=2*Cond)
      annotation (Placement(transformation(extent={{-18,76},{-6,88}})));
    Physiolibrary.Blocks.Factors.Normalization Anesthesia(enabled=onAnesthesia)
      annotation (Placement(transformation(extent={{-8,50},{12,70}})));
    Components.ViscosityConductance            Viscosity(redeclare package
          Blood = Blood)
      annotation (Placement(transformation(extent={{12,58},{-8,78}})));
      Physiolibrary.Blocks.Factors.SplineLagOrZero              Vasculature(
        FunctionFailed=FunctionFailed,
      Xscale=101325/760,
        data=VasculatureConductanceOnPO2,
        HalfTime=VasculatureHalfTime,
        enabled=onAngiogenesis)
        annotation (Placement(transformation(extent={{-8,-18},{12,2}})));
    //    stateName="GITract-Vasculature.Effect",
      Components.AlphaReceptors AplhaReceptors(
        redeclare package Blood = Blood,
        data=AlphaReceptorsEffect,
        Switch=not onCatecholamines,
        Setting=1)
        annotation (Placement(transformation(extent={{-8,16},{12,36}})));
    Physiolibrary.Fluid.Components.Conductor arterioles(redeclare package
          Medium =
            Blood, useConductanceInput=true)
        annotation (Placement(transformation(extent={{12,-102},{-8,-82}})));
    Physiolibrary.Blocks.Factors.Spline pO2OnConductance(
                   Xscale=101325/760, data=PO2OnConductance,
      enabled=onOxygenOnly)
      annotation (Placement(transformation(extent={{-8,-28},{12,-8}})));

    Physiolibrary.Types.TissueBusConnector tissueConnector annotation (
        Placement(transformation(extent={{-94,0},{-74,20}}),
          iconTransformation(extent={{-20,60},{20,100}})));
    Physiolibrary.Blocks.Factors.Spline TensionEffect(data={{0.0,2.2,0},{1.0,
          1.0,-0.5},{2.0,0.6,0}}, enabled=onOxygenAndCarbonDioxide)
      annotation (Placement(transformation(extent={{-8,-72},{12,-52}})));
    Physiolibrary.Blocks.Factors.Spline PO2OnTension(data={{22,0.0,0},{36,1.0,
          0.02},{60,1.2,0}}, Xscale=101325/760,
      enabled=onOxygenAndCarbonDioxide)
      annotation (Placement(transformation(extent={{-28,-48},{-8,-28}})));
    Physiolibrary.Blocks.Factors.Spline PCO2OnTension(
                                  Xscale=101325/760,
      enabled=onOxygenAndCarbonDioxide,
      data={{20,1.8,0},{55,1.0,-0.05},{75,0.0,0}})
      "FIX: normal venous pCO2 in brain to 55mmHg (because of RQ close to 1)"
      annotation (Placement(transformation(extent={{-28,-56},{-8,-36}})));
      Physiolibrary.Types.Constants.OneConst one
        annotation (Placement(transformation(extent={{-30,-30},{-22,-22}})));
      Components.MetabolicVasodilation metabolicVasolidation(
        data={{50,1.0,0},{1000,3.5,0.003},{3000,5.5,0}},
        Xscale=1/1362657.193569,
        OnTau(displayUnit="min") = 12,
        OffTau(displayUnit="min") = 60,
        enabled=onOxygenNeed)
        annotation (Placement(transformation(extent={{-8,-82},{12,-62}})));
    //  stateName="SkeletalMuscle-MetabolicVasodilation.Effect",
    Physiolibrary.Blocks.Factors.Normalization MusclePumping_SkeletalMuscle(enabled=
            onExercise)
      annotation (Placement(transformation(extent={{12,-2},{-8,18}})));
    Physiolibrary.Blocks.Math.Add add(k=1)
      annotation (Placement(transformation(extent={{4,-4},{-4,4}},
            rotation=90,
            origin={32,18})));
    Physiolibrary.Blocks.Factors.Spline RateEffect(data={{0,0.0,0.04},{60,1.0,
          0.0}}, Xscale=1/60,
        enabled=onExercise)
      annotation (Placement(transformation(extent={{42,20},{22,40}})));
    Physiolibrary.Blocks.Factors.Spline IntensityEffect(data={{0,0.0,0.007},{
          300,1.0,0.0}}, enabled=onExercise)
      annotation (Placement(transformation(extent={{42,30},{22,50}})));
      Physiolibrary.Types.Constants.OneConst one1
        annotation (Placement(transformation(extent={{18,50},{26,58}})));
    Physiolibrary.Fluid.Interfaces.FluidPort_a port_a(redeclare package Medium =
            Blood) "Blood inflow" annotation (Placement(transformation(extent={{90,-100},
                {110,-80}}, rotation=0), iconTransformation(extent={{90,-10},{110,10}})));
    Physiolibrary.Fluid.Sensors.VolumeFlowMeasure
                                            volumeFlowMeasure(redeclare package
          Medium = Blood)                               annotation (
        Placement(transformation(
          extent={{10,-10},{-10,10}},
          origin={58,-90})));
    Physiolibrary.Fluid.Interfaces.FluidPort_b port_b(redeclare package Medium =
            Blood) "Blood outflow" annotation (Placement(transformation(extent={{-116,
                -100},{-96,-80}}, rotation=0), iconTransformation(extent={{-110,-10},
                {-90,10}})));
      Physiolibrary.Types.RealIO.VolumeFlowRateOutput
                                            BloodFlow
                                               annotation (Placement(transformation(
              extent={{78,-68},{90,-56}}), iconTransformation(extent={{60,-60},{80,
                -40}})));
    Physiolibrary.Types.BusConnector busConnector
      "signals of organ bood flow resistence" annotation (Placement(
          transformation(extent={{-100,80},{-80,100}}), iconTransformation(
            extent={{60,40},{100,80}})));
      Fluid.Sensors.Concentration            vasopressin(redeclare function
          GetConcentration = Physiolibrary.Media.Blood.vasopressin,
                                                         redeclare package
          Medium =
            Blood)
        annotation (Placement(transformation(extent={{-44,32},{-24,52}})));
      Fluid.Sensors.Fraction                 anesthesiaVascularConductance(
          redeclare function GetFraction =
            Physiolibrary.Media.Blood.anesthesiaVascularConductance,
          redeclare package Medium = Blood)
        annotation (Placement(transformation(extent={{-94,50},{-74,70}})));
      Types.RealIO.FrequencyInput Ganglia
        "Sympathetic ganglia general neural activity" annotation (Placement(
            transformation(extent={{-40,8},{-20,28}}),
                                                     iconTransformation(
              extent={{0,40},{20,60}})));
      Fluid.Sensors.PartialPressure pO2(
        redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
        substanceData=Chemical.Substances.Oxygen_gas(),
        redeclare package Medium = Blood)
        annotation (Placement(transformation(extent={{-64,-20},{-84,0}})));
      Fluid.Components.ElasticVessel elasticVessel(
        redeclare package Medium = Blood,
        massFractions_start=Blood.VenousDefault,
        useSubstances=true,
        volume_start=1e-06,
        Compliance=7.5006157584566e-10,
        nPorts=9)
        annotation (Placement(transformation(extent={{-60,-100},{-40,-80}})));
    Fluid.Components.Conductor venules(
        redeclare package Medium = Blood,
        useConductanceInput=false,
        Conductance=2*Cond)
        annotation (Placement(transformation(extent={{-72,-100},{-92,-80}})));
      Fluid.Sensors.PartialPressure pCO2(
        redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
        substanceData=Chemical.Substances.CarbonDioxide_gas(),
        redeclare package Medium = Blood)
        annotation (Placement(transformation(extent={{-42,-56},{-62,-36}})));
      Fluid.Sensors.MassConcentration        angiotensin2(redeclare function
          GetMassConcentration = Physiolibrary.Media.Blood.angiotensin2,
                                                          redeclare package
          Medium =
            Blood)
        annotation (Placement(transformation(extent={{-78,32},{-58,52}})));

      Physiolibrary.Types.HydraulicConductance cond;
      outer Modelica.Fluid.System system "System wide properties";
    equation
      cond =(-port_b.m_flow/Blood.density_pTX(
        system.p_ambient,
        system.T_ambient,
        Blood.reference_X))/(port_a.p - port_b.p);
      connect(Vasculature.y,pO2OnConductance. yBase) annotation (Line(
          points={{2,-14},{2,-16}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Viscosity.y, Anesthesia.yBase) annotation (Line(
          points={{2,64},{2,62}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(BasicConductance.y, Viscosity.yBase)         annotation (Line(
          points={{-4.5,82},{2,82},{2,70}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(PO2OnTension.y,PCO2OnTension. yBase) annotation (Line(
          points={{-18,-42},{-18,-44}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(TensionEffect.u,PCO2OnTension. y) annotation (Line(
          points={{-6,-62},{-18,-62},{-18,-50}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(one.y, PO2OnTension.yBase) annotation (Line(
          points={{-21,-26},{-18,-26},{-18,-36}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(MusclePumping_SkeletalMuscle.u,add. y) annotation (Line(
          points={{10,8},{32,8},{32,13.6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add.u,RateEffect. y) annotation (Line(
          points={{32,22.8},{32,26}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(RateEffect.u, busConnector.Exercise_Metabolism_ContractionRate)
        annotation (Line(
          points={{40,30},{98,30},{98,90},{-90,90}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      connect(TensionEffect.y, metabolicVasolidation.yBase) annotation (Line(
          points={{2,-66},{2,-70}},
          color={0,0,127},
          smooth=Smooth.None));
    connect(tissueConnector.O2Need, metabolicVasolidation.O2Need) annotation (
       Line(
        points={{-84,10},{-60,10},{-60,-72},{-7.8,-72}},
        color={127,0,0},
        thickness=0.5,
        smooth=Smooth.None), Text(
        string="%first",
        index=-1,
        extent={{-6,3},{-6,3}}));
      connect(one1.y, IntensityEffect.yBase) annotation (Line(
          points={{27,54},{32,54},{32,42}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(port_a, volumeFlowMeasure.q_in) annotation (Line(
          points={{100,-90},{68,-90}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(A2Effect.y, ADHEffect.yBase) annotation (Line(
          points={{2,46},{2,42}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(AplhaReceptors.yBase, ADHEffect.y) annotation (Line(
          points={{2,33},{2,36}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Anesthesia.y, A2Effect.yBase) annotation (Line(
          points={{2,56},{2,52}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pO2OnConductance.y, TensionEffect.yBase) annotation (Line(
          points={{2,-22},{2,-60}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(arterioles.cond, metabolicVasolidation.y) annotation (Line(
          points={{2,-86},{2,-76}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(AplhaReceptors.y, MusclePumping_SkeletalMuscle.yBase) annotation (
          Line(
          points={{2,19},{2,10}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Vasculature.yBase, MusclePumping_SkeletalMuscle.y) annotation (Line(
          points={{2,-2},{2,4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(IntensityEffect.y, RateEffect.yBase) annotation (Line(
          points={{32,36},{32,32}},
          color={0,0,127},
          smooth=Smooth.None));
    connect(IntensityEffect.u, busConnector.Exercise_Metabolism_MotionWatts)
      annotation (Line(
        points={{40,40},{98,40},{98,90},{-90,90}},
        color={0,0,127},
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    connect(volumeFlowMeasure.volumeFlow, BloodFlow) annotation (Line(points=
            {{58,-78},{58,-62},{84,-62}}, color={0,0,127}));
      connect(port_b, venules.q_out) annotation (Line(
          points={{-106,-90},{-92,-90}},
          color={127,0,0},
          thickness=0.5));
      connect(volumeFlowMeasure.q_out, arterioles.q_in) annotation (Line(
          points={{48,-90},{46,-90},{46,-92},{12,-92}},
          color={127,0,0},
          thickness=0.5));
      connect(pO2.partialPressure, Vasculature.u)
        annotation (Line(points={{-64,-10},{-8,-10}}, color={0,0,127}));
      connect(pO2.partialPressure, PO2OnTension.u) annotation (Line(points={{-64,-10},
              {-32,-10},{-32,-38},{-26,-38}}, color={0,0,127}));
      connect(pO2.partialPressure, pO2OnConductance.u) annotation (Line(points={{-64,
              -10},{-14,-10},{-14,-18},{-6,-18}}, color={0,0,127}));
      connect(pCO2.port_a, elasticVessel.substances.CO2) annotation (Line(
            points={{-62,-46},{-64,-46},{-64,-90},{-60,-90}}, color={158,66,200}));
      connect(pCO2.partialPressure, PCO2OnTension.u)
        annotation (Line(points={{-42,-46},{-26,-46}}, color={0,0,127}));
      connect(AplhaReceptors.GangliaGeneral, Ganglia) annotation (Line(points={{-7.8,
              20},{-16,20},{-16,18},{-30,18}}, color={0,0,127}));
      connect(arterioles.q_out, elasticVessel.q_in[1]) annotation (Line(
          points={{-8,-92},{-50.1,-92},{-50.1,-91.1556}},
          color={127,0,0},
          thickness=0.5));
      connect(venules.q_in, elasticVessel.q_in[2]) annotation (Line(
          points={{-72,-90},{-52,-90},{-52,-90.8667},{-50.1,-90.8667}},
          color={127,0,0},
          thickness=0.5));
      connect(pCO2.port, elasticVessel.q_in[3]) annotation (Line(points={{-52,-56},{-52,-74},{-50,-74},{-50,-90.5778},{-50.1,-90.5778}},
                                                                   color={0,127,255}));
      connect(pO2.port, elasticVessel.q_in[4]) annotation (Line(points={{-74,-20},{-74,-74},{-50,-74},{-50,-90.2889},{-50.1,-90.2889}},
                                                               color={0,127,255}));
      connect(vasopressin.port, elasticVessel.q_in[5]) annotation (Line(points={{-34,32},
              {-34,-62},{-52,-62},{-52,-76},{-50,-76},{-50,-90},{-50.1,-90}},
            color={0,127,255}));
      connect(angiotensin2.port, elasticVessel.q_in[6]) annotation (Line(points={{-68,32},{-68,22},{-36,22},{-36,4},{-34,4},{-34,-62},{-52,-62},{-52,-74},{-50,
              -74},{-50,-89.7111},{-50.1,-89.7111}}, color={0,127,255}));
      connect(anesthesiaVascularConductance.port, elasticVessel.q_in[7])
        annotation (Line(points={{-84,50},{-84,26},{-66,26},{-66,22},{-34,22},{-34,-62},{-50,-62},{-50,-89.4222},{-50.1,-89.4222}},
                                                          color={0,127,255}));
      connect(AplhaReceptors.port_a, elasticVessel.q_in[8]) annotation (Line(points={{-8,24},{-8,-89.1333},{-50.1,-89.1333}},
                                                       color={0,127,255}));
      connect(Viscosity.port, elasticVessel.q_in[9]) annotation (Line(points={{12,68},{16,68},{16,-102},{-22,-102},{-22,-88},{-30,-88},{-30,-88.8444},{-50.1,
              -88.8444}}, color={0,127,255}));
      connect(elasticVessel.substances.O2, pO2.port_a) annotation (Line(
            points={{-60,-90},{-64,-90},{-64,-48},{-90,-48},{-90,-10},{-84,-10}},
            color={158,66,200}));
      connect(anesthesiaVascularConductance.F, Anesthesia.u)
        annotation (Line(points={{-73,60},{-6,60}}, color={0,0,127}));
      connect(angiotensin2.R, A2Effect.u) annotation (Line(points={{-57,42},{
              -50,42},{-50,54},{-14,54},{-14,50},{-6,50}}, color={0,0,127}));
      connect(vasopressin.C, ADHEffect.u)
        annotation (Line(points={{-23,42},{-23,40},{-6,40}}, color={0,0,127}));
      annotation (
        Documentation(info="<HTML>
<PRE>
Blood resistance in gastro interstitial tract.

</PRE>
</HTML>
",   revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> january 2009 </i><br>
       by Marek Matejak in Modelica initially implemented (consulted with Jiri Kofranek), Charles University, Prague<br>
       orginaly described by Tom Coleman in QHP 2008 beta 3, University of Mississippi Medical Center
       </li>
</ul>
</html>"),
         Icon(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics={Text(
              extent={{-120,-106},{80,-86}},
              lineColor={0,0,255},
              textString="%name")}));
    end Tissue;

    model SystemicVeins
      //extends QHP.Blood.OrganFlow.BaseBadDirection;
    extends Physiolibrary.Icons.Resistor;

    replaceable package Blood = Physiolibrary.Media.Blood                   constrainedby
        Physiolibrary.Media.Interfaces.PartialMedium                                                                                   annotation ( choicesAllMatching = true);

    Physiolibrary.Fluid.Interfaces.FluidPort_a q_in(redeclare package Medium = Blood) "Blood inflow"
      annotation ( Placement(transformation(extent={{92,-10},{112,10}},
                               rotation=0),
                                    iconTransformation(extent={{90,-10},{110,
              10}})));
    Physiolibrary.Fluid.Interfaces.FluidPort_b q_out(redeclare package Medium = Blood) "Blood outflow"
      annotation ( Placement(transformation(extent={{-108,-12},{-88,8}},
                               rotation=0),
                                      iconTransformation(extent={{-110,-10},{
              -90,10}})));

    Physiolibrary.Fluid.Components.Conductor     systemicVeinsConductance(redeclare package
                  Medium =                                                                           Blood,
        useConductanceInput=true)
      annotation (Placement(transformation(extent={{0,-12},{-20,8}})));
    ViscosityConductance                       ViscosityEffect(redeclare package
                  Blood = Blood)
      annotation (Placement(transformation(extent={{0,0},{-20,20}})));
    Physiolibrary.Blocks.Factors.Normalization ExerciseEffect
      annotation (Placement(transformation(extent={{-20,7},{0,27}})));
    Physiolibrary.Blocks.Factors.Normalization CollapseEffect
      annotation (Placement(transformation(extent={{-20,14},{0,34}})));
    Physiolibrary.Types.Constants.HydraulicConductanceConst const12(k=
          BaseConductance)
      annotation (Placement(transformation(extent={{-29,45},{-17,57}})));
      parameter Physiolibrary.Types.HydraulicConductance BaseConductance( displayUnit="ml/(mmHg.min)");

    Physiolibrary.Fluid.Sensors.FlowMeasure     flowMeasure(redeclare package
          Medium =                                                                     Blood) annotation (
        Placement(transformation(
          extent={{10,-10},{-10,10}},
          origin={80,0})));
      Modelica.Blocks.Interfaces.RealOutput BloodFlow
                                               annotation (Placement(transformation(
              extent={{88,26},{100,38}}),  iconTransformation(extent={{60,-30},{80,-10}})));
    Physiolibrary.Types.BusConnector busConnector
      "signals of organ bood flow resistence" annotation (Placement(
          transformation(extent={{-96,77},{-76,97}}), iconTransformation(
            extent={{60,10},{78,28}})));
      Modelica.Blocks.Math.Min CollapsedEffect
        annotation (Placement(transformation(extent={{88,76},{96,84}})));
      Modelica.Blocks.Math.Division division
        annotation (Placement(transformation(extent={{76,82},{84,90}})));
    Types.Constants.OneConst               one
      annotation (Placement(transformation(extent={{64,66},{72,74}})));
      Modelica.Blocks.Math.Sum V0(nin=4)
        annotation (Placement(transformation(extent={{8,70},{16,78}})));
      Modelica.Blocks.Math.Add BloodVolume
        annotation (Placement(transformation(extent={{48,90},{56,98}})));
    equation
      connect(systemicVeinsConductance.cond,ViscosityEffect. y) annotation (Line(
          points={{-10,4},{-10,6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(ViscosityEffect.yBase,ExerciseEffect. y) annotation (Line(
          points={{-10,12},{-10,13}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(ExerciseEffect.yBase,CollapseEffect. y) annotation (Line(
          points={{-10,19},{-10,19.5},{-10.2,19.5},{-10.2,20},{-10,20},{-10,20}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(busConnector.Exercise_MusclePump_Effect,
        ExerciseEffect.u) annotation (Line(
          points={{-86,87},{-86,17},{-18,17}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}}));
      connect(const12.y, CollapseEffect.yBase) annotation (Line(
          points={{-15.5,51},{-10,51},{-10,26}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(flowMeasure.q_in, q_in) annotation (Line(
          points={{90,0},{102,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(flowMeasure.q_out, systemicVeinsConductance.q_in) annotation (
          Line(
          points={{70,0},{36,0},{36,-2},{0,-2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(systemicVeinsConductance.q_out, q_out) annotation (Line(
          points={{-20,-2},{-98,-2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(flowMeasure.massFlow, BloodFlow)
        annotation (Line(points={{80,12},{80,32},{94,32}}, color={0,0,127}));
      connect(division.y,CollapsedEffect. u1)
                                  annotation (Line(
          points={{84.4,86},{85.8,86},{85.8,82.4},{87.2,82.4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(BloodVolume.y,division. u1)
                                  annotation (Line(
          points={{56.4,94},{66,94},{66,88.4},{75.2,88.4}},
          color={0,0,127},
          smooth=Smooth.None));
    connect(one.y,CollapsedEffect. u2) annotation (Line(
        points={{73,70},{80,70},{80,77.6},{87.2,77.6}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(V0.y,division. u2) annotation (Line(
        points={{16.4,74},{46,74},{46,83.6},{75.2,83.6}},
        color={0,0,127},
        smooth=Smooth.None));
      connect(busConnector.PulmonaryCirculation_V0,V0. u[1])
        annotation (Line(
          points={{-86,87},{-86,76},{6,76},{6,73.7},{7.2,73.7}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,6},{-6,6}}));
      connect(busConnector.SystemicArtys_V0,V0. u[2])
        annotation (Line(
          points={{-86,87},{-86,70},{6,70},{6,73.9},{7.2,73.9}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,-2},{-6,-2}}));
      connect(busConnector.PortalVein_V0,V0. u[3]) annotation (Line(
          points={{-86,87},{-86,66},{6,66},{6,74.1},{7.2,74.1}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,-6},{-6,-6}}));
      connect(busConnector.SystemicVeins_V0,V0. u[4]) annotation (Line(
          points={{-86,87},{-86,62},{6,62},{6,74.3},{7.2,74.3}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,-10},{-6,-10}}));
      connect(busConnector.RBCVol_Vol,BloodVolume. u1)
                                                annotation (Line(
          points={{-86,87},{-86,96.4},{47.2,96.4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(busConnector.PlasmaVol_Vol,BloodVolume. u2)
                                                  annotation (Line(
          points={{-86,87},{-86,91.6},{47.2,91.6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(CollapsedEffect.y, CollapseEffect.u) annotation (Line(points={{96.4,80},
              {100,80},{100,60},{-72,60},{-72,24},{-18,24}}, color={0,0,127}));
      connect(ViscosityEffect.port, q_in)
        annotation (Line(points={{0,10},{102,10},{102,0}}, color={0,127,255}));
      annotation ( Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Text(
              extent={{-70,-30},{70,30}},
              lineColor={0,0,0},
              textString="%BaseConductance ml/min/mmHg"), Text(
              extent={{-101,-58},{99,-30}},
              lineColor={0,0,255},
              textString="%name")}));
    end SystemicVeins;

    model SystemicVeinsElacticBloodCompartment
     extends Physiolibrary.Icons.ElasticBalloon;
     extends Physiolibrary.Fluid.Interfaces.CompositionSetup(redeclare replaceable package Medium = Physiolibrary.Media.Blood);

     parameter Integer nPorts = 0 "Number of hydraulic ports" annotation (
        Evaluate = true,
        Dialog(connectorSizing = true, group = "Ports"));

      Physiolibrary.Types.RealIO.PressureInput ExternalPressure
      "external pressure around the compartment"                              annotation (
      Placement(transformation(
          origin={0,100},
          extent={{-10,-10},{10,10}},
          rotation=270)));
      Physiolibrary.Types.RealIO.HydraulicComplianceInput Compliance( displayUnit="ml/mmHg")
      "elasticity of the stressed walls"                               annotation (
      Placement(transformation(
          origin={60,100},
          extent={{-10,-10},{10,10}},
          rotation=270)));

      Physiolibrary.Types.RealIO.PressureOutput Pressure( displayUnit="mmHg")
      "blod pressure in compartment"
        annotation (Placement(transformation(extent={{30,-110},{50,-90}}, rotation=-90)));
      Physiolibrary.Types.RealIO.VolumeOutput Vol
      "blood volume in compartment"
        annotation (Placement(transformation(extent={{-50,-110},{-30,-90}}, rotation=-90),
            iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-40,-100})));
    Physiolibrary.Types.BusConnector busConnector annotation (Placement(
          transformation(extent={{-88,72},{-68,92}}), iconTransformation(
            extent={{88,51},{108,71}})));
      Physiolibrary.Fluid.Components.ElasticVessel systemicVeins(
        redeclare package Medium = Medium,
        massFractions_start=massFractions_start,
        extraConcentration_start=extraConcentration_start,
        stateName="SystemicVeins.Vol",
        useComplianceInput=true,
        useExternalPressureInput=true,
        useV0Input=true,
      volume_start=initialSystemisVeinsVol,
        nPorts=4+nPorts)                                           "systemic veins"
        annotation (Placement(transformation(extent={{-14,-10},{6,10}})));
    Physiolibrary.Blocks.Factors.Spline V0_A2_Effect(
      data={{0.0,1.05,0.0},{1.3,1.00,-0.10},{3.0,0.85,0.0}},
        Xscale=1e-9,
      UsePositiveLog10=true)
      annotation (Placement(transformation(extent={{-30,7},{-10,27}})));
    Physiolibrary.Types.Constants.VolumeConst               const4(k=0.0017)
      annotation (Placement(transformation(extent={{-32,52},{-23,43}})));
      AlphaReceptors AplhaReceptors(
        redeclare package Blood = Medium,
        data={{0.0,1.2,0.0},{1.0,1.0,-0.30},{3.0,0.6,0.0}},
        NEURALK=0.333,
        HUMORALK=0.5)
        annotation (Placement(transformation(extent={{-30,24},{-10,44}})));
      Physiolibrary.Types.RealIO.VolumeOutput V0(displayUnit="ml")
      "maximal zero pressure blood volume in compartment"
        annotation (Placement(transformation(extent={{-4.5,-4.5},{4.5,4.5}},rotation=180,
            origin={-27.5,7.5}),
            iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-68,100})));

      parameter Physiolibrary.Types.Volume initialSystemisVeinsVol = 2329.57e-6; // = 2200;// = 2980;

      Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasure(redeclare package
                  Medium = Medium)
        annotation (Placement(transformation(extent={{16,-20},{36,0}})));
      Fluid.Interfaces.FluidPort_a port_a[nPorts](redeclare package Medium = Medium)
        annotation (Placement(transformation(extent={{90,-10},{110,10}}),
            iconTransformation(extent={{90,-10},{110,10}})));
      Fluid.Interfaces.FluidPort_b port_b(redeclare package Medium = Medium)
                                          annotation (Placement(transformation(
              extent={{-110,-10},{-90,10}}),
                                           iconTransformation(extent={{-110,-10},
                {-90,10}})));
      Fluid.Sensors.MassConcentration        Angiotensin2(redeclare function
          GetMassConcentration = Physiolibrary.Media.Blood.angiotensin2,
                                                          redeclare package
          Medium = Medium)
        annotation (Placement(transformation(extent={{-74,4},{-54,24}})));
      SystemicVeins                                 veins(redeclare package
          Blood =
            Medium, BaseConductance(displayUnit="ml/(mmHg.min)") = 1.2000985213531e-07)
        "scaled to coronary vessels reorganisation"
        annotation (Placement(transformation(extent={{-88,-8},{-72,8}})));
    equation
      connect(V0_A2_Effect.y, systemicVeins.zeroPressureVolume) annotation (Line(
          points={{-20,13},{-20,12},{-11,12},{-11,9}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(AplhaReceptors.y,V0_A2_Effect. yBase) annotation (Line(
          points={{-20,27},{-20,19}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(AplhaReceptors.yBase,const4. y) annotation (Line(
          points={{-20,41},{-20,47.5},{-21.875,47.5}},
          color={0,0,127},
          smooth=Smooth.None));
      systemicVeins.volume= Vol;
      connect(systemicVeins.externalPressure, ExternalPressure) annotation (Line(
          points={{3,9},{3,67},{0,67},{0,100}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(systemicVeins.compliance, Compliance) annotation (Line(
          points={{-4,9},{-4,50},{60,50},{60,100}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(V0_A2_Effect.y, V0) annotation (Line(
          points={{-20,13},{-20,7.5},{-27.5,7.5}},
          color={0,0,127},
          smooth=Smooth.None));

    connect(pressureMeasure.pressure, Pressure) annotation (Line(
        points={{32,-14},{-100,-14},{-100,-40}},
        color={0,0,127},
        smooth=Smooth.None));

      connect(pressureMeasure.port, systemicVeins.q_in[1]) annotation (Line(
          points={{26,-20},{10,-20},{10,0},{-4.1,0}},
          color={127,0,0},
          thickness=0.5));
      connect(AplhaReceptors.port_a, systemicVeins.q_in[3]) annotation (Line(
          points={{-30,32},{-44,32},{-44,2},{-2,2},{-2,0},{-4.1,0}},
          color={127,0,0},
          thickness=0.5));
      connect(Angiotensin2.port, systemicVeins.q_in[2]) annotation (Line(points={{-64,4},
              {-6,4},{-6,0},{-4.1,0}},               color={0,127,255}));
      connect(AplhaReceptors.GangliaGeneral, busConnector.GangliaGeneral_NA)
        annotation (Line(points={{-29.8,28},{-78,28},{-78,82}}, color={0,0,127}),
          Text(
          string="%second",
          index=1,
          extent={{-3,6},{-3,6}},
          horizontalAlignment=TextAlignment.Right));
      connect(port_a[1:nPorts], systemicVeins.q_in[5:4+nPorts]) annotation (Line(
          points={{100,0},{40,0},{40,4},{12,4},{12,0},{-4.1,0}},
          color={127,0,0},
          thickness=0.5));
      connect(veins.busConnector, busConnector) annotation (Line(
          points={{-74.48,1.52},{-74.48,82},{-78,82},{-78,80},{-82,80},{-82,82},{-78,
              82}},
          color={0,0,255},
          thickness=0.5));
      connect(veins.q_out, port_b) annotation (Line(
          points={{-88,0},{-100,0}},
          color={127,0,0},
          thickness=0.5));
      connect(veins.q_in, systemicVeins.q_in[4]) annotation (Line(
          points={{-72,0},{-4,0},{-4,0},{-4.1,0}},
          color={127,0,0},
          thickness=0.5));
      connect(Angiotensin2.R, V0_A2_Effect.u) annotation (Line(points={{-53,14},
              {-38,14},{-38,17},{-28,17}}, color={0,0,127}));
     annotation (
        Documentation(info="<HTML>
<PRE>
  Elastic blood flow compartment.

</PRE>
</HTML>
",   revisions="<html>

<table>
<tr>
<td>Author:</td>
<td>Marek Matejak</td>
</tr>

<tr>
<td>License:</td>
<td><a href=\"http://www.physiomodel.org/license.html\">Physiomodel License 1.0</a> </td>
</tr>
<tr>
<td>By:</td>
<td>Charles University, Prague</td>
</tr>
<tr>
<td>Date of:</td>
<td>january 2009</td>
</tr>
<tr>
<td>References:</td>
<td>Tom Coleman: QHP 2008 beta 3, University of Mississippi Medical Center</td>
</tr>
</table>
<br/><p>Copyright &copy; 2014 Marek Matejak, Charles University in Prague.</p><br/>

</html>"));
    end SystemicVeinsElacticBloodCompartment;

    model CollapsingVeins
      extends Physiolibrary.Icons.CollapsingVessel;
      extends Physiolibrary.Fluid.Interfaces.OnePort;

    Modelica.Blocks.Interfaces.RealInput ExternalPressure
                                                     annotation (Placement(
            transformation(extent={{40,0},{80,40}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={60,20})));

      parameter Real PR1LL( final quantity="Pressure", final displayUnit="mmHg") = 0
      "start-collapsing sucking pressure, when external pressure is zero";
    equation

       q_in.p = if (q_out.p > (PR1LL+ExternalPressure)) then q_out.p else (PR1LL+ExternalPressure);

      annotation (Icon(graphics={
            Text(
              extent={{-62,-32},{58,-58}},
              lineColor={0,0,255},
              textString="%name")}));
    end CollapsingVeins;

    model SequesteredBlood
      extends Physiolibrary.Icons.BloodSequesteredCompartment;

      replaceable package Blood = Physiolibrary.Media.Blood                   constrainedby
        Physiolibrary.Media.Interfaces.PartialMedium                                                                                     annotation ( choicesAllMatching = true);

    Physiolibrary.Fluid.Interfaces.FluidPort_a referencePoint(redeclare package
          Medium = Blood)
      annotation ( Placement(transformation(
            extent={{-10,-110},{10,-90}}, rotation=0),
                                           iconTransformation(extent={{-10,
              -10},{10,10}})));
      Physiolibrary.Types.RealIO.PressureInput ExternalPressure
      "external pressure around the compartment"                              annotation (
      Placement(transformation(
          origin={-90,100},
          extent={{-10,-10},{10,10}},
          rotation=270)));

      Physiolibrary.Types.RealIO.PressureOutput Pressure
      "blod pressure in compartment"
        annotation (Placement(transformation(extent={{30,-110},{50,-90}}, rotation=-90)));
      Physiolibrary.Types.RealIO.VolumeOutput Vol
      "blood volume in compartment"
        annotation (Placement(transformation(extent={{-50,-110},{-30,-90}}, rotation=-90)));

    parameter Physiolibrary.Types.Volume initialVol
      "initial compartment blood volume";
     parameter Real[:,3] data;

    Physiolibrary.Blocks.Interpolation.Curve curve(
      x=data[:, 1],
      y=data[:, 2],
      slope=data[:, 3],
      Xscale=1e-6,
      Yscale=101325/760)
      annotation (Placement(transformation(extent={{-60,50},{-40,70}})));

      Modelica.Blocks.Math.Add add annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-6,40})));
      Physiolibrary.Fluid.Components.ElasticVessel pressureControledCompartment(
        redeclare package Medium = Blood,
      ZeroPressureVolume(displayUnit="l") = 0.002,
      useExternalPressureInput=true,
      volume_start=initialVol,
        nPorts=1)
      annotation (Placement(transformation(extent={{-24,-10},{-4,10}})));
    equation
      connect(curve.val, add.u2) annotation (Line(
          points={{-40,60},{-12,60},{-12,52}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(ExternalPressure, add.u1) annotation (Line(
          points={{-90,100},{-90,82},{-2,82},{-2,52},{1.77636e-15,52}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add.y, Pressure) annotation (Line(
          points={{-6,29},{-6,20},{-100,20},{-100,-40}},
          color={0,0,127},
          smooth=Smooth.None));

    connect(add.y, pressureControledCompartment.externalPressure) annotation (
       Line(
        points={{-6,29},{-6,20},{-6,9},{-7,9}},
        color={0,0,127},
        smooth=Smooth.None));
      connect(pressureControledCompartment.fluidVolume, Vol) annotation (Line(
            points={{-4,-8},{76,-8},{76,102},{-100,102},{-100,40}}, color={0,0,127}));
      connect(pressureControledCompartment.fluidVolume, curve.u) annotation (Line(
            points={{-4,-8},{0,-8},{0,-38},{-76,-38},{-76,60},{-60,60}}, color={0,0,
              127}));
      connect(pressureControledCompartment.q_in[1], referencePoint) annotation (
          Line(
          points={{-14.1,0},{-14.1,-86},{0,-86},{0,-100}},
          color={127,0,0},
          thickness=0.5));
     annotation (
        Documentation(info="<HTML>
<PRE>
  Elastic blood flow compartment.

</PRE>
</HTML>
",   revisions="<html>

<table>
<tr>
<td>Author:</td>
<td>Marek Matejak</td>
</tr>

<tr>
<td>License:</td>
<td><a href=\"http://www.physiomodel.org/license.html\">Physiomodel License 1.0</a> </td>
</tr>
<tr>
<td>By:</td>
<td>Charles University, Prague</td>
</tr>
<tr>
<td>Date of:</td>
<td>january 2009</td>
</tr>
<tr>
<td>References:</td>
<td>Tom Coleman: QHP 2008 beta 3, University of Mississippi Medical Center</td>
</tr>
</table>
<br/><p>Copyright &copy; 2014 Marek Matejak, Charles University in Prague.</p><br/>

</html>"),
         Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={Text(
              extent={{-100,-16},{100,-32}},
              lineColor={0,0,255},
              textString="(initial %initialVol ml)")}));
    end SequesteredBlood;

    model MetabolicVasodilation
      extends Physiolibrary.Icons.BaseFactorIcon5;
      Physiolibrary.Types.RealIO.MolarFlowRateInput O2Need
                   annotation (Placement(transformation(extent={{-110,60},{-82,88}}),
            iconTransformation(extent={{-108,-10},{-88,10}})));

     parameter Boolean enabled=true "disabled => y=yBase";

     parameter Real[:,3] data = {{   50,  1.0,  0}, { 1000,  3.5,  0.003}, { 3000,  5.5,  0}};
     parameter Physiolibrary.Types.Time OnTau = 0.2;
     parameter Physiolibrary.Types.Time OffTau = 1;
     parameter Physiolibrary.Types.Fraction initialEffectValue = 1;
      parameter String stateName=getInstanceName();
      parameter Physiolibrary.Types.MolarFlowRate Xscale = 1
      "conversion scale to SI unit of x values";

    Physiolibrary.Blocks.Interpolation.Curve SteadyState(
      x=data[:, 1],
      y=data[:, 2],
      slope=data[:, 3],
        Xscale=Xscale)
      annotation (Placement(transformation(extent={{-72,64},{-52,84}})));
    Physiolibrary.Blocks.Math.Integrator effect(
      y_start=initialEffectValue,
        k=1)  annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-28,-14})));
     // stateName=stateName,
      Modelica.Blocks.Math.Feedback feedback annotation (Placement(
            transformation(
            extent={{-8,-12},{12,-32}},
            rotation=270,
            origin={8,64})));
      Modelica.Blocks.Math.Product product1 annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-22,16})));
      Modelica.Blocks.Logical.Switch switch1(u2(start=false))
        annotation (Placement(transformation(extent={{-54,24},{-34,44}})));
      Modelica.Blocks.Logical.GreaterThreshold greaterThreshold
        annotation (Placement(transformation(extent={{-72,30},{-64,38}})));
    Physiolibrary.Blocks.Math.Reciprocal OnK annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-86,8})));
    Physiolibrary.Blocks.Math.Reciprocal OffK annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-60,8})));
    Physiolibrary.Types.Constants.TimeConst                 Constant0(k=
          OnTau) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-86,-22})));
    Physiolibrary.Types.Constants.TimeConst                 Constant1(k=
          OffTau) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-60,-22})));

      Physiolibrary.Blocks.Factors.Normalization normalization(enabled=enabled)
        annotation (Placement(transformation(extent={{-10,-20},{10,0}})));
    equation
      connect(SteadyState.val, feedback.u1)
                                      annotation (Line(
          points={{-52,74},{-14,74},{-14,70}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(effect.y, feedback.u2)     annotation (Line(
          points={{-28,-25},{-28,-68},{86,-68},{86,62},{-6,62}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(SteadyState.u, O2Need)  annotation (Line(
          points={{-72,74},{-96,74}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product1.y, effect.u)     annotation (Line(
          points={{-22,5},{-22,-2},{-28,-2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product1.u1, feedback.y) annotation (Line(
          points={{-16,28},{-16,40},{-14,40},{-14,53}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(switch1.y, product1.u2) annotation (Line(
          points={{-33,34},{-28,34},{-28,28}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(greaterThreshold.u, feedback.y) annotation (Line(
          points={{-72.8,34},{-76,34},{-76,50},{-14,50},{-14,53}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(greaterThreshold.y, switch1.u2) annotation (Line(
          points={{-63.6,34},{-56,34}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(OnK.y, switch1.u1)  annotation (Line(
          points={{-86,19},{-86,42},{-56,42}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(OffK.y, switch1.u3)  annotation (Line(
          points={{-60,19},{-60,26},{-56,26}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Constant1.y, OffK.u)  annotation (Line(
          points={{-60,-9.5},{-60,-4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Constant0.y, OnK.u)  annotation (Line(
          points={{-86,-9.5},{-86,-4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(effect.y, normalization.u) annotation (Line(
          points={{-28,-25},{-28,-40},{-12,-40},{-12,-10},{-8,-10}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(yBase, normalization.yBase) annotation (Line(
          points={{0,20},{0,-8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(normalization.y, y) annotation (Line(
          points={{0,-14},{0,-40}},
          color={0,0,127},
          smooth=Smooth.None));
    end MetabolicVasodilation;

  model VariableResistorWithMyogenicResponse
    extends Physiolibrary.Icons.Resistor;
    extends Physiolibrary.Fluid.Interfaces.OnePort;
  /*
  Physiolibrary.Fluid.Interfaces.FluidPort_a q_in "Blood inflow"
    annotation (extent=[-10,-110; 10,-90], Placement(transformation(extent={{-10,
            -110},{10,-90}}, rotation=0),
                                  iconTransformation(extent={{90,-10},{110,
            10}})));
  Physiolibrary.Fluid.Interfaces.FluidPort_b q_out "Blood outflow"
    annotation (extent=[-10,-110; 10,-90], Placement(transformation(extent={{-10,
            -110},{10,-90}}, rotation=0),
                                    iconTransformation(extent={{-110,-10},{
            -90,10}})));
*/
    //(q_in(pressure(start=95.5)),q_out(pressure(start=61.5)));
  /*  extends Physiolibrary.SteadyStates.Interfaces.SteadyState(
                                                stateName="Kidney-MyogenicDelay.PressureChange", state_start=InitialPressureChange, state(nominal=133));
*/
    Physiolibrary.Types.RealIO.HydraulicConductanceInput cond(displayUnit="ml/(min.mmHg)")
        annotation (Placement(transformation(extent={{-100,92},             {-80,112}}), iconTransformation(
                 extent={{-10,-10},{10,10}},         rotation=270,         origin={0,40})));

    Physiolibrary.Types.Fraction myogenicEffect;
    Physiolibrary.Types.Pressure pressureChange(start=InitialPressureChange); //(start=0.161874);
  //  Real pressureChangeSteadyState;
   // Real adaptedPressure; //(start=77.9546);
  //  Real interlobarPressure;
    parameter Physiolibrary.Types.Pressure InitialPressureChange=0;

    parameter Physiolibrary.Types.Frequency K_PressureChange(displayUnit="1/min") =  2.0/60;
    parameter Physiolibrary.Types.Time Tau_PressureAdoption(displayUnit="hod") =  4.0*60*60;
    parameter Real[:,3] PressureChangeOnMyogenicCondEffect;
    Physiolibrary.Blocks.Interpolation.Curve PressureChangeOnCondEffect(
      x=PressureChangeOnMyogenicCondEffect[:, 1],
      y=PressureChangeOnMyogenicCondEffect[:, 2],
      slope=PressureChangeOnMyogenicCondEffect[:, 3],
      Xscale=101325/760)
      annotation (Placement(transformation(extent={{14,26},{34,46}})));

      AfferentArteryMyogenicReceptors kidneyMyogenic(initialPressure(
            displayUnit="mmHg") = 9999.179056125)
        annotation (Placement(transformation(extent={{-46,50},{-26,70}})));
  //initial equation
   // adaptedPressure = interlobarPressure;
    //der(adaptedPressure) = 0;
   // der(pressureChange) = 0;
  equation
    //q_in.q + q_out.q = 0;

    volumeFlowRate = myogenicEffect * cond * (q_in.p - q_out.p);
    kidneyMyogenic.InterlobarPressure = (q_in.p + q_out.p)/2;  //stredny tlak v arteriole
   // der(adaptedPressure) = (1/(60*Tau_PressureAdoption)) * (interlobarPressure-adaptedPressure); //receptory sa adaptuju na tlak (polcas adaptacie nastane za 2hod a 45min)
   // pressureChangeSteadyState = interlobarPressure-adaptedPressure;  //zmena tlaku sa taktiez adaptuje - neviem preco? => potom to vizera, ze stimulacia receptorov je postupny proces (polcas nabudenia stimulacie je 20 sekund)

    der(pressureChange)=K_PressureChange * (kidneyMyogenic.PressureChange_SteadyState - pressureChange);

    PressureChangeOnCondEffect.u = pressureChange; //zmena tlaku aktivuje receptory
    myogenicEffect = PressureChangeOnCondEffect.val; //stimulacia receptorov ma vplyv na vodivost (odpor) krvi aferentnej arterie
    annotation ( Icon(graphics={
            Text(
              extent={{-110,-68},{106,-32}},
              textString="%name",
              lineColor={0,0,255}),
            Text(
              extent={{-68,-20},{66,12}},
              lineColor={0,0,0},
              textString="blood flow"),
            Rectangle(
              extent={{-70,30},{70,-30}},
              lineColor={0,0,255},
              fillColor={215,215,215},
              fillPattern=FillPattern.Sphere),
            Text(
              extent={{-54,20},{52,-18}},
              lineColor={0,0,0},
              fillPattern=FillPattern.Sphere,
              fillColor={215,215,215},
              textString="Myogenic")}),
          Documentation(info="<html> <pre>Receptory sa adaptuju na priemerny tlak v arteriole - polcas adaptacie nastane za 2hod a 45min.
        Zmena tlaku sa taktiez adaptuje - neviem preco? =&GT; potom to vizera, ze stimulacia receptorov je postupny proces (polcas nabudenia stimulacie je 20 sekund).
        Zmena tlaku aktivuje receptory, ktorych stimulacia ma vplyv na vasokonstrikciu danej arterioly.</pre> </html>"));
  end VariableResistorWithMyogenicResponse;

    model AfferentArteryMyogenicReceptors
    /*  extends Physiolibrary.SteadyStates.Interfaces.SteadyState(
                                                stateName="Kidney-Myogenic.AdaptedPressure",
                                                state_start=initialPressure,
                                                state(nominal=1e5));*/
      parameter Physiolibrary.Types.Time Tau = 4*60*60;
      parameter Physiolibrary.Types.Frequency K =   1 / ( Tau);
      parameter Physiolibrary.Types.Pressure initialPressure;
      Physiolibrary.Types.Pressure AdaptedPressure(displayUnit="mmHg");
      Physiolibrary.Types.RealIO.PressureInput
                                         InterlobarPressure(
                                                      displayUnit="mmHg") annotation (
          Placement(transformation(extent={{-100,20},{-60,60}}), iconTransformation(
              extent={{-100,20},{-60,60}})));
      Physiolibrary.Types.RealIO.PressureOutput
                                          PressureChange_SteadyState(
                                                               displayUnit="mmHg")
        annotation (Placement(transformation(extent={{80,-60},{120,-20}}),
            iconTransformation(extent={{80,-60},{120,-20}})));
    equation
      der(AdaptedPressure)= K  * ( InterlobarPressure  -  AdaptedPressure);

      PressureChange_SteadyState = InterlobarPressure - AdaptedPressure;
    end AfferentArteryMyogenicReceptors;

    model AlphaReceptors
      //extends Library.BaseFactor2;

      replaceable package Blood = Physiolibrary.Media.Blood                         constrainedby
        Physiolibrary.Media.Interfaces.PartialMedium "Blood medium model" annotation ( choicesAllMatching = true);

      Modelica.Blocks.Interfaces.RealInput yBase
                               annotation (Placement(transformation(extent={{-10,-10},
                {10,10}},
            rotation=270,
            origin={86,90}),
            iconTransformation(extent={{-10,-10},{10,10}},rotation=270,
            origin={0,70})));
      Modelica.Blocks.Interfaces.RealOutput y
                            annotation (Placement(transformation(extent={{-10,-10},
                {10,10}},
            rotation=270,
            origin={80,-90}),
            iconTransformation(extent={{-10,-10},{10,10}},  rotation=270,
            origin={0,-70})));

      parameter Real[:,3] data={{0.0,1.3,0},{1.0,1.0,-0.16},{4.0,0.8,0}};

      parameter Physiolibrary.Types.Fraction NEURALK=0.5;
      parameter Physiolibrary.Types.Fraction HUMORALK=0.5;
      parameter Boolean Switch = false;
      parameter Physiolibrary.Types.Fraction Setting = 0;

      Modelica.Blocks.Math.Add TotalAgonism(k1=NEURALK, k2=HUMORALK)
        annotation (Placement(transformation(extent={{-58,20},{-38,40}})));
      Modelica.Blocks.Logical.Switch switch1
        annotation (Placement(transformation(extent={{18,28},{38,48}})));
    Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=Switch)
      annotation (Placement(transformation(extent={{-28,38},{-8,58}})));
    Physiolibrary.Types.Constants.FractionConst             Constant(k=Setting)
      annotation (Placement(transformation(extent={{-30,76},{-10,96}})));
    Physiolibrary.Blocks.Interpolation.Curve SympsOnConductance(
      x=data[:, 1],
      y=data[:, 2],
      slope=data[:, 3])
      annotation (Placement(transformation(extent={{30,-40},{50,-20}})));
      Modelica.Blocks.Math.Product Activity
        annotation (Placement(transformation(extent={{-6,-40},{14,-20}})));
      Modelica.Blocks.Math.Product SympsEffect
                                            annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={80,-66})));
      Modelica.Fluid.Interfaces.FluidPort_a
                                   port_a(redeclare package Medium = Blood)
        annotation (Placement(transformation(extent={{-110,-30},{-90,-10}})));
      Fluid.Sensors.MassConcentration        norepinephrine(redeclare function
          GetMassConcentration = Physiolibrary.Media.Blood.norepinephrine,
                                                            redeclare package
          Medium = Blood)
        annotation (Placement(transformation(extent={{-84,-8},{-64,12}})));
      Fluid.Sensors.MassConcentration        epinephrine(redeclare function
          GetMassConcentration = Physiolibrary.Media.Blood.epinephrine,
                                                         redeclare package
          Medium =
            Blood)
        annotation (Placement(transformation(extent={{-84,-34},{-64,-14}})));
      Fluid.Sensors.Fraction                 alphaBlockers(redeclare function
          GetFraction = Physiolibrary.Media.Blood.alphaBlockers,
                                                           redeclare package
          Medium =
            Blood)
        annotation (Placement(transformation(extent={{-84,-92},{-64,-72}})));

      Physiolibrary.Blocks.Math.Log10AsEffect log10_1
      annotation (Placement(transformation(extent={{10,-66},{30,-46}})));
      Modelica.Blocks.Math.Add3 AlphaTotal(
        k3=5e6,
        k1=0.021e9,
        k2=0.125e9)
        annotation (Placement(transformation(extent={{-38,-62},{-18,-42}})));
      Fluid.Sensors.MassConcentration        desglymidodrine(redeclare function
          GetMassConcentration = Physiolibrary.Media.Blood.desglymidodrine,
                                                             redeclare package
          Medium = Blood)
        annotation (Placement(transformation(extent={{-84,-62},{-64,-42}})));
      Modelica.Blocks.Math.Feedback AlphaBlockadeEffect
        annotation (Placement(transformation(extent={{-24,-88},{-4,-68}})));
      Modelica.Blocks.Sources.Constant const(k=1)
        annotation (Placement(transformation(extent={{-52,-84},{-40,-72}})));
      Modelica.Blocks.Math.Gain toEffect(k=1/1.5) "frequency to effect"
        annotation (Placement(transformation(extent={{-82,70},{-62,90}})));
      Types.RealIO.FrequencyInput GangliaGeneral
        "Sympathicus neural activity from general ganglia" annotation (
          Placement(transformation(extent={{-112,70},{-92,90}}),
            iconTransformation(extent={{-108,-70},{-88,-50}})));
    equation

      connect(SympsEffect.u2, SympsOnConductance.val)
                                      annotation (Line(
          points={{74,-54},{74,-30},{50,-30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(SympsOnConductance.u, Activity.y)
                                  annotation (Line(
          points={{30,-30},{15,-30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Activity.u1, switch1.y)
                                     annotation (Line(
          points={{-8,-24},{-20,-24},{-20,2},{62,2},{62,38},{39,38}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(switch1.u3, TotalAgonism.y)
                                 annotation (Line(
          points={{16,30},{-37,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(switch1.u2, booleanConstant.y) annotation (Line(
          points={{16,38},{-2,38},{-2,48},{-7,48}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(switch1.u1, Constant.y) annotation (Line(
          points={{16,46},{10,46},{10,86},{-7.5,86}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(yBase, SympsEffect.u1)
                                  annotation (Line(
          points={{86,90},{86,-54}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(SympsEffect.y, y)
                             annotation (Line(
          points={{80,-77},{80,-90}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(AlphaTotal.y, log10_1.u) annotation (Line(points={{-17,-52},{2,
              -52},{2,-56},{8,-56}}, color={0,0,127}));
      connect(log10_1.y, TotalAgonism.u2) annotation (Line(points={{31,-56},{36,
              -56},{36,-44},{26,-44},{26,-36},{22,-36},{22,16},{-70,16},{-70,24},
              {-60,24}}, color={0,0,127}));
      connect(const.y, AlphaBlockadeEffect.u1)
        annotation (Line(points={{-39.4,-78},{-22,-78}}, color={0,0,127}));
      connect(AlphaBlockadeEffect.y, Activity.u2) annotation (Line(points={{-5,
              -78},{0,-78},{0,-44},{-14,-44},{-14,-36},{-8,-36}}, color={0,0,
              127}));
      connect(port_a, norepinephrine.port) annotation (Line(
          points={{-100,-20},{-88,-20},{-88,-8},{-74,-8}},
          color={127,0,0},
          thickness=0.5));
      connect(port_a, epinephrine.port) annotation (Line(
          points={{-100,-20},{-88,-20},{-88,-34},{-74,-34}},
          color={127,0,0},
          thickness=0.5));
      connect(port_a, alphaBlockers.port) annotation (Line(
          points={{-100,-20},{-88,-20},{-88,-92},{-74,-92}},
          color={127,0,0},
          thickness=0.5));
      connect(port_a, desglymidodrine.port) annotation (Line(
          points={{-100,-20},{-88,-20},{-88,-62},{-74,-62}},
          color={127,0,0},
          thickness=0.5));
      connect(GangliaGeneral, toEffect.u)
        annotation (Line(points={{-102,80},{-84,80}}, color={0,0,127}));
      connect(toEffect.y, TotalAgonism.u1) annotation (Line(points={{-61,80},{
              -58,80},{-58,60},{-70,60},{-70,36},{-60,36}}, color={0,0,127}));
      connect(norepinephrine.R, AlphaTotal.u1) annotation (Line(points={{-63,2},
              {-50,2},{-50,-44},{-40,-44}}, color={0,0,127}));
      connect(epinephrine.R, AlphaTotal.u2) annotation (Line(points={{-63,-24},
              {-52,-24},{-52,-52},{-40,-52}}, color={0,0,127}));
      connect(alphaBlockers.F, AlphaBlockadeEffect.u2) annotation (Line(points=
              {{-63,-82},{-62,-82},{-62,-96},{-14,-96},{-14,-86}}, color={0,0,
              127}));
      connect(desglymidodrine.R, AlphaTotal.u3) annotation (Line(points={{-63,
              -52},{-54,-52},{-54,-60},{-40,-60}}, color={0,0,127}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={Rectangle(
              extent={{-100,70},{100,-70}},
              lineColor={112,143,0},
              fillPattern=FillPattern.Sphere,
              fillColor={255,255,255}), Text(
              extent={{-88,-40},{100,48}},
              lineColor={0,0,0},
              fillPattern=FillPattern.Sphere,
              fillColor={85,255,170},
              textString="%name")}));
    end AlphaReceptors;

    model BetaReceptors
      //extends Library.BaseFactor2;

      replaceable package Blood = Physiolibrary.Media.Blood
         constrainedby Physiolibrary.Media.Interfaces.PartialMedium
                                                     "Blood medium model" annotation ( choicesAllMatching = true);

      Types.RealIO.FrequencyInput GangliaGeneral
        "Sympathicus neural activity from general ganglia" annotation (
          Placement(transformation(extent={{-110,70},{-90,90}}),
            iconTransformation(extent={{-108,-70},{-88,-50}})));
      input Real yBase = base if useBase
                               annotation (Placement(transformation(extent={{-10,-10},
                {10,10}},
            rotation=270,
            origin={86,90}),
            iconTransformation(extent={{-10,-10},{10,10}},rotation=270,
            origin={0,70})));                   //=base
                                                     // if useBase
      Modelica.Blocks.Interfaces.RealOutput y
                            annotation (Placement(transformation(extent={{-10,-10},
                {10,10}},
            rotation=270,
            origin={80,-90}),
            iconTransformation(extent={{-10,-10},{10,10}},  rotation=270,
            origin={0,-70})));

      parameter Boolean useBase=false "If not then yBase=1" annotation (
        Evaluate = true,
        HideResult = true,
        choices(checkBox = true),
        Dialog(group = "Conditional inputs"));
      parameter Physiolibrary.Types.Fraction NEURALK=0.5;
      parameter Physiolibrary.Types.Fraction HUMORALK=0.5;
      parameter Boolean Switch = false;
      parameter Physiolibrary.Types.Fraction Setting = 0;

      Modelica.Blocks.Math.Add TotalAgonism(k1=NEURALK, k2=HUMORALK)
        annotation (Placement(transformation(extent={{-58,20},{-38,40}})));
      Modelica.Blocks.Logical.Switch switch1
        annotation (Placement(transformation(extent={{18,28},{38,48}})));
    Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=Switch)
      annotation (Placement(transformation(extent={{-28,38},{-8,58}})));
    Physiolibrary.Types.Constants.FractionConst             Constant(k=Setting)
      annotation (Placement(transformation(extent={{-30,76},{-10,96}})));
      Modelica.Blocks.Math.Product Activity
        annotation (Placement(transformation(extent={{-6,-40},{14,-20}})));
      Modelica.Blocks.Math.Product SympsEffect
                                            annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={80,-66})));
      Modelica.Fluid.Interfaces.FluidPort_a
                                   port_a(redeclare package Medium = Blood)
        annotation (Placement(transformation(extent={{-110,-30},{-90,-10}})));
      Fluid.Sensors.MassConcentration        norepinephrine(redeclare function GetMassConcentration =
                                 Physiolibrary.Media.Blood.norepinephrine,
                                                            redeclare package Medium =
                   Blood)
        annotation (Placement(transformation(extent={{-84,-10},{-64,10}})));
      Fluid.Sensors.MassConcentration        epinephrine(redeclare function GetMassConcentration =
                                 Physiolibrary.Media.Blood.epinephrine,
                                                         redeclare package Medium =
            Blood)
        annotation (Placement(transformation(extent={{-84,-34},{-64,-14}})));
      Fluid.Sensors.Fraction                 betaBlockers(redeclare function GetFraction =
                        Physiolibrary.Media.Blood.betaBlockers,
                                                          redeclare package Medium =
            Blood)
        annotation (Placement(transformation(extent={{-84,-92},{-64,-72}})));

      Physiolibrary.Blocks.Math.Log10AsEffect log10_1
      annotation (Placement(transformation(extent={{12,-68},{32,-48}})));
      Modelica.Blocks.Math.Add  AlphaTotal(k1=0.021e9, k2=0.125e9)
        annotation (Placement(transformation(extent={{-44,-62},{-18,-36}})));
      Modelica.Blocks.Math.Feedback BetaBlockadeEffect
        annotation (Placement(transformation(extent={{-24,-88},{-4,-68}})));
      Modelica.Blocks.Sources.Constant const(k=1)
        annotation (Placement(transformation(extent={{-52,-84},{-40,-72}})));

      Real base;

      Modelica.Blocks.Math.Gain toEffect(k=1/1.5) "frequency to effect"
        annotation (Placement(transformation(extent={{-80,70},{-60,90}})));
    equation
      if not useBase then
        base = 1;
      end if;

      connect(Activity.u1, switch1.y)
                                     annotation (Line(
          points={{-8,-24},{-20,-24},{-20,2},{62,2},{62,38},{39,38}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(switch1.u3, TotalAgonism.y)
                                 annotation (Line(
          points={{16,30},{-37,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(switch1.u2, booleanConstant.y) annotation (Line(
          points={{16,38},{-2,38},{-2,48},{-7,48}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(switch1.u1, Constant.y) annotation (Line(
          points={{16,46},{10,46},{10,86},{-7.5,86}},
          color={0,0,127},
          smooth=Smooth.None));
      SympsEffect.u1=base;

      connect(SympsEffect.y, y)
                             annotation (Line(
          points={{80,-77},{80,-90}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(AlphaTotal.y, log10_1.u) annotation (Line(points={{-16.7,-49},{6,-49},
              {6,-58},{10,-58}},     color={0,0,127}));
      connect(log10_1.y, TotalAgonism.u2) annotation (Line(points={{33,-58},{38,-58},
              {38,18},{-68,18},{-68,24},{-60,24}},
                         color={0,0,127}));
      connect(const.y, BetaBlockadeEffect.u1)
        annotation (Line(points={{-39.4,-78},{-22,-78}}, color={0,0,127}));
      connect(BetaBlockadeEffect.y, Activity.u2) annotation (Line(points={{-5,-78},{
              2,-78},{2,-44},{-12,-44},{-12,-36},{-8,-36}}, color={0,0,127}));
      connect(port_a, norepinephrine.port) annotation (Line(
          points={{-100,-20},{-88,-20},{-88,-10},{-74,-10}},
          color={127,0,0},
          thickness=0.5));
      connect(port_a, epinephrine.port) annotation (Line(
          points={{-100,-20},{-88,-20},{-88,-34},{-74,-34}},
          color={127,0,0},
          thickness=0.5));
      connect(port_a, betaBlockers.port) annotation (Line(
          points={{-100,-20},{-88,-20},{-88,-92},{-74,-92}},
          color={127,0,0},
          thickness=0.5));
      connect(Activity.y, SympsEffect.u2)
        annotation (Line(points={{15,-30},{74,-30},{74,-54}}, color={0,0,127}));
      connect(GangliaGeneral, toEffect.u)
        annotation (Line(points={{-100,80},{-82,80}}, color={0,0,127}));
      connect(toEffect.y, TotalAgonism.u1) annotation (Line(points={{-59,80},{
              -56,80},{-56,60},{-68,60},{-68,36},{-60,36}}, color={0,0,127}));
      connect(norepinephrine.R, AlphaTotal.u1) annotation (Line(points={{-63,0},
              {-52,0},{-52,-34},{-54,-34},{-54,-41.2},{-46.6,-41.2}}, color={0,
              0,127}));
      connect(epinephrine.R, AlphaTotal.u2) annotation (Line(points={{-63,-24},
              {-58,-24},{-58,-56.8},{-46.6,-56.8}}, color={0,0,127}));
      connect(betaBlockers.F, BetaBlockadeEffect.u2) annotation (Line(points={{
              -63,-82},{-63,-94},{-14,-94},{-14,-86}}, color={0,0,127}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={Rectangle(
              extent={{-100,70},{100,-70}},
              lineColor={112,143,0},
              fillPattern=FillPattern.Sphere,
              fillColor={255,255,255}), Text(
              extent={{-88,-40},{100,48}},
              lineColor={0,0,0},
              fillPattern=FillPattern.Sphere,
              fillColor={85,255,170},
              textString="%name")}));
    end BetaReceptors;

    model ViscosityConductance
      import Physiolibrary;
      extends Icons.BaseFactorIcon4;
      Physiolibrary.Fluid.Sensors.Fraction Hct(redeclare package Medium = Blood)
        annotation (Placement(transformation(extent={{-90,14},{-70,34}})));
      Blocks.Factors.Normalization Viscosity1
        annotation (Placement(transformation(extent={{-10,-18},{10,2}})));
      replaceable package Blood = Physiolibrary.Media.Blood  constrainedby
        Media.Interfaces.PartialMedium                                                                                                   annotation ( choicesAllMatching = true);
      Modelica.Fluid.Interfaces.FluidPort_a port(redeclare package Medium = Blood)
        annotation (Placement(transformation(rotation=0, extent={{-110,-10},{-90,10}}),
            iconTransformation(extent={{-110,-10},{-90,10}})));
      Blocks.Interpolation.Curve HtcOnVisc(
        x={0,0.44,0.8},
        y={0.5,1,5},
        slope={0.8,3,30})
        annotation (Placement(transformation(extent={{-60,14},{-40,34}})));
      Modelica.Blocks.Math.Division division1
        annotation (Placement(transformation(extent={{-28,26},{-20,34}})));
      Types.Constants.OneConst one1
        annotation (Placement(transformation(extent={{-42,36},{-34,44}})));
    equation
      connect(port, Hct.port) annotation (Line(points={{-100,0},{-100,6},{-80,6},{-80,
              14}}, color={127,0,0}));
      connect(y, Viscosity1.y) annotation (Line(points={{0,-40},{0,-12}},
                         color={0,0,127}));
      connect(yBase, Viscosity1.yBase) annotation (Line(points={{0,20},{0,-6}},
                                color={0,0,127}));
    connect(one1.y,division1. u1) annotation (Line(
        points={{-33,40},{-32,40},{-32,32.4},{-28.8,32.4}},
        color={0,0,127},
        smooth=Smooth.None));
      connect(HtcOnVisc.val,division1. u2) annotation (Line(
          points={{-40,24},{-30.5,24},{-30.5,27.6},{-28.8,27.6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(division1.y, Viscosity1.u) annotation (Line(points={{-19.6,30},{
              -14,30},{-14,-8},{-8,-8}}, color={0,0,127}));
      connect(Hct.F, HtcOnVisc.u)
        annotation (Line(points={{-69,24},{-60,24}}, color={0,0,127}));
    end ViscosityConductance;

    model Membrane
      extends Icons.Membrane;

      replaceable package MediumA = Physiolibrary.Media.Blood   constrainedby
        Physiolibrary.Media.Interfaces.PartialMedium                                                                                     annotation ( choicesAllMatching = true);
      replaceable package MediumB = Physiolibrary.Media.Blood   constrainedby
        Physiolibrary.Media.Interfaces.PartialMedium                                                                                     annotation ( choicesAllMatching = true);

      Chemical.Interfaces.SubstancePorts_a ports_a[MediumA.nS]
        annotation (Placement(transformation(extent={{-110,18},{-90,98}})));
      Chemical.Interfaces.SubstancePorts_b ports_b[MediumB.nS]
        annotation (Placement(transformation(extent={{90,18},{110,98}})));
      Chemical.Components.Membrane membrane[size(substanceNames,1)](KC=KC)
        annotation (Placement(transformation(extent={{-6,48},{14,68}})));
      parameter String substanceNames[:]={"O2","CO2"};
      parameter Real KC[size(substanceNames,1)](each final unit="mol2.s-1.J-1")=fill(1,size(substanceNames,1));
      parameter String extraSubstanceNames[:]={"Epinephrine","Angiotensin2","Renin"};
      parameter Real EKC[size(extraSubstanceNames,1)]=fill(1,size(extraSubstanceNames,1));

    protected
      parameter Integer iSA[size(substanceNames,1)] = findIndieces(substanceNames,MediumA.substanceNames)
        "Indieces of substances in vector of substances of medium A";

      parameter Integer iSB[size(substanceNames,1)] = findIndieces(substanceNames,MediumB.substanceNames)
        "Indieces of substances in vector of substances of medium B";



      parameter Integer ioSA[MediumA.nS-size(substanceNames,1)] = findOtherIndiecies(MediumA.nS,iSA)
        "Indieces of substances in vector of substances of medium A";

      parameter Integer ioSB[MediumB.nS-size(substanceNames,1)] = findOtherIndiecies(MediumB.nS,iSB)
        "Indieces of substances in vector of substances of medium B";



      function findIndieces
        input String searchNames[:];
        input String vectorNames[:];
        output Integer indieces[size(searchNames,1)];
      algorithm
        for j in 1:size(searchNames,1) loop
          indieces[j]:= -1;
          for i in 1:size(vectorNames,1) loop
            if ( Modelica.Utilities.Strings.isEqual(vectorNames[i], searchNames[j])) then
             indieces[j] := i;
            end if;
          end for;
          assert(indieces[j] > 0, "Substance '" + searchNames[j] + "' is not present between Substances in Medium\n"
             + "Check parameters and medium model.");
        end for;
      end findIndieces;

      function findOtherIndiecies
        input Integer n "Length of vector";
        input Integer indiecies[:] "Indiecies in vector";
        output Integer otherIndiecies[n-size(indiecies,1)] "Other indiecies";
      protected
        Integer k,e;
      algorithm
        k:=1;
        for i in 1:n loop
          e:=1;
          for j in i:size(indiecies,1) loop
            if (indiecies[j]==i) then e:=0; end if;
          end for;
          if (e==1) then
            otherIndiecies[k]:=i;
            k:=k+1;
          end if;
        end for;
      end findOtherIndiecies;

    equation

      for j in 1:size(substanceNames,1) loop
        connect(membrane[j].port_a, ports_a[iSA[j]])
          annotation (Line(points={{-6,58},{-100,58}}, color={158,66,200}));
        connect(membrane[j].port_b, ports_b[iSB[j]])
          annotation (Line(points={{14,58},{100,58}}, color={158,66,200}));
      end for;

      for oj in 1:size(ioSA,1) loop
        ports_a[ioSA[oj]].q=0;
        ports_a[ioSA[oj]].h_outflow=0;
        ports_b[ioSB[oj]].q=0;
        ports_b[ioSB[oj]].h_outflow=0;
      end for;





      annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={Text(
              extent={{-140,-124},{140,-104}},
              textColor={102,44,145},
              textString="%name")}),                                 Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end Membrane;
  end Components;

  package Interfaces

    partial model BaseTissue
    extends Physiolibrary.Icons.PerfusionDO;

    replaceable package Blood = Physiolibrary.Media.Blood  constrainedby
        Physiolibrary.Media.Interfaces.PartialMedium                                                                                   annotation ( choicesAllMatching = true); //BloodBySiggaardAndersen
    Physiolibrary.Fluid.Interfaces.FluidPort_a port_a(redeclare package Medium =
            Blood) "Blood inflow" annotation (Placement(transformation(extent={
                {100,-10},{120,10}}, rotation=0), iconTransformation(extent={{
                150,-10},{170,10}})));
    Physiolibrary.Fluid.Interfaces.FluidPort_b port_b(redeclare package Medium =
            Blood) "Blood outflow" annotation (Placement(transformation(extent=
                {{-110,-10},{-90,10}}, rotation=0), iconTransformation(extent={
                {-168,-10},{-148,10}})));

    Physiolibrary.Types.BusConnector busConnector
      "signals of organ bood flow resistence" annotation (Placement(
          transformation(extent={{-100,80},{-80,100}}), iconTransformation(
            extent={{-64,58},{-46,76}})));

      Physiolibrary.Types.RealIO.VolumeFlowRateOutput BloodFlow
                                               annotation (Placement(transformation(
              extent={{92,14},{104,26}}),  iconTransformation(extent={{60,-60},{80,
                -40}})));
    Physiolibrary.Fluid.Sensors.VolumeFlowMeasure flowMeasure(redeclare package
          Medium = Blood)                                     annotation (
        Placement(transformation(
          extent={{10,-10},{-10,10}},
          origin={88,0})));
    equation

      connect(flowMeasure.q_in, port_a) annotation (Line(
          points={{98,0},{110,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(flowMeasure.volumeFlow, BloodFlow)
        annotation (Line(points={{88,12},{88,20},{98,20}}, color={0,0,127}));
      annotation (Documentation(info="<HTML>
<PRE>
Blood flow variable resistor abstract model.
</PRE>
</HTML>
",   revisions="<html>

<table>
<tr>
<td>Author:</td>
<td>Marek Matejak</td>
</tr>
<tr>
<td>License:</td>
<td><a href=\"http://www.physiomodel.org/license.html\">Physiomodel License 1.0</a> </td>
</tr>
<tr>
<td>By:</td>
<td>Charles University, Prague</td>
</tr>
<tr>
<td>Date of:</td>
<td>2009</td>
</tr>
</table>
<br/><p>Copyright &copy; 2014 Marek Matejak, Charles University in Prague.</p><br/>

</html>"));
    end BaseTissue;

  end Interfaces;

  class References "References"
  extends Modelica.Icons.References;

  annotation (Documentation(info="<html>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"0\">

        <tr>
                <td>[Abildgaard1986]</td>
                <td>U. Abildgaard, N.-H. Holstein-Rathlou, and P. P. Leyssac, \"Effect of renal nerve activity on tubular sodium and water reabsorption in dog kidneys as determined by the lithium clearance method,\" Acta Physiologica Scandinavica, vol. 126, pp. 251-257, 1986. </td>
        </tr>
        <tr>
                <td>[Abram2007]</td>
                <td>S. R. Abram, B. L. Hodnett, R. L. Summers, T. G. Coleman, and R. L. Hester, \"Quantitative circulatory physiology: an integrative mathematical model of human physiology for medical education,\" Advances in Physiology Education, vol. 31, pp. 202-210, 2007. </td>
        </tr>
        <tr>
                <td>[Abramson1958]</td>
                <td>D. I. Abramson, A. Kahn, S. Tuck Jr, G. A. Turman, H. Rejal, and C. J. Fleischer, \"Relationship between a range of tissue temperature and local oxygen uptake in the human forearm. I. Changes observed under resting conditions,\" Journal of Clinical Investigation, vol. 37, p. 1031, 1958. </td>
        </tr>
        <tr>
                <td>[Adair1982]</td>
                <td>T. H. Adair, D. S. Moffatt, A. W. Paulsen, and A. C. Guyton, Quantitation of changes in lymph protein concentration during lymph node transit vol. 243, 1982. </td>
        </tr>
        <tr>
                <td>[Adler1970]</td>
                <td>S. Adler, \"An extrarenal action of aldosterone on mammalian skeletal muscle,\" Am J Physiol, vol. 218, pp. 616-621, 1970. </td>
        </tr>
        <tr>
                <td>[Adolph1946]</td>
                <td>E. F. Adolph and G. W. Molnar, EXCHANGES OF HEAT AND TOLERANCES TO COLD IN MEN EXPOSED TO OUTDOOR WEATHER vol. 146, 1946. </td>
        </tr>
        <tr>
                <td>[Adrogue1985]</td>
                <td>H. J. Adrogue, Z. Chap, T. Ishida, and J. Field, \"Role of the endocrine pancreas in the kalemic response to acute metabolic acidosis in conscious dogs,\" Journal of Clinical Investigation, vol. 75, p. 798, 1985. </td>
        </tr>
        <tr>
                <td>[ADROGUÉ1986]</td>
                <td>H. J. ADROGUÉ, E. D. LEDERER, W. N. SUKI, and G. EKNOYAN, \"Determinants of Plasma Potassium Levels in Diabetic Ketoacidosis,\" Medicine, vol. 65, pp. 163-172, 1986. </td>
        </tr>
        <tr>
                <td>[Agostoni1962]</td>
                <td>E. Agostoni and G. Torri, Diaphragm contraction as a limiting factor to maximum expiration vol. 17, 1962. </td>
        </tr>
        <tr>
                <td>[Aguilera1978]</td>
                <td>G. Aguilera and K. Catt, \"Regulation of aldosterone secretion by the renin-angiotensin system during sodium restriction in rats,\" Proceedings of the National Academy of Sciences, vol. 75, pp. 4057-4061, 1978. </td>
        </tr>
        <tr>
                <td>[Ahlqvist2003]</td>
                <td>J. Ahlqvist, \"Plasma protein osmotic pressure equations for humans,\" Journal of Applied Physiology, vol. 94, pp. 1288-1289, 2003. </td>
        </tr>
        <tr>
                <td>[Albert1967]</td>
                <td>M. S. Albert, R. B. Dell, and R. W. Winters, \"Quantitative Displacement of Acid-Base Equilibrium in Metabolic Acidosis,\" Annals of Internal Medicine, vol. 66, pp. 312-322, 1967. </td>
        </tr>
        <tr>
                <td>[Alexander1978]</td>
                <td>G. Alexander, \"Cold thermogenesis,\" International review of physiology, vol. 20, pp. 43-155, 1978. </td>
        </tr>
        <tr>
                <td>[Alexander1955]</td>
                <td>J. K. Alexander, H. F. Spalter, and J. R. West, \"MODIFICATION OF THE RESPIRATORY RESPONSE TO CARBON DIOXIDE BY SALICYLATE,\" The Journal of Clinical Investigation, vol. 34, pp. 533-537, 1955. </td>
        </tr>
        <tr>
                <td>[Alfie1999]</td>
                <td>J. Alfie, G. D. Waisman, C. R. Galarza, and M. I. Cámera, \"Contribution of Stroke Volume to the Change in Pulse Pressure Pattern With Age,\" Hypertension, vol. 34, pp. 808-812, October 1, 1999 1999. </td>
        </tr>
        <tr>
                <td>[Algenstaedt2004]</td>
                <td>P. Algenstaedt, N. Rosenblatt, I. Kolb, A. Krützelmann, B. Schwarzloh, A. Böttcher, et al., \"A new model of primary human adipocytes reveals reduced early insulin signalling in type 2 diabetes,\" Hormone and Metabolic Research = Hormon- Und Stoffwechselforschung = Hormones Et Métabolisme, vol. 36, pp. 531-537, 2004/08// 2004. </td>
        </tr>
        <tr>
                <td>[Almgard1975]</td>
                <td>L. Almgard and A. Ljungqvist, \"Effect of circulating norepinephrine on the renin release from the denervated kidney,\" Scandinavian journal of urology and nephrology, vol. 9, pp. 119-124, 1975. </td>
        </tr>
        <tr>
                <td>[Alsberge1988]</td>
                <td>M. Alsberge, M. Magno, and M. Lipschutz, Carotid body control of bronchial circulation in sheep vol. 65, 1988. </td>
        </tr>
        <tr>
                <td>[Ames1965]</td>
                <td>R. P. Ames, A. J. Borkowski, A. M. Sicinski, and J. H. Laragh, \"Prolonged infusions of angiotensin II and norepinephrine and blood pressure, electrolyte balance, and aldosterone and cortisol secretion in normal man and in cirrhosis with ascites,\" Journal of Clinical Investigation, vol. 44, p. 1171, 1965. </td>
        </tr>
        <tr>
                <td>[Anderson1985]</td>
                <td>K. E. Anderson, E. Pantuck, A. H. Conney, and A. Kappas, \"Nutrient regulation of chemical metabolism in humans,\" in Federation proceedings, 1985, pp. 130-133. </td>
        </tr>
        <tr>
                <td>[Andres1962]</td>
                <td>R. Andres, M. A. Baltzan, G. Cader, and K. L. Zierler, \"Effect of insulin on carbohydrate metabolism and on potassium in the forearm of man,\" Journal of Clinical Investigation, vol. 41, p. 108, 1962. </td>
        </tr>
        <tr>
                <td>[Angielski1978]</td>
                <td>S. Angielski and J. Lukowicz, \"The role of the kidney in the removal of ketone bodies under different acid-base status of the rat,\" The American Journal of Clinical Nutrition, vol. 31, pp. 1635-41, September 1, 1978 1978. </td>
        </tr>
        <tr>
                <td>[Arendshorst1985]</td>
                <td>W. J. Arendshorst and C. W. Gottschalk, Glomerular ultrafiltration dynamics: historical perspective vol. 248, 1985. </td>
        </tr>
        <tr>
                <td>[Archer2002]</td>
                <td>S. Archer and E. Michelakis, The Mechanism(s) of Hypoxic Pulmonary Vasoconstriction: Potassium Channels, Redox O2 Sensors, and Controversies vol. 17, 2002. </td>
        </tr>
        <tr>
                <td>[Archer1996]</td>
                <td>S. L. Archer, J. M. C. Huang, H. L. Reeve, V. Hampl, S. Tolarová, E. Michelakis, et al., \"Differential Distribution of Electrophysiologically Distinct Myocytes in Conduit and Resistance Arteries Determines Their Response to Nitric Oxide and Hypoxia,\" Circulation Research, vol. 78, pp. 431-442, March 1, 1996 1996. </td>
        </tr>
        <tr>
                <td>[Armstrong1991]</td>
                <td>L. E. Armstrong and C. M. Maresh, \"The induction and decay of heat acclimatisation in trained athletes,\" Sports Medicine, vol. 12, pp. 302-312, 1991. </td>
        </tr>
        <tr>
                <td>[Armstrong1985]</td>
                <td>R. Armstrong, C. Vandenakker, and M. Laughlin, \"Muscle blood flow patterns during exercise in partially curarized rats,\" Journal of Applied Physiology, vol. 58, pp. 698-701, 1985. </td>
        </tr>
        <tr>
                <td>[Arner2002]</td>
                <td>P. Arner, \"Insulin resistance in type 2 diabetes: role of fatty acids,\" Diabetes/metabolism research and reviews, vol. 18, pp. S5-S9, 2002. </td>
        </tr>
        <tr>
                <td>[Ashley1992]</td>
                <td>K. D. Ashley, D. N. Herndon, L. D. Traber, D. L. Traber, K. Deubel-Ashley, J. Stothert, et al., \"Systemic blood flow to sheep lung: comparison of flow probes and microspheres,\" Journal of Applied Physiology, vol. 73, pp. 1996-1996, 1992. </td>
        </tr>
        <tr>
                <td>[Atherton1971]</td>
                <td>J. Atherton, R. Green, and S. Thomas, \"Influence of lysine-vasopressin dosage on the time course of changes in renal tissue and urinary composition in the conscious rat,\" The Journal of physiology, vol. 213, pp. 291-309, 1971. </td>
        </tr>
        <tr>
                <td>[Atchley1933]</td>
                <td>D. W. Atchley, R. F. Loeb, D. W. Richards, Jr., E. M. Benedict, and M. E. Driscoll, \"ON DIABETIC ACIDOSIS: A Detailed Study of Electrolyte Balances Following the Withdrawal and Reestablishment of Insulin Therapy,\" The Journal of Clinical Investigation, vol. 12, pp. 297-326, 1933. </td>
        </tr>
        <tr>
                <td>[Atkins1962]</td>
                <td>E. L. Atkins and W. B. Schwartz, \"Factors governing correction of the alkalosis associated with potassium deficiency; the critical role of chloride in the recovery process,\" Journal of Clinical Investigation, vol. 41, p. 218, 1962. </td>
        </tr>
        <tr>
                <td>[Aukland1989]</td>
                <td>K. Aukland, \"Myogenic mechanisms in the kidney,\" Journal of hypertension. Supplement: official journal of the International Society of Hypertension, vol. 7, pp. S71-6; discussion S77, 1989. </td>
        </tr>
        <tr>
                <td>[Aukland1993]</td>
                <td>K. Aukland and R. K. Reed, \"Interstitial-lymphatic mechanisms in the control of extracellular fluid volume,\" Physiological Reviews, vol. 73, pp. 1-78, January 1, 1993 1993. </td>
        </tr>
        <tr>
                <td>[Aukland1993]</td>
                <td>K. Aukland and R. Reed, \"Interstitial-lymphatic mechanisms in the control of extracellular fluid volume,\" Physiological reviews, vol. 73, pp. 1-78, 1993. </td>
        </tr>
        <tr>
                <td>[Avery1961]</td>
                <td>M. E. Avery and C. D. Cook, Volume-pressure relationships of lungs and thorax in fetal, newborn, and adult goats vol. 16, 1961. </td>
        </tr>
        <tr>
                <td>[Badder1977]</td>
                <td>E. M. Badder, J. F. Seaton, and T. S. Harrison, \"Arterial and venous catecholamine responses to passive orthostatic stimulation,\" Surgical forum, vol. 28, pp. 115-118, 1977 1977. </td>
        </tr>
        <tr>
                <td>[Bachelard1974]</td>
                <td>H. S. Bachelard, L. D. Lewis, U. Pontén, and B. K. Siesjö, \"MECHANISMS ACTIVATING GLYCOLYSIS IN THE BRAIN IN ARTERIAL HYPOXIA,\" Journal of Neurochemistry, vol. 22, pp. 395-401, 1974. </td>
        </tr>
        <tr>
                <td>[Baldes1934]</td>
                <td>E. J. Baldes and F. Smirk, \"The effect of water drinking, mineral starvation and salt administration on the total osmotic pressure of the blood in man, chiefly in relation to the problems of water absorption and water diuresis,\" The Journal of physiology, vol. 82, pp. 62-74, 1934. </td>
        </tr>
        <tr>
                <td>[Baldes1934]</td>
                <td>E. J. Baldes and F. H. Smirk, \"The effect of water drinking, mineral starvation and salt administration on the total osmotic pressure of the blood in man, chiefly in relation to the problems of water absorption and water diuresis,\" The Journal of Physiology, vol. 82, pp. 62-74, August 24, 1934 1934. </td>
        </tr>
        <tr>
                <td>[Bangsbo1997]</td>
                <td>J. Bangsbo, C. Juel, Y. Hellsten, and B. Saltin, \"Dissociation between lactate and proton exchange in muscle during intense exercise in man,\" The Journal of Physiology, vol. 504, pp. 489-499, October 15, 1997 1997. </td>
        </tr>
        <tr>
                <td>[Barger1958]</td>
                <td>A. Barger, R. Berlin, and J. Tulenko, \"INFUSION OF ALDOSTERONE, 9-?-FLUOROHYDROCORTISONE AND ANTIDIURETIC HORMONE INTO THE RENAL ARTERY OF NORMAL AND ADRENALECTOMIZED, UNANESTHETIZED DOGS: EFFECT ON ELECTROLYTE AND WATER EXCRETION 1,\" Endocrinology, vol. 62, pp. 804-815, 1958. </td>
        </tr>
        <tr>
                <td>[Barnard1987]</td>
                <td>P. Barnard, S. Andronikou, M. Pokorski, N. Smatresk, A. Mokashi, and S. Lahiri, Time-dependent effect of hypoxia on carotid body chemosensory function vol. 63, 1987. </td>
        </tr>
        <tr>
                <td>[Bassingthwaighte1997]</td>
                <td>J. B. Bassingthwaighte, \"Design and strategy for the Cardionome Project,\" in Analytical and Quantitative Cardiology, ed: Springer, 1997, pp. 325-339. </td>
        </tr>
        <tr>
                <td>[Bassingthwaighte2000]</td>
                <td>J. B. Bassingthwaighte, \"Strategies for the physiome project,\" Annals of Biomedical Engineering, vol. 28, pp. 1043-1058, 2000. </td>
        </tr>
        <tr>
                <td>[BAUER1993]</td>
                <td>C. BAUER, \"A WIDESPREAD OXYGEN SENSOR REVEALED,\" ed: C/O WILLIAMS & WILKINS, PO BOX 1496, BALTIMORE, MD 21203, 1993. </td>
        </tr>
        <tr>
                <td>[Bauer1979]</td>
                <td>J. H. Bauer and W. C. Gauntner, \"Effect of potassium chloride on plasma renin activity and plasma aldosterone during sodium restriction in normal man,\" Kidney Int, vol. 15, pp. 286-293, 03//print 1979. </td>
        </tr>
        <tr>
                <td>[Bazett1997]</td>
                <td>H. C. Bazett, \"AN ANALYSIS OF THE TIME-RELATIONS OF ELECTROCARDIOGRAMS,\" Annals of Noninvasive Electrocardiology, vol. 2, pp. 177-194, 1997. </td>
        </tr>
        <tr>
                <td>[Becklake1989]</td>
                <td>M. R. Becklake, \"Occupational Exposures: Evidence for a Causal Association with Chronic Obstructive Pulmonary Disease,\" American Review of Respiratory Disease, vol. 140, pp. S85-S91, 1989/09/01 1989. </td>
        </tr>
        <tr>
                <td>[Beeken1962]</td>
                <td>W. L. Beeken, W. Volwiler, P. D. Goldsworthy, L. E. Garby, W. E. Reynolds, R. Stogsdill, et al., \"Studies of I131-albumin catabolism and distribution in normal young male adults,\" Journal of Clinical Investigation, vol. 41, p. 1312, 1962. </td>
        </tr>
        <tr>
                <td>[Begg1966]</td>
                <td>T. Begg and J. Hearns, \"Components in blood viscosity. The relative contribution of haematocrit, plasma fibrinogen and other proteins,\" Clinical science, vol. 31, pp. 87-93, 1966. </td>
        </tr>
        <tr>
                <td>[Bello-Reuss1975]</td>
                <td>E. Bello-Reuss, R. Colindres, E. Pastoriza-Munoz, R. Mueller, and C. Gottschalk, \"Effects of acute unilateral renal denervation in the rat,\" Journal of Clinical Investigation, vol. 56, p. 208, 1975. </td>
        </tr>
        <tr>
                <td>[Bengis1979]</td>
                <td>R. Bengis and T. Coleman, \"Antihypertensive effect of prolonged blockade of angiotensin formation in benign and malignant, one-and two-kidney Goldblatt hypertensive rats,\" Clin Sci, vol. 57, pp. 53-62, 1979. </td>
        </tr>
        <tr>
                <td>[Bennett1993]</td>
                <td>F. M. Bennett and W. E. Fordyce, \"Regulation of PaCO2 during rest and exercise: a modeling study,\" Ann Biomed Eng, vol. 21, pp. 545-55, Sep-Oct 1993. </td>
        </tr>
        <tr>
                <td>[Benzinger1969]</td>
                <td>T. H. Benzinger, \"Heat regulation: homeostasis of central temperature in man,\" Physiological Reviews, vol. 49, pp. 671-759, 1969. </td>
        </tr>
        <tr>
                <td>[Berde1968]</td>
                <td>B. Berde and R. Boissonnas, Basic pharmacological properties of synthetic analogues and homologues of the neurohypophysial hormones: Springer, 1968. </td>
        </tr>
        <tr>
                <td>[Berg1997]</td>
                <td>B. R. Berg, K. D. Cohen, and I. H. Sarelius, \"Direct coupling between blood flow and metabolism at the capillary level in striated muscle,\" American Journal of Physiology-Heart and Circulatory Physiology, vol. 41, p. H2693, 1997. </td>
        </tr>
        <tr>
                <td>[Berkenbosch1979]</td>
                <td>A. Berkenbosch, J. Van Dissel, C. N. Olievier, J. De Goede, and J. Heeringa, \"The contribution of the peripheral chemoreceptors to the ventilatory response to CO2 in anaesthetized cats during hyperoxia,\" Respiration Physiology, vol. 37, pp. 381-390, 8// 1979. </td>
        </tr>
        <tr>
                <td>[Bevegärd1962]</td>
                <td>S. Bevegärd and A. Lodin, \"Postural Circulatory Changes at Rest and during Exercise in five Patients with Congenital Absence of Valves in the Deep Veins of the Legs,\" Acta Medica Scandinavica, vol. 172, pp. 21-29, 1962. </td>
        </tr>
        <tr>
                <td>[Biscoe1970]</td>
                <td>T. J. Biscoe, M. J. Purves, and S. R. Sampson, \"The frequency of nerve impulses in single carotid body chemoreceptor afferent fibres recorded in vivo with intact circulation,\" The Journal of Physiology, vol. 208, pp. 121-131, May 1, 1970 1970. </td>
        </tr>
        <tr>
                <td>[Black1971]</td>
                <td>A. M. Black, D. I. McCloskey, and R. W. Torrance, \"The responses of carotid body chemoreceptors in the cat to sudden changes of hypercapnic and hypoxic stimuli,\" Respir Physiol, vol. 13, pp. 36-49, Oct 1971. </td>
        </tr>
        <tr>
                <td>[Blackard1970]</td>
                <td>W. G. Blackard and N. C. Nelson, \"Portal and Peripheral Vein Immunoreactive Insulin Concentrations Before and After Glucose Infusion,\" Diabetes, vol. 19, pp. 302-306, May 1, 1970 1970. </td>
        </tr>
        <tr>
                <td>[Blackard1974]</td>
                <td>W. G. Blackard, N. C. Nelson, and S. S. Andrews, \"Portal and Peripheral Vein Immunoreactive Glucagon Concentrations After Arginine or Glucose Infusions,\" Diabetes, vol. 23, pp. 199-202, March 1, 1974 1974. </td>
        </tr>
        <tr>
                <td>[Blatteis1997]</td>
                <td>C. M. Blatteis and E. Sehic, \"Fever: how may circulating pyrogens signal the brain?,\" News in Physiological Sciences, vol. 12, pp. 1-8, 1997. </td>
        </tr>
        <tr>
                <td>[Block1952]</td>
                <td>M. A. Block, K. G. Wakim, and F. C. Mann, \"Renal function during stimulation of renal nerves,\" Am J Physiol, vol. 169, pp. 670-677, 1952. </td>
        </tr>
        <tr>
                <td>[Bock1930]</td>
                <td>A. V. Bock, D. B. Dill, and H. T. Edwards, \"ON THE RELATION OF CHANGES IN BLOOD VELOCITY AND VOLUME FLOW OF BLOOD TO CHANGE OF POSTURE,\" The Journal of Clinical Investigation, vol. 8, pp. 533-544, 1930. </td>
        </tr>
        <tr>
                <td>[Bonvalet1990]</td>
                <td>J. Bonvalet, \"Aldosterone-sensitive cells in the kidney: new insights,\" News Physiol Sci, vol. 6, pp. 201-205, 1990. </td>
        </tr>
        <tr>
                <td>[Bootsma1994]</td>
                <td>M. Bootsma, C. A. Swenne, H. H. Van Bolhuis, P. C. Chang, V. M. Cats, and A. Bruschke, \"Heart rate and heart rate variability as indexes of sympathovagal balance,\" American Journal of Physiology, vol. 266, pp. H1565-H1565, 1994. </td>
        </tr>
        <tr>
                <td>[Borgdorff1990]</td>
                <td>P. Borgdorff, D. R. Gross, R. Burattini, P. Duijst, and N. Westerhof, \"Short-term systemic autoregulation,\" Am J Physiol Heart Circ Physiol, vol. 258, pp. H1097-H1102, 1990. </td>
        </tr>
        <tr>
                <td>[Borgström1975]</td>
                <td>L. Borgström, H. Jóhannsson, and B. K. Siesjö, \"The Relationship between Arterial PO2 and Cerebral Blood Flow in Hypoxic Hypoxia,\" Acta Physiologica Scandinavica, vol. 93, pp. 423-432, 1975. </td>
        </tr>
        <tr>
                <td>[Braam1993]</td>
                <td>B. Braam, K. D. Mitchell, H. A. Koomans, and L. G. Navar, \"Relevance of the tubuloglomerular feedback mechanism in pathophysiology,\" Journal of the American Society of Nephrology, vol. 4, pp. 1257-1274, 1993. </td>
        </tr>
        <tr>
                <td>[BRADLEY1952]</td>
                <td>S. E. BRADLEY, F. J. INGELFINGER, and G. P. BRADLEY, \"Hepatic Circulation in Cirrhosis of the Liver,\" Circulation, vol. 5, pp. 419-429, March 1, 1952 1952. </td>
        </tr>
        <tr>
                <td>[Bradley2000]</td>
                <td>R. L. Bradley, K. A. Cleveland, and B. Cheatham, \"The adipocyte as a secretory organ: mechanisms of vesicle transport and secretory pathways,\" Recent progress in hormone research, vol. 56, pp. 329-358, 2000. </td>
        </tr>
        <tr>
                <td>[Bradley1953]</td>
                <td>S. E. Bradley, P. A. Marks, P. C. Reynell, and J. Meltzer, \"The circulating splanchnic blood volume in dog and man,\" Trans Assoc Am Physicians, vol. 66, pp. 294-302, 1953. </td>
        </tr>
        <tr>
                <td>[Braunwald1976]</td>
                <td>E. Braunwald, J. Ross, and E. H. Sonnenblick, Mechanisms of contraction of the normal and failing heart: Little, Brown Boston, 1976. </td>
        </tr>
        <tr>
                <td>[Braunwald1961]</td>
                <td>E. Braunwald, R. D. Bloodwell, L. I. Goldberg, and A. G. Morrow, \"STUDIES ON DIGITALIS. IV. OBSERVATIONS IN MAN ON THE EFFECTS OF DIGITALIS PREPARATIONS ON THE CONTRACTILITY OF THE NON-FAILING HEART AND ON TOTAL VASCULAR RESISTANCE,\" The Journal of Clinical Investigation, vol. 40, pp. 52-59, 1961. </td>
        </tr>
        <tr>
                <td>[Brebbia1957]</td>
                <td>D. R. Brebbia, R. F. Goldman, and E. R. Buskirk, Water Vapor Loss From the Respiratory Tract During Outdoor Exercise in the Cold vol. 11, 1957. </td>
        </tr>
        <tr>
                <td>[Brenner1977]</td>
                <td>B. M. Brenner and H. D. Humes, \"Mechanics of Glomerular Ultrafiltration,\" New England Journal of Medicine, vol. 297, pp. 148-154, 1977. </td>
        </tr>
        <tr>
                <td>[Brenner1977]</td>
                <td>B. M. Brenner and H. D. Humes, \"Mechanics of glomerular ultrafiltration,\" N Engl J Med, vol. 297, pp. 148-54, Jul 21 1977. </td>
        </tr>
        <tr>
                <td>[Breslow1993]</td>
                <td>M. J. Breslow, J. R. Tobin, D. S. Bredt, C. D. Ferris, S. H. Snyder, and R. J. Traystman, Nitric oxide as a regulator of adrenal blood flow vol. 264, 1993. </td>
        </tr>
        <tr>
                <td>[Brezis1995]</td>
                <td>M. Brezis and S. Rosen, \"Hypoxia of the Renal Medulla — Its Implications for Disease,\" New England Journal of Medicine, vol. 332, pp. 647-655, 1995. </td>
        </tr>
        <tr>
                <td>[Briscoe1958]</td>
                <td>W. A. Briscoe and A. B. Dubois, \"The Relationship Between Airway Resistance, Airway Conductance and Lung Volume in Subjects of Different Age and Body Size12,\" The Journal of Clinical Investigation, vol. 37, pp. 1279-1285, 1958. </td>
        </tr>
        <tr>
                <td>[Brown1982]</td>
                <td>M. J. Brown, F. J. M. Lhoste, C. Zamboulis, P. W. Ind, D. A. Jenner, and C. T. Dollery, \"Estimation of sympathetic activity in essential hypertension,\" Clin. Pharm. Ther., vol. 31, pp. 16-22, 01//print 1982. </td>
        </tr>
        <tr>
                <td>[Brugard2009]</td>
                <td>J. Brugard, D. Hedberg, M. Cascante, G. Cedersund, A. Gómez-Garrido, D. Maier, et al., \"Creating a Bridge between Modelica and the Systems Biology Community,\" in 7th International Modelica Conference, Como, Italy, 2009. </td>
        </tr>
        <tr>
                <td>[Brugard2009]</td>
                <td>J. Brugard, D. Hedberg, M. Cascante, G. Cedersund, A. Gómez-Garrido, D. Maier, et al., \"Creating a Bridge between Modelica and the Systems Biology Community,\" in 7th International Modelica Conference, Como, Italy, 2009. </td>
        </tr>
        <tr>
                <td>[BRUNNER1979]</td>
                <td>H. R. BRUNNER, H. GAVRAS, B. WAEBER, G. R. KERSHAW, G. A. TURINI, R. A. VUKOVICH, et al., \"Oral angiotensin-converting enzyme inhibitor in long-term treatment of hypertensive patients,\" Annals of internal medicine, vol. 90, pp. 19-23, 1979. </td>
        </tr>
        <tr>
                <td>[Bruun1990]</td>
                <td>N. Bruun, P. Skott, N. M. Damkjaer, S. Rasmussen, H. Schütten, A. Leth, et al., \"Normal renal tubular response to changes of sodium intake in hypertensive man,\" Journal of hypertension, vol. 8, pp. 219-227, 1990. </td>
        </tr>
        <tr>
                <td>[Buckey1988]</td>
                <td>J. C. Buckey, R. M. Peshock, and C. G. Blomqvist, \"Deep venous contribution to hydrostatic blood volume change in the human leg,\" Am J Cardiol, vol. 62, pp. 449-53, Sep 1 1988. </td>
        </tr>
        <tr>
                <td>[Burattini1994]</td>
                <td>R. Burattini, P. Borgdorff, and N. Westerhof, \"Relationship between strength of short-term systemic autoregulation and initial resistance,\" American Journal of Physiology-Regulatory Integrative and Comparative Physiology, vol. 36, p. R1182, 1994. </td>
        </tr>
        <tr>
                <td>[Burton1935]</td>
                <td>A. C. Burton, \"Human Calorimetry II. The Average Temperature of the Tissues of the BodyThree Figures,\" The Journal of Nutrition, vol. 9, pp. 261-280, 1935. </td>
        </tr>
        <tr>
                <td>[Bushinsky1982]</td>
                <td>D. A. Bushinsky, F. L. Coe, C. Katzenberg, J. P. Szidon, and J. H. Parks, \"Arterial Pco2 in chronic metabolic acidosis,\" Kidney Int, vol. 22, pp. 311-314, 09//print 1982. </td>
        </tr>
        <tr>
                <td>[Butler1960]</td>
                <td>J. Butler, C. G. Caro, R. Alcala, and A. B. DuBois, \"PHYSIOLOGICAL FACTORS AFFECTING AIRWAY RESISTANCE IN NORMAL SUBJECTS AND IN PATIENTS WITH OBSTRUCTIVE RESPIRATORY DISEASE*,\" The Journal of Clinical Investigation, vol. 39, pp. 584-591, 1960. </td>
        </tr>
        <tr>
                <td>[Cahan1990]</td>
                <td>C. Cahan, P. Hoekje, E. Goldwasser, M. Decker, and K. Strohl, \"Assessing the characteristic between length of hypoxic exposure and serum erythropoietin levels,\" Am. J. Physiol, vol. 258, pp. R1016-R1021, 1990. </td>
        </tr>
        <tr>
                <td>[Cahill1970]</td>
                <td>G. F. Cahill, \"Starvation in Man,\" New England Journal of Medicine, vol. 282, pp. 668-675, 1970. </td>
        </tr>
        <tr>
                <td>[Cahill1981]</td>
                <td>G. F. Cahill, Jr., \"Ketosis,\" Kidney Int, vol. 20, pp. 416-425, 09//print 1981. </td>
        </tr>
        <tr>
                <td>[Carlson1954]</td>
                <td>L. D. Carlson, \"The Adequate Stimulus for Shivering,\" Experimental Biology and Medicine, vol. 85, pp. 303-305, February 1, 1954 1954. </td>
        </tr>
        <tr>
                <td>[Carlson1971]</td>
                <td>L. Carlson, L. Ekelund, and S. Fröberg, \"Concentration of triglycerides, phospholipids and glycogen in skeletal muscle and of free fatty acids and beta-hydroxybutyric acid in blood in man in response to exercise,\" European journal of clinical investigation, vol. 1, pp. 248-254, 1971. </td>
        </tr>
        <tr>
                <td>[Carter1998]</td>
                <td>Y. M. Carter, C. X. Jia, P. F. Soto, J. P. Starr, D. G. Rabkin, D. T. Hsu, et al., \"Diastolic properties, myocardial water content, and histologic condition of the rat left ventricle: effect of varied osmolarity of a coronary perfusate,\" The Journal of heart and lung transplantation : the official publication of the International Society for Heart Transplantation, vol. 17, pp. 140-149, 1998/02// 1998. </td>
        </tr>
        <tr>
                <td>[Case1977]</td>
                <td>D. B. Case, J. M. Wallace, H. J. Keim, M. A. Weber, J. E. Sealey, and J. H. Laragh, \"Possible role of renin in hypertension as suggested by renin-sodium profiling and inhibition of converting enzyme,\" New England Journal of Medicine, vol. 296, pp. 641-646, 1977. </td>
        </tr>
        <tr>
                <td>[Cellier2005]</td>
                <td>F. E. Cellier and A. Nebot, \"Object-oriented Modeling in the Service of Medicine,\" in Proc. 6th Asia Simulation Conference, 2005, pp. 33-40. </td>
        </tr>
        <tr>
                <td>[LLC2012]</td>
                <td>L. b. U. o. M. M. Center, \"HumMod,\" p. http://hummod.org/, 2012. </td>
        </tr>
        <tr>
                <td>[Clutter1980]</td>
                <td>W. E. Clutter, D. M. Bier, S. D. Shah, and P. E. Cryer, \"Epinephrine plasma metabolic clearance rates and physiologic thresholds for metabolic and hemodynamic actions in man,\" Journal of Clinical Investigation, vol. 66, p. 94, 1980. </td>
        </tr>
        <tr>
                <td>[Clutter1980]</td>
                <td>W. E. Clutter, D. M. Bier, S. D. Shah, and P. E. Cryer, \"Epinephrine plasma metabolic clearance rates and physiologic thresholds for metabolic and hemodynamic actions in man,\" The Journal of Clinical Investigation, vol. 66, pp. 94-101, 1980. </td>
        </tr>
        <tr>
                <td>[Clutter1980]</td>
                <td>W. E. Clutter, D. M. Bier, S. D. Shah, and P. E. Cryer, \"Epinephrine plasma metabolic clearance rates and physiologic thresholds for metabolic and hemodynamic actions in man,\" The Journal of Clinical Investigation, vol. 66, pp. 94-101, 1980. </td>
        </tr>
        <tr>
                <td>[Cogan1979]</td>
                <td>M. G. Cogan, D. A. Maddox, M. S. Lucci, F. C. Rector Jr, M. R. Mueller, and K. R. Wong, \"Control of proximal bicarbonate reabsorption in normal and acidotic rats,\" Journal of Clinical Investigation, vol. 64, p. 1168, 1979. </td>
        </tr>
        <tr>
                <td>[Cogan1979]</td>
                <td>M. G. Cogan, D. A. Maddox, M. S. Lucci, F. C. Rector Jr, M. R. Mueller, and K. R. Wong, \"Control of proximal bicarbonate reabsorption in normal and acidotic rats,\" Journal of Clinical Investigation, vol. 64, p. 1168, 1979. </td>
        </tr>
        <tr>
                <td>[Coleman1973]</td>
                <td>D. L. Coleman, \"Effects of parabiosis of obese with diabetes and normal mice,\" Diabetologia, vol. 9, pp. 294-298, 1973/08/01 1973. </td>
        </tr>
        <tr>
                <td>[Coleman1983]</td>
                <td>T. G. Coleman and J. E. Randall, \"A Comprehensive Physiological Model,\" The Physiologist, vol. 26, 1983. </td>
        </tr>
        <tr>
                <td>[Coleman1972]</td>
                <td>T. G. Coleman, R. D. Manning, Jr., R. A. Norman, Jr., and A. C. Guyton, \"Dynamics of water-isotope distribution,\" Am J Physiol, vol. 223, pp. 1371-5, Dec 1972. </td>
        </tr>
        <tr>
                <td>[Collins-Nakai1994]</td>
                <td>R. L. Collins-Nakai, D. Noseworthy, and G. D. Lopaschuk, \"Epinephrine increases ATP production in hearts by preferentially increasing glucose metabolism,\" Am J Physiol, vol. 267, pp. H1862-71, Nov 1994. </td>
        </tr>
        <tr>
                <td>[Conci2001]</td>
                <td>F. Conci, M. Di Rienzo, and P. Castiglioni, \"Blood pressure and heart rate variability and baroreflex sensitivity before and after brain death,\" Journal of Neurology, Neurosurgery & Psychiatry, vol. 71, pp. 621-631, 2001. </td>
        </tr>
        <tr>
                <td>[Considine1996]</td>
                <td>R. V. Considine, M. K. Sinha, M. L. Heiman, A. Kriauciunas, T. W. Stephens, M. R. Nyce, et al., \"Serum Immunoreactive-Leptin Concentrations in Normal-Weight and Obese Humans,\" New England Journal of Medicine, vol. 334, pp. 292-295, 1996. </td>
        </tr>
        <tr>
                <td>[Consolazio1961]</td>
                <td>C. F. Consolazio, R. Shapiro, J. E. Masterson, and P. S. McKinzie, \"Energy requirements of men in extreme heat,\" The Journal of Nutrition, vol. 73, pp. 126-134, 1961. </td>
        </tr>
        <tr>
                <td>[Consolazio1963]</td>
                <td>C. F. Consolazio, L. O. Matoush, R. A. Nelson, J. B. Torres, and G. J. Isaac, \"Environmental temperature and energy expenditures,\" J Appl Physiol, vol. 18, pp. 65-68, 1963. </td>
        </tr>
        <tr>
                <td>[Conte1992]</td>
                <td>G. Conte, G. Romano, V. Sepe, L. De Nicola, M. Sabbatini, D. Russo, et al., \"Role of inhibition of atrial natriuretic factor release in the down-regulation of salt excretion,\" Kidney Int, vol. 42, pp. 673-680, 1992. </td>
        </tr>
        <tr>
                <td>[Cortney1966]</td>
                <td>M. Cortney, W. Nagel, and K. Thurau, \"A micropuncture study of the relationship between flow-rate through the loop of Henle and sodium concentration in the early distal tubule,\" Pflüger's Archiv für die gesamte Physiologie des Menschen und der Tiere, vol. 287, pp. 286-295, 1966/09/01 1966. </td>
        </tr>
        <tr>
                <td>[Cota2006]</td>
                <td>D. Cota, K. Proulx, K. A. B. Smith, S. C. Kozma, G. Thomas, S. C. Woods, et al., \"Hypothalamic mTOR Signaling Regulates Food Intake,\" Science, vol. 312, pp. 927-930, May 12, 2006 2006. </td>
        </tr>
        <tr>
                <td>[Cox1978]</td>
                <td>M. Cox, R. H. Sterns, and I. Singer, \"The Defense against Hyperkalemia: The Roles of Insulin and Aldosterone,\" New England Journal of Medicine, vol. 299, pp. 525-532, 1978. </td>
        </tr>
        <tr>
                <td>[Cryer1993]</td>
                <td>P. E. Cryer, Glucose counterregulation: prevention and correction of hypoglycemia in humans vol. 264, 1993. </td>
        </tr>
        <tr>
                <td>[Cumin1996]</td>
                <td>F. Cumin, H. P. Baum, and N. Levens, \"Leptin is cleared from the circulation primarily by the kidney,\" International journal of obesity and related metabolic disorders : journal of the International Association for the Study of Obesity, vol. 20, pp. 1120-1126, 1996/12// 1996. </td>
        </tr>
        <tr>
                <td>[Dash1975]</td>
                <td>S. Dash, K. Chugh, R. Nath, and P. Wahi, \"Effect of rapid lowering of blood pressure on renal function in hypertensives with renal failure,\" The Indian journal of medical research, vol. 63, pp. 902-909, 1975. </td>
        </tr>
        <tr>
                <td>[Davidson1986]</td>
                <td>D. Davidson, S. A. Stalcup, and R. B. Mellins, Systemic hemodynamics affecting cardiac output during hypocapnic and hypercapnic hypoxia vol. 60, 1986. </td>
        </tr>
        <tr>
                <td>[de1992]</td>
                <td>D. de Zeeuw, W. M. Janssen, and P. E. de Jong, \"Atrial natriuretic factor: its (patho) physiological significance in humans,\" Kidney Int, vol. 41, pp. 1115-33, 1992. </td>
        </tr>
        <tr>
                <td>[DeFronzo1980]</td>
                <td>R. A. DeFronzo, P. Felig, E. Ferrannini, and J. Wahren, \"Effect of graded doses of in"
           + "sulin on splanchnic and peripheral potassium metabolism in man,\" Am J Physiol, vol. 238, pp. E421-7, 1980. </td>
        </tr>
        <tr>
                <td>[Defronzo1978]</td>
                <td>R. A. Defronzo, R. S. Sherwin, M. Dillingham, R. Hendler, W. V. Tamborlane, and P. Felig, \"Influence of basal insulin and glucagon secretion on potassium and sodium metabolism: studies with somatostatin in normal dogs and in normal and diabetic human beings,\" Journal of Clinical Investigation, vol. 61, p. 472, 1978. </td>
        </tr>
        <tr>
                <td>[Degroot1977]</td>
                <td>L. J. Degroot and H. Niepomniszcze, \"Biosynthesis of thyroid hormone: basic and clinical aspects,\" Metabolism, vol. 26, pp. 665-718, 1977. </td>
        </tr>
        <tr>
                <td>[Deheneffe1976]</td>
                <td>J. Deheneffe, V. Cuesta, J. Briggs, J. Brown, R. Fraser, A. Lever, et al., \"Response of aldosterone and blood pressure to angiotensin II infusion in anephric man. Effect of sodium deprivation,\" Circulation research, vol. 39, pp. 183-190, 1976. </td>
        </tr>
        <tr>
                <td>[Devaux1968]</td>
                <td>C. Devaux, J. Menard, J.-M. Alexandre, J.-M. Idatte, P. Meyer, and P. Milliez, \"Variations in renin and its substrate after binephrectomy,\" The Lancet, vol. 291, p. 300, 1968. </td>
        </tr>
        <tr>
                <td>[DiBona1997]</td>
                <td>G. F. DiBona and U. C. Kopp, Neural control of renal function vol. 77, 1997. </td>
        </tr>
        <tr>
                <td>[Dighe2004]</td>
                <td>A. S. Dighe, F. J. Hayes, J. Khosravi, U. Bodani, and P. M. Sluss, \"Comparison of Inhibin A Immunoassays: Recommendation for Adoption of Standardized Reporting,\" Clinical Chemistry, vol. 50, pp. 767-769, April 1, 2004 2004. </td>
        </tr>
        <tr>
                <td>[Dill1941]</td>
                <td>D. B. Dill and W. H. Forbes, RESPIRATORY AND METABOLIC EFFECTS OF HYPOTHERMIA vol. 132, 1941. </td>
        </tr>
        <tr>
                <td>[Dimri1980]</td>
                <td>G. Dimri, M. Malhotra, J. S. Gupta, T. S. Kumar, and B. Arora, \"Alterations in aerobic-anaerobic proportions of metabolism during work in heat,\" European journal of applied physiology and occupational physiology, vol. 45, pp. 43-50, 1980. </td>
        </tr>
        <tr>
                <td>[Dobson1967]</td>
                <td>H. L. Dobson, L. Robbins, P. C. Johnson, J. Mdalel, D. D. Odem, G. Cornwall, et al., \"Absorption of 131-I labeled modified insulin,\" Metabolism, vol. 16, pp. 723-732, 8// 1967. </td>
        </tr>
        <tr>
                <td>[Dodt1952]</td>
                <td>E. Dodt and Y. Zotterman, \"Mode of action of warm receptors,\" Acta physiologica scandinavica, vol. 26, pp. 345-357, 1952. </td>
        </tr>
        <tr>
                <td>[DOEDEN1987]</td>
                <td>B. DOEDEN and R. RIZZA, \"Use of a Variable Insulin Infusion to Assess Insulin Action in Obesity: Defects in Both the Kinetics and Amplitude of Response,\" The Journal of Clinical Endocrinology & Metabolism, vol. 64, pp. 902-908, 1987. </td>
        </tr>
        <tr>
                <td>[Donnan1911]</td>
                <td>F. G. Donnan, \"Theorie der Membrangleichgewichte und Membranpotentiale bei Vorhandensein von nicht dialysierenden Elektrolyten. Ein Beitrag zur physikalisch-chemischen Physiologie,\" Zeitschrift für Elektrochemie und angewandte physikalische Chemie, vol. 17, pp. 572-581, 1911. </td>
        </tr>
        <tr>
                <td>[Drake2002]</td>
                <td>R. E. Drake and M. F. Doursout, Pulmonary Edema and Elevated Left Atrial Pressure: Four Hours and Beyond vol. 17, 2002. </td>
        </tr>
        <tr>
                <td>[DREES1974]</td>
                <td>J. A. DREES and C. F. Rothe, \"Reflex venoconstriction and capacity vessel pressure-volume relationships in dogs,\" Circulation research, vol. 34, pp. 360-373, 1974. </td>
        </tr>
        <tr>
                <td>[Drenick1972]</td>
                <td>E. J. Drenick, L. C. Alvarez, G. C. Tamasi, and A. S. Brickman, \"Resistance to Symptomatic Insulin Reactions after Fasting,\" The Journal of Clinical Investigation, vol. 51, pp. 2757-2762, 1972. </td>
        </tr>
        <tr>
                <td>[Drummond2008]</td>
                <td>H. A. Drummond, S. C. Grifoni, and N. L. Jernigan, \"A new trick for an old dogma: ENaC proteins as mechanotransducers in vascular smooth muscle,\" Physiology, vol. 23, pp. 23-31, 2008. </td>
        </tr>
        <tr>
                <td>[Drury1927]</td>
                <td>A. Drury and N. Jones, \"Observations upon the rate at which oedema forms when the veins of the human limb are congested,\" Heart, vol. 14, p. 8, 1927. </td>
        </tr>
        <tr>
                <td>[Drury1927]</td>
                <td>A. Drury and N. Jones, \"Observations upon the rate at which oedema forms when the veins of the human limb are congested,\" Heart, vol. 14, p. 8, 1927. </td>
        </tr>
        <tr>
                <td>[Duffin1972]</td>
                <td>J. Duffin, \"A mathematical model of the chemoreflex control of ventilation,\" Respiration Physiology, vol. 15, pp. 277-301, 7// 1972. </td>
        </tr>
        <tr>
                <td>[Duffin2000]</td>
                <td>J. Duffin, R. M. Mohan, P. Vasiliou, R. Stephenson, and S. Mahamed, \"A model of the chemoreflex control of breathing in humans: model parameters measurement,\" Respiration Physiology, vol. 120, pp. 13-26, 3// 2000. </td>
        </tr>
        <tr>
                <td>[Dunbar2001]</td>
                <td>S. L. Dunbar, L. Tamhidi, D. E. Berkowitz, and A. A. Shoukas, Hindlimb unweighting affects rat vascular capacitance function vol. 281, 2001. </td>
        </tr>
        <tr>
                <td>[Dunnill1973]</td>
                <td>M. S. Dunnill and W. Halley, \"Some observations on the quantitative anatomy of the kidney,\" The Journal of Pathology, vol. 110, pp. 113-121, 1973. </td>
        </tr>
        <tr>
                <td>[Dyckner1978]</td>
                <td>T. Dyckner and P. O. Wester, \"Ventricular Extrasystoles and Intracellular Electrolytes in Hypokalemic Patients before and after Correction of the Hypokalemia,\" Acta Medica Scandinavica, vol. 204, pp. 375-379, 1978. </td>
        </tr>
        <tr>
                <td>[Ebeling1994]</td>
                <td>P. Ebeling and V. A. Koivisto, \"Non-esterified fatty acids regulate lipid and glucose oxidation and glycogen synthesis in healthy man,\" Diabetologia, vol. 37, pp. 202-209, 1994/02/01 1994. </td>
        </tr>
        <tr>
                <td>[Eckardt1989]</td>
                <td>K. U. Eckardt, A. Kurtz, and C. Bauer, \"Regulation of erythropoietin production is related to proximal tubular function,\" The American journal of physiology. Renal physiology, vol. 256, pp. F942-F947, 1989. </td>
        </tr>
        <tr>
                <td>[Eckardt1990]</td>
                <td>K. U. Eckardt, A. Kurtz, and C. Bauer, \"Triggering of erythropoietin production by hypoxia is inhibited by respiratory and metabolic acidosis,\" The American journal of physiology : AJP. Regu Physiol, vol. 258, pp. R678-R683, 1990. </td>
        </tr>
        <tr>
                <td>[Edelman1974]</td>
                <td>I. S. Edelman, \"Thyroid Thermogenesis,\" New England Journal of Medicine, vol. 290, pp. 1303-1308, 1974. </td>
        </tr>
        <tr>
                <td>[ECHT1974]</td>
                <td>M. ECHT, J. DÜWELING, O. H. GAUER, and L. LANGE, \"Effective Compliance of the Total Vascular Bed and the Intrathoracic Compartment Derived from Changes in Central Venous Pressure Induced by Volume Changes in Man,\" Circulation Research, vol. 34, pp. 61-68, January 1, 1974 1974. </td>
        </tr>
        <tr>
                <td>[Eisenhoffer1994]</td>
                <td>J. Eisenhoffer, S. Lee, and M. Johnston, \"Pressure-flow relationships in isolated sheep prenodal lymphatic vessels,\" American Journal of Physiology-Heart and Circulatory Physiology, vol. 36, p. H938, 1994. </td>
        </tr>
        <tr>
                <td>[Elmqvist2003]</td>
                <td>H. Elmqvist, H. Tummescheit, and M. Otter, \"Object-oriented modeling of thermo-fluid systems,\" in 3rd International Modelica Conference, 2003, pp. 269-286. </td>
        </tr>
        <tr>
                <td>[Elsasser1980]</td>
                <td>V. Elsasser, R. Hesp, L. Klenerman, and R. Wootton, \"Deficit of trabecular and cortical bone in elderly women with fracture of the femoral neck,\" Clin Sci, vol. 59, pp. 393-395, 1980. </td>
        </tr>
        <tr>
                <td>[Engelson1999]</td>
                <td>V. Engelson, H. Larsson, and P. Fritzson, \"A design, simulation and visualization environment for object-oriented mechanical and multi-domain models in Modelica,\" in Information Visualization, 1999. Proceedings. 1999 IEEE International Conference on, 1999, pp. 188-193. </td>
        </tr>
        <tr>
                <td>[Engeset1973]</td>
                <td>A. Engeset, B. Hager, A. Nesheim, and A. Kolbenstvedt, \"Studies on human peripheral lymph. I. Sampling method,\" Lymphology, vol. 6, pp. 1-5, 1973. </td>
        </tr>
        <tr>
                <td>[Engeset1973]</td>
                <td>A. Engeset, B. Hager, A. Nesheim, and A. Kolbenstvedt, \"Studies on human peripheral lymph. I. Sampling method,\" Lymphology, vol. 6, pp. 1-5, 1973. </td>
        </tr>
        <tr>
                <td>[Epstein1999]</td>
                <td>Y. Epstein and L. E. Armstrong, \"Fluid-electrolyte balance during labor and exercise: concepts and misconceptions,\" International journal of sport nutrition, vol. 9, pp. 1-12, 1999. </td>
        </tr>
        <tr>
                <td>[Erslev]</td>
                <td>ErslevA. J. Erslev, \"Erythropoietin,\" Leukemia Research, vol. 14, pp. 683-688.</td>
        </tr>
        <tr>
                <td>[Erslev1985]</td>
                <td>A. J. Erslev, J. Caro, and A. Besarab, \"Why the Kidney?,\" Nephron, vol. 41, pp. 213-216, 1985. </td>
        </tr>
        <tr>
                <td>[Erslev1987]</td>
                <td>A. Erslev, J. Wilson, and J. Caro, \"Erythropoietin titers in anemic, nonuremic patients,\" J Lab Clin Med, vol. 109, pp. 429-433, 1987. </td>
        </tr>
        <tr>
                <td>[Erwald1978]</td>
                <td>R. Erwald and K. Wiechel, \"Effect of vasopressin on central and splanchnic hemodynamics in awake man,\" Acta chirurgica Scandinavica, vol. 144, p. 347, 1978. </td>
        </tr>
        <tr>
                <td>[Eschbach1987]</td>
                <td>J. W. Eschbach, J. C. Egrie, M. R. Downing, J. K. Browne, and J. W. Adamson, \"Correction of the Anemia of End-Stage Renal Disease with Recombinant Human Erythropoietin,\" New England Journal of Medicine, vol. 316, pp. 73-78, 1987. </td>
        </tr>
        <tr>
                <td>[Eschbach1989]</td>
                <td>J. W. Eschbach, M. R. Kelly, N. R. Haley, R. I. Abels, and J. W. Adamson, \"Treatment of the Anemia of Progressive Renal Failure with Recombinant Human Erythropoietin,\" New England Journal of Medicine, vol. 321, pp. 158-163, 1989. </td>
        </tr>
        <tr>
                <td>[Eyzaguirre1961]</td>
                <td>C. Eyzaguirre and J. Lewin, \"Chemoreceptor activity of the carotid body of the cat,\" The Journal of Physiology, vol. 159, pp. 222-237, December 1, 1961 1961. </td>
        </tr>
        <tr>
                <td>[Eyzaguirre1961]</td>
                <td>C. Eyzaguirre and J. Lewin, \"The effect of sympathetic stimulation on carotid nerve activity,\" The Journal of Physiology, vol. 159, pp. 251-267, December 1, 1961 1961. </td>
        </tr>
        <tr>
                <td>[Eyzaguirre1965]</td>
                <td>C. Eyzaguirre and H. Koyano, \"Effects of hypoxia, hypercapnia, and pH on the chemoreceptor activity of the carotid body in vitro,\" The Journal of Physiology, vol. 178, pp. 385-409, June 1, 1965 1965. </td>
        </tr>
        <tr>
                <td>[Fan1980]</td>
                <td>F. C. Fan, R. Y. Chen, G. B. Schuessler, and S. Chien, Effects of hematocrit variations on regional hemodynamics and oxygen transport in the dog vol. 238, 1980. </td>
        </tr>
        <tr>
                <td>[Farooqi2002]</td>
                <td>I. S. Farooqi, G. Matarese, G. M. Lord, J. M. Keogh, E. Lawrence, C. Agwu, et al., \"Beneficial effects of leptin on obesity, T cell hyporesponsiveness, and neuroendocrine/metabolic dysfunction of human congenital leptin deficiency,\" The Journal of Clinical Investigation, vol. 110, pp. 1093-1103, 2002. </td>
        </tr>
        <tr>
                <td>[Fatema2002]</td>
                <td>K. Fatema, O. Hirono, Y. Takeishi, J. Nitobe, K. Kaneko, M. Ito, et al., \"Hemodialysis improves myocardial interstitial edema and left ventricular diastolic function in patients with end-stage renal disease: noninvasive assessment by ultrasonic tissue characterization,\" Heart and vessels, vol. 16, pp. 227-231, 2002. </td>
        </tr>
        <tr>
                <td>[Felig1976]</td>
                <td>P. Felig, J. Wahren, R. Sherwin, and R. Hendler, \"The Lilly Lecture 1976: Insulin, Glucagon, and Somatostatin in Normal Physiology and Diabetes Mellitus,\" Diabetes, vol. 25, pp. 1091-1099, December 1, 1976 1976. </td>
        </tr>
        <tr>
                <td>[Felig1976]</td>
                <td>P. Felig, J. Wahren, R. Sherwin, and R. Hendler, \"The Lilly Lecture 1976: Insulin, Glucagon, and Somatostatin in Normal Physiology and Diabetes Mellitus,\" Diabetes, vol. 25, pp. 1091-1099, December 1, 1976 1976. </td>
        </tr>
        <tr>
                <td>[Fenner2008]</td>
                <td>J. W. Fenner, B. Brook, G. Clapworthy, P. Coveney, V. Feipel, H. Gregersen, et al., \"The EuroPhysiome, STEP and a roadmap for the virtual physiological human,\" Philosophical Transactions of the Royal Society A: Mathematical, Physical and Engineering Sciences, vol. 366, pp. 2979-2999, 2008. </td>
        </tr>
        <tr>
                <td>[Ferguson1985]</td>
                <td>D. W. Ferguson, F. M. Abboud, and A. L. Mark, \"Relative contribution of aortic and carotid baroreflexes to heart rate control in man during steady state and dynamic increases in arterial pressure,\" The Journal of Clinical Investigation, vol. 76, pp. 2265-2274, 1985. </td>
        </tr>
        <tr>
                <td>[Ferris1938]</td>
                <td>E. B. Ferris Jr, M. Blankenhorn, H. W. Robinson, and G. E. Cullen, \"Heat stroke: clinical and chemical observations on 44 cases,\" Journal of Clinical Investigation, vol. 17, p. 249, 1938. </td>
        </tr>
        <tr>
                <td>[Field1985]</td>
                <td>M. J. Field and G. J. Giebisch, \"Hormonal control of renal potassium excretion,\" Kidney Int, vol. 27, pp. 379-87, 1985. </td>
        </tr>
        <tr>
                <td>[Figge1991]</td>
                <td>J. Figge, T. H. Rossing, and V. Fencl, \"The role of serum proteins in acid-base equilibria,\" J Lab Clin Med, vol. 117, pp. 453-67, Jun 1991. </td>
        </tr>
        <tr>
                <td>[Findley1937]</td>
                <td>T. Findley, Jr. and H. L. White, \"THE RESPONSE OF NORMAL INDIVIDUALS AND PATIENTS WITH DIABETES INSIPIDUS TO THE INGESTION OF WATER 1,\" The Journal of Clinical Investigation, vol. 16, pp. 197-202, 1937. </td>
        </tr>
        <tr>
                <td>[Fink1975]</td>
                <td>W. J. Fink, D. L. Costill, and P. J. Van Handel, \"Leg muscle metabolism during exercise in the heat and cold,\" European Journal of Applied Physiology and Occupational Physiology, vol. 34, pp. 183-190, 1975/12/01 1975. </td>
        </tr>
        <tr>
                <td>[Fitzgerald1971]</td>
                <td>R. S. Fitzgerald and D. C. Parks, \"Effect of hypoxia on carotid chemoreceptor response to carbon dioxide in cats,\" Respir Physiol, vol. 12, pp. 218-29, Jun 1971. </td>
        </tr>
        <tr>
                <td>[Fitzgerald1971]</td>
                <td>R. S. Fitzgerald and D. C. Parks, \"Effect of hypoxia on carotid chemoreceptor response to carbon dioxide in cats,\" Respir Physiol, vol. 12, pp. 218-29, Jun 1971. </td>
        </tr>
        <tr>
                <td>[FitzGerald1981]</td>
                <td>G. A. FitzGerald, V. Hossmann, and C. T. Dollery, \"Norepinephrine release in essential hypertension,\" Clin. Pharm. Ther., vol. 30, pp. 164-171, 08//print 1981. </td>
        </tr>
        <tr>
                <td>[Fitzgerald1980]</td>
                <td>G. A. Fitzgerald, P. Barnes, C. A. Hamilton, and C. T. Dollery, \"Circulating adrenaline and blood pressure: the metabolic effects and kinetics of infused adrenaline in man,\" European Journal of Clinical Investigation, vol. 10, pp. 401-406, 1980. </td>
        </tr>
        <tr>
                <td>[Fitzgerald1980]</td>
                <td>G. A. Fitzgerald, P. Barnes, C. A. Hamilton, and C. T. Dollery, \"Circulating adrenaline and blood pressure: the metabolic effects and kinetics of infused adrenaline in man,\" European Journal of Clinical Investigation, vol. 10, pp. 401-406, 1980. </td>
        </tr>
        <tr>
                <td>[Flatt1972]</td>
                <td>J. P. Flatt, \"On the Maximal Possible Rate of Ketogenesis,\" Diabetes, vol. 21, pp. 50-53, January 1, 1972 1972. </td>
        </tr>
        <tr>
                <td>[Florez-Duquet1998]</td>
                <td>M. Florez-Duquet and R. B. McDonald, \"Cold-induced thermoregulation and biological aging,\" Physiol Rev, vol. 78, pp. 339-58, Apr 1998. </td>
        </tr>
        <tr>
                <td>[Folkers1969]</td>
                <td>K. Folkers, F. Enzmann, J. Boler, C. Y. Bowers, and A. V. Schally, \"Discovery of modification of the synthetic tripeptide-sequence of the thyrotropin releasing hormone having activity,\" Biochem Biophys Res Commun, vol. 37, pp. 123-6, Sep 24 1969. </td>
        </tr>
        <tr>
                <td>[Forbes1962]</td>
                <td>G. B. Forbes, \"Methods for determining composition of the human body with a note on the effect of diet on body composition,\" Pediatrics, vol. 29, pp. 477-494, 1962. </td>
        </tr>
        <tr>
                <td>[Forbes1956]</td>
                <td>G. B. Forbes and A. M. Lewis, \"Total sodium, potassium and chloride in adult man,\" Journal of Clinical Investigation, vol. 35, p. 596, 1956. </td>
        </tr>
        <tr>
                <td>[Forbes1963]</td>
                <td>G. B. Forbes and J. B. Hursh, \"AGE AND SEX TRENDS IN LEAN BODY MASS CALCULATED FROM K40 MEASUREMENTS: WITH A NOTE ON THE THEORETICAL BASIS FOR THE PROCEDURE*,\" Annals of the New York Academy of Sciences, vol. 110, pp. 255-263, 1963. </td>
        </tr>
        <tr>
                <td>[Forster1971]</td>
                <td>H. V. Forster, J. A. Dempsey, M. L. Birnbaum, W. G. Reddan, J. Thoden, R. F. Grover, et al., Effect of chronic exposure to hypoxia on ventilatory response to CO 2 and hypoxia vol. 31, 1971. </td>
        </tr>
        <tr>
                <td>[Franco-Morselli1977]</td>
                <td>R. Franco-Morselli, J. Elghozi, E. Joly, S. Di Giuilio, and P. Meyer, \"Increased plasma adrenaline concentrations in benign essential hypertension,\" British medical journal, vol. 2, p. 1251, 1977. </td>
        </tr>
        <tr>
                <td>[Frayn2002]</td>
                <td>K. Frayn, \"Adipose tissue as a buffer for daily lipid flux,\" Diabetologia, vol. 45, pp. 1201-1210, 2002. </td>
        </tr>
        <tr>
                <td>[Friedman-Einat2003]</td>
                <td>M. Friedman-Einat, L. Camoin, Z. Faltin, C. Rosenblum, V. Kaliouta, Y. Eshdat, et al., \"Serum leptin activity in obese and lean patients,\" Regulatory peptides, vol. 111, pp. 77-82, 2003. </td>
        </tr>
        <tr>
                <td>[Frisbee2000]</td>
                <td>J. C. Frisbee and J. H. Lombard, \"Increased Intravascular Pressure Does Not Enhance Skeletal Muscle Arteriolar Constriction to Oxygen or Angiotensin II,\" Microvascular Research, vol. 59, pp. 176-180, 1// 2000. </td>
        </tr>
        <tr>
                <td>[Frisbee2000]</td>
                <td>J. C. Frisbee and J. H. Lombard, \"Short-term angiotensin converting enzyme inhibition reduces basal tone and dilator reactivity in skeletal muscle arterioles*,\" American Journal of Hypertension, vol. 13, pp. 389-395, April 1, 2000 2000. </td>
        </tr>
        <tr>
                <td>[Fritzson1998]</td>
                <td>P. Fritzson and V. Engelson, \"Modelica—A unified object-oriented language for system modeling and simulation,\" in ECOOP’98—Object-Oriented Programming, ed: Springer, 1998, pp. 67-90. </td>
        </tr>
        <tr>
                <td>[Gaasch1975]</td>
                <td>W. H. Gaasch, J. S. Cole, M. A. Quinones, and J. Alexander, \"Dynamic determinants of letf ventricular diastolic pressure-volume relations in man,\" Circulation, vol. 51, pp. 317-323, 1975. </td>
        </tr>
        <tr>
                <td>[Ganong1958]</td>
                <td>W. F. Ganong and P. J. Mulrow, \"Rate of Change in Sodium and Potassium Excretion After Injection of Aldosterone Into the Aorta and Renal Artery of the Dog’,\" change, vol. 7, p. 90, 1958. </td>
        </tr>
        <tr>
                <td>[Garlick1970]</td>
                <td>D. Garlick and E. Renkin, Transport of large molecules from plasma to interstitial fluid and lymph in dogs vol. 219, 1970. </td>
        </tr>
        <tr>
                <td>[GAUER1956]</td>
                <td>O. H. GAUER, J. P. HENRY, and H. O. SIEKER, \"Changes in Central Venous Pressure after Moderate Hemorrhage and Transfusion in Man,\" Circulation Research, vol. 4, pp. 79-84, January 1, 1956 1956. </td>
        </tr>
        <tr>
                <td>[Gauss1917]</td>
                <td>H. Gauss and K. Meyer, \"HEAT STROKE: REPORT OF ONE HUNDRED AND FIFTY-EIGHT CASES FROM COOK COUNTY HOSPITAL, CHICAGO,\" The American Journal of the Medical Sciences, vol. 154, p. 554, 1917. </td>
        </tr>
        <tr>
                <td>[Gautron2011]</td>
                <td>L. Gautron and J. K. Elmquist, \"Sixteen years and counting: an update on leptin in energy balance,\" The Journal of Clinical Investigation, vol. 121, pp. 2087-2093, 2011. </td>
        </tr>
        <tr>
                <td>[Gekle1998]</td>
                <td>M. Gekle, Renal Proximal Tubular Albumin Reabsorption: Daily Prevention of Albuminuria vol. 13, 1998. </td>
        </tr>
        <tr>
                <td>[George2004]</td>
                <td>S. George, J. J. Rochford, C. Wolfrum, S. L. Gray, S. Schinner, J. C. Wilson, et al., \"A family with severe insulin resistance and diabetes due to a mutation in AKT2,\" Science, vol. 304, pp. 1325-1328, 2004. </td>
        </tr>
        <tr>
                <td>[Gephart1915]</td>
                <td>F. C. Gephart and E. F. DuBOIS, \"FOURTH PAPER THE DETERMINATION OF THE BASAL METABOLISM OF NORMAL MEN AND THE EFFECT OF FOOD,\" Archives of Internal Medicine, vol. 15, pp. 835-867, 1915. </td>
        </tr>
        <tr>
                <td>[Gerich1975]</td>
                <td>J. E. Gerich, M. Lorenzi, D. M. Bier, V. Schneider, E. Tsalikian, J. H. Karam, et al., \"Prevention of human diabetic ketoacidosis by somatostatin: evidence for an essential role of glucagon,\" New England Journal of Medicine, vol. 292, pp. 985-989, 1975. </td>
        </tr>
        <tr>
                <td>[Gerich1975]</td>
                <td>J. E. Gerich, M. Lorenzi, D. M. Bier, V. Schneider, E. Tsalikian, J. H. Karam, et al., \"Prevention of Human Diabetic Ketoacidosis by Somatostatin,\" New England Journal of Medicine, vol. 292, pp. 985-989, 1975. </td>
        </tr>
        <tr>
                <td>[Ghazanshahi1993]</td>
                <td>S. Ghazanshahi and M. K. Khoo, \"Optimal ventilatory patterns in periodic breathing,\" Annals of Biomedical Engineering, vol. 21, pp. 517-530, 1993/09/01 1993. </td>
        </tr>
        <tr>
                <td>[Gibbs1942]</td>
                <td>E. L. Gibbs, F. A. Gibbs, W. G. Lennox, and L. F. Nims, \"REgulation of cerebral carbon dioxide,\" Archives of Neurology & Psychiatry, vol. 47, pp. 879-889, 1942. </td>
        </tr>
        <tr>
                <td>[GINSBERG1973]</td>
                <td>S. GINSBERG, M. B. BLOCK, M. E. MAKO, and A. H. RUBENSTEIN, \"Serum Insulin Levels Following Administration of Exogenous Insulin,\" The Journal of Clinical Endocrinology & Metabolism, vol. 36, pp. 1175-1179, 1973. </td>
        </tr>
        <tr>
                <td>[Glickson1974]</td>
                <td>J. D. Glickson and C. Pissiotis, Vasopressin: Chemical and clinical aspects vol. 1: Ardent Media, 1974. </td>
        </tr>
        <tr>
                <td>[Gold1940]</td>
                <td>H. Gold and M. Cattell, \"MEchanism of digitalis action in abolishing heart failure,\" Archives of Internal Medicine, vol. 65, pp. 263-278, 1940. </td>
        </tr>
        <tr>
                <td>[Goldberg1994]</td>
                <td>M. A. Goldberg and T. J. Schneider, \"Similarities between the oxygen-sensing mechanisms regulating the expression of vascular endothelial growth factor and erythropoietin,\" Journal of Biological Chemistry, vol. 269, pp. 4355-9, February 11, 1994 1994. </td>
        </tr>
        <tr>
                <td>[Goldstein2003]</td>
                <td>D. S. Goldstein, G. Eisenhofer, and I. J. Kopin, \"Sources and Significance of Plasma Levels of Catechols and Their Metabolites in Humans,\" Journal of Pharmacology and Experimental Therapeutics, vol. 305, pp. 800-811, June 1, 2003 2003. </td>
        </tr>
        <tr>
                <td>[Goldstein1987]</td>
                <td>S. Goldstein, J. Askanazi, C. Weissman, B. Thomashow, and J. Kinney, \"Energy expenditure in patients with chronic obstructive pulmonary disease,\" CHEST Journal, vol. 91, pp. 222-224, 1987. </td>
        </tr>
        <tr>
                <td>[Good1984]</td>
                <td>D. W. Good, H. Velazquez, and F. S. Wright, \"Luminal influences on potassium secretion: low sodium concentration,\" Am J Physiol, vol. 246, p. 20, 1984. </td>
        </tr>
        <tr>
                <td>[Goodman1978]</td>
                <td>A. H. Goodman, R. Einstein, and H. J. Granger, \"Effect of changing metabolic rate on local blood flow control in the canine hindlimb,\" Circulation Research, vol. 43, pp. 769-76, November 1, 1978 1978. </td>
        </tr>
        <tr>
                <td>[Gottschalk1959]</td>
                <td>C. W. Gottschalk and M. Mylle, \"Micropuncture study of the mammalian urinary concentrating mechanism: evidence for the countercurrent hypothesis,\" American Journal of Physiology--Legacy Content, vol. 196, pp. 927-936, 1959. </td>
        </tr>
        <tr>
                <td>[Gottschalk1960]</td>
                <td>C. W. Gottschalk, W. E. Lassiter, and M. Mylle, Localization of urine acidification in the mammalian kidney vol. 198, 1960. </td>
        </tr>
        <tr>
                <td>[Granger1969]</td>
                <td>H. J. Granger and A. C. Guyton, \"Autoregulation of the Total Systemic Circulation Following Destruction of the Central Nervous System in the Dog,\" Circulation Research, vol. 25, pp. 379-388, October 1, 1969 1969. </td>
        </tr>
        <tr>
                <td>[Granger1983]</td>
                <td>D. N. Granger and H. J. Granger, \"Systems analysis of intestinal hemodynamics and oxygenation,\" Am J Physiol, vol. 245, pp. G786-G796, 1983. </td>
        </tr>
        <tr>
                <td>[Granger1976]</td>
                <td>H. J. Granger, A. H. Goodman, and D. N. Granger, \"Role of resistance and exchange vessels in local microvascular control of skeletal muscle oxygenation in the dog,\" Circulation Research, vol. 38, pp. 379-85, May 1, 1976 1976. </td>
        </tr>
        <tr>
                <td>[Granger1980]</td>
                <td>D. N. Granger, N. A. Mortillaro, P. R. Kvietys, G. Rutili, J. C. Parker, and A. E. Taylor, Role of the interstitial matrix during intestinal volume absorption vol. 238, 1980. </td>
        </tr>
        <tr>
                <td>[Greenway1973]</td>
                <td>C. Greenway and G. Oshiro, \"Effects of histamine on hepatic volume (outflow block) in anaesthetized dogs,\" British journal of pharmacology, vol. 47, pp. 282-290, 1973. </td>
        </tr>
        <tr>
                <td>[Greenway1974]</td>
                <td>C. V. Greenway and G. E. Lister, \"Capacitance effects and blood reservoir function in the splanchnic vascular bed during non-hypotensive haemorrhage and blood volume expansion in anaesthetized cats,\" The Journal of Physiology, vol. 237, pp. 279-294, March 1, 1974 1974. </td>
        </tr>
        <tr>
                <td>[Greenway1985]</td>
                <td>C. V. Greenway, K. L. Seaman, and I. R. Innes, Norepinephrine on venous compliance and unstressed volume in cat liver vol. 248, 1985. </td>
        </tr>
        <tr>
                <td>[Grimm1980]</td>
                <td>M. Grimm, P. Weidmann, G. Keusch, A. Meier, and Z. Glück, \"Norepinephrine clearance and pressor effect in normal and hypertensive man,\" Klinische Wochenschrift, vol. 58, pp. 1175-1181, 1980. </td>
        </tr>
        <tr>
                <td>[Gross1952]</td>
                <td>J. Gross and R. Pitt-Rivers, \"The identification of 3:5:3'-L-triiodothyronine in human plasma,\" Lancet, vol. 1, pp. 439-41, Mar 1 1952. </td>
        </tr>
        <tr>
                <td>[Gross1953]</td>
                <td>J. Gross and R. Pitt-Rivers, \"3: 5: 3'-Triiodothyronine. 1. Isolation from thyroid gland and synthesis,\" Biochemical Journal, vol. 53, p. 645, 1953. </td>
        </tr>
        <tr>
                <td>[Gross1953]</td>
                <td>J. Gross and R. Pitt-Rivers, \"3: 5: 3'-Triiodothyronine. 2. Physiological activity,\" Biochemical Journal, vol. 53, p. 652, 1953. </td>
        </tr>
        <tr>
                <td>[Guarente2009]</td>
                <td>L. Guarente, \"Hypoxic Hookup,\" Science, vol. 324, pp. 1281-1282, June 5, 2009 2009. </td>
        </tr>
        <tr>
                <td>[Guggino1989]</td>
                <td>W. B. Guggino and S. E. Guggino, \"Renal anion transport,\" Kidney Int, vol. 36, pp. 385-391, 09//print 1989. </td>
        </tr>
        <tr>
                <td>[Gullans1985]</td>
                <td>S. R. Gullans, M. J. Avison, T. Ogino, G. Giebisch, and R. G. Shulman, \"NMR measurements of intracellular sodium in the rabbit proximal tubule,\" Am. J. Physiol, vol. 249, pp. F160-F168, 1985. </td>
        </tr>
        <tr>
                <td>[Gutsche1980]</td>
                <td>H. U. Gutsche, R. Müller-Suur, U. Hegel, and K. Hierholzer, \"Electrical conductivity of tubular fluid of the rat nephron,\" Pflügers Archiv, vol. 383, pp. 113-121, 1980/01/01 1980. </td>
        </tr>
        <tr>
                <td>[Guyton1965]</td>
                <td>A. C. Guyton, \"Interstitial fluid pressure: II. Pressure-volume curves of interstitial space,\" Circulation research, vol. 16, pp. 452-460, 1965. </td>
        </tr>
        <tr>
                <td>[Guyton1961]</td>
                <td>A. C. Guyton and K. Sagawa, \"Compensations of cardiac output and other circulatory functions in areflex dogs with large AV fistulas,\" The American journal of physiology, vol. 200, p. 1157, 1961. </td>
        </tr>
        <tr>
                <td>[Guyton1972]</td>
                <td>A. C. Guyton, T. G. Coleman, and H. J. Granger, \"Circulation: overall regulation,\" Annual Review of Physiology, vol. 34, pp. 13-44, 1972. </td>
        </tr>
        <tr>
                <td>[Guyton1978]</td>
                <td>J. R. Guyton, R. O. Foster, J. S. Soeldner, M. H. Tan, C. B. Kahn, L. Koncz, et al., \"A Model of Glucose-insulin Homeostasis in Man that Incorporates the Heterogeneous Fast Pool Theory of Pancreatic Insulin Release,\" Diabetes, vol. 27, pp. 1027-1042, October 1, 1978 1978. </td>
        </tr>
        <tr>
                <td>[Hakkinen1995]</td>
                <td>J. P. Hakkinen, M. W. Miller, A. H. Smith, and D. R. Knight, \"Measurement of organ blood flow with coloured microspheres in the rat,\" Cardiovascular research, vol. 29, pp. 74-79, 1995. </td>
        </tr>
        <tr>
                <td>[Halaas1997]</td>
                <td>J. L. Halaas, C. Boozer, J. Blair-West, N. Fidahusein, D. A. Denton, and J. M. Friedman, \"Physiological response to long-term peripheral and central leptin infusion in lean and obese?mice,\" Proceedings of the National Academy of Sciences, vol. 94, pp. 8878-8883, August 5, 1997 1997. </td>
        </tr>
        <tr>
                <td>[Hall1986]</td>
                <td>J. E. Hall, \"Control of sodium excretion by angiotensin II: intrarenal mechanisms and blood pressure regulation,\" 1986. </td>
        </tr>
        <tr>
                <td>[Hall1983]</td>
                <td>J. E. Hall and J. P. Granger, Renal hemodynamic actions of angiotensin II: interaction with tubuloglomerular feedback vol. 245, 1983. </td>
        </tr>
        <tr>
                <td>[Hall1979]</td>
                <td>J. Hall, T. Coleman, A. Guyton, J. Balfe, and H. Salgado, \"Intrarenal role of angiotensin II and </td>
        </tr>
        <tr>
                <td>[des-Asp1]</td>
                <td>1977]        J. E. Hall, A. C. Guyton, N. C. Trippodo, T. E. Lohmeier, R. McCaa, and A. Cowley Jr, \"Intrarenal control of electrolyte excretion by angiotensin II,\" Am J Physiol, vol. 232, pp. F538-F544, 1977. </td>
        </tr>
        <tr>
                <td>[Hall1977]</td>
                <td>J. E. Hall, A. C. Guyton, T. E. Jackson, T. G. Coleman, T. E. Lohmeier, and N. C. Trippodo, \"Control of glomerular filtration rate by renin-angiotensin system,\" Am J Physiol, vol. 233, pp. F366-F372, 1977. </td>
        </tr>
        <tr>
                <td>[Halperin1989]</td>
                <td>M. L. Halperin and S. Cheema-Dhadli, \"Renal and hepatic aspects of ketoacidosis: A quantitative analysis based on energy turnover,\" Diabetes/Metabolism Reviews, vol. 5, pp. 321-336, 1989. </td>
        </tr>
        <tr>
                <td>[Hannaford1982]</td>
                <td>M. C. Hannaford, L. A. Leiter, R. G. Josse, M. B. Goldstein, E. B. Marliss, and M. L. Halperin, Protein wasting due to acidosis of prolonged fasting vol. 243, 1982. </td>
        </tr>
        <tr>
                <td>[HANNON1969]</td>
                <td>R. C. HANNON, R. P. DERUYCK, J. V. JOOSSENS, and A. K. AMERY, \"Disappearance rate of endogenous renin from the plasma after bilateral nephrectomy in humans,\" The Journal of Clinical Endocrinology & Metabolism, vol. 29, pp. 1420-1424, 1969. </td>
        </tr>
        <tr>
                <td>[Harder1996]</td>
                <td>D. R. Harder, J. Narayanan, E. K. Birks, J. F. Liard, J. D. Imig, J. H. Lombard, et al., \"Identification of a Putative Microvascular Oxygen Sensor,\" Circulation Research, vol. 79, pp. 54-61, July 1, 1996 1996. </td>
        </tr>
        <tr>
                <td>[Harder1996]</td>
                <td>D. R. Harder, J. Narayanan, E. K. Birks, J. F. Liard, J. D. Imig, J. H. Lombard, et al., \"Identification of a Putative Microvascular Oxygen Sensor,\" Circulation Research, vol. 79, pp. 54-61, July 1, 1996 1996. </td>
        </tr>
        <tr>
                <td>[Hardy1961]</td>
                <td>J. D. Har"
               + "dy, \"Physiology of temperature regulation,\" Physiol Rev, vol. 41, pp. 521-606, Jul 1961. </td>
        </tr>
        <tr>
                <td>[Hardy1938]</td>
                <td>J. D. Hardy and G. F. Soderstrom, \"Heat Loss from the Nude Body and Peripheral Blood Flow at Temperatures of 22°C. to 35°C.: Two Figures,\" The Journal of Nutrition, vol. 16, pp. 493-510, November 1, 1938 1938. </td>
        </tr>
        <tr>
                <td>[Harrison1938]</td>
                <td>H. E. Harrison and D. C. Darrow, \"The distribution of body water and electrolytes in adrenal insufficiency,\" Journal of Clinical Investigation, vol. 17, p. 77, 1938. </td>
        </tr>
        <tr>
                <td>[Harrop1923]</td>
                <td>G. A. Harrop and E. M. Benedict, \"The role of phosphate and potassium in carbohydrate metabolism following insulin administration,\" Experimental Biology and Medicine, vol. 20, pp. 430-431, May 1, 1923 1923. </td>
        </tr>
        <tr>
                <td>[HART1982]</td>
                <td>G. R. HART, R. J. ANDERSON, C. P. CRUMPLER, A. SHULKIN, G. REED, and J. P. KNOCHEL, \"Epidemic classical heat stroke: clinical characteristics and course of 28 patients,\" Medicine, vol. 61, p. 189, 1982. </td>
        </tr>
        <tr>
                <td>[Hatcher1978]</td>
                <td>J. D. Hatcher, L. K. Chiu, and D. B. Jennings, Anemia as a stimulus to aortic and carotid chemoreceptors in the cat vol. 44, 1978. </td>
        </tr>
        <tr>
                <td>[Havel2004]</td>
                <td>P. J. Havel, \"Update on adipocyte hormones regulation of energy balance and carbohydrate/lipid metabolism,\" Diabetes, vol. 53, pp. S143-S151, 2004. </td>
        </tr>
        <tr>
                <td>[HAYS1993]</td>
                <td>M. T. HAYS, \"Colonic excretion of iodide in normal human subjects,\" Thyroid, vol. 3, pp. 31-35, 1993. </td>
        </tr>
        <tr>
                <td>[Hayward1993]</td>
                <td>L. Hayward, M. Hay, and R. Felder, \"Acute resetting of the carotid sinus baroreflex by aortic depressor nerve stimulation,\" METHODS, vol. 10, p. 11, 1993. </td>
        </tr>
        <tr>
                <td>[Heller1932]</td>
                <td>H. Heller and F. H. Smirk, \"Studies concerning the alimentary absorption of water and tissue hydration in relation to diuresis,\" The Journal of Physiology, vol. 76, pp. 1-38, September 16, 1932 1932. </td>
        </tr>
        <tr>
                <td>[Hennessy1993]</td>
                <td>E. Hennessy, S. White, T. Van der Touw, A. Quail, W. Porges, and P. Glenfield, \"Control of resting bronchial hemodynamics in the awake dog,\" American Journal of Physiology, vol. 265, pp. H649-H649, 1993. </td>
        </tr>
        <tr>
                <td>[Henriksen1985]</td>
                <td>J. H. Henriksen, \"Estimation of lymphatic conductance: A model based on protein-kinetic studies and haemodynamic measurements in patients with cirrhosis of the liver and in pigs,\" Scandinavian journal of clinical & laboratory investigation, vol. 45, pp. 123-130, 1985. </td>
        </tr>
        <tr>
                <td>[Henriksen1985]</td>
                <td>J. H. Henriksen, \"Estimation of lymphatic conductance,\" Scandinavian Journal of Clinical & Laboratory Investigation, vol. 45, pp. 123-130, 1985. </td>
        </tr>
        <tr>
                <td>[Henry1950]</td>
                <td>J. P. Henry and O. H. Gauer, \"THE INFLUENCE OF TEMPERATURE UPON VENOUS PRESSURE IN THE FOOT,\" The Journal of Clinical Investigation, vol. 29, pp. 855-861, 1950. </td>
        </tr>
        <tr>
                <td>[HENSEL1953]</td>
                <td>H. HENSEL, \"The time factor in thermoreceptor excitation,\" Acta Physiologica Scandinavica, vol. 29, pp. 109-116, 1953. </td>
        </tr>
        <tr>
                <td>[Hermansson1981]</td>
                <td>K. Hermansson, M. Larson, Ö. Källskog, and M. Wolgast, \"Influence of renal nerve activity on arteriolar resistance, ultrafiltration dynamics and fluid reabsorption,\" Pflügers Archiv, vol. 389, pp. 85-90, 1981/01/01 1981. </td>
        </tr>
        <tr>
                <td>[Hesslink1992]</td>
                <td>R. L. Hesslink, M. M. D'Alesandro, D. W. Armstrong, and H. L. Reed, Human cold air habituation is independent of thyroxine and thyrotropin vol. 72, 1992. </td>
        </tr>
        <tr>
                <td>[Hester2010]</td>
                <td>R. Hester, R. Summers, R. Iliescu, and T. Coleman, \"HumMod: An integrative model of integrative biomedicine,\" in The Interservice/Industry Training, Simulation & Education Conference (I/ITSEC), 2010. </td>
        </tr>
        <tr>
                <td>[Hester2011]</td>
                <td>R. L. Hester, R. Iliescu, R. Summers, and T. G. Coleman, \"Systems biology and integrative physiological modelling,\" The Journal of physiology, vol. 589, pp. 1053-1060, 2011. </td>
        </tr>
        <tr>
                <td>[Hester2011]</td>
                <td>R. L. Hester, A. J. Brown, L. Husband, R. Iliescu, D. Pruett, R. Summers, et al., \"HumMod: a modeling environment for the simulation of integrative human physiology,\" Frontiers in Physiology, vol. 2, 2011. </td>
        </tr>
        <tr>
                <td>[Heyeraas1987]</td>
                <td>K. J. Heyeraas and K. Aukland, \"Interlobular arterial resistance: Influence of renal arterial pressure and angiotensin II,\" Kidney Int, vol. 31, pp. 1291-1298, 06//print 1987. </td>
        </tr>
        <tr>
                <td>[Heyndrickx1976]</td>
                <td>G. Heyndrickx, D. H. Boettcher, and S. F. Vatner, \"Effects of angiotensin, vasopressin, and methoxamine on cardiac function and blood flow distribution in conscious dogs,\" Am J Physiol, vol. 231, pp. 1579-1587, 1976. </td>
        </tr>
        <tr>
                <td>[Higgins1975]</td>
                <td>H. P. Higgins, J. M. Hershman, J. G. Kenimer, R. A. Patillo, T. A. Bayley, and P. Walfish, \"The Thyrotoxicosis of Hydatidiform Mole,\" Annals of Internal Medicine, vol. 83, pp. 307-311, 1975. </td>
        </tr>
        <tr>
                <td>[Hogan1990]</td>
                <td>M. C. Hogan, D. E. Bebout, A. T. Gray, P. D. Wagner, J. B. West, and P. E. Haab, Muscle maximal O2 uptake at constant O2 delivery with and without CO in the blood vol. 69, 1990. </td>
        </tr>
        <tr>
                <td>[HOLLENBERG1975]</td>
                <td>N. K. HOLLENBERG, D. F. ADAMS, H. SOLOMON, W. R. CHENITZ, B. M. BURGER, H. L. ABRAMS, et al., \"RENAL VASCULAR TONE IN ESSENTIAL AND SECONDARY HYPERTENSION: HEMODYNAMIC AND ANGIOGRAPHIC RESPONSES TO VASODILATORS,\" Medicine, vol. 54, pp. 29-44, 1975. </td>
        </tr>
        <tr>
                <td>[Hollifield1981]</td>
                <td>J. W. Hollifield and P. E. Slaton, \"Thiazide diuretics, hypokalemia and cardiac arrhythmias,\" Acta Medica Scandinavica, vol. 209, pp. 67-73, 1981. </td>
        </tr>
        <tr>
                <td>[Hollifield1981]</td>
                <td>J. W. Hollifield and P. E. Slaton, \"Thiazide diuretics, hypokalemia and cardiac arrhythmias,\" Acta Medica Scandinavica, vol. 209, pp. 67-73, 1981. </td>
        </tr>
        <tr>
                <td>[Hood1983]</td>
                <td>V. L. Hood and R. L. Tannen, \"pH control of lactic acid and keto acid production: a mechanism of acid-base regulation,\" Miner Electrolyte Metab, vol. 9, pp. 317-25, 1983. </td>
        </tr>
        <tr>
                <td>[Hornbein1963]</td>
                <td>T. F. Hornbein and A. Roos, Specificity of H ion concentration as a carotid chemoreceptor stimulus vol. 18, 1963. </td>
        </tr>
        <tr>
                <td>[Hornbein1961]</td>
                <td>T. F. Hornbein, Z. J. Griffo, and A. Roos, QUANTITATION OF CHEMORECEPTOR ACTIVITY: INTERRELATION OF HYPOXIA AND HYPERCAPNIA vol. 24, 1961. </td>
        </tr>
        <tr>
                <td>[Horowitz2003]</td>
                <td>M. Horowitz, \"Matching the heart to heat-induced circulatory load: heat-acclimatory responses,\" Physiology, vol. 18, pp. 215-221, 2003. </td>
        </tr>
        <tr>
                <td>[Horvath1956]</td>
                <td>S. M. Horvath, G. B. Spurr, B. K. Hutt, and L. H. Hamilton, Metabolic Cost of Shivering vol. 8, 1956. </td>
        </tr>
        <tr>
                <td>[Horwitz1977]</td>
                <td>L. D. Horwitz, J. M. Atkins, and M. Saito, \"Effect of digitalis on left ventricular function in exercising dogs,\" Circulation research, vol. 41, pp. 744-750, 1977. </td>
        </tr>
        <tr>
                <td>[Hsieh1965]</td>
                <td>A. C. L. Hsieh, T. Nagasaka, and L. D. Carlson, Effects of immersion of the hand in cold water on digital blood flow vol. 20, 1965. </td>
        </tr>
        <tr>
                <td>[Hucka2003]</td>
                <td>M. Hucka, A. Finney, H. M. Sauro, H. Bolouri, J. C. Doyle, H. Kitano, et al., \"The systems biology markup language (SBML): a medium for representation and exchange of biochemical network models,\" Bioinformatics, vol. 19, pp. 524-531, 2003. </td>
        </tr>
        <tr>
                <td>[Hucka2004]</td>
                <td>M. Hucka, A. Finney, B. J. Bornstein, S. M. Keating, B. E. Shapiro, J. Matthews, et al., \"Evolving a lingua franca and associated software infrastructure for computational systems biology: the Systems Biology Markup Language (SBML) project,\" Systems biology, vol. 1, pp. 41-53, 2004. </td>
        </tr>
        <tr>
                <td>[Hunter2003]</td>
                <td>P. J. Hunter and T. K. Borg, \"Integration from proteins to organs: the Physiome Project,\" Nature Reviews Molecular Cell Biology, vol. 4, pp. 237-243, 2003. </td>
        </tr>
        <tr>
                <td>[Hunter2009]</td>
                <td>P. J. Hunter and M. Viceconti, \"The VPH-physiome project: standards and tools for multiscale modeling in clinical applications,\" Biomedical Engineering, IEEE Reviews in, vol. 2, pp. 40-53, 2009. </td>
        </tr>
        <tr>
                <td>[Hunter2002]</td>
                <td>P. Hunter, P. Robbins, and D. Noble, \"The IUPS human physiome project,\" Pflügers Archiv, vol. 445, pp. 1-9, 2002. </td>
        </tr>
        <tr>
                <td>[Hunter2008]</td>
                <td>P. J. Hunter, E. J. Crampin, and P. M. Nielsen, \"Bioinformatics, multiscale modeling and the IUPS Physiome Project,\" Briefings in bioinformatics, vol. 9, pp. 333-343, 2008. </td>
        </tr>
        <tr>
                <td>[Hunter2006]</td>
                <td>P. J. Hunter, W. W. Li, A. D. McCulloch, and D. Noble, \"Multiscale modeling: Physiome project standards, tools, and databases,\" Computer, vol. 39, pp. 48-54, 2006. </td>
        </tr>
        <tr>
                <td>[Huth1959]</td>
                <td>E. Huth, R. Squires, and J. Elkinton, \"Experimental potassium depletion in normal human subjects. II. Renal and hormonal factors in the development of extracellular alkalosis during depletion,\" Journal of Clinical Investigation, vol. 38, p. 1149, 1959. </td>
        </tr>
        <tr>
                <td>[Charan1984]</td>
                <td>N. B. Charan, G. M. Turk, and R. Dhand, \"Gross and subgross anatomy of bronchial circulation in sheep,\" J Appl Physiol, vol. 57, pp. 658-664, 1984. </td>
        </tr>
        <tr>
                <td>[Charles1994]</td>
                <td>J. B. Charles and C. M. Lathers, \"Summary of Lower Body Negative Pressure Experiments During Space Flight,\" The Journal of Clinical Pharmacology, vol. 34, pp. 571-583, 1994. </td>
        </tr>
        <tr>
                <td>[Chen2004]</td>
                <td>M. Chen, M. Haluzik, N. J. Wolf, J. Lorenzo, K. R. Dietz, M. L. Reitman, et al., \"Increased insulin sensitivity in paternal Gnas knockout mice is associated with increased lipid clearance,\" Endocrinology, vol. 145, pp. 4094-4102, 2004. </td>
        </tr>
        <tr>
                <td>[Cherrington1987]</td>
                <td>A. Cherrington, R. Stevenson, K. Steiner, M. Davis, S. Myers, B. Adkins, et al., \"Insulin, glucagon, and glucose as regulators of hepatic glucose uptake and production in vivo,\" Diabetes/metabolism reviews, vol. 3, pp. 307-332, 1987. </td>
        </tr>
        <tr>
                <td>[Chiasson1976]</td>
                <td>J. Chiasson, J. Liljenquist, F. Finger, and W. Lacy, \"Differential sensitivity of glycogenolysis and gluconeogenesis to insulin infusions in dogs,\" Diabetes, vol. 25, pp. 283-291, 1976. </td>
        </tr>
        <tr>
                <td>[Chopra1976]</td>
                <td>I. J. Chopra, \"An assessment of daily production and significance of thyroidal secretion of 3, 3', 5'-triiodothyronine (reverse T3) in man,\" The Journal of Clinical Investigation, vol. 58, pp. 32-40, 1976. </td>
        </tr>
        <tr>
                <td>[CHOPRA1975]</td>
                <td>I. J. CHOPRA, J. M. HERSHMAN, and R. W. HORNABROOK, \"Serum Thyroid Hormone and Thyrotropin Levels in Subjects from Endemic Goiter Regions of New Guinea,\" The Journal of Clinical Endocrinology & Metabolism, vol. 40, pp. 326-333, 1975. </td>
        </tr>
        <tr>
                <td>[Christie1934]</td>
                <td>R. V. Christie and C. A. McIntosh, \"THE MEASUREMENT OF THE INTRAPLEURAL PRESSURE IN MAN AND ITS SIGNIFICANCE,\" The Journal of Clinical Investigation, vol. 13, pp. 279-294, 1934. </td>
        </tr>
        <tr>
                <td>[Christlieb1968]</td>
                <td>A. R. Christlieb, N. P. Couch, E. A. Amsterdam, S. J. Dobrzinsky, and R. B. Hickler, \"Renin extraction by the human liver,\" Experimental Biology and Medicine, vol. 128, pp. 821-823, 1968. </td>
        </tr>
        <tr>
                <td>[Iampietro1960]</td>
                <td>P. F. Iampietro, J. A. Vaughan, R. F. Goldman, M. B. Kreider, F. Masucci, and D. E. Bass, Heat production from shivering vol. 15, 1960. </td>
        </tr>
        <tr>
                <td>[Ibsen1980]</td>
                <td>H. Ibsen, N. J. Christensen, H. Hollnagel, A. Leth, A. M. Kappelgaard, and J. Giese, \"Plasma noradrenaline concentration in hypertensive and normotensive forty-year-old individuals: Relationship to plasma renin concentration,\" Scandinavian Journal of Clinical & Laboratory Investigation, vol. 40, pp. 333-339, 1980. </td>
        </tr>
        <tr>
                <td>[Ichihara1997]</td>
                <td>A. Ichihara, E. W. Inscho, J. D. Imig, R. E. Michel, and L. G. Navar, \"Role of Renal Nerves in Afferent Arteriolar Reactivity in Angiotensin-Induced Hypertension,\" Hypertension, vol. 29, pp. 442-449, January 1, 1997 1997. </td>
        </tr>
        <tr>
                <td>[Ikeda1979]</td>
                <td>N. Ikeda, F. Marumo, M. Shirataka, and T. Sato, \"A model of overall regulation of body fluids,\" Annals of biomedical engineering, vol. 7, pp. 135-166, 1979. </td>
        </tr>
        <tr>
                <td>[Imai2008]</td>
                <td>J. Imai, H. Katagiri, T. Yamada, Y. Ishigaki, T. Suzuki, H. Kudo, et al., \"Regulation of Pancreatic ß Cell Mass by Neuronal Signals from the Liver,\" Science, vol. 322, pp. 1250-1254, November 21, 2008 2008. </td>
        </tr>
        <tr>
                <td>[Imaizumi1993]</td>
                <td>T. Imaizumi, M. Sugimachi, Y. Harasawa, S. Ando, K. Sunagawa, Y. Hirooka, et al., \"Contribution of wall mechanics to the dynamic properties of aortic baroreceptors,\" American Journal of Physiology-Heart and Circulatory Physiology, vol. 264, pp. H872-H880, 1993. </td>
        </tr>
        <tr>
                <td>[Issekutz1964]</td>
                <td>B. Issekutz, H. I. Miller, P. Paul, and K. Rodahl, Source of fat oxidation in exercising dogs vol. 207, 1964. </td>
        </tr>
        <tr>
                <td>[Ito1990]</td>
                <td>S. Ito and O. A. Carretero, \"An in vitro approach to the study of macula densa-mediated glomerular hemodynamics,\" Kidney Int, vol. 38, pp. 1206-10, Dec 1990. </td>
        </tr>
        <tr>
                <td>[Ito1992]</td>
                <td>S. Ito, O. A. Carretero, K. Abe, L. A. Juncos, and K. Yoshinaga, \"Macula Densa Control of Renin Release and Glomerular Hemodynamics,\" The Tohoku Journal of Experimental Medicine, vol. 166, pp. 27-39, 1992. </td>
        </tr>
        <tr>
                <td>[Itoh1985]</td>
                <td>S. Itoh and O. A. Carretero, \"Role of the macula densa in renin release,\" Hypertension, vol. 7, p. I49, 1985. </td>
        </tr>
        <tr>
                <td>[Iwanishi2000]</td>
                <td>M. Iwanishi, M. P. Czech, and A. D. Cherniack, \"The Protein-tyrosine Kinase Fer Associates with Signaling Complexes Containing Insulin Receptor Substrate-1 and Phosphatidylinositol 3-Kinase,\" Journal of Biological Chemistry, vol. 275, pp. 38995-39000, December 15, 2000 2000. </td>
        </tr>
        <tr>
                <td>[Jackson1982]</td>
                <td>I. M. D. Jackson, \"Thyrotropin-Releasing Hormone,\" New England Journal of Medicine, vol. 306, pp. 145-155, 1982. </td>
        </tr>
        <tr>
                <td>[Jacobson1957]</td>
                <td>L. O. Jacobson, E. Goldwasser, W. Fried, and L. Plzak, \"Role of the Kidney in Erythropoiesis,\" Nature, vol. 179, pp. 633-634, 03/23/print 1957. </td>
        </tr>
        <tr>
                <td>[Jamison1972]</td>
                <td>R. Jamison and F. B. Lacy, \"Evidence for urinary dilution by the collecting tubule,\" Am. J. Physiol, vol. 223, pp. 898-902, 1972. </td>
        </tr>
        <tr>
                <td>[Jamison1971]</td>
                <td>R. L. Jamison, J. Buerkert, F. Lacy, D. Marcus, and B. Henton, \"A micropuncture study of collecting tubule function in rats with hereditary diabetes insipidus,\" Journal of Clinical Investigation, vol. 50, p. 2444, 1971. </td>
        </tr>
        <tr>
                <td>[Jan1977]</td>
                <td>K. M. Jan and S. Chien, Effect of hematocrit variations on coronary hemodynamics and oxygen utilization vol. 233, 1977. </td>
        </tr>
        <tr>
                <td>[Jans1987]</td>
                <td>A. W. Jans, K. Amsler, B. Griewel, and R. K. Kinne, \"Regulation of intracellular pH in LLC-PK< sub> 1</sub> cells studied using< sup> 31</sup> P-NMR spectroscopy,\" Biochimica et Biophysica Acta (BBA)-Molecular Cell Research, vol. 927, pp. 203-212, 1987. </td>
        </tr>
        <tr>
                <td>[Jaspan1981]</td>
                <td>J. Jaspan, K. Polonsky, M. Lewis, J. Pensler, W. Pugh, A. Moossa, et al., \"Hepatic metabolism of glucagon in the dog: contribution of the liver to overall metabolic disposal of glucagon,\" Am J Physiol, vol. 240, pp. E233-E244, 1981. </td>
        </tr>
        <tr>
                <td>[Jelinek1993]</td>
                <td>L. J. Jelinek, S. Lok, G. B. Rosenberg, R. A. Smith, F. J. Grant, S. Biggs, et al., \"Expression cloning and signaling properties of the rat glucagon receptor,\" Science, vol. 259, pp. 1614-1616, 1993. </td>
        </tr>
        <tr>
                <td>[Jelkmann2011]</td>
                <td>W. Jelkmann, \"Regulation of erythropoietin production,\" The Journal of Physiology, vol. 589, pp. 1251-1258, March 15, 2011 2011. </td>
        </tr>
        <tr>
                <td>[Jelkmann1987]</td>
                <td>W. Jelkmann and J. Seidl, \"Dependence of erythropoietin production on blood oxygen affinity and hemoglobin concentration in rats,\" Biomedica biochimica acta, vol. 46, pp. S304-8, 1987 1987. </td>
        </tr>
        <tr>
                <td>[JÉQuier2002]</td>
                <td>E. JÉQuier, \"Leptin Signaling, Adiposity, and Energy Balance,\" Annals of the New York Academy of Sciences, vol. 967, pp. 379-388, 2002. </td>
        </tr>
        <tr>
                <td>[Johns1989]</td>
                <td>E. J. Johns, \"Role of angiotensin II and the sympathetic nervous system in the control of renal function,\" Journal of Hypertension, vol. 7, pp. 695-702, 1989. </td>
        </tr>
        <tr>
                <td>[Jordan1998]</td>
                <td>J. Jordan, J. R. Shannon, B. K. Black, R. H. Lance, M. D. Squillante, F. Costa, et al., \"NN-Nicotinic Blockade as an Acute Human Model of Autonomic Failure,\" Hypertension, vol. 31, pp. 1178-1184, May 1, 1998 1998. </td>
        </tr>
        <tr>
                <td>[Joseph1952]</td>
                <td>J. Joseph and A. Nightingale, \"Electromyography of muscles of posture: leg muscles in males,\" The Journal of Physiology, vol. 117, pp. 484-491, August 28, 1952 1952. </td>
        </tr>
        <tr>
                <td>[Jungblut2008]</td>
                <td>P. R. Jungblut, H. G. Holzhütter, R. Apweiler, and H. Schlüter, \"The speciation of the proteome,\" Chemistry Central Journal, vol. 2, pp. 1-10, 2008. </td>
        </tr>
        <tr>
                <td>[Källskog1975]</td>
                <td>Ö. Källskog and M. Wolgast, \"Effect of elevated interstitial pressure on the renal cortical hemodynamics,\" Acta Physiologica Scandinavica, vol. 95, pp. 364-372, 1975. </td>
        </tr>
        <tr>
                <td>[Kamel1990]</td>
                <td>K. S. Kamel, J. H. Ethier, B. J. Stinebaugh, F. X. Schloeder, and M. L. Halperin, \"Removal of an inorganic acid load in subjects with ketoacidosis of chronic fasting,\" Kidney Int, vol. 38, pp. 507-511, 09//print 1990. </td>
        </tr>
        <tr>
                <td>[Kamel1998]</td>
                <td>K. S. Kamel, S.-H. Lin, S. Cheema-Dhadli, E. B. Marliss, and M. L. Halperin, \"Prolonged total fasting: A feast for the integrative physiologist,\" Kidney Int, vol. 53, pp. 531-539, 03//print 1998. </td>
        </tr>
        <tr>
                <td>[Kamon1968]</td>
                <td>E. Kamon and H. S. Belding, Heat uptake and dermal conductance in forearm and hand when heated vol. 24, 1968. </td>
        </tr>
        <tr>
                <td>[Kappagoda1976]</td>
                <td>C. Kappagoda and R. Linden, \"The use of SI units in cardiovascular studies,\" British heart journal, vol. 38, p. 219, 1976. </td>
        </tr>
        <tr>
                <td>[Katkov1980]</td>
                <td>V. E. Katkov and V. V. Chestukhin, \"Blood pressure and oxygenation in different cardiovascular compartments of a normal man during postural exposures,\" Aviat Space Environ Med, vol. 51, pp. 1234-42, Nov 1980. </td>
        </tr>
        <tr>
                <td>[Katschinski2004]</td>
                <td>D. M. Katschinski, \"On heat and cells and proteins,\" Physiology, vol. 19, pp. 11-15, 2004. </td>
        </tr>
        <tr>
                <td>[Katsura1992]</td>
                <td>K. Katsura, B. Asplund, A. Ekholm, and B. K. Siesjo, \"Extra- and Intracellular pH in the Brain During Ischaemia, Related to Tissue Lactate Content in Normo- and Hypercapnic rats,\" Eur J Neurosci, vol. 4, pp. 166-176, 1992. </td>
        </tr>
        <tr>
                <td>[Kelly1992]</td>
                <td>R. A. Kelly and T. W. Smith, \"Use and misuse of digitalis blood levels,\" Heart disease and stroke : a journal for primary care physicians, vol. 1, pp. 117-122, 1992 May-Jun 1992. </td>
        </tr>
        <tr>
                <td>[Kelso1982]</td>
                <td>S. Kelso and J. Boulant, \"Effect of synaptic blockade on thermosensitive neurons in hypothalamic tissue slices,\" Am J Physiol, vol. 243, pp. R480-R490, 1982. </td>
        </tr>
        <tr>
                <td>[Kervran1990]</td>
                <td>A. Kervran, M. Dubrasquet, P. Blache, J. Martinez, and D. Bataille, \"Metabolic clearance rates of oxyntomodulin and glucagon in the rat: contribution of the kidney,\" Regulatory Peptides, vol. 31, pp. 41-52, 10/29/ 1990. </td>
        </tr>
        <tr>
                <td>[Kety1948]</td>
                <td>S. S. Kety and C. F. Schmidt, \"THE EFFECTS OF ALTERED ARTERIAL TENSIONS OF CARBON DIOXIDE AND OXYGEN ON CEREBRAL BLOOD FLOW AND CEREBRAL OXYGEN CONSUMPTION OF NORMAL YOUNG MEN 1,\" The Journal of Clinical Investigation, vol. 27, pp. 484-492, 1948. </td>
        </tr>
        <tr>
                <td>[Khokhar1976]</td>
                <td>A. Khokhar, J. Slater, M. L. Forsling, and N. Payne, \"Effect of vasopressin on plasma volume and renin release in man,\" Clinical Science, vol. 50, pp. 415-424, 1976. </td>
        </tr>
        <tr>
                <td>[Kiil1990]</td>
                <td>F. Kiil, \"The paradox of renal bicarbonate reabsorption,\" Physiology, vol. 5, pp. 13-17, 1990. </td>
        </tr>
        <tr>
                <td>[Kim0000]</td>
                <td>H. H. Kim, S. Lee, T. Y. Jeon, H. C. Son, Y. J. Kim, and M. S. Sim, \"Post-prandial plasma ghrelin levels in people with different breakfast hours,\" Eur J Clin Nutr, vol. 58, pp. 692-695, //print 0000. </td>
        </tr>
        <tr>
                <td>[Kimura1983]</td>
                <td>S. Kimura, Y. Miura, M. Adachi, M. Adachi, M. Nezu, S. Toriyabe, et al., \"The effect of sodium depletion on plasma norepinephrine kinetics in patients with essential hypertension,\" Japanese circulation journal, vol. 47, pp. 1232-1241, 1983/10// 1983. </td>
        </tr>
        <tr>
                <td>[Kintner2000]</td>
                <td>D. B. Kintner, M. K. Anderson, J. H. Fitzpatrick, Jr., K. A. Sailor, and D. D. Gilboe, \"31P-MRS-based determination of brain intracellular and interstitial pH: its application to in vivo H+ compartmentation and cellular regulation during hypoxic/ischemic conditions,\" Neurochem Res, vol. 25, pp. 1385-96, Oct 2000. </td>
        </tr>
        <tr>
                <td>[Kintner2000]</td>
                <td>D. B. Kintner, M. K. Anderson, J. H. Fitzpatrick, Jr., K. A. Sailor, and D. D. Gilboe, \"31P-MRS-based determination of brain intracellular and interstitial pH: its application to in vivo H+ compartmentation and cellular regulation during hypoxic/ischemic conditions,\" Neurochem Res, vol. 25, pp. 1385-96, Oct 2000. </td>
        </tr>
        <tr>
                <td>[Kintner1999]</td>
                <td>D. B. Kintner, M. E. Anderson, K. A. Sailor, G. Dienel, J. H. Fitzpatrick, Jr., and D. D. Gilboe, \"In vivo microdialysis of 2-deoxyglucose 6-phosphate into brain: a novel method for the measurement of interstitial pH using 31P-NMR,\" J Neurochem, vol. 72, pp. 405-12, Jan 1999. </td>
        </tr>
        <tr>
                <td>[Kirsch1993]</td>
                <td>K. A. Kirsch, F. J. Baartz, H. C. Gunga, L. Röcker, H. J. Wicke, and B. Bünsch, \"Fluid shifts into and out of superficial tissues under microgravity and terrestrial conditions,\" The clinical investigator, vol. 71, pp. 687-689, 1993/09/01 1993. </td>
        </tr>
        <tr>
                <td>[Kirsch1993]</td>
                <td>K. A. Kirsch, F. J. Baartz, H. C. Gunga, L. Röcker, H. J. Wicke, and B. Bünsch, \"Fluid shifts into and out of superficial tissues under microgravity and terrestrial conditions,\" The clinical investigator, vol. 71, pp. 687-689, 1993/09/01 1993. </td>
        </tr>
        <tr>
                <td>[Kjeldsen1983]</td>
                <td>S. E. Kjeldsen, I. Eide, I. Aakesson, and P. Leren, \"Increased arterial catecholamine concentrations in 50-year-old men with essential hypertension,\" Scandinavian Journal of Clinical & Laboratory Investigation, vol. 43, pp. 343-349, 1983. </td>
        </tr>
        <tr>
                <td>[Knepper1977]</td>
                <td>M. A. Knepper, R. A. Danielson, G. M. Saidel, and R. S. Post, \"Quantitative analysis of renal medullary anatomy in rats and rabbits,\" Kidney Int, vol. 12, pp. 313-323, 1977. </td>
        </tr>
        <tr>
                <td>[Knepper2003]</td>
                <td>M. A. Knepper, G. M. Saidel, V. C. Hascall, and T. Dwyer, Concentration of solutes in the renal inner medulla: interstitial hyaluronan as a mechano-osmotic transducer vol. 284, 2003. </td>
        </tr>
        <tr>
                <td>[Koeffler1981]</td>
                <td>H. P. Koeffler and E. Goldwasser, \"Erythropoietin Radioimmunoassay in Evaluating Patients with Polycythemia,\" Annals of Internal Medicine, vol. 94, pp. 44-47, 1981. </td>
        </tr>
        <tr>
                <td>[Kofranek2007]</td>
                <td>J. Kofranek, S. Matousek, and M. Andrlik, \"Border flux balance approach towards modelling acid-base chemistry and blood gases transport,\" in In: Proceedings of the 6th EUROSIM congress on modelling and simulation. Ljubljana: University of Ljubljana, 2007, pp. 1-9. </td>
        </tr>
        <tr>
                <td>[Kofranek2011]</td>
                <td>J. Kofranek, S. Matousek, J. Rusz, P. Stodulka, P. Privitzer, M. Matejak, et al., \"The Atlas of Physiology and Pathophysiology: Web-based multimedia enabled interactive simulations,\" Computer methods and programs in biomedicine, vol. 104, pp. 143-153, 2011. </td>
        </tr>
        <tr>
                <td>[Kofránek2002]</td>
                <td>J. Kofránek, Andrlík, Michal, Kripner, Tomáš, and Mašek, Jan, \"From art to industry in design of biomedical simulators. Experience of the Golem simulator project.,\" presented at the The 6th World Multiconference on Systemics, Cybernetics and Informatics., Orlando, Florida, USA, 2002. </td>
        </tr>
        <tr>
                <td>[Kofránek2013]</td>
                <td>J. Kofránek, Mateják, M., Privitzer, P., Tribula, M., Kulhánek, T., Šilar, J., Pecinovský, R., \"HumMod-Golem Edition: large scale model of integrative physiology for virtual patient simulators,\" in World Congress in Computer Science 2013 (WORLDCOMP'13), International Conference on Modeling, Simulation and Visualisation Methods (MSV'13), 2013, pp. 182-188. </td>
        </tr>
        <tr>
                <td>[Kofránek2008]</td>
                <td>J. Kofránek, J. Rusz, and S. Matoušek, \"Vzkříšení Guytonova diagramu-Od obrázku k simulačnímu modelu,\" MEDSOFT 2008, vol. 2008, pp. 37-56, 2008. </td>
        </tr>
        <tr>
                <td>[Kofránek2009]</td>
                <td>J. Kofránek, M. Mateják, and P. Privitzer, \"Leaving toil to machines - building simulation kernel of educational software in modern software environments,\" in Mefanet 2009, Masaryk University, Brno, 2009. </td>
        </tr>
        <tr>
                <td>[Kofránek2010]</td>
                <td>J. Kofránek, M. Mateják, and P. Privitzer, \"Web simulator creation technology,\" MEFANET report, vol. 3, pp. 52-97, 2010. </td>
        </tr>
        <tr>
                <td>[Jiří2011]</td>
                <td>J. Kofránek, M. Mateják, and P. Privitzer, \"HumMod - large scale physiological model in Modelica,\" in 8th. International Modelica Conference, Dresden, Germany, 2011. </td>
        </tr>
        <tr>
                <td>[Kofránek2008]</td>
                <td>J. Kofránek, M. Mateják, P. Privitzer, and M. Tribula, \"Causal or acausal modeling: labour for humans or labour for machines,\" Technical Conmputing Prague, pp. 1-16, 2008. </td>
        </tr>
        <tr>
                <td>[Kokot1994]</td>
                <td>M. Kokot, F. Kokot, E. Franek, A. Wiecek, M. Nowicki, and J. Duława, \"Effect of isobaric hyperoxemia on erythropoietin secretion in hypertensive patients,\" Hypertension, vol. 24, pp. 486-90, October 1, 1994 1994. </td>
        </tr>
        <tr>
                <td>[Kotani2004]</td>
                <td>K. Kotani, O. D. Peroni, Y. Minokoshi, O. Boss, and B. B. Kahn, \"GLUT4 glucose transporter deficiency increases hepatic lipid production and peripheral lipid utilization,\" The Journal of clinical investigation, vol. 114, pp. 1666-1675, 2004. </td>
        </tr>
        <tr>
                <td>[Kraig1985]</td>
                <td>R. P. Kraig, W. A. Pulsinelli, and F. Plum, \"Heterogeneous Distribution of Hydrogen and Bicarbonate Ions During Complete Brain Cischemia,\" in Progress in Brain Research. vol. Volume 63, K. A. H. B. K. S. K. Kogure and F. A. Welsh, Eds., ed: Elsevier, 1985, pp. 155-166. </td>
        </tr>
        <tr>
                <td>[Krasney1977]</td>
                <td>J. A. Krasney and R. C. Koehler, Influence of arterial hypoxia on cardiac and coronary dynamics in the conscious sinoaortic-denervated dog vol. 43, 1977. </td>
        </tr>
        <tr>
                <td>[Krekels1997]</td>
                <td>M. M. Krekels, N. C. Schaper, and P. W. de Leeuw, \"Sensitivity of blood pressure and renin activation during sodium restriction,\" Hypertension, vol. 30, pp. 1216-1222, 1997. </td>
        </tr>
        <tr>
                <td>[Krogh1932]</td>
                <td>A. Krogh, E. Landis, and A. Turner, \"The movement of fluid through the human capillary wall in relation to venous pressure and to the colloid osmotic pressure of the blood,\" Journal of Clinical Investigation, vol. 11, p. 63, 1932. </td>
        </tr>
        <tr>
                <td>[Tomáš2014]</td>
                <td>T. Kulhánek, M. Mateják, J. Šilar, and J. Kofránek, \"Identifikace fyziologických systémů,\" Medsoft, pp. 148-153, 2014. </td>
        </tr>
        <tr>
                <td>[Kulhánek]</td>
                <td>T. Kulhánek, J. Šilar, J. Kofránek, M. Mateják, P. Privitzer, and M. Tribula, \"Od výukového modelu k identifikaci fyziologického systému (cze) From educational models towards identification of physiological system (ENG).\"</td>
        </tr>
        <tr>
                <td>[Kulhánek2010]</td>
                <td>T. Kulhánek, J. Šilar, M. Mateják, P. Privitzer, J. Kofránek, and M. Tribula, \"Distributed computation and parameter estimation in identification of physiological systems,\" in VPH conference, 2010. </td>
        </tr>
        <tr>
                <td>[Kulhánek2013]</td>
                <td>T. Kulhánek, M. Mateják, P. P. JanŠilar, M. Tribula, F. Jezek, and J. Kofránek, \"Hybrid architecture for web simulators of pathological physiology,\" 2013. </td>
        </tr>
        <tr>
                <td>[Kulhanek2]</td>
                <td>KulhánekT. Kulhánek, F. Jezek, M. Mateják, J. Šilar, P. Privitzer, M. Tribula, et al., \"RESTful web service to build loosely coupled web based simulation of human physiology.\"</td>
        </tr>
        <tr>
                <td>[Kumagai1994]</td>
                <td>K. Kumagai and I. A. Reid, \"Angiotensin II exerts differential actions on renal nerve activity and heart rate,\" Hypertension, vol. 24, pp. 451-456, 1994. </td>
        </tr>
        <tr>
                <td>[Kunert1996]</td>
                <td>M. P. Kunert, J. F. Liard, D. J. Abraham, and J. H. Lombard, \"Low-Affinity Hemoglobin Increases Tissue PO2and Decreases Arteriolar Diameter and Flow in the Rat Cremaster Muscle,\" Microvascular Research, vol. 52, pp. 58-68, 7// 1996. </td>
        </tr>
        <tr>
                <td>[Kurtz1983]</td>
                <td>I. Kurtz, T. Maher, H. N. Hulter, M. Schambelan, and A. Sebastian, \"Effect of diet on plasma acid-base composition in normal humans,\" Kidney Int, vol. 24, pp. 670-80, Nov 1983. </td>
        </tr>
        <tr>
                <td>[Kuwahira1993]</td>
                <td>I. Kuwahira, N. Heisler, J. Piiper, and N. C. Gonzalez, \"Effect of chronic hypoxia on hemodynamics, organ blood flow and O2 supply in rats,\" Respiration Physiology, vol. 92, pp. 227-238, 5// 1993. </td>
        </tr>
        <tr>
                <td>[Lahiri1975]</td>
                <td>S. Lahiri and R. G. DeLaney, \"Stimulus inte"
                                                  + "raction in the responses of carotid body chemoreceptor single afferent fibers,\" Respir Physiol, vol. 24, pp. 249-66, Sep 1975. </td>
        </tr>
        <tr>
                <td>[Lahiri1981]</td>
                <td>S. Lahiri, A. Mokashi, E. Mulligan, and T. Nishino, Comparison of aortic and carotid chemoreceptor responses to hypercapnia and hypoxia vol. 51, 1981. </td>
        </tr>
        <tr>
                <td>[Laine1979]</td>
                <td>G. A. Laine, J. T. Hall, S. H. Laine, and J. Granger, \"Transsinusoidal fluid dynamics in canine liver during venous hypertension,\" Circulation Research, vol. 45, pp. 317-23, September 1, 1979 1979. </td>
        </tr>
        <tr>
                <td>[Laine1987]</td>
                <td>G. A. Laine, S. J. Allen, J. Katz, J. C. Gabel, and R. E. Drake, \"Outflow pressure reduces lymph flow rate from various tissues,\" Microvascular Research, vol. 33, pp. 135-142, 1// 1987. </td>
        </tr>
        <tr>
                <td>[Lake1979]</td>
                <td>C. R. Lake, \"Relationship of Sympathetic Nervous System Tone and Blood Pressure,\" Nephron, vol. 23, pp. 84-90, 1979. </td>
        </tr>
        <tr>
                <td>[Lake1976]</td>
                <td>C. R. Lake, M. G. Ziegler, and I. J. Kopin, \"Use of plasma norepinephrine for evaluation of sympathetic neuronal function in man,\" Life sciences, vol. 18, pp. 1315-1325, 1976. </td>
        </tr>
        <tr>
                <td>[LaManna1996]</td>
                <td>J. LaManna, \"Hypoxia/Ischemia and the pH Paradox,\" in Oxygen Transport to Tissue XVII. vol. 388, C. Ince, J. Kesecioglu, L. Telci, and K. Akpir, Eds., ed: Springer US, 1996, pp. 283-292. </td>
        </tr>
        <tr>
                <td>[Lambertsen1960]</td>
                <td>C. J. Lambertsen, \"CARBON DIOXIDE AND RESPIRATION IN ACID-BASE HOMEOSTASIS,\" Anesthesiology, vol. 21, pp. 642-651, 1960. </td>
        </tr>
        <tr>
                <td>[Lambertsen1953]</td>
                <td>C. J. Lambertsen, R. H. Kough, D. Y. Cooper, G. L. Emmel, H. H. Loeschcke, and C. F. Schmidt, Comparison of Relationship of Respiratory Minute Volume to pCO2 and pH of Arterial and Internal Jugular Blood in Normal Man During Hyperventilation Produced by Low Concentrations of CO2 at 1 Atmosphere and by O2 at 3.0 Atmospheres vol. 5, 1953. </td>
        </tr>
        <tr>
                <td>[Lambertsen1959]</td>
                <td>C. J. Lambertsen, S. G. Owen, H. Wendel, M. W. Stroud, A. A. Lurie, W. Lochner, et al., Respiratory and cerebral circulatory control during exercise at .21 and 2.0 atmospheres inspired pO2 vol. 14, 1959. </td>
        </tr>
        <tr>
                <td>[Landis1933]</td>
                <td>E. M. Landis and J. H. Gibbon Jr, \"The effects of temperature and of tissue pressure on the movement of fluid through the human capillary wall,\" Journal of Clinical Investigation, vol. 12, p. 105, 1933. </td>
        </tr>
        <tr>
                <td>[Landis1933]</td>
                <td>E. M. Landis and J. H. Gibbon, Jr., \"THE EFFECTS OF TEMPERATURE AND OF TISSUE PRESSURE ON THE MOVEMENT OF FLUID THROUGH THE HUMAN CAPILLARY WALL,\" The Journal of Clinical Investigation, vol. 12, pp. 105-138, 1933. </td>
        </tr>
        <tr>
                <td>[Langer1997]</td>
                <td>G. A. Langer, The myocardium: Academic Press, 1997. </td>
        </tr>
        <tr>
                <td>[Lankford1991]</td>
                <td>S. P. Lankford, C. Chou, Y. Terada, S. M. Wall, J. B. Wade, and M. A. Knepper, \"Regulation of collecting duct water permeability independent of cAMP-mediated AVP response,\" American Journal of Physiology-Renal Physiology, vol. 261, pp. F554-F566, 1991. </td>
        </tr>
        <tr>
                <td>[Larsdotter2003]</td>
                <td>E. Larsdotter Nilsson and P. Fritzson, \"BioChem-A Biological and Chemical Library for Modelica,\" in Proceedings of the 3rd International Modelica Conference (November 3-4, Linköping, Sweden), 2003. </td>
        </tr>
        <tr>
                <td>[Larsen1972]</td>
                <td>P. R. Larsen, \"Direct immunoassay of triiodothyronine in human serum,\" The Journal of Clinical Investigation, vol. 51, pp. 1939-1949, 1972. </td>
        </tr>
        <tr>
                <td>[Lash1987]</td>
                <td>J. M. Lash and H. G. Bohlen, Perivascular and tissue PO2 in contracting rat spinotrapezius muscle vol. 252, 1987. </td>
        </tr>
        <tr>
                <td>[Lassen1959]</td>
                <td>N. A. Lassen, Cerebral blood flow and oxygen consumption in man: Am Physiological Soc, 1959. </td>
        </tr>
        <tr>
                <td>[Lassen1990]</td>
                <td>N. A. Lassen, \"Is central chemoreceptor sensitive to intracellular rather than extracellular pH?,\" Clinical Physiology, vol. 10, pp. 311-319, 1990. </td>
        </tr>
        <tr>
                <td>[Latzka1999]</td>
                <td>W. A. Latzka and S. J. Montain, \"Water and electrolyte requirements for exercise,\" Clinics in sports medicine, vol. 18, pp. 513-524, 1999. </td>
        </tr>
        <tr>
                <td>[LAUGHLIN1987]</td>
                <td>M. H. LAUGHLIN, \"Skeletal muscle blood flow capacity: role of muscle pump in exercise hyperemia,\" Am J Physiol, vol. 253, p. 1004, 1987. </td>
        </tr>
        <tr>
                <td>[Laughlin1983]</td>
                <td>M. H. Laughlin and R. Armstrong, \"Rat muscle blood flows as a function of time during prolonged slow treadmill exercise,\" Am J Physiol Heart Circ Physiol, vol. 244, pp. H814-H824, 1983. </td>
        </tr>
        <tr>
                <td>[Lautt1987]</td>
                <td>W. W. Lautt, C. V. Greenway, and D. J. Legare, \"Effect of hepatic nerves, norepinephrine, angiotensin, and elevated central venous pressure on postsinusoidal resistance sites and intrahepatic pressures in cats,\" Microvascular Research, vol. 33, pp. 50-61, 1// 1987. </td>
        </tr>
        <tr>
                <td>[Layton2004]</td>
                <td>A. T. Layton, T. L. Pannabecker, W. H. Dantzler, and H. E. Layton, Two modes for concentrating urine in rat inner medulla vol. 287, 2004. </td>
        </tr>
        <tr>
                <td>[Legendre1991]</td>
                <td>B. B. Legendre, S. Estrade, R. Cassingena, P. Ronco, and A. Vandewalle, \"Why Don’t Our Feet Swell in the Upright Position?,\" J. Cell Biol, vol. 113, pp. 951-962, 1991. </td>
        </tr>
        <tr>
                <td>[Leichtweiss1969]</td>
                <td>H. P. Leichtweiss, D. W. Lübbers, C. Weiss, H. Baumgärtl, and W. Reschke, \"The oxygen supply of the rat kidney: Measurements of intrarenalpO2,\" Pflügers Archiv, vol. 309, pp. 328-349, 1969/12/01 1969. </td>
        </tr>
        <tr>
                <td>[Lemieux1971]</td>
                <td>G. Lemieux, P. Vinay, P. Robitaille, G. Plante, xE, E. rard, et al., \"The effect of ketone bodies on renal ammoniogenesis,\" The Journal of Clinical Investigation, vol. 50, pp. 1781-1791, 1971. </td>
        </tr>
        <tr>
                <td>[Lennon1966]</td>
                <td>E. Lennon, J. Lemann Jr, and J. Litzow, \"The effects of diet and stool composition on the net external acid balance of normal subjects,\" Journal of Clinical Investigation, vol. 45, p. 1601, 1966. </td>
        </tr>
        <tr>
                <td>[Lennon1966]</td>
                <td>E. Lennon, J. Lemann Jr, and J. Litzow, \"The effects of diet and stool composition on the net external acid balance of normal subjects,\" Journal of Clinical Investigation, vol. 45, p. 1601, 1966. </td>
        </tr>
        <tr>
                <td>[Levick1991]</td>
                <td>Levick, \"Capillary filtration-absorption balance reconsidered in light of dynamic extravascular factors,\" Experimental Physiology, vol. 76, pp. 825-857, November 1, 1991 1991. </td>
        </tr>
        <tr>
                <td>[Levy1959]</td>
                <td>M. N. Levy and G. Sauceda, Diffusion of oxygen from arterial to venous segments of renal capillaries vol. 196, 1959. </td>
        </tr>
        <tr>
                <td>[Liljenquist1974]</td>
                <td>J. E. Liljenquist, J. D. Bomboy, S. B. Lewis, B. C. Sinclair-Smith, P. W. Felts, W. W. Lacy, et al., \"Effects of Glucagon on Lipolysis and Ketogenesis in Normal and Diabetic Men,\" The Journal of Clinical Investigation, vol. 53, pp. 190-197, 1974. </td>
        </tr>
        <tr>
                <td>[Liljenquist1977]</td>
                <td>J. Liljenquist, G. Mueller, A. Cherrington, U. Keller, C. JL, J. Perry, et al., \"Evidence for an important role of glucagon in the regulation of hepatic glucose production in normal man,\" Journal of Clinical Investigation, vol. 59, p. 369, 1977. </td>
        </tr>
        <tr>
                <td>[Lillioja1985]</td>
                <td>S. Lillioja, C. Bogardus, D. M. Mott, A. L. Kennedy, W. C. Knowler, and B. V. Howard, \"Relationship between insulin-mediated glucose disposal and lipid metabolism in man,\" Journal of Clinical Investigation, vol. 75, p. 1106, 1985. </td>
        </tr>
        <tr>
                <td>[Lipkin1954]</td>
                <td>M. Lipkin and J. D. Hardy, Measurement of Some Thermal Properties of Human Tissues vol. 7, 1954. </td>
        </tr>
        <tr>
                <td>[Little1993]</td>
                <td>W. C. Little and C. P. Cheng, \"Effect of exercise on left ventricular-arterial coupling assessed in the pressure-volume plane,\" AMERICAN JOURNAL OF PHYSIOLOGY, vol. 264, pp. H1629-H1629, 1993. </td>
        </tr>
        <tr>
                <td>[Little1975]</td>
                <td>R. Little, G. Wennergren, and B. ÖBerg, \"Aspects of the central integration of arterial baroreceptor and cardiac ventricular receptor reflexes in the cat,\" Acta Physiologica Scandinavica, vol. 93, pp. 85-96, 1975. </td>
        </tr>
        <tr>
                <td>[Livett1981]</td>
                <td>B. G. Livett, D. M. Dean, L. G. Whelan, S. Udenfriend, and J. Rossier, \"Co-release of enkephalin and catecholamines from cultured adrenal chromaffin cells,\" Nature, vol. 289, pp. 317-319, 01/22/print 1981. </td>
        </tr>
        <tr>
                <td>[Lohmeier1998]</td>
                <td>T. E. Lohmeier and D. A. Hildebrandt, \"Renal Nerves Promote Sodium Excretion in Angiotensin-Induced Hypertension,\" Hypertension, vol. 31, pp. 429-434, January 1, 1998 1998. </td>
        </tr>
        <tr>
                <td>[Lopez-Barneo1993]</td>
                <td>J. Lopez-Barneo, A. Benot, and J. Urena, Oxygen Sensing and the Electrophysiology of Arterial Chemoreceptor Cells vol. 8, 1993. </td>
        </tr>
        <tr>
                <td>[Lugliani1973]</td>
                <td>R. Lugliani, B. J. Whipp, and K. Wasserman, \"A role for the carotid body in cardiovascular control in man,\" Chest, vol. 63, pp. 744-750, 1973. </td>
        </tr>
        <tr>
                <td>[Lugliani1971]</td>
                <td>R. Lugliani, B. J. Whipp, C. Seard, and K. Wasserman, \"Effect of Bilateral Carotid-Body Resection on Ventilatory Control at Rest and during Exercise in Man,\" New England Journal of Medicine, vol. 285, pp. 1105-1111, 1971. </td>
        </tr>
        <tr>
                <td>[Maack1985]</td>
                <td>T. Maack, M. J. F. Camargo, H. D. Kleinert, J. H. Laragh, and S. A. Atlas, \"Atrial natriuretic factor: structure and functional properties,\" Kidney Int, vol. 27, pp. 607-615, 1985. </td>
        </tr>
        <tr>
                <td>[Maass-Moreno1992]</td>
                <td>R. Maass-Moreno and C. F. Rothe, \"Contribution of the large hepatic veins to postsinusoidal vascular resistance,\" Am J Physiol Gastrointest Liver Physiol, vol. 262, pp. G14-G22, 1992. </td>
        </tr>
        <tr>
                <td>[MacGregor1981]</td>
                <td>G. MacGregor, N. Markandu, J. Roulston, J. Jones, and J. Morton, \"Maintenance of blood pressure by the renin–angiotensin system in normal man,\" 1981. </td>
        </tr>
        <tr>
                <td>[Maddox1974]</td>
                <td>D. A. Maddox, W. M. Deen, and B. M. Brenner, \"Dynamics of glomerular ultrafiltration. VI. Studies in the primate,\" Kidney international, vol. 5, pp. 271-278, 1974/04// 1974. </td>
        </tr>
        <tr>
                <td>[Madison1958]</td>
                <td>L. L. Madison and D. W. Seldin, \"Ammonia Excretion and Renal Enzymatic Adaptation in Human Subjects, as Disclosed by Administration of Precursor Amino Acids12,\" The Journal of Clinical Investigation, vol. 37, pp. 1615-1627, 1958. </td>
        </tr>
        <tr>
                <td>[Majid1997]</td>
                <td>D. S. A. Majid, M. Godfrey, and S. A. Omoro, \"Pressure Natriuresis and Autoregulation of Inner Medullary Blood Flow in Canine Kidney,\" Hypertension, vol. 29, pp. 210-215, January 1, 1997 1997. </td>
        </tr>
        <tr>
                <td>[Malberti1999]</td>
                <td>F. Malberti, M. Farina, and E. Imbasciati, \"The PTH-calcium curve and the set point of calcium in primary and secondary hyperparathyroidism,\" Nephrology Dialysis Transplantation, vol. 14, pp. 2398-2406, 1999. </td>
        </tr>
        <tr>
                <td>[Malberti1999]</td>
                <td>F. Malberti, M. Farina, and E. Imbasciati, \"The PTH-calcium curve and the set point of calcium in primary and secondary hyperparathyroidism,\" Nephrology Dialysis Transplantation, vol. 14, pp. 2398-2406, 1999. </td>
        </tr>
        <tr>
                <td>[Malnic1989]</td>
                <td>G. Malnic, R. W. Berliner, and G. Giebisch, Flow dependence of K+ secretion in cortical distal tubules of the rat vol. 256, 1989. </td>
        </tr>
        <tr>
                <td>[Malo1984]</td>
                <td>J. Malo, H. Goldberg, R. Graham, H. Unruh, and C. Skoog, Effect of hypoxic hypoxia on systemic vasculature vol. 56, 1984. </td>
        </tr>
        <tr>
                <td>[Manning1987]</td>
                <td>R. D. Manning, Renal hemodynamic, fluid volume, and arterial pressure changes during hyperproteinemia vol. 252, 1987. </td>
        </tr>
        <tr>
                <td>[Manning1990]</td>
                <td>R. D. Manning, Effects of hypoproteinemia on blood volume and arterial pressure of volume-loaded dogs vol. 259, 1990. </td>
        </tr>
        <tr>
                <td>[Manning1980]</td>
                <td>R. D. Manning and A. C. Guyton, Dynamics of fluid distribution between the blood and interstitium during overhydration vol. 238, 1980. </td>
        </tr>
        <tr>
                <td>[Manning1983]</td>
                <td>R. D. Manning and A. C. Guyton, Effects of hypoproteinemia on fluid volumes and arterial pressure vol. 245, 1983. </td>
        </tr>
        <tr>
                <td>[Mantzoros2011]</td>
                <td>C. S. Mantzoros, F. Magkos, M. Brinkoetter, E. Sienkiewicz, T. A. Dardeno, S.-Y. Kim, et al., Leptin in human physiology and pathophysiology vol. 301, 2011. </td>
        </tr>
        <tr>
                <td>[Marcus1992]</td>
                <td>F. Marcus, \"Use and toxicity of digitalis,\" Heart disease and stroke: a journal for primary care physicians, vol. 1, p. 27, 1992. </td>
        </tr>
        <tr>
                <td>[Marshall1995]</td>
                <td>J. Marshall, Skeletal Muscle Vasculature and Systemic Hypoxia vol. 10, 1995. </td>
        </tr>
        <tr>
                <td>[Marshall1988]</td>
                <td>J. M. Marshall and J. D. Metcalfe, \"Analysis of the cardiovascular changes induced in the rat by graded levels of systemic hypoxia,\" The Journal of Physiology, vol. 407, pp. 385-403, December 1, 1988 1988. </td>
        </tr>
        <tr>
                <td>[Maruyama1984]</td>
                <td>H. Maruyama, A. Hisatomi, L. Orci, G. M. Grodsky, and R. H. Unger, \"Insulin within islets is a physiologic glucagon release inhibitor,\" The Journal of Clinical Investigation, vol. 74, pp. 2296-2299, 1984. </td>
        </tr>
        <tr>
                <td>[Mason1964]</td>
                <td>D. T. Mason, E. Braunwald, R. B. Karsh, and F. A. Bullock, \"Studies on Digitalis. X. Effects of Ouabain on Forearm Vascular Resistance and Venous Tone in Normal Subjects and in Patients in Heart Failure *,\" The Journal of Clinical Investigation, vol. 43, pp. 532-543, 1964. </td>
        </tr>
        <tr>
                <td>[Massara1980]</td>
                <td>F. Massara, S. Martelli, E. Cagliero, F. Camanni, and G. Molinatti, \"Influence of glucagon on plasma levels of potassium in man,\" Diabetologia, vol. 19, pp. 414-417, 1980. </td>
        </tr>
        <tr>
                <td>[Matejak2009]</td>
                <td>M. Mateják, J. Kofránek, and J. Rusz, \"Akauzální\" vzkříšení\" Guytonova diagramu,\" Medsoft 2009, p. 105, 2009. </td>
        </tr>
        <tr>
                <td>[Matejak2010]</td>
                <td>M. Mateják and J. Kofránek, \"Rozsáhlý model fyziologických regulací v Modelice,\" Medsoft, pp. 126-146, 2010. </td>
        </tr>
        <tr>
                <td>[Matejak2011]</td>
                <td>M. Mateják and J. Kofránek, \"HumMod–Golem Edition–Rozsáhlý model fyziologických systémů,\" Medsoft, pp. 182-196, 2011. </td>
        </tr>
       
        <tr>
                <td>[Matejak2012]</td>
                <td>M. Mateják, B. Nedvědová, A. Doležalová, J. Kofránek, and T. Kulhánek, \"Model ECMO oxygenátoru,\" Medsoft, pp. 205-2014, 2012. </td>
        </tr>
        <tr>
                <td>[Mathias2013]</td>
                <td>C. J. Mathias and R. Bannister, Autonomic failure: a textbook of clinical disorders of the autonomic nervous system: OUP Oxford, 2013. </td>
        </tr>
        <tr>
                <td>[Matejak2014a]</td>
                <td>M. Mateják, T. Kulhánek, J. Šilar, P. Privitzer, F. Ježek, and J. Kofránek, \"Physiolibrary - Modelica library for Physiology,\" in 10th International Modelica Conference, Lund, Sweden, 2014. </td>
        </tr>
        <tr>
                <td>[Matejak2014b]</td>
                <td>M. Mateják, \"Physiolibrary - fyziológia v Modelice,\" Medsoft, 2014. </td>
        </tr>
        <tr>
                <td>[Matejak2015]</td>
                <td>M. Mateják, T. Kulhánek, and S. Matoušek, \"Adair-based hemoglobin equilibrium with oxygen, carbon dioxide and hydrogen ion activity,\" Scandinavian Journal of Clinical & Laboratory Investigation, pp. 1-8, 2015.</td>
        </tr>
        
        <tr>
                <td>[MATSUOKA1994]</td>
                <td>T. MATSUOKA, A. DOTTA, and J. P. MORTOLA, \"Metabolic response to ambient temperature and hypoxia in sinoaortic-denervated rats,\" METHODS, vol. 14, p. 19, 1994. </td>
        </tr>
        <tr>
                <td>[Mattson1997]</td>
                <td>S. E. Mattson, H. Elmqvist, and J. F. Broenink, \"Modelica: An international effort to design the next generation modelling language,\" Journal A, vol. 38, pp. 16-19, 1997. </td>
        </tr>
        <tr>
                <td>[Mattsson1998]</td>
                <td>S. E. Mattsson, H. Elmqvist, and M. Otter, \"Physical system modeling with Modelica,\" Control Engineering Practice, vol. 6, pp. 501-510, 1998. </td>
        </tr>
        <tr>
                <td>[Mayerson1939]</td>
                <td>H. S. Mayerson, H. M. Sweeney, and L. A. Toth, THE INFLUENCE OF POSTURE ON CIRCULATION TIME vol. 125, 1939. </td>
        </tr>
        <tr>
                <td>[Mayerson1960]</td>
                <td>H. S. Mayerson, C. G. Wolfram, H. H. Shirley, and K. Wasserman, Regional differences in capillary permeability vol. 198, 1960. </td>
        </tr>
        <tr>
                <td>[Mayerson1960]</td>
                <td>H. S. Mayerson, C. G. Wolfram, H. H. Shirley, and K. Wasserman, Regional differences in capillary permeability vol. 198, 1960. </td>
        </tr>
        <tr>
                <td>[Mazzolai1999]</td>
                <td>L. Mazzolai, M. Maillard, J. Rossat, J. Nussberger, H. R. Brunner, and M. Burnier, \"Angiotensin II receptor blockade in normotensive subjects a direct comparison of three AT1 receptor antagonists,\" Hypertension, vol. 33, pp. 850-855, 1999. </td>
        </tr>
        <tr>
                <td>[McArdle2010]</td>
                <td>W. D. McArdle, F. I. Katch, and V. L. Katch, Exercise physiology: Nutrition, energy, and human performance: Lippincott Williams & Wilkins, 2010. </td>
        </tr>
        <tr>
                <td>[McGarry1976]</td>
                <td>J. D. McGarry and D. W. Foster, \"Ketogenesis and its regulation,\" The American Journal of Medicine, vol. 61, pp. 9-13, 1976. </td>
        </tr>
        <tr>
                <td>[McGarry1976]</td>
                <td>J. D. McGarry and D. W. Foster, \"Ketogenesis and its regulation,\" Am J Med, vol. 61, pp. 9-13, Jul 1976. </td>
        </tr>
        <tr>
                <td>[McGarry1975]</td>
                <td>J. McGarry, P. H. Wright, and D. W. Foster, \"Hormonal control of ketogenesis. Rapid activation of hepatic ketogenic capacity in fed rats by anti-insulin serum and glucagon,\" The Journal of Clinical Investigation, vol. 55, pp. 1202-1209, 1975. </td>
        </tr>
        <tr>
                <td>[McGarry1977]</td>
                <td>J. D. McGarry, G. P. Mannaerts, and D. W. Foster, \"A possible role for malonyl-CoA in the regulation of hepatic fatty acid oxidation and ketogenesis,\" The Journal of Clinical Investigation, vol. 60, pp. 265-270, 1977. </td>
        </tr>
        <tr>
                <td>[McKeever1958]</td>
                <td>W. McKeever, D. Gregg, and P. Canney, \"Oxygen uptake of the nonworking left ventricle,\" Circulation research, vol. 6, pp. 612-623, 1958. </td>
        </tr>
        <tr>
                <td>[MCKEEVER1958]</td>
                <td>W. P. MCKEEVER, D. E. GREGG, and P. C. CANNEY, \"Oxygen Uptake of the Nonworking Left Ventricle,\" Circulation Research, vol. 6, pp. 612-623, September 1, 1958 1958. </td>
        </tr>
        <tr>
                <td>[Mead1953]</td>
                <td>J. Mead and J. L. Whittenberger, Physical Properties of Human Lungs Measured During Spontaneous Respiration vol. 5, 1953. </td>
        </tr>
        <tr>
                <td>[Mellander1992]</td>
                <td>S. Mellander and J. Bjornberg, Regulation of Vascular Smooth Muscle Tone and Capillary Pressure vol. 7, 1992. </td>
        </tr>
        <tr>
                <td>[Mendelowitz1988]</td>
                <td>D. Mendelowitz and A. M. Scher, \"Pulsatile sinus pressure changes evoke sustained baroreflex responses in awake dogs,\" Am. J. Physiol, vol. 255, pp. H673-H678, 1988. </td>
        </tr>
        <tr>
                <td>[Metting1988]</td>
                <td>P. J. Metting, J. R. Strader, and S. L. Britton, Evaluation of whole body autoregulation in conscious dogs vol. 255, 1988. </td>
        </tr>
        <tr>
                <td>[Metting1989]</td>
                <td>P. J. Metting, P. M. Stein, B. A. Stoos, K. A. Kostrzewski, and S. L. Britton, Systemic vascular autoregulation amplifies pressor responses to vasoconstrictor agents vol. 256, 1989. </td>
        </tr>
        <tr>
                <td>[METZLER1986]</td>
                <td>C. H. METZLER, M.-E. LEE, T. N. THRASHER, and D. J. RAMSAY, \"Increased right or left atrial pressure stimulates release of atrial natriuretic peptides in conscious dogs,\" Endocrinology, vol. 119, pp. 2396-2398, 1986. </td>
        </tr>
        <tr>
                <td>[Mifflin1993]</td>
                <td>S. W. Mifflin, \"Inhibition of chemoreceptor inputs to nucleus of tractus solitarius neurons during baroreceptor stimulation,\" Am J Physiol, vol. 265, pp. R14-20, Jul 1993. </td>
        </tr>
        <tr>
                <td>[Michel1996]</td>
                <td>C. Michel, \"One hundred years of Starling's hypothesis,\" News in physiological sciences, vol. 11, pp. 229-237, 1996. </td>
        </tr>
        <tr>
                <td>[Miki1993]</td>
                <td>K. Miki, Y. Hayashida, and K. Shiraki, Cardiac-renal-neural reflex plays a major role in natriuresis induced by left atrial distension vol. 264, 1993. </td>
        </tr>
        <tr>
                <td>[Miki1989]</td>
                <td>K. Miki, Y. Hayashida, S. Sagawa, and K. Shiraki, Renal sympathetic nerve activity and natriuresis during water immersion in conscious dogs vol. 256, 1989. </td>
        </tr>
        <tr>
                <td>[Miki1989]</td>
                <td>K. Miki, Y. Hayashida, F. Tajima, J. Iwamoto, and K. Shiraki, Renal sympathetic nerve activity and renal responses during head-up tilt in conscious dogs vol. 257, 1989. </td>
        </tr>
        <tr>
                <td>[Miles1983]</td>
                <td>J. M. Miles and J. E. Gerich, \"Glucose and ketone body kinetics in diabetic ketoacidosis,\" Clin Endocrinol Metab, vol. 12, pp. 303-19, Jul 1983. </td>
        </tr>
        <tr>
                <td>[Miles1983]</td>
                <td>J. M. Miles and J. E. Gerich, \"Glucose and ketone body kinetics in diabetic ketoacidosis,\" Clin Endocrinol Metab, vol. 12, pp. 303-19, Jul 1983. </td>
        </tr>
        <tr>
                <td>[Miles1980]</td>
                <td>J. M. Miles, R. A. Rizza, M. W. Haymond, and J. E. Gerich, \"Effects of Acute Insulin Deficiency on Glucose and Ketone Body Turnover in Man: Evidence for the Primacy of Overproduction of Glucose and Ketone Bodies in the Genesis of Diabetic Ketoacidosis,\" Diabetes, vol. 29, pp. 926-930, November 1, 1980 1980. </td>
        </tr>
        <tr>
                <td>[Miles1995]</td>
                <td>P. D. Miles, M. Levisetti, D. Reichart, M. Khoursheed, A. Moossa, and J. M. Olefsky, \"Kinetics of insulin action in vivo: identification of rate-limiting steps,\" Diabetes, vol. 44, pp. 947-953, 1995. </td>
        </tr>
        <tr>
                <td>[Milledge1985]</td>
                <td>J. Milledge and P. Cotes, \"Serum erythropoietin in humans at high altitude and its relation to plasma renin,\" Journal of applied physiology (Bethesda, Md.: 1985), vol. 59, p. 360, 1985. </td>
        </tr>
        <tr>
                <td>[Miller1982]</td>
                <td>M. E. Miller, E. P. Cronkite, and J. F. Garcia, \"Plasma levels of immunoreactive erythropoietin after acute blood loss in man,\" British journal of haematology, vol. 52, pp. 545-549, 1982. </td>
        </tr>
        <tr>
                <td>[Miserocchi2001]</td>
                <td>G. Miserocchi, D. Negrini, A. Passi, and G. De Luca, Development of Lung Edema: Interstitial Fluid Dynamics and Molecular Structure vol. 16, 2001. </td>
        </tr>
        <tr>
                <td>[Mitzner1974]</td>
                <td>W. Mitzner, Hepatic outflow resistance, sinusoid pressure, and the vascular waterfall vol. 227, 1974. </td>
        </tr>
        <tr>
                <td>[Miura1977]</td>
                <td>Y. Miura, V. Campese, V. DeQuattro, and D. Meijer, \"Plasma catecholamines via an improved fluorimetric assay: comparison with an enzymatic method,\" J Lab Clin Med, vol. 89, pp. 421-427, 1977. </td>
        </tr>
        <tr>
                <td>[Mizelle1990]</td>
                <td>H. L. Mizelle, D. A. Hildebrandt, C. A. Gaillard, M. W. Brands, J.-P. Montani, M. J. Smith Jr, et al., \"Atrial natriuretic peptide induces sustained natriuresis in conscious dogs,\" American Journal of Physiology-Regulatory, Integrative and Comparative Physiology, vol. 258, pp. R1445-R1452, 1990. </td>
        </tr>
        <tr>
                <td>[Molnar1946]</td>
                <td>G. Molnar, \"Survival of hypothermia by men immersed in the ocean,\" Journal of the American Medical Association, vol. 131, pp. 1046-1050, 1946. </td>
        </tr>
        <tr>
                <td>[Monos2001]</td>
                <td>E. Monos, M. Lóránt, and E. Fehér, Influence of long-term experimental orthostatic body position on innervation density in extremity vessels vol. 281, 2001. </td>
        </tr>
        <tr>
                <td>[Monos2003]</td>
                <td>E. Monos, M. Lóránt, G. Dörnyei, V. Bérczi, and G. Nádasy, Long-Term Adaptation Mechanisms in Extremity Veins Supporting Orthostatic Tolerance vol. 18, 2003. </td>
        </tr>
        <tr>
                <td>[MONROE1960]</td>
                <td>R. G. MONROE and G. FRENCH, \"Ventricular Pressure-Volume Relationships and Oxygen Consumption in Fibrillation and Arrest,\" Circulation Research, vol. 8, pp. 260-266, January 1, 1960 1960. </td>
        </tr>
        <tr>
                <td>[MONROE1961]</td>
                <td>R. G. MONROE and G. N. FRENCH, \"Left ventricular pressure-volume relationships and myocardial oxygen consumption in the isolated heart,\" Circulation research, vol. 9, pp. 362-373, 1961. </td>
        </tr>
        <tr>
                <td>[Moore1990]</td>
                <td>L. C. Moore and D. Casellas, \"Tubuloglomerular feedback dependence of autoregulation in rat juxtamedullary afferent arterioles,\" Kidney Int, vol. 37, pp. 1402-1408, 06//print 1990. </td>
        </tr>
        <tr>
                <td>[Moore1959]</td>
                <td>E. W. Moore, M. L. Mitchell, and T. C. Chalmers, \"VARIABILITY IN ABSORPTION OF INSULIN-I131 IN NORMAL AND DIABETIC SUBJECTS AFTER SUBCUTANEOUS AND INTRAMUSCULAR INJECTION*,\" The Journal of Clinical Investigation, vol. 38, pp. 1222-1227, 1959. </td>
        </tr>
        <tr>
                <td>[Morgan1969]</td>
                <td>T. Morgan and R. W. Berliner, \"A Study by Continuous Microperfusion of Water and Electrolyte Movements in the Loop of Henle and Distal Tubule of the Rat,\" Nephron, vol. 6, pp. 388-405, 1969. </td>
        </tr>
        <tr>
                <td>[Morimoto1998]</td>
                <td>T. Morimoto and T. Itoh, \"Thermoregulation and body fluid osmolality,\" Journal of basic and clinical physiology and pharmacology, vol. 9, pp. 51-72, 1998. </td>
        </tr>
        <tr>
                <td>[Morita1985]</td>
                <td>H. Morita and S. F. Vatner, Effects of volume expansion on renal nerve activity, renal blood flow, and sodium and water excretion in conscious dogs vol. 249, 1985. </td>
        </tr>
        <tr>
                <td>[Morton1980]</td>
                <td>J. Morton, M. Tree, and J. Casals-Stenzel, \"The effect of captopril on blood pressure and angiotensins I, I1 and 111 in sodium-depleted dogs: problems associated with the measurement of angiotensin I1 after inhibition of converting enzyme,\" Clinical Science, vol. 58, p. 450, 1980. </td>
        </tr>
        <tr>
                <td>[Moses1972]</td>
                <td>S. W. Moses, N. Bashan, and A. Gutman, Glycogen Metabolism in the Normal Red Blood Cell vol. 40, 1972. </td>
        </tr>
        <tr>
                <td>[Moses1974]</td>
                <td>S. W. Moses, N. Bashan, A. Gutman, and P. A. Ockerman, Glycogen Metabolism in Glycogen-rich Erythrocytes vol. 44, 1974. </td>
        </tr>
        <tr>
                <td>[Müller]</td>
                <td>W. A. Müller, G. R. Faloona, and R. H. Unger, \"Hyperglucagonemia in diabetic ketoacidosis,\" The American Journal of Medicine, vol. 54, pp. 52-57.</td>
        <tr>
                <td>[Murphy1960]</td>
                <td>J. Murphy, \"Erythrocyte metabolism,\" J Lah Clin Med, 1960. </td>
        </tr>
        <tr>
                <td>[Murphy2008]</td>
                <td>E. Murphy and C. Steenbergen, \"Ion transport and energetics during cell death and protection,\" Physiology (Bethesda), vol. 23, pp. 115-23, Apr 2008. </td>
        </tr>
        <tr>
                <td>[Myers2010]</td>
                <td>M. G. Myers Jr, R. L. Leibel, R. J. Seeley, and M. W. Schwartz, \"Obesity and leptin resistance: distinguishing cause from effect,\" Trends in Endocrinology & Metabolism, vol. 21, pp. 643-651, 11// 2010. </td>
        </tr>
        <tr>
                <td>[MYLLE1959]</td>
                <td>M. MYLLE, \"Localization of urine acidification in the mammalian kidney’j’,\" in Fed. Proc, 1959. </td>
        </tr>
        <tr>
                <td>[Neuhofer2006]</td>
                <td>W. Neuhofer and F.-X. Beck, Survival in Hostile Environments: Strategies of Renal Medullary Cells vol. 21, 2006. </td>
        </tr>
        <tr>
                <td>[Nicoloff1972]</td>
                <td>J. T. Nicoloff, J. C. Low, J. H. Dussault, and D. A. Fisher, \"Simultaneous Measurement of Thyroxine and Triiodothyronine Peripheral Turnover Kinetics in Man,\" The Journal of Clinical Investigation, vol. 51, pp. 473-483, 1972. </td>
        </tr>
        <tr>
                <td>[Nielsen1952]</td>
                <td>M. Nielsen and H. Smith, \"Studies on the Regulation of Respiration in Acute Hypoxia: With an Appendix on Kespiratory (Control During Prolonged Hypoxia,\" Acta Physiologica Scandinavica, vol. 24, pp. 293-313, 1952. </td>
        </tr>
        <tr>
                <td>[Nielsen1988]</td>
                <td>A. M. Nielsen, G. E. Bisgard, and E. H. Vidruk, Carotid chemoreceptor activity during acute and sustained hypoxia in goats vol. 65, 1988. </td>
        </tr>
        <tr>
                <td>[Nielsen2000]</td>
                <td>S. Nielsen, T.-H. Kwon, J. Frokiar, and M. A. Knepper, \"Key roles of renal aquaporins in water balance and water-balance disorders,\" Physiology, vol. 15, pp. 136-143, 2000. </td>
        </tr>
        <tr>
                <td>[Nicholls1987]</td>
                <td>M. Nicholls and A. Richards, \"Human studies with atrial natriuretic factor,\" Endocrinology and metabolism clinics of North America, vol. 16, pp. 199-223, 1987. </td>
        </tr>
        <tr>
                <td>[Nilsson2005]</td>
                <td>E. L. Nilsson and P. Fritzson, \"Biochemical and metabolic modeling and simulation with Modelica,\" BioMedSim. Linköping, Sweden, 2005. </td>
        </tr>
        <tr>
                <td>[Nilsson2005]</td>
                <td>E. L. Nilsson and P. Fritzson, \"A Metabolic Specialization of a General Purpose Modelica Library for Biological and Biochemical Systems,\" in Paper presented at the 4th International Modelica Conference, 2005. </td>
        </tr>
        <tr>
                <td>[Nishikimi1994]</td>
                <td>T. Nishikimi, K. Miura, N. Minamino, K. Takeuchi, and T. Takeda, Role of endogenous atrial natriuretic peptide on systemic and renal hemodynamics in heart failure rats vol. 267, 1994. </td>
        </tr>
        <tr>
                <td>[NODA1993]</td>
                <td>T. NODA, C.-P. CHENG, P. P. DE TOMBE, and W. C. LITTLE, \"Curvilinearity of LV end-systolic pressure-volume and dP/dt,-end-diastolic volume relations,\" 1993. </td>
        </tr>
        <tr>
                <td>[O’ROURKE1990]</td>
                <td>S. T. O’ROURKE and P. M. VANHOUTTE, \"Adrenergic and cholinergic responsiveness of isolated canine bronchial arteries,\" Organ, vol. 6, p. 2, 1990. </td>
        </tr>
        <tr>
                <td>[Oelkers1978]</td>
                <td>W. Oelkers, M. Schöneshöfer, G. Schultze, and B. Bauer, \"Effect of prolonged low-dose infusions of ile5-angiotensin II on blood pressure, aldosterone and electrolyte excretion in sodium replete man,\" Klinische Wochenschrift, vol. 56, pp. 37-41, 1978/01/01 1978. </td>
        </tr>
        <tr>
                <td>[Oelkers1974]</td>
                <td>W. Oelkers, J. J. Brown, R. Fraser, A. F. Lever, J. J. MORTON, and J. I. S. ROBERTSON, \"Sensitization of the adrenal cortex to angiotensin II in sodium-deplete man,\" Circulation research, vol. 34, pp. 69-77, 1974. </td>
        </tr>
        <tr>
                <td>[Oelkers1974]</td>
                <td>W. Oelkers, J. J. Brown, R. Fraser, A. F. Lever, J. J. MORTON, and J. I. S. ROBERTSON, \"Sensitization of the adrenal cortex to angiotensin II in sodium-deplete man,\" Circulation research, vol. 34, pp. 69-77, 1974. </td>
        </tr>
        <tr>
                <td>[Ohneda1969]</td>
                <td>A. Ohneda, E. Aguilar-Parada, A. M. Eisentraut, and R. H. Unger, \"Control of Pancreatic Glucagon S"
           + "ecretion by Glucose,\" Diabetes, vol. 18, pp. 1-10, January 1, 1969 1969. </td>
        </tr>
        <tr>
                <td>[OCHSNER1951]</td>
                <td>A. OCHSNER, R. COLP, and G. E. BURCH, \"Normal Blood Pressure in the Superficial Venous System of Man at Rest in the Supine Position,\" Circulation, vol. 3, pp. 674-680, May 1, 1951 1951. </td>
        </tr>
        <tr>
                <td>[Olsen1985]</td>
                <td>M. E. Olsen, J. E. Hall, J.-P. Montani, A. C. Guyton, H. G. Langford, and J. E. Cornell, \"Mechanisms of angiotensin II natriuresis and antinatriuresis,\" Am J Physiol, vol. 249, pp. F299-F307, 1985. </td>
        </tr>
        <tr>
                <td>[Olszewski1980]</td>
                <td>W. L. Olszewski and A. Engeset, Intrinsic contractility of prenodal lymph vessels and lymph flow in human leg vol. 239, 1980. </td>
        </tr>
        <tr>
                <td>[Orešković2010]</td>
                <td>D. Orešković and M. Klarica, \"The formation of cerebrospinal fluid: nearly a hundred years of interpretations and misinterpretations,\" Brain research reviews, vol. 64, pp. 241-262, 2010. </td>
        </tr>
        <tr>
                <td>[Orloff1973]</td>
                <td>J. Orloff, R. W. Berliner, and S. R. Geiger, Handbook of Physiology: Section 8, Renal Physiology: American Physiological Society, 1973. </td>
        </tr>
        <tr>
                <td>[Osiba1957]</td>
                <td>S. Osiba, \"THE SEASONAL VARIATION OF BASAL METABOLISM AND ACTIVITY OF THYROID GLAND IN MAN,\" The Japanese Journal of Physiology, vol. 7, pp. 355-365, 1957. </td>
        </tr>
        <tr>
                <td>[Owen1967]</td>
                <td>O. E. Owen, A. P. Morgan, H. G. Kemp, J. M. Sullivan, M. G. Herrera, and G. F. Cahill, Jr., \"Brain Metabolism during Fasting*,\" The Journal of Clinical Investigation, vol. 46, pp. 1589-1595, 1967. </td>
        </tr>
        <tr>
                <td>[Owen1967]</td>
                <td>O. E. Owen, A. P. Morgan, H. G. Kemp, J. M. Sullivan, M. G. Herrera, and G. F. Cahill, Jr., \"Brain Metabolism during Fasting*,\" The Journal of Clinical Investigation, vol. 46, pp. 1589-1595, 1967. </td>
        </tr>
        <tr>
                <td>[Owen1983]</td>
                <td>O. E. Owen, S. Caprio, G. A. Reichard, Jr., M. A. Mozzoli, G. Boden, and R. S. Owen, \"Ketosis of starvation: a revisit and new perspectives,\" Clin Endocrinol Metab, vol. 12, pp. 359-79, Jul 1983. </td>
        </tr>
        <tr>
                <td>[Pack1993]</td>
                <td>A. Pack and A. Gottschalk, \"Mechanisms of ventilatory periodicities,\" Annals of Biomedical Engineering, vol. 21, pp. 537-544, 1993/09/01 1993. </td>
        </tr>
        <tr>
                <td>[Pagel1988]</td>
                <td>H. Pagel, W. Jelkmann, and C. Weiss, \"A comparison of the effects of renal artery constriction and anemia on the production of erythropoietin,\" Pflügers Archiv, vol. 413, pp. 62-66, 1988/11/01 1988. </td>
        </tr>
        <tr>
                <td>[Palm2013]</td>
                <td>H. Palm, J. Holzmann, R. Klein, S.-A. Schneider, and D. Gerling, \"A Novel Approach on Virtual Systems Prototyping Based on a Validated, Hierarchical, Modular Library,\" Embedded World, Nuremberg, Germany, 2013. </td>
        </tr>
        <tr>
                <td>[Pare1982]</td>
                <td>P. D. Pare, L. A. Brooks, J. Bates, L. M. Lawson, J. M. Nelems, J. L. Wright, et al., \"Exponential analysis of the lung pressure-volume curve as a predictor of pulmonary emphysema,\" The American review of respiratory disease, vol. 126, pp. 54-61, 1982/07// 1982. </td>
        </tr>
        <tr>
                <td>[Park1998]</td>
                <td>F. Park, A.-P. Zou, and A. W. Cowley, \"Arginine vasopressin–mediated stimulation of nitric oxide within the rat renal medulla,\" Hypertension, vol. 32, pp. 896-901, 1998. </td>
        </tr>
        <tr>
                <td>[Pedersen1975]</td>
                <td>E. B. Pedersen and N. Christensen, \"Catecholamines in Plasma and Urine in Patients with Essential Hypertension Determined by Double-Isotope Derivative Techniques,\" Acta Medica Scandinavica, vol. 198, pp. 373-377, 1975. </td>
        </tr>
        <tr>
                <td>[Pennes1948]</td>
                <td>H. H. Pennes, Analysis of Tissue and Arterial Blood Temperatures in the Resting Human Forearm vol. 1, 1948. </td>
        </tr>
        <tr>
                <td>[Perley1966]</td>
                <td>M. Perley and D. M. Kipnis, \"Plasma Insulin Responses to Glucose and Tolbutamide of Normal Weight and Obese Diabetic and Nondiabetic Subjects,\" Diabetes, vol. 15, pp. 867-874, December 1, 1966 1966. </td>
        </tr>
        <tr>
                <td>[Permutt1960]</td>
                <td>S. Permutt and H. B. Martin, Static pressure-volume characteristics of lungs in normal males vol. 15, 1960. </td>
        </tr>
        <tr>
                <td>[Peti-Peterdi2009]</td>
                <td>J. Peti-Peterdi, I. Toma, A. Sipos, and S. L. Vargas, \"Multiphoton imaging of renal regulatory mechanisms,\" Physiology, vol. 24, pp. 88-96, 2009. </td>
        </tr>
        <tr>
                <td>[Pfaller1982]</td>
                <td>W. Pfaller, \"Structure function correlation on rat kidney,\" Adv Anat Embryol Cell Biol, vol. 70, 1982. </td>
        </tr>
        <tr>
                <td>[PHILIPPOPOULOS1959]</td>
                <td>G. S. PHILIPPOPOULOS, \"THYROTOXICOSIS AND ITS PSYCHOSOMATIC APPROACH 1,\" The Journal of Nervous and Mental Disease, vol. 128, pp. 415-424, 1959. </td>
        </tr>
        <tr>
                <td>[Pico2003]</td>
                <td>C. Pico, P. Oliver, J. Sanchez, and A. Palou, \"Gastric leptin: a putative role in the short-term regulation of food intake,\" British Journal of Nutrition, vol. 90, pp. 735-741, 2003. </td>
        </tr>
        <tr>
                <td>[Pierson1974]</td>
                <td>R. Pierson Jr, D. Lin, and R. Phillips, \"Total-body potassium in health: effects of age, sex, height, and fat,\" American Journal of Physiology--Legacy Content, vol. 226, pp. 206-212, 1974. </td>
        </tr>
        <tr>
                <td>[Piwonka1967]</td>
                <td>R. W. Piwonka and S. Robinson, Acclimatization of highly trained men to work in severe heat vol. 22, 1967. </td>
        </tr>
        <tr>
                <td>[Pogátsa1982]</td>
                <td>G. Pogátsa, M. Z. Koltai, and G. Grósz, \"The role of the myocardial water content in heart function,\" Acta physiologica Academiae Scientiarum Hungaricae, vol. 59, pp. 305-309, 1982 1982. </td>
        </tr>
        <tr>
                <td>[POHOST1976]</td>
                <td>G. M. POHOST, J. B. NEWELL, N. P. HAMLIN, and W. J. POWELL, \"Observations on autoregulation in skeletal muscle: the effects of arterial hypoxia,\" Cardiovascular Research, vol. 10, pp. 405-412, July 1, 1976 1976. </td>
        </tr>
        <tr>
                <td>[Pollack1949]</td>
                <td>A. A. Pollack and E. H. Wood, Venous Pressure in the Saphenous Vein at the Ankle in Man during Exercise and Changes in Posture vol. 1, 1949. </td>
        </tr>
        <tr>
                <td>[Porter1993]</td>
                <td>D. Porter and M. Goldberg, \"Regulation of erythropoietin production,\" Experimental hematology, vol. 21, pp. 399-404, 1993. </td>
        </tr>
        <tr>
                <td>[Potts1993]</td>
                <td>J. T. Potts, X. R. Shi, and P. B. Raven, \"Carotid baroreflex responsiveness during dynamic exercise in humans,\" American Journal of Physiology, vol. 265, pp. H1928-H1928, 1993. </td>
        </tr>
        <tr>
                <td>[Powell1983]</td>
                <td>F. L. Powell and R. W. Mazzone, \"Morphometrics of rapidly frozen goose lungs,\" Respir Physiol, vol. 51, pp. 319-32, Mar 1983. </td>
        </tr>
        <tr>
                <td>[Prabhu1993]</td>
                <td>S. D. Prabhu and G. L. Freeman, \"Left ventricular energetics in closed-chest dogs,\" Am J Physiol, vol. 265, pp. H1048-55, Oct 1993. </td>
        </tr>
        <tr>
                <td>[Prager1986]</td>
                <td>R. Prager, P. Wallace, and J. M. Olefsky, \"In vivo kinetics of insulin action on peripheral glucose disposal and hepatic glucose output in normal and obese subjects,\" Journal of Clinical Investigation, vol. 78, p. 472, 1986. </td>
        </tr>
        <tr>
                <td>[Prager1986]</td>
                <td>R. Prager, P. Wallace, and J. M. Olefsky, \"In vivo kinetics of insulin action on peripheral glucose disposal and hepatic glucose output in normal and obese subjects,\" The Journal of Clinical Investigation, vol. 78, pp. 472-481, 1986. </td>
        </tr>
        <tr>
                <td>[Prager1987]</td>
                <td>R. Prager, P. Wallace, and J. M. Olefsky, \"Hyperinsulinemia does not compensate for peripheral insulin resistance in obesity,\" Diabetes, vol. 36, pp. 327-334, 1987. </td>
        </tr>
        <tr>
                <td>[Prager1987]</td>
                <td>R. Prager, P. Wallace, and J. M. Olefsky, \"Hyperinsulinemia Does Not Compensate for Peripheral Insulin Resistance in Obesity,\" Diabetes, vol. 36, pp. 327-334, March 1, 1987 1987. </td>
        </tr>
        <tr>
                <td>[Previs2000]</td>
                <td>S. F. Previs, D. J. Withers, J. M. Ren, M. F. White, and G. I. Shulman, \"Contrasting effects of IRS-1 versus IRS-2 gene disruption on carbohydrate and lipid metabolism in vivo,\" J Biol Chem, vol. 275, pp. 38990-4, Dec 15 2000. </td>
        </tr>
        <tr>
                <td>[Prewitt1976]</td>
                <td>R. L. Prewitt and P. C. Johnson, \"The effect of oxygen on arteriolar red cell velocity and capillary density in the rat cremaster muscle,\" Microvascular Research, vol. 12, pp. 59-70, 7// 1976. </td>
        </tr>
        
        <tr>
                <td>[Proß2011]</td>
                <td>S. Proß and B. Bachmann, \"An Advanced Environment for Hybrid Modeling and Parameter Identification of Biological Systems,\" 2011. </td>
        </tr>
        <tr>
                <td>[Pruett2014]</td>
                <td>W. A. Pruett and R. L. Hester, \"Parathyroid hormone secretion by multiple distinct cell populations, a time dynamic mathematical model,\" Physiological reports, vol. 2, 2014. </td>
        </tr>
        <tr>
                <td>[Pruett2013]</td>
                <td>W. A. Pruett, L. D. Husband, G. Husband, M. Dakhlalla, K. Bellamy, T. G. Coleman, et al., \"A Population Model of Integrative Cardiovascular Physiology,\" PloS one, vol. 8, p. e74329, 2013. </td>
        </tr>
        <tr>
                <td>[Pruett2013]</td>
                <td>W. A. Pruett, L. D. Husband, G. Husband, M. Dakhlalla, K. Bellamy, T. G. Coleman, et al., \"A Population Model of Integrative Cardiovascular Physiology,\" PloS one, vol. 8, p. e74329, 2013. </td>
        </tr>
        <tr>
                <td>[Puceat1999]</td>
                <td>M. Puceat, \"pHi regulatory ion transporters: an update on structure, regulation and cell function,\" Cell Mol Life Sci, vol. 55, pp. 1216-29, Aug 15 1999. </td>
        </tr>
        <tr>
                <td>[Purves1970]</td>
                <td>M. J. Purves, \"The effect of hypoxia, hypercapnia and hypotension upon carotid body blood flow and oxygen consumption in the cat,\" The Journal of Physiology, vol. 209, pp. 395-416, August 1, 1970 1970. </td>
        </tr>
        <tr>
                <td>[Quinton1991]</td>
                <td>P. Quinton and M. Reddy, \"Regulation of absorption in the human sweat duct,\" in The Identification of the CF (Cystic Fibrosis) Gene, ed: Springer, 1991, pp. 159-172. </td>
        </tr>
        <tr>
                <td>[Rabie2008]</td>
                <td>T. Rabie and H. H. Marti, Brain Protection by Erythropoietin: A Manifold Task vol. 23, 2008. </td>
        </tr>
        <tr>
                <td>[Raeder1995]</td>
                <td>E. A. Raeder, P. Albrecht, M. Perrott, and R. J. Cohen, \"Kinetics of Cycle Length Dependence of Ventricular Repolarization,\" Journal of Cardiovascular Electrophysiology, vol. 6, pp. 163-169, 1995. </td>
        </tr>
        <tr>
                <td>[Rahmouni2002]</td>
                <td>K. Rahmouni, W. G. Haynes, and A. L. Mark, \"Cardiovascular and sympathetic effects of leptin,\" Current hypertension reports, vol. 4, pp. 119-125, 2002. </td>
        </tr>
        <tr>
                <td>[Rahn1946]</td>
                <td>H. Rahn, A. B. Otis, L. E. Chadwick, and W. O. Fenn, THE PRESSURE-VOLUME DIAGRAM OF THE THORAX AND LUNG vol. 146, 1946. </td>
        </tr>
        <tr>
                <td>[Raine1986]</td>
                <td>A. E. Raine, P. Erne, E. Bürgisser, F. B. Müller, P. Bolli, F. Burkart, et al., \"Atrial natriuretic peptide and atrial pressure in patients with congestive heart failure,\" New England Journal of Medicine, vol. 315, pp. 533-537, 1986. </td>
        </tr>
        <tr>
                <td>[Randle1986]</td>
                <td>P. J. Randle, \"Fuel selection in animals,\" Biochemical Society Transactions, vol. 14, p. 799, 1986. </td>
        </tr>
        <tr>
                <td>[Rappaport1973]</td>
                <td>A. M. Rappaport, \"The microcirculatory hepatic unit,\" Microvascular Research, vol. 6, pp. 212-228, 9// 1973. </td>
        </tr>
        <tr>
                <td>[Raskin1975]</td>
                <td>P. Raskin, Y. Fujita, and R. H. Unger, \"Effect of insulin-glucose infusions on plasma glucagon levels in fasting diabetics and nondiabetics,\" The Journal of Clinical Investigation, vol. 56, pp. 1132-1138, 1975. </td>
        </tr>
        <tr>
                <td>[Rasmussen1999]</td>
                <td>B. B. Rasmussen and R. R. Wolfe, \"Regulation of fatty acid oxidation in skeletal muscle,\" Annual review of nutrition, vol. 19, pp. 463-484, 1999. </td>
        </tr>
        <tr>
                <td>[Raven1984]</td>
                <td>P. B. Raven, D. Rohm-Young, and C. G. Blomqvist, Physical fitness and cardiovascular response to lower body negative pressure vol. 56, 1984. </td>
        </tr>
        <tr>
                <td>[Reed1993]</td>
                <td>R. K. Reed, M. Ishibashi, M. Townsley, J. Parker, and A. Taylor, \"Blood-to-tissue clearance vs. lymph analysis in determining capillary transport characteristics for albumin in skin,\" AMERICAN JOURNAL OF PHYSIOLOGY, vol. 264, pp. H1394-H1394, 1993. </td>
        </tr>
        <tr>
                <td>[Regoli1962]</td>
                <td>D. Regoli, R. Hess, H. Brunner, G. Peters, and F. Gross, \"Interrelationship of renin content in kidneys and blood pressure in renal hypertensive rats,\" Archives internationales de pharmacodynamie et de thérapie, vol. 140, p. 416, 1962. </td>
        </tr>
        <tr>
                <td>[Reid1980]</td>
                <td>J. L. Reid, D. H. Jones, G. Fitzgerald, D. Davies, and A. Boobis, \"Catecholamine Turnover in Essential Hypertension,\" Clinical and Experimental Hypertension, vol. 2, pp. 395-408, 1980. </td>
        </tr>
        <tr>
                <td>[Reichard1974]</td>
                <td>G. A. Reichard, Jr., O. E. Owen, A. C. Haff, P. Paul, and W. M. Bortz, \"Ketone-body production and oxidation in fasting obese humans,\" The Journal of Clinical Investigation, vol. 53, pp. 508-515, 1974. </td>
        </tr>
        <tr>
                <td>[Reissmann1965]</td>
                <td>K. R. Reissmann, D. A. Diederich, K. Ito, and J. Schmaus, \"Influence of disappearance rate and distribution space on plasma concentration of erythropoietin in normal rats,\" J Lab Clin Med, vol. 65, pp. 967-975, 1965. </td>
        </tr>
        <tr>
                <td>[Reivich1964]</td>
                <td>M. Reivich, Arterial Pco2 and cerebral hemodynamics vol. 206, 1964. </td>
        </tr>
        <tr>
                <td>[Renkin1986]</td>
                <td>E. M. Renkin, Some consequences of capillary permeability to macromolecules: Starling's hypothesis reconsidered vol. 250, 1986. </td>
        </tr>
        <tr>
                <td>[Renkin1996]</td>
                <td>E. M. Renkin and V. L. Tucker, \"Atria1 Natriuretic Peptide as a Regulator of Transvascdar Fluid Balance,\" 1996. </td>
        </tr>
        <tr>
                <td>[Renkin1996]</td>
                <td>E. Renkin and V. Tucker, \"Atrial Natriuretic Peptide as a Regulator of Transvascular Fluid Balance,\" Physiology, vol. 11, pp. 138-143, 1996. </td>
        </tr>
        <tr>
                <td>[Renkin1992]</td>
                <td>E. M. Renkin, V. Tucker, K. Rew, D. O'Loughlin, M. Wong, and L. Sibley, Plasma volume expansion with colloids increases blood-tissue albumin transport vol. 262, 1992. </td>
        </tr>
        <tr>
                <td>[Ridgway1974]</td>
                <td>E. C. Ridgway, B. D. Weintraub, and F. Maloof, \"Metabolic Clearance and Production Rates of Human Thyrotropin,\" The Journal of Clinical Investigation, vol. 53, pp. 895-903, 1974. </td>
        </tr>
        <tr>
                <td>[Risöe1994]</td>
                <td>C. Risöe, W. Tan, and O. A. Smiseth, \"Effect of carotid sinus baroreceptor reflex on hepatic and splenic vascular capacitance in vagotomized dogs,\" AMERICAN JOURNAL OF PHYSIOLOGY, vol. 266, pp. H1528-H1528, 1994. </td>
        </tr>
        <tr>
                <td>[Roach1957]</td>
                <td>M. R. Roach and A. C. Burton, \"THE REASON FOR THE SHAPE OF THE DISTENSIBILITY CURVES OF ARTERIES,\" Canadian Journal of Biochemistry and Physiology, vol. 35, pp. 681-690, 1957/08/01 1957. </td>
        </tr>
        <tr>
                <td>[Roarty1988]</td>
                <td>T. P. Roarty and H. Raff, \"Renin response to graded haemorrhage in conscious rats,\" Clinical and Experimental Pharmacology and Physiology, vol. 15, pp. 373-378, 1988. </td>
        </tr>
        <tr>
                <td>[Robin1958]</td>
                <td>E. D. Robin, R. D. Whaley, C. H. Crump, A. G. Bickelmann, and D. M. Travis, Acid-Base Relations Between Spinal Fluid and Arterial Blood With Special Reference to Control of Ventilation vol. 13, 1958. </td>
        </tr>
        <tr>
                <td>[Roblitz2013]</td>
                <td>S. Roblitz, C. Stotzel, P. Deuflhard, H. M. Jones, D. O. Azulay, P. H. van der Graaf, et al., \"A mathematical model of the human menstrual cycle for the administration of GnRH analogues,\" J Theor Biol, vol. 321, pp. 8-27, Mar 21 2013. </td>
        </tr>
        <tr>
                <td>[Röblitz2013]</td>
                <td>S. Röblitz, C. Stötzel, P. Deuflhard, H. M. Jones, D.-O. Azulay, P. H. van der Graaf, et al., \"A mathematical model of the human menstrual cycle for the administration of GnRH analogues,\" Journal of theoretical biology, vol. 321, pp. 8-27, 2013. </td>
        </tr>
        <tr>
                <td>[Rodgers1998]</td>
                <td>C. D. Rodgers and M. Vranic, \"Mediation of glucoregulation at rest and during exercise by the glucose-fatty acid cycle: in vivo and in vitro studies,\" Canadian journal of applied physiology, vol. 23, pp. 534-557, 1998. </td>
        </tr>
        <tr>
                <td>[Rodriguez-Nichols1984]</td>
                <td>F. Rodriguez-Nichols, E. Laughrey, and R. L. Tannen, Response of renal NH3 production to chronic respiratory acidosis vol. 247, 1984. </td>
        </tr>
        <tr>
                <td>[Rogers1993]</td>
                <td>R. F. Rogers, J. F. Paton, and J. S. Schwaber, \"NTS neuronal responses to arterial pressure and pressure changes in the rat,\" American Journal of Physiology, vol. 265, pp. R1355-R1355, 1993. </td>
        </tr>
        <tr>
                <td>[Roos1971]</td>
                <td>A. Roos, \"Intracellular pH and buffering power of rat brain,\" Am J Physiol, vol. 221, pp. 176-81, Jul 1971. </td>
        </tr>
        <tr>
                <td>[ROSS1965]</td>
                <td>J. ROSS, J. W. LINHART, and E. BRAUNWALD, \"Effects of Changing Heart Rate in Man by Electrical Stimulation of the Right Atrium: Studies at Rest, during Exercise, and with Isoproterenol,\" Circulation, vol. 32, pp. 549-558, October 1, 1965 1965. </td>
        </tr>
        <tr>
                <td>[Rother1998]</td>
                <td>K. I. Rother, Y. Imai, M. Caruso, F. Beguinot, P. Formisano, and D. Accili, \"Evidence That IRS-2 Phosphorylation Is Required for Insulin Action in Hepatocytes,\" Journal of Biological Chemistry, vol. 273, pp. 17491-17497, July 10, 1998 1998. </td>
        </tr>
        <tr>
                <td>[Rothman1991]</td>
                <td>D. L. Rothman, I. Magnusson, L. D. Katz, R. G. Shulman, and G. I. Shulman, \"Quantitation of hepatic glycogenolysis and gluconeogenesis in fasting humans with 13C NMR,\" Science, vol. 254, pp. 573-576, 1991. </td>
        </tr>
        <tr>
                <td>[Roush1995]</td>
                <td>W. Roush, \"An \"off switch\" for red blood cells,\" Science, vol. 268, pp. 27-28, April 7, 1995 1995. </td>
        </tr>
        <tr>
                <td>[Rowell1989]</td>
                <td>L. B. Rowell, D. G. Johnson, P. B. Chase, K. A. Comess, and D. R. Seals, Hypoxemia raises muscle sympathetic activity but not norepinephrine in resting humans vol. 66, 1989. </td>
        </tr>
        <tr>
                <td>[Ruderman2001]</td>
                <td>N. Ruderman and J. S. Flier, \"Chewing the Fat--ACC and Energy Balance,\" Science, vol. 291, pp. 2558-2559, March 30, 2001 2001. </td>
        </tr>
        <tr>
                <td>[Ruskoaho1992]</td>
                <td>H. Ruskoaho, \"Atrial natriuretic peptide: synthesis, release, and metabolism,\" Pharmacological Reviews, vol. 44, pp. 479-602, 1992. </td>
        </tr>
        <tr>
                <td>[Rutter2006]</td>
                <td>G. A. Rutter and E. V. Hill, Insulin Vesicle Release: Walk, Kiss, Pause … Then Run vol. 21, 2006. </td>
        </tr>
        <tr>
                <td>[Sagawa1988]</td>
                <td>K. Sagawa, L. Maughan, H. Suga, and K. Sunagawa, Cardiac contraction and the pressure-volume relationship vol. 480: Oxford University Press New York, 1988. </td>
        </tr>
        <tr>
                <td>[Sage1981]</td>
                <td>J. I. Sage, R. L. Van Uitert, and T. E. Duffy, \"Simultaneous Measurement of Cerebral Blood Flow and Unidirectional Movement of Substances Across the Blood-Brain Barrier: Theory, Method, and Application to Leucine,\" Journal of Neurochemistry, vol. 36, pp. 1731-1738, 1981. </td>
        </tr>
        <tr>
                <td>[Saltin1966]</td>
                <td>B. Saltin and L. Hermansen, Esophageal, rectal, and muscle temperature during exercise vol. 21, 1966. </td>
        </tr>
        <tr>
                <td>[Sands1999]</td>
                <td>J. M. Sands, Urea Transport: It’s Not Just “Freely Diffusible” Anymore vol. 14, 1999. </td>
        </tr>
        <tr>
                <td>[Sartorius1949]</td>
                <td>O. Sartorius, J. Roemmelt, R. Pitts, D. Calhoon, and P. Miner, \"The renal regulation of acid-base balance in man. IV. The nature of the renal compensations in ammonium chloride acidosis,\" Journal of Clinical Investigation, vol. 28, p. 423, 1949. </td>
        </tr>
        <tr>
                <td>[Sasaki1985]</td>
                <td>S. Sasaki, T. Shiigai, and J. Takeuchi, \"Intracellular pH in the isolated perfused rabbit proximal straight tubule,\" Am. J. Physiol, vol. 249, pp. F417-F423, 1985. </td>
        </tr>
        <tr>
                <td>[Sato1977]</td>
                <td>K. Sato, \"The physiology, pharmacology, and biochemistry of the eccrine sweat gland,\" in Reviews of Physiology, Biochemistry and Pharmacology, Volume 79, ed: Springer, 1977, pp. 51-131. </td>
        </tr>
        <tr>
                <td>[Sato1989]</td>
                <td>K. Sato, W. Kang, K. Saga, and K. Sato, \"Biology of sweat glands and their disorders. I. Normal sweat gland function,\" Journal of the American Academy of Dermatology, vol. 20, pp. 537-563, 1989. </td>
        </tr>
        <tr>
                <td>[Sato1989]</td>
                <td>K. Sato, W. Kang, K. Saga, and K. Sato, \"Biology of sweat glands and their disorders. II. Disorders of sweat gland function,\" Journal of the American Academy of Dermatology, vol. 20, pp. 713-726, 1989. </td>
        </tr>
        <tr>
                <td>[Sato1996]</td>
                <td>A. Sato, Y. Sato, A. Suzuki, and S. Uchida, \"Reflex modulation of catecholamine secretion and adrenal sympathetic nerve activity by acupuncture-like stimulation in anesthetized rat,\" Jpn J Physiol, vol. 46, pp. 411-21, Oct 1996. </td>
        </tr>
        <tr>
                <td>[Savin1983]</td>
                <td>V. J. Savin, \"Ultrafiltration in single isolated human glomeruli,\" Kidney Int, vol. 24, pp. 748-753, 12//print 1983. </td>
        </tr>
        <tr>
                <td>[Seals1991]</td>
                <td>D. R. Seals, D. G. Johnson, and R. F. Fregosi, \"Hyperoxia lowers sympathetic activity at rest but not during exercise in humans,\" Am J Physiol, vol. 260, pp. R873-8, May 1991. </td>
        </tr>
        <tr>
                <td>[Seeliger1999]</td>
                <td>E. Seeliger, K. Lohmann, B. Nafz, P. B. Persson, and H. W. Reinhardt, \"Pressure-dependent renin release: effects of sodium intake and changes of total body sodium,\" American Journal of Physiology-Regulatory, Integrative and Comparative Physiology, vol. 277, pp. R548-R555, 1999. </td>
        </tr>
        <tr>
                <td>[Sheiner1977]</td>
                <td>L. Sheiner, B. Rosenberg, and V. Marathe, \"Estimation of population characteristics of pharmacokinetic parameters from routine clinical data,\" Journal of Pharmacokinetics and Biopharmaceutics, vol. 5, pp. 445-479, 1977/10/01 1977. </td>
        </tr>
        <tr>
                <td>[Shek1998]</td>
                <td>E. W. Shek, M. W. Brands, and J. E. Hall, \"Chronic Leptin Infusion Increases Arterial Pressure,\" Hypertension, vol. 31, pp. 409-414, January 1, 1998 1998. </td>
        </tr>
        <tr>
                <td>[Sherwood2004]</td>
                <td>L. Sherwood and C. Learning, \"Human physiology: from cells to systems,\" 2004. </td>
        </tr>
        <tr>
                <td>[Shigemi1994]</td>
                <td>K. Shigemi, M. J. Brunner, and A. A. Shoukas, \"-and -Adrenergic mechanisms in the control of vascular capacitance by the carotid sinus baroreflex system,\" AMERICAN JOURNAL OF PHYSIOLOGY, vol. 267, pp. H201-H201, 1994. </td>
        </tr>
        <tr>
                <td>[ScHADE1975]</td>
                <td>D. S. ScHADE and R. Eaton, \"Glucagon regulation of plasma ketone body concentration in human diabetes,\" Journal of Clinical Investigation, vol. 56, p. 1340, 1975. </td>
        </tr>
        <tr>
                <td>[Schade1975]</td>
                <td>D. S. Schade and R. P. Eaton, \"Glucagon regulation of plasma ketone body concentration in human diabetes,\" The Journal of Clinical Investigation, vol. 56, pp. 1340-1344, 1975. </td>
        </tr>
        <tr>
                <td>[Schaefer1958]</td>
                <td>K. E. Schaefer, Respiratory Pattern and Respiratory Response to CO2 vol. 13, 1958. </td>
        </tr>
        <tr>
                <td>[Schally1966]</td>
                <td>A. V. Schally, C. Y. Bowers, T. W. Redding, and J. F. Barrett, \"Isolation of thyrotropin releasing factor (TRF) from porcine hypothalamus,\" Biochem Biophys Res Commun, vol. 25, pp. 165-9, Oct 20 1966. </td>
        </tr>
        <tr>
                <td>[Schling2002]</td>
                <td>P. Schling and G. Löffler, \"Cross talk between adipose tissue cells: impact on pathophysiology,\" Physiology, vol. 17, pp. 99-104, 2002. </td>
        </tr>
        <tr>
                <td>[Schmid-Schonbein1990]</td>
                <td>G. W. Schmid-Schonbein, Microlymphatics and lymph flow vol. 70, 1990. </td>
        </tr>
        <tr>
                <td>[SCHNEIDER1985]</td>
                <td>E. G. SCHNEIDER, K. J. RADKE, D. A. ULDERICH, and R. E. TAYLOR JR, \"Effect of Osmolality on Aldosterone Secretion*,\" Endocrinology, vol. 116, pp. 1621-1626, 1985. </td>
        </tr>
        <tr>
                <td>[Scholer1973]</td>
                <td>D. Scholer, M. Birkhäuser, A. Peytremann, A. Riondel, M. Vallotton, and A. Muller, \"Response of plasma aldosterone to angiotensin II, ACTH and potassium in man,\" Acta endocrinologica, vol. 72, pp. 293-307, 1973. </td>
        </tr>
        <tr>
                <td>[Schreiber1996]</td>
                <td>M. Schreiber, A. Steele, J. Goguen, A. Levin, and M. Halperin, \"Can a severe degree of ketoacidosis develop overnight?,\" Journal of the American Society of Nephrology, vol. 7, pp. 192-7, February 1, 1996 1996. </td>
        </tr>
        <tr>
                <td>[Schreider1957]</td>
                <td>E. Schreider, \"Ecological Rules and Body-heat Regulation in Man,\" Nature, vol. 179, pp. 915-916, 05/04/print 1957. </td>
        </tr>
        <tr>
                <td>[Schreij1996]</td>
                <td>G. Schreij, P. N. van Es, P. M. Schiffers, and P. W. de Leeuw, \"Renal extraction of atrial natriuretic peptide in hypertensive patients with or without renal artery stenosis,\" Hypertension, vol. 27, pp. 1254-1258, 1996. </td>
        </tr>
        <tr>
                <td>[Schrier1970]</td>
                <td>R. W. Schrier, K. M. McDonald, R. Wells, and D. P. Lauler, \"Influence of hematocrit and colloid on whole blood viscosity during volume expansion,\" Am. J. Physiol, vol. 218, p. 77, 1970. </td>
        </tr>
        <tr>
                <td>[Schwartz1987]</td>
                <td>N. S. Schwartz, W. E. Clutter, S. D. Shah, and P. E. Cryer, \"Glycemic thresholds for activation of glucose counterregulatory systems are higher than the threshold for symptoms,\" The Journal of Clinical Investigation, vol. 79, pp. 777-781, 1987. </td>
        </tr>
        <tr>
                <td>[Schwartz1996]</td>
                <td>M. W. Schwartz, D. G. Baskin, T. R. Bukowski, J. L. Kuijper, D. Foster, G. Lasser, et al., \"Specificity of leptin action on elevated blood glucose levels and hypothalamic neuropeptide Y gene expression in ob/ob mice,\" Diabetes, vol. 45, pp. 531-535, 1996. </td>
        </tr>
        <tr>
                <td>[Siesjö1973]</td>
                <td>B. Siesjö, \"Metabolic control of intracellular pH,\" Scandinavian Journal of Clinical & Laboratory Investigation, vol. 32, pp. 97-104, 1973. </td>
        </tr>
        <tr>
                <td>[Siesjö1971]</td>
                <td>B. K. Siesjö and L. Nilsson, \"The Influence of Arterial Hypoxemia upon Labile Phosphates and upon Extracellular and Intracellular Lactate and Pyruvate Concentrations in the Rat Brain,\" Scandinavian Journal of Clinical & Laboratory Investigation, vol. 27, pp. 83-96, 1971. </td>
        </tr>
        <tr>
                <td>[Silvers1980]</td>
                <td>G. W. Silvers, T. L. Petty, and R. E. Stanford, \"Elastic recoil changes in early emphysema,\" Thorax, vol. 35, pp. 490-495, July 1, 1980 1980. </td>
        </tr>
        <tr>
                <td>[Silverthorn2007]</td>
                <td>D. U. Silverthorn, B. R. Johnson, and W. C. Ober, Human physiology: Pearson/Benjamin Cummings, 2007. </td>
        </tr>
        <tr>
                <td>[Simpson1971]</td>
                <td>D. P. Simpson, \"Control of hydrogen ion homeostasis and renal acidosis,\" Medicine (Baltimore), vol. 50, pp. 503-41, Nov 1971. </td>
        </tr>
        <tr>
                <td>[Sinclair2005]</td>
                <td>E. M. Sinclair and D. J. Drucker, Proglucagon-Derived Peptides: Mechanisms of Action and Therapeutic Potential vol. 20, 2005. </td>
        </tr>
        <tr>
                <td>[Skarlatos1993]</td>
                <td>S. Skarlatos, N. DiPaola, R. A. Frankel, R. W. Pomerantz, P. H. Brand, P. J. Metting, et al., \"Spontaneous pressure-flow relationships in renal circulation of conscious dogs,\" Am J Physiol, vol. 264, pp. H1517-27, May 1993. </td>
        </tr>
        <tr>
                <td>[Skov1996]</td>
                <td>K. Skov, J. Fenger-Gron, and M. J. Mulvany, \"Effects of an angiotensin-converting enzyme inhibitor, a calcium antagonist, and an endothelin receptor antagonist on renal afferent arteriolar structure,\" Hypertension, vol. 28, pp. 464-471, 1996. </td>
        </tr>
        <tr>
                <td>[Smith2013]</td>
                <td>L. Smith, E. Butterworth, J. Bassingthwaighte, and H. Sauro, \"SBML and CellML translation in Antimony and JSim,\" Bioinformatics, p. btt641, 2013. </td>
        </tr>
        <tr>
                <td>[Sodja2009]</td>
                <td>A. Sodja and B. Zupančič, \"Modelling thermal processes in buildings using an object-oriented approach and Modelica,\" Simulation Modelling Practice and Theory, vol. 17, pp. 1143-1159, 2009. </td>
        </tr>
        <tr>
                <td>[Sonnenberg1973]</td>
                <td>H. Sonnenberg, \"Proximal and distal tubular function in salt-deprived and in salt-loaded deoxycorticosterone acetate-escaped rats,\" Journal of clinical Investigation, vol. 52, p. 263, 1973. </td>
        </tr>
        <tr>
                <td>[Speroff2005]</td>
                <td>L. Speroff and M. A. Fritz, Clinical gynecologic endocrinology and infertility: lippincott Williams & wilkins, 2005. </td>
        </tr>
        <tr>
                <td>[Squires1959]</td>
                <td>R. D. Squires and E. J. Huth, \"Experimental potassium depletion in normal human subjects. I. Relation of ionic intakes to the renal conservation of potassium,\" Journal of Clinical Investigation, vol. 38, p. 1134, 1959. </td>
        </tr>
        <tr>
                <td>[Stainsby1973]</td>
                <td>W. N. Stainsby, \"Local Control of Regional Blood Flow,\" Annual Review of Physiology, vol. 35, pp. 151-168, 1973. </td>
        </tr>
        <tr>
                <td>[Stanton1986]</td>
                <td>B. A. Stanton, \"Regulation by adrenal corticosteroids of sodium and potassium transport in loop of Henle and distal tubule of rat kidney,\" The Journal of Clinical Investigation, vol. 78, pp. 1612-1620, 1986. </td>
        </tr>
        <tr>
                <td>[Starke1987]</td>
                <td>A. Starke, T. Imamura, and R. H. Unger, \"Relationship of glucagon suppression by insulin and somatostatin to the ambient glucose concentration,\" The Journal of Clinical Investigation, vol. 79, pp. 20-24, 1987. </td>
        </tr>
        <tr>
                <td>[Stenvinkel1997]</td>
                <td>P. Stenvinkel, O. Heimbürger, and F. Lönnqvist, \"Serum leptin concentrations correlate to plasma insulin concentrations independent of body fat content in chronic renal failure,\" Nephrology Dialysis Transplantation, vol. 12, pp. 1321-1325, 1997. </td>
        </tr>
        <tr>
                <td>[STERNS1981]</td>
                <td>R. H. STERNS, M. COX, P. U. FEIG, and I. SINGER, \"Internal Potassium Balance and the Control of the Plasma Potassium Concentration,\" Medicine, vol. 60, pp. 339-354, 1981. </td>
        </tr>
        <tr>
                <td>[Stevens]</td>
                <td>P. M. Stevens and L. E. Lamb, \"Effects of lower body negative pressure on the cardiovascular system,\" American Journal of Cardiology, vol. 16, pp. 506-515.</td>
        <tr>
                <td>[Stewart1981]</td>
                <td>P. A. Stewart, How to understand acid-base: a quantitative acid-base primer for biology and medicine: Edward Arnold London, 1981. </td>
        </tr>
        <tr>
                <td>[Stick1992]</td>
                <td>C. Stick, H. Jaeger, and E. Witzleb, Measurements of volume changes and venous pressure in the human lower leg during walking and running vol. 72, 1992. </td>
        </tr>
        <tr>
                <td>[Stone1968]</td>
                <td>H. Stone, Thompson HK, and K. Schmidt-Nielsen, Influence of erythrocytes on blood viscosity vol. 214, 1968. </td>
        </tr>
        <tr>
                <td>[Stonestreet1998]</td>
                <td>B. S. Stonestreet, S. S. Ocampo, and W. Oh, Reductions in cardiac output in hypoxic young pigs: systemic and regional perfusion and oxygen metabolism vol. 85, 1998. </td>
        </tr>
        <tr>
                <td>[Storstein1982]</td>
                <td>L. Storstein, \"Clinical and circulatory aspects of digitalis in heart failure,\" European heart journal, vol. 3, pp. 59-64, 1982. </td>
        </tr>
        <tr>
                <td>[Stothert1992]</td>
                <td>J. C. Stothert, J. O. Basadre, G. B. Gbaanador, J. T. Flynn, L. Traber, and D. Traber, \"Bronchial blood flow during changes in inhaled oxygen and carbon dioxide concentrations in conscious sheep,\" Circulatory shock, vol. 36, pp. 120-126, 1992/02// 1992. </td>
        </tr>
        <tr>
                <td>[Stratton1985]</td>
                <td>J. R. Stratton, M. A. PFEIFER, J. L. Ritchie, and J. B. HALTER, \"Hemodynamic effects of epinephrine- Concentration-effect study in humans,\" Journal of Applied Physiology, vol. 58, pp. 1199-1206, 1985. </td>
        </tr>
        <tr>
                <td>[Suga1979]</td>
                <td>H. Suga, Total mechanical energy of a ventricle model and cardiac oxygen consumption vol. 236, 1979. </td>
        </tr>
        <tr>
                <td>[SUGA1974]</td>
                <td>H. SUGA and K. SAGAWA, \"Instantaneous Pressure-Volume Relationships and Their Ratio in the Excised, Supported Canine Left Ventricle,\" Circulation Research, vol. 35, pp. 117-126, July 1, 1974 1974. </td>
        </tr>
        <tr>
                <td>[SUGA1976]</td>
                <td>H. SUGA, K. SAGAWA, and D. P. KOSTIUK, \"Controls of ventricular contractility assessed by pressure-volume ratio, Emax,\" Cardiovascular Research, vol. 10, pp. 582-592, September 1, 1976 1976. </td>
        </tr>
        <tr>
                <td>[Sugimoto1966]</td>
                <td>T. Sugimoto, K. Sagawa, and A. Guyton, Effect of tachycardia on cardiac output during normal and increased venous return vol. 211, 1966. </td>
        </tr>
        <tr>
                <td>[Summers1997]</td>
                <td>R. L. Summers, J. P. Montani, L. H. Woodward, T. G. Coleman, and J. E. Hall, \"Theoretical analysis of the mechanisms of chronic hyperinsulinemia,\" Computers in Biology and Medicine, vol. 27, pp. 249-256, 5// 1997. </td>
        </tr>
        <tr>
                <td>[SURKS1976]</td>
                <td>M. I. SURKS and J. H. OPPENHEIMER, \"Incomplete Suppression of Thyrotropin Secretion after Single Injection of Large L-Triiodothyronine Doses into Hypothyroid Rats,\" Endocrinology, vol. 99, pp. 1432-1441, 1976. </td>
        </tr>
        <tr>
                <td>[SURKS1977]</td>
                <td>M. I. SURKS and B. M. LIFSCHITZ, \"Biphasic Thyrotropin Suppression in Euthyroid and Hypothyroid Rats,\" Endocrinology, vol. 101, pp. 769-775, 1977. </td>
        </tr>
        <tr>
                <td>[SURKS1977]</td>
                <td>M. I. SURKS and B. M. LIFSCHITZ, \"Biphasic Thyrotropin Suppression in Euthyroid and Hypothyroid Rats,\" Endocrinology, vol. 101, pp. 769-775, 1977. </td>
        </tr>
        <tr>
                <td>[Swanson1975]</td>
                <td>G. D. Swanson and J. W. Bellville, Step changes in end-tidal CO2: methods and implications vol. 39, 1975. </td>
        </tr>
        <tr>
                <td>[Symons1999]</td>
                <td>J. D. Symons, T. I. Musch, K. S. Hageman, and C. L. Stebbins, \"Regional blood flow responses to acute ANG II infusion: effects of nitric oxide synthase inhibition,\" Journal of cardiovascular pharmacology, vol. 34, pp. 116-123, 1999. </td>
        </tr>
        <tr>
                <td>[Szlyk1984]</td>
                <td>P. C. Szlyk, C. King, D. B. Jennings, S. M. Cain, and C. K. Chapler, \"The role of aortic chemoreceptors during acute anemia,\" Canadian journal of physiology and pharmacology, vol. 62, pp. 519-523, 1984/05// 1984. </td>
        </tr>
        <tr>
                <td>[Schumacker]</td>
                <td>S. P. T. and C. S. M., \"The concept of a critical oxygen delivery,\" Intensive Care Medicine, vol. 13, pp. 223-229, January 1, 0001.</td>
        <tr>
                <td>[Takeshita1979]</td>
                <td>A. Takeshita, A. L. Mark, D. L. Eckberg, and F. M. Abboud, Effect of central venous pressure on arterial baroreflex control of heart rate vol. 236, 1979. </td>
        </tr>
        <tr>
                <td>[Talbott1941]</td>
                <td>J. H. Talbott, \"The Physiologic and Therapeutic Effects of Hypothermia,\" New England Journal of Medicine, vol. 224, pp. 281-288, 1941. </td>
        </tr>
        <tr>
                <td>[Laboratory2008]</td>
                <td>L. o. B. a. C. A. Teaching. (2008). Physiolibrary in Matlab and Simuling. Available: http://www.physiome.cz/simchips </td>
        </tr>
        <tr>
                <td>[Thomas1974]</td>
                <td>R. C. Thomas, \"Intracellular pH of snail neurones measured with a new pH-sensitive glass micro-electrode,\" The Journal of Physiology, vol. 238, pp. 159-180, April 1, 1974 1974. </td>
        </tr>
        <tr>
                <td>[Thomas1976]</td>
                <td>R. C. Thomas, \"The effect of carbon dioxide on the intracellular pH and buffering power of snail neurones,\" The Journal of Physiology, vol. 255, pp. 715-735, March 1, 1976 1976. </td>
        </tr>
        <tr>
                <td>[Thomas1977]</td>
                <td>R. C. Thomas, \"The role of bicarbonate, chloride and sodium ions in the regulation of intracellular pH in snail neurones,\" The Journal of Physiology, vol. 273, pp. 317-338, December 1, 1977 1977. </td>
        </tr>
        <tr>
                <td>[Thomas1998]</td>
                <td>S. R. Thomas, \"Cycles and separations in a model of the renal medulla,\" American Journal of Physiology-Renal Physiology, vol. 275, pp. F671-F690, 1998. </td>
        </tr>
        <tr>
                <td>[Thompson1928]</td>
                <td>W. O. Thompson, P. K. Thompson, and M. E. Dailey, \"THE EFFECT OF POSTURE UPON THE COMPOSITION AND VOLUME OF THE BLOOD IN MAN 1,\" The Journal of Clinical Investigation, vol. 5, pp. 573-604, 1928. </td>
        </tr>
        <tr>
                <td>[Tikkanen1985]</td>
                <td>I. Tikkanen, K. Metsärinne, F. Fyhrquist, and R. Leidenius, \"Plasma atrial natriuretic peptide in cardiac disease and during infusion in healthy volunteers,\" The Lancet, vol. 326, pp. 66-69, 1985. </td>
        </tr>
        <tr>
                <td>[Topor2004]</td>
                <td>Z. Topor, M. Pawlicki, and J. Remmers, \"A Computational Model of the Human Respiratory Control System: Responses to Hypoxia and Hypercapnia,\" Annals of Biomedical Engineering, vol. 32, pp. 1530-1545, 2004/11/01 2004. </td>
        </tr>
        <tr>
                <td>[Toussaint1962]</td>
                <td>C. Toussaint and P. Vereerstraeten, Effects of blood pH changes on potassium excretion in the dog vol. 202, 1962. </td>
        </tr>
        <tr>
                <td>[Tummescheit2002]</td>
                <td>H. Tummescheit, \"Design and implementation of object-oriented model libraries using modelica,\" 2002. </td>
        </tr>
        <tr>
                <td>[Tummescheit1998]</td>
                <td>H. Tummescheit and J. Eborn, \"Design of a thermo-hydraulic model library in Modelica,\" in 12th European Simulation Multiconference, 1998. </td>
        </tr>
        <tr>
                <td>[Turcotte1999]</td>
                <td>L. P. Turcotte, \"ROLE OF FATS IN EXERCISE: Types and Quality,\" Clinics in Sports Medicine, vol. 18, pp. 485-498, 7/1/ 1999. </td>
        </tr>
        <tr>
                <td>[Unger1970]</td>
                <td>R. H. Unger, E. Aguilar-Parada, xFc, W. A. ller, and A. M. Eisentraut, \"Studies of pancreatic alpha cell function in normal and diabetic subjects,\" The Journal of Clinical Investigation, vol. 49, pp. 837-848, 1970. </td>
        </tr>
        <tr>
                <td>[Ursino2001]</td>
                <td>M. Ursino, E. Magosso, and G. Avanzolini, \"An integrated model of the human ventilatory control system: the response to hypoxia,\" Clinical Physiology, vol. 21, pp. 465-477, 2001. </td>
        </tr>
        <tr>
                <td>[Van1999]</td>
                <td>P. Van De Borne, S. Heron, H. Nguyen, P. Unger, M. Leeman, J. L. Vincent, et al., \"Arterial baroreflex control of the sinus node during dobutamine exercise stress testing,\" Hypertension, vol. 33, pp. 987-991, 1999. </td>
        </tr>
        <tr>
                <td>[Van1928]</td>
                <td>D. D. Van Slyke, A. B. Hastings, A. Hiller, and J. Sendroy, \"STUDIES OF GAS AND ELECTROLYTE EQUILIBRIA IN BLOOD: XIV. THE AMOUNTS OF ALKALI BOUND BY SERUM ALBUMIN AND GLOBULIN,\" Journal of Biological Chemistry, vol. 79, pp. 769-780, October 1, 1928 1928. </td>
        </tr>
        <tr>
                <td>[VANDERWEELE1993]</td>
                <td>D. A. VANDERWEELE and T. R. SCOTT, \"Pancreatic glucagon suppresses gustatory responsiveness to glucose,\" 1993. </td>
        </tr>
        <tr>
                <td>[Verrey1996]</td>
                <td>F. Verrey and J. Beron, \"Activation and supply of channels and pumps by aldosterone,\" News in physiological sciences, vol. 11, pp. 126-132, 1996. </td>
        </tr>
        <tr>
                <td>[Vizek1987]</td>
                <td>M. Vizek, C. K. Pickett, and J. V. Weil, Increased carotid body hypoxic sensitivity during acclimatization to hypobaric hypoxia vol. 63, 1987. </td>
        </tr>
        <tr>
                <td>[Wade1970]</td>
                <td>J. G. Wade, C. P. Larson, R. F. Hickey, W. K. Ehrenfeld, and J. W. Severinghaus, \"Effect of Carotid Endarterectomy on Carotid Chemoreceptor and Baroreceptor Function in Man,\" New England Journal of Medicine, vol. 282, pp. 823-829, 1970. </td>
        </tr>
        <tr>
                <td>[Wagner1988]</td>
                <td>E. M. Wagner and W. A. Mitzner, \"Effect of hypoxia on bronchial circulation,\" J. Appl. Physiol, vol. 65, pp. 1627-1633, 1988. </td>
        </tr>
        <tr>
                <td>[Wagner1990]</td>
                <td>E. M. Wagner and W. A. Mitzner, \"Effect of left atrial pressure on bronchial vascular hemodynamics,\" J Appl Physiol, vol. 69, pp. 837-842, 1990. </td>
        </tr>
        <tr>
                <td>[Wagner2004]</td>
                <td>E. M. Wagner, D. Kratky, G. Haemmerle, A. Hrzenjak, G. M. Kostner, E. Steyrer, et al., \"Defective uptake of triglyceride-associated fatty acids in adipose tissue causes the SREBP-1c-mediated induction of lipogenesis,\" Journal of lipid research, vol. 45, pp. 356-365, 2004. </td>
        </tr>
        <tr>
                <td>[Wahren1970]</td>
                <td>J. Wahren, \"Human forearm muscle metabolism during exercise. IV. Glucose uptake at different work intensities,\" Scandinavian Journal of Clinical and Laboratory Investigation, vol. 25, pp. 129-135, 1970/03// 1970. </td>
        </tr>
        <tr>
                <td>[Wahren2007]</td>
                <td>J. Wahren and K. Ekberg, \"Splanchnic regulation of glucose production,\" Annu. Rev. Nutr., vol. 27, pp. 329-345, 2007. </td>
        </tr>
        <tr>
                <td>[Warner1962]</td>
                <td>H. R. Warner and A. Cox, A mathematical model of heart rate control by sympathetic and vagus efferent information vol. 17, 1962. </td>
        </tr>
        <tr>
                <td>[Warren1943]</td>
                <td>J. V. Warren, A. J. Merrill, and E. A. Stead, Jr., \"THE RÔLE OF THE EXTRACELLULAR FLUID IN THE MAINTENANCE OF A NORMAL PLASMA VOLUME,\" The Journal of Clinical Investigation, vol. 22, pp. 635-641, 1943. </td>
        </tr>
        <tr>
                <td>[Waterlow1967]</td>
                <td>J. C. Waterlow, \"Lysine turnover in man measured by intravenous infusion of L-</td>
        </tr>
        <tr>
                <td>[U-14C]</td>
                <td>1993]        P. D. Watson, \"Sieving of electrolytes at capillary wall of cat skeletal muscle by osmotic water flow,\" AMERICAN JOURNAL OF PHYSIOLOGY, vol. 265, pp. H1869-H1869, 1993. </td>
        </tr>
        <tr>
                <td>[Weber1977]</td>
                <td>K. T. Weber and J. S. Janicki, Myocardial oxygen consumption: the role of wall force and shortening vol. 233, 1977. </td>
        </tr>
        <tr>
                <td>[Weber2000]</td>
                <td>D. S. Weber and J. H. Lombard, Elevated salt intake impairs dilation of rat skeletal muscle resistance arteries via ANG II suppression vol. 278, 2000. </td>
        </tr>
        <tr>
                <td>[Weidmann1978]</td>
                <td>P. Weidmann, C. Beretta-Piccoli, W. H. Ziegler, G. Keusch, Z. Gluck, and F. C. Reubi, \"Age versus urinary sodium for judging renin, aldosterone, and catecholamine levels: Studies in normal subjects and patients with essential hypertension,\" Kidney Int, vol. 14, pp. 619-628, 12//print 1978. </td>
        </tr>
        <tr>
                <td>[Weidmann1986]</td>
                <td>P. Weidmann, L. Hasler, M. Gnädinger, R. E. Lang, D. E. Uehlinger, S. Shaw, et al., \"Blood levels and renal effects of atrial natriuretic peptide in normal man,\" Journal of Clinical Investigation, vol. 77, p. 734, 1986. </td>
        </tr>
        <tr>
                <td>[Weil1971]</td>
                <td>J. V. Weil, E. Byrne-Quinn, I. E. Sodal, G. F. Filley, and R. F. Grover, \"Acquired attenuation of chemoreceptor function in chronically hypoxic man at high altitude,\" The Journal of Clinical Investigation, vol. 50, pp. 186-195, 1971. </td>
        </tr>
        <tr>
                <td>[Wells1938]</td>
                <td>H. S. Wells, J. B. Youmans, and D. G. Miller, Jr., \"TISSUE PRESSURE (INTRACUTANEOUS, SUBCUTANEOUS, AND INTRAMUSCULAR) AS RELATED TO VENOUS PRESSURE, CAPILLARY FILTRATION, AND OTHER FACTORS 12,\" The Journal of Clinical Investigation, vol. 17, pp. 489-499, 1938. </td>
        </tr>
        <tr>
                <td>[Wennergren1976]</td>
                <td>G. Wennergren, R. Little, and B. ÖBerg, \"Studies on the central integration of excitatory chemoreceptor influences and inhibitory baroreceptor and cardiac receptor influences,\" Acta Physiologica Scandinavica, vol. 96, pp. 1-18, 1976. </td>
        </tr>
        <tr>
                <td>[Wetter2013]</td>
                <td>M. Wetter, \"Modeling of Heat Transfer in Rooms in the Modelica Buildings Library,\" 2013. </td>
        </tr>
        <tr>
                <td>[Whalen1974]</td>
                <td>W. Whalen, P. Nair, D. Buerk, and C. Thuning, \"Tissue PO2 in normal and denervated cat skeletal muscle,\" Am J Physiol, vol. 227, pp. 1221-1225, 1974. </td>
        </tr>
        <tr>
                <td>[Whittaker1933]</td>
                <td>S. R. F. Whittaker and F. R. Winton, \"The apparent viscosity of blood flowing in the isolated hindlimb of the dog, and its variation with corpuscular concentration,\" The Journal of Physiology, vol. 78, pp. 339-369, July 10, 1933 1933. </td>
        </tr>
        <tr>
                <td>[Widmaier2006]</td>
                <td>E. P. Widmaier, H. Raff, and K. T. Strang, Vander's human physiology: McGraw-Hill Higher Education, 2006. </td>
        </tr>
        <tr>
                <td>[Wiederholt1967]</td>
                <td>M. Wiederholt, K. Hierholzer, E. Windhager, and G. Giebisch, Microperfusion study of fluid reabsorption in proximal tubules of rat kidneys vol. 213, 1967. </td>
        </tr>
        <tr>
                <td>[WILLIAMS1977]</td>
                <td>G. H. WILLIAMS and L. M. BRALEY, \"Effects of dietary sodium and potassium intake and acute stimulation on aldosterone output by isolated human adrenal cells,\" The Journal of Clinical Endocrinology & Metabolism, vol. 45, pp. 55-64, 1977. </td>
        </tr>
        <tr>
                <td>[L.1989]</td>
                <td>L. R. Williams and R. W. Leggett, \"Reference values for resting blood flow to organs of man,\" Clinical Physics and Physiological Measurement, vol. 10, p. 187, 1989. </td>
        </tr>
        <tr>
                <td>[Williamson1993]</td>
                <td>J. Williamson and P. B. Raven, \"Unilateral carotid-cardiac baroreflex responses in humans,\" American Journal of Physiology, vol. 265, pp. H1033-H1033, 1993. </td>
        </tr>
        <tr>
                <td>[Williamson1993]</td>
                <td>J. Williamson and P. B. Raven, \"Unilateral carotid-cardiac baroreflex responses in humans,\" American Journal of Physiology, vol. 265, pp. H1033-H1033, 1993. </td>
        </tr>
        <tr>
                <td>[Winearls1986]</td>
                <td>C. Winearls, M. Pippard, M. Downing, D. Oliver, C. Reid, and P. Mary Cotes, \"EFFECT OF HUMAN ERYTHROPOIETIN DERIVED FROM RECOMBINANT DNA ON THE ANAEMIA OF PATIENTS MAINTAINED BY CHRONIC HAEMODIALYSIS,\" The Lancet, vol. 328, pp. 1175-1178, 11/22/ 1986. </td>
        </tr>
        <tr>
                <td>[Winegrad1971]</td>
                <td>A. I. Winegrad and R. S. Clements Jr, \"Diabetic ketoacidosis,\" The Medical clinics of North America, vol. 55, pp. 899-911, 1971. </td>
        </tr>
        <tr>
                <td>[WINER1969]</td>
                <td>N. WINER, D. S. CHOKSHI, M. S. YOON, and A. D. FREEDMAN, \"Adrenergic receptor mediation of renin secretion,\" The Journal of Clinical Endocrinology & Metabolism, vol. 29, pp. 1168-1175, 1969. </td>
        </tr>
        <tr>
                <td>[Wolfe1998]</td>
                <td>R. R. Wolfe, \"Metabolic interactions between glucose and fatty acids in humans,\" The American Journal of Clinical Nutrition, vol. 67, pp. 519S-526S, March 1, 1998 1998. </td>
        </tr>
        <tr>
                <td>[Wolgast1981]</td>
                <td>M. Wolgast, M. Larson, and K. Nygren, \"Functional characteristics of the renal interstitium,\" American Journal of Physiology-Renal Physiology, vol. 241, pp. F105-F111, 1981. </td>
        </tr>
        <tr>
                <td>[WOLLHEIM1964]</td>
                <td>F. A. WOLLHEIM, S. BELFRAGE, C. CÖSTER, and H. LINDHOLM, \"Primary “acquired” hypogammaglobulinemia,\" Acta medica Scandinavica, vol. 176, pp. 1-16, 1964. </td>
        </tr>
        <tr>
                <td>[Wong2004]</td>
                <td>S. L. Wong, A. M. DePaoli, J. H. Lee, and C. S. Mantzoros, \"Leptin hormonal kinetics in the fed state: effects of adiposity, age, and gender on endogenous leptin production and clearance rates,\" The Journal of Clinical Endocrinology & Metabolism, vol. 89, pp. 2672-2677, 2004. </td>
        </tr>
        <tr>
                <td>[Woo1972]</td>
                <td>S. L. Y. Woo, A. S. Kobayashi, C. Lawrence, and W. A. Schlegel, \"Mathematical model of the corneo-scleral shell as applied to intraocular pressure-volume relations and applanation tonometry,\" Annals of Biomedical Engineering, vol. 1, pp. 87-98, 1972/09/01 1972. </td>
        </tr>
        <tr>
                <td>[Woodbury1956]</td>
                <td>D. M. Woodbury, \"Effect of acute hyponatremia on distribution of water and electrolytes in various tissues of the rat,\" Am. J. Physiol, vol. 185, pp. 281-286, 1956. </td>
        </tr>
        <tr>
                <td>[Work1987]</td>
                <td>J. Work and R. L. Jamison, \"Effect of adrenalectomy on transport in the rat medullary thick ascending limb,\" J Clin Invest, vol. 80, pp. 1160-4, Oct 1987. </td>
        </tr>
        <tr>
                <td>[Wright1982]</td>
                <td>F. S. Wright, \"Flow-dependent transport processes: filtration, absorption, secretion,\" Am J Physiol, vol. 243, pp. F1-11, Jul 1982. </td>
        </tr>
        <tr>
                <td>[Wyndham1966]</td>
                <td>C. H. Wyndham, N. B. Strydom, J. F. Morrison, C. G. Williams, G. A. Bredell, and J. Peter, Fatigue of the sweat gland response vol. 21, 1966. </td>
        </tr>
        <tr>
                <td>[Xenopoulos1994]</td>
                <td>N. P. Xenopoulos and R. J. Applegate, \"The effect of vagal stimulation on left ventricular systolic and diastolic performance,\" American Journal of Physiology-Heart and Circulatory Physiology, vol. 35, p. H2167, 1994. </td>
        </tr>
        <tr>
                <td>[Xie1995]</td>
                <td>S. Xie, R. Reed, B. Bowen, and J. Bert, \"A model of human microvascular exchange,\" Microvascular research, vol. 49, pp. 141-162, 1995. </td>
        </tr>
        <tr>
                <td>[Xie1995]</td>
                <td>S. L. Xie, R. K. Reed, B. D. Bowen, and J. L. Bert, \"A Model of Human Microvascular Exchange,\" Microvascular Research, vol. 49, pp. 141-162, 3// 1995. </td>
        </tr>
        <tr>
                <td>[Yandle1986]</td>
                <td>T. G. Yandle, A. M. Richards, M. G. Nicholls, R. Cuneo, E. A. Espiner, and J. H. Livesey, \"Metabolic clearance rate and plasma half life of alpha-human atrial natriuretic peptide in man,\" Life Sci, vol. 38, pp. 1827-33, May 19 1986. </td>
        </tr>
        <tr>
                <td>[Young1982]</td>
                <td>D. B. Young, \"Relationship between plasma potassium concentration and renal potassium excretion,\" Am J Physiol, vol. 242, pp. F599-F603, 1982. </td>
        </tr>
        <tr>
                <td>[Young1988]</td>
                <td>D. B. Young, Quantitative analysis of aldosterone's role in potassium regulation vol. 255, 1988. </td>
        </tr>
        <tr>
                <td>[Young1983]</td>
                <td>D. B. Young and A. W. Paulsen, \"Interrelated effects of aldosterone and plasma potassium on potassium excretion,\" Am J Physiol, vol. 244, pp. F28-F34, 1983. </td>
        </tr>
        <tr>
                <td>[Young1977]</td>
                <td>D. B. Young, Y. Pan, and A. C. Guyton, \"Control of extracellular sodium concentration by antidiuretic hormone-thirst feedback mechanism,\" Am J Physiol, vol. 232, 1977. </td>
        </tr>
        <tr>
                <td>[Young1976]</td>
                <td>D. B. Young, R. E. McCAA, Y.-J. Pan, and A. C. Guyton, \"Effectiveness of the aldosterone sodium and potassium feedback control system,\" Am. J. Physiol, vol. 231, pp. 945-953, 1976. </td>
        </tr>
        <tr>
                <td>[Young1984]</td>
                <td>D. B. Young, T. E. Jackson, U. Tipayamontri, and R. C. Scott, Effects of sodium intake on steady-state potassium excretion vol. 246, 1984. </td>
        </tr>
        <tr>
                <td>[Young1984]</td>
                <td>D. B. Young, T. E. Jackson, U. Tipayamontri, and R. C. Scott, Effects of sodium intake on steady-state potassium excretion vol. 246, 1984. </td>
        </tr>
        <tr>
                <td>[Zachariah1986]</td>
                <td>P. K. Zachariah, D. C. Bloedow, T. P. Moyer, S. G. Sheps, A. Schirger, and R. D. Fealey, \"Pharmacodynamics of midodrine, an antihypotensive agent,\" Clin Pharmacol Ther, vol. 39, pp. 586-91, May 1986. </td>
        </tr>
        <tr>
                <td>[Zambraski1976]</td>
                <td>E. J. Zambraski, G. F. DiBona, and G. J. Kaloyanides, \"Specificity of Neural Effect on Renal Tubular Sodium Reabsorption,\" Experimental Biology and Medicine, vol. 151, pp. 543-546, March 1, 1976 1976. </td>
        </tr>
        <tr>
                <td>[Zou1998]</td>
                <td>A.-P. Zou, F. Wu, and A. W. Cowley, \"Protective effect of angiotensin II-induced increase in nitric oxide in the renal medullary circulation,\" Hypertension, vol. 31, pp. 271-276, 1998. </td>
        </tr>
        <tr>
                <td>[Zupančič2013]</td>
                <td>B. Zupančič and A. Sodja, \"Computer-aided physical multi-domain modelling: Some experiences from education and industrial applications,\" Simulation Modelling Practice and Theory, vol. 33, pp. 45-67, 2013.  </td>
        </tr>

</table>
</html>"));
  end References;

  package Examples

    model RedCells
      Types.BusConnector busConnector
        annotation (Placement(transformation(extent={{-44,0},{-4,40}})));
      Physiolibrary.Organs.Blood.RedCells redCells
        annotation (Placement(transformation(extent={{44,4},{64,24}})));
    equation
      connect(busConnector, redCells.busConnector) annotation (Line(
          points={{-24,20},{11.1,20},{11.1,20.8},{46.2,20.8}},
          color={0,0,255},
          thickness=0.5));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end RedCells;

    model Heart
      replaceable package Blood = Physiolibrary.Media.Blood                   constrainedby
        Physiolibrary.Media.Interfaces.PartialMedium                                                                                     annotation ( choicesAllMatching = true);
      Physiolibrary.Organs.Heart.Heart heart(redeclare package Blood = Blood)
        annotation (Placement(transformation(extent={{6,24},{26,44}})));
      Types.BusConnector busConnector
        annotation (Placement(transformation(extent={{-80,14},{-40,54}})));
      Fluid.Components.Conductor systemic(redeclare package Medium = Blood,
          Conductance=1.250102626409427e-07*(5/90))
                 annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={18,-12})));
      Fluid.Components.Conductor pulmonary(redeclare package Medium = Blood,
          Conductance=1.250102626409427e-07*(5/12))
        annotation (Placement(transformation(extent={{2,66},{22,86}})));
    equation
      connect(heart.leftVentricle, systemic.q_in) annotation (Line(
          points={{24,28},{42,28},{42,-12},{28,-12}},
          color={127,0,0},
          thickness=0.5));
      connect(systemic.q_out, heart.rightAtrium) annotation (Line(
          points={{8,-12},{-6,-12},{-6,40},{8,40}},
          color={127,0,0},
          thickness=0.5));
      connect(pulmonary.q_out, heart.leftAtrium) annotation (Line(
          points={{22,76},{38,76},{38,39.8},{23.8,39.8}},
          color={127,0,0},
          thickness=0.5));
      connect(pulmonary.q_in, heart.rightVentricle) annotation (Line(
          points={{2,76},{-16,76},{-16,28},{8,28}},
          color={127,0,0},
          thickness=0.5));
      connect(heart.Pericardium, busConnector.Pericardium_Pressure) annotation (
         Line(points={{20,44},{20,48},{-78,48},{-78,34},{-60,34}}, color={0,0,
              127}), Text(
          string="%second",
          index=1,
          extent={{-3,6},{-3,6}},
          horizontalAlignment=TextAlignment.Right));
      connect(heart.Sympathicus, busConnector.GangliaGeneral_NA) annotation (
          Line(points={{15.2,36},{-58,36},{-58,34},{-60,34}}, color={0,0,127}),
          Text(
          string="%second",
          index=1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(heart.Parasympathicus, busConnector.VagusNerve_NA_Hz) annotation (
         Line(points={{9.8,32},{-60,32},{-60,34}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end Heart;

    model HeartAndPulmonaryCirculation
      replaceable package Blood = Physiolibrary.Media.Blood                   constrainedby
        Physiolibrary.Media.Interfaces.PartialMedium                                                                                     annotation ( choicesAllMatching = true);
      Physiolibrary.Organs.Heart.Heart heart(redeclare package Blood = Blood)
        annotation (Placement(transformation(extent={{6,24},{26,44}})));
      Types.BusConnector busConnector
        annotation (Placement(transformation(extent={{-80,14},{-40,54}})));
      Fluid.Components.Conductor systemic(redeclare package Medium = Blood,
          Conductance=1.250102626409427e-07*(5/90))
                 annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={18,-12})));
      Lungs.Components.PulmonaryCirculation pulmonaryCirculation(redeclare package
                  Blood = Blood)
        annotation (Placement(transformation(extent={{2,60},{30,88}})));
      Fluid.Sensors.PressureMeasure meanPressure(redeclare package Medium =
            Blood)
        annotation (Placement(transformation(extent={{70,22},{90,42}})));
    equation
      connect(heart.leftVentricle, systemic.q_in) annotation (Line(
          points={{24,28},{42,28},{42,-12},{28,-12}},
          color={127,0,0},
          thickness=0.5));
      connect(systemic.q_out, heart.rightAtrium) annotation (Line(
          points={{8,-12},{-6,-12},{-6,40},{8,40}},
          color={127,0,0},
          thickness=0.5));
      connect(heart.leftAtrium, pulmonaryCirculation.q_out) annotation (Line(
          points={{23.8,39.8},{48,39.8},{48,74},{30,74}},
          color={127,0,0},
          thickness=0.5));
      connect(pulmonaryCirculation.q_in, heart.rightVentricle) annotation (Line(
          points={{2,74},{-20,74},{-20,28},{8,28}},
          color={127,0,0},
          thickness=0.5));
      connect(heart.leftVentricle,meanPressure.port)  annotation (Line(
          points={{24,28},{42,28},{42,16},{80,16},{80,22}},
          color={127,0,0},
          thickness=0.5));
      connect(pulmonaryCirculation.busConnector, busConnector) annotation (Line(
          points={{2,81},{-60,81},{-60,34}},
          color={0,0,255},
          thickness=0.5));
      connect(heart.Pericardium, busConnector.Pericardium_Pressure) annotation (
         Line(points={{20,44},{20,46},{4,46},{4,34},{-60,34}}, color={0,0,127}));
      connect(heart.Sympathicus, busConnector.GangliaGeneral_NA) annotation (
          Line(points={{15.2,36},{4,36},{4,34},{-60,34}}, color={0,0,127}));
      connect(heart.Parasympathicus, busConnector.VagusNerve_NA_Hz) annotation (
         Line(points={{9.8,32},{4,32},{4,34},{-60,34}}, color={0,0,127}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end HeartAndPulmonaryCirculation;

    model RespiratoryAndCardiovascular

      replaceable package Blood = Physiolibrary.Media.Blood                   constrainedby
        Physiolibrary.Media.Interfaces.PartialMedium                                                                                     annotation ( choicesAllMatching = true);
      replaceable package Air = Media.Air constrainedby
        Physiolibrary.Media.Interfaces.PartialMedium                                                 annotation ( choicesAllMatching = true);
      replaceable package PleuralFluid = Physiolibrary.Media.Water constrainedby
        Physiolibrary.Media.Interfaces.PartialMedium                                                                          annotation ( choicesAllMatching = true);

      parameter Types.Frequency RespirationRate(displayUnit="1/min")=0.2     "Respiration rate";
      parameter Types.Pressure Pmin(displayUnit="Pa")=-1000
                                     "Negative pressure gradient caused by respiratory muscles";
      parameter Types.Pressure Pmax(displayUnit="Pa")=0     "Positive presure gradient caused by respiratory muscles";
      parameter Real RespiratoryMusclePressureCycle[:, 3] = {{0, Pmax, 0}, {3 / 8, Pmin, 0}, {1, Pmax, 0}} "Absolute external lungs pressure during respiration cycle scaled to time period (0,1)";

      Physiolibrary.Organs.Heart.Heart heart(redeclare package Blood = Blood)
        annotation (Placement(transformation(extent={{4,-44},{24,-24}})));
      Types.BusConnector busConnector
        annotation (Placement(transformation(extent={{-82,-56},{-42,-16}})));
      Systems.Systemic systemic(redeclare package Blood = Blood) annotation (
          Placement(transformation(
            extent={{10,10},{-10,-10}},
            rotation=180,
            origin={14,-80})));
      Lungs.Lungs pulmonary(redeclare package Blood = Blood, nPorts=2)
        annotation (Placement(transformation(extent={{0,-8},{28,20}})));
      Fluid.Sensors.PressureMeasure meanPressure(redeclare package Medium = Blood)
        annotation (Placement(transformation(extent={{68,-46},{88,-26}})));
      Fluid.Sources.PressureSource               environment(redeclare package
          Medium = Air, y(m_flow(start=0.0050764996707716465)))                                "External environment" annotation (
        Placement(transformation(extent={{-38,64},{-18,84}})));
      Types.Constants.FractionConst Exercise_MusclePump_Effect(k=1)
        annotation (Placement(transformation(extent={{-90,-86},{-82,-78}})));
      Physiolibrary.Organs.Blood.RedCells redCells
        annotation (Placement(transformation(extent={{-72,46},{-92,66}})));
      Fluid.Sources.VolumeOutflowSource volumeOutflowSource(SolutionFlow(
            displayUnit="l/min") = 0.000109, redeclare package Medium = Air)
        annotation (Placement(transformation(extent={{52,64},{72,84}})));
      Types.Constants.PressureConst respMusclePressure(k(displayUnit="Pa") = -300)
        annotation (Placement(transformation(extent={{38,22},{46,30}})));
      inner Modelica.Fluid.System system(T_ambient=310.15)   "Human body system setting" annotation (
        Placement(transformation(extent={{76,16},{96,36}})));
    equation
      connect(heart.leftVentricle, systemic.port_a) annotation (Line(
          points={{22,-40},{28,-40},{28,-80},{24,-80}},
          color={127,0,0},
          thickness=0.5));
      connect(systemic.port_b, heart.rightAtrium) annotation (Line(
          points={{4,-80},{-6,-80},{-6,-28},{6,-28}},
          color={127,0,0},
          thickness=0.5));
      connect(heart.leftVentricle,meanPressure.port)  annotation (Line(
          points={{22,-40},{40,-40},{40,-52},{78,-52},{78,-46}},
          color={127,0,0},
          thickness=0.5));
      connect(heart.rightVentricle, pulmonary.blood_in) annotation (Line(
          points={{6,-40},{-26,-40},{-26,0},{0,0},{0,0.4}},
          color={127,0,0},
          thickness=0.5));
      connect(pulmonary.blood_out, heart.leftAtrium) annotation (Line(
          points={{28,0.4},{38,0.4},{38,-28.2},{21.8,-28.2}},
          color={127,0,0},
          thickness=0.5));
      connect(Exercise_MusclePump_Effect.y, busConnector.Exercise_MusclePump_Effect)
        annotation (Line(points={{-81,-82},{-70,-82},{-70,-36},{-62,-36}},
                                                                         color={0,0,
              127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(busConnector, systemic.busConnector) annotation (Line(
          points={{-62,-36},{-36,-36},{-36,-76},{3.8,-76}},
          color={0,0,255},
          thickness=0.5));
      connect(busConnector, pulmonary.busConnector) annotation (Line(
          points={{-62,-36},{-36,-36},{-36,11.6},{0,11.6}},
          color={0,0,255},
          thickness=0.5));
      connect(busConnector, redCells.busConnector) annotation (Line(
          points={{-62,-36},{-62,62.8},{-74.2,62.8}},
          color={0,0,255},
          thickness=0.5));
      connect(respMusclePressure.y, pulmonary.respiratotyMusclePressure)
        annotation (Line(points={{47,26},{62,26},{62,12},{25.2,12},{25.2,11.6}},
            color={0,0,127}));
      connect(environment.y, pulmonary.airways[1]) annotation (Line(
          points={{-18,74},{14,74},{14,19.265}},
          color={127,0,0},
          thickness=0.5));
      connect(volumeOutflowSource.q_in, pulmonary.airways[2]) annotation (Line(
          points={{52,74},{14,74},{14,20.455}},
          color={127,0,0},
          thickness=0.5));
      connect(heart.Pericardium, busConnector.Pericardium_Pressure) annotation (
         Line(points={{18,-24},{18,-18},{-62,-18},{-62,-36}}, color={0,0,127}),
          Text(
          string="%second",
          index=1,
          extent={{-3,6},{-3,6}},
          horizontalAlignment=TextAlignment.Right));
      connect(heart.Sympathicus, busConnector.GangliaGeneral_NA) annotation (
          Line(points={{13.2,-32},{-32,-32},{-32,-36},{-62,-36}}, color={0,0,
              127}), Text(
          string="%second",
          index=1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(heart.Parasympathicus, busConnector.VagusNerve_NA_Hz) annotation (
         Line(points={{7.8,-36},{-62,-36}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end RespiratoryAndCardiovascular;

    model Cardiovascular2
      replaceable package Blood = Physiolibrary.Media.Blood                   constrainedby
        Physiolibrary.Media.Interfaces.PartialMedium                                                                                     annotation ( choicesAllMatching = true);
      Systems.CardioVascularSystem cardioVascularSystem2_1(
                                                        redeclare package Blood =
            Blood)
        annotation (Placement(transformation(extent={{34,-16},{54,4}})));
      Types.BusConnector busConnector
        annotation (Placement(transformation(extent={{-44,-4},{-4,36}})));
      Types.Constants.PressureConst pressure(k=-445.99288489321)
        annotation (Placement(transformation(extent={{-54,-42},{-46,-34}})));
      Types.Constants.FractionConst Exercise_MusclePump_Effect(k=1)
        annotation (Placement(transformation(extent={{-58,-70},{-50,-62}})));
      inner Modelica.Fluid.System system(T_ambient=310.15)   "Human body system setting" annotation (
        Placement(transformation(extent={{64,62},{84,82}})));
    equation
      connect(busConnector, cardioVascularSystem2_1.busConnector) annotation (
          Line(
          points={{-24,16},{28,16},{28,2},{36,2}},
          color={0,0,255},
          thickness=0.5));
      connect(pressure.y, busConnector.Pericardium_Pressure) annotation (Line(
            points={{-45,-38},{-24,-38},{-24,16}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(Exercise_MusclePump_Effect.y, busConnector.Exercise_MusclePump_Effect)
        annotation (Line(points={{-49,-66},{-32,-66},{-32,16},{-24,16}}, color={0,0,
              127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end Cardiovascular2;

    model Cardiovascular
      replaceable package Blood = Physiolibrary.Media.Blood                   constrainedby
        Physiolibrary.Media.Interfaces.PartialMedium                                                                                     annotation ( choicesAllMatching = true);
      Systems.Cardiovascular       cardioVascularSystem2_1(
                                                        redeclare package Blood =
            Blood, systemic(peripheral(bone(elasticVessel(
                massFractions_start=Blood.VenousDefault)))))
        annotation (Placement(transformation(extent={{34,-16},{54,4}})));
      Types.BusConnector busConnector
        annotation (Placement(transformation(extent={{-44,-4},{-4,36}})));
      Types.Constants.PressureConst pressure(k=-445.99288489321)
        annotation (Placement(transformation(extent={{-54,-42},{-46,-34}})));
      Types.Constants.FractionConst Exercise_MusclePump_Effect(k=1)
        annotation (Placement(transformation(extent={{-58,-70},{-50,-62}})));
      inner Modelica.Fluid.System system(T_ambient=310.15)   "Human body system setting" annotation (
        Placement(transformation(extent={{60,44},{80,64}})));
    equation
      connect(busConnector, cardioVascularSystem2_1.busConnector) annotation (
          Line(
          points={{-24,16},{28,16},{28,2},{36,2}},
          color={0,0,255},
          thickness=0.5));
      connect(pressure.y, busConnector.Pericardium_Pressure) annotation (Line(
            points={{-45,-38},{-24,-38},{-24,16}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(Exercise_MusclePump_Effect.y, busConnector.Exercise_MusclePump_Effect)
        annotation (Line(points={{-49,-66},{-32,-66},{-32,16},{-24,16}}, color={0,0,
              127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)),
        experiment(StopTime=1200, __Dymola_Algorithm="Dassl"));
    end Cardiovascular;
  end Examples;
end Organs;

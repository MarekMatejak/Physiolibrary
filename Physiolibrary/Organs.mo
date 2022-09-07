within Physiolibrary;
package Organs
  package Heart "Heart Components"

    model Heart
       extends Physiolibrary.Icons.Heart;
       Physiolibrary.Fluid.Components.ElasticVessel RightAtrium(
       stateName="RightAtrium.Vol",
      useExternalPressureInput=true,
      useV0Input=true,
      useComplianceInput=false,
      volume_start=5.16454e-05,
      Compliance=9.3757696980707e-08,
        nPorts=3)                     "right atrium"
      annotation (Placement(transformation(extent={{-75,-1},{-55,19}})));
     //
    Physiolibrary.Types.Constants.VolumeConst RightAtriumV0(k=0)
      annotation (Placement(transformation(extent={{-84,20},{-76,28}})));
      Physiolibrary.Organs.Heart.Components.Ventricle rightVentricle(
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
             annotation (Placement(transformation(extent={{-6,-46},{-50,-2}})));
    //
    //    Abasic_Diastole=0.00026,
    //    Abasic_Systole=3.53,
    //    MaxContractionCompliance(displayUnit="ml/mmHg") = 1.5001231516913e-08,
    //    Cond1=60000000,
    //    Cond2=60000000,
    Physiolibrary.Fluid.Components.ElasticVessel LeftAtrium(
    stateName="LeftAtrium.Vol",
      useExternalPressureInput=true,
      useV0Input=true,
      volume_start=5.05035e-05,
      useComplianceInput=false,
      Compliance=4.6878848490354e-08,
        nPorts=3)                     "left atrium"
      annotation (Placement(transformation(extent={{68,-8},{88,12}})));
     //
    Physiolibrary.Types.Constants.VolumeConst LeftAtriumV0(k=0)
      annotation (Placement(transformation(extent={{60,12},{68,20}})));
      Physiolibrary.Organs.Heart.Components.Ventricle leftVentricle(
        stateName="LeftVentricle.Vol",
        n_Diastole=2,
        n_Systole=0.5,
        BasicCompliance(displayUnit="ml/mmHg") = 1.0950899007347e-07,
        initialVol=8.75e-05,
        NormalEndDiastolicVolume=0.000125,
        NormalFillingPressure=615.9494298573,
        stiffnes=1,
        NormalSystolicPressure=12665.626804425,
        NormalEndSystolicVolume=5.087e-05,
        additionalPressure_Systolic=3199.73729796,
        contractilityBasic=1,
        K=0.016666666666667,
        AmbientPressure=101325.0144354)
        annotation (Placement(transformation(extent={{26,-46},{70,-2}})));
     //
     //   MaxContractionCompliance(displayUnit="ml/mmHg") = 3.0002463033826e-09,
       // Abasic_Diastole=0.00051,
    //    Cond1(displayUnit="ml/(mmHg.min)") = 0.0075006157584566,
    //    Cond2(displayUnit="ml/(mmHg.min)") = 0.0075006157584566,
    Physiolibrary.Types.BusConnector busConnector
        "signals of organ bood flow resistence"
                                              annotation (Placement(
          transformation(extent={{-4,32},{16,52}}), iconTransformation(extent=
             {{-108,-38},{-92,-22}})));
    Physiolibrary.Fluid.Interfaces.FluidPort_a rightAtrium
      "blood inflow to right atrium" annotation (Placement(transformation(
            extent={{-102,-24},{-82,-4}}), iconTransformation(extent={{-90,50},
                {-70,70}})));
    Physiolibrary.Fluid.Interfaces.FluidPort_b fromRightVentricle
      "blood outflow to pulmonary circulation" annotation (Placement(
          transformation(extent={{-20,-12},{0,8}}), iconTransformation(extent={{-90,-70},
                {-70,-50}})));
    Physiolibrary.Fluid.Interfaces.FluidPort_b fromLeftVentricle
      "blood outflow to aorta" annotation (Placement(transformation(extent={{2,0},{
              22,20}}),        iconTransformation(extent={{70,-70},{90,-50}})));
    Physiolibrary.Fluid.Interfaces.FluidPort_a leftAtrium
      "blood inflow to left atrium" annotation (Placement(transformation(
            extent={{84,-38},{104,-18}}),
                                        iconTransformation(extent={{68,48},{88,
                68}})));
      Modelica.Blocks.Math.Sum sum1(nin=2)
        annotation (Placement(transformation(extent={{-18,-70},{-10,-62}})));
      Modelica.Blocks.Math.Sum sum3(nin=2)
        annotation (Placement(transformation(extent={{-60,-78},{-52,-70}})));
      Modelica.Blocks.Math.Sum sum2(nin=2)
        annotation (Placement(transformation(extent={{-4,-4},{4,4}},
            rotation=180,
            origin={66,-74})));
      Components.SA_Node SA_node
        annotation (Placement(transformation(extent={{-58,76},{-38,96}})));
      Components.ANP atriopeptin
        annotation (Placement(transformation(extent={{72,76},{92,96}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasure
      annotation (Placement(transformation(extent={{-98,-90},{-78,-70}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasure1
      annotation (Placement(transformation(extent={{100,-88},{80,-68}})));
    Physiolibrary.Fluid.Sensors.FlowMeasure flowMeasure
      annotation (Placement(transformation(extent={{40,0},{20,20}})));
      Modelica.Blocks.Math.Add avePressure(k1=0.5, k2=0.5)
        annotation (Placement(transformation(extent={{-68,48},{-56,60}})));
      Components.BaroReceptorAdaptation lowPressureReceptors(
        PressureChangeOnNA={{-4.0,0.0,0},{0.0,1.0,0.3},{12.0,4.0,0}},
        AdaptivePressure(displayUnit="mmHg") = 799.93432449,
        Tau(displayUnit="d") = 2592000) annotation (Placement(transformation(extent=
               {{-10,-10},{10,10}}, origin={-40,54})));
      Modelica.Blocks.Math.Feedback rightAtrium_TMP
        annotation (Placement(transformation(extent={{-38,-100},{-22,-84}})));
      Modelica.Blocks.Math.Feedback leftAtrium_TMP
      annotation (Placement(transformation(extent={{52,-98},{36,-82}})));
    equation
    connect(RightAtrium.zeroPressureVolume, RightAtriumV0.y) annotation (Line(
        points={{-67,18},{-67,24},{-75,24}},
        color={0,0,127},
        smooth=Smooth.None));
      connect(busConnector.Pericardium_Pressure,RightAtrium.externalPressure)
        annotation (Line(
          points={{6,42},{6,24},{-59,24},{-59,18}},
          color={0,0,255},
          thickness=0.1,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{110,10},{110,10}}));
      connect(busConnector,rightVentricle. busConnector)          annotation (
          Line(
          points={{6,42},{6,-37},{-28,-37},{-28,-35.88}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None));
    connect(LeftAtrium.zeroPressureVolume, LeftAtriumV0.y) annotation (Line(
        points={{76,11},{76,16},{69,16}},
        color={0,0,127},
        smooth=Smooth.None));
      connect(busConnector,leftVentricle. busConnector)          annotation (
          Line(
          points={{6,42},{6,-37},{48,-37},{48,-35.88}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None));
      connect(busConnector.Pericardium_Pressure,LeftAtrium.externalPressure)
        annotation (Line(
          points={{6,42},{6,24},{84,24},{84,11}},
          color={0,0,255},
          thickness=0.1,
          smooth=Smooth.None));
      connect(rightVentricle.q_out, fromRightVentricle) annotation (Line(
          points={{-23.6,-2},{-10,-2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(RightAtriumV0.y, sum1.u[1])
                                   annotation (Line(
          points={{-75,24},{-72,24},{-72,-66},{-38,-66},{-38,-66.2},{-18.8,-66.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(LeftAtriumV0.y, sum1.u[2])
                                   annotation (Line(
          points={{69,16},{70,16},{70,-58},{-28,-58},{-28,-65.8},{-18.8,-65.8}},
          color={0,0,127},
          smooth=Smooth.None));
      RightAtrium.volume = sum3.u[1];
      connect(rightVentricle.Vol, sum3.u[2]) annotation (Line(
          points={{-36.8,-32.8},{-66,-32.8},{-66,-73.8},{-60.8,-73.8}},
          color={0,0,127},
          smooth=Smooth.None));
      LeftAtrium.volume = sum2.u[1];
      connect(leftVentricle.Vol, sum2.u[2]) annotation (Line(
          points={{56.8,-32.8},{56.8,-32},{76,-32},{76,-74.2},{70.8,-74.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(sum3.y, busConnector.Heart_DeoxygenatedBloodVolume) annotation (
         Line(
          points={{-51.6,-74},{6,-74},{6,42}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      connect(busConnector.Heart_OxygenatedBloodVolume, sum2.y) annotation (
          Line(
          points={{6,42},{6,-74},{61.6,-74}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}}));
      connect(sum1.y, busConnector.Heart_V0) annotation (Line(
          points={{-9.6,-66},{6,-66},{6,42}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      connect(SA_node.Rate, busConnector.HeartVentricleRate) annotation (Line(
          points={{-38.2,86},{6,86},{6,44},{6,44},{6,42},{6,42}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      connect(busConnector.BetaPool_Effect,SA_node. BetaPool_Effect)
        annotation (Line(
          points={{6,42},{6,76},{-96,76},{-96,92},{-58,92}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}}));
      connect(busConnector.BetaBlocade_Effect,SA_node. BetaBlockade_Effect)
        annotation (Line(
          points={{6,42},{6,76},{-96,76},{-96,88},{-58,88}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}}));
      connect(busConnector.VagusNerve_NA_Hz, SA_node.VagusNerve_NA_Hz)
        annotation (Line(
          points={{6,42},{6,76},{-96,76},{-96,80},{-58,80}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}}));
      connect(busConnector.GangliaGeneral_NA, SA_node.GangliaGeneral_NA)
        annotation (Line(
          points={{6,42},{6,76},{-96,76},{-96,84},{-58,84}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}}));
      connect(busConnector,atriopeptin. busConnector)
                                              annotation (Line(
          points={{6,42},{6,76},{74,76},{74,80}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None));
    connect(pressureMeasure.pressure, busConnector.RightAtrium_Pressure)
      annotation (Line(
        points={{-82,-84},{6,-84},{6,42}},
        color={0,0,127},
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    connect(pressureMeasure1.pressure, busConnector.LeftAtrium_Pressure)
      annotation (Line(
        points={{84,-82},{6,-82},{6,42}},
        color={0,0,127},
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    connect(flowMeasure.q_out, fromLeftVentricle) annotation (Line(
        points={{20,10},{12,10}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(leftVentricle.q_out, flowMeasure.q_in) annotation (Line(
        points={{43.6,-2},{43.6,10},{40,10}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
      connect(avePressure.y,lowPressureReceptors. pressure) annotation (Line(
          points={{-55.4,54},{-50,54}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(busConnector.rightAtrium_TMP,avePressure. u1) annotation (Line(
          points={{6,42},{-98,42},{-98,57.6},{-69.2,57.6}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}}));
      connect(busConnector.leftAtrium_TMP,avePressure. u2) annotation (Line(
          points={{6,42},{-98,42},{-98,50.4},{-69.2,50.4}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}}));
    connect(lowPressureReceptors.NA, busConnector.AtrialLowPressureReceptors_NA)
      annotation (Line(
        points={{-30,54},{6,54},{6,42}},
        color={0,0,127},
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    connect(rightAtrium_TMP.y, busConnector.rightAtrium_TMP) annotation (Line(
        points={{-22.8,-92},{6,-92},{6,42},{6,42}},
        color={0,0,127},
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    connect(RightAtrium.externalPressure, rightAtrium_TMP.u2) annotation (
        Line(
        points={{-59,18},{-59,-98.4},{-30,-98.4}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(pressureMeasure.pressure, rightAtrium_TMP.u1) annotation (Line(
        points={{-82,-84},{-64,-84},{-64,-92},{-36.4,-92}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(pressureMeasure1.pressure, leftAtrium_TMP.u1) annotation (Line(
        points={{84,-82},{68,-82},{68,-90},{50.4,-90}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(LeftAtrium.externalPressure, leftAtrium_TMP.u2) annotation (Line(
        points={{84,11},{84,-98},{44,-98},{44,-96.4}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(busConnector.leftAtrium_TMP, leftAtrium_TMP.y) annotation (Line(
        points={{6,42},{6,-90},{36.8,-90}},
        color={0,0,255},
        thickness=0.5,
        smooth=Smooth.None), Text(
        string="%first",
        index=-1,
        extent={{-6,3},{-6,3}}));
    connect(flowMeasure.massFlow, busConnector.CardiacOutput)
      annotation (Line(points={{30,22},{30,42},{6,42}}, color={0,0,127}));
      connect(rightAtrium, RightAtrium.q_in[1]) annotation (Line(
          points={{-92,-14},{-65.1,-14},{-65.1,8.13333}},
          color={127,0,0},
          thickness=0.5));
      connect(rightVentricle.q_in, RightAtrium.q_in[2]) annotation (Line(
          points={{-32.4,-6.4},{-32.4,9},{-65.1,9}},
          color={127,0,0},
          thickness=0.5));
      connect(leftVentricle.q_in, LeftAtrium.q_in[1]) annotation (Line(
          points={{52.4,-6.4},{52.4,26},{94,26},{94,1.13333},{77.9,1.13333}},
          color={127,0,0},
          thickness=0.5));
      connect(LeftAtrium.q_in[2], leftAtrium) annotation (Line(
          points={{77.9,2},{77.9,0},{94,0},{94,-28}},
          color={127,0,0},
          thickness=0.5));
      connect(pressureMeasure1.q_in, LeftAtrium.q_in[3]) annotation (Line(
          points={{94,-84},{94,-92},{108,-92},{108,2.86667},{77.9,2.86667}},
          color={127,0,0},
          thickness=0.5));
      connect(pressureMeasure.q_in, RightAtrium.q_in[3]) annotation (Line(
          points={{-92,-86},{-92,-94},{-102,-94},{-102,-28},{-74,-28},{-74,-14},
              {-65.1,-14},{-65.1,9.86667}},
          color={127,0,0},
          thickness=0.5));
      annotation ( Icon(coordinateSystem(
              preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
            graphics={                Text(
              extent={{-164,-60},{156,-88}},
              lineColor={0,0,255},
              textString="%name")}),
        Documentation(info="<html>
<p>Calculates hearth pumping (left and right atria and ventricles, as wel as coronary circulation). By pressure-flow connectors communicate with pulmonary and systemic circulation.</p>
<p>Blood volume (and pressure) distributions between </p>
<p><ul>
<li>right/left atrium and</li>
<li>right/left ventricle.</li>
</ul></p>
<p>Generate average blood flow throught ventricles.</p>
<p>On the contrary of Tom Coleman models: coronary circulation outflows to right atrium, average blood volume in the hearth are calculated more simple (with the same results in steady state).</p>
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

    package Components
      model Ventricle
       extends Physiolibrary.Organs.Heart.Interfaces.IVentricle;

       parameter String stateName;

       parameter Physiolibrary.Types.Pressure AmbientPressure
        "Environment ambient pressure";

      Physiolibrary.Types.Constants.FractionConst
        basicContractility(k=contractilityBasic)
        annotation (Placement(transformation(extent={{60,6},{68,14}})));

        BetaReceptorsActivityFactor betaReceptorsActivityFactor
          annotation (Placement(transformation(extent={{62,-20},{82,0}})));

        Modelica.Blocks.Math.Add Vol_SteadyState(k1=0.5, k2=0.5)
                                                   annotation (Placement(
              transformation(
              extent={{10,-10},{-10,10}},
              rotation=270,
              origin={-34,18})));

        Physiolibrary.Organs.Heart.Components.Diastole diastole(
          stiffnes=stiffnes,
          n_Diastole=n_Diastole,
          NormalFillingPressure=NormalFillingPressure,
          NormalEndDiastolicVolume=NormalEndDiastolicVolume,
          NormalExternalPressure(displayUnit="Pa") = NormalExternalPressure,
          AmbientPressure=AmbientPressure)
          annotation (Placement(transformation(extent={{-76,-44},{-56,-24}})));
      //    ,Abasic_Diastole=Abasic_Diastole

        Components.Systole systole(
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

        VentricleVolumeAndPumping ventricle(stateName=stateName, K=K)
          annotation (Placement(transformation(extent={{-8,70},{12,90}})));
        //  BasicCompliance=BasicCompliance,
      //

        Modelica.Blocks.Math.Product BloodFlow     annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={16,30})));

      equation
        connect(basicContractility.y, betaReceptorsActivityFactor.yBase)
                                                               annotation (Line(
            points={{69,10},{72,10},{72,-3}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(busConnector.BetaPool_Effect, betaReceptorsActivityFactor.BetaPool_Effect)
          annotation (Line(
            points={{22,2},{22,-4},{62.2,-4}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None), Text(
            string="%first",
            index=-1,
            extent={{-6,3},{-6,3}}));
        connect(busConnector.BetaBlocade_Effect, betaReceptorsActivityFactor.BetaBlockade_Effect)
          annotation (Line(
            points={{22,2},{22,-10},{62.2,-10}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None), Text(
            string="%first",
            index=-1,
            extent={{-6,3},{-6,3}}));
        connect(busConnector.GangliaGeneral_NA, betaReceptorsActivityFactor.GangliaGeneral_NA)
          annotation (Line(
            points={{22,2},{22,-16},{62.2,-16}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None), Text(
            string="%first",
            index=-1,
            extent={{-6,3},{-6,3}}));
        connect(diastole.externalPressure, busConnector.Pericardium_Pressure)
          annotation (Line(
            points={{-56,-40},{22,-40},{22,2}},
            color={0,0,127},
            smooth=Smooth.None), Text(
            string="%second",
            index=1,
            extent={{6,3},{6,3}}));
        connect(busConnector.Pericardium_Pressure, systole.externalPressure)
          annotation (Line(
            points={{22,2},{22,-40},{52,-40}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None), Text(
            string="%first",
            index=-1,
            extent={{-6,3},{-6,3}}));
        connect(betaReceptorsActivityFactor.y, systole.contractility)
          annotation (Line(
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
        connect(ventricle.Volume, Vol)                 annotation (Line(
            points={{12.4,75},{62,75},{62,33},{73,33}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(BloodFlow.u2, busConnector.HeartVentricleRate)
          annotation (Line(
            points={{22,18},{22,2}},
            color={0,0,127},
            smooth=Smooth.None), Text(
            string="%second",
            index=1,
            extent={{6,3},{6,3}}));

      connect(diastole.port, q_in) annotation (Line(
          points={{-66,-44},{-66,-60},{-100,-60},{-100,0}},
          color={127,0,0},
          thickness=0.5));
      connect(systole.port, q_out) annotation (Line(
          points={{62,-44},{62,-60},{100,-60},{100,0}},
          color={127,0,0},
          thickness=0.5));
        connect(BloodFlow.y, ventricle.BloodFlow) annotation (Line(points={{16,
                41},{16,64},{10,64},{10,70}}, color={0,0,127}));
        connect(Vol_SteadyState.y, ventricle.VentricleSteadyStateVolume)
          annotation (Line(points={{-34,29},{-34,70},{-6,70}}, color={0,0,127}));
        connect(q_in, ventricle.q_in) annotation (Line(
            points={{-100,0},{-100,80},{-8,80}},
            color={127,0,0},
            thickness=0.5));
        connect(ventricle.q_out, q_out) annotation (Line(
            points={{12,80},{100,80},{100,0}},
            color={127,0,0},
            thickness=0.5));
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
                textString="Blood_Inflow")}));
      end Ventricle;

      model SA_Node
      extends Physiolibrary.Icons.SinoatrialNode;
        parameter Real SympatheticEffect[:,3]={{ 0.0,    0,  0}, { 1.0,   10,  10}, { 5.0,  120,  0}};
        parameter Real ParasympatheticEffect[:,3]={{ 0.0,    0,  0}, { 2.0,  -20,  -8}, { 8.0,  -40,  0}};

        Modelica.Blocks.Interfaces.RealInput GangliaGeneral_NA
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
        BetaReceptorsActivityFactor betaReceptorsActivityFactor
          annotation (Placement(transformation(extent={{10,62},{30,82}})));
      Physiolibrary.Types.Constants.OneConst                  Constant
        annotation (Placement(transformation(extent={{-2,82},{10,94}})));
      Physiolibrary.Types.Constants.FrequencyConst            Constant1(k(
            displayUnit="1/min") = 1.3666666666667)
        annotation (Placement(transformation(extent={{-6,-10},{14,10}})));
        Modelica.Blocks.Interfaces.RealInput BetaBlockade_Effect
          annotation (Placement(transformation(extent={{-120,0},{-80,40}})));
        Modelica.Blocks.Interfaces.RealInput BetaPool_Effect
          annotation (Placement(transformation(extent={{-120,40},{-80,80}})));
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
        connect(Constant.y, betaReceptorsActivityFactor.yBase) annotation (Line(
            points={{11.5,88},{20,88},{20,79}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(Constant1.y, rate.u[1]) annotation (Line(
            points={{16.5,0},{14,0},{14,-0.666667},{62,-0.666667}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(BetaPool_Effect, betaReceptorsActivityFactor.BetaPool_Effect)
          annotation (Line(
            points={{-100,60},{-46,60},{-46,78},{10.2,78}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(betaReceptorsActivityFactor.BetaBlockade_Effect, BetaBlockade_Effect)
          annotation (Line(
            points={{10.2,72},{-40,72},{-40,20},{-100,20}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(GangliaGeneral_NA, betaReceptorsActivityFactor.GangliaGeneral_NA)
          annotation (Line(
            points={{-100,-20},{-30,-20},{-30,66},{10.2,66}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(betaReceptorsActivityFactor.y, sympatheticEffect.u) annotation (
            Line(
            points={{20,65},{20,30},{26,30}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(sympatheticEffect.val, rate.u[3]) annotation (Line(
            points={{46,30},{54,30},{54,0.666667},{62,0.666667}},
            color={0,0,127},
            smooth=Smooth.None));
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
        annotation (Placement(transformation(extent={{54,60},{34,80}})));
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
                          annotation (Placement(transformation(extent={{-94,-64},
                  {-74,-44}}), iconTransformation(extent={{80,-60},{120,-20}})));
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
            points={{47,86},{44,86},{44,72}},
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
            points={{44,66},{44,54}},
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
            points={{-64.6,-82},{-94,-82},{-94,-54},{-84,-54}},
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
          points={{52,70},{86,70},{86,94},{-94,94}},
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

      model BaroReceptorAdaptation
        extends Physiolibrary.Icons.Barroreceptor;
        Physiolibrary.Types.RealIO.PressureInput pressure
                                               annotation (Placement(transformation(
                extent={{-120,-20},{-80,20}}), iconTransformation(extent={{-110,-10},
                  {-90,10}})));
      Physiolibrary.Blocks.Math.Integrator adaptivePressure(
        y_start=AdaptivePressure,
          k=1/Tau)
        annotation (Placement(transformation(extent={{-22,-10},{-2,10}})));
       // stateName="Baroreflex.AdaptedPressure",
        Modelica.Blocks.Math.Feedback pressureChange
          annotation (Placement(transformation(extent={{-70,-10},{-50,10}})));
      Physiolibrary.Blocks.Interpolation.Curve pressureChangeOnNA(
        x=PressureChangeOnNA[:, 1],
        y=PressureChangeOnNA[:, 2],
        slope=PressureChangeOnNA[:, 3],
          Xscale=101325/760)
        annotation (Placement(transformation(extent={{30,16},{66,52}})));
        Physiolibrary.Types.RealIO.FractionOutput NA
          annotation (Placement(transformation(extent={{80,-20},{120,20}})));
        parameter Physiolibrary.Types.Pressure AdaptivePressure(displayUnit="mmHg");
        parameter Physiolibrary.Types.Time Tau(displayUnit="h");
        parameter Real PressureChangeOnNA[3,:];

      equation
        connect(pressureChange.u2, adaptivePressure.y) annotation (Line(
            points={{-60,-8},{-60,-22},{12,-22},{12,0},{-1,0}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(pressureChange.y, adaptivePressure.u) annotation (Line(
            points={{-51,0},{-24,0}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(pressureChangeOnNA.val, NA) annotation (Line(
            points={{66,34},{88,34},{88,0},{100,0}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(pressureChange.y, pressureChangeOnNA.u) annotation (Line(
            points={{-51,0},{-40,0},{-40,34},{30,34}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(pressure, pressureChange.u1) annotation (Line(
            points={{-100,0},{-68,0}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation ( Icon(coordinateSystem(
                preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
              graphics={
              Text(
                extent={{-122,130},{118,102}},
                lineColor={0,0,0},
                fillColor={213,255,170},
                fillPattern=FillPattern.Solid,
                textString="%name")}));
      end BaroReceptorAdaptation;

      model BetaReceptorsActivityFactor
        //extends Library.BaseFactor2;

        Modelica.Blocks.Interfaces.RealInput GangliaGeneral_NA(final quantity=
              "Frequency", final displayUnit="Hz")       annotation (Placement(transformation(extent={{-100,40},
                  {-80,60}}), iconTransformation(extent={{-108,-70},{-88,-50}})));
        Modelica.Blocks.Interfaces.RealInput BetaPool_Effect
                                            annotation (Placement(transformation(extent={{-100,0},
                  {-80,20}}),
              iconTransformation(extent={{-108,50},{-88,70}})));
        Modelica.Blocks.Interfaces.RealInput BetaBlockade_Effect
                     annotation (Placement(transformation(extent={{-42,-46},{-22,-26}}),
              iconTransformation(extent={{-108,-10},{-88,10}})));
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

        parameter Real NEURALK(displayUnit="1/Hz") = 0.333;
        parameter Real HUMORALK = 0.5;
        parameter Boolean Switch = false;
        parameter Real Setting = 0;

        Modelica.Blocks.Math.Add TotalAgonism(k1=NEURALK, k2=HUMORALK)
          annotation (Placement(transformation(extent={{-58,20},{-38,40}})));
        Modelica.Blocks.Logical.Switch switch1
          annotation (Placement(transformation(extent={{18,28},{38,48}})));
      Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=Switch)
        annotation (Placement(transformation(extent={{-28,38},{-8,58}})));
      Types.Constants.FrequencyConst                          Constant(k=Setting)
        annotation (Placement(transformation(extent={{-30,76},{-10,96}})));
        Modelica.Blocks.Math.Product Activity
          annotation (Placement(transformation(extent={{-6,-40},{14,-20}})));
        Modelica.Blocks.Math.Product SympsEffect
                                              annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={80,-66})));
      equation

        connect(Activity.u2, BetaBlockade_Effect) annotation (Line(
            points={{-8,-36},{-32,-36}},
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
        connect(GangliaGeneral_NA, TotalAgonism.u1) annotation (Line(
            points={{-90,50},{-70,50},{-70,36},{-60,36}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(BetaPool_Effect, TotalAgonism.u2)  annotation (Line(
            points={{-90,10},{-70,10},{-70,24},{-60,24}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(Activity.y, SympsEffect.u2) annotation (Line(
            points={{15,-30},{74,-30},{74,-54}},
            color={0,0,127},
            smooth=Smooth.None));
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
      end BetaReceptorsActivityFactor;

      model LeftHeartCoronary
        extends Physiolibrary.Organs.Interfaces.Heart(Vasculature(stateName=
                "LeftHeart-Vasculature.Effect"));
        extends Physiolibrary.Icons.LeftHeart;
      equation
        connect(busConnector.LeftHeart_Function_Failed, Vasculature.Failed)
          annotation (Line(
            points={{-90,90},{6,90},{6,44},{60,44}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None), Text(
            string="%first",
            index=-1,
            extent={{-6,3},{-6,3}}));
        connect(busConnector.LeftHeart_PO2, PO2Effect.u) annotation (
            Line(
            points={{-90,90},{6,90},{6,30},{62,30}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None), Text(
            string="%first",
            index=-1,
            extent={{-6,3},{-6,3}}));
        connect(busConnector.LeftHeart_O2Need, MetabolismEffect.u)
          annotation (Line(
            points={{-90,90},{6,90},{6,20},{62,20}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None), Text(
            string="%first",
            index=-1,
            extent={{-6,3},{-6,3}}));
        connect(busConnector.LeftHeart_PO2, Vasculature.u) annotation (
           Line(
            points={{-90,90},{6,90},{6,38},{60,38}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None), Text(
            string="%first",
            index=-1,
            extent={{-6,3},{-6,3}}));
      end LeftHeartCoronary;

      model RightHeartCoronary
        extends Physiolibrary.Organs.Interfaces.Heart(Vasculature(stateName=
                "RightHeart-Vasculature.Effect"));
        extends Physiolibrary.Icons.RightHeart;
      equation
        connect(busConnector.RightHeart_PO2, Vasculature.u)
          annotation (Line(
            points={{-90,90},{6,90},{6,38},{60,38}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None), Text(
            string="%first",
            index=-1,
            extent={{-6,3},{-6,3}}));
        connect(busConnector.RightHeart_PO2, PO2Effect.u) annotation (
            Line(
            points={{-90,90},{6,90},{6,30},{62,30}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None), Text(
            string="%first",
            index=-1,
            extent={{-6,3},{-6,3}}));
        connect(busConnector.RightHeart_O2Need, MetabolismEffect.u)
          annotation (Line(
            points={{-90,90},{6,90},{6,20},{62,20}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None), Text(
            string="%first",
            index=-1,
            extent={{-6,3},{-6,3}}));
        connect(busConnector.RightHeart_Function_Failed, Vasculature.Failed)
          annotation (Line(
            points={{-90,90},{6,90},{6,44},{60,44}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None), Text(
            string="%first",
            index=-1,
            extent={{-6,3},{-6,3}}));
      end RightHeartCoronary;

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
      equation
      //  outflow.q = 0;
      //  P=outflow.pressure;
      //  ESV = ((outflow.pressure+additionalPressure_Systolic-externalPressure)/(contractility*Abasic_Systole))^(1/n_Systole);
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
                  replaceable package Medium = Media.Water constrainedby
          Media.Interfaces.PartialMedium "Medium model" annotation (
            choicesAllMatching=true);
          outer Modelica.Fluid.System system "System wide properties";
          Physiolibrary.Fluid.Interfaces.FluidPort_a q_in(redeclare package
            Medium =                                                                 Medium) "Inflow" annotation (
            Placement(transformation(extent = {{-114, -14}, {-86, 14}})));
          Physiolibrary.Fluid.Interfaces.FluidPort_b q_out(redeclare package
            Medium =                                                                  Medium) "Outflow" annotation (
            Placement(transformation(extent = {{86, -14}, {114, 14}})));
          Fluid.Components.VolumePump volumePump(useSolutionFlowInput=true)
            annotation (Placement(transformation(extent={{-28,-8},{-8,12}})));
          Fluid.Components.VolumePump volumePump1(useSolutionFlowInput=true)
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
        Fluid.Components.ElasticVessel elasticVessel(volume_start=8.8e-05,
                                                     nPorts=2)
          annotation (Placement(transformation(extent={{4,-6},{24,14}})));
        equation

          connect(q_in, volumePump.q_in) annotation (Line(
              points={{-100,0},{-98,0},{-98,2},{-28,2}},
              color={127,0,0},
              thickness=0.5));
          connect(volumePump1.q_out, q_out) annotation (Line(
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
            points={{-8,2},{0,2},{0,3.35},{13.9,3.35}},
            color={127,0,0},
            thickness=0.5));
        connect(volumePump1.q_in, elasticVessel.q_in[2]) annotation (Line(
            points={{54,0},{26,0},{26,4.65},{13.9,4.65}},
            color={127,0,0},
            thickness=0.5));
        connect(elasticVessel.fluidVolume, Volume) annotation (Line(points={{24,
                -4},{50,-4},{50,-14},{78,-14},{78,-50},{104,-50}}, color={0,0,
                127}));
        connect(elasticVessel.fluidVolume, feedback.u2) annotation (Line(points=
               {{24,-4},{36,-4},{36,-64},{-6,-64},{-6,-50},{-6,-50}}, color={0,
                0,127}));
        connect(BloodFlow, volumePump1.solutionFlow)
          annotation (Line(points={{60,-100},{60,7},{64,7}}, color={0,0,127}));
        connect(add.y, volumePump.solutionFlow) annotation (Line(points={{-7,82},
                {-18,82},{-18,9}}, color={0,0,127}));
                   annotation (Documentation(info="<HTML>
<p>
Model has a vector of continuous Real input signals as pressures for
vector of pressure-flow connectors.
</p>
</HTML>
"));
        end VentricleVolumeAndPumping;
    end Components;

    package Interfaces
      partial model IVentricle
        extends Physiolibrary.Icons.HeartVentricle;
        parameter Physiolibrary.Types.Volume initialVol = 90e-6
        "Initial blood volume in ventricle";
      //  parameter Physiolibrary.Types.Volume initialESV = 50e-6;

      parameter Physiolibrary.Types.Volume NormalEndDiastolicVolume = 70e-6
        "Typical value of blood volume in ventricle after filling"
          annotation (Dialog(group="Diastole"));
      parameter Physiolibrary.Types.Pressure NormalFillingPressure = (0.00051*101325/760)*(NormalEndDiastolicVolume^(1/n_Diastole))
        "Typical value of filling pressure relative to pericardium pressure"
          annotation (Dialog(group="Diastole"));
      parameter Physiolibrary.Types.Fraction stiffnes = 1
        "Relative stiffnes (1 if normal)"
          annotation (Dialog(group="Diastole"));
      parameter Physiolibrary.Types.Fraction n_Diastole(displayUnit="1") = 2
        "Exponent of P-V characteristic of EDV curve on filling pressure"
          annotation (Dialog(group="Diastole"));
      //parameter Real Abasic_Diastole = 0.00051
      //    "parametrization of end diastolic volume curve"
      //    annotation (Dialog(group="Diastole"));

      parameter Physiolibrary.Types.Pressure NormalSystolicPressure = 15998.684210526315789473684210526
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

      parameter Physiolibrary.Types.Pressure NormalExternalPressure = -446
        "Typical value of pericardium cavity pressure (relative to environment ambient pressure)";
                                                                               //-446 Pa = -3.34522 mmHg

      //parameter Physiolibrary.Types.HydraulicCompliance MaxContractionCompliance; //=1;
      //parameter Physiolibrary.Types.HydraulicConductance Cond1;//=1;
      //parameter Physiolibrary.Types.HydraulicConductance Cond2;//=1;

      Physiolibrary.Fluid.Interfaces.FluidPort_a q_in annotation (
           Placement(transformation(extent={{-110,
                -10},{-90,10}},  rotation=0),
                           iconTransformation(extent={{10,70},{30,90}})));
      Physiolibrary.Fluid.Interfaces.FluidPort_b q_out annotation (
           Placement(transformation(extent={{90,-10},
                {110,10}},       rotation=0),
                             iconTransformation(extent={{-30,90},{-10,110}})));

      Physiolibrary.Types.BusConnector busConnector annotation (Placement(
            transformation(extent={{12,-8},{32,12}}), iconTransformation(
              extent={{-10,-64},{10,-44}})));

        Physiolibrary.Types.RealIO.VolumeOutput Vol
                                            annotation (Placement(transformation(
                extent={{70,30},{76,36}}),    iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={40,-40})));

       annotation (
          Documentation(info="<html>
<pre>Heart ventricle interface.</pre>
</html>",
       revisions="<html>
<ul>
<li><i>january 2009 </i><br>by Marek Matejak in Modelica initially implemented (consulted with Jiri Kofranek), Charles University, Prague<br>orginaly described by Tom Coleman in QHP 2008 beta 3, University of Mississippi Medical Center </li>
<li><i>2014</i><br>Marek Matejak - update to Physiolibrary 2.3.0</li>
</ul>
</html>"),Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},
                {100,100}}),   graphics={Text(
                extent={{-100,-126},{100,-92}},
                textString="%name",
                lineColor={0,0,255})}));
      end IVentricle;
    end Interfaces;

    package Examples
      model VentricleTest
        Components.Ventricle                            rightVentricle(
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
        Fluid.Sources.PressureSource rightAtrium(pressure_start(displayUnit=
                "mmHg") = 101422.97689116)
          annotation (Placement(transformation(extent={{-62,-28},{-42,-8}})));
        Fluid.Sources.PressureSource pulmonaryArtery(pressure_start(displayUnit=
               "mmHg") = 102991.54427809)
          annotation (Placement(transformation(extent={{-58,2},{-38,22}})));
        Components.SA_Node SA_node
          annotation (Placement(transformation(extent={{-52,76},{-32,96}})));
        Components.ANP atriopeptin
          annotation (Placement(transformation(extent={{78,76},{98,96}})));
        Modelica.Blocks.Math.Add avePressure(k1=0.5, k2=0.5)
          annotation (Placement(transformation(extent={{-62,48},{-50,60}})));
        Components.BaroReceptorAdaptation lowPressureReceptors(
          PressureChangeOnNA={{-4.0,0.0,0},{0.0,1.0,0.3},{12.0,4.0,0}},
          AdaptivePressure(displayUnit="mmHg") = 799.93432449,
          Tau(displayUnit="d") = 2592000) annotation (Placement(transformation(extent=
                 {{-10,-10},{10,10}}, origin={-34,54})));
      Types.BusConnector busConnector "signals of organ bood flow resistence"
          annotation (Placement(transformation(extent={{2,32},{22,52}}),
              iconTransformation(extent={{-108,-38},{-92,-22}})));
        Types.Constants.PressureConst pressure(k=543.9553406532)
          annotation (Placement(transformation(extent={{58,36},{66,44}})));
        Types.Constants.PressureConst pressure1(k=1087.9106813064)
          annotation (Placement(transformation(extent={{60,12},{68,20}})));
      equation
        connect(rightAtrium.y, rightVentricle.q_in) annotation (Line(
            points={{-42,-18},{-16,-18},{-16,-10},{5.6,-10},{5.6,-16.4}},
            color={127,0,0},
            thickness=0.5));
        connect(rightVentricle.q_out, pulmonaryArtery.y) annotation (Line(
            points={{14.4,-12},{14.4,12},{-38,12}},
            color={127,0,0},
            thickness=0.5));
        connect(SA_node.Rate, busConnector.HeartVentricleRate) annotation (Line(
            points={{-32.2,86},{12,86},{12,42}},
            color={0,0,127},
            smooth=Smooth.None), Text(
            string="%second",
            index=1,
            extent={{6,3},{6,3}}));
        connect(busConnector.BetaPool_Effect, SA_node.BetaPool_Effect)
          annotation (Line(
            points={{12,42},{12,76},{-90,76},{-90,92},{-52,92}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None), Text(
            string="%first",
            index=-1,
            extent={{-6,3},{-6,3}}));
        connect(busConnector.BetaBlocade_Effect, SA_node.BetaBlockade_Effect)
          annotation (Line(
            points={{12,42},{12,76},{-90,76},{-90,88},{-52,88}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None), Text(
            string="%first",
            index=-1,
            extent={{-6,3},{-6,3}}));
        connect(busConnector.VagusNerve_NA_Hz, SA_node.VagusNerve_NA_Hz)
          annotation (Line(
            points={{12,42},{12,76},{-90,76},{-90,80},{-52,80}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None), Text(
            string="%first",
            index=-1,
            extent={{-6,3},{-6,3}}));
        connect(busConnector.GangliaGeneral_NA, SA_node.GangliaGeneral_NA)
          annotation (Line(
            points={{12,42},{12,76},{-90,76},{-90,84},{-52,84}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None), Text(
            string="%first",
            index=-1,
            extent={{-6,3},{-6,3}}));
        connect(busConnector, atriopeptin.busConnector) annotation (Line(
            points={{12,42},{12,76},{80,76},{80,80}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(avePressure.y,lowPressureReceptors. pressure) annotation (Line(
            points={{-49.4,54},{-44,54}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(busConnector.rightAtrium_TMP, avePressure.u1) annotation (Line(
            points={{12,42},{-92,42},{-92,57.6},{-63.2,57.6}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None), Text(
            string="%first",
            index=-1,
            extent={{-6,3},{-6,3}}));
        connect(busConnector.leftAtrium_TMP, avePressure.u2) annotation (Line(
            points={{12,42},{-92,42},{-92,50.4},{-63.2,50.4}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None), Text(
            string="%first",
            index=-1,
            extent={{-6,3},{-6,3}}));
        connect(lowPressureReceptors.NA, busConnector.AtrialLowPressureReceptors_NA)
          annotation (Line(
            points={{-24,54},{12,54},{12,42}},
            color={0,0,127},
            smooth=Smooth.None), Text(
            string="%second",
            index=1,
            extent={{6,3},{6,3}}));
        connect(rightVentricle.busConnector, busConnector) annotation (Line(
            points={{10,-45.88},{10,-54},{32,-54},{32,42},{12,42}},
            color={0,0,255},
            thickness=0.5));
        connect(pressure.y, busConnector.rightAtrium_TMP) annotation (Line(
              points={{67,40},{72,40},{72,48},{28,48},{28,42},{12,42}}, color={
                0,0,127}), Text(
            string="%second",
            index=1,
            extent={{-6,3},{-6,3}},
            horizontalAlignment=TextAlignment.Right));
        connect(pressure1.y, busConnector.leftAtrium_TMP) annotation (Line(
              points={{69,16},{74,16},{74,30},{34,30},{34,42},{12,42}}, color={
                0,0,127}), Text(
            string="%second",
            index=1,
            extent={{-6,3},{-6,3}},
            horizontalAlignment=TextAlignment.Right));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
              coordinateSystem(preserveAspectRatio=false)));
      end VentricleTest;

      model DiastoleTest
        Fluid.Sources.PressureSource rightAtrium(pressure_start(displayUnit=
                "mmHg") = 101422.97689116)
          annotation (Placement(transformation(extent={{-80,-20},{-60,0}})));
      Types.BusConnector busConnector "signals of organ bood flow resistence"
          annotation (Placement(transformation(extent={{2,32},{22,52}}),
              iconTransformation(extent={{-108,-38},{-92,-22}})));
        Components.Diastole                            diastole(
          stiffnes=1,
          n_Diastole=2,
          NormalFillingPressure=95.9921189388,
          NormalEndDiastolicVolume=0.000125,
          NormalExternalPressure(displayUnit="mmHg") = -445.2967739661,
          AmbientPressure=101325.0144354)
          annotation (Placement(transformation(extent={{-28,14},{-8,34}})));
        Fluid.Sensors.PressureMeasure pressureMeasure
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
            points={{-60,-10},{-18,-10},{-18,14}},
            color={127,0,0},
            thickness=0.5));
        connect(rightAtrium.y, pressureMeasure.q_in) annotation (Line(
            points={{-60,-10},{48,-10},{48,-16},{58,-16},{58,-8}},
            color={127,0,0},
            thickness=0.5));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
              coordinateSystem(preserveAspectRatio=false)));
      end DiastoleTest;

      model RightHeartTest
        Components.Ventricle                            rightVentricle(
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
               "mmHg") = 102991.54427809)
          annotation (Placement(transformation(extent={{-58,2},{-38,22}})));
        Components.SA_Node SA_node
          annotation (Placement(transformation(extent={{-52,76},{-32,96}})));
        Components.ANP atriopeptin
          annotation (Placement(transformation(extent={{78,76},{98,96}})));
        Modelica.Blocks.Math.Add avePressure(k1=0.5, k2=0.5)
          annotation (Placement(transformation(extent={{-62,48},{-50,60}})));
        Components.BaroReceptorAdaptation lowPressureReceptors(
          PressureChangeOnNA={{-4.0,0.0,0},{0.0,1.0,0.3},{12.0,4.0,0}},
          AdaptivePressure(displayUnit="mmHg") = 799.93432449,
          Tau(displayUnit="d") = 2592000) annotation (Placement(transformation(extent=
                 {{-10,-10},{10,10}}, origin={-34,54})));
      Types.BusConnector busConnector "signals of organ bood flow resistence"
          annotation (Placement(transformation(extent={{2,32},{22,52}}),
              iconTransformation(extent={{-108,-38},{-92,-22}})));
        Types.Constants.PressureConst pressure(k=543.9553406532)
          annotation (Placement(transformation(extent={{58,36},{66,44}})));
        Types.Constants.PressureConst pressure1(k=1087.9106813064)
          annotation (Placement(transformation(extent={{60,12},{68,20}})));
      Types.Constants.VolumeConst               RightAtriumV0(k=0)
        annotation (Placement(transformation(extent={{-60,-46},{-52,-38}})));
         Fluid.Components.ElasticVessel               RightAtrium(
          stateName="RightAtrium.Vol",
          useExternalPressureInput=true,
          useV0Input=true,
          useComplianceInput=false,
          volume_start=5.16454e-05,
          Compliance=9.3757696980707e-08,
          nPorts=2)                     "right atrium"
        annotation (Placement(transformation(extent={{-45,-65},{-25,-45}})));
        Fluid.Sources.PressureSource systemicArtery(pressure_start(displayUnit=
                "mmHg") = 113990.64123983)
          annotation (Placement(transformation(extent={{-100,-96},{-80,-76}})));
        Fluid.Components.Conductor systemic(Conductance=1.250102626409427e-07*(
              5/90))
                   annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={-54,-86})));
      equation
        connect(rightVentricle.q_out, pulmonaryArtery.y) annotation (Line(
            points={{14.4,-12},{14.4,12},{-38,12}},
            color={127,0,0},
            thickness=0.5));
        connect(SA_node.Rate, busConnector.HeartVentricleRate) annotation (Line(
            points={{-32.2,86},{12,86},{12,42}},
            color={0,0,127},
            smooth=Smooth.None), Text(
            string="%second",
            index=1,
            extent={{6,3},{6,3}}));
        connect(busConnector.BetaPool_Effect, SA_node.BetaPool_Effect)
          annotation (Line(
            points={{12,42},{12,76},{-90,76},{-90,92},{-52,92}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None), Text(
            string="%first",
            index=-1,
            extent={{-6,3},{-6,3}}));
        connect(busConnector.BetaBlocade_Effect, SA_node.BetaBlockade_Effect)
          annotation (Line(
            points={{12,42},{12,76},{-90,76},{-90,88},{-52,88}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None), Text(
            string="%first",
            index=-1,
            extent={{-6,3},{-6,3}}));
        connect(busConnector.VagusNerve_NA_Hz, SA_node.VagusNerve_NA_Hz)
          annotation (Line(
            points={{12,42},{12,76},{-90,76},{-90,80},{-52,80}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None), Text(
            string="%first",
            index=-1,
            extent={{-6,3},{-6,3}}));
        connect(busConnector.GangliaGeneral_NA, SA_node.GangliaGeneral_NA)
          annotation (Line(
            points={{12,42},{12,76},{-90,76},{-90,84},{-52,84}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None), Text(
            string="%first",
            index=-1,
            extent={{-6,3},{-6,3}}));
        connect(busConnector, atriopeptin.busConnector) annotation (Line(
            points={{12,42},{12,76},{80,76},{80,80}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(avePressure.y,lowPressureReceptors. pressure) annotation (Line(
            points={{-49.4,54},{-44,54}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(busConnector.rightAtrium_TMP, avePressure.u1) annotation (Line(
            points={{12,42},{-92,42},{-92,57.6},{-63.2,57.6}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None), Text(
            string="%first",
            index=-1,
            extent={{-6,3},{-6,3}}));
        connect(busConnector.leftAtrium_TMP, avePressure.u2) annotation (Line(
            points={{12,42},{-92,42},{-92,50.4},{-63.2,50.4}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None), Text(
            string="%first",
            index=-1,
            extent={{-6,3},{-6,3}}));
        connect(lowPressureReceptors.NA, busConnector.AtrialLowPressureReceptors_NA)
          annotation (Line(
            points={{-24,54},{12,54},{12,42}},
            color={0,0,127},
            smooth=Smooth.None), Text(
            string="%second",
            index=1,
            extent={{6,3},{6,3}}));
        connect(rightVentricle.busConnector, busConnector) annotation (Line(
            points={{10,-45.88},{10,-54},{32,-54},{32,42},{12,42}},
            color={0,0,255},
            thickness=0.5));
        connect(pressure.y, busConnector.rightAtrium_TMP) annotation (Line(
              points={{67,40},{72,40},{72,48},{28,48},{28,42},{12,42}}, color={
                0,0,127}), Text(
            string="%second",
            index=1,
            extent={{-6,3},{-6,3}},
            horizontalAlignment=TextAlignment.Right));
        connect(pressure1.y, busConnector.leftAtrium_TMP) annotation (Line(
              points={{69,16},{74,16},{74,30},{34,30},{34,42},{12,42}}, color={
                0,0,127}), Text(
            string="%second",
            index=1,
            extent={{-6,3},{-6,3}},
            horizontalAlignment=TextAlignment.Right));
        connect(busConnector.Pericardium_Pressure,RightAtrium.externalPressure)
          annotation (Line(
            points={{12,42},{12,-46},{-29,-46}},
            color={0,0,255},
            thickness=0.1,
            smooth=Smooth.None), Text(
            string="%first",
            index=-1,
            extent={{110,10},{110,10}}));
      connect(RightAtrium.zeroPressureVolume,RightAtriumV0. y) annotation (Line(
          points={{-37,-46},{-46,-46},{-46,-42},{-51,-42}},
          color={0,0,127},
          smooth=Smooth.None));
        connect(RightAtrium.q_in[1], rightVentricle.q_in) annotation (Line(
            points={{-35.1,-55.65},{-35.1,-16.4},{5.6,-16.4}},
            color={127,0,0},
            thickness=0.5));
        connect(systemicArtery.y, systemic.q_out) annotation (Line(
            points={{-80,-86},{-64,-86}},
            color={127,0,0},
            thickness=0.5));
        connect(systemic.q_in, RightAtrium.q_in[2]) annotation (Line(
            points={{-44,-86},{-16,-86},{-16,-52},{-35.1,-52},{-35.1,-54.35}},
            color={127,0,0},
            thickness=0.5));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
              coordinateSystem(preserveAspectRatio=false)));
      end RightHeartTest;

      model RightAtriumTest
      Types.BusConnector busConnector "signals of organ bood flow resistence"
          annotation (Placement(transformation(extent={{2,32},{22,52}}),
              iconTransformation(extent={{-108,-38},{-92,-22}})));
      Types.Constants.VolumeConst               RightAtriumV0(k=0)
        annotation (Placement(transformation(extent={{-60,-46},{-52,-38}})));
         Fluid.Components.ElasticVessel               RightAtrium(
          stateName="RightAtrium.Vol",
          useExternalPressureInput=true,
          useV0Input=true,
          useComplianceInput=false,
          volume_start=5.16454e-05,
          Compliance=9.3757696980707e-08,
          nPorts=1)                     "right atrium"
        annotation (Placement(transformation(extent={{-45,-65},{-25,-45}})));
        Fluid.Sources.PressureSource systemicAtrium(pressure_start(displayUnit=
                "mmHg") = 101426.33944984)
          annotation (Placement(transformation(extent={{-100,-96},{-80,-76}})));
        Fluid.Components.Conductor systemic(Conductance=1.250102626409427e-07*(
              5/90))
                   annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={-54,-86})));
      equation
        connect(busConnector.Pericardium_Pressure,RightAtrium.externalPressure)
          annotation (Line(
            points={{12,42},{12,-46},{-29,-46}},
            color={0,0,255},
            thickness=0.1,
            smooth=Smooth.None), Text(
            string="%first",
            index=-1,
            extent={{110,10},{110,10}}));
      connect(RightAtrium.zeroPressureVolume,RightAtriumV0. y) annotation (Line(
          points={{-37,-46},{-46,-46},{-46,-42},{-51,-42}},
          color={0,0,127},
          smooth=Smooth.None));
        connect(systemicAtrium.y, systemic.q_out) annotation (Line(
            points={{-80,-86},{-64,-86}},
            color={127,0,0},
            thickness=0.5));
        connect(systemic.q_in, RightAtrium.q_in[1]) annotation (Line(
            points={{-44,-86},{-35.1,-86},{-35.1,-55}},
            color={127,0,0},
            thickness=0.5));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
              coordinateSystem(preserveAspectRatio=false)));
      end RightAtriumTest;
    end Examples;
  end Heart;

  package Lungs
    model PulmonaryCirculation

       extends Physiolibrary.Icons.PulmonaryCirculation;

      //Can not be one port, because for example whole periferal resistance is taken as ResistorBases, but blood can accumulate inside

    Physiolibrary.Fluid.Interfaces.FluidPort_a q_in "Blood inflow"
      annotation ( Placement(transformation(extent={{-110,
              -10},{-90,10}},  rotation=0),
                                      iconTransformation(extent={{-110,-10},{
              -90,10}})));
    Physiolibrary.Fluid.Interfaces.FluidPort_b q_out "Blood outflow"
      annotation ( Placement(transformation(extent={{94,-10},
              {114,10}},       rotation=0),
                                    iconTransformation(extent={{90,-10},{110,
              10}})));

    Physiolibrary.Fluid.Components.ElasticVessel pulmCapys(
      stateName="PulmCapys.Vol",
      useComplianceInput=true,
      useExternalPressureInput=true,
      useV0Input=true,
      volume_start=0.000200141,
      nPorts=3)                 "pulmonary capilaries"
      annotation (Placement(transformation(extent={{-22,-10},{-2,10}})));

    Physiolibrary.Fluid.Components.ElasticVessel pulmArty(
      stateName="PulmArty.Vol",
      useComplianceInput=true,
      useExternalPressureInput=true,
      useV0Input=true,
      volume_start=0.000200488,
      nPorts=2)
      annotation (Placement(transformation(extent={{-86,-10},{-66,10}})));

    Physiolibrary.Fluid.Components.ElasticVessel pulmVeins(
      stateName="PulmVeins.Vol",
      useComplianceInput=true,
      useExternalPressureInput=true,
      useV0Input=true,
      volume_start=0.000210463,
        nPorts=2)               "pulmonary veins"
      annotation (Placement(transformation(extent={{38,-10},{58,10}})));

    Physiolibrary.Fluid.Components.Conductor pulmArtyConductance(Conductance=1.6876385456527e-07)
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
    Physiolibrary.Fluid.Components.Conductor pulmCapysConductance(
        Conductance=2.250184727537e-07)
      annotation (Placement(transformation(extent={{4,-11},{26,11}})));
    Physiolibrary.Types.Constants.VolumeConst               VeinsV0(k=0.00015)
      annotation (Placement(transformation(extent={{30,16},{38,24}})));
    Physiolibrary.Types.Constants.HydraulicComplianceConst VeinsCompliance(k=
          4.50036945507396e-008)
      annotation (Placement(transformation(extent={{66,14},{58,22}})));
    Physiolibrary.Fluid.Components.Conductor pulmVeinsConductance(
        Conductance=6.7505541826109e-07)
      annotation (Placement(transformation(extent={{62,-11},{84,11}})));
    Physiolibrary.Types.BusConnector busConnector
      "signals of organ bood flow resistence" annotation (Placement(
          transformation(extent={{18,66},{38,86}}), iconTransformation(extent=
             {{-108,42},{-92,58}})));
      Components.LungBloodFlow lungBloodFlow
        annotation (Placement(transformation(extent={{-26,74},{-6,94}})));
    Physiolibrary.Fluid.Sensors.FlowMeasure flowMeasure
      annotation (Placement(transformation(extent={{-42,-10},{-22,10}})));
      Modelica.Blocks.Math.Sum sum1(nin=3)
        annotation (Placement(transformation(extent={{-28,28},{-20,36}})));
      Modelica.Blocks.Math.Sum sum2(nin=2)
        annotation (Placement(transformation(extent={{50,-38},{42,-30}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasure
      annotation (Placement(transformation(extent={{-8,-26},{12,-6}})));
    Physiolibrary.Types.Constants.DensityConst density(k=1000)
        "TODO @P3 - correct volume-mass conversion"
      annotation (Placement(transformation(extent={{-84,56},{-76,64}})));
    Modelica.Blocks.Math.Division toVolume
      annotation (Placement(transformation(extent={{-66,56},{-46,76}})));
      Modelica.Blocks.Math.Gain PulmonaryCirculation_DeoxygenatedBloodVolume(k=1)
        annotation (Placement(transformation(extent={{-6,-68},{14,-48}})));
    equation
      connect(pulmArty.externalPressure,busConnector. Thorax_AvePressure) annotation (Line(
          points={{-70,9},{-70,14},{28,14},{28,76}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pulmCapys.externalPressure,busConnector. Thorax_AvePressure) annotation (Line(
          points={{-6,9},{-6,14},{28,14},{28,76}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pulmVeins.externalPressure,busConnector. Thorax_AvePressure) annotation (Line(
          points={{54,9},{54,14},{28,14},{28,76}},
          color={0,0,127},
          smooth=Smooth.None));
    connect(pulmArty.zeroPressureVolume, ArtysV0.y) annotation (Line(
        points={{-78,9},{-78,20},{-85,20}},
        color={0,0,127},
        smooth=Smooth.None));
      connect(pulmArty.compliance, ArtysCompliance.y)
                                              annotation (Line(
          points={{-74,9},{-74,20},{-63,20}},
          color={0,0,127},
          smooth=Smooth.None));
    connect(CapysV0.y, pulmCapys.zeroPressureVolume) annotation (Line(
        points={{-19,20},{-14,20},{-14,9}},
        color={0,0,127},
        smooth=Smooth.None));
      connect(CapysCompliance.y,pulmCapys.compliance)
                                               annotation (Line(
          points={{-5,20},{-10,20},{-10,9}},
          color={0,0,127},
          smooth=Smooth.None));
    connect(pulmVeins.zeroPressureVolume, VeinsV0.y) annotation (Line(
        points={{46,9},{46,20},{39,20}},
        color={0,0,127},
        smooth=Smooth.None));
      connect(VeinsCompliance.y,pulmVeins.compliance)
                                               annotation (Line(
          points={{57,18},{50,18},{50,9}},
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

      connect(pulmArtyConductance.q_out, flowMeasure.q_in) annotation (Line(
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
          points={{39,20},{42,20},{42,26},{-78,26},{-78,32.2667},{-28.8,32.2667}},
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
    connect(flowMeasure.q_out, pulmCapys.q_in[1]) annotation (Line(
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
    connect(toVolume.y, lungBloodFlow.CardiacOutput) annotation (Line(points=
            {{-45,66},{-32,66},{-32,90},{-26,90}}, color={0,0,127}));
      connect(PulmonaryCirculation_DeoxygenatedBloodVolume.y, busConnector.PulmonaryCirculation_DeoxygenatedBloodVolume)
        annotation (Line(points={{15,-58},{94,-58},{94,76},{28,76}}, color={0,0,127}));
    connect(density.y, toVolume.u2)
      annotation (Line(points={{-75,60},{-68,60}}, color={0,0,127}));
    connect(flowMeasure.massFlow, toVolume.u1) annotation (Line(points={{-32,
            12},{-32,44},{-94,44},{-94,72},{-68,72}}, color={0,0,127}));
    connect(pressureMeasure.q_in, pulmCapys.q_in[3]) annotation (Line(
        points={{-2,-22},{-12,-22},{-12,0.866667},{-12.1,0.866667}},
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
    end PulmonaryCirculation;

    package Components
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
    end Components;
  end Lungs;

  package Liver
    model Liver
      extends Physiolibrary.Organs.Interfaces.BaseDO;
      extends Physiolibrary.Icons.Liver;
    Physiolibrary.Fluid.Interfaces.FluidPort_a portalVein annotation (
        Placement(transformation(extent={{-10,-110},
              {10,-90}}, rotation=0),
                        iconTransformation(extent={{12,-58},{32,-38}})));
    Physiolibrary.Fluid.Components.Conductor liverPortalConductance(
        Conductance=2.2251826750088e-08)
      "corrected to flow 1250ml/min in pressure gradient 1 mmHg"
      annotation (Placement(transformation(extent={{-52,-8},{-68,8}})));
    Physiolibrary.Fluid.Sensors.VolumeFlowMeasure flowMeasure1 annotation (
        Placement(transformation(
          extent={{-10,10},{10,-10}},
          rotation=180,
          origin={-84,0})));
    Physiolibrary.Fluid.Sensors.VolumeFlowMeasure flowMeasure2 annotation (
        Placement(transformation(
          extent={{-10,10},{10,-10}},
          rotation=180,
          origin={-24,-16})));
    Physiolibrary.Fluid.Components.Conductor HepaticArtyConductance(
        Conductance=3.5002873539464e-10)
      annotation (Placement(transformation(extent={{0,36},{-20,56}})));
    Physiolibrary.Fluid.Sensors.VolumeFlowMeasure flowMeasure3 annotation (
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
      connect(flowMeasure1.q_out, q_out) annotation (Line(
          points={{-94,7.34788e-16},{-94,-80},{114,-80}},
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
      extends Physiolibrary.Organs.Interfaces.BaseDO;
      extends Physiolibrary.Icons.Kidney;

    Physiolibrary.Blocks.Factors.Normalization
      NephronCountEffect_AfferentArtery
      annotation (Placement(transformation(extent={{20,34},{40,54}})));
    Physiolibrary.Types.Constants.HydraulicConductanceConst
      Afferent_BasicConductance(k=4.2503489297921e-09)
      annotation (Placement(transformation(extent={{16,48},{28,60}})));
      Components.VariableResistorWithMyogenicResponse AfferentArtery(
        PressureChangeOnMyogenicCondEffect={{-20.0,1.2,0.0},{0.0,1.0,-0.02},{
            20.0,0.8,0.0}},
        pressureChange(start=0),
        InitialPressureChange(displayUnit="mmHg") = 9.33256711905,
        K_PressureChange(displayUnit="Hz"))
        annotation (Placement(transformation(extent={{20,-12},{44,12}})));
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
    Physiolibrary.Fluid.Components.Conductor EfferentArtery(
        useConductanceInput=true)
      annotation (Placement(transformation(extent={{-34,-12},{-58,12}})));
    Physiolibrary.Fluid.Components.Conductor ArcuateArtery(Conductance=
          7.500615758456399e-008)
      annotation (Placement(transformation(extent={{74,-8},{58,8}})));
      Physiolibrary.Organs.Components.AplhaReceptorsActivityFactor
        AplhaReceptors_KidneyAfferentArtery(data={{1.5,1.0,0.0},{7.0,0.9,0.0}})
        annotation (Placement(transformation(extent={{20,14},{40,34}})));
      Physiolibrary.Organs.Components.AplhaReceptorsActivityFactor
        AplhaReceptors_KidneyEfferentArtery(data={{1.5,1.0,0.0},{7.0,0.9,0.0}})
        annotation (Placement(transformation(extent={{-56,6},{-36,26}})));
    Physiolibrary.Blocks.Factors.Normalization
      Anesthesia_KidneyEfferentArtery
      annotation (Placement(transformation(extent={{-56,26},{-36,46}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasure
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          origin={-22,12})));
      Modelica.Blocks.Math.Product KidneyPlasmaFlow annotation (Placement(
            transformation(
            extent={{-5,-5},{5,5}},
            rotation=90,
            origin={83,67})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasure1
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
    Physiolibrary.Fluid.Components.Conductor resistorWithCond(
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
    Physiolibrary.Fluid.Sensors.VolumeFlowMeasure flowMeasure1
      annotation (Placement(transformation(extent={{54,-70},{74,-90}})));
    Physiolibrary.Fluid.Sources.VolumeInflowSource
                                              inputPump(
        useSolutionFlowInput=true)
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
        useSolutionFlowInput=true)
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
      connect(busConnector.AlphaPool_Effect, AplhaReceptors_KidneyAfferentArtery.AlphaPool_Effect)
        annotation (Line(
          points={{-90,90},{-90,90},{-14,90},{-14,62},{-14,30},{20.2,30}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}}));
      connect(busConnector.AlphaBlocade_Effect, AplhaReceptors_KidneyAfferentArtery.AlphaBlockade_Effect)
        annotation (Line(
          points={{-90,90},{-90,90},{-14,90},{-14,54},{-14,24},{20.2,24}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}}));
      connect(busConnector.GangliaGeneral_NA,
        AplhaReceptors_KidneyAfferentArtery.GangliaGeneral_NA) annotation (
          Line(
          points={{-90,90},{-14,90},{-14,90},{-14,18},{20.2,18}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}}));
      connect(busConnector.AlphaPool_Effect, AplhaReceptors_KidneyEfferentArtery.AlphaPool_Effect)
        annotation (Line(
          points={{-90,90},{-92,90},{-92,22},{-55.8,22}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}}));
      connect(busConnector.GangliaGeneral_NA,
        AplhaReceptors_KidneyEfferentArtery.GangliaGeneral_NA) annotation (
          Line(
          points={{-90,90},{-92,90},{-92,10},{-55.8,10}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}}));
      connect(busConnector.AlphaBlocade_Effect, AplhaReceptors_KidneyEfferentArtery.AlphaBlockade_Effect)
        annotation (Line(
          points={{-90,90},{-92,90},{-92,16},{-55.8,16}},
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
          points={{58,2.22045e-16},{42,2.22045e-16},{42,0},{20,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(AfferentArtery.q_in, pressureMeasure1.q_in) annotation (Line(
          points={{20,0},{58,0},{58,-16},{56,-16}},
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
    connect(flowMeasure1.q_out, q_out) annotation (Line(
        points={{74,-80},{114,-80}},
        color={0,0,0},
        thickness=1));
    connect(EfferentArtery.q_in, pressureMeasure.q_in) annotation (Line(
        points={{-34,0},{-30,0},{-30,6},{-26,6}},
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
        points={{44,0},{-34,0}},
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
  end Kidney;

  package Skin
    model Skin
      extends Physiolibrary.Organs.Interfaces.BaseDO;
      extends Physiolibrary.Icons.Skin;

    Physiolibrary.Fluid.Components.Conductor skin(useConductanceInput=
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
    Physiolibrary.Blocks.Factors.Normalization Viscosity_Skin
      annotation (Placement(transformation(extent={{58,58},{78,78}})));
    Physiolibrary.Blocks.Factors.Normalization Anesthesia_Skin
      annotation (Placement(transformation(extent={{58,50},{78,70}})));
      Physiolibrary.Blocks.Factors.SplineLagOrZero
        Vasculature_Skin(HalfTime=30*86400*Modelica.Math.log(2), data={{41,1.2,0},{51,1.0,-0.03},{61,0.8,0}},
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
      connect(busConnector.Viscosity_ConductanceEffect, Viscosity_Skin.u)
        annotation (Line(
          points={{-90,90},{-12,90},{-12,68},{60,68}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}}));
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
      connect(skin.q_out, q_out) annotation (Line(
          points={{56,-14},{-24,-14},{-24,-80},{114,-80}},
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
    Physiolibrary.Blocks.Interpolation.Curve HtcOnVisc(
      x={0,0.44,0.8},
      y={0.5,1,5},
      slope={0.8,3,30})
      annotation (Placement(transformation(extent={{46,-52},{66,-32}})));
      Modelica.Blocks.Math.Division division1
        annotation (Placement(transformation(extent={{78,-40},{86,-32}})));
    Physiolibrary.Types.Constants.OneConst one1
      annotation (Placement(transformation(extent={{64,-30},{72,-22}})));
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
      connect(HtcFract.y,HtcOnVisc. u) annotation (Line(
          points={{40.4,-42},{46,-42}},
          color={0,0,127},
          smooth=Smooth.None));
    connect(one1.y, division1.u1) annotation (Line(
        points={{73,-26},{74,-26},{74,-33.6},{77.2,-33.6}},
        color={0,0,127},
        smooth=Smooth.None));
      connect(HtcOnVisc.val,division1. u2) annotation (Line(
          points={{66,-42},{75.5,-42},{75.5,-38.4},{77.2,-38.4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(division1.y,busConnector. Viscosity_ConductanceEffect) annotation (Line(
          points={{86.4,-36},{90,-36},{90,68},{-94,68}},
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
  end Blood;

  package Systems
    model PeripheralCirculation
      extends Interfaces.BaseDO;
      extends Physiolibrary.Icons.PeripheralCirculation;

      Interfaces.TissueBloodFlow bone(Cond=4.536109889163e-10)
        annotation (Placement(transformation(extent={{-38,62},{-12,88}})));
      Interfaces.TissueBloodFlow brain(
        onAnesthesia=false,
        onAngiotensinII=false,
        onVasopressin=false,
        onCatecholamines=false,
        onOxygenAndCarbonDioxide=true,
        VasculatureConductanceOnPO2={{27,1.2,0},{37,1.0,-0.03},{47,0.8,0}},
        onOxygenOnly=false,
        Cond=1.1375933900326e-09)
        annotation (Placement(transformation(extent={{12,44},{38,70}})));
      Interfaces.TissueBloodFlow fat(Cond=3.3752770913055e-10)
        annotation (Placement(transformation(extent={{-38,26},{-12,52}})));
      Skin.Skin skin
        annotation (Placement(transformation(extent={{22,-34},{46,-10}})));
      Interfaces.TissueBloodFlow otherTissue(Cond=5.2504310309196e-10)
        annotation (Placement(transformation(extent={{-36,-98},{-10,-72}})));
      Interfaces.TissueBloodFlow skeletalMuscle(
        Cond=9.0007389101479e-10,
        onOxygenNeed=true,
        onExercise=true)
        annotation (Placement(transformation(extent={{-34,-54},{-8,-28}})));
      Interfaces.TissueBloodFlow respiratoryMuscle(Cond=1.3751128890504e-10,
          onOxygenNeed=true)
        annotation (Placement(transformation(extent={{20,-78},{46,-52}})));
    /*Physiolibrary.Types.BusConnector busConnector
  "signals of organ bood flow resistence" annotation (Placement(
      transformation(extent={{-68,84},{-48,104}}),  iconTransformation(
        extent={{60,10},{78,28}})));*/
      Kidney.Kidney kidney
        annotation (Placement(transformation(extent={{16,12},{36,32}})));
    equation

      connect(bone.q_in, flowMeasure.q_out) annotation (Line(
          points={{-12,75},{68,75},{68,0},{78,0}},
          color={0,0,0},
          smooth=Smooth.None,
          thickness=1));
      connect(brain.q_in, flowMeasure.q_out) annotation (Line(
          points={{38,57},{68,57},{68,0},{78,0}},
          color={0,0,0},
          smooth=Smooth.None,
          thickness=1));
      connect(fat.q_in, flowMeasure.q_out) annotation (Line(
          points={{-12,39},{68,39},{68,0},{78,0}},
          color={0,0,0},
          smooth=Smooth.None,
          thickness=1));
      connect(skin.q_in, flowMeasure.q_out) annotation (Line(
          points={{53.2,-22},{68,-22},{68,0},{78,0}},
          color={0,0,0},
          smooth=Smooth.None,
          thickness=1));
      connect(otherTissue.q_in, flowMeasure.q_out)  annotation (Line(
          points={{-10,-85},{68,-85},{68,0},{78,0}},
          color={0,0,0},
          smooth=Smooth.None,
          thickness=1));
      connect(skeletalMuscle.q_in, flowMeasure.q_out)  annotation (Line(
          points={{-8,-41},{68,-41},{68,0},{78,0}},
          color={0,0,0},
          smooth=Smooth.None,
          thickness=1));
      connect(respiratoryMuscle.q_in, flowMeasure.q_out) annotation (Line(
          points={{46,-65},{68,-65},{68,0},{78,0}},
          color={0,0,0},
          smooth=Smooth.None,
          thickness=1));
      connect(respiratoryMuscle.q_out,q_out) annotation (Line(
          points={{20,-65},{-84,-65},{-84,-80},{114,-80}},
          color={0,0,0},
          smooth=Smooth.None,
          thickness=1));
      connect(skeletalMuscle.q_out,q_out)  annotation (Line(
          points={{-34,-41},{-84,-41},{-84,-80},{114,-80}},
          color={0,0,0},
          smooth=Smooth.None,
          thickness=1));
      connect(otherTissue.q_out,q_out)  annotation (Line(
          points={{-36,-85},{-84,-85},{-84,-80},{114,-80}},
          color={0,0,0},
          smooth=Smooth.None,
          thickness=1));
      connect(skin.q_out,q_out) annotation (Line(
          points={{15.04,-22},{-84,-22},{-84,-80},{114,-80}},
          color={0,0,0},
          smooth=Smooth.None,
          thickness=1));
      connect(fat.q_out,q_out) annotation (Line(
          points={{-38,39},{-84,39},{-84,-80},{114,-80}},
          color={0,0,0},
          smooth=Smooth.None,
          thickness=1));
      connect(brain.q_out,q_out) annotation (Line(
          points={{12,57},{-84,57},{-84,-80},{114,-80}},
          color={0,0,0},
          smooth=Smooth.None,
          thickness=1));
      connect(bone.q_out,q_out) annotation (Line(
          points={{-38,75},{-84,75},{-84,-80},{114,-80}},
          color={0,0,0},
          smooth=Smooth.None,
          thickness=1));
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

      connect(kidney.q_out,q_out) annotation (Line(
          points={{10.2,22},{-84,22},{-84,-80},{114,-80}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(kidney.q_in, flowMeasure.q_out) annotation (Line(
          points={{42,22},{68,22},{68,0},{78,0}},
          color={0,0,0},
          smooth=Smooth.None,
          thickness=1));

    connect(bone.tissueConnector, busConnector.bone) annotation (Line(
        points={{-25,85.4},{-25,90},{-90,90}},
        color={127,0,0},
        thickness=0.5,
        smooth=Smooth.None));
    connect(fat.tissueConnector, busConnector.fat) annotation (Line(
        points={{-25,49.4},{-25,48},{-8,48},{-8,58},{-90,58},{-90,90}},
        color={127,0,0},
        thickness=0.5,
        smooth=Smooth.None));
    connect(skeletalMuscle.tissueConnector, busConnector.skeletalMuscle)
      annotation (Line(
        points={{-21,-30.6},{-21,24},{-54,24},{-54,54},{-90,54},{-90,90}},
        color={127,0,0},
        thickness=0.5,
        smooth=Smooth.None));
    connect(otherTissue.tissueConnector, busConnector.otherTissue)
      annotation (Line(
        points={{-23,-74.6},{-23,-56},{-44,-56},{-44,78},{-42,78},{-42,90},{-90,
              90}},
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
    end PeripheralCirculation;

    model SplanchnicCirculation
      extends Physiolibrary.Icons.PerfusionDO;
      extends Physiolibrary.Icons.GITract;

    Physiolibrary.Fluid.Interfaces.FluidPort_a q_in "Blood inflow"
      annotation ( Placement(transformation(extent={{90,-10},
              {110,10}},       rotation=0),
                                    iconTransformation(extent={{90,-10},{110,
              10}})));
    Physiolibrary.Fluid.Interfaces.FluidPort_b q_out "Blood outflow"
      annotation ( Placement(transformation(extent={{-110,
              -10},{-90,10}},  rotation=0),
                                      iconTransformation(extent={{-110,-10},{
              -90,10}})));

    Physiolibrary.Types.BusConnector busConnector
      "signals of organ bood flow resistence" annotation (Placement(
          transformation(extent={{56,-56},{76,-36}}), iconTransformation(
            extent={{-108,42},{-92,58}})));

    Physiolibrary.Fluid.Components.ElasticVessel portalVein(
      stateName="SplanchnicVeins.Vol",
      useExternalPressureInput=true,
      useV0Input=true,
      useComplianceInput=false,
      volume_start=0.00100999,
      Compliance=4.6878848490354e-07,
      nPorts=3)
      annotation (Placement(transformation(extent={{-16,-10},{5,11}})));
      Interfaces.TissueBloodFlow GITract(Cond=1.4001149415786e-09)
        annotation (Placement(transformation(extent={{34,-12},{58,12}})));
    Physiolibrary.Types.Constants.PressureConst ExternalPressure(k=0)
      annotation (Placement(transformation(extent={{24,20},{16,28}})));
    Physiolibrary.Types.Constants.HydraulicComplianceConst Compliance(k=
          4.6878848490354e-07)
      annotation (Placement(transformation(extent={{10,32},{2,40}})));
    Physiolibrary.Types.Constants.VolumeConst               V0(k(displayUnit=
            "ml") = 0.0005)
      annotation (Placement(transformation(extent={{-27,11},{-19,19}})));
      Liver.Liver liver
        annotation (Placement(transformation(extent={{-56,34},{-32,58}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasure
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
          points={{0.8,9.95},{0.8,24},{15,24}},
          color={0,0,127},
          smooth=Smooth.None));
    connect(portalVein.zeroPressureVolume, V0.y) annotation (Line(
        points={{-7.6,9.95},{-7.6,15},{-18,15}},
        color={0,0,127},
        smooth=Smooth.None));
      connect(GITract.BloodFlow, busConnector.GITract_BloodFlow) annotation (
          Line(
          points={{54.4,-6},{66,-6},{66,-46}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(V0.y, busConnector.PortalVein_V0)      annotation (Line(
          points={{-18,15},{-14,15},{-14,-46},{66,-46}},
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
      connect(GITract.q_in, q_in) annotation (Line(
          points={{58,0},{100,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(liver.q_in, q_in) annotation (Line(
          points={{-24.8,46},{-24.8,56},{78,56},{78,0},{100,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(liver.q_out, q_out) annotation (Line(
          points={{-62.96,46},{-62.96,48},{-86,48},{-86,0},{-100,0}},
          color={0,0,0},
          thickness=1,
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
    connect(portalVein.q_in[2], GITract.q_out) annotation (Line(
        points={{-5.605,0.5},{18,0.5},{18,0},{34,0}},
        color={127,0,0},
        thickness=0.5));
    connect(portalVein.q_in[3], pressureMeasure.q_in) annotation (Line(
        points={{-5.605,1.41},{10,1.41},{10,-38},{12,-38}},
        color={127,0,0},
        thickness=0.5));
      connect(SplanchnicCirculation_DeoxygenatedBloodVolume.y, busConnector.SplanchnicCirculation_DeoxygenatedBloodVolume)
        annotation (Line(points={{13,-68},{66,-68},{66,-46}}, color={0,0,127}),
          Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
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
    end SplanchnicCirculation;

    model SystemicCirculationFullDynamic
      extends Physiolibrary.Icons.SystemicCirculation;

    Physiolibrary.Fluid.Interfaces.FluidPort_a q_in "Blood inflow"
      annotation (Placement(transformation(extent={{98,-10},
                {118,10}},     rotation=0),
                                    iconTransformation(extent={{90,-10},{110,
              10}})));
    Physiolibrary.Fluid.Interfaces.FluidPort_b q_out "Blood outflow"
      annotation (Placement(transformation(extent={{-104,4},
                {-84,24}},     rotation=0),
                                      iconTransformation(extent={{-110,-10},{
              -90,10}})));

      /*
  Library.PressureFlow.NegativePressureFlow fromSystemicVeins annotation (
      Placement(transformation(extent={{-110,-10},{-90,10}}),iconTransformation(
          extent={{-112,44},{-92,64}})));
  Library.PressureFlow.PositivePressureFlow systemicArteries
    annotation (Placement(transformation(extent={{88,-10},{108,10}}),
        iconTransformation(extent={{90,46},{110,66}})));
*/

    Physiolibrary.Fluid.Components.ElasticVessel systemicArtys(
      stateName="SystemicArtys.Vol",
      useV0Input=true,
      useComplianceInput=false,
      volume_start=0.00100036,
      Compliance=1.1625954425608e-08,
      useExternalPressureInput=false,
      ExternalPressure=0,
        nPorts=6)
      annotation (Placement(transformation(extent={{65,-10},{86,11}})));
    Physiolibrary.Types.Constants.VolumeConst               V0_artys(k=0.00085)
      annotation (Placement(transformation(extent={{98,18},{88,28}})));
    Physiolibrary.Types.Constants.HydraulicComplianceConst
      SystemicVeinsCompliance(k=6.645545561992547e-007)
      annotation (Placement(transformation(extent={{-27,10},{-35,18}})));
      Physiolibrary.Organs.Systems.PeripheralCirculation peripheral
        annotation (Placement(transformation(extent={{-2,0},{26,28}})));
    Fluid.Sources.VolumeInflowSource              volumeCorrections(
        useSolutionFlowInput=true)
      annotation (Placement(transformation(extent={{-28,24},{-42,38}})));
      Physiolibrary.Organs.Components.SystemicVeins veins(BaseConductance(
            displayUnit="ml/(mmHg.min)") = 1.2000985213531e-07)
        "scaled to coronary vessels reorganisation"
        annotation (Placement(transformation(extent={{-72,-8},{-56,8}})));
      Physiolibrary.Organs.Components.SystemicVeinsElacticBloodCompartment
        systemicVeinsElacticBloodCompartment(nPorts=5)
        annotation (Placement(transformation(extent={{-54,-10},{-34,10}})));
    Physiolibrary.Types.Constants.PressureConst SystemicVeinsExternalPressure(
        k=0)
      annotation (Placement(transformation(extent={{-36,16},{-43,23}})));
    Physiolibrary.Types.BusConnector busConnector
      "signals of organ bood flow resistence" annotation (Placement(
          transformation(extent={{36,40},{56,60}}), iconTransformation(extent=
             {{-110,32},{-94,48}})));
      Physiolibrary.Organs.Components.CollapsingVeins collapsedVeins annotation (
          Placement(transformation(
            extent={{10,10.5},{-10,-10.5}},
            rotation=180,
            origin={-84.5,0})));
    Physiolibrary.Fluid.Components.HydrostaticColumn
      gravityHydrostaticDifference(                   useHeightInput=true)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          origin={61,35})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasure
      annotation (Placement(transformation(
          extent={{8.5,-8.5},{-8.5,8.5}},
          origin={78.5,45.5})));
      Modelica.Blocks.Math.Gain G(k=9.81) annotation (Placement(transformation(
            extent={{4,-4},{-4,4}},
            rotation=90,
            origin={34,26})));
      Physiolibrary.Organs.Heart.Components.LeftHeartCoronary
        leftCororaryCirculation(BasicLargeVeselsConductance(displayUnit="ml/(mmHg.min)")=
             5.0004105056377e-09, BasicSmallVeselsConductance(displayUnit="ml/(mmHg.min)")=
             3.1252565660236e-10) "scaled to normal pressure gradient 94 mmHg"
        annotation (Placement(transformation(extent={{-10,76},{10,96}})));
      Physiolibrary.Organs.Heart.Components.RightHeartCoronary
        rightCororaryCirculation(BasicLargeVeselsConductance(displayUnit="ml/(mmHg.min)")=
             1.2501026264094e-09, BasicSmallVeselsConductance(displayUnit="ml/(mmHg.min)")=
             6.2505131320471e-11) "scaled to normal pressure gradient 94 mmHg"
        annotation (Placement(transformation(extent={{-42,62},{-22,82}})));
      Physiolibrary.Organs.Systems.SplanchnicCirculation splanchnicCirculation
        annotation (Placement(transformation(extent={{-6,-44},{32,-6}})));
    Physiolibrary.Fluid.Components.Conductor legsArtys(Conductance=
          5.0004105056377e-09)
      annotation (Placement(transformation(extent={{80,-86},{64,-70}})));
    Physiolibrary.Types.Constants.PressureConst const8(k=0)
      annotation (Placement(transformation(extent={{93,-68},{86,-61}})));
    Physiolibrary.Fluid.Components.HydrostaticColumn
      hydrostaticDifference(                   useHeightInput=true)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          origin={50,-62})));
      Physiolibrary.Organs.Components.SequesteredBlood sequesteredBlood(
        data={{0,0,10^(-10)},{50,97,1.0},{200,150,0.5}},
        pressureControledCompartment(stateName="BVSeqArtys.Vol"),
        initialVol=5.00044e-05)
        annotation (Placement(transformation(extent={{80,-88},{100,-68}})));
      Physiolibrary.Organs.Components.SequesteredBlood sequesteredBlood1(
        data={{0,-100,2.00},{150,11,0.11},{600,50,0.15}},
        pressureControledCompartment(stateName="BVSeqVeins.Vol"),
        initialVol=0.000120691)
        annotation (Placement(transformation(extent={{-62,-82},{-44,-64}})));
    Physiolibrary.Fluid.Components.Conductor legsVeins(Conductance=
          1.2501026264094e-08)
      annotation (Placement(transformation(extent={{-42,-80},{-28,-66}})));
    Physiolibrary.Fluid.Components.HydrostaticColumn
      hydrostaticDifference1(
      useHeightInput=true,
      usePumpEffect=true)
      annotation (Placement(transformation(extent={{-5,-78},{-25,-58}})));
    Physiolibrary.Types.Constants.PressureConst             const12(k=0)
      annotation (Placement(transformation(extent={{-52,-60},{-59,-53}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasure1
      annotation (Placement(transformation(extent={{76,-38},{96,-18}})));
    equation
    connect(systemicArtys.zeroPressureVolume, V0_artys.y) annotation (Line(
        points={{73.4,9.95},{73.4,23},{86.75,23}},
        color={0,0,127},
        smooth=Smooth.None));
      connect(busConnector, peripheral.busConnector)          annotation (
          Line(
          points={{46,50},{46,23.38},{4.3,23.38}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None));
      connect(veins.busConnector,busConnector)           annotation (
         Line(
          points={{-58.48,1.52},{-60,1.52},{-60,50},{46,50}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None));
      connect(SystemicVeinsCompliance.y, systemicVeinsElacticBloodCompartment.Compliance)
        annotation (Line(
          points={{-36,14},{-38.2,14},{-38.2,10},{-38,10}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(busConnector,systemicVeinsElacticBloodCompartment. busConnector)
        annotation (Line(
          points={{46,50},{-26,50},{-26,6.1},{-34.2,6.1}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None));
      connect(systemicVeinsElacticBloodCompartment.ExternalPressure,
        SystemicVeinsExternalPressure.y)
        annotation (Line(
          points={{-44,10},{-44,19.5},{-43.875,19.5}},
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
          points={{-78.5,2.1},{-80,2.1},{-80,50},{46,50}},
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

      connect(gravityHydrostaticDifference.q_up, pressureMeasure.q_in)
        annotation (Line(
          points={{71,39},{80,39},{80,40.4},{81.9,40.4}},
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
          points={{-54,-4},{-54,-28},{46,-28},{46,50}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      connect(systemicVeinsElacticBloodCompartment.V0, busConnector.SystemicVeins_V0)
        annotation (Line(
          points={{-50.8,10},{-50.8,50},{46,50}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(V0_artys.y, busConnector.SystemicArtys_V0) annotation (Line(
          points={{86.75,23},{70,23},{70,22},{46,22},{46,50}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(collapsedVeins.q_out, q_out) annotation (Line(
          points={{-74.5,-1.22465e-15},{-96.25,-1.22465e-15},{-96.25,14},{-94,14}},
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

      connect(rightCororaryCirculation.busConnector, busConnector)
                                                              annotation (
          Line(
          points={{-37.5,78.7},{46,78.7},{46,50}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None));
      connect(leftCororaryCirculation.busConnector, busConnector)
                                                             annotation (Line(
          points={{-5.5,92.7},{46,92.7},{46,50}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None));
      connect(leftCororaryCirculation.BloodFlow, busConnector.leftHeart_BloodFlow)
        annotation (Line(
          points={{7,81},{46,81},{46,50}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(rightCororaryCirculation.BloodFlow, busConnector.rightHeart_BloodFlow)
        annotation (Line(
          points={{-25,67},{22,67},{22,50},{46,50}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(leftCororaryCirculation.BloodFlow, busConnector.LeftHeart_BloodFlow)
        annotation (Line(
          points={{7,81},{46,81},{46,50}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      connect(rightCororaryCirculation.BloodFlow, busConnector.RightHeart_BloodFlow)
        annotation (Line(
          points={{-25,67},{22,67},{22,50},{46,50}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(splanchnicCirculation.busConnector, busConnector) annotation (
          Line(
          points={{-6,-15.5},{-6,50},{46,50}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None));
      connect(veins.q_out, collapsedVeins.q_in) annotation (Line(
          points={{-72,0},{-73.25,0},{-73.25,1.22465e-15},{-94.5,1.22465e-15}},
          color={0,0,0},
          thickness=1,
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
        points={{-48,-10},{-48,-28},{46,-28},{46,50}},
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
    connect(splanchnicCirculation.q_out, veins.q_out) annotation (Line(
        points={{-6,-25},{-72,-25},{-72,0}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
      connect(veins.q_in, systemicVeinsElacticBloodCompartment.q_in[1]) annotation (
         Line(
          points={{-56,0},{-50,0},{-50,-0.96},{-44.1,-0.96}},
          color={127,0,0},
          thickness=0.5));
      connect(systemicVeinsElacticBloodCompartment.q_in[3], peripheral.q_out)
        annotation (Line(
          points={{-44.1,-5.55112e-17},{-36,-5.55112e-17},{-36,20},{-10.12,20},
              {-10.12,14}},
          color={127,0,0},
          thickness=0.5));
      connect(systemicVeinsElacticBloodCompartment.q_in[4], hydrostaticDifference1.q_up)
        annotation (Line(
          points={{-44.1,0.48},{-38,0.48},{-38,-64},{-25,-64}},
          color={127,0,0},
          thickness=0.5));
      connect(systemicArtys.q_in[1], gravityHydrostaticDifference.q_down)
        annotation (Line(
          points={{75.395,-0.6375},{52,-0.6375},{52,14},{102,14},{102,30.8},{70.8,30.8}},
          color={127,0,0},
          thickness=0.5));

      connect(peripheral.q_in, systemicArtys.q_in[2]) annotation (Line(
          points={{34.4,14},{54,14},{54,0},{76,0},{76,-0.1825},{75.395,-0.1825}},
          color={127,0,0},
          thickness=0.5));
      connect(splanchnicCirculation.q_in, systemicArtys.q_in[3]) annotation (Line(
          points={{32,-25},{40,-25},{40,14},{52,14},{52,0.2725},{75.395,0.2725}},
          color={127,0,0},
          thickness=0.5));
      connect(hydrostaticDifference.q_up, systemicArtys.q_in[4]) annotation (Line(
          points={{60,-58},{64,-58},{64,-14},{60,-14},{60,0.7275},{75.395,0.7275}},
          color={127,0,0},
          thickness=0.5));
      connect(pressureMeasure1.q_in, systemicArtys.q_in[5]) annotation (Line(
          points={{82,-34},{82,-44},{64,-44},{64,-14},{60,-14},{60,1.1825},{75.395,1.1825}},
          color={127,0,0},
          thickness=0.5));

      connect(q_in, systemicArtys.q_in[6]) annotation (Line(
          points={{108,0},{108,14},{54,14},{54,1.6375},{75.395,1.6375}},
          color={127,0,0},
          thickness=0.5));
      connect(q_in, leftCororaryCirculation.q_in) annotation (Line(
          points={{108,0},{108,86},{16,86}},
          color={127,0,0},
          thickness=0.5));
      connect(q_in, q_in) annotation (Line(
          points={{108,0},{108,0}},
          color={127,0,0},
          thickness=0.5));
      connect(rightCororaryCirculation.q_in, q_in) annotation (Line(
          points={{-16,72},{108,72},{108,0}},
          color={127,0,0},
          thickness=0.5));
      connect(q_out, rightCororaryCirculation.q_out) annotation (Line(
          points={{-94,14},{-94,78},{-47.8,78},{-47.8,72}},
          color={127,0,0},
          thickness=0.5));
      connect(q_out, leftCororaryCirculation.q_out) annotation (Line(
          points={{-94,14},{-94,86},{-15.8,86}},
          color={127,0,0},
          thickness=0.5));
      connect(volumeCorrections.q_out, systemicVeinsElacticBloodCompartment.q_in[
        5]) annotation (Line(
          points={{-42,31},{-46,31},{-46,0.96},{-44.1,0.96}},
          color={127,0,0},
          thickness=0.5));
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

      Physiolibrary.Organs.Heart.Heart heart
        annotation (Placement(transformation(extent={{0,-6},{26,20}})));
      Physiolibrary.Organs.Lungs.PulmonaryCirculation pulmonaryCirculation
        annotation (Placement(transformation(extent={{2,50},{30,78}})));
      Physiolibrary.Organs.Systems.SystemicCirculationFullDynamic
        systemicCirculation
        annotation (Placement(transformation(extent={{-2,-68},{32,-34}})));
    Physiolibrary.Types.BusConnector busConnector
      "signals of organ bood flow resistence" annotation (Placement(
          transformation(extent={{-38,-8},{-16,14}}), iconTransformation(extent=
             {{-100,60},{-60,100}})));
      Physiolibrary.Organs.Blood.RedCells redCells(RBCBaseSecretionRate(k(
              displayUnit="m3/s")))
        annotation (Placement(transformation(extent={{-34,26},{-54,46}})));
      Physiolibrary.Organs.Blood.BloodPropertiesBase bloodProperties
        annotation (Placement(transformation(extent={{-36,-34},{-56,-14}})));

    /*initial equation
  if STEADY then
     bloodProperties.feedback.y = 0;
  end if;
*/

    equation
      connect(busConnector, pulmonaryCirculation.busConnector) annotation (
          Line(
          points={{-27,3},{-26,3},{-26,71},{2,71}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None));
      connect(busConnector, systemicCirculation.busConnector) annotation (
          Line(
          points={{-27,3},{-26,3},{-26,-44.2},{-2.34,-44.2}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None));
      connect(busConnector, redCells.busConnector)    annotation (Line(
          points={{-27,3},{-26,3},{-26,42.8},{-36.2,42.8}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None));
      connect(busConnector, bloodProperties.busConnector) annotation (Line(
          points={{-27,3},{-26,3},{-26,-17.2},{-36.6,-17.2}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None));
      connect(busConnector, heart.busConnector) annotation (Line(
          points={{-27,3},{-25.5,3},{-25.5,3.1},{0,3.1}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None));
      connect(heart.fromLeftVentricle, systemicCirculation.q_in) annotation (
          Line(
          points={{23.4,-0.8},{23.4,0},{32,0},{32,-51}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(systemicCirculation.q_out, heart.rightAtrium) annotation (Line(
          points={{-2,-51},{-4,-51},{-4,14.8},{2.6,14.8}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pulmonaryCirculation.q_in, heart.fromRightVentricle) annotation (
          Line(
          points={{2,64},{-8,64},{-8,0},{2.6,0},{2.6,-0.8}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pulmonaryCirculation.q_out, heart.leftAtrium) annotation (Line(
          points={{30,64},{36,64},{36,16},{20,16},{20,14.54},{23.14,14.54}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));

    //  stateValue = bloodProperties.BloodVolume1.y;

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
    model SystemicVeins
      //extends QHP.Blood.OrganFlow.BaseBadDirection;
    extends Physiolibrary.Icons.Resistor;

    Physiolibrary.Fluid.Interfaces.FluidPort_a q_in "Blood inflow"
      annotation ( Placement(transformation(extent={{92,-10},{112,10}},
                               rotation=0),
                                    iconTransformation(extent={{90,-10},{110,
              10}})));
    Physiolibrary.Fluid.Interfaces.FluidPort_b q_out "Blood outflow"
      annotation ( Placement(transformation(extent={{-108,-12},{-88,8}},
                               rotation=0),
                                      iconTransformation(extent={{-110,-10},{
              -90,10}})));

    Physiolibrary.Fluid.Components.Conductor     systemicVeinsConductance(
        useConductanceInput=true)
      annotation (Placement(transformation(extent={{0,-12},{-20,8}})));
    Physiolibrary.Blocks.Factors.Normalization ViscosityEffect
      annotation (Placement(transformation(extent={{-20,0},{0,20}})));
    Physiolibrary.Blocks.Factors.Normalization ExerciseEffect
      annotation (Placement(transformation(extent={{-20,7},{0,27}})));
    Physiolibrary.Blocks.Factors.Normalization CollapseEffect
      annotation (Placement(transformation(extent={{-20,14},{0,34}})));
    Physiolibrary.Types.Constants.HydraulicConductanceConst const12(k=
          BaseConductance)
      annotation (Placement(transformation(extent={{-29,45},{-17,57}})));
      parameter Physiolibrary.Types.HydraulicConductance BaseConductance( displayUnit="ml/(mmHg.min)");

    Physiolibrary.Fluid.Sensors.FlowMeasure     flowMeasure annotation (
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
      connect(busConnector.Viscosity_ConductanceEffect,
        ViscosityEffect.u) annotation (Line(
          points={{-86,87},{-86,10},{-18,10}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}}));
      connect(busConnector.Exercise_MusclePump_Effect,
        ExerciseEffect.u) annotation (Line(
          points={{-86,87},{-86,17},{-18,17}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}}));
      connect(busConnector.BloodVol_CollapsedEffect, CollapseEffect.u)
        annotation (Line(
          points={{-86,87},{-86,24},{-18,24}},
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

     parameter Integer nPorts = 0 "Number of hydraulic ports" annotation (
        Evaluate = true,
        Dialog(connectorSizing = true, group = "Ports"));
      Physiolibrary.Fluid.Interfaces.FluidPorts_a q_in[nPorts]
      annotation ( Placement(transformation(extent={{-10,-110},{8,-68}},
                               rotation=0),
                                      iconTransformation(
          extent={{-8,-24},{6,24}})));
    //  (redeclare package Medium = Medium)
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
        stateName="SystemicVeins.Vol",
        useComplianceInput=true,
        useExternalPressureInput=true,
        useV0Input=true,
      volume_start=initialSystemisVeinsVol,
        nPorts=1+nPorts)                           "systemic veins"
        annotation (Placement(transformation(extent={{-14,-10},{6,10}})));
    Physiolibrary.Blocks.Factors.Spline V0_A2_Effect(
      data={{0.0,1.05,0.0},{1.3,1.00,-0.10},{3.0,0.85,0.0}},
      Xscale=1e-9/1.046,
      UsePositiveLog10=true)
      annotation (Placement(transformation(extent={{-30,7},{-10,27}})));
    Physiolibrary.Types.Constants.VolumeConst               const4(k=0.0017)
      annotation (Placement(transformation(extent={{-32,48},{-23,39}})));
     Physiolibrary.Organs.Components.AplhaReceptorsActivityFactor AplhaReceptors(
        data={{0.0,1.2,0.0},{1.0,1.0,-0.30},{3.0,0.6,0.0}},
      NEURALK=0.333,
      HUMORALK=0.5)
        annotation (Placement(transformation(extent={{-30,20},{-10,40}})));
      Physiolibrary.Types.RealIO.VolumeOutput V0(displayUnit="ml")
      "maximal zero pressure blood volume in compartment"
        annotation (Placement(transformation(extent={{-4.5,-4.5},{4.5,4.5}},rotation=180,
            origin={-27.5,5.5}),
            iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-68,100})));

      parameter Physiolibrary.Types.Volume initialSystemisVeinsVol = 2329.57e-6; // = 2200;// = 2980;

      Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasure
        annotation (Placement(transformation(extent={{16,-20},{36,0}})));
    equation
      connect(V0_A2_Effect.y, systemicVeins.zeroPressureVolume) annotation (Line(
          points={{-20,13},{-20,12},{-6,12},{-6,9}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(AplhaReceptors.y,V0_A2_Effect. yBase) annotation (Line(
          points={{-20,23},{-20,19}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(AplhaReceptors.yBase,const4. y) annotation (Line(
          points={{-20,37},{-20,43.5},{-21.875,43.5}},
          color={0,0,127},
          smooth=Smooth.None));
      systemicVeins.volume= Vol;
      connect(systemicVeins.externalPressure, ExternalPressure) annotation (Line(
          points={{2,9},{2,67},{0,67},{0,100}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(systemicVeins.compliance, Compliance) annotation (Line(
          points={{-2,9},{-2,50},{60,50},{60,100}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(busConnector.GangliaGeneral_NA, AplhaReceptors.GangliaGeneral_NA)
        annotation (Line(
          points={{-78,82},{-78,24},{-29.8,24}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}}));
      connect(busConnector.AlphaPool_Effect, AplhaReceptors.AlphaPool_Effect)
        annotation (Line(
          points={{-78,82},{-78,36},{-29.8,36}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}}));
      connect(busConnector.AlphaBlocade_Effect, AplhaReceptors.AlphaBlockade_Effect)
        annotation (Line(
          points={{-78,82},{-78,30},{-29.8,30}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}}));
      connect(V0_A2_Effect.y, V0) annotation (Line(
          points={{-20,13},{-20,5.5},{-27.5,5.5}},
          color={0,0,127},
          smooth=Smooth.None));

    connect(pressureMeasure.pressure, Pressure) annotation (Line(
        points={{32,-14},{-100,-14},{-100,-40}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(busConnector.Angiotensin2, V0_A2_Effect.u) annotation (Line(
        points={{-78,82},{-78,17},{-28,17}},
        color={0,0,255},
        thickness=0.5,
        smooth=Smooth.None), Text(
        string="%first",
        index=-1,
        extent={{-6,3},{-6,3}}));
        for i in 1:nPorts loop
          connect(q_in[i], systemicVeins.q_in[i+1]) annotation (Line(
          points={{-1,-89},{-1,-26},{-4.1,-26},{-4.1,0}},
          color={127,0,0},
          thickness=0.5));
        end for;
      connect(pressureMeasure.q_in, systemicVeins.q_in[1]) annotation (Line(
          points={{22,-16},{10,-16},{10,0},{-4.1,0}},
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

    Physiolibrary.Fluid.Interfaces.FluidPort_a referencePoint
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
        points={{-6,29},{-6,20},{-6,9},{-8,9}},
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

    model AplhaReceptorsActivityFactor
      //extends Library.BaseFactor2;

      Physiolibrary.Types.RealIO.FractionInput GangliaGeneral_NA(displayUnit="1")       annotation (Placement(transformation(extent={{-100,40},
                {-80,60}}), iconTransformation(extent={{-108,-70},{-88,-50}})));
      Physiolibrary.Types.RealIO.FractionInput AlphaPool_Effect
                                          annotation (Placement(transformation(extent={{-100,0},
                {-80,20}}),
            iconTransformation(extent={{-108,50},{-88,70}})));
      Physiolibrary.Types.RealIO.FractionInput AlphaBlockade_Effect
                   annotation (Placement(transformation(extent={{-42,-46},{-22,-26}}),
            iconTransformation(extent={{-108,-10},{-88,10}})));
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

      parameter Real[:,3] data;

      parameter Physiolibrary.Types.Fraction NEURALK = 0.333;
      parameter Physiolibrary.Types.Fraction HUMORALK = 0.5;
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
      connect(Activity.u2, AlphaBlockade_Effect)
                                                annotation (Line(
          points={{-8,-36},{-32,-36}},
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
      connect(GangliaGeneral_NA, TotalAgonism.u1) annotation (Line(
          points={{-90,50},{-70,50},{-70,36},{-60,36}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(AlphaPool_Effect, TotalAgonism.u2) annotation (Line(
          points={{-90,10},{-70,10},{-70,24},{-60,24}},
          color={0,0,127},
          smooth=Smooth.None));
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
    end AplhaReceptorsActivityFactor;
  end Components;

  package Interfaces
    partial model BaseOD
    extends Physiolibrary.Icons.PerfusionOD;

    Physiolibrary.Fluid.Interfaces.FluidPort_a q_in "Blood inflow"
      annotation ( Placement(transformation(extent={{-114,
              -10},{-94,10}},  rotation=0),
                                    iconTransformation(extent={{-110,-10},{-90,10}})));
    Physiolibrary.Fluid.Interfaces.FluidPort_b q_out
      "Blood outflow"
      annotation ( Placement(transformation(extent={{90,-10},
              {110,10}},       rotation=0),
                                      iconTransformation(extent={{90,-10},{
              110,10}})));

    Physiolibrary.Types.BusConnector busConnector
      "signals of organ bood flow resistence" annotation (Placement(
          transformation(extent={{-100,80},{-80,100}}), iconTransformation(
            extent={{60,10},{78,28}})));

      Physiolibrary.Types.RealIO.VolumeFlowRateOutput BloodFlow
                                               annotation (Placement(transformation(
              extent={{-76,-18},{-66,-8}}),iconTransformation(extent={{60,-30},{80,-10}})));
    Physiolibrary.Fluid.Sensors.VolumeFlowMeasure flowMeasure annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          origin={-82,0})));
    equation

      connect(q_in, flowMeasure.q_in) annotation (Line(
          points={{-104,0},{-92,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
    connect(flowMeasure.volumeFlow, BloodFlow) annotation (Line(points={{-82,
            12},{-82,18},{-71,18},{-71,-13}}, color={0,0,127}));
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
    end BaseOD;

    partial model BaseDO
    extends Physiolibrary.Icons.PerfusionDO;

    Physiolibrary.Fluid.Interfaces.FluidPort_a q_in "Blood inflow"
      annotation ( Placement(transformation(extent={{100,-10},
              {120,10}},       rotation=0),
                                    iconTransformation(extent={{150,-10},{
              170,10}})));
    Physiolibrary.Fluid.Interfaces.FluidPort_b q_out
      "Blood outflow"
      annotation ( Placement(transformation(extent={{104,-90},
              {124,-70}},      rotation=0),
                                      iconTransformation(extent={{-168,-10},
              {-148,10}})));

    Physiolibrary.Types.BusConnector busConnector
      "signals of organ bood flow resistence" annotation (Placement(
          transformation(extent={{-100,80},{-80,100}}), iconTransformation(
            extent={{-64,58},{-46,76}})));

      Physiolibrary.Types.RealIO.VolumeFlowRateOutput BloodFlow
                                               annotation (Placement(transformation(
              extent={{92,14},{104,26}}),  iconTransformation(extent={{60,-60},{80,
                -40}})));
    Physiolibrary.Fluid.Sensors.VolumeFlowMeasure flowMeasure annotation (
        Placement(transformation(
          extent={{10,-10},{-10,10}},
          origin={88,0})));
    equation

      connect(flowMeasure.q_in, q_in) annotation (Line(
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
    end BaseDO;

    partial model Heart
      extends Physiolibrary.Organs.Interfaces.BaseDO;

    //parameter Real BasicLargeVeselsConductance( final quantity="Conductance", final displayUnit="ml/(min.mmHg)");
    //parameter Real BasicSmallVeselsConductance( final quantity="Conductance", final displayUnit="ml/(min.mmHg)");
    parameter Physiolibrary.Types.HydraulicConductance BasicLargeVeselsConductance( displayUnit="ml/(min.mmHg)");
    parameter Physiolibrary.Types.HydraulicConductance BasicSmallVeselsConductance( displayUnit="ml/(min.mmHg)");

    Physiolibrary.Blocks.Factors.Spline PO2Effect(data={{12,2.0,0},{17,1.0,-0.04},
          {30,0.8,0}}, Xscale=101325/760)
      annotation (Placement(transformation(extent={{60,20},{80,40}})));
    Physiolibrary.Blocks.Factors.Spline ADHEffect2(
      data={{0.8,1.0,0},{3.0,0.1,0}},
      UsePositiveLog10=true,
      Xscale=1e-9/1.084)
      annotation (Placement(transformation(extent={{60,58},{80,78}})));
      //Xscale=1e-9/1.084
    Physiolibrary.Blocks.Factors.Spline MetabolismEffect(data={{30,1.0,0},{
          100,3.0,0}}, Xscale=1/1362657.193569)
      "O2Need 1 ml_STP/min = 1/1362657.193569 mol/s"
      annotation (Placement(transformation(extent={{60,10},{80,30}})));
    Physiolibrary.Blocks.Factors.Normalization Anesthesia
      annotation (Placement(transformation(extent={{60,66},{80,86}})));
    Physiolibrary.Types.Constants.HydraulicConductanceConst
      LargeVesselBasicConductance(k=BasicLargeVeselsConductance)
      annotation (Placement(transformation(extent={{-6,18},{-18,30}})));
    Physiolibrary.Blocks.Factors.Normalization Viscosity1
      annotation (Placement(transformation(extent={{-30,4},{-10,24}})));
    Physiolibrary.Types.Constants.HydraulicConductanceConst
      SmallVesselBasicConductance(k=BasicSmallVeselsConductance)
      annotation (Placement(transformation(extent={{90,86},{78,98}})));
      Physiolibrary.Organs.Components.AplhaReceptorsActivityFactor aplhaReceptorsActivityFactor(
          data={{0.0,1.3,0},{1.0,1.0,-0.16},{4.0,0.8,0}})
        annotation (Placement(transformation(extent={{60,46},{80,66}})));
    Physiolibrary.Blocks.Factors.DamagedFraction Infraction
      annotation (Placement(transformation(extent={{60,2},{80,22}})));
      Physiolibrary.Blocks.Factors.SplineLagOrZero              Vasculature(
          data={{41,1.2,0},{51,1.0,-0.03},{61,0.8,0}}, HalfTime=30*86400*Modelica.Math.log(2),
        integrator(y_start=1.2),
      Xscale=101325/760)
        annotation (Placement(transformation(extent={{60,30},{80,50}})));
    Physiolibrary.Blocks.Factors.Normalization Viscosity
      annotation (Placement(transformation(extent={{60,74},{80,94}})));
    Physiolibrary.Fluid.Components.Conductor resistor2_1(
        useConductanceInput=true)
      annotation (Placement(transformation(extent={{60,-10},{80,10}})));
    Physiolibrary.Fluid.Components.Conductor resistor2_2(
        useConductanceInput=true)
      annotation (Placement(transformation(extent={{-30,-10},{-10,10}})));
    equation
      connect(LargeVesselBasicConductance.y, Viscosity1.yBase) annotation (Line(
          points={{-19.5,24},{-20,24},{-20,16}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Viscosity.y, Anesthesia.yBase) annotation (Line(
          points={{70,80},{70,78}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(busConnector.Anesthesia_VascularConductance, Anesthesia.u)
        annotation (Line(
          points={{-90,90},{6,90},{6,76},{62,76}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}}));
      connect(busConnector.Viscosity_ConductanceEffect, Viscosity.u) annotation (
          Line(
          points={{-90,90},{6,90},{6,84},{62,84}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}}));
      connect(busConnector.AlphaPool_Effect, aplhaReceptorsActivityFactor.AlphaPool_Effect)
        annotation (Line(
          points={{-90,90},{6,90},{6,62},{60.2,62}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}}));
      connect(busConnector.AlphaBlocade_Effect, aplhaReceptorsActivityFactor.AlphaBlockade_Effect)
        annotation (Line(
          points={{-90,90},{6,90},{6,56},{60.2,56}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}}));
      connect(busConnector.GangliaGeneral_NA, aplhaReceptorsActivityFactor.GangliaGeneral_NA)
        annotation (Line(
          points={{-90,90},{6,90},{6,50},{60.2,50}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}}));
      connect(busConnector.Viscosity_ConductanceEffect, Viscosity1.u) annotation (
          Line(
          points={{-90,90},{-74,90},{-74,14},{-28,14}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}}));
      connect(Viscosity.yBase, SmallVesselBasicConductance.y) annotation (
          Line(
          points={{70,86},{70,92},{76.5,92}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Anesthesia.y, ADHEffect2.yBase) annotation (Line(
          points={{70,72},{70,70}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(ADHEffect2.y, aplhaReceptorsActivityFactor.yBase) annotation (
          Line(
          points={{70,64},{70,63}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(aplhaReceptorsActivityFactor.y, Vasculature.yBase) annotation (
          Line(
          points={{70,49},{70,46}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Vasculature.y, PO2Effect.yBase) annotation (Line(
          points={{70,34},{70,32}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(PO2Effect.y, MetabolismEffect.yBase) annotation (Line(
          points={{70,26},{70,22}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(MetabolismEffect.y, Infraction.yBase) annotation (Line(
          points={{70,16},{70,14}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(q_out, resistor2_2.q_in) annotation (Line(
          points={{114,-80},{42,-80},{42,0},{-30,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(resistor2_2.q_out, resistor2_1.q_in) annotation (Line(
          points={{-10,0},{60,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(resistor2_1.q_out, flowMeasure.q_out) annotation (Line(
          points={{80,0},{78,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(resistor2_1.cond, Infraction.y) annotation (Line(
          points={{70,6},{70,8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(resistor2_2.cond, Viscosity1.y) annotation (Line(
          points={{-20,6},{-20,10}},
          color={0,0,127},
          smooth=Smooth.None));
    connect(busConnector.Vasopressin, ADHEffect2.u) annotation (Line(
        points={{-90,90},{6,90},{6,68},{62,68}},
        color={0,0,255},
        thickness=0.5,
        smooth=Smooth.None), Text(
        string="%first",
        index=-1,
        extent={{-6,3},{-6,3}}));
      annotation (
        Documentation(info="<HTML>
<PRE>
Blood resistance in left heart.

QHP 2008 / LeftHeart-Flow

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
    end Heart;

    model TissueBloodFlow
      extends Physiolibrary.Icons.Microcirculation;
      parameter Physiolibrary.Types.HydraulicConductance Cond;

      parameter Boolean onViscosity=true, onAnesthesia=true, onAngiogenesis=true, onAngiotensinII=true, onVasopressin=true, onCatecholamines=true, onOxygenOnly=true, onOxygenAndCarbonDioxide=false, onOxygenNeed=false, onExercise=false;

      parameter Real[:,3] VasculatureConductanceOnPO2 = {{41,1.2,0},{51,1.0,-0.03},{61,0.8,0}};
      parameter Real[:,3] PO2OnConductance = {{10,2.0,0},{30,1.0,0}};
      parameter Real[:,3] Angiotensin2Effect = {{0.0,1.05,0},{1.3,1.00,-0.08},{3.5,0.50,0}};
      parameter Real[:,3] AlphaReceptorsEffect = {{0.0,1.3,0},{1.0,1.0,-0.3},{5.0,0.1,0}};
      parameter Real[:,3] VasopressinEffect = {{0.8,1.0,0},{3.0,0.1,0}};
      parameter Physiolibrary.Types.Time VasculatureHalfTime=30*86400*Modelica.Math.log(2);

    Physiolibrary.Blocks.Factors.Spline A2Effect(
      Xscale=1e-9/1.046,
      UsePositiveLog10=true,
        data=Angiotensin2Effect,
        enabled=onAngiotensinII)
      annotation (Placement(transformation(extent={{-8,40},{12,60}})));
    //  Xscale=1e-9/1.046,
    Physiolibrary.Blocks.Factors.Spline ADHEffect(
      Xscale=1e-9/1.084,
      UsePositiveLog10=true,
        data=VasopressinEffect,
        enabled=onVasopressin) "0.8 pg/ml = 0.8e-9 kg/m3"
      annotation (Placement(transformation(extent={{-8,30},{12,50}})));
    //  Xscale=1e-9/1.084,
    Physiolibrary.Types.Constants.HydraulicConductanceConst BasicConductance(k=Cond)
      annotation (Placement(transformation(extent={{-18,76},{-6,88}})));
    Physiolibrary.Blocks.Factors.Normalization Anesthesia(enabled=onAnesthesia)
      annotation (Placement(transformation(extent={{-8,50},{12,70}})));
    Physiolibrary.Blocks.Factors.Normalization Viscosity(enabled=onViscosity)
      annotation (Placement(transformation(extent={{-8,58},{12,78}})));
      Physiolibrary.Blocks.Factors.SplineLagOrZero              Vasculature(
      Xscale=101325/760,
        data=VasculatureConductanceOnPO2,
        HalfTime=VasculatureHalfTime,
        enabled=onAngiogenesis)
        annotation (Placement(transformation(extent={{-8,-18},{12,2}})));
    //    stateName="GITract-Vasculature.Effect",
     Physiolibrary.Organs.Components.AplhaReceptorsActivityFactor AplhaReceptors(data=
            AlphaReceptorsEffect,
        Switch=not onCatecholamines,
        Setting=1)
        annotation (Placement(transformation(extent={{-8,16},{12,36}})));
    Physiolibrary.Fluid.Components.Conductor resistor(useConductanceInput=true)
        annotation (Placement(transformation(extent={{12,-100},{-8,-80}})));
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
        annotation (Placement(transformation(extent={{20,52},{28,60}})));
    Physiolibrary.Fluid.Interfaces.FluidPort_a q_in "Blood inflow"
      annotation (extent=[-10,-110; 10,-90], Placement(transformation(extent={{90,-100},
                {110,-80}},    rotation=0),
                                    iconTransformation(extent={{90,-10},{110,
              10}})));
    Physiolibrary.Fluid.Sensors.VolumeFlowMeasure
                                            volumeFlowMeasure
                                                        annotation (
        Placement(transformation(
          extent={{10,-10},{-10,10}},
          origin={58,-90})));
    Physiolibrary.Fluid.Interfaces.FluidPort_b q_out "Blood outflow"
      annotation (extent=[-10,-110; 10,-90], Placement(transformation(extent={{-116,
                -100},{-96,-80}},
                               rotation=0),
                                      iconTransformation(extent={{-110,-10},{
              -90,10}})));
      Physiolibrary.Types.RealIO.VolumeFlowRateOutput
                                            BloodFlow
                                               annotation (Placement(transformation(
              extent={{78,-68},{90,-56}}), iconTransformation(extent={{60,-60},{80,
                -40}})));
    Physiolibrary.Types.BusConnector busConnector
      "signals of organ bood flow resistence" annotation (Placement(
          transformation(extent={{-100,80},{-80,100}}), iconTransformation(
            extent={{60,40},{100,80}})));
    equation
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
      connect(busConnector.AlphaBlocade_Effect, AplhaReceptors.AlphaBlockade_Effect)
        annotation (Line(
          points={{-90,90},{-60,90},{-60,26},{-7.8,26}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}}));
      connect(busConnector.AlphaPool_Effect, AplhaReceptors.AlphaPool_Effect)
        annotation (Line(
          points={{-90,90},{-60,90},{-60,32},{-7.8,32}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}}));
      connect(busConnector.GangliaGeneral_NA, AplhaReceptors.GangliaGeneral_NA)
        annotation (Line(
          points={{-90,90},{-60,90},{-60,20},{-7.8,20}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}}));
      connect(busConnector.Anesthesia_VascularConductance, Anesthesia.u)
        annotation (Line(
          points={{-90,90},{-60,90},{-60,60},{-6,60}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}}));
      connect(busConnector.Viscosity_ConductanceEffect, Viscosity.u) annotation (
          Line(
          points={{-90,90},{-60,90},{-60,68},{-6,68}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}}));
      connect(busConnector.Vasopressin, ADHEffect.u) annotation (Line(
          points={{-90,90},{-60,90},{-60,40},{-6,40}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}}));
      connect(busConnector.Angiotensin2, A2Effect.u) annotation (Line(
          points={{-90,90},{-60,90},{-60,50},{-6,50}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}}));
    connect(tissueConnector.pO2, Vasculature.u) annotation (Line(
        points={{-84,10},{-60,10},{-60,-10},{-8,-10}},
        color={127,0,0},
        thickness=0.5,
        smooth=Smooth.None), Text(
        string="%first",
        index=-1,
        extent={{-6,3},{-6,3}}));
    connect(tissueConnector.pO2, pO2OnConductance.u) annotation (Line(
        points={{-84,10},{-60,10},{-60,-18},{-6,-18}},
        color={127,0,0},
        thickness=0.5,
        smooth=Smooth.None), Text(
        string="%first",
        index=-1,
        extent={{-6,3},{-6,3}}));
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
          points={{29,56},{32,56},{32,42}},
          color={0,0,127},
          smooth=Smooth.None));
    connect(tissueConnector.pO2, PO2OnTension.u) annotation (Line(
        points={{-84,10},{-60,10},{-60,-38},{-26,-38}},
        color={127,0,0},
        thickness=0.5,
        smooth=Smooth.None), Text(
        string="%first",
        index=-1,
        extent={{-6,3},{-6,3}}));
    connect(tissueConnector.pCO2, PCO2OnTension.u) annotation (Line(
        points={{-84,10},{-60,10},{-60,-46},{-26,-46}},
        color={127,0,0},
        thickness=0.5,
        smooth=Smooth.None), Text(
        string="%first",
        index=-1,
        extent={{-6,3},{-6,3}}));
    connect(q_in, volumeFlowMeasure.q_in) annotation (Line(
        points={{100,-90},{68,-90}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(volumeFlowMeasure.q_out, resistor.q_in) annotation (Line(
        points={{48,-90},{12,-90}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
      connect(resistor.q_out, q_out) annotation (Line(
          points={{-8,-90},{-106,-90}},
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
      connect(resistor.cond, metabolicVasolidation.y) annotation (Line(
          points={{2,-84},{2,-76}},
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
    connect(tissueConnector.Function_Failed, Vasculature.Failed) annotation (
        Line(
        points={{-84,10},{-60,10},{-60,-4},{-8,-4}},
        color={127,0,0},
        thickness=0.5,
        smooth=Smooth.None), Text(
        string="%first",
        index=-1,
        extent={{-6,3},{-6,3}}));
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
    end TissueBloodFlow;
  end Interfaces;

  package Examples
    model Cardiovascular
      Systems.CardioVascularSystem cardioVascularSystem
        annotation (Placement(transformation(extent={{34,-16},{54,4}})));
      Types.BusConnector busConnector
        annotation (Placement(transformation(extent={{-44,-4},{-4,36}})));
      Types.Constants.PressureConst pressure(k=-445.99288489321)
        annotation (Placement(transformation(extent={{-54,-42},{-46,-34}})));
      Types.Constants.FractionConst Exercise_MusclePump_Effect(k=1)
        annotation (Placement(transformation(extent={{-58,-70},{-50,-62}})));
    equation
      connect(busConnector, cardioVascularSystem.busConnector) annotation (Line(
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
    end Cardiovascular;

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
      Physiolibrary.Organs.Heart.Heart heart
        annotation (Placement(transformation(extent={{6,24},{26,44}})));
      Types.BusConnector busConnector
        annotation (Placement(transformation(extent={{-80,14},{-40,54}})));
      Fluid.Components.Conductor systemic(Conductance=1.250102626409427e-07*(5/
            90)) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={18,-12})));
      Fluid.Components.Conductor pulmonary(Conductance=1.250102626409427e-07*(5
            /12))
        annotation (Placement(transformation(extent={{2,66},{22,86}})));
    equation
      connect(heart.busConnector, busConnector) annotation (Line(
          points={{6,31},{-34,31},{-34,34},{-60,34}},
          color={0,0,255},
          thickness=0.5));
      connect(heart.fromLeftVentricle, systemic.q_in) annotation (Line(
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
      connect(pulmonary.q_in, heart.fromRightVentricle) annotation (Line(
          points={{2,76},{-16,76},{-16,28},{8,28}},
          color={127,0,0},
          thickness=0.5));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end Heart;

    model HeartAndPulmonaryCirculation
      Physiolibrary.Organs.Heart.Heart heart
        annotation (Placement(transformation(extent={{6,24},{26,44}})));
      Types.BusConnector busConnector
        annotation (Placement(transformation(extent={{-80,14},{-40,54}})));
      Fluid.Components.Conductor systemic(Conductance=1.250102626409427e-07*(5/
            90)) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={18,-12})));
      Lungs.PulmonaryCirculation                      pulmonaryCirculation
        annotation (Placement(transformation(extent={{2,60},{30,88}})));
      Fluid.Sensors.PressureMeasure meanPressure
        annotation (Placement(transformation(extent={{70,22},{90,42}})));
    equation
      connect(heart.busConnector, busConnector) annotation (Line(
          points={{6,31},{-34,31},{-34,34},{-60,34}},
          color={0,0,255},
          thickness=0.5));
      connect(heart.fromLeftVentricle, systemic.q_in) annotation (Line(
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
      connect(pulmonaryCirculation.q_in, heart.fromRightVentricle) annotation (
          Line(
          points={{2,74},{-20,74},{-20,28},{8,28}},
          color={127,0,0},
          thickness=0.5));
      connect(heart.busConnector, pulmonaryCirculation.busConnector)
        annotation (Line(
          points={{6,31},{-34,31},{-34,34},{-38,34},{-38,81},{2,81}},
          color={0,0,255},
          thickness=0.5));
      connect(heart.fromLeftVentricle, meanPressure.q_in) annotation (Line(
          points={{24,28},{42,28},{42,16},{76,16},{76,26}},
          color={127,0,0},
          thickness=0.5));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end HeartAndPulmonaryCirculation;
  end Examples;
end Organs;

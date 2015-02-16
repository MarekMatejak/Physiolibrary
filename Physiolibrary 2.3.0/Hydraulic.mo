within Physiolibrary;
package Hydraulic "Domain with Pressure and Volumetric Flow"
 extends Modelica.Icons.Package;
  package Examples
    "Examples that demonstrate usage of the Pressure flow components"
  extends Modelica.Icons.ExamplesPackage;

    model MinimalCirculation
      "Minimal circulation models driven by cardiac output"
       extends Modelica.Icons.Example;
      Components.Pump heart(useSolutionFlowInput=true)
        annotation (Placement(transformation(extent={{-6,-50},{14,-30}})));
      Components.ElasticVessel
                     arteries(
        volume_start(displayUnit="l") = 0.001,
        ZeroPressureVolume(displayUnit="l") = 0.00085,
        Compliance(displayUnit="ml/mmHg") = 1.1625954425608e-08)
        annotation (Placement(transformation(extent={{36,-84},{56,-64}})));
      Components.Conductor resistance(Conductance(displayUnit="l/(mmHg.min)") = 6.2755151845753e-09)
        annotation (Placement(transformation(extent={{-4,-84},{16,-64}})));
      Components.ElasticVessel
                     veins(
        Compliance(displayUnit="l/mmHg") = 6.1880080007267e-07,
        ZeroPressureVolume(displayUnit="l") = 0.00295,
        volume_start(displayUnit="l") = 0.0032)
        annotation (Placement(transformation(extent={{-42,-84},{-22,-64}})));
      Modelica.Blocks.Sources.Pulse pulse(
        width=25,
        amplitude=3.3e-4,
        period=60/75)
        annotation (Placement(transformation(extent={{-94,74},{-74,94}})));
    equation
      connect(heart.q_out, arteries.q_in) annotation (Line(
          points={{14,-40},{46,-40},{46,-74}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(arteries.q_in, resistance.q_out) annotation (Line(
          points={{46,-74},{16,-74}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(resistance.q_in, veins.q_in) annotation (Line(
          points={{-4,-74},{-32,-74}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(veins.q_in, heart.q_in) annotation (Line(
          points={{-32,-74},{-32,-40},{-6,-40}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pulse.y, heart.solutionFlow) annotation (Line(
          points={{-73,84},{-62,84},{-62,-26},{4,-26},{4,-33}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={                          Text(
              extent={{-40,-12},{80,-22}},
              lineColor={175,175,175},
              textString="Minimal circulation driven by cardiac output")}),
          Documentation(revisions="<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),
        experiment(StopTime=5));
    end MinimalCirculation;

    model Windkessel_2element "Two-element Windkessel model"
      extends Modelica.Icons.Example;
      Physiolibrary.Hydraulic.Sources.UnlimitedPump heart(useSolutionFlowInput=
            true)
        annotation (Placement(transformation(extent={{-50,38},{-30,58}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel arteries(
        ZeroPressureVolume(displayUnit="l") = 0.00085,
        Compliance(displayUnit="ml/mmHg") = 1.0500862061839e-08,
        volume_start(displayUnit="l") = 0.00097)
        annotation (Placement(transformation(extent={{-14,38},{6,58}})));
      Physiolibrary.Hydraulic.Components.Conductor resistance(
          useConductanceInput=false, Conductance(displayUnit="ml/(mmHg.s)")=
          8.1006650191331e-09) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={18,34})));
      Physiolibrary.Hydraulic.Sources.UnlimitedVolume veins annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            origin={-40,20})));
      Utilities.Pulses pulses(QP(displayUnit="m3/s")=
             0.000424, HR=1.2)
        annotation (Placement(transformation(extent={{-64,58},{-44,78}})));
    equation
      connect(heart.q_out, arteries.q_in) annotation (Line(
          points={{-30,48},{-4,48}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(resistance.q_out, veins.y) annotation (Line(
          points={{18,24},{18,20},{-30,20}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pulses.volumeflowrate, heart.solutionFlow) annotation (Line(
          points={{-45,68},{-40,68},{-40,55}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(resistance.q_in, arteries.q_in) annotation (Line(
          points={{18,44},{18,48},{-4,48}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={Text(
                  extent={{-74,90},{46,80}},
                  lineColor={175,175,175},
                  textString="2-element Windkessel model")}),
        Documentation(revisions="<html>
<ul>
<li><i>Sep 2014</i> by Tomas Kulhanek:
<br/>Updated pulse generator and diagram to conform electric analogy diagrams.
</li>
<li><i>May 2014 </i> by Marek Matejak:
<br/>Created.
</li>
</ul>
</html>", info="<html>
<p>Two-element windkessel model consisting of resistance and compliance element.</p>
<ul>
<li>Frank O (1899) Die Grundform des arteriellen Pulses. Z Biol 37:483&ndash;526</li>
<li>Westerhof, N., Lankhaar, J.-W., &AMP; Westerhof, B. E. (2009). The arterial Windkessel. <i>Medical &AMP; Biological Engineering &AMP; Computing</i>, <i>47</i>(2), 131&ndash;41. doi:10.1007/s11517-008-0359-2</li>
<li><a href=\"http://en.wikipedia.org/wiki/Windkessel_effect\">http://en.wikipedia.org/wiki/Windkessel_effect</a></li>
</ul>
</html>"),
        experiment(StopTime=5));
    end Windkessel_2element;

    model Windkessel_3element "Three-element windkessel model"
      extends Modelica.Icons.Example;
      Physiolibrary.Hydraulic.Sources.UnlimitedPump heart(useSolutionFlowInput=
            true)
        annotation (Placement(transformation(extent={{-50,38},{-30,58}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel arteries(
        ZeroPressureVolume(displayUnit="l") = 0.00085,
        Compliance(displayUnit="ml/mmHg") = 1.0500862061839e-08,
        volume_start(displayUnit="l") = 0.00097)
        annotation (Placement(transformation(extent={{16,38},{36,58}})));
      Physiolibrary.Hydraulic.Components.Conductor resistance(
          useConductanceInput=false, Conductance(displayUnit="ml/(mmHg.s)") = 8.1006650191331e-09)
                               annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={50,34})));
      Physiolibrary.Hydraulic.Sources.UnlimitedVolume veins annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            origin={-40,20})));
      Utilities.Pulses pulses(
        QP(displayUnit="m3/s") = 0.000424,
        TD1(displayUnit="s"),
        HR(displayUnit="1/min") = 1.2)
        annotation (Placement(transformation(extent={{-64,58},{-44,78}})));
      Physiolibrary.Hydraulic.Components.Conductor impedance(
          useConductanceInput=false, Conductance(displayUnit="ml/(mmHg.s)")=
          1.5001231516913e-06) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            origin={-6,50})));
    equation
      connect(resistance.q_out, veins.y) annotation (Line(
          points={{50,24},{50,20},{-30,20}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pulses.volumeflowrate, heart.solutionFlow) annotation (Line(
          points={{-45,68},{-40,68},{-40,55}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(heart.q_out, impedance.q_in) annotation (Line(
          points={{-30,48},{-24,48},{-24,50},{-16,50}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(impedance.q_out, arteries.q_in) annotation (Line(
          points={{4,50},{16,50},{16,48},{26,48}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(resistance.q_in, arteries.q_in) annotation (Line(
          points={{50,44},{50,48},{26,48}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={Text(
                  extent={{-74,90},{46,80}},
                  lineColor={175,175,175},
                  textString="3-element Windkessel model")}),
        Documentation(revisions="<html>
<ul>
<li><i>Sep 2014</i> by Tomas Kulhanek: <br>Created. </li>
</ul>
<p> </p>
</html>", info="<html>
<p>Three-element windkessel model, updated two-element windkessel model with an impedance element. Impedance can be approximated by resistance.</p>
<ul>
<li>Westerhof N, Elzinga G (1991) Normalized input impedance and arterial decay time over heart period are independent of animal size. Am J Physiol 261:R126&ndash;R133</li>
<li>Westerhof, N., Lankhaar, J.-W., &AMP; Westerhof, B. E. (2009). The arterial Windkessel. <i>Medical &AMP; Biological Engineering &AMP; Computing</i>, <i>47</i>(2), 131&ndash;41. doi:10.1007/s11517-008-0359-2</li>
</ul>
</html>"),
        experiment(StopTime=5));
    end Windkessel_3element;

    model Windkessel_4element "Four-element windkessel model"
      extends Modelica.Icons.Example;
      Physiolibrary.Hydraulic.Sources.UnlimitedPump heart(useSolutionFlowInput=
            true)
        annotation (Placement(transformation(extent={{-50,38},{-30,58}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel arteries(
        ZeroPressureVolume(displayUnit="l") = 0.00085,
        Compliance(displayUnit="ml/mmHg") = 1.0500862061839e-08,
        volume_start(displayUnit="l") = 0.00097)
        annotation (Placement(transformation(extent={{16,38},{36,58}})));
      Physiolibrary.Hydraulic.Components.Conductor resistance(
          useConductanceInput=false, Conductance(displayUnit="ml/(mmHg.s)") = 8.1006650191331e-09)
                               annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={48,34})));
      Physiolibrary.Hydraulic.Sources.UnlimitedVolume veins annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            origin={-40,20})));
      Utilities.Pulses pulses(QP(displayUnit="m3/s")=
             0.000424, HR=1.2)
        annotation (Placement(transformation(extent={{-64,58},{-44,78}})));
      Physiolibrary.Hydraulic.Components.Conductor impedance(
          useConductanceInput=false, Conductance(displayUnit="ml/(mmHg.s)")=
          1.5001231516913e-06) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            origin={-6,48})));
      Physiolibrary.Hydraulic.Components.Inertia inertia(I(displayUnit=
              "mmHg.s2/ml") = 666611.937075, volumeFlow_start(displayUnit=
              "l/min") = 8.3333333333333e-05)
        annotation (Placement(transformation(extent={{-16,56},{4,76}})));
    equation
      connect(resistance.q_out, veins.y) annotation (Line(
          points={{48,24},{48,20},{-30,20}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pulses.volumeflowrate, heart.solutionFlow) annotation (Line(
          points={{-45,68},{-40,68},{-40,55}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(heart.q_out, impedance.q_in) annotation (Line(
          points={{-30,48},{-16,48}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(impedance.q_out, arteries.q_in) annotation (Line(
          points={{4,48},{26,48}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(heart.q_out, inertia.q_in) annotation (Line(
          points={{-30,48},{-26,48},{-26,66},{-16,66}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(inertia.q_out, arteries.q_in) annotation (Line(
          points={{4,66},{12,66},{12,48},{26,48}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(resistance.q_in, arteries.q_in) annotation (Line(
          points={{48,44},{48,48},{26,48}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={Text(
                  extent={{-74,90},{46,80}},
                  lineColor={175,175,175},
                  textString="4-element Windkessel model")}),
        Documentation(revisions="<html>
<ul>
<li><i>Sep 2014</i> by Tomas Kulhanek: <br>Created. </li>
</ul>
</html>", info="<html>
<p>Four-element windkessel model, updated three-element windkessel model with an inertia element. </p>
<ul>
<li>Stergiopulos N, Westerhof BE, Westerhof N (1999) Total arterial inertance as the fourth element of the windkessel model. Am J Physiol 276:H81&ndash;H88</li>
<li>Westerhof, N., Lankhaar, J.-W., &AMP; Westerhof, B. E. (2009). The arterial Windkessel. <i>Medical &AMP; Biological Engineering &AMP; Computing</i>, <i>47</i>(2), 131&ndash;41. doi:10.1007/s11517-008-0359-2</li>
</ul>
</html>"),
        experiment(StopTime=5));
    end Windkessel_4element;

    model CardiovascularSystem_GCG
      "Cardiovascular part of Guyton-Coleman-Granger's model from 1972"
       extends Modelica.Icons.Example;
       import Physiolibrary.Hydraulic;
      Components.ElasticVessel pulmonaryVeinsAndLeftAtrium(
        volume_start(displayUnit="l") = 0.0004,
        ZeroPressureVolume(displayUnit="l") = 0.0004,
        Compliance(displayUnit="l/mmHg") = 7.5006157584566e-08)
        annotation (Placement(transformation(extent={{4,74},{24,94}})));
      Components.ElasticVessel
                     pulmonaryArteries(
        ZeroPressureVolume(displayUnit="l") = 0.00030625,
        Compliance(displayUnit="l/mmHg") = 3.6002955640592e-08,
        volume_start(displayUnit="l") = 0.00038)
        annotation (Placement(transformation(extent={{-62,74},{-42,94}})));
      Hydraulic.Components.Conductor
               pulmonary(Conductance(displayUnit="l/(mmHg.min)") = 4.1665920538226e-08)
        annotation (Placement(transformation(extent={{-30,74},{-10,94}})));
      Components.ElasticVessel
                     arteries(
        volume_start(displayUnit="l") = 0.00085,
        ZeroPressureVolume(displayUnit="l") = 0.000495,
        Compliance(displayUnit="l/mmHg") = 2.6627185942521e-08)
        annotation (Placement(transformation(extent={{14,-46},{34,-26}})));
      Components.ElasticVessel
                     veins(
        Compliance(displayUnit="l/mmHg") = 6.1880080007267e-07,
        volume_start(displayUnit="l") = 0.00325,
        ZeroPressureVolume(displayUnit="l") = 0.00295)
        annotation (Placement(transformation(extent={{-64,-46},{-44,-26}})));
      Hydraulic.Components.Conductor
               nonMuscle(Conductance(displayUnit="l/(mmHg.min)") = 3.5627924852669e-09)
        annotation (Placement(transformation(extent={{-24,-46},{-4,-26}})));
      Sensors.PressureMeasure
                      pressureMeasure
        annotation (Placement(transformation(extent={{-78,26},{-58,46}})));
      Components.Pump
           rightHeart(useSolutionFlowInput=true)
        annotation (Placement(transformation(extent={{-56,8},{-36,28}})));
      Types.Constants.VolumeFlowRateConst RNormalCO(k(displayUnit="l/min") = 8.3333333333333e-05)
        annotation (Placement(transformation(extent={{-60,40},{-52,48}})));
      Sensors.PressureMeasure
                      pressureMeasure1
        annotation (Placement(transformation(extent={{-8,26},{12,46}})));
      Components.Pump
           leftHeart(useSolutionFlowInput=true)
        annotation (Placement(transformation(extent={{16,6},{36,26}})));
      Types.Constants.VolumeFlowRateConst LNormalCO(k(displayUnit="l/min") = 8.3333333333333e-05)
        annotation (Placement(transformation(extent={{12,42},{20,50}})));
      Hydraulic.Components.Conductor
               kidney(Conductance(displayUnit="l/(mmHg.min)") = 1.4126159678427e-09)
        annotation (Placement(transformation(extent={{-24,-64},{-4,-44}})));
      Hydraulic.Components.Conductor
               muscle(Conductance(displayUnit="l/(mmHg.min)") = 1.3001067314658e-09)
        annotation (Placement(transformation(extent={{-24,-28},{-4,-8}})));
      Hydraulic.Components.Conductor
               largeVeins(Conductance(displayUnit="l/(mmHg.min)") = 1.6888886482791e-07)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-84,-8})));
      Components.ElasticVessel
                     rightAtrium(
        volume_start(displayUnit="l") = 0.0001,
        ZeroPressureVolume(displayUnit="l") = 0.0001,
        Compliance(displayUnit="l/mmHg") = 3.7503078792283e-08)
        annotation (Placement(transformation(extent={{-82,8},{-62,28}})));
      Blocks.Factors.Spline       rightStarling(data={{-6,0,0},{-3,0.15,0.104},{-1,0.52,
            0.48},{2,1.96,0.48},{4,2.42,0.123},{8,2.7,0}}, Xscale=101325/760)
        "At filling pressure 0mmHg (because external thorax pressure is -4mmHg) is normal cardiac output (effect=1)."
        annotation (Placement(transformation(extent={{-56,22},{-36,42}})));
      Blocks.Factors.Spline       leftStarling(data={{-4,0,0},{-1,
            0.72,0.29},{0,1.01,0.29},{3,1.88,0.218333},{10,2.7,0}}, Xscale=
            101325/760)
        "At filling pressure -0.0029mmHg (because external thorax pressure is -4mmHg) is normal cardiac output (effect=1)."
        annotation (Placement(transformation(extent={{16,22},{36,42}})));
    equation
      connect(pulmonaryArteries.q_in,pulmonary. q_in) annotation (Line(
          points={{-52,84},{-30,84}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pulmonary.q_out, pulmonaryVeinsAndLeftAtrium.q_in) annotation (
          Line(
          points={{-10,84},{14,84}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(veins.q_in, nonMuscle.q_in)  annotation (Line(
          points={{-54,-36},{-24,-36}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(nonMuscle.q_out, arteries.q_in)  annotation (Line(
          points={{-4,-36},{24,-36}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(rightHeart.q_out,pulmonaryArteries. q_in) annotation (Line(
          points={{-36,18},{-28,18},{-28,60},{-70,60},{-70,84},{-52,84}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(leftHeart.q_in, pulmonaryVeinsAndLeftAtrium.q_in) annotation (
          Line(
          points={{16,16},{-4,16},{-4,60},{32,60},{32,84},{14,84}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(leftHeart.q_out,arteries. q_in) annotation (Line(
          points={{36,16},{44,16},{44,-36},{24,-36}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pressureMeasure.q_in,rightHeart. q_in) annotation (Line(
          points={{-72,30},{-72,18},{-56,18}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pressureMeasure1.q_in, pulmonaryVeinsAndLeftAtrium.q_in)
        annotation (Line(
          points={{-2,30},{-4,30},{-4,60},{32,60},{32,84},{14,84}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(muscle.q_out, arteries.q_in) annotation (Line(
          points={{-4,-18},{10,-18},{10,-36},{24,-36}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(kidney.q_out, arteries.q_in) annotation (Line(
          points={{-4,-54},{10,-54},{10,-36},{24,-36}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(kidney.q_in, nonMuscle.q_in) annotation (Line(
          points={{-24,-54},{-34,-54},{-34,-36},{-24,-36}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(muscle.q_in, nonMuscle.q_in) annotation (Line(
          points={{-24,-18},{-34,-18},{-34,-36},{-24,-36}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(veins.q_in, largeVeins.q_out) annotation (Line(
          points={{-54,-36},{-84,-36},{-84,-18}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(largeVeins.q_in, rightAtrium.q_in) annotation (Line(
          points={{-84,2},{-84,18},{-72,18}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(rightAtrium.q_in, rightHeart.q_in) annotation (Line(
          points={{-72,18},{-56,18}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(RNormalCO.y, rightStarling.yBase) annotation (Line(
          points={{-51,44},{-46,44},{-46,34}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(LNormalCO.y, leftStarling.yBase) annotation (Line(
          points={{21,46},{26,46},{26,34}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pressureMeasure.q_in, rightAtrium.q_in) annotation (Line(
          points={{-72,30},{-72,18}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(rightHeart.solutionFlow, rightStarling.y) annotation (Line(
          points={{-46,25},{-46,28},{-46,28}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(leftStarling.y, leftHeart.solutionFlow) annotation (Line(
          points={{26,28},{26,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pressureMeasure.pressure, rightStarling.u) annotation (Line(
          points={{-62,32},{-54,32}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pressureMeasure1.pressure, leftStarling.u) annotation (Line(
          points={{8,32},{18,32}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Text(
              extent={{-82,-80},{80,-100}},
              lineColor={175,175,175},
              textString=
                  "Circulation part of Guyton-Coleman-Granger's model from 1972")}),
                                              Documentation(info="<html>
<p>Cardiovascular subsystem in famous Guyton-Coleman-Granger model from 1972. </p>
<p><br/>Model, all parameters and all initial values are from article: </p>
<p>A.C. Guyton, T.G. Coleman, H.J. Granger (1972). &QUOT;Circulation: overall regulation.&QUOT; Annual review of physiology 34(1): 13-44.</p>
</html>", revisions="<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),
        experiment(StopTime=300));
    end CardiovascularSystem_GCG;

    package Utilities "Utility components used by package Examples"
    extends Modelica.Icons.UtilitiesPackage;

      model Pulses "example pulse flow generator"
        import Physiolibrary.Types.*;
        Physiolibrary.Types.RealIO.VolumeFlowRateOutput volumeflowrate
          annotation (Placement(transformation(extent={{80,-10},{100,10}}),
              iconTransformation(extent={{80,-10},{100,10}})));
        discrete Time T0 "begining of cardiac cycle";
        Boolean b(start=false);
        discrete Time HP "duration of cardiac cycle";
        parameter Frequency HR=1.2;
        Time tc "relative time in carciac cycle";
        parameter Time TD1=0.07 "relative time of start of systole";
        discrete Time TD2 "relative time of end of systole";
        parameter VolumeFlowRate QP=0.000424 "peak volume flowrate";
      equation
        b = time - pre(T0) >= pre(HP) "true if new cardiac cycle begins";
        when {initial(),b} then
          T0 = time "set begining of cardiac cycle";
          HP = 1/HR "update length of carciac cycle";
          TD2 = TD1 + (2/5)*HP "compute end time of systole";
        end when;
        tc = time - T0 "relative time in carciac cycle";
        volumeflowrate = if tc < TD1 then 0 else if tc < TD2 then sin((tc - TD1)/
          (TD2 - TD1)*Modelica.Constants.pi)*QP else 0
          "zero before and after systole, otherwise sin up to peak flow";
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics={Rectangle(
                    extent={{-80,80},{80,-80}},
                    lineColor={0,0,255},
                    fillColor={255,255,170},
                    fillPattern=FillPattern.Solid),Line(
                    points={{-70,0},{-50,0},{-48,2},{-42,52},{-36,60},{-28,52},{-24,
                  2},{-20,0},{14,0},{18,2},{24,48},{24,54},{32,58},{40,50},{44,2},
                  {50,0},{74,0}},
                    color={0,0,255},
                    smooth=Smooth.Bezier),
              Text(
                extent={{-80,108},{80,88}},
                lineColor={0,0,255},
                textString="%name"),
              Text(
                extent={{-80,-92},{78,-112}},
                lineColor={0,0,255},
                textString="rate=%HR")}));
      end Pulses;
    end Utilities;

    package Kofranek2014
      "models of cardiovascular system used in www.physiome.cz/atlas"
      extends Modelica.Icons.ExamplesPackage;
      model NonPulsatileCirculation
        extends Physiolibrary.Icons.CardioVascular;
        Physiolibrary.Hydraulic.Components.ElasticVessel PulmonaryArteries(
          useV0Input=true,
          useComplianceInput=true,
          volume_start=0.000373)
          annotation (Placement(transformation(extent={{-40,28},{-20,48}})));
        Physiolibrary.Types.Constants.HydraulicComplianceConst CAP(k=
              2.2576853432954e-08)
          annotation (Placement(transformation(extent={{-50,56},{-36,70}})));
        Physiolibrary.Types.Constants.VolumeConst V0AP(k=0.000327)
          annotation (Placement(transformation(extent={{-66,44},{-52,58}})));
        Physiolibrary.Hydraulic.Components.Conductor TotalPulmonaryResistance(
            useConductanceInput=true)
          annotation (Placement(transformation(extent={{-2,28},{18,48}})));
        Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst RP(k(
              displayUnit="(Pa.s)/m3") = 9332567.11905)
          annotation (Placement(transformation(extent={{-6,60},{6,70}})));
        Physiolibrary.Hydraulic.Components.ElasticVessel PulmonaryVeins(
          useV0Input=true,
          useComplianceInput=true,
          volume_start=0.000704)
          annotation (Placement(transformation(extent={{42,28},{62,48}})));
        Physiolibrary.Types.Constants.HydraulicComplianceConst CVP(k=
              2.250184727537e-07)
          annotation (Placement(transformation(extent={{36,60},{50,74}})));
        Physiolibrary.Types.Constants.VolumeConst V0VP(k=0.000435)
          annotation (Placement(transformation(extent={{20,48},{34,62}})));
        Physiolibrary.Hydraulic.Components.ElasticVessel SystemicVeins(
          useV0Input=true,
          useComplianceInput=true,
          volume_start=0.003922)
          annotation (Placement(transformation(extent={{-46,-70},{-26,-50}})));
        Physiolibrary.Types.Constants.HydraulicComplianceConst CVS(k=
              1.5001231516913e-06)
          annotation (Placement(transformation(extent={{-52,-42},{-38,-28}})));
        Physiolibrary.Types.Constants.VolumeConst V0VS(k=0.002845)
          annotation (Placement(transformation(extent={{-74,-54},{-60,-40}})));
        Physiolibrary.Hydraulic.Components.Conductor TotalSystemicResistance(
            useConductanceInput=true)
          annotation (Placement(transformation(extent={{16,-70},{-4,-50}})));
        Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst RT(k(
              displayUnit="(Pa.s)/m3") = 133322387.415)
          annotation (Placement(transformation(extent={{-14,-50},{-4,-40}})));
        Physiolibrary.Hydraulic.Components.ElasticVessel SystemicArteries(
          useV0Input=true,
          useComplianceInput=true,
          volume_start=0.000672)
          annotation (Placement(transformation(extent={{36,-70},{56,-50}})));
        Physiolibrary.Types.Constants.HydraulicComplianceConst CAS(k=
              1.1250923637685e-08)
          annotation (Placement(transformation(extent={{30,-38},{44,-24}})));
        Physiolibrary.Types.Constants.VolumeConst V0AS(k=0.000529)
          annotation (Placement(transformation(extent={{14,-50},{28,-36}})));
        replaceable Parts.HeartPump rightHeart(StarlingSlope(displayUnit=
                "ml/(mmHg.s)") = 1.2503526469347e-07)
          annotation (Placement(transformation(extent={{-72,-10},{-48,16}})));
        replaceable Parts.HeartPump leftHeart(StarlingSlope(displayUnit=
                "m3/(Pa.s)") = 7.5006157584566e-08)
          annotation (Placement(transformation(extent={{74,-10},{52,10}})));
      equation
        connect(CAP.y, PulmonaryArteries.compliance) annotation (Line(
            points={{-34.25,63},{-30,63},{-30,46}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(V0AP.y, PulmonaryArteries.zeroPressureVolume) annotation (Line(
            points={{-50.25,51},{-50.25,50.5},{-38,50.5},{-38,46}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(RP.y, TotalPulmonaryResistance.cond) annotation (Line(
            points={{7.5,65},{8,65},{8,44}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(CVP.y, PulmonaryVeins.compliance) annotation (Line(
            points={{51.75,67},{52,67},{52,46}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(CVS.y, SystemicVeins.compliance) annotation (Line(
            points={{-36.25,-35},{-36,-35},{-36,-52}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(RT.y, TotalSystemicResistance.cond) annotation (Line(
            points={{-2.75,-45},{6,-45},{6,-54}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(CAS.y, SystemicArteries.compliance) annotation (Line(
            points={{45.75,-31},{46,-31},{46,-52}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(PulmonaryArteries.q_in, TotalPulmonaryResistance.q_in)
          annotation (Line(
            points={{-30,38},{-2,38}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(TotalPulmonaryResistance.q_out, PulmonaryVeins.q_in)
          annotation (Line(
            points={{18,38},{52,38}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(PulmonaryVeins.q_in, leftHeart.inflow) annotation (Line(
            points={{52,38},{74,38},{74,4.44089e-16}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(leftHeart.outflow, SystemicArteries.q_in) annotation (Line(
            points={{52,0},{52,-60},{46,-60}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(SystemicArteries.q_in, TotalSystemicResistance.q_in)
          annotation (Line(
            points={{46,-60},{16,-60}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(TotalSystemicResistance.q_out, SystemicVeins.q_in) annotation (
            Line(
            points={{-4,-60},{-36,-60}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(SystemicVeins.q_in, rightHeart.inflow) annotation (Line(
            points={{-36,-60},{-78,-60},{-78,3},{-72,3}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(PulmonaryVeins.zeroPressureVolume, V0VP.y) annotation (Line(
            points={{44,46},{40,46},{40,55},{35.75,55}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(SystemicVeins.zeroPressureVolume, V0VS.y) annotation (Line(
            points={{-44,-52},{-52,-52},{-52,-47},{-58.25,-47}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(V0AS.y, SystemicArteries.zeroPressureVolume) annotation (Line(
            points={{29.75,-43},{38,-43},{38,-52}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(rightHeart.outflow, PulmonaryArteries.q_in) annotation (Line(
            points={{-48,3},{-48,38},{-30,38}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        annotation ( Documentation(info="<html>
<p>Model of cardiovascular system using to demonstrate elastic and resistance features of veins and arteries in pulmonary and systemic circulation and influence of cardiac output on it. </p>
<ul>
<li>J. Kofranek, S. Matousek, J. Rusz, P. Stodulka, P. Privitzer,M. Matejak, M. Tribula, The Atlas of Physiology and Pathophysiology: Web-based multimedia enabled interactive simulations., Comput. Methods Programs Biomed. 104 (2) (2011) 143&ndash;53. doi:10.1016/j.cmpb.2010.12.007.</li>
<li>Kofr&aacute;nek J, Matej&aacute;k M, Je~ek F, Privitzer P, &Scaron;ilar J. V&yacute;ukov&yacute; webov&yacute; simulator krevn&iacute;ho obhu. In: Sborn&iacute;k PY&iacute;spvko MEDSOFT 2011: 106-121. </li>
<li>Tribula M, Je~ek F, Privitzer P, Kofr&aacute;nek J, Kolman J. Webov&yacute; v&yacute;ukov&yacute; simul&aacute;tor krevn&iacute;ho obhu. In: Sborn&iacute;k PY&iacute;spvko MEDSOFT 2013: 197-204.</li>
<li><a href=\"http://physiome.cz/atlas/cirkulace/05/SimpleUncontrolledSimulation.html\">http://physiome.cz/atlas/cirkulace/05/SimpleUncontrolledSimulation.html</a></li>
</ul>
</html>"),experiment(StopTime=5));
      end NonPulsatileCirculation;

      model PulsatileCirculation
          extends NonPulsatileCirculation(
          redeclare Parts.PulsatileHeartPump rightHeart(pulses(
                QP=0.000338)),
          redeclare Parts.PulsatileHeartPump leftHeart(pulses(QP=
                 0.000338)),
          CAS(k=7.2755972857029e-09),
          SystemicArteries(volume_start=0.000603),
          SystemicVeins(volume_start=0.003991));

        annotation ( Documentation(info="<html>
<p>Extension of the model of cardiovascular system with pulsatile dynamics</p>
<ul>
<li>Kulh&aacute;nek T, Tribula M, Kofr&aacute;nek J, Matej&aacute;k M. Simple models of the cardiovascular system for educational and research purposes. MEFANET Journal 2014. Available at WWW:<a href=\"
 http://mj.mefanet.cz/mj-04140914\"> http://mj.mefanet.cz/mj-04140914</a>.</li>
</ul>
</html>"),experiment(StopTime=5));
      end PulsatileCirculation;

      package Parts "Utility components used by package KofranekModels2013"
      extends Modelica.Icons.UtilitiesPackage;
        model HeartPump "Heart as pump, which flowrate is determined
  by the StarlingSlope and filling pressure."

          Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a inflow annotation (
             Placement(transformation(extent={{-110,-10},{-90,10}}),
                iconTransformation(extent={{-110,-10},{-90,10}})));
          Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b outflow
            annotation (Placement(transformation(extent={{90,-10},{110,10}}),
                iconTransformation(extent={{90,-10},{110,10}})));
          parameter Physiolibrary.Types.HydraulicConductance StarlingSlope;
        equation
          inflow.q + outflow.q = 0;
          inflow.q = StarlingSlope*inflow.pressure;
          annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={
                    {-100,-100},{100,100}}), graphics={Polygon(
                          points={{32,-34},{24,-24},{18,-10},{18,-8},{22,22},{
                    24,24},{34,40},{30,70},{26,82},{-22,100},{-26,42},{-26,40},
                    {-30,-6},{-30,-10},{-6,-40},{52,-74},{32,-34}},
                          lineColor={0,0,127},
                          smooth=Smooth.Bezier,
                          fillColor={255,170,170},
                          fillPattern=FillPattern.Solid),Text(
                          extent={{-100,-60},{102,-98}},
                          lineColor={0,0,127},
                          fillColor={255,170,170},
                          fillPattern=FillPattern.Solid,
                          textString="%name")}));
        end HeartPump;

        model PulsatileHeartPump "Heart as pump, which flowrate is determined
  by the StarlingSlope and filling pressure."

          Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a inflow annotation (
             Placement(transformation(extent={{-64,0},{-44,20}}),
                iconTransformation(extent={{-110,-10},{-90,10}})));
          Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b outflow
            annotation (Placement(transformation(extent={{42,2},{62,22}}),
                iconTransformation(extent={{42,2},{62,22}})));
          Utilities.Pulses pulses
            annotation (Placement(transformation(extent={{-40,30},{-20,50}})));
          Physiolibrary.Hydraulic.Components.Pump pump(useSolutionFlowInput=
                true)
            annotation (Placement(transformation(extent={{-14,2},{6,22}})));
          parameter Physiolibrary.Types.HydraulicConductance StarlingSlope;
        equation
          connect(pump.q_out, outflow) annotation (Line(
              points={{6,12},{52,12}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(pump.solutionFlow, pulses.volumeflowrate) annotation (Line(
              points={{-4,19},{-4,40},{-21,40}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(inflow, pump.q_in) annotation (Line(
              points={{-54,10},{-34,10},{-34,12},{-14,12}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(inflow, inflow) annotation (Line(
              points={{-54,10},{-54,10}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={
                    {-100,-100},{100,100}}), graphics={Polygon(
                          points={{32,-34},{24,-24},{18,-10},{18,-8},{22,22},{
                    24,24},{34,40},{30,70},{26,82},{-22,100},{-26,42},{-26,40},
                    {-30,-6},{-30,-10},{-6,-40},{52,-74},{32,-34}},
                          lineColor={0,0,127},
                          smooth=Smooth.Bezier,
                          fillColor={255,170,170},
                          fillPattern=FillPattern.Solid),Text(
                          extent={{-100,-60},{102,-98}},
                          lineColor={0,0,127},
                          fillColor={255,170,170},
                          fillPattern=FillPattern.Solid,
                          textString="%name")}));
        end PulsatileHeartPump;

      end Parts;

      annotation (Documentation(info="<html>
<p>Model of cardiovascular system using to demonstrate elastic and resistance features of veins and arteries in pulmonary and systemic circulation and influence of cardiac output on it.</p>
</html>"));
    end Kofranek2014;

    package Fernandez2013
      "Model of CVS introduced by Fernandez de Canete et al. 2013"
        extends Modelica.Icons.ExamplesPackage;

      model PulsatileCirculation
        "Model of cardiovascular system with pulsatile dynamic"
                                extends Physiolibrary.Icons.CardioVascular;

        Physiolibrary.Hydraulic.Components.Conductor RPulmonaryVeins(
            useConductanceInput=false, Conductance(displayUnit="m3/(Pa.s)")=
            7.425609600872e-08)                                      annotation(Placement(transformation(origin = {-220, 60}, extent = {{15, -15}, {-15, 15}})));
        Physiolibrary.Hydraulic.Components.Inertia pulmonaryVeinsInertia(
            volumeFlow_start(displayUnit="m3/s") = 2.225e-05, I(displayUnit=
                "Pa.s2/m3") = 410632.9532382)                            annotation(Placement(transformation(origin={-278,60},    extent = {{15, -15}, {-15, 15}})));
        Physiolibrary.Hydraulic.Components.Conductor RPulmonaryArtery(
            useConductanceInput=false, Conductance(displayUnit="m3/(Pa.s)")=
            2.2216823876548e-07)                                      annotation(Placement(transformation(origin={200,58},    extent = {{17.5, -17.5}, {-17.5, 17.5}})));
        Physiolibrary.Hydraulic.Components.Inertia pulmonaryArterialInertia(
            volumeFlow_start(displayUnit="ml/min") = 7.3233333333333e-07, I(
              displayUnit="mmHg.s2/ml") = 99991.79056125)                   annotation(Placement(transformation(origin={158,58},    extent = {{15, -15}, {-15, 15}})));
        Physiolibrary.Hydraulic.Components.ElasticVessel pulmonaryVeins(
          useComplianceInput=false,
          volume_start(displayUnit="ml") = 0.0006597,
          ZeroPressureVolume=0.0001,
          Compliance(displayUnit="ml/mmHg") = 3.5027875591992e-07)      annotation(Placement(transformation(origin={-279,-3},    extent = {{-15, -15}, {15, 15}})));
        Physiolibrary.Hydraulic.Components.IdealValve mitralValve(
                                    useLimitationInputs=false, _Gon(displayUnit=
               "ml/(mmHg.s)") = 1.9996641612045e-06)              annotation(Placement(transformation(origin={-243,-3},    extent = {{-15, -15}, {15, 15}})));
        Physiolibrary.Hydraulic.Components.ElasticVessel leftVentricle(
            useComplianceInput=true,
          useExternalPressureInput=true,
          volume_start=0.0002097,
          ZeroPressureVolume=9e-05)                                    annotation(Placement(transformation(origin={-209,-3},    extent = {{-15, -15}, {15, 15}})));
        Physiolibrary.Hydraulic.Components.Conductor RLeftMyo(useConductanceInput=false,
            Conductance(displayUnit="m3/(Pa.s)") = 9.3757696980707e-08)
                                                              annotation(Placement(transformation(origin={-181,-3},    extent = {{-15, -15}, {15, 15}})));
        Physiolibrary.Hydraulic.Components.IdealValve aorticValve(_Gon(displayUnit="ml/(mmHg.s)")=
               1.9996641612045e-06, useLimitationInputs=false)    annotation(Placement(transformation(origin={-143,-3},    extent = {{-15, -15}, {15, 15}})));
        Physiolibrary.Hydraulic.Components.ElasticVessel aorta(
          volume_start=4.6e-05,
          ZeroPressureVolume=3e-05,
          Compliance(displayUnit="ml/mmHg") = 1.6501354668604e-09)
                                                               annotation(Placement(transformation(origin={-111,-3},   extent = {{-15, -15}, {15, 15}})));
        Physiolibrary.Hydraulic.Components.Conductor Raorta(useConductanceInput=false,
            Conductance(displayUnit="m3/(Pa.s)") = 1.1108411938274e-07)
                                                            annotation(Placement(transformation(origin={-79,-3},    extent = {{-15, -15}, {15, 15}})));
        Physiolibrary.Hydraulic.Components.Inertia aorticInertia(
            volumeFlow_start(displayUnit="m3/s") = 1.0385e-05, I(displayUnit=
                "Pa.s2/m3") = 109990.96961737)                   annotation(Placement(transformation(origin={-37,-3},    extent = {{-15, -15}, {15, 15}})));
        Physiolibrary.Hydraulic.Components.ElasticVessel arteries(
          volume_start=0.000805,
          ZeroPressureVolume=0.0007,
          Compliance(displayUnit="ml/mmHg") = 1.0950899007347e-08)
                                                                  annotation(Placement(transformation(origin={-1,-3},    extent = {{-15, -15}, {15, 15}})));
        Physiolibrary.Hydraulic.Components.Conductor RSystemic(useConductanceInput=false,
            Conductance(displayUnit="m3/(Pa.s)") = 7.5006157584566e-09)
                                                               annotation(Placement(transformation(origin={31,-3},    extent = {{-15, -15}, {15, 15}})));
        Physiolibrary.Hydraulic.Components.Inertia systemicInertia(
            volumeFlow_start(displayUnit="m3/s") = 7.935e-05, I(displayUnit=
                "Pa.s2/m3") = 479960.594694)                       annotation(Placement(transformation(origin={75,-3},     extent = {{-15, -15}, {15, 15}})));
        Physiolibrary.Hydraulic.Components.IdealValve tricuspidValve(
            useLimitationInputs=false, _Gon(displayUnit="ml/(mmHg.s)") = 1.9996641612045e-06)
                                                                     annotation(Placement(transformation(origin={137,-3},    extent = {{-15, -15}, {15, 15}})));
        Physiolibrary.Hydraulic.Components.ElasticVessel rightVentricle(
            useComplianceInput=true,
          useExternalPressureInput=true,
          volume_start=0.00018,
          ZeroPressureVolume=7e-05)                                     annotation(Placement(transformation(origin={171,-3},    extent = {{-15, -15}, {15, 15}})));
        Physiolibrary.Hydraulic.Components.Conductor RRightMyo(useConductanceInput=false,
            Conductance(displayUnit="m3/(Pa.s)") = 4.2858518443821e-07)
                                                               annotation(Placement(transformation(origin={207,-3},    extent = {{-15, -15}, {15, 15}})));
        Physiolibrary.Hydraulic.Components.IdealValve pulmonaryValve(_Gon(displayUnit=
               "ml/(mmHg.s)") = 1.9996641612045e-06, useLimitationInputs=false)
                                                                     annotation(Placement(transformation(origin={245,-3},    extent = {{-15, -15}, {15, 15}})));
        Physiolibrary.Hydraulic.Components.ElasticVessel pulmonaryArtery(
          volume_start=2.1e-05,
          ZeroPressureVolume=2e-05,
          Compliance(displayUnit="m3/Pa") = 6.7505541826109e-10)         annotation(Placement(transformation(origin={243,57},    extent = {{-15, -15}, {15, 15}})));
        Physiolibrary.Hydraulic.Components.ElasticVessel pulmonaryArterioles(
          volume_start=0.000637,
          ZeroPressureVolume=0.0006,
          Compliance(displayUnit="ml/mmHg") = 2.0026644075079e-08)           annotation(Placement(transformation(origin={124,58},    extent = {{-15, -15}, {15, 15}})));
        Physiolibrary.Hydraulic.Components.ElasticVessel veins(
          volume_start(displayUnit="ml") = 0.002443,
          ZeroPressureVolume=0.00237,
          Compliance(displayUnit="ml/mmHg") = 1.5001231516913e-07)
          annotation (Placement(transformation(
              origin={105,-3},
              extent={{-15,-15},{15,15}})));
        Parts.TimeVaryingElastance timeVaryingElastanceLeft(
          Ed(displayUnit="mmHg/ml") = 13332238.7415,
          Es(displayUnit="mmHg/ml") = 183318282.69563,
          Pi0(displayUnit="mmHg") = 6666.11937075)
          annotation (Placement(transformation(extent={{-222,16},{-202,36}})));
        Parts.TimeVaryingElastance timeVaryingElastanceRight(
          Ed(displayUnit="mmHg/ml") = 3999671.62245,
          Es(displayUnit="mmHg/ml") = 43729743.0721,
          Pi0(displayUnit="mmHg") = 3199.73729796)
          annotation (Placement(transformation(extent={{164,18},{184,38}})));
        Physiolibrary.Types.Constants.FrequencyConst heartRate(k(displayUnit=
                "Hz") = 1.2)
          annotation (Placement(transformation(extent={{-262,30},{-244,42}})));
      equation
        connect(aorta.q_in, Raorta.q_in) annotation (Line(
            points={{-111,-3},{-94,-3}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(Raorta.q_out, aorticInertia.q_in) annotation (Line(
            points={{-64,-3},{-52,-3}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(systemicInertia.q_out, veins.q_in) annotation (Line(
            points={{90,-3},{105,-3}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(timeVaryingElastanceLeft.C, leftVentricle.compliance)
          annotation (Line(
            points={{-212,17},{-209,17},{-209,9}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(timeVaryingElastanceRight.C, rightVentricle.compliance)
          annotation (Line(
            points={{174,19},{174,9},{171,9}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(veins.q_in, tricuspidValve.q_in) annotation (Line(
            points={{105,-3},{122,-3}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(timeVaryingElastanceLeft.Pi, leftVentricle.externalPressure)
          annotation (Line(
            points={{-205,17},{-205,16.5},{-197,16.5},{-197,9}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(timeVaryingElastanceRight.Pi, rightVentricle.externalPressure)
          annotation (Line(
            points={{181,19},{181,9},{183,9}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(heartRate.y, timeVaryingElastanceLeft.HR) annotation (Line(
            points={{-241.75,36},{-232.375,36},{-232.375,33.6},{-220.6,33.6}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(aorticInertia.q_out, arteries.q_in) annotation (Line(
            points={{-22,-3},{-1,-3}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(arteries.q_in, RSystemic.q_in) annotation (Line(
            points={{-1,-3},{16,-3}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(RSystemic.q_out, systemicInertia.q_in) annotation (Line(
            points={{46,-3},{60,-3}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(rightVentricle.q_in, tricuspidValve.q_out) annotation (Line(
            points={{171,-3},{152,-3}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(RRightMyo.q_in, rightVentricle.q_in) annotation (Line(
            points={{192,-3},{171,-3}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(heartRate.y, timeVaryingElastanceRight.HR) annotation (Line(
            points={{-241.75,36},{-34,36},{-34,35.6},{165.4,35.6}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(RRightMyo.q_out, pulmonaryValve.q_in) annotation (Line(
            points={{222,-3},{230,-3}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(pulmonaryValve.q_out, pulmonaryArtery.q_in) annotation (Line(
            points={{260,-3},{266,-3},{266,57},{243,57}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(pulmonaryArtery.q_in, RPulmonaryArtery.q_in) annotation (Line(
            points={{243,57},{243,58},{217.5,58}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(RPulmonaryArtery.q_out, pulmonaryArterialInertia.q_in)
          annotation (Line(
            points={{182.5,58},{173,58}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(pulmonaryArterialInertia.q_out, pulmonaryArterioles.q_in)
          annotation (Line(
            points={{143,58},{124,58}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(pulmonaryArterioles.q_in, RPulmonaryVeins.q_in) annotation (
            Line(
            points={{124,58},{-42,58},{-42,60},{-205,60}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(RPulmonaryVeins.q_out, pulmonaryVeinsInertia.q_in) annotation (
            Line(
            points={{-235,60},{-263,60}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(pulmonaryVeinsInertia.q_out, pulmonaryVeins.q_in) annotation (
            Line(
            points={{-293,60},{-296,60},{-296,-3},{-279,-3}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(pulmonaryVeins.q_in, mitralValve.q_in) annotation (Line(
            points={{-279,-3},{-258,-3}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(mitralValve.q_out, leftVentricle.q_in) annotation (Line(
            points={{-228,-3},{-209,-3}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(leftVentricle.q_in, RLeftMyo.q_in) annotation (Line(
            points={{-209,-3},{-196,-3}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(aorticValve.q_out, aorta.q_in) annotation (Line(
            points={{-128,-3},{-111,-3}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(RLeftMyo.q_out, aorticValve.q_in) annotation (Line(
            points={{-166,-3},{-158,-3}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        annotation(Diagram(coordinateSystem(extent={{-350,-100},{400,100}},      preserveAspectRatio=false,  grid = {2, 2}),
              graphics),                                                                                                    Icon(coordinateSystem(extent={{-350,
                  -100},{400,100}},                                                                                                    preserveAspectRatio = true, grid = {2, 2})),
          Documentation(info="<html>
<p>Model of cardiovascular system with pulsatile dynamics</p>
<ul>
<li>Javier Fernandez de Canete, P del Saz-Orozco, D Moreno-Boza, E Duran-Venegas (2013), <a href=\"http://www.mendeley.com/library/#\">Object-oriented modeling and simulation of the closed loop cardiovascular systemby using SIMSCAPE.</a> <i>Computers in biology and medicine</i> 43 (4) p. 323-33</li>
<li>Kulh&aacute;nek T, Tribula M, Kofr&aacute;nek J, Matej&aacute;k M. Simple models of the cardiovascular system for educational and research purposes<i>. MEFANET Journal 2014</i>. Available at WWW: http://mj.mefanet.cz/mj-04140914.</li>
</ul>
</html>",       revisions="<html>
<ul>
<li><i>Sep 2014 </i>by Tomas Kulhanek: <br>Created. </li>
</ul>
</html>"),experiment(StopTime=5));
      end PulsatileCirculation;

      package Parts "Utility components used by package KofranekModels2013"
        extends Modelica.Icons.UtilitiesPackage;
        model TimeVaryingElastance
          parameter Physiolibrary.Types.HydraulicElastance Ed
            "elastance of diastole";
          parameter Physiolibrary.Types.HydraulicElastance Es
            "elastance of systole";
          parameter Physiolibrary.Types.Pressure Pi0 "peak isovolumic pressure";
          Physiolibrary.Types.Time tm
            "relative time from the beginning of cardiac cycle";
          discrete Physiolibrary.Types.Time HP "heart period";
          discrete Physiolibrary.Types.Time t0
            "time of beginning of the cardiac cycle";
          discrete Physiolibrary.Types.Time ts "duration of systole";
          Real a;
          Physiolibrary.Types.RealIO.HydraulicComplianceOutput C
            annotation (Placement(transformation(extent={{-4,-102},{16,-82}}),
                iconTransformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={0,-90})));
                Physiolibrary.Types.HydraulicElastance E;
          Physiolibrary.Types.RealIO.PressureOutput Pi annotation (Placement(
                transformation(extent={{-72,-100},{-52,-80}}), iconTransformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={70,-90})));
          Physiolibrary.Types.RealIO.FrequencyInput HR "heart rate" annotation (Placement(
                transformation(extent={{-106,56},{-66,96}}), iconTransformation(extent={
                    {-106,56},{-66,96}})));
        equation
          tm = time - pre(t0);
          if (tm<pre(ts)) then
            a= (1-cos(2*Modelica.Constants.pi*tm/pre(ts)))/2;
          else
            a=0;
          end if;
          E=Ed+Es*a;
          C=1/E;
          Pi = Pi0*a;
          when {initial(), tm >= pre(HP)} then
            HP = 1/HR;
            t0= time;
            ts = 0.16+0.3*HP;
          end when;
          annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                    -100},{100,100}}),
                                 graphics={
                Rectangle(
                  extent={{-80,80},{80,-80}},
                  lineColor={0,0,255},
                  fillColor={170,255,255},
                  fillPattern=FillPattern.Solid),
                Line(
                  points={{-78,0},{-68,18},{-54,52},{-44,64},{-30,60},{-26,46}},
                  color={0,0,255},
                  smooth=Smooth.None),
                Line(
                  points={{-26,46},{-26,32},{-20,10},{-8,2},{36,2},{80,2}},
                  color={0,0,255},
                  smooth=Smooth.None),
                Text(
                  extent={{-70,98},{-22,80}},
                  lineColor={0,0,255},
                  textString="HR"),
                Text(
                  extent={{-74,-40},{40,-80}},
                  lineColor={0,0,255},
                  textString="Et"),
                Text(
                  extent={{42,-40},{100,-80}},
                  lineColor={0,0,255},
                  textString="Pi"),
                Text(
                  extent={{-272,16},{276,-40}},
                  lineColor={0,0,255},
                  textString="%name")}));
        end TimeVaryingElastance;
      end Parts;
    end Fernandez2013;
  end Examples;

  package Components
    extends Modelica.Icons.Package;
    model Conductor "Hydraulic resistor, where conductance=1/resistance"
     extends Hydraulic.Interfaces.OnePort;
     extends Icons.HydraulicResistor;

      parameter Boolean useConductanceInput = false
        "=true, if external conductance value is used"
        annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

      parameter Types.HydraulicConductance Conductance=0
        "Hydraulic conductance if useConductanceInput=false"
        annotation (Dialog(enable=not useConductanceInput));

      Types.RealIO.HydraulicConductanceInput cond(start=Conductance)=c if useConductanceInput
                                                       annotation (Placement(
            transformation(extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,60})));
    protected
       Types.HydraulicConductance c;
    equation
      if not useConductanceInput then
        c=Conductance;
      end if;
      q_in.q = c * (q_in.pressure - q_out.pressure);
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}),
                       graphics={Text(
              extent={{-220,-40},{200,-80}},
              lineColor={0,0,255},
              fillColor={58,117,175},
              fillPattern=FillPattern.Solid,
              textString="%name")}),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>", info="<html>
<p>This hydraulic conductance (resistance) element contains two connector sides. No hydraulic medium volume is changing in this element during simulation. That means that sum of flow in both connector sides is zero. The flow through element is determined by <b>Ohm&apos;s law</b>. It is used conductance (=1/resistance) because it could be numerical zero better then infinity in resistance. </p>
</html>"));
    end Conductor;

    model ElasticVessel "Elastic container for blood vessels, bladder, lumens"
     extends Icons.ElasticBalloon;
     extends SteadyStates.Interfaces.SteadyState(
                                        state_start=volume_start, storeUnit=
          "ml");
      Interfaces.HydraulicPort_a
                           q_in
                            annotation (Placement(
            transformation(extent={{-14,-14},{14,14}})));
      parameter Types.Volume volume_start = 1e-11 "Volume start value"
         annotation (Dialog(group="Initialization"));                                //default = 1e-5 ml
      Types.Volume excessVolume "Additional volume, that generate pressure";

       parameter Boolean useV0Input = false
        "=true, if zero-pressure-volume input is used"
        annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

       parameter Types.Volume ZeroPressureVolume = 1e-11
        "Maximal volume, that does not generate pressure if useV0Input=false"
        annotation (Dialog(enable=not useV0Input)); //default = 1e-5 ml

        parameter Types.Volume CollapsingPressureVolume = 1e-12
        "Maximal volume, which generate negative collapsing pressure"; //default = 1e-6 ml

       Types.RealIO.VolumeInput zeroPressureVolume(start=ZeroPressureVolume)= zpv if useV0Input
                                                        annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
            rotation=270,
            origin={-80,80})));
      parameter Boolean useComplianceInput = false
        "=true, if compliance input is used"
        annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));
      parameter Types.HydraulicCompliance Compliance = 1
        "Compliance if useComplianceInput=false"
        annotation (Dialog(enable=not useComplianceInput));

      Types.RealIO.HydraulicComplianceInput compliance(start=Compliance) = c if useComplianceInput
                                                            annotation (Placement(
            transformation(extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,80})));
      parameter Boolean useExternalPressureInput = false
        "=true, if external pressure input is used"
        annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));
      parameter Types.Pressure ExternalPressure=0
        "External pressure. Set zero if internal pressure is relative to external. Valid only if useExternalPressureInput=false."
        annotation (Dialog(enable=not useExternalPressureInput));
      parameter Types.Pressure MinimalCollapsingPressure = -101325;
      Types.RealIO.PressureInput externalPressure(start=ExternalPressure) = ep if useExternalPressureInput
                                                       annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
            rotation=270,
            origin={80,80})));

      Types.RealIO.VolumeOutput volume      annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,-100}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={60,-100})));

    protected
      Types.Volume zpv;
      Types.HydraulicCompliance c;
      Types.Pressure ep;
      parameter Types.Pressure a=MinimalCollapsingPressure/log(Modelica.Constants.eps);

    equation
      if not useV0Input then
        zpv=ZeroPressureVolume;
      end if;
      if not useComplianceInput then
        c=Compliance;
      end if;
      if not useExternalPressureInput then
        ep=ExternalPressure;
      end if;
      excessVolume = max( 0, volume - zpv);
      q_in.pressure =
      smooth(0, if noEvent(volume>CollapsingPressureVolume)
      then
      excessVolume/c + ep
     else
      a*log(max(Modelica.Constants.eps,volume/CollapsingPressureVolume))) + ep;
      //then: normal physiological state
      //else: abnormal collapsing state
      state = volume; // der(volume) =  q_in.q;
      change = q_in.q;
     // assert(volume>=-Modelica.Constants.eps,"Collapsing of vessels are not supported!");
     annotation (
        Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{
                100,100}}), graphics={Text(
              extent={{-318,-140},{160,-100}},
              textString="%name",
              lineColor={0,0,255})}),        Documentation(revisions="<html>
<p><i>2009-2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>", info="<html>
<p>Pressure can be generated by an elastic tissue surrounding some accumulated volume. Typically there is a threshold volume, below which the relative pressure is equal to external pressure and the wall of the blood vessels is not stressed. But if the volume rises above this value, the pressure increases proportionally. The slope in this pressure-volume characteristic is called &ldquo;Compliance&rdquo;.</p>
<ul>
<li>Increassing volume above ZeroPressureVolume (V0) generate positive pressure (greater than external pressure) lineary dependent on excess volume.</li>
<li>Decreasing volume below CollapsingPressureVolume (V00) generate negative pressure (lower than external pressure) logarithmicaly dependent on volume.</li>
<li>Otherwise external pressure is presented as pressure inside ElasticVessel.</li>
</ul>
<p><br><img src=\"modelica://Physiolibrary/Resources/Images/UserGuide/ElasticVessel_PV.png\"/></p>
</html>"));
    end ElasticVessel;

    model Pump "Prescribed volumetric flow"
      extends Hydraulic.Interfaces.OnePort;
      extends Chemical.Interfaces.ConditionalSolutionFlow;
    equation
      volumeFlowRate = q;
     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={
            Rectangle(
              extent={{-100,-40},{100,60}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-80,35},{80,10},{-80,-15},{-80,35}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-150,-90},{150,-50}},
              textString="%name",
              lineColor={0,0,255})}),        Documentation(revisions="<html>
<table>
<tr>
<td>Author:</td>
<td>Marek Matejak</td>
</tr>
<tr>
<td>Copyright:</td>
<td>In public domains</td>
</tr>
<tr>
<td>By:</td>
<td>Charles University, Prague, Czech Republic</td>
</tr>
<tr>
<td>Date of:</td>
<td>january 2009</td>
</tr>
</table>
</html>",     info="<html>
<p><font style=\"font-size: 9pt; \">This element needs to be connected only to next hydraulic elements, which contain calculation of hydraulic pressure in connector. It is because equation contains only </font><b><font style=\"font-size: 9pt; \">hydraulic volume flow</font></b><font style=\"font-size: 9pt; \"> variable, which is set to value of input signal variable. </font></p>
</html>"));
    end Pump;

    model HydrostaticColumn
      "Hydrostatic column pressure between two connectors (with specific muscle pump effect)"
      extends Icons.HydrostaticGradient;
      Hydraulic.Interfaces.HydraulicPort_a
                           q_up "Top site"
                             annotation (Placement(
            transformation(extent={{66,26},{94,54}})));
      Interfaces.HydraulicPort_a
                           q_down "Bottom site"
                             annotation (Placement(
            transformation(extent={{66,-74},{94,-46}})));
      parameter Boolean useHeightInput = false "=true, if height input is used"
        annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));
      parameter Types.Height H=0
        "Height of hydrostatic column if useHeightInput=false"
        annotation (Dialog(enable=not useFlowInput));

      Types.RealIO.HeightInput height(start=H)=h if useHeightInput
        "Vertical distance between top and bottom connector"
                                                   annotation (Placement(transformation(extent={{-20,-20},
                {20,20}},
            origin={-60,0})));
      parameter Modelica.SIunits.Density ro=1060; //liquid density
      parameter Boolean useExternalG = false
        "=true, if external gravity acceleration is used"
        annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));
      parameter Types.Acceleration GravityAcceleration = 9.81
        "Gravity acceleration if useExternalG=false"
        annotation (Dialog(enable=not useExternalG));
       //Blood density = 1060 kg/m3: Cutnell, John & Johnson, Kenneth. Physics, Fourth Edition. Wiley, 1998: 308.
      Types.RealIO.AccelerationInput G(start=GravityAcceleration)=g if useExternalG
        "Gravity acceleration"                                                                           annotation (Placement(transformation(extent={{-20,-20},
                {20,20}},
            rotation=90,
            origin={0,-100})));
      parameter Boolean usePumpEffect = false
        "=true, if musce pump effect is used"
        annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));
      Types.RealIO.FractionInput
                            pumpEffect(start=PumpEffect)=pe if       usePumpEffect      annotation (Placement(transformation(extent={{-20,-20},
                {20,20}},
            rotation=270,
            origin={0,100})));
    protected
      parameter Types.Fraction PumpEffect = 1
        "Pump effect if usePumpEffect=false"
        annotation (Dialog(enable=not usePumpEffect));
    protected
      Types.Acceleration g;
      Types.Fraction pe;
      Types.Height h;
    equation
      if not useHeightInput then
        h=H;
      end if;
      if not useExternalG then
        g=GravityAcceleration;
      end if;
      if not usePumpEffect then
        pe = PumpEffect;
     end if;
      q_down.pressure = q_up.pressure + g*ro*h*pe;
      q_up.q + q_down.q = 0;
     annotation (
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>", info="<html>
<p>The hydrostatic pressure is proportional to height of the column.&nbsp;</p>
</html>"));
    end HydrostaticColumn;

    model ElasticMembrane "Interaction between internal and external cavities"
     extends SteadyStates.Interfaces.SteadyState(
                                        state_start=volume_start, storeUnit=
          "ml");
     extends Icons.InternalElasticBalloon;
      Interfaces.HydraulicPort_a
                           q_int "Internal space"
        annotation (Placement(transformation(extent={{-94,-14},{-66,14}})));
      Interfaces.HydraulicPort_b
                           q_ext "External space" annotation (Placement(transformation(extent={{26,-14},
                {54,14}})));
     parameter Types.HydraulicCompliance Compliance "Compliance";
     parameter Types.Volume zeroPressureVolume=0
        "Maximal volume, that does not generate pressure";
     parameter Types.Volume volume_start=0 "Volume start value"
         annotation (Dialog(group="Initialization"));
     Types.Volume volume;
     Types.Volume stressedVolume;

     parameter Types.Volume NominalVolume=1e-6
        "Scale numerical calculation from quadratic meter to miniliters.";
    equation
      q_int.q + q_ext.q = 0;
      q_int.pressure = (stressedVolume/Compliance) + q_ext.pressure;
      stressedVolume = max(volume-zeroPressureVolume,0);
      state = volume; // der(volume) =  q_int.q;
      change = q_int.q;
      // assert(volume>=-Modelica.Constants.eps,"Totally collapsed compartments are not supported!");
      annotation (        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end ElasticMembrane;

    model Inertia "Inertia of the volumetric flow"
      extends SteadyStates.Interfaces.SteadyState(
                                         state_start=volumeFlow_start,
        storeUnit="ml/min");
      extends Interfaces.OnePort;
      extends Icons.Inertance;
      parameter Types.VolumeFlowRate volumeFlow_start=0.3
        "Volumetric flow start value"
         annotation (Dialog(group="Initialization"));                                                          //5 l/min is normal volumetric flow in aorta

      parameter Types.HydraulicInertance I "Inertance";

    equation
      state = q_in.q;      // I*der(q_in.q) = (q_in.pressure - q_out.pressure);
      change = (q_in.pressure - q_out.pressure)/I;
      annotation (                Documentation(info="<html>
<p>Inertance I of the simple tube could be calculated as I=ro*l/A, where ro is fuid density, l is tube length and A is tube cross-section area.</p>
</html>", revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end Inertia;

    model Reabsorption "Divide inflow to outflow and reabsorption"
      import Physiolibrary;
      extends Icons.Reabsorption;

      Hydraulic.Interfaces.HydraulicPort_a
                           Inflow                    annotation (Placement(
            transformation(extent={{-114,26},{-86,54}})));
      Hydraulic.Interfaces.HydraulicPort_b
                           Outflow
        annotation (Placement(transformation(extent={{86,26},{114,54}})));
      Hydraulic.Interfaces.HydraulicPort_b
                           Reabsorption                annotation (Placement(
            transformation(extent={{-14,-114},{14,-86}})));
      Types.RealIO.FractionInput FractReab
                                   annotation (Placement(transformation(extent={{-100,
                -60},{-60,-20}})));
      parameter Boolean useExternalOutflowMin = false
        "=true, if minimal outflow is garanted"
        annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));
      parameter Types.VolumeFlowRate OutflowMin = 0
        "Minimal outflow if useExternalOutflowMin=false"
        annotation (Dialog(enable=not useExternalOutflowMin));

      Types.RealIO.VolumeFlowRateInput outflowMin(start=OutflowMin) = om if useExternalOutflowMin
                                                           annotation (Placement(transformation(extent={{-20,-20},
                {20,20}},
            rotation=270,
            origin={40,80})));
    protected
       Types.VolumeFlowRate om;
    equation
      if not useExternalOutflowMin then
        om = OutflowMin;
      end if;
      Inflow.pressure = Outflow.pressure;
      0 = Inflow.q + Outflow.q + Reabsorption.q;
     // assert(Inflow.q>=-Modelica.Constants.eps,"Only one directional flow is supported!");
      Reabsorption.q = -max(0,FractReab*(Inflow.q-om));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},
                {100,100}}),       graphics={Text(
              extent={{-100,130},{100,108}},
              lineColor={0,0,255},
              textString="%name")}),        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>",     info="<html>
<p><h4><font color=\"#008000\">Hydraulic Reabsorption</font></h4></p>
<p>If useOutflowMin=false then the next schema is used.</p>
<p><ul>
<li><img src=\"modelica://Physiolibrary/Resources/Images/UserGuide/HydraulicReabsorption.png\"/></li>
</ul></p>
<p><br/>If  useOutflowMin=true then the extended schema is used:</p>
<p><ul>
<li><img src=\"modelica://Physiolibrary/Resources/Images/UserGuide/HydraulicReabsorptionWithOutflowMin.png\"/></li>
</ul></p>
</html>"));
    end Reabsorption;

    model IdealValve
      extends Interfaces.OnePort;
       Boolean open(start=true) "Switching state";
       Real passableVariable(start=0, final unit="1")
        "Auxiliary variable for actual position on the ideal diode characteristic";
      /*  = 0: knee point
      < 0: below knee point, diode locking
      > 0: above knee point, diode conducting */
      parameter Types.HydraulicConductance _Gon(final min=0, displayUnit="l/(mmHg.min)") = 1.2501026264094e-02
        "Forward state-on conductance (open valve conductance)"
        annotation (Dialog(enable=not useLimitationInputs)); //= the same as resistance 1e-5 mmHg/(l/min)
      parameter Types.HydraulicConductance _Goff(final min=0, displayUnit="l/(mmHg.min)") = 1.2501026264094e-12
        "Backward state-off conductance (closed valve conductance)"
        annotation (Dialog(enable=not useLimitationInputs)); //= 1e-5 (l/min)/mmHg
      parameter Types.Pressure Pknee(final min=0, start=0)
        "Forward threshold pressure";
      parameter Boolean useLimitationInputs = false
        "=true, if Gon and Goff are from inputs"
        annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));
      Types.RealIO.HydraulicConductanceInput Gon(start=_Gon)=gon if useLimitationInputs
        "open valve conductance = infinity for ideal case" annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={-60,100})));
      Types.RealIO.HydraulicConductanceInput Goff(start=_Goff)=goff if useLimitationInputs
        "closed valve conductance = zero for ideal case" annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={60,100})));
    protected
      Types.HydraulicConductance gon,goff;
      constant Types.Pressure unitPressure=1;
      constant Types.VolumeFlowRate unitFlow=1;
    equation
      if not useLimitationInputs then
        gon = _Gon;
        goff = _Goff;
      end if;
      open = passableVariable > Modelica.Constants.eps;
      dp = (passableVariable*unitFlow)*(if open then 1/gon else 1) + Pknee;
      volumeFlowRate = (passableVariable*unitPressure)*(if open then 1 else goff) + goff*Pknee;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),
                             graphics={Polygon(
              points={{-76,66},{-76,-82},{34,-10},{34,12},{-66,68},{-76,74},{
                  -76,66}},
              lineColor={0,0,127},
              smooth=Smooth.None,
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid), Rectangle(
              extent={{40,96},{68,-94}},
              lineColor={0,0,127},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-188,-96},{192,-118}},
              lineColor={255,0,0},
              fillPattern=FillPattern.Sphere,
              fillColor={255,85,85},
              textString="%name")}),
        Documentation(info="<html>
<p>Ideal Valve allows a volumetric flow in one direction in case of pressure gradient is greater. </p>
</html>", revisions="<html>
<p><i>2014</i></p>
<p>Tomas Kulhanek, Charles University, Prague, Czech Republic </p>
</html>"));
    end IdealValve;
  end Components;

  package Sensors
    extends Modelica.Icons.SensorsPackage;
    model FlowMeasure "Volumetric flow between ports"
      extends Interfaces.OnePort;
      extends Icons.FlowMeasure;

      Types.RealIO.VolumeFlowRateOutput volumeFlow "Actual volume flow rate"
                             annotation (Placement(transformation(extent={{-20,-20},
                {20,20}},
            rotation=270,
            origin={0,-60}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={0,120})));
    equation
      q_out.pressure = q_in.pressure;
      volumeFlow = q_in.q;
      annotation (
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),     Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),
                             graphics={
            Line(
              points={{-60,80},{80,80},{62,60}},
              color={0,0,255},
              smooth=Smooth.None),
            Line(
              points={{62,100},{80,80}},
              color={0,0,255},
              smooth=Smooth.None),
            Rectangle(
              extent={{-100,14},{-70,-14}},
              pattern=LinePattern.None,
              fillColor={190,0,0},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{70,14},{100,-14}},
              pattern=LinePattern.None,
              fillColor={190,0,0},
              fillPattern=FillPattern.Solid)}));
    end FlowMeasure;

    model PressureMeasure "Hydraulic pressure at port"
      extends Icons.PressureMeasure;
      Interfaces.HydraulicPort_a
                           q_in annotation (Placement(
            transformation(extent={{-60,-80},{-20,-40}})));
      Types.RealIO.PressureOutput pressure "Pressure"
                             annotation (Placement(transformation(extent={{40,-60},
                {80,-20}})));
    equation
      pressure = q_in.pressure;
      q_in.q = 0;
     annotation (
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end PressureMeasure;
  end Sensors;

  package Sources
    extends Modelica.Icons.SourcesPackage;
    model UnlimitedPump "Prescribed flow at port"
      extends Chemical.Interfaces.ConditionalSolutionFlow;
      Interfaces.HydraulicPort_b
                           q_out
                             annotation (Placement(
            transformation(extent={{86,-14},{114,14}})));
    equation
      q_out.q = - q;
     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={
            Rectangle(
              extent={{-100,-50},{100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-80,25},{80,0},{-80,-25},{-80,25}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-150,-94},{150,-54}},
              textString="%name",
              lineColor={0,0,255})}),        Documentation(revisions="<html>
<table>
<tr>
<td>Author:</td>
<td>Marek Matejak</td>
</tr>
<tr>
<td>Copyright:</td>
<td>In public domains</td>
</tr>
<tr>
<td>By:</td>
<td>Charles University, Prague, Czech Republic</td>
</tr>
<tr>
<td>Date of:</td>
<td>january 2009</td>
</tr>
</table>
</html>",     info="<html>
<p><font style=\"font-size: 9pt; \">This element needs to be connected only to next hydraulic elements, which contain calculation of hydraulic pressure in connector. It is because equation contains only </font><b><font style=\"font-size: 9pt; \">hydraulic volume flow</font></b><font style=\"font-size: 9pt; \"> variable, which is set to value of input signal variable. </font></p>
</html>"));
    end UnlimitedPump;

      model UnlimitedVolume "Prescribed pressure at port"
        parameter Boolean usePressureInput = false
        "=true, if pressure input is used"
          annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Types.Pressure P=0
        "Hydraulic pressure if usePressureInput=false"
          annotation (Dialog(enable=not usePressureInput));

        Types.RealIO.PressureInput pressure(start=P)=p if usePressureInput
        "Pressure"
          annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));
        Interfaces.HydraulicPort_a
                             y "PressureFlow output connectors"
          annotation (Placement(transformation(extent={{84,-16},{116,16}})));
       parameter Boolean isIsolatedInSteadyState = true
        "=true, if there is no flow at port in steady state"
          annotation (Dialog(group="Simulation",tab="Equilibrium"));
       parameter Types.SimulationType  Simulation=Types.SimulationType.NormalInit
        "If in equilibrium, then zero-flow equation is added."
          annotation (Dialog(group="Simulation",tab="Equilibrium"));
    protected
        Types.Pressure p;
      initial equation
        if isIsolatedInSteadyState and (Simulation==Types.SimulationType.InitSteadyState) then
          y.q = 0;
        end if;
      equation
        if not usePressureInput then
          p=P;
        end if;
        y.pressure = p;
        if isIsolatedInSteadyState and (Simulation==Types.SimulationType.SteadyState) then
           y.q = 0;
        end if;
        annotation (Documentation(info="<html>
<p>Model has a vector of continuous Real input signals as pressures for vector of pressure-flow connectors. </p>
<p>Usage in tests: Set defaul volume&GT;0 and try to set STEADY in instances to &QUOT;false&QUOT;!</p>
</html>",revisions=
           "<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}),
                          graphics={
              Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,0},
              pattern=LinePattern.None,
              fillColor={170,255,255},
              fillPattern=FillPattern.Backward),
              Text(
                extent={{0,0},{-100,-100}},
                lineColor={0,0,0},
              textString="P"),
              Line(
                points={{-100,0},{56,0}},
                color={191,0,0},
                thickness=0.5),
              Polygon(
                points={{38,-20},{38,20},{78,0},{38,-20}},
                lineColor={191,0,0},
                fillColor={191,0,0},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-150,150},{150,110}},
                textString="%name",
                lineColor={0,0,255})}));
      end UnlimitedVolume;

    model UnlimitedOutflowPump "Prescribed flow at port"
      extends Chemical.Interfaces.ConditionalSolutionFlow;
      Interfaces.HydraulicPort_a q_in annotation (Placement(transformation(extent={{
                -114,-14},{-86,14}}), iconTransformation(extent={{-114,-14},{-86,14}})));
    equation
      q_in.q = q;
     annotation (
        Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,100}}),
                            graphics={
            Rectangle(
              extent={{-100,-50},{100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-80,25},{80,0},{-80,-25},{-80,25}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-150,-94},{150,-54}},
              textString="%name",
              lineColor={0,0,255})}),        Documentation(revisions="<html>
<table>
<tr>
<td>Author:</td>
<td>Marek Matejak</td>
</tr>
<tr>
<td>Copyright:</td>
<td>In public domains</td>
</tr>
<tr>
<td>By:</td>
<td>Charles University, Prague, Czech Republic</td>
</tr>
<tr>
<td>Date of:</td>
<td>january 2009</td>
</tr>
</table>
</html>",     info="<html>
<p><font style=\"font-size: 9pt; \">This element needs to be connected only to next hydraulic elements, which contain calculation of hydraulic pressure in connector. It is because equation contains only </font><b><font style=\"font-size: 9pt; \">hydraulic volume flow</font></b><font style=\"font-size: 9pt; \"> variable, which is set to value of input signal variable. </font></p>
</html>"));
    end UnlimitedOutflowPump;
  end Sources;

  package Interfaces
    extends Modelica.Icons.InterfacesPackage;
    connector HydraulicPort
      "Hydraulical connector with pressure and volumetric flow"
      Types.Pressure pressure "Pressure";
      flow Types.VolumeFlowRate q "Volume flow";
      annotation (Documentation(revisions="<html>
<table>
<tr>
<td>Author:</td>
<td>Marek Matejak</td>
</tr>
<tr>
<td>Copyright:</td>
<td>In public domains</td>
</tr>
<tr>
<td>By:</td>
<td>Charles University, Prague, Czech Republic</td>
</tr>
<tr>
<td>Date of:</td>
<td>january 2009-2013</td>
</tr>
</table>
</html>",
        info="<html>
<p><font style=\"font-size: 9pt; \">This connector connects hydraulic domains elements. The elements contains one equation for each his pressure-flow connector. The equation defines relation between variables in the connector. Variables are hydraulic pressure and volume flow of hydraulic medium. The pressure is the same in each connector that are connected together. The sum of flow in connectors connected together is zero (</font><b><font style=\"font-size: 9pt; \">Kirchhoff&apos;s circuit laws</font></b><font style=\"font-size: 9pt; \">).</font> </p>
</html>"));
    end HydraulicPort;

    connector HydraulicPort_a "Hydraulical inflow connector"
      extends HydraulicPort;
    annotation (
        defaultComponentName="port_a",
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Rectangle(
              extent={{-20,10},{20,-10}},
              lineColor={0,0,0},
              lineThickness=1), Polygon(
              points={{-1.22465e-014,100},{100,1.22465e-014},{1.22465e-014,-100},
                  {-100,-1.22465e-014},{-1.22465e-014,100}},
              lineColor={0,0,0},
              smooth=Smooth.None,
              fillPattern=FillPattern.Solid,
              fillColor={0,0,0},
              rotation=180)}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Polygon(
              points={{0,50},{50,0},{0,-50},{-50,0},{0,50}},
              lineColor={0,0,0},
              smooth=Smooth.None,
              fillPattern=FillPattern.Solid,
              fillColor={0,0,0}),Text(extent={{-112,118},{88,58}},   lineColor = {0,0,0}, textString = "%name")}),
        Documentation(info="<html>
<p>
Connector with one flow signal of type Real.
</p>
</html>",
        revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end HydraulicPort_a;

    connector HydraulicPort_b "Hydraulical outflow connector"
      extends HydraulicPort;
    annotation (
        defaultComponentName="port_b",
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Rectangle(
              extent={{-20,10},{20,-10}},
              lineColor={0,0,0},
              lineThickness=1), Polygon(
              points={{0,100},{100,0},{0,-100},{-100,0},{0,100}},
              lineColor={0,0,0},
              smooth=Smooth.None,
              fillPattern=FillPattern.Solid,
              fillColor={200,200,200})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Polygon(
              points={{0,50},{50,0},{0,-50},{-50,0},{0,50}},
              lineColor={0,0,0},
              smooth=Smooth.None,
              fillPattern=FillPattern.Solid,
              fillColor={200,200,200}),Text(extent = {{-160,110},{40,50}}, lineColor = {0,0,0}, textString = "%name")}));
    end HydraulicPort_b;

    partial model OnePort "Hydraulical OnePort"
      HydraulicPort_a      q_in "Volume inflow" annotation (Placement(
            transformation(extent={{-114,-14},{-86,14}})));
      HydraulicPort_b      q_out "Volume outflow"
                             annotation (Placement(
            transformation(extent={{86,-14},{114,14}})));
       Types.VolumeFlowRate volumeFlowRate "Volumetric flow";
       Types.Pressure dp "Pressure gradient";
    equation
      q_in.q + q_out.q = 0;
      volumeFlowRate = q_in.q;
      dp = q_in.pressure - q_out.pressure;
    end OnePort;
  end Interfaces;
  annotation (Documentation(revisions="<html>
<p>Licensed by Marek Matejak under the Modelica License 2</p>
<p>Copyright &copy; 2008-2014, Marek Matejak, Charles University in Prague.</p>
<p><br><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Physiolibrary.UsersGuide.ModelicaLicense2\">UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p>
</html>", info="<html>
<p>The main usage of the hydraulic domain in human physiology is modeling of the cardio-vascular system. And because there are no extreme thermodynamic conditions, the system can be really simple &mdash;it is only necessary to model conditions for incompressible water, at normal liquid-water temperatures and with relative pressure 5-20kPa. This boring thermodynamic state leads to the very simple blocks of hydraulic resistance, hydrostatic pressure, volumetric flow, inertia and finally the block of blood accumulation in elastic vessels.</p>
</html>"));
end Hydraulic;

within Physiolibrary;
package Hydraulic "Domain with Pressure and Volumetric Flow"
 extends Modelica.Icons.Package;
  package Examples
    "Examples that demonstrate usage of the Pressure flow components"
  extends Modelica.Icons.ExamplesPackage;

    model Windkessel "Minimal circulation models driven by cardiac output"
       extends Modelica.Icons.Example;

      Modelica.Blocks.Sources.Pulse pulse(
        width=25,
        amplitude=3.3e-4,
        period=60/75)
        annotation (Placement(transformation(extent={{-94,74},{-74,94}})));
      Sources.UnlimitedPump heart1(useSolutionFlowInput=true)
        annotation (Placement(transformation(extent={{-50,38},{-30,58}})));
      Components.ElasticVessel
                     arteries1(
        volume_start(displayUnit="l") = 0.001,
        ZeroPressureVolume(displayUnit="l") = 0.00085,
        Compliance(displayUnit="ml/mmHg") = 1.1625954425608e-08)
        annotation (Placement(transformation(extent={{-14,38},{6,58}})));
      Components.Conductor resistance1(Conductance(displayUnit="l/(mmHg.min)") = 6.2755151845753e-09)
        annotation (Placement(transformation(extent={{22,38},{42,58}})));
      Sources.UnlimitedVolume veins1 annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={76,48})));
    equation
      connect(resistance1.q_out, veins1.y) annotation (Line(
          points={{42,48},{66,48}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(arteries1.q_in, resistance1.q_in) annotation (Line(
          points={{-4,48},{22,48}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(heart1.q_out, arteries1.q_in) annotation (Line(
          points={{-30,48},{-4,48}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pulse.y, heart1.solutionFlow) annotation (Line(
          points={{-73,84},{-40,84},{-40,52}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Text(
              extent={{-34,74},{86,64}},
              lineColor={175,175,175},
              textString="Windkessel model driven by cardiac output")}),
          Documentation(revisions="<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),
        experiment(StopTime=10));
    end Windkessel;

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
          points={{-73,84},{-62,84},{-62,-26},{4,-26},{4,-36}},
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
        experiment(StopTime=10));
    end MinimalCirculation;

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
      Physiolibrary.Types.Constants.VolumeFlowRateConst RNormalCO(k(displayUnit="l/min") = 8.3333333333333e-05)
        annotation (Placement(transformation(extent={{-60,40},{-52,48}})));
      Sensors.PressureMeasure
                      pressureMeasure1
        annotation (Placement(transformation(extent={{-8,26},{12,46}})));
      Components.Pump
           leftHeart(useSolutionFlowInput=true)
        annotation (Placement(transformation(extent={{16,6},{36,26}})));
      Physiolibrary.Types.Constants.VolumeFlowRateConst LNormalCO(k(displayUnit="l/min") = 8.3333333333333e-05)
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
      Physiolibrary.Blocks.Factors.Spline       rightStarling(data={{-6,0,0},{-3,0.15,0.104},{-1,0.52,
            0.48},{2,1.96,0.48},{4,2.42,0.123},{8,2.7,0}})
        "At filling pressure 0mmHg (because external thorax pressure is -4mmHg) is normal cardiac output (effect=1)."
        annotation (Placement(transformation(extent={{-56,22},{-36,42}})));
      Physiolibrary.Blocks.Factors.Spline       leftStarling(data={{-4,0,0},{-1,
            0.72,0.29},{0,1.01,0.29},{3,1.88,0.218333},{10,2.7,0}})
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
      connect(pressureMeasure.actualPressure, rightStarling.u) annotation (Line(
          points={{-62,32},{-54,32}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(LNormalCO.y, leftStarling.yBase) annotation (Line(
          points={{21,46},{26,46},{26,34}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pressureMeasure1.actualPressure, leftStarling.u) annotation (Line(
          points={{8,32},{18,32}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pressureMeasure.q_in, rightAtrium.q_in) annotation (Line(
          points={{-72,30},{-72,18}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(rightHeart.solutionFlow, rightStarling.y) annotation (Line(
          points={{-46,22},{-46,28}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(leftStarling.y, leftHeart.solutionFlow) annotation (Line(
          points={{26,28},{26,20}},
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

  end Examples;

  package Components
    extends Modelica.Icons.Package;

    model Conductor "Hydraulic resistor, where conductance=1/resistance"
     extends Physiolibrary.Hydraulic.Interfaces.OnePort;
     extends Physiolibrary.Icons.HydraulicResistor;

      parameter Boolean useConductanceInput = false
        "=true, if external conductance value is used"
        annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

      parameter Physiolibrary.Types.HydraulicConductance Conductance=0
        "Hydraulic conductance if useConductanceInput=false"
        annotation (Dialog(enable=not useConductanceInput));

      Physiolibrary.Types.RealIO.HydraulicConductanceInput cond(start=Conductance)=c if useConductanceInput
                                                       annotation (Placement(
            transformation(extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,60})));

    protected
       Physiolibrary.Types.HydraulicConductance c;
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
     extends Physiolibrary.SteadyStates.Interfaces.SteadyState(
                                        state_start=volume_start, storeUnit=
          "ml");

      Interfaces.HydraulicPort_a
                           q_in
                            annotation (Placement(
            transformation(extent={{-14,-14},{14,14}})));
      parameter Physiolibrary.Types.Volume volume_start = 1e-11
        "Volume start value"
         annotation (Dialog(group="Initialization"));                                //default = 1e-5 ml

      Physiolibrary.Types.Volume excessVolume
        "Additional volume, that generate pressure";

       parameter Boolean useV0Input = false
        "=true, if zero-pressure-volume input is used"
        annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

       parameter Physiolibrary.Types.Volume ZeroPressureVolume = 1e-11
        "Maximal volume, that does not generate pressure if useV0Input=false"
        annotation (Dialog(enable=not useV0Input)); //default = 1e-5 ml

        parameter Physiolibrary.Types.Volume CollapsingPressureVolume = 1e-12
        "Maximal volume, which generate negative collapsing pressure"; //default = 1e-6 ml

       Physiolibrary.Types.RealIO.VolumeInput zeroPressureVolume(start=ZeroPressureVolume)= zpv if useV0Input
                                                        annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
            rotation=270,
            origin={-80,80})));

      parameter Boolean useComplianceInput = false
        "=true, if compliance input is used"
        annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));
      parameter Physiolibrary.Types.HydraulicCompliance Compliance = 1
        "Compliance if useComplianceInput=false"
        annotation (Dialog(enable=not useComplianceInput));

      Physiolibrary.Types.RealIO.HydraulicComplianceInput compliance(start=Compliance) = c if useComplianceInput
                                                            annotation (Placement(
            transformation(extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,80})));

      parameter Boolean useExternalPressureInput = false
        "=true, if external pressure input is used"
        annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));
      parameter Physiolibrary.Types.Pressure ExternalPressure=0
        "External pressure. Set zero if internal pressure is relative to external. Valid only if useExternalPressureInput=false."
        annotation (Dialog(enable=not useExternalPressureInput));

      Physiolibrary.Types.RealIO.PressureInput externalPressure(start=ExternalPressure) = ep if useExternalPressureInput
                                                       annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
            rotation=270,
            origin={80,80})));

      Physiolibrary.Types.RealIO.VolumeOutput volume
                                            annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,-100})));

    protected
      Physiolibrary.Types.Volume zpv;
      Physiolibrary.Types.HydraulicCompliance c;
      Physiolibrary.Types.Pressure ep;

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
      log(max(Modelica.Constants.eps,volume/CollapsingPressureVolume)));
      //then: normal physiological state
      //else: abnormal collapsing state

      state = volume; // der(volume) =  q_in.q;
      change = q_in.q;

     // assert(volume>=-Modelica.Constants.eps,"Collapsing of vessels are not supported!");

     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}),     graphics={Text(
              extent={{-240,-150},{238,-110}},
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
      extends Physiolibrary.Hydraulic.Interfaces.OnePort;
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
      extends Physiolibrary.Icons.HydrostaticGradient;
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a
                           q_up "Top site"
                             annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{66,26},{94,54}})));

      Interfaces.HydraulicPort_a
                           q_down "Bottom site"
                             annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{66,-74},{94,-46}})));

      parameter Boolean useHeightInput = false "=true, if height input is used"
        annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

      parameter Physiolibrary.Types.Height H=0
        "Height of hydrostatic column if useHeightInput=false"
        annotation (Dialog(enable=not useFlowInput));

      Physiolibrary.Types.RealIO.HeightInput height(start=H)=h if useHeightInput
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

      Physiolibrary.Types.RealIO.AccelerationInput G(start=GravityAcceleration)=g if useExternalG
        "Gravity acceleration"                                                                           annotation (Placement(transformation(extent={{-20,-20},
                {20,20}},
            rotation=90,
            origin={0,-100})));

      parameter Boolean usePumpEffect = false
        "=true, if musce pump effect is used"
        annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

      Physiolibrary.Types.RealIO.FractionInput
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
     extends Physiolibrary.SteadyStates.Interfaces.SteadyState(
                                        state_start=volume_start, storeUnit=
          "ml");
     extends Icons.InternalElasticBalloon;
      Interfaces.HydraulicPort_a
                           q_int "Internal space"
        annotation (Placement(transformation(extent={{-94,-14},{-66,14}})));
      Interfaces.HydraulicPort_b
                           q_ext "External space" annotation (Placement(transformation(extent={{26,-14},
                {54,14}})));

     parameter Physiolibrary.Types.HydraulicCompliance Compliance "Compliance";
     parameter Physiolibrary.Types.Volume zeroPressureVolume=0
        "Maximal volume, that does not generate pressure";
     parameter Physiolibrary.Types.Volume volume_start=0 "Volume start value"
         annotation (Dialog(group="Initialization"));
     Physiolibrary.Types.Volume volume;
     Physiolibrary.Types.Volume stressedVolume;

     parameter Physiolibrary.Types.Volume NominalVolume=1e-6
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
      extends Physiolibrary.SteadyStates.Interfaces.SteadyState(
                                         state_start=volumeFlow_start,
        storeUnit="ml/min");
      extends Interfaces.OnePort;
      extends Icons.Inertance;

      parameter Physiolibrary.Types.VolumeFlowRate volumeFlow_start=0.3
        "Volumetric flow start value"
         annotation (Dialog(group="Initialization"));                                                          //5 l/min is normal volumetric flow in aorta

      parameter Physiolibrary.Types.HydraulicInertance I "Inertance";

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
      extends Physiolibrary.Icons.Reabsorption;

      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a
                           Inflow                    annotation (Placement(
            transformation(extent={{-114,26},{-86,54}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b
                           Outflow
        annotation (Placement(transformation(extent={{86,26},{114,54}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b
                           Reabsorption                annotation (Placement(
            transformation(extent={{-14,-114},{14,-86}})));

      Physiolibrary.Types.RealIO.FractionInput FractReab
                                   annotation (Placement(transformation(extent={{-100,
                -60},{-60,-20}})));

      parameter Boolean useExternalOutflowMin = false
        "=true, if minimal outflow is garanted"
        annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

      parameter Physiolibrary.Types.VolumeFlowRate OutflowMin = 0
        "Minimal outflow if useExternalOutflowMin=false"
        annotation (Dialog(enable=not useExternalOutflowMin));

      Physiolibrary.Types.RealIO.VolumeFlowRateInput outflowMin(start=OutflowMin) = om if useExternalOutflowMin
                                                           annotation (Placement(transformation(extent={{-20,-20},
                {20,20}},
            rotation=270,
            origin={40,80})));

    protected
       Physiolibrary.Types.VolumeFlowRate om;
    equation
      if not useExternalOutflowMin then
        om = OutflowMin;
      end if;

      Inflow.pressure = Outflow.pressure;
      0 = Inflow.q + Outflow.q + Reabsorption.q;

     // assert(Inflow.q>=-Modelica.Constants.eps,"Only one directional flow is supported!");

      Reabsorption.q = -max(0,FractReab*(Inflow.q-OutflowMin));
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

      parameter Physiolibrary.Types.HydraulicConductance _Gon(final min=0, displayUnit="l/(mmHg.min)") = 1.2501026264094e-02
        "Forward state-on conductance (open valve conductance)"
        annotation (Dialog(enable=not useLimitationInputs)); //= the same as resistance 1e-5 mmHg/(l/min)
      parameter Physiolibrary.Types.HydraulicConductance _Goff(final min=0, displayUnit="l/(mmHg.min)") = 1.2501026264094e-12
        "Backward state-off conductance (closed valve conductance)"
        annotation (Dialog(enable=not useLimitationInputs)); //= 1e-5 (l/min)/mmHg
      parameter Physiolibrary.Types.Pressure Pknee(final min=0, start=0)
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
      Physiolibrary.Types.HydraulicConductance gon,goff;
      constant Physiolibrary.Types.Pressure unitPressure=1;
      constant Physiolibrary.Types.VolumeFlowRate unitFlow=1;

    equation
      if not useLimitationInputs then
        gon = _Gon;
        goff = _Goff;
      end if;

      open = passableVariable > 0;

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

      Physiolibrary.Types.RealIO.VolumeFlowRateOutput actualFlow
        "Actual volume flow rate"
                             annotation (Placement(transformation(extent={{-20,-20},
                {20,20}},
            rotation=270,
            origin={0,-60})));
    equation
      q_out.pressure = q_in.pressure;

      actualFlow = q_in.q;

     annotation (
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end FlowMeasure;

    model PressureMeasure "Hydraulic pressure at port"
      extends Icons.PressureMeasure;

      Interfaces.HydraulicPort_a
                           q_in annotation (Placement(
            transformation(extent={{-60,-80},{-20,-40}})));
      Physiolibrary.Types.RealIO.PressureOutput actualPressure
        "Actual pressure"    annotation (Placement(transformation(extent={{40,-60},
                {80,-20}})));
    equation

      actualPressure = q_in.pressure;
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
        import Physiolibrary.Types.*;

        parameter Boolean usePressureInput = false
        "=true, if pressure input is used"
          annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Pressure P=0 "Hydraulic pressure if usePressureInput=false"
          annotation (Dialog(enable=not usePressureInput));

        RealIO.PressureInput pressure(start=P)=p if usePressureInput "Pressure"
          annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));

        Interfaces.HydraulicPort_a
                             y "PressureFlow output connectors"
          annotation (Placement(transformation(extent={{84,-16},{116,16}})));

       parameter Boolean isIsolatedInSteadyState = true
        "=true, if there is no flow at port in steady state"
          annotation (Dialog(group="Simulation",tab="Equilibrium"));

       parameter Physiolibrary.Types.SimulationType  Simulation=SimulationType.NormalInit
        "If in equilibrium, then zero-flow equation is added."
          annotation (Dialog(group="Simulation",tab="Equilibrium"));

    protected
        Pressure p;

      initial equation
        if isIsolatedInSteadyState and (Simulation==SimulationType.InitSteadyState) then
          y.q = 0;
        end if;

      equation
        if not usePressureInput then
          p=P;
        end if;

        y.pressure = p;

        if isIsolatedInSteadyState and (Simulation==SimulationType.SteadyState) then
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
      Physiolibrary.Types.Pressure pressure "Pressure";
      flow Physiolibrary.Types.VolumeFlowRate q "Volume flow";
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
              fillColor={0,0,0}),Text(extent = {{-160,110},{40,50}}, lineColor = {0,0,0}, textString = "%name")}),
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

       Physiolibrary.Types.VolumeFlowRate volumeFlowRate "Volumetric flow";
       Physiolibrary.Types.Pressure dp "Pressure gradient";
    equation
      q_in.q + q_out.q = 0;

      volumeFlowRate = q_in.q;
      dp = q_in.pressure - q_out.pressure;
    end OnePort;
  end Interfaces;
  annotation (Documentation(revisions="<html>
<p>Licensed by Marek Matejak under the Modelica License 2</p>
<p>Copyright &copy; 2008-2014, Marek Matejak, Charles University in Prague.</p>
<p><br><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Physiolibrary.UsersGuide.ModelicaLicense2\">Physiolibrary.UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p>
</html>", info="<html>
<p>The main usage of the hydraulic domain in human physiology is modeling of the cardio-vascular system. And because there are no extreme thermodynamic conditions, the system can be really simple &mdash;it is only necessary to model conditions for incompressible water, at normal liquid-water temperatures and with relative pressure 5-20kPa. This boring thermodynamic state leads to the very simple blocks of hydraulic resistance, hydrostatic pressure, volumetric flow, inertia and finally the block of blood accumulation in elastic vessels.</p>
</html>"));
end Hydraulic;

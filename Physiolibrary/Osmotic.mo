within Physiolibrary;
package Osmotic "Domain with Osmorarity and Solvent Volumetric Flow"
 extends Modelica.Icons.Package;
  package Examples
    "Examples that demonstrate usage of the Osmotic flow components"
  extends Modelica.Icons.ExamplesPackage;

    model Cell
    extends Modelica.Icons.Example;

      Components.OsmoticCell
                  cells(volume_start(displayUnit="l") = 0.001,
          ImpermeableSolutes=0.285)
        annotation (Placement(transformation(extent={{-44,36},{-24,56}})));
      Components.OsmoticCell
                  interstitium(volume_start(displayUnit="l") = 0.001,
          ImpermeableSolutes=0.28)
        annotation (Placement(transformation(extent={{34,36},{54,56}})));
      Components.Membrane
               membrane(cond=1.2501026264094e-10)
        annotation (Placement(transformation(extent={{-4,36},{16,56}})));
      Components.OsmoticCell
                  cells1(volume_start(displayUnit="l") = 0.001,
          ImpermeableSolutes=0.285)
        annotation (Placement(transformation(extent={{-44,-64},{-24,-44}})));
      Components.OsmoticCell
                  interstitium1(volume_start(displayUnit="l") = 0.001,
          ImpermeableSolutes=0.29)
        annotation (Placement(transformation(extent={{34,-64},{54,-44}})));
      Components.Membrane
               membrane1(cond=1.2501026264094e-10)
        annotation (Placement(transformation(extent={{-4,-64},{16,-44}})));
    equation
      connect(cells.q_in, membrane.q_in) annotation (Line(
          points={{-34,46},{-4,46}},
          color={127,127,0},
          thickness=1,
          smooth=Smooth.None));
      connect(membrane.q_out, interstitium.q_in) annotation (Line(
          points={{16,46},{44,46}},
          color={127,127,0},
          thickness=1,
          smooth=Smooth.None));
      connect(cells1.q_in, membrane1.q_in) annotation (Line(
          points={{-34,-54},{-4,-54}},
          color={127,127,0},
          thickness=1,
          smooth=Smooth.None));
      connect(membrane1.q_out, interstitium1.q_in) annotation (Line(
          points={{16,-54},{44,-54}},
          color={127,127,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),      graphics={
            Text(
              extent={{-52,84},{42,76}},
              lineColor={135,135,135},
              textString="Cells in hypotonic environment"),
            Text(
              extent={{-52,-16},{42,-24}},
              lineColor={95,95,95},
              textString="Cells in hypertonic environment"),
            Line(
              points={{-98,8},{98,8}},
              color={135,135,135},
              smooth=Smooth.None,
              thickness=1)}),
        experiment(StopTime=60),
        Documentation(revisions=
                        "<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end Cell;

    model CerebrospinalFluid
    extends Modelica.Icons.Example;

      Components.OsmoticCell CSF_osmotic(volume_start(displayUnit="ml")=
          0.00015, ImpermeableSolutes=0.286*0.15) "cerebro-spinal fluid"
        annotation (Placement(transformation(extent={{-76,-6},{-56,14}})));
      Components.Membrane choroid_plexus(useHydraulicPressureInputs=true, cond(
            displayUnit="ml/(mmHg.day)") = 1.9966916949595e-12)
        "choroid plexus"
        annotation (Placement(transformation(extent={{-16,-6},{-36,14}})));
      Hydraulic.Components.ElasticVessel CSF_hydraulic(
        volume_start=0.00015,
        ZeroPressureVolume=0.000145,
        Compliance=2.250184727537e-09) "cerebro-spinal fluid"
        annotation (Placement(transformation(extent={{-96,-32},{-76,-12}})));
      Hydraulic.Components.Pump choroid_plexus_hydraulic(useSolutionFlowInput=
            true) annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=180,
            origin={8,-22})));
      Sensors.FlowMeasure flowMeasure annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=180,
            origin={8,4})));
      Hydraulic.Sensors.PressureMeasure pressureMeasure
        annotation (Placement(transformation(extent={{-90,64},{-70,84}})));
      Sources.UnlimitedSolution ECF_osmotic(Osm=285)
        "extracellular (extracerebrospinal) fluid osmolarity" annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={46,32})));
      Hydraulic.Sources.UnlimitedVolume veins(P=0) annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={82,86})));
      Components.Membrane arachnoid_villi(useHydraulicPressureInputs=true, cond(
            displayUnit="ml/(mmHg.day)") = 1.1285648710641e-11)
        "choroid plexus"
        annotation (Placement(transformation(extent={{-36,46},{-16,66}})));
      Hydraulic.Components.Pump arachnoid_villi_hydraulic(useSolutionFlowInput=
            true)
        annotation (Placement(transformation(extent={{-2,96},{18,76}})));
      Sensors.FlowMeasure flowMeasure1
        annotation (Placement(transformation(extent={{-2,66},{18,46}})));
      Hydraulic.Sources.UnlimitedVolume arteries(P=12665.626804425) annotation (
         Placement(transformation(
            extent={{10,-10},{-10,10}},
            rotation=180,
            origin={80,26})));
      Hydraulic.Components.Conductor conductor(Conductance(displayUnit=
              "ml/(mmHg.min)") = 3.7503078792283e-11)
                                                     annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={96,0})));
      Hydraulic.Components.ElasticVessel choroidPlexusCapilaries(volume_start=
            1.4e-05, Compliance=3.7503078792283e-09)
        annotation (Placement(transformation(extent={{56,-32},{76,-12}})));
      Hydraulic.Components.Conductor conductor1(Conductance=8.750718384866e-11)
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={66,50})));
      Hydraulic.Sensors.PressureMeasure pressureMeasure1
        annotation (Placement(transformation(extent={{68,64},{48,84}})));
      Hydraulic.Sensors.PressureMeasure pressureMeasure2
        annotation (Placement(transformation(extent={{62,-22},{42,-2}})));
    equation
      connect(flowMeasure.actualFlow, choroid_plexus_hydraulic.solutionFlow)
        annotation (Line(
          points={{8,-2},{8,-18}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(CSF_hydraulic.q_in, pressureMeasure.q_in) annotation (Line(
          points={{-86,-22},{-86,68},{-84,68}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(CSF_hydraulic.q_in, choroid_plexus_hydraulic.q_out) annotation (
          Line(
          points={{-86,-22},{-2,-22}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(flowMeasure.q_in, ECF_osmotic.port) annotation (Line(
          points={{18,4},{32,4},{32,32},{36,32}},
          color={127,127,0},
          thickness=1,
          smooth=Smooth.None));
      connect(CSF_osmotic.q_in, arachnoid_villi.q_in) annotation (Line(
          points={{-66,4},{-66,56},{-36,56}},
          color={127,127,0},
          thickness=1,
          smooth=Smooth.None));
      connect(CSF_hydraulic.q_in, arachnoid_villi_hydraulic.q_in) annotation (
          Line(
          points={{-86,-22},{-86,86},{-2,86}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(arachnoid_villi_hydraulic.q_out, veins.y) annotation (Line(
          points={{18,86},{72,86}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pressureMeasure.actualPressure, arachnoid_villi.hydraulicPressureIn)
        annotation (Line(
          points={{-74,70},{-34,70},{-34,64}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(arachnoid_villi.q_out, flowMeasure1.q_in) annotation (Line(
          points={{-16,56},{-2,56}},
          color={127,127,0},
          thickness=1,
          smooth=Smooth.None));
      connect(flowMeasure1.q_out, ECF_osmotic.port) annotation (Line(
          points={{18,56},{32,56},{32,32},{36,32}},
          color={127,127,0},
          thickness=1,
          smooth=Smooth.None));
      connect(flowMeasure1.actualFlow, arachnoid_villi_hydraulic.solutionFlow)
        annotation (Line(
          points={{8,62},{8,82}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(conductor.q_out, choroidPlexusCapilaries.q_in) annotation (Line(
          points={{96,-10},{96,-22},{66,-22}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(choroidPlexusCapilaries.q_in, conductor1.q_in) annotation (Line(
          points={{66,-22},{66,40}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(veins.y, conductor1.q_out) annotation (Line(
          points={{72,86},{66,86},{66,60}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(arteries.y, conductor.q_in) annotation (Line(
          points={{90,26},{96,26},{96,10}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(choroid_plexus_hydraulic.q_in, choroidPlexusCapilaries.q_in)
        annotation (Line(
          points={{18,-22},{66,-22}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pressureMeasure1.q_in, veins.y) annotation (Line(
          points={{62,68},{66,68},{66,86},{72,86}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pressureMeasure1.actualPressure, arachnoid_villi.hydraulicPressureOut)
        annotation (Line(
          points={{52,70},{-18,70},{-18,64}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(choroidPlexusCapilaries.q_in, pressureMeasure2.q_in) annotation (
          Line(
          points={{66,-22},{56,-22},{56,-18}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(CSF_osmotic.q_in, choroid_plexus.q_out) annotation (Line(
          points={{-66,4},{-36,4}},
          color={127,127,0},
          thickness=1,
          smooth=Smooth.None));
      connect(choroid_plexus.q_in, flowMeasure.q_out) annotation (Line(
          points={{-16,4},{-2,4}},
          color={127,127,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pressureMeasure.actualPressure, choroid_plexus.hydraulicPressureOut)
        annotation (Line(
          points={{-74,70},{-42,70},{-42,20},{-34,20},{-34,12}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pressureMeasure2.actualPressure, choroid_plexus.hydraulicPressureIn)
        annotation (Line(
          points={{46,-16},{28,-16},{28,20},{-18,20},{-18,12}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),      graphics={
            Text(
              extent={{-46,-64},{50,-50}},
              lineColor={215,215,215},
              textString="the same volume of CSF"),
            Line(
              points={{-50,-54},{-62,-14}},
              color={215,215,215},
              smooth=Smooth.None,
              arrow={Arrow.None,Arrow.Filled}),
            Line(
              points={{-50,-54},{-72,-30}},
              color={215,215,215},
              smooth=Smooth.None,
              arrow={Arrow.None,Arrow.Filled})}),
        experiment(StopTime=86400),
        Documentation(revisions=
                        "<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>", info="<html>
<p>Parameters are only manually estimated to reach steady state at 150ml CSF with CSF production and rebsorbtion 550ml/day and osmolarity 285 mosm/l.</p>
<p><br>[1] Dee Unglaub Silverthorn: Human Physiology</p>
<p>The cerebrospinal fluid (CSF) circulation: blood capilaries -&GT; choriod plexus of third and fourth ventricle -&GT; arachnoid villi -&GT; blood in venous sinus.</p>
<p><br><font style=\"color: #222222; \">[2] Hochwald, G. M., Wald, A., DiMattio, J., &AMP; Malhan, C. (1974). The effects of serum osmolarity on cerebrospinal fluid volume flow.&nbsp;<i>Life sciences</i>,&nbsp;<i>15</i>(7), 1309-1316.</font></p>
<p><br><font style=\"color: #2e2e2e; \">The effects of changes in serum osmolarity on cerebrospinal fluid (CSF) formation were studied in cats. CSF production rates were measured by ventriculocisternal perfusion both before and after intravenous infusion of glucose solutions.</font></p>
<p><font style=\"color: #2e2e2e; \">Infusion of glucose, hyperosmolar with respect to serum, increased serum osmolarity and caused a decrease in CSF formation rate; conversely, infusion of hypoosmolar solutions lowered serum osmolarity and increased CSF formation. CSF production and serum osmolarity were found to be linearly related. A 1&percnt; serum osmolarity change resulted in a 6.7&percnt; change in CSF formation. CSF formation increased by 130&percnt; with a serum osmolarity of 265 m0sm/1 and was undetectable with serum of 380 m0sm/1.</font></p>
<p><br><font style=\"color: #2e2e2e; \">[3] https://en.wikipedia.org/wiki/Cerebrospinal_fluid</font></p>
<p>The brain produces roughly 500 mL of cerebrospinal fluid per day. This fluid is constantly reabsorbed, so that only 100-160 mL is present at any one time.&nbsp;<a href=\"https://en.wikipedia.org/wiki/Ependymal_cells\">Ependymal cells</a>&nbsp;of the&nbsp;<a href=\"https://en.wikipedia.org/wiki/Choroid_plexus\">choroid plexus</a>&nbsp;produce more than two thirds of CSF. The&nbsp;<a href=\"https://en.wikipedia.org/wiki/Choroid_plexus\">choroid plexus</a>&nbsp;is a&nbsp;<a href=\"https://en.wikipedia.org/wiki/Venous_plexus\">venous plexus</a>&nbsp;contained within the&nbsp;<a href=\"https://en.wikipedia.org/wiki/Ventricular_system\">four ventricles</a>&nbsp;of the brain, hollow structures inside the brain filled with CSF. The remainder of the CSF is produced by the surfaces of the ventricles and by the lining surrounding the&nbsp;<a href=\"https://en.wikipedia.org/wiki/Subarachnoid_space\">subarachnoid space</a>.&nbsp;</p>
<p>Ependymal cells actively secrete sodium into the lateral ventricles. This creates&nbsp;<a href=\"https://en.wikipedia.org/wiki/Osmotic_pressure\">osmotic pressure</a>&nbsp;and draws water into the CSF space. Chloride, with a negative charge, maintains&nbsp;<a href=\"https://en.wikipedia.org/w/index.php?title=Electroneutrality&action=edit&redlink=1\">electroneutrality</a>&nbsp;and moves with the positively-charged sodium. As a result, CSF contains a higher concentration of sodium and chloride than blood plasma, but less potassium, calcium and glucose and protein.&nbsp;</p>
</html>"));
    end CerebrospinalFluid;
  end Examples;

  package Components
    extends Modelica.Icons.Package;
    model OsmoticCell "Solvent container"
      extends Icons.OsmoticCell;
      extends Physiolibrary.SteadyStates.Interfaces.SteadyState(
                                         state_start=volume_start, storeUnit=
          "mOsm/l");

      Interfaces.OsmoticPort_a
                          q_in "Flux to/from osmotic compartment" annotation (Placement(
            transformation(extent={{-10,-10},{10,10}})));
      parameter Physiolibrary.Types.Volume volume_start = 0.001
        "Initial volume of compartment"
         annotation (Dialog(group="Initialization"));

      parameter Boolean useImpermeableSolutesInput = false
        "=true, if impermeable substance amount as an input"
        annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

      parameter Types.AmountOfSubstance ImpermeableSolutes=0
        "Amount of impermeable substance if useImpermeableSolutesInput=false"
        annotation (Dialog(enable=not useImpermeableSolutesInput));

      Physiolibrary.Types.RealIO.AmountOfSubstanceInput impermeableSolutes(start=ImpermeableSolutes)= is if useImpermeableSolutesInput
        "Amount of impermeable solutes in compartment"                                                                                    annotation (Placement(transformation(extent={{-100,40},
                {-60,80}})));
      Physiolibrary.Types.RealIO.VolumeOutput volume
        "Actual volume of compartment"
        annotation (Placement(transformation(extent={{-20,-120},{20,-80}}, rotation=
               -90)));
    protected
      Types.AmountOfSubstance is "Current amount of impermeable solutes";
    equation
      if not useImpermeableSolutesInput then
        is=ImpermeableSolutes;
      end if;

      q_in.o = is / volume;

      change = q_in.q;    //der(volume)=q_in.q
      state = volume;

      //  assert(volume>=-Modelica.Constants.eps,"Collapsed cells by osmotic pressure are not supported!");

      annotation ( Icon(coordinateSystem(
              preserveAspectRatio=false,extent={{-100,-100},{100,100}}),
                                                   graphics={
                                   Text(
              extent={{-40,-138},{280,-100}},
              textString="%name",
              lineColor={0,0,255})}),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>", info="<html>
<p>The liquid volume of the penetrating solution is accumulated in &QUOT;OsmoticCell&QUOT;, where the nonpenetrating solutes are held. Instances of this class can represent both sides of the membrane, for example intracellular space, extracellular space, interstitial space, blood plasma or cerebrospinal fluid.</p>
</html>"));
    end OsmoticCell;

    model Membrane "Solvent diffusion through semipermeable membrane"
     extends Interfaces.OnePort;
     extends Icons.Membrane; //Icons.Resistor;

     parameter Physiolibrary.Types.OsmoticPermeability cond
        "Membrane permeability for solvent";

      parameter Boolean useHydraulicPressureInputs = false
        "=true, if hydraulic pressure inputs is used"
        annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

      parameter Types.Pressure HydraulicPressureIn=0
        "Hydraulic pressure inside if useHydraulicPressureInputs=false"
        annotation (Dialog(enable=not useHydraulicPressureInputs));
      parameter Types.Pressure HydraulicPressureOut=0
        "Hydraulic pressure outside if useHydraulicPressureInputs=false"
        annotation (Dialog(enable=not useHydraulicPressureInputs));

      Types.RealIO.PressureInput hydraulicPressureIn(start=HydraulicPressureIn)=pi if useHydraulicPressureInputs annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={-80,80})));
      Types.RealIO.PressureInput hydraulicPressureOut(start=HydraulicPressureOut)=po if useHydraulicPressureInputs annotation (Placement(
            transformation(extent={{-20,-20},{20,20}},
            rotation=270,
            origin={80,80})));

      parameter Boolean useTemperatureInputs = false
        "=true, if temperature on both sides is used"
        annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

      parameter Types.Temperature T=310.15
        "Temperature on both membrane sides if  useTemperatureInputs=false"
        annotation (Dialog(enable=not  useTemperatureInputs));

      Types.RealIO.TemperatureInput temperatureIn(start=T)=ti if useTemperatureInputs annotation (Placement(
            transformation(extent={{-20,-20},{20,20}},
            rotation=90,
            origin={-80,-80})));
      Types.RealIO.TemperatureInput temperatureOut(start=T)=to if useTemperatureInputs annotation (Placement(
            transformation(extent={{-20,-20},{20,20}},
            rotation=90,
            origin={80,-80})));

    protected
      Types.Pressure pi,po;
      Types.Temperature ti,to;
    equation
      if not useHydraulicPressureInputs then
        pi=HydraulicPressureIn;
        po=HydraulicPressureOut;
      end if;
      if not useTemperatureInputs then
        ti=T;
        to=T;
      end if;

      q_in.q = cond * ( (-po + q_out.o*(Modelica.Constants.R*to)) - (-pi + q_in.o*(Modelica.Constants.R*ti)));
      annotation (        Documentation(revisions="<html>
<p><i>2009-2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>", info="<html>
<p>The main element of osmotic phenomena is a semipermeable membrane, which generates the flow of penetrating substances together with water. The connector on both sides is composed of molar concentration of non-penetrating solutes (osmolarity), and from penetrating volumetric flow (osmotic flux). Flow through the membrane depends on a pressure gradient, where pressure on both sides is calculated from the osmotic and hydraulic component.</p>
</html>"));
    end Membrane;

    model SolventFlux "Prescripted solvent flow"
      extends Interfaces.OnePort;
      extends Chemical.Interfaces.ConditionalSolutionFlow;

    equation
      q_in.q = q;

     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={
            Text(
              extent={{-100,-80},{100,-54}},
              textString="%name",
              lineColor={0,0,255}),
            Rectangle(
              extent={{-100,-50},{100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-78,25},{82,0},{-78,-25},{-78,25}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid)}),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end SolventFlux;
  end Components;

  package Sensors
    extends Modelica.Icons.SensorsPackage;
    model FlowMeasure "Measurement of flux through semipermeable membrane"
      extends Interfaces.OnePort;
      extends Icons.FlowMeasure;

      Physiolibrary.Types.RealIO.VolumeFlowRateOutput actualFlow
        "Flux through membrane"
        annotation (Placement(transformation(extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,-60})));
    equation
      q_out.o = q_in.o;

      actualFlow = q_in.q;

     annotation (
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end FlowMeasure;
  end Sensors;

  package Sources
    extends Modelica.Icons.SourcesPackage;
    model SolventInflux "Prescribed solvent inflow"
      extends Chemical.Interfaces.ConditionalSolutionFlow;

      Interfaces.OsmoticPort_b
                          q_out
                             annotation (Placement(
            transformation(extent={{50,-10},{70,10}})));

    equation
      q_out.q = - q;

     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
                            graphics={
            Rectangle(
              extent={{-60,-30},{60,30}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-48,20},{50,0},{-48,-21},{-48,20}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-92,-58},{80,-34}},
              textString="%name",
              lineColor={0,0,255})}),        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end SolventInflux;

    model SolventOutflux "Prescribed solvent outflow"
     extends Chemical.Interfaces.ConditionalSolutionFlow;
      Interfaces.OsmoticPort_a
                          q_in
                             annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{-70,-10},{-50,10}})));
    equation
      q_in.q = q;

     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={
            Rectangle(
              extent={{-60,-32},{60,30}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-48,18},{50,-2},{-48,-26},{-48,18}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-78,-58},{72,-36}},
              textString="%name",
              lineColor={0,0,255})}),        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end SolventOutflux;

    model UnlimitedSolution "Prescribed osmolarity"
      import Physiolibrary.Types.*;

      parameter Boolean useOsmolarityInput = false
        "=true, if fixed osmolarity at port is from input instead of parameter"
      annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

       parameter Physiolibrary.Types.Osmolarity Osm = 0
        "Fixed osmolarity at port if useOsmolarityInput=false"
        annotation (Dialog(enable=not useOsmolarityInput));

      parameter Boolean isIsolatedInSteadyState = true
        "=true, if there is no flow at port in steady state"
        annotation (Dialog(group="Simulation",tab="Equilibrium"));

      parameter SimulationType  Simulation=SimulationType.NormalInit
        "If in equilibrium, then zero-flow equation is added."
        annotation (Dialog(group="Simulation",tab="Equilibrium"));

      Interfaces.OsmoticPort_b    port annotation (Placement(transformation(extent={{90,-10},
                {110,10}})));

    protected
      Physiolibrary.Types.Osmolarity o "Current osmolarity";
    public
      Types.RealIO.TemperatureInput osmolarity(start=Osmolarity)=o if
                                                               useOsmolarityInput
        annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));

    initial equation
      if isIsolatedInSteadyState and (Simulation==SimulationType.InitSteadyState) then
        port.q = 0;
      end if;

    equation
      if not useOsmolarityInput then
        o=Osm;
      end if;

      port.o = o;

      if isIsolatedInSteadyState and (Simulation==SimulationType.SteadyState) then
          port.q = 0;
      end if;

       annotation (
        Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,100}}),
                            graphics={
            Text(
              extent={{-150,150},{150,110}},
              textString="%name",
              lineColor={0,0,255}),
            Text(
              extent={{-150,-110},{150,-140}},
              lineColor={0,0,0},
              textString="T=%T"),
            Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,0},
              pattern=LinePattern.None,
              fillColor={127,127,0},
              fillPattern=FillPattern.Backward),
            Text(
              extent={{38,-34},{-100,-100}},
              lineColor={0,0,0},
              textString="Osm"),
            Line(
              points={{-52,0},{56,0}},
              color={191,0,0},
              thickness=0.5),
            Polygon(
              points={{50,-20},{50,20},{90,0},{50,-20}},
              lineColor={191,0,0},
              fillColor={191,0,0},
              fillPattern=FillPattern.Solid)}),
        Documentation(info="<HTML>
<p>
This model defines a fixed temperature T at its port in Kelvin,
i.e., it defines a fixed temperature as a boundary condition.
</p>
</HTML>
"));
    end UnlimitedSolution;
  end Sources;

  package Interfaces
    extends Modelica.Icons.InterfacesPackage;

     connector OsmoticPort
      "Flux through semipermeable membrane by osmotic pressure gradient"
      Physiolibrary.Types.Concentration o
        "Osmolarity is the molar concentration of the impermeable solutes";
      flow Physiolibrary.Types.VolumeFlowRate q
        "The flux of the permeable solvent (!not the impermeable solutes!)";
      annotation (Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
     end OsmoticPort;

    connector OsmoticPort_a "Influx"
      extends OsmoticPort;

    annotation (
        defaultComponentName="port_a",
        Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,
                100}}),     graphics={Rectangle(
              extent={{-20,10},{20,-10}},
              lineColor={127,127,0},
              lineThickness=1),       Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={127,127,0},
              fillColor={127,127,0},
              fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}),
            graphics={Rectangle(
              extent={{-40,40},{40,-40}},
              lineColor={127,127,0},
              fillColor={127,127,0},
              fillPattern=FillPattern.Solid),
        Text(extent = {{-160,110},{40,50}}, lineColor = {127,127,0}, textString = "%name")}),
        Documentation(info="<html>
<p>
Connector with one flow signal of type Real.
</p>
</html>",
        revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));

    end OsmoticPort_a;

    connector OsmoticPort_b "Outflux"
      extends OsmoticPort;

    annotation (
        defaultComponentName="port_b",
        Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,
                100}}),     graphics={Rectangle(
              extent={{-20,10},{20,-10}},
              lineColor={127,127,0},
              lineThickness=1),       Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={127,127,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}),
            graphics={Rectangle(
              extent={{-40,40},{40,-40}},
              lineColor={127,127,0},
             fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
        Text(extent = {{-160,110},{40,50}}, lineColor = {127,127,0}, textString = "%name")}),
        Documentation(info="<html>
<p>
Connector with one flow signal of type Real.
</p>
</html>",
        revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));

    end OsmoticPort_b;

    partial model OnePort "Osmotic one port"

     OsmoticPort_a       q_in "Forward flux through membrane"
                            annotation (Placement(
            transformation(extent={{-110,-10},{-90,10}})));
      OsmoticPort_b       q_out "Backward flux through membrane"
                             annotation (Placement(
            transformation(extent={{90,-10},{110,10}})));
    equation
      q_in.q + q_out.q = 0;
      annotation ( Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end OnePort;

    partial model ConditionalSolventFlow
      "Input of solvent volumetric flow vs. parametric solvent volumetric flow"

      parameter Boolean useSolventFlowInput = false
        "=true, if solvent flow input is used instead of parameter SolventFlow"
      annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

      parameter Physiolibrary.Types.VolumeFlowRate SolventFlow=0
        "Volumetric flow of solvent if useSolventFlowInput=false"
        annotation (Dialog(enable=not useSolventFlowInput));

      Physiolibrary.Types.RealIO.VolumeFlowRateInput solventFlow(start=SolventFlow)=q if useSolventFlowInput annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,40})));

      Physiolibrary.Types.VolumeFlowRate q "Current solvent flow";
    equation
      if not useSolventFlowInput then
        q = SolventFlow;
      end if;

    end ConditionalSolventFlow;
  end Interfaces;
  annotation (Documentation(revisions="<html>
<p>Licensed by Marek Matejak under the Modelica License 2</p>
<p>Copyright &copy; 2008-2014, Marek Matejak, Charles University in Prague.</p>
<p><br><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Physiolibrary.UsersGuide.ModelicaLicense2\">Physiolibrary.UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p>
</html>", info="<html>
<p>One of the basic phenomenon of biological systems is the osmotically-driven flow of water. This is always connected with semipermeable membranes. The different concentrations of impermeable solutes on both sides of the membrane causes the hydrostatic pressure at the concentrated side to rise. This pressure difference is called osmotic pressure. Osmotic pressure is linearly proportional to the concentration gradient of impermeable solutes. The osmolarity (osmotic concentration) is also one of the main indexes of human body balance, called homeostasis. Its value should not significantly deviate for a long period of time from a value of 285-295 mosm/l. </p>
<p>In Physiolibrary the osmotic connector OsmoticPort is composed of the osmotic concentration and the volumetric flux of permeable liquid. The two main blocks are called Membrane and OsmoticCell. Here, inside the membrane blocks, it is of course possible to also define hydraulic pressure and temperatures effects on both sides of membrane. </p>
</html>"));
end Osmotic;

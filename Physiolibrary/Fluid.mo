within Physiolibrary;
package Fluid "Physiological fluids with static and dynamic properties"
  extends Modelica.Icons.Package;

  package Components
    extends Modelica.Icons.Package;

    model Conductor "Hydraulic resistor, where conductance=1/resistance"
      extends Physiolibrary.Fluid.Interfaces.OnePort;
      extends Physiolibrary.Icons.HydraulicResistor;
      parameter Boolean useConductanceInput = false "=true, if external conductance value is used" annotation (
        Evaluate = true,
        HideResult = true,
        choices(checkBox = true),
        Dialog(group = "Conditional inputs"));
      parameter Physiolibrary.Types.HydraulicConductance Conductance = 0 "Hydraulic conductance if useConductanceInput=false" annotation (
        Dialog(enable = not useConductanceInput));
      Physiolibrary.Types.RealIO.HydraulicConductanceInput cond(start = Conductance) = c if useConductanceInput annotation (
        Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {0, 60})));
    protected
      Physiolibrary.Types.HydraulicConductance c;
      constant Boolean GenerateConductanceConnection = true;
    equation
      if not useConductanceInput and GenerateConductanceConnection then
        c = Conductance;
      end if;
      volumeFlowRate = c * (q_in.p - q_out.p);
      annotation (
        Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Text(extent = {{-220, -40}, {200, -80}}, lineColor = {127, 0, 0}, fillColor = {58, 117, 175}, fillPattern = FillPattern.Solid, textString = "%name")}),
        Documentation(revisions = "<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
<p>All rights reserved. </p>
</html>",
        info = "<html>
<p>This hydraulic conductance (resistance) element contains two connector sides. No hydraulic medium volume is changing in this element during simulation. That means that sum of flow in both connector sides is zero. The flow through element is determined by <b>Ohm&apos;s law</b>. It is used conductance (=1/resistance) because it could be numerical zero better then infinity in resistance. </p>
</html>"));
    end Conductor;

    model Resistor
      extends Physiolibrary.Fluid.Components.Conductor(final Conductance = 1 / Resistance, final useConductanceInput = false, final GenerateConductanceConnection = false);
      parameter Physiolibrary.Types.HydraulicResistance Resistance = Modelica.Constants.inf "Hydraulic conductance if useConductanceInput=false" annotation (
        Dialog(enable = not useResistanceInput));
      parameter Boolean useResistanceInput = false "=true, if external resistance value is used" annotation (
        Evaluate = true,
        HideResult = true,
        choices(checkBox = true),
        Dialog(group = "Conditional inputs"));
      Physiolibrary.Types.RealIO.HydraulicResistanceInput resistance(start = Resistance) = 1 / c if useResistanceInput annotation (
        Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {0, 60})));
    equation
      if not useResistanceInput then
        c = 1 / Resistance;
      end if;
    end Resistor;

    model ElasticVessel "Elastic compartment as chemical solution envelop"
      extends Physiolibrary.Icons.ElasticBalloon;
      extends Physiolibrary.Fluid.Interfaces.Accumulation(final pressure_start = p_initial);
      parameter String stateName=getInstanceName();
      parameter Types.HydraulicCompliance Compliance = 1e+3
      "Compliance e.g. TidalVolume/TidalPressureGradient if useComplianceInput=false"                                                       annotation (
        Dialog(enable = not useComplianceInput));
      parameter Types.Volume ZeroPressureVolume = 1e-11
      "Functional Residual Capacity. Maximal fluid volume, that does not generate pressure if useV0Input=false"                                                   annotation (
        Dialog(enable = not useV0Input));
      //default = 1e-5 ml
      parameter Types.Pressure ExternalPressure = if isExternalPressureAbsolute then system.p_ambient else 0
      "External pressure if useExternalPressureInput=false."                                                                                                        annotation (
        Dialog(enable = not useExternalPressureInput));
      parameter Types.Volume ResidualVolume = 1e-9
      "Residual volume. Or maximal fluid volume, which generate negative collapsing pressure in linear model"                                              annotation (
        Dialog(tab = "Advanced", group = "Pressure-Volume relationship"));
      Types.Volume excessVolume
      "Additional cavity volume (=fluid volume + internal space volume), that generate pressure";
      parameter Boolean useV0Input = false "=true, if zero-pressure-fluid_volume input is used" annotation (
        Evaluate = true,
        HideResult = true,
        choices(checkBox = true),
        Dialog(group = "Conditional inputs"));
      Types.RealIO.VolumeInput zeroPressureVolume(start = ZeroPressureVolume) = zpv
      if useV0Input                                                                                                                           annotation (
        Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {-80, 80}), iconTransformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin={-70,90})));
      parameter Boolean useComplianceInput = false "=true, if compliance input is used" annotation (
        Evaluate = true,
        HideResult = true,
        choices(checkBox = true),
        Dialog(group = "Conditional inputs"));
      Types.RealIO.HydraulicComplianceInput compliance( start = Compliance) = c
      if useComplianceInput                                                                           annotation (
        Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {0, 80}), iconTransformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin={0,90})));
      parameter Boolean useExternalPressureInput = false "=true, if external pressure input is used" annotation (
        Evaluate = true,
        HideResult = true,
        choices(checkBox = true),
        Dialog(group = "Conditional inputs"));
      parameter Boolean isExternalPressureAbsolute = false "external pressure as absolute pressure? Relative to ambient otherwise." annotation (
        Evaluate = true,
        HideResult = true,
        choices(checkBox = true),
        Dialog(group = "Conditional inputs"));

      Types.RealIO.PressureInput externalPressure(start = ExternalPressure) = ep
      if useExternalPressureInput                                                                            annotation (
        Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {80, 80}), iconTransformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin={70,90})));
      Types.RealIO.VolumeOutput fluidVolume= volume annotation (
        Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {116, -60}), iconTransformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {100, -80})));
      parameter Boolean useSigmoidCompliance = false "sigmoid compliance e.g. lungs" annotation (
        Evaluate = true,
        choices(checkBox = true),
        Dialog(tab = "Advanced", group = "Pressure-Volume relationship"));
      parameter Types.Volume VitalCapacity = 0.00493
      "Relative volume capacity if useSigmoidCompliance"                                                annotation (
        Dialog(enable = useSigmoidCompliance, tab = "Advanced", group = "Pressure-Volume relationship"));
      parameter Types.Volume BaseTidalVolume = 0.000543
      "Base value of tidal volume"                                                   annotation (
        Dialog(enable = useSigmoidCompliance, tab = "Advanced", group = "Pressure-Volume relationship"));
      Types.RealIO.VolumeInput internalSpace(
        start=InternalSpace)=is if useInternalSpaceInput
      "additional internal volume (e.g. another inserted compartment inside)"
        annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=180,
            origin={100,8}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={90,60})));
      parameter Boolean useInternalSpaceInput = false "=true, if internal space input is used" annotation (
        Evaluate = true,
        HideResult = true,
        choices(checkBox = true),
        Dialog(group = "Conditional inputs"));
      parameter Types.Volume InternalSpace = 0
      "Internal space if there is no pressure gradient"                                          annotation (
        Dialog(tab = "Advanced", group = "Pressure-Volume relationship"));
      Types.Pressure relative_pressure;


    protected
      constant Boolean GenerateComplianceConnection = true;
      parameter Types.Pressure p_initial = system.p_ambient;
      parameter Types.Volume BaseMeanVolume = ZeroPressureVolume + BaseTidalVolume / 2
      "Point of equality with linear presentation such as (FunctionalResidualCapacity + TidalVolume/2)";

      Types.Pressure d_sigmoid = (BaseMeanVolume - ResidualVolume) * (VitalCapacity - (BaseMeanVolume - ResidualVolume)) / (c * VitalCapacity);
      Types.Pressure c_sigmoid = (BaseMeanVolume - ZeroPressureVolume) / c + d_sigmoid * log(VitalCapacity / (BaseMeanVolume - ResidualVolume) - 1);

      Types.Volume zpv;
      Types.Pressure ep;
      Types.HydraulicCompliance c;
      Types.Volume is;

    equation
    //elastic compartment
      if not useV0Input then
        zpv = ZeroPressureVolume;
      end if;
      if not useComplianceInput and GenerateComplianceConnection then
        c = Compliance;
      end if;
      if not useExternalPressureInput then
        ep = ExternalPressure;
      end if;
      if not useInternalSpaceInput then
        is = InternalSpace;
      end if;
      excessVolume = max(0, volume + is - zpv + InternalSpace) - InternalSpace;
      relative_pressure = pressure - (if isExternalPressureAbsolute then ep else ep + system.p_ambient);



      pressure = (if not useSigmoidCompliance
      then
        smooth(0,
        if noEvent(volume > ResidualVolume)
           then
              excessVolume / c
           else   (-(if isExternalPressureAbsolute then ep-system.p_ambient else ep) / log(Modelica.Constants.eps)) * log(max(Modelica.Constants.eps, volume / ResidualVolume)))
      else
        (-d_sigmoid * log(VitalCapacity / (volume - ResidualVolume) - 1)) + c_sigmoid)
      + (if isExternalPressureAbsolute then ep else ep + system.p_ambient);


      assert(volume > Modelica.Constants.eps, "Attempt to reach negative volume!");

      annotation (
        Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Text(extent = {{-280, -104}, {280, -142}}, lineColor = {127, 0, 0}, fillColor = {58, 117, 175}, fillPattern = FillPattern.Solid, textString = "%name")}),
        Documentation(revisions = "<html>
<p>2020 by Marek Matejak, http://www.physiolib.com </p>
</html>",
        info = "<html>
<h4>amountOfSolution = &sum; amountOfSubstances</h4>
<h4>mass = &sum; massOfSubstances</h4>
<h4>volume = &sum; volumeOfSubstances</h4>
<h4>freeGibbsEnergy = &sum; freeGibbsEnergiesOfSubstances</h4>
<p>To calculate the sum of extensive substance's properties is misused the Modelica \"flow\" prefix even there are not real physical flows. </p>
</html>"));
    end ElasticVessel;

    model ElasticVesselElastance
      extends Physiolibrary.Fluid.Components.ElasticVessel(final Compliance = 1 / Elastance, final useComplianceInput = false, final GenerateComplianceConnection = false);
      parameter Physiolibrary.Types.HydraulicElastance Elastance = 1 "Elastance if useComplianceInput=false" annotation (
        Dialog(enable = not useComplianceInput));
      Types.RealIO.HydraulicElastanceInput elastance(start = Elastance) = 1 / c if useElastanceInput annotation (
        Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {0, 80}), iconTransformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {20, 90})));
      parameter Boolean useElastanceInput = false "=true, if elastance input is used" annotation (
        Evaluate = true,
        HideResult = true,
        choices(checkBox = true),
        Dialog(group = "Conditional inputs"));
    equation
      if not useElastanceInput then
        c = 1 / Elastance;
      end if;
    end ElasticVesselElastance;

    model HydrostaticColumn "Hydrostatic column pressure between two connectors (with specific muscle pump effect)"
      extends Physiolibrary.Icons.HydrostaticGradient;
      extends Interfaces.OnePort_UpDown;
      replaceable package Medium = Media.Water constrainedby
      Media.Interfaces.PartialMedium                                                        "Medium model" annotation (
         choicesAllMatching = true);
      outer Modelica.Fluid.System system "System wide properties";
      parameter Boolean useHeightInput = false "=true, if height input is used" annotation (
        Evaluate = true,
        HideResult = true,
        choices(checkBox = true),
        Dialog(group = "Conditional inputs"));
      parameter Physiolibrary.Types.Height H = 0 "Height of hydrostatic column if useHeightInput=false" annotation (
        Dialog(enable = not useHeightInput));
      Physiolibrary.Types.RealIO.HeightInput height(start = H) = h if useHeightInput "Vertical distance between top and bottom connector" annotation (
        Placement(transformation(extent = {{-20, -20}, {20, 20}}, origin = {-110, 0}), iconTransformation(extent = {{-130, -20}, {-90, 20}})));
      parameter Boolean usePumpEffect = false "=true, if musce pump effect is used" annotation (
        Evaluate = true,
        HideResult = true,
        choices(checkBox = true),
        Dialog(group = "Conditional inputs"));
      Physiolibrary.Types.RealIO.FractionInput pumpEffect(start = PumpEffect) = pe if usePumpEffect annotation (
        Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {0, 100})));
    protected
      parameter Physiolibrary.Types.Fraction PumpEffect = 1 "Pump effect if usePumpEffect=false" annotation (
        Dialog(enable = not usePumpEffect));
    protected
      Physiolibrary.Types.Fraction pe;
      Physiolibrary.Types.Height h;
    equation
      if not useHeightInput then
        h = H;
      end if;
      if not usePumpEffect then
        pe = PumpEffect;
      end if;
      q_down.p = q_up.p + system.g * density * h * pe;
      annotation (
        Documentation(revisions = "<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>",
        info = "<html>
<p>The hydrostatic pressure is proportional to height of the column.&nbsp;</p>
</html>"),
        Icon(graphics={  Text(extent = {{-210, -66}, {210, -106}}, lineColor = {127, 0, 0}, fillColor = {58, 117, 175}, fillPattern = FillPattern.Solid, textString = "%name")}));
    end HydrostaticColumn;

    model Inertia "Inertia of the volumetric flow"
      extends Physiolibrary.Fluid.Interfaces.OnePort;
      //(q_in(m_flow(start=massFlow_start)));
      extends Physiolibrary.Icons.Inertance;
      parameter Physiolibrary.Types.MassFlowRate massFlow_start = 0 "Mass flow start value" annotation (
        Dialog(group = "Initialization"));
      parameter Physiolibrary.Types.HydraulicInertance I "Inertance";
    initial equation
      q_in.m_flow = massFlow_start;
    equation
      I * der(q_in.m_flow) = q_in.p - q_out.p;
      annotation (
        Documentation(info = "<html>
<p>Inertance I of the simple tube could be calculated as I=ro*l/A, where ro is fuid density, l is tube length and A is tube cross-section area.</p>
</html>",
        revisions = "<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>"),
        Icon(graphics={  Text(extent = {{-212, -58}, {208, -98}}, lineColor = {127, 0, 0}, fillColor = {58, 117, 175}, fillPattern = FillPattern.Solid, textString = "%name")}));
    end Inertia;

    model IdealValve
      extends Icons.IdealValve;
      extends Physiolibrary.Fluid.Interfaces.OnePort;
      Boolean open(start = true) "Switching state";
      Real passableVariable(start = 0, final unit = "1") "Auxiliary variable for actual position on the ideal diode characteristic";
      /*  = 0: knee point
              < 0: below knee point, diode locking
              > 0: above knee point, diode conducting */
      parameter Physiolibrary.Types.HydraulicConductance _Gon(final min = 0, displayUnit = "l/(mmHg.min)") = 1.2501026264094e-02 "Forward state-on conductance (open valve conductance)" annotation (
        Dialog(enable = not useLimitationInputs));
      //= the same as resistance 1e-5 mmHg/(l/min)
      parameter Physiolibrary.Types.HydraulicConductance _Goff(final min = 0, displayUnit = "l/(mmHg.min)") = 1.2501026264094e-12 "Backward state-off conductance (closed valve conductance)" annotation (
        Dialog(enable = not useLimitationInputs));
      //= 1e-5 (l/min)/mmHg
      parameter Physiolibrary.Types.Pressure Pknee(final min = 0) = 0 "Forward threshold pressure";
      parameter Boolean useLimitationInputs = false "=true, if Gon and Goff are from inputs" annotation (
        Evaluate = true,
        HideResult = true,
        choices(checkBox = true),
        Dialog(group = "Conditional inputs"));
      Physiolibrary.Types.RealIO.HydraulicConductanceInput Gon(start = _Gon) = gon if useLimitationInputs "open valve conductance = infinity for ideal case" annotation (
        Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {-60, 100})));
      Physiolibrary.Types.RealIO.HydraulicConductanceInput Goff(start = _Goff) = goff if useLimitationInputs "closed valve conductance = zero for ideal case" annotation (
        Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {60, 100})));
    protected
      constant Boolean GenerateConductanceConnection = true;
      Physiolibrary.Types.HydraulicConductance gon;
      Physiolibrary.Types.HydraulicConductance goff;
      constant Physiolibrary.Types.Pressure unitPressure = 1;
      constant Physiolibrary.Types.VolumeFlowRate unitFlow = 1;
    equation
      if not useLimitationInputs and GenerateConductanceConnection then
        gon = _Gon;
        goff = _Goff;
      end if;
      open = passableVariable > Modelica.Constants.eps;
      dp = passableVariable * unitFlow * (if open then 1 / gon else 1) + Pknee;
      volumeFlowRate = passableVariable * unitPressure * (if open then 1 else goff) + goff * Pknee;
      annotation (
        Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Text(extent = {{-188, -100}, {196, -130}}, lineColor = {127, 0, 0}, fillPattern = FillPattern.Sphere, fillColor = {255, 85, 85}, textString = "%name")}),
        Documentation(info = "<html>
<p>Ideal Valve allows a volumetric flow in one direction in case of pressure gradient is greater. </p>
</html>",
        revisions = "<html>
</html>"));
    end IdealValve;

    model IdealValveResistance
      extends Physiolibrary.Fluid.Components.IdealValve(final _Gon = 1 / _Ron, final _Goff = 1 / _Roff, final useLimitationInputs = false, GenerateConductanceConnection = false);
      parameter Physiolibrary.Types.HydraulicResistance _Ron(displayUnit = "(mmHg.min)/l") = 79.993432449 "forward state resistance" annotation (
        Dialog(enable = not useResistanceInputs));
      parameter Physiolibrary.Types.HydraulicResistance _Roff = 799934324490.0 "Backward state-off resistance (closed valve resistance)" annotation (
        Dialog(enable = not useResistanceInputs));
      parameter Boolean useResistanceInputs = false "=true, if Ron and Roff are from inputs" annotation (
        Evaluate = true,
        HideResult = true,
        choices(checkBox = true),
        Dialog(group = "Conditional inputs"));
      Physiolibrary.Types.RealIO.HydraulicResistanceInput Ron(start = _Ron) = 1 / gon if useResistanceInputs "open valve resistancece = zero for ideal case" annotation (
        Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {-60, 100})));
      Physiolibrary.Types.RealIO.HydraulicResistanceInput Roff(start = _Roff) = 1 / goff if useResistanceInputs "closed valve resistance = infinity for ideal case" annotation (
        Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {60, 100})));
    equation
      if not useResistanceInputs then
        gon = 1 / _Ron;
        goff = 1 / _Roff;
      end if;
    end IdealValveResistance;

    model MassPump "Prescribed mass flow"
      extends Icons.Pump;
      extends Physiolibrary.Fluid.Interfaces.OnePort;
      extends Physiolibrary.Fluid.Interfaces.ConditionalMassFlow;
    equation
      massFlowRate = q;
      annotation (
        Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics={  Text(extent = {{-150, -90}, {150, -50}}, lineColor = {127, 0, 0}, textString = "%name")}),
        Documentation(revisions = "<html>
<table>
<tr>
<td>Author:</td>
<td>Marek Matejak</td>
</tr>
<td>Web:</td>
<td>http://www.physiolib.com</td>
</tr>
<tr>
<td>Date of:</td>
<td>october 2017-2018</td>
</tr>
</table>
</html>",
        info = "<html>
<p><font style=\"font-size: 9pt; \">This element needs to be connected only to next hydraulic elements, which contain calculation of hydraulic pressure in connector. It is because equation contains only </font><b><font style=\"font-size: 9pt; \">hydraulic volume flow</font></b><font style=\"font-size: 9pt; \"> variable, which is set to value of input signal variable. </font></p>
</html>"));
    end MassPump;

    model VolumePump "Prescribed mass flow"
      extends Icons.Pump;
      extends Physiolibrary.Fluid.Interfaces.OnePort;
      extends Physiolibrary.Fluid.Interfaces.ConditionalVolumeFlow;
    equation
      volumeFlowRate = q;
      annotation (
        Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics={  Text(extent = {{-150, -90}, {150, -50}}, lineColor = {127, 0, 0}, textString = "%name")}),
        Documentation(revisions = "<html>
<table>
<tr>
<td>Author:</td>
<td>Marek Matejak</td>
</tr>
<td>Web:</td>
<td>http://www.physiolib.com</td>
</tr>
<tr>
<td>Date of:</td>
<td>october 2017-2018</td>
</tr>
</table>
</html>",
        info = "<html>
<p><font style=\"font-size: 9pt; \">This element needs to be connected only to next hydraulic elements, which contain calculation of hydraulic pressure in connector. It is because equation contains only </font><b><font style=\"font-size: 9pt; \">hydraulic volume flow</font></b><font style=\"font-size: 9pt; \"> variable, which is set to value of input signal variable. </font></p>
</html>"));
    end VolumePump;

    model Reabsorption "Divide inflow to outflow and reabsorption"
      import Physiolibrary;
      extends Physiolibrary.Icons.Reabsorption;
      replaceable package Medium = Physiolibrary.Media.Water constrainedby
      Physiolibrary.Media.Interfaces.PartialMedium                                                                      "Medium model" annotation (
         choicesAllMatching = true);
      Physiolibrary.Fluid.Interfaces.FluidPort_a Inflow(redeclare package
        Medium =                                                                   Medium) annotation (
        Placement(transformation(extent = {{-114, 26}, {-86, 54}})));
      Physiolibrary.Fluid.Interfaces.FluidPort_b Outflow(redeclare package
        Medium =                                                                    Medium) annotation (
        Placement(transformation(extent = {{86, 26}, {114, 54}})));
      Physiolibrary.Fluid.Interfaces.FluidPort_b Reabsorption(redeclare package
                Medium =                                                                 Medium) annotation (
        Placement(transformation(extent = {{-14, -114}, {14, -86}})));
      Physiolibrary.Types.RealIO.FractionInput FractReab annotation (
        Placement(transformation(extent = {{-100, -60}, {-60, -20}})));
      parameter Boolean useExternalOutflowMin = false "=true, if minimal outflow is garanted" annotation (
        Evaluate = true,
        HideResult = true,
        choices(checkBox = true),
        Dialog(group = "Conditional inputs"));
      parameter Physiolibrary.Types.VolumeFlowRate OutflowMin = 0 "Minimal outflow if useExternalOutflowMin=false" annotation (
        Dialog(enable = not useExternalOutflowMin));
      Physiolibrary.Types.RealIO.VolumeFlowRateInput outflowMin(start = OutflowMin) = om if useExternalOutflowMin annotation (
        Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {40, 80})));
    protected
      Physiolibrary.Types.VolumeFlowRate om;
      Physiolibrary.Types.Density density;
    equation
      if not useExternalOutflowMin then
        om = OutflowMin;
      end if;
      Inflow.p = Outflow.p;
      0 = Inflow.m_flow + Outflow.m_flow + Reabsorption.m_flow;
    // assert(Inflow.q>=-Modelica.Constants.eps,"Only one directional flow is supported!");
      Reabsorption.m_flow = -max(0, FractReab * (Inflow.m_flow - om * density));
      density = Medium.density(Medium.setState_phX(Inflow.p, inStream(Inflow.h_outflow), inStream(Inflow.Xi_outflow)));
    //Solve streams variable as in connection of all three connectors:
      0 = Inflow.m_flow * Inflow.h_outflow + Outflow.m_flow * actualStream(Outflow.h_outflow) + Reabsorption.m_flow * actualStream(Reabsorption.h_outflow);
      0 = Inflow.m_flow * actualStream(Inflow.h_outflow) + Outflow.m_flow * Outflow.h_outflow + Reabsorption.m_flow * actualStream(Reabsorption.h_outflow);
      0 = Inflow.m_flow * actualStream(Inflow.h_outflow) + Outflow.m_flow * actualStream(Outflow.h_outflow) + Reabsorption.m_flow * Reabsorption.h_outflow;
      zeros(Inflow.Medium.nXi) = Inflow.m_flow * Inflow.Xi_outflow + Outflow.m_flow * actualStream(Outflow.Xi_outflow) + Reabsorption.m_flow * actualStream(Reabsorption.Xi_outflow);
      zeros(Outflow.Medium.nXi) = Inflow.m_flow * actualStream(Inflow.Xi_outflow) + Outflow.m_flow * Outflow.Xi_outflow + Reabsorption.m_flow * actualStream(Reabsorption.Xi_outflow);
      zeros(Reabsorption.Medium.nXi) = Inflow.m_flow * actualStream(Inflow.Xi_outflow) + Outflow.m_flow * actualStream(Outflow.Xi_outflow) + Reabsorption.m_flow * Reabsorption.Xi_outflow;
      zeros(Inflow.Medium.nC) = Inflow.m_flow * Inflow.C_outflow + Outflow.m_flow * actualStream(Outflow.C_outflow) + Reabsorption.m_flow * actualStream(Reabsorption.C_outflow);
      zeros(Outflow.Medium.nC) = Inflow.m_flow * actualStream(Inflow.C_outflow) + Outflow.m_flow * Outflow.C_outflow + Reabsorption.m_flow * actualStream(Reabsorption.C_outflow);
      zeros(Reabsorption.Medium.nC) = Inflow.m_flow * actualStream(Inflow.C_outflow) + Outflow.m_flow * actualStream(Outflow.C_outflow) + Reabsorption.m_flow * Reabsorption.C_outflow;
      annotation (
        Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Text(extent = {{-100, 130}, {100, 108}}, lineColor = {127, 0, 0}, textString = "%name")}),
        Documentation(revisions = "<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>",
        info = "<html>
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
    annotation (
      Documentation(info = "<html>
<p>Main components for physiological fluid modeling.</p>
</html>"));
  end Components;

  package Interfaces
    extends Modelica.Icons.InterfacesPackage;
    connector FluidPort = Modelica.Fluid.Interfaces.FluidPort(redeclare
          replaceable package
                            Medium =
          Physiolibrary.Media.Water);

    connector FluidPort_a "Hydraulical inflow connector"
      extends FluidPort;
      annotation (
        defaultComponentName = "port_a",
        Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Ellipse(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0}, fillColor = {127, 0, 0}, fillPattern = FillPattern.Solid), Text(extent = {{-150, 110}, {150, 50}}, textString = "%name")}),
        Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Ellipse(extent = {{-100, 100}, {100, -100}}, lineColor = {127, 0, 0}, fillColor = {127, 0, 0}, fillPattern = FillPattern.Solid, lineThickness = 0.5), Ellipse(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 0}, fillColor = {127, 0, 0}, fillPattern = FillPattern.Solid)}),
        Documentation(info = "<html>
<p>
Connector with one flow signal of type Real.
</p>
</html>",
        revisions = "<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, marek@matfyz.cz </p>
</html>"));
    end FluidPort_a;

    connector FluidPort_b "Hydraulical outflow connector"
      extends FluidPort;
      annotation (
        defaultComponentName = "port_b",
        Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Ellipse(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0}, fillColor = {127, 0, 0}, fillPattern = FillPattern.Solid), Ellipse(extent = {{-30, 30}, {30, -30}}, lineColor = {127, 0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{-150, 110}, {150, 50}}, textString = "%name")}),
        Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Ellipse(extent = {{-100, 100}, {100, -100}}, lineColor = {127, 0, 0}, fillColor = {127, 0, 0}, fillPattern = FillPattern.Solid, lineThickness = 0.5), Ellipse(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 0}, fillColor = {127, 0, 0}, fillPattern = FillPattern.Solid), Ellipse(extent = {{-80, 80}, {80, -80}}, lineColor = {127, 0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid)}));
    end FluidPort_b;

    connector FluidPorts_a "Fluid connector with filled, large icon to be used for vectors of FluidPorts (vector dimensions must be added after dragging)"
      extends FluidPort;
      annotation (
        defaultComponentName = "ports_a",
        Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-50, -200}, {50, 200}}, initialScale = 0.2), graphics={  Text(extent = {{-75, 130}, {75, 100}}, textString = "%name"), Rectangle(extent = {{25, -100}, {-25, 100}}, lineColor = {127, 0, 0}), Ellipse(extent = {{-25, 90}, {25, 40}}, lineColor = {0, 0, 0}, fillColor = {127, 0, 0}, fillPattern = FillPattern.Solid), Ellipse(extent = {{-25, 25}, {25, -25}}, lineColor = {0, 0, 0}, fillColor = {127, 0, 0}, fillPattern = FillPattern.Solid), Ellipse(extent = {{-25, -40}, {25, -90}}, lineColor = {0, 0, 0}, fillColor = {127, 0, 0}, fillPattern = FillPattern.Solid)}),
        Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-50, -200}, {50, 200}}, initialScale = 0.2), graphics={  Rectangle(extent = {{50, -200}, {-50, 200}}, lineColor = {127, 0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 0.5), Ellipse(extent = {{-50, 180}, {50, 80}}, lineColor = {0, 0, 0}, fillColor = {127, 0, 0}, fillPattern = FillPattern.Solid), Ellipse(extent = {{-50, 50}, {50, -50}}, lineColor = {0, 0, 0}, fillColor = {127, 0, 0}, fillPattern = FillPattern.Solid), Ellipse(extent = {{-50, -80}, {50, -180}}, lineColor = {0, 0, 0}, fillColor = {127, 0, 0}, fillPattern = FillPattern.Solid)}));
    end FluidPorts_a;

    partial model OnePort "Hydraulical OnePort"
      replaceable package Medium = Media.Water constrainedby
      Media.Interfaces.PartialMedium                                                        "Medium model" annotation (
         choicesAllMatching = true);
      outer Modelica.Fluid.System system "System wide properties";
      FluidPort_a q_in(redeclare package Medium = Medium) "Inflow" annotation (
        Placement(transformation(extent = {{-114, -14}, {-86, 14}})));
      FluidPort_b q_out(redeclare package Medium = Medium) "Outflow" annotation (
        Placement(transformation(extent = {{86, -14}, {114, 14}})));
      Physiolibrary.Types.MassFlowRate massFlowRate "Mass flow";
      Physiolibrary.Types.VolumeFlowRate volumeFlowRate "Volume flow";
      Physiolibrary.Types.Pressure dp "Pressure gradient";
      Modelica.Units.SI.Density density(start = Medium.density_pTX(system.p_ambient, system.T_ambient, Medium.reference_X));
      parameter Boolean EnthalpyNotUsed = false annotation (
        Evaluate = true,
        HideResult = true,
        choices(checkBox = true),
        Dialog(tab = "Advanced", group = "Performance"));
    equation
      q_in.m_flow + q_out.m_flow = 0;
      massFlowRate = q_in.m_flow;
      dp = q_in.p - q_out.p;
      q_in.Xi_outflow = inStream(q_out.Xi_outflow);
      q_in.C_outflow = inStream(q_out.C_outflow);
      q_out.Xi_outflow = inStream(q_in.Xi_outflow);
      q_out.C_outflow = inStream(q_in.C_outflow);
      volumeFlowRate * density = massFlowRate;
      if EnthalpyNotUsed then
        q_in.h_outflow = Medium.specificEnthalpy_pTX(system.p_ambient, system.T_ambient, Medium.reference_X);
        q_out.h_outflow = Medium.specificEnthalpy_pTX(system.p_ambient, system.T_ambient, Medium.reference_X);
        density = Medium.density_pTX(q_in.p, system.T_ambient, Medium.reference_X);
      else
        q_in.h_outflow = inStream(q_out.h_outflow);
        q_out.h_outflow = inStream(q_in.h_outflow);
        // medium density
        density = if q_in.m_flow >= 0 then Medium.density_phX(q_in.p, inStream(q_in.h_outflow), inStream(q_in.Xi_outflow)) else Medium.density_phX(q_out.p, inStream(q_out.h_outflow), inStream(q_out.Xi_outflow));
      end if;
    end OnePort;

    partial model OnePort_UpDown "OnePort with different position of connectors"
      replaceable package Medium = Media.Water constrainedby
      Media.Interfaces.PartialMedium                                                        "Medium model" annotation (
         choicesAllMatching = true);
      //Physiolibrary.Chemical.Examples.Media.SimpleBodyFluid_C
      Physiolibrary.Fluid.Interfaces.FluidPort_a q_up(redeclare package
        Medium =                                                                 Medium) "Top site" annotation (
        Placement(transformation(extent = {{86, 26}, {114, 54}}), iconTransformation(extent = {{86, 26}, {114, 54}})));
      Physiolibrary.Fluid.Interfaces.FluidPort_a q_down(redeclare package
        Medium =                                                                   Medium) "Bottom site" annotation (
        Placement(transformation(extent = {{84, -56}, {112, -28}}), iconTransformation(extent = {{84, -56}, {112, -28}})));
      Physiolibrary.Types.MassFlowRate massFlowRate "Mass flow";
      Physiolibrary.Types.VolumeFlowRate volumeFlowRate "Volume flow";
      Physiolibrary.Types.Pressure dp "Pressure gradient";
      Modelica.Units.SI.Density density;
    equation
      q_up.m_flow + q_down.m_flow = 0;
      massFlowRate = q_up.m_flow;
      dp = q_up.p - q_down.p;
      q_up.h_outflow = inStream(q_down.h_outflow);
      q_up.Xi_outflow = inStream(q_down.Xi_outflow);
      q_up.C_outflow = inStream(q_down.C_outflow);
      q_down.h_outflow = inStream(q_up.h_outflow);
      q_down.Xi_outflow = inStream(q_up.Xi_outflow);
      q_down.C_outflow = inStream(q_up.C_outflow);
      volumeFlowRate * density = massFlowRate;
    // medium density
      density = if q_up.m_flow >= 0 then Medium.density(Medium.setState_phX(q_up.p, inStream(q_up.h_outflow), inStream(q_up.Xi_outflow))) else Medium.density(Medium.setState_phX(q_down.p, inStream(q_down.h_outflow), inStream(q_down.Xi_outflow)));
      annotation (
        Documentation(revisions = "<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>",
        info = "<html>
      <p>One port for hydrostatic column.&nbsp;</p>
</html>"));
    end OnePort_UpDown;

    partial model ConditionalMassFlow "Input of solution mass flow vs. parametric solution mass flow"
      parameter Boolean useSolutionFlowInput = false "=true, if solution flow input is used instead of parameter SolutionFlow" annotation (
        Evaluate = true,
        HideResult = true,
        choices(checkBox = true),
        Dialog(group = "Conditional inputs"));
      parameter Physiolibrary.Types.MassFlowRate SolutionFlow = 0 "Mass flow of solution if useSolutionFlowInput=false" annotation (
        HideResult = not useSolutionFlowInput,
        Dialog(enable = not useSolutionFlowInput));
      Physiolibrary.Types.RealIO.MassFlowRateInput solutionFlow(start = SolutionFlow) = q if useSolutionFlowInput annotation (
        Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {0, 40}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {0, 70})));
      Physiolibrary.Types.MassFlowRate q "Current solution flow";
    equation
      if not useSolutionFlowInput then
        q = SolutionFlow;
      end if;
    end ConditionalMassFlow;

    partial model ConditionalVolumeFlow "Input of solution volume flow vs. parametric solution volume flow"
      parameter Boolean useSolutionFlowInput = false "=true, if solution flow input is used instead of parameter SolutionFlow" annotation (
        Evaluate = true,
        HideResult = true,
        choices(checkBox = true),
        Dialog(group = "Conditional inputs"));
      parameter Physiolibrary.Types.VolumeFlowRate SolutionFlow = 0 "Mass flow of solution if useSolutionFlowInput=false" annotation (
        HideResult = not useSolutionFlowInput,
        Dialog(enable = not useSolutionFlowInput));
      Physiolibrary.Types.RealIO.VolumeFlowRateInput solutionFlow(start = SolutionFlow) = q if useSolutionFlowInput annotation (
        Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {0, 40}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {0, 70})));
      Physiolibrary.Types.VolumeFlowRate q "Current solution flow";
    equation
      if not useSolutionFlowInput then
        q = SolutionFlow;
      end if;
    end ConditionalVolumeFlow;

    partial model CompositionSetup "Initial substances composition setup"
      replaceable package Medium = Media.Water
          constrainedby Media.Interfaces.PartialMedium "Medium model" annotation (
         choicesAllMatching = true);

      outer Modelica.Fluid.System system "System wide properties";
      parameter Boolean use_concentration_start = false "* Use concentration_start, otherwise massFraction_start" annotation (
        Evaluate = true,
        choices(checkBox = true),
        Dialog(group = "Initialization of medium composition"));
      parameter Modelica.Units.SI.MassFraction massFractions_start[:] = Medium.reference_X "* Masses of all base molecules. If size is nS-1 then last value is 1-sum(others). If size is nS then all values are scaled to sum==1." annotation (
        Dialog(enable = not use_concentration_start, group = "Initialization of medium composition"));
      parameter Modelica.Units.SI.Concentration concentration_start[:] = Medium.reference_X ./ Medium.MMb * Medium.density_pTX(pressure_start, temperature_start, Medium.reference_X) "* Amounts of all base molecules. If size is nS then mass fractions are scaled all base substance masses to sum=1 (this is not a good idea for non-gaseous solutions). If size is nS-1 then last substance is calculated from other specific volumes. If size is nS-2 then last but one substance is calculated from electroneutrality and last substance from specific volumes." annotation (
        Dialog(enable = use_concentration_start, group = "Initialization of medium composition"));
      parameter Real extraConcentration_start[Medium.nC] = Medium.C_default "Extra substance amounts per kilogram of solution"
        annotation(Dialog(group = "Initialization of medium composition"));
      parameter Modelica.Units.SI.Temperature temperature_start = system.T_ambient "Initial temperature" annotation (
        Dialog(group = "Initialization"));
      parameter Modelica.Units.SI.Pressure pressure_start = system.p_ambient "Initial pressure" annotation (
        Dialog(group = "Initialization"));

    protected
      parameter Modelica.Units.SI.MassFraction x_mass_start[Medium.nS] = if Medium.nS < 2 then {1} elseif use_concentration_start then if size(concentration_start, 1) == Medium.nS - 2 then cat(1, concentration_start .* Medium.MMb[1:Medium.nS - 2] ./ Medium.density_pTC(pressure_start, temperature_start, concentration_start), {-concentration_start * Medium.zb[1:Medium.nS - 2] * Medium.MMb[Medium.nS - 1] / Medium.density_pTC(pressure_start, temperature_start, concentration_start), 1 - (sum(concentration_start .* Medium.MMb[1:Medium.nS - 2]) - concentration_start * Medium.zb[1:Medium.nS - 2] * Medium.MMb[Medium.nS - 1]) ./ Medium.density_pTC(pressure_start, temperature_start, concentration_start)}) elseif size(concentration_start, 1) == Medium.nS - 1 then cat(1, concentration_start .* Medium.MMb[1:Medium.nS - 1] ./ Medium.density_pTC(pressure_start, temperature_start, concentration_start), {1 - sum(concentration_start .* Medium.MMb[1:Medium.nS - 1]) ./ Medium.density_pTC(pressure_start, temperature_start, concentration_start)})
        elseif size(concentration_start, 1) == Medium.nS then concentration_start .* Medium.MMb ./ sum(concentration_start .* Medium.MMb) else ones(Medium.nS) else if size(massFractions_start, 1) == Medium.nS - 1 then cat(1, massFractions_start, {1 - sum(massFractions_start)}) elseif size(massFractions_start, 1) == Medium.nS then massFractions_start ./ sum(massFractions_start) else ones(Medium.nS) "Initial mass fractions of substances";
      parameter Real C_start[Medium.nC] = extraConcentration_start "Extra substance amounts per kilogram of solution";
      annotation (
        Icon(coordinateSystem(preserveAspectRatio = false)),
        Diagram(coordinateSystem(preserveAspectRatio = false)));
    end CompositionSetup;

    partial model Accumulation
      extends Physiolibrary.Fluid.Interfaces.CompositionSetup;

      parameter Integer nPorts = 0 "Number of hydraulic ports" annotation (
        Evaluate = true,
        Dialog(connectorSizing = true, group = "Ports"));
      Interfaces.FluidPorts_a q_in[nPorts](redeclare package Medium = Medium, each h_outflow(nominal=Medium.SpecificEnthalpyNominal)) annotation (
        Placement(transformation(extent = {{-10, -28}, {10, 28}}), iconTransformation(extent = {{-7, -26}, {7, 26}}, rotation = 180, origin = {-1, 0})));
      parameter Boolean useSubstances = false "=true, if substance ports are used" annotation (
        Evaluate = true,
        HideResult = true,
        choices(checkBox = true),
        Dialog(group = "Conditional inputs"));
      parameter Boolean onElectricGround = false "=true, if electric potencial is zero" annotation (
        Evaluate = true,
        choices(checkBox = true));
      //,Dialog(group="Conditional inputs"));
      Chemical.Interfaces.SubstancePorts_a substances[Medium.nS](q(nominal=Medium.SubstanceFlowNominal)) if useSubstances annotation (
        Placement(transformation(extent = {{-110, -40}, {-90, 40}}), iconTransformation(extent = {{-110, -40}, {-90, 40}})));

      Medium.ChemicalSolution chemicalSolution(
        startSubstanceMasses = m_start,
        p = pressure,
        h = enthalpy / mass,
        X = if not Medium.reducedX then massFractions else cat(1, massFractions, {1 - sum(massFractions)}),
        _i = i,
        EnthalpyNotUsed = EnthalpyNotUsed)  if useSubstances;                              //enthalpy / mass,

      parameter Boolean use_mass_start = false "Use mass_start, otherwise volume_start" annotation (
        Evaluate = true,
        choices(checkBox = true),
        Dialog(group = "Initialization"));
      parameter Physiolibrary.Types.Volume volume_start=0.001   "Total volume of solution start value" annotation (
        HideResult = use_mass_start,
        Dialog(enable = not use_mass_start, group = "Initialization"));
      parameter Physiolibrary.Types.Mass mass_start(displayUnit="kg")=1     "Total mass of solution start value" annotation (
        HideResult = not use_mass_start,
        Dialog(enable = use_mass_start, group = "Initialization"));


      parameter Boolean useThermalPort = false "Is thermal port pressent?" annotation (
        Evaluate = true,
        HideResult = true,
        choices(checkBox = true),
        Dialog(group = "Conditional inputs"));

      Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort(T = Medium.temperature_phX(pressure, enthalpy / mass, massFractions), Q_flow = heatFromEnvironment) if useThermalPort annotation (
        Placement(transformation(extent = {{-70, -90}, {-50, -70}}), iconTransformation(extent={{-70,
              -110},{-50,-90}})));
    protected
      parameter Boolean EnthalpyNotUsed = false annotation (
        Evaluate = true,
        HideResult = true,
        choices(checkBox = true),
        Dialog(tab = "Advanced", group = "Performance"));
      Physiolibrary.Types.Enthalpy enthalpy2;

      parameter Physiolibrary.Types.Mass tm_start(displayUnit = "kg") = if use_mass_start then mass_start else volume_start * Medium.density_pTX(pressure_start, temperature_start, x_mass_start) "If both mass_start and volume_start are filled";

      parameter Modelica.Units.SI.Mass m_start[Medium.nS] = tm_start * x_mass_start[1:Medium.nS];
      Modelica.Units.SI.ElectricCurrent i;
    public
      Physiolibrary.Types.HeatFlowRate heatFromEnvironment;

      Physiolibrary.Types.Enthalpy enthalpy(start = tm_start * Medium.specificEnthalpy_pTX(pressure_start, temperature_start, x_mass_start));


      Physiolibrary.Types.Mass mass(start = tm_start);
      Physiolibrary.Types.MassFraction massFractions[Medium.nXi];
      Physiolibrary.Types.MassFraction xx_mass[nPorts, Medium.nXi] "Substance mass fraction per fluid port";

      Real xC_mass[nPorts, Medium.nC] "Extra substance in 1 kg of solution per fluid port";
      Real extraSubstanceAmounts[Medium.nC](start = tm_start * C_start) "Current amount of extra substances";
      Real extraSubstanceConcentrations[Medium.nC](start = C_start) "Current anount per kg of extra substances";

      Physiolibrary.Types.Volume volume;
      Physiolibrary.Types.Density density;
    protected
      Physiolibrary.Types.Pressure pressure;
      Physiolibrary.Types.RealIO.SpecificEnthalpyOutput specificEnthalpies[Medium.nS] "Specific substances enthalpies [J/kg]";
      Physiolibrary.Types.RealIO.SpecificEnthalpyOutput actualStreamSpecificEnthalpies[Medium.nS] "Actual stream substances enthalpies [J/kg]";
      Physiolibrary.Types.RealIO.MassFlowRateOutput massFlows[Medium.nS](nominal=Medium.SubstanceFlowNominal);
      Physiolibrary.Types.RealIO.ElectricPotentialOutput v;

      Physiolibrary.Types.RealIO.MassFlowRateOutput substanceMassFlowsFromStream[Medium.nS](nominal=Medium.SubstanceFlowNominal);
      Physiolibrary.Types.RealIO.MassInput substanceMasses[Medium.nS](nominal=Medium.SubstanceFlowNominal);

    initial equation
      assert(abs(1 - sum(x_mass_start)) < 1e-5, "Sum of x_mass_start must be 1. (Composition initialization failed)");
    /* assert(
  not ((compositionType == Physiolibrary.Fluid.Interfaces.CompositionType.Concentration) and (size(concentration_start,1)==Medium.nS-2) and (Medium.nS<2) or 
  (Medium.zb[Medium.nS - 1]==0)), "Initial electroneutral concentration composition is not supported with this medium (try to use mass fractions)!");
*/
    /*  assert(
  not ((compositionType == Physiolibrary.Fluid.Interfaces.CompositionType.Concentration) and (size(concentration_start,1)>=Medium.nS-2)),
  "Initial concentration composition must have at least 
  -2 values!");
  */
      if not useSubstances then
        substanceMasses = m_start;
      end if;
      if Medium.reducedX then
        mass = tm_start;
      end if;
      //substanceMasses = m_start;
      if not EnthalpyNotUsed and not useSubstances then
        enthalpy = tm_start * Medium.specificEnthalpy_pTX(pressure_start, temperature_start, x_mass_start);
      end if;


    equation
      enthalpy2 = specificEnthalpies*substanceMasses;
      if onElectricGround then
        v = 0;
      else
        i = 0;
      end if;
      if not useThermalPort then
        heatFromEnvironment = 0;
      end if;
      if useSubstances then
        connect(substances, chemicalSolution.substances);
        connect(chemicalSolution.massFlows, massFlows);
        connect(chemicalSolution.actualStreamSpecificEnthalpies, actualStreamSpecificEnthalpies);
        connect(chemicalSolution.specificEnthalpies, specificEnthalpies);
        connect(chemicalSolution.substanceMasses, substanceMasses);
        connect(chemicalSolution.substanceMassFlowsFromStream, substanceMassFlowsFromStream);
        connect(v, chemicalSolution.v);
        /*q_in.m_flow * actualStream(q_in.h_outflow) + heatFromEnvironment =
      if (EnthalpyNotUsed) then  0
      else    der(specificEnthalpies)*substanceMasses + massFlows*specificEnthalpies
              -massFlows*(actualStreamSpecificEnthalpies)
              "heat transfer from/to substances in solution [J/s]"; */


      else
        der(substanceMasses) = substanceMassFlowsFromStream;

        massFlows = zeros(Medium.nS);
        specificEnthalpies = zeros(Medium.nS);
        actualStreamSpecificEnthalpies = zeros(Medium.nS);

      // not used
        if not onElectricGround then
        //both electric variables set to zero
          v = 0;
        else
          i = 0;
        end if;
      end if;

      substanceMassFlowsFromStream =  (if not Medium.reducedX then q_in.m_flow*xx_mass else cat(1, q_in.m_flow*xx_mass, {q_in.m_flow*(ones(nPorts) - xx_mass*ones(Medium.nXi))}));


      der(extraSubstanceAmounts) = q_in.m_flow * xC_mass;


      mass = sum(substanceMasses);

      massFractions = substanceMasses[1:Medium.nXi] ./ mass;
      if EnthalpyNotUsed then
        enthalpy = mass * Medium.specificEnthalpy_pTX(system.p_ambient, system.T_ambient, Medium.reference_X);
      else
        der(enthalpy) = q_in.m_flow * actualStream(q_in.h_outflow) + massFlows * actualStreamSpecificEnthalpies + heatFromEnvironment;
      end if;
      volume = mass / density;
      if EnthalpyNotUsed then
        density = Medium.density_pTX(pressure, temperature_start, massFractions);
      else
        density = Medium.density_phX(pressure, enthalpy / mass, massFractions);
      end if;
      extraSubstanceConcentrations = extraSubstanceAmounts ./ mass;
      for i in 1:nPorts loop
        xx_mass[i, :] = actualStream(q_in[i].Xi_outflow);
        xC_mass[i, :] = actualStream(q_in[i].C_outflow);
        q_in[i].p = pressure;
        q_in[i].h_outflow = enthalpy / mass;
        q_in[i].Xi_outflow = massFractions;
        q_in[i].C_outflow  = extraSubstanceConcentrations;
      end for;

      annotation (
        Icon(coordinateSystem(preserveAspectRatio = false)),
        Diagram(coordinateSystem(preserveAspectRatio = false)));
    end Accumulation;

    partial model PartialAbsoluteSensor "Partial component to model a sensor that measures a potential variable"
      replaceable package Medium = Physiolibrary.Media.Water constrainedby
      Physiolibrary.Media.Interfaces.PartialMedium                                                                      "Medium in the sensor" annotation (
         choicesAllMatching = true);
      Modelica.Fluid.Interfaces.FluidPort_a
                  port(redeclare package Medium = Medium, m_flow(min = 0)) annotation (
        Placement(transformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
    equation
      port.m_flow = 0;
      port.h_outflow = Medium.h_default;
      port.Xi_outflow = Medium.X_default[1:Medium.nXi];
      port.C_outflow = Medium.C_default;
      annotation (
        Documentation(info = "<html>
<p>
Partial component to model an <strong>absolute sensor</strong>. Can be used for pressure sensor models.
Use for other properties such as temperature or density is discouraged, because the enthalpy at the connector can have different meanings, depending on the connection topology. Use <code>PartialFlowSensor</code> instead.
as signal.
</p>
</html>"));
    end PartialAbsoluteSensor;

  end Interfaces;

  package Sensors
    extends Modelica.Icons.SensorsPackage;

    model FlowMeasure "Volumetric flow between ports"
      extends Physiolibrary.Fluid.Interfaces.OnePort;
      // extends Icons.FlowMeasure;
      extends Modelica.Icons.RoundSensor;
      Physiolibrary.Types.RealIO.MassFlowRateOutput massFlow
      "Actual mass flow rate"                                                        annotation (
        Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {0, -60}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 90, origin = {0, 120})));
      Physiolibrary.Types.VolumeFlowRate volumeInflowRate;
      Physiolibrary.Types.VolumeFlowRate volumeOutflowRate;
    protected
      Medium.ThermodynamicState state_inflow "state for medium inflowing through q_in";
      Medium.ThermodynamicState state_outflow "state for medium outflowing through q_out";
      Modelica.Units.SI.Density density_inflow;
      Modelica.Units.SI.Density density_outflow;
    equation
      q_out.p = q_in.p;
      massFlow = q_in.m_flow;
    // medium states
      state_inflow = Medium.setState_phX(q_in.p, inStream(q_in.h_outflow), inStream(q_in.Xi_outflow));
      state_outflow = Medium.setState_phX(q_out.p, inStream(q_out.h_outflow), inStream(q_out.Xi_outflow));
      density_inflow = Medium.density(state_inflow);
      density_outflow = Medium.density(state_outflow);
      volumeInflowRate = massFlow / density_inflow;
      volumeOutflowRate = massFlow / density_outflow;
      annotation (
        Documentation(revisions = "<html>
	<p><i>2009-2018</i></p>
	<p>Marek Matejak, marek@matfyz.cz </p>
	</html>"),
        Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Text(extent = {{-25, -11}, {34, -70}}, lineColor = {0, 0, 0}, textString = "V'")}));
    end FlowMeasure;

    model PressureMeasure "Hydraulic pressure at port"
      extends Physiolibrary.Icons.PressureMeasure;
      extends Fluid.Interfaces.PartialAbsoluteSensor;

      outer Modelica.Fluid.System system "System wide properties";
      parameter Boolean GetAbsolutePressure = false "if false then output pressure is relative to ambient pressure" annotation (
        Evaluate = true,
        choices(checkBox = true));
      Physiolibrary.Types.RealIO.PressureOutput pressure "Pressure" annotation (
        Placement(transformation(extent = {{40, -60}, {80, -20}})));
    equation
      pressure =port.p  - (if GetAbsolutePressure then 0 else system.p_ambient);

      annotation (
        Documentation(revisions = "<html>
        <p><i>2009-2018</i></p>
        <p>Marek Matejak, marek@matfyz.cz </p>
        </html>"));
    end PressureMeasure;

    model MassFractions "Ideal one port mass fraction sensor"
      extends Modelica.Icons.RoundSensor;
      extends Physiolibrary.Fluid.Interfaces.PartialAbsoluteSensor;

      parameter String substanceName = "CO2" "Name of mass fraction";
      Physiolibrary.Types.RealIO.MassFractionOutput Xi "Mass fraction in port medium" annotation (
        Placement(transformation(extent = {{100, -10}, {120, 10}})));
    protected
      parameter Integer ind(fixed = false) "Index of species in vector of independent mass fractions";
      Medium.MassFraction XiVec[Medium.nS] "Mass fraction vector, needed because indexed argument for the operator inStream is not supported";
    initial algorithm
      ind := -1;
      for i in 1:Medium.nS loop
        if Modelica.Utilities.Strings.isEqual(Medium.substanceNames[i], substanceName) then
          ind := i;
        end if;
      end for;
      assert(ind > 0, "Mass fraction '" + substanceName + "' is not present in medium '" + Medium.mediumName + "'.\n" + "Check sensor parameter and medium model.");
    equation
      XiVec[1:Medium.nXi] = inStream(port.Xi_outflow);
      if Medium.reducedX then
        XiVec[Medium.nX] = 1 - sum(XiVec[1:Medium.nXi]);
      end if;
      Xi = XiVec[ind];
      annotation (
        defaultComponentName = "massFraction",
        Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Line(points = {{0, -70}, {0, -100}}, color = {0, 0, 127}), Text(extent = {{-150, 72}, {150, 112}}, textString = "%name", lineColor = {162, 29, 33}), Text(extent = {{160, -30}, {60, -60}}, textString = "Xi"), Line(points = {{70, 0}, {100, 0}}, color = {0, 0, 127})}),
        Documentation(info = "<html>
        <p>
        This component monitors the mass fraction contained in the fluid passing its port.
        The sensor is ideal, i.e., it does not influence the fluid.
        </p>
        </html>",
                revisions = "<html>
        <ul>
        <li>2011-12-14: Stefan Wischhusen: Initial Release.</li>
        </ul>
        </html>"));
    end MassFractions;

    /*
      	  model MolarConcentrations "Ideal one port molarity sensor"
      	    extends Modelica.Fluid.Sensors.BaseClasses.PartialAbsoluteSensor(redeclare
      		package Medium = Physiolibrary.Media.SimpleWater);
      	    extends Modelica.Icons.RotationalSensor;
      	    parameter String substanceName = "CO2" "Name of substance";
      
      	    Types.RealIO.ConcentrationOutput c "Molar concentration in port medium"
      	      annotation (Placement(transformation(extent={{100,-10},{120,10}})));
      
      	  protected
      	    parameter Integer ind(fixed=false)
      	      "Index of species in vector of independent mass fractions";
      	    Types.Concentration cVec[Medium.nCS]
      	      "Concentration vector, needed because indexed argument for the operator inStream is not supported";
      	    Medium.ThermodynamicState state = Medium.setState_phX(port.p,inStream(port.h_outflow));
      
      	  initial algorithm
      	    ind:= -1;
      	    for i in 1:Medium.nXi loop
      	      if ( Modelica.Utilities.Strings.isEqual(Medium.substanceNames[i], substanceName)) then
      		ind := i;
      	      end if;
      	    end for;
      	    assert(ind > 0, "Mass fraction '" + substanceName + "' is not present in medium '"
      		   + Medium.mediumName + "'.\n"
      		   + "Check sensor parameter and medium model.");
      	  equation
      	    cVec = Medium.concentration(state,inStream(port.Xi_outflow),inStream(port.C_outflow));
      	    c = cVec[ind];
      	  annotation (defaultComponentName="massFraction",
      	    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
      		      100}}), graphics={
      		  Line(points={{0,-70},{0,-100}}, color={0,0,127}),
      		  Text(
      		    extent={{-150,80},{150,120}},
      		    textString="%name",
      		    lineColor={0,0,255}),
      		  Text(
      		    extent={{160,-30},{60,-60}},
      		    textString="Xi"),
      		  Line(points={{70,0},{100,0}}, color={0,0,127})}),
      	    Documentation(info="<html>
      	<p>
      	This component monitors the mass fraction contained in the fluid passing its port.
      	The sensor is ideal, i.e., it does not influence the fluid.
      	</p>
      	</html>",   revisions="<html>
      	<ul>
      	<li>2011-12-14: Stefan Wischhusen: Initial Release.</li>
      	</ul>
      	</html>"));
      	end MolarConcentrations;
      	*/

    model PartialPressure "Measure of partial pressure of the substance"
      extends Modelica.Icons.RoundSensor;
      extends Fluid.Interfaces.PartialAbsoluteSensor;
      extends Chemical.Interfaces.PartialSubstance;

      Physiolibrary.Types.RealIO.PressureOutput partialPressure "Partial pressure of the substance in gaseous solution" annotation (
        Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {0, -60}), iconTransformation(extent = {{-20, -20}, {20, 20}}, origin = {-100, 0}, rotation = 180)));

    protected
      Medium.ThermodynamicState state;
    equation
      partialPressure = x * state.p;
      state =Medium.setState_phX(
        port.p,
        inStream(port.h_outflow),
        inStream(port.Xi_outflow));
    //aliases
      temperature = state.T;
      pressure = state.p;

      electricPotential = 0;
      moleFractionBasedIonicStrength = 0;
      port_a.q = 0;

      annotation (
        Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Text(extent = {{-31, -3}, {28, -62}}, lineColor = {0, 0, 0}, textString = "p"), Line(points = {{70, 0}, {80, 0}}, color = {127, 0, 127}), Text(extent = {{-150, 72}, {150, 112}}, textString = "%name", lineColor = {162, 29, 33})}),
        Documentation(revisions = "<html>
<p><i>2009-2015</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end PartialPressure;

    model Temperature "Temperature sensor"
      extends Modelica.Icons.RoundSensor;
      extends Physiolibrary.Fluid.Interfaces.PartialAbsoluteSensor;

      Physiolibrary.Types.RealIO.TemperatureOutput T "Temperature" annotation (
        Placement(transformation(extent = {{100, -10}, {120, 10}})));
    equation
      T = Medium.temperature_phX(port.p, inStream(port.h_outflow), inStream(port.Xi_outflow));
      annotation (
        defaultComponentName = "temperature",
        Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Line(points = {{0, -70}, {0, -100}}, color = {0, 0, 127}), Text(extent = {{-150, 80}, {150, 120}}, lineColor = {162, 29, 33}, textString = "%name"), Text(extent = {{160, -30}, {60, -60}}, textString = "T", textColor = {0, 0, 0}), Line(points = {{70, 0}, {100, 0}}, color = {0, 0, 127})}),
        Documentation(info = "<html>
        <p>
        This component monitors the temperature contained in the fluid passing its port.
        The sensor is ideal, i.e., it does not influence the fluid.
        </p>
        </html>"));
    end Temperature;

    model pH "Measure of pH (acidity) of the solution"
      extends Modelica.Icons.RoundSensor;
      extends Fluid.Interfaces.PartialAbsoluteSensor;
      extends Chemical.Interfaces.PartialSubstance(final substanceData = if useHydronium then Chemical.Substances.Hydronium_aqueous() else Chemical.Substances.Proton_aqueous(), redeclare
          final package
                      stateOfMatter =
          Chemical.Interfaces.Incompressible);

      Physiolibrary.Types.RealIO.pHOutput pH "Acidity of the solution" annotation (
        Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {0, -60}), iconTransformation(extent = {{-20, -20}, {20, 20}}, origin = {-100, 0}, rotation = 180)));
      parameter Boolean useHydronium = false "Measured substance is H3O+ instead of H+";
      Types.SpecificEnthalpy h;
    protected
      Medium.ThermodynamicState state;
    equation
      pH = -log10(a);
      h =inStream(port.h_outflow);
      state =Medium.setState_phX(
        port.p,
        h,
        inStream(port.Xi_outflow));
    //aliases
      temperature = state.T;
      pressure = state.p;

      electricPotential = 0;
      moleFractionBasedIonicStrength = 0;
      port_a.q = 0;


      annotation (
        Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Text(extent = {{-31, -3}, {28, -62}}, lineColor={0,0,0},
              textString="pH"),                                                                                                                                                              Line(points = {{70, 0}, {80, 0}}, color = {127, 0, 127}), Text(extent = {{-150, 72}, {150, 112}}, textString = "%name", lineColor = {162, 29, 33})}),
        Documentation(revisions = "<html>
<p><i>2009-2015</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end pH;

    model BloodGasesMeasurement
      extends Modelica.Icons.RoundSensor;
      outer Modelica.Fluid.System system;
      replaceable package Medium =
        Physiolibrary.Media.Blood                             "Blood" annotation (
        choicesAllMatching = true);
      Physiolibrary.Fluid.Interfaces.FluidPort_a a_port(redeclare package
        Medium =                                                                   Medium) annotation (
        Placement(transformation(extent = {{-70, -112}, {-50, -92}}), iconTransformation(extent = {{-70, -112}, {-50, -92}})));
      Physiolibrary.Fluid.Sensors.PartialPressure pO2_measure(redeclare package
                stateOfMatter =
          Chemical.Interfaces.IdealGas,                                                                                       substanceData = Chemical.Substances.Oxygen_gas(), redeclare
          package
                Medium =                                                                                                                                                                                   Medium) annotation (
        Placement(transformation(extent = {{50, 50}, {30, 70}})));
      Physiolibrary.Fluid.Sensors.pH pH_measure(redeclare package Medium = Medium) annotation (
        Placement(transformation(extent = {{-24, -70}, {-44, -50}})));
      Physiolibrary.Fluid.Sensors.PartialPressure pCO2_measure(redeclare
          package
                stateOfMatter =
          Chemical.Interfaces.IdealGas,                                                                                        substanceData = Chemical.Substances.CarbonDioxide_gas(), redeclare
          package
                Medium =                                                                                                                                                                                           Medium) annotation (
        Placement(transformation(extent = {{12, -10}, {-8, 10}})));
      Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasureSystemicCapillaries(redeclare
          package
                Medium =                                                                                        Medium) annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {78, -76})));
      Chemical.Interfaces.SubstancePort_a CO2 annotation (
        Placement(transformation(extent = {{-110, -10}, {-90, 10}})));
      Chemical.Interfaces.SubstancePort_a H_plus "H+" annotation (
        Placement(transformation(extent = {{-110, -70}, {-90, -50}})));
      Chemical.Interfaces.SubstancePort_a O2 annotation (
        Placement(transformation(extent = {{-110, 50}, {-90, 70}})));
      Physiolibrary.Types.RealIO.PressureOutput pressure annotation (
        Placement(transformation(extent = {{100, -90}, {120, -70}}), iconTransformation(extent = {{100, -90}, {120, -70}})));
      Physiolibrary.Types.RealIO.pHOutput pH annotation (
        Placement(transformation(extent = {{100, -50}, {120, -30}}), iconTransformation(extent = {{100, -50}, {120, -30}})));
      Physiolibrary.Types.RealIO.PressureOutput pO2 annotation (
        Placement(transformation(extent = {{100, 30}, {120, 50}}), iconTransformation(extent = {{100, 30}, {120, 50}})));
      Physiolibrary.Types.RealIO.PressureOutput pCO2 annotation (
        Placement(transformation(extent = {{100, -10}, {120, 10}}), iconTransformation(extent = {{100, -10}, {120, 10}})));
      Interfaces.FluidPort_a b_port(redeclare package Medium = Medium) annotation (
        Placement(transformation(extent = {{52, -112}, {72, -92}}), iconTransformation(extent = {{52, -112}, {72, -92}})));
      Types.RealIO.FractionOutput sO2 "Oxygen saturation (amount of oxygen per amount of hemoglobin units)" annotation (
        Placement(transformation(extent = {{100, 70}, {120, 90}}), iconTransformation(extent = {{100, 70}, {120, 90}})));
      Modelica.Units.SI.SpecificEnthalpy h;
      Modelica.Units.SI.MassFraction X[Medium.nXi];
      Modelica.Units.SI.Concentration c[Medium.nS];
      Modelica.Units.SI.Density d;
    equation
      h = actualStream(a_port.h_outflow);
      X = actualStream(a_port.Xi_outflow);
      d = Medium.density_phX(a_port.p, h, X);
      c = Medium.concentrations_Xd(X, d);
      sO2 =c[Medium.i("O2")]/c[Medium.i("Hb")];
      connect(pressureMeasureSystemicCapillaries.port, a_port) annotation (
        Line(points={{78,-86},{78,-90},{40,-90},{40,-84},{-60,-84},{-60,-102}},              color = {127, 0, 0}, thickness = 0.5));
      connect(pCO2_measure.port, a_port) annotation (Line(
          points={{2,-10},{2,-84},{-60,-84},{-60,-102}},
          color={127,0,0},
          thickness=0.5));
      connect(pH_measure.port, a_port) annotation (Line(
          points={{-34,-70},{-34,-82},{-60,-82},{-60,-102}},
          color={127,0,0},
          thickness=0.5));
      connect(pO2_measure.port, a_port) annotation (Line(
          points={{40,50},{40,-84},{-60,-84},{-60,-102}},
          color={127,0,0},
          thickness=0.5));
      connect(pCO2_measure.port_a, CO2) annotation (
        Line(points = {{-8, 0}, {-100, 0}}, color = {158, 66, 200}));
      connect(H_plus, pH_measure.port_a) annotation (
        Line(points = {{-100, -60}, {-44, -60}}, color = {158, 66, 200}));
      connect(pO2_measure.port_a, O2) annotation (
        Line(points = {{30, 60}, {-100, 60}}, color = {158, 66, 200}));
      connect(pressureMeasureSystemicCapillaries.pressure, pressure) annotation (
        Line(points = {{84, -80}, {96, -80}, {96, -80}, {110, -80}}, color = {0, 0, 127}));
      connect(pO2_measure.partialPressure, pO2) annotation (
        Line(points = {{50, 60}, {80, 60}, {80, 40}, {110, 40}}, color = {0, 0, 127}));
      connect(pCO2_measure.partialPressure, pCO2) annotation (
        Line(points = {{12, 0}, {60, 0}, {60, 0}, {110, 0}}, color = {0, 0, 127}));
      connect(pH_measure.pH, pH) annotation (
        Line(points = {{-24, -60}, {42, -60}, {42, -40}, {110, -40}}, color = {0, 0, 127}));
      connect(a_port, b_port) annotation (
        Line(points = {{-60, -102}, {-60, -100}, {62, -100}, {62, -102}}, color = {127, 0, 0}, thickness = 0.5));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio = false), graphics={  Text(extent = {{-150, 80}, {150, 120}}, textString = "%name", lineColor = {162, 29, 33})}),
        Diagram(coordinateSystem(preserveAspectRatio = false)));
    end BloodGasesMeasurement;

    model Power "Power as pressure multiplied by volumetric flow between ports"
      extends Physiolibrary.Fluid.Interfaces.OnePort;
      extends Modelica.Icons.RoundSensor;
      Physiolibrary.Types.RealIO.PowerOutput power "Actual power" annotation (
        Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {0, -60}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 90, origin = {0, 120})));
    equation
      q_out.p = q_in.p;
      power = q_in.p * volumeFlowRate;
      annotation (
        Documentation(revisions = "<html>
        <p><i>2009-2018</i></p>
        <p>Marek Matejak, marek@matfyz.cz </p>
        </html>"),
        Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Text(extent = {{-25, -11}, {34, -70}}, lineColor = {0, 0, 0}, textString = "V'")}));
    end Power;

    model Sphygmomanometer "Systolic, diastolic and mean pressure measurement with latency of measurement time"
      extends Physiolibrary.Icons.PressureMeasure;
      extends Fluid.Interfaces.PartialAbsoluteSensor;
      parameter Physiolibrary.Types.Time MeasurementTime = 2 "Measurement time period";
      outer Modelica.Fluid.System system "System wide properties";
      Physiolibrary.Types.RealIO.PressureOutput diastolic "Diastolic pressure" annotation (
        Placement(transformation(extent = {{40, -60}, {80, -20}})));
      Types.RealIO.PressureOutput systolic "Systolic pressure" annotation (
        Placement(transformation(extent = {{40, 0}, {80, 40}})));
      Types.RealIO.PressureOutput mean "Mean pressure" annotation (
        Placement(transformation(extent = {{40, -30}, {80, 10}})));
    protected
      Boolean b;
      discrete Physiolibrary.Types.Time t0;
      discrete Physiolibrary.Types.Pressure systolicMeassured, diastolicMeassured, meanMeasured;
      Physiolibrary.Types.Pressure pressure, diastolicRunning, systolicRunning;
      Real pressureInt;
    equation
      diastolic = diastolicMeassured;
      systolic = systolicMeassured;
      mean = meanMeasured;
      der(diastolicRunning) = if pressure < diastolicRunning then min(0, der(pressure)) else 0;
      der(systolicRunning) = if pressure > systolicRunning then max(0, der(pressure)) else 0;
      der(pressureInt) = pressure;
      b = time - pre(t0) >= MeasurementTime;
      when {initial(), b} then
        t0 = time;
        diastolicMeassured = pre(diastolicRunning);
        systolicMeassured = pre(systolicRunning);
        meanMeasured = pre(pressureInt) / MeasurementTime;
        reinit(diastolicRunning, pressure);
        reinit(systolicRunning, pressure);
        reinit(pressureInt, 0);
      end when;
      pressure =port.p  - system.p_ambient;

      annotation (
        Documentation(revisions = "<html>
        <p><i>2009-2018</i></p>
        <p>Marek Matejak, marek@matfyz.cz </p>
        </html>"));
    end Sphygmomanometer;

    model VolumeFlowMeasure "Volumetric flow between ports"
      extends Physiolibrary.Fluid.Interfaces.OnePort;
      // extends Icons.FlowMeasure;
      extends Modelica.Icons.RoundSensor;
      Types.RealIO.VolumeFlowRateOutput volumeFlow "Actual volume flow rate"
        annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,-60}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={0,120})));
      Physiolibrary.Types.VolumeFlowRate volumeInflowRate;
      Physiolibrary.Types.VolumeFlowRate volumeOutflowRate;
    protected
      Medium.ThermodynamicState state_inflow "state for medium inflowing through q_in";
      Medium.ThermodynamicState state_outflow "state for medium outflowing through q_out";
      Modelica.Units.SI.Density density_inflow;
      Modelica.Units.SI.Density density_outflow;
    equation
      q_out.p = q_in.p;
      volumeFlow = volumeFlowRate;
    // medium states
      state_inflow = Medium.setState_phX(q_in.p, inStream(q_in.h_outflow), inStream(q_in.Xi_outflow));
      state_outflow = Medium.setState_phX(q_out.p, inStream(q_out.h_outflow), inStream(q_out.Xi_outflow));
      density_inflow = Medium.density(state_inflow);
      density_outflow = Medium.density(state_outflow);
      volumeInflowRate = massFlowRate/density_inflow;
      volumeOutflowRate = massFlowRate/density_outflow;
      annotation (
        Documentation(revisions = "<html>
        <p><i>2009-2018</i></p>
        <p>Marek Matejak, marek@matfyz.cz </p>
        </html>"),
        Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Text(extent = {{-25, -11}, {34, -70}}, lineColor = {0, 0, 0}, textString = "V'")}));
    end VolumeFlowMeasure;
  end Sensors;

  package Sources
    extends Modelica.Icons.SourcesPackage;

    model MassInflowSource "Prescribed mass flow rate at port with unlimited mass"
      extends Physiolibrary.Fluid.Interfaces.ConditionalMassFlow;
      extends Physiolibrary.Fluid.Interfaces.CompositionSetup;

      Physiolibrary.Fluid.Interfaces.FluidPort_b q_out(redeclare package
        Medium =                                                                  Medium) annotation (
        Placement(transformation(extent = {{86, -14}, {114, 14}})));

      parameter Modelica.Units.SI.SpecificEnthalpy h = Medium.specificEnthalpy(Medium.setState_pTX(pressure_start, temperature_start, x_mass_start)) "Fluid enthalphy";
    equation
      q_out.m_flow = -q;
      q_out.h_outflow = h;
      q_out.Xi_outflow = x_mass_start[1:Medium.nXi];
      q_out.C_outflow = C_start;
      annotation (
        Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-100, -50}, {100, 50}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Polygon(points = {{-80, 25}, {80, 0}, {-80, -25}, {-80, 25}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid), Text(extent = {{-150, -94}, {150, -54}}, textString = "%name", lineColor = {0, 0, 255})}),
        Documentation(revisions = "<html>
        <table>
        <tr>
        <td>Author:</td>
        <td>Marek Matejak</td>
        </tr>
        <tr>
        <td>By:</td>
        <td>marek@matfyz.cz</td>
        </tr>
        <tr>
        <td>Date of:</td>
        <td>january 2009-2018</td>
        </tr>
        </table>
        </html>",
                info = "<html>
        <p><font style=\"font-size: 9pt; \">This element needs to be connected only to next hydraulic elements, which contain calculation of hydraulic pressure in connector. It is because equation contains only </font><b><font style=\"font-size: 9pt; \">hydraulic volume flow</font></b><font style=\"font-size: 9pt; \"> variable, which is set to value of input signal variable. </font></p>
        </html>"));
    end MassInflowSource;

    model VolumeInflowSource "Prescribed volume flow rate at port with unlimited mass"
      extends Physiolibrary.Fluid.Interfaces.ConditionalVolumeFlow;
      extends Physiolibrary.Fluid.Interfaces.CompositionSetup;

      Physiolibrary.Fluid.Interfaces.FluidPort_b q_out(redeclare package
        Medium =                                                                  Medium) annotation (
        Placement(transformation(extent = {{86, -14}, {114, 14}})));

    //protected
      parameter Modelica.Units.SI.SpecificEnthalpy h = Medium.specificEnthalpy_pTX(pressure_start, temperature_start, x_mass_start) "Fluid enthalphy";
      Modelica.Units.SI.Density density;
    equation
      q_out.m_flow = -q * density;
      q_out.h_outflow = h;
      q_out.Xi_outflow = x_mass_start[1:Medium.nXi];
      q_out.C_outflow = C_start;
      density = Medium.density(Medium.setState_phX(q_out.p, inStream(q_out.h_outflow), inStream(q_out.Xi_outflow)));
    // medium density
      annotation (
        Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-100, -50}, {100, 50}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Polygon(points = {{-80, 25}, {80, 0}, {-80, -25}, {-80, 25}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid), Text(extent = {{-150, -94}, {150, -54}}, textString = "%name", lineColor = {0, 0, 255})}),
        Documentation(revisions = "<html>
        <table>
        <tr>
        <td>Author:</td>
        <td>Marek Matejak</td>
        </tr>
        <tr>
        <td>By:</td>
        <td>marek@matfyz.cz</td>
        </tr>
        <tr>
        <td>Date of:</td>
        <td>january 2009-2018</td>
        </tr>
        </table>
        </html>",
                info = "<html>
        <p><font style=\"font-size: 9pt; \">This element needs to be connected only to next hydraulic elements, which contain calculation of hydraulic pressure in connector. It is because equation contains only </font><b><font style=\"font-size: 9pt; \">hydraulic volume flow</font></b><font style=\"font-size: 9pt; \"> variable, which is set to value of input signal variable. </font></p>
        </html>"));
    end VolumeInflowSource;

    model PressureSource "Prescribed pressure at port with unlimited mass"
      parameter Modelica.Units.SI.Pressure pressure_start = system.p_ambient "Initial pressure" annotation (
        Dialog(enable = not usePressureInput, group = "Initialization"));
      extends Physiolibrary.Fluid.Interfaces.CompositionSetup;

      parameter Boolean usePressureInput = false "=true, if pressure input is used" annotation (
        Evaluate = true,
        HideResult = true,
        choices(checkBox = true),
        Dialog(group = "Conditional inputs"));

      Physiolibrary.Types.RealIO.PressureInput pressure(start = pressure_start) = p if usePressureInput "Pressure" annotation (
        Placement(transformation(extent = {{-120, -20}, {-80, 20}})));
      Physiolibrary.Fluid.Interfaces.FluidPort_a y(redeclare package Medium = Medium) "PressureFlow output connectors" annotation (
        Placement(transformation(extent = {{84, -16}, {116, 16}})));

    protected
      Physiolibrary.Types.Pressure p;
      Modelica.Units.SI.SpecificEnthalpy h = Medium.specificEnthalpy_pTX(p, temperature_start, x_mass_start) "Fluid enthalphy";
    equation
      if not usePressureInput then
        p = pressure_start;
      end if;
      y.p = p;
      y.h_outflow = h;
      y.Xi_outflow = x_mass_start[1:Medium.nXi];
      y.C_outflow = C_start;
      annotation (
        Documentation(info = "<html>
        <p>Model has a vector of continuous Real input signals as pressures for vector of pressure-flow connectors. </p>
        <p>Usage in tests: Set defaul volume&gt;0 and try to set STEADY in instances to &quot;false&quot;!</p>
        </html>",
                revisions = "<html>
        <p><i>2009-2018</i></p>
        <p>Marek Matejak, marek@matfyz.cz </p>
        </html>"),
        Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 0}, pattern = LinePattern.None, fillColor = {170, 255, 255}, fillPattern = FillPattern.Backward), Text(extent = {{0, 0}, {-100, -100}}, lineColor = {0, 0, 0}, textString = "P"), Line(points = {{-100, 0}, {56, 0}}, color = {191, 0, 0}, thickness = 0.5), Polygon(points = {{38, -20}, {38, 20}, {78, 0}, {38, -20}}, lineColor = {191, 0, 0}, fillColor = {191, 0, 0}, fillPattern = FillPattern.Solid), Text(extent = {{-150, 150}, {150, 110}}, textString = "%name", lineColor = {0, 0, 255})}));
    end PressureSource;

    model MassOutflowSource "Prescribed flow at port with unlimited mass storage"
      extends Physiolibrary.Fluid.Interfaces.ConditionalMassFlow;
      extends Physiolibrary.Fluid.Interfaces.CompositionSetup;

      Physiolibrary.Fluid.Interfaces.FluidPort_a q_in(redeclare package
        Medium =                                                                 Medium) annotation (
        Placement(transformation(extent = {{-114, -14}, {-86, 14}}), iconTransformation(extent = {{-114, -14}, {-86, 14}})));
      parameter Modelica.Units.SI.SpecificEnthalpy h = Medium.specificEnthalpy(Medium.setState_pTX(pressure_start, temperature_start, x_mass_start)) "Fluid enthalphy";
    equation
      q_in.m_flow = q;
      q_in.h_outflow = h;
      q_in.Xi_outflow = x_mass_start[1:Medium.nXi];
      q_in.C_outflow = C_start;
      annotation (
        Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-100, -50}, {100, 50}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Polygon(points = {{-80, 25}, {80, 0}, {-80, -25}, {-80, 25}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid), Text(extent = {{-150, -94}, {150, -54}}, textString = "%name", lineColor = {0, 0, 255})}),
        Documentation(revisions = "<html>
        <table>
        <tr>
        <td>Author:</td>
        <td>Marek Matejak</td>
        </tr>
        <tr>
        <td>By:</td>
        <td>marek@matfyz.cz</td>
        </tr>
        <tr>
        <td>Date of:</td>
        <td>january 2009-2018</td>
        </tr>
        </table>
        </html>",
                info = "<html>
        <p><font style=\"font-size: 9pt; \">This element needs to be connected only to next hydraulic elements, which contain calculation of hydraulic pressure in connector. It is because equation contains only </font><b><font style=\"font-size: 9pt; \">hydraulic volume flow</font></b><font style=\"font-size: 9pt; \"> variable, which is set to value of input signal variable. </font></p>
        </html>"));
    end MassOutflowSource;

    model VolumeOutflowSource "Prescribed flow at port with unlimited mass storage"
      extends Physiolibrary.Fluid.Interfaces.ConditionalVolumeFlow;
      extends Physiolibrary.Fluid.Interfaces.CompositionSetup;

      Physiolibrary.Fluid.Interfaces.FluidPort_a q_in(redeclare package
        Medium =                                                                 Medium) annotation (
        Placement(transformation(extent = {{-114, -14}, {-86, 14}}), iconTransformation(extent = {{-114, -14}, {-86, 14}})));

      parameter Modelica.Units.SI.SpecificEnthalpy h = Medium.specificEnthalpy(Medium.setState_pTX(pressure_start, temperature_start, x_mass_start)) "Fluid enthalphy";
      Modelica.Units.SI.Density density;
    equation
      q_in.m_flow = q * density;
      q_in.h_outflow = h;
      q_in.Xi_outflow = x_mass_start[1:Medium.nXi];
      q_in.C_outflow = C_start;
      // medium density
      density = Medium.density(Medium.setState_phX(q_in.p, inStream(q_in.h_outflow), inStream(q_in.Xi_outflow)));

      annotation (
        Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-100, -50}, {100, 50}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Polygon(points = {{-80, 25}, {80, 0}, {-80, -25}, {-80, 25}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid), Text(extent = {{-150, -94}, {150, -54}}, textString = "%name", lineColor = {0, 0, 255})}),
        Documentation(revisions = "<html>
        <table>
        <tr>
        <td>Author:</td>
        <td>Marek Matejak</td>
        </tr>
        <tr>
        <td>By:</td>
        <td>marek@matfyz.cz</td>
        </tr>
        <tr>
        <td>Date of:</td>
        <td>january 2009-2018</td>
        </tr>
        </table>
        </html>",
                info = "<html>
        <p><font style=\"font-size: 9pt; \">This element needs to be connected only to next hydraulic elements, which contain calculation of hydraulic pressure in connector. It is because equation contains only </font><b><font style=\"font-size: 9pt; \">hydraulic volume flow</font></b><font style=\"font-size: 9pt; \"> variable, which is set to value of input signal variable. </font></p>
        </html>"));
    end VolumeOutflowSource;
  end Sources;

  package Examples "Examples that demonstrate usage of the Pressure flow components"
    extends Modelica.Icons.ExamplesPackage;

    model MinimalCirculation "Minimal circulation models driven by cardiac output"
      extends Modelica.Icons.Example;
      Physiolibrary.Fluid.Components.MassPump heart(useSolutionFlowInput = true) annotation (
        Placement(transformation(extent = {{-20, 60}, {0, 80}})));
      Physiolibrary.Fluid.Components.ElasticVessel arteries(volume_start(displayUnit = "l") = 0.001, nPorts = 3, Compliance(displayUnit = "ml/mmHg") = 1.1625954425608e-08, ZeroPressureVolume(displayUnit = "ml") = 0.00085) annotation (
        Placement(transformation(extent={{56,40},{80,62}})));
      Physiolibrary.Fluid.Components.ElasticVessel veins(volume_start(displayUnit = "l") = 0.0032, nPorts = 2, ZeroPressureVolume(displayUnit = "ml") = 0.00295, Compliance(displayUnit = "ml/mmHg") = 6.1880080007267e-07) annotation (
        Placement(transformation(extent = {{-58, 40}, {-38, 60}})));
      Modelica.Blocks.Sources.Pulse pulse(width = 25, period = 60 / 75, amplitude = 3.3e-1) annotation (
        Placement(transformation(extent = {{-94, 74}, {-74, 94}})));
      Sensors.PressureMeasure pressureMeasure annotation (
        Placement(transformation(extent = {{82, 68}, {102, 88}})));
      Sensors.FlowMeasure flowMeasure annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 180, origin = {22, 32})));
      Components.Conductor resistance(Conductance = 6.2755151845753e-09) annotation (
        Placement(transformation(extent = {{-18, 22}, {2, 42}})));
    equation
      connect(pulse.y, heart.solutionFlow) annotation (
        Line(points = {{-73, 84}, {-10, 84}, {-10, 77}}, color = {0, 0, 127}));
      connect(veins.q_in[1], heart.q_in) annotation (
        Line(points={{-48.1,49.35},{-46,49.35},{-46,70},{-20,70}},        color = {127, 0, 0}, thickness = 0.5));
      connect(pressureMeasure.port, arteries.q_in[1]) annotation (
        Line(points={{92,68},{92,50.0467},{67.88,50.0467}},        color = {127, 0, 0}, thickness = 0.5));
      connect(resistance.q_in, veins.q_in[2]) annotation (
        Line(points={{-18,32},{-32,32},{-32,50.65},{-48.1,50.65}},        color = {127, 0, 0}, thickness = 0.5));
      connect(heart.q_out, arteries.q_in[2]) annotation (
        Line(points={{0,70},{67.88,70},{67.88,51}},        color = {127, 0, 0}, thickness = 0.5));
      connect(resistance.q_out, flowMeasure.q_out) annotation (
        Line(points = {{2, 32}, {12, 32}}, color = {127, 0, 0}, thickness = 0.5));
      connect(flowMeasure.q_in, arteries.q_in[3]) annotation (
        Line(points={{32,32},{38,32},{38,51.9533},{67.88,51.9533}},          color = {127, 0, 0}, thickness = 0.5));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Text(extent = {{-54, 98}, {66, 88}}, lineColor = {175, 175, 175}, textString = "Minimal circulation driven by cardiac output")}),
        Documentation(revisions = "<html>
	<p><i>2014-2018</i></p>
	<p>Marek Matejak, marek@matfyz.cz </p>
	</html>"),
        experiment(StopTime = 10));
    end MinimalCirculation;

    model Windkessel_2element "Two-element Windkessel model"
      extends Modelica.Icons.Example;
      Physiolibrary.Fluid.Components.ElasticVessel arteries(ZeroPressureVolume(displayUnit = "ml") = 0.00085, volume_start(displayUnit = "l") = 0.97e-3, nPorts = 3, Compliance(displayUnit = "ml/mmHg") = 1.0500862061839e-08) annotation (
        Placement(transformation(extent = {{-12, 38}, {8, 58}})));
      Physiolibrary.Fluid.Components.Conductor resistance(Conductance(displayUnit = "ml/(mmHg.s)") = 8.1006650191331e-09) annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {18, 34})));
      Utilities.Pulses pulses(QP(displayUnit = "kg/s") = 0.424, HR = 1.2) annotation (
        Placement(transformation(extent = {{-80, 58}, {-60, 78}})));
      Sources.MassInflowSource unlimitedPump(useSolutionFlowInput = true) annotation (
        Placement(transformation(extent = {{-48, 38}, {-28, 58}})));
      Sources.PressureSource unlimitedVolume annotation (
        Placement(transformation(extent = {{-56, 0}, {-36, 20}})));
      Sensors.PressureMeasure pressureMeasure annotation (
        Placement(transformation(extent = {{50, 56}, {70, 76}})));
      Sensors.FlowMeasure flowMeasure annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 180, origin = {-2, 10})));
    equation
      connect(arteries.q_in[1], resistance.q_in) annotation (
        Line(points={{-2.1,47.1333},{18,47.1333},{18,44}},        color = {127, 0, 0}, thickness = 0.5));
      connect(pulses.massflowrate, unlimitedPump.solutionFlow) annotation (
        Line(points = {{-61, 68}, {-38, 68}, {-38, 55}}, color = {0, 0, 127}));
      connect(unlimitedPump.q_out, arteries.q_in[2]) annotation (
        Line(points = {{-28, 48}, {-16, 48}, {-16, 48}, {-2.1, 48}}, color = {127, 0, 0}, thickness = 0.5));
      connect(arteries.q_in[3],pressureMeasure.port)  annotation (
        Line(points={{-2.1,48.8667},{-2,48.8667},{-2,56},{60,56}},          color = {127, 0, 0}, thickness = 0.5));
      connect(resistance.q_out, flowMeasure.q_in) annotation (
        Line(points = {{18, 24}, {18, 10}, {8, 10}}, color = {127, 0, 0}, thickness = 0.5));
      connect(flowMeasure.q_out, unlimitedVolume.y) annotation (
        Line(points = {{-12, 10}, {-36, 10}}, color = {127, 0, 0}, thickness = 0.5));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Text(lineColor = {175, 175, 175}, extent = {{-74, 90}, {46, 80}}, textString = "2-element Windkessel model")}),
        Documentation(revisions = "<html>
	<ul>
	<li><i>Sep 2014</i> by Tomas Kulhanek:
	<br/>Updated pulse generator and diagram to conform electric analogy diagrams.
	</li>
	<li><i>May 2014 </i> by Marek Matejak:
	<br/>Created.
	</li>
	</ul>
	</html>",
         info = "<html>
	<p>Two-element windkessel model consisting of resistance and compliance element.</p>
	<ul>
	<li>Frank O (1899) Die Grundform des arteriellen Pulses. Z Biol 37:483&ndash;526</li>
	<li>Westerhof, N., Lankhaar, J.-W., &amp; Westerhof, B. E. (2009). The arterial Windkessel. <i>Medical &amp; Biological Engineering &amp; Computing</i>, <i>47</i>(2), 131&ndash;41. doi:10.1007/s11517-008-0359-2</li>
	<li><a href=\"http://en.wikipedia.org/wiki/Windkessel_effect\">http://en.wikipedia.org/wiki/Windkessel_effect</a></li>
	</ul>
	</html>"),
        experiment(StopTime = 5));
    end Windkessel_2element;

    model Windkessel_3element "Three-element windkessel model"
      extends Modelica.Icons.Example;
      Physiolibrary.Fluid.Sources.MassInflowSource heart(useSolutionFlowInput = true) annotation (
        Placement(transformation(extent = {{-50, 38}, {-30, 58}})));
      Physiolibrary.Fluid.Components.ElasticVessel arteries(ZeroPressureVolume(displayUnit = "l") = 0.00085, Compliance(displayUnit = "ml/mmHg") = 1.0500862061839e-08, volume_start(displayUnit = "l") = 0.97e-3, nPorts = 3) annotation (
        Placement(transformation(extent = {{16, 38}, {36, 58}})));
      Physiolibrary.Fluid.Components.Conductor resistance(Conductance(displayUnit = "ml/(mmHg.s)") = 8.1006650191331e-09) annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {50, 34})));
      Physiolibrary.Fluid.Sources.PressureSource veins annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, origin = {-40, 20})));
      Utilities.Pulses pulses(QP(displayUnit = "kg/s") = 0.424, TD1(displayUnit = "s"), HR(displayUnit = "1/min") = 1.2) annotation (
        Placement(transformation(extent = {{-64, 58}, {-44, 78}})));
      Physiolibrary.Fluid.Components.Conductor impedance(Conductance(displayUnit = "ml/(mmHg.s)") = 1.5001231516913e-06) annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, origin = {-6, 50})));
      Sensors.PressureMeasure pressureMeasure annotation (
        Placement(transformation(extent = {{58, 66}, {78, 86}})));
      Sensors.FlowMeasure flowMeasure annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 180, origin = {12, 20})));
    equation
      connect(pulses.massflowrate, heart.solutionFlow) annotation (
        Line(points = {{-45, 68}, {-40, 68}, {-40, 55}}, color = {0, 0, 127}));
      connect(heart.q_out, impedance.q_in) annotation (
        Line(points = {{-30, 48}, {-24, 48}, {-24, 50}, {-16, 50}}, thickness = 1));
      connect(impedance.q_out, arteries.q_in[1]) annotation (
        Line(points={{4,50},{16,50},{16,47.1333},{25.9,47.1333}},          color = {127, 0, 0}, thickness = 0.5));
      connect(arteries.q_in[2], resistance.q_in) annotation (
        Line(points = {{25.9, 48}, {50, 48}, {50, 44}}, color = {127, 0, 0}, thickness = 0.5));
      connect(resistance.q_out, flowMeasure.q_in) annotation (
        Line(points = {{50, 24}, {50, 20}, {22, 20}}, color = {127, 0, 0}, thickness = 0.5));
      connect(flowMeasure.q_out, veins.y) annotation (
        Line(points = {{2, 20}, {-30, 20}}, color = {127, 0, 0}, thickness = 0.5));
      connect(pressureMeasure.port, arteries.q_in[3]) annotation (
        Line(points={{64,70},{26,70},{26,48.8667},{25.9,48.8667}},          color = {127, 0, 0}, thickness = 0.5));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Text(extent = {{-74, 90}, {46, 80}}, lineColor = {175, 175, 175}, textString = "3-element Windkessel model")}),
        Documentation(revisions = "<html>
	<ul>
	<li><i>Sep 2014</i> by Tomas Kulhanek: <br>Created. </li>
	</ul>
	<p> </p>
	</html>",
         info = "<html>
	<p>Three-element windkessel model, updated two-element windkessel model with an impedance element. Impedance can be approximated by resistance.</p>
	<ul>
	<li>Westerhof N, Elzinga G (1991) Normalized input impedance and arterial decay time over heart period are independent of animal size. Am J Physiol 261:R126&ndash;R133</li>
	<li>Westerhof, N., Lankhaar, J.-W., &amp; Westerhof, B. E. (2009). The arterial Windkessel. <i>Medical &amp; Biological Engineering &amp; Computing</i>, <i>47</i>(2), 131&ndash;41. doi:10.1007/s11517-008-0359-2</li>
	</ul>
	</html>"),
        experiment(StopTime = 5));
    end Windkessel_3element;

    model Windkessel_4element "Four-element windkessel model"
      extends Modelica.Icons.Example;
      Physiolibrary.Fluid.Sources.MassInflowSource heart(useSolutionFlowInput = true) annotation (
        Placement(transformation(extent = {{-50, 38}, {-30, 58}})));
      Physiolibrary.Fluid.Components.ElasticVessel arteries(volume_start(displayUnit = "l") = 0.97e-3, nPorts = 4, ZeroPressureVolume(displayUnit = "ml") = 0.00085, Compliance(displayUnit = "ml/mmHg") = 1.0500862061839e-8) annotation (
        Placement(transformation(extent = {{16, 38}, {36, 58}})));
      Physiolibrary.Fluid.Components.Conductor resistance(Conductance(displayUnit = "ml/(mmHg.s)") = 8.1006650191331e-09) annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {48, 34})));
      Physiolibrary.Fluid.Sources.PressureSource veins annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, origin = {-40, 20})));
      Utilities.Pulses pulses(QP(displayUnit = "kg/s") = 0.424, HR = 1.2) annotation (
        Placement(transformation(extent = {{-64, 58}, {-44, 78}})));
      Physiolibrary.Fluid.Components.Conductor impedance(Conductance(displayUnit = "ml/(mmHg.s)") = 1.5001231516913e-06) annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, origin = {-6, 48})));
      Physiolibrary.Fluid.Components.Inertia inertia(I(displayUnit = "mmHg.s2/g") = 666.611937075, massFlow_start(displayUnit = "kg/min") = 0.083333333333333) annotation (
        Placement(transformation(extent = {{-16, 56}, {4, 76}})));
      Sensors.PressureMeasure pressureMeasure annotation (
        Placement(transformation(extent = {{62, 64}, {82, 84}})));
      Sensors.FlowMeasure flowMeasure annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 180, origin = {14, 20})));
    equation
      connect(pulses.massflowrate, heart.solutionFlow) annotation (
        Line(points = {{-45, 68}, {-40, 68}, {-40, 55}}, color = {0, 0, 127}));
      connect(heart.q_out, impedance.q_in) annotation (
        Line(points = {{-30, 48}, {-16, 48}}, thickness = 1));
      connect(heart.q_out, inertia.q_in) annotation (
        Line(points = {{-30, 48}, {-26, 48}, {-26, 66}, {-16, 66}}, thickness = 1));
      connect(inertia.q_out, arteries.q_in[1]) annotation (
        Line(points={{4,66},{16,66},{16,47.025},{25.9,47.025}},        color = {127, 0, 0}, thickness = 0.5));
      connect(impedance.q_out, arteries.q_in[2]) annotation (
        Line(points={{4,48},{16,48},{16,47.675},{25.9,47.675}},        color = {127, 0, 0}, thickness = 0.5));
      connect(arteries.q_in[3], resistance.q_in) annotation (
        Line(points={{25.9,48.325},{48,48.325},{48,44}},      color = {127, 0, 0}, thickness = 0.5));
      connect(pressureMeasure.port, arteries.q_in[4]) annotation (
        Line(points={{68,68},{25.9,68},{25.9,48.975}},       color = {127, 0, 0}, thickness = 0.5));
      connect(resistance.q_out, flowMeasure.q_in) annotation (
        Line(points = {{48, 24}, {48, 20}, {24, 20}}, color = {127, 0, 0}, thickness = 0.5));
      connect(flowMeasure.q_out, veins.y) annotation (
        Line(points = {{4, 20}, {-30, 20}}, color = {127, 0, 0}, thickness = 0.5));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Text(extent = {{-74, 90}, {46, 80}}, lineColor = {175, 175, 175}, textString = "4-element Windkessel model")}),
        Documentation(revisions = "<html>
	<ul>
	<li><i>Sep 2014</i> by Tomas Kulhanek: <br>Created. </li>
	</ul>
	</html>",
         info = "<html>
	<p>Four-element windkessel model, updated three-element windkessel model with an inertia element. </p>
	<ul>
	<li>Stergiopulos N, Westerhof BE, Westerhof N (1999) Total arterial inertance as the fourth element of the windkessel model. Am J Physiol 276:H81&ndash;H88</li>
	<li>Westerhof, N., Lankhaar, J.-W., &amp; Westerhof, B. E. (2009). The arterial Windkessel. <i>Medical &amp; Biological Engineering &amp; Computing</i>, <i>47</i>(2), 131&ndash;41. doi:10.1007/s11517-008-0359-2</li>
	</ul>
	</html>"),
        experiment(StopTime = 5));
    end Windkessel_4element;

    model CardiovascularSystem_GCG "Cardiovascular part of Guyton-Coleman-Granger's model from 1972"
      extends Modelica.Icons.Example;
      import Hydraulic = Physiolibrary.Fluid;
      Hydraulic.Components.ElasticVessel pulmonaryVeinsAndLeftAtrium(volume_start = 0.4e-3, nPorts = 3, ZeroPressureVolume(displayUnit = "ml") = 0.0004, Compliance(displayUnit = "ml/mmHg") = 7.5006157584566e-8) annotation (
        Placement(transformation(extent = {{4, 74}, {24, 94}})));
      Hydraulic.Components.ElasticVessel pulmonaryArteries(volume_start = 0.38e-3, nPorts = 2, ZeroPressureVolume(displayUnit = "ml") = 0.00030625, Compliance(displayUnit = "ml/mmHg") = 3.6002955640592e-8) annotation (
        Placement(transformation(extent = {{-62, 74}, {-42, 94}})));
      Hydraulic.Components.Conductor pulmonary(Conductance(displayUnit = "l/(mmHg.min)") = 4.1665920538226e-08) annotation (
        Placement(transformation(extent = {{-30, 74}, {-10, 94}})));
      Hydraulic.Components.ElasticVessel arteries(volume_start = 0.85e-3, nPorts = 5, ZeroPressureVolume(displayUnit = "ml") = 0.000495, Compliance(displayUnit = "ml/mmHg") = 2.6627185942521e-8) annotation (
        Placement(transformation(extent = {{14, -46}, {34, -26}})));
      Hydraulic.Components.ElasticVessel veins(volume_start = 3.25e-3, nPorts = 4, ZeroPressureVolume(displayUnit = "ml") = 0.00295, Compliance(displayUnit = "ml/mmHg") = 6.1880080007267e-7) annotation (
        Placement(transformation(extent = {{-64, -46}, {-44, -26}})));
      Hydraulic.Components.Conductor nonMuscle(Conductance(displayUnit = "l/(mmHg.min)") = 3.5627924852669e-09) annotation (
        Placement(transformation(extent = {{-24, -46}, {-4, -26}})));
      Hydraulic.Sensors.PressureMeasure pressureMeasure annotation (
        Placement(transformation(extent = {{-78, 26}, {-58, 46}})));
      Hydraulic.Components.MassPump rightHeart(useSolutionFlowInput = true) annotation (
        Placement(transformation(extent = {{-56, 8}, {-36, 28}})));
      Physiolibrary.Types.Constants.MassFlowRateConst RNormalCO(k(displayUnit = "kg/min") = 0.083333333333333) annotation (
        Placement(transformation(extent = {{-60, 40}, {-52, 48}})));
      Hydraulic.Sensors.PressureMeasure pressureMeasure1 annotation (
        Placement(transformation(extent = {{-8, 26}, {12, 46}})));
      Hydraulic.Components.MassPump leftHeart(useSolutionFlowInput = true) annotation (
        Placement(transformation(extent = {{16, 6}, {36, 26}})));
      Physiolibrary.Types.Constants.MassFlowRateConst LNormalCO(k(displayUnit = "kg/min") = 0.083333333333333) annotation (
        Placement(transformation(extent = {{12, 42}, {20, 50}})));
      Hydraulic.Components.Conductor kidney(Conductance(displayUnit = "l/(mmHg.min)") = 1.4126159678427e-09) annotation (
        Placement(transformation(extent = {{-24, -64}, {-4, -44}})));
      Hydraulic.Components.Conductor muscle(Conductance(displayUnit = "l/(mmHg.min)") = 1.3001067314658e-09) annotation (
        Placement(transformation(extent = {{-24, -28}, {-4, -8}})));
      Hydraulic.Components.Conductor largeVeins(Conductance(displayUnit = "l/(mmHg.min)") = 1.6888886482791e-07) annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {-84, -8})));
      Hydraulic.Components.ElasticVessel rightAtrium(volume_start = 0.1e-3, nPorts = 3, ZeroPressureVolume(displayUnit = "ml") = 0.0001, Compliance(displayUnit = "ml/mmHg") = 3.7503078792283e-8) annotation (
        Placement(transformation(extent = {{-82, 8}, {-62, 28}})));
      Physiolibrary.Blocks.Factors.Spline rightStarling(data = {{-6, 0, 0}, {-3, 0.15, 0.104}, {-1, 0.52, 0.48}, {2, 1.96, 0.48}, {4, 2.42, 0.123}, {8, 2.7, 0}}, Xscale = 101325 / 760) "At filling pressure 0mmHg (because external thorax pressure is -4mmHg) is normal cardiac output (effect=1)." annotation (
        Placement(transformation(extent = {{-56, 22}, {-36, 42}})));
      Physiolibrary.Blocks.Factors.Spline leftStarling(data = {{-4, 0, 0}, {-1, 0.72, 0.29}, {0, 1.01, 0.29}, {3, 1.88, 0.218333}, {10, 2.7, 0}}, Xscale = 101325 / 760) "At filling pressure -0.0029mmHg (because external thorax pressure is -4mmHg) is normal cardiac output (effect=1)." annotation (
        Placement(transformation(extent = {{16, 22}, {36, 42}})));
      inner Modelica.Fluid.System system annotation (
        Placement(transformation(extent = {{68, 62}, {88, 82}})));
      Hydraulic.Sensors.PressureMeasure MeanArterialPressure "MAP" annotation (
        Placement(transformation(extent = {{74, -34}, {94, -14}})));
    equation
      connect(RNormalCO.y, rightStarling.yBase) annotation (
        Line(points = {{-51, 44}, {-46, 44}, {-46, 34}}, color = {0, 0, 127}));
      connect(LNormalCO.y, leftStarling.yBase) annotation (
        Line(points = {{21, 46}, {26, 46}, {26, 34}}, color = {0, 0, 127}));
      connect(rightHeart.solutionFlow, rightStarling.y) annotation (
        Line(points = {{-46, 25}, {-46, 28}, {-46, 28}}, color = {0, 0, 127}));
      connect(leftStarling.y, leftHeart.solutionFlow) annotation (
        Line(points = {{26, 28}, {26, 23}}, color = {0, 0, 127}));
      connect(pressureMeasure.pressure, rightStarling.u) annotation (
        Line(points = {{-62, 32}, {-54, 32}}, color = {0, 0, 127}));
      connect(pressureMeasure1.pressure, leftStarling.u) annotation (
        Line(points = {{8, 32}, {18, 32}}, color = {0, 0, 127}));
      connect(rightHeart.q_out, pulmonaryArteries.q_in[1]) annotation (
        Line(points={{-36,18},{-30,18},{-30,60},{-82,60},{-82,83.35},{-52.1,
            83.35}},                                                                            color = {127, 0, 0}, thickness = 0.5));
      connect(pulmonary.q_in, pulmonaryArteries.q_in[2]) annotation (
        Line(points={{-30,84},{-42,84},{-42,84.65},{-52.1,84.65}},        color = {127, 0, 0}, thickness = 0.5));
      connect(pulmonary.q_out, pulmonaryVeinsAndLeftAtrium.q_in[1]) annotation (
        Line(points={{-10,84},{2,84},{2,83.1333},{13.9,83.1333}},          color = {127, 0, 0}, thickness = 0.5));
      connect(pulmonaryVeinsAndLeftAtrium.q_in[2], leftHeart.q_in) annotation (
        Line(points = {{13.9, 84}, {36, 84}, {36, 60}, {-12, 60}, {-12, 16}, {16, 16}}, color = {127, 0, 0}, thickness = 0.5));
      connect(pressureMeasure1.port, pulmonaryVeinsAndLeftAtrium.q_in[3]) annotation (
        Line(points={{-2,30},{-12,30},{-12,60},{36,60},{36,84},{13.9,84},{
            13.9,84.8667}},                                                                              color = {127, 0, 0}, thickness = 0.5));
      connect(leftHeart.q_out, arteries.q_in[1]) annotation (
        Line(points={{36,16},{54,16},{54,-37.04},{23.9,-37.04}},          color = {127, 0, 0}, thickness = 0.5));
      connect(muscle.q_out, arteries.q_in[2]) annotation (
        Line(points={{-4,-18},{10,-18},{10,-36.52},{23.9,-36.52}},          color = {127, 0, 0}, thickness = 0.5));
      connect(nonMuscle.q_out, arteries.q_in[3]) annotation (
        Line(points = {{-4, -36}, {10, -36}, {10, -36}, {23.9, -36}}, color = {127, 0, 0}, thickness = 0.5));
      connect(kidney.q_out, arteries.q_in[4]) annotation (
        Line(points={{-4,-54},{10,-54},{10,-35.48},{23.9,-35.48}},          color = {127, 0, 0}, thickness = 0.5));
      connect(muscle.q_in, veins.q_in[1]) annotation (
        Line(points={{-24,-18},{-40,-18},{-40,-36.975},{-54.1,-36.975}},        color = {127, 0, 0}, thickness = 0.5));
      connect(nonMuscle.q_in, veins.q_in[2]) annotation (
        Line(points={{-24,-36},{-40,-36},{-40,-36.325},{-54.1,-36.325}},        color = {127, 0, 0}, thickness = 0.5));
      connect(kidney.q_in, veins.q_in[3]) annotation (
        Line(points={{-24,-54},{-38,-54},{-38,-35.675},{-54.1,-35.675}},        color = {127, 0, 0}, thickness = 0.5));
      connect(veins.q_in[4], largeVeins.q_out) annotation (
        Line(points={{-54.1,-35.025},{-84,-35.025},{-84,-18}},      color = {127, 0, 0}, thickness = 0.5));
      connect(largeVeins.q_in, rightAtrium.q_in[1]) annotation (
        Line(points={{-84,2},{-86,2},{-86,17.1333},{-72.1,17.1333}},          color = {127, 0, 0}, thickness = 0.5));
      connect(rightAtrium.q_in[2], rightHeart.q_in) annotation (
        Line(points = {{-72.1, 18}, {-64, 18}, {-64, 18}, {-56, 18}}, color = {127, 0, 0}, thickness = 0.5));
      connect(rightAtrium.q_in[3],pressureMeasure.port)  annotation (
        Line(points={{-72.1,18.8667},{-72,18.8667},{-72,30}},        color = {127, 0, 0}, thickness = 0.5));
      connect(arteries.q_in[5],MeanArterialPressure.port)  annotation (
        Line(points={{23.9,-34.96},{80,-34.96},{80,-30}},        color = {127, 0, 0}, thickness = 0.5));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Text(extent = {{-82, -80}, {80, -100}}, lineColor = {175, 175, 175}, textString = "Circulation part of Guyton-Coleman-Granger's model from 1972")}),
        Documentation(info = "<html>
	<p>Cardiovascular subsystem in famous Guyton-Coleman-Granger model from 1972. </p>
	<p><br/>Model, all parameters and all initial values are from article: </p>
	<p>A.C. Guyton, T.G. Coleman, H.J. Granger (1972). &quot;Circulation: overall regulation.&quot; Annual review of physiology 34(1): 13-44.</p>
	</html>",
         revisions = "<html>
	<p><i>2014-2018</i></p>
	<p>Marek Matejak, marek@matfyz.cz </p>
	</html>"),
        experiment(StopTime = 300));
    end CardiovascularSystem_GCG;

    package Utilities "Utility components used by package Examples"
      extends Modelica.Icons.UtilitiesPackage;

      model Pulses "example pulse flow generator"
        import Physiolibrary.Types.*;
        Physiolibrary.Types.RealIO.MassFlowRateOutput massflowrate annotation (
          Placement(transformation(extent = {{80, -10}, {100, 10}}), iconTransformation(extent = {{80, -10}, {100, 10}})));
        discrete Time T0 "beginning of cardiac cycle";
        Boolean b(start = false);
        discrete Time HP "duration of cardiac cycle";
        parameter Frequency HR = 1.2;
        Time tc "relative time in carciac cycle";
        parameter Time TD1 = 0.07 "relative time of start of systole";
        discrete Time TD2 "relative time of end of systole";
        parameter MassFlowRate QP = 0.424 "peak mass flowrate";
      initial equation
        T0 = 0 "set beginning of cardiac cycle";
        HP = 1 / HR "update length of carciac cycle";
        TD2 = TD1 + 2 / 5 / HR "compute end time of systole";
      equation
        b = time - pre(T0) >= pre(HP) "true if new cardiac cycle begins";
        when {b} then
          T0 = time "set beginning of cardiac cycle";
          HP = 1 / HR "update length of carciac cycle";
          TD2 = TD1 + 2 / 5 * HP "compute end time of systole";
        end when;
        tc = time - T0 "relative time in carciac cycle";
        massflowrate = if tc < TD1 then 0 else if tc < TD2 then sin((tc - TD1) / (TD2 - TD1) * Modelica.Constants.pi) * QP else 0 "zero before and after systole, otherwise sin up to peak flow";
        annotation (
          Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-80, 80}, {80, -80}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 170}, fillPattern = FillPattern.Solid), Line(points = {{-70, 0}, {-50, 0}, {-48, 2}, {-42, 52}, {-36, 60}, {-28, 52}, {-24, 2}, {-20, 0}, {14, 0}, {18, 2}, {24, 48}, {24, 54}, {32, 58}, {40, 50}, {44, 2}, {50, 0}, {74, 0}}, color = {0, 0, 255}, smooth = Smooth.Bezier), Text(extent = {{-80, 108}, {80, 88}}, lineColor = {0, 0, 255}, textString = "%name"), Text(extent = {{-80, -92}, {78, -112}}, lineColor = {0, 0, 255}, textString = "rate=%HR")}));
      end Pulses;
    end Utilities;

    package Kofranek2014 "models of cardiovascular system used in www.physiome.cz/atlas"
      extends Modelica.Icons.ExamplesPackage;

      model NonPulsatileCirculation
        extends Physiolibrary.Icons.CardioVascular;
        Physiolibrary.Fluid.Components.ElasticVessel PulmonaryArteries(useV0Input = true, useComplianceInput = true, nPorts = 2, volume_start = 0.373e-3) annotation (
          Placement(transformation(extent = {{-40, 28}, {-20, 48}})));
        Physiolibrary.Types.Constants.HydraulicComplianceConst CAP(k = 2.2576853432954e-08) annotation (
          Placement(transformation(extent = {{-50, 56}, {-36, 70}})));
        Physiolibrary.Types.Constants.VolumeConst V0AP(k = 0.000327) annotation (
          Placement(transformation(extent = {{-66, 44}, {-52, 58}})));
        Components.Resistor TotalPulmonaryResistance(useResistanceInput = true) annotation (
          Placement(transformation(extent = {{-2, 28}, {18, 48}})));
        Types.Constants.HydraulicResistanceConst RP(k(displayUnit = "(mmHg.s)/l") = 9332567.11905) annotation (
          Placement(transformation(extent = {{-12, 60}, {0, 70}})));
        Physiolibrary.Fluid.Components.ElasticVessel PulmonaryVeins(useV0Input = true, useComplianceInput = true, volume_start = 0.704e-3, nPorts = 2) annotation (
          Placement(transformation(extent = {{42, 28}, {62, 48}})));
        Physiolibrary.Types.Constants.HydraulicComplianceConst CVP(k = 2.250184727537e-7) annotation (
          Placement(transformation(extent = {{36, 60}, {50, 74}})));
        Physiolibrary.Types.Constants.VolumeConst V0VP(k = 0.000435) annotation (
          Placement(transformation(extent = {{20, 48}, {34, 62}})));
        Physiolibrary.Fluid.Components.ElasticVessel SystemicVeins(useV0Input = true, useComplianceInput = true, volume_start = 3.922e-3, nPorts = 2) annotation (
          Placement(transformation(extent = {{-46, -70}, {-26, -50}})));
        Physiolibrary.Types.Constants.HydraulicComplianceConst CVS(k = 1.5001231516913e-6) annotation (
          Placement(transformation(extent = {{-52, -42}, {-38, -28}})));
        Physiolibrary.Types.Constants.VolumeConst V0VS(k = 0.002845) annotation (
          Placement(transformation(extent = {{-74, -54}, {-60, -40}})));
        Components.Resistor TotalSystemicResistance(useResistanceInput = true) annotation (
          Placement(transformation(extent = {{16, -70}, {-4, -50}})));
        Types.Constants.HydraulicResistanceConst RT(k(displayUnit = "(mmHg.s)/l") = 133322387.415) annotation (
          Placement(transformation(extent = {{-14, -50}, {-4, -40}})));
        Physiolibrary.Fluid.Components.ElasticVessel SystemicArteries(useV0Input = true, useComplianceInput = true, nPorts = 3, volume_start = 0.672e-3) annotation (
          Placement(transformation(extent = {{36, -70}, {56, -50}})));
        Physiolibrary.Types.Constants.HydraulicComplianceConst CAS(k = 1.1250923637685e-08) annotation (
          Placement(transformation(extent = {{30, -38}, {44, -24}})));
        Physiolibrary.Types.Constants.VolumeConst V0AS(k = 0.000529) annotation (
          Placement(transformation(extent = {{14, -50}, {28, -36}})));
        replaceable Parts.HeartPump rightHeart(StarlingSlope(displayUnit = "ml/(mmHg.s)") = 1.2503526469347e-07) constrainedby
        Parts.HeartInterface                                                                                                                        annotation (
           Placement(transformation(extent = {{-72, -10}, {-48, 16}})));
        replaceable Parts.HeartPump leftHeart(StarlingSlope(displayUnit = "ml/(mmHg.s)") = 7.5006157584566e-08) constrainedby
        Parts.HeartInterface                                                                                                                       annotation (
           Placement(transformation(extent = {{74, -10}, {52, 10}})));
        inner Modelica.Fluid.System system(p_ambient(displayUnit = "mmHg") = 101325.0144354) annotation (
          Placement(transformation(extent = {{-94, 70}, {-74, 90}})));
        Sensors.PressureMeasure pressureMeasure annotation (
          Placement(transformation(extent = {{68, -66}, {88, -46}})));
      equation
        connect(CAP.y, PulmonaryArteries.compliance) annotation (
          Line(points={{-34.25,63},{-30,63},{-30,47}},        color = {0, 0, 127}));
        connect(V0AP.y, PulmonaryArteries.zeroPressureVolume) annotation (
          Line(points={{-50.25,51},{-50.25,50.5},{-37,50.5},{-37,47}},          color = {0, 0, 127}));
        connect(CVP.y, PulmonaryVeins.compliance) annotation (
          Line(points={{51.75,67},{52,67},{52,47}},        color = {0, 0, 127}));
        connect(CVS.y, SystemicVeins.compliance) annotation (
          Line(points={{-36.25,-35},{-36,-35},{-36,-51}},        color = {0, 0, 127}));
        connect(CAS.y, SystemicArteries.compliance) annotation (
          Line(points={{45.75,-31},{46,-31},{46,-51}},        color = {0, 0, 127}));
        connect(PulmonaryVeins.zeroPressureVolume, V0VP.y) annotation (
          Line(points={{45,47},{40,47},{40,55},{35.75,55}},          color = {0, 0, 127}));
        connect(SystemicVeins.zeroPressureVolume, V0VS.y) annotation (
          Line(points={{-43,-51},{-52,-51},{-52,-47},{-58.25,-47}},          color = {0, 0, 127}));
        connect(V0AS.y, SystemicArteries.zeroPressureVolume) annotation (
          Line(points={{29.75,-43},{39,-43},{39,-51}},        color = {0, 0, 127}));
        connect(rightHeart.q_out, PulmonaryArteries.q_in[1]) annotation (
          Line(points={{-48,3},{-40,3},{-40,37.35},{-30.1,37.35}},        color = {127, 0, 0}, thickness = 0.5));
        connect(PulmonaryArteries.q_in[2], TotalPulmonaryResistance.q_in) annotation (
          Line(points={{-30.1,38.65},{-16,38.65},{-16,38},{-2,38}},        color = {127, 0, 0}, thickness = 0.5));
        connect(TotalPulmonaryResistance.q_out, PulmonaryVeins.q_in[1]) annotation (
          Line(points={{18,38},{34,38},{34,37.35},{51.9,37.35}},        color = {127, 0, 0}, thickness = 0.5));
        connect(PulmonaryVeins.q_in[2], leftHeart.q_in) annotation (
          Line(points={{51.9,38.65},{74,38.65},{74,0}},      color = {127, 0, 0}, thickness = 0.5));
        connect(leftHeart.q_out, SystemicArteries.q_in[1]) annotation (
          Line(points={{52,2.22045e-16},{50,2.22045e-16},{50,-60.8667},{45.9,
                -60.8667}},                                                                       color = {127, 0, 0}, thickness = 0.5));
        connect(SystemicArteries.q_in[2], TotalSystemicResistance.q_in) annotation (
          Line(points = {{45.9, -60}, {30, -60}, {30, -60}, {16, -60}}, color = {127, 0, 0}, thickness = 0.5));
        connect(TotalSystemicResistance.q_out, SystemicVeins.q_in[1]) annotation (
          Line(points={{-4,-60},{-20,-60},{-20,-60.65},{-36.1,-60.65}},        color = {127, 0, 0}, thickness = 0.5));
        connect(SystemicVeins.q_in[2], rightHeart.q_in) annotation (
          Line(points={{-36.1,-59.35},{-80,-59.35},{-80,3},{-72,3}},        color = {127, 0, 0}, thickness = 0.5));
        connect(SystemicArteries.q_in[3],pressureMeasure.port)  annotation (
          Line(points={{45.9,-59.1333},{60,-59.1333},{60,-62},{74,-62}},          color = {127, 0, 0}, thickness = 0.5));
        connect(RT.y, TotalSystemicResistance.resistance) annotation (
          Line(points = {{-2.75, -45}, {-2.75, -44.5}, {6, -44.5}, {6, -54}}, color = {0, 0, 127}));
        connect(RP.y, TotalPulmonaryResistance.resistance) annotation (
          Line(points = {{1.5, 65}, {1.5, 65.5}, {8, 65.5}, {8, 44}}, color = {0, 0, 127}));
        annotation (
          Documentation(info = "<html>
	<p>Model of cardiovascular system using to demonstrate elastic and resistance features of veins and arteries in pulmonary and systemic circulation and influence of cardiac output on it. </p>
	<ul>
	<li>J. Kofranek, S. Matousek, J. Rusz, P. Stodulka, P. Privitzer,M. Matejak, M. Tribula, The Atlas of Physiology and Pathophysiology: Web-based multimedia enabled interactive simulations., Comput. Methods Programs Biomed. 104 (2) (2011) 143&ndash;53. doi:10.1016/j.cmpb.2010.12.007.</li>
	<li>Kofr&aacute;nek J, Matej&aacute;k M, Je~ek F, Privitzer P, &Scaron;ilar J. V&yacute;ukov&yacute; webov&yacute; simulator krevn&iacute;ho obhu. In: Sborn&iacute;k PY&iacute;spvko MEDSOFT 2011: 106-121. </li>
	<li>Tribula M, Je~ek F, Privitzer P, Kofr&aacute;nek J, Kolman J. Webov&yacute; v&yacute;ukov&yacute; simul&aacute;tor krevn&iacute;ho obhu. In: Sborn&iacute;k PY&iacute;spvko MEDSOFT 2013: 197-204.</li>
	<li><a href=\"http://physiome.cz/atlas/cirkulace/05/SimpleUncontrolledSimulation.html\">http://physiome.cz/atlas/cirkulace/05/SimpleUncontrolledSimulation.html</a></li>
	</ul>
	</html>"),
          experiment(StopTime = 5));
      end NonPulsatileCirculation;

      model PulsatileCirculation
        extends NonPulsatileCirculation(redeclare Parts.PulsatileHeartPump rightHeart(pulses(QP = 0.338)), redeclare Parts.PulsatileHeartPump leftHeart(pulses(QP = 0.338)), CAS(k = 7.2755972857029e-9), SystemicArteries(volume_start = 0.603e-3), SystemicVeins(volume_start = 3.991e-3));
        annotation (
          Documentation(info = "<html>
	<p>Extension of the model of cardiovascular system with pulsatile dynamics</p>
	<ul>
	<li>Kulh&aacute;nek T, Tribula M, Kofr&aacute;nek J, Matej&aacute;k M. Simple models of the cardiovascular system for educational and research purposes. MEFANET Journal 2014. Available at WWW:<a href=\"
	 http://mj.mefanet.cz/mj-04140914\"> http://mj.mefanet.cz/mj-04140914</a>.</li>
	</ul>
	</html>"),
          experiment(StopTime = 5));
      end PulsatileCirculation;

      package Parts "Utility components used by package KofranekModels2013"
        extends Modelica.Icons.UtilitiesPackage;

        model HeartPump "Heart as pump, which flowrate is determined
          \t  by the StarlingSlope and filling pressure."
          extends HeartInterface;
          outer Modelica.Fluid.System system "System wide properties";
          extends Physiolibrary.Fluid.Interfaces.OnePort;
          parameter Physiolibrary.Types.HydraulicConductance StarlingSlope;
        equation
          q_in.m_flow = StarlingSlope * (q_in.p - system.p_ambient) * density;
          annotation (
            Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Polygon(points = {{32, -34}, {24, -24}, {18, -10}, {18, -8}, {22, 22}, {24, 24}, {34, 40}, {30, 70}, {26, 82}, {-22, 100}, {-26, 42}, {-26, 40}, {-30, -6}, {-30, -10}, {-6, -40}, {52, -74}, {32, -34}}, lineColor = {0, 0, 127}, smooth = Smooth.Bezier, fillColor = {255, 170, 170}, fillPattern = FillPattern.Solid), Text(extent = {{-100, -60}, {102, -98}}, lineColor = {0, 0, 127}, fillColor = {255, 170, 170}, fillPattern = FillPattern.Solid, textString = "%name")}));
        end HeartPump;

        model PulsatileHeartPump "Heart as pump, which flowrate is determined
          \t  by the StarlingSlope and filling pressure."
          extends HeartInterface;
          replaceable package Medium = Media.Water constrainedby
          Media.Interfaces.PartialMedium                                                        "Medium model" annotation (
             choicesAllMatching = true);
          Physiolibrary.Fluid.Interfaces.FluidPort_a q_in(redeclare package
            Medium =
              Media.Water)                                                                        annotation (
            Placement(transformation(extent = {{-64, 0}, {-44, 20}}), iconTransformation(extent = {{-110, -10}, {-90, 10}})));
          Physiolibrary.Fluid.Interfaces.FluidPort_b q_out(redeclare package
            Medium =
              Media.Water)                                                                         annotation (
            Placement(transformation(extent = {{42, 2}, {62, 22}}), iconTransformation(extent = {{42, 2}, {62, 22}})));
          Utilities.Pulses pulses annotation (
            Placement(transformation(extent = {{-40, 30}, {-20, 50}})));
          Physiolibrary.Fluid.Components.MassPump pump(useSolutionFlowInput = true) annotation (
            Placement(transformation(extent = {{-14, 2}, {6, 22}})));
        equation
          connect(pump.q_out, q_out) annotation (
            Line(points = {{6, 12}, {52, 12}}, thickness = 1));
          connect(pump.solutionFlow, pulses.massflowrate) annotation (
            Line(points = {{-4, 19}, {-4, 40}, {-21, 40}}, color = {0, 0, 127}));
          connect(q_in, pump.q_in) annotation (
            Line(points = {{-54, 10}, {-34, 10}, {-34, 12}, {-14, 12}}, thickness = 1));
          annotation (
            Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Polygon(points = {{32, -34}, {24, -24}, {18, -10}, {18, -8}, {22, 22}, {24, 24}, {34, 40}, {30, 70}, {26, 82}, {-22, 100}, {-26, 42}, {-26, 40}, {-30, -6}, {-30, -10}, {-6, -40}, {52, -74}, {32, -34}}, lineColor = {0, 0, 127}, smooth = Smooth.Bezier, fillColor = {255, 170, 170}, fillPattern = FillPattern.Solid), Text(extent = {{-100, -60}, {102, -98}}, lineColor = {0, 0, 127}, fillColor = {255, 170, 170}, fillPattern = FillPattern.Solid, textString = "%name")}));
        end PulsatileHeartPump;

        partial model HeartInterface
          annotation (
            Icon(coordinateSystem(preserveAspectRatio = false)),
            Diagram(coordinateSystem(preserveAspectRatio = false)));
        end HeartInterface;
      end Parts;
      annotation (
        Documentation(info = "<html>
	<p>Model of cardiovascular system using to demonstrate elastic and resistance features of veins and arteries in pulmonary and systemic circulation and influence of cardiac output on it.</p>
	</html>"));
    end Kofranek2014;

    package Fernandez2013 "Model of CVS introduced by Fernandez de Canete et al. 2013"
      extends Modelica.Icons.ExamplesPackage;

      model PulsatileCirculation "Model of cardiovascular system with pulsatile dynamic"
        extends Physiolibrary.Icons.CardioVascular;
        Physiolibrary.Fluid.Components.Conductor RPulmonaryVeins(Conductance(displayUnit = "ml/(mmHg.s)") = 7.425609600872e-08) annotation (
          Placement(transformation(origin = {-220, 60}, extent = {{15, -15}, {-15, 15}})));
        Physiolibrary.Fluid.Components.Inertia pulmonaryVeinsInertia(massFlow_start(displayUnit = "kg/s") = 0.02225, I(displayUnit = "mmHg.s2/g") = 410.6329532382) annotation (
          Placement(transformation(origin = {-278, 60}, extent = {{15, -15}, {-15, 15}})));
        Physiolibrary.Fluid.Components.Conductor RPulmonaryArtery(Conductance(displayUnit = "ml/(mmHg.s)") = 2.2216823876548e-07) annotation (
          Placement(transformation(origin = {200, 58}, extent = {{17.5, -17.5}, {-17.5, 17.5}})));
        Physiolibrary.Fluid.Components.Inertia pulmonaryArterialInertia(massFlow_start(displayUnit = "g/min") = 0.00073233333333333, I(displayUnit = "mmHg.s2/g") = 99.99179056125) annotation (
          Placement(transformation(origin = {156, 58}, extent = {{15, -15}, {-15, 15}})));
        Physiolibrary.Fluid.Components.ElasticVessel pulmonaryVeins(volume_start = 0.6597e-3, nPorts = 2, ZeroPressureVolume = 0.0001, Compliance = 3.5027875591992e-07) annotation (
          Placement(transformation(origin = {-279, -3}, extent = {{-15, -15}, {15, 15}})));
        Physiolibrary.Fluid.Components.IdealValve mitralValve(_Gon(displayUnit = "ml/(mmHg.s)") = 1.9996641612045e-06) annotation (
          Placement(transformation(origin = {-243, -3}, extent = {{-15, -15}, {15, 15}})));
        Physiolibrary.Fluid.Components.ElasticVessel leftVentricle(useComplianceInput = true, useExternalPressureInput = true,
        isExternalPressureAbsolute=true,                                                                                       nPorts = 3,
        volume_start=0.0002097,
        ZeroPressureVolume=9e-05)                                                                                                                                                                annotation (
          Placement(transformation(origin = {-209, -3}, extent = {{-15, -15}, {15, 15}})));
        Physiolibrary.Fluid.Components.Conductor RLeftMyo(Conductance = 9.3757696980707e-08) annotation (
          Placement(transformation(origin = {-181, -3}, extent = {{-15, -15}, {15, 15}})));
        Physiolibrary.Fluid.Components.IdealValve aorticValve(_Gon(displayUnit = "ml/(mmHg.s)") = 1.9996641612045e-06) annotation (
          Placement(transformation(origin = {-143, -3}, extent = {{-15, -15}, {15, 15}})));
        Physiolibrary.Fluid.Components.ElasticVessel aorta(nPorts = 4, Compliance(displayUnit = "ml/mmHg") = 1.6501354668604e-09, volume_start = 0.046e-3, ZeroPressureVolume = 3e-05) annotation (
          Placement(transformation(origin = {-111, -3}, extent = {{-15, -15}, {15, 15}})));
        Physiolibrary.Fluid.Components.Conductor Raorta(Conductance = 1.1108411938274e-07) annotation (
          Placement(transformation(origin = {-79, -3}, extent = {{-15, -15}, {15, 15}})));
        Physiolibrary.Fluid.Components.Inertia aorticInertia(massFlow_start(displayUnit = "kg/min") = 0.010385, I(displayUnit = "mmHg.s2/g") = 109.99096961738) annotation (
          Placement(transformation(origin = {-37, -3}, extent = {{-15, -15}, {15, 15}})));
        Physiolibrary.Fluid.Components.ElasticVessel arteries(nPorts = 3, Compliance = 1.0950899007347e-08, volume_start = 0.805e-3, ZeroPressureVolume = 0.0007) annotation (
          Placement(transformation(origin = {-1, -3}, extent = {{-15, -15}, {15, 15}})));
        Physiolibrary.Fluid.Components.Conductor RSystemic(Conductance = 7.5006157584566e-09) annotation (
          Placement(transformation(origin = {31, -3}, extent = {{-15, -15}, {15, 15}})));
        Physiolibrary.Fluid.Components.Inertia systemicInertia(massFlow_start(displayUnit = "kg/min") = 0.07935, I = 479.960594694) annotation (
          Placement(transformation(origin = {75, -3}, extent = {{-15, -15}, {15, 15}})));
        Physiolibrary.Fluid.Components.IdealValve tricuspidValve(_Gon(displayUnit = "ml/(mmHg.s)") = 1.9996641612045e-06) annotation (
          Placement(transformation(origin = {137, -3}, extent = {{-15, -15}, {15, 15}})));
        Physiolibrary.Fluid.Components.ElasticVessel rightVentricle(useComplianceInput = true, useExternalPressureInput = true,
        isExternalPressureAbsolute=true,                                                                                        nPorts = 3,
        volume_start=0.00018,
        ZeroPressureVolume=7e-05)                                                                                                                                                               annotation (
          Placement(transformation(origin = {171, -3}, extent = {{-15, -15}, {15, 15}})));
        Physiolibrary.Fluid.Components.Conductor RRightMyo(Conductance = 4.2858518443821e-07) annotation (
          Placement(transformation(origin = {207, -3}, extent = {{-15, -15}, {15, 15}})));
        Physiolibrary.Fluid.Components.IdealValve pulmonaryValve(_Gon(displayUnit = "ml/(mmHg.s)") = 1.9996641612045e-06) annotation (
          Placement(transformation(origin = {243, -3}, extent = {{-15, -15}, {15, 15}})));
        Physiolibrary.Fluid.Components.ElasticVessel pulmonaryArtery(nPorts = 2, volume_start = 0.021e-3, ZeroPressureVolume = 2e-05, Compliance(displayUnit = "ml/mmHg") = 6.7505541826109e-10) annotation (
          Placement(transformation(origin = {243, 57}, extent = {{-15, -15}, {15, 15}})));
        Physiolibrary.Fluid.Components.ElasticVessel pulmonaryArterioles(nPorts = 2, volume_start = 0.637e-3, ZeroPressureVolume = 0.0006, Compliance(displayUnit = "ml/mmHg") = 2.0026644075079e-08) annotation (
          Placement(transformation(origin = {124, 58}, extent = {{-15, -15}, {15, 15}})));
        Physiolibrary.Fluid.Components.ElasticVessel veins(volume_start = 2.443e-3, nPorts = 2, Compliance(displayUnit = "ml/mmHg") = 1.5001231516913e-07, ZeroPressureVolume = 0.00237) annotation (
          Placement(transformation(origin = {105, -3}, extent = {{-15, -15}, {15, 15}})));
        Parts.TimeVaryingElastance timeVaryingElastanceLeft(Ed(displayUnit = "mmHg/ml") = 13332238.7415, Es(displayUnit = "mmHg/ml") = 183318282.69563, Pi0(displayUnit = "mmHg") = 6666.11937075) annotation (
          Placement(transformation(extent = {{-222, 16}, {-202, 36}})));
        Parts.TimeVaryingElastance timeVaryingElastanceRight(Ed(displayUnit = "mmHg/ml") = 3999671.62245, Es(displayUnit = "mmHg/ml") = 43729743.0721, Pi0(displayUnit = "mmHg") = 3199.73729796) annotation (
          Placement(transformation(extent = {{164, 18}, {184, 38}})));
        Physiolibrary.Types.Constants.FrequencyConst heartRate(k(displayUnit = "Hz") = 1.2) annotation (
          Placement(transformation(extent = {{-262, 30}, {-244, 42}})));
        inner Modelica.Fluid.System system(p_ambient(displayUnit = "mmHg") = 101325.0144354) annotation (
          Placement(transformation(extent = {{-94, 70}, {-74, 90}})));
        Sensors.PressureMeasure arteriesPressure annotation (
          Placement(transformation(extent = {{26, -72}, {46, -52}})));
        Sensors.PressureMeasure rightVentriclePressure annotation (
          Placement(transformation(extent = {{182, -68}, {202, -48}})));
        Sensors.PressureMeasure leftVentriclePressure annotation (
          Placement(transformation(extent = {{-206, -72}, {-186, -52}})));
        Sensors.PressureMeasure aortaPressure annotation (
          Placement(transformation(extent = {{-106, -60}, {-86, -40}})));
        Sensors.Sphygmomanometer sphygmomanometer annotation (
          Placement(transformation(extent = {{-108, -90}, {-88, -70}})));
      equation
        connect(Raorta.q_out, aorticInertia.q_in) annotation (
          Line(points = {{-64, -3}, {-52, -3}}, thickness = 1));
        connect(timeVaryingElastanceLeft.C, leftVentricle.compliance) annotation (
          Line(points={{-212,17},{-209,17},{-209,10.5}},        color = {0, 0, 127}));
        connect(timeVaryingElastanceRight.C, rightVentricle.compliance) annotation (
          Line(points={{174,19},{174,10.5},{171,10.5}},        color = {0, 0, 127}));
        connect(timeVaryingElastanceLeft.Pi, leftVentricle.externalPressure) annotation (
          Line(points={{-205,17},{-205,16.5},{-198.5,16.5},{-198.5,10.5}},      color = {0, 0, 127}));
        connect(timeVaryingElastanceRight.Pi, rightVentricle.externalPressure) annotation (
          Line(points={{181,19},{181,10.5},{181.5,10.5}},      color = {0, 0, 127}));
        connect(heartRate.y, timeVaryingElastanceLeft.HR) annotation (
          Line(points = {{-241.75, 36}, {-232.375, 36}, {-232.375, 33.6}, {-220.6, 33.6}}, color = {0, 0, 127}));
        connect(RSystemic.q_out, systemicInertia.q_in) annotation (
          Line(points = {{46, -3}, {60, -3}}, thickness = 1));
        connect(heartRate.y, timeVaryingElastanceRight.HR) annotation (
          Line(points = {{-241.75, 36}, {-34, 36}, {-34, 35.6}, {165.4, 35.6}}, color = {0, 0, 127}));
        connect(RRightMyo.q_out, pulmonaryValve.q_in) annotation (
          Line(points = {{222, -3}, {228, -3}}, thickness = 1));
        connect(RPulmonaryArtery.q_out, pulmonaryArterialInertia.q_in) annotation (
          Line(points = {{182.5, 58}, {171, 58}}, thickness = 1));
        connect(RPulmonaryVeins.q_out, pulmonaryVeinsInertia.q_in) annotation (
          Line(points = {{-235, 60}, {-263, 60}}, thickness = 1));
        connect(RLeftMyo.q_out, aorticValve.q_in) annotation (
          Line(points = {{-166, -3}, {-158, -3}}, thickness = 1));
        connect(RPulmonaryVeins.q_in, pulmonaryArterioles.q_in[1]) annotation (
          Line(points={{-205,60},{-40,60},{-40,57.025},{123.85,57.025}},        color = {127, 0, 0}, thickness = 0.5));
        connect(pulmonaryArterioles.q_in[2], pulmonaryArterialInertia.q_out) annotation (
          Line(points={{123.85,58.975},{133,58.975},{133,58},{141,58}},        color = {127, 0, 0}, thickness = 0.5));
        connect(RPulmonaryArtery.q_in, pulmonaryArtery.q_in[1]) annotation (
          Line(points={{217.5,58},{229.75,58},{229.75,56.025},{242.85,56.025}},        color = {127, 0, 0}, thickness = 0.5));
        connect(pulmonaryArtery.q_in[2], pulmonaryValve.q_out) annotation (
          Line(points={{242.85,57.975},{292,57.975},{292,-3},{258,-3}},        color = {127, 0, 0}, thickness = 0.5));
        connect(tricuspidValve.q_out, rightVentricle.q_in[1]) annotation (
          Line(points={{152,-3},{162,-3},{162,-4.3},{170.85,-4.3}},          color = {127, 0, 0}, thickness = 0.5));
        connect(RRightMyo.q_in, rightVentricle.q_in[2]) annotation (
          Line(points = {{192, -3}, {181, -3}, {181, -3}, {170.85, -3}}, color = {127, 0, 0}, thickness = 0.5));
        connect(tricuspidValve.q_in, veins.q_in[1]) annotation (
          Line(points={{122,-3},{114,-3},{114,-3.975},{104.85,-3.975}},        color = {127, 0, 0}, thickness = 0.5));
        connect(systemicInertia.q_out, veins.q_in[2]) annotation (
          Line(points={{90,-3},{98,-3},{98,-2.025},{104.85,-2.025}},        color = {127, 0, 0}, thickness = 0.5));
        connect(RSystemic.q_in, arteries.q_in[1]) annotation (
          Line(points={{16,-3},{8,-3},{8,-4.3},{-1.15,-4.3}},          color = {127, 0, 0}, thickness = 0.5));
        connect(aorticInertia.q_out, arteries.q_in[2]) annotation (
          Line(points = {{-22, -3}, {-11, -3}, {-11, -3}, {-1.15, -3}}, color = {127, 0, 0}, thickness = 0.5));
        connect(Raorta.q_in, aorta.q_in[1]) annotation (
          Line(points={{-94,-3},{-104,-3},{-104,-4.4625},{-111.15,-4.4625}},        color = {127, 0, 0}, thickness = 0.5));
        connect(aorticValve.q_out, aorta.q_in[2]) annotation (
          Line(points={{-128,-3},{-120,-3},{-120,-3.4875},{-111.15,-3.4875}},        color = {127, 0, 0}, thickness = 0.5));
        connect(mitralValve.q_out, leftVentricle.q_in[1]) annotation (
          Line(points={{-228,-3},{-220,-3},{-220,-4.3},{-209.15,-4.3}},          color = {127, 0, 0}, thickness = 0.5));
        connect(leftVentricle.q_in[2], RLeftMyo.q_in) annotation (
          Line(points = {{-209.15, -3}, {-203.725, -3}, {-203.725, -3}, {-196, -3}}, color = {127, 0, 0}, thickness = 0.5));
        connect(pulmonaryVeins.q_in[1], pulmonaryVeinsInertia.q_out) annotation (
          Line(points={{-279.15,-3.975},{-318,-3.975},{-318,60},{-293,60}},        color = {127, 0, 0}, thickness = 0.5));
        connect(pulmonaryVeins.q_in[2], mitralValve.q_in) annotation (
          Line(points={{-279.15,-2.025},{-268.725,-2.025},{-268.725,-3},{-258,
              -3}},                                                                        color = {127, 0, 0}, thickness = 0.5));
        connect(arteriesPressure.port, arteries.q_in[3]) annotation (
          Line(points={{36,-72},{36,-69},{-1.15,-69},{-1.15,-1.7}},          color = {127, 0, 0}, thickness = 0.5));
        connect(rightVentricle.q_in[3],rightVentriclePressure.port)  annotation (
          Line(points={{170.85,-1.7},{170.85,-68},{192,-68}},        color = {127, 0, 0}, thickness = 0.5));
        connect(leftVentricle.q_in[3],leftVentriclePressure.port)  annotation (
          Line(points={{-209.15,-1.7},{-209.15,-72},{-196,-72}},        color = {127, 0, 0}, thickness = 0.5));
        connect(aortaPressure.port, aorta.q_in[3]) annotation (
          Line(points={{-96,-60},{-112,-60},{-112,-2.5125},{-111.15,-2.5125}},         color = {127, 0, 0}, thickness = 0.5));
        connect(aorta.q_in[4],sphygmomanometer.port)  annotation (
          Line(points={{-111.15,-1.5375},{-111.15,-90},{-98,-90}},        color = {127, 0, 0}, thickness = 0.5));
        annotation (
          Diagram(coordinateSystem(extent = {{-350, -100}, {400, 100}}, preserveAspectRatio = false, grid = {2, 2})),
          Icon(coordinateSystem(extent = {{-350, -100}, {400, 100}}, preserveAspectRatio = true, grid = {2, 2})),
          Documentation(info = "<html>
	<p>Model of cardiovascular system with pulsatile dynamics</p>
	<ul>
	<li>Javier Fernandez de Canete, P del Saz-Orozco, D Moreno-Boza, E Duran-Venegas (2013), <a href=\"http://www.mendeley.com/library/#\">Object-oriented modeling and simulation of the closed loop cardiovascular systemby using SIMSCAPE.</a> <i>Computers in biology and medicine</i> 43 (4) p. 323-33</li>
	<li>Kulh&aacute;nek T, Tribula M, Kofr&aacute;nek J, Matej&aacute;k M. Simple models of the cardiovascular system for educational and research purposes<i>. MEFANET Journal 2014</i>. Available at WWW: http://mj.mefanet.cz/mj-04140914.</li>
	</ul>
	</html>",
         revisions = "<html>
	<ul>
	<li><i>Sep 2014 </i>by Tomas Kulhanek: <br>Created. </li>
	</ul>
	</html>"),
          experiment(StopTime = 5));
      end PulsatileCirculation;

      package Parts "Utility components used by package KofranekModels2013"
        extends Modelica.Icons.UtilitiesPackage;

        model TimeVaryingElastance
          outer Modelica.Fluid.System system "System wide properties";
          parameter Physiolibrary.Types.HydraulicElastance Ed "elastance of diastole";
          parameter Physiolibrary.Types.HydraulicElastance Es "elastance of systole";
          parameter Physiolibrary.Types.Pressure Pi0 "peak isovolumic pressure";
          parameter Physiolibrary.Types.Frequency HR_start = 1 "Initial hear rate";
          Physiolibrary.Types.Time tm "relative time from the beginning of cardiac cycle";
          discrete Physiolibrary.Types.Time HP "heart period";
          discrete Physiolibrary.Types.Time t0 "time of beginning of the cardiac cycle";
          discrete Physiolibrary.Types.Time ts "duration of systole";
          Real a;
          Physiolibrary.Types.RealIO.HydraulicComplianceOutput C annotation (
            Placement(transformation(extent = {{-4, -102}, {16, -82}}), iconTransformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {0, -90})));
          Physiolibrary.Types.HydraulicElastance E;
          Physiolibrary.Types.RealIO.PressureOutput Pi annotation (
            Placement(transformation(extent = {{-72, -100}, {-52, -80}}), iconTransformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {70, -90})));
          Physiolibrary.Types.RealIO.FrequencyInput HR "heart rate" annotation (
            Placement(transformation(extent = {{-106, 56}, {-66, 96}}), iconTransformation(extent = {{-106, 56}, {-66, 96}})));
        initial equation
          HP = 1 / HR_start;
          t0 = 0;
          ts = 0.16 + 0.3 / HR_start;
        equation
          tm = time - pre(t0);
          if tm < pre(ts) then
            a = (1 - cos(2 * Modelica.Constants.pi * tm / pre(ts))) / 2;
          else
            a = 0;
          end if;
          E = Ed + Es * a;
          C = 1 / E;
          Pi = Pi0 * a + system.p_ambient;
          when {tm >= pre(HP)} then
            HP = 1 / HR;
            t0 = time;
            ts = 0.16 + 0.3 * HP;
          end when;
          annotation (
            Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-80, 80}, {80, -80}}, lineColor = {0, 0, 255}, fillColor = {170, 255, 255}, fillPattern = FillPattern.Solid), Line(points = {{-78, 0}, {-68, 18}, {-54, 52}, {-44, 64}, {-30, 60}, {-26, 46}}, color = {0, 0, 255}), Line(points = {{-26, 46}, {-26, 32}, {-20, 10}, {-8, 2}, {36, 2}, {80, 2}}, color = {0, 0, 255}), Text(extent = {{-70, 98}, {-22, 80}}, lineColor = {0, 0, 255}, textString = "HR"), Text(extent = {{-74, -40}, {40, -80}}, lineColor = {0, 0, 255}, textString = "Et"), Text(extent = {{42, -40}, {100, -80}}, lineColor = {0, 0, 255}, textString = "Pi"), Text(extent = {{-272, 16}, {276, -40}}, lineColor = {0, 0, 255}, textString = "%name")}));
        end TimeVaryingElastance;
      end Parts;
    end Fernandez2013;

    package MeursModel2011 "models of cardiovascular system used in www.physiome.cz/atlas"
      extends Modelica.Icons.ExamplesPackage;

      package Parts "Utility components used by package KofranekModels2013"
        extends Modelica.Icons.UtilitiesPackage;

        model AtrialElastance
          extends HeartIntervals;
          Physiolibrary.Types.RealIO.HydraulicElastanceOutput Et "elasticity" annotation (
            Placement(transformation(extent = {{100, -10}, {120, 10}}), iconTransformation(extent = {{100, -20}, {138, 18}})));
          parameter Physiolibrary.Types.HydraulicElastance EMIN "Diastolic elastance";
          parameter Boolean useEs_extInput = false "=true, if external elastance/compliance value is used" annotation (
            Evaluate = true,
            HideResult = true,
            choices(checkBox = true),
            Dialog(group = "Conditional inputs"));
          parameter Physiolibrary.Types.HydraulicElastance EMAX "Maximum systolic elastance" annotation (
            Dialog(enable = not useEs_extInput));
          Physiolibrary.Types.RealIO.HydraulicComplianceInput Es_ext = 1 / es_int if useEs_extInput annotation (
            Placement(transformation(extent = {{60, 60}, {100, 100}}), iconTransformation(extent = {{-20, -20}, {20, 20}}, origin = {-80, 80})));
        protected
          Physiolibrary.Types.HydraulicElastance es_int;
        equation
          if not useEs_extInput then
            es_int = EMAX;
          end if;
          Et = smooth(1, if time - T0 < Tas then EMIN + (es_int - EMIN) * sin(Modelica.Constants.pi * (time - T0) / Tas) else EMIN);
          annotation (
            Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-100, 82}, {100, -100}}, pattern = LinePattern.None, lineThickness = 1, fillColor = {255, 255, 170}, fillPattern = FillPattern.Solid, lineColor = {0, 0, 255}), Text(extent = {{-98, 82}, {98, 24}}, lineColor = {0, 0, 255}, lineThickness = 1, fillColor = {255, 255, 170}, fillPattern = FillPattern.Solid, textString = "Atrial elastance"), Line(points = {{-78, -34}, {-76, -26}, {-70, -14}, {-58, 6}, {-36, 36}, {-14, 14}, {-6, -10}, {0, -32}, {6, -34}, {88, -34}, {94, -34}}, color = {0, 0, 255}, smooth = Smooth.Bezier), Text(extent = {{-220, -102}, {200, -120}}, lineColor = {0, 0, 255}, lineThickness = 1, fillColor = {255, 255, 170}, fillPattern = FillPattern.Solid, textString = "%name"), Text(extent = {{72, 4}, {102, -8}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 170}, fillPattern = FillPattern.Solid, textString = "Ct")}));
        end AtrialElastance;

        model VentricularElastance
          extends HeartIntervals;
          Physiolibrary.Types.RealIO.HydraulicElastanceOutput Et "ventricular elasticity" annotation (
            Placement(transformation(extent = {{100, -10}, {120, 10}}), iconTransformation(extent = {{100, 4}, {138, 42}})));
          Modelica.Blocks.Interfaces.RealOutput Et0 "normalized ventricular elasticity (0..1)" annotation (
            Placement(transformation(extent = {{100, -24}, {120, -4}}), iconTransformation(extent = {{100, -40}, {138, -2}})));
          Physiolibrary.Types.RealIO.TimeOutput HeartInterval "eapsed time" annotation (
            Placement(transformation(extent = {{102, -42}, {122, -22}}), iconTransformation(extent = {{100, -98}, {138, -60}})));
          parameter Physiolibrary.Types.HydraulicElastance EMIN "Diastolic elastance ";
          constant Real Kn = 0.57923032735652;
          //Kn is always = 0.5792303273565197
          //... the t * sin(pi*t) has its maximum at t = 0.645773676543406 and = 0.5792303273565197
          //Equation to calculate normalized elastance ET0 was:
          //Et0=EMIN+(EMAX-EMIN)*((time-T0)-(Tas+Tav))/Tvs)*sin(Modelica.Constants.pi*(((time-T0)-(Tas+Tav))/Tvs));
          parameter Boolean useEs_extInput = false "=true, if external elastance/compliance value is used" annotation (
            Evaluate = true,
            HideResult = true,
            choices(checkBox = true),
            Dialog(group = "Conditional inputs"));
          parameter Physiolibrary.Types.HydraulicElastance EMAX "Maximum systolic elastance" annotation (
            Dialog(enable = not useEs_extInput));
          Physiolibrary.Types.RealIO.HydraulicComplianceInput Es_ext(start = 1 / EMAX) = 1 / es_int if useEs_extInput annotation (
            Placement(transformation(extent = {{60, 60}, {100, 100}}), iconTransformation(extent = {{-20, -20}, {20, 20}}, origin = {-80, 80})));
        protected
          Physiolibrary.Types.HydraulicElastance es_int;
        equation
          if not useEs_extInput then
            es_int = EMAX;
          end if;
          HeartInterval = time - T0;
          Et = EMIN + (es_int - EMIN) * Et0;
          Et0 = smooth(1, if HeartInterval >= Tas + Tav and HeartInterval < Tas + Tav + Tvs then (HeartInterval - (Tas + Tav)) / Tvs * sin(Modelica.Constants.pi * (HeartInterval - (Tas + Tav)) / Tvs) / Kn else 0);
          annotation (
            Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-98, 82}, {100, -100}}, pattern = LinePattern.None, lineThickness = 1, fillColor = {255, 255, 170}, fillPattern = FillPattern.Solid, lineColor = {0, 0, 255}), Text(extent = {{-82, 82}, {80, 24}}, lineColor = {0, 0, 255}, lineThickness = 1, fillColor = {255, 255, 170}, fillPattern = FillPattern.Solid, textString = "Ventricular elastance"), Line(points = {{-72, -34}, {-62, -34}, {-52, -34}, {-44, 8}, {-18, 38}, {-12, 14}, {-6, -10}, {0, -32}, {6, -34}, {88, -34}, {94, -34}}, color = {0, 0, 255}, smooth = Smooth.Bezier), Text(extent = {{-220, -102}, {200, -120}}, lineColor = {0, 0, 255}, lineThickness = 1, fillColor = {255, 255, 170}, fillPattern = FillPattern.Solid, textString = "%name"), Text(extent = {{96, -32}, {68, -8}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 170}, fillPattern = FillPattern.Solid, textString = "Et0"), Text(extent = {{42, -72}, {88, -84}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 170}, fillPattern = FillPattern.Solid, textString = "Heart interval"), Text(extent = {{62, 30}, {96, 8}}, lineColor = {0, 0, 255}, lineThickness = 1, fillColor = {255, 255, 170}, fillPattern = FillPattern.Solid, textString = "Ct")}));
        end VentricularElastance;

        model HeartIntervals
          discrete Physiolibrary.Types.Time Tas;
          discrete Physiolibrary.Types.Time T0;
          discrete Physiolibrary.Types.Time Tvs;
          parameter Physiolibrary.Types.Time Tav(displayUnit = "s") = 0.01 "atrioventricular delay";
          parameter Physiolibrary.Types.Frequency HR_start = 1.2 "initial heart rate";
          discrete Modelica.Units.SI.Time HP(start = 0) "heart period";
          Boolean b(start = false);
          Physiolibrary.Types.RealIO.FrequencyInput HR(start = 1.2) "heart rate" annotation (
            Placement(transformation(extent = {{-12, 68}, {28, 108}}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {0, 80})));
        initial equation
          T0 = 0 "start time of cardiac cycle";
          HP = 1 / HR_start "update heart period per heart rate";
          Tas = 0.03 + 0.09 / HR_start "duration of atrial systole";
          Tvs = 0.16 + 0.2 / HR_start "duration of ventricular systole";
        equation
          b = time - pre(T0) >= pre(HP) "true if new pulse occurs";
          when {b} then
            T0 = time "start time of cardiac cycle";
            HP = 1 / HR "update heart period per heart rate";
            Tas = 0.03 + 0.09 * HP "duration of atrial systole";
            Tvs = 0.16 + 0.2 * HP "duration of ventricular systole";
          end when;
          annotation (
            Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Text(extent = {{-64, 102}, {-6, 78}}, lineColor = {0, 0, 255}, textString = "HR")}));
        end HeartIntervals;
      end Parts;

      model HemodynamicsMeurs_flatNorm
        extends Physiolibrary.Icons.CardioVascular;
        Physiolibrary.Fluid.Components.ElasticVesselElastance Epa(
        volume_start=0.000106,
        ZeroPressureVolume=5e-05,
        ExternalPressure(displayUnit="mmHg") = -533.28954966,
        Elastance=31064116.267695,                                                                                                                                                            nPorts = 2) annotation (
          Placement(transformation(extent = {{-94, 84}, {-66, 112}})));
        Physiolibrary.Fluid.Components.Resistor Rpp(Resistance(displayUnit = "(mmHg.s)/ml") = 14665462.61565) annotation (
          Placement(transformation(extent = {{-56, 85}, {-22, 111}})));
        Physiolibrary.Fluid.Components.ElasticVesselElastance Epv(
        volume_start=0.000518,
        ZeroPressureVolume=0.00035,
        ExternalPressure=-533.28954966,
        Elastance=6066168.6273825,                                                                                                                                                              nPorts = 2) annotation (
          Placement(transformation(extent = {{-14, 84}, {20, 112}})));
        Physiolibrary.Fluid.Components.Resistor Rlain(Resistance(displayUnit = "(mmHg.s)/ml") = 399967.162245) annotation (
          Placement(transformation(extent = {{26, 86}, {56, 110}})));
        Physiolibrary.Fluid.Components.ElasticVesselElastance LeftAtrium(
        isExternalPressureAbsolute=false,                                useElastanceInput = true,
        volume_start=9.31e-05,
        ZeroPressureVolume=3e-05,
        ExternalPressure=-533.28954966,                                                                                                                                                           nPorts = 2) annotation (
          Placement(transformation(extent = {{74, 50}, {102, 78}})));
        Physiolibrary.Fluid.Components.ElasticVesselElastance LeftVentricle(
        isExternalPressureAbsolute=false,                                   useElastanceInput = true,
        volume_start=0.000144,
        ZeroPressureVolume=6e-05,
        ExternalPressure=-533.28954966,                                                                                                                                                              nPorts = 2) annotation (
          Placement(transformation(extent = {{150, 50}, {178, 78}})));
        Physiolibrary.Fluid.Components.IdealValveResistance AorticValve(_Roff(displayUnit = "g/(mmHg.s)") = Modelica.Constants.inf, _Ron(displayUnit = "(mmHg.s)/ml") = 1066579.09932) annotation (
          Placement(transformation(extent = {{184, 76}, {208, 52}})));
        Parts.AtrialElastance LAtrialElastance(Tav(displayUnit = "s"), EMIN = 15998686.4898, EMAX = 37330268.4762) annotation (
          Placement(transformation(extent = {{80, 92}, {118, 124}})));
        Parts.VentricularElastance LVentricularElastance(EMIN = 11999014.86735, EMAX = 533289549.66) annotation (
          Placement(transformation(extent = {{164, 88}, {200, 120}})));
        Physiolibrary.Fluid.Components.IdealValveResistance MitralValve(_Roff(displayUnit = "g/(mmHg.s)") = Modelica.Constants.inf, _Ron(displayUnit = "(mmHg.s)/ml") = 399967.162245) annotation (
          Placement(transformation(origin = {127, 64}, extent = {{-13, 12}, {13, -12}})));
        Physiolibrary.Fluid.Components.ElasticVesselElastance Eitha(
        ExternalPressure=-533.28954966,                                                                       nPorts = 4,
        volume_start=0.0002,
        ZeroPressureVolume=0.00014,
        Elastance=190651014.00345)                                                                                                                                                                          annotation (
          Placement(transformation(extent = {{168, 6}, {190, 28}})));
        Physiolibrary.Fluid.Components.ElasticVesselElastance Eetha(
        volume_start=0.000526,
        ZeroPressureVolume=0.00037,
        Elastance=74127247.40274,                                                                                                                      nPorts = 3) annotation (
          Placement(transformation(extent = {{56, 4}, {82, 30}})));
        Physiolibrary.Fluid.Components.Inertia inertia(I(displayUnit=
              "mmHg.s2/g") = 226.6480586055, massFlow_start(displayUnit=
              "g/min") = 0.021666666666667)                                                                                                                       annotation (
          Placement(transformation(extent = {{-11, -11}, {11, 11}}, rotation = 180, origin = {141, 17})));
        Physiolibrary.Fluid.Components.Resistor Retha(Resistance(displayUnit = "(mmHg.s)/ml") = 7999343.2449) annotation (
          Placement(transformation(extent = {{90, 6}, {112, 28}})));
        Physiolibrary.Fluid.Components.Resistor Rsart(Resistance(displayUnit = "(mmHg.s)/ml") = 106657909.932) annotation (
          Placement(transformation(extent = {{14, -13}, {-14, 13}}, origin = {24, 19})));
        Physiolibrary.Fluid.Components.Resistor Rsven(Resistance(displayUnit = "(mmHg.s)/ml") = 26664477.483) annotation (
          Placement(transformation(extent = {{14, -13}, {-14, 13}}, origin = {-60, 17})));
        Physiolibrary.Fluid.Components.ElasticVesselElastance Est(volume_start = 0.283e-3, ZeroPressureVolume = 0.185e-3, Elastance = 34930465.50273, nPorts = 3) annotation (
          Placement(transformation(extent = {{-28, 6}, {-4, 28}})));
        Physiolibrary.Fluid.Components.Resistor Rethv(Resistance(displayUnit = "(mmHg.s)/ml") = 11999014.86735) annotation (
          Placement(transformation(extent = {{-120, 4}, {-146, 30}})));
        Physiolibrary.Fluid.Components.Resistor Rrain(Resistance(displayUnit = "(mmHg.s)/ml") = 399967.162245) annotation (
          Placement(transformation(extent = {{-208, 4}, {-236, 30}})));
        Physiolibrary.Fluid.Components.ElasticVesselElastance Eithv(
        volume_start=0.00148,
        ZeroPressureVolume=0.00119,
        ExternalPressure=-533.28954966,
        Elastance=2426467.450953,                                                                                                                                                               nPorts = 3) annotation (
          Placement(transformation(extent = {{-194, 4}, {-166, 30}})));
        Physiolibrary.Fluid.Components.ElasticVesselElastance Eethv(
        volume_start=0.00153,
        ZeroPressureVolume=0.001,
        Elastance=2253148.3473135,                                                                                                                  nPorts = 3) annotation (
          Placement(transformation(extent = {{-108, 4}, {-82, 30}})));
        Physiolibrary.Fluid.Components.ElasticVesselElastance RightAtrium(
        isExternalPressureAbsolute=false,                                 useElastanceInput = true,
        volume_start=0.000135,
        ZeroPressureVolume=3e-05,
        ExternalPressure(displayUnit="mmHg") = -533.28954966,                                                                                                                                      nPorts = 2) annotation (
          Placement(transformation(extent = {{-242, 44}, {-214, 72}})));
        Physiolibrary.Fluid.Components.ElasticVesselElastance RightVentricle(
        isExternalPressureAbsolute=false,                                    useElastanceInput = true,
        volume_start=0.000131,
        ZeroPressureVolume=4e-05,
        ExternalPressure(displayUnit="mmHg") = -533.28954966,                                                                                                                                         nPorts = 2) annotation (
          Placement(transformation(extent = {{-170, 42}, {-140, 72}})));
        Physiolibrary.Fluid.Components.IdealValveResistance PulmonaryValve(_Roff(displayUnit = "g/(mmHg.s)") = Modelica.Constants.inf, _Ron(displayUnit = "(mmHg.s)/ml") = 399967.162245) annotation (
          Placement(transformation(extent = {{-132, 70}, {-106, 44}})));
        Parts.AtrialElastance RAtrialElastance(EMIN = 6666119.37075, EMAX = 19998358.11225) annotation (
          Placement(transformation(extent = {{-244, 86}, {-206, 118}})));
        Parts.VentricularElastance RVentricularElastance(EMIN = 7599376.082655, EMAX = 65327969.83335) annotation (
          Placement(transformation(extent = {{-180, 88}, {-150, 122}})));
        Physiolibrary.Fluid.Components.IdealValveResistance TricuspidValve(_Roff = Modelica.Constants.inf, _Ron(displayUnit = "(mmHg.s)/ml") = 399967.162245) annotation (
          Placement(transformation(origin = {-189, 58}, extent = {{-13, 12}, {13, -12}})));
        replaceable Physiolibrary.Types.Constants.FrequencyConst HeartRate(k(displayUnit = "1/min") = 1.2) annotation (
          Placement(transformation(origin = {-243, 128.5}, extent = {{-11, -6.5}, {11, 6.5}})));
        inner Modelica.Fluid.System system(p_ambient(displayUnit = "mmHg") = 101325.0144354, T_ambient = 310.15) annotation (
          Placement(transformation(extent = {{-48, 144}, {-28, 164}})));
        Sensors.PressureMeasure EithaPressure annotation (
          Placement(transformation(extent = {{190, -36}, {210, -16}})));
        Sensors.PressureMeasure EethaPressure annotation (
          Placement(transformation(extent = {{78, -56}, {98, -36}})));
        Sensors.PressureMeasure EstPressure annotation (
          Placement(transformation(extent = {{-12, -52}, {8, -32}})));
        Sensors.PressureMeasure EethvPressure annotation (
          Placement(transformation(extent = {{-92, -52}, {-72, -32}})));
        Sensors.PressureMeasure EithvPressure annotation (
          Placement(transformation(extent = {{-166, -54}, {-146, -34}})));
        Sensors.Power power annotation (
          Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {-96, 72})));
        Sensors.Power power1 annotation (
          Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {-254, 36})));
        Modelica.Blocks.Math.Mean rightHeartPower(f(displayUnit = "1/min") = 1.2) annotation (
          Placement(transformation(extent = {{-214, -66}, {-194, -46}})));
        Modelica.Blocks.Math.Feedback feedback annotation (
          Placement(transformation(extent = {{-264, -46}, {-244, -66}})));
        Sensors.Power power2 annotation (
          Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {70, 82})));
        Sensors.Power power3 annotation (
          Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {224, 38})));
        Modelica.Blocks.Math.Mean leftHeartPower(f(displayUnit = "1/min") = 1.2) annotation (
          Placement(transformation(extent = {{186, -110}, {206, -90}})));
        Modelica.Blocks.Math.Feedback feedback1 annotation (
          Placement(transformation(extent = {{136, -110}, {156, -90}})));
        Sensors.Sphygmomanometer arterialPressure(MeasurementTime(displayUnit = "s") = 60 / 72) annotation (
          Placement(transformation(extent = {{198, -66}, {218, -46}})));
      equation
        connect(Retha.q_out, inertia.q_out) annotation (
          Line(points = {{112, 17}, {130, 17}}, thickness = 1));
        connect(HeartRate.y, RAtrialElastance.HR) annotation (
          Line(points = {{-229.25, 128.5}, {-225, 128.5}, {-225, 114.8}}, color = {0, 0, 127}));
        connect(RVentricularElastance.HR, HeartRate.y) annotation (
          Line(points = {{-165, 118.6}, {-165, 128.5}, {-229.25, 128.5}}, color = {0, 0, 127}));
        connect(LAtrialElastance.HR, HeartRate.y) annotation (
          Line(points = {{99, 120.8}, {99, 128.5}, {-229.25, 128.5}}, color = {0, 0, 127}));
        connect(LVentricularElastance.HR, HeartRate.y) annotation (
          Line(points = {{182, 116.8}, {182, 128.5}, {-229.25, 128.5}}, color = {0, 0, 127}));
        connect(RightAtrium.q_in[1], TricuspidValve.q_in) annotation (
          Line(points={{-228.14,57.09},{-214,57.09},{-214,58},{-202,58}},          color = {127, 0, 0}, thickness = 0.5));
        connect(TricuspidValve.q_out, RightVentricle.q_in[1]) annotation (
          Line(points={{-176,58},{-166,58},{-166,56.025},{-155.15,56.025}},        color = {127, 0, 0}, thickness = 0.5));
        connect(RightVentricle.q_in[2], PulmonaryValve.q_in) annotation (
          Line(points={{-155.15,57.975},{-143.725,57.975},{-143.725,57},{-132,
              57}},                                                                        color = {127, 0, 0}, thickness = 0.5));
        connect(Epa.q_in[1], Rpp.q_in) annotation (
          Line(points={{-80.14,97.09},{-68,97.09},{-68,98},{-56,98}},          color = {127, 0, 0}, thickness = 0.5));
        connect(Rpp.q_out, Epv.q_in[1]) annotation (
          Line(points={{-22,98},{-8,98},{-8,97.09},{2.83,97.09}},          color = {127, 0, 0}, thickness = 0.5));
        connect(Epv.q_in[2], Rlain.q_in) annotation (
          Line(points={{2.83,98.91},{16,98.91},{16,98},{26,98}},          color = {127, 0, 0}, thickness = 0.5));
        connect(LeftAtrium.q_in[1], MitralValve.q_in) annotation (
          Line(points={{87.86,63.09},{102,63.09},{102,64},{114,64}},          color = {127, 0, 0}, thickness = 0.5));
        connect(MitralValve.q_out, LeftVentricle.q_in[1]) annotation (
          Line(points={{140,64},{154,64},{154,66},{163.86,66},{163.86,63.09}},            color = {127, 0, 0}, thickness = 0.5));
        connect(LeftVentricle.q_in[2], AorticValve.q_in) annotation (
          Line(points={{163.86,64.91},{172,64.91},{172,64},{184,64}},          color = {127, 0, 0}, thickness = 0.5));
        connect(inertia.q_in, Eitha.q_in[1]) annotation (
          Line(points={{152,17},{164,17},{164,15.9275},{178.89,15.9275}},        color = {127, 0, 0}, thickness = 0.5));
        connect(Retha.q_in, Eetha.q_in[1]) annotation (
          Line(points={{90,17},{80,17},{80,15.8733},{68.87,15.8733}},          color = {127, 0, 0}, thickness = 0.5));
        connect(Rsart.q_in, Eetha.q_in[2]) annotation (
          Line(points = {{38, 19}, {52, 19}, {52, 17}, {68.87, 17}}, color = {127, 0, 0}, thickness = 0.5));
        connect(Est.q_in[1], Rsart.q_out) annotation (
          Line(points={{-16.12,16.0467},{-3.18,16.0467},{-3.18,19},{10,19}},          color = {127, 0, 0}, thickness = 0.5));
        connect(Est.q_in[2], Rsven.q_in) annotation (
          Line(points = {{-16.12, 17}, {-31.18, 17}, {-31.18, 17}, {-46, 17}}, color = {127, 0, 0}, thickness = 0.5));
        connect(Rsven.q_out, Eethv.q_in[1]) annotation (
          Line(points={{-74,17},{-86,17},{-86,15.8733},{-95.13,15.8733}},          color = {127, 0, 0}, thickness = 0.5));
        connect(Rethv.q_in, Eethv.q_in[2]) annotation (
          Line(points = {{-120, 17}, {-107, 17}, {-107, 17}, {-95.13, 17}}, color = {127, 0, 0}, thickness = 0.5));
        connect(Rethv.q_out, Eithv.q_in[1]) annotation (
          Line(points={{-146,17},{-164,17},{-164,15.8733},{-180.14,15.8733}},          color = {127, 0, 0}, thickness = 0.5));
        connect(Rrain.q_in, Eithv.q_in[2]) annotation (
          Line(points = {{-208, 17}, {-194, 17}, {-194, 17}, {-180.14, 17}}, color = {127, 0, 0}, thickness = 0.5));
        connect(EithaPressure.port, Eitha.q_in[2]) annotation (
          Line(points={{200,-36},{178.89,-36},{178.89,16.6425}},       color = {127, 0, 0}, thickness = 0.5));
        connect(EethaPressure.port, Eetha.q_in[3]) annotation (
          Line(points={{88,-56},{88,-54},{68.87,-54},{68.87,18.1267}},          color = {127, 0, 0}, thickness = 0.5));
        connect(EstPressure.port, Est.q_in[3]) annotation (
          Line(points={{-2,-52},{-16.12,-52},{-16.12,17.9533}},        color = {127, 0, 0}, thickness = 0.5));
        connect(EethvPressure.port, Eethv.q_in[3]) annotation (
          Line(points={{-82,-52},{-95.13,-52},{-95.13,18.1267}},        color = {127, 0, 0}, thickness = 0.5));
        connect(Eithv.q_in[3],EithvPressure.port)  annotation (
          Line(points={{-180.14,18.1267},{-180.14,-54},{-156,-54}},        color = {127, 0, 0}, thickness = 0.5));
        connect(RAtrialElastance.Et, RightAtrium.elastance) annotation (
          Line(points = {{-202.39, 101.84}, {-202.39, 85.92}, {-225.2, 85.92}, {-225.2, 70.6}}, color = {0, 0, 127}));
        connect(RVentricularElastance.Et, RightVentricle.elastance) annotation (
          Line(points = {{-147.15, 108.91}, {-134, 108.91}, {-134, 76}, {-152, 76}, {-152, 70.5}}, color = {0, 0, 127}));
        connect(LAtrialElastance.Et, LeftAtrium.elastance) annotation (
          Line(points = {{121.61, 107.84}, {121.61, 91.92}, {90.8, 91.92}, {90.8, 76.6}}, color = {0, 0, 127}));
        connect(LVentricularElastance.Et, LeftVentricle.elastance) annotation (
          Line(points = {{203.42, 107.68}, {222, 107.68}, {222, 76.6}, {166.8, 76.6}}, color = {0, 0, 127}));
        connect(PulmonaryValve.q_out, power.q_in) annotation (
          Line(points = {{-106, 57}, {-96, 57}, {-96, 62}}, color = {127, 0, 0}, thickness = 0.5));
        connect(power.q_out, Epa.q_in[2]) annotation (
          Line(points={{-96,82},{-96,98.91},{-80.14,98.91}},        color = {127, 0, 0}, thickness = 0.5));
        connect(Rrain.q_out, power1.q_in) annotation (
          Line(points = {{-236, 17}, {-254, 17}, {-254, 26}}, color = {127, 0, 0}, thickness = 0.5));
        connect(power1.q_out, RightAtrium.q_in[2]) annotation (
          Line(points={{-254,46},{-254,58.91},{-228.14,58.91}},        color = {127, 0, 0}, thickness = 0.5));
        connect(power.power, feedback.u1) annotation (
          Line(points = {{-108, 72}, {-276, 72}, {-276, -56}, {-262, -56}}, color = {0, 0, 127}));
        connect(power1.power, feedback.u2) annotation (
          Line(points = {{-266, 36}, {-268, 36}, {-268, -30}, {-254, -30}, {-254, -48}}, color = {0, 0, 127}));
        connect(feedback.y, rightHeartPower.u) annotation (
          Line(points = {{-245, -56}, {-216, -56}}, color = {0, 0, 127}));
        connect(Rlain.q_out, power2.q_in) annotation (
          Line(points = {{56, 98}, {70, 98}, {70, 92}}, color = {127, 0, 0}, thickness = 0.5));
        connect(power2.q_out, LeftAtrium.q_in[2]) annotation (
          Line(points={{70,72},{70,64.91},{87.86,64.91}},        color = {127, 0, 0}, thickness = 0.5));
        connect(AorticValve.q_out, power3.q_in) annotation (
          Line(points = {{208, 64}, {224, 64}, {224, 48}}, color = {127, 0, 0}, thickness = 0.5));
        connect(power3.q_out, Eitha.q_in[3]) annotation (
          Line(points={{224,28},{224,17.3575},{178.89,17.3575}},      color = {127, 0, 0}, thickness = 0.5));
        connect(feedback1.y, leftHeartPower.u) annotation (
          Line(points = {{155, -100}, {184, -100}}, color = {0, 0, 127}));
        connect(power3.power, feedback1.u1) annotation (
          Line(points = {{236, 38}, {244, 38}, {244, -84}, {130, -84}, {130, -100}, {138, -100}}, color = {0, 0, 127}));
        connect(power2.power, feedback1.u2) annotation (
          Line(points = {{82, 82}, {106, 82}, {106, -8}, {118, -8}, {118, -124}, {146, -124}, {146, -108}}, color = {0, 0, 127}));
        connect(Eitha.q_in[4],arterialPressure.port)  annotation (
          Line(points={{178.89,18.0725},{178.89,-66},{208,-66}},       color = {127, 0, 0}, thickness = 0.5));
        annotation (
          Diagram(coordinateSystem(extent = {{-280, -140}, {280, 180}}, preserveAspectRatio = false)),
          Icon(coordinateSystem(extent = {{-280, -140}, {280, 180}}, preserveAspectRatio = false), graphics),
          Documentation(info = "<html>
        <p>Model of cardiovascular system using to demonstrate elastic and resistance features of veins and arteries in pulmonary and systemic circulation and influence of cardiac output on it.</p>
        <ul>
        <li>J. A. Goodwin, W. L. van Meurs, C. D. Sa Couto, J. E. W.Beneken, S. A. Graves, A model for educational simulation of infant cardiovascular physiology., Anesthesia and analgesia 99 (6)(2004) 1655&ndash;1664. doi:10.1213/01.ANE.0000134797.52793.AF.</li>
        <li>C. D. Sa Couto, W. L. van Meurs, J. A. Goodwin, P. Andriessen,A Model for Educational Simulation of Neonatal Cardiovascular Pathophysiology, Simulation in Healthcare 1 (Inaugural) (2006) 4&ndash;12.</li>
        <li>W. van Meurs, Modeling and Simulation in Biomedical Engineering: Applications in Cardiorespiratory Physiology, McGraw-Hill Professional, 2011.</li>
        </ul>
        </html>",
                revisions = "<html>
        <ul>
        <li><i>Jul 2015 </i>by Tomas Kulhanek: Created. </li>
        </ul>
        </html>"),
          experiment(StopTime = 10, __Dymola_Algorithm = "Dassl"));
      end HemodynamicsMeurs_flatNorm;
      annotation (
        Documentation(info = "<html>
	</html>"));
    end MeursModel2011;

    package Dialysis
      extends Modelica.Icons.ExamplesPackage;

      model DialysisMembrane
        import Physiolibrary;
        replaceable package BloodPlasma = Physiolibrary.Media.BodyFluid constrainedby
        Physiolibrary.Media.BodyFluid                                                                               "Medium model of blood plasma" annotation (
           choicesAllMatching = true);
        replaceable package Dialysate = Physiolibrary.Media.BodyFluid constrainedby
        Physiolibrary.Media.BodyFluid                                                                             "Medium model of dialysate" annotation (
           choicesAllMatching = true);
        parameter Physiolibrary.Types.HydraulicCompliance Compliance = 7.5006157584566e-09 "Hydraulic compliance";
        parameter Physiolibrary.Types.HydraulicResistance Resistance = 10 * 15998686.4898 "Hydraulic resistance";
        parameter Physiolibrary.Types.Permeability Permeabilities[BloodPlasma.nS] = {1e-06, 1e-06, 1e-06, 1e-06, 1e-06, 1e-06, 1e-06, 1e-06, 0, 0, 0, 1e-06} "Membrane permeability coeficients for {Na,HCO3-,K,Glu,Urea,Cl,Ca,Mg,Alb,Glb,Others,H2O}";
        parameter Modelica.Units.SI.MassFraction InitialPlasma[BloodPlasma.nS - 1](each displayUnit = "%") = {0.0031, 0.0015, 0.0002, 0.0009, 0.0018, 0.0038, 6e-05, 1.2e-05, 0.047, 0.053, 1e-11} "Initial blood plasma substances mass fractions {Na,HCO3-,K,Glu,Urea,Cl,Ca,Mg,Alb,Glb,Others,H2O}" annotation (
          Dialog(group = "Initialization"));
        //concentrations: { 135,24,5,5,30,105,1.5,0.5,0.7,0.8,1e-06} mmmol/L
        parameter Modelica.Units.SI.MassFraction InitialDialysate[Dialysate.nS - 1](each displayUnit = "%") = {0.0032, 0.002, 0.00012, 0.0009, 1e-11, 0.004, 6e-05, 1.2e-05, 1e-08, 1e-08, 0.00028} "Initial dialysate substances mass fractions {Na,HCO3-,K,Glu,Urea,Cl,Ca,Mg,Alb,Glb,Others,H2O}" annotation (
          Dialog(group = "Initialization"));
        //concantrations: {138,32,3,5,1e-06,111,1e-06,1e-06,1e-06,1e-06,1e-06} mmol/L
        parameter Modelica.Units.SI.Pressure InitialBloodPressure(displayUnit = "mmHg") = 0 "Initial relative blood pressure" annotation (
          Dialog(group = "Initialization"));
        parameter Modelica.Units.SI.Pressure InitialDialysatePressure(displayUnit = "mmHg") = 0 "Initial relative dialysate pressure" annotation (
          Dialog(group = "Initialization"));
        Physiolibrary.Fluid.Components.Resistor blood_pipe(redeclare package
          Medium =
            BloodPlasma,                                                                            Resistance(displayUnit = "(mmHg.min)/l") = Resistance) annotation (
          Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {-94, -58})));
        Physiolibrary.Fluid.Components.Resistor dialysatePipe(redeclare package
                  Medium =                                                               Dialysate, Resistance = Resistance) annotation (
          Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {94, 48})));
        Physiolibrary.Fluid.Interfaces.FluidPort_a blood_in(redeclare package
          Medium =
            BloodPlasma)                                                                            annotation (
          Placement(transformation(extent = {{-70, -110}, {-50, -90}})));
        Physiolibrary.Fluid.Interfaces.FluidPort_b blood_out(redeclare package
                  Medium =
            BloodPlasma)                                                                             annotation (
          Placement(transformation(extent = {{-70, 110}, {-50, 90}})));
        Physiolibrary.Fluid.Interfaces.FluidPort_a dialysate_in(redeclare
            package
                  Medium =                                                                 Dialysate)
                                                                                                      annotation (
          Placement(transformation(extent = {{50, 110}, {70, 90}})));
        Physiolibrary.Fluid.Interfaces.FluidPort_b dialysate_out(redeclare
            package
                  Medium =                                                                  Dialysate)
                                                                                                       annotation (
          Placement(transformation(extent = {{50, -110}, {70, -90}})));
      Physiolibrary.Chemical.Components.Membrane membrane[BloodPlasma.nS](
          each EnthalpyNotUsed=false, KC=Permeabilities)
        annotation (Placement(transformation(extent={{-8,-14},{12,6}})));
        Physiolibrary.Fluid.Components.ElasticVessel bloodVessel(redeclare
            package
                  Medium =
            BloodPlasma,                                                                                 useSubstances = true, volume_start = InitialBloodPressure * Compliance, massFractions_start = InitialPlasma,  Compliance(displayUnit = "ml/mmHg") = Compliance, ZeroPressureVolume(displayUnit = "m3"), nPorts = 2) annotation (
          Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 180, origin = {-68, -4})));
        Physiolibrary.Fluid.Components.ElasticVessel dialysateVessel(redeclare
            package
                  Medium =                                                                      Dialysate, useSubstances = true, onElectricGround = true, volume_start = InitialDialysatePressure * Compliance, massFractions_start = InitialDialysate,  Compliance(displayUnit = "ml/mmHg") = Compliance, nPorts = 2) annotation (
          Placement(transformation(extent = {{66, -14}, {86, 6}})));
      equation
        connect(membrane.port_b, dialysateVessel.substances) annotation (
          Line(points = {{12, -4}, {66, -4}}, color = {158, 66, 200}));
        connect(bloodVessel.substances, membrane.port_a) annotation (
          Line(points = {{-58, -4}, {-8, -4}}, color = {158, 66, 200}));
        connect(blood_pipe.q_in, blood_in) annotation (
          Line(points = {{-94, -68}, {-94, -100}, {-60, -100}}, color = {127, 0, 0}, thickness = 0.5));
        connect(blood_pipe.q_out, bloodVessel.q_in[1]) annotation (
          Line(points={{-94,-48},{-94,-3.35},{-67.9,-3.35}},      color = {127, 0, 0}, thickness = 0.5));
        connect(dialysatePipe.q_in, dialysate_in) annotation (
          Line(points = {{94, 58}, {94, 100}, {60, 100}}, color = {127, 0, 0}, thickness = 0.5));
        connect(dialysatePipe.q_out, dialysateVessel.q_in[1]) annotation (
          Line(points={{94,38},{94,-2},{75.9,-2},{75.9,-4.65}},         color = {127, 0, 0}, thickness = 0.5));
        connect(blood_out, bloodVessel.q_in[2]) annotation (
          Line(points={{-60,100},{-94,100},{-94,-4.65},{-67.9,-4.65}},        color = {127, 0, 0}, thickness = 0.5));
        connect(dialysate_out, dialysateVessel.q_in[2]) annotation (
          Line(points={{60,-100},{94,-100},{94,-3.35},{75.9,-3.35}},        color = {127, 0, 0}, thickness = 0.5));
        annotation (
          Icon(coordinateSystem(preserveAspectRatio = false), graphics={  Rectangle(extent = {{-100, 100}, {0, -100}}, lineColor = {255, 255, 0}, fillColor = {238, 46, 47}, fillPattern = FillPattern.VerticalCylinder), Rectangle(extent = {{0, 100}, {100, -100}}, lineColor = {255, 255, 0}, fillPattern = FillPattern.VerticalCylinder, fillColor = {28, 108, 200})}),
          Diagram(coordinateSystem(preserveAspectRatio = false)));
      end DialysisMembrane;

      model Dialysis
        extends Modelica.Icons.Example;
        replaceable package BloodPlasma = Physiolibrary.Media.BodyFluid "Medium model of blood plasma" annotation (
          choicesAllMatching = true);
        replaceable package Dialysate = Physiolibrary.Media.BodyFluid "Medium model of dialysate" annotation (
          choicesAllMatching = true);
        parameter Integer N = 5 "Number of parts";
        parameter Modelica.Units.SI.MassFraction PlasmaSubstances[BloodPlasma.nS - 1](each displayUnit = "%") = {0.00310, 0.00146, 0.0002, 0.0009, 0.0018, 0.00376, 6e-05, 1e-05, 0.04655, 0.0532, 1e-11} "Mass fractions of {Na,HCO3-,K,Glu,Urea,Cl,Ca,Mg,Alb,Glb,Others} in inflowing blood plasma";
        //{135,24,5,5,30,106,1.5,0.5,0.7,0.8,1e-6};
        parameter Modelica.Units.SI.MassFraction DialysateSubstances[Dialysate.nS - 1](each displayUnit = "%") = {0.00317, 0.00195, 0.000117, 0.0009, 6e-11, 0.004, 6e-05, 1e-05, 6e-08, 6e-08, 0.000281} "Mass fractions of {Na,HCO3-,K,Glu,Urea,Cl,Ca,Mg,Alb,Glb,Others} in inflowing dialysate";
        /*{138,32,3,5,1e-6,113,1.5,0.5,1e-6,1e-6,15.6};*/
        parameter Modelica.Units.SI.Pressure InitialBloodPressure = 2399.80297347 "Initial blood pressure";
        parameter Modelica.Units.SI.Pressure InitialDialysatePressure = 2000 + 7866.020857485 "Initial dialysate pressure";
        Physiolibrary.Fluid.Examples.Dialysis.DialysisMembrane dialysis[N](each InitialPlasma = PlasmaSubstances, each InitialDialysate = DialysateSubstances, InitialBloodPressure = {i * InitialBloodPressure / (N + 1) for i in 1:N}, InitialDialysatePressure = {(N - i + 1) * InitialDialysatePressure / (N + 1) for i in 1:N}, each Permeabilities = {1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1} * 1e-7, redeclare
            package
                  BloodPlasma =
            BloodPlasma,                                                                                                                                                                                                        redeclare
            package
                  Dialysate =                                                                                                                                                                                                         Dialysate)
                                                                                                                                                                                                                annotation (
          Placement(transformation(extent = {{16, -18}, {36, 2}})));
        inner Modelica.Fluid.System system(T_ambient = 310.15) annotation (
          Placement(transformation(extent = {{-92, -6}, {-72, 14}})));
        Modelica.Blocks.Sources.Sine sine_blood_pressure_input(f(displayUnit = "1/min") = 0.16666666666667, amplitude = 600, offset = InitialBloodPressure + 101325) annotation (
          Placement(transformation(extent = {{-50, -76}, {-30, -56}})));
        Modelica.Blocks.Sources.Sine sine_dialysate_pressure_input(f(displayUnit = "1/min") = 0.41666666666667, amplitude = 2000, offset = InitialDialysatePressure + 101325) annotation (
          Placement(transformation(extent = {{94, 60}, {74, 80}})));
        Physiolibrary.Fluid.Sources.PressureSource blood_output(redeclare
            package
                  Medium =
            BloodPlasma)                                                                                annotation (
          Placement(transformation(extent = {{-74, 60}, {-54, 80}})));
        Physiolibrary.Fluid.Sources.PressureSource blood_input(redeclare
            package
                  Medium =
            BloodPlasma,                                                                               usePressureInput = true, massFractions_start = PlasmaSubstances) annotation (
          Placement(transformation(extent = {{-16, -84}, {4, -64}})));
        Sources.PressureSource dialysate_input(redeclare package Medium = Dialysate, usePressureInput = true, massFractions_start = DialysateSubstances) annotation (
          Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 180, origin = {48, 70})));
        Physiolibrary.Fluid.Sources.PressureSource dialysate_output(redeclare
            package
                  Medium =                                                                     Dialysate)
                                                                                                          annotation (
          Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 180, origin = {86, -74})));
        Physiolibrary.Fluid.Components.Resistor resistorB(redeclare package
          Medium =
            BloodPlasma,                                                                          EnthalpyNotUsed = true, Resistance = 15998686.4898) annotation (
          Placement(transformation(extent = {{-26, 60}, {-6, 80}})));
        Physiolibrary.Fluid.Components.Resistor resistorD(redeclare package
          Medium =                                                                   Dialysate, Resistance = 15998686.4898) annotation (
          Placement(transformation(extent = {{40, -84}, {60, -64}})));
        Sensors.MassFractions Urea_bloodOut(redeclare package Medium =
            BloodPlasma,                                                            substanceName = "Urea") annotation (
          Placement(transformation(extent = {{-36, 18}, {-16, 38}})));
        Sensors.MassFractions Urea_dialysateOut(redeclare package Medium =
            BloodPlasma,                                                                substanceName = "Urea") annotation (
          Placement(transformation(extent = {{64, -24}, {84, -4}})));
        Sensors.MassFractions Urea_bloodIn(redeclare package Medium =
            BloodPlasma,                                                           substanceName = "Urea") annotation (
          Placement(transformation(extent = {{-34, -36}, {-14, -16}})));
      equation
        for i in 1:N - 1 loop
          connect(dialysis[i].blood_out, dialysis[i + 1].blood_in);
        end for;
        for i in 1:N - 1 loop
          connect(dialysis[i + 1].dialysate_out, dialysis[i].dialysate_in);
        end for;
        connect(blood_input.y, dialysis[1].blood_in) annotation (
          Line(points = {{4, -74}, {20, -74}, {20, -18}}, color = {127, 0, 0}, thickness = 0.5));
        connect(sine_blood_pressure_input.y, blood_input.pressure) annotation (
          Line(points = {{-29, -66}, {-24, -66}, {-24, -74}, {-16, -74}}, color = {0, 0, 127}));
        connect(dialysate_input.y, dialysis[N].dialysate_in) annotation (
          Line(points = {{38, 70}, {32, 70}, {32, 2}}, color = {127, 0, 0}, thickness = 0.5));
        connect(sine_dialysate_pressure_input.y, dialysate_input.pressure) annotation (
          Line(points = {{73, 70}, {58, 70}}, color = {0, 0, 127}));
        connect(resistorB.q_out, dialysis[N].blood_out) annotation (
          Line(points = {{-6, 70}, {20, 70}, {20, 2}}, color = {127, 0, 0}, thickness = 0.5));
        connect(resistorB.q_in, blood_output.y) annotation (
          Line(points = {{-26, 70}, {-54, 70}}, color = {127, 0, 0}, thickness = 0.5));
        connect(resistorD.q_in, dialysis[1].dialysate_out) annotation (
          Line(points = {{40, -74}, {32, -74}, {32, -18}}, color = {127, 0, 0}, thickness = 0.5));
        connect(resistorD.q_out, dialysate_output.y) annotation (
          Line(points = {{60, -74}, {76, -74}}, color = {127, 0, 0}, thickness = 0.5));
        connect(dialysis[N].blood_out, Urea_bloodOut.port) annotation (
          Line(points = {{20, 2}, {20, 12}, {-26, 12}, {-26, 18}}, color = {127, 0, 0}, thickness = 0.5));
        connect(dialysis[1].dialysate_out, Urea_dialysateOut.port) annotation (
          Line(points = {{32, -18}, {32, -30}, {74, -30}, {74, -24}}, color = {127, 0, 0}, thickness = 0.5));
        connect(blood_input.y, Urea_bloodIn.port) annotation (
          Line(points = {{4, -74}, {20, -74}, {20, -36}, {-24, -36}}, color = {127, 0, 0}, thickness = 0.5));
        annotation (
          Icon(coordinateSystem(preserveAspectRatio = false)),
          Diagram(coordinateSystem(preserveAspectRatio = false)),
          experiment(StopTime = 30, Tolerance = 1e-05, __Dymola_Algorithm = "Dassl"));
      end Dialysis;
    end Dialysis;

    model BloodGasesEquilibrium
      extends Modelica.Icons.Example;
      import Modelica.Units.SI.*;
      replaceable package Air = Chemical.Media.SimpleAir_C;
      //Chemical.Media.Air_MixtureGasNasa;
      replaceable package Blood = Physiolibrary.Media.Blood;
      inner Modelica.Fluid.System system(T_ambient = 310.15) "Human body system setting" annotation (
        Placement(transformation(extent = {{60, 66}, {80, 86}})));
      Physiolibrary.Fluid.Components.ElasticVessel blood(redeclare package
          Medium =                                                                  Blood,
        Compliance(displayUnit="ml/mmHg") = 7.5006157584566e-09,                                            concentration_start = Blood.ArterialDefault, mass_start = 1, nPorts = 3, useSubstances = true, use_concentration_start = true, use_mass_start = true) annotation (
        Placement(transformation(extent={{-6,-52},{14,-32}})));

      // massFractions_start=zeros(Blood.nS - 1),
      // massPartition_start=zeros(Blood.nS),
      // amountPartition_start=zeros(Blood.nS),
      Chemical.Components.GasSolubility O2_GasSolubility(KC = 1e-6) annotation (
        Placement(transformation(extent = {{-58, -20}, {-38, 0}})));
      Chemical.Components.GasSolubility CO2_GasSolubility(KC = 1e-6) annotation (
        Placement(transformation(extent = {{-40, -20}, {-20, 0}})));
      Chemical.Components.GasSolubility CO_GasSolubility(KC = 1e-7) annotation (
        Placement(transformation(extent = {{-22, -20}, {-2, 0}})));
      Chemical.Sources.ExternalIdealGasSubstance O2(substanceData = Chemical.Substances.Oxygen_gas(), usePartialPressureInput = false, PartialPressure(displayUnit = "mmHg") = 133.322387415) annotation (
        Placement(transformation(extent={{-96,16},{-76,36}})));
      Chemical.Sources.ExternalIdealGasSubstance CO2(substanceData = Chemical.Substances.CarbonDioxide_gas(), PartialPressure(displayUnit = "mmHg") = 5332.8954966) annotation (
        Placement(transformation(extent = {{-70, 52}, {-50, 72}})));
      Chemical.Sources.ExternalIdealGasSubstance CO(substanceData = Chemical.Substances.CarbonMonoxide_gas(), PartialPressure(displayUnit = "mmHg") = 0.000133322387415) annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 180, origin = {28, 34})));
      Sensors.pH pH(redeclare package Medium = Media.Blood) "Acidity of blood"
        annotation (Placement(transformation(extent={{54,-74},{74,-54}})));
      Sensors.PartialPressure pO2(
        redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
        substanceData=Chemical.Substances.Oxygen_gas(),
        redeclare package Medium = Media.Blood) "Partial pressure of O2 in blood"
        annotation (Placement(transformation(extent={{-78,-70},{-58,-50}})));
      Sensors.MassFractions XO2(redeclare package Medium = Media.Blood,
          substanceName="O2") "Mass fraction of O2 in blood"
        annotation (Placement(transformation(extent={{44,-20},{64,0}})));
    equation
      connect(O2.port_a, O2_GasSolubility.gas_port) annotation (
        Line(points={{-76,26},{-48,26},{-48,0}},        color = {158, 66, 200}));
      connect(CO2.port_a, CO2_GasSolubility.gas_port) annotation (
        Line(points = {{-50, 62}, {-30, 62}, {-30, 0}}, color = {158, 66, 200}));
      connect(CO.port_a, CO_GasSolubility.gas_port) annotation (
        Line(points = {{18, 34}, {-12, 34}, {-12, 0}}, color = {158, 66, 200}));
      connect(pH.port, blood.q_in[1]) annotation (Line(
          points={{64,-74},{64,-78},{4,-78},{4,-46},{3.9,-46},{3.9,-42.8667}},
          color={127,0,0},
          thickness=0.5));

      connect(pO2.port, blood.q_in[2]) annotation (Line(
          points={{-68,-70},{-32,-70},{-32,-60},{4,-60},{4,-46},{3.9,-46},{3.9,
              -42}},
          color={127,0,0},
          thickness=0.5));
      connect(XO2.port, blood.q_in[3]) annotation (
        Line(points={{54,-20},{54,-50},{20,-50},{20,-56},{4,-56},{4,-46},{3.9,
              -46},{3.9,-41.1333}},                                                                                  color = {127, 0, 0}, thickness = 0.5));
      connect(CO2_GasSolubility.liquid_port, blood.substances[Blood.i("CO2")]) annotation (
        Line(points={{-30,-20},{-30,-42},{-6,-42}},        color = {158, 66, 200}));
      connect(pO2.port_a, blood.substances[Blood.i("O2")]) annotation (
        Line(points={{-58,-60},{-34,-60},{-34,-42},{-6,-42}},          color = {158, 66, 200}));
      connect(O2_GasSolubility.liquid_port, blood.substances[Blood.i("O2")]) annotation (
        Line(points={{-48,-20},{-46,-20},{-46,-42},{-6,-42}},          color = {158, 66, 200}));
      connect(CO_GasSolubility.liquid_port, blood.substances[Blood.i("CO")]) annotation (
        Line(points={{-12,-20},{-12,-42},{-6,-42}},        color = {158, 66, 200}));
      connect(pH.port_a, blood.substances[Blood.i("H+")]) annotation (
        Line(points={{74,-64},{82,-64},{82,-28},{-22,-28},{-22,-42},{-6,-42}},              color = {158, 66, 200}));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})),
        Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})),
        experiment(StopTime = 1, __Dymola_fixedstepsize = 0.1, __Dymola_Algorithm = "Dassl"),
        Documentation(info = "<html>
<p>References:</p>
<p><br>Mecklenburgh, J. S., and W. W. Mapleson. &quot;Ventilatory assistance and respiratory muscle activity. 1: Interaction in healthy volunteers.&quot; <i>British journal of anaesthesia</i> 80.4 (1998): 422-433.</p>
</html>"));
    end BloodGasesEquilibrium;

    model MinimalRespiration "Minimal respiration model"
      extends Modelica.Icons.Example;
      import Modelica.Units.SI.*;
      replaceable package Air = Media.Air;
      parameter Frequency RespirationRate = 0.2 "Respiration rate";
      parameter Volume ResidualVolume = 0.0013 "Lungs residual volume";
      parameter Volume FunctionalResidualCapacity = 0.00231 "Functional residual capacity";
      parameter Physiolibrary.Types.HydraulicResistance TotalResistance = 147099.75 "Total lungs pathways conductance";
      parameter Physiolibrary.Types.HydraulicCompliance TotalCompliance(displayUnit = "ml/mmHg") = 6.0004926067653e-07 "Total lungs compliance";
      parameter Pressure Pmin(displayUnit = "kPa") = -1000 "Relative external lungs pressure minimum caused by respiratory muscles";
      parameter Pressure Pmax(displayUnit = "kPa") = 0 "Relative external lungs pressure maximum";
      parameter Real RespiratoryMusclePressureCycle[:, 3] = {{0, Pmax, 0}, {3 / 8, Pmin, 0}, {4 / 8, (Pmin + Pmax) / 2, (Pmax - Pmin) * 5}, {6 / 8, Pmax - (Pmax - Pmin) / 16, (Pmax - Pmin) * 0.5}, {1, Pmax, 0}} "External lungs pressure during respiration cycle scaled to time period (0,1)";
      parameter Volume LungsAirVolume_initial = FunctionalResidualCapacity;
      Blocks.Source.PeriodicCurveSource respiratoryMusclePressureCycle(data = RespiratoryMusclePressureCycle) "Relative position in respiratory cycle (0,1) to absolute external lungs pressure" annotation (
        Placement(transformation(extent = {{18, 8}, {38, 28}})));
      Physiolibrary.Fluid.Components.ElasticVessel lungs(redeclare package
        Medium =                                                                    Air, use_mass_start = false, volume_start = LungsAirVolume_initial, use_concentration_start = false, massFractions_start = Air.reference_X, ZeroPressureVolume = FunctionalResidualCapacity, Compliance = TotalCompliance, useExternalPressureInput = true, nPorts = 2) "Lungs" annotation (
        Placement(transformation(extent = {{36, -28}, {56, -8}})));
      Physiolibrary.Fluid.Sensors.PressureMeasure lungsPressureMeasure(redeclare
          package
                Medium =                                                                          Air) "Lungs pressure" annotation (
        Placement(transformation(extent = {{70, -20}, {90, 0}})));
      inner Modelica.Fluid.System system(T_ambient = 310.15) "Human body system setting" annotation (
        Placement(transformation(extent = {{-76, 8}, {-56, 28}})));
      Physiolibrary.Fluid.Sources.PressureSource environment(redeclare package
                Medium =                                                                Air) "External environment" annotation (
        Placement(transformation(extent = {{-76, -30}, {-56, -10}})));
      Components.Resistor resistor(redeclare package Medium = Air,  Resistance = TotalResistance) annotation (
        Placement(transformation(extent = {{-6, -30}, {14, -10}})));
      Types.Constants.FrequencyConst frequency(k = RespirationRate) annotation (
        Placement(transformation(extent = {{-12, 14}, {-4, 22}})));
      Sensors.FlowMeasure flowMeasure(redeclare package Medium = Air) annotation (
        Placement(transformation(extent = {{-40, -30}, {-20, -10}})));
    equation
      connect(lungsPressureMeasure.port, lungs.q_in[1]) annotation (
        Line(points={{80,-20},{80,-18.65},{45.9,-18.65}},      color = {127, 0, 0}, thickness = 0.5));
      connect(resistor.q_out, lungs.q_in[2]) annotation (
        Line(points={{14,-20},{28,-20},{28,-17.35},{45.9,-17.35}},        color = {127, 0, 0}, thickness = 0.5));
      connect(frequency.y, respiratoryMusclePressureCycle.frequence) annotation (
        Line(points = {{-3, 18}, {18, 18}}, color = {0, 0, 127}));
      connect(respiratoryMusclePressureCycle.val, lungs.externalPressure) annotation (
        Line(points={{38,18},{53,18},{53,-9}},        color = {0, 0, 127}));
      connect(environment.y, flowMeasure.q_in) annotation (
        Line(points = {{-56, -20}, {-40, -20}}, color = {127, 0, 0}, thickness = 0.5));
      connect(flowMeasure.q_out, resistor.q_in) annotation (
        Line(points = {{-20, -20}, {-6, -20}}, color = {127, 0, 0}, thickness = 0.5));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})),
        Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})),
        experiment(StopTime = 16),
        Documentation(info = "<html>
        <p>References:</p>
        <p><br>Mecklenburgh, J. S., and W. W. Mapleson. &quot;Ventilatory assistance and respiratory muscle activity. 1: Interaction in healthy volunteers.&quot; <i>British journal of anaesthesia</i> 80.4 (1998): 422-433.</p>
        </html>"));
    end MinimalRespiration;

    model MeanRespiration "Non-oscilating ventilation model"
      extends Modelica.Icons.Example;
      replaceable package Air = Physiolibrary.Media.Air annotation (
        choicesAllMatching = True);
      parameter Physiolibrary.Types.Frequency RR = 0.286 "Respiration rate";
      parameter Physiolibrary.Types.Volume TV = 0.0005 "Tidal volume";
      parameter Physiolibrary.Types.Volume DV = 0.00015 "Dead space volume";
      parameter Physiolibrary.Types.VolumeFlowRate CO = 9.1666666666667e-05 "Cardiac output";
      parameter Physiolibrary.Types.HydraulicConductance cTotalVentilation = 1.019716212977928e-05 * (1 / 1.5);
      parameter Physiolibrary.Types.Volume alveolarVolume_start = TV - DV + alveolarV0 "initial volume of air in alveoli";
      parameter Physiolibrary.Types.Volume alveolarV0 = 0.0013 "volume of air in alveoli, which does not generate air pressure";
      parameter Physiolibrary.Types.Volume lungCapyVolume_start = 0.00015 "initial volume of blood in alveolar capillaries";
      parameter Physiolibrary.Types.Volume lungCapyV0 = 0.0001 "volume of blood in alveolar capillaries, which does not generate blood pressure";
      parameter Physiolibrary.Types.Volume tissueBloodVolume_start = 0.0003 "initial volume of blood in tissues";
      parameter Physiolibrary.Types.Volume tissueV0 = 0.0002 "volume of blood in tissues, which does not generate blood pressure";
      parameter Types.MolarFlowRate O2_consumption = 1.666666666666667e-05 * (2 * 7.71) "Tissue consumption of O2 by metabolism";
      parameter Types.MolarFlowRate CO2_production = 1.666666666666667e-05 * (2 * 6.17) "Tissue production of CO2 by metabolism";
      parameter Types.HydraulicConductance TotalSystemicConductance = 1.250102626409427e-07 * (1 / 20) "Total systemic blood circulation conductance";
      parameter Integer NA = 1 "Number of pulmonary alveolar units";
      parameter Integer NT = 1 "Number of systemic tissue units";
      Physiolibrary.Fluid.Components.VolumePump deadSpaceVentilation(redeclare
          package
                Medium =                                                                        Air, useSolutionFlowInput = false, SolutionFlow = DV * RR) annotation (
        Placement(transformation(extent = {{-6, 6}, {14, 26}})));
      Physiolibrary.Fluid.Sources.PressureSource pressureSource(redeclare
          package
                Medium =                                                                   Air) annotation (
        Placement(transformation(extent = {{-90, 6}, {-70, 26}})));
      Physiolibrary.Fluid.Sources.VolumeOutflowSource ventilation(useSolutionFlowInput = false, SolutionFlow = TV * RR, redeclare
          package
                Medium =                                                                                                                           Air) annotation (
        Placement(transformation(extent = {{70, 6}, {90, 26}})));
      inner Modelica.Fluid.System system(T_ambient = 310.15) annotation (
        Placement(transformation(extent = {{-44, 46}, {-24, 66}})));
      Components.Conductor alveolarVentilation(redeclare package Medium = Air, Conductance(displayUnit = "l/(cmH2O.s)") = cTotalVentilation) annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {4, -12})));
    equation
      connect(deadSpaceVentilation.q_out, ventilation.q_in) annotation (
        Line(points = {{14, 16}, {70, 16}}, color = {127, 0, 0}, thickness = 0.5));
      connect(pressureSource.y, deadSpaceVentilation.q_in) annotation (
        Line(points = {{-70, 16}, {-6, 16}}, color = {127, 0, 0}, thickness = 0.5));
      for i in 1:NA loop
      end for;
      for i in 1:NT loop
      end for;
      connect(pressureSource.y, alveolarVentilation.q_in) annotation (
        Line(points = {{-70, 16}, {-50, 16}, {-50, -12}, {-6, -12}}, color = {127, 0, 0}, thickness = 0.5));
      connect(alveolarVentilation.q_out, ventilation.q_in) annotation (
        Line(points = {{14, -12}, {52, -12}, {52, 16}, {70, 16}}, color = {127, 0, 0}, thickness = 0.5));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})),
        Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})),
        experiment(StopTime = 1800, __Dymola_Algorithm = "Dassl"));
    end MeanRespiration;

    model SimpleRespiration "Human respiration model"
      extends Modelica.Icons.Example;
      import Modelica.Units.SI.*;
      replaceable package Air = Media.Air;
      //Chemical.Media.SimpleAir_C; //Kitware.Air_IdealGas; //Chemical.Media.SimpleAir_C; //Chemical.Media.Air_MixtureGasNasa;
      replaceable package PleuralFluid = Physiolibrary.Media.Water;

      parameter Types.MolarFlowRate O2_consumption=1.666666666666667e-05*(2*7.71)       "Tissue consumption of O2 by metabolism";
      parameter Types.MolarFlowRate CO2_production=1.666666666666667e-05*(2*6.17)       "Tissue production of CO2 by metabolism";
      parameter Boolean EnthalpyNotUsed = false;
      parameter Pressure IntrathoraxPressure=-700   "Intrathorax pressure relative to ambient pressure";
      parameter Frequency RespirationRate(displayUnit="1/min")=0.2     "Respiration rate";
      parameter Volume ResidualVolume = 0.0013 "Lungs residual volume";
      parameter Volume TotalLungCapacity = 0.00623 "Total Lung Capacity";
      parameter Volume BaseTidalVolume = 0.0005 "Base Tidal Volume";
      parameter Volume LungsAirVolume_initial = 0.00302 "Initial volume of alveolar space";
      parameter Volume PleuralFluidVolume_initial = 0.0001 "Initial volume of pleural fluid volume";
      parameter Volume PleuralCavityVolume_initial = 0.0001 + LungsAirVolume_initial "Initial volume of pleural cavity";
      parameter Volume FunctionalResidualCapacity = 0.00231 "Functional residual capacity";
      parameter Physiolibrary.Types.HydraulicResistance TotalResistance=147099.75   "Total lungs pathways resistance";
      parameter Real BronchiResistanceFraction = 0.3;
      parameter Real AlveoliDuctResistanceFraction = 0.2;
      parameter Real TracheaResistanceFraction = 1 - (BronchiResistanceFraction + AlveoliDuctResistanceFraction) / 2;
      parameter Physiolibrary.Types.HydraulicResistance TracheaResistance = TotalResistance * TracheaResistanceFraction "Left Bronchi Resistance";
      parameter Physiolibrary.Types.HydraulicResistance LeftBronchiResistance = TotalResistance * BronchiResistanceFraction "Left Bronchi Resistance";
      parameter Physiolibrary.Types.HydraulicResistance LeftAlveoliResistance = TotalResistance * AlveoliDuctResistanceFraction "Left Alveoli Resistance";
      parameter Physiolibrary.Types.HydraulicResistance RightBronchiResistance = TotalResistance * BronchiResistanceFraction "Right Bronchi Resistance";
      parameter Physiolibrary.Types.HydraulicResistance RightAlveoliResistance = TotalResistance * AlveoliDuctResistanceFraction "Right Alveoli Resistance";
      parameter Physiolibrary.Types.HydraulicCompliance TotalCompliance=1.0197162129779e-06   "Total lungs compliance";
      parameter Pressure Pmin(displayUnit="Pa")=-700
                                     "Negative pressure gradient caused by respiratory muscles";
      parameter Pressure Pmax(displayUnit="Pa")=0     "Positive presure gradient caused by respiratory muscles";
      parameter Real RespiratoryMusclePressureCycle[:, 3] = {{0, Pmax, 0}, {3 / 8, Pmin, 0}, {1, Pmax, 0}} "Absolute external lungs pressure during respiration cycle scaled to time period (0,1)";
      parameter Temperature CoreTemperature=310.15   "body temperature";
      parameter Temperature EnvironmentTemperature=CoreTemperature "external air temperature"; //298.15
      parameter Mass m_initial = LungsAirVolume_initial * Air.density(Air.setState_pTX(system.p_ambient + Pmax, CoreTemperature, Air.reference_X));
      //  parameter Density d = Air.density(Air.setState_pTX(system.p_ambient+Pmax,CoreTemperature));
      Physiolibrary.Blocks.Source.PeriodicCurveSource respiratoryMusclePressureCycle(data = RespiratoryMusclePressureCycle) "Relative position in respiratory cycle (0,1) to absolute external lungs pressure" annotation (
        Placement(transformation(extent = {{-34, 72}, {-14, 92}})));
      //0.0133,
      inner Modelica.Fluid.System system(T_ambient = CoreTemperature) "Human body system setting" annotation (
        Placement(transformation(extent={{62,66},{82,86}})));
      Physiolibrary.Fluid.Sources.PressureSource environment(redeclare package
          Medium =                                                                      Air, temperature_start = EnvironmentTemperature) "External environment" annotation (
        Placement(transformation(extent = {{-360, 78}, {-340, 98}})));
      Physiolibrary.Types.Constants.FrequencyConst frequency(k = RespirationRate) annotation (
        Placement(transformation(extent = {{-54, 78}, {-46, 86}})));
      Physiolibrary.Fluid.Components.ElasticVessel lungs(
      redeclare package Medium = Air,
      volume_start=LungsAirVolume_initial,
      use_concentration_start=true,
      concentration_start={100,40,47,760 - 187},
      useThermalPort=false,
      ZeroPressureVolume=FunctionalResidualCapacity,
      ResidualVolume=ResidualVolume,
      Compliance=TotalCompliance,
      useExternalPressureInput=true,
      useSigmoidCompliance=true,
      VitalCapacity=TotalLungCapacity - ResidualVolume,
      BaseTidalVolume=BaseTidalVolume,
      useSubstances=true,
      nPorts=2) "Alveolar space" annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-136,-2})));
      Physiolibrary.Fluid.Sensors.PressureMeasure alveolarPressure(redeclare
          package Medium = Air) "Alveolar pressure"
        annotation (Placement(transformation(extent={{-170,-26},{-150,-6}})));
      Physiolibrary.Fluid.Components.Resistor lungsPathways(
        redeclare package Medium = Air,
        EnthalpyNotUsed=false,
        Resistance=TotalResistance)
        annotation (Placement(transformation(extent={{-308,0},{-288,20}})));
      Physiolibrary.Fluid.Sensors.FlowMeasure flowMeasure(redeclare package Medium = Air) annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {-318, 66})));
      Components.ElasticVessel chest(
      redeclare package Medium = PleuralFluid,
      volume_start=PleuralFluidVolume_initial,
      useThermalPort=false,
      ZeroPressureVolume=PleuralCavityVolume_initial,
      Compliance=TotalCompliance,
      useExternalPressureInput=true,
      useSigmoidCompliance=false,
      useSubstances=false,
      useInternalSpaceInput=true,
      InternalSpace(displayUnit="l") = 0.0031,
      nPorts=1) "Pleural space"
      annotation (Placement(transformation(extent={{-46,34},{-66,54}})));
      Sensors.PressureMeasure pleauralPressure(redeclare package Medium =
            PleuralFluid, GetAbsolutePressure=false) "Pleaural pressure"
        annotation (Placement(transformation(
            extent={{10,-10},{-10,10}},
            rotation=0,
            origin={-76,28})));
      Chemical.Sources.ExternalIdealGasSubstance O2(substanceData=
            Physiolibrary.Chemical.Substances.Oxygen_gas(), PartialPressure(
            displayUnit="mmHg") = 5332.8954966)
        annotation (Placement(transformation(extent={{10,-32},{-10,-12}})));
      Chemical.Sources.ExternalIdealGasSubstance CO2(substanceData=
            Physiolibrary.Chemical.Substances.CarbonDioxide_gas(),
          PartialPressure(displayUnit="mmHg") = 7332.731307825)
        annotation (Placement(transformation(extent={{10,0},{-10,20}})));
      Chemical.Components.Diffusion CO2_diffusion(KC=1e-4)
        annotation (Placement(transformation(extent={{-64,0},{-44,20}})));
      Chemical.Components.Diffusion O2_diffusion(KC=1e-4)
        annotation (Placement(transformation(extent={{-62,-32},{-42,-12}})));
    equation
      connect(frequency.y, respiratoryMusclePressureCycle.frequence) annotation (
        Line(points = {{-45, 82}, {-34, 82}}, color = {0, 0, 127}));
      connect(environment.y, flowMeasure.q_in) annotation (
        Line(points = {{-340, 88}, {-318, 88}, {-318, 76}}, color = {127, 0, 0}, thickness = 0.5));
    connect(lungs.fluidVolume, chest.internalSpace) annotation (Line(points={{-146,6},
              {-154,6},{-154,50},{-65,50}},        color={0,0,127}));
    connect(pleauralPressure.pressure, lungs.externalPressure) annotation (
        Line(points={{-82,24},{-82,-26},{-143,-26},{-143,-11}}, color={0,0,
            127}));
    connect(chest.q_in[1],pleauralPressure.port)  annotation (Line(
        points={{-55.9,44},{-38,44},{-38,18},{-76,18}},
        color={127,0,0},
        thickness=0.5));
    connect(respiratoryMusclePressureCycle.val, chest.externalPressure)
      annotation (Line(points={{-14,82},{-8,82},{-8,62},{-63,62},{-63,53}},
          color={0,0,127}));
      connect(flowMeasure.q_out, lungsPathways.q_in) annotation (Line(
          points={{-318,56},{-318,10},{-308,10}},
          color={127,0,0},
          thickness=0.5));
    connect(lungsPathways.q_out, lungs.q_in[1]) annotation (Line(
        points={{-288,10},{-156,10},{-156,-1.35},{-135.9,-1.35}},
        color={127,0,0},
        thickness=0.5));
    connect(alveolarPressure.port, lungs.q_in[2]) annotation (Line(
        points={{-160,-26},{-174,-26},{-174,-2.65},{-135.9,-2.65}},
        color={127,0,0},
        thickness=0.5));
    connect(CO2_diffusion.port_a, lungs.substances[Air.i("CO2")]) annotation (
        Line(points={{-64,10},{-126,10},{-126,0},{-124,0},{-124,-2},{-126,-2}},
          color={158,66,200}));
    connect(O2_diffusion.port_a, lungs.substances[Air.i("O2")]) annotation (Line(
          points={{-62,-22},{-126,-22},{-126,-2}}, color={158,66,200}));
      connect(CO2_diffusion.port_b, CO2.port_a) annotation (Line(points={{-44,10},
            {-10,10}},                color={158,66,200}));
      connect(O2_diffusion.port_b, O2.port_a) annotation (Line(points={{-42,-22},
            {-10,-22}},                  color={158,66,200}));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio = false)),
        Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-360, -100}, {100, 100}}),
          graphics={Text(
            extent={{-134,50},{-98,46}},
            textColor={0,0,0},
            textString="lungsVolume"), Text(
            extent={{-134,-26},{-86,-32}},
            textColor={0,0,0},
            textString="intrathoraxPressure")}),
        experiment(StopTime = 60, Tolerance = 1e-05, __Dymola_Algorithm = "Dassl"),
        Documentation(info = "<html>
<p>References:</p>
<p><br>Mecklenburgh, J. S., and W. W. Mapleson. &quot;Ventilatory assistance and respiratory muscle activity. 1: Interaction in healthy volunteers.&quot; <i>British journal of anaesthesia</i> 80.4 (1998): 422-433.</p>
</html>"));
    end SimpleRespiration;

    model AirWaterSaturation "Human respiration model"
      extends Modelica.Icons.Example;
      import Modelica.Units.SI.*;
      replaceable package Air = Media.Air;
      parameter Physiolibrary.Types.HydraulicResistance TotalResistance = 147099.75 "Total lungs pathways resistance";
      parameter Real BronchiResistanceFraction = 0.3;
      parameter Real AlveoliDuctResistanceFraction = 0.2;
      parameter Real TracheaResistanceFraction = 1 - (BronchiResistanceFraction + AlveoliDuctResistanceFraction) / 2;
      parameter Physiolibrary.Types.HydraulicResistance TracheaResistance = TotalResistance * TracheaResistanceFraction "Left Bronchi Resistance";
      parameter Physiolibrary.Types.HydraulicCompliance TotalCompliance(displayUnit = "l/cmH2O") = 1.0197162129779e-06 "Total lungs compliance";
      Chemical.Components.GasSolubility evaporation(KC=1e-7)
      annotation (Placement(transformation(extent={{-362,-48},{-342,-28}})));
      parameter Temperature CoreTemperature = 310.15 "body temperature";
      parameter Temperature EnvironmentTemperature = 298.15 "external air temperature";

      inner Modelica.Fluid.System system(T_ambient = CoreTemperature) "Human body system setting" annotation (
        Placement(transformation(extent = {{60, 66}, {80, 86}})));

      Physiolibrary.Fluid.Sources.PressureSource environment(redeclare package
                Medium =                                                                Air, temperature_start = EnvironmentTemperature) "External environment" annotation (
        Placement(transformation(extent = {{-360, 78}, {-340, 98}})));
      Physiolibrary.Fluid.Sensors.FlowMeasure flowMeasure(redeclare package
        Medium =                                                                     Air) annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {-318, 66})));
      Physiolibrary.Fluid.Components.ElasticVessel upperRespiratoryTract(redeclare
          package
                Medium =                                                                            Air, useSubstances = true,
        volume_start=0.0001,                                                                                                                          massFractions_start = Air.reference_X[1:Air.nS - 1], useThermalPort = true, Compliance = TotalCompliance / 100, ZeroPressureVolume(displayUnit = "ml") = 0.0001,                                      ResidualVolume(displayUnit = "ml") = 0.0001, nPorts = 3) annotation (
        Placement(transformation(extent = {{-328, -10}, {-308, 10}})));
      Physiolibrary.Fluid.Components.Resistor upperRespiratoryTractResistance(redeclare
          package
                Medium =                                                                                 Air,  Resistance = 0.5 * TracheaResistance) annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin={-318,34})));
      Chemical.Sources.PureSubstance water(redeclare package stateOfMatter =
          Chemical.Interfaces.Incompressible,                                                                    substanceData = Chemical.Substances.Water_liquid()) annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 180, origin = {-314, -68})));
      Physiolibrary.Fluid.Sensors.PartialPressure pH2O_upperRespiratory(redeclare
          package
                stateOfMatter =
          Chemical.Interfaces.IdealGas,                                                                                                 substanceData = Chemical.Substances.Water_gas(), redeclare
          package
                Medium =                                                                                                                                                                                            Air) annotation (
        Placement(transformation(extent = {{-364, 34}, {-344, 14}})));
      Physiolibrary.Fluid.Sensors.Temperature Temperature_upperRespiratory(redeclare
          package
                Medium =                                                                              Air) annotation (
        Placement(transformation(extent = {{-298, 30}, {-278, 50}})));
      Physiolibrary.Fluid.Sensors.Temperature Temperature_mouth(redeclare
          package
                Medium =                                                                   Air) annotation (
        Placement(transformation(extent = {{-296, 72}, {-276, 92}})));
      Physiolibrary.Thermal.Components.Conductor cooling(Conductance(
          displayUnit="W/K") = 10)
      annotation (Placement(transformation(extent={{-302,-44},{-322,-24}})));
      Physiolibrary.Thermal.Sources.UnlimitedHeat coreHeat(T = system.T_ambient) annotation (
        Placement(transformation(extent = {{-274, -44}, {-294, -24}})));
    equation
      connect(environment.y, flowMeasure.q_in) annotation (
        Line(points = {{-340, 88}, {-318, 88}, {-318, 76}}, color = {127, 0, 0}, thickness = 0.5));
      connect(flowMeasure.q_out, upperRespiratoryTractResistance.q_out) annotation (
        Line(points={{-318,56},{-318,44}},      color = {127, 0, 0}, thickness = 0.5));
      connect(upperRespiratoryTractResistance.q_in, upperRespiratoryTract.q_in[1]) annotation (
        Line(points={{-318,24},{-318,-0.866667},{-318.1,-0.866667}},    color = {127, 0, 0}, thickness = 0.5));
    connect(water.port_a, evaporation.liquid_port) annotation (Line(points={{
            -324,-68},{-352,-68},{-352,-48}}, color={158,66,200}));
      connect(pH2O_upperRespiratory.port, upperRespiratoryTract.q_in[2])
        annotation (Line(
          points={{-354,34},{-354,48},{-330,48},{-330,14},{-318.1,14},{-318.1,
              1.11022e-16}},
          color={127,0,0},
          thickness=0.5));
    connect(cooling.q_out, upperRespiratoryTract.heatPort) annotation (Line(
        points={{-322,-34},{-324,-34},{-324,-10}},
        color={191,0,0},
        thickness=0.5));
    connect(coreHeat.port, cooling.q_in) annotation (Line(
        points={{-294,-34},{-302,-34}},
        color={191,0,0},
        thickness=0.5));
      connect(flowMeasure.q_in, Temperature_mouth.port) annotation (
        Line(points = {{-318, 76}, {-318, 82}, {-298, 82}, {-298, 72}, {-286, 72}}, color = {127, 0, 0}, thickness = 0.5));
      connect(upperRespiratoryTract.q_in[3], Temperature_upperRespiratory.port) annotation (
        Line(points={{-318.1,0.866667},{-318.1,10},{-318,10},{-318,8},{-288,8},{-288,
              30}},                                                                                     color = {127, 0, 0}, thickness = 0.5));
      connect(pH2O_upperRespiratory.port_a, upperRespiratoryTract.substances[Air.i("H2O")]) annotation (
        Line(points = {{-344, 24}, {-334, 24}, {-334, 0}, {-328, 0}}, color = {158, 66, 200}));
    connect(evaporation.gas_port, upperRespiratoryTract.substances[Air.i("H2O")])
      annotation (Line(points={{-352,-28},{-352,0},{-328,0}}, color={158,66,
            200}));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio = false)),
        Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-360, -100}, {100, 100}})),
        experiment(StopTime = 200, __Dymola_Algorithm = "Dassl"),
        Documentation(info = "<html>
<p>References:</p>
<p><br>Mecklenburgh, J. S., and W. W. Mapleson. &quot;Ventilatory assistance and respiratory muscle activity. 1: Interaction in healthy volunteers.&quot; <i>British journal of anaesthesia</i> 80.4 (1998): 422-433.</p>
</html>"));
    end AirWaterSaturation;

    package BloodGasesTransport "Transport of O2 and CO2 through respiration and circulation in human body"

      model BloodyMary
        replaceable package Blood =
          Physiolibrary.Media.Blood                                             annotation (
          choicesAllMatching = True);
        replaceable package Air = Physiolibrary.Media.Air annotation (
          choicesAllMatching = True);
        parameter Physiolibrary.Types.Frequency RR=0.286   "Respiration rate";
        parameter Physiolibrary.Types.Volume TV=0.0005   "Tidal volume";
        parameter Physiolibrary.Types.Volume DV=0.00015   "Dead space volume";
        parameter Physiolibrary.Types.VolumeFlowRate CO=9.1666666666667e-05   "Cardiac output";
        parameter Physiolibrary.Types.HydraulicConductance cShunt=1.250102626409427e-07
            *(1/3*0.02);
        parameter Physiolibrary.Types.HydraulicConductance cTotalVentilation=1.019716212977928e-05
            *(1/1.5);
        parameter Physiolibrary.Types.HydraulicConductance cTotalCirculation=1.250102626409427e-07
            *(1/3*(1 - 0.02));
        parameter Physiolibrary.Types.HydraulicCompliance LungsCompliance=6.0004926067653e-07 "Lungs compliance";
        parameter Physiolibrary.Types.Volume ResidualVolume=0.0013 "Lungs residual volume";
        parameter Physiolibrary.Types.Volume TotalCapacity=0.00623 "Lungs total capacity";
        parameter Physiolibrary.Types.Volume BaseTidalVolume=0.0005 "Lungs base tidal volume";
        parameter Physiolibrary.Types.Volume alveolarVolume_start = TV - DV + alveolarV0 "initial volume of air in alveoli";
        parameter Physiolibrary.Types.Volume alveolarV0=0.0013   "volume of air in alveoli, which does not generate air pressure";
        parameter Physiolibrary.Types.Volume lungCapyVolume_start=0.00015   "initial volume of blood in alveolar capillaries";
        parameter Physiolibrary.Types.Volume lungCapyV0=0.0001   "volume of blood in alveolar capillaries, which does not generate blood pressure";
        parameter Physiolibrary.Types.Volume tissueBloodVolume_start=0.0003   "initial volume of blood in tissues";
        parameter Physiolibrary.Types.Volume tissueV0=0.0002   "volume of blood in tissues, which does not generate blood pressure";
        parameter Physiolibrary.Types.HydraulicCompliance CapillariesCompliance=3.0002463033826e-08
                                                                                       "Systemic capillaries compliance";
        parameter Types.MolarFlowRate O2_consumption=1.666666666666667e-05*(2*7.71)       "Tissue consumption of O2 by metabolism";
        parameter Types.MolarFlowRate CO2_production=1.666666666666667e-05*(2*6.17)       "Tissue production of CO2 by metabolism";
        parameter Types.HydraulicConductance TotalSystemicConductance=1.250102626409427e-07
            *(1/20)                                                                                      "Total systemic blood circulation conductance";
        parameter Integer NA=1  "Number of pulmonary alveolar units";
        parameter Integer NT=1  "Number of systemic tissue units";
      public
        parameter Real ArterialBloodComposition[Blood.nS - 2] = Blood.ArterialDefault "Initial composition of arterial blood";
        parameter Real VenousBloodComposition[Blood.nS - 2] = Blood.VenousDefault "Initial composition of venous blood";
        parameter Types.Fraction AirO2=0.21   "O2 content in inspired air";
        parameter Types.Fraction AirCO2=0.0003   "CO2 content in inspired air";
        parameter Types.Fraction AirH2O=0.06   "H2O content in inspired air";
        parameter Types.Fraction AirN2 = 1 - AirO2 - AirCO2 - AirH2O "N2 content in inspired air";
        Types.Pressure Air_pO2 = AirO2 * system.p_ambient "O2 content in inspired air";
        Types.Pressure Air_pCO2 = AirCO2 * system.p_ambient "CO2 content in inspired air";
        Physiolibrary.Fluid.Components.VolumePump deadSpaceVentilation(redeclare
            package Medium =                                                                      Air, useSolutionFlowInput = true, SolutionFlow = DV * RR,
          density(start=1.1300953420756321, displayUnit="g/cm3"),
          q_in(m_flow(start=5.759563136974551E-05)),
          q_out(p(start=101335.86111397855, displayUnit="bar")))                                                                                            annotation (
          Placement(transformation(extent = {{-14, -52}, {6, -32}})));
        Physiolibrary.Fluid.Sources.PressureSource pressureSource(pressure_start(displayUnit = "Pa"), redeclare
            package Medium =                                                                                                     Air, use_concentration_start = true, concentration_start = {AirO2, AirCO2, AirH2O, AirN2}) annotation (
          Placement(transformation(extent = {{-96, -52}, {-76, -32}})));
        Physiolibrary.Fluid.Sources.VolumeOutflowSource volumeOutflow(useSolutionFlowInput = true, SolutionFlow = TV * RR, redeclare
            package Medium =                                                                                                                          Air,
          density(start=1.1300953420756321))                                                                                                               annotation (
          Placement(transformation(extent = {{64, -52}, {84, -32}})));
        Physiolibrary.Fluid.Components.VolumePump leftHeartPump(redeclare
            package
            Medium =                                                                       Blood, useSolutionFlowInput = true, SolutionFlow(displayUnit = "l/min") = 8.3333333333333e-05) annotation (
          Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {42, -150})));
        Physiolibrary.Fluid.Components.VolumePump rightHeartPump(redeclare
            package
            Medium =                                                                        Blood, useSolutionFlowInput = true, SolutionFlow(displayUnit = "l/min") = 8.3333333333333e-05) annotation (
          Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {-50, -150})));
        Physiolibrary.Fluid.Components.ElasticVessel pulmonaryArteries(redeclare
            package Medium =                                                                      Blood, use_concentration_start = true, concentration_start = VenousBloodComposition, volume_start(displayUnit = "l") = 0.00038, Compliance(displayUnit = "ml/mmHg") = 3.6002955640592e-08, ZeroPressureVolume(displayUnit = "l") = 0.0003, nPorts = 4) annotation (
          Placement(transformation(extent = {{-60, -112}, {-40, -92}})));
        Physiolibrary.Fluid.Components.ElasticVessel pulmonaryVeins(redeclare
            package
            Medium =                                                                           Blood, use_concentration_start = true, concentration_start = ArterialBloodComposition, volume_start(displayUnit = "l") = 0.0004, Compliance(displayUnit = "ml/mmHg") = 7.5006157584566e-08, ZeroPressureVolume(displayUnit = "l") = 0.0004, nPorts = 4) annotation (
          Placement(transformation(extent = {{32, -112}, {52, -92}})));
        Physiolibrary.Fluid.Components.ElasticVessel systemicArteries(redeclare
            package Medium = Blood,
            use_concentration_start = true,
            concentration_start = ArterialBloodComposition,
            useSubstances = true,
            volume_start(displayUnit = "l") = 0.00085,
            Compliance(displayUnit = "ml/mmHg") = 2.6627185942521e-08,
            ZeroPressureVolume(displayUnit = "l") = 0.00045,
            nPorts = NT+1,
          chemicalSolution(bloodGases(
              cHCO3(start=24.51879571586536, displayUnit="mmol/l"),
              pCO(start=1.0005449962821231E-05, displayUnit="bar"),
              pCO2(start=5345.09227220704, displayUnit="bar"),
              pO2(start=11608.744631309959, displayUnit="bar"),
              sO2CO(start=0.9627613894820818, displayUnit="%"))))                                                                                                                                                                                                         annotation (
          Placement(transformation(extent = {{46, -206}, {26, -186}})));
        Physiolibrary.Fluid.Components.ElasticVessel systemicVeins(redeclare
            package
            Medium = Blood,
            use_concentration_start = true,
            concentration_start = VenousBloodComposition,
            useSubstances = true, volume_start(displayUnit = "l") = 0.00325,
            Compliance(displayUnit = "ml/mmHg") = 6.1880080007267e-07,
            ZeroPressureVolume(displayUnit = "l") = 0.00295,
            nPorts = NT+2,
          chemicalSolution(bloodGases(
              cHCO3(start=26.674314102391666, displayUnit="mmol/l"),
              pCO(start=6.3972838566901375E-06, displayUnit="bar"),
              pCO2(start=6930.575174544387, displayUnit="bar"),
              pO2(start=5006.216473490174, displayUnit="bar"),
              sCO(start=1.808984022893137E-07, displayUnit="%"),
              sO2CO(start=0.649370212847236, displayUnit="%"))))                                                                                                                                                                                                         annotation (
          Placement(transformation(extent = {{-60, -206}, {-40, -186}})));
        Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasureVeins(redeclare
            package Medium =                                                                        Blood) annotation (
          Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 0, origin = {-80, -204})));
        Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasurePulmArteries(redeclare
            package Medium =                                                                               Blood) annotation (
          Placement(transformation(extent = {{-60, -108}, {-80, -88}})));
        Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasurePulmVeins(redeclare
            package Medium =                                                                            Blood) annotation (
          Placement(transformation(extent = {{52, -108}, {72, -88}})));
        Types.Constants.VolumeFlowRateConst leftCardiacOutput(k = CO) annotation (
          Placement(transformation(extent = {{-4, -4}, {4, 4}}, rotation = 180, origin = {76, -150})));
        Modelica.Blocks.Math.MultiProduct multiProduct1(nu = 2) annotation (
          Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 0, origin = {-70, -150})));
        Physiolibrary.Types.Constants.HydraulicConductanceConst hydraulicConductance1(k = 1.250102626409427e-07 * (5 / 4)) annotation (
          Placement(transformation(extent = {{-4, -4}, {4, 4}}, rotation = 270, origin = {-80, -132})));
        Physiolibrary.Fluid.Components.Conductor pulmonaryShunt(redeclare
            package
            Medium =                                                                       Blood, Conductance(displayUnit = "l/(cmH2O.s)") = cShunt) annotation (
          Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {-4, -104})));
      Organs.Lungs.Components.RespiratoryUnit            respiratoryUnit
                                                                     [NA](
        redeclare package Blood = Blood,
        redeclare package Air = Air,
          AirVolume_initial=ones(NA)*(alveolarVolume_start/NA),
          FunctionalResidualCapacity=ones(NA)*(alveolarV0/NA),
          TotalCompliance=ones(NA)*(LungsCompliance/NA),
          ResidualVolume=ones(NA)*(ResidualVolume/NA),
          TotalCapacity=ones(NA)*(TotalCapacity/NA),
          BaseTidalVolume=ones(NA)*(BaseTidalVolume/NA),
          TotalResistance=ones(NA)*(NA/cTotalVentilation),
          CapillariesVolume_initial=ones(NA)*(lungCapyVolume_start/NA),
          Blood_initial=fill(ArterialBloodComposition, NA),
          CapillariesZeroPressureVolume=ones(NA)*(lungCapyV0/NA),
          CapillariesCompliance=fill(CapillariesCompliance/NA, NA),
          CapillariesConductance=ones(NA)*((cTotalCirculation)/(NA*1/8)),
          ArteriesConductance=ones(NA)*((cTotalCirculation)/(NA*7/8)),
                                     each nPorts=2,
          pulmCapysVentilated(chemicalSolution(bloodGases(
                cHCO3(start=fill(24.518795715865362,NA), each displayUnit="mmol/l"),
                pCO(start=fill(1.0005449962821248E-05,NA), each  displayUnit="bar"),
                pCO2(start=fill(5345.092272207041,NA), each  displayUnit="bar"),
                pO2(start=fill(11608.74463130998,NA), each  displayUnit="bar"),
                sO2CO(start=fill(0.962761389482082,NA), each  displayUnit="%")))))                                            annotation (
          Placement(transformation(rotation=0, extent={{-22,-96},{10,-64}})));
        Sensors.BloodGasesMeasurement arterial(redeclare package Medium = Blood) annotation (
          Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 270, origin = {54, -176})));
        TissueUnit tissueUnit[NT](
          O2_consumption = fill(O2_consumption / NT, NT),
          CO2_production = fill(CO2_production / NT, NT),
          Conductance = fill(TotalSystemicConductance / NT, NT),
          bloodVolume_start = fill(tissueBloodVolume_start / NT, NT),
          bloodV0 = fill(tissueV0 / NT, NT),
          BloodComposition = fill(VenousBloodComposition, NT),
          Compliance=fill(CapillariesCompliance/NT, NT),       redeclare
            package
            Blood =          Blood,
          systemicCapillaries(chemicalSolution(bloodGases(
                cHCO3(start=fill(26.674314102391666,NT), each displayUnit="mmol/l"),
                pCO(start=fill(6.39728383892192E-06,NT), each displayUnit="bar"),
                pCO2(start=fill(6930.57517454441,NT), each displayUnit="bar"),
                pO2(start=fill(5006.216473490139,NT), each displayUnit="bar"),
                sCO(start=fill(1.8089840228933077E-07,NT), each displayUnit="%"),
                sO2CO(start=fill(0.6493702128472361,NT), each displayUnit="%")))))
           annotation (
          Placement(transformation(extent = {{-14, -202}, {12, -188}})));
          //,
        /*  systemicCapillaries(chemicalSolution(bloodGases(
          cHCO3(start={26.674314102391666}, each displayUnit="mmol/l"),
          pCO(start={6.39728383892192E-06}, each displayUnit="mmHg"),
          pCO2(start={6930.57517454441}, each displayUnit="mmHg"),
          pO2(start={5006.216473490139}, each displayUnit="mmHg"),
          sCO(start={1.8089840228933077E-07}, each displayUnit="%"),
          sO2CO(start={0.6493702128472361}, each displayUnit="%"))))*/
        RespiratoryCenter respiratoryCenter(DV = DV) annotation (
          Placement(transformation(extent = {{40, 2}, {20, 22}})));
        inner Modelica.Fluid.System system(T_ambient = 310.15) annotation (
          Placement(transformation(extent = {{-66, -2}, {-46, 18}})));
        Sensors.BloodGasesMeasurement venous(redeclare package Medium = Blood) annotation (
          Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {-66, -176})));
        Types.Constants.PressureConst pressure(k(displayUnit="mmHg") = -533.28954966)
          annotation (Placement(transformation(extent={{-42,-58},{-34,-50}})));
      equation
        connect(deadSpaceVentilation.q_out, volumeOutflow.q_in) annotation (
          Line(points = {{6, -42}, {64, -42}}, color = {127, 0, 0}, thickness = 0.5));
        connect(pressureSource.y, deadSpaceVentilation.q_in) annotation (
          Line(points = {{-76, -42}, {-14, -42}}, color = {127, 0, 0}, thickness = 0.5));
        connect(rightHeartPump.q_out, pulmonaryArteries.q_in[1]) annotation (
          Line(points={{-50,-140},{-50,-116},{-50.1,-116},{-50.1,-102.975}},         color = {127, 0, 0}, thickness = 0.5));
        connect(leftHeartPump.q_in, pulmonaryVeins.q_in[1]) annotation (
          Line(points={{42,-140},{42,-100},{41.9,-100},{41.9,-102.975}},         color = {127, 0, 0}, thickness = 0.5));
        connect(pressureMeasureVeins.port, systemicVeins.q_in[1]) annotation (
          Line(points={{-80,-214},{-50,-214},{-50,-196},{-50.1,-196}},                  color = {127, 0, 0}, thickness = 0.5));
        connect(pressureMeasurePulmArteries.port, pulmonaryArteries.q_in[2]) annotation (
          Line(points={{-70,-108},{-50,-108},{-50,-102.325},{-50.1,-102.325}},        color = {127, 0, 0}, thickness = 0.5));
        connect(pulmonaryVeins.q_in[2],pressureMeasurePulmVeins.port)  annotation (
          Line(points={{41.9,-102.325},{42,-102.325},{42,-108},{62,-108}},        color = {127, 0, 0}, thickness = 0.5));
        connect(multiProduct1.y, rightHeartPump.solutionFlow) annotation (
          Line(points = {{-62.98, -150}, {-57, -150}}, color = {0, 0, 127}));
        connect(hydraulicConductance1.y, multiProduct1.u[1]) annotation (
          Line(points={{-80,-137},{-80,-148},{-76,-148},{-76,-151.05}},         color = {0, 0, 127}));
        connect(pressureMeasureVeins.pressure, multiProduct1.u[2]) annotation (
          Line(points={{-86,-208},{-94,-208},{-94,-148.95},{-76,-148.95}},        color = {0, 0, 127}));
        connect(pulmonaryShunt.q_in, pulmonaryArteries.q_in[3]) annotation (
          Line(points={{-14,-104},{-50.1,-104},{-50.1,-101.675}},       color = {127, 0, 0}, thickness = 0.5));
        connect(pulmonaryShunt.q_out, pulmonaryVeins.q_in[3]) annotation (
          Line(points={{6,-104},{41.9,-104},{41.9,-101.675}},       color = {127, 0, 0}, thickness = 0.5));
        for i in 1:NA loop
          connect(respiratoryUnit[i].blood_in, pulmonaryArteries.q_in[4]) annotation (
              Line(
              points={{-22,-87.04},{-30,-87.04},{-30,-100},{-50.1,-100},{-50.1,-101.025}},
              color={127,0,0},
              thickness=0.5));
          connect(respiratoryUnit[i].airways[1], pressureSource.y) annotation (Line(
              points={{-6,-64.84},{-64,-64.84},{-64,-42},{-76,-42}},
              color={127,0,0},
              thickness=0.5));
          connect(respiratoryUnit[i].airways[2], volumeOutflow.q_in) annotation (Line(
              points={{-6,-63.48},{34,-63.48},{34,-42},{64,-42}},
              color={127,0,0},
              thickness=0.5));
          connect(respiratoryUnit[i].blood_out, pulmonaryVeins.q_in[4]) annotation (Line(
              points={{10.32,-86.4},{22,-86.4},{22,-98},{42,-98},{42,-101.025},{41.9,-101.025}},
              color={127,0,0},
              thickness=0.5));
          connect(pressure.y, respiratoryUnit[i].thoraxPressure) annotation (Line(
              points={{-33,-54},{-12.56,-54},{-12.56,-67.68}}, color={0,0,127}));
        end for;
        connect(leftHeartPump.solutionFlow, leftCardiacOutput.y) annotation (
          Line(points = {{49, -150}, {71, -150}}, color = {0, 0, 127}));
        for i in 1:NT loop
          connect(tissueUnit[i].q_in, systemicArteries.q_in[i+1]) annotation (
            Line(points={{13.6611,-195.21},{28,-195.21},{28,-196},{36.1,-196},{
                  36.1,-196}},                                                                           color = {127, 0, 0}, thickness = 0.5));
          connect(tissueUnit[i].q_out, systemicVeins.q_in[i+2]) annotation (
            Line(points={{-15.2278,-194.93},{-50.1,-194.93},{-50.1,-196}},        color = {127, 0, 0}, thickness = 0.5));
        end for;
        connect(respiratoryCenter.deadSpaceVentilation, deadSpaceVentilation.solutionFlow) annotation (
          Line(points = {{24, 1.2}, {24, -14}, {-4, -14}, {-4, -35}}, color = {0, 0, 127}));
        connect(respiratoryCenter.ventilation, volumeOutflow.solutionFlow) annotation (
          Line(points = {{29.6, 1.3}, {29.6, -14}, {74, -14}, {74, -35}}, color = {0, 0, 127}));
        connect(arterial.pO2, respiratoryCenter.pO2) annotation (
          Line(points = {{58, -165}, {58, -158}, {88, -158}, {88, 3}, {40.6, 3}}, color = {0, 0, 127}));
        connect(arterial.pCO2, respiratoryCenter.pCO2) annotation (
          Line(points = {{54, -165}, {54, -160}, {90, -160}, {90, 11}, {40.4, 11}}, color = {0, 0, 127}));
        connect(arterial.b_port, leftHeartPump.q_out) annotation (
          Line(points = {{43.8, -169.8}, {42, -169.8}, {42, -160}}, color = {127, 0, 0}, thickness = 0.5));
        connect(arterial.a_port, systemicArteries.q_in[1]) annotation (
          Line(points={{43.8,-182},{40,-182},{40,-196},{36.1,-196}},              color = {127, 0, 0}, thickness = 0.5));
        connect(systemicVeins.q_in[2], venous.a_port) annotation (
          Line(points={{-50.1,-196},{-50.1,-188},{-55.8,-188},{-55.8,-182}},              color = {127, 0, 0}, thickness = 0.5));
        connect(venous.b_port, rightHeartPump.q_in) annotation (
          Line(points = {{-55.8, -169.8}, {-55.8, -164.9}, {-50, -164.9}, {-50, -160}}, color = {127, 0, 0}, thickness = 0.5));
        connect(systemicVeins.substances[Blood.i("O2")], venous.O2) annotation (
          Line(points = {{-60, -196}, {-72, -196}, {-72, -186}}, color = {158, 66, 200}));
        connect(venous.CO2, systemicVeins.substances[Blood.i("CO2")]) annotation (
          Line(points = {{-66, -186}, {-66, -196}, {-60, -196}}, color = {158, 66, 200}));
        connect(venous.H_plus, systemicVeins.substances[Blood.i("H+")]) annotation (
          Line(points = {{-60, -186}, {-60, -196}}, color = {158, 66, 200}));
        connect(arterial.H_plus, systemicArteries.substances[Blood.i("H+")]) annotation (
          Line(points = {{48, -186}, {48, -196}, {46, -196}}, color = {158, 66, 200}));
        connect(arterial.CO2, systemicArteries.substances[Blood.i("CO2")]) annotation (
          Line(points = {{54, -186}, {54, -196}, {46, -196}}, color = {158, 66, 200}));
        connect(arterial.O2, systemicArteries.substances[Blood.i("O2")]) annotation (
          Line(points = {{60, -186}, {60, -196}, {46, -196}}, color = {158, 66, 200}));

        annotation (
          Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -220}, {100, 40}})),
          Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -220}, {100, 40}})),
          experiment(StopTime = 1800, __Dymola_Algorithm = "Dassl"));
      end BloodyMary;

      model TissueUnit
        extends Physiolibrary.Icons.SystemicCirculation;
        parameter Types.MolarFlowRate O2_consumption = 1.666666666666667e-05 * (2 * 7.71) "Tissue consumption of O2 by metabolism";
        parameter Types.MolarFlowRate CO2_production = 1.666666666666667e-05 * (2 * 6.17) "Tissue production of CO2 by metabolism";
        parameter Types.HydraulicConductance Conductance = 1.250102626409427e-07 * (1 / 20) "Tissue blood flow conductance";
        parameter Types.Fraction ArteriesViensResistanceRatio = 7 / 8 "Ratio between arteries and veins resistance";
        parameter Types.Volume bloodVolume_start = 0.0003;
        parameter Types.Volume bloodV0 = 0.0002;
        parameter Real BloodComposition[Blood.nS - 2] = Blood.VenousDefault; //{0.44, 8.16865, 21.2679, 1.512e-6, 8.4, 0.042, 0.042, 0.66, 28, 0.153, 5.4, 37.67} "Initial composition of blood in tissue";
        parameter Types.HydraulicCompliance Compliance = 3.0002463033826e-08 "Compliance of tissue blood vessels";
        Components.Resistor systemicArteriesResistance(redeclare package
          Medium =                                                                Blood, Resistance = 1 / Conductance * ArteriesViensResistanceRatio) annotation (
          Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 180, origin = {28, 40})));
        Components.Resistor systemicVeinsResistance(redeclare package Medium = Blood, Resistance = 1 / Conductance * (1 - ArteriesViensResistanceRatio)) annotation (
          Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 180, origin = {-64, 0})));
        Components.ElasticVessel systemicCapillaries(
             redeclare package Medium = Blood,
             use_concentration_start = true,
             concentration_start = BloodComposition,
             useSubstances = true,
             volume_start(displayUnit = "l") = bloodVolume_start,
             Compliance(displayUnit = "ml/mmHg") = Compliance,
             ZeroPressureVolume(displayUnit = "l") = bloodV0,
             nPorts = 2) annotation (
          Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 0, origin = {-2, -14})));
        Chemical.Sources.SubstanceOutflow O2_left(SubstanceFlow(displayUnit = "mmol/min") = O2_consumption) annotation (
          Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 180, origin = {-70, -38})));
        Chemical.Sources.SubstanceInflowT CO2_left(SubstanceFlow(displayUnit = "mmol/min") = CO2_production, redeclare
            package
                  stateOfMatter =
            Chemical.Interfaces.IdealGas,                                                                                                                                    substanceData = Chemical.Substances.CarbonDioxide_gas()) annotation (
          Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 180, origin = {70, -38})));
        Sensors.BloodGasesMeasurement tissue annotation (
          Placement(transformation(extent = {{10, 10}, {-10, -10}}, rotation = 180, origin = {38, -8})));
        replaceable package Blood = Media.Blood                   annotation (
          choicesAllMatching = True);
        Interfaces.FluidPort_a q_in(redeclare package Medium = Blood) annotation (
          Placement(transformation(rotation = 0, extent = {{83, -5}, {96, 6}}), iconTransformation(extent = {{95, -7}, {108, 4}})));
        Interfaces.FluidPort_b q_out(redeclare package Medium = Blood) annotation (
          Placement(transformation(rotation = 0, extent = {{-97, -5}, {-84, 6}}), iconTransformation(extent = {{-105, -5}, {-92, 6}})));
        Types.RealIO.PressureOutput pressure annotation (
          Placement(transformation(extent = {{56, -36}, {76, -16}}), iconTransformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {80, -64})));
        Types.RealIO.PressureOutput pO2 annotation (
          Placement(transformation(extent = {{56, 4}, {76, 24}}), iconTransformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {-40, -64})));
        Types.RealIO.PressureOutput pCO2 annotation (
          Placement(transformation(extent = {{56, -8}, {76, 12}}), iconTransformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {0, -64})));
        Types.RealIO.pHOutput pH annotation (
          Placement(transformation(extent = {{56, -22}, {76, -2}}), iconTransformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {40, -64})));
        Types.RealIO.FractionOutput sO2 "Oxygen saturation (amount of oxygen per amount of hemoglobin units)" annotation (
          Placement(transformation(extent = {{56, 16}, {76, 36}}), iconTransformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {-80, -64})));
      equation
        connect(q_in, systemicArteriesResistance.q_in) annotation (
          Line(points = {{89.5, 0.5}, {80, 0.5}, {80, 40}, {38, 40}}, color = {127, 0, 0}));
        connect(q_out, systemicVeinsResistance.q_out) annotation (
          Line(points = {{-90.5, 0.5}, {-74, 7.77156e-16}}, color = {127, 0, 0}));
        connect(tissue.pressure, pressure) annotation (
          Line(points = {{49, -16}, {49, -26}, {66, -26}}, color = {0, 0, 127}));
        connect(tissue.pO2, pO2) annotation (
          Line(points = {{49, -4}, {52, -4}, {52, 14}, {66, 14}}, color = {0, 0, 127}));
        connect(tissue.pCO2, pCO2) annotation (
          Line(points = {{49, -8}, {54, -8}, {54, 2}, {66, 2}}, color = {0, 0, 127}));
        connect(tissue.pH, pH) annotation (
          Line(points = {{49, -12}, {52, -12}, {52, -12}, {66, -12}}, color = {0, 0, 127}));
        connect(systemicArteriesResistance.q_out, systemicCapillaries.q_in[1]) annotation (
          Line(points={{18,40},{-2,40},{-2,-12},{-1.9,-12},{-1.9,-14.65}},           color = {127, 0, 0}, thickness = 0.5));
        connect(systemicCapillaries.q_in[2], tissue.a_port) annotation (
          Line(points={{-1.9,-13.35},{-2,-13.35},{-2,-28},{32,-28},{32,-18.2}},          color = {127, 0, 0}, thickness = 0.5));
        connect(tissue.b_port, systemicVeinsResistance.q_in) annotation (
          Line(points = {{44.2, -18.2}, {44.2, -32}, {-48, -32}, {-48, -1.66533e-15}, {-54, -1.66533e-15}}, color = {127, 0, 0}, thickness = 0.5));
        connect(tissue.sO2, sO2) annotation (
          Line(points = {{49, -3.55271e-15}, {50, -3.55271e-15}, {50, 26}, {66, 26}}, color = {0, 0, 127}));
        connect(tissue.O2, systemicCapillaries.substances[Blood.i("O2")]) annotation (
          Line(points = {{28, -2}, {14, -2}, {14, -14}, {8, -14}}, color = {158, 66, 200}));
        connect(tissue.CO2, systemicCapillaries.substances[Blood.i("CO2")]) annotation (
          Line(points = {{28, -8}, {14, -8}, {14, -14}, {8, -14}}, color = {158, 66, 200}));
        connect(tissue.H_plus, systemicCapillaries.substances[Blood.i("H+")]) annotation (
          Line(points = {{28, -14}, {8, -14}}, color = {158, 66, 200}));
        connect(O2_left.port_a, systemicCapillaries.substances[Blood.i("O2")]) annotation (
          Line(points = {{-60, -38}, {14, -38}, {14, -14}, {8, -14}}, color = {158, 66, 200}));
        connect(systemicCapillaries.substances[Blood.i("CO2")], CO2_left.port_b) annotation (
          Line(points = {{8, -14}, {14, -14}, {14, -38}, {60, -38}}, color = {158, 66, 200}));
        annotation (
          Diagram(coordinateSystem(extent = {{-90, -50}, {90, 50}})),
          Icon(coordinateSystem(extent = {{-90, -50}, {90, 50}})));
      end TissueUnit;

      model RespiratoryCenter
        extends Physiolibrary.Icons.RespiratoryCenter;
        Modelica.Blocks.Math.Add add annotation (
          Placement(transformation(extent = {{-7, -7}, {7, 7}}, rotation = 90, origin = {-59, 15})));
        Physiolibrary.Types.Constants.PressureConst pressure(k(displayUnit = "kPa") = -pCO2_ZeroVentilation) annotation (
          Placement(transformation(extent = {{-4, -4}, {4, 4}}, rotation = 90, origin = {-56, -10})));
        Physiolibrary.Types.Constants.HydraulicConductanceConst hydraulicConductance2(k(displayUnit = "ml/(kPa.min)") = 2.5e-07) annotation (
          Placement(transformation(extent = {{-4, -4}, {4, 4}}, rotation = 90, origin = {-68, -48})));
        Modelica.Blocks.Math.Product product3 annotation (
          Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {-52, 40})));
        Modelica.Blocks.Math.Max totalVentilation annotation (
          Placement(transformation(extent = {{-7, -7}, {7, 7}}, rotation = 90, origin = {-67, 69})));
        Modelica.Blocks.Sources.Constant const(k = 0) annotation (
          Placement(transformation(extent = {{-4, -4}, {4, 4}}, rotation = 90, origin = {-72, 52})));
        Modelica.Blocks.Math.Add add1(k2 = +1) annotation (
          Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 90, origin = {52, -2})));
        Physiolibrary.Types.Constants.VolumeConst deadspace_c(k(displayUnit = "l") = 0.00035) annotation (
          Placement(transformation(extent = {{-4, -4}, {4, 4}}, rotation = 90, origin = {70, -38})));
        Modelica.Blocks.Math.Division respirationRate annotation (
          Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 90, origin = {50, 42})));
        Modelica.Blocks.Math.Product RR_multiply annotation (
          Placement(transformation(extent = {{-7, -7}, {7, 7}}, rotation = 180, origin = {39, 63})));
        Physiolibrary.Types.Constants.VolumeConst base_deadspace_volume(k = DV) annotation (
          Placement(transformation(extent = {{-4, -4}, {4, 4}}, rotation = 180, origin = {70, 64})));
        Physiolibrary.Types.Constants.VolumeConst volume(k(displayUnit = "l") = 0.0023) annotation (
          Placement(transformation(extent = {{-4, -4}, {4, 4}}, rotation = 90, origin = {68, -2})));
        Modelica.Blocks.Math.Min tidalVolume annotation (
          Placement(transformation(extent = {{-5, -5}, {5, 5}}, rotation = 90, origin = {55, 21})));
        Modelica.Blocks.Math.Division slope annotation (
          Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 90, origin = {-30, 0})));
        Modelica.Blocks.Math.Max max1 annotation (
          Placement(transformation(extent = {{-5, -5}, {5, 5}}, rotation = 90, origin = {-27, -29})));
        Modelica.Blocks.Math.Add add2(k2 = -1) annotation (
          Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 90, origin = {-40, -58})));
        Modelica.Blocks.Sources.Constant const2(k = 5000 - 4300) annotation (
          Placement(transformation(extent = {{-5, -5}, {5, 5}}, rotation = 90, origin = {-23, -63})));
        Modelica.Blocks.Math.Product product4 annotation (
          Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 90, origin = {36, -38})));
        Modelica.Blocks.Sources.Constant const3(k = 4300) annotation (
          Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 90, origin = {-36, -88})));
        Modelica.Blocks.Math.Gain W(k = 90 * (101325 / 760) - 4.3 * 1000) annotation (
          Placement(transformation(extent = {{-5, -5}, {5, 5}}, rotation = 90, origin = {-59, -31})));
        Physiolibrary.Types.Constants.FrequencyConst m(k = 0.505) annotation (
          Placement(transformation(extent = {{-4, -4}, {4, 4}}, rotation = 180, origin = {70, -70})));
        parameter Physiolibrary.Types.Pressure pCO2_ZeroVentilation(displayUnit = "kPa") = 4800 "Long term adaptation for pCO2 during acidosis/alcalosis";
        parameter Physiolibrary.Types.Volume DV = 0.00015 "Deadspace volume";
        Modelica.Blocks.Interfaces.RealOutput deadSpaceVentilation annotation (
          Placement(transformation(rotation = 0, extent = {{98, 21.5}, {118, 46.5}}), iconTransformation(extent = {{-10, -12.5}, {10, 12.5}}, rotation = 270, origin = {60, -108})));
        Modelica.Blocks.Interfaces.RealInput pCO2 "Arterial pCO2" annotation (
          Placement(transformation(rotation = 0, extent = {{-96, -20.5}, {-76, 4.5}}), iconTransformation(extent = {{-10, -12.5}, {10, 12.5}}, rotation = 0, origin = {-104, -10})));
        Modelica.Blocks.Interfaces.RealInput pO2 "Arterial pO2" annotation (
          Placement(transformation(rotation = 0, extent = {{-82, -96.5}, {-62, -71.5}}), iconTransformation(extent = {{-10, -12.5}, {10, 12.5}}, rotation = 0, origin = {-106, -90})));
        Modelica.Blocks.Interfaces.RealOutput ventilation annotation (
          Placement(transformation(rotation = 0, extent = {{-26, 76.5}, {-6, 101.5}}), iconTransformation(extent = {{-10, -12.5}, {10, 12.5}}, rotation = 270, origin = {4, -107})));
      equation
        connect(const.y, totalVentilation.u1) annotation (
          Line(points = {{-72, 56.4}, {-71.2, 60.6}}, color = {0, 0, 127}));
        connect(pressure.y, add.u2) annotation (
          Line(points = {{-56, -5}, {-46, -5}, {-46, 6.6}, {-54.8, 6.6}}, color = {0, 0, 127}));
        connect(add.y, product3.u1) annotation (
          Line(points = {{-59, 22.7}, {-72, 22.7}, {-72, 28}, {-58, 28}}, color = {0, 0, 127}));
        connect(totalVentilation.u2, product3.y) annotation (
          Line(points = {{-62.8, 60.6}, {-52, 60.6}, {-52, 51}}, color = {0, 0, 127}));
        connect(deadspace_c.y, add1.u2) annotation (
          Line(points = {{70, -33}, {70, -26}, {55.6, -26}, {55.6, -9.2}}, color = {0, 0, 127}));
        connect(base_deadspace_volume.y, RR_multiply.u2) annotation (
          Line(points = {{65, 64}, {65, 67.2}, {47.4, 67.2}}, color = {0, 0, 127}));
        connect(respirationRate.y, RR_multiply.u1) annotation (
          Line(points = {{50, 48.6}, {62, 48.6}, {62, 56}, {54, 56}, {54, 58.8}, {47.4, 58.8}}, color = {0, 0, 127}));
        connect(tidalVolume.u1, add1.y) annotation (
          Line(points = {{52, 15}, {52, 4.6}}, color = {0, 0, 127}));
        connect(tidalVolume.y, respirationRate.u2) annotation (
          Line(points = {{55, 26.5}, {53.6, 26.5}, {53.6, 34.8}}, color = {0, 0, 127}));
        connect(volume.y, tidalVolume.u2) annotation (
          Line(points = {{68, 3}, {68, 15}, {58, 15}}, color = {0, 0, 127}));
        connect(totalVentilation.y, respirationRate.u1) annotation (
          Line(points = {{-67, 76.7}, {-67, 78}, {24, 78}, {24, 30}, {46.4, 30}, {46.4, 34.8}}, color = {0, 0, 127}));
        connect(const2.y, max1.u2) annotation (
          Line(points = {{-23, -57.5}, {-26, -57.5}, {-26, -42}, {-24, -42}, {-24, -35}}, color = {0, 0, 127}));
        connect(add2.y, max1.u1) annotation (
          Line(points = {{-40, -51.4}, {-30, -51.4}, {-30, -35}}, color = {0, 0, 127}));
        connect(max1.y, slope.u2) annotation (
          Line(points = {{-27, -23.5}, {-26, -23.5}, {-26, -7.2}, {-26.4, -7.2}}, color = {0, 0, 127}));
        connect(product4.u1, totalVentilation.y) annotation (
          Line(points = {{32.4, -45.2}, {32.4, -52}, {24, -52}, {24, 78}, {-67, 78}, {-67, 76.7}}, color = {0, 0, 127}));
        connect(const3.y, add2.u2) annotation (
          Line(points = {{-36, -81.4}, {-32, -81.4}, {-32, -78}, {-36, -78}, {-36, -65.2}, {-36.4, -65.2}}, color = {0, 0, 127}));
        connect(product4.y, add1.u1) annotation (
          Line(points = {{36, -31.4}, {36, -9.2}, {48.4, -9.2}}, color = {0, 0, 127}));
        connect(slope.y, product3.u2) annotation (
          Line(points = {{-30, 6.6}, {-30, 18}, {-46, 18}, {-46, 28}}, color = {0, 0, 127}));
        connect(hydraulicConductance2.y, W.u) annotation (
          Line(points = {{-68, -43}, {-68, -37}, {-59, -37}}, color = {0, 0, 127}));
        connect(W.y, slope.u1) annotation (
          Line(points = {{-59, -25.5}, {-59, -18}, {-33.6, -18}, {-33.6, -7.2}}, color = {0, 0, 127}));
        connect(m.y, product4.u2) annotation (
          Line(points = {{65, -70}, {48, -70}, {48, -64}, {39.6, -64}, {39.6, -45.2}}, color = {0, 0, 127}));
        connect(deadSpaceVentilation, RR_multiply.y) annotation (
          Line(points = {{108, 34}, {90, 34}, {90, 90}, {26, 90}, {26, 63}, {31.3, 63}}, color = {0, 0, 127}));
        connect(pCO2, add.u1) annotation (
          Line(points = {{-86, -8}, {-63.2, -8}, {-63.2, 6.6}}, color = {0, 0, 127}));
        connect(pO2, add2.u1) annotation (
          Line(points = {{-72, -84}, {-52, -84}, {-52, -65.2}, {-43.6, -65.2}}, color = {0, 0, 127}));
        connect(ventilation, totalVentilation.y) annotation (
          Line(points = {{-16, 89}, {-67, 89}, {-67, 76.7}}, color = {0, 0, 127}));
        annotation (
          Diagram(graphics={  Text(extent = {{6, -76}, {34, -84}}, textColor = {28, 108, 200}, textString = "Calculation of slope")}));
      end RespiratoryCenter;
    end BloodGasesTransport;

    model Respiration "Human respiration model"
      extends Modelica.Icons.Example;
      import Physiolibrary.Types.*;
      replaceable package Air = Media.Air;
      //Chemical.Media.SimpleAir_C; //Kitware.Air_IdealGas; //Chemical.Media.SimpleAir_C; //Chemical.Media.Air_MixtureGasNasa;
      replaceable package PleuralFluid = Physiolibrary.Media.Water;

      parameter Pressure IntrathoraxPressure=-700;
      parameter Frequency RespirationRate(displayUnit="1/min")=0.2     "Respiration rate";
      parameter Volume ResidualVolume=0.0013   "Lungs residual volume";
      parameter Volume TotalLungCapacity=0.00623   "Total Lung Capacity";
      parameter Volume BaseTidalVolume=0.0005   "Base Tidal Volume";
      parameter Volume LungsAirVolume_initial=0.0031   "Initial volume of alveolar space";
      parameter Volume pleuralVolume_initial=0.0001   "Initial volume of pleural fluid";
      parameter Volume FunctionalResidualCapacity=0.00231   "Functional residual capacity";
      parameter Physiolibrary.Types.HydraulicResistance TotalResistance(
        displayUnit="(cmH2O.s)/l")=147099.75                                        "Total lungs pathways resistance";
      parameter Real BronchiResistanceFraction = 0.3;
      parameter Real AlveoliDuctResistanceFraction = 0.2;
      parameter Real TracheaResistanceFraction = 1 - (BronchiResistanceFraction + AlveoliDuctResistanceFraction) / 2;
      parameter Physiolibrary.Types.HydraulicResistance TracheaResistance = TotalResistance * TracheaResistanceFraction "Left Bronchi Resistance";
      parameter Physiolibrary.Types.HydraulicResistance LeftBronchiResistance = TotalResistance * BronchiResistanceFraction "Left Bronchi Resistance";
      parameter Physiolibrary.Types.HydraulicResistance LeftAlveoliResistance = TotalResistance * AlveoliDuctResistanceFraction "Left Alveoli Resistance";
      parameter Physiolibrary.Types.HydraulicResistance RightBronchiResistance = TotalResistance * BronchiResistanceFraction "Right Bronchi Resistance";
      parameter Physiolibrary.Types.HydraulicResistance RightAlveoliResistance = TotalResistance * AlveoliDuctResistanceFraction "Right Alveoli Resistance";
      parameter Physiolibrary.Types.HydraulicCompliance TotalCompliance=
        1.0197162129779e-06                                                                   "Total lungs compliance";
      parameter Pressure Pmin=-250   "Relative external lungs pressure minimum caused by respiratory muscles";
      parameter Pressure Pmax(displayUnit="mmHg")=0     "Relative external lungs pressure maximum";
      parameter Real RespiratoryMusclePressureCycle[:, 3] = {{0, Pmax, 0}, {3 / 8, Pmin, 0}, {1, Pmax, 0}} "Absolute external lungs pressure during respiration cycle scaled to time period (0,1)";
      parameter Temperature CoreTemperature=310.15   "body temperature";
      parameter Temperature EnvironmentTemperature=298.15   "external air temperature";
      parameter Mass m_initial = LungsAirVolume_initial * Air.density(Air.setState_pTX(system.p_ambient + Pmax, CoreTemperature, Air.reference_X));
      //  parameter Density d = Air.density(Air.setState_pTX(system.p_ambient+Pmax,CoreTemperature));

      parameter Volume RelaxedLungsCavitySpace = LungsAirVolume_initial+pleuralVolume_initial;

      parameter Fraction LeftLungsSizeFraction=0.5;
      parameter Fraction RightLungsSizeFraction=1-LeftLungsSizeFraction;

      parameter Fraction LeftPleuralSizeFraction=0.5;
      parameter Fraction RightPleuralSizeFraction=1-LeftPleuralSizeFraction;

      Physiolibrary.Blocks.Source.PeriodicCurveSource respiratoryMusclePressureCycle(data = RespiratoryMusclePressureCycle) "Relative position in respiratory cycle (0,1) to absolute external lungs pressure" annotation (
        Placement(transformation(extent = {{-34, 72}, {-14, 92}})));
      Physiolibrary.Fluid.Components.ElasticVessel leftAlveoli(redeclare
          package Medium =                                                                Air,
        volume_start=LungsAirVolume_initial*LeftLungsSizeFraction,                                                                    use_concentration_start = true, concentration_start = {100, 40, 47, 760 - 187}, useThermalPort = true,
        ZeroPressureVolume=FunctionalResidualCapacity*LeftLungsSizeFraction,
        ResidualVolume=ResidualVolume*LeftLungsSizeFraction,
        Compliance=TotalCompliance*LeftLungsSizeFraction,                                                                                                                                                                                                        useExternalPressureInput = true, useSigmoidCompliance = true,
        VitalCapacity=(TotalLungCapacity - ResidualVolume)*LeftLungsSizeFraction,
        BaseTidalVolume=BaseTidalVolume*LeftLungsSizeFraction,                                                                                                                                                                                                        useSubstances = true,  nPorts = 2,
        q_in(m_flow(start={0.0,0.028225848485321114}), p(start={101344.01141127005,101344.0078125},
              each displayUnit="bar")))                                                                                                                                                                                                         "Left alveolar space" annotation (
        Placement(transformation(extent = {{-162, 16}, {-142, 36}})));
      //0.0133,
      Physiolibrary.Fluid.Sensors.PressureMeasure leftPleauralPressure(redeclare
          package Medium =
          PleuralFluid, GetAbsolutePressure=false)                                                                                          "Left Pleaural pressure" annotation (
        Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 0, origin = {-70, 64})));
      inner Modelica.Fluid.System system(T_ambient = CoreTemperature) "Human body system setting" annotation (
        Placement(transformation(extent = {{60, 66}, {80, 86}})));
      Physiolibrary.Fluid.Sources.PressureSource environment(redeclare package
          Medium =                                                                      Air, temperature_start = EnvironmentTemperature,
        y(m_flow(start=0.09561940275276484)))                                                                                            "External environment" annotation (
        Placement(transformation(extent = {{-360, 78}, {-340, 98}})));
      Physiolibrary.Fluid.Components.Resistor leftBronchi(redeclare package
          Medium =                                                                   Air,  Resistance = LeftBronchiResistance,
        q_in(p(start=103156.07860174825, displayUnit="bar")),
        q_out(p(start=102073.43154792248, displayUnit="bar")))                                                                                                   annotation (
        Placement(transformation(extent={{-252,22},{-232,42}})));
      Physiolibrary.Types.Constants.FrequencyConst frequency(k = RespirationRate) annotation (
        Placement(transformation(extent = {{-54, 78}, {-46, 86}})));
      Chemical.Sources.SubstanceOutflow O2_left(SubstanceFlow(displayUnit = "mmol/min") = 0.0001285) annotation (
        Placement(transformation(extent={{-164,-14},{-144,6}})));
      Chemical.Sources.SubstanceInflowT CO2_left(SubstanceFlow(displayUnit = "mmol/min") = 0.00010283333333333, redeclare
          package stateOfMatter =
          Chemical.Interfaces.IdealGas,                                                                                                                                         substanceData = Chemical.Substances.CarbonDioxide_gas()) annotation (
        Placement(transformation(extent={{-200,-14},{-180,6}})));
      Physiolibrary.Fluid.Sensors.PressureMeasure leftAlveolarPressure(redeclare
          package Medium =                                                                        Air) "Left Alveolar pressure" annotation (
        Placement(transformation(extent = {{-124, 22}, {-104, 42}})));
      Physiolibrary.Fluid.Components.Resistor rightBronchi(redeclare package
          Medium =                                                                    Air,  Resistance = RightBronchiResistance,
        q_in(m_flow(start=0.028225848485321524)),
        q_out(p(start=102073.43154792248, displayUnit="bar")))                                                                                                     annotation (
        Placement(transformation(extent = {{-252, -54}, {-232, -34}})));
      Physiolibrary.Fluid.Components.ElasticVessel rightAlveoli(redeclare
          package Medium =                                                                 Air,
        volume_start=LungsAirVolume_initial*RightLungsSizeFraction,                                                                    use_concentration_start = true, concentration_start = {100, 40, 47, 760 - 187}, useThermalPort = true,
        ZeroPressureVolume=FunctionalResidualCapacity*RightLungsSizeFraction,
        ResidualVolume=ResidualVolume*RightLungsSizeFraction,
        Compliance=TotalCompliance*RightLungsSizeFraction,                                                                                                                                                                                                        useExternalPressureInput = true, useSigmoidCompliance = true,
        VitalCapacity=(TotalLungCapacity - ResidualVolume)*RightLungsSizeFraction,
        BaseTidalVolume=BaseTidalVolume*RightLungsSizeFraction,                                                                                                                                                                                                        useSubstances = true, nPorts = 6,
        q_in(p(start={101344.01141127005,101344.0078125,101344.0078125,101344.0078125,
                101344.0078125,101344.0078125}, each displayUnit="bar")))                                                                                                                                                                                                         "Right alveolar space" annotation (
        Placement(transformation(extent = {{-156, -58}, {-136, -38}})));
      Chemical.Sources.SubstanceInflowT CO2_right(SubstanceFlow(displayUnit = "mmol/min") = 0.00010283333333333, redeclare
          package stateOfMatter =
          Chemical.Interfaces.IdealGas,                                                                                                                                          substanceData = Chemical.Substances.CarbonDioxide_gas()) annotation (
        Placement(transformation(extent = {{-220, -96}, {-200, -76}})));
      Chemical.Sources.SubstanceOutflow O2_right(SubstanceFlow(displayUnit = "mmol/min") = 0.0001285) annotation (
        Placement(transformation(extent = {{-158, -96}, {-138, -76}})));
      Physiolibrary.Fluid.Components.ElasticVessel leftPleuralSpace(redeclare
          package Medium =
          PleuralFluid,
        volume_start=pleuralVolume_initial*LeftPleuralSizeFraction,                                                                                useThermalPort = false,
        ZeroPressureVolume=RelaxedLungsCavitySpace*LeftLungsSizeFraction,
        Compliance=TotalCompliance*LeftPleuralSizeFraction,                                                                                                                                                                                          useExternalPressureInput = true, useSigmoidCompliance = false, useSubstances = false,
        useInternalSpaceInput=true,
        InternalSpace=RelaxedLungsCavitySpace*LeftLungsSizeFraction,                                                                                                                                                                                                        nPorts = 1)
      "Left Pleural space"                                                                                                                                                                                                         annotation (
        Placement(transformation(extent={{-56,18},{-76,38}})));
      Physiolibrary.Fluid.Sensors.PressureMeasure rightPleauralPressure(redeclare
          package Medium =
          PleuralFluid, GetAbsolutePressure=false)                                                                                           "Right pleaural pressure" annotation (
        Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 0, origin = {-70, -12})));
      Physiolibrary.Fluid.Components.ElasticVessel rightPleuralSpace(redeclare
          package Medium =
          PleuralFluid,
      volume_start=pleuralVolume_initial*RightPleuralSizeFraction,
      ZeroPressureVolume=RelaxedLungsCavitySpace*RightLungsSizeFraction,
      Compliance=TotalCompliance*RightPleuralSizeFraction,                                                                                                                                                                    useExternalPressureInput = true, useSigmoidCompliance = false, useSubstances = false,
      useInternalSpaceInput=true,
      InternalSpace=RelaxedLungsCavitySpace*RightLungsSizeFraction,                                                                                                                                                                                                        nPorts = 1) "Right Plearal space" annotation (
        Placement(transformation(extent={{-56,-58},{-76,-38}})));
      Physiolibrary.Fluid.Sensors.PressureMeasure rightAlveolarPressure(redeclare
          package Medium =                                                                         Air) "Right Alveolar pressure" annotation (
        Placement(transformation(extent = {{-134, -38}, {-114, -18}})));
      Physiolibrary.Fluid.Components.Resistor trachea(redeclare package Medium = Air,  Resistance = 0.5 * TracheaResistance,
        q_in(m_flow(start=0.056451696970642506), p(start=105795.1786534674,
              displayUnit="bar")))                                                                                                                             annotation (
        Placement(transformation(extent={{-298,-12},{-278,8}})));
      Physiolibrary.Fluid.Components.Resistor leftAlveolarDuct(redeclare
          package Medium =                                                                Air,  Resistance = LeftAlveoliResistance) annotation (
        Placement(transformation(extent={{-210,22},{-190,42}})));
      Physiolibrary.Fluid.Sensors.FlowMeasure flowMeasure(redeclare package
          Medium =                                                                   Air) annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {-318, 66})));
      Physiolibrary.Fluid.Components.Resistor rightAlveolarDuct(redeclare
          package Medium =                                                                 Air,  Resistance = RightAlveoliResistance) annotation (
        Placement(transformation(extent = {{-212, -54}, {-192, -34}})));
      Physiolibrary.Fluid.Components.ElasticVessel upperRespiratoryTract(redeclare
          package Medium =                                                                          Air, use_concentration_start = true, useSubstances = true,
        volume_start=9.98e-05,                                                                                                                                                          concentration_start = {100, 40, 47, 760 - 187}, useThermalPort = true, Compliance = TotalCompliance / 100, ZeroPressureVolume(displayUnit = "ml") = 0.0001,
        ResidualVolume(displayUnit="ml"),
        InternalSpace=5e-05,                                                                                                                                                                                                        nPorts = 4) annotation (
        Placement(transformation(extent = {{-328, -10}, {-308, 10}})));
      Physiolibrary.Fluid.Components.Resistor upperRespiratoryTractResistance(redeclare
          package Medium =                                                                               Air,  Resistance = 0.5 * TracheaResistance) annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin={-318,30})));
      Chemical.Sources.PureSubstance water(redeclare package stateOfMatter =
          Chemical.Interfaces.Incompressible,                                                                    substanceData = Chemical.Substances.Water_liquid()) annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 180, origin = {-314, -68})));
      Chemical.Components.GasSolubility gasSolubility1(KC = 1e-5) annotation (
        Placement(transformation(extent = {{-362, -48}, {-342, -28}})));
      Physiolibrary.Fluid.Sensors.PartialPressure pCO2(redeclare package
          stateOfMatter =
          Chemical.Interfaces.IdealGas,                                                                                substanceData = Chemical.Substances.CarbonDioxide_gas(), redeclare
          package Medium =                                                                                                                                                                                 Air) annotation (
        Placement(transformation(extent = {{-218, -62}, {-198, -82}})));
      Physiolibrary.Fluid.Sensors.PartialPressure pO2(redeclare package
          stateOfMatter =
          Chemical.Interfaces.IdealGas,                                                                               substanceData = Chemical.Substances.Oxygen_gas(), redeclare
          package Medium =                                                                                                                                                                         Air) annotation (
        Placement(transformation(extent = {{-138, -64}, {-158, -84}})));
      Physiolibrary.Fluid.Sensors.Temperature Temperature_alveolar(redeclare
          package Medium =                                                                    Air) annotation (
        Placement(transformation(extent = {{-110, -40}, {-90, -20}})));
      Physiolibrary.Fluid.Sensors.PartialPressure pH2O_alveolar(redeclare
          package stateOfMatter =
          Chemical.Interfaces.IdealGas,                                                                                         substanceData = Chemical.Substances.Water_gas(), redeclare
          package Medium =                                                                                                                                                                                  Air) annotation (
        Placement(transformation(extent = {{-122, -66}, {-102, -86}})));
      Physiolibrary.Fluid.Sensors.PartialPressure pH2O_upperRespiratory(redeclare
          package stateOfMatter =
          Chemical.Interfaces.IdealGas,                                                                                                 substanceData = Chemical.Substances.Water_gas(), redeclare
          package Medium =                                                                                                                                                                                          Air) annotation (
        Placement(transformation(extent = {{-364, 34}, {-344, 14}})));
      Physiolibrary.Fluid.Sensors.Temperature Temperature_upperRespiratory(redeclare
          package Medium =                                                                            Air) annotation (
        Placement(transformation(extent = {{-298, 30}, {-278, 50}})));
      Physiolibrary.Fluid.Sensors.Temperature Temperature_mouth(redeclare
          package Medium =                                                                 Air) annotation (
        Placement(transformation(extent = {{-296, 72}, {-276, 92}})));
      Physiolibrary.Thermal.Components.Conductor conductor(Conductance(displayUnit = "W/K") = 10) annotation (
        Placement(transformation(extent = {{-302, -44}, {-322, -24}})));
      Physiolibrary.Thermal.Sources.UnlimitedHeat coreHeat(T = system.T_ambient) annotation (
        Placement(transformation(extent = {{-274, -44}, {-294, -24}})));
      Physiolibrary.Thermal.Components.Conductor conductor1(Conductance(displayUnit = "W/K") = 10) annotation (
        Placement(transformation(extent = {{-210, 6}, {-230, 26}})));
      Physiolibrary.Thermal.Components.Conductor conductor2(Conductance(displayUnit = "W/K") = 10) annotation (
        Placement(transformation(extent = {{-208, -40}, {-228, -20}})));
    equation
      connect(frequency.y, respiratoryMusclePressureCycle.frequence) annotation (
        Line(points = {{-45, 82}, {-34, 82}}, color = {0, 0, 127}));
      connect(leftAlveolarPressure.port, leftAlveoli.q_in[1]) annotation (
        Line(points={{-114,22},{-152,22},{-152,24},{-152.1,24},{-152.1,25.35}},           color = {127, 0, 0}, thickness = 0.5));
      connect(leftPleuralSpace.q_in[1],leftPleauralPressure.port)  annotation (
        Line(points={{-65.9,28},{-65.9,48},{-70,48},{-70,54}},          color = {127, 0, 0}, thickness = 0.5));
      connect(rightPleuralSpace.q_in[1],rightPleauralPressure.port)  annotation (
        Line(points={{-65.9,-48},{-65.9,-28},{-70,-28},{-70,-22}},          color = {127, 0, 0}, thickness = 0.5));
      connect(rightAlveoli.q_in[1],rightAlveolarPressure.port)  annotation (
        Line(points={{-146.1,-49.0833},{-148,-49.0833},{-148,-60},{-124,-60},{
              -124,-38}},                                                                            color = {127, 0, 0}, thickness = 0.5));
      connect(leftBronchi.q_out, leftAlveolarDuct.q_in) annotation (
        Line(points={{-232,32},{-228,32},{-228,30},{-222,30},{-222,32},{-210,
            32}},                               color = {127, 0, 0}, thickness = 0.5));
      connect(leftAlveolarDuct.q_out, leftAlveoli.q_in[2]) annotation (
        Line(points={{-190,32},{-152,32},{-152,30},{-152.1,30},{-152.1,26.65}},           color = {127, 0, 0}, thickness = 0.5));
      connect(trachea.q_out, leftBronchi.q_in) annotation (
        Line(points={{-278,-2},{-268,-2},{-268,32},{-252,32}},        color = {127, 0, 0}, thickness = 0.5));
      connect(trachea.q_out, rightBronchi.q_in) annotation (
        Line(points={{-278,-2},{-268,-2},{-268,-44},{-252,-44}},        color = {127, 0, 0}, thickness = 0.5));
      connect(environment.y, flowMeasure.q_in) annotation (
        Line(points = {{-340, 88}, {-318, 88}, {-318, 76}}, color = {127, 0, 0}, thickness = 0.5));
      connect(rightBronchi.q_out, rightAlveolarDuct.q_in) annotation (
        Line(points = {{-232, -44}, {-212, -44}}, color = {127, 0, 0}, thickness = 0.5));
      connect(rightAlveolarDuct.q_out, rightAlveoli.q_in[2]) annotation (
        Line(points={{-192,-44},{-146,-44},{-146,-48.65},{-146.1,-48.65}},        color = {127, 0, 0}, thickness = 0.5));
      connect(upperRespiratoryTract.q_in[1], trachea.q_in) annotation (
        Line(points={{-318.1,-0.975},{-318.1,-6},{-318,-6},{-318,-2},{-298,-2}},                     color = {127, 0, 0}, thickness = 0.5));
      connect(flowMeasure.q_out, upperRespiratoryTractResistance.q_out) annotation (
        Line(points={{-318,56},{-318,40}},      color = {127, 0, 0}, thickness = 0.5));
      connect(upperRespiratoryTractResistance.q_in, upperRespiratoryTract.q_in[2]) annotation (
        Line(points={{-318,20},{-318,-0.325},{-318.1,-0.325}},    color = {127, 0, 0}, thickness = 0.5));
      connect(water.port_a, gasSolubility1.liquid_port) annotation (
        Line(points = {{-324, -68}, {-352, -68}, {-352, -48}}, color = {158, 66, 200}));
      connect(pCO2.port_a, CO2_right.port_b) annotation (
        Line(points = {{-198, -72}, {-190, -72}, {-190, -86}, {-200, -86}}, color = {158, 66, 200}));
      connect(pCO2.port, rightAlveoli.q_in[3]) annotation (Line(
          points={{-208,-62},{-184,-62},{-184,-44},{-148,-44},{-148,-49.3},{
              -146.1,-49.3},{-146.1,-48.2167}},
          color={127,0,0},
          thickness=0.5));
      connect(pO2.port_a, O2_right.port_a) annotation (
        Line(points = {{-158, -74}, {-166, -74}, {-166, -86}, {-158, -86}}, color = {158, 66, 200}));
      connect(pO2.port, rightAlveoli.q_in[4]) annotation (Line(
          points={{-148,-64},{-148,-44},{-146.1,-44},{-146.1,-47.7833}},
          color={127,0,0},
          thickness=0.5));
      connect(pH2O_alveolar.port, rightAlveoli.q_in[5]) annotation (Line(
          points={{-112,-66},{-112,-50},{-146,-50},{-146,-44},{-146.1,-44},{
              -146.1,-47.35}},
          color={127,0,0},
          thickness=0.5));
      connect(pH2O_upperRespiratory.port, upperRespiratoryTract.q_in[3])
        annotation (Line(
          points={{-354,34},{-354,48},{-330,48},{-330,14},{-318.1,14},{-318.1,
              0.325}},
          color={127,0,0},
          thickness=0.5));
      connect(conductor.q_out, upperRespiratoryTract.heatPort) annotation (
        Line(points={{-322,-34},{-324,-34},{-324,-10}},          color = {191, 0, 0}, thickness = 0.5));
      connect(conductor1.q_out, coreHeat.port) annotation (
        Line(points = {{-230, 16}, {-238, 16}, {-238, -16}, {-298, -16}, {-298, -34}, {-294, -34}}, color = {191, 0, 0}, thickness = 0.5));
      connect(coreHeat.port, conductor.q_in) annotation (
        Line(points = {{-294, -34}, {-302, -34}}, color = {191, 0, 0}, thickness = 0.5));
      connect(conductor2.q_out, coreHeat.port) annotation (
        Line(points = {{-228, -30}, {-238, -30}, {-238, -16}, {-298, -16}, {-298, -34}, {-294, -34}}, color = {191, 0, 0}, thickness = 0.5));
      connect(conductor1.q_in, leftAlveoli.heatPort) annotation (
        Line(points={{-210,16},{-158,16}},        color = {191, 0, 0}, thickness = 0.5));
      connect(conductor2.q_in, rightAlveoli.heatPort) annotation (
        Line(points={{-208,-30},{-168,-30},{-168,-58},{-152,-58}},              color = {191, 0, 0}, thickness = 0.5));
      connect(flowMeasure.q_in, Temperature_mouth.port) annotation (
        Line(points = {{-318, 76}, {-318, 82}, {-298, 82}, {-298, 72}, {-286, 72}}, color = {127, 0, 0}, thickness = 0.5));
      connect(upperRespiratoryTract.q_in[4], Temperature_upperRespiratory.port) annotation (
        Line(points={{-318.1,0.975},{-318.1,10},{-318,10},{-318,8},{-288,8},{
            -288,30}},                                                                               color = {127, 0, 0}, thickness = 0.5));
      connect(rightAlveoli.q_in[6], Temperature_alveolar.port) annotation (
        Line(points={{-146.1,-46.9167},{-100,-46.9167},{-100,-40}},        color = {127, 0, 0}, thickness = 0.5));
      connect(upperRespiratoryTract.substances[Air.i("H2O")], pH2O_upperRespiratory.port_a) annotation (
        Line(points = {{-328, 0}, {-334, 0}, {-334, 24}, {-344, 24}}, color = {158, 66, 200}));
      connect(gasSolubility1.gas_port, upperRespiratoryTract.substances[Air.i("H2O")]) annotation (
        Line(points = {{-352, -28}, {-352, 0}, {-328, 0}}, color = {158, 66, 200}));
      connect(CO2_left.port_b, leftAlveoli.substances[Air.i("CO2")]) annotation (
        Line(points={{-180,-4},{-170,-4},{-170,26},{-162,26}},          color = {158, 66, 200}));
      connect(O2_left.port_a, leftAlveoli.substances[Air.i("O2")]) annotation (
        Line(points={{-164,-4},{-170,-4},{-170,26},{-162,26}},          color = {158, 66, 200}));
      connect(CO2_right.port_b, rightAlveoli.substances[Air.i("CO2")]) annotation (
        Line(points = {{-200, -86}, {-172, -86}, {-172, -48}, {-156, -48}}, color = {158, 66, 200}));
      connect(rightAlveoli.substances[Air.i("O2")], O2_right.port_a) annotation (
        Line(points = {{-156, -48}, {-172, -48}, {-172, -86}, {-158, -86}}, color = {158, 66, 200}));
      connect(rightAlveoli.substances[Air.i("H2O")], pH2O_alveolar.port_a) annotation (
        Line(points = {{-156, -48}, {-102, -48}, {-102, -76}}, color = {158, 66, 200}));
    connect(leftPleuralSpace.externalPressure, respiratoryMusclePressureCycle.val)
      annotation (Line(points={{-73,37},{-73,48},{-2,48},{-2,82},{-14,82}},
          color={0,0,127}));
    connect(rightPleuralSpace.externalPressure,
      respiratoryMusclePressureCycle.val) annotation (Line(points={{-73,-39},
            {-73,-28},{-2,-28},{-2,82},{-14,82}}, color={0,0,127}));
      connect(leftAlveoli.fluidVolume,leftPleuralSpace. internalSpace) annotation (
          Line(points={{-142,18},{-90,18},{-90,34},{-75,34}}, color={0,0,127}));
      connect(leftPleauralPressure.pressure, leftAlveoli.externalPressure)
        annotation (Line(points={{-76,60},{-145,60},{-145,35}}, color={0,0,127}));
    connect(rightAlveoli.fluidVolume, rightPleuralSpace.internalSpace)
      annotation (Line(points={{-136,-56},{-82,-56},{-82,-42},{-75,-42}},
          color={0,0,127}));
    connect(rightPleauralPressure.pressure, rightAlveoli.externalPressure)
      annotation (Line(points={{-76,-16},{-140,-16},{-140,-39},{-139,-39}},
          color={0,0,127}));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio = false)),
        Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-360, -100}, {100, 100}})),
        experiment(StopTime = 60, Tolerance = 1e-05, __Dymola_Algorithm = "Dassl"),
        Documentation(info = "<html>
<p>References:</p>
<p><br>Mecklenburgh, J. S., and W. W. Mapleson. &quot;Ventilatory assistance and respiratory muscle activity. 1: Interaction in healthy volunteers.&quot; <i>British journal of anaesthesia</i> 80.4 (1998): 422-433.</p>
</html>"));
    end Respiration;

    model CapillaryMembrane
      extends Modelica.Icons.Example;
      replaceable package Blood = Physiolibrary.Media.Blood;
      Components.ElasticVessel Artys(
        redeclare package Medium = Blood,
        use_concentration_start=true,
        concentration_start=Blood.ArterialDefault,
        useSubstances=true,
        Compliance=7.5006157584566e-08)
        annotation (Placement(transformation(extent={{-72,-18},{-52,4}})));
      Components.ElasticVessel Veins(
        redeclare package Medium = Blood,
        use_concentration_start=true,
        concentration_start=Blood.VenousDefault,
        useSubstances=true,
        volume_start=0.002,
        Compliance=7.5006157584566e-08)
        annotation (Placement(transformation(extent={{56,-12},{76,8}})));
      Chemical.Components.Membrane membrane[Blood.nS](KC={0,0.01,0.01,0.01,0,0,0,0,0,0,
            0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
            0,0,0,0,0})
        annotation (Placement(transformation(extent={{4,-56},{24,-36}})));
        /*
    .* {0,1,1,1,
    0,0,0,0,0,0,0,
    1,0,0,0,0,0,
    0,0,1}
    
    "RBC","O2","CO2","CO","Hb","MetHb","HbF","Alb","Glb","PO4","DPG",
      "Glucose","Lactate","Urea","AminoAcids","Lipids","Ketoacids",
      "SID","H+","Others"
      */
        /*
    {  D_Epinephrine, D_Norepinephrine, D_Vasopressin, D_Insulin, D_Glucagon,
      D_Thyrotropin, D_Thyroxine, D_Leptin,
      D_Desglymidodrine, D_AlphaBlockers, D_BetaBlockers,
      D_AnesthesiaVascularConductance, D_Angiotensin2,
      D_Renin, D_Aldosterone}
    */
      inner Modelica.Fluid.System system(T_ambient=310.15)
        annotation (Placement(transformation(extent={{64,66},{84,86}})));
    equation
      connect(Artys.substances, membrane.port_a) annotation (Line(points={{-72,-7},{
              -76,-7},{-76,12},{-6,12},{-6,-46},{4,-46}}, color={158,66,200}));
      connect(membrane.port_b, Veins.substances) annotation (Line(points={{24,-46},{
              42,-46},{42,-2},{56,-2}}, color={158,66,200}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)),
        experiment(
          StopTime=20,
          Tolerance=1e-08,
          __Dymola_Algorithm="Dassl"));
    end CapillaryMembrane;
  end Examples;
  annotation (
    Documentation(info = "<html>
<p>The main usage of this fluid domain is modeling of the cardio-vascular, respiratory and lymhpatic system in human physiology. And because there are no extreme thermodynamic conditions, the system can be really simple &mdash;it is only necessary to model conditions for ideal gases, for incompressible liquids, at normal liquid temperatures and with relative pressure 5-20kPa. This boring thermodynamic state leads to the very simple blocks of resistance,  pressure, volumetric flow, inertia and finally the block of blood accumulation in elastic comparments.</p>
</html>"));
end Fluid;

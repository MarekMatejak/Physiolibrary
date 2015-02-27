within Physiolibrary;
package Chemical2
  "Domain with Molar Concentration, Molar Flow, Enthalpy and Entropy"
 extends Modelica.Icons.Package;

  package Components
    extends Modelica.Icons.Package;
    model Substance "Substance accumulation in solution"
      extends Icons.Substance;
      extends Interfaces.ConditionalVolume;

      extends SteadyStates.Interfaces.SteadyState(
      state(nominal=NominalSolute),
      change(nominal=NominalSolute/60),
      state_start=solute_start,
      storeUnit="mmol");

      parameter Types.AmountOfSubstance solute_start(nominal=NominalSolute) = 1e-8
        "Initial solute amount in compartment"
         annotation ( HideResult=true, Dialog(group="Initialization"));

      Types.RealIO.AmountOfSubstanceOutput solute(nominal=
          NominalSolute) "Current amount of solute"
        annotation (Placement(transformation(extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,-100}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={60,-100})));

      parameter Types.AmountOfSubstance NominalSolute = 0.001
        "Numerical scale. Default is from mmol to mol, but for some substances such as hormones, hydronium or hydroxide ions can be much smaller."
          annotation ( HideResult=true, Dialog(tab="Solver",group="Numerical support of very small concentrations"));

      Interfaces.ChemicalPort_b q_out(H(fixed=true)=dH,S(fixed=true)=dS,conc(start=solute_start/NormalVolume))
        "Concentration and molar flow from/to compartment"
        annotation (Placement(transformation(extent={{-10,-10},{10,10}})));

      parameter Types.MolarEnergy dH=0 "Standard Enthalpy of substance"
        annotation ( HideResult=true, Dialog(tab="Energies"));
      parameter Types.MolarEntropy dS=0 "Standard Entropy of substance"
        annotation ( HideResult=true, Dialog(tab="Energies"));

      Types.RealIO.EnergyOutput internalHeat
        "Internal heat energy = enthalpy*amountOfSubstance" annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={60,-100}), iconTransformation(
            extent={{-20,-20},{20,20}},
            origin={116,-40})));
    equation
      q_out.conc = solute/volume;

      state = solute; // der(solute)=q_out.q
      change = q_out.q;

      internalHeat = dH*solute;

                                                                                                        annotation (
        Icon(coordinateSystem(
              preserveAspectRatio=false,extent={{-100,-100},{100,100}}),
            graphics={Text(
              extent={{-80,90},{280,130}},
              lineColor={0,0,255},
              textString="%name")}),
        Documentation(revisions="<html>
<p>2009-2015 by Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>", info="<html>
<p><b>Solute = Concentration &middot; Volume = &int; MolarFlow</b></p>
<p>The main class from &ldquo;Chemical&rdquo; package is called &QUOT;Substance&QUOT;. It has one chemical connector, where molar concentration and molar flow is presented as usually. An amount of a substance (&QUOT;solute&QUOT;) is accumulated by molar flow inside an instance of this class. In the default setting the volume is set to one liter, so in this setting the concentration at &ldquo;mol/L&rdquo; has the same value as the variable solute at &ldquo;mol&rdquo;. But in the advanced settings the default volume can be changed with external input. The molar flow at the port can be also negative, which means that the solute leaves the Substance instance.&nbsp;</p>
</html>"));
    end Substance;

    model ChemicalReaction "Chemical Reaction"
      import Physiolibrary;

      Real KaT "Dissociation constant at current temperature";
      Types.MolarFlowRate rr "Reaction molar flow rate";

      extends Physiolibrary.Chemical2.Interfaces.ConditionalVolume;

      parameter Boolean useDissociationConstantInput = false
        "=true, if external dissociation ratio is used"
      annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

      parameter Boolean useForwardRateInput = false
        "=true, if external forward rate is used"
      annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

      Modelica.Blocks.Interfaces.RealInput dissociationConstant(start=K) = KBase if useDissociationConstantInput
        "Dissociation coefficient [SI-unit]"
                                          annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,40})));

      Physiolibrary.Chemical2.Interfaces.ChemicalPort_b products[nP] "Products"
        annotation (Placement(transformation(extent={{90,-10},{110,10}})));

      Physiolibrary.Chemical2.Interfaces.ChemicalPort_a substrates[nS]
        "Substrates"
        annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));

      parameter Real K = exp(-(dH-TK*dS)/(TK*Modelica.Constants.R))
        "Fixed dissociation constant [SI-unit] if useDissociationConstantInput=false"
        annotation ( HideResult=true, Dialog(enable=not useDissociationConstantInput));

      parameter Real kf = exp(sum(s.*substrates.H)/(TK*Modelica.Constants.R)-sum(s.*substrates.S)/Modelica.Constants.R)
        "Forward reaction rate coefficient [SI unit]"
        annotation ( Dialog(enable=not useForwardRateInput));

      parameter Integer nS=1 "Number of substrates types"
        annotation ( HideResult=true, Dialog(group="Substrates", tab="Reaction type"));
      parameter Integer nP=1 "Number of products types"
        annotation ( HideResult=true, Dialog(group="Products", tab="Reaction type"));

      parameter Types.StoichiometricNumber s[nS]=ones(nS)
        "Stoichiometric reaction coefficient for substrates"
        annotation (  HideResult=true, Dialog(group="Substrates", tab="Reaction type"));
      parameter Modelica.SIunits.ActivityCoefficient as[nS]=ones(nS)
        "Activity coefficients of substrates"
        annotation ( HideResult=true, Dialog(group="Substrates", tab="Reaction type"));

      parameter Types.StoichiometricNumber p[nP]=ones(nP)
        "Stoichiometric reaction coefficients for products"
        annotation ( HideResult=true, Dialog(group="Products", tab="Reaction type"));
       parameter Modelica.SIunits.ActivityCoefficient ap[nP]=ones(nP)
        "Activity coefficients of products"
        annotation ( HideResult=true, Dialog(group="Products", tab="Reaction type"));

     extends Physiolibrary.Chemical2.Interfaces.ConditionalHeatPort;

      parameter Types.Temperature TK=298.15 "Base temperature"
        annotation ( HideResult=true, Dialog(tab="Temperature dependence"));

      parameter Types.MolarEnergy dH=sum(p.*products.H) - sum(s.*substrates.H)
        "Standard Enthalpy Change (negative=exothermic)"
        annotation ( Dialog(tab="Temperature dependence"));
      parameter Types.MolarEntropy dS=sum(p.*products.S) - sum(s.*substrates.S)
        "Standard Entropy Change"
        annotation ( Dialog(tab="Temperature dependence"));

      parameter Types.Fraction solventFraction=1
        "Free solvent fraction in liquid (i.e. water fraction in plasma=0.94, in RBC=0.65, in blood=0.81)";

      Real KBase "dissociation constant at TK" annotation (HideResult=true);

      Real forwardRate;
    protected
      parameter Types.Fraction fsp=solventFraction^(sum(s)+sum(p));
      parameter Types.Fraction fs=solventFraction^(sum(s));
      parameter Types.Fraction fp=solventFraction^(sum(p));

    public
      Modelica.Blocks.Interfaces.RealInput forwardRateCoefficient(start=kf)=forwardRate if
                                                                                    useForwardRateInput
        "Reaction forward rate coefficient [SI-unit]" annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={40,40})));
    equation
      if not useDissociationConstantInput then
        KBase = K;
      end if;
      if not useForwardRateInput then
        forwardRate = kf;
      end if;

      KaT = KBase * Modelica.Math.exp(((-dH)/Modelica.Constants.R)*(1/T_heatPort - 1/TK));  //Hoff's equation

      rr*fsp = forwardRate*volume*(product((as.*substrates.conc).^s)*fp - (1/KaT)*product((ap.*products.conc).^p)*fs);  //Elementary first-order rate kinetics - the main equation

      lossHeat = -dH*rr; //dH<0 => Exothermic => lossHeat>0, Endothermic otherwise

      rr*s = substrates.q;
      rr*p = -products.q;

      annotation (
        Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,100}}),
                            graphics={
            Rectangle(
              extent={{-100,-30},{100,30}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-128,-66},{142,-40}},
              textString="%name",
              lineColor={0,0,255}),
            Polygon(
              points={{-60,6},{-60,4},{54,4},{54,4},{18,14},{18,6},{-60,6}},
              lineColor={0,0,0},
              smooth=Smooth.None,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{54,-8},{54,-6},{-60,-6},{-60,-6},{-24,-16},{-24,-8},{54,-8}},
              lineColor={0,0,0},
              smooth=Smooth.None,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid)}),
        Documentation(revisions="<html>
<p><i>2013-2015 by </i>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>",     info="<html>
<p><b>s<sub>1</sub>&middot;S<sub>1</sub> + .. + s<sub>nS</sub>&middot;S<sub>nS</sub> &LT;-&GT; p<sub>1</sub>&middot;P<sub>1</sub> + .. + p<sub>nP</sub>&middot;P<sub>nP</b></sub> </p>
<h4><span style=\"color:#008000\">Relations</span></h4>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"0\"><tr>
<td><p>k<sub>f</sub>&middot;volume&middot;<a href=\"modelica://ModelicaReference.Operators.'product()'\">product</a>(S<a href=\"ModelicaReference.Operators.ElementaryOperators\">.^</a>s)</p></td>
<td><p>forward rate</p></td>
</tr>
<tr>
<td><p>k<sub>b</sub>&middot;volume&middot;<a href=\"modelica://ModelicaReference.Operators.'product()'\">product</a>(P<a href=\"ModelicaReference.Operators.ElementaryOperators\">.^</a>p)</p></td>
<td><p>backward rate</p></td>
</tr>
<tr>
<td><p>K<sub>aT</sub> = k<sub>f</sub>/k<sub>b</sub> = <a href=\"modelica://ModelicaReference.Operators.'product()'\">product</a>(P<a href=\"ModelicaReference.Operators.ElementaryOperators\">.^</a>p) / <a href=\"modelica://ModelicaReference.Operators.'product()'\">product</a>(S<a href=\"ModelicaReference.Operators.ElementaryOperators\">.^</a>s)&nbsp;</p></td>
<td><p>equilibrium</p></td>
</tr>
<tr>
<td><p><a href=\"modelica://ModelicaReference.Operators.'log()'\">log</a>(K<sub>aT</sub>/K<sub>Base</sub>) = (-&Delta;H/<a href=\"modelica://Modelica.Constants\">R</a>)&middot;(1/T<sub>heatPort</sub> - 1/T<sub>K</sub>)&nbsp;</p></td>
<td><p>van&apos;t Hoff&apos;s equation</p></td>
</tr>
<tr>
<td><p>&Delta;<sub>r</sub>G<sup>0</sup>= &Delta;H - T&middot;&Delta;S = -R&middot;T&middot;<a href=\"modelica://ModelicaReference.Operators.'log()'\">log</a>(K<sub>aT</sub>) </p></td>
<td><p>Gibb&apos;s energy </p></td>
</tr>
<tr>
<td><p>&Delta;S = <a href=\"modelica://Modelica.Constants\">k</a>&middot;<a href=\"modelica://ModelicaReference.Operators.'log()'\">log</a>(&omega;) </p></td>
<td><p>entropy </p></td>
</tr>
</table>
<h4><span style=\"color:#008000\">Notations</span></h4>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"0\"><tr>
<td><p>S<sub>i</sub></p></td>
<td><p>molar concentration of i-th substrate</p></td>
</tr>
<tr>
<td><p>s<sub>i</sub></p></td>
<td><p>stochiometric coefficients of i-th substrate</p></td>
</tr>
<tr>
<td><p>nS</p></td>
<td><p>number of substrates</p></td>
</tr>
<tr>
<td><p>P<sub>j</sub></p></td>
<td><p>molar concentration of j-th product</p></td>
</tr>
<tr>
<td><p>p<sub>j</sub></p></td>
<td><p>stochiometric coefficients of j-th product</p></td>
</tr>
<tr>
<td><p>nP</p></td>
<td><p>number of products</p></td>
</tr>
<tr>
<td><p>K<sub>aT</sub></p></td>
<td><p>dissociation constant at current temperature T</p></td>
</tr>
<tr>
<td><p>k<sub>f</sub></p></td>
<td><p>forward rate coefficient at current temperature T</p></td>
</tr>
<tr>
<td><p>k<sub>b</sub></p></td>
<td><p>backward rate coefficient at current temperature T</p></td>
</tr>
<tr>
<td><p>volume &nbsp;</p></td>
<td><p>solution volume</p></td>
</tr>
<tr>
<td><p>&Delta;H</p></td>
<td><p>enthalpy of the reaction</p></td>
</tr>
<tr>
<td><p>T<sub>heatPort</sub></p></td>
<td><p>current temperature T</p></td>
</tr>
<tr>
<td><p>K<sub>Base</sub></p></td>
<td><p>tabulated dissociation constant at base temperature T<sub>K</sub></p></td>
</tr>
<tr>
<td><p>T<sub>K</sub></p></td>
<td><p>base temperature of tabulated coeficients</p></td>
</tr>
<tr>
<td><p>&omega;</p></td>
<td><p>change of number of microstates of particles</p></td>
</tr>
<tr>
<td><p>&Delta;S</p></td>
<td><p>entropy of the reaction</p></td>
</tr>
<tr>
<td><p>&Delta;<sub>r</sub>G<sup>0</sup></p></td>
<td><p>Gibb&apos;s energy of the reaction</p></td>
</tr>
<tr>
<td></td>
<td></td>
</tr>
</table>
</html>"));
    end ChemicalReaction;

    model GasSolubility "Henry's law of gas solubility in liquid."
       //q_in is dissolved in liquid and q_out is in gaseous solution"

      extends Icons.GasSolubility;
      extends Interfaces.ConditionalHeatPort;

      parameter Types.DiffusionPermeability solubilityRateCoef=0.01
        "The rate constant of incoming gas to solution (default 10 liter per second)"
                                                                                     annotation ( HideResult=true);

      Types.GasSolubility kH
        "Henry's law coefficient such as liquid-gas concentration ratio";

      parameter Types.GasSolubility kH_T0
        "Henry's law coefficient at base temperature (i.e. in (mmol/l)/kPa at 25degC: aO2=0.011, aCO2=0.245, ..)"
                                                                                                    annotation ( HideResult=true);
      parameter Types.Temperature T0=298.15 "Base temperature for kH_T0"
         annotation (HideResult=true,Dialog(tab="Temperature dependence"));
      parameter Types.Temperature C(displayUnit="K")
        "Gas-liquid specific constant for Van't Hoff's change of kH (i.e.: O2..1700K,CO2..2400K,N2..1300K,CO..1300K,..)"
        annotation (HideResult=true,Dialog(tab="Temperature dependence"));

      parameter Types.Fraction solventFraction=1
        "Free solvent fraction in liquid (i.e. water fraction in plasma=0.94, in RBC=0.65, in blood=0.81)";

      Interfaces.ChemicalPort_b q_out "Gaseous solution"
        annotation (Placement(transformation(extent={{-10,90},{10,110}})));

      Interfaces.ChemicalPort_a q_in "Dissolved in liquid solution"
        annotation (Placement(transformation(extent={{-10,-90},{10,-70}})));
    equation
      q_in.q + q_out.q = 0;

      kH = kH_T0 * Modelica.Math.exp(C* (1/T_heatPort - 1/T0)); // Van't Hoff equation

      // equilibrium:  liquid.conc = kH * gas.conc;
      q_out.q = solubilityRateCoef*(kH * q_out.conc - q_in.conc/solventFraction); //negative because of outflow

      lossHeat = C*Modelica.Constants.R*q_out.q; //negative = heat are comsumed when change from liquid to gas

       annotation (Documentation(revisions="<html>
<p><i>2009-2015 by </i>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>", info="<html>
<p><b>Concentration<sub>Liquid</sub> = k<sub>H</sub> &middot; Concentration<sub>Gas</b></sub></p>
<p>Henry&apos;s law: The concentration of the gas in the liquid is proportional to the partial pressure of the gas during equilibrium. </p>
<h4><span style=\"color:#008000\">Relations</span></h4>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"0\"><tr>
<td><p>k<sub>d</sub>&middot;A&middot;c<sub>gas</sub></p></td>
<td><p>dissolution rate</p></td>
</tr>
<tr>
<td><p>k<sub>v</sub>&middot;A&middot;c<sub>liquid</sub></p></td>
<td><p>volatility rate</p></td>
</tr>
<tr>
<td><p>k<sub>H</sub> = k<sub>d</sub>/k<sub>v</sub> = c<sub>liquid</sub>/c<sub>gas</sub></p></td>
<td><p>equilibrium</p></td>
</tr>
<tr>
<td><p><a href=\"modelica://ModelicaReference.Operators.'log()'\">log</a>(k<sub>H</sub>/K<sub>H0</sub>) = (-&Delta;H/<a href=\"modelica://Modelica.Constants\">R</a>)&middot;(1/T<sub>heatPort</sub> - 1/T<sub>K</sub>)&nbsp;</p></td>
<td><p>van&apos;t Hoff&apos;s equation</p></td>
</tr>
<tr>
<td><p>&Delta;<sub>r</sub>G<sup>0</sup>= &Delta;H - T&middot;&Delta;S = -R&middot;T&middot;<a href=\"modelica://ModelicaReference.Operators.'log()'\">log</a>(K<sub>H</sub>) </p></td>
<td><p>Gibb&apos;s energy </p></td>
</tr>
<tr>
<td><p>&Delta;S = <a href=\"modelica://Modelica.Constants\">k</a>&middot;<a href=\"modelica://ModelicaReference.Operators.'log()'\">log</a>(&Omega;) </p></td>
<td><p>entropy </p></td>
</tr>
</table>
<h4><span style=\"color:#008000\">Notations</span></h4>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"0\"><tr>
<td><p>c<sub>gas</sub></p></td>
<td><p>gaseous molar concentration of the substance</p></td>
</tr>
<tr>
<td><p>c<sub>liquid</sub></p></td>
<td><p>liquid molar concentration of the substance</p></td>
</tr>
<tr>
<td><p>K<sub>H</sub></p></td>
<td><p>Henry&apos;s coeficient at current temperature T</p></td>
</tr>
<tr>
<td><p>k<sub>d</sub></p></td>
<td><p>dissolution rate coefficient in liquid at current temperature T</p></td>
</tr>
<tr>
<td><p>k<sub>v</sub></p></td>
<td><p>volatility rate coefficient at current temperature T</p></td>
</tr>
<tr>
<td><p>A &nbsp;</p></td>
<td><p>surface area between gas and liquid</p></td>
</tr>
<tr>
<td><p>&Delta;H</p></td>
<td><p>enthalpy of dissolution</p></td>
</tr>
<tr>
<td><p>T<sub>heatPort</sub></p></td>
<td><p>current temperature T</p></td>
</tr>
<tr>
<td><p>K<sub>H0</sub></p></td>
<td><p>tabulated Henry&apos;s constant at base temperature T<sub>K</sub></p></td>
</tr>
<tr>
<td><p>T<sub>K</sub></p></td>
<td><p>base temperature of tabulated coeficients</p></td>
</tr>
<tr>
<td><p>&Omega;</p></td>
<td><p>change of number of ways of arranging molecules</p></td>
</tr>
<tr>
<td><p>&Delta;S</p></td>
<td><p>entropy of the dissolution</p></td>
</tr>
<tr>
<td><p>&Delta;<sub>s</sub>G<sup>0</sup></p></td>
<td><p>Gibb&apos;s energy of the dissolution</p></td>
</tr>
<tr>
<td></td>
<td></td>
</tr>
</table>
<p>Henry&apos;s coefficient <b>k<sub>H</sub></b> depends on temperature and on the identities of all substances present in solution.</p>
<p>Water fraction (W_solution, plasma 0.94, RBC 0.65 =&GT; blood 0.81 ml/ml) in solution can change the solubility of gases in water [1] as c_pure=c_solution/W_solution. </p>
<h4><span style=\"color:#008000\">References</span></h4>
<p>[1] Dash RK, Bassingthwaighte JB. Erratum to: Blood HbO2 and HbCO2 dissociation curves at varied O2, CO2, pH, 2, 3-DPG and temperature levels. Ann Biomed Eng 2010;38:1683-701. </p>
</html>"));
    end GasSolubility;

    model Diffusion "Solute diffusion"
      extends Icons.Diffusion;
      extends Interfaces.OnePort;

      parameter Boolean useConductanceInput = false
        "=true, if external conductance value is used"
        annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

      parameter Types.DiffusionPermeability Conductance=0
        "Diffusion conductance if useConductanceInput=false"
        annotation (Dialog(enable=not useConductanceInput));

    protected
      Types.DiffusionPermeability c;
    public
      Types.RealIO.DiffusionPermeabilityInput conductance = c if useConductanceInput
        annotation (Placement(transformation(extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,40})));
    equation
      if not useConductanceInput then
        c=Conductance;
      end if;

       q_in.q = c * (q_in.conc - q_out.conc);

       annotation (                 Documentation(revisions="<html>
<p><i>2009-2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>",     info="<html>
<p><a name=\"firstHeading\">The diffusion conductance parameter can be estimated using the Fick&apos;s laws of diffusion: </a></p>
<p>J= -D*(dPhi)/dx</p>
<p>where</p>
<p>J is molar flow of solute per area [mol/(m2.s)]. </p>
<p>D is diffusion constant [m2/s]. </p>
<p>dPhi is concentration gradient [mol/m3].</p>
<p>dx is length of diffusion [m].</p>
<p><br>The solution on both sides must have the same properties (for example solubilities, chemical activities, osmolarities,...)!</p>
</html>"));
    end Diffusion;

    model Membrane
      "Donnan's equilibrium of electrolytes usable for glomerular membrane, open/leak membrane channels, pores, ..."
      extends Icons.Membrane;
      extends Interfaces.ConditionalHeatPort;

      parameter Integer NumberOfParticles = 1
        "Number of penetrating particle types";
      parameter Integer Charges[NumberOfParticles] = zeros(NumberOfParticles)
        "Elementary charges of particles";
      parameter Types.DiffusionPermeability Permeabilities[NumberOfParticles] = zeros(NumberOfParticles)
        "Permeabilities of particles through membrane chanel";

      parameter Boolean usePermeabilityInput = false
        "=true, if external permeability value is used"
        annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

      Interfaces.ChemicalPort_a particlesInside[NumberOfParticles]
        "inner side of membrane, solution"
        annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
      Interfaces.ChemicalPort_b particlesOutside[NumberOfParticles]
        "outer side of membrane, solution"
        annotation (Placement(transformation(extent={{90,-10},{110,10}})));

      Types.RealIO.DiffusionPermeabilityInput permeability[NumberOfParticles] = p if usePermeabilityInput
        annotation (Placement(transformation(extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,100})));

      Types.GasSolubility kH[NumberOfParticles]
        "Concentration ratio at equilibrium";

      parameter Types.GasSolubility kH_T0[NumberOfParticles] = ones( NumberOfParticles)
        "Equilibrated concentration ratio at temperature T0 - can be estimated by Henry's law coefficient ratios (kH1/kH2)"
         annotation ( HideResult=true,Dialog(tab="Different solubilities"));
      parameter Types.Temperature T0=298.15 "Base temperature for kH_T0"
         annotation (HideResult=true,Dialog(tab="Temperature dependence"));
      parameter Types.Temperature C[NumberOfParticles](displayUnit="K") = zeros(NumberOfParticles)
        "Specific constant difference (C1-C2) for Van't Hoff's change of kH"
        annotation (HideResult=true,Dialog(tab="Temperature dependence"));

      parameter Types.Fraction solventFractionInside=1
        "Free solvent fraction inside (i.e. water fraction in plasma=0.94, in cells=0.65, in blood=0.81)";
      parameter Types.Fraction solventFractionOutside=1
        "Free solvent fraction outside (i.e. water fraction in plasma=0.94, in cells=0.65, in blood=0.81)";

    protected
       Real KAdjustment
        "=(Cations-AnionLessProteins)/(Cations+AnionLessProteins)";
       Types.DiffusionPermeability p[NumberOfParticles];

    equation
      if not usePermeabilityInput then
        p=Permeabilities;
      end if;

       //no accumulation of particles:
       particlesInside.q + particlesOutside.q = zeros(NumberOfParticles); //nothing lost inside

       //electroneutrality:
       if abs(Charges.*Charges*p)<=Modelica.Constants.eps then
         KAdjustment=0; //no penetrating electrolytes => KAdjustment and electroneutrality of flux is not needed
       else
         Charges*particlesInside.q = 0; //electroneutrality of flux through membrane
       end if;

       //diffusion, penetration, particle movement:
       for i in 1:NumberOfParticles loop
         if Charges[i]==0 then //normal diffusion
           particlesInside[i].q = p[i] * (particlesInside[i].conc/solventFractionInside - kH[i]*particlesOutside[i].conc/solventFractionOutside);
         elseif Charges[i]>0 then //cation goes to Donnan's equilibrium
           particlesInside[i].q = p[i] * (particlesInside[i].conc/solventFractionInside - (1+KAdjustment)*kH[i]*particlesOutside[i].conc/solventFractionOutside);
         else //anion goes to Donnan's equilibrium
           particlesInside[i].q = p[i] * (particlesInside[i].conc/solventFractionInside - (1-KAdjustment)*kH[i]*particlesOutside[i].conc/solventFractionOutside);
         end if;
       end for;

       //different solubilities:
       kH = kH_T0 .* Modelica.Math.exp(C * (1/T_heatPort - 1/T0));
       lossHeat = Modelica.Constants.R* C*particlesOutside.q; //negative = heat are comsumed when change from liquid to gas

      annotation ( Documentation(info="<html>
<p><u><b><font style=\"color: #008000; \">Filtration throught semipermeable membrane.</font></b></u></p>
<p>The penetrating particles are driven by electric and chemical gradient to reach Donnan&apos;s equilibrium. The permeabilities of particles are used only in dynamic simulation with non-zero fluxes. If zero-flow Donnan&apos;s equilibrium is reached, it is independent on the permeabilities. </p>
<p>This class can be used for glomerular membrane, open(leak) channels (pores) of cellular (or any lipid bilayer) membrane, chloride schift, ...</p>
<p><br>The membrane permeabilities depends on <code>(D/membrameThicknes)*membraneArea</code>, where D is Fick&apos;s diffusion coefficient.<code> </code></p>
<p>................................</p>
<h4><span style=\"color:#008000\">Filtration example of tree particles</span></h4>
<p>ALP .. small penetrating anion</p>
<p>P .. nonpenetrating protein with negative charge</p>
<p>C .. small penetrating cation</p>
<p>In outer side of membrane are not protein P (it leaves inside). </p>
<p>In equilibrium 4 concentration are unknown:</p>
<p>ALP_in, ALP_out, C_in, C_out.</p>
<p>Closed system equilibrium equations:</p>
<p>tALP = ALP_in + ALP_out ... total amount of ALP </p>
<p>tC = C_in + C_out ... total amount of C</p>
<p>P + ALP_in = C_in ... electroneutrality inside</p>
<p>ALP_out = C_out ... electroneutrality outside</p>
<p>----------------------------------------------------</p>
<p>It is possible to write these equations also in form of KAdjustment, which connect also more than tree type of particles with Donnan&apos;s equilibrium equations:</p>
<p>ALP_in/ALP_out = (1-KAdjustment) </p>
<p>C_in/C_out = (1+KAdjustment) </p>
<p>where KAdjustment = P/(2*C_in-P) and C_out=ALP_out=(2*C_in-P)/2, because ALP_in/ALP_out = (C_in - P)/C_out = (2C_in-2P)/(2C_in-P) = 1 - P/(2C_in-P) = 1-KAdjustment and C_in/C_out = (2C_in)/(2C_in-P) = 1 + P/(2C_in-P) = 1+KAdjustment .</p>
<p><br><h4><span style=\"color:#008000\">Problem with different solubilities/Henry constants/ (kH1, kH2)</span></h4></p>
<p>Equilibrated is chemical potential, not concentrations (c1,c2)!</p>
<p>Equality of chemical potential is approximated by equality of partial pressure (p1,p2): </p>
<p>p1=kH1*c1 </p>
<p>p2=kH2*c2</p>
<p><br>c2 = (kH1/kH2) * c1</p>
<p>Henry constant between both side can be defined as<b> kH_T0 = kH1/kH2</b> at temperature T0, where kH1 is Henry constant in first side of membrane and kH2 is Henry constant in second side of membrane.</p>
<h4><span style=\"color:#008000\">Temperature dependence of Henry constants by Van't Hoff</span></h4>
<p><code>kH1&nbsp;=&nbsp;kH1_T0&nbsp;*<font style=\"color: #ff0000; \">&nbsp;Modelica.Math.exp</font>(C1*&nbsp;(1/T&nbsp;-&nbsp;1/T0))</code></p>
<p><code>kH2&nbsp;=&nbsp;kH2_T0&nbsp;*<font style=\"color: #ff0000; \">&nbsp;Modelica.Math.exp</font>(C2*&nbsp;(1/T&nbsp;-&nbsp;1/T0))</code></p>
<p>kH1/kH2 = <code>kH_T0&nbsp;*<font style=\"color: #ff0000; \">&nbsp;Modelica.Math.exp</font>(C *&nbsp;(1/T&nbsp;-&nbsp;1/T0))</code></p>
<p>Specific&nbsp;constant&nbsp;for&nbsp;Van&apos;t&nbsp;Hoff&apos;s&nbsp;change&nbsp;of&nbsp;kH_T0 can be defined as<b> C = C1-C2</b>, where C1 is specific constant in first side of membrane and C2 is specific constant in second side of membrane.</p>
</html>"));
    end Membrane;

    model Speciation
      "Chemical species definition by independent binding sides of macromolecule"
      extends Icons.Speciation;

      extends SteadyStates.Interfaces.SteadyStateSystem(
                                               Simulation=Types.SimulationType.SteadyState, NumberOfDependentStates=NumberOfSubunits-1);
      extends Interfaces.ConditionalVolume;

      parameter Integer NumberOfSubunits=1
        "Number of independent subunits occuring in molecule";

      Interfaces.ChemicalPort_a specificForm
        "Specific form composed with subunits form of subunitSpiecies"
        annotation (Placement(transformation(extent={{90,-90},{110,-70}})));
      Interfaces.ChemicalPort_a specificSubunitForm[NumberOfSubunits]
        "Specific form of subunits of specific molecule form in connector called spieces"
        annotation (Placement(transformation(extent={{-10,90},{10,110}})));
    protected
      Real fractions[NumberOfSubunits];
    public
      Types.RealIO.AmountOfSubstanceInput amountOfSubunit[NumberOfSubunits]
        "Total amount of the subunits in all forms"
        annotation (Placement(transformation(extent={{-20,-20},{20,20}},
            rotation=180,
            origin={80,0})));
      Types.RealIO.AmountOfSubstanceOutput amount
        "Total amount of macromolecules in this system"
       annotation (Placement(
            transformation(extent={{-10,-10},{10,10}},
            rotation=270,
            origin={0,-80})));                                                             //(start=1e-8)
      Types.RealIO.EnergyOutput internalHeat
        "Relative internal heat of all chemical forms in this system"                                                                annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-60,-80}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-60,-80})));

    //system internal heat
      parameter Boolean useInternalHeatsInput = false
        "=true, if subunitInternalHeat inputs are used instead of parameter SubunitEnthalpies"
      annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs",tab="Heat"));

      parameter Types.MolarEnergy SubunitEnthalpies[NumberOfSubunits]=zeros(NumberOfSubunits)
        "Enthalpy changes of substances (can relative to one choosen specific form of chemical substance in the system) if useEnthalpiesInput=false"
        annotation (HideResult=not useInternalHeatsInput, Dialog(enable=not useInternalHeatsInput,tab="Heat"));

      Types.RealIO.EnergyInput subunitInternalHeat[NumberOfSubunits](each start=0)=internalHeatOfSubunit if useInternalHeatsInput
      annotation (Dialog(enable=false),
         Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=180,
            origin={80,60}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=180,
            origin={80,60})));

       Types.Energy internalHeatOfSubunit[NumberOfSubunits]
        "Internal heat of subunits";
    equation

      amount = amountOfSubunit[1];

      fractions = if (amount < Modelica.Constants.eps) then zeros(NumberOfSubunits)
                  else specificSubunitForm.conc ./ (amountOfSubunit/volume);

      specificForm.conc = (amount/volume)*product(fractions); //chemical speciation

      for i in 2:NumberOfSubunits loop
                 normalizedState[i-1]*amount = amountOfSubunit[i];
      end for;

    //molar flow:
      specificSubunitForm.q = -specificForm.q * ones(NumberOfSubunits);

    //heat:
       if not useInternalHeatsInput then
        internalHeatOfSubunit = SubunitEnthalpies.*amountOfSubunit;
      end if;
      internalHeat=sum(internalHeatOfSubunit);

      annotation (defaultComponentName="macromoleculeSpecie_in_macromoleculeGroup",
        Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>",     info="<html>
<p>This block identifies one specific chemical form of one macromolecule defined by forms of its subunits  (one chosen chemical species - called <i>specie</i>).</p>
<p>Only main connector called <b>species </b>is designed for inflow and outflow of macromolecule to/from <i>system</i>. The concentration in this connector is the concentration of its specific <i>specie.</i></p>
<p>Connectors <b>subunitSpecies[:] </b>represent specific forms of the macromolecule subunit types. If the subnunit type occures n-times in macromolecule, the inflow is n-time greater than the inflow of macromolecule.</p>
<p><br>Initial total concentrations of subunits must be set to be right distribution of total macromolecule concentration. So the ratios between subunit concentrations are the ratios of their occurence in macromolecule. In equilibrium are this proporties fullfiled.</p>
<p><br>For example: If the macromolecule has four identical independent subunits and each subunit can occur in two form F1 and F2, then the concentration of macromolecule <i>specie </i>composed only from four subunits in form F1 is <b>species.conc=</b>conc*fF1^4. </p>
<p>Where:</p>
<p>conc is totat concentration of macromolecule in <i>system</i> accumulated by <b>species.q</b>,</p>
<p>fF1 = F1/(F1+F2) is fraction of form F1 in subsystem of subunit,</p>
<p>4 is number of subunits (<b>numberOfSubunit</b>).</p>
<p><br>This block can be connected to chemical reactions such as it was the chosen species with subsystem behind. It is recommended to use this block only as an equilibrated subsystem.</p>
<h4><span style=\"color:#008000\">Heat of chemical system.</span></h4>
<p>Enthalpy of each subunit species can be presented as <b>subunitEnthalpies[:]</b>. Then the total enthalpy of the chemical system can be calculated by equation:</p>
<h4>systemEnthalpy = sum(subunitEnthalpies[i] * totalSubunitAmount[i]) / totalSubsystemAmount</h4>
<p>And the stored heat as enthalpy is <b>systemEnthalpy*totalSubsystemAmount.</b></p>
</html>"));
    end Speciation;

    model Degradation "Degradation of solute"
      extends Interfaces.ConditionalVolume;

      Interfaces.ChemicalPort_a q_in "Degraded solute outflow"
        annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));

      parameter Types.Time HalfTime
        "Degradation half time. The time after which will remain half of initial concentration in the defined volume when no other generation nor clearence nor degradation exist.";

    protected
      Types.VolumeFlowRate Clearance;
    equation
      Clearance = volume*Modelica.Math.log(2)/HalfTime;
      q_in.q = Clearance*q_in.conc;

     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
                            graphics={
            Rectangle(
              extent={{-100,-50},{100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-80,26},{62,0},{-80,-26},{-80,26}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-150,-100},{150,-60}},
              textString="%name",
              lineColor={0,0,255}),
            Text(
              extent={{-100,-30},{100,-50}},
              lineColor={0,0,0},
              textString="half-time=%HalfTime s"),
            Polygon(
              points={{-68,24},{-68,-24},{-58,-22},{-58,22},{-68,24}},
              lineColor={0,0,127},
              smooth=Smooth.None,
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-46,20},{-46,-20},{-36,-18},{-36,18},{-46,20}},
              lineColor={0,0,127},
              smooth=Smooth.None,
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-24,16},{-24,-16},{-14,-14},{-14,14},{-24,16}},
              lineColor={0,0,127},
              smooth=Smooth.None,
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-2,12},{-2,-12},{8,-10},{8,10},{-2,12}},
              lineColor={0,0,127},
              smooth=Smooth.None,
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{20,8},{20,-8},{30,-6},{30,6},{20,8}},
              lineColor={0,0,127},
              smooth=Smooth.None,
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{40,4},{40,-4},{50,-2},{50,2},{40,4}},
              lineColor={0,0,127},
              smooth=Smooth.None,
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid)}),
        Documentation(revisions="<html>
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
<td>Charles University, Prague</td>
</tr>
<tr>
<td>Date of:</td>
<td>2013</td>
</tr>
</table>
</html>"));
    end Degradation;

    model Clearance "Clearance with or without solvent outflow"

      parameter Types.VolumeFlowRate Clearance=0
        "Clearance of solute if useSolutionFlowInput=false"
        annotation (Dialog(enable=not useSolutionFlowInput));

      parameter Real K(unit="1")=1
        "Coefficient such that Clearance = K*solutionFlow";

      extends Interfaces.ConditionalSolutionFlow(SolutionFlow=Clearance/K);

      Interfaces.ChemicalPort_a q_in "solute outflow"
        annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));

      Types.VolumeFlowRate clearance;
    equation

      clearance = q*K;

      q_in.q = clearance*q_in.conc;

    //  assert(clearance>=-Modelica.Constants.eps, "Clearance can not be negative!");

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
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-150,-100},{150,-60}},
              textString="%name",
              lineColor={0,0,255}),
            Text(
              extent={{-100,-30},{100,-50}},
              lineColor={0,0,0},
              textString="K=%K")}),        Documentation(revisions="<html>
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
<td>Charles University, Prague</td>
</tr>
<tr>
<td>Date of:</td>
<td>2009</td>
</tr>
</table>
</html>"));
    end Clearance;

    model Stream "Flow of whole solution"
      extends Interfaces.OnePort;
      extends Interfaces.ConditionalSolutionFlow;

    equation
      q_in.q = if
                 (q>0) then q*q_in.conc else q*q_out.conc;

     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={
            Rectangle(
              extent={{-100,-50},{100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              rotation=360),
            Polygon(
              points={{-80,25},{80,0},{-80,-25},{-80,25}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              rotation=360),
            Text(
              extent={{-150,-20},{150,20}},
              textString="%name",
              lineColor={0,0,255},
              origin={2,-74},
              rotation=180)}),
        Documentation(revisions="<html>
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
<td>Charles University, Prague</td>
</tr>
<tr>
<td>Date of:</td>
<td>2009</td>
</tr>
</table>
</html>",     info="<html>
<p><h4><font color=\"#008000\">Bidirectional mass flow by concentration</font></h4></p>
<p>Possible field values: </p>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"0.1\"><tr>
<td></td>
<td><p align=\"center\"><h4>forward flow</h4></p></td>
<td><p align=\"center\"><h4>backward flow</h4></p></td>
</tr>
<tr>
<td><p align=\"center\"><h4>solutionFlow</h4></p></td>
<td><p align=\"center\">&GT;=0</p></td>
<td><p align=\"center\">&LT;=0</p></td>
</tr>
<tr>
<td><p align=\"center\"><h4>q_in.q</h4></p></td>
<td><p align=\"center\">=solutionFlow*q_in.conc</p></td>
<td><p align=\"center\">=-q_out.q</p></td>
</tr>
<tr>
<td><p align=\"center\"><h4>q_out.q</h4></p></td>
<td><p align=\"center\">=-q_in.q</p></td>
<td><p align=\"center\">=solutionFlow*q_out.conc</p></td>
</tr>
</table>
<br/>
</html>"));
    end Stream;

    model SolutePump "Prescribed solute flow"
      extends Interfaces.OnePort;
      extends Interfaces.ConditionalSoluteFlow;

    equation
      q_in.q = q;

     annotation (
        Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{
                100,100}}), graphics={
            Rectangle(
              extent={{-100,-50},{100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              rotation=360),
            Polygon(
              points={{-80,25},{80,0},{-80,-25},{-80,25}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid,
              rotation=360),
            Text(
              extent={{-150,-20},{150,20}},
              lineColor={0,0,255},
              origin={-10,-76},
              rotation=360,
              textString="%name")}),        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end SolutePump;

    model Dilution "Adding/removing of the solvent to/from running solution"
      extends Interfaces.OnePort;
      extends Icons.Dilution;

      parameter Boolean useDilutionInput = false
        "=true, if dilition input is used"
        annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

      parameter Types.Fraction Dilution=1
        "Concentration ratio after per before dilution (0..no solutes, 1..no dilution) if useDilutionInput=false"
        annotation (Dialog(enable=not useSolventFlow));

      Types.RealIO.FractionInput dilution(start=Dilution)= d if useDilutionInput
        "Fraction of final undilutes solution"
        annotation (Placement(transformation(extent={{-120,60},{-80,100}})));
    protected
      Types.Fraction d;
    equation
      if not useDilutionInput then
        d=Dilution;
      end if;
      q_out.conc = d * q_in.conc;

     annotation (
        Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{
                100,100}}), graphics={
            Text(
              extent={{-120,20},{120,-20}},
              textString="%name",
              lineColor={0,0,255},
              origin={0,-60},
              rotation=180)}),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end Dilution;

    model Reabsorption "Reabsorption as input fraction"
       extends Icons.Reabsorption;

      parameter Boolean useEffect = false
        "=true, if reabsorption fraction is BaseReabsorption^(1/Effect)"
      annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

      parameter Boolean useMaxReabInput = false
        "=true, if external maximum of reabsorption molar flow is used"
      annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

      parameter Boolean useBaseReabsorption = false
        "=false, if BaseReabsorption=1"
      annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

      parameter Types.MolarFlowRate MaxReabsorption = Modelica.Constants.inf
        "Maximal reabsorption molar flow if useMaxReabInput=false"
        annotation (Dialog(enable=not useMaxReabInput));

      Interfaces.ChemicalPort_a Inflow "Tubular inflow"
        annotation (Placement(transformation(extent={{-110,30},{-90,50}})));
      Interfaces.ChemicalPort_b Outflow "Tubular outflow"
        annotation (Placement(transformation(extent={{90,30},{110,50}})));

      Interfaces.ChemicalPort_b Reabsorption "Reabsorption from tubules"
        annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
      Types.RealIO.FractionInput baseReabsorption=baseReabFract if useBaseReabsorption
        "Base fraction of molar inflow for reabsorption flow"
                                   annotation (Placement(transformation(extent={{-20,-20},
                {20,20}},
            rotation=270,
            origin={40,100})));

      Types.RealIO.FractionInput Effect(displayUnit="1")=e if useEffect
        "Effects<1 decrease reabsorption, effects>1 increase reabsorption fraction by equation ReabFract=BaseReabsorption^(1/Effect)"
                                   annotation (Placement(transformation(extent={{-20,-20},
                {20,20}},
            rotation=270,
            origin={0,100})));
      Types.RealIO.MolarFlowRateInput               MaxReab=mr if useMaxReabInput
        "Maximal allowed reabsorption molar flow rate"
                                   annotation (Placement(transformation(extent={{-100,
                -80},{-60,-40}})));
      Types.RealIO.FractionOutput               ReabFract=reabFract if useEffect
        "Actual reabsorbed fraction from solute inflow rate"                                annotation (Placement(transformation(extent={{80,-100},
                {120,-60}})));

      Types.Fraction reabFract,baseReabFract,e;
      Types.MolarFlowRate mr;
    equation
      Inflow.conc = Outflow.conc;
      0 = Inflow.q + Outflow.q + Reabsorption.q;

      Reabsorption.q=-min(mr,reabFract*Inflow.q);

      reabFract = baseReabFract^(1/e);

      if not useBaseReabsorption then
        baseReabFract=1;
      end if;

      if not useMaxReabInput then
        mr=MaxReabsorption;
      end if;

      if not useEffect then
        e=1;
      end if;

      annotation (Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},
                {100,100}}),       graphics={
            Text(
              extent={{0,-102},{154,-132}},
              lineColor={0,0,255},
              textString="%name")}),        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end Reabsorption;

  end Components;

  package Sensors
    extends Modelica.Icons.SensorsPackage;

    model MolarFlowMeasure "Measure of molar flow"
      extends Interfaces.OnePort;
      extends Icons.MolarFlowMeasure;

     Types.RealIO.MolarFlowRateOutput molarFlowRate
                             annotation (Placement(transformation(extent={{-20,-20},
                {20,20}},
            rotation=270,
            origin={0,-60})));
    equation
      q_in.conc = q_out.conc;

      molarFlowRate = q_in.q;

     annotation (
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end MolarFlowMeasure;

    model ConcentrationMeasure "Measure of molar concentration"

      Interfaces.ChemicalPort_a q_in "For measure only"
        annotation (Placement(transformation(extent={{-10,-30},{10,-10}})));
      Types.RealIO.ConcentrationOutput concentration "Concentration"
                             annotation (Placement(transformation(extent={{-20,-20},
                {20,20}},
            rotation=90,
            origin={0,40})));
    equation

      concentration =         q_in.conc;

      q_in.q = 0;
     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={    Rectangle(
              extent={{-20,20},{20,-20}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end ConcentrationMeasure;

    model IncrementalFlowConcentrationMeasure
      "Incremental flow concentration meassure in circulation after absorption/secretion source (i.e. portal vein concentration)"
      extends Interfaces.ConditionalSolutionFlow;

     Types.RealIO.ConcentrationOutput concentration
        "Concentration after absorption source"                           annotation (Placement(transformation(extent={{-12,-86},
                {28,-46}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,-62})));

      Types.RealIO.MolarFlowRateInput addition annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={60,40})));
      Interfaces.ChemicalPort_a q_in
        annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
    equation
      concentration = q_in.conc + addition/q;
      q_in.q=0;

     annotation (
        Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,100}}),
                            graphics={Rectangle(
              extent={{-100,-50},{100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{-88,-50},{80,50}},
              textString="%name",
              lineColor={0,0,255})}),        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end IncrementalFlowConcentrationMeasure;
  end Sensors;

  package Sources
    extends Modelica.Icons.SourcesPackage;

    model UnlimitedSolutePump "Molar pump of solute to system"
      extends Interfaces.ConditionalSoluteFlow;

      Interfaces.ChemicalPort_b q_out "Outflow"
        annotation (Placement(transformation(extent={{90,-10},{110,10}})));

    equation
      q_out.q = - q;

     annotation (
        Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{
                100,100}}), graphics={
            Rectangle(
              extent={{-100,-42},{100,40}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-48,20},{50,0},{-48,-21},{-48,20}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-82,-82},{90,-58}},
              textString="%name",
              lineColor={0,0,255})}),        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end UnlimitedSolutePump;

    model UnlimitedSolutionStorage "Constant concentration source"

      Interfaces.ChemicalPort_b q_out
        "constant concentration with any possible flow"
        annotation (Placement(transformation(extent={{90,-10},{110,10}})));

      parameter Boolean useConcentrationInput = false
        "=true, if fixed concentration is from input instead of parameter"
      annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

       parameter Types.Concentration Conc = 0
        "Fixed concentration if useConcentrationInput=false"
        annotation (Dialog(enable=not useConcentrationInput));

      parameter Boolean isIsolatedInSteadyState = true
        "=true, if there is no flow at port in steady state"
        annotation (Evaluate=true, HideResult=true, Dialog(group="Simulation",tab="Equilibrium"));

      parameter Types.SimulationType  Simulation=Types.SimulationType.NormalInit
        "If in equilibrium, then zero-flow equation is added."
        annotation (Evaluate=true, HideResult=true, Dialog(group="Simulation",tab="Equilibrium"));

       Types.RealIO.ConcentrationInput concentration(start=Conc)=c if useConcentrationInput
        annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));

    protected
      Types.Concentration c "Current concentration";

    initial equation
      if isIsolatedInSteadyState and (Simulation==Types.SimulationType.InitSteadyState) then
        q_out.q = 0;
      end if;

    equation
       if not useConcentrationInput then
         c=Conc;
       end if;

      q_out.conc = c;

      if isIsolatedInSteadyState and (Simulation==Types.SimulationType.SteadyState) then
        q_out.q = 0;
      end if;

      annotation ( Icon(coordinateSystem(
              preserveAspectRatio=false,extent={{-100,-100},{100,100}}),
            graphics={
            Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,0},
              pattern=LinePattern.None,
              fillColor={107,45,134},
              fillPattern=FillPattern.Backward),
            Text(
              extent={{0,0},{-100,-100}},
              lineColor={0,0,0},
              textString="conc"),
            Line(
              points={{-62,0},{56,0}},
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
              lineColor={0,0,255}),
            Text(
              extent={{140,-100},{-140,-160}},
              lineColor={0,0,0},
              textString="%Conc mmol/l")}),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end UnlimitedSolutionStorage;

    model UnlimitedGasStorage "Constant ideal gas source"
      extends Interfaces.ConditionalHeatPort;
      Interfaces.ChemicalPort_b q_out
        "constant gas concentration with any possible flow"
        annotation (Placement(transformation(extent={{90,-10},{110,10}})));

      parameter Boolean usePartialPressureInput = false
        "=true, if fixed partial pressure is from input instead of parameter"
      annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

       parameter Types.Pressure PartialPressure = 0
        "Fixed partial pressure if usePartialPressureInput=false"
        annotation (Dialog(enable=not usePartialPressureInput));

      Types.RealIO.PressureInput partialPressure(start=PartialPressure) = p if usePartialPressureInput
        "Partial pressure of Gas = air pressure * gas fraction"
        annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));

     parameter Boolean isIsolatedInSteadyState = true
        "=true, if there is no flow at port in steady state"
        annotation (Evaluate=true, HideResult=true, Dialog(group="Simulation",tab="Equilibrium"));

      parameter Types.SimulationType  Simulation=Types.SimulationType.NormalInit
        "If in equilibrium, then zero-flow equation is added."
        annotation (Evaluate=true, HideResult=true, Dialog(group="Simulation",tab="Equilibrium"));

    protected
      Types.Pressure p "Current partial pressure";

    initial equation
      if isIsolatedInSteadyState and (Simulation==Types.SimulationType.InitSteadyState) then
        q_out.q = 0;
      end if;

    equation
      if not usePartialPressureInput then
        p=PartialPressure;
      end if;

      q_out.conc = p / (Modelica.Constants.R * T_heatPort);  //ideal gas equation

      if isIsolatedInSteadyState and (Simulation==Types.SimulationType.SteadyState) then
         q_out.q = 0;
      end if;

      lossHeat=0; //only read temperature from heat port

      annotation ( Icon(coordinateSystem(
              preserveAspectRatio=false,extent={{-100,-100},{100,100}}),
            graphics={
            Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,0},
            pattern=LinePattern.None,
            fillColor={170,255,255},
            fillPattern=FillPattern.Backward),
            Polygon(
              points={{-100,100},{100,-100},{100,100},{-100,100}},
              smooth=Smooth.None,
              fillColor={159,159,223},
              fillPattern=FillPattern.Backward,
              pattern=LinePattern.None,
              lineColor={0,0,0}),
            Text(
              extent={{0,0},{-100,-100}},
              lineColor={0,0,0},
              textString="P,T"),
            Line(
              points={{-62,0},{56,0}},
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
              lineColor={0,0,255}),
            Text(
              extent={{-150,-110},{150,-140}},
              lineColor={0,0,0},
              textString="T=%T")}),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end UnlimitedGasStorage;

    model UnlimitedSolutePumpOut "Molar pump of solute out of system"
      extends Interfaces.ConditionalSoluteFlow;

      Interfaces.ChemicalPort_a q_in "Inflow"
        annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));

    equation
      q_in.q = q;

     annotation (
        Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{
                100,100}}), graphics={
            Rectangle(
              extent={{-100,-42},{100,40}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-48,20},{50,0},{-48,-21},{-48,20}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-82,-82},{90,-58}},
              textString="%name",
              lineColor={0,0,255})}),        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end UnlimitedSolutePumpOut;
  end Sources;

  package Interfaces
    extends Modelica.Icons.InterfacesPackage;

    connector ChemicalPort "Concentration and Solute flow"
      Types.Concentration conc "Solute concentration";
      flow Types.MolarFlowRate q "Solute flow";

      parameter Types.MolarEnergy H(fixed=false) "enthalpy of substance";
      parameter Types.MolarEntropy S(fixed=false) "entropy of substance";
      annotation (Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end ChemicalPort;



    connector ChemicalPort_a
      "Concentration, expected positive Solute inflow, enthalpy and entropy of substance"
      extends ChemicalPort;
    annotation (
        defaultComponentName="port_a",
        Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,
                100}}),     graphics={Rectangle(
              extent={{-20,10},{20,-10}},
              lineColor={158,66,200},
              lineThickness=1),       Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={158,66,200},
              fillColor={158,66,200},
              fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}),
            graphics={Rectangle(
              extent={{-40,40},{40,-40}},
              lineColor={158,66,200},
              fillColor={158,66,200},
              fillPattern=FillPattern.Solid,
              lineThickness=1),
       Text(extent = {{-160,110},{40,50}}, lineColor={172,72,218},   textString = "%name")}),
        Documentation(info="<html>
<p>
Connector with one flow signal of type Real.
</p>
</html>",
        revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));

    end ChemicalPort_a;

    connector ChemicalPort_b
      "Concentration, expected negative Solute inflow, enthalpy and entropy of substance"
      extends ChemicalPort;

    annotation (
        defaultComponentName="port_a",
        Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,
                100}}),     graphics={Rectangle(
              extent={{-20,10},{20,-10}},
              lineColor={158,66,200},
              lineThickness=1),       Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={158,66,200},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}),
            graphics={Rectangle(
              extent={{-40,40},{40,-40}},
              lineColor={158,66,200},
              fillColor={158,66,200},
              fillPattern=FillPattern.Solid,
              lineThickness=1),
       Text(extent = {{-160,110},{40,50}}, lineColor={172,72,218},   textString = "%name")}),
        Documentation(info="<html>
<p>
Connector with one flow signal of type Real.
</p>
</html>",
        revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));

    end ChemicalPort_b;

    partial model OnePort
      "Partial transfer of solute beween two ports without its accumulation"

      ChemicalPort_b            q_out
        annotation (Placement(transformation(extent={{90,-10},{110,10}})));
      ChemicalPort_a            q_in
        annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
    equation
      q_in.q + q_out.q = 0;
    end OnePort;

    partial model ConditionalHeatPort
      "Partial model to include a conditional HeatPort in order to describe the power loss via a thermal network"

      parameter Boolean useHeatPort = false "=true, if HeatPort is enabled"
      annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true), Dialog(group="External inputs/outputs"));
      parameter Types.Temperature T=310.15
        "Fixed device temperature if useHeatPort = false"
        annotation ( HideResult=true, Dialog(enable=not useHeatPort,tab="Temperature dependence"));

      Thermal.Interfaces.HeatPort_a       heatPort(T(start=T)=T_heatPort, Q_flow=-lossHeat) if useHeatPort
        annotation (Placement(transformation(extent={{-10,-10},{10,10}}),
            iconTransformation(extent={{-10,-10},{10,10}})));

      Types.Temperature T_heatPort "Temperature of HeatPort";
      Types.HeatFlowRate lossHeat "Loss heat leaving component via HeatPort";
    equation
      if not useHeatPort then
         T_heatPort = T;
      end if;

      annotation (        Documentation(revisions="<html>
<ul>
<li><i> February 17, 2009   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
<li><i> January 21, 2014   </i>
       by Marek Matejak<br> integrated to Physiolibrary<br>
       </li>
</ul>
</html>",     info="<html>
<p>
This partial model provides a conditional heating port for the connection to a thermal network.
</p>
<ul>
<li> If <b>useHeatPort</b> is set to <b>false</b> (default), no heat port is available, and the thermal
     loss power flows internally to the ground. In this case, the parameter <b>T</b> specifies
     the fixed device temperature (the default for T = 20<sup>o</sup>C).</li>
<li> If <b>useHeatPort</b> is set to <b>true</b>, a heat port is available.</li>
</ul>

<p>
If this model is used, the loss power has to be provided by an equation in the model which inherits from
ConditionalHeatingPort model (<b>lossPower = ...</b>). As device temperature
<b>T_heatPort</b> can be used to describe the influence of the device temperature
on the model behaviour.
</p>
</html>"));
    end ConditionalHeatPort;

    partial model ConditionalVolume
      "Chemical processes can be modeled with or without(normalized to 1 liter) variable solution volume"

      constant Types.Volume NormalVolume=0.001 "1 liter" annotation(Evaluate=true, HideResult=true);

      parameter Boolean useNormalizedVolume = true
        "Normalized volume of solution is 1 liter"
      annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

      Types.Volume volume "Solution volume"; //annotation(HideResult=useNormalizedVolume);

      Types.RealIO.VolumeInput solutionVolume=volume if not useNormalizedVolume
        "Volume of solution"                                                                         annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={-40,40})));
    equation
      if useNormalizedVolume then
        volume = NormalVolume;
      end if;

    end ConditionalVolume;

    partial model ConditionalSolutionFlow
      "Input of solution volumetric flow vs. parametric solution volumetric flow"

      parameter Boolean useSolutionFlowInput = false
        "=true, if solution flow input is used instead of parameter SolutionFlow"
      annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

      parameter Types.VolumeFlowRate SolutionFlow=0
        "Volumetric flow of solution if useSolutionFlowInput=false"
        annotation ( HideResult=not useSolutionFlowInput, Dialog(enable=not useSolutionFlowInput));

      Types.RealIO.VolumeFlowRateInput solutionFlow(start=SolutionFlow)=q if useSolutionFlowInput annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,40}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,70})));

      Types.VolumeFlowRate q "Current solution flow";
    equation
      if not useSolutionFlowInput then
        q = SolutionFlow;
      end if;

    end ConditionalSolutionFlow;

    partial model ConditionalSoluteFlow
      "Input of solute molar flow vs. parametric solute molar flow"

      parameter Boolean useSoluteFlowInput = false
        "=true, if solute flow input is used instead of parameter SoluteFlow"
      annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

      parameter Types.MolarFlowRate SoluteFlow=0
        "Volumetric flow of solute if useSoluteFlowInput=false"
        annotation (HideResult=not useSoluteFlowInput, Dialog(enable=not useSoluteFlowInput));

      Types.RealIO.MolarFlowRateInput soluteFlow(start=SoluteFlow)=q if   useSoluteFlowInput annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={40,40})));

      Types.MolarFlowRate q "Current solute flow";
    equation
      if not useSoluteFlowInput then
        q = SoluteFlow;
      end if;

    end ConditionalSoluteFlow;

    record SubstanceDefinition
      "Invariant properties of substance (molar weight, enthalpy, entropy, ...)"

     parameter String fullName=getInstanceName()
        "Full physiological name of substance";
     parameter String shortName=getInstanceName()
        "Short physiological name of substance";

     parameter Types.MolarMass mw "Molar weight in kg/mol or kDa";
     parameter Types.MolarEnergy dH=0 "Enthalpy";
     parameter Types.MolarEnergy dS=0 "Entropy";

     parameter Types.AmountOfSubstance molpIU=1
        "Pharmacological international unit conversion: mols per IU (or 1 if unknown)";
     parameter Types.AmountOfSubstance molpGU=1
        "Goldblatt unit conversion: mols per GU (or 1 if unknown)";

     parameter String storeUnit="mmol/l"
        "Default substance unit in files or databaseses";

     parameter Types.Utilities.UnitConversions.RealTypeRecord[:] unitConversions = cat(1,
        Types.Utilities.UnitConversions.GenerateSubstanceUnits("g",1e-3/mw),
        Types.Utilities.UnitConversions.GenerateSubstanceUnits("IU",molpIU),
        Types.Utilities.UnitConversions.GenerateSubstanceUnits("GU",molpGU));

    end SubstanceDefinition;
  end Interfaces;

  annotation (Documentation(revisions="<html>
<p>Licensed by Marek Matejak under the Modelica License 2</p>
<p>Copyright &copy; 2008-2014, Marek Matejak, Charles University in Prague.</p>
<p><br><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Physiolibrary.UsersGuide.ModelicaLicense2\">UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p>
</html>", info="<html>
<p>In physiology books, chapters about chemical substances are organized by their types. The main reason for this is that each substance in the human body is regulated in a different way. For example the regulation of sodium is different from the regulation of potassium, and from the regulation of glucose, and so on. This view leads to the idea of having separate models of each substance. The origin of different flows and regulations is the (cellular) membrane. Water and solutions can cross it in different directions at the same time. Crossings occur for different reasons: water is driven mostly by osmotic gradients, electrolytes are driven by charge to reach Donnan&apos;s equilibrium, and some solutes can even be actively transported against their concentration or electrical gradients. And all this is specifically driven from the higher levels by neural and hormonal responses.&nbsp; </p>
<p>In Physiolibrary flows and fluxes of solutes are supported mostly by the Chemical package. All parts inside this Chemical package use the connector ChemicalPort, which defines the molar concentration and molar flow/flux rate of one solute. This is the supporting infrastructure for modeling membrane diffusion, accumulations of substances, reversal chemical reactions, Henry&apos;s law of gas solubility, dilution with additional solvent flow, membrane reabsorption, chemical degradation and physiological clearance. </p>
</html>"));
end Chemical2;

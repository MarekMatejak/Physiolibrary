within Physiolibrary;
package Media
  extends Modelica.Icons.Package;

  package Blood "Blood"
    import Physiolibrary.Media.Substances.*;
    import Physiolibrary.Media.Substances.InitialValues.*;

    extends Media.Interfaces.PartialMedium(
      mediumName = "Blood",
      substanceNames={"H2O_E","O2","CO2","CO","Hb","MetHb","HbF","Alb","Glb","PO4","DPG",
        "Glucose","Lactate","Urea","AminoAcids","Lipids","KetoAcids",
        "SID",
        "Epinephrine", "Norepinephrine","Vasopressin",
        "Insulin","Glucagon","Thyrotropin","Thyroxine","Leptin",
        "Desglymidodrine","AlphaBlockers","BetaBlockers",
        "AnesthesiaVascularConductance",
        "Angiotensin2","Renin","Aldosterone",
        "H2O_P"},
      reference_X=X(),
      SubstanceFlowNominal=X() ./ Constants.TimeScale,
      ThermoStates=Modelica.Media.Interfaces.Choices.IndependentVariables.phX,
      reducedX=false,
      singleState=true,
      reference_T=310.15,
      reference_p=101325,
      SpecificEnthalpy(start=0, nominal=1e3),
      Density(start=1e3, nominal=1e3),
      AbsolutePressure(start=1.0e5, nominal=1.0e5),
      Temperature(
        min=273.15,
        max=320.15,
        start=310.15,
        nominal=310.15));

    constant Types.MassFraction ArterialDefault[nS]=X(tO2=D_Arterial_O2,tCO2=D_Arterial_CO2);

    constant Types.MassFraction VenousDefault[nS]=X(tO2=D_Venous_O2,tCO2=D_Venous_CO2);


  public
    redeclare connector extends SubstancesPort
         Chemical.Interfaces.SubstancePort_a CO2 "Free carbon dioxide molecule";
         Chemical.Interfaces.SubstancePort_a O2 "Free oxygen molecule";
         Chemical.Interfaces.SubstancePort_a CO "Free carbon monoxide moelcule";
         Chemical.Interfaces.SubstancePort_a HCO3 "Free bicarbonate molecule";
         Chemical.Interfaces.SubstancePort_a H3O "Free hydronium molecule";
         Chemical.Interfaces.SubstancePort_a H "Free protons";
         Chemical.Interfaces.SubstancePort_a H2O "Free water molecule (in pure water is only cca 1 mol/kg free water molecules, other cca 54.5 mols are bounded together by hydrogen bonds)";
    end SubstancesPort;

    redeclare replaceable model extends SubstancesDecomposition "Just because Modelica in today version cannot work properly with nested connectors"
      Chemical.Interfaces.SubstancePort_a O2 annotation (Placement(transformation(extent={{90,50},{110,70}})));
      Chemical.Interfaces.SubstancePort_a CO2 annotation (Placement(transformation(extent={{90,90},{110,110}})));
      Chemical.Interfaces.SubstancePort_a CO annotation (Placement(transformation(extent={{90,10},{110,30}})));
      Chemical.Interfaces.SubstancePort_a HCO3 annotation (Placement(transformation(extent={{-10,90},{10,110}})));
      Chemical.Interfaces.SubstancePort_a H3O annotation (Placement(transformation(extent={{-10,-70},{10,-50}})));
      Chemical.Interfaces.SubstancePort_a H annotation (Placement(transformation(extent={{90,-70},{110,-50}}), iconTransformation(extent={{90,-70},{110,-50}})));
      Chemical.Interfaces.SubstancePort_a H2O annotation (Placement(transformation(extent={{90,-110},{110,-90}})));
    equation
      connect(O2, substances.O2) annotation (Line(points={{100,60},{-72,60},{-72,0},{-100,0}},      color={158,66,200}));
      connect(CO2, substances.CO2) annotation (Line(points={{100,100},{22,100},{22,80},{-76,80},{-76,0},{-100,0},{-100,0}},     color={158,66,200}));
      connect(CO, substances.CO) annotation (Line(points={{100,20},{-70,20},{-70,0},{-100,0}},      color={158,66,200}));
      connect(HCO3, substances.HCO3) annotation (Line(points={{0,100},{-82,100},{-82,0},{-100,0}},      color={158,66,200}));
      connect(H3O, substances.H3O) annotation (Line(points={{0,-60},{-78,-60},{-78,0},{-100,0}},      color={158,66,200}));
      connect(H, substances.H) annotation (Line(points={{100,-60},{88,-60},{88,-46},{-76,-46},{-76,0},{-100,0}},      color={158,66,200}));
      connect(H2O, substances.H2O) annotation (Line(points={{100,-100},{-82,-100},{-82,0},{-100,0}},      color={158,66,200}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
    end SubstancesDecomposition;

    redeclare replaceable record extends ThermodynamicState
      "A selection of variables that uniquely defines the thermodynamic state"
      extends Modelica.Icons.Record;
      AbsolutePressure p "Absolute pressure of medium";
      SpecificEnthalpy h "Specific enthalpy";
      MassFraction X[nS] "Mass fractions of substances";
      Types.ElectricPotential v "Electric potential of the substance";
      Types.MoleFraction I "Ionic strengh (mole fraction based)";
      annotation (Documentation(info="<html>
<p>Thermodynamic state of blood is represented by pressure, temperature and base substances composition.</p>
</html>"));
    end ThermodynamicState;

    package stateOfMatter = Chemical.Interfaces.Incompressible
      "Substances model to translate data into substance properties";

    redeclare replaceable model extends ChemicalSolution
      "Free chemical substances"

      Real I = 0 "mole-fraction-based ionic strength";
      ThermodynamicState state;
      BloodGases bloodGases(
        p=p,
        T=T,
        state=state);
      Modelica.Units.SI.MoleFraction aO2;
      Modelica.Units.SI.MoleFraction aCO2;
      Modelica.Units.SI.MoleFraction aHCO3;
      Modelica.Units.SI.MoleFraction aCO;
      Modelica.Units.SI.MoleFraction aH_plus;
      Modelica.Units.SI.ChemicalPotential uO2;
      Modelica.Units.SI.ChemicalPotential uCO2;
      Modelica.Units.SI.ChemicalPotential uHCO3;
      Modelica.Units.SI.ChemicalPotential uCO;
      Modelica.Units.SI.ChemicalPotential uH_plus;
      Modelica.Units.SI.MolarEnthalpy hO2;
      Modelica.Units.SI.MolarEnthalpy hCO2;
      Modelica.Units.SI.MolarEnthalpy hHCO3;
      Modelica.Units.SI.MolarEnthalpy hCO;
      Modelica.Units.SI.MolarEnthalpy hH_plus;

      Modelica.Units.SI.MolarVolume molarVolume;

    public
         Real water_S, water_H, water_G, water_G0, water_H0, u_water;

        Types.Fraction pct "Plasmacrit";
        Real fH2O_P "Amount of free H2O particles in 1 kg of blood plasma [mol/kg]";
        Real x_P "Amount of free particles in 1 kg of blood plasma [mol/kg]";


    equation


      v=0 "electric potential is not used without external flows of charge";

      state = setState_phX(p, h, X);

      T = temperature(state);

      aO2 = bloodGases.pO2/p;
      aCO2 = bloodGases.pCO2/p;
      aCO = bloodGases.pCO/p;
      aH_plus = 10^(-bloodGases.pH);
      aHCO3 = bloodGases.cHCO3 / molarVolume;

      molarVolume = 0.001 "0.001 L/mmol";

      uO2 = Modelica.Constants.R*T*log(aO2) +
        Chemical.Interfaces.IdealGas.electroChemicalPotentialPure(
          Substances.O2_g,
          T,
          p,
          v,
          I);
      uCO2 = Modelica.Constants.R*T*log(aCO2) +
        Chemical.Interfaces.IdealGas.electroChemicalPotentialPure(
          Substances.CO2_g,
          T,
          p,
          v,
          I);
      uHCO3 = Modelica.Constants.R*T*log(aHCO3) +
        Chemical.Interfaces.IdealGas.electroChemicalPotentialPure(
          Substances.HCO3,
          T,
          p,
          v,
          I);

      uCO = Modelica.Constants.R*T*log(aCO) +
        Chemical.Interfaces.IdealGas.electroChemicalPotentialPure(
          Substances.CO_g,
          T,
          p,
          v,
          I);
      uH_plus = Modelica.Constants.R*T*log(aH_plus) +
        Chemical.Interfaces.Incompressible.electroChemicalPotentialPure(
          Substances.H,
          T,
          p,
          v,
          I);

      hO2 = Chemical.Interfaces.IdealGas.molarEnthalpy(
          Substances.O2_g,
          T,
          p,
          v,
          I);
      hCO2 = Chemical.Interfaces.IdealGas.molarEnthalpy(
          Substances.CO2_g,
          T,
          p,
          v,
          I);
      hHCO3 = Chemical.Interfaces.IdealGas.molarEnthalpy(
          Substances.HCO3,
          T,
          p,
          v,
          I);
      hCO = Chemical.Interfaces.IdealGas.molarEnthalpy(
          Substances.CO,
          T,
          p,
          v,
          I);
      hH_plus = Chemical.Interfaces.Incompressible.molarEnthalpy(
          Substances.H,
          T,
          p,
          v,
          I);

      water_S=Chemical.Interfaces.Incompressible.molarEntropyPure(
          Substances.Water, T, p, v, I);
      water_H=Chemical.Interfaces.Incompressible.molarEnthalpyElectroneutral(
          Substances.Water, T, p, v, I);
      water_G=Chemical.Interfaces.Incompressible.electroChemicalPotentialPure(
          Substances.Water, T, p, v, I);

      water_H0=Chemical.Interfaces.Incompressible.molarEnthalpy(
          Substances.Water, 310.15, 101325, 0, 0);
      water_G0=Chemical.Interfaces.Incompressible.electroChemicalPotentialPure(
          Substances.Water, 310.15, 101325, 0, 0);

      pct = plasmacrit(state);

      fH2O_P = state.X[i("H2O_P")]/pct  "Amount of free H2O particles in 1 kg of blood plasma [mol/kg]";
      x_P =
       fH2O_P +
       (state.X[i("CO2")]/CO2.MolarWeight +
       state.X[i("Alb")]/Constants.MM_Alb +
       state.X[i("Glb")]/Constants.MM_Glb +
       state.X[i("Glucose")]/Constants.MM_Glucose +
       state.X[i("PO4")]/PO4.MolarWeight +
       state.X[i("Lactate")]/Constants.MM_Lactate +
       state.X[i("Urea")]/Constants.MM_Urea +
       state.X[i("AminoAcids")]/Constants.MM_AminoAcids +
       state.X[i("Lipids")]/Constants.MM_Lipids +
       state.X[i("KetoAcids")]/Constants.MM_KetoAcids)/pct "Amount of free particles in 1 kg of blood plasma [mol/kg]";

      u_water = Modelica.Constants.R*T*log(fH2O_P/x_P)  +  water_G;

     enthalpyFromSubstances =
       substances.O2.q * actualStream(substances.O2.h_outflow) +
       substances.CO2.q * actualStream(substances.CO2.h_outflow) +
       substances.CO.q * actualStream(substances.CO.h_outflow) +
       substances.HCO3.q * actualStream(substances.HCO3.h_outflow) +
       substances.H.q * actualStream(substances.H.h_outflow) +
       substances.H3O.q * actualStream(substances.H3O.h_outflow) +
       substances.H2O.q * actualStream(substances.H2O.h_outflow)
       "enthalpy from substances";

      massFlows = {
          0,substances.O2.q * Substances.O2.MolarWeight,
          substances.CO2.q * Substances.CO2.MolarWeight  + substances.HCO3.q .* Substances.CO2.MolarWeight,
          substances.CO.q * Substances.CO.MolarWeight,
          0,0,0,0,0,0,0,
          0,0,0,0,0,0,
          0,
          0,0,0,
          0,0,0,0,0,
          0,0,0,
          0,
          0,0,0,
          substances.H2O.q * Substances.Water.MolarWeight};

      substances.O2.u = uO2;
      substances.CO2.u = uCO2;
      substances.CO.u = uCO;
      substances.HCO3.u = uHCO3;
      substances.H3O.u = uH_plus;
      substances.H.u = uH_plus;
      substances.H2O.u = u_water;

      substances.O2.h_outflow = hO2;
      substances.CO2.h_outflow = hCO2;
      substances.CO.h_outflow = hCO;
      substances.HCO3.h_outflow = hHCO3;
      substances.H3O.h_outflow = hH_plus;
      substances.H.h_outflow = hH_plus;
      substances.H2O.h_outflow = water_H;

      annotation (Documentation(info="<html>
<p>Chemical equilibrium is represented by expression of electrochemical potentials of base blood substances.</p>
</html>"));
    end ChemicalSolution;

    replaceable model BloodGases "Hydrogen Ion, Carbon Dioxide, and Oxygen in the Blood"
      input Physiolibrary.Media.Blood.ThermodynamicState state "blood";
      input Modelica.Units.SI.Pressure p=101325 "Pressure";
      input Modelica.Units.SI.Temperature T=310.15 "Temperature";
      input Modelica.Units.SI.ElectricPotential electricPotential=0 "Electric potential";
      input Modelica.Units.SI.MoleFraction moleFractionBasedIonicStrength=0
        "Mole-fraction based ionic strength";
      output Modelica.Units.SI.Pressure pO2(start=101325*87/760)
        "Oxygen partial pressure";
      output Modelica.Units.SI.Pressure pCO2(start=101325*40/760)
        "Carbon dioxide partial pressure";
      output Modelica.Units.SI.Pressure pCO(start=1e-5)
        "Carbon monoxide partial pressure";
      output Physiolibrary.Types.pH pH
        "Blood plasma acidity";
      // protected
      Physiolibrary.Types.VolumeFraction Hct=hematocrit(state) "haematocrit";
      Types.Concentration _tO2=tO2(state) "oxygen content per volume of blood";
      Types.Concentration _tCO2=tCO2(state)
        "carbon dioxide content per volume of blood";
      Types.Concentration _tCO=tCO(state)
        "carbon monoxide content per volume of blood";
      Types.Concentration _tHb=tHb(state)
        "hemoglobin content per volume of blood";
      Types.MoleFraction _FMetHb=FMetHb(state) "fraction of methemoglobin";
      Types.MoleFraction _FHbF=FHbF(state) "fraction of foetalhemoglobin";
      Types.Concentration _ctHb_ery=ctHb_ery(state)
        "hemoglobin concentration in red cells";
      Types.Concentration _tAlb=tAlb(state)
        "albumin concentration in blood plasma";
      Types.MassConcentration _tGlb=tGlb(state)
        "globulin concentration in blood plasma";
      Types.Concentration _tPO4=tPO4(state)
        "inorganic phosphates concentration in blood plasma";
      Types.Concentration _cDPG=cDPG(state) "DPG concentration in blood plasma";
      Types.Concentration _SID=SID(state) "strong ion difference of blood";

      constant Physiolibrary.Types.Temperature T0=273.15 + 37 "normal temperature";
      constant Physiolibrary.Types.pH pH0=7.4 "normal pH";
      constant Physiolibrary.Types.pH pH_ery0=7.19 "normal pH in erythrocyte";
      constant Physiolibrary.Types.Pressure pCO20=(40/760)*101325
        "normal CO2 partial pressure";

      Physiolibrary.Types.Concentration NSIDP;
      Physiolibrary.Types.Concentration NSIDE;
      Physiolibrary.Types.Concentration NSID;
      Physiolibrary.Types.Concentration BEox;
      Physiolibrary.Types.Concentration cdCO2;

      Physiolibrary.Types.pH pH_ery;

      Physiolibrary.Types.GasSolubilityPa aCO2N=0.00023
        "solubility of CO2 in blood plasma at 37 degC";
      Physiolibrary.Types.GasSolubilityPa aCO2=0.00023*10^(-0.0092*(T - 310.15))
        "solubility of CO2 in blood plasma";
      Physiolibrary.Types.GasSolubilityPa aCO2_ery(displayUnit="mmol/l/mmHg") = 0.000195
        "solubility 0.23 (mmol/l)/kPa at 25degC";
      Physiolibrary.Types.GasSolubilityPa aO2=exp(log(0.0105) + (-0.0115*(T - T0)) + 0.5*
          0.00042*(T - T0)^2)/1000 "oxygen solubility in blood";
      Physiolibrary.Types.GasSolubilityPa aCO=(0.00099/0.0013)*aO2
        "carbon monoxide solubility in blood";

      Real pK=6.1 + (-0.0026)*(T - 310.15) "Henderson-Hasselbalch";
      Real pK_ery=6.125 - log10(1 + 10^(pH_ery - 7.84 - 0.06*sO2));

      parameter Real pKa1=2.1 "HPO4^2- dissociation";
      parameter Real pKa2=6.8 "H2PO4^- dissociation";
      parameter Real pKa3=12.7 "H3PO4 dissociation";

      parameter Real betaOxyHb=3.1 "Buffer value for oxygenated Hb without CO2";
      parameter Real pIo=7.13 "Isoelectric pH for oxygenated Hb without CO2";

      parameter Real pKzD=7.73 "Coefficient pKa for NH3+ end of deoxygenated hemoglobin chain";
      parameter Real pKzO=7.25 "Coefficient pKa for NH3+ end of oxygenated hemoglobin chain";
      parameter Real pKcD=7.54
        "10^(pH-pKcR) is the dissociation constatnt for HbNH2 + CO2 <-> HbNHCOO- + H+ ";
      parameter Real pKcO=8.35
        "10^(pH-pKcO) is the dissociation constatnt for O2HbNH2 + CO2 <-> O2HbNHCOO- + H+ ";
      parameter Real pKhD=7.52
        "10^(pH-pKhD) is the dissociation constatnt for HbAH <-> HbA- + H+ ";
      parameter Real pKhO=6.89
        "10^(pH-pKhO) is the dissociation constatnt for O2HbAH <-> O2HbA- + H+ ";

      Physiolibrary.Types.Concentration cdCO2N;
      Physiolibrary.Types.Fraction sCO2N;
      Physiolibrary.Types.Fraction fzcON;

      Physiolibrary.Types.Concentration beta;
      Physiolibrary.Types.Concentration cHCO3(start=24.524);

      Physiolibrary.Types.Fraction sO2CO(start=0.962774);
      Physiolibrary.Types.Fraction sCO(start=1.8089495e-07);
      Physiolibrary.Types.Fraction sO2;
      Physiolibrary.Types.Fraction FCOHb;
      Physiolibrary.Types.Concentration ceHb "effective hemoglobin";

      Physiolibrary.Types.Concentration tCO2_P(displayUnit="mmol/l");
      Physiolibrary.Types.Concentration tCO2_ery(displayUnit="mmol/l");

    equation
      cdCO2N = aCO2N*pCO20 "free disolved CO2 concentration at pCO2=40mmHg and T=37degC";

      NSIDP =-(-(_tAlb*66.463)*(0.123*pH0 - 0.631) - _tGlb*(2.5/28) - _tPO4*(10^(
        pKa2 - pH0) + 2 + 3*10^(pH0 - pKa3))/(10^(pKa1 + pKa2 - 2*pH0) + 10^(pKa2 -
        pH0) + 1 + 10^(pH0 - pKa3)) - cdCO2N*10^(pH0 - pK))
        "strong ion difference of blood plasma at pH=7.4, pCO2=40mmHg, T=37degC and sO2=1";

      fzcON = 1/(1 + 10^(pKzO - pH_ery0) + cdCO2N*10^(pH_ery0 - pKcO))
        "fraction of hemoglobin units with HN2 form of amino-terminus at pH=7.4 (pH_ery=7.19), pCO2=40mmHg, T=37degC and sO2=1";
      sCO2N = 10^(pH_ery0 - pKcO)*fzcON*cdCO2N
        "CO2 saturation of hemoglobin amino-termini at pH=7.4 (pH_ery=7.19), pCO2=40mmHg, T=37degC and sO2=1";
      NSIDE =-(-cdCO2N*10^(pH_ery0 - pK) - _ctHb_ery*(betaOxyHb*(pH_ery0 - pIo) +
        sCO2N*(1 + 2*10^(pKzO - pH_ery0))/(1 + 10^(pKzO - pH_ery0)) + 0.82))
        "strong ion difference of red cells at pH=7.4 (pH_ery=7.19), pCO2=40mmHg, T=37degC and sO2=1";

      NSID = Hct*NSIDE + (1 - Hct)*NSIDP
        "strong ion difference of blood at pH=7.4 (pH_ery=7.19), pCO2=40mmHg, T=37degC and sO2=1";

      BEox =NSID - _SID "base excess of oxygenated blood";

      beta =2.3*_tHb + 8*_tAlb + 0.075*_tGlb + 0.309*_tPO4
                                                        "buffer value of blood";

      pH =pH0 + (1/beta)*(((BEox + 0.3*(1 - sO2CO))/(1 - _tHb/43)) - (cHCO3 - 24.5))
        "Van Slyke (simplified electroneutrality equation)";
      pH_ery = 7.19 + 0.77*(pH - 7.4) + 0.035*(1 - sO2);

      sO2CO =hemoglobinDissociationCurve(
          pH,
          pO2,
          pCO2,
          pCO,
          T,
          _tHb,
          _cDPG,
          _FMetHb,
          _FHbF);

      sCO*(pO2 + 218*pCO) = 218*sO2CO*(pCO);
      FCOHb =sCO*(1 - _FMetHb);
      _tCO = aCO*pCO + FCOHb*_tHb;

      ceHb =_tHb*(1 - FCOHb - _FMetHb);
      sO2 =(sO2CO*(_tHb*(1 - _FMetHb)) - _tHb*FCOHb)/ceHb;
      _tO2 = aO2*pO2 + ceHb*sO2;

      cdCO2 = aCO2*pCO2;
      cdCO2*10^(pH - pK) = cHCO3;

      tCO2_P = cHCO3 + cdCO2;
      tCO2_ery = aCO2_ery*pCO2*(1 + 10^(pH_ery - pK_ery));
      _tCO2 = tCO2_ery*Hct + tCO2_P*(1 - Hct);

      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)),
        Documentation(info="<html>
<p><a href=\"https://www.siggaard-andersen.dk/\">Hydrogen Ion, Carbon Dioxide, and Oxygen in the Blood (siggaard-andersen.dk)</a></p>
<p><a href=\"https://www.creativeconnections.cz/medsoft/2013/Medsoft_2013_Matejak.pdf\">Medsoft_2013_Matejak.pdf (creativeconnections.cz)</a></p>
</html>"));
    end BloodGases;

    redeclare model extends BaseProperties(final standardOrderComponents=true)
      "Base properties of medium"

      InputElectricPotential v "electric potential";
      InputMassFraction I "ionic strength";

      // Local connector definition, used for equation balancing check
      connector InputElectricPotential = input Types.ElectricPotential
        "Electric potential as input signal connector";

    equation
      d = 1057;
      h = specificEnthalpies_TpvI(T,p,v,I)*X;
      u = h - p/d;
      MM = 1;
      R_s = 8.3144;
      state.p = p;
      state.h = h;
      state.X = X;
      state.v = v;
      state.I = I;
      annotation (Documentation(info="<html>
<p>Simplification of blood:</p>
<p>Constant density and constant heat capacity</p>
</html>"));
    end BaseProperties;

    redeclare function extends specificEnthalpies_TpvI
    algorithm
      specificEnthalpy:={0,
         Chemical.Interfaces.IdealGas.specificEnthalpy(Substances.O2,T,p,v,I),
         Chemical.Interfaces.IdealGas.specificEnthalpy(Substances.CO2,T,p,v,I),
         Chemical.Interfaces.IdealGas.specificEnthalpy(Substances.CO,T,p,v,I),
         0,0,0,0,0,0,0,0,0,0,0,0,0,0,
         0,0,0,
         0,0,0,0,0,
         0,0,0,
         0,
         0,0,0,
         Chemical.Interfaces.Incompressible.specificEnthalpy(Substances.Water,T,p,v,I)};
    end specificEnthalpies_TpvI;




    replaceable function hemoglobinDissociationCurve "Hemoglobin dissociation curve as saturation of O2 and CO2 on hemoglobin (excluded methemoglobin)"
      input Real pH "acidity";
      input Real pO2 "oxygen partial pressure";
      input Real pCO2(min=Modelica.Constants.small) "carbon dioxide partial pressure";
      input Real pCO "carbon monoxide partial pressure";
      input Real T "temperature";
      input Real tHb "total hemoglobin";
      input Real cDPG "diphosphoglicerate";
      input Real FMetHb "methemoglobin fraction";
      input Real FHbF "foethel hemoglobin fraction";
      output Real sO2CO "oxygen and carbon monoxide saturation";
    protected
      constant Physiolibrary.Types.Temperature T0=273.15 + 37 "normal temperature";
      constant Physiolibrary.Types.pH pH0=7.4 "normal pH";
      constant Physiolibrary.Types.pH pH_ery0=7.19 "normal pH in erythrocyte";
      constant Physiolibrary.Types.Pressure pCO20=(40/760)*101325
        "normal CO2 partial pressure";

      parameter Physiolibrary.Types.Concentration cDPG0=5 "normal DPG,used by a";
      parameter Real dadcDPG0=0.3 "used by a";
      parameter Real dadcDPGxHbF=-0.1 "or perhabs -0.125";
      parameter Real dadpH=-0.88 "used by a";
      parameter Real dadlnpCO2=0.048 "used by a";
      parameter Real dadxMetHb=-0.7 "used by a";
      parameter Real dadxHbF=-0.25 "used by a";

      Real aO2;
      Real cdO2;
      Physiolibrary.Types.Fraction sO2;
      Physiolibrary.Types.Pressure pO2CO(min=Modelica.Constants.small);
      Physiolibrary.Types.Concentration cO2Hb;
      Physiolibrary.Types.Fraction sCO;
      Physiolibrary.Types.Concentration ceHb;
      Real a;
      Real k;
      Real x;
      Real y;
      Real h;
      Physiolibrary.Types.Fraction FCOHb;
    algorithm

      a := dadpH*(pH - pH0) + dadlnpCO2*log(max(1e-15 + 1e-22*pCO2, pCO2/pCO20)) +
        dadxMetHb*FMetHb + (dadcDPG0 + dadcDPGxHbF*FHbF)*(cDPG/cDPG0 - 1);
      k := 0.5342857;
      h := 3.5 + a;

      pO2CO := pO2 + 218*pCO;
      x := log(pO2CO/7000) - a - 0.055*(T - T0);
      y := 1.8747 + x + h*tanh(k*x);

      sO2CO := exp(y)/(1 + exp(y));

      annotation (
      derivative = hemoglobinDissociationCurve_der,
      Documentation(info="<html>
<p><span style=\"font-size: 8pt;\">Hemoglobin-Oxygen dissociation relation based on OSA (Oxygen Status Algorithm) by Siggaard Andersen.</span></p>
<p><a href=\"https://www.siggaard-andersen.dk/\">Hydrogen Ion, Carbon Dioxide, and Oxygen in the Blood (siggaard-andersen.dk)</a></p>
</html>"));
    end hemoglobinDissociationCurve;

    replaceable function hemoglobinDissociationCurve_der "Derivative of Hemoglobin dissociation curve as saturation of O2 and CO2 on hemoglobin (excluded methemoglobin)"
      input Real pH "acidity";
      input Real pO2 "oxygen partial pressure";
      input Real pCO2 "carbon dioxide partial pressure";
      input Real pCO "carbon monoxide partial pressure";
      input Real T "temperature";
      input Real tHb "total hemoglobin";
      input Real cDPG "diphosphoglicerate";
      input Real FMetHb "methemoglobin fraction";
      input Real FHbF "foethel hemoglobin fraction";
      input Real der_pH "derivative of acidity";
      input Real der_pO2 "derivative of oxygen partial pressure";
      input Real der_pCO2 "derivative of carbon dioxide partial pressure";
      input Real der_pCO "derivative of carbon monoxide partial pressure";
      input Real der_T "derivative of temperature";
      input Real der_tHb "derivative of total hemoglobin";
      input Real der_cDPG "derivative of diphosphoglicerate";
      input Real der_FMetHb "derivative of methemoglobin fraction";
      input Real der_FHbF "derivative of foethel hemoglobin fraction";
      output Real der_sO2CO "derivative of oxygen and carbon monoxide saturation";
    protected
      constant Physiolibrary.Types.Temperature T0=273.15 + 37 "normal temperature";
      constant Physiolibrary.Types.pH pH0=7.4 "normal pH";
      constant Physiolibrary.Types.pH pH_ery0=7.19 "normal pH in erythrocyte";
      constant Physiolibrary.Types.Pressure pCO20=(40/760)*101325
        "normal CO2 partial pressure";

      parameter Physiolibrary.Types.Concentration cDPG0=5 "normal DPG,used by a";
      parameter Real dadcDPG0=0.3 "used by a";
      parameter Real dadcDPGxHbF=-0.1 "or perhabs -0.125";
      parameter Real dadpH=-0.88 "used by a";
      parameter Real dadlnpCO2=0.048 "used by a";
      parameter Real dadxMetHb=-0.7 "used by a";
      parameter Real dadxHbF=-0.25 "used by a";

      Real aO2;
      Real cdO2;
      Physiolibrary.Types.Fraction sO2;
      Physiolibrary.Types.Pressure pO2CO;
      Physiolibrary.Types.Concentration cO2Hb;
      Physiolibrary.Types.Fraction sCO;
      Physiolibrary.Types.Concentration ceHb;
      Real a, a_der;
      Real k;
      Real x,x_der;
      Real y,y_der;
      Real h;
      Physiolibrary.Types.Fraction FCOHb;
    algorithm

      a := dadpH*(pH - pH0) + dadlnpCO2*log(max(1e-15 + 1e-22*pCO2, pCO2/pCO20)) +
        dadxMetHb*FMetHb + (dadcDPG0 + dadcDPGxHbF*FHbF)*(cDPG/cDPG0 - 1);

      a_der := dadpH*der_pH + dadlnpCO2*(der_pCO2/pCO20)/(max(1e-15 + 1e-22*pCO2, pCO2/pCO20)) +
        dadxMetHb*der_FMetHb +
        (dadcDPGxHbF*der_FHbF)*(cDPG/cDPG0 - 1)+(dadcDPG0 + dadcDPGxHbF*FHbF)*(der_cDPG/cDPG0);

      k := 0.5342857;
      h := 3.5 + a;

      pO2CO := pO2 + 218*pCO;
      x := log(pO2CO/7000) - a - 0.055*(T - T0);

      x_der := (der_pO2 + 218*der_pCO)/(pO2CO) - a_der - 0.055*der_T;
      y := 1.8747 + x + h*tanh(k*x);
      y_der := x_der + a_der*tanh(k*x) + h*(k*4*x_der/((exp(k*x)+exp(-k*x))^2));

      der_sO2CO := y_der*exp(y)/((1 + exp(y))^2);

      annotation (Documentation(info="<html>
<p><span style=\"font-size: 8pt;\">Hemoglobin-Oxygen dissociation relation based on OSA (Oxygen Status Algorithm) by Siggaard Andersen.</span></p>
<p><a href=\"https://www.siggaard-andersen.dk/\">Hydrogen Ion, Carbon Dioxide, and Oxygen in the Blood (siggaard-andersen.dk)</a></p>
</html>"));
    end hemoglobinDissociationCurve_der;

    redeclare replaceable function extends setState_pTX "Thermodynamic state"
      input Types.ElectricPotential v=0 "electric potential";
      input MassFraction I=0 "ionic strength";
    algorithm
      state.h := specificEnthalpies_TpvI(T,p,v,I)*X;
      state.p := p;
      state.X := X;
      state.v := v;
      state.I := I;
      annotation (Documentation(info="<html>
<p>Set thermodynamic state</p>
</html>"));
    end setState_pTX;

    redeclare replaceable function extends setState_phX "Thermodynamic state"
      input Types.ElectricPotential v=0 "electric potential";
      input MassFraction I=0 "ionic strength";
    algorithm
      state.p := p;
      state.h := h;
      state.X := X;
      state.v := v;
      state.I := I;
      annotation (Documentation(info="<html>
<p>Set thermodynamic state based on constant heat capacity</p>
</html>"));
    end setState_phX;

    redeclare replaceable function extends density "Density"
    algorithm
      d := 1057;
      annotation (Documentation(info="<html>
<p>constant density</p>
</html>"));
    end density;

    redeclare replaceable function extends specificEnthalpy "Specific enthalpy"
    algorithm
      h := state.h;
      annotation (Documentation(info="<html>
<p>Heat energy from temperature based on constant heat capacity</p>
</html>"));
    end specificEnthalpy;

    redeclare replaceable function extends specificHeatCapacityCp "Specific heat capacityReturn specific heat capacity at constant pressure"
    algorithm
      cp := 3490;
      annotation (Documentation(info="<html>
<p>Constant specific heat capacity</p>
</html>"));
    end specificHeatCapacityCp;

    redeclare replaceable function extends temperature "Temperature"
    algorithm
      T := Modelica.Math.Nonlinear.solveOneNonlinearEquation(function temperatureError(p=state.p, X=state.X,  h=state.h), 273.15, 330,     1e-2);
      annotation (Documentation(info="<html>
<p>Temperature</p>
</html>"));
    end temperature;

    redeclare replaceable function extends pressure "Pressure"
    algorithm
      p := state.p;
      annotation (Documentation(info="<html>
<p>Pressure</p>
</html>"));
    end pressure;

    function hematocrit "Blood hematocrit"
      extends GetFraction;
    protected
      Types.MassFraction XP "Mass fraction of blood plasma in blood", XE "Mass fraction of red cells in blood";
    algorithm
      XP := state.X[i("H2O_P")] + state.X[i("CO2")] + state.X[i("Alb")] + state.X[i("Glb")] + state.X[i("Glucose")] +
       state.X[i("PO4")] + state.X[i("Lactate")] + state.X[i("Urea")] + state.X[i("AminoAcids")] + state.X[i("Lipids")] + state.X[i("KetoAcids")];
      XE := state.X[i("H2O_E")] + state.X[i("Hb")] + state.X[i("DPG")];
      F := XE/ (XE + XP);
    end hematocrit;

    function plasmacrit "Blood plasmacrit"
      extends GetFraction;
    algorithm
      F := 1 - hematocrit(state);
    end plasmacrit;


    function tO2 "Total oxygen in blood"
      extends GetConcentration;
    algorithm
      C := density(state) * state.X[i("O2")] / O2.MolarWeight;
    end tO2;

    function sO2 "Oxygen saturation"
      extends GetFraction;
    algorithm
      F := (state.X[i("O2")] / O2.MolarWeight) / (state.X[i("Hb")] / Constants.MM_Hb);
    end sO2;

    function tCO2 "Total carbon dioxide in blood"
      extends GetConcentration;
    algorithm
      C := density(state) * state.X[i("CO2")] / CO2.MolarWeight;
    end tCO2;

    function tCO "Total carbon monoxide in blood"
      extends GetConcentration;
    algorithm
      C := density(state) * state.X[i("CO")] / CO.MolarWeight;
    end tCO;

    function tHb "Total hemoglobine in blood"
      extends GetConcentration;
    algorithm
      C := density(state) * state.X[i("Hb")] / Constants.MM_Hb;
    end tHb;

    function FMetHb "Methemoglobine fraction"
      extends GetFraction;
    algorithm
      F := (state.X[i("MetHb")] / state.X[i("Hb")]);
    end FMetHb;

    function FHbF "Foetalhemoglobine fraction"
      extends GetFraction;
    algorithm
      F := (state.X[i("HbF")] / state.X[i("Hb")]);
    end FHbF;

    function ctHb_ery "Total hemoglobine in erythrocytes"
      extends GetConcentration;
    algorithm
      C := tHb(state) / hematocrit(state);
    end ctHb_ery;

    function tAlb "Total albumine in blood plasma"
      extends GetConcentration;
    algorithm
      C := (density(state) * state.X[i("Alb")] / Constants.MM_Alb) / plasmacrit(state);
    end tAlb;

    function tGlb "Total globulin in blood plasma [g/L]"
      extends GetMassConcentration;
    algorithm
      R := (density(state) * state.X[i("Glb")])  / plasmacrit(state);
    end tGlb;



    function tPO4 "Total anorganic phosphates in blood plasma"
      extends GetConcentration;
    algorithm
      C := (density(state) * state.X[i("PO4")] / PO4.MolarWeight) / plasmacrit(state);
    end tPO4;

    function cDPG "Total diphosphoglycerate in erythrocytes"
      extends GetConcentration;
    algorithm
      C := (density(state) * state.X[i("DPG")] / Constants.MM_DPG) / hematocrit(state);
    end cDPG;

    function SID "Strong ion difference of blood"
      extends GetConcentration;
    algorithm
      C := density(state) * state.X[i("SID")];
    end SID;

    function glucose "Total glucose in blood plasma"
      extends GetConcentration;
    algorithm
      C := (density(state) * state.X[i("Glucose")] / Constants.MM_Glucose) / plasmacrit(state);
    end glucose;

    function lactate "Total lactate in blood plasma"
      extends GetConcentration;
    algorithm
      C := (density(state) * state.X[i("Lactate")] / Constants.MM_Lactate) / plasmacrit(state);
    end lactate;

    function urea "Total urea in blood plasma"
      extends GetConcentration;
    algorithm
      C := (density(state) * state.X[i("Urea")] / Constants.MM_Urea) / plasmacrit(state);
    end urea;

    function aminoAcids "Total amino acids in blood plasma"
      extends GetConcentration;
    algorithm
      C := (density(state) * state.X[i("AminoAcids")] / Constants.MM_AminoAcids) / plasmacrit(state);
    end aminoAcids;

    function lipids "Total faty acids in blood plasma"
      extends GetConcentration;
    algorithm
      C := (density(state) * state.X[i("Lipids")] / Constants.MM_Lipids) / plasmacrit(state);
    end lipids;

    function ketoAcids "Total ketoacids in blood plasma"
      extends GetConcentration;
    algorithm
      C := (density(state) * state.X[i("KetoAcids")] / Constants.MM_KetoAcids) / plasmacrit(state);
    end ketoAcids;

    function epinephrine "Epinephrine in blood plasma"
      extends GetMassConcentration(R(displayUnit="ng/l",nominal=SubstanceFlowNominal[i("Epinephrine")]));
    algorithm
      R := density(state) * state.X[i("Epinephrine")]  / plasmacrit(state);
    end epinephrine;

    function norepinephrine "Norepinephrine in blood plasma"
      extends GetMassConcentration(R(displayUnit="ng/l",nominal=SubstanceFlowNominal[i("Norepinephrine")]));
    algorithm
      R := density(state) * state.X[i("Norepinephrine")]  / plasmacrit(state);
    end norepinephrine;

    function vasopressin "Vasopressin in blood plasma"
      extends GetConcentration(C(displayUnit="pmol/l",nominal=SubstanceFlowNominal[i("Vasopressin")]));
    algorithm
      C := (density(state) * state.X[i("Vasopressin")] / Constants.MM_Vasopressin) / plasmacrit(state);
    end vasopressin;

    function insulin "Insulin in blood plasma"
      extends GetActivity(A(unit="U/m3",displayUnit="mU/l"));
    algorithm
      A := (density(state) * (state.X[i("Insulin")] / 6e-9) / Constants.MM_Insulin) / plasmacrit(state) "conversion factor for human insulin is 1 mU/L = 6.00 pmol/L";
    end insulin;

    function glucagon "Glucagon in blood plasma"
      extends GetMassConcentration(R(displayUnit="ng/l",nominal=SubstanceFlowNominal[i("Glucagon")]));
    algorithm
      R := density(state) * state.X[i("Glucagon")]  / plasmacrit(state);
    end glucagon;

    function thyrotropin "Thyrotropin in blood plasma"
      extends GetConcentration(C(displayUnit="pmol/l",nominal=SubstanceFlowNominal[i("Thyrotropin")]));
    algorithm
      C := (density(state) * state.X[i("Thyrotropin")] / Constants.MM_Thyrotropin) / plasmacrit(state);
    end thyrotropin;

    function thyroxine "Thyroxine in blood plasma"
      extends GetMassConcentration(R(displayUnit="ug/l",nominal=SubstanceFlowNominal[i("Thyroxine")]));
    algorithm
      R := density(state) * state.X[i("Thyroxine")]  / plasmacrit(state);
    end thyroxine;

    function leptin "Leptin in blood plasma"
      extends GetMassConcentration(R(displayUnit="ug/l",nominal=SubstanceFlowNominal[i("Leptin")]));
    algorithm
      R := density(state) * state.X[i("Leptin")]  / plasmacrit(state);
    end leptin;

    function desglymidodrine "Desglymidodrine in blood plasma"
      extends GetMassConcentration(R(displayUnit="ug/l"));
    algorithm
      R := density(state) * state.X[i("Desglymidodrine")]  / plasmacrit(state);
    end desglymidodrine;


    function angiotensin2 "Angiotensin2 in blood plasma"
      extends GetMassConcentration(R(displayUnit="ng/l",nominal=SubstanceFlowNominal[i("Angiotensin2")]));
    algorithm
       R := density(state) * state.X[i("Angiotensin2")]  / plasmacrit(state);
    end angiotensin2;

    function alphaBlockers "Alpha blockers effect in blood plasma"
      extends GetFraction;
    algorithm
      F := state.X[i("AlphaBlockers")]/1e-6;
    end alphaBlockers;

    function betaBlockers "Beta blockers effect in blood plasma"
      extends GetFraction;
    algorithm
      F := state.X[i("BetaBlockers")]/1e-6;
    end betaBlockers;

    function anesthesiaVascularConductance "Anesthesia vascular conductance effect in blood plasma"
      extends GetFraction;
    algorithm
      F := state.X[i("AnesthesiaVascularConductance")]/1e-6;
    end anesthesiaVascularConductance;

    function aldosterone "Aldosterone in blood plasma"
      extends GetConcentration(C(displayUnit="nmol/l",nominal=SubstanceFlowNominal[i("Aldosterone")]));
    algorithm
      C := (density(state) * state.X[i("Aldosterone")] / Constants.MM_Aldosterone) / plasmacrit(state);
    end aldosterone;


    function renin "Renin PRA in blood plasma"
      extends GetActivity(A(unit="ng/ml/h",displayUnit="ng/ml/h"));
    algorithm
      A := (density(state) * (state.X[i("Renin")] / (1e-12 * 0.6 * 11.2)))  / plasmacrit(state) "conversion factor from PRA (ng/mL/h) to DRC (mU/L) is 11.2, μIU/mL (mIU/L) * 0.6 = pg/mL";
    end renin;

    function X "To set mass fractions in blood"

      input Types.Fraction hematocrit = 0.44;
      input Types.Concentration tO2 = 8.16865,
              tCO2 = 21.2679 "Total carbon dioxide in arterial blood",
              tCO = 1.512e-6,
              tHb = 8.4;
      input Types.Fraction FMetHb=0.005,
              FHbF=0.005;
      input Types.Concentration tAlb = 0.66;
      input Types.MassConcentration tGlb = 28;

      input Types.Concentration tPO4 = 0.153,
              cDPG = 5.4,
              glucose = 6.08,
              lactate = 1.04,
              urea = 6.64,
              aminoAcids = 4.97,
              lipids = 1.23,
              ketoacids = 4.88e-2,
              BEox = 0;

       input Types.MassConcentration
              epinephrine(displayUnit="ng/L")=40e-9,
              norepinephrine(displayUnit="ng/L")=240e-9;
       input Types.Concentration
              vasopressin(displayUnit="pmol/L")=1.84e-9;
       input Real
              insulin(displayUnit="mU/L")=19.91;
       input Types.MassConcentration
              glucagon(displayUnit="ng/L")=69.68e-9;
       input Types.Concentration
              thyrotropin(displayUnit="pmol/L")=4.03e-9;
       input Types.MassConcentration
              thyroxine(displayUnit="ug/L")=79.6e-6,
              leptin(displayUnit="ug/L")=7.96e-6,
              desglymidodrine(displayUnit="ug/L")=1e-11;
      input Types.Fraction
              alphaBlockers = Modelica.Constants.small,
              betaBlockers = Modelica.Constants.small,
              anesthesiaVascularConductance = 1;
      input Types.MassConcentration
              angiotensin2(displayUnit="ng/L")=20e-9;
      input Real renin(displayUnit="ng/mL/h")=2;
      input Types.Concentration
              aldosterone(displayUnit="nmol/L")=0.33e-6;
      input Types.MassConcentration H2O_plasma = 932.75;
      input Types.MassConcentration H2O_ery = 694;
      output Types.MassFraction X[nS];
     // output Types.Fraction XE,XP,Hct;
    protected
      Types.Density density;
      Types.Fraction plasmacrit;
      Types.Concentration NSID;
    algorithm
      density := 1054;
      plasmacrit := 1-hematocrit;
      NSID := (1 - hematocrit) * (zAlbNAP * tAlb + zGlbNAP * tGlb + zPO4NAP * tPO4 + ztCO2NAP) + hematocrit * (zHbNAE * (tHb / hematocrit) + ztCO2NAE);

      //X[i("RBC")] := hematocrit;
      X[i("H2O_P")] := (plasmacrit*H2O_plasma)/density;
      X[i("H2O_E")] := (hematocrit*H2O_ery)/density;
      X[i("O2")] := (tO2*O2.MolarWeight)/density;
      X[i("CO2")] := (tCO2*CO2.MolarWeight)/density;
      X[i("CO")] := (tCO*CO.MolarWeight)/density;
      X[i("Hb")] := (tHb*Constants.MM_Hb)/density;
      X[i("MetHb")] := FMetHb*X[
        i("Hb")];
      X[i("HbF")] := FHbF*X[i("Hb")];
      X[i("Alb")] := plasmacrit*(tAlb*Constants.MM_Alb)/
        density;
      X[i("Glb")] := plasmacrit*tGlb/density;
      X[i("PO4")] := plasmacrit*(tPO4*PO4.MolarWeight)/
        density;
      X[i("DPG")] := hematocrit*(cDPG*Constants.MM_DPG)/
        density;
      X[i("Glucose")] := plasmacrit*(glucose*Constants.MM_Glucose)
        /density;
      X[i("Lactate")] := plasmacrit*(lactate*Constants.MM_Lactate)
        /density;
      X[i("Urea")] := plasmacrit*(urea*Constants.MM_Urea)
        /density;
      X[i("AminoAcids")] := plasmacrit*(aminoAcids*
        Constants.MM_AminoAcids)/density;
      X[i("Lipids")] := plasmacrit*(lipids*Constants.MM_Lipids)
        /density;
      X[i("KetoAcids")] := plasmacrit*(ketoacids*
        Constants.MM_KetoAcids)/density;
      X[i("SID")] := (NSID - BEox)/density;
      X[i("Epinephrine")] := plasmacrit*(epinephrine)/
        density;
      X[i("Norepinephrine")] := plasmacrit*(
        norepinephrine)/density;
      X[i("Vasopressin")] := plasmacrit*(vasopressin*
        Constants.MM_Vasopressin)/density;
      X[i("Insulin")] := plasmacrit*(6e-9*insulin*
        Constants.MM_Insulin)/density
        "conversion factor for human insulin is 1 mU/L = 6.00 pmol/L";
      X[i("Glucagon")] := plasmacrit*(glucagon)/density;
      X[i("Thyrotropin")] := plasmacrit*(thyrotropin*
        Constants.MM_Thyrotropin)/density;
      X[i("Thyroxine")] := plasmacrit*(thyroxine)/
        density;
      X[i("Leptin")] := plasmacrit*(leptin)/density;
      X[i("Desglymidodrine")] := plasmacrit*(
        desglymidodrine)/density;
      X[i("AlphaBlockers")] := 1e-6 * alphaBlockers;
      X[i("BetaBlockers")] := 1e-6 * betaBlockers;
      X[i("AnesthesiaVascularConductance")] :=
        1e-6 * anesthesiaVascularConductance;
      X[i("Angiotensin2")] := plasmacrit*(angiotensin2)/
        density;
      X[i("Renin")] := plasmacrit*(1e-12*0.6*11.2*renin)/
        density
        "conversion factor from PRA (ng/mL/h) to DRC (mU/L) is 11.2, μIU/mL (mIU/L) * 0.6 = pg/mL";
      X[i("Aldosterone")] := plasmacrit*(aldosterone*
        Constants.MM_Aldosterone)/density;
     /*
 XP := X[i("H2O_P")] + X[i("CO2")] + X[i("Alb")] + X[i("Glb")] + X[i("Glucose")] +
   X[i("PO4")] + X[i("Lactate")] + X[i("Urea")] + X[i("AminoAcids")] + X[i("Lipids")] + X[i("Keannotation 0toAcids")];
  XE := X[i("H2O_E")] + X[i("Hb")] + X[i("DPG")];
  Hct := XE/ (XE + XP);
  */
    end X;

  end Blood;

  package Water "Incompressible water with constant heat capacity"
    extends Interfaces.PartialMedium(
      ThermoStates=Modelica.Media.Interfaces.Choices.IndependentVariables.pTX,
      final mediumName="Water",
      substanceNames={"H2O"},
      final singleState=true,
      final reducedX=true,
      final fixedX=false,
      reference_T=310.15,
      reference_p=101325,
      reference_X={1},
      SpecificEnthalpy(nominal=1.0e5),
      Density(start=1e3, nominal=1e3),
      AbsolutePressure(start=1.0e5, nominal=1.0e5),
      Temperature(
        min=273,
        max=350,
        start=310.15));


  protected
    package stateOfMatter = Chemical.Interfaces.Incompressible
      "Substances model to translate data into substance properties";

  public
    redeclare connector extends SubstancesPort
       Chemical.Interfaces.SubstancePort_a H2O "Free water molecule (in pure water is only cca 1 mol/kg free water molecules, other cca 54.5 mols are bounded together by hydrogen bonds)";
       Chemical.Interfaces.SubstancePort_a H "Free hydrogen ion H+";
       Chemical.Interfaces.SubstancePort_a O2 "Free oxygen molecule";
       Chemical.Interfaces.SubstancePort_a H2 "Free hydrogen molecule";
       Chemical.Interfaces.SubstancePort_a OH "Free hydroxide molecule OH-";
       Modelica.Electrical.Analog.Interfaces.Pin cathode "Electric cathode";
       Modelica.Electrical.Analog.Interfaces.Pin anode "Electric anode";
    end SubstancesPort;

  redeclare replaceable model extends SubstancesDecomposition "Just because Modelica in today version cannot work properly with nested connectors"
    Chemical.Interfaces.SubstancePort_a H2O annotation (Placement(transformation(extent={{90,-110},{110,-90}})));
    Chemical.Interfaces.SubstancePort_a H annotation (Placement(transformation(extent={{90,-70},{110,-50}}), iconTransformation(extent={{90,-70},{110,-50}})));
    Chemical.Interfaces.SubstancePort_a O2 annotation (Placement(transformation(extent={{90,50},{110,70}})));
    Chemical.Interfaces.SubstancePort_a H2 annotation (Placement(transformation(extent={{90,90},{110,110}})));
    Chemical.Interfaces.SubstancePort_a OH annotation (Placement(transformation(extent={{92,-10},{112,10}})));
    Modelica.Electrical.Analog.Interfaces.PositivePin cathode annotation (Placement(transformation(extent={{-10,90},{10,110}})));
    Modelica.Electrical.Analog.Interfaces.NegativePin anode annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
  equation
    connect(H2O, substances.H2O) annotation (Line(points={{100,-100},{56,-100},{56,-70},{-80,-70},{-80,0},{-100,0}},
                                                                                                        color={158,66,200}));
    connect(H, substances.H) annotation (Line(points={{100,-60},{88,-60},{88,-46},{-76,-46},{-76,0},{-100,0}},      color={158,66,200}));
    connect(O2, substances.O2) annotation (Line(points={{100,60},{-72,60},{-72,0},{-100,0}},      color={158,66,200}));
    connect(H2, substances.H2) annotation (Line(points={{100,100},{22,100},{22,80},{-76,80},{-76,0},{-100,0},{-100,0}},     color={158,66,200}));
    connect(OH, substances.OH) annotation (Line(points={{102,0},{-100,0}},                        color={158,66,200}));
    connect(cathode, substances.cathode) annotation (Line(points={{0,100},{-100,100},{-100,0},{-100,0}}, color={0,0,255}));
    connect(anode, substances.anode) annotation (Line(points={{0,-100},{-100,-100},{-100,0}},                     color={0,0,255}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
  end SubstancesDecomposition;

  public
    redeclare replaceable model extends ChemicalSolution
    protected
        Real I = 0 "mole-fraction-based ionic strength";
        Real logH,logOH,logO2,logH2,eq;
    equation
      v=substances.cathode.v-substances.anode.v;
      0=substances.cathode.i+substances.anode.i;
      _i = substances.cathode.i;
      _i + (-1)*Modelica.Constants.F*eq = 0 "electric current is flow of electrons";

      T = stateOfMatter.solution_temperature(
          {Substances.Water},
          h,
          {1},
          p);

      substances.H.u + substances.OH.u = substances.H2O.u "H+ + OH- <-> H2O";
      2*substances.H.q + 2*eq + 0.5*substances.O2.q = substances.H2O.q "2H+ + 2e- + (1/2)O2 <-> H2O";
      substances.H2.q = 2*substances.H.q + 2*eq "H2 <-> 2H+ + 2e-";

      logH=logOH;


      substances.H2O.u = stateOfMatter.electroChemicalPotentialPure( Substances.Water, T, p, v, I);
      substances.H.u = stateOfMatter.electroChemicalPotentialPure( Substances.H, T, p, v, I) +
                       Modelica.Constants.R*T*logH;
      substances.O2.u = stateOfMatter.electroChemicalPotentialPure( Substances.O2, T, p, v, I) +
                       Modelica.Constants.R*T*logO2;
      substances.H2.u = stateOfMatter.electroChemicalPotentialPure( Substances.H2, T, p, v, I) +
                       Modelica.Constants.R*T*logH2;
      substances.OH.u = stateOfMatter.electroChemicalPotentialPure( Substances.OH, T, p, v, I) +
                       Modelica.Constants.R*T*logOH;

      substances.H2O.h_outflow = stateOfMatter.molarEnthalpy( Substances.Water, T, p, v, I);
      substances.H.h_outflow = stateOfMatter.molarEnthalpy( Substances.H, T, p, v, I);
      substances.O2.h_outflow = stateOfMatter.molarEnthalpy( Substances.O2, T, p, v, I);
      substances.H2.h_outflow = stateOfMatter.molarEnthalpy( Substances.H2, T, p, v, I);
      substances.OH.h_outflow = stateOfMatter.molarEnthalpy( Substances.OH, T, p, v, I);

      enthalpyFromSubstances =
       substances.H2O.q * actualStream(substances.H2O.h_outflow) +
       substances.H.q * actualStream(substances.H.h_outflow) +
       substances.O2.q * actualStream(substances.O2.h_outflow) +
       substances.H2.q * actualStream(substances.H2.h_outflow) +
       substances.OH.q * actualStream(substances.OH.h_outflow)
        "enthalpy from substances";


      massFlows = {substances.H2O.q * Substances.Water.MolarWeight +
       substances.H.q * Substances.H.MolarWeight +
       substances.O2.q * Substances.O2.MolarWeight +
       substances.H2.q * Substances.H2.MolarWeight +
       substances.OH.q * Substances.OH.MolarWeight}
        "mass change of water";
    end ChemicalSolution;

    replaceable function extends specificEnthalpies_TpvI
    algorithm
       specificEnthalpy:=stateOfMatter.specificEnthalpy(
          {Substances.Water},
          T,p,v,I);
    end specificEnthalpies_TpvI;

  public
    redeclare model extends BaseProperties(final standardOrderComponents=true)
      "Base properties of medium"

    equation
      d = 1000;
      h = X*stateOfMatter.specificEnthalpy(
          {Substances.Water},
          T=T,
          p=p);
      u = h - p/d;
      MM = 1/(X*stateOfMatter.specificAmountOfParticles({Substances.Water}));
      R_s = 8.3144/MM;
      state.p = p;
      state.T = T;

    end BaseProperties;

    redeclare replaceable record extends ThermodynamicState
      "A selection of variables that uniquely defines the thermodynamic state"
      extends Modelica.Icons.Record;
      AbsolutePressure p "Absolute pressure of medium";
      Temperature T "Temperature of medium";
      annotation (Documentation(info="<html>

</html>"));
    end ThermodynamicState;

    redeclare replaceable function extends setState_pTX
      "Return thermodynamic state as function of p, T and composition X or Xi"
    algorithm
      state.p := p;
      state.T := T;
    end setState_pTX;

    redeclare replaceable function extends setState_phX
      "Return thermodynamic state as function of p, h and composition X or Xi"
    algorithm
      state.p := p;
      state.T := stateOfMatter.solution_temperature(
          {Substances.Water},
          h,
          {1},
          p);
    end setState_phX;

    redeclare function extends specificEnthalpy "Return specific enthalpy"
    algorithm
      h := stateOfMatter.specificEnthalpy(
          Substances.Water,
          T=state.T,
          p=state.p);
    end specificEnthalpy;

    redeclare function extends specificHeatCapacityCp
      "Return specific heat capacity at constant pressure"
    algorithm
      cp := stateOfMatter.specificHeatCapacityCp(
          Substances.Water,
          T=state.T,
          p=state.p);
      annotation (Documentation(info="<html>

</html>"));
    end specificHeatCapacityCp;

    redeclare function extends density
    algorithm
      d := 1000;
    end density;

    redeclare function extends temperature
    algorithm
      T := state.T;
    end temperature;

    redeclare function extends pressure
    algorithm
      p := state.p;
    end pressure;


    annotation (Documentation(info="<html>
<p>
This package is a <strong>template</strong> for <strong>new medium</strong> models. For a new
medium model just make a copy of this package, remove the
\"partial\" keyword from the package and provide
the information that is requested in the comments of the
Modelica source.
</p>
</html>", revisions="<html>
<p><i>2021</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
<p>All rights reserved. </p>
</html>"));
  end Water;

    package Air
      import Physiolibrary.Media.Substances.*;
      extends Interfaces.PartialMedium(
         ThermoStates=Modelica.Media.Interfaces.Choices.IndependentVariables.pTX,
         reducedX = false,
         singleState = false,
         substanceNames={"O2","CO2","H2O","N2"},
         reference_X=cat(1, Conc .* C2X, {1 - (Conc * C2X)}),
         SpecificEnthalpy(start=0, nominal=1e3),
         Density(start=1.0, nominal=1.0),
         AbsolutePressure(start=1.0e5, nominal=1.0e5),
         Temperature(min=273.15, max=320.15, start=298.15, nominal=298.15),
         MassFlowRate(nominal=1e-3));

  protected
      package stateOfMatter = Chemical.Interfaces.IdealGas
        "Substances model to translate data into substance properties";

      constant stateOfMatter.SubstanceData substanceData[nS]={
          Chemical.Substances.Oxygen_gas(),
          Chemical.Substances.CarbonDioxide_gas(),
          Chemical.Substances.Water_gas(),
          Chemical.Substances.Nitrogen_gas()} "Definition of the substances";

      constant Modelica.Units.SI.MoleFraction Conc[nS-1]={0.21,0.0004,0.02}
        "sum(*) = 1";

      constant Real C2X[nS-1] = aMM[1:nS-1] ./ (Conc * aMM[1:nS-1] + (1 - sum(Conc)) * aMM[nS]) "Conc to mass fraction coefficient";

      constant Real aMM[nS] = ones(nS) ./ stateOfMatter.specificAmountOfParticles(substanceData, T=298.15, p=101325) "Average molar mass of substance particle";

  public
      redeclare connector extends SubstancesPort
       Chemical.Interfaces.SubstancePort_a O2 "Gaseous oxygen molecule";
       Chemical.Interfaces.SubstancePort_a CO2 "Gaseous hydrogen molecule";
       Chemical.Interfaces.SubstancePort_a H2O "Gaseous H2O molecule";
       Chemical.Interfaces.SubstancePort_a N2 "Gaseaous nitrogen molecule";
      end SubstancesPort;

      redeclare replaceable model extends SubstancesDecomposition "Just because Modelica in today version cannot work properly with nested connectors"

      Chemical.Interfaces.SubstancePort_a O2 annotation (Placement(transformation(extent={{90,50},{110,70}})));
      Chemical.Interfaces.SubstancePort_a CO2 annotation (Placement(transformation(extent={{90,90},{110,110}})));
      Chemical.Interfaces.SubstancePort_a N2 annotation (Placement(transformation(extent={{90,-70},{110,-50}}), iconTransformation(extent={{90,-70},{110,-50}})));
      Chemical.Interfaces.SubstancePort_a H2O annotation (Placement(transformation(extent={{90,-110},{110,-90}})));
      equation
      connect(O2, substances.O2) annotation (Line(points={{100,60},{-72,60},{-72,0},{-100,0}},      color={158,66,200}));
      connect(CO2, substances.CO2) annotation (Line(points={{100,100},{22,100},{22,80},{-76,80},{-76,0},{-100,0},{-100,0}},     color={158,66,200}));
      connect(N2, substances.N2) annotation (Line(points={{100,-60},{88,-60},{88,-46},{-76,-46},{-76,0},{-100,0}},   color={158,66,200}));
      connect(H2O, substances.H2O) annotation (Line(points={{100,-100},{-82,-100},{-82,0},{-100,0}},      color={158,66,200}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
      end SubstancesDecomposition;


      redeclare replaceable model extends ChemicalSolution
    protected
        Real I = 0 "mole-fraction-based ionic strength";
         Modelica.Units.SI.Molality NpM[nS] "Amount of substance particles per mass of substance";
         Modelica.Units.SI.MoleFraction x_baseMolecule[nS] "Mole fraction of free base molecule of substance";


      //initial equation
      //  substanceMasses = startSubstanceMasses;
      equation
        v=0 "electric potential is not used without external flows of charge";

        NpM = stateOfMatter.specificAmountOfParticles(substanceData,T=T,p=p);

        x_baseMolecule = X.*stateOfMatter.specificAmountOfFreeBaseMolecule(substanceData,T=T,p=p)./(X*NpM);

        T = stateOfMatter.solution_temperature(
            substanceData,
            h,
            X,
            p);


        substances.O2.u =stateOfMatter.electroChemicalPotentialPure(
            Substances.O2_g,
            T,
            p,
            v,
            I) + Modelica.Constants.R*T*log(x_baseMolecule[
          i("O2")]);
        substances.CO2.u =stateOfMatter.electroChemicalPotentialPure(
            Substances.CO2_g,
            T,
            p,
            v,
            I) + Modelica.Constants.R*T*log(x_baseMolecule[
          i("CO2")]);
        substances.H2O.u =stateOfMatter.electroChemicalPotentialPure(
            Substances.H2O_g,
            T,
            p,
            v,
            I) + Modelica.Constants.R*T*log(x_baseMolecule[
          i("H2O")]);
        substances.N2.u =stateOfMatter.electroChemicalPotentialPure(
            Substances.N2_g,
            T,
            p,
            v,
            I) + Modelica.Constants.R*T*log(x_baseMolecule[
          i("N2")]);
        substances.O2.h_outflow = stateOfMatter.molarEnthalpy( Substances.O2_g, T, p, v, I);

        substances.CO2.h_outflow = stateOfMatter.molarEnthalpy( Substances.CO2_g, T, p, v, I);
        substances.H2O.h_outflow = stateOfMatter.molarEnthalpy( Substances.H2O_g, T, p, v, I);
        substances.N2.h_outflow = stateOfMatter.molarEnthalpy( Substances.N2_g, T, p, v, I);

        enthalpyFromSubstances =
         substances.O2.q * actualStream(substances.O2.h_outflow) +
         substances.CO2.q * actualStream(substances.CO2.h_outflow) +
         substances.H2O.q * actualStream(substances.H2O.h_outflow) +
         substances.N2.q * actualStream(substances.N2.h_outflow)
          "enthalpy from substances";


        massFlows[i("O2")] = substances.O2.q*Substances.O2_g.MolarWeight;
        massFlows[i("CO2")] = substances.CO2.q*Substances.CO2_g.MolarWeight;
        massFlows[i("H2O")] = substances.H2O.q*Substances.H2O_g.MolarWeight;
        massFlows[i("N2")] = substances.N2.q*Substances.N2_g.MolarWeight;

      end ChemicalSolution;

      redeclare function extends specificEnthalpies_TpvI
      algorithm
           specificEnthalpy:=stateOfMatter.specificEnthalpy(
              substanceData,
              T,p,v,I);
      end specificEnthalpies_TpvI;

  public
      redeclare replaceable record extends ThermodynamicState
        "A selection of variables that uniquely defines the thermodynamic state"
        extends Modelica.Icons.Record;
        AbsolutePressure p "Absolute pressure of medium";
        Temperature T "Temperature of medium";
        MassFraction X[nS] "Mass fractions of substances";
        annotation (Documentation(info="<html>

</html>"));
      end ThermodynamicState;

      replaceable function electrochemicalPotentials_pTXvI
        input Modelica.Units.SI.Pressure p;
        input Modelica.Units.SI.Temperature T;
        input Modelica.Units.SI.MoleFraction x_baseMolecule[nS] "Free mole fraction of substance base molecule";
        input Modelica.Units.SI.ElectricPotential electricPotential=0;
        input Modelica.Units.SI.MoleFraction moleFractionBasedIonicStrength=0;
        output Modelica.Units.SI.ChemicalPotential u[nS];
    protected
        Real a[nS];
        Modelica.Units.SI.ChargeNumberOfIon z[nS];
      algorithm
        a := stateOfMatter.activityCoefficient(
            substanceData,
            T,
            p,
            electricPotential,
            moleFractionBasedIonicStrength) .* x_baseMolecule;
        z := stateOfMatter.chargeNumberOfIon(
            substanceData,
            T,
            p,
            electricPotential,
            moleFractionBasedIonicStrength);
        u := stateOfMatter.chemicalPotentialPure(
            substanceData,
            T,
            p,
            electricPotential,
            moleFractionBasedIonicStrength) .+ Modelica.Constants.R*T*log(a) .+ z*Modelica.Constants.F*
          electricPotential;
      end electrochemicalPotentials_pTXvI;

      redeclare replaceable function extends setState_pTX
      algorithm
        state.T := T;
        state.p := p;
        state.X := X;
      end setState_pTX;

      redeclare replaceable function extends setState_phX
        "Return thermodynamic state as function of p, h and composition X or Xi"
      algorithm
        state.p := p;
        state.X := X;
        state.T := stateOfMatter.solution_temperature(
            substanceData,
            h,
            X,
            p);
      end setState_phX;

       redeclare replaceable function extends density
       algorithm
        d := 1/(state.X*stateOfMatter.specificVolume(
            substanceData,
            state.T,
            state.p));
       end density;

      redeclare replaceable function extends specificEnthalpy
      algorithm
        h := state.X * stateOfMatter.specificEnthalpy(
            substanceData,
            state.T,
            state.p);
        /*, electricPotential, moleFractionBasedIonicStrength*/
      end specificEnthalpy;

      redeclare replaceable function extends temperature
      algorithm
        T := state.T;
      end temperature;

      redeclare replaceable function extends pressure
      algorithm
        p := state.p;
      end pressure;

      function X "To set mass fractions"
        input Types.AmountOfSubstance
            tO2 = 0.21,
            tCO2 = 0.0003,
            tH2O = 0.06,
            tN2 = 1-tO2-tCO2-tH2O;
        output Types.MassFraction X[nS];
    protected
        Types.Mass tm;
      algorithm
        tm :=tO2*O2_g.MolarWeight + tCO2*CO2_g.MolarWeight + tH2O*H2O_g.MolarWeight +
          tN2*N2_g.MolarWeight;
        X[i("O2")] := (tO2*O2_g.MolarWeight)/tm;
        X[i("CO2")] := (tCO2*CO2_g.MolarWeight)/tm;
        X[i("H2O")] := (tH2O*H2O_g.MolarWeight)/tm;
        X[i("N2")] := (tN2*N2_g.MolarWeight)/tm;
      end X;



      annotation (Documentation(revisions="<html>
<p><i>2021</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
<p>All rights reserved. </p>
</html>"));
    end Air;

  package BodyFluid "Simplified Human body fluid"
    import Physiolibrary.Media.Substances.*;
    import Physiolibrary.Media.Substances.InitialValues.*;
    extends Interfaces.PartialMedium(
      mediumName="SimpleBodyFluid (Physiolibrary)",
      substanceNames={"Na","HCO3","K","Glucose","Urea","Cl","Ca","Mg","Alb",
    "Glb","Others","H2O"},
      singleState=true,
      reducedX=false,
      fixedX=false,
      ThermoStates = Modelica.Media.Interfaces.Choices.IndependentVariables.pTX,
      reference_X = X(),
      reference_T = 310.15,
      reference_p = 101325,
      Temperature(
        min=273,
        max=350,
        start=310.15));

  protected
    package stateOfMatter = Chemical.Interfaces.Incompressible
    "Substances model to translate data into substance properties";

    constant stateOfMatter.SubstanceData substanceData[nS] = {
      Chemical.Substances.Sodium_aqueous(),
      Chemical.Substances.Bicarbonate_aqueous(),
      Chemical.Substances.Potassium_aqueous(),
      Chemical.Substances.Glucose_solid(),
      Chemical.Substances.Urea_aqueous(),
      Chemical.Substances.Chloride_aqueous(),
      Chemical.Substances.Calcium_aqueous(),
      Chemical.Substances.Magnesium_aqueous(),
      Chemical.Substances.Albumin_aqueous(),
      Chemical.Substances.Globulins_aqueous(),
      Chemical.Substances.Water_liquid_without_selfClustering(),
      Chemical.Substances.Water_liquid()}
       "Definition of the substances";

    replaceable function electrochemicalPotentials_pTXvI
       "electrochemical potentials for base molecules (for Chemical Substance interface)"
      input Modelica.Units.SI.Pressure p;
      input Modelica.Units.SI.Temperature T;
      input Modelica.Units.SI.MoleFraction x_baseMolecule[nS] "Mole fraction of free base molecule";
      input Modelica.Units.SI.ElectricPotential electricPotential=0;
      input Modelica.Units.SI.MoleFraction moleFractionBasedIonicStrength=0;
      output Modelica.Units.SI.ChemicalPotential u[nS];
    protected
      Real a[nS];
      Modelica.Units.SI.ChargeNumberOfIon z[nS];
    algorithm
      a := stateOfMatter.activityCoefficient(substanceData, T, p, electricPotential, moleFractionBasedIonicStrength)
           .* x_baseMolecule;
      z := stateOfMatter.chargeNumberOfIon(substanceData, T, p, electricPotential, moleFractionBasedIonicStrength);
      u := stateOfMatter.chemicalPotentialPure(substanceData, T, p, electricPotential, moleFractionBasedIonicStrength)
         .+ Modelica.Constants.R*T*log(a)
         .+ z*Modelica.Constants.F*electricPotential;
    end electrochemicalPotentials_pTXvI;

    replaceable function molarEnthalpies_pTvI
      "enthalpies for base molecules (for Chemical Substance interface)"
      input Modelica.Units.SI.Pressure p;
      input Modelica.Units.SI.Temperature T;
      input Modelica.Units.SI.ElectricPotential electricPotential=0;
      input Modelica.Units.SI.MoleFraction moleFractionBasedIonicStrength=0;
      output Modelica.Units.SI.MolarEnthalpy h[nS];
    algorithm
      h:= stateOfMatter.molarEnthalpy(
          substanceData, T, p, electricPotential, moleFractionBasedIonicStrength);
    end molarEnthalpies_pTvI;

  public
    redeclare connector extends SubstancesPort
     Chemical.Interfaces.SubstancePort_a Na "Free natrium ions Na+";
     Chemical.Interfaces.SubstancePort_a HCO3 "Free bicarbonates HCO3-";
     Chemical.Interfaces.SubstancePort_a K "Free potasium ions K+";
     Chemical.Interfaces.SubstancePort_a Glucose "Free glucose molecule";
     Chemical.Interfaces.SubstancePort_a Urea "Free urea molecule";
     Chemical.Interfaces.SubstancePort_a Cl "Free chloride ion Cl-";
     Chemical.Interfaces.SubstancePort_a Ca "Free calcium ion Ca++";
     Chemical.Interfaces.SubstancePort_a Mg "Free magnesium ion Mg++";
     Chemical.Interfaces.SubstancePort_a H2O "Free H2O molecule";
    end SubstancesPort;


  redeclare replaceable model extends SubstancesDecomposition "Just because Modelica in today version cannot work properly with nested connectors"
    Chemical.Interfaces.SubstancePort_a Na annotation (Placement(transformation(extent={{90,50},{110,70}})));
    Chemical.Interfaces.SubstancePort_a HCO3 annotation (Placement(transformation(extent={{92,-70},{112,-50}})));
    Chemical.Interfaces.SubstancePort_a K annotation (Placement(transformation(extent={{90,90},{110,110}})));
    Chemical.Interfaces.SubstancePort_a Glucose annotation (Placement(transformation(extent={{-10,10},{10,30}})));
    Chemical.Interfaces.SubstancePort_a Urea annotation (Placement(transformation(extent={{-10,-70},{10,-50}})));
    Chemical.Interfaces.SubstancePort_a Cl annotation (Placement(transformation(extent={{92,-110},{112,-90}}),iconTransformation(extent={{92,-110},{112,-90}})));
    Chemical.Interfaces.SubstancePort_a Ca annotation (Placement(transformation(extent={{92,10},{112,30}})));
    Chemical.Interfaces.SubstancePort_a Mg   annotation (Placement(transformation(extent={{92,-30},{112,-10}})));
    Chemical.Interfaces.SubstancePort_a H2O  annotation (Placement(transformation(extent={{-10,90},{10,110}})));
  equation
    connect(Na, substances.Na) annotation (Line(points={{100,60},{-72,60},{-72,0},{-100,0}},      color={158,66,200}));
    connect(HCO3, substances.HCO3) annotation (Line(points={{102,-60},{16,-60},{16,0},{-100,0}},      color={158,66,200}));
    connect(K, substances.K) annotation (Line(points={{100,100},{22,100},{22,80},{-76,80},{-76,0},{-100,0},{-100,0}},     color={158,66,200}));
    connect(Glucose, substances.Glucose) annotation (Line(points={{0,20},{-70,20},{-70,0},{-100,0}},        color={158,66,200}));
    connect(Urea, substances.Urea) annotation (Line(points={{0,-60},{-78,-60},{-78,0},{-100,0}},      color={158,66,200}));
    connect(Cl, substances.Cl) annotation (Line(points={{102,-100},{-86,-100},{-86,0},{-100,0}},                      color={158,66,200}));
    connect(Ca, substances.Ca) annotation (Line(points={{102,20},{18,20},{18,4},{-68,4},{-68,0},{-100,0}},
                                                                                                      color={158,66,200}));
    connect(Mg, substances.Mg) annotation (Line(points={{102,-20},{-70,-20},{-70,-4},{-76,-4},{-76,0},{-100,0}}, color={158,66,200}));
    connect(H2O, substances.H2O) annotation (Line(points={{0,100},{-82,100},{-82,0},{-100,0}}, color={158,66,200}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
  end SubstancesDecomposition;


  public
    redeclare replaceable model extends ChemicalSolution
    protected
      Real I = 0 "mole-fraction-based ionic strength";
      Modelica.Units.SI.Molality NpM[nS] "Amount of substance particles per mass of substance";
      Modelica.Units.SI.MoleFraction x_baseMolecule[nS] "Mole fraction of free base molecule of substance";
      Modelica.Units.SI.ChargeNumberOfIon z[nS] "Charge of base molecule of substance";


    equation
      NpM = stateOfMatter.specificAmountOfParticles(substanceData,T=T,p=p);

      x_baseMolecule = X.*stateOfMatter.specificAmountOfFreeBaseMolecule(substanceData,T=T,p=p)./(X*NpM);

      T = stateOfMatter.solution_temperature(
          substanceData,
          h,
          X,
          p,
          v,
          I);


      z = stateOfMatter.chargeNumberOfIon(substanceData,T,p,v,I);

      _i = Modelica.Constants.F*(
       substances.Na.q +
       (-substances.HCO3.q)  +
       substances.K.q +
       (-substances.Cl.q) +
       2*substances.Ca.q  +
       2*substances.Mg.q)
      "electric current";


      substances.Na.u =stateOfMatter.electroChemicalPotentialPure(
          Substances.Na,
          T,
          p,
          v,
          I) + Modelica.Constants.R*T*log(x_baseMolecule[
        i("Na")]);
      substances.HCO3.u =stateOfMatter.electroChemicalPotentialPure(
          Substances.HCO3,
          T,
          p,
          v,
          I) + Modelica.Constants.R*T*log(x_baseMolecule[
        i("HCO3")]);
      substances.K.u =stateOfMatter.electroChemicalPotentialPure(
          Substances.K,
          T,
          p,
          v,
          I) + Modelica.Constants.R*T*log(x_baseMolecule[
        i("K")]);
      substances.Glucose.u =stateOfMatter.electroChemicalPotentialPure(
          Substances.Glucose,
          T,
          p,
          v,
          I) + Modelica.Constants.R*T*log(x_baseMolecule[
        i("Glucose")]);
      substances.Urea.u =stateOfMatter.electroChemicalPotentialPure(
          Substances.Urea,
          T,
          p,
          v,
          I) + Modelica.Constants.R*T*log(x_baseMolecule[
        i("Urea")]);
      substances.Cl.u =stateOfMatter.electroChemicalPotentialPure(
          Substances.Cl,
          T,
          p,
          v,
          I) + Modelica.Constants.R*T*log(x_baseMolecule[
        i("Cl")]);
      substances.Ca.u =stateOfMatter.electroChemicalPotentialPure(
          Substances.Ca,
          T,
          p,
          v,
          I) + Modelica.Constants.R*T*log(x_baseMolecule[
        i("Ca")]);
      substances.Mg.u =stateOfMatter.electroChemicalPotentialPure(
          Substances.Mg,
          T,
          p,
          v,
          I) + Modelica.Constants.R*T*log(x_baseMolecule[
        i("Mg")]);
      substances.H2O.u =stateOfMatter.electroChemicalPotentialPure(
          Substances.Water,
          T,
          p,
          v,
          I) + Modelica.Constants.R*T*log(x_baseMolecule[
        i("H2O")]);


      substances.Na.h_outflow = stateOfMatter.molarEnthalpy( Substances.Na, T, p, v, I);
      substances.HCO3.h_outflow = stateOfMatter.molarEnthalpy( Substances.HCO3, T, p, v, I);
      substances.K.h_outflow = stateOfMatter.molarEnthalpy( Substances.K, T, p, v, I);
      substances.Glucose.h_outflow = stateOfMatter.molarEnthalpy( Substances.Glucose, T, p, v, I);
      substances.Urea.h_outflow = stateOfMatter.molarEnthalpy( Substances.Urea, T, p, v, I);
      substances.Cl.h_outflow = stateOfMatter.molarEnthalpy( Substances.Cl, T, p, v, I);
      substances.Ca.h_outflow = stateOfMatter.molarEnthalpy( Substances.Ca, T, p, v, I);
      substances.Mg.h_outflow = stateOfMatter.molarEnthalpy( Substances.Mg, T, p, v, I);
      substances.H2O.h_outflow = stateOfMatter.molarEnthalpy( Substances.Water, T, p, v, I);

      enthalpyFromSubstances =
       substances.Na.q * actualStream(substances.Na.h_outflow) +
       substances.HCO3.q * actualStream(substances.HCO3.h_outflow) +
       substances.K.q * actualStream(substances.K.h_outflow) +
       substances.Glucose.q * actualStream(substances.Glucose.h_outflow) +
       substances.Urea.q * actualStream(substances.Urea.h_outflow) +
       substances.Cl.q * actualStream(substances.Cl.h_outflow) +
       substances.Ca.q * actualStream(substances.Ca.h_outflow) +
       substances.Mg.q * actualStream(substances.Mg.h_outflow) +
       substances.H2O.q * actualStream(substances.H2O.h_outflow)
        "enthalpy from substances";


      massFlows[i("Na")] = substances.Na.q*Substances.Na.MolarWeight;
      massFlows[i("HCO3")] = substances.HCO3.q*
        Substances.HCO3.MolarWeight;
      massFlows[i("K")] = substances.K.q*Substances.K.MolarWeight;
      massFlows[i("Glucose")] = substances.Glucose.q*
        Substances.Glucose.MolarWeight;
      massFlows[i("Urea")] = substances.Urea.q*
        Substances.Urea.MolarWeight;
      massFlows[i("Cl")] = substances.Cl.q*Substances.Cl.MolarWeight;
      massFlows[i("Ca")] = substances.Ca.q*Substances.Ca.MolarWeight;
      massFlows[i("Mg")] = substances.Mg.q*Substances.Mg.MolarWeight;
      massFlows[i("H2O")] = substances.H2O.q*Substances.Water.MolarWeight;
      massFlows[i("Alb")] = 0;
      massFlows[i("Glb")] = 0;
      massFlows[i("Others")] = 0;

    end ChemicalSolution;

    redeclare function extends specificEnthalpies_TpvI
    algorithm
         specificEnthalpy:=stateOfMatter.specificEnthalpy(
            substanceData,
            T,p,v,I);
    end specificEnthalpies_TpvI;

  public
    redeclare model extends BaseProperties(final standardOrderComponents=true)
      "Base properties of medium"

    protected
      Modelica.Units.SI.Molality NpM[nS]=stateOfMatter.specificAmountOfParticles(
        substanceData,T=T,p=p);
    equation

      1/d = X * stateOfMatter.specificVolume(substanceData,T=T,p=p);
      h = X * stateOfMatter.specificEnthalpy(substanceData,T=T,p=p);
      u = h - p/d;
      MM = 1/sum(X .* NpM);
      R_s = 8.3144/MM;
      state.p = p;
      state.T = T;
      state.X = X;
      state.v = 0;
    end BaseProperties;

    redeclare replaceable record ThermodynamicState
      "A selection of variables that uniquely defines the thermodynamic state"
      extends Modelica.Icons.Record;
      AbsolutePressure p "Absolute pressure of medium";
      Temperature T "Temperature of medium";
      Modelica.Units.SI.ElectricPotential v "Electric potential of medium";
      MassFraction X[nS] "Mass fractions of substances";
      annotation (Documentation(info="<html>

</html>"));
    end ThermodynamicState;

    redeclare function extends setState_pTX
      "Return thermodynamic state as function of p, T and composition X or Xi"
      input Modelica.Units.SI.ElectricPotential v=0;
    algorithm
      state.p :=p;
      state.T :=T;
      state.X :=X;
      state.v :=v;
    end setState_pTX;

    redeclare function extends setState_phX
      "Return thermodynamic state as function of p, h and composition X or Xi"
      input Modelica.Units.SI.ElectricPotential v=0;
    algorithm
      state.p :=p;
      state.T := stateOfMatter.solution_temperature(substanceData,h=h,X=X,p=p);
      state.X :=X;
      state.v :=v;
    end setState_phX;

    redeclare function extends dynamicViscosity "Return dynamic viscosity"
    algorithm
      eta := (2.414e-5)*10^(247.8/(state.T-140));  //https://www.engineersedge.com/physics/water__density_viscosity_specific_weight_13146.htm
      annotation (Documentation(info="<html>

</html>"));
    end dynamicViscosity;

    redeclare function extends thermalConductivity
      "Return thermal conductivity"
    algorithm
      lambda := 0.6; //google
      annotation (Documentation(info="<html>

</html>"));
    end thermalConductivity;

    redeclare function extends specificEnthalpy "Return specific enthalpy"
    algorithm
      h := state.X * stateOfMatter.specificEnthalpy(substanceData,T=state.T,p=state.p);
    end specificEnthalpy;

    redeclare function extends specificHeatCapacityCp
      "Return specific heat capacity at constant pressure"
    algorithm
      cp := state.X * stateOfMatter.specificHeatCapacityCp(substanceData,T=state.T,p=state.p);
      annotation (Documentation(info="<html>

</html>"));
    end specificHeatCapacityCp;

    redeclare function extends isentropicExponent "Return isentropic exponent"
      extends Modelica.Icons.Function;
    algorithm
      gamma := 23128; //http://twt.mpei.ac.ru/MCS/Worksheets/WSP/WKDiag15.xmcd
      annotation (Documentation(info="<html>

</html>"));
    end isentropicExponent;

    redeclare function extends velocityOfSound "Return velocity of sound"
      extends Modelica.Icons.Function;
    algorithm
      a := 1481; //wikipedia
      annotation (Documentation(info="<html>

</html>"));
    end velocityOfSound;

    redeclare function extends density
    algorithm
      d := 1/( state.X * stateOfMatter.specificVolume(substanceData));
    end density;

    redeclare function extends temperature
    algorithm
      T := state.T;
    end temperature;

    redeclare function extends pressure
    algorithm
      p := state.p;
    end pressure;

    function X "To set mass fractions"
    input Types.Concentration
            tNa = 135,
            tHCO3 = 24,
            tK = 5,
            tGlucose = 5,
            tUrea = 1.5,
            tCl = 105,
            tCa = 1.5,
            tMg = 0.5,
            tAlb = 0.7;
    input Types.MassConcentration
            tGlb = 28,
            tOthers = 1e-6;

    output Types.MassFraction X[nS];
    protected
    Types.Density density;
    algorithm
    density := 1054;

    X[i("Na")] := (tNa*Na.MolarWeight)/density;
    X[i("HCO3")] := (tHCO3*HCO3.MolarWeight)/density;
    X[i("K")] := (tK*K.MolarWeight)/density;
    X[i("Glucose")] := (tGlucose*Constants.MM_Glucose)/density;
    X[i("Urea")] := (tUrea*Constants.MM_Urea)/density;
    X[i("Cl")] := (tCl*Cl.MolarWeight)/density;
    X[i("Ca")] := (tCa*Ca.MolarWeight)/density;
    X[i("Mg")] := (tMg*Mg.MolarWeight)/density;
    X[i("Alb")] := (tAlb*Constants.MM_Alb)/density;
    X[i("Glb")] := tGlb/density;
    X[i("Others")] := tOthers/ density;
    X[i("H2O")] := 1-sum(X[1:(nS-1)]);
    end X;

    annotation (Documentation(revisions="<html>
<p><i>2021</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
<p>All rights reserved. </p>
</html>"));
  end BodyFluid;

  package Interfaces
    partial package PartialMedium

    extends Modelica.Media.Interfaces.PartialMedium;

      replaceable connector SubstancesPort

      annotation (
          Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}, initialScale = 0.2), graphics={  Rectangle(
                extent={{-20,2},{20,-2}},
                lineColor={158,66,200},
                lineThickness=0.5),                                                                                                                                                                                                      Polygon(points={{-80,50},
                    {80,50},{100,30},{80,-40},{60,-50},{-60,-50},{-80,-40},{-100,30},{-80,50}},                                                                                                                                                                                                        lineColor = {0, 0, 0}, fillColor = {158,66,200}, fillPattern = FillPattern.Solid), Ellipse(extent = {{-65, 25}, {-55, 15}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid), Ellipse(extent = {{-5, 25}, {5, 15}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid), Ellipse(extent = {{55, 25}, {65, 15}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid), Ellipse(extent = {{-35, -15}, {-25, -25}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid), Ellipse(extent = {{25, -15}, {35, -25}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid)}),
          Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}, initialScale = 0.2), graphics={  Polygon(points = {{-40, 25}, {40, 25}, {50, 15}, {40, -20}, {30, -25}, {-30, -25}, {-40, -20}, {-50, 15}, {-40, 25}}, lineColor = {0, 0, 0}, fillColor = {158,66,200}, fillPattern = FillPattern.Solid), Ellipse(extent = {{-32.5, 7.5}, {-27.5, 12.5}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid), Ellipse(extent = {{-2.5, 12.5}, {2.5, 7.5}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid), Ellipse(extent = {{27.5, 12.5}, {32.5, 7.5}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid), Ellipse(extent = {{-17.5, -7.5}, {-12.5, -12.5}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid), Ellipse(extent = {{12.5, -7.5}, {17.5, -12.5}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid), Text(extent = {{-150, 70}, {150, 40}}, lineColor = {0, 0, 0}, textString = "%name")}),
          Documentation(info = "<html>
        <p>
        This connector defines the \"substances port\" that
        is used for cross-membrane transports of selected free base chemical substances.
        </p>
        </html>"));
      end SubstancesPort;

      replaceable partial model SubstancesDecomposition "Just because Modelica in today version cannot work properly with nested connectors"
        SubstancesPort substances annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));
      equation

      end SubstancesDecomposition;

      replaceable partial model ChemicalSolution
        "Adaptor between selected free base chemical substances and medium substances"
        outer Modelica.Fluid.System system "System wide properties";

        SubstancesPort substances "free base chemical substances";
        Physiolibrary.Types.RealIO.PressureInput p "pressure";
        Physiolibrary.Types.RealIO.SpecificEnthalpyInput h "specific enthalpy";
        Physiolibrary.Types.RealIO.MassFractionInput X[nS] "mass fractions of medium substances";
        Physiolibrary.Types.RealIO.ElectricCurrentInput _i "electric current from substances";

        Physiolibrary.Types.RealIO.MassFlowRateInput substanceMassFlowsFromStream[nS] "flow of medium substances";
        Physiolibrary.Types.RealIO.MassOutput substanceMasses[nS](nominal=SubstanceFlowNominal) "mass od medium substances";

        parameter Types.Mass startSubstanceMasses[nS]=fill(Modelica.Constants.small,nS) "Initial value of medium substance masses";

        Physiolibrary.Types.RealIO.MassFlowRateOutput massFlows[nS](nominal=SubstanceFlowNominal) "mass flows trough substancesPort";
        Physiolibrary.Types.RealIO.TemperatureOutput T "temperature";
        Physiolibrary.Types.RealIO.HeatFlowRateOutput enthalpyFromSubstances "enthalpy from substances";

        Physiolibrary.Types.RealIO.ElectricPotentialOutput v "electric potential";

        Real logm[nS] "natutal logarithm of medium substance masses (as state variables)";
      initial equation
        //substanceMasses = startSubstanceMasses;
        logm = log(startSubstanceMasses);
      equation
      /* 
  enthalpyFromSubstances = 
   substances.*.q * actualStream(substances.*.h_outflow) "enthalpy from substances";
 

  massFlows = substances.\(*\).q .* MMb[\1];
*/

        //The main accumulation equation is "der(substanceMasses)= substanceMassFlowsFromStream + massFlows"
        // However, the numerical solvers can handle it in form of log(m) much better. :-)
        der(logm) = ((substanceMassFlowsFromStream + massFlows)./substanceMasses) "accumulation of substances=exp(logm) [kg]";
        substanceMasses = exp(logm);
      end ChemicalSolution;

      function i "Find index of substance"
        input String searchName "Name of substance to find in substanceNames";
        output Integer index "Index of searchName in substanceNames";
      algorithm
          index := -1;
          for i in 1:nS loop
            if ( Modelica.Utilities.Strings.isEqual(substanceNames[i], searchName)) then
             index := i;
            end if;
          end for;
          assert(index > 0, "Substance '" + searchName + "' is not present between Substances in Medium\n"
             + "Check parameters and medium model.");
      end i;


      constant Modelica.Units.SI.MassFlowRate SubstanceFlowNominal[nS]=ones(nS) "Nominal of substance flow";
      constant Modelica.Units.SI.SpecificEnthalpy SpecificEnthalpyNominal=-1E6 "Nominal of specific enthalpy";

       replaceable function specificEnthalpies_TpvI
            "Specific enthalpies of medium substances"
             input Modelica.Units.SI.Temperature T=298.15 "Temperature";
             input Modelica.Units.SI.Pressure p=100000 "Pressure";
             input Modelica.Units.SI.ElectricPotential v=0
              "Electric potential of the substance";
             input Modelica.Units.SI.MoleFraction I=0
              "Ionic strengh (mole fraction based)";
             output Modelica.Units.SI.SpecificEnthalpy specificEnthalpy[nS]
               "Specific enthalpies of medium substances";

       end specificEnthalpies_TpvI;

       function temperatureError  "To find u as temperature, where temperatureError(u,p,X,h)->0"
       extends Modelica.Math.Nonlinear.Interfaces.partialScalarFunction;
         input Real p;
         input Real X[nS];
         input Real h;
      protected
          Real hs[nS];
       algorithm
         hs:=specificEnthalpies_TpvI(u,p);
         y:=h-sum(hs[i]*X[i] for i in 1:nS);
       end temperatureError;

       partial function GetConcentration
         input ThermodynamicState state;
         output Types.Concentration C;
       end GetConcentration;

       partial function GetMassConcentration
         input ThermodynamicState state;
         output Types.MassConcentration R;
       end GetMassConcentration;

       partial function GetFraction
         input ThermodynamicState state;
         output Types.Fraction F;
       end GetFraction;

       partial function GetActivity
         input ThermodynamicState state;
         output Real A;
       end GetActivity;

      annotation (Documentation(revisions="<html>
<p><i>2021</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
<p>All rights reserved. </p>
</html>"));
    end PartialMedium;
  end Interfaces;

  package Substances
    package Constants

      constant Types.MolarMass
           MM_Glucose = 0.1806 "Glucose molar mass [kg/mol]",
           MM_Lactate = 0.09008 "Lactate molar mass [kg/mol]",
           MM_Urea = 0.06006 "Urea molar mass [kg/mol]",
           MM_AminoAcids = 0.1 "Amino acids molar mass [kg/mol]",
           MM_Lipids = 0.80645 "Fatty acids molar mass [kg/mol]",
           MM_KetoAcids = 0.102 "Keto acids molar mass [kg/mol]",
           MM_Hb=65.494/4 "Hemoglobin unit molar mass [kg/mol]",
           MM_MetHb=65.494/4 "Methemoglobin unit molar mass [kg/mol]",
           MM_HbF=65.494/4 "Foetal hemoglobin unit molar mass [kg/mol]",
           MM_Alb=66.463 "Albumin molar mass [kg/mol]",
           MM_Glb=34 "Average plasma globulin molar mass [kg/mol]",
           MM_DPG=0.266 "Biphosphoglycerate molar mass [kg/mol]",
           MM_Epinephrine=0.183204 "Epinephrine molar mass [kg/mol]",
           MM_Norepinephrine=0.16918 "Norepinephrine molar mass [kg/mol]",
           MM_Vasopressin=1.084 "Vasopressin molar mass [kg/mol]",
           MM_Insulin=5.808 "Insulin molar mass [kg/mol]",
           MM_Glucagon=3.485 "Glucagon molar mass [kg/mol]",
           MM_Thyrotropin=28 "Thyrotropin molar mass [kg/mol]",
           MM_Thyroxine=0.777 "Thyroxine molar mass [kg/mol]",
           MM_Leptin=16.026 "Leptin molar mass [kg/mol]",
           MM_Angiotensin2=1.046 "Angiotensin2 molar mass [kg/mol]",
           MM_Renin=48 "Renin molar mass [kg/mol]",
           MM_Aldosterone=0.36044 "Aldosterone molar mass [kg/mol]",
           MM_Desglymidodrine=0.19723 "Desglymidodrine molar mass [kg/mol]";

       constant Real TimeScale=6000 "Time scale of simulation";

    end Constants;

    package InitialValues
      import Physiolibrary.Media.Substances.*;
      constant Real
          D_Epinephrine_ng=40 "Default epinephrine [ng/L]",
          D_Norepinephrine_ng=240 "Dafault norepinephrine [ng/L]",
          D_Vasopressin_pmol=1.84 "Defaul vasopresin (ADH) [pmol/L]",
          D_Insulin_mU=19.91 "Default insulin [mU/L]",
          D_Glucagon_ng=69.68 "Default glucagon [ng/L]",
          D_Thyrotropin_pmol=4.03 "Default thyrotropin [pmol/L]",
          D_Thyroxine_ug=79.6 "Default thyroxin T3 and T4 [ug/L]",
          D_Leptin_ug=7.96 "Default leptin [ug/L]",
          D_Desglymidodrine_ug=1e-5 "Default desglymidodrine [ug/L]",
          D_AlphaBlockers_f=Modelica.Constants.small "Default aplpha blockers effect [%/L]",
          D_BetaBlockers_f=Modelica.Constants.small "Default beta blockers effect [%/L]",
          D_AnesthesiaVascularConductance_f=1 "Default effect of anesthesia to vascular conductance [%/L]",
          D_Angiotensin2_ng=20 "Default angiotensin II [ng/L]",
          D_Renin_ng_mL_h=2 "Default renin PRA [ng/mL/h]",
          D_Aldosterone_nmol=0.33 "Default aldosterone [nmol/L]";

      constant Types.Fraction D_Hct = 0.44 "Default hematocrit";
      constant Types.Concentration  D_Arterial_O2 = 8.16865 "Default Total oxygenin arterial blood",
                                    D_Arterial_CO2 = 21.2679 "Default Total carbon dioxide in arterial blood",
                                    D_Venous_O2 = 5.48 "Default Total oxygen in venous blood",
                                    D_Venous_CO2 = 23.77 "Default Total carbon dioxide in venous blood",
                                    D_CO = 1.512e-6 "Default Total carbon monoxide",
                                    D_Hb = 8.4 "Default Hemoglobin",
                                    D_MetHb = 0.042 "Default Methemoglobin",
                                    D_HbF = 0.042 "Default Foetal hemoglobin",
                                    D_Alb = 0.66 "Default Albumin",
                                    D_PO4 = 0.153 "Default Inorganic phosphates",
                                    D_DPG = 5.4 "Default Diphosphoglycerate";
      constant Real D_Glb = 28 "Default Globulins [g/L!!!]",
                    D_SID = D_NSID - D_BEox "Default Strong ion difference";
      constant Real D_BEox = 0 "Default Base excess of oxygenated blood from normal arterial conditions";
      constant Real D_NSID = (1 - D_Hct) * (zAlbNAP * D_Alb + zGlbNAP * D_Glb + zPO4NAP * D_PO4 + ztCO2NAP) + D_Hct * (zHbNAE * (D_Hb / D_Hct) + ztCO2NAE)
                           "Default Total charge number on buffers at normal arterial conditions per total volume";
      constant Real zAlbNAP = 18.5565 "charge on albumin at normal arterial plasma conditions",
                    zGlbNAP = 0.0892857 "charge on globilins at normal arterial plasma conditions",
                    zPO4NAP = 1.79924 "charge on inorganic phosphates at normal arterial plasma conditions",
                    ztCO2NAP = 24.4732 "charge of bicarbonate and carbonate at normal arterial plasma conditions",
                    ztCO2NAE = 15.0901 "charge of bicarbonate and carbonate at normal arterial erythrocyte conditions",
                    zHbNAE = 1.06431 "relative charge on oxygenated hemoglobin at normal arterial eruthrocyte conditions";
      constant Types.Concentration
           D_Glucose = 6.08 "Default glucose [mmol/L]",
           D_Lactate = 1.04 "Default lactate [mmol/L]",
           D_Urea = 6.64 "Default urea [mmol/L]",
           D_AminoAcids = 4.97 "Default amino acids [mmol/L]",
           D_Lipids = 1.23 "Default lipids [mmol/L]",
           D_Ketoacids = 4.88e-2 "Default keto acids [mmol/L]";



      constant Types.Concentration
          D_Epinephrine = 1e-9 * D_Epinephrine_ng / Constants.MM_Epinephrine "Default epinephrine [mmol/L]",
          D_Norepinephrine = 1e-9 * D_Norepinephrine_ng / Constants.MM_Norepinephrine "Dafault norepinephrine [mmol/L]",
          D_Vasopressin = 1e-9 * D_Vasopressin_pmol "Defaul vasopresin (ADH) [mmol/L]",
          D_Insulin = 6e-9 * D_Insulin_mU "Default insulin [mmol/L] - conversion factor for human insulin is 1 mU/L = 6.00 pmol/L",
          D_Glucagon = 1e-9 * D_Glucagon_ng / Constants.MM_Glucagon "Default glucagon [mmol/L]",
          D_Thyrotropin = 1e-9 * D_Thyrotropin_pmol "Default thyrotropin [mmol/L]",
          D_Thyroxine = 1e-6 * D_Thyroxine_ug / Constants.MM_Thyroxine "Default thyroxin T3 and T4 [mmol/L]",
          D_Leptin = 1e-6 * D_Leptin_ug / Constants.MM_Leptin "Default leptin [mmol/L]",
          D_Desglymidodrine = 1e-6 * D_Desglymidodrine_ug / Constants.MM_Desglymidodrine "Default desglymidodrine [mmol/L]",
          D_AlphaBlockers = D_AlphaBlockers_f "Default aplpha blockers effect [%/L]",
          D_BetaBlockers = D_BetaBlockers_f "Default beta blockers effect [%/L]",
          D_AnesthesiaVascularConductance = D_AnesthesiaVascularConductance_f "Default effect of anesthesia to vascular conductance [%/L]",
          D_Angiotensin2 = 1e-9 * D_Angiotensin2_ng / Constants.MM_Angiotensin2 "Default angiotensin II [mmol/L]",
          D_Renin = 1e-12 * 0.6 * 11.2 * D_Renin_ng_mL_h / Constants.MM_Renin "Default renin [mU/L] - conversion factor PRA (ng/mL/h) to DRC (mU/L) is 11.2, μIU/mL (mIU/L) * 0.6 = pg/mL",
          D_Aldosterone = 1e-6 * D_Aldosterone_nmol "Default aldosterone [mmol/L]";


    end InitialValues;
    constant Chemical.Interfaces.IdealGas.SubstanceData O2_g=
          Chemical.Substances.Oxygen_gas();
      constant Chemical.Interfaces.IdealGas.SubstanceData CO2_g=
          Chemical.Substances.CarbonDioxide_gas();
      constant Chemical.Interfaces.IdealGas.SubstanceData CO_g=
          Chemical.Substances.CarbonMonoxide_gas();
      constant Chemical.Interfaces.IdealGas.SubstanceData H2O_g=
          Chemical.Substances.Water_gas();
      constant Chemical.Interfaces.IdealGas.SubstanceData N2_g=
          Chemical.Substances.Nitrogen_gas();


     constant Chemical.Interfaces.Incompressible.SubstanceData O2=
          Chemical.Substances.Oxygen_aqueous();
      constant Chemical.Interfaces.Incompressible.SubstanceData CO2=
          Chemical.Substances.CarbonDioxide_aqueous();
      constant Chemical.Interfaces.Incompressible.SubstanceData CO=
          Chemical.Substances.CarbonMonoxide_aqueous();

      constant Chemical.Interfaces.Incompressible.SubstanceData H2=
          Chemical.Substances.Hydrogen_aqueous();

       constant Chemical.Interfaces.Incompressible.SubstanceData Cl=
          Chemical.Substances.Chloride_aqueous();
       constant Chemical.Interfaces.Incompressible.SubstanceData Ca=
          Chemical.Substances.Calcium_aqueous();
       constant Chemical.Interfaces.Incompressible.SubstanceData K=
          Chemical.Substances.Potassium_aqueous();
       constant Chemical.Interfaces.Incompressible.SubstanceData Mg=
          Chemical.Substances.Magnesium_aqueous();
       constant Chemical.Interfaces.Incompressible.SubstanceData Na=
          Chemical.Substances.Sodium_aqueous();

      constant Chemical.Interfaces.Incompressible.SubstanceData H=
          Chemical.Substances.Proton_aqueous();
      constant Chemical.Interfaces.Incompressible.SubstanceData H3O=
          Chemical.Substances.Hydronium_aqueous();
      constant Chemical.Interfaces.Incompressible.SubstanceData OH=
          Chemical.Substances.Hydroxide_aqueous();
      constant Chemical.Interfaces.Incompressible.SubstanceData e=
       Chemical.Interfaces.Incompressible.SubstanceData(
          MolarWeight=5.4857990946e-7,
          z=-1,
          DfH=0,
          DfG=0,
          Cp=0,
          density=1e20) "electrone";


      constant Chemical.Interfaces.Incompressible.SubstanceData PO4=
            Chemical.Substances.Phosphate_aqueous();

      constant Chemical.Interfaces.Incompressible.SubstanceData HCO3=
            Chemical.Substances.Bicarbonate_aqueous();

      constant Chemical.Interfaces.Incompressible.SubstanceData Glucose=
           Chemical.Substances.Glucose_solid();
      constant Chemical.Interfaces.Incompressible.SubstanceData Urea=
           Chemical.Substances.Urea_aqueous();
      constant Chemical.Interfaces.Incompressible.SubstanceData Water=
           Chemical.Substances.Water_liquid();
  end Substances;
end Media;

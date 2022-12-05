within Physiolibrary;
package Media
  extends Modelica.Icons.Package;
  package Blood "Blood"
    extends Media.Interfaces.PartialMedium(
      substanceNames={"RBC","O2","CO2","CO","Hb","MetHb","HbF","Alb","Glb","PO4","DPG",
        "Glucose","Lactate","Urea","AminoAcids","Lipids","Ketoacids",
        "SID","H+","Others"},
      reference_X=cat(
          1,
          Conc .* C2X[1:nS-1],
          {1 - (Conc*C2X[1:nS-1])}),
      zb = {  0,0,0,0,0,0,0,0,0,0,0,
              0,-1,0,0,0,-1,
              -1,1,0},
      MMb= {1098, 0.032, 0.044, 0.059, 65.494/4, 65.494/4, 65.494/4, 66.463, 1, 0.095, 0.266,
              0.1806, 0.09008, 0.06006, 0.1, 0.80645, 0.102,
              0.031, 0.001, 0.018},
      extraPropertiesNames={"Epinephrine","Norepinephrine","Vasopressin",
        "Insulin","Glucagon","Thyrotropin","Thyroxine","Leptin",
        "Desglymidodrine","AlphaBlockers","BetaBlockers",
        "AnesthesiaVascularConductance",
        "Angiotensin2","Renin","Aldosterone"},
      C_default=ExtraSubstancesDefault,
      ThermoStates=Modelica.Media.Interfaces.Choices.IndependentVariables.pTX,
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


  public
    constant Real ArterialDefault[Blood.nS - 2]=
     {D_Hct, D_Arterial_O2, D_Arterial_CO2, D_CO, D_Hb, D_MetHb, D_HbF, D_Alb, D_Glb, D_PO4, D_DPG,
      D_Glucose, D_Lactate, D_Urea, D_AminoAcids, D_Lipids, D_Ketoacids,
      D_SID} "Default composition of arterial blood";

    constant Real VenousDefault[Blood.nS - 2]=
     {D_Hct, D_Venous_O2, D_Venous_CO2, D_CO, D_Hb, D_MetHb, D_HbF, D_Alb, D_Glb, D_PO4, D_DPG,
      D_Glucose, D_Lactate, D_Urea, D_AminoAcids, D_Lipids, D_Ketoacids,
      D_SID} "Default composition of venous blood";

    constant Real ExtraSubstancesDefault[nC]=
     {  D_Epinephrine, D_Norepinephrine, D_Vasopressin, D_Insulin, D_Glucagon,
        D_Thyrotropin, D_Thyroxine, D_Leptin,
        D_Desglymidodrine, D_AlphaBlockers, D_BetaBlockers,
        D_AnesthesiaVascularConductance, D_Angiotensin2,
        D_Renin, D_Aldosterone}
                         "Default amounts of extra substances per kilogram";

     constant String ExtraSubstancesUnits[nC]={"ng","ng","pmol","mU","ng","pmol","ug","ug",
             "ug", "%", "%","%",
             "nG","GU/ml", "nmol"} "Units of extra substance amounts";

  /*   constant Real ExtraSubstancesMMb[nC]={0.183204, 0.16918, 1.084, 5.808, 3.485, 28, 0.777, 16.026,
           0.19723,0.3,0.26,1,
           1.046,48,0.36044} "Molar mass of base molecules of extra substances";
*/

    constant Real
        D_Epinephrine=40 "Default epinephrine [ng/kg]",
        D_Norepinephrine=240 "Dafault norepinephrine [ng/kg]",
        D_Vasopressin=1.84 "Defaul vasopresin (ADH) [pmol/kg]",
        D_Insulin=19.91 "Default insulin [mU/kg]",
        D_Glucagon=69.68 "Default glucagon [ng/kg]",
        D_Thyrotropin=4.03 "Default thyrotropin [pmol/kg]",
        D_Thyroxine=79.6 "Default thyroxin T3 and T4 [ug/kg]",
        D_Leptin=7.96 "Default leptin [ug/kg]",
        D_Desglymidodrine=0 "Default desglymidodrine [ug/kg]",
        D_AlphaBlockers=0 "Default aplpha blockers effect [%/kg]",
        D_BetaBlockers=0 "Default beta blockers effect [%/kg]",
        D_AnesthesiaVascularConductance=1 "Default effect of anesthesia to vascular conductance [%/kg]",
        D_Angiotensin2=20 "Default angiotensin II [ng/kg]",
        D_Renin=2 "Default renin [/kg]",
        D_Aldosterone=0.33 "Default aldosterone [nmol/kg]";



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
    constant Real
         D_Glucose = 6.08 "Default glucose [mmol/L]",
         D_Lactate = 1.04 "Default lactate [mmol/L]",
         D_Urea = 6.64 "Default urea [mmol/L]",
         D_AminoAcids = 4.97 "Default amino acids [mmol/L]",
         D_Lipids = 1.23 "Default lipids [mmol/L]",
         D_Ketoacids = 4.88e-2 "Default keto acids [mmol/L]";



    constant Modelica.Units.SI.Concentration Conc[nS - 1] = cat(1,ArterialDefault,{-ArterialDefault*zb[1:nS-2]}) "Default concentrations of substance base molecules except water";

    constant Real C2X[nS]= MMb ./ density_pTC(reference_p, reference_T, ArterialDefault) "Default concentrations to mass fractions coefficients X[i]=C[i]*C2X[i]  [kg/kg = mol/L * (kg/mol)/(kg/L)]";

    constant SpecificHeatCapacity _cp=3490 "specific heat capacity of blood";


    replaceable function hemoglobinDissociationCurve "Hemoglobin dissociation curve as saturation of O2 and CO2 on hemoglobin (excluded methemoglobin)"
      input Real pH "acidity";
      input Real pO2 "oxygen partial pressure";
      input Real pCO2 "carbon dioxide partial pressure";
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
      Physiolibrary.Types.Pressure pO2CO;
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

      annotation (Documentation(info="<html>
<p><span style=\"font-size: 8pt;\">Hemoglobin-Oxygen dissociation relation based on OSA (Oxygen Status Algorithm) by Siggaard Andersen.</span></p>
<p><a href=\"https://www.siggaard-andersen.dk/\">Hydrogen Ion, Carbon Dioxide, and Oxygen in the Blood (siggaard-andersen.dk)</a></p>
</html>"));
    end hemoglobinDissociationCurve;

    replaceable model BloodGases "Hydrogen Ion, Carbon Dioxide, and Oxygen in the Blood"
      input Real C[nS - 1]=Conc
        "Volume, amount of substance or mass of substance per total volume of solution";

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
      Physiolibrary.Types.VolumeFraction Hct=C[1] "haematocrit";
      Physiolibrary.Types.Concentration tO2=C[2] "oxygen content per volume of blood";
      Physiolibrary.Types.Concentration tCO2=C[3]
        "carbon dioxide content per volume of blood";
      Physiolibrary.Types.Concentration tCO=C[4]
        "carbon monoxide content per volume of blood";
      Physiolibrary.Types.Concentration tHb=C[5]
        "hemoglobin content per volume of blood";
      Physiolibrary.Types.MoleFraction FMetHb=C[6]/C[5] "fraction of methemoglobin";
      Physiolibrary.Types.MoleFraction FHbF=C[7]/C[5] "fraction of foetalhemoglobin";
      Physiolibrary.Types.Concentration ctHb_ery=C[5]/C[1]
        "hemoglobin concentration in red cells";
      Physiolibrary.Types.Concentration tAlb=C[8]
        "albumin concentration in blood plasma";
      Physiolibrary.Types.MassConcentration tGlb=C[9]
        "globulin concentration in blood plasma";
      Physiolibrary.Types.Concentration tPO4=C[10]
        "inorganic phosphates concentration in blood plasma";
      Physiolibrary.Types.Concentration cDPG=C[11] "DPG concentration in blood plasma";
      Physiolibrary.Types.Concentration SID=C[18] "strong ion difference of blood";

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

      NSIDP = -(-(tAlb*66.463)*(0.123*pH0 - 0.631) - tGlb*(2.5/28) - tPO4*(10^(pKa2 - pH0) +
        2 + 3*10^(pH0 - pKa3))/(10^(pKa1 + pKa2 - 2*pH0) + 10^(pKa2 - pH0) + 1 + 10^(pH0 -
        pKa3)) - cdCO2N*10^(pH0 - pK))
        "strong ion difference of blood plasma at pH=7.4, pCO2=40mmHg, T=37degC and sO2=1";

      fzcON = 1/(1 + 10^(pKzO - pH_ery0) + cdCO2N*10^(pH_ery0 - pKcO))
        "fraction of hemoglobin units with HN2 form of amino-terminus at pH=7.4 (pH_ery=7.19), pCO2=40mmHg, T=37degC and sO2=1";
      sCO2N = 10^(pH_ery0 - pKcO)*fzcON*cdCO2N
        "CO2 saturation of hemoglobin amino-termini at pH=7.4 (pH_ery=7.19), pCO2=40mmHg, T=37degC and sO2=1";
      NSIDE = -(-cdCO2N*10^(pH_ery0 - pK) - ctHb_ery*(betaOxyHb*(pH_ery0 - pIo) + sCO2N*(1 +
        2*10^(pKzO - pH_ery0))/(1 + 10^(pKzO - pH_ery0)) + 0.82))
        "strong ion difference of red cells at pH=7.4 (pH_ery=7.19), pCO2=40mmHg, T=37degC and sO2=1";

      NSID = Hct*NSIDE + (1 - Hct)*NSIDP
        "strong ion difference of blood at pH=7.4 (pH_ery=7.19), pCO2=40mmHg, T=37degC and sO2=1";

      BEox = NSID - SID "base excess of oxygenated blood";

      beta = 2.3*tHb + 8*tAlb + 0.075*tGlb + 0.309*tPO4 "buffer value of blood";

      pH = pH0 + (1/beta)*(((BEox + 0.3*(1 - sO2CO))/(1 - tHb/43)) - (cHCO3 - 24.5))
        "Van Slyke";
      pH_ery = 7.19 + 0.77*(pH - 7.4) + 0.035*(1 - sO2);

      sO2CO = hemoglobinDissociationCurve(
          pH,
          pO2,
          pCO2,
          pCO,
          T,
          tHb,
          cDPG,
          FMetHb,
          FHbF);

      sCO*(pO2 + 218*pCO) = 218*sO2CO*(pCO);
      FCOHb = sCO*(1 - FMetHb);
      tCO = aCO*pCO + FCOHb*tHb;

      ceHb = tHb*(1 - FCOHb - FMetHb);
      sO2 = (sO2CO*(tHb*(1 - FMetHb)) - tHb*FCOHb)/ceHb;
      tO2 = aO2*pO2 + ceHb*sO2;

      cdCO2 = aCO2*pCO2;
      cdCO2*10^(pH - pK) = cHCO3;

      tCO2_P = cHCO3 + cdCO2;
      tCO2_ery = aCO2_ery*pCO2*(1 + 10^(pH_ery - pK_ery));
      tCO2 = tCO2_ery*Hct + tCO2_P*(1 - Hct);

      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)),
        Documentation(info="<html>
<p><a href=\"https://www.siggaard-andersen.dk/\">Hydrogen Ion, Carbon Dioxide, and Oxygen in the Blood (siggaard-andersen.dk)</a></p>
<p><a href=\"https://www.creativeconnections.cz/medsoft/2013/Medsoft_2013_Matejak.pdf\">Medsoft_2013_Matejak.pdf (creativeconnections.cz)</a></p>
</html>"));
    end BloodGases;

    redeclare replaceable model ChemicalSolution "Blood chemical substances as chemical solution"
      outer Modelica.Fluid.System system "System wide properties";

      Chemical.Interfaces.SubstancePorts_a substances[nS];
      Physiolibrary.Types.RealIO.PressureInput p "pressure";
      Physiolibrary.Types.RealIO.SpecificEnthalpyInput h "specific enthalpy";
      Physiolibrary.Types.RealIO.MassFractionInput X[nS] "mass fractions of substances";
      Physiolibrary.Types.RealIO.ElectricCurrentInput _i "electric current from substances";

      Physiolibrary.Types.RealIO.MassFlowRateOutput massFlows[nS] "mass flows of substances";
      Physiolibrary.Types.RealIO.TemperatureOutput T "temperature";
      Physiolibrary.Types.RealIO.SpecificEnthalpyOutput actualStreamSpecificEnthalpies[nS] "specific enthalpies of substances in streams";
      Physiolibrary.Types.RealIO.ElectricPotentialOutput v "electric potential";

      parameter Boolean EnthalpyNotUsed=false "If true then simplify heat flows from/to chemical reactions (deprecated)" annotation (
      Evaluate=true,
      HideResult=true,
      choices(checkBox=true),
      Dialog(tab="Advanced", group="Performance"));

      // protected
      Real I = 0 "mole-fraction-based ionic strength";
      Real C[nS - 1]=(X[1:(nS - 1)] ./ C2X[1:(nS - 1)]);

      Real x[nS]=(X ./ C2X)/(sum(X ./ C2X)) "Mole fractions of substances";

      ThermodynamicState state;
      BloodGases bloodGases(
        p=p,
        T=T,
        C=C);
      Modelica.Units.SI.MoleFraction aO2;
      Modelica.Units.SI.MoleFraction aCO2;
      Modelica.Units.SI.MoleFraction aCO;
      Modelica.Units.SI.MoleFraction aH_plus;
      Modelica.Units.SI.ChemicalPotential uO2;
      Modelica.Units.SI.ChemicalPotential uCO2;
      Modelica.Units.SI.ChemicalPotential uCO;
      Modelica.Units.SI.ChemicalPotential uH_plus;
      Modelica.Units.SI.MolarEnthalpy hO2;
      Modelica.Units.SI.MolarEnthalpy hCO2;
      Modelica.Units.SI.MolarEnthalpy hCO;
      Modelica.Units.SI.MolarEnthalpy hH_plus;
      constant Chemical.Interfaces.IdealGas.SubstanceData O2=
          Chemical.Substances.Oxygen_gas();
      constant Chemical.Interfaces.IdealGas.SubstanceData CO2=
          Chemical.Substances.CarbonDioxide_gas();
      constant Chemical.Interfaces.IdealGas.SubstanceData CO=
          Chemical.Substances.CarbonMonoxide_gas();
      constant Chemical.Interfaces.Incompressible.SubstanceData H_plus=
          Chemical.Substances.Proton_aqueous();

      constant Chemical.Interfaces.Incompressible.SubstanceData PO4=
            Chemical.Substances.Phosphate_aqueous();
      constant Chemical.Interfaces.Incompressible.SubstanceData Glucose=
           Chemical.Substances.Glucose_solid();
      //  constant Chemical.Interfaces.Incompressible.SubstanceData Lactate=
      //     Chemical.Substances.Lactate_solid();
      constant Chemical.Interfaces.Incompressible.SubstanceData Urea=
           Chemical.Substances.Urea_aqueous();
      constant Chemical.Interfaces.Incompressible.SubstanceData Water=
           Chemical.Substances.Water_liquid();


    public
         Real water_S, water_H, water_G, water_G0, water_H0, u_water;

    equation
      v=0 "electric potential is not used without external flows of charge";

      if (EnthalpyNotUsed) then
        state = setState_pTX(
            p,
            T,
            X);
        T = system.T_ambient;
      else
        state = setState_phX(
            p,
            h,
            X);
        T = state.T;
      end if;


      aO2 = bloodGases.pO2/p;
      aCO2 = bloodGases.pCO2/p;
      aCO = bloodGases.pCO/p;
      aH_plus = 10^(-bloodGases.pH);

      uO2 = Modelica.Constants.R*T*log(aO2) +
        Chemical.Interfaces.IdealGas.electroChemicalPotentialPure(
          O2,
          T,
          p,
          v,
          I);
      uCO2 = Modelica.Constants.R*T*log(aCO2) +
        Chemical.Interfaces.IdealGas.electroChemicalPotentialPure(
          CO2,
          T,
          p,
          v,
          I);
      uCO = Modelica.Constants.R*T*log(aCO) +
        Chemical.Interfaces.IdealGas.electroChemicalPotentialPure(
          CO,
          T,
          p,
          v,
          I);
      uH_plus = Modelica.Constants.R*T*log(aH_plus) +
        Chemical.Interfaces.Incompressible.electroChemicalPotentialPure(
          H_plus,
          T,
          p,
          v,
          I);

      hO2 = Chemical.Interfaces.IdealGas.molarEnthalpy(
          O2,
          T,
          p,
          v,
          I);
      hCO2 = Chemical.Interfaces.IdealGas.molarEnthalpy(
          CO2,
          T,
          p,
          v,
          I);
      hCO = Chemical.Interfaces.IdealGas.molarEnthalpy(
          CO,
          T,
          p,
          v,
          I);
      hH_plus = Chemical.Interfaces.Incompressible.molarEnthalpy(
          H_plus,
          T,
          p,
          v,
          I);

      water_S=Chemical.Interfaces.Incompressible.molarEntropyPure(
          Water, T, p, v, I);
      water_H=Chemical.Interfaces.Incompressible.molarEnthalpyElectroneutral(
          Water, T, p, v, I);
      water_G=Chemical.Interfaces.Incompressible.electroChemicalPotentialPure(
          Water, T, p, v, I);

      water_H0=Chemical.Interfaces.Incompressible.molarEnthalpy(
          Water, 298.15, 101325, 0, 0);
      water_G0=Chemical.Interfaces.Incompressible.electroChemicalPotentialPure(
          Water, 298.15, 101325, 0, 0);

      u_water = Modelica.Constants.R*T*log(x[i("Others")])  +  water_G-water_G0;

      //precise electro-chemical potential to use with electro-chemical processes
      /*substances[i("Others")].u=Modelica.Constants.R*T*log(x[i("Others")]) +
        Chemical.Interfaces.Incompressible.electroChemicalPotentialPure(
        Water, T, p, v, I);
      */
      substances.u = {0,uO2,uCO2,uCO,0,0,0,0,0,0,0,0,0,0,0,0,0,0,uH_plus,u_water};

      substances.h_outflow = {0,hO2,hCO2,hCO,0,0,0,0,0,0,0,0,0,0,0,0,0,0,hH_plus,water_H-water_H0};

      actualStreamSpecificEnthalpies = if EnthalpyNotUsed then zeros(nS) else
        actualStream(substances.h_outflow) ./ MMb "specific enthalpy in stream";

      massFlows = substances.q .* MMb;

      annotation (Documentation(info="<html>
<p>Chemical equilibrium is represented by expression of electrochemical potentials of base blood substances.</p>
</html>"));
    end ChemicalSolution;

    redeclare replaceable record extends ThermodynamicState
      "A selection of variables that uniquely defines the thermodynamic state"
      extends Modelica.Icons.Record;
      AbsolutePressure p "Absolute pressure of medium";
      Temperature T "Temperature of medium";
      MassFraction X[nS] "Mass fractions of substances";
      annotation (Documentation(info="<html>
<p>Thermodynamic state of blood is represented by pressure, temperature and base substances composition.</p>
</html>"));
    end ThermodynamicState;

    redeclare model extends BaseProperties(final standardOrderComponents=true)
      "Base properties of medium"

    equation
      d = 1057;
      h = (T - 310.15)*_cp;
      u = h - p/d;
      MM = 1;
      R_s = 8.3144;
      state.p = p;
      state.T = T;
      state.X = X;
      annotation (Documentation(info="<html>
<p>Simplification of blood:</p>
<p>Constant density and constant heat capacity</p>
</html>"));
    end BaseProperties;

    redeclare replaceable function extends setState_pTX "Thermodynamic state"
    algorithm
      state.T := T;
      state.p := p;
      state.X := X;
      annotation (Documentation(info="<html>
<p>Set thermodynamic state</p>
</html>"));
    end setState_pTX;

    redeclare replaceable function extends setState_phX "Thermodynamic state"
    algorithm
      state.p := p;
      state.T := 310.15 + h/_cp;
      state.X := X;
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

    redeclare function extends density_pTC "Density"
    algorithm
      d := 1057;
      annotation (Documentation(info="<html>
<p>constant density</p>
</html>"));
    end density_pTC;

    redeclare replaceable function extends specificEnthalpy "Specific enthalpy"
    algorithm
      h := (state.T - 310.15)*_cp;
      annotation (Documentation(info="<html>
<p>Heat energy from temperature based on constant heat capacity</p>
</html>"));
    end specificEnthalpy;

    redeclare replaceable function extends specificHeatCapacityCp "Specific heat capacityReturn specific heat capacity at constant pressure"
    algorithm
      cp := _cp;
      annotation (Documentation(info="<html>
<p>Constant specific heat capacity</p>
</html>"));
    end specificHeatCapacityCp;

    redeclare replaceable function extends temperature "Temperature"
    algorithm
      T := state.T;
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
  end Blood;

  package Water "Incompressible water with constant heat capacity"
    extends Interfaces.PartialMedium(
      zb = stateOfMatter.chargeNumberOfIon(substanceData),
      MMb = stateOfMatter.molarMassOfBaseMolecule(substanceData),
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
    constant stateOfMatter.SubstanceData substanceData[nS]={
        Chemical.Substances.Water_liquid_without_selfClustering()}
      "Definition of the substances";
        //Chemical.Substances.Water_liquid()} //values for pure water at interface should be the same - independent on inclusion of self-clustering calculation

  public
    redeclare replaceable model extends ChemicalSolution
    protected
        Real I = 0 "mole-fraction-based ionic strength";
    equation
      v=0 "electric potential is not used without external flows of charge";

      T = stateOfMatter.solution_temperature(
          substanceData,
          h,
          {1},
          p);

      actualStreamSpecificEnthalpies = if EnthalpyNotUsed then zeros(nS) else
        actualStream(substances.h_outflow) ./ stateOfMatter.molarMassOfBaseMolecule(
        substanceData) "specific enthalpy in stream";

      substances.u = stateOfMatter.chemicalPotentialPure(
          substanceData,
          T,
          p,
          v,
          I) "electro-chemical potential of pure water";

      substances.h_outflow = if EnthalpyNotUsed then zeros(nS) else
        stateOfMatter.molarEnthalpy(
          substanceData,
          T,
          p,
          v,
          I) "molar enthalphy of the substances";

      massFlows = substances.q .* stateOfMatter.molarMassOfBaseMolecule(substanceData);
    end ChemicalSolution;

    redeclare model extends BaseProperties(final standardOrderComponents=true)
      "Base properties of medium"

    equation
      d = 1000;
      h = X*stateOfMatter.specificEnthalpy(
          substanceData,
          T=T,
          p=p);
      u = h - p/d;
      MM = 1/(X*stateOfMatter.specificAmountOfParticles(substanceData));
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
          substanceData,
          h,
          {1},
          p);
    end setState_phX;

    redeclare function extends specificEnthalpy "Return specific enthalpy"
    algorithm
      h := {1}*stateOfMatter.specificEnthalpy(
          substanceData,
          T=state.T,
          p=state.p);
    end specificEnthalpy;

    redeclare function extends specificHeatCapacityCp
      "Return specific heat capacity at constant pressure"
    algorithm
      cp := {1}*stateOfMatter.specificHeatCapacityCp(
          substanceData,
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

    redeclare function extends density_pTC
    algorithm
      d := 1000;
    end density_pTC;

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

      extends Interfaces.PartialMedium(
         zb = stateOfMatter.chargeNumberOfIon(substanceData),
         MMb = substanceData.MolarWeight,
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
      redeclare replaceable record extends ThermodynamicState
        "A selection of variables that uniquely defines the thermodynamic state"
        extends Modelica.Icons.Record;
        AbsolutePressure p "Absolute pressure of medium";
        Temperature T "Temperature of medium";
        MassFraction X[nS] "Mass fractions of substances";
        annotation (Documentation(info="<html>

</html>"));
      end ThermodynamicState;

      redeclare replaceable model extends ChemicalSolution
    protected
        Real I = 0 "mole-fraction-based ionic strength";
         Modelica.Units.SI.Molality NpM[nS] "Amount of substance particles per mass of substance";
         Modelica.Units.SI.MoleFraction x_baseMolecule[nS] "Mole fraction of free base molecule of substance";

      equation
        v=0 "electric potential is not used without external flows of charge";

        NpM = stateOfMatter.specificAmountOfParticles(substanceData,T=T,p=p);

        x_baseMolecule = X.*stateOfMatter.specificAmountOfFreeBaseMolecule(substanceData,T=T,p=p)./(X*NpM);

        T = stateOfMatter.solution_temperature(
            substanceData,
            h,
            X,
            p);

        actualStreamSpecificEnthalpies = if EnthalpyNotUsed then zeros(nS)
        else actualStream(substances.h_outflow) ./ MMb
          "molar enthalpy in stream";

        substances.u = electrochemicalPotentials_pTXvI(
            p,
            T,
            x_baseMolecule,
            v,
            I);

        substances.h_outflow = stateOfMatter.molarEnthalpy(
            substanceData,
            T,
            p,
            v,
            I);

        massFlows = substances.q .* MMb;
      end ChemicalSolution;

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

      redeclare function extends density_pTC
    protected
        Modelica.Units.SI.SpecificVolume sV[nS]=stateOfMatter.specificVolume(substanceData);
        Modelica.Units.SI.MolarVolume mV[nS]=MMb.*sV;
        Modelica.Units.SI.Concentration c_electroneutral[nS-1]=
          if
            (size(concentrations,1)==nS-2) then
                  cat(1,concentrations[1:nS-2],{-(concentrations[1:nS-2]*zb[1:nS-2])})
          else concentrations[1:nS-1];
        Modelica.Units.SI.Concentration c[nS]=
          if
            (size(concentrations,1)<nS) then
            cat(1,c_electroneutral,{(1-(c_electroneutral*(mV[1:nS-1])))/sum(mV)})
          else
            concentrations;
      algorithm
        d:=c*MMb;
      end density_pTC;

      annotation (Documentation(revisions="<html>
<p><i>2021</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
<p>All rights reserved. </p>
</html>"));
    end Air;

  package BodyFluid "Simplified Human body fluid"
    extends Interfaces.PartialMedium(
      zb=stateOfMatter.chargeNumberOfIon(substanceData),
      MMb=stateOfMatter.molarMassOfBaseMolecule(substanceData),
      mediumName="SimpleBodyFluid (Physiolibrary)",
      substanceNames={"Na","HCO3-","K","Glu","Urea","Cl","Ca","Mg","Alb",
    "Glb","Others","H2O"},
      singleState=true,
      reducedX=false,
      fixedX=false,
      ThermoStates = Modelica.Media.Interfaces.Choices.IndependentVariables.pTX,
      reference_X = X_start,
      reference_T = 310.15,
      reference_p = 101325,
      Temperature(
        min=273,
        max=350,
        start=310.15));

  protected
    constant Modelica.Units.SI.Concentration concentrations_start[nS - 1]={135,24,5,5,3,105,
        1.5,0.5,0.7,0.8,1e-6} "Default concentrations of substance base molecules except water";

    constant Modelica.Units.SI.Density density_start = density_pTC(
      reference_p,
      reference_T,
      concentrations_start);

    constant Modelica.Units.SI.MassFraction
      X_start[nS] = cat(1,(concentrations_start .* MMb[1:nS-1])/density_start,  {1-(concentrations_start * MMb[1:nS-1])/density_start})
       "Default mass fractions of substances";

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

      actualStreamSpecificEnthalpies = if EnthalpyNotUsed then zeros(nS)
      else actualStream(substances.h_outflow) ./ MMb
        "molar enthalpy in stream";

      substances.u = electrochemicalPotentials_pTXvI(
          p,
          T,
          x_baseMolecule,
          v,
          I);

      substances.h_outflow = molarEnthalpies_pTvI(
          p,
          T,
          v,
          I);

      z = stateOfMatter.chargeNumberOfIon(substanceData,T,p,v,I);

      i = Modelica.Constants.F*z*substances.q "electric current";

      massFlows = substances.q .* MMb;
    end ChemicalSolution;

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

    redeclare function extends density_pTC
    protected
      Modelica.Units.SI.SpecificVolume sV[nS]=stateOfMatter.specificVolume(substanceData);
      Modelica.Units.SI.MolarVolume mV[nS]=MMb.*sV;
      Modelica.Units.SI.Concentration c_electroneutral[nS-1]=
        if
          (size(concentrations,1)==nS-2) then
                cat(1,concentrations[1:nS-2],{-(concentrations[1:nS-2]*zb[1:nS-2])})
        else concentrations[1:nS-1];
      Modelica.Units.SI.Concentration c[nS]=
        if
          (size(concentrations,1)<nS) then
          cat(1,c_electroneutral,{(1-(c_electroneutral*(mV[1:nS-1])))/sum(mV)})
        else
          concentrations;
    algorithm
      d:=c*MMb;
    end density_pTC;

    annotation (Documentation(revisions="<html>
<p><i>2021</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
<p>All rights reserved. </p>
</html>"));
  end BodyFluid;

  model check_Medium
    import Modelica.Units.SI.*;

    package Medium =
     Air;
     //BodyFluid;
     //BloodBySiggaardAndersen;
     //Water;

    //constants
    constant Integer nX = Medium.nX;
    constant Integer nXi = Medium.nXi;
    constant Integer nC = Medium.nC;

    constant MolarMass MMb[Medium.nS] = Medium.MMb "Molar mass of substance base molecues";

    //Density d_pTC=Medium.density_pTC(p,T,{135,24,5,5,3,105,1.5,0.5,0.7,0.8,1e-6});
    //Medium.density_pTC(p,T,{0.44,8.16865,21.2679,1.512e-6,8.4,0.042,0.042,0.66,28,0.153,5.4,37.67});

    //state variables
    Pressure p;
    Temperature T;
    MassFraction X[Medium.nS] "mass fraction";
    parameter Boolean EnthalpyNotUsed = false;

    //functions for supporting Physiolibrary.Fluid.Interfaces
    Medium.ThermodynamicState state_pTX = Medium.setState_pTX(p,T,X);

    SpecificEnthalpy h_pTX = Medium.specificEnthalpy_pTX(p,T,X);
    SpecificEnthalpy h = Medium.specificEnthalpy(state_pTX);

    Temperature T_phX = Medium.temperature_phX(p,h,X);

    Medium.ThermodynamicState state_phX = Medium.setState_phX(p,h,X);

    Density d_pTX=Medium.density_pTX(p,T,X);
    Density d_phX=Medium.density_phX(p,h,X);
    Density d_state=Medium.density(state_pTX);

    MassFraction sumX = ones(Medium.nX)*X;

    //support of substances in Physiolibrary.Fluid.Components.ElasticVessel
    Medium.ChemicalSolution chemicalSolution(
       p=p, h=h, X=X, i=0, EnthalpyNotUsed=EnthalpyNotUsed);

    MassFraction _X[Medium.nS] = {100,40,47,760 - 187} .* MMb / ({100,40,47,760 - 187} * MMb);
  equation
    T=298.15; //310.15+1;
    p=100000; //101325+5000;
    X=Medium.reference_X;

    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)),
      experiment(
        StopTime=1,
        Tolerance=1e-05));
  end check_Medium;

  package Interfaces
    partial package PartialMedium

    extends Modelica.Media.Interfaces.PartialMedium;

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

      function j "Find index of extra substance"
        input String searchName "Name of extra substance to find in extraPropertiesNames";
        output Integer index "Index of searchName in extraPropertiesNames";
      algorithm
          index := -1;
          for i in 1:nS loop
            if ( Modelica.Utilities.Strings.isEqual(extraPropertiesNames[i], searchName)) then
             index := i;
            end if;
          end for;
          assert(index > 0, "Extra substance '" + searchName + "' is not present between extraPropertiesNames in Medium\n"
             + "Check parameters and medium model.");
      end j;



      replaceable partial model ChemicalSolution
        Chemical.Interfaces.SubstancePorts_a substances[nS];
        Physiolibrary.Types.RealIO.PressureInput p "pressure";
        Physiolibrary.Types.RealIO.SpecificEnthalpyInput h "specific enthalpy";
        Physiolibrary.Types.RealIO.MassFractionInput X[nS] "mass fractions of substances";
        Physiolibrary.Types.RealIO.ElectricCurrentInput _i "electric current from substances";

        Physiolibrary.Types.RealIO.MassFlowRateOutput massFlows[nS] "mass flows of substances";
        Physiolibrary.Types.RealIO.TemperatureOutput T "temperature";
        Physiolibrary.Types.RealIO.SpecificEnthalpyOutput actualStreamSpecificEnthalpies[nS] "specific enthalpies of substances in streams";
        Physiolibrary.Types.RealIO.ElectricPotentialOutput v "electric potential";


        parameter Boolean EnthalpyNotUsed=false annotation (
        Evaluate=true,
        HideResult=true,
        choices(checkBox=true),
        Dialog(tab="Advanced", group="Performance"));

      end ChemicalSolution;

      constant Modelica.Units.SI.ChargeNumberOfIon zb[nS] "Charge number of base molecules";
      constant Modelica.Units.SI.MolarMass MMb[nS] "Molar mass of base molecules";
      /*Be carefull: it could be different from molar mass of substance in solution */

      replaceable function density_pTC
        "Density at defined total amount of solvents base molecules per total volume"
        input Modelica.Units.SI.Pressure p "Pressure";
        input Modelica.Units.SI.Temperature T "Temperature";
        input Modelica.Units.SI.Concentration concentrations[:] "Total amount of base molecules per total volume (size can be nS-2 with electroneutrality and substance specificVolume usage, nS-1 with specificVolume usage or nS for all substances";
        /*Be carefull: it could be different from concentration of substance in solution */
        output Modelica.Units.SI.Density d "Density";
      end density_pTC;

       replaceable function concentrations_Xd
        "Total amount of base molecules per total volume (Be carefull: it could be different from concentration of substance particles in solution)"
        input Modelica.Units.SI.MassFraction X[:] "Mass fractions of substances (size can be nS-2 with electroneutrality and substance specificVolume usage, nS-1 with specificVolume usage or nS for all substances";
        input Modelica.Units.SI.Density d "Density";
        output Modelica.Units.SI.Concentration concentrations[nS] "Total amount of base molecules per total volume ";

      protected
        Modelica.Units.SI.Concentration c_lastbutone, c_last;
       algorithm

        c_lastbutone :=if (size(X, 1) == nS - 2) then (d*sum(X)/(MMb[nS]) - d*sum((zb[1:nS -
          2]) .* X ./ (MMb[1:nS - 2])) - d/MMb[nS])/(zb[nS - 1] - MMb[nS - 1]/MMb[nS]) else
          d*(X[nS - 1])/(MMb[nS - 1]);
               //electroneutrality: concentrations*zb = 0 & density: concentrations*MMb = d

        c_last :=if (size(X, 1) < nS) then (1/MMb[nS])*(d - d*sum(X[1:nS - 2] ./ MMb[1:nS - 2])
           - c_lastbutone*MMb[nS - 1]) else d*(X[nS])/(MMb[nS]);
            //density: concentrations*MMb = d

        concentrations :=cat(
          1,
          d*(X[1:nS - 2]) ./ (MMb[1:nS - 2]),
          {c_lastbutone,c_last});
       end concentrations_Xd;

      annotation (Documentation(revisions="<html>
<p><i>2021</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
<p>All rights reserved. </p>
</html>"));
    end PartialMedium;
  end Interfaces;

end Media;

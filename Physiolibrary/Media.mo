within Physiolibrary;
package Media
  extends Modelica.Icons.Package;

  package Blood "Blood"
    extends Media.Interfaces.PartialMedium(
      mediumName = "Blood",
      substanceNames={"RBC","O2","CO2","CO","Hb","MetHb","HbF","Alb","Glb","PO4","DPG",
        "Glucose","Lactate","Urea","AminoAcids","Lipids","Ketoacids",
        "SID",
        "Epinephrine","Norepinephrine","Vasopressin",
        "Insulin","Glucagon","Thyrotropin","Thyroxine","Leptin",
        "Desglymidodrine","AlphaBlockers","BetaBlockers",
        "AnesthesiaVascularConductance",
        "Angiotensin2","Renin","Aldosterone",
        "H+","H2O"},
      reference_X=cat(
          1,
          Conc .* C2X[1:nS-1],
          {1 - (Conc*C2X[1:nS-1])}),
      SubstanceFlowNominal={D_Hct,D_Arterial_O2,
        D_Arterial_CO2,1,D_Hb,D_MetHb,D_HbF,D_Alb,D_Glb,D_PO4,D_DPG,D_Glucose,
        D_Lactate,D_Urea,D_AminoAcids,D_Lipids,D_Ketoacids,D_SID,
        D_Epinephrine,
        D_Norepinephrine,D_Vasopressin,D_Insulin,D_Glucagon,D_Thyrotropin,
        D_Thyroxine,D_Leptin,1,1,1,D_AnesthesiaVascularConductance,D_Angiotensin2,
        D_Renin,D_Aldosterone,
        1,1} ./
        TimeScale,
      zb = {  0,0,0,0,0,0,0,0,0,0,0,
              0,-1,0,0,0,-1,
              -1,
              0,0,0,
              0,0,0,0,0,
              0,0,0,
              0,
              0,0,0,
              1,0},
      MMb= {1098, 0.032, 0.044, 0.059, 65.494/4, 65.494/4, 65.494/4, 66.463, 1, 0.095, 0.266,
              0.1806, 0.09008, 0.06006, 0.1, 0.80645, 0.102,
              0.031,
              0.183204, 0.16918, 1.084,
              5.808, 3.485, 28, 0.777, 16.026,
              0.19723,0.3,0.26,
              1,
              1.046,48,0.36044,
              0.019, 0.018},
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
    package stateOfMatter = Chemical.Interfaces.Incompressible
      "Substances model to translate data into substance properties";

    redeclare connector extends SubstancesPort
         Chemical.Interfaces.SubstancePort_a CO2 "Free carbon dioxide molecule";
         Chemical.Interfaces.SubstancePort_a O2 "Free oxygen molecule";
         Chemical.Interfaces.SubstancePort_a CO "Free carbon monoxide moelcule";
         Chemical.Interfaces.SubstancePort_a HCO3 "Free bicarbonate molecule";
         Chemical.Interfaces.SubstancePort_a H3O "Free hydronium molecule";
         Chemical.Interfaces.SubstancePort_a H "Free protons";
         Chemical.Interfaces.SubstancePort_a H2O "Free water molecule (in pure water is only cca 1 mol/kg free water molecules, other cca 54.5 mols are bounded together by hydrogen bonds)";
    end SubstancesPort;

    redeclare replaceable model extends ChemicalSolution
      "Free chemical substances"

      // protected
      Real I = 0 "mole-fraction-based ionic strength";
      Real C[nS - 1]=(X[1:(nS - 1)] ./ C2X[1:(nS - 1)]);

      parameter Real composited[nS]={0,0,0,0,
        0,0,0,0,0,0,0,
        1,0,0,0,0,0,
        0,
        0,0,0,
        0,0,0,0,0,
        0,0,0,
        0,
        0,0,0,
        0,1};

      Real x_add[nS]={0,aO2,aCO2,aCO,
        0,0,0,0,0,0,0,
        0,0,0,0,0,0,
        0,
        0,0,0,
        0,0,0,0,0,
        0,0,0,
        0,
        0,0,0,
        0,0};

      Real x[nS]=x_add .+ (X ./ C2X)/(sum(X .* composited ./ C2X)+sum(x_add)) "Mole fractions of substances";
      Real xx[nS]=x_add .+ (substanceMasses ./ MMb) / (sum(substanceMasses .* composited ./ MMb)+sum(x_add));

      ThermodynamicState state;
      BloodGases bloodGases(
        p=p,
        T=T,
        C=C);
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
         Real uPO4,uGlucose,uLactace,uUrea,uAminoAcids,uLipids,uKetoAcids,uSID;

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

      u_water = Modelica.Constants.R*T*log(x[i("H2O")])  +  water_G;

      uPO4 = Modelica.Constants.R*T*log(x[i("PO4")])  +  water_G;
      uGlucose = Modelica.Constants.R*T*log(x[i("Glucose")]) +  water_G;
      uLactace = Modelica.Constants.R*T*log(x[i("Lactate")]) +  water_G;
      uUrea = Modelica.Constants.R*T*log(x[i("Urea")]) +  water_G;
      uAminoAcids = Modelica.Constants.R*T*log(x[i("AminoAcids")]) +  water_G;
      uLipids = Modelica.Constants.R*T*log(x[i("Lipids")]) +  water_G;
      uKetoAcids = Modelica.Constants.R*T*log(x[i("Ketoacids")]) +  water_G;
      uSID = Modelica.Constants.R*T*log(x[i("SID")]) +  water_G;
       //TODO202304: + z*Modelica.Constants.F*electricPotential;


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
          substances.H.q * Substances.H.MolarWeight + substances.H3O.q * Substances.H3O.MolarWeight,
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
         Chemical.Interfaces.Incompressible.specificEnthalpy(Substances.H,T,p,v,I),
         Chemical.Interfaces.Incompressible.specificEnthalpy(Substances.Water,T,p,v,I)};
    end specificEnthalpies_TpvI;
    constant Real ArterialDefault[nS - 2]={D_Hct,D_Arterial_O2,
        D_Arterial_CO2,D_CO,D_Hb,D_MetHb,D_HbF,D_Alb,D_Glb,D_PO4,D_DPG,D_Glucose,
        D_Lactate,D_Urea,D_AminoAcids,D_Lipids,D_Ketoacids,D_SID,
        D_Epinephrine, D_Norepinephrine, D_Vasopressin, D_Insulin, D_Glucagon,
        D_Thyrotropin, D_Thyroxine, D_Leptin,
        D_Desglymidodrine, D_AlphaBlockers, D_BetaBlockers,
        D_AnesthesiaVascularConductance, D_Angiotensin2,
        D_Renin, D_Aldosterone}
      "Default composition of arterial blood";

    constant Real VenousDefault[nS - 2]={D_Hct,D_Venous_O2,D_Venous_CO2,
        D_CO,D_Hb,D_MetHb,D_HbF,D_Alb,D_Glb,D_PO4,D_DPG,D_Glucose,D_Lactate,
        D_Urea,D_AminoAcids,D_Lipids,D_Ketoacids,D_SID,
        D_Epinephrine, D_Norepinephrine, D_Vasopressin, D_Insulin, D_Glucagon,
        D_Thyrotropin, D_Thyroxine, D_Leptin,
        D_Desglymidodrine, D_AlphaBlockers, D_BetaBlockers,
        D_AnesthesiaVascularConductance, D_Angiotensin2,
        D_Renin, D_Aldosterone}
      "Default composition of venous blood";

    constant Real TimeScale=6000 "Time scale of simulation";

    constant Real ExtraSubstancesDefault[nC]= fill(Modelica.Constants.small,nC)
                         "Default amounts of extra substances per kilogram";


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
        D_Epinephrine = 1e-9 * D_Epinephrine_ng / MMb[i("Epinephrine")] "Default epinephrine [mmol/L]",
        D_Norepinephrine = 1e-9 * D_Norepinephrine_ng / MMb[i("Norepinephrine")] "Dafault norepinephrine [mmol/L]",
        D_Vasopressin = 1e-9 * D_Vasopressin_pmol "Defaul vasopresin (ADH) [mmol/L]",
        D_Insulin = 6e-9 * D_Insulin_mU "Default insulin [mmol/L] - conversion factor for human insulin is 1 mU/L = 6.00 pmol/L",
        D_Glucagon = 1e-9 * D_Glucagon_ng / MMb[i("Glucagon")] "Default glucagon [mmol/L]",
        D_Thyrotropin = 1e-9 * D_Thyrotropin_pmol "Default thyrotropin [mmol/L]",
        D_Thyroxine = 1e-6 * D_Thyroxine_ug / MMb[i("Thyroxine")] "Default thyroxin T3 and T4 [mmol/L]",
        D_Leptin = 1e-6 * D_Leptin_ug / MMb[i("Leptin")] "Default leptin [mmol/L]",
        D_Desglymidodrine = 1e-6 * D_Desglymidodrine_ug / MMb[i("Desglymidodrine")] "Default desglymidodrine [mmol/L]",
        D_AlphaBlockers = D_AlphaBlockers_f "Default aplpha blockers effect [%/L]",
        D_BetaBlockers = D_BetaBlockers_f "Default beta blockers effect [%/L]",
        D_AnesthesiaVascularConductance = D_AnesthesiaVascularConductance_f "Default effect of anesthesia to vascular conductance [%/L]",
        D_Angiotensin2 = 1e-9 * D_Angiotensin2_ng / MMb[i("Angiotensin2")] "Default angiotensin II [mmol/L]",
        D_Renin = 1e-12 * 0.6 * 11.2 * D_Renin_ng_mL_h / MMb[i("Renin")] "Default renin [mU/L] - conversion factor PRA (ng/mL/h) to DRC (mU/L) is 11.2, μIU/mL (mIU/L) * 0.6 = pg/mL",
        D_Aldosterone = 1e-6 * D_Aldosterone_nmol "Default aldosterone [mmol/L]";

    constant Real CapyllaryMembrane_KC[nS](each final unit="mol2.s-1.J-1")={
    0,1,1,1,0,0,0,0,0,1,0,1,1,1,1,1,1,1,
    1,1,1,
    1,1,1,1,1,
    1,0,0,
    0,
    1,1,1,
    0,1}./TimeScale;

    constant Modelica.Units.SI.Concentration Conc[nS - 1] = cat(1,ArterialDefault,{-ArterialDefault*zb[1:nS-2]}) "Default concentrations of substance base molecules except water";

    constant Real C2X[nS]= MMb ./ density_pTC(reference_p, reference_T, ArterialDefault) "Default concentrations to mass fractions coefficients X[i]=C[i]*C2X[i]  [kg/kg = mmol/L * (kg/mol)/(kg/m3)]";

    constant SpecificHeatCapacity _cp=3490 "specific heat capacity of blood";



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

    replaceable model BloodGases "Hydrogen Ion, Carbon Dioxide, and Oxygen in the Blood"
      input Real C[nS - 1](nominal=SubstanceFlowNominal[1:nS-1])=Conc
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
      Physiolibrary.Types.VolumeFraction Hct=C[i("RBC")] "haematocrit";
      Physiolibrary.Types.Concentration tO2=C[i("O2")] "oxygen content per volume of blood";
      Physiolibrary.Types.Concentration tCO2=C[i("CO2")]
        "carbon dioxide content per volume of blood";
      Physiolibrary.Types.Concentration tCO(nominal=SubstanceFlowNominal[i("CO")])=C[i("CO")]
        "carbon monoxide content per volume of blood";
      Physiolibrary.Types.Concentration tHb=C[i("Hb")]
        "hemoglobin content per volume of blood";
      Physiolibrary.Types.MoleFraction FMetHb=C[i("MetHb")]/C[i("Hb")] "fraction of methemoglobin";
      Physiolibrary.Types.MoleFraction FHbF=C[i("HbF")]/C[i("Hb")] "fraction of foetalhemoglobin";
      Physiolibrary.Types.Concentration ctHb_ery=C[i("Hb")]/C[i("RBC")]
        "hemoglobin concentration in red cells";
      Physiolibrary.Types.Concentration tAlb=C[i("Alb")]
        "albumin concentration in blood plasma";
      Physiolibrary.Types.MassConcentration tGlb=C[i("Glb")]
        "globulin concentration in blood plasma";
      Physiolibrary.Types.Concentration tPO4=C[i("PO4")]
        "inorganic phosphates concentration in blood plasma";
      Physiolibrary.Types.Concentration cDPG=C[i("DPG")] "DPG concentration in blood plasma";
      Physiolibrary.Types.Concentration SID=C[i("SID")] "strong ion difference of blood";

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
        "Van Slyke (simplified electroneutrality equation)";
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

    redeclare function extends density_pTC "Density"
    algorithm
      d := 1057;
      annotation (Documentation(info="<html>
<p>constant density</p>
</html>"));
    end density_pTC;

    redeclare replaceable function extends specificEnthalpy "Specific enthalpy"
    algorithm
      h := state.h; //specificEnthalpies_TpvI(state.T,state.p)*state.X;
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

  end Blood;

  package Water "Incompressible water with constant heat capacity"
    extends Interfaces.PartialMedium(
      zb = stateOfMatter.chargeNumberOfIon({Substances.Water}),
      MMb = stateOfMatter.molarMassOfBaseMolecule({Substances.Water}),
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
       Modelica.Electrical.Analog.Interfaces.Pin catode "Electric catode";
       Modelica.Electrical.Analog.Interfaces.Pin anode "Electric anode";
    end SubstancesPort;
  public

    redeclare replaceable model extends ChemicalSolution
    protected
        Real I = 0 "mole-fraction-based ionic strength";
        Real logH,logOH,logO2,logH2,eq;
    equation
      v=substances.catode.v-substances.anode.v;
      0=substances.catode.i+substances.anode.i;
      _i = substances.catode.i;
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
      redeclare connector extends SubstancesPort
       Chemical.Interfaces.SubstancePort_a O2 "Gaseous oxygen molecule";
       Chemical.Interfaces.SubstancePort_a CO2 "Gaseous hydrogen molecule";
       Chemical.Interfaces.SubstancePort_a H2O "Gaseous H2O molecule";
       Chemical.Interfaces.SubstancePort_a N2 "Gaseaous nitrogen molecule";
      end SubstancesPort;

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


        substances.O2.u = stateOfMatter.electroChemicalPotentialPure( Substances.O2_g, T, p, v, I) +
                         Modelica.Constants.R*T*log(x_baseMolecule[i("O2")]);
        substances.CO2.u = stateOfMatter.electroChemicalPotentialPure( Substances.CO2_g, T, p, v, I) +
                         Modelica.Constants.R*T*log(x_baseMolecule[i("CO2")]);
        substances.H2O.u = stateOfMatter.electroChemicalPotentialPure( Substances.H2O_g, T, p, v, I) +
                         Modelica.Constants.R*T*log(x_baseMolecule[i("H2O")]);
        substances.N2.u = stateOfMatter.electroChemicalPotentialPure( Substances.N2_g, T, p, v, I) +
                         Modelica.Constants.R*T*log(x_baseMolecule[i("N2")]);
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


        massFlows[i("O2")] = substances.O2.q * Substances.O2_g.MolarWeight;
        massFlows[i("CO2")] = substances.CO2.q * Substances.CO2_g.MolarWeight;
        massFlows[i("H2O")] = substances.H2O.q * Substances.H2O_g.MolarWeight;
        massFlows[i("N2")] = substances.N2.q * Substances.N2_g.MolarWeight;

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
      substanceNames={"Na","HCO3","K","Glucose","Urea","Cl","Ca","Mg","Alb",
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


      substances.Na.u = stateOfMatter.electroChemicalPotentialPure( Substances.Na, T, p, v, I) +
                       Modelica.Constants.R*T*log(x_baseMolecule[i("Na")]);
      substances.HCO3.u = stateOfMatter.electroChemicalPotentialPure( Substances.HCO3, T, p, v, I) +
                       Modelica.Constants.R*T*log(x_baseMolecule[i("HCO3")]);
      substances.K.u = stateOfMatter.electroChemicalPotentialPure( Substances.K, T, p, v, I) +
                       Modelica.Constants.R*T*log(x_baseMolecule[i("K")]);
      substances.Glucose.u = stateOfMatter.electroChemicalPotentialPure( Substances.Glucose, T, p, v, I) +
                       Modelica.Constants.R*T*log(x_baseMolecule[i("Glucose")]);
      substances.Urea.u = stateOfMatter.electroChemicalPotentialPure( Substances.Urea, T, p, v, I) +
                       Modelica.Constants.R*T*log(x_baseMolecule[i("Urea")]);
      substances.Cl.u = stateOfMatter.electroChemicalPotentialPure( Substances.Cl, T, p, v, I) +
                       Modelica.Constants.R*T*log(x_baseMolecule[i("Cl")]);
      substances.Ca.u = stateOfMatter.electroChemicalPotentialPure( Substances.Ca, T, p, v, I) +
                       Modelica.Constants.R*T*log(x_baseMolecule[i("Ca")]);
      substances.Mg.u = stateOfMatter.electroChemicalPotentialPure( Substances.Mg, T, p, v, I) +
                       Modelica.Constants.R*T*log(x_baseMolecule[i("Mg")]);
      substances.H2O.u = stateOfMatter.electroChemicalPotentialPure( Substances.Water, T, p, v, I) +
                       Modelica.Constants.R*T*log(x_baseMolecule[i("H2O")]);


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


      massFlows[i("Na")] = substances.Na.q * Substances.Na.MolarWeight;
      massFlows[i("HCO3")] = substances.HCO3.q * Substances.HCO3.MolarWeight;
      massFlows[i("K")] = substances.K.q * Substances.K.MolarWeight;
      massFlows[i("Glucose")] = substances.Glucose.q * Substances.Glucose.MolarWeight;
      massFlows[i("Urea")] = substances.Urea.q * Substances.Urea.MolarWeight;
      massFlows[i("Cl")] = substances.Cl.q * Substances.Cl.MolarWeight;
      massFlows[i("Ca")] = substances.Ca.q * Substances.Ca.MolarWeight;
      massFlows[i("Mg")] = substances.Mg.q * Substances.Mg.MolarWeight;
      massFlows[i("H2O")] = substances.H2O.q * Substances.Water.MolarWeight;
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
       substanceMassFlowsFromStream = {0,0,0,0},
       p=p, h=h, X=X, _i=0);

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

      replaceable connector SubstancesPort

      annotation (
          Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}, initialScale = 0.2), graphics={  Rectangle(extent = {{-20, 2}, {20, -2}}, lineColor = {0, 0, 255}, lineThickness = 0.5), Polygon(points = {{-80, 50}, {80, 50}, {100, 30}, {80, -40}, {60, -50}, {-60, -50}, {-80, -40}, {-100, 30}, {-80, 50}}, lineColor = {0, 0, 0}, fillColor = {158,66,200}, fillPattern = FillPattern.Solid), Ellipse(extent = {{-65, 25}, {-55, 15}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid), Ellipse(extent = {{-5, 25}, {5, 15}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid), Ellipse(extent = {{55, 25}, {65, 15}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid), Ellipse(extent = {{-35, -15}, {-25, -25}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid), Ellipse(extent = {{25, -15}, {35, -25}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid)}),
          Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}, initialScale = 0.2), graphics={  Polygon(points = {{-40, 25}, {40, 25}, {50, 15}, {40, -20}, {30, -25}, {-30, -25}, {-40, -20}, {-50, 15}, {-40, 25}}, lineColor = {0, 0, 0}, fillColor = {158,66,200}, fillPattern = FillPattern.Solid), Ellipse(extent = {{-32.5, 7.5}, {-27.5, 12.5}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid), Ellipse(extent = {{-2.5, 12.5}, {2.5, 7.5}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid), Ellipse(extent = {{27.5, 12.5}, {32.5, 7.5}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid), Ellipse(extent = {{-17.5, -7.5}, {-12.5, -12.5}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid), Ellipse(extent = {{12.5, -7.5}, {17.5, -12.5}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid), Text(extent = {{-150, 70}, {150, 40}}, lineColor = {0, 0, 0}, textString = "%name")}),
          Documentation(info = "<html>
        <p>
        This connector defines the \"substances port\" that
        is used for cross-membrane transports of selected free base chemical substances.
        </p>
        </html>"));
      end SubstancesPort;

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




      constant Modelica.Units.SI.ChargeNumberOfIon zb[nS] "Charge number of base molecules";
      constant Modelica.Units.SI.MolarMass MMb[nS] "Molar mass of base molecules";
      /*Be carefull: it could be different from molar mass of substance in solution */
      constant Modelica.Units.SI.MassFlowRate SubstanceFlowNominal[nS]=ones(nS) "Nominal of substance flow";
      constant Modelica.Units.SI.SpecificEnthalpy SpecificEnthalpyNominal=-1E6 "Nominal of specific enthalpy";


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


      annotation (Documentation(revisions="<html>
<p><i>2021</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
<p>All rights reserved. </p>
</html>"));
    end PartialMedium;
  end Interfaces;

  package Substances
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

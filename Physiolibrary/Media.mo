within Physiolibrary;
package Media "Models of physiological fluids"
  extends Modelica.Icons.Package;

  package Blood "Blood"
    import Chemical.Interfaces.Properties;
    import Physiolibrary.Media.Substances.*;
    import Physiolibrary.Media.InitialValues.*;

    extends Media.Interfaces.PartialMedium(
      mediumName = "Blood",
      substanceNames={"H2O_P","H2O_E","O2","CO2_P","CO2_E","CO","eHb","MetHb","HbF","Alb","Glb","PO4","SO4_P","DPG",
        "Glucose","Lactate","Urea","AminoAcids","Lipids","KetoAcids",
        "Na_P","K_P","Na_E","K_E","Cl_P","Cl_E",
        "Epinephrine", "Norepinephrine","Vasopressin",
        "Insulin","Glucagon","Thyrotropin","Thyroxine","Leptin",
        "Desglymidodrine",
        "Angiotensin2","Renin","Aldosterone",
        "Other_P","Other_E"},
      substanceData = {
      Substances.Water, Substances.Water, Substances.O2, Substances.CO2, Substances.CO2, Substances.CO,
      Substances.Hb, Substances.Hb, Substances.Hb, Substances.Alb, Substances.Glb, Substances.PO4, Substances.SO4, Substances.DPG,
      Substances.Glucose, Substances.Lactate, Substances.Urea, Substances.AminoAcid, Substances.Lipid, Substances.KetoAcid,
      Substances.Na, Substances.K,Substances.Na, Substances.K, Substances.Cl, Substances.Cl,
      Substances.Epinephrine, Substances.Norepinephrine, Substances.Vasopressin,
      Substances.Insulin, Substances.Glucagon, Substances.Thyrotropin, Substances.Thyroxine, Substances.Leptin,
      Substances.Desglymidodrine,
      Substances.Angiotensin2, Substances.Renin, Substances.Aldosterone,
      Substances.Water, Substances.Water},
      extraPropertiesNames={
        "AlphaBlockers",
        "BetaBlockers",
        "AnesthesiaVascularConductance"},
      reference_X=ArterialDefault,
      C_default=CDefault,
      SubstanceFlowNominal=ArterialDefault ./ Constants.TimeScale,
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

  /*protected 
   constant Chemical.Interfaces.Definition substanceData[nS] = {
    Substances.Water, Substances.Water, Substances.O2, Substances.CO2, Substances.CO2, Substances.CO,
    Substances.Hb, Substances.Hb, Substances.Hb, Substances.Alb, Substances.Glb, Substances.PO4, Substances.SO4, Substances.DPG,
    Substances.Glucose, Substances.Lactate, Substances.Urea, Substances.AminoAcid, Substances.Lipid, Substances.KetoAcid,
    Substances.Na, Substances.K,Substances.Na, Substances.K, Substances.Cl, Substances.Cl,
    Substances.Epinephrine, Substances.Norepinephrine, Substances.Vasopressin,
    Substances.Insulin, Substances.Glucagon, Substances.Thyrotropin, Substances.Thyroxine, Substances.Leptin,
    Substances.Desglymidodrine,
    Substances.Angiotensin2, Substances.Renin, Substances.Aldosterone,
    Substances.Water, Substances.Water};
*/
  public
    constant Types.MassFraction ArterialDefault[nS]={
    0.47412413,0.2601168,0.00024730066,0.00060046016,0.00028486399,4.0067286e-11,0.12881933,
    0.0006506026,0.0006506026,0.023240043,0.0148344375,7.7006625e-06,7.125722e-06,0.0005979338,0.00058174727,
    4.9633483e-05,0.00021128391,0.00026331126,0.0005255277,2.637139e-06,0.0016869484,8.2860926e-05,
    6.699073e-05,0.0015625204,0.001824165,0.00084811833,2.1192053e-11,1.2715232e-10,1.0567206e-12,
    3.675887e-10,3.6916557e-11,5.978278e-11,4.2172186e-08,4.2172186e-09,5.298013e-15,1.0596027e-11,
    7.12053e-15,6.301733e-11,0.025004309,0.06310861} "Default mass fraction in arterial blood";



    constant Types.MassFraction VenousDefault[nS]={
    0.47074193,0.26349896,0.0001659035,0.00065926806,0.00033021162,4.0067286e-11,0.12881933,
    0.0006506026,0.0006506026,0.023240043,0.0148344375,7.7006625e-06,7.125722e-06,0.0005979338,0.00058174727,
    4.9633483e-05,0.00021128391,0.00026331126,0.0005255277,2.637139e-06,0.0016869484,8.2860926e-05,
    6.699073e-05,0.0015625204,0.001792111,0.0008801724,2.1192053e-11,1.2715232e-10,1.0567206e-12,
    3.675887e-10,3.6916557e-11,5.978278e-11,4.2172186e-08,4.2172186e-09,5.298013e-15,1.0596027e-11,
    7.12053e-15,6.301733e-11,0.028359752,0.059730403} "Default mass fraction in venous blood";


    constant Types.MassFraction CDefault[nC]={
    1e-20,1e-20,1e-06};

    function plasmaMassFraction "Blood plasmacrit [kg/kg]"
      extends GetFraction;
    protected
      constant Boolean includeOther=true;
    algorithm
      F := state.X[Utilities.findIndex("H2O_P",substanceNames)] +
           state.X[Utilities.findIndex("CO2_P",substanceNames)] +
           state.X[Utilities.findIndex("Alb",substanceNames)] +
           state.X[Utilities.findIndex("Glb",substanceNames)] +
           state.X[Utilities.findIndex("Glucose",substanceNames)] +
           state.X[Utilities.findIndex("PO4",substanceNames)] +
           state.X[Utilities.findIndex("SO4_P",substanceNames)] +
           state.X[Utilities.findIndex("Lactate",substanceNames)] +
           state.X[Utilities.findIndex("Urea",substanceNames)] +
           state.X[Utilities.findIndex("AminoAcids",substanceNames)] +
           state.X[Utilities.findIndex("Lipids",substanceNames)] +
           state.X[Utilities.findIndex("KetoAcids",substanceNames)] +
           state.X[Utilities.findIndex("Na_P",substanceNames)] +
           state.X[Utilities.findIndex("K_P",substanceNames)] +
           state.X[Utilities.findIndex("Cl_P",substanceNames)] +
           state.X[Utilities.findIndex("Epinephrine",substanceNames)] +
           state.X[Utilities.findIndex("Norepinephrine",substanceNames)] +
           state.X[Utilities.findIndex("Vasopressin",substanceNames)] +
           state.X[Utilities.findIndex("Insulin",substanceNames)] +
           state.X[Utilities.findIndex("Glucagon",substanceNames)] +
           state.X[Utilities.findIndex("Thyrotropin",substanceNames)] +
           state.X[Utilities.findIndex("Thyroxine",substanceNames)] +
           state.X[Utilities.findIndex("Leptin",substanceNames)] +
           state.X[Utilities.findIndex("Desglymidodrine",substanceNames)] +
           state.X[Utilities.findIndex("Angiotensin2",substanceNames)] +
           state.X[Utilities.findIndex("Renin",substanceNames)] +
           state.X[Utilities.findIndex("Aldosterone",substanceNames)] +
           (if (includeOther) then state.X[Utilities.findIndex("Other_P",substanceNames)] else 0);
      annotation (Documentation(info="<html>
<p>Mass of blood plasma per mass of blood. </p>
</html>"));
    end plasmaMassFraction;

    function plasmaSpecificAmountOfParticles "Amount of free particles in 1 kg of blood plasma"
      extends GetMolality;
      input Types.Temperature T = temperature(state);
      input Types.MassFraction pct = plasmaMassFraction(state);
    algorithm

     B := (
     state.X[Utilities.findIndex("H2O_P",substanceNames)]*Chemical.Interfaces.Properties.specificAmountOfParticles(Substances.Water,
        Chemical.Interfaces.SolutionState(Chemical.Interfaces.Phase.Aqueous,T,state.p, state.v)) +
     state.X[Utilities.findIndex("Cl_P",substanceNames)]/Cl.data.MM +
     state.X[Utilities.findIndex("Na_P",substanceNames)]/Na.data.MM +
     state.X[Utilities.findIndex("K_P",substanceNames)]/K.data.MM +
     state.X[Utilities.findIndex("CO2_P",substanceNames)]/CO2.data.MM +
     state.X[Utilities.findIndex("Alb",substanceNames)]/Constants.MM_Alb +
     state.X[Utilities.findIndex("Glb",substanceNames)]/Constants.MM_Glb +
     state.X[Utilities.findIndex("Glucose",substanceNames)]/Constants.MM_Glucose +
     state.X[Utilities.findIndex("PO4",substanceNames)]/PO4.data.MM +
     state.X[Utilities.findIndex("SO4_P",substanceNames)]/SO4.data.MM +
     state.X[Utilities.findIndex("Lactate",substanceNames)]/Constants.MM_Lactate +
     state.X[Utilities.findIndex("Urea",substanceNames)]/Constants.MM_Urea +
     state.X[Utilities.findIndex("AminoAcids",substanceNames)]/Constants.MM_AminoAcids +
     state.X[Utilities.findIndex("Lipids",substanceNames)]/Constants.MM_Lipids +
     state.X[Utilities.findIndex("KetoAcids",substanceNames)]/Constants.MM_KetoAcids)/pct;
      annotation (Documentation(info="<html>
<p>Amount of particles in blood plasma per mass of blood plasma. </p>
</html>"));
    end plasmaSpecificAmountOfParticles;

    function formedElementsMassFraction "Blood hematocrit [kg/kg]"
      extends GetFraction;
    protected
      constant Boolean includeOther=true;
    algorithm
      F :=state.X[Utilities.findIndex("H2O_E",substanceNames)] +
          state.X[Utilities.findIndex("O2",substanceNames)] +
          state.X[Utilities.findIndex("CO2_E",substanceNames)] +
          state.X[Utilities.findIndex("CO",substanceNames)] +
          state.X[Utilities.findIndex("eHb",substanceNames)] +
          state.X[Utilities.findIndex("MetHb",substanceNames)] +
          state.X[Utilities.findIndex("HbF",substanceNames)] +
          state.X[Utilities.findIndex("DPG",substanceNames)] +
          state.X[Utilities.findIndex("Na_E",substanceNames)] +
          state.X[Utilities.findIndex("K_E",substanceNames)] +
          state.X[Utilities.findIndex("Cl_E",substanceNames)] +
          (if (includeOther) then state.X[Utilities.findIndex("Other_E",substanceNames)] else 0);

      annotation (Documentation(info="<html>
<p>Mass of formed elements per mass of blood.</p>
</html>"));
    end formedElementsMassFraction;

    function formedElementsSpecificAmountOfParticles "Amount of free particles in 1 kg of blood formed elements"
      extends GetMolality;
      input Types.Temperature T= temperature(state);
      input Types.MassFraction hct= formedElementsMassFraction(state);

    algorithm
     B := (
     state.X[Utilities.findIndex("H2O_E",substanceNames)]*Properties.specificAmountOfParticles(Substances.Water,Chemical.Interfaces.SolutionState(Chemical.Interfaces.Phase.Aqueous,T,state.p,state.v)) +
     state.X[Utilities.findIndex("CO2_E",substanceNames)]/CO2.data.MM +
     state.X[Utilities.findIndex("K_E",substanceNames)]/K.data.MM +
     state.X[Utilities.findIndex("Na_E",substanceNames)]/Na.data.MM +
     state.X[Utilities.findIndex("Cl_E",substanceNames)]/Cl.data.MM +
     (state.X[Utilities.findIndex("eHb",substanceNames)] + state.X[Utilities.findIndex("MetHb",substanceNames)] + state.X[Utilities.findIndex("HbF",substanceNames)])/Constants.MM_Hb +
     state.X[Utilities.findIndex("DPG",substanceNames)]/Constants.MM_DPG)
      /hct;
      annotation (Documentation(info="<html>
<p>Amount of particles in red cells per mass of red cells.</p>
</html>"));
    end formedElementsSpecificAmountOfParticles;

    model ArterialComposition "To set mass fractions in blood"

      Types.Temperature T = 310.15;
      Types.Pressure p = 101325;
      Types.ElectricPotential v = 0;

      Types.VolumeFraction hematocrit = D_Hct "Hematocrit [ml/ml]";
      Types.Concentration tO2 = D_Arterial_O2 "Total oxygen in blood",
              tCO2 = D_Arterial_CO2 "Total carbon dioxide in blood",
              tCO = D_CO "Total carbon monoxide in blood",
              tHb = D_Hb "Total hemoglobin in blood";

      Types.Fraction FMetHb=D_MetHb/D_Hb "Methemoglobin fraction",
              FHbF=D_HbF/D_Hb "Foetal hemoglobin fraction";
      Types.Concentration tAlb = D_Alb "Total albumin in blood plasma";
      Types.MassConcentration tGlb = D_Glb "Total globulin in blood plasma";

      Types.Concentration tPO4 = D_PO4 "Total inorganic phosphate in blood plasma",
              tSO4 = D_SO4 "Total inorganic sulphate in blood plasma",
              cDPG = D_DPG "Diphosphoglycerate in red cells",
              glucose = D_Glucose "Glucose in blood plasma",
              lactate = D_Lactate "Lactate in blood plasma",
              urea = D_Urea "Urea in blood plasma",
              aminoAcids = D_AminoAcids "Amino acids in blood plasma",
              lipids = D_Lipids "Fatty acids in blood plasma",
              ketoacids = D_Ketoacids "Keto acids in blood plasma",
              BEox = D_BEox "Base excess of oxygenated blood";

       Types.MassConcentration
              epinephrine(displayUnit="ng/L")=D_Epinephrine_MC "Epinephrine in blood plasma",
              norepinephrine(displayUnit="ng/L")=D_Norepinephrine_MC "Norepinephrine in blood plasma";
       Types.Concentration
              vasopressin(displayUnit="pmol/L")=D_Vasopressin "ADH in blood plasma";
       Real   insulin(displayUnit="mU/L")=D_Insulin_A "Insulin in blood plasma";
       Types.MassConcentration
              glucagon(displayUnit="ng/L")=D_Glucagon_MC "Glucagon in blood plasma";
       Types.Concentration
              thyrotropin(displayUnit="pmol/L")=D_Thyrotropin "Thyrotropin in blood plasma";
       Types.MassConcentration
              thyroxine(displayUnit="ug/L")=D_Thyroxine_MC "Thyroxine blood plasma",
              leptin(displayUnit="ug/L")=D_Leptin_MC "Leptin in blood plasma",
              desglymidodrine(displayUnit="ug/L")=D_Desglymidodrine_MC "Desglymidodrine in blood plasma";
      Types.Fraction
              alphaBlockers = D_AlphaBlockers_f "Alpha blockers efffect",
              betaBlockers = D_BetaBlockers_f "Beta blockers efffect",
              anesthesiaVascularConductance = D_AnesthesiaVascularConductance_f "Anesthesia vasodilatation efffect";
      Types.MassConcentration
              angiotensin2(displayUnit="ng/L")=D_Angiotensin2_MC "A2 in blood plasma";
      Real renin(displayUnit="ng/mL/h")=D_Renin_PRA "Renin in blood plasma";
      Types.Concentration
              aldosterone(displayUnit="nmol/L")=D_Aldosterone "Aldosterone in blood plasma";

      Types.MassFraction XH2O = D_H2O_B "Water in blood";

      Types.Concentration cNa_P = D_Na "Sodium in blood plasma";
      Types.Concentration cK_P = D_K "Potassium in blood plasma";
      Types.Concentration cNa_E = D_Na_RBC "Sodium in erythrocytes";
      Types.Concentration cK_E = D_K_RBC "Potassium in erythrocytes";

      output Types.MassFraction X[nS];//(start = ArterialDefault);
      output Real C[nC];

      Types.Density density,plasmaDensity;
      Types.Fraction plasmacrit;
      Types.Concentration NSID;
      Types.Fraction XE(start=0.46),XP2(start=0.54),PMF(start=0.54);
      Types.SpecificEnthalpy h = X*Physiolibrary.Media.Blood.specificEnthalpies_Tpv( T,p);
      ThermodynamicState state = setState_phX(p, h, X) "State of blood";
      Physiolibrary.Media.Blood.BloodGases bloodGases(
        T=T,
        state=state,pO2(start=11608.745),pCO(start=1.000545e-05));

        Types.MassFraction pct "Plasmacrit [kg/kg]";
        Types.MassFraction hct "Hematocrit [kg/kg]";

       // Modelica.Units.SI.Molality fH2O_P "Amount of free H2O particles in 1 kg of blood plasma [mol/kg]";
        Modelica.Units.SI.Molality x_P(start=1.2) "Amount of free particles in 1 kg of blood plasma [mol/kg]";
        Modelica.Units.SI.Molality x_E(start=0.86) "Amount of free particles in 1 kg of blood erythrocytes [mol/kg]";

        Types.MoleFraction aH2O_P,aH2O_E;
        Types.MoleFraction  aCl_P, aCl_E, aHCO3, aHCO3_E;
        Types.Concentration H2O_plasma(start=D_BloodPlasmaWater) "Water in blood plasma";
        Types.Concentration H2O_ery(start=D_BloodFormedElementsWater) "Water in blood red cells";

         // debug of chloride shift:
        Modelica.Units.SI.Concentration cCl_P = (aCl_P*x_P)*plasmaDensity "Chloride in blood plasma";
        Modelica.Units.SI.Concentration cCl_E = (aCl_E*x_E)*formedElementsDensity(state) "Chloride in blood red cells";

        Modelica.Units.SI.Concentration cHCO3_P = (aHCO3*x_P)*plasmaDensity "Bicarbonate in blood plasma";
        Modelica.Units.SI.Concentration cHCO3_E  = (aHCO3_E*x_E)*formedElementsDensity(state) "Bicarbonate in blood red cells";

        Real aCO2_P;
    protected
      Chemical.Interfaces.SolutionState solutionState=Chemical.Interfaces.SolutionState(Chemical.Interfaces.Phase.Aqueous,T,p,v);
    equation
      density = D_BloodDensity;
      plasmaDensity = D_BloodPlasmaDensity;
      plasmacrit = 1-hematocrit;
      NSID = (1 - hematocrit) * (zAlbNAP * tAlb + zGlbNAP * tGlb + zPO4NAP * tPO4 + ztCO2NAP) + hematocrit * (zHbNAE * (tHb / hematocrit) + ztCO2NAE + zDPG*cDPG + zOtherE);

      X[Utilities.findIndex("H2O_P",substanceNames)] = (plasmacrit*H2O_plasma)/density;
      X[Utilities.findIndex("H2O_E",substanceNames)] = (hematocrit*H2O_ery)/density;
      X[Utilities.findIndex("O2",substanceNames)] = (tO2*O2.data.MM)/density;

      X[Utilities.findIndex("CO",substanceNames)] = (tCO*CO.data.MM)/density;
      X[Utilities.findIndex("eHb",substanceNames)] + X[Utilities.findIndex("MetHb",substanceNames)] + X[Utilities.findIndex("HbF",substanceNames)] = (tHb*Constants.MM_Hb)/density;
      X[Utilities.findIndex("MetHb",substanceNames)] = FMetHb*(tHb*Constants.MM_Hb)/density;
      X[Utilities.findIndex("HbF",substanceNames)] = FHbF*(tHb*Constants.MM_Hb)/density;
      X[Utilities.findIndex("Alb",substanceNames)] = plasmacrit*(tAlb*Constants.MM_Alb)/density;
      X[Utilities.findIndex("Glb",substanceNames)] = plasmacrit*tGlb/density;
      X[Utilities.findIndex("PO4",substanceNames)] = plasmacrit*(tPO4*PO4.data.MM)/density;
      X[Utilities.findIndex("SO4_P",substanceNames)] = plasmacrit*(tSO4*SO4.data.MM)/density;
      X[Utilities.findIndex("DPG",substanceNames)] = hematocrit*(cDPG*Constants.MM_DPG)/density;
      X[Utilities.findIndex("Glucose",substanceNames)] = plasmacrit*(glucose*Constants.MM_Glucose)/density;
      X[Utilities.findIndex("Lactate",substanceNames)] = plasmacrit*(lactate*Constants.MM_Lactate)/density;
      X[Utilities.findIndex("Urea",substanceNames)] = plasmacrit*(urea*Constants.MM_Urea)/density;
      X[Utilities.findIndex("AminoAcids",substanceNames)] = plasmacrit*(aminoAcids*Constants.MM_AminoAcids)/density;
      X[Utilities.findIndex("Lipids",substanceNames)] = plasmacrit*(lipids*Constants.MM_Lipids)/density;
      X[Utilities.findIndex("KetoAcids",substanceNames)] = plasmacrit*(ketoacids*Constants.MM_KetoAcids)/density;
      X[Utilities.findIndex("Na_P",substanceNames)] = plasmacrit*(cNa_P*Na.data.MM)/density;
      X[Utilities.findIndex("K_P",substanceNames)] = plasmacrit*(cK_P*K.data.MM)/density;
      X[Utilities.findIndex("Na_E",substanceNames)] = hematocrit*(cNa_E*Na.data.MM)/density;
      X[Utilities.findIndex("K_E",substanceNames)] = hematocrit*(cK_E*K.data.MM)/density;
      X[Utilities.findIndex("Epinephrine",substanceNames)] = plasmacrit*(epinephrine)/density;
      X[Utilities.findIndex("Norepinephrine",substanceNames)] = plasmacrit*(norepinephrine)/density;
      X[Utilities.findIndex("Vasopressin",substanceNames)] = plasmacrit*(vasopressin*Constants.MM_Vasopressin)/density;
      X[Utilities.findIndex("Insulin",substanceNames)] = plasmacrit*(6e-9*insulin*Constants.MM_Insulin)/density "conversion factor for human insulin is 1 mU/L = 6.00 pmol/L";
      X[Utilities.findIndex("Glucagon",substanceNames)] = plasmacrit*(glucagon)/density;
      X[Utilities.findIndex("Thyrotropin",substanceNames)] = plasmacrit*(thyrotropin*Constants.MM_Thyrotropin)/density;
      X[Utilities.findIndex("Thyroxine",substanceNames)] = plasmacrit*(thyroxine)/density;
      X[Utilities.findIndex("Leptin",substanceNames)] = plasmacrit*(leptin)/density;
      X[Utilities.findIndex("Desglymidodrine",substanceNames)] = plasmacrit*(desglymidodrine)/density;

      X[Utilities.findIndex("Angiotensin2",substanceNames)] = plasmacrit*(angiotensin2)/density;
      X[Utilities.findIndex("Renin",substanceNames)] = plasmacrit*(1e-12*0.6*11.2*renin)/density
        "conversion factor from PRA (ng/mL/h) to DRC (mU/L) is 11.2, μIU/mL (mIU/L) * 0.6 = pg/mL";
      X[Utilities.findIndex("Aldosterone",substanceNames)] = plasmacrit*(aldosterone*Constants.MM_Aldosterone)/density;

      PMF = plasmacrit * plasmaDensity/density;
      XP2 = plasmaMassFraction(state);
      XE = XP2*(1-PMF)/PMF;

      X[Utilities.findIndex("Other_P",substanceNames)] = PMF - plasmaMassFractionWithoutOther(state);
      X[Utilities.findIndex("Other_E",substanceNames)] = (1 - PMF) - formedElementsMassFractionWithoutOther(state);

      XH2O =X[Utilities.findIndex("H2O_P",substanceNames)] + X[Utilities.findIndex("H2O_E",substanceNames)];

      aH2O_P = aH2O_E "osmolarity";

      aH2O_P = state.X[Utilities.findIndex("H2O_P",substanceNames)]*Properties.specificAmountOfFreeBaseMolecule(Substances.Water,solutionState,(state.X[Utilities.findIndex("H2O_P",substanceNames)]/pct)*1,x_P*1) / (pct*x_P);
      aH2O_E = state.X[Utilities.findIndex("H2O_E",substanceNames)]*Properties.specificAmountOfFreeBaseMolecule(Substances.Water,solutionState,(state.X[Utilities.findIndex("H2O_E",substanceNames)]/hct)*1,x_E*1) / (hct*x_E);

      pct = plasmaMassFraction(state);
      hct = formedElementsMassFraction(state);

      x_P =plasmaSpecificAmountOfParticles(
          state,
          T,
          pct);
      x_E =formedElementsSpecificAmountOfParticles(
          state,
          T,
          hct);

      aHCO3 = bloodGases.cHCO3 / (x_P*plasmaDensity);
      aHCO3_E = bloodGases.cHCO3_E / (x_E*formedElementsDensity(state));

      X[Utilities.findIndex("CO2_P",substanceNames)] + X[Utilities.findIndex("CO2_E",substanceNames)] = (tCO2*CO2.data.MM)/density;
      state.X[Utilities.findIndex("CO2_P",substanceNames)] = homotopy((aCO2_P*x_P)*CO2.data.MM*pct,(26/plasmaDensity)*CO2.data.MM*pct);
      bloodGases.tCO2_P=(aCO2_P*x_P)*plasmaDensity;

      aHCO3*aCl_E = aCl_P*aHCO3_E "Chloride shift";
      X[Utilities.findIndex("Cl_P",substanceNames)] = (aCl_P*x_P)*Cl.data.MM*pct "Mass fraction of plasma Cl- in blood";
      X[Utilities.findIndex("Cl_E",substanceNames)] = (aCl_E*x_E)*Cl.data.MM*hct "Mass fraction of erythrocyte's Cl- in blood";
      X[Utilities.findIndex("Cl_P",substanceNames)] + X[Utilities.findIndex("Cl_E",substanceNames)] = -((NSID - BEox) - plasmacrit*(cNa_P + cK_P) - hematocrit*(cNa_E + cK_E))*Cl.data.MM/
        density "where blood SID = NSID - BEox";

      C[Utilities.findIndex("AlphaBlockers",extraPropertiesNames)] = 1e-6*alphaBlockers;
      C[Utilities.findIndex("BetaBlockers",extraPropertiesNames)] = 1e-6*betaBlockers;
      C[Utilities.findIndex("AnesthesiaVascularConductance",extraPropertiesNames)] = 1e-6*anesthesiaVascularConductance;
      annotation (experiment(StopTime=1, __Dymola_Algorithm="Dassl"), Documentation(info="<html>
<p>Calculate state of the medium from more human-like setting.</p>
</html>"));
    end ArterialComposition;

    replaceable model VenousComposition "To set mass fractions in blood"
      extends ArterialComposition(tO2=D_Venous_O2,tCO2=D_Venous_CO2);
       annotation (experiment(StopTime=1, __Dymola_Algorithm="Dassl"), Documentation(info="<html>
<p>Calculate state of the medium from more human-like setting.</p>
</html>"));
    end VenousComposition;

    redeclare replaceable record extends ThermodynamicState
      "A selection of variables that uniquely defines the thermodynamic state"
      extends Modelica.Icons.Record;
      AbsolutePressure p "Absolute pressure of medium";
      SpecificEnthalpy h "Specific enthalpy";
      MassFraction X[nS] "Mass fractions of substances";
      Types.ElectricPotential v "Electric potential";
      annotation (Documentation(info="<html>
  <p>Thermodynamic state of blood is represented by pressure, temperature, base substances composition, electrical potential and ionic strengh.</p>
</html>"));
    end ThermodynamicState;


    redeclare replaceable model extends ChemicalSolution (
      SubstancesToConnect={
    "CO2",
    "O2",
    "CO",
    "HCO3",
    "H",
    "OH",
    "H2O",
    "Na",
    "K",
    "Cl",
    "SO4",
    "PO4",
    "Glucose",
    "Lactate",
    "Urea",
    "AminoAcids",
    "Lipids",
    "KetoAcids",
    "Epinephrine",
    "Norepinephrine",
    "Vasopressin",
    "Insulin",
    "Glucagon",
    "Thyrotropin",
    "Thyroxine",
    "Leptin",
    "Desglymidodrine",
    "Angiotensin2",
    "Renin",
    "Aldosterone"})
      "Free chemical substances"
      //( substances(H2O(u(nominal=-225057)),Glucose(u(nominal=-910549))))

      import Physiolibrary.Utilities.*;

      Modelica.Units.SI.Temperature T = temperature(state);

      BloodGases bloodGases(
        T=T,
        state=state) "Model of blood gases";
      Modelica.Units.SI.MoleFraction aO2 "Gaseous O2 activity";
      Modelica.Units.SI.MoleFraction aCO2 "Gaseous CO2 activity";
      Modelica.Units.SI.MoleFraction aHCO3 "Mole fraction of HCO3- in blood plasma";
      Modelica.Units.SI.MoleFraction aHCO3_E "Mole fraction of HCO3- in blood red cell";
      Modelica.Units.SI.MoleFraction aCl_P(start = 0.103)
                                                         "Mole fraction of Cl- in blood plasma";
      Modelica.Units.SI.MoleFraction aCl_E(start = 0.050)
                                                         "Mole fraction of Cl- in blood red cell";
      Modelica.Units.SI.MoleFraction aH2O_E,aH2O_P;
      Types.MolarFlowRate Cl_Ery2Plasma,H2O_Ery2Plasma,CO2_Ery2Plasma;
      parameter Real KC_Cl = 1e-5 "Rate of chloride shift equilibration";
      parameter Real KC_H2O = 1e-2 "Rate of osmolarity equilibration";
      parameter Real KC_CO2 = 1e-5 "Rate of CO2 equilibration";


      Modelica.Units.SI.MoleFraction aCO "Gaseous CO activity";
      Modelica.Units.SI.MoleFraction aH_plus "Mole fraction of hydronium in blood plasma";


    public
        Types.MassFraction pct "Plasmacrit [kg/kg]";
        Types.MassFraction hct "Hematocrit [kg/kg]";

        Modelica.Units.SI.Molality x_P(start=1.2) "Amount of free particles in 1 kg of blood plasma [mol/kg]";
        Modelica.Units.SI.Molality x_E(start=0.86) "Amount of free particles in 1 kg of blood erythrocytes [mol/kg]";


        // debug of chloride shift:
        Modelica.Units.SI.Molality bCl_P = (aCl_P*x_P) "Molality of chloride in blood plasma [mol/kg]";
        Modelica.Units.SI.Molality bCl_E = (aCl_E*x_E) "Molality of chloride in blood red cells [mol/kg]";

        Modelica.Units.SI.Molality bHCO3_P = (aHCO3*x_P) "Molality of bicarbonate in blood plasma [mol/kg]";
        Modelica.Units.SI.Molality bHCO3_E  = (aHCO3_E*x_E) "Molality of bicarbonate in blood red cells [mol/kg]";

         // debug of chloride shift:
        Modelica.Units.SI.Concentration cCl_P = (aCl_P*x_P)*plasmaDensity(state) "Chloride in blood plasma";
        Modelica.Units.SI.Concentration cCl_E = (aCl_E*x_E)*formedElementsDensity(state) "Chloride in blood red cells";

        Modelica.Units.SI.Concentration cHCO3_P = (aHCO3*x_P)*plasmaDensity(state) "Bicarbonate in blood plasma";
        Modelica.Units.SI.Concentration cHCO3_E  = (aHCO3_E*x_E)*formedElementsDensity(state) "Bicarbonate in blood red cells";

        Types.MassFraction expected_XCl_E,expected_XH2O_E;

        Real atCO2_P,atCO2_E,ctCO2_P,ctCO2_E,ctCO2_B,expected_tCO2_P,expected_tCO2_E;

        Modelica.Units.SI.MoleFraction aNa_P,aK_P,aSO4_P,aPO4_P,aOH_P, pK_WaterSelfIonization,
        pOH=-log10(aOH_P), pHpOH=bloodGases.pH+pOH;

         Real massH2O_P, massH2O_E, nSolution_P, nSolution_E;
    equation


      aO2 = bloodGases.pO2/state.p;
      aCO2 = bloodGases.pCO2/state.p;
      aCO = bloodGases.pCO/state.p;
      aH_plus = 10^(-bloodGases.pH);

      //bloodGases.sCO2*
      aHCO3 = bloodGases.cHCO3 / (x_P*plasmaDensity(state));
      aHCO3_E = bloodGases.cHCO3_E / (x_E*formedElementsDensity(state));

      state.X[findIndex("Na_P",substanceNames)] = (aNa_P*x_P)*Na.data.MM*pct "Mass fraction of Na+ in blood plasma";
      state.X[findIndex("K_P",substanceNames)] = (aK_P*x_P)*K.data.MM*pct "Mass fraction of K+ in blood plasma";
      state.X[findIndex("SO4_P",substanceNames)] = (aSO4_P*x_P)*SO4.data.MM*pct "Mass fraction of SO4-- in blood plasma";
      state.X[findIndex("PO4",substanceNames)] = (aPO4_P*x_P)*PO4.data.MM*pct "Mass fraction of PO4--- in blood plasma";

      state.X[findIndex("Cl_P",substanceNames)] = (aCl_P*x_P)*Cl.data.MM*pct "Mass fraction of Cl- in blood plasma";
      state.X[findIndex("Cl_E",substanceNames)] = (aCl_E*x_E)*Cl.data.MM*hct "Mass fraction of Cl- in blood red cells";
      Cl_Ery2Plasma = KC_Cl*(Modelica.Constants.R*T*log((aCl_E/aCl_P)*(aHCO3/aHCO3_E))) "Chloride shift";
      expected_XCl_E = (aCl_P*(aHCO3_E/aHCO3)*x_E)*Cl.data.MM*hct "Debug of chloride shift rate";

      state.X[findIndex("CO2_P",substanceNames)] = (atCO2_P*x_P)*CO2.data.MM*pct;
      state.X[findIndex("CO2_E",substanceNames)] = (atCO2_E*x_E)*CO2.data.MM*hct;
      //expected:
      expected_tCO2_P = bloodGases.tCO2_P;
      expected_tCO2_E = bloodGases.tCO2_ery;
      ctCO2_P=(atCO2_P*x_P)*plasmaDensity(state);
      CO2_Ery2Plasma = - KC_CO2*(Modelica.Constants.R*T*log(atCO2_P/(bloodGases.tCO2_P/(x_P*plasmaDensity(state)))));
      ctCO2_E=(atCO2_E*x_E)*formedElementsDensity(state);
      ctCO2_B= tCO2(state);

      pct = plasmaMassFraction(state);
      hct = formedElementsMassFraction(state);


      state.X[findIndex("H2O_P",substanceNames)] = massH2O_P*pct;
      state.X[findIndex("H2O_E",substanceNames)] = massH2O_E*hct;
      nSolution_P = x_P;
      nSolution_E = x_E;


      state.X[findIndex("H2O_P",substanceNames)] = aH2O_P*pct*x_P/Properties.specificAmountOfFreeBaseMolecule(Substances.Water,solutionState,massH2O_P,nSolution_P);
      state.X[findIndex("H2O_E",substanceNames)] = aH2O_E*hct*x_E/Properties.specificAmountOfFreeBaseMolecule(Substances.Water,solutionState,massH2O_E,nSolution_E);
      H2O_Ery2Plasma = KC_H2O*(Modelica.Constants.R*T*log(aH2O_E/aH2O_P)) "Osmolarity equilibration rate";
      expected_XH2O_E = aH2O_P*hct*x_E/Properties.specificAmountOfFreeBaseMolecule(Substances.Water,solutionState,massH2O_E,nSolution_E) "Debug of osmolarity equilibration";


      x_P =plasmaSpecificAmountOfParticles(state);

      x_E =formedElementsSpecificAmountOfParticles(state);


      state_out[findIndex("H2O",SubstancesToConnect)].u = Modelica.Constants.R*T*log(aH2O_P)  +
            Properties.electroChemicalPotentialPure(
              Substances.Water, solutionState);
      state_out[findIndex("H2O",SubstancesToConnect)].h = Properties.molarEnthalpy(
          Substances.Water, solutionState);

      state_out[findIndex("O2",SubstancesToConnect)].u = Modelica.Constants.R*T*log(aO2) +
        Properties.electroChemicalPotentialPure(
          Substances.O2,
          solutionState);
      state_out[findIndex("O2",SubstancesToConnect)].h = Properties.molarEnthalpy(
          Substances.O2,
          solutionState);


      state_out[findIndex("CO2",SubstancesToConnect)].u = Modelica.Constants.R*T*log(aCO2) +
        Properties.electroChemicalPotentialPure(
          Substances.CO2,
          solutionState);
      state_out[findIndex("CO2",SubstancesToConnect)].h = Properties.molarEnthalpy(
          Substances.CO2,
          solutionState);
      state_out[findIndex("HCO3",SubstancesToConnect)].u = Modelica.Constants.R*T*log(aHCO3) +
        Properties.electroChemicalPotentialPure(
          Substances.HCO3,
          solutionState);
      state_out[findIndex("HCO3",SubstancesToConnect)].h = Properties.molarEnthalpy(
          Substances.HCO3,
          solutionState);


      state_out[findIndex("CO",SubstancesToConnect)].u = Modelica.Constants.R*T*log(aCO) +
        Properties.electroChemicalPotentialPure(
          Substances.CO,
          solutionState);
      state_out[findIndex("CO",SubstancesToConnect)].h = Properties.molarEnthalpy(
          Substances.CO,
          solutionState);


      state_out[findIndex("H",SubstancesToConnect)].u = Modelica.Constants.R*T*log(aH_plus) +
        Properties.electroChemicalPotentialPure(
          Substances.H,
          solutionState);
      state_out[findIndex("H",SubstancesToConnect)].h = 0;

      //just for debug (should be the same as pHpOH):
      pK_WaterSelfIonization = -log10(exp((Properties.electroChemicalPotentialPure(
              Substances.Water, solutionState)
              + Modelica.Constants.R*T*log(
                (Properties.specificAmountOfFreeBaseMolecule(Substances.Water, solutionState, massH2O_P, nSolution_P)
                * massH2O_P)/nSolution_P)
              - Properties.electroChemicalPotentialPure(Substances.OH, solutionState)
              - Properties.electroChemicalPotentialPure(Substances.H, solutionState))/(Modelica.Constants.R*T)))
              "water self disociation pK shifted to water activity=1";

      state_out[findIndex("OH",SubstancesToConnect)].u + state_out[findIndex("H",SubstancesToConnect)].u = state_out[findIndex("H2O",SubstancesToConnect)].u;
      state_out[findIndex("OH",SubstancesToConnect)].u = Modelica.Constants.R*T*log(aOH_P) +
        Properties.electroChemicalPotentialPure(
          Substances.OH,
          solutionState);
      state_out[findIndex("OH",SubstancesToConnect)].h = Properties.molarEnthalpy(
          Substances.OH,
          solutionState);

      state_out[findIndex("Na",SubstancesToConnect)].u = Modelica.Constants.R*T*log(aNa_P) +
        Properties.electroChemicalPotentialPure(
          Substances.Na,
          solutionState);
      state_out[findIndex("Na",SubstancesToConnect)].h = Properties.molarEnthalpy(
          Substances.Na,
          solutionState);

      state_out[findIndex("K",SubstancesToConnect)].u = Modelica.Constants.R*T*log(aK_P) +
        Properties.electroChemicalPotentialPure(
          Substances.K,
          solutionState);
      state_out[findIndex("K",SubstancesToConnect)].h = Properties.molarEnthalpy(
          Substances.K,
          solutionState);

      state_out[findIndex("Cl",SubstancesToConnect)].u = Modelica.Constants.R*T*log(aCl_P) +
        Properties.electroChemicalPotentialPure(
          Substances.Cl,
          solutionState);
      state_out[findIndex("Cl",SubstancesToConnect)].h = Properties.molarEnthalpy(
          Substances.Cl,
          solutionState);

      state_out[findIndex("SO4",SubstancesToConnect)].u = Modelica.Constants.R*T*log(aSO4_P) +
        Properties.electroChemicalPotentialPure(
          Substances.SO4,
          solutionState);
      state_out[findIndex("SO4",SubstancesToConnect)].h = Properties.molarEnthalpy(
          Substances.SO4,
          solutionState);

      state_out[findIndex("PO4",SubstancesToConnect)].u = Modelica.Constants.R*T*log(aPO4_P) +
        Properties.electroChemicalPotentialPure(
          Substances.PO4,
          solutionState);
      state_out[findIndex("PO4",SubstancesToConnect)].h = Properties.molarEnthalpy(
          Substances.PO4,
          solutionState);


      state_out[findIndex("Glucose",SubstancesToConnect)].u = Modelica.Constants.R*T*log(((state.X[findIndex("Glucose",substanceNames)]/pct)/Constants.MM_Glucose)/x_P) +
         Properties.electroChemicalPotentialPure(
          Substances.Glucose,
          solutionState);
      state_out[findIndex("Glucose",SubstancesToConnect)].h = Properties.molarEnthalpy(
          Substances.Glucose,
          solutionState);

      state_out[findIndex("Lactate",SubstancesToConnect)].u = Modelica.Constants.R*T*log((state.X[findIndex("Lactate",substanceNames)]/pct)/Constants.MM_Lactate/x_P) +
         Properties.electroChemicalPotentialPure(
          Substances.Lactate,
          solutionState);
      state_out[findIndex("Lactate",SubstancesToConnect)].h = Properties.molarEnthalpy(
          Substances.Lactate,
          solutionState);

      state_out[findIndex("Urea",SubstancesToConnect)].u = Modelica.Constants.R*T*log(state.X[findIndex("Urea",substanceNames)]/Constants.MM_Urea/x_P/pct) +
         Properties.electroChemicalPotentialPure(
          Substances.Urea,
          solutionState);
      state_out[findIndex("Urea",SubstancesToConnect)].h = Properties.molarEnthalpy(
          Substances.Urea,
          solutionState);

      state_out[findIndex("AminoAcids",SubstancesToConnect)].u = Modelica.Constants.R*T*log(state.X[findIndex("AminoAcids",substanceNames)]/Constants.MM_AminoAcids/x_P/pct);
      state_out[findIndex("AminoAcids",SubstancesToConnect)].h = 0;

      state_out[findIndex("Lipids",SubstancesToConnect)].u = Modelica.Constants.R*T*log(state.X[findIndex("Lipids",substanceNames)]/Constants.MM_Lipids/x_P/pct);
      state_out[findIndex("Lipids",SubstancesToConnect)].h = 0;

      state_out[findIndex("KetoAcids",SubstancesToConnect)].u = Modelica.Constants.R*T*log(state.X[findIndex("KetoAcids",substanceNames)]/Constants.MM_KetoAcids/x_P/pct);
      state_out[findIndex("KetoAcids",SubstancesToConnect)].h = 0;

      state_out[findIndex("Epinephrine",SubstancesToConnect)].u = Modelica.Constants.R*T*log(state.X[findIndex("Epinephrine",substanceNames)]/ Constants.MM_Epinephrine/x_P/pct);
      state_out[findIndex("Norepinephrine",SubstancesToConnect)].u = Modelica.Constants.R*T*log(state.X[findIndex("Norepinephrine",substanceNames)]/ Constants.MM_Norepinephrine/x_P/pct);
      state_out[findIndex("Vasopressin",SubstancesToConnect)].u = Modelica.Constants.R*T*log(state.X[findIndex("Vasopressin",substanceNames)]/ Constants.MM_Vasopressin/x_P/pct);
      state_out[findIndex("Insulin",SubstancesToConnect)].u = Modelica.Constants.R*T*log(state.X[findIndex("Insulin",substanceNames)]/ Constants.MM_Insulin/x_P/pct);
      state_out[findIndex("Glucagon",SubstancesToConnect)].u = Modelica.Constants.R*T*log(state.X[findIndex("Glucagon",substanceNames)]/ Constants.MM_Glucagon/x_P/pct);
      state_out[findIndex("Thyrotropin",SubstancesToConnect)].u = Modelica.Constants.R*T*log(state.X[findIndex("Thyrotropin",substanceNames)]/ Constants.MM_Thyrotropin/x_P/pct);
      state_out[findIndex("Thyroxine",SubstancesToConnect)].u = Modelica.Constants.R*T*log(state.X[findIndex("Thyroxine",substanceNames)]/ Constants.MM_Thyroxine/x_P/pct);
      state_out[findIndex("Leptin",SubstancesToConnect)].u = Modelica.Constants.R*T*log(state.X[findIndex("Leptin",substanceNames)]/ Constants.MM_Leptin/x_P/pct);
      state_out[findIndex("Desglymidodrine",SubstancesToConnect)].u = Modelica.Constants.R*T*log(state.X[findIndex("Desglymidodrine",substanceNames)]/ Constants.MM_Desglymidodrine/x_P/pct);
      state_out[findIndex("Angiotensin2",SubstancesToConnect)].u = Modelica.Constants.R*T*log(state.X[findIndex("Angiotensin2",substanceNames)]/ Constants.MM_Angiotensin2/x_P/pct);
      state_out[findIndex("Renin",SubstancesToConnect)].u = Modelica.Constants.R*T*log(state.X[findIndex("Renin",substanceNames)]/ Constants.MM_Renin/x_P/pct);
      state_out[findIndex("Aldosterone",SubstancesToConnect)].u = Modelica.Constants.R*T*log(state.X[findIndex("Aldosterone",substanceNames)]/ Constants.MM_Aldosterone/x_P/pct);

      state_out[findIndex("Epinephrine",SubstancesToConnect)].h = 0;
      state_out[findIndex("Norepinephrine",SubstancesToConnect)].h = 0;
      state_out[findIndex("Vasopressin",SubstancesToConnect)].h = 0;
      state_out[findIndex("Insulin",SubstancesToConnect)].h = 0;
      state_out[findIndex("Glucagon",SubstancesToConnect)].h = 0;
      state_out[findIndex("Thyrotropin",SubstancesToConnect)].h = 0;
      state_out[findIndex("Thyroxine",SubstancesToConnect)].h = 0;
      state_out[findIndex("Leptin",SubstancesToConnect)].h = 0;
      state_out[findIndex("Desglymidodrine",SubstancesToConnect)].h = 0;
      state_out[findIndex("Angiotensin2",SubstancesToConnect)].h = 0;
      state_out[findIndex("Renin",SubstancesToConnect)].h = 0;
      state_out[findIndex("Aldosterone",SubstancesToConnect)].h = 0;


      massFlows[Utilities.findIndex("H2O_E",substanceNames)] = -H2O_Ery2Plasma*Substances.Water.data.MM;
      massFlows[Utilities.findIndex("O2",substanceNames)] = n_flow[findIndex("O2",SubstancesToConnect)]*Substances.O2.data.MM;
      massFlows[Utilities.findIndex("CO2_P",substanceNames)] = n_flow[findIndex("CO2",SubstancesToConnect)]*Substances.CO2.data.MM + n_flow[findIndex("HCO3",SubstancesToConnect)] .* Substances.CO2.data.MM + CO2_Ery2Plasma*CO2.data.MM;
      massFlows[Utilities.findIndex("CO2_E",substanceNames)] = -CO2_Ery2Plasma*CO2.data.MM;
      massFlows[Utilities.findIndex("CO",substanceNames)] = n_flow[findIndex("CO",SubstancesToConnect)]*Substances.CO.data.MM;
      massFlows[Utilities.findIndex("eHb",substanceNames)] = 0;
      massFlows[Utilities.findIndex("MetHb",substanceNames)] = 0;
      massFlows[Utilities.findIndex("HbF",substanceNames)] = 0;
      massFlows[Utilities.findIndex("Alb",substanceNames)] = 0;
      massFlows[Utilities.findIndex("Glb",substanceNames)] = 0;
      massFlows[Utilities.findIndex("PO4",substanceNames)] = n_flow[findIndex("PO4",SubstancesToConnect)]*Substances.PO4.data.MM;
      massFlows[Utilities.findIndex("SO4_P",substanceNames)] = n_flow[findIndex("SO4",SubstancesToConnect)]*Substances.SO4.data.MM;
      massFlows[Utilities.findIndex("DPG",substanceNames)] = 0;
      massFlows[Utilities.findIndex("Glucose",substanceNames)] = n_flow[findIndex("Glucose",SubstancesToConnect)]*Substances.Glucose.data.MM;
      massFlows[Utilities.findIndex("Lactate",substanceNames)] = n_flow[findIndex("Lactate",SubstancesToConnect)]*Constants.MM_Lactate;
      massFlows[Utilities.findIndex("Urea",substanceNames)] = n_flow[findIndex("Urea",SubstancesToConnect)]*Substances.Urea.data.MM;
      massFlows[Utilities.findIndex("AminoAcids",substanceNames)] = n_flow[findIndex("AminoAcids",SubstancesToConnect)]*Constants.MM_AminoAcids;
      massFlows[Utilities.findIndex("Lipids",substanceNames)] = n_flow[findIndex("Lipids",SubstancesToConnect)]*Constants.MM_Lipids;
      massFlows[Utilities.findIndex("KetoAcids",substanceNames)] = n_flow[findIndex("KetoAcids",SubstancesToConnect)]*Constants.MM_KetoAcids;
      massFlows[Utilities.findIndex("Na_P",substanceNames)] = n_flow[findIndex("Na",SubstancesToConnect)]*Substances.Na.data.MM;
      massFlows[Utilities.findIndex("K_P",substanceNames)] = n_flow[findIndex("K",SubstancesToConnect)]*Substances.K.data.MM;
      massFlows[Utilities.findIndex("Cl_P",substanceNames)] = n_flow[findIndex("Cl",SubstancesToConnect)]*Substances.Cl.data.MM + Cl_Ery2Plasma*Cl.data.MM;
      massFlows[Utilities.findIndex("Na_E",substanceNames)] = 0;
      massFlows[Utilities.findIndex("K_E",substanceNames)] = 0;
      massFlows[Utilities.findIndex("Cl_E",substanceNames)] = -Cl_Ery2Plasma*Cl.data.MM;
      massFlows[Utilities.findIndex("Epinephrine",substanceNames)] = n_flow[findIndex("Epinephrine",SubstancesToConnect)]*Constants.MM_Epinephrine;
      massFlows[Utilities.findIndex("Norepinephrine",substanceNames)] = n_flow[findIndex("Norepinephrine",SubstancesToConnect)]*Constants.MM_Norepinephrine;
      massFlows[Utilities.findIndex("Vasopressin",substanceNames)] = n_flow[findIndex("Vasopressin",SubstancesToConnect)]*Constants.MM_Vasopressin;
      massFlows[Utilities.findIndex("Insulin",substanceNames)] = n_flow[findIndex("Insulin",SubstancesToConnect)]*Constants.MM_Insulin;
      massFlows[Utilities.findIndex("Glucagon",substanceNames)] = n_flow[findIndex("Glucagon",SubstancesToConnect)]*Constants.MM_Glucagon;
      massFlows[Utilities.findIndex("Thyrotropin",substanceNames)] = n_flow[findIndex("Thyrotropin",SubstancesToConnect)]*Constants.MM_Thyrotropin;
      massFlows[Utilities.findIndex("Thyroxine",substanceNames)] = n_flow[findIndex("Thyroxine",SubstancesToConnect)]*Constants.MM_Thyroxine;
      massFlows[Utilities.findIndex("Leptin",substanceNames)] = n_flow[findIndex("Leptin",SubstancesToConnect)]*Constants.MM_Leptin;
      massFlows[Utilities.findIndex("Desglymidodrine",substanceNames)] = n_flow[findIndex("Desglymidodrine",SubstancesToConnect)]*Constants.MM_Desglymidodrine;
      massFlows[Utilities.findIndex("Angiotensin2",substanceNames)] = n_flow[findIndex("Angiotensin2",SubstancesToConnect)]*Constants.MM_Angiotensin2;
      massFlows[Utilities.findIndex("Renin",substanceNames)] = n_flow[findIndex("Renin",SubstancesToConnect)]*Constants.MM_Renin;
      massFlows[Utilities.findIndex("Aldosterone",substanceNames)] = n_flow[findIndex("Aldosterone",SubstancesToConnect)]*Constants.MM_Aldosterone;
      massFlows[Utilities.findIndex("H2O_P",substanceNames)] = n_flow[findIndex("OH",SubstancesToConnect)]*Substances.OH.data.MM + n_flow[findIndex("H2O",SubstancesToConnect)]*Substances.Water.data.MM + H2O_Ery2Plasma*Substances.Water.data.MM;
      massFlows[Utilities.findIndex("Other_P",substanceNames)] = 0;
      massFlows[Utilities.findIndex("Other_E",substanceNames)] = 0;


      annotation (Documentation(info="<html>
<p>Chemical equilibrium is represented by expression of electrochemical potentials of base blood substances.</p>
</html>"));
    end ChemicalSolution;

    replaceable model BloodGases "Hydrogen Ion, Carbon Dioxide, and Oxygen in the Blood"
      input Physiolibrary.Media.Blood.ThermodynamicState state(
        p=101325,
        h=ArterialDefault*specificEnthalpies_Tpv(T, 101325),
        X=ArterialDefault) "blood";
      input Modelica.Units.SI.Temperature T=310.15 "Temperature";
      output Modelica.Units.SI.Pressure pO2(start=101325*87/760,min=1e-11)
        "Oxygen partial pressure";
      output Modelica.Units.SI.Pressure pCO2(start=101325*40/760)
        "Carbon dioxide partial pressure";
      output Modelica.Units.SI.Pressure pCO(start=1e-5, min=1e-11)
        "Carbon monoxide partial pressure";
      output Physiolibrary.Types.pH pH(start=7.4)
        "Blood plasma acidity";

      output Physiolibrary.Types.Fraction fzcO
        "expected fraction of oxy-hemoglobin units with HN2 form of amino-terminus";
      output Physiolibrary.Types.Fraction fzcD
        "expected fraction of deoxy-hemoglobin units with HN2 form of amino-terminus";
      output Physiolibrary.Types.Fraction sCO2
        "expected CO2 saturation of hemoglobin amino-termini";
      // protected
      input Physiolibrary.Types.VolumeFraction Hct=hematocrit(state) "haematocrit";
      input Types.Concentration _tO2=tO2(state) "oxygen content per volume of blood";
      input Types.Concentration _tCO2=tCO2(state)
        "carbon dioxide content per volume of blood";
      input Types.Concentration _tCO=tCO(state)
        "carbon monoxide content per volume of blood";
      input Types.Concentration _tHb=tHb(state)
        "hemoglobin content per volume of blood";
      input Types.MoleFraction _FMetHb(start=0.005)=FMetHb(state) "fraction of methemoglobin";
      input Types.MoleFraction _FHbF(start=0.005)=FHbF(state) "fraction of foetalhemoglobin";
      input Types.Concentration _ctHb_ery=ctHb_ery(state)
        "hemoglobin concentration in red cells";
      input Types.Concentration _tAlb=tAlb(state)
        "albumin concentration in blood plasma";
      input Types.MassConcentration _tGlb=tGlb(state)
        "globulin concentration in blood plasma";
      input Types.Concentration _tPO4=tPO4(state)
        "inorganic phosphates concentration in blood plasma";
      input Types.Concentration _cDPG=cDPG(state) "DPG concentration in blood plasma";
      input Types.Concentration _SID=SID(state) "strong ion difference of blood";
      input Types.Concentration _SID_P=plasmaSID(state) "strong ion difference of blood plasma";
      input Types.Concentration _SID_E=formedElementsSID(state) "strong ion difference of blood formed elements";

      constant Physiolibrary.Types.Temperature T0=273.15 + 37 "normal temperature";
      constant Physiolibrary.Types.pH pH0=7.4 "normal pH";
      constant Physiolibrary.Types.pH pH_ery0=7.19 "normal pH in erythrocyte";
      constant Physiolibrary.Types.Pressure pCO20=(40/760)*101325
        "normal CO2 partial pressure";

      Physiolibrary.Types.Concentration NSIDP;
      Physiolibrary.Types.Concentration NSIDE;
      Physiolibrary.Types.Concentration NSID;
      Physiolibrary.Types.Concentration BEox, BEox_P, BEox_E;
      Physiolibrary.Types.Concentration cdCO2;

      Physiolibrary.Types.pH pH_ery;

      input Physiolibrary.Types.GasSolubilityPa aCO2N=0.00023
        "solubility of CO2 in blood plasma at 37 degC";
      input Physiolibrary.Types.GasSolubilityPa aCO2=0.00023*(10^(-0.0092*(T - 310.15)))
        "solubility of CO2 in blood plasma";
      input Physiolibrary.Types.GasSolubilityPa aCO2_ery(displayUnit="mmol/l/mmHg") = 0.000195
        "solubility 0.23 (mmol/l)/kPa at 25degC";
      input Physiolibrary.Types.GasSolubilityPa aO2=exp(log(0.0105) + (-0.0115*(T - T0)) + 0.5*
          0.00042*((T - T0)^2))/1000 "oxygen solubility in blood";
      input Physiolibrary.Types.GasSolubilityPa aCO=(0.00099/0.0013)*aO2
        "carbon monoxide solubility in blood";

      input Real pK=6.1 + (-0.0026)*(T - 310.15) "Henderson-Hasselbalch";
      input Real pK_ery=6.125 - log10(1 + 10^(pH_ery - 7.84 - 0.06*sO2));

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
      Physiolibrary.Types.Concentration cHCO3(start=24.524), cHCO3_E(start=15.5);

      Physiolibrary.Types.Fraction sO2CO(start=0.962774);
      Physiolibrary.Types.Fraction sCO(start=1.8089495e-07);
      Physiolibrary.Types.Fraction sO2;
      Physiolibrary.Types.Fraction FCOHb;
      Physiolibrary.Types.Concentration ceHb "effective hemoglobin";

      Physiolibrary.Types.Concentration tCO2_P(displayUnit="mmol/l");
      Physiolibrary.Types.Concentration tCO2_ery(displayUnit="mmol/l");

      Physiolibrary.Types.Fraction sCO2O
        "CO2 saturation of oxy-hemoglobin amino-termini";
      Physiolibrary.Types.Fraction sCO2D
        "CO2 saturation of deoxy-hemoglobin amino-termini";

      Real dHh "Bohr's protons of reaction h";
      Real dHz "Bohr's protons of reaction z";
      Real dHc "Bohr's protons of reaction c";

      Real dH  "Bohr's protons = number of protons released during deoxygenation of one hemoglobin subunit";
      Real dTH "Total titration shift with Bohr protons and carbamination";

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
        + zDPG*_cDPG + zOtherE
        "strong ion difference of red cells at pH=7.4 (pH_ery=7.19), pCO2=40mmHg, T=37degC and sO2=1";

      NSID = Hct*NSIDE + (1 - Hct)*NSIDP
        "strong ion difference of blood at pH=7.4 (pH_ery=7.19), pCO2=40mmHg, T=37degC and sO2=1";

      BEox = _SID - NSID "base excess of oxygenated blood";

      beta =2.3*_tHb + 8*_tAlb + 0.075*_tGlb + 0.309*_tPO4
                                                        "buffer value of blood";

      pH =pH0 + (1/beta)*(((BEox + 0.3*(1 - sO2CO))/(1 - _tHb/43)) - (cHCO3 - 24.5))
        "Van Slyke (simplified electroneutrality equation)";
      pH_ery = 7.19 + 0.77*(pH - 7.4) + 0.035*(1 - sO2);

      sO2CO =homotopy(hemoglobinDissociationCurve(
          pH,
          pO2,
          pCO2,
          pCO,
          T,
          _tHb,
          _cDPG,
          _FMetHb,
          _FHbF),hemoglobinDissociationCurve(
          pH0,
          pO2,
          pCO20,
          1e-5,
          310,
          8.4,
          5,
          0.005,
          0.005));

      sCO*(pO2 + 218*pCO) = 218*sO2CO*(pCO);
      FCOHb =sCO*(1 - _FMetHb);
      _tCO = aCO*pCO + FCOHb*_tHb;

      ceHb =_tHb*(1 - FCOHb - _FMetHb);
      sO2 =(sO2CO*(_tHb*(1 - _FMetHb)) - _tHb*FCOHb)/ceHb;
      _tO2 = aO2*pO2 + ceHb*sO2;

      cdCO2 = aCO2*pCO2;
      cdCO2*10^(pH - pK) = cHCO3;

      tCO2_P = cHCO3 + cdCO2;
      tCO2_ery = aCO2_ery*pCO2*(1 + 10^(pH_ery - pK_ery)) + sCO2*ceHb;
      cHCO3_E = aCO2_ery*pCO2*(10^(pH_ery - pK_ery));
      _tCO2 = tCO2_ery*Hct + tCO2_P*(1 - Hct);

      fzcO = 1/(1 + 10^(pKzO - pH_ery) + cdCO2*10^(pH_ery - pKcO))
        "fraction of oxy-hemoglobin units with HN2 form of amino-terminus";
      fzcD = 1/(1 + 10^(pKzD - pH_ery) + cdCO2*10^(pH_ery - pKcD))
        "fraction of deoxy-hemoglobin units with HN2 form of amino-terminus";

      sCO2 = 10^(pH_ery - pKcO)*fzcO*cdCO2*sO2 + 10^(pH_ery - pKcD)*fzcD*cdCO2*(1-sO2)
        "CO2 saturation of hemoglobin amino-termini";

      sCO2O = 10^(pH_ery - pKcO)*fzcO*cdCO2
        "CO2 saturation of oxy-hemoglobin amino-termini";
      sCO2D = 10^(pH_ery - pKcD)*fzcD*cdCO2
        "CO2 saturation of deoxy-hemoglobin amino-termini";

      dHh = - ((1/(1 + 10^(pKhD - pH_ery)))-(1/(1 + 10^(pKhO - pH_ery))))
        "Bohr's protons of reaction h";
      dHz = (10^(pKzD - pH_ery))*fzcD - (10^(pKzO - pH_ery))*fzcO
        "Bohr's protons of reaction z";
      dHc = - (aCO2_ery*pCO2*(10^(pH_ery - pKcD))*fzcD - aCO2_ery*pCO2*(10^(pH_ery - pKcO))*fzcO)
        "Bohr's protons of reaction c";

      dH = dHh + dHz + dHc
        "Bohr's protons = number of protons released during deoxygenation of one hemoglobin subunit";
      dTH = sO2*dH + sCO2D*(1+1/(1+10^(pH-pKzD)))
        "Total titration shift with Bohr protons and carbamination";

      BEox_P = _SID_P - NSIDP;
      BEox_E = _SID_E + dTH*ceHb - NSIDE;


      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)),
        Documentation(info="<html>
<p><a href=\"https://www.siggaard-andersen.dk/\">Hydrogen Ion, Carbon Dioxide, and Oxygen in the Blood (siggaard-andersen.dk)</a></p>
<p><a href=\"https://www.creativeconnections.cz/medsoft/2013/Medsoft_2013_Matejak.pdf\">Medsoft_2013_Matejak.pdf (creativeconnections.cz)</a></p>
</html>"));
    end BloodGases;

    redeclare replaceable model extends BaseProperties(final standardOrderComponents=true)
      "Base properties of medium"

      input Types.ElectricPotential v "electric potential";

    equation
      d = 1057;
      h =specificEnthalpies_Tpv(
          T,
          p,
          v)*X;
      u = h - p/d;
      MM = 1;
      R_s = 8.3144;
      state.p = p;
      state.h = h;
      state.X = X;
      state.v = v;
      annotation (Documentation(info="<html>
<p>Simplification of blood:</p>
<p>Constant density and constant heat capacity</p>
</html>"));
    end BaseProperties;

    redeclare replaceable function extends specificEnthalpies_Tpv "Specific enthalpies of blood substances"
    protected
     Chemical.Interfaces.SolutionState solutionState=Chemical.Interfaces.SolutionState(Chemical.Interfaces.Phase.Aqueous,T,p,v);
    algorithm
        specificEnthalpy[Utilities.findIndex("H2O_E",substanceNames)] := Properties.specificEnthalpy(Substances.Water, solutionState);
      specificEnthalpy[Utilities.findIndex("O2",substanceNames)] := Properties.specificEnthalpy(Substances.O2, solutionState);
      specificEnthalpy[Utilities.findIndex("CO2_P",substanceNames)] := Properties.specificEnthalpy(Substances.CO2, solutionState);
      specificEnthalpy[Utilities.findIndex("CO2_E",substanceNames)] := Properties.specificEnthalpy(Substances.CO2, solutionState);
      specificEnthalpy[Utilities.findIndex("CO",substanceNames)] := Properties.specificEnthalpy(Substances.CO, solutionState);
      specificEnthalpy[Utilities.findIndex("eHb",substanceNames)] := 0;
      specificEnthalpy[Utilities.findIndex("MetHb",substanceNames)] := 0;
      specificEnthalpy[Utilities.findIndex("HbF",substanceNames)] := 0;
      specificEnthalpy[Utilities.findIndex("Alb",substanceNames)] := 0;
      specificEnthalpy[Utilities.findIndex("Glb",substanceNames)] := 0;
      specificEnthalpy[Utilities.findIndex("SO4",substanceNames)] := 0;
      specificEnthalpy[Utilities.findIndex("PO4",substanceNames)] := 0;
      specificEnthalpy[Utilities.findIndex("DPG",substanceNames)] := 0;
      specificEnthalpy[Utilities.findIndex("Glucose",substanceNames)] := Properties.specificEnthalpy(Substances.Glucose, solutionState);
      specificEnthalpy[Utilities.findIndex("Lactate",substanceNames)] := Properties.specificEnthalpy(Substances.Lactate, solutionState);
      specificEnthalpy[Utilities.findIndex("Urea",substanceNames)] := Properties.specificEnthalpy(Substances.Urea, solutionState);
      specificEnthalpy[Utilities.findIndex("AminoAcids",substanceNames)] := 0;
      specificEnthalpy[Utilities.findIndex("Lipids",substanceNames)] := 0;
      specificEnthalpy[Utilities.findIndex("KetoAcids",substanceNames)] := 0;
      specificEnthalpy[Utilities.findIndex("Na_P",substanceNames)] := Properties.specificEnthalpy(Substances.Na, solutionState);
      specificEnthalpy[Utilities.findIndex("Na_E",substanceNames)] := Properties.specificEnthalpy(Substances.Na, solutionState);
      specificEnthalpy[Utilities.findIndex("K_P",substanceNames)] := Properties.specificEnthalpy(Substances.K, solutionState);
      specificEnthalpy[Utilities.findIndex("K_E",substanceNames)] := Properties.specificEnthalpy(Substances.K, solutionState);
      specificEnthalpy[Utilities.findIndex("Cl_P",substanceNames)] := Properties.specificEnthalpy(Substances.Cl, solutionState);
      specificEnthalpy[Utilities.findIndex("Cl_E",substanceNames)] := Properties.specificEnthalpy(Substances.Cl, solutionState);
      specificEnthalpy[Utilities.findIndex("Epinephrine",substanceNames)] := 0;
      specificEnthalpy[Utilities.findIndex("Norepinephrine",substanceNames)] := 0;
      specificEnthalpy[Utilities.findIndex("Vasopressin",substanceNames)] := 0;
      specificEnthalpy[Utilities.findIndex("Insulin",substanceNames)] := 0;
      specificEnthalpy[Utilities.findIndex("Glucagon",substanceNames)] := 0;
      specificEnthalpy[Utilities.findIndex("Thyrotropin",substanceNames)] := 0;
      specificEnthalpy[Utilities.findIndex("Thyroxine",substanceNames)] := 0;
      specificEnthalpy[Utilities.findIndex("Leptin",substanceNames)] := 0;
      specificEnthalpy[Utilities.findIndex("Desglymidodrine",substanceNames)] := 0;
      specificEnthalpy[Utilities.findIndex("Angiotensin2",substanceNames)] := 0;
      specificEnthalpy[Utilities.findIndex("Renin",substanceNames)] := 0;
      specificEnthalpy[Utilities.findIndex("Aldosterone",substanceNames)] := 0;
      specificEnthalpy[Utilities.findIndex("H2O_P",substanceNames)] := Properties.specificEnthalpy(Substances.Water, solutionState);
      specificEnthalpy[Utilities.findIndex("Other_P",substanceNames)] := 0;
      specificEnthalpy[Utilities.findIndex("Other_E",substanceNames)] := 0;


    end specificEnthalpies_Tpv;

    redeclare replaceable function extends specificEnthalpy "Return specific enthalpy"
    algorithm
        h := state.h;
    end specificEnthalpy;





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
    algorithm
      state.h :=specificEnthalpies_Tpv(
        T,
        p,
        v)*X;
      state.p := p;
      state.X := X;
      state.v := v;
      annotation (Documentation(info="<html>
<p>Set thermodynamic state</p>
</html>"));
    end setState_pTX;

    redeclare replaceable function extends setState_phX "Thermodynamic state"
      input Types.ElectricPotential v=0 "electric potential";
    algorithm
      state.p := p;
      state.h := h;
      state.X := X;
      state.v := v;

      annotation (Documentation(info="<html>
<p>Set thermodynamic state based on constant heat capacity</p>
</html>"));
    end setState_phX;

    redeclare replaceable function extends density "Density"
    algorithm
      d := D_BloodDensity;
      annotation (Documentation(info="<html>
<p>constant density</p>
</html>"));
    end density;

    replaceable function plasmaDensity "Density of blood plasma"
      extends GetDensity;
    algorithm
      d := D_BloodPlasmaDensity;
      annotation (Documentation(info="<html>
<p>constant density</p>
</html>"));
    end plasmaDensity;

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



    function tO2 "Total oxygen in blood"
      extends GetConcentration;
    algorithm
      C := density(state) * state.X[Utilities.findIndex("O2",substanceNames)] / O2.data.MM;
    end tO2;

    function sO2 "Oxygen saturation on effective hemoglobin"
      extends GetFraction;
    algorithm
      F := (state.X[Utilities.findIndex("O2",substanceNames)] / O2.data.MM) / (state.X[Utilities.findIndex("eHb",substanceNames)] / Constants.MM_Hb);
    end sO2;

    function tCO2 "Total carbon dioxide in blood"
      extends GetConcentration;
    algorithm
      C := density(state) * (state.X[Utilities.findIndex("CO2_P",substanceNames)]+state.X[Utilities.findIndex("CO2_E",substanceNames)]) / CO2.data.MM;
    end tCO2;

    function tCO "Total carbon monoxide in blood"
      extends GetConcentration;
    algorithm
      C := density(state) * state.X[Utilities.findIndex("CO",substanceNames)] / CO.data.MM;
    end tCO;

    function tHb "Total hemoglobine in blood"
      extends GetConcentration;
    algorithm
      C := density(state) * (state.X[Utilities.findIndex("eHb",substanceNames)] + state.X[Utilities.findIndex("MetHb",substanceNames)] + state.X[Utilities.findIndex("HbF",substanceNames)]) / Constants.MM_Hb;
    end tHb;

    function FMetHb "Methemoglobine fraction"
      extends GetFraction;
    algorithm
      F := (state.X[Utilities.findIndex("MetHb",substanceNames)] / tHb(state));
    end FMetHb;

    function FHbF "Foetalhemoglobine fraction"
      extends GetFraction;
    algorithm
      F := (state.X[Utilities.findIndex("HbF",substanceNames)] / tHb(state));
    end FHbF;

    function ctHb_ery "Total hemoglobine in erythrocytes"
      extends GetConcentration;
    algorithm
      C :=tHb(state)/hematocrit(state);
    end ctHb_ery;

    function tAlb "Total albumine in blood plasma"
      extends GetConcentration;
    algorithm
      C :=plasmaDensity(state)*(state.X[Utilities.findIndex("Alb",substanceNames)]/Constants.MM_Alb)/
        plasmaMassFraction(state);
    end tAlb;

    function tGlb "Total globulin in blood plasma [g/L]"
      extends GetMassConcentration;
    algorithm
      R :=plasmaDensity(state)*state.X[Utilities.findIndex("Glb",substanceNames)]/plasmaMassFraction(state);
    end tGlb;



    function tPO4 "Total anorganic phosphates in blood plasma"
      extends GetConcentration;
    algorithm
      C :=plasmaDensity(state)*(state.X[Utilities.findIndex("PO4",substanceNames)]/PO4.data.MM)/
        plasmaMassFraction(state);
    end tPO4;

    function cDPG "Total diphosphoglycerate in erythrocytes"
      extends GetConcentration;
    algorithm
      C :=formedElementsDensity(state)*(state.X[Utilities.findIndex("DPG",substanceNames)]/Constants.MM_DPG)/
        formedElementsMassFraction(state);
    end cDPG;

    function SID "Strong ion difference of blood"
      extends GetConcentration;
    algorithm
      C := density(state) * (
          state.X[Utilities.findIndex("Na_P",substanceNames)]/Na.data.MM +
          state.X[Utilities.findIndex("Na_E",substanceNames)]/Na.data.MM +
          state.X[Utilities.findIndex("K_P",substanceNames)]/K.data.MM +
          state.X[Utilities.findIndex("K_E",substanceNames)]/K.data.MM -
          state.X[Utilities.findIndex("Cl_P",substanceNames)]/Cl.data.MM -
          state.X[Utilities.findIndex("Cl_E",substanceNames)]/Cl.data.MM -
          SO4.data.z*state.X[Utilities.findIndex("SO4_P",substanceNames)]/SO4.data.MM);
    end SID;

    function glucose "Total glucose in blood plasma"
      extends GetConcentration;
    algorithm
      C :=(plasmaDensity(state)*state.X[Utilities.findIndex("Glucose",substanceNames)]/Constants.MM_Glucose)/
        plasmaMassFraction(state);
    end glucose;

    function lactate "Total lactate in blood plasma"
      extends GetConcentration;
    algorithm
      C :=(plasmaDensity(state)*state.X[Utilities.findIndex("Lactate",substanceNames)]/Constants.MM_Lactate)/
        plasmaMassFraction(state);
    end lactate;

    function urea "Total urea in blood plasma"
      extends GetConcentration;
    algorithm
      C :=(plasmaDensity(state)*state.X[Utilities.findIndex("Urea",substanceNames)]/Constants.MM_Urea)/
        plasmaMassFraction(state);
    end urea;

    function aminoAcids "Total amino acids in blood plasma"
      extends GetConcentration;
    algorithm
      C :=(plasmaDensity(state)*state.X[Utilities.findIndex("AminoAcids",substanceNames)]/Constants.MM_AminoAcids)/
        plasmaMassFraction(state);
    end aminoAcids;

    function lipids "Total faty acids in blood plasma"
      extends GetConcentration;
    algorithm
      C :=(plasmaDensity(state)*state.X[Utilities.findIndex("Lipids",substanceNames)]/Constants.MM_Lipids)/
        plasmaMassFraction(state);
    end lipids;

    function ketoAcids "Total ketoacids in blood plasma"
      extends GetConcentration;
    algorithm
      C :=(plasmaDensity(state)*state.X[Utilities.findIndex("KetoAcids",substanceNames)]/Constants.MM_KetoAcids)/
        plasmaMassFraction(state);
    end ketoAcids;

    function epinephrine "Epinephrine in blood plasma"
      extends GetMassConcentration(R(displayUnit="ng/l", nominal=SubstanceFlowNominal[Utilities.findIndex("Epinephrine",substanceNames)]));
    algorithm
      R :=plasmaDensity(state)*state.X[Utilities.findIndex("Epinephrine",substanceNames)]/plasmaMassFraction(state);
    end epinephrine;

    function norepinephrine "Norepinephrine in blood plasma"
      extends GetMassConcentration(R(displayUnit="ng/l", nominal=SubstanceFlowNominal[Utilities.findIndex("Norepinephrine",substanceNames)]));
    algorithm
      R :=plasmaDensity(state)*state.X[Utilities.findIndex("Norepinephrine",substanceNames)]/plasmaMassFraction(
        state);
    end norepinephrine;

    function vasopressin "Vasopressin in blood plasma"
      extends GetConcentration(C(displayUnit="pmol/l", nominal=SubstanceFlowNominal[Utilities.findIndex("Vasopressin",substanceNames)]));
    algorithm
      C :=(plasmaDensity(state)*state.X[Utilities.findIndex("Vasopressin",substanceNames)]/Constants.MM_Vasopressin)
        /plasmaMassFraction(state);
    end vasopressin;

    function insulin "Insulin in blood plasma"
      extends GetActivity(A(unit="U/m3",displayUnit="mU/l"));
    algorithm
      A :=(plasmaDensity(state)*(state.X[Utilities.findIndex("Insulin",substanceNames)]/6e-9)/Constants.MM_Insulin)
        /plasmaMassFraction(state)                                                                            "conversion factor for human insulin is 1 mU/L = 6.00 pmol/L";
    end insulin;

    function glucagon "Glucagon in blood plasma"
      extends GetMassConcentration(R(displayUnit="ng/l", nominal=SubstanceFlowNominal[Utilities.findIndex("Glucagon",substanceNames)]));
    algorithm
      R :=plasmaDensity(state)*state.X[Utilities.findIndex("Glucagon",substanceNames)]/plasmaMassFraction(state);
    end glucagon;

    function thyrotropin "Thyrotropin in blood plasma"
      extends GetConcentration(C(displayUnit="pmol/l", nominal=SubstanceFlowNominal[Utilities.findIndex("Thyrotropin",substanceNames)]));
    algorithm
      C :=(plasmaDensity(state)*state.X[Utilities.findIndex("Thyrotropin",substanceNames)]/Constants.MM_Thyrotropin)
        /plasmaMassFraction(state);
    end thyrotropin;

    function thyroxine "Thyroxine in blood plasma"
      extends GetMassConcentration(R(displayUnit="ug/l", nominal=SubstanceFlowNominal[Utilities.findIndex("Thyroxine",substanceNames)]));
    algorithm
      R :=plasmaDensity(state)*state.X[Utilities.findIndex("Thyroxine",substanceNames)]/plasmaMassFraction(state);
    end thyroxine;

    function leptin "Leptin in blood plasma"
      extends GetMassConcentration(R(displayUnit="ug/l", nominal=SubstanceFlowNominal[Utilities.findIndex("Leptin",substanceNames)]));
    algorithm
      R :=plasmaDensity(state)*state.X[Utilities.findIndex("Leptin",substanceNames)]/plasmaMassFraction(state);
    end leptin;

    function desglymidodrine "Desglymidodrine in blood plasma"
      extends GetMassConcentration(R(displayUnit="ug/l"));
    algorithm
      R :=plasmaDensity(state)*state.X[Utilities.findIndex("Desglymidodrine",substanceNames)]/plasmaMassFraction(
        state);
    end desglymidodrine;


    function angiotensin2 "Angiotensin2 in blood plasma"
      extends GetMassConcentration(R(displayUnit="ng/l", nominal=SubstanceFlowNominal[Utilities.findIndex("Angiotensin2",substanceNames)]));
    algorithm
       R :=plasmaDensity(state)*state.X[Utilities.findIndex("Angiotensin2",substanceNames)]/plasmaMassFraction(
        state);
    end angiotensin2;

    function alphaBlockers "Alpha blockers effect"
      extends GetExtraProperty;
    algorithm
      e := C[Utilities.findIndex("AlphaBlockers",extraPropertiesNames)]/1e-6;
    end alphaBlockers;

    function betaBlockers "Beta blockers effect"
      extends GetExtraProperty;
    algorithm
      e := C[Utilities.findIndex("BetaBlockers",extraPropertiesNames)]/1e-6;
    end betaBlockers;

    function anesthesiaVascularConductance "Anesthesia vascular conductance effect"
      extends GetExtraProperty;
    algorithm
      e := C[Utilities.findIndex("AnesthesiaVascularConductance",extraPropertiesNames)]/1e-6;
    end anesthesiaVascularConductance;

    function aldosterone "Aldosterone in blood plasma"
      extends GetConcentration(C(displayUnit="nmol/l", nominal=SubstanceFlowNominal[Utilities.findIndex("Aldosterone",substanceNames)]));
    algorithm
      C :=plasmaDensity(state)*(state.X[Utilities.findIndex("Aldosterone",substanceNames)]/Constants.MM_Aldosterone)
        /plasmaMassFraction(state);
    end aldosterone;


    function renin "Renin PRA in blood plasma"
      extends GetActivity(A(unit="ng/(ml.h)",displayUnit="ng/(ml.h)"));
    algorithm
      A :=plasmaDensity(state)*((state.X[Utilities.findIndex("Renin",substanceNames)]/(1e-12*0.6*11.2)))/
        plasmaMassFraction(state)                                                                     "conversion factor from PRA (ng/mL/h) to DRC (mU/L) is 11.2, μIU/mL (mIU/L) * 0.6 = pg/mL";
    end renin;

    function plasmacrit "Blood plasmacrit [mL/mL]"
      extends GetFraction;
    algorithm
      F := plasmaMassFraction(state)*(density(state)/plasmaDensity(state));
    end plasmacrit;

    function hematocrit "Blood hematocrit [mL/mL]"
      extends GetFraction;
    algorithm
      F := 1-plasmacrit(state);
    end hematocrit;

    function formedElementsDensity
      "Density of blood formed elements (erythrocytes, leukocytes and thrombocytes)"
      extends GetDensity;
    algorithm
      d :=formedElementsMassFraction(state)*(density(state)/hematocrit(state));
      annotation (Documentation(info="<html>
<p>constant density</p>
</html>"));
    end formedElementsDensity;


    function formedElementsMassFractionWithoutOther "Blood hematocrit without unknown substances in formed elements [kg/kg]"
      extends formedElementsMassFraction(includeOther=false);
    end formedElementsMassFractionWithoutOther;

    function plasmaMassFractionWithoutOther "Blood plasmacrit without unknown substances in blood plasma [kg/kg]"
    extends plasmaMassFraction(includeOther=false);
    end plasmaMassFractionWithoutOther;


    function plasmaSID "Strong ion difference of blood plasma"
      extends GetConcentration;
    algorithm
      C := plasmaDensity(state) * (
          state.X[Utilities.findIndex("Na_P",substanceNames)]/Na.data.MM +
          state.X[Utilities.findIndex("K_P",substanceNames)]/K.data.MM -
          state.X[Utilities.findIndex("Cl_P",substanceNames)]/Cl.data.MM -
          SO4.data.z*state.X[Utilities.findIndex("SO4_P",substanceNames)]/SO4.data.MM) / plasmacrit(state);
    end plasmaSID;

    function formedElementsSID "Strong ion difference of blood formed elements"
      extends GetConcentration;
    algorithm
      C := density(state) * (
          state.X[Utilities.findIndex("Na_E",substanceNames)]/Na.data.MM +
          state.X[Utilities.findIndex("K_E",substanceNames)]/K.data.MM -
          state.X[Utilities.findIndex("Cl_E",substanceNames)]/Cl.data.MM) / hematocrit(state);
    end formedElementsSID;
  public

    annotation (Documentation(info="<html>
<p>Adding new substance to blood model:</p>
<p><br>- add to Blood.substanceNames</p>
<p>- modify {plasma/formedElements}{MassFraction+SpecificAmountOfParticles}</p>
<p>- modify functions: Blood.specificEnthalpies_Tpv</p>
<p>- modify model: Blood.ArterialComposition, run it and resuled X set as ArterialDefault (and from VenousComposition -&gt; VenousDefault)</p>
<p>- modify model: Blood.ChemicalSolution,</p>
</html>"));
  end Blood;

  package Water "Incompressible water with constant heat capacity"
    import Chemical.Interfaces.Properties;
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


  public
    redeclare replaceable model extends ChemicalSolution (SubstancesToConnect={"H2O","H+","O2","H2","OH-","e-"}) "Adapter between SubstancesPort and water medium"
      import Physiolibrary.Utilities.*;



    protected
        Real logH,logOH,logO2,logH2,T;
    equation
     // v=substances.cathode.v-substances.anode.v;
     // 0=substances.cathode.i+substances.anode.i;
     // _i = substances.cathode.i;
     // _i + (-1)*Modelica.Constants.F*eq = 0 "electric current is flow of electrons";

      //eq = n_flows[findIndex("e-",SubstancesToConnect)];
      T = temperature(state);

      state_out[findIndex("H+",SubstancesToConnect)].u + state_out[findIndex("OH-",SubstancesToConnect)].u = state_out[findIndex("H2O",SubstancesToConnect)].u "H+ + OH- <-> H2O";
      2*state_out[findIndex("H+",SubstancesToConnect)].u + 2*state_out[findIndex("e-",SubstancesToConnect)].u + 0.5*state_out[findIndex("O2",SubstancesToConnect)].u = state_out[findIndex("H2O",SubstancesToConnect)].u "2H+ + 2e- + (1/2)O2 <-> H2O";
      state_out[findIndex("H2",SubstancesToConnect)].u = 2*state_out[findIndex("H+",SubstancesToConnect)].u + 2*state_out[findIndex("e-",SubstancesToConnect)].u "H2 <-> 2H+ + 2e-";

      logH=logOH;


      state_out[findIndex("H2O",SubstancesToConnect)].u = Properties.electroChemicalPotentialPure( Substances.Water, solutionState);
      state_out[findIndex("H2O",SubstancesToConnect)].h = Properties.molarEnthalpy( Substances.Water, solutionState);

      state_out[findIndex("H+",SubstancesToConnect)].u = Properties.electroChemicalPotentialPure( Substances.H, solutionState) +
                       Modelica.Constants.R*T*logH;
      state_out[findIndex("H+",SubstancesToConnect)].h = Properties.molarEnthalpy( Substances.H, solutionState);


      state_out[findIndex("O2",SubstancesToConnect)].u = Properties.electroChemicalPotentialPure( Substances.O2, solutionState) +
                       Modelica.Constants.R*T*logO2;
      state_out[findIndex("O2",SubstancesToConnect)].h = Properties.molarEnthalpy( Substances.O2, solutionState);


      state_out[findIndex("H2",SubstancesToConnect)].u = Properties.electroChemicalPotentialPure( Substances.H2, solutionState) +
                       Modelica.Constants.R*T*logH2;
      state_out[findIndex("H2",SubstancesToConnect)].h = Properties.molarEnthalpy( Substances.H2, solutionState);


      state_out[findIndex("OH-",SubstancesToConnect)].u = Properties.electroChemicalPotentialPure( Substances.OH, solutionState) +
                       Modelica.Constants.R*T*logOH;
      state_out[findIndex("OH-",SubstancesToConnect)].h = Properties.molarEnthalpy( Substances.OH, solutionState);

      state_out[findIndex("e-",SubstancesToConnect)].u = Properties.electroChemicalPotentialPure( Substances.e, solutionState);
      state_out[findIndex("e-",SubstancesToConnect)].h = Properties.molarEnthalpy( Substances.e, solutionState);


      massFlows = {n_flow[findIndex("H2O",SubstancesToConnect)] * Substances.Water.data.MM +
       n_flow[findIndex("H+",SubstancesToConnect)] * Substances.H.data.MM +
       n_flow[findIndex("O2",SubstancesToConnect)] * Substances.O2.data.MM +
       n_flow[findIndex("H2",SubstancesToConnect)] * Substances.H2.data.MM +
       n_flow[findIndex("OH-",SubstancesToConnect)] * Substances.OH.data.MM}
        "mass change of water";
    end ChemicalSolution;

    redeclare replaceable function extends specificEnthalpies_Tpv "Specific enthalpies of substances at defined temperature, pressure, electric potential"
    algorithm
       specificEnthalpy:=Properties.specificEnthalpy(
          {Substances.Water},
          Chemical.Interfaces.SolutionState(Chemical.Interfaces.Phase.Aqueous,T,p,v));
    end specificEnthalpies_Tpv;

  public
    redeclare replaceable model extends BaseProperties(final standardOrderComponents=true)
      "Base properties of medium"

      Chemical.Interfaces.SolutionState solutionState=Chemical.Interfaces.SolutionState(phase=Chemical.Interfaces.Phase.Aqueous,T=T,p=p);
    equation
      d = 1000;
      h = X*Properties.specificEnthalpy(
          {Substances.Water},
          solutionState);
      u = h - p/d;
      MM = 1/(X*Properties.specificAmountOfParticles({Substances.Water},solutionState));
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
      state.T := Properties.solution_temperature(
          {Substances.Water},
          h*Substances.Water.data.MM,
          {1},
          p);
    end setState_phX;

    redeclare replaceable function extends specificEnthalpy "Return specific enthalpy"
    algorithm
      h := Properties.specificEnthalpy(
          Substances.Water,
          Chemical.Interfaces.SolutionState(Chemical.Interfaces.Phase.Aqueous,state.T,state.p));
    end specificEnthalpy;

    redeclare replaceable function extends specificHeatCapacityCp
      "Return specific heat capacity at constant pressure"
    algorithm
      cp := Properties.specificHeatCapacityCp(
          Substances.Water,
          Chemical.Interfaces.SolutionState(Chemical.Interfaces.Phase.Aqueous,state.T,state.p));
      annotation (Documentation(info="<html>

</html>"));
    end specificHeatCapacityCp;

    redeclare replaceable function extends density
    algorithm
      d := 1000;
    end density;

    redeclare replaceable function extends temperature
    algorithm
      T := state.T;
    end temperature;

    redeclare replaceable function extends pressure
    algorithm
      p := state.p;
    end pressure;


  public

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
      import Chemical.Interfaces.Properties;
      extends Interfaces.PartialMedium(
         ThermoStates=Modelica.Media.Interfaces.Choices.IndependentVariables.pTX,
         reducedX = false,
         singleState = false,
         substanceNames={"O2","CO2","H2O","N2"},
         substanceData={
          Chemical.Substances.Gas.O2,
          Chemical.Substances.Gas.CO2,
          Chemical.Substances.Gas.H2O,
          Chemical.Substances.Gas.N2},
         reference_X=cat(1, Conc .* C2X, {1 - (Conc * C2X)}),
         SpecificEnthalpy(start=0, nominal=1e3),
         Density(start=1.0, nominal=1.0),
         AbsolutePressure(start=1.0e5, nominal=1.0e5),
         Temperature(min=273.15, max=320.15, start=298.15, nominal=298.15),
         MassFlowRate(nominal=1e-3));

    protected

    /*
  constant Chemical.Interfaces.Definition substanceData[nS]={
      Chemical.Substances.Gas.O2,
      Chemical.Substances.Gas.CO2,
      Chemical.Substances.Gas.H2O,
      Chemical.Substances.Gas.N2} "Definition of the substances";
*/
      constant Modelica.Units.SI.MoleFraction Conc[nS-1]={0.21,0.0004,0.02}
        "sum(*) = 1";

      constant Real C2X[nS-1] = aMM[1:nS-1] ./ (Conc * aMM[1:nS-1] + (1 - sum(Conc)) * aMM[nS]) "Conc to mass fraction coefficient";

      constant Real aMM[nS] = ones(nS) ./ Properties.specificAmountOfParticles(substanceData, Chemical.Interfaces.SolutionState(phase=Chemical.Interfaces.Phase.Gas, T=298.15, p=101325)) "Average molar mass of substance particle";

  public
      redeclare replaceable function extends specificEnthalpies_Tpv "Specific enthalpies of substances at defined temperature, pressure, electric potential"
      algorithm
           specificEnthalpy:=Chemical.Interfaces.Properties.specificEnthalpy(
              substanceData,
              Chemical.Interfaces.SolutionState(Chemical.Interfaces.Phase.Gas,T,p,v));
      end specificEnthalpies_Tpv;

    public
      redeclare replaceable record extends ThermodynamicState
        "A selection of variables that uniquely defines the thermodynamic state"
        extends Modelica.Icons.Record;

        Modelica.Units.SI.Temperature T "Temperature of the solution";
        Modelica.Units.SI.Pressure p "Pressure of the solution";
        Modelica.Units.SI.ElectricPotential v "Electric potential in the solution";
        Modelica.Units.SI.MoleFraction I "Mole fraction based ionic strength of the solution";
        Modelica.Units.SI.MassFraction X[nS] "Mass fractions of substances";

      end ThermodynamicState;

      replaceable function electrochemicalPotentials_pTXvI
        import Chemical.Interfaces.Properties;
        input Modelica.Units.SI.Pressure p;
        input Modelica.Units.SI.Temperature T;
        input Modelica.Units.SI.MoleFraction x_baseMolecule[nS] "Free mole fraction of substance base molecule";
        input Modelica.Units.SI.ElectricPotential electricPotential=0;
        input Modelica.Units.SI.MoleFraction moleFractionBasedIonicStrength=0;
        output Modelica.Units.SI.ChemicalPotential u[nS];
      protected
        Real a[nS];
        Modelica.Units.SI.ChargeNumberOfIon z[nS];
        Chemical.Interfaces.SolutionState solutionState = Chemical.Interfaces.SolutionState(
            Chemical.Interfaces.Phase.Gas,
            T,
            p,
            electricPotential,
            moleFractionBasedIonicStrength);
      algorithm
        a := Properties.activityCoefficient(
            substanceData,
            solutionState) .* x_baseMolecule;
        z := Properties.chargeNumberOfIon(
            substanceData,
            solutionState);
        u := Properties.chemicalPotentialPure(
            substanceData,
            solutionState) .+ Modelica.Constants.R*T*log(a) .+ z*Modelica.Constants.F*
          electricPotential;
      end electrochemicalPotentials_pTXvI;



      redeclare replaceable function extends setState_pTX
      algorithm
        state.T := T;
        state.p := p;
        state.X := X;
        state.v := 0;
        state.I := 0;
      end setState_pTX;

      redeclare replaceable function extends setState_phX
        "Return thermodynamic state as function of p, h and composition X or Xi"
      algorithm
        state.p := p;
        state.X := X;
        state.T := Modelica.Math.Nonlinear.solveOneNonlinearEquation(function temperatureError(p=p, X=X,  h=h), 273.15, 330,     1e-2);
        state.v := 0;
        state.I := 0;
      end setState_phX;

      redeclare replaceable function extends setState_pTXvI
      algorithm
        state.T := T;
        state.p := p;
        state.X := X;
        state.v := v;
        state.I := I;
      end setState_pTXvI;

      redeclare replaceable function extends setState_phXvI
        "Return thermodynamic state as function of p, h and composition X or Xi"
      algorithm
        state.p := p;
        state.X := X;
        state.T := Modelica.Math.Nonlinear.solveOneNonlinearEquation(function temperatureError(p=p, X=X,  h=h), 273.15, 330,     1e-2);
        state.v := v;
        state.I := I;
      end setState_phXvI;

      redeclare replaceable function setSolutionState_m
         import Modelica.Units.SI.Mass;
         import Chemical.Interfaces.SolutionState;

         input ThermodynamicState state "Thermodynamic state of the solution";
         input Mass m "Mass of the solution";

         output SolutionState solutionState(
              T=state.T,p=state.p,v=state.v,n=sum(m*state.X./substanceData.data.MM),m=m,V=m/density(state),G=0,Q=0,I=state.I);
              /*gibbsEnergy(state,m),charge_m(state,m),*/
      algorithm
        annotation(Inline = true);

      end setSolutionState_m;

       redeclare replaceable function extends density
       algorithm
        d := 1/(state.X*Properties.specificVolume(
            substanceData,
            Chemical.Interfaces.SolutionState(Chemical.Interfaces.Phase.Gas, state.T, state.p)));
       end density;

      redeclare replaceable function extends specificEnthalpy
      algorithm
        h := state.X * Properties.specificEnthalpy(
            substanceData,
            Chemical.Interfaces.SolutionState(phase=Chemical.Interfaces.Phase.Gas,T=state.T,p=state.p,v=state.v));
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

      replaceable function X "To set mass fractions"
        input Types.AmountOfSubstance
            tO2 = 0.21,
            tCO2 = 0.0003,
            tH2O = 0.06,
            tN2 = 1-tO2-tCO2-tH2O;
        output Types.MassFraction X[nS];
      protected
        Types.Mass tm;
      algorithm
        tm :=tO2*O2_g.data.MM + tCO2*CO2_g.data.MM + tH2O*H2O_g.data.MM +
          tN2*N2_g.data.MM;
        X[Utilities.findIndex("O2",substanceNames)] := (tO2*O2_g.data.MM)/tm;
        X[Utilities.findIndex("CO2",substanceNames)] := (tCO2*CO2_g.data.MM)/tm;
        X[Utilities.findIndex("H2O",substanceNames)] := (tH2O*H2O_g.data.MM)/tm;
        X[Utilities.findIndex("N2",substanceNames)] := (tN2*N2_g.data.MM)/tm;
      end X;

      redeclare replaceable model extends ChemicalSolution

        import Chemical.Interfaces.Properties;

      protected
         Modelica.Units.SI.Molality NpM[nS] "Amount of substance particles per mass of substance";
         Modelica.Units.SI.MoleFraction x_baseMolecule[nS] "Mole fraction of free base molecule of substance";

      equation
        massFlows = n_flow.*substanceData.data.MM;

        state_out.u = Properties.electroChemicalPotentialPure(
            substanceData,
            solutionState) + Modelica.Constants.R*state.T*log(x_baseMolecule);

        state_out.h = Properties.molarEnthalpy( substanceData, solutionState);



        x_baseMolecule = state.X.*Properties.specificAmountOfFreeBaseMolecule(substanceData,solutionState)./(state.X*NpM);

        NpM = Properties.specificAmountOfParticles(substanceData,solutionState);


      end ChemicalSolution;
      annotation (Documentation(revisions="<html>
<p><i>2021</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
<p>All rights reserved. </p>
</html>"));
    end Air;

  package BodyFluid "Simplified Human body fluid"
    import Physiolibrary.Media.Substances.*;
    import Physiolibrary.Media.InitialValues.*;
    import Chemical.Interfaces.Properties;
    extends Interfaces.PartialMedium(
      mediumName="SimpleBodyFluid (Physiolibrary)",
      substanceNames={"Na","HCO3","K","Glucose","Urea","Cl","Ca","Mg","Alb",
    "Glb","Others","H2O"},
      substanceData={
      Chemical.Substances.Aqueous.Naplus,
      Chemical.Substances.Aqueous.HCO3minus,
      Chemical.Substances.Aqueous.Kplus,
      Chemical.Substances.Solid.Glu,
      Chemical.Substances.Aqueous.Urea,
      Chemical.Substances.Aqueous.Clminus,
      Chemical.Substances.Aqueous.Caplus2,
      Chemical.Substances.Aqueous.Mgplus2,
      Chemical.Substances.Aqueous.Alb,
      Chemical.Substances.Aqueous.Glb,
      Chemical.Substances.Liquid.H2OUnclustered,
      Chemical.Substances.Liquid.H2O},
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


   /* constant Chemical.Interfaces.Definition substanceData[nS] = {
    Chemical.Substances.Aqueous.Naplus,
    Chemical.Substances.Aqueous.HCO3minus,
    Chemical.Substances.Aqueous.Kplus,
    Chemical.Substances.Solid.Glu,
    Chemical.Substances.Aqueous.Urea,
    Chemical.Substances.Aqueous.Clminus,
    Chemical.Substances.Aqueous.Caplus2,
    Chemical.Substances.Aqueous.Mgplus2,
    Chemical.Substances.Aqueous.Alb,
    Chemical.Substances.Aqueous.Glb,
    Chemical.Substances.Liquid.H2OUnclustered,
    Chemical.Substances.Liquid.H2O}
     "Definition of the substances";
*/
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
      Chemical.Interfaces.SolutionState solutionState = Chemical.Interfaces.SolutionState(Chemical.Interfaces.Phase.Aqueous, T, p, electricPotential, moleFractionBasedIonicStrength);
    algorithm
      a := Properties.activityCoefficient(substanceData, solutionState)
           .* x_baseMolecule;
      z := Properties.chargeNumberOfIon(substanceData, solutionState);
      u := Properties.chemicalPotentialPure(substanceData, solutionState)
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
    protected
      Chemical.Interfaces.SolutionState solutionState = Chemical.Interfaces.SolutionState(Chemical.Interfaces.Phase.Aqueous, T, p, electricPotential, moleFractionBasedIonicStrength);
    algorithm
      h:= Properties.molarEnthalpy(
          substanceData, solutionState);
    end molarEnthalpies_pTvI;



  public
    redeclare replaceable model extends ChemicalSolution
    protected
          Modelica.Units.SI.Molality NpM[nS] "Amount of substance particles per mass of substance";
          Modelica.Units.SI.MoleFraction x_baseMolecule[nS] "Mole fraction of free base molecule of substance";
          Modelica.Units.SI.ChargeNumberOfIon z[nS] "Charge of base molecule of substance";

          Modelica.Units.SI.AmountOfSubstance nSolution "Amount of all particles per one kilogram";

          Modelica.Units.SI.Temperature T = temperature(state);
    equation
          NpM = Properties.specificAmountOfParticles(substanceData,solutionState);

          nSolution = state.X*NpM*1;
          x_baseMolecule = state.X.*Properties.specificAmountOfFreeBaseMolecule(substanceData,solutionState,mass=state.X,nSolution=nSolution)./(state.X*NpM);


          massFlows = n_flow.*substanceData.data.MM;

          state_out.u = Properties.electroChemicalPotentialPure(substanceData,solutionState)
                          + Modelica.Constants.R*state.T*log(x_baseMolecule);

          state_out.h = Properties.molarEnthalpy( substanceData, solutionState);


          z = Properties.chargeNumberOfIon(substanceData,solutionState);

        //  _i = 0;
          //TODO
          /*Modelica.Constants.F*(
       substances.Na.q +
       (-substances.HCO3.q)  +
       substances.K.q +
       (-substances.Cl.q) +
       2*substances.Ca.q  +
       2*substances.Mg.q)
      "electric current";
      */

    end ChemicalSolution;

    redeclare replaceable function extends specificEnthalpies_Tpv "Specific enthalpies of substances at defined temperature, pressure, electric potential"
    algorithm
         specificEnthalpy:=Properties.specificEnthalpy(
            substanceData,
            Chemical.Interfaces.SolutionState(Chemical.Interfaces.Phase.Aqueous,T,p,v));
    end specificEnthalpies_Tpv;

  public
    redeclare replaceable model extends BaseProperties(final standardOrderComponents=true)
      "Base properties of medium"

    protected
      Chemical.Interfaces.SolutionState solutionState=Chemical.Interfaces.SolutionState(phase=Chemical.Interfaces.Phase.Aqueous,T=T,p=p);
      Modelica.Units.SI.Molality NpM[nS]=Properties.specificAmountOfParticles(
        substanceData,solutionState);
    equation

      1/d = X * Properties.specificVolume(substanceData,solutionState);
      h = X * Properties.specificEnthalpy(substanceData,solutionState);
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

    redeclare replaceable function extends setState_pTX
      "Return thermodynamic state as function of p, T and composition X or Xi"
      input Modelica.Units.SI.ElectricPotential v=0;
    algorithm
      state.p :=p;
      state.T :=T;
      state.X :=X;
      state.v :=v;
    end setState_pTX;

    redeclare replaceable function extends setState_phX
      "Return thermodynamic state as function of p, h and composition X or Xi"
      input Modelica.Units.SI.ElectricPotential v=0;
    algorithm
      state.p :=p;
      state.T := Modelica.Math.Nonlinear.solveOneNonlinearEquation(function temperatureError(p=p, X=X,  h=h), 273.15, 330,     1e-2);
       //Properties.specific_solution_temperature(substanceData,Chemical.Interfaces.Phase.Aqueous, h=h,X=X,p=p);
      state.X :=X;
      state.v :=v;
    end setState_phX;

    redeclare replaceable function extends dynamicViscosity "Return dynamic viscosity"
    algorithm
      eta := (2.414e-5)*10^(247.8/(state.T-140));  //https://www.engineersedge.com/physics/water__density_viscosity_specific_weight_13146.htm
      annotation (Documentation(info="<html>

</html>"));
    end dynamicViscosity;

    redeclare replaceable function extends thermalConductivity
      "Return thermal conductivity"
    algorithm
      lambda := 0.6; //google
      annotation (Documentation(info="<html>

</html>"));
    end thermalConductivity;

    redeclare replaceable function extends specificEnthalpy "Return specific enthalpy"
    algorithm
      h := state.X * Properties.specificEnthalpy(substanceData,Chemical.Interfaces.SolutionState(Chemical.Interfaces.Phase.Aqueous,state.T,state.p));
    end specificEnthalpy;

    redeclare replaceable function extends specificHeatCapacityCp
      "Return specific heat capacity at constant pressure"
    algorithm
      cp := state.X * Properties.specificHeatCapacityCp(substanceData,Chemical.Interfaces.SolutionState(Chemical.Interfaces.Phase.Aqueous,state.T,state.p));
      annotation (Documentation(info="<html>

</html>"));
    end specificHeatCapacityCp;

    redeclare replaceable function extends isentropicExponent "Return isentropic exponent"
      extends Modelica.Icons.Function;
    algorithm
      gamma := 23128; //http://twt.mpei.ac.ru/MCS/Worksheets/WSP/WKDiag15.xmcd
      annotation (Documentation(info="<html>

</html>"));
    end isentropicExponent;

    redeclare replaceable function extends velocityOfSound "Return velocity of sound"
      extends Modelica.Icons.Function;
    algorithm
      a := 1481; //wikipedia
      annotation (Documentation(info="<html>

</html>"));
    end velocityOfSound;

    redeclare replaceable function extends density
    algorithm
      d := 1/( state.X * Properties.specificVolume(substanceData,Chemical.Interfaces.SolutionState(Chemical.Interfaces.Phase.Aqueous,state.T,state.p)));
    end density;

    redeclare replaceable function extends temperature
    algorithm
      T := state.T;
    end temperature;

    redeclare replaceable function extends pressure
    algorithm
      p := state.p;
    end pressure;

    replaceable function X "To set mass fractions"
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

      X[Utilities.findIndex("Na",substanceNames)] := (tNa*Na.data.MM)/density;
      X[Utilities.findIndex("HCO3",substanceNames)] := (tHCO3*HCO3.data.MM)/density;
      X[Utilities.findIndex("K",substanceNames)] := (tK*K.data.MM)/density;
      X[Utilities.findIndex("Glucose",substanceNames)] := (tGlucose*Constants.MM_Glucose)/density;
      X[Utilities.findIndex("Urea",substanceNames)] := (tUrea*Constants.MM_Urea)/density;
      X[Utilities.findIndex("Cl",substanceNames)] := (tCl*Cl.data.MM)/density;
      X[Utilities.findIndex("Ca",substanceNames)] := (tCa*Ca.data.MM)/density;
      X[Utilities.findIndex("Mg",substanceNames)] := (tMg*Mg.data.MM)/density;
      X[Utilities.findIndex("Alb",substanceNames)] := (tAlb*Constants.MM_Alb)/density;
      X[Utilities.findIndex("Glb",substanceNames)] := tGlb/density;
      X[Utilities.findIndex("Others",substanceNames)] := tOthers/density;
      X[Utilities.findIndex("H2O",substanceNames)] := 1 - sum(X[1:(nS - 1)]);
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

      constant Chemical.Interfaces.Definition substanceData[nS];

      constant Modelica.Units.SI.MassFlowRate SubstanceFlowNominal[nS]=ones(nS) "Nominal of substance flow";
      constant Modelica.Units.SI.SpecificEnthalpy SpecificEnthalpyNominal=-1E6 "Nominal of specific enthalpy";


      replaceable partial function setState_pTXvI
      "Return thermodynamic state as function of pressure p, temperature T, composition X or Xi, electric potential v, and ionic strength v"
      extends Modelica.Icons.Function;

      input AbsolutePressure p "Pressure";
      input Temperature T "Temperature";
      input MassFraction X[:]=reference_X "Mass fractions";
      input Modelica.Units.SI.ElectricPotential v=0 "Electric potential";
      input Modelica.Units.SI.MoleFraction I=0 "Ionic strength";
      output ThermodynamicState state "Thermodynamic state record";
      end setState_pTXvI;

      replaceable partial function setState_phXvI
      "Return thermodynamic state as function of p, h and composition X or Xi"
      extends Modelica.Icons.Function;
      input AbsolutePressure p "Pressure";
      input SpecificEnthalpy h "Specific enthalpy";
      input MassFraction X[:]=reference_X "Mass fractions";
      input Modelica.Units.SI.ElectricPotential v=0 "Electric potential";
      input Modelica.Units.SI.MoleFraction I=0 "Ionic strength";
      output ThermodynamicState state "Thermodynamic state record";
      end setState_phXvI;



      replaceable partial function setSolutionState_m
       import Modelica.Units.SI.Mass;
       import Chemical.Interfaces.SolutionState;

       input ThermodynamicState state "Thermodynamic state of the solution";
       input Mass m "Mass of the solution";

       output SolutionState solutionState;


      end setSolutionState_m;

       replaceable partial function specificEnthalpies_Tpv "Specific enthalpies of medium substances"
             input Modelica.Units.SI.Temperature T=298.15 "Temperature";
             input Modelica.Units.SI.Pressure p=100000 "Pressure";
             input Modelica.Units.SI.ElectricPotential v=0
              "Electric potential of the substance";
             output Modelica.Units.SI.SpecificEnthalpy specificEnthalpy[nS]
               "Specific enthalpies of medium substances";

       end specificEnthalpies_Tpv;

       replaceable function temperatureError  "To find u as temperature, where temperatureError(u,p,X,h)->0"
       extends Modelica.Math.Nonlinear.Interfaces.partialScalarFunction;
         input Modelica.Units.SI.Pressure p;
         input Modelica.Units.SI.MassFraction X[nS];
         input Modelica.Units.SI.SpecificEnthalpy h;

       protected
          Modelica.Units.SI.SpecificEnthalpy hs[nS];
       algorithm
         hs:=specificEnthalpies_Tpv(u, p);
         y:=h-sum(hs[i]*X[i] for i in 1:nS);
       end temperatureError;

       partial function GetMolality
         input ThermodynamicState state;
         output Types.Molality B;
        annotation (Documentation(info="<html>
<p>Molality function for Fluid.Sensors.Molality sensor.</p>
</html>"));
       end GetMolality;

       partial function GetMassConcentration
         input ThermodynamicState state;
         output Types.MassConcentration R;
        annotation (Documentation(info="<html>
<p>MassConcentration for Fluid.Sensors.MassConcentration sensor.</p>
</html>"));
       end GetMassConcentration;

       partial function GetFraction
         input ThermodynamicState state;
         output Types.Fraction F;
        annotation (Documentation(info="<html>
<p>Fraction function used for Fluid.Sensors.Fraction sensor.</p>
</html>"));
       end GetFraction;

       partial function GetActivity
         input ThermodynamicState state;
         output Real A;
        annotation (Documentation(info="<html>
<p>Activity function for Fluid.Sensors.Activity sensor.</p>
</html>"));
       end GetActivity;

       partial function GetDensity
         input ThermodynamicState state;
         output Types.Density d;
        annotation (Documentation(info="<html>
<p>Density function for Fluid.Sensors.Density sensor.</p>
</html>"));
       end GetDensity;

       partial function GetExtraProperty
         input Real C[nC] "Extra properties values";
         output Real e;
        annotation (Documentation(info="<html>
<p>Extra property function for Fluid.Sensors.ExtraProperty sensor.</p>
</html>"));
       end GetExtraProperty;

       partial function GetConcentration
         input ThermodynamicState state;
         output Types.Concentration C;
        annotation (Documentation(info="<html>
<p>Concentration function for Fluid.Sensors.Concentration sensor.</p>
</html>"));
       end GetConcentration;

      replaceable partial model ChemicalSolution "Adaptor between selected free base chemical substances and medium substances"
        outer Modelica.Fluid.System system "System wide properties";

         parameter Integer nF=0;
         parameter Integer nR=0;
         parameter String SubstancesToConnect[:]=substanceNames "Set of substances available to connect as rear or fore port";
         parameter Integer nC=size(SubstancesToConnect,1);
         parameter String ForeSubstances[nF];
         parameter String RearSubstances[nR];

         Chemical.Interfaces.Fore foreSubstances[nF];
         Chemical.Interfaces.Rear rearSubstances[nR];


         input ThermodynamicState state;
         input Chemical.Interfaces.SolutionState solutionState "Solution state of air";

         parameter Types.Mass startSubstanceMasses[nS]=fill(Modelica.Constants.small,nS) "Initial value of medium substance masses";

       //  protected
       parameter Real AF[nC,nF] = Utilities.findIndicesMatrix(
                                                    ForeSubstances,SubstancesToConnect);
       parameter Real AR[nC,nR] = Utilities.findIndicesMatrix(
                                                    RearSubstances,SubstancesToConnect);

        Modelica.Units.SI.MolarFlowRate n_flow[nC] "Molar change of the amount of base substance";
        Modelica.Units.SI.MassFlowRate massFlows[nS](nominal=SubstanceFlowNominal) "mass flows trough substancesPort";
        Physiolibrary.Types.RealIO.MassFlowRateInput substanceMassFlowsFromStream[nS] "flow of medium substances";
        Physiolibrary.Types.RealIO.MassOutput substanceMasses[nS](nominal=SubstanceFlowNominal) "mass od medium substances";


        Modelica.Units.SI.EnthalpyFlowRate h_flow[nC] "Change of enthalpy";
        Modelica.Units.SI.EnthalpyFlowRate _connected_h_flow[nF+nR];

        Physiolibrary.Types.RealIO.HeatFlowRateOutput enthalpyFromSubstances "enthalpy from substances";

        Chemical.Interfaces.SubstanceState state_out[nC] "Internal state os substances";


        parameter Chemical.Utilities.Units.Inertance L=dropOfCommons.L
         annotation(HideResult=true, Dialog(tab = "Advanced"));

        parameter Modelica.Units.SI.MolarFlowRate n_flow_reg=dropOfCommons.n_flow_reg "Regularization threshold of mass flow rate"
          annotation(HideResult=true, Dialog(tab="Advanced"));

        outer Chemical.DropOfCommons dropOfCommons "Chemical wide properties";

         //if port.n_flow > 0 -> it is sink (r=medium.u-u_in) else it is source (r=0)
        Modelica.Units.SI.ChemicalPotential r_intern[nF+nR];
        // dont regstep variables that are only in der(state), to increase accuracy


      initial equation
        substanceMasses = startSubstanceMasses;
      equation
        der(substanceMasses) = substanceMassFlowsFromStream + massFlows;

        for iF in 1:nF loop
          r_intern[iF]=Chemical.Utilities.Internal.regStep(
                  foreSubstances[iF].n_flow,
                  foreSubstances[iF].state_forwards.u - foreSubstances[iF].state_rearwards.u,
                  0,
                  n_flow_reg);

          _connected_h_flow[iF]= (if foreSubstances[iF].n_flow >= 0 then
                  foreSubstances[iF].state_rearwards.h else
                  foreSubstances[iF].state_forwards.h)*foreSubstances[iF].n_flow;
        end for;
        for iR in 1:nR loop
          r_intern[nF+iR]=Chemical.Utilities.Internal.regStep(
                  rearSubstances[iR].n_flow,
                  rearSubstances[iR].state_rearwards.u - rearSubstances[iR].state_forwards.u,
                  0,
                  n_flow_reg);

          _connected_h_flow[nF+iR]= (if rearSubstances[iR].n_flow >= 0 then
                  rearSubstances[iR].state_forwards.h else
                  rearSubstances[iR].state_rearwards.h)*rearSubstances[iR].n_flow;
        end for;


        der(foreSubstances.n_flow)*L = foreSubstances.r - r_intern[1:nF];
        der(rearSubstances.n_flow)*L = rearSubstances.r - r_intern[nF+1:nF+nR];

        n_flow = AF*foreSubstances.n_flow + AR*rearSubstances.n_flow;
        h_flow = AF*_connected_h_flow[1:nF] + AR*_connected_h_flow[nF+1:nF+nR];

        foreSubstances.state_forwards.u = state_out.u*AF;
        foreSubstances.state_forwards.h = state_out.h*AF;
        rearSubstances.state_rearwards.u = state_out.u*AR;
        rearSubstances.state_rearwards.h = state_out.h*AR;


        enthalpyFromSubstances = sum(h_flow);

        foreSubstances.solution_forwards = fill(solutionState,nF);
        rearSubstances.solution_rearwards = fill(solutionState,nR);


      end ChemicalSolution;
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

    constant Chemical.Interfaces.Definition O2_g=Chemical.Substances.Gas.O2;
      constant Chemical.Interfaces.Definition CO2_g=Chemical.Substances.Gas.CO2;
      constant Chemical.Interfaces.Definition CO_g=Chemical.Substances.Gas.CO;
      constant Chemical.Interfaces.Definition H2O_g=Chemical.Substances.Gas.H2O;
      constant Chemical.Interfaces.Definition N2_g=Chemical.Substances.Gas.N2;


     constant Chemical.Interfaces.Definition O2=Chemical.Substances.Aqueous.O2;
      constant Chemical.Interfaces.Definition CO2=Chemical.Substances.Aqueous.CO2;
      constant Chemical.Interfaces.Definition CO=Chemical.Substances.Aqueous.CO;

      constant Chemical.Interfaces.Definition H2=Chemical.Substances.Aqueous.H2;

       constant Chemical.Interfaces.Definition Cl=Chemical.Substances.Aqueous.Clminus;
       constant Chemical.Interfaces.Definition Ca=Chemical.Substances.Aqueous.Caplus2;
       constant Chemical.Interfaces.Definition K=Chemical.Substances.Aqueous.Kplus;
       constant Chemical.Interfaces.Definition Mg=Chemical.Substances.Aqueous.Mgplus2;
       constant Chemical.Interfaces.Definition Na=Chemical.Substances.Aqueous.Naplus;

      constant Chemical.Interfaces.Definition H=Chemical.Substances.Aqueous.Hplus;
      constant Chemical.Interfaces.Definition H3O=Chemical.Substances.Aqueous.H3Oplus;
      constant Chemical.Interfaces.Definition OH=Chemical.Substances.Aqueous.OHminus;
      constant Chemical.Interfaces.Definition e=Chemical.Substances.Solid.e "electrone";


      constant Chemical.Interfaces.Definition PO4=Chemical.Substances.Aqueous.PO4minus3;
      constant Chemical.Interfaces.Definition SO4=Chemical.Substances.Aqueous.SO4minus2;

      constant Chemical.Interfaces.Definition HCO3=Chemical.Substances.Aqueous.HCO3minus;

      constant Chemical.Interfaces.Definition Glucose=Chemical.Substances.Solid.Glu;
      constant Chemical.Interfaces.Definition Urea=Chemical.Substances.Aqueous.Urea;
      constant Chemical.Interfaces.Definition Water=Chemical.Substances.Liquid.H2O;

      constant Chemical.Interfaces.Definition Lactate=
      Chemical.Interfaces.Definition(
        MM=0.0903,
        DfH=-694080,
        DfG=-430620) "from  https://www.chemeo.com/cid/11-815-4/L-Lactic-acid";

      constant Chemical.Interfaces.Definition Hb=Chemical.Interfaces.Definition(MM=Constants.MM_Hb)   "Hemoglobin";
      constant Chemical.Interfaces.Definition AminoAcid=Chemical.Interfaces.Definition(MM=Constants.MM_AminoAcids)   "Amino acid";
      constant Chemical.Interfaces.Definition Lipid=Chemical.Interfaces.Definition(MM=Constants.MM_Lipids)   "Lipid";
      constant Chemical.Interfaces.Definition KetoAcid=Chemical.Interfaces.Definition(MM=Constants.MM_KetoAcids)   "Keto acid";
      constant Chemical.Interfaces.Definition Alb=Chemical.Interfaces.Definition(MM=Constants.MM_Alb)   "Albumin";
      constant Chemical.Interfaces.Definition Glb=Chemical.Interfaces.Definition(MM=Constants.MM_Glb)   "Globulin";
      constant Chemical.Interfaces.Definition DPG=Chemical.Interfaces.Definition(MM=Constants.MM_DPG)   "DPG";
      constant Chemical.Interfaces.Definition Epinephrine=Chemical.Interfaces.Definition(MM=Constants.MM_Epinephrine)   "Epinephrine";
      constant Chemical.Interfaces.Definition Norepinephrine=Chemical.Interfaces.Definition(MM=Constants.MM_Norepinephrine)   "Norepinephrine";
      constant Chemical.Interfaces.Definition Vasopressin=Chemical.Interfaces.Definition(MM=Constants.MM_Vasopressin)   "Vasopressin";
      constant Chemical.Interfaces.Definition Insulin=Chemical.Interfaces.Definition(MM=Constants.MM_Insulin)   "Insulin";
      constant Chemical.Interfaces.Definition Glucagon=Chemical.Interfaces.Definition(MM=Constants.MM_Glucagon)   "Glucagon";
      constant Chemical.Interfaces.Definition Thyrotropin=Chemical.Interfaces.Definition(MM=Constants.MM_Thyrotropin)   "Thyrotropin";
      constant Chemical.Interfaces.Definition Thyroxine=Chemical.Interfaces.Definition(MM=Constants.MM_Thyroxine)   "Thyroxine";
      constant Chemical.Interfaces.Definition Leptin=Chemical.Interfaces.Definition(MM=Constants.MM_Leptin)   "Leptin";
      constant Chemical.Interfaces.Definition Angiotensin2=Chemical.Interfaces.Definition(MM=Constants.MM_Angiotensin2)   "Angiotensin2";
      constant Chemical.Interfaces.Definition Renin=Chemical.Interfaces.Definition(MM=Constants.MM_Renin)   "Renin";
      constant Chemical.Interfaces.Definition Aldosterone=Chemical.Interfaces.Definition(MM=Constants.MM_Aldosterone)   "Aldosterone";
      constant Chemical.Interfaces.Definition Desglymidodrine=Chemical.Interfaces.Definition(MM=Constants.MM_Desglymidodrine)   "Desglymidodrine";









  end Substances;

  package InitialValues
    import Physiolibrary.Media.Substances.*;

    constant Types.Density D_BloodDensity=1057 "Density of blood";
    constant Types.Density D_BloodPlasmaDensity=1025 "Density of blood plasma";

    constant Types.VolumeFraction D_Hct = 0.44 "Default hematocrit [ml/ml]";

    constant Types.Concentration
         D_Na = 138.5 "Default sodium in blood plasma",
         D_K = 4 "Default potassium in blood plasma",
         D_Cl = 103 "Default chloride in blood plasma",
         D_Na_RBC = 7 "Default sodium in blood red cells",
         D_K_RBC = 96 "Default potassium in blood red cells",
         D_Cl_RBC = 50 "Default chloride in blood red cells";


    constant Real D_SID_P = D_Na+D_K-D_Cl;
    constant Real D_SID_RBC = D_Na_RBC+D_K_RBC-D_Cl_RBC;

    constant Types.Concentration
         D_Glucose = 6.08 "Default glucose in blood plasma",
         D_Lactate = 1.04 "Default lactate in blood plasma",
         D_Urea = 6.64 "Default urea in blood plasma",
         D_AminoAcids = 4.97 "Default amino acids in blood plasma",
         D_Lipids = 1.23 "Default lipids in blood plasma",
         D_Ketoacids = 4.88e-2 "Default keto acids in blood plasma";

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
                                  D_SO4 = 0.14 "Default Inorganic sulphates",
                                  D_DPG = 5.4 "Default Diphosphoglycerate in red blood cells";

    constant Types.MassConcentration D_Glb = 28 "Default Globulins in blood plasma";

    constant Real D_SID = D_NSID - D_BEox "Default Strong ion difference in blood [mEq/L]";
    constant Real D_BEox = 0 "Default Base excess of oxygenated blood from normal arterial conditions [mEq/L]";

    constant Real D_NSID_P = zAlbNAP * D_Alb + zGlbNAP * D_Glb + zPO4NAP * D_PO4 + ztCO2NAP;
    constant Real D_NSID_E = zHbNAE * (D_Hb / D_Hct) + ztCO2NAE + zDPG * D_DPG + zOtherE;

    constant Real D_NSID = (1 - D_Hct) * (zAlbNAP * D_Alb + zGlbNAP * D_Glb + zPO4NAP * D_PO4 + ztCO2NAP) + D_Hct * (zHbNAE * (D_Hb / D_Hct) + ztCO2NAE + zDPG * D_DPG + zOtherE)
                         "Default Total charge number on buffers at normal arterial conditions per total volume [mEq/L]";

    constant Real zAlbNAP = 18.5565 "charge on albumin at normal arterial plasma conditions [Eq/mol]",
                  zGlbNAP = 0.0892857 "charge on globilins at normal arterial plasma conditions [Eq/mol]",
                  zPO4NAP = 1.79924 "charge on inorganic phosphates at normal arterial plasma conditions [Eq/mol]",
                  ztCO2NAP = 24.4732 "charge of bicarbonate and carbonate at normal arterial plasma conditions [mEq/L]",
                  ztCO2NAE = 15.0901 "charge of bicarbonate and carbonate at normal arterial erythrocyte conditions [mEq/L]",
                  zHbNAE = 1.06431 "relative charge on oxygenated hemoglobin at normal arterial erythrocyte conditions [Eq/mol]",
                  zDPG = 2.2 "charge of diphosphoglycerate at normal arterial erythrocyte condition [mEq/mol]",
                  zOtherE = 5.72 "charge of other anions in red blood cells at normal arterial erythrocyte condition [mEq/L]";

    constant Types.MassConcentration
        D_Epinephrine_MC(displayUnit="ng/L")=40e-9 "Default epinephrine in blood plasma",
        D_Norepinephrine_MC(displayUnit="ng/L")=240e-9 "Dafault norepinephrine in blood plasma",
        D_Glucagon_MC(displayUnit="ng/L")=69.68e-9 "Default glucagon in blood plasma",
        D_Thyroxine_MC(displayUnit="ug/L")=79.6e-6 "Default thyroxin T3 and T4 in blood plasma",
        D_Leptin_MC(displayUnit="ug/L")=7.96e-6 "Default leptin in blood plasma",
        D_Desglymidodrine_MC(displayUnit="ug/L")=1e-11 "Default desglymidodrine in blood plasma",
        D_Angiotensin2_MC(displayUnit="ng/L")=20e-9 "Default angiotensin II in blood plasma";

    constant Real
        D_Insulin_A(displayUnit="mU/L")=19.91 "Default insulin activity in blood plasma [mU/L]",
        D_AlphaBlockers_f=Modelica.Constants.small "Default aplpha blockers effect in blood plasma [%/L]",
        D_BetaBlockers_f=Modelica.Constants.small "Default beta blockers effect in blood plasma [%/L]",
        D_AnesthesiaVascularConductance_f=1 "Default effect of anesthesia to vascular conductance in blood plasma [%/L]",
        D_Renin_PRA(displayUnit="ng/(mL.h)")=2 "Default prasma renin activity in blood plasma [ng/mL/h]";

    constant Types.Concentration
        D_Epinephrine(displayUnit="pmol/L") = D_Epinephrine_MC / Constants.MM_Epinephrine "Default epinephrine in blood plasma",
        D_Norepinephrine(displayUnit="pmol/L") = D_Norepinephrine_MC / Constants.MM_Norepinephrine "Dafault norepinephrine in blood plasma",
        D_Vasopressin(displayUnit="pmol/L") = 1.84e-9 "Defaul vasopresin (ADH) in blood plasma",
        D_Insulin(displayUnit="pmol/L") = 6e-9 * D_Insulin_A "Default insulin in blood plasma - conversion factor for human insulin is 1 mU/L = 6.00 pmol/L",
        D_Glucagon(displayUnit="pmol/L") = D_Glucagon_MC / Constants.MM_Glucagon "Default glucagon in blood plasma",
        D_Thyrotropin(displayUnit="pmol/L") = 4.03e-9 "Default thyrotropin in blood plasma",
        D_Thyroxine(displayUnit="nmol/L") = D_Thyroxine_MC / Constants.MM_Thyroxine "Default thyroxin T3 and T4 in blood plasma",
        D_Leptin(displayUnit="nmol/L") = D_Leptin_MC / Constants.MM_Leptin "Default leptin in blood plasma",
        D_Desglymidodrine(displayUnit="nmol/L") = D_Desglymidodrine_MC / Constants.MM_Desglymidodrine "Default desglymidodrine in blood plasma",
        D_Angiotensin2(displayUnit="pmol/L") = D_Angiotensin2_MC / Constants.MM_Angiotensin2 "Default angiotensin II in blood plasma",
        D_Renin(displayUnit="fmol/L") = 1e-12 * 0.6 * 11.2 * D_Renin_PRA / Constants.MM_Renin "Default renin in blood plasma - conversion factor PRA (ng/mL/h) to DRC (mU/L) is 11.2, μIU/mL (mIU/L) * 0.6 = pg/mL",
        D_Aldosterone(displayUnit="nmol/L") = 0.33e-6 "Default aldosterone in blood plasma";

    constant Types.Concentration D_BloodPlasmaWater=932.75 "Default free particles of water in blood plasma";
    constant Types.Concentration D_BloodFormedElementsWater=694 "Default free particles of water in blood formed elements";
    constant Types.MassFraction D_H2O_B = 0.7342409 "Mass fraction of water in blood";

  end InitialValues;
  annotation (Documentation(info="<html>
<p><b><span style=\"font-family: Times New Roman;\">Water</b> &ndash; as pure incompressible water with constant heat capacity without any substance inside</span> </p>
<p><b><span style=\"font-family: Times New Roman;\">Air </b>&ndash; as an ideal gas model with oxygen, carbon dioxide, nitrogen and water</span> </p>
<p><b><span style=\"font-family: Times New Roman;\">Blood</b> &ndash; as an incompressible fluid containing many physiological substances such as blood gases, electrolytes, red cells, nutrients, proteins and hormones. Thanks to the shift of numerical tolerances with predefined nominal values for each substance, the calculation is numerically stable, even if the ratio between the mass fractions of substances is 10^9 (e.g. mass fraction of water / mass fraction of thyrotropin). Blood contains equations for haemoglobin oxygen saturation, acid-base balance, and carbon dioxide transfers to achieve physiological conditions in the transport of blood gases under variable conditions (Matej&aacute;k, Kulh&aacute;nek, and Matou&scaron;ek 2015). </span></p>
<p><b><span style=\"font-family: Times New Roman;\">BodyFluid</b> &ndash; as an incompressible fluid that simplifies other physiological fluids such as interstitial fluid, intracellular fluid, cerebrospinal fluid, or urine. In Physiolibrary 3.0 this medium represents only a homogeneous chemical solution without special transfers or binding of substances inside.</span> </p>
</html>"));
end Media;

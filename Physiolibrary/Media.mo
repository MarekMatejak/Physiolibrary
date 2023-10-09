within Physiolibrary;
package Media "Models of physiological fluids"
  extends Modelica.Icons.Package;

  package Blood "Blood"
    import Physiolibrary.Media.Substances.*;
    import Physiolibrary.Media.InitialValues.*;

    extends Media.Interfaces.PartialMedium(
      mediumName = "Blood",
      substanceNames={"H2O_P","H2O_E","O2","CO2_P","CO2_E","CO","eHb","MetHb","HbF","Alb","Glb","PO4","DPG",
        "Glucose","Lactate","Urea","AminoAcids","Lipids","KetoAcids",
        "Na_P","K_P","Na_E","K_E","Cl_P","Cl_E",
        "Epinephrine", "Norepinephrine","Vasopressin",
        "Insulin","Glucagon","Thyrotropin","Thyroxine","Leptin",
        "Desglymidodrine",
        "Angiotensin2","Renin","Aldosterone",
        "Other_P","Other_E"},
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

    constant Types.MassFraction ArterialDefault[nS]={
    0.47397342,0.2602675,0.00024730066,0.00060022215,0.00028510197,4.0067286e-11,0.13012053,0.0006506026,0.0006506026,0.023240043,0.0148344375,7.7006625e-06,0.0005979338,0.00058174727,4.9633483e-05,0.00021128391,0.00026331126,0.0005255277,2.637139e-06,0.0016869484,8.2860926e-05,6.699073e-05,0.0015625204,0.0018235744,0.0008487089,2.1192053e-11,1.2715232e-10,1.0567206e-12,3.675887e-10,3.6916557e-11,5.978278e-11,4.2172186e-08,4.2172186e-09,5.298013e-15,1.0596027e-11,7.12053e-15,6.301733e-11,0.025162973,0.061655864};

    constant Types.MassFraction VenousDefault[nS]={
    0.47057825,0.26366264,0.0001659035,0.00065897073,0.00033050895,4.0067286e-11,0.13012053,0.0006506026,0.0006506026,0.023240043,0.0148344375,7.7006625e-06,0.0005979338,0.00058174727,4.9633483e-05,0.00021128391,0.00026331126,0.0005255277,2.637139e-06,0.0016869484,8.2860926e-05,6.699073e-05,0.0015625204,0.0017914142,0.00088086916,2.1192053e-11,1.2715232e-10,1.0567206e-12,3.675887e-10,3.6916557e-11,5.978278e-11,4.2172186e-08,4.2172186e-09,5.298013e-15,1.0596027e-11,7.12053e-15,6.301733e-11,0.028531536,0.05826454};

    constant Types.MassFraction CDefault[nC]={
    1e-20,1e-20,1e-06};

  public
    redeclare connector extends SubstancesPort "Blood chemical substances interface"
         Chemical.Interfaces.SubstancePort_a CO2 "Free carbon dioxide molecule";
         Chemical.Interfaces.SubstancePort_a O2 "Free oxygen molecule";
         Chemical.Interfaces.SubstancePort_a CO "Free carbon monoxide moelcule";
         Chemical.Interfaces.SubstancePort_a HCO3 "Free bicarbonate molecule";
         Chemical.Interfaces.SubstancePort_a H "Free protons";
         Chemical.Interfaces.SubstancePort_a H2O "Free water molecule (in pure water is only cca 1 mol/kg free water molecules, other cca 54.5 mols are bounded together by hydrogen bonds)";

         Chemical.Interfaces.SubstancePort_a Glucose,Lactate,Urea,AminoAcids,Lipids,KetoAcids;

         Chemical.Interfaces.SubstancePort_a Epinephrine,Norepinephrine,Vasopressin;
         Chemical.Interfaces.SubstancePort_a Insulin,Glucagon,Thyrotropin,Thyroxine,Leptin;
         Chemical.Interfaces.SubstancePort_a Desglymidodrine;
         Chemical.Interfaces.SubstancePort_a Angiotensin2,Renin,Aldosterone;
      annotation (Documentation(info="<html>
<p><span style=\"font-family: Times New Roman;\">Electrochemical connections lead via free base substance forms. For example, the total mass fraction of carbon dioxide is represented as part of the composition of blood in fluid connector, but free dissolved carbon dioxide in blood plasma or bicarbonate in blood plasma are its electrochemical connectors proposed to model the electrochemical CO2 fluxes. Since the selected forms are precisely determined by the composition of the blood, it is not necessary to store them and pass them through the fluid connector. They are only expressed and calculated when needed.</span> </p>
</html>"));
    end SubstancesPort;

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

    package stateOfMatter = Chemical.Interfaces.Incompressible
      "Substances model to translate data into substance properties";

    redeclare replaceable model extends ChemicalSolution( substances(H2O(u(nominal=-225057)),Glucose(u(nominal=-910549))))
      "Free chemical substances"

      ThermodynamicState state "State of blood";

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

        Real aCO2_P,aCO2_E,cCO2_P,cCO2_E,cCO2_B,expected_tCO2_P,expected_tCO2_E;
    equation


      v=0 "electric potential is not used without external flows of charge";

      state = setState_phX(p, h, X);

      T = temperature(state);

      aO2 = bloodGases.pO2/p;
      aCO2 = bloodGases.pCO2/p;
      aCO = bloodGases.pCO/p;
      aH_plus = 10^(-bloodGases.pH);
      aHCO3 = bloodGases.cHCO3 / (x_P*plasmaDensity(state));
      aHCO3_E = bloodGases.cHCO3_E / (x_E*formedElementsDensity(state));

      state.X[i("Cl_P")] = (aCl_P*x_P)*Cl.MolarWeight*pct "Mass fraction of Cl- in blood";
      state.X[i("Cl_E")] = (aCl_E*x_E)*Cl.MolarWeight*hct "Mass fraction of Cl- in blood";
      Cl_Ery2Plasma = KC_Cl*(Modelica.Constants.R*T*log((aCl_E/aCl_P)*(aHCO3/aHCO3_E))) "Chloride shift";
      expected_XCl_E = (aCl_P*(aHCO3_E/aHCO3)*x_E)*Cl.MolarWeight*hct "Debug of chloride shift rate";

      state.X[i("CO2_P")] = (aCO2_P*x_P)*CO2.MolarWeight*pct;
      state.X[i("CO2_E")] = (aCO2_E*x_E)*CO2.MolarWeight*hct;
      //expected:
      expected_tCO2_P = bloodGases.tCO2_P;
      expected_tCO2_E = bloodGases.tCO2_ery;
      cCO2_P=(aCO2_P*x_P)*plasmaDensity(state);
      CO2_Ery2Plasma = - KC_CO2*(Modelica.Constants.R*T*log(aCO2_P/(bloodGases.tCO2_P/(x_P*plasmaDensity(state)))));
      cCO2_E=(aCO2_E*x_E)*formedElementsDensity(state);
      cCO2_B= tCO2(state);

      pct = plasmaMassFraction(state);
      hct = formedElementsMassFraction(state);

      state.X[i("H2O_P")] = aH2O_P*pct*x_P/Chemical.Interfaces.Incompressible.specificAmountOfParticles(Substances.Water,T,p,v);
      state.X[i("H2O_E")] = aH2O_E*hct*x_E/Chemical.Interfaces.Incompressible.specificAmountOfParticles(Substances.Water,T,p,v);
      H2O_Ery2Plasma = KC_H2O*(Modelica.Constants.R*T*log(aH2O_E/aH2O_P)) "Osmolarity equilibration rate";
      expected_XH2O_E = aH2O_P*hct*x_E/Chemical.Interfaces.Incompressible.specificAmountOfParticles(Substances.Water,T,p,v) "Debug of osmolarity equilibration";


      x_P =plasmaSpecificAmountOfParticles(state);

      x_E =formedElementsSpecificAmountOfParticles(state);


      substances.H2O.u = Modelica.Constants.R*T*log(aH2O_P)  +
            Chemical.Interfaces.Incompressible.electroChemicalPotentialPure(
              Substances.Water, T, p, v);
      substances.H2O.h_outflow = Chemical.Interfaces.Incompressible.molarEnthalpy(
          Substances.Water,
          T,
          p,
          v);

      substances.O2.u = Modelica.Constants.R*T*log(aO2) +
        Chemical.Interfaces.IdealGas.electroChemicalPotentialPure(
          Substances.O2_g,
          T,
          p,
          v);
      substances.O2.h_outflow = Chemical.Interfaces.IdealGas.molarEnthalpy(
          Substances.O2_g,
          T,
          p,
          v);


      substances.CO2.u = Modelica.Constants.R*T*log(aCO2) +
        Chemical.Interfaces.IdealGas.electroChemicalPotentialPure(
          Substances.CO2_g,
          T,
          p,
          v);
      substances.CO2.h_outflow = Chemical.Interfaces.IdealGas.molarEnthalpy(
          Substances.CO2_g,
          T,
          p,
          v);
      substances.HCO3.u = Modelica.Constants.R*T*log(aHCO3) +
        Chemical.Interfaces.Incompressible.electroChemicalPotentialPure(
          Substances.HCO3,
          T,
          p,
          v);
      substances.HCO3.h_outflow = Chemical.Interfaces.Incompressible.molarEnthalpy(
          Substances.HCO3,
          T,
          p,
          v);


      substances.CO.u = Modelica.Constants.R*T*log(aCO) +
        Chemical.Interfaces.IdealGas.electroChemicalPotentialPure(
          Substances.CO_g,
          T,
          p,
          v);
      substances.CO.h_outflow = Chemical.Interfaces.IdealGas.molarEnthalpy(
          Substances.CO_g,
          T,
          p,
          v);


      substances.H.u = Modelica.Constants.R*T*log(aH_plus) +
        Chemical.Interfaces.Incompressible.electroChemicalPotentialPure(
          Substances.H,
          T,
          p,
          v);
      substances.H.h_outflow = 0;


      substances.Glucose.u = Modelica.Constants.R*T*log(((state.X[i("Glucose")]/pct)/Constants.MM_Glucose)/x_P) +
         Chemical.Interfaces.Incompressible.electroChemicalPotentialPure(
          Substances.Glucose,
          T,
          p,
          v);
      substances.Glucose.h_outflow = Chemical.Interfaces.Incompressible.molarEnthalpy(
          Substances.Glucose,
          T,
          p,
          v);

      substances.Lactate.u = Modelica.Constants.R*T*log((state.X[i("Lactate")]/pct)/Constants.MM_Lactate/x_P) +
         Chemical.Interfaces.Incompressible.electroChemicalPotentialPure(
          Substances.Lactate,
          T,
          p,
          v);
      substances.Lactate.h_outflow = Chemical.Interfaces.Incompressible.molarEnthalpy(
          Substances.Lactate,
          T,
          p,
          v);

      substances.Urea.u = Modelica.Constants.R*T*log(state.X[i("Urea")]/Constants.MM_Urea/x_P/pct) +
         Chemical.Interfaces.Incompressible.electroChemicalPotentialPure(
          Substances.Urea,
          T,
          p,
          v);
      substances.Urea.h_outflow = Chemical.Interfaces.Incompressible.molarEnthalpy(
          Substances.Urea,
          T,
          p,
          v);

      substances.AminoAcids.u = Modelica.Constants.R*T*log(state.X[i("AminoAcids")]/Constants.MM_AminoAcids/x_P/pct);
      substances.AminoAcids.h_outflow = 0;

      substances.Lipids.u = Modelica.Constants.R*T*log(state.X[i("Lipids")]/Constants.MM_Lipids/x_P/pct);
      substances.Lipids.h_outflow = 0;

      substances.KetoAcids.u = Modelica.Constants.R*T*log(state.X[i("KetoAcids")]/Constants.MM_KetoAcids/x_P/pct);
      substances.KetoAcids.h_outflow = 0;

      substances.Epinephrine.u = Modelica.Constants.R*T*log(state.X[i("Epinephrine")]/ Constants.MM_Epinephrine/x_P/pct);
      substances.Norepinephrine.u = Modelica.Constants.R*T*log(state.X[i("Norepinephrine")]/ Constants.MM_Norepinephrine/x_P/pct);
      substances.Vasopressin.u = Modelica.Constants.R*T*log(state.X[i("Vasopressin")]/ Constants.MM_Vasopressin/x_P/pct);
      substances.Insulin.u = Modelica.Constants.R*T*log(state.X[i("Insulin")]/ Constants.MM_Insulin/x_P/pct);
      substances.Glucagon.u = Modelica.Constants.R*T*log(state.X[i("Glucagon")]/ Constants.MM_Glucagon/x_P/pct);
      substances.Thyrotropin.u = Modelica.Constants.R*T*log(state.X[i("Thyrotropin")]/ Constants.MM_Thyrotropin/x_P/pct);
      substances.Thyroxine.u = Modelica.Constants.R*T*log(state.X[i("Thyroxine")]/ Constants.MM_Thyroxine/x_P/pct);
      substances.Leptin.u = Modelica.Constants.R*T*log(state.X[i("Leptin")]/ Constants.MM_Leptin/x_P/pct);
      substances.Desglymidodrine.u = Modelica.Constants.R*T*log(state.X[i("Desglymidodrine")]/ Constants.MM_Desglymidodrine/x_P/pct);
      substances.Angiotensin2.u = Modelica.Constants.R*T*log(state.X[i("Angiotensin2")]/ Constants.MM_Angiotensin2/x_P/pct);
      substances.Renin.u = Modelica.Constants.R*T*log(state.X[i("Renin")]/ Constants.MM_Renin/x_P/pct);
      substances.Aldosterone.u = Modelica.Constants.R*T*log(state.X[i("Aldosterone")]/ Constants.MM_Aldosterone/x_P/pct);

      substances.Epinephrine.h_outflow = 0;
      substances.Norepinephrine.h_outflow = 0;
      substances.Vasopressin.h_outflow = 0;
      substances.Insulin.h_outflow = 0;
      substances.Glucagon.h_outflow = 0;
      substances.Thyrotropin.h_outflow = 0;
      substances.Thyroxine.h_outflow = 0;
      substances.Leptin.h_outflow = 0;
      substances.Desglymidodrine.h_outflow = 0;
      substances.Angiotensin2.h_outflow = 0;
      substances.Renin.h_outflow = 0;
      substances.Aldosterone.h_outflow = 0;

     enthalpyFromSubstances =
       substances.O2.q * actualStream(substances.O2.h_outflow) +
       substances.CO2.q * actualStream(substances.CO2.h_outflow) +
       substances.CO.q * actualStream(substances.CO.h_outflow) +
       substances.HCO3.q * actualStream(substances.HCO3.h_outflow) +
       substances.H.q * actualStream(substances.H.h_outflow) +
       substances.H2O.q * actualStream(substances.H2O.h_outflow) +
       substances.Glucose.q * actualStream(substances.Glucose.h_outflow) +
       substances.Lactate.q * actualStream(substances.Lactate.h_outflow) +
       substances.Urea.q * actualStream(substances.Urea.h_outflow) +
       substances.AminoAcids.q * actualStream(substances.AminoAcids.h_outflow) +
       substances.Lipids.q * actualStream(substances.Lipids.h_outflow) +
       substances.KetoAcids.q * actualStream(substances.KetoAcids.h_outflow)
       "enthalpy from substances";

      massFlows[i("H2O_E")] = -H2O_Ery2Plasma*Substances.Water.MolarWeight;
      massFlows[i("O2")] = substances.O2.q*Substances.O2.MolarWeight;
      massFlows[i("CO2_P")] = substances.CO2.q*Substances.CO2.MolarWeight + substances.HCO3.q .* Substances.CO2.MolarWeight + CO2_Ery2Plasma*CO2.MolarWeight;
      massFlows[i("CO2_E")] = -CO2_Ery2Plasma*CO2.MolarWeight;
      massFlows[i("CO")] = substances.CO.q*Substances.CO.MolarWeight;
      massFlows[i("eHb")] = 0;
      massFlows[i("MetHb")] = 0;
      massFlows[i("HbF")] = 0;
      massFlows[i("Alb")] = 0;
      massFlows[i("Glb")] = 0;
      massFlows[i("PO4")] = 0;
      massFlows[i("DPG")] = 0;
      massFlows[i("Glucose")] = substances.Glucose.q*Substances.Glucose.MolarWeight;
      massFlows[i("Lactate")] = substances.Lactate.q*Constants.MM_Lactate;
      massFlows[i("Urea")] = substances.Urea.q*Substances.Urea.MolarWeight;
      massFlows[i("AminoAcids")] = substances.AminoAcids.q*Constants.MM_AminoAcids;
      massFlows[i("Lipids")] = substances.Lipids.q*Constants.MM_Lipids;
      massFlows[i("KetoAcids")] = substances.KetoAcids.q*Constants.MM_KetoAcids;
      massFlows[i("Na_P")] = 0;
      massFlows[i("K_P")] = 0;
      massFlows[i("Cl_P")] = Cl_Ery2Plasma*Cl.MolarWeight;
      massFlows[i("Na_E")] = 0;
      massFlows[i("K_E")] = 0;
      massFlows[i("Cl_E")] = -Cl_Ery2Plasma*Cl.MolarWeight;
      massFlows[i("Epinephrine")] = substances.Epinephrine.q*Constants.MM_Epinephrine;
      massFlows[i("Norepinephrine")] = substances.Norepinephrine.q*Constants.MM_Norepinephrine;
      massFlows[i("Vasopressin")] = substances.Vasopressin.q*Constants.MM_Vasopressin;
      massFlows[i("Insulin")] = substances.Insulin.q*Constants.MM_Insulin;
      massFlows[i("Glucagon")] = substances.Glucagon.q*Constants.MM_Glucagon;
      massFlows[i("Thyrotropin")] = substances.Thyrotropin.q*Constants.MM_Thyrotropin;
      massFlows[i("Thyroxine")] = substances.Thyroxine.q*Constants.MM_Thyroxine;
      massFlows[i("Leptin")] = substances.Leptin.q*Constants.MM_Leptin;
      massFlows[i("Desglymidodrine")] = substances.Desglymidodrine.q*Constants.MM_Desglymidodrine;
      massFlows[i("Angiotensin2")] = substances.Angiotensin2.q*Constants.MM_Angiotensin2;
      massFlows[i("Renin")] = substances.Renin.q*Constants.MM_Renin;
      massFlows[i("Aldosterone")] = substances.Aldosterone.q*Constants.MM_Aldosterone;
      massFlows[i("H2O_P")] = substances.H2O.q*Substances.Water.MolarWeight + H2O_Ery2Plasma*Substances.Water.MolarWeight;
      massFlows[i("Other_P")] = 0;
      massFlows[i("Other_E")] = 0;



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
      cHCO3_E = aCO2_ery*pCO2*(10^(pH_ery - pK_ery));
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

      InputElectricPotential v=0 "electric potential";

      // Local connector definition, used for equation balancing check
      connector InputElectricPotential = input Types.ElectricPotential
        "Electric potential as input signal connector";

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

    redeclare function extends specificEnthalpies_Tpv "Specific enthalpies of blood substances"
    algorithm
      specificEnthalpy[i("H2O_E")] := Chemical.Interfaces.Incompressible.specificEnthalpy(
          Substances.Water,
          T,
          p,
          v);
      specificEnthalpy[i("O2")] := Chemical.Interfaces.IdealGas.specificEnthalpy(
          Substances.O2_g,
          T,
          p,
          v);
      specificEnthalpy[i("CO2_P")] := Chemical.Interfaces.IdealGas.specificEnthalpy(
          Substances.CO2_g,
          T,
          p,
          v);
      specificEnthalpy[i("CO2_E")] := Chemical.Interfaces.IdealGas.specificEnthalpy(
          Substances.CO2_g,
          T,
          p,
          v);
      specificEnthalpy[i("CO")] := Chemical.Interfaces.IdealGas.specificEnthalpy(
          Substances.CO_g,
          T,
          p,
          v);
      specificEnthalpy[i("eHb")] := 0;
      specificEnthalpy[i("MetHb")] := 0;
      specificEnthalpy[i("HbF")] := 0;
      specificEnthalpy[i("Alb")] := 0;
      specificEnthalpy[i("Glb")] := 0;
      specificEnthalpy[i("PO4")] := 0;
      specificEnthalpy[i("DPG")] := 0;
      specificEnthalpy[i("Glucose")] := Chemical.Interfaces.Incompressible.specificEnthalpy(
          Substances.Glucose,
          T,
          p,
          v);
      specificEnthalpy[i("Lactate")] := Chemical.Interfaces.Incompressible.specificEnthalpy(
          Substances.Lactate,
          T,
          p,
          v);
      specificEnthalpy[i("Urea")] := Chemical.Interfaces.Incompressible.specificEnthalpy(
          Substances.Urea,
          T,
          p,
          v);
      specificEnthalpy[i("AminoAcids")] := 0;
      specificEnthalpy[i("Lipids")] := 0;
      specificEnthalpy[i("KetoAcids")] := 0;
      specificEnthalpy[i("Na_P")] := Chemical.Interfaces.Incompressible.specificEnthalpy(
          Substances.Na,
          T,
          p,
          v);
      specificEnthalpy[i("Na_E")] := Chemical.Interfaces.Incompressible.specificEnthalpy(
          Substances.Na,
          T,
          p,
          v);
      specificEnthalpy[i("K_P")] := Chemical.Interfaces.Incompressible.specificEnthalpy(
          Substances.K,
          T,
          p,
          v);
      specificEnthalpy[i("K_E")] := Chemical.Interfaces.Incompressible.specificEnthalpy(
          Substances.K,
          T,
          p,
          v);
      specificEnthalpy[i("Cl_P")] := Chemical.Interfaces.Incompressible.specificEnthalpy(
          Substances.Cl,
          T,
          p,
          v);
      specificEnthalpy[i("Cl_E")] := Chemical.Interfaces.Incompressible.specificEnthalpy(
          Substances.Cl,
          T,
          p,
          v);
      specificEnthalpy[i("Epinephrine")] := 0;
      specificEnthalpy[i("Norepinephrine")] := 0;
      specificEnthalpy[i("Vasopressin")] := 0;
      specificEnthalpy[i("Insulin")] := 0;
      specificEnthalpy[i("Glucagon")] := 0;
      specificEnthalpy[i("Thyrotropin")] := 0;
      specificEnthalpy[i("Thyroxine")] := 0;
      specificEnthalpy[i("Leptin")] := 0;
      specificEnthalpy[i("Desglymidodrine")] := 0;
      specificEnthalpy[i("Angiotensin2")] := 0;
      specificEnthalpy[i("Renin")] := 0;
      specificEnthalpy[i("Aldosterone")] := 0;
      specificEnthalpy[i("H2O_P")] := Chemical.Interfaces.Incompressible.specificEnthalpy(
          Substances.Water,
          T,
          p,
          v);
      specificEnthalpy[i("Other_P")] := 0;
      specificEnthalpy[i("Other_E")] := 0;

    end specificEnthalpies_Tpv;

    redeclare function extends specificEnthalpy "Return specific enthalpy"
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
      C := density(state) * state.X[i("O2")] / O2.MolarWeight;
    end tO2;

    function sO2 "Oxygen saturation on effective hemoglobin"
      extends GetFraction;
    algorithm
      F := (state.X[i("O2")] / O2.MolarWeight) / (state.X[i("eHb")] / Constants.MM_Hb);
    end sO2;

    function tCO2 "Total carbon dioxide in blood"
      extends GetConcentration;
    algorithm
      C := density(state) * (state.X[i("CO2_P")]+state.X[i("CO2_E")]) / CO2.MolarWeight;
    end tCO2;

    function tCO "Total carbon monoxide in blood"
      extends GetConcentration;
    algorithm
      C := density(state) * state.X[i("CO")] / CO.MolarWeight;
    end tCO;

    function tHb "Total hemoglobine in blood"
      extends GetConcentration;
    algorithm
      C := density(state) * (state.X[i("eHb")] + state.X[i("MetHb")] + state.X[i("HbF")]) / Constants.MM_Hb;
    end tHb;

    function FMetHb "Methemoglobine fraction"
      extends GetFraction;
    algorithm
      F := (state.X[i("MetHb")] / tHb(state));
    end FMetHb;

    function FHbF "Foetalhemoglobine fraction"
      extends GetFraction;
    algorithm
      F := (state.X[i("HbF")] / tHb(state));
    end FHbF;

    function ctHb_ery "Total hemoglobine in erythrocytes"
      extends GetConcentration;
    algorithm
      C :=tHb(state)/hematocrit(state);
    end ctHb_ery;

    function tAlb "Total albumine in blood plasma"
      extends GetConcentration;
    algorithm
      C :=plasmaDensity(state)*(state.X[i("Alb")]/Constants.MM_Alb)/
        plasmaMassFraction(state);
    end tAlb;

    function tGlb "Total globulin in blood plasma [g/L]"
      extends GetMassConcentration;
    algorithm
      R :=plasmaDensity(state)*state.X[i("Glb")]/plasmaMassFraction(state);
    end tGlb;



    function tPO4 "Total anorganic phosphates in blood plasma"
      extends GetConcentration;
    algorithm
      C :=plasmaDensity(state)*(state.X[i("PO4")]/PO4.MolarWeight)/
        plasmaMassFraction(state);
    end tPO4;

    function cDPG "Total diphosphoglycerate in erythrocytes"
      extends GetConcentration;
    algorithm
      C :=formedElementsDensity(state)*(state.X[i("DPG")]/Constants.MM_DPG)/
        formedElementsMassFraction(state);
    end cDPG;

    function SID "Strong ion difference of blood"
      extends GetConcentration;
    algorithm
      C := density(state) * (
          state.X[i("Na_P")]/Na.MolarWeight +
          state.X[i("Na_E")]/Na.MolarWeight +
          state.X[i("K_P")]/K.MolarWeight +
          state.X[i("K_E")]/K.MolarWeight -
          state.X[i("Cl_P")]/Cl.MolarWeight -
          state.X[i("Cl_E")]/Cl.MolarWeight);
    end SID;

    function glucose "Total glucose in blood plasma"
      extends GetConcentration;
    algorithm
      C :=(plasmaDensity(state)*state.X[i("Glucose")]/Constants.MM_Glucose)/
        plasmaMassFraction(state);
    end glucose;

    function lactate "Total lactate in blood plasma"
      extends GetConcentration;
    algorithm
      C :=(plasmaDensity(state)*state.X[i("Lactate")]/Constants.MM_Lactate)/
        plasmaMassFraction(state);
    end lactate;

    function urea "Total urea in blood plasma"
      extends GetConcentration;
    algorithm
      C :=(plasmaDensity(state)*state.X[i("Urea")]/Constants.MM_Urea)/
        plasmaMassFraction(state);
    end urea;

    function aminoAcids "Total amino acids in blood plasma"
      extends GetConcentration;
    algorithm
      C :=(plasmaDensity(state)*state.X[i("AminoAcids")]/Constants.MM_AminoAcids)/
        plasmaMassFraction(state);
    end aminoAcids;

    function lipids "Total faty acids in blood plasma"
      extends GetConcentration;
    algorithm
      C :=(plasmaDensity(state)*state.X[i("Lipids")]/Constants.MM_Lipids)/
        plasmaMassFraction(state);
    end lipids;

    function ketoAcids "Total ketoacids in blood plasma"
      extends GetConcentration;
    algorithm
      C :=(plasmaDensity(state)*state.X[i("KetoAcids")]/Constants.MM_KetoAcids)/
        plasmaMassFraction(state);
    end ketoAcids;

    function epinephrine "Epinephrine in blood plasma"
      extends GetMassConcentration(R(displayUnit="ng/l", nominal=SubstanceFlowNominal[i("Epinephrine")]));
    algorithm
      R :=plasmaDensity(state)*state.X[i("Epinephrine")]/plasmaMassFraction(state);
    end epinephrine;

    function norepinephrine "Norepinephrine in blood plasma"
      extends GetMassConcentration(R(displayUnit="ng/l", nominal=SubstanceFlowNominal[i("Norepinephrine")]));
    algorithm
      R :=plasmaDensity(state)*state.X[i("Norepinephrine")]/plasmaMassFraction(
        state);
    end norepinephrine;

    function vasopressin "Vasopressin in blood plasma"
      extends GetConcentration(C(displayUnit="pmol/l", nominal=SubstanceFlowNominal[i("Vasopressin")]));
    algorithm
      C :=(plasmaDensity(state)*state.X[i("Vasopressin")]/Constants.MM_Vasopressin)
        /plasmaMassFraction(state);
    end vasopressin;

    function insulin "Insulin in blood plasma"
      extends GetActivity(A(unit="U/m3",displayUnit="mU/l"));
    algorithm
      A :=(plasmaDensity(state)*(state.X[i("Insulin")]/6e-9)/Constants.MM_Insulin)
        /plasmaMassFraction(state)                                                                            "conversion factor for human insulin is 1 mU/L = 6.00 pmol/L";
    end insulin;

    function glucagon "Glucagon in blood plasma"
      extends GetMassConcentration(R(displayUnit="ng/l", nominal=SubstanceFlowNominal[i("Glucagon")]));
    algorithm
      R :=plasmaDensity(state)*state.X[i("Glucagon")]/plasmaMassFraction(state);
    end glucagon;

    function thyrotropin "Thyrotropin in blood plasma"
      extends GetConcentration(C(displayUnit="pmol/l", nominal=SubstanceFlowNominal[i("Thyrotropin")]));
    algorithm
      C :=(plasmaDensity(state)*state.X[i("Thyrotropin")]/Constants.MM_Thyrotropin)
        /plasmaMassFraction(state);
    end thyrotropin;

    function thyroxine "Thyroxine in blood plasma"
      extends GetMassConcentration(R(displayUnit="ug/l", nominal=SubstanceFlowNominal[i("Thyroxine")]));
    algorithm
      R :=plasmaDensity(state)*state.X[i("Thyroxine")]/plasmaMassFraction(state);
    end thyroxine;

    function leptin "Leptin in blood plasma"
      extends GetMassConcentration(R(displayUnit="ug/l", nominal=SubstanceFlowNominal[i("Leptin")]));
    algorithm
      R :=plasmaDensity(state)*state.X[i("Leptin")]/plasmaMassFraction(state);
    end leptin;

    function desglymidodrine "Desglymidodrine in blood plasma"
      extends GetMassConcentration(R(displayUnit="ug/l"));
    algorithm
      R :=plasmaDensity(state)*state.X[i("Desglymidodrine")]/plasmaMassFraction(
        state);
    end desglymidodrine;


    function angiotensin2 "Angiotensin2 in blood plasma"
      extends GetMassConcentration(R(displayUnit="ng/l", nominal=SubstanceFlowNominal[i("Angiotensin2")]));
    algorithm
       R :=plasmaDensity(state)*state.X[i("Angiotensin2")]/plasmaMassFraction(
        state);
    end angiotensin2;

    function alphaBlockers "Alpha blockers effect"
      extends GetExtraProperty;
    algorithm
      e := C[j("AlphaBlockers")]/1e-6;
    end alphaBlockers;

    function betaBlockers "Beta blockers effect"
      extends GetExtraProperty;
    algorithm
      e := C[j("BetaBlockers")]/1e-6;
    end betaBlockers;

    function anesthesiaVascularConductance "Anesthesia vascular conductance effect"
      extends GetExtraProperty;
    algorithm
      e := C[j("AnesthesiaVascularConductance")]/1e-6;
    end anesthesiaVascularConductance;

    function aldosterone "Aldosterone in blood plasma"
      extends GetConcentration(C(displayUnit="nmol/l", nominal=SubstanceFlowNominal[i("Aldosterone")]));
    algorithm
      C :=plasmaDensity(state)*(state.X[i("Aldosterone")]/Constants.MM_Aldosterone)
        /plasmaMassFraction(state);
    end aldosterone;


    function renin "Renin PRA in blood plasma"
      extends GetActivity(A(unit="ng/(ml.h)",displayUnit="ng/(ml.h)"));
    algorithm
      A :=plasmaDensity(state)*((state.X[i("Renin")]/(1e-12*0.6*11.2)))/
        plasmaMassFraction(state)                                                                     "conversion factor from PRA (ng/mL/h) to DRC (mU/L) is 11.2, μIU/mL (mIU/L) * 0.6 = pg/mL";
    end renin;

    function plasmacrit "Blood plasmacrit [mL/mL]"
      extends GetFraction;
    algorithm
      F := plasmaMassFraction(state)*(density(state)/plasmaDensity(state));
    end plasmacrit;

    function plasmaDensity "Density of blood plasma"
      extends GetDensity;
    algorithm
      d := D_BloodPlasmaDensity;
      annotation (Documentation(info="<html>
<p>constant density</p>
</html>"));
    end plasmaDensity;

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

        Modelica.Units.SI.Molality fH2O_P "Amount of free H2O particles in 1 kg of blood plasma [mol/kg]";
        Modelica.Units.SI.Molality x_P(start=1.2) "Amount of free particles in 1 kg of blood plasma [mol/kg]";
        Modelica.Units.SI.Molality x_E(start=0.86) "Amount of free particles in 1 kg of blood erythrocytes [mol/kg]";

        Types.MoleFraction aH2O_P,aH2O_E, aCl_P, aCl_E, aHCO3, aHCO3_E;
        Types.Concentration H2O_plasma(start=D_BloodPlasmaWater) "Water in blood plasma";
        Types.Concentration H2O_ery(start=D_BloodFormedElementsWater) "Water in blood red cells";

         // debug of chloride shift:
        Modelica.Units.SI.Concentration cCl_P = (aCl_P*x_P)*plasmaDensity "Chloride in blood plasma";
        Modelica.Units.SI.Concentration cCl_E = (aCl_E*x_E)*formedElementsDensity(state) "Chloride in blood red cells";

        Modelica.Units.SI.Concentration cHCO3_P = (aHCO3*x_P)*plasmaDensity "Bicarbonate in blood plasma";
        Modelica.Units.SI.Concentration cHCO3_E  = (aHCO3_E*x_E)*formedElementsDensity(state) "Bicarbonate in blood red cells";

        function rbcMFwO=formedElementsMassFractionWithoutOther;
        //formedElementsMassFraction(includeOther=false);
        function plasmaMFwO= plasmaMassFractionWithoutOther;
        //plasmaMassFraction(includeOther=false);

        Real aCO2_P;
    equation
      density = D_BloodDensity;
      plasmaDensity = D_BloodPlasmaDensity;
      plasmacrit = 1-hematocrit;
      NSID = (1 - hematocrit) * (zAlbNAP * tAlb + zGlbNAP * tGlb + zPO4NAP * tPO4 + ztCO2NAP) + hematocrit * (zHbNAE * (tHb / hematocrit) + ztCO2NAE + zDPG*cDPG + zOtherE);

      X[i("H2O_P")] = (plasmacrit*H2O_plasma)/density;
      X[i("H2O_E")] = (hematocrit*H2O_ery)/density;
      X[i("O2")] = (tO2*O2.MolarWeight)/density;

      X[i("CO")] = (tCO*CO.MolarWeight)/density;
      X[i("eHb")] + X[i("MetHb")] + X[i("HbF")] = (tHb*Constants.MM_Hb)/density;
      X[i("MetHb")] = FMetHb*(tHb*Constants.MM_Hb)/density;
      X[i("HbF")] = FHbF*(tHb*Constants.MM_Hb)/density;
      X[i("Alb")] = plasmacrit*(tAlb*Constants.MM_Alb)/density;
      X[i("Glb")] = plasmacrit*tGlb/density;
      X[i("PO4")] = plasmacrit*(tPO4*PO4.MolarWeight)/density;
      X[i("DPG")] = hematocrit*(cDPG*Constants.MM_DPG)/density;
      X[i("Glucose")] = plasmacrit*(glucose*Constants.MM_Glucose)/density;
      X[i("Lactate")] = plasmacrit*(lactate*Constants.MM_Lactate)/density;
      X[i("Urea")] = plasmacrit*(urea*Constants.MM_Urea)/density;
      X[i("AminoAcids")] = plasmacrit*(aminoAcids*Constants.MM_AminoAcids)/density;
      X[i("Lipids")] = plasmacrit*(lipids*Constants.MM_Lipids)/density;
      X[i("KetoAcids")] = plasmacrit*(ketoacids*Constants.MM_KetoAcids)/density;
      X[i("Na_P")] = plasmacrit*(cNa_P*Na.MolarWeight)/density;
      X[i("K_P")] = plasmacrit*(cK_P*K.MolarWeight)/density;
      X[i("Na_E")] = hematocrit*(cNa_E*Na.MolarWeight)/density;
      X[i("K_E")] = hematocrit*(cK_E*K.MolarWeight)/density;
      X[i("Epinephrine")] = plasmacrit*(epinephrine)/density;
      X[i("Norepinephrine")] = plasmacrit*(norepinephrine)/density;
      X[i("Vasopressin")] = plasmacrit*(vasopressin*Constants.MM_Vasopressin)/density;
      X[i("Insulin")] = plasmacrit*(6e-9*insulin*Constants.MM_Insulin)/density
        "conversion factor for human insulin is 1 mU/L = 6.00 pmol/L";
      X[i("Glucagon")] = plasmacrit*(glucagon)/density;
      X[i("Thyrotropin")] = plasmacrit*(thyrotropin*Constants.MM_Thyrotropin)/density;
      X[i("Thyroxine")] = plasmacrit*(thyroxine)/density;
      X[i("Leptin")] = plasmacrit*(leptin)/density;
      X[i("Desglymidodrine")] = plasmacrit*(desglymidodrine)/density;

      X[i("Angiotensin2")] = plasmacrit*(angiotensin2)/density;
      X[i("Renin")] = plasmacrit*(1e-12*0.6*11.2*renin)/density
        "conversion factor from PRA (ng/mL/h) to DRC (mU/L) is 11.2, μIU/mL (mIU/L) * 0.6 = pg/mL";
      X[i("Aldosterone")] = plasmacrit*(aldosterone*Constants.MM_Aldosterone)/density;

      PMF = plasmacrit * plasmaDensity/density;
      XP2 = plasmaMassFraction(state);
      XE = XP2*(1-PMF)/PMF;

      X[i("Other_P")] = PMF - plasmaMFwO(state);
      X[i("Other_E")] = (1-PMF) - rbcMFwO(state); //homotopy((1-PMF) - rbcMFwO(state), XE - rbcMFwO(state));

      XH2O =X[i("H2O_P")] + X[i("H2O_E")];

      aH2O_P = aH2O_E "osmolarity";

      aH2O_P = state.X[i("H2O_P")]*Chemical.Interfaces.Incompressible.specificAmountOfParticles(Substances.Water,T,p,v) / (pct*x_P);
      aH2O_E = state.X[i("H2O_E")]*Chemical.Interfaces.Incompressible.specificAmountOfParticles(Substances.Water,T,p,v) / (hct*x_E);

      pct = plasmaMassFraction(state);
      hct = formedElementsMassFraction(state);

      fH2O_P = state.X[i("H2O_P")]*Chemical.Interfaces.Incompressible.specificAmountOfParticles(Substances.Water,T,p,v)/pct  "Amount of free H2O particles in 1 kg of blood plasma [mol/kg]";

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

      X[i("CO2_P")] + X[i("CO2_E")] = (tCO2*CO2.MolarWeight)/density;
      state.X[i("CO2_P")] = homotopy((aCO2_P*x_P)*CO2.MolarWeight*pct,(26/plasmaDensity)*CO2.MolarWeight*pct);
      bloodGases.tCO2_P=(aCO2_P*x_P)*plasmaDensity;

      aHCO3*aCl_E = aCl_P*aHCO3_E "Chloride shift";
      X[i("Cl_P")] = (aCl_P*x_P)*Cl.MolarWeight*pct "Mass fraction of plasma Cl- in blood";
      X[i("Cl_E")] = (aCl_E*x_E)*Cl.MolarWeight*hct "Mass fraction of erythrocyte's Cl- in blood";
      X[i("Cl_P")] + X[i("Cl_E")] = -((NSID - BEox) - plasmacrit*(cNa_P + cK_P) - hematocrit*(cNa_E + cK_E))*Cl.MolarWeight
        /density "where blood SID = NSID - BEox";

      C[j("AlphaBlockers")] = 1e-6*alphaBlockers;
      C[j("BetaBlockers")] = 1e-6*betaBlockers;
      C[j("AnesthesiaVascularConductance")] = 1e-6*anesthesiaVascularConductance;
      annotation (experiment(StopTime=1, __Dymola_Algorithm="Dassl"));
    end ArterialComposition;

    model VenousComposition
      extends ArterialComposition(tO2=D_Venous_O2,tCO2=D_Venous_CO2);
    end VenousComposition;

    function formedElementsMassFractionWithoutOther "Blood hematocrit without unknown substances in formed elements [kg/kg]"
      extends formedElementsMassFraction(includeOther=false);
    end formedElementsMassFractionWithoutOther;

    function formedElementsMassFraction "Blood hematocrit [kg/kg]"
      extends GetFraction;
    protected
      constant Boolean includeOther=true;
    algorithm
      F :=state.X[i("H2O_E")] +
          state.X[i("O2")] +
          state.X[i("CO2_E")] +
          state.X[i("CO")] +
          state.X[i("eHb")] +
          state.X[i("MetHb")] +
          state.X[i("HbF")] +
          state.X[i("DPG")] +
          state.X[i("Na_E")] +
          state.X[i("K_E")] +
          state.X[i("Cl_E")] +
          (if (includeOther) then state.X[i("Other_E")] else 0);

    end formedElementsMassFraction;

    function formedElementsSpecificAmountOfParticles "Amount of free particles in 1 kg of blood formed elements"
      extends GetMolality;
      input Types.Temperature T= temperature(state);
      input Types.MassFraction hct= formedElementsMassFraction(state);
    algorithm
     B := (
     state.X[i("H2O_E")]*Chemical.Interfaces.Incompressible.specificAmountOfParticles(Substances.Water,T,state.p,state.v) +
     state.X[i("CO2_E")]/CO2.MolarWeight +
     state.X[i("K_E")]/K.MolarWeight +
     state.X[i("Na_E")]/Na.MolarWeight +
     state.X[i("Cl_E")]/Cl.MolarWeight +
     (state.X[i("eHb")] + state.X[i("MetHb")] + state.X[i("HbF")])/Constants.MM_Hb +
     state.X[i("DPG")]/Constants.MM_DPG)
      /hct;
    end formedElementsSpecificAmountOfParticles;

    function plasmaMassFraction "Blood plasmacrit [kg/kg]"
      extends GetFraction;
    protected
      constant Boolean includeOther=true;
    algorithm
      F := state.X[i("H2O_P")] +
           state.X[i("CO2_P")] +
           state.X[i("Alb")] +
           state.X[i("Glb")] +
           state.X[i("Glucose")] +
           state.X[i("PO4")] +
           state.X[i("Lactate")] +
           state.X[i("Urea")] +
           state.X[i("AminoAcids")] +
           state.X[i("Lipids")] +
           state.X[i("KetoAcids")] +
           state.X[i("Na_P")] +
           state.X[i("K_P")] +
           state.X[i("Cl_P")] +
           state.X[i("Epinephrine")] +
           state.X[i("Norepinephrine")] +
           state.X[i("Vasopressin")] +
           state.X[i("Insulin")] +
           state.X[i("Glucagon")] +
           state.X[i("Thyrotropin")] +
           state.X[i("Thyroxine")] +
           state.X[i("Leptin")] +
           state.X[i("Desglymidodrine")] +
           state.X[i("Angiotensin2")] +
           state.X[i("Renin")] +
           state.X[i("Aldosterone")] +
           (if (includeOther) then state.X[i("Other_P")] else 0);
    end plasmaMassFraction;
    
    function plasmaMassFractionWithoutOther "Blood plasmacrit without unknown substances in blood plasma [kg/kg]"
    extends plasmaMassFraction(includeOther=false);
  end plasmaMassFractionWithoutOther;

    function plasmaSpecificAmountOfParticles "Amount of free particles in 1 kg of blood plasma"
      extends GetMolality;
      input Types.Temperature T = temperature(state);
      input Types.MassFraction pct = plasmaMassFraction(state);
    algorithm
     B := (
     state.X[i("H2O_P")]*Chemical.Interfaces.Incompressible.specificAmountOfParticles(Substances.Water,T,state.p,state.v) +
     state.X[i("Cl_P")]/Cl.MolarWeight +
     state.X[i("Na_P")]/Na.MolarWeight +
     state.X[i("K_P")]/K.MolarWeight +
     state.X[i("CO2_P")]/CO2.MolarWeight +
     state.X[i("Alb")]/Constants.MM_Alb +
     state.X[i("Glb")]/Constants.MM_Glb +
     state.X[i("Glucose")]/Constants.MM_Glucose +
     state.X[i("PO4")]/PO4.MolarWeight +
     state.X[i("Lactate")]/Constants.MM_Lactate +
     state.X[i("Urea")]/Constants.MM_Urea +
     state.X[i("AminoAcids")]/Constants.MM_AminoAcids +
     state.X[i("Lipids")]/Constants.MM_Lipids +
     state.X[i("KetoAcids")]/Constants.MM_KetoAcids)/pct;
    end plasmaSpecificAmountOfParticles;
    annotation (Documentation(info="<html>
<p>Adding new substance to blood model:</p>
<p><br>- add to Blood.substanceNames</p>
<p>- modify functions: Blood.specificEnthalpies_TpvI</p>
<p>- modify model: Blood.ArterialComposition, run it and resuled X set as ArterialDefault (and from VenousComposition -&gt; VenousDefault)</p>
<p>- modify model: Blood.ChemicalSolution,</p>
</html>"));
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

  public
    redeclare replaceable model extends ChemicalSolution
    protected
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


      substances.H2O.u = stateOfMatter.electroChemicalPotentialPure( Substances.Water, T, p, v);
      substances.H.u = stateOfMatter.electroChemicalPotentialPure( Substances.H, T, p, v) +
                       Modelica.Constants.R*T*logH;
      substances.O2.u = stateOfMatter.electroChemicalPotentialPure( Substances.O2, T, p, v) +
                       Modelica.Constants.R*T*logO2;
      substances.H2.u = stateOfMatter.electroChemicalPotentialPure( Substances.H2, T, p, v) +
                       Modelica.Constants.R*T*logH2;
      substances.OH.u = stateOfMatter.electroChemicalPotentialPure( Substances.OH, T, p, v) +
                       Modelica.Constants.R*T*logOH;

      substances.H2O.h_outflow = stateOfMatter.molarEnthalpy( Substances.Water, T, p, v);
      substances.H.h_outflow = stateOfMatter.molarEnthalpy( Substances.H, T, p, v);
      substances.O2.h_outflow = stateOfMatter.molarEnthalpy( Substances.O2, T, p, v);
      substances.H2.h_outflow = stateOfMatter.molarEnthalpy( Substances.H2, T, p, v);
      substances.OH.h_outflow = stateOfMatter.molarEnthalpy( Substances.OH, T, p, v);

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

    replaceable function extends specificEnthalpies_Tpv
    algorithm
       specificEnthalpy:=stateOfMatter.specificEnthalpy(
          {Substances.Water},
          T,p,v);
    end specificEnthalpies_Tpv;

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


      redeclare replaceable model extends ChemicalSolution
    protected
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
            v) + Modelica.Constants.R*T*log(x_baseMolecule[i("O2")]);
        substances.CO2.u =stateOfMatter.electroChemicalPotentialPure(
            Substances.CO2_g,
            T,
            p,
            v) + Modelica.Constants.R*T*log(x_baseMolecule[i("CO2")]);
        substances.H2O.u =stateOfMatter.electroChemicalPotentialPure(
            Substances.H2O_g,
            T,
            p,
            v) + Modelica.Constants.R*T*log(x_baseMolecule[i("H2O")]);
        substances.N2.u =stateOfMatter.electroChemicalPotentialPure(
            Substances.N2_g,
            T,
            p,
            v) + Modelica.Constants.R*T*log(x_baseMolecule[i("N2")]);
        substances.O2.h_outflow = stateOfMatter.molarEnthalpy( Substances.O2_g, T, p, v);

        substances.CO2.h_outflow = stateOfMatter.molarEnthalpy( Substances.CO2_g, T, p, v);
        substances.H2O.h_outflow = stateOfMatter.molarEnthalpy( Substances.H2O_g, T, p, v);
        substances.N2.h_outflow = stateOfMatter.molarEnthalpy( Substances.N2_g, T, p, v);

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

      redeclare function extends specificEnthalpies_Tpv
      algorithm
           specificEnthalpy:=stateOfMatter.specificEnthalpy(
              substanceData,
              T,p,v);
      end specificEnthalpies_Tpv;

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
    import Physiolibrary.Media.InitialValues.*;
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



  public
    redeclare replaceable model extends ChemicalSolution
    protected
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
              v);


          z = stateOfMatter.chargeNumberOfIon(substanceData,T,p,v);

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
          v) + Modelica.Constants.R*T*log(x_baseMolecule[i("Na")]);
          substances.HCO3.u =stateOfMatter.electroChemicalPotentialPure(
          Substances.HCO3,
          T,
          p,
          v) + Modelica.Constants.R*T*log(x_baseMolecule[i("HCO3")]);
          substances.K.u =stateOfMatter.electroChemicalPotentialPure(
          Substances.K,
          T,
          p,
          v) + Modelica.Constants.R*T*log(x_baseMolecule[i("K")]);
          substances.Glucose.u =stateOfMatter.electroChemicalPotentialPure(
          Substances.Glucose,
          T,
          p,
          v) + Modelica.Constants.R*T*log(x_baseMolecule[i("Glucose")]);
          substances.Urea.u =stateOfMatter.electroChemicalPotentialPure(
          Substances.Urea,
          T,
          p,
          v) + Modelica.Constants.R*T*log(x_baseMolecule[i("Urea")]);
          substances.Cl.u =stateOfMatter.electroChemicalPotentialPure(
          Substances.Cl,
          T,
          p,
          v) + Modelica.Constants.R*T*log(x_baseMolecule[i("Cl")]);
          substances.Ca.u =stateOfMatter.electroChemicalPotentialPure(
          Substances.Ca,
          T,
          p,
          v) + Modelica.Constants.R*T*log(x_baseMolecule[i("Ca")]);
          substances.Mg.u =stateOfMatter.electroChemicalPotentialPure(
          Substances.Mg,
          T,
          p,
          v) + Modelica.Constants.R*T*log(x_baseMolecule[i("Mg")]);
          substances.H2O.u =stateOfMatter.electroChemicalPotentialPure(
          Substances.Water,
          T,
          p,
          v) + Modelica.Constants.R*T*log(x_baseMolecule[i("H2O")]);


          substances.Na.h_outflow = stateOfMatter.molarEnthalpy( Substances.Na, T, p, v);
          substances.HCO3.h_outflow = stateOfMatter.molarEnthalpy( Substances.HCO3, T, p, v);
          substances.K.h_outflow = stateOfMatter.molarEnthalpy( Substances.K, T, p, v);
          substances.Glucose.h_outflow = stateOfMatter.molarEnthalpy( Substances.Glucose, T, p, v);
          substances.Urea.h_outflow = stateOfMatter.molarEnthalpy( Substances.Urea, T, p, v);
          substances.Cl.h_outflow = stateOfMatter.molarEnthalpy( Substances.Cl, T, p, v);
          substances.Ca.h_outflow = stateOfMatter.molarEnthalpy( Substances.Ca, T, p, v);
          substances.Mg.h_outflow = stateOfMatter.molarEnthalpy( Substances.Mg, T, p, v);
          substances.H2O.h_outflow = stateOfMatter.molarEnthalpy( Substances.Water, T, p, v);

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
      massFlows[i("HCO3")] = substances.HCO3.q*Substances.HCO3.MolarWeight;
      massFlows[i("K")] = substances.K.q*Substances.K.MolarWeight;
      massFlows[i("Glucose")] = substances.Glucose.q*Substances.Glucose.MolarWeight;
      massFlows[i("Urea")] = substances.Urea.q*Substances.Urea.MolarWeight;
      massFlows[i("Cl")] = substances.Cl.q*Substances.Cl.MolarWeight;
      massFlows[i("Ca")] = substances.Ca.q*Substances.Ca.MolarWeight;
      massFlows[i("Mg")] = substances.Mg.q*Substances.Mg.MolarWeight;
      massFlows[i("H2O")] = substances.H2O.q*Substances.Water.MolarWeight;
      massFlows[i("Alb")] = 0;
      massFlows[i("Glb")] = 0;
      massFlows[i("Others")] = 0;

    end ChemicalSolution;

    redeclare function extends specificEnthalpies_Tpv
    algorithm
         specificEnthalpy:=stateOfMatter.specificEnthalpy(
            substanceData,
            T,p,v);
    end specificEnthalpies_Tpv;

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
      X[i("Others")] := tOthers/density;
      X[i("H2O")] := 1 - sum(X[1:(nS - 1)]);
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

      initial equation
        substanceMasses = startSubstanceMasses;
      equation
        der(substanceMasses) = substanceMassFlowsFromStream + massFlows;
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

      function j "Find index of extra property"
        input String searchName "Name of extra property to find in extraPropertiesNames";
        output Integer index "Index of searchName in extraPropertiesNames";
      algorithm
          index := -1;
          for i in 1:nC loop
            if ( Modelica.Utilities.Strings.isEqual(extraPropertiesNames[i], searchName)) then
             index := i;
            end if;
          end for;
          assert(index > 0, "Extra property '" + searchName + "' is not present between extraPropertiesNames in Medium\n"
             + "Check parameters and medium model.");
      end j;



      constant Modelica.Units.SI.MassFlowRate SubstanceFlowNominal[nS]=ones(nS) "Nominal of substance flow";
      constant Modelica.Units.SI.SpecificEnthalpy SpecificEnthalpyNominal=-1E6 "Nominal of specific enthalpy";

       replaceable function specificEnthalpies_Tpv "Specific enthalpies of medium substances"
             input Modelica.Units.SI.Temperature T=298.15 "Temperature";
             input Modelica.Units.SI.Pressure p=100000 "Pressure";
             input Modelica.Units.SI.ElectricPotential v=0
              "Electric potential of the substance";
             output Modelica.Units.SI.SpecificEnthalpy specificEnthalpy[nS]
               "Specific enthalpies of medium substances";

       end specificEnthalpies_Tpv;

       function temperatureError  "To find u as temperature, where temperatureError(u,p,X,h)->0"
       extends Modelica.Math.Nonlinear.Interfaces.partialScalarFunction;
         input Real p;
         input Real X[nS];
         input Real h;
      protected
          Real hs[nS];
       algorithm
         hs:=specificEnthalpies_Tpv(u, p);
         y:=h-sum(hs[i]*X[i] for i in 1:nS);
       end temperatureError;

       partial function GetConcentration
         input ThermodynamicState state;
         output Types.Concentration C;
       end GetConcentration;

       partial function GetMolality
         input ThermodynamicState state;
         output Types.Molality B;
       end GetMolality;

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

       partial function GetDensity
         input ThermodynamicState state;
         output Types.Density d;
       end GetDensity;

       partial function GetExtraProperty
         input Real C[nC] "Extra properties values";
         output Real e;
       end GetExtraProperty;

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

      constant Chemical.Interfaces.Incompressible.SubstanceData Lactate=
      Chemical.Interfaces.Incompressible.SubstanceData(
        MolarWeight=0.0903,
        DfH=-694080,
        DfG=-430620,
        References={
            "https://www.chemeo.com/cid/11-815-4/L-Lactic-acid"});

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

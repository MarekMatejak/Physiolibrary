within Physiolibrary;
package Media
  extends Modelica.Icons.Package;
  package Water "Incompressible water with constant heat capacity"
    extends Interfaces.PartialMedium(
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
</html>"));
  end Water;

    package Air

      extends Interfaces.PartialMedium(
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
        Modelica.Units.SI.Concentration c[nS]=cat(1,concentrations,{(1-(concentrations*((MMb.*sV)[1:nS-1])))/(MMb[nS]*sV[nS])});
      algorithm
        d:=c*MMb;
      end density_pTC;


      annotation ();
    end Air;

  package BloodBySiggaardAndersen
    "Blood for gases transport"
    extends Interfaces.PartialMedium(
      MMb= {1098, 0.032, 0.044, 0.059, 65.494/4, 65.494/4, 65.494/4, 66.463, 1, 0.095, 0.266, 0.031, 0.018},
      ThermoStates=Modelica.Media.Interfaces.Choices.IndependentVariables.pTX,
      reducedX=false,
      singleState=true,
      final substanceNames={"RBC","O2","CO2","CO","Hb","MetHb","HbF","Alb","Glb","PO4","DPG","SID",
          "Others"},
      reference_X=cat(
          1,
          Conc .* C2X,
          {1 - (Conc*C2X)}),
      reference_T = 310.15,
      reference_p = 101325,
      SpecificEnthalpy(start=0, nominal=1e3),
      Density(start=1e3, nominal=1e3),
      AbsolutePressure(start=1.0e5, nominal=1.0e5),
      Temperature(
        min=273.15,
        max=320.15,
        start=310.15,
        nominal=310.15));

  protected
    constant Real Conc[nS - 1]={0.44,8.16865,21.2679,1.512e-6,8.4,0.042,0.042,0.66,28,0.153,
        5.4,37.67};

    constant Real C2X[nS - 1]= MMb[1:nS-1] ./ density_pTC(reference_p, reference_T, Conc);

    constant SpecificHeatCapacity _cp=3490 "specific heat capacity of blood";

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
    end BaseProperties;

  protected
    function _sO2CO
      input Real pH;
      input Real pO2;
      input Real pCO2;
      input Real pCO;
      input Real T;
      input Real tHb;
      input Real cDPG;
      input Real FMetHb;
      input Real FHbF;
      output Real sO2CO;
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

    end _sO2CO;

    model BloodGases
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

    protected
      Physiolibrary.Types.VolumeFraction Hct=C[1] "haematocrit";
      Physiolibrary.Types.Concentration tO2=C[2] "oxygen content per volume of blood";
      Physiolibrary.Types.Concentration tCO2=C[3]
        "carbon dioxide content per volume of blood";
      Physiolibrary.Types.Concentration tCO=C[4]
        "carbon monoxide content per volume of blood";
      Physiolibrary.Types.Concentration tHb=C[5]
        "haemoglobin content per volume of blood";
      Physiolibrary.Types.MoleFraction FMetHb=C[6]/C[5] "fraction of metheamoglobin";
      Physiolibrary.Types.MoleFraction FHbF=C[7]/C[5] "fraction of foetalheamoglobin";
      Physiolibrary.Types.Concentration ctHb_ery=C[5]/C[1]
        "haemoglobin concentration in red cells";
      Physiolibrary.Types.Concentration tAlb=C[8]
        "albumin concentration in blood plasma";
      Physiolibrary.Types.MassConcentration tGlb=C[9]
        "globulin concentration in blood plasma";
      Physiolibrary.Types.Concentration tPO4=C[10]
        "inorganic phosphates concentration in blood plasma";
      Physiolibrary.Types.Concentration cDPG=C[11] "DPG concentration in blood plasma";
      Physiolibrary.Types.Concentration SID=C[12] "strong ion difference of blood";

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
      Physiolibrary.Types.pH pH;
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

      parameter Real pKa1=2.1;
      parameter Real pKa2=6.8;
      parameter Real pKa3=12.7 "H2PO4 dissociation";

      parameter Real betaOxyHb=3.1 "buffer value for oxygenated Hb without CO2";
      parameter Real pIo=7.13 "isoelectric pH for oxygenated Hb without CO2";

      parameter Real pKzD=7.73 "pKa for NH3+ end of deoxygenated haemoglobin chain";
      parameter Real pKzO=7.25 "pKa for NH3+ end of oxygenated haemoglobin chain";
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

      NSIDP = -(tAlb*66.463)*(0.123*pH0 - 0.631) - tGlb*(2.5/28) - tPO4*(10^(pKa2 - pH0) +
        2 + 3*10^(pH0 - pKa3))/(10^(pKa1 + pKa2 - 2*pH0) + 10^(pKa2 - pH0) + 1 + 10^(pH0 -
        pKa3)) - cdCO2N*10^(pH0 - pK)
        "strong ion difference of blood plasma at pH=7.4, pCO2=40mmHg, T=37degC and sO2=1";

      fzcON = 1/(1 + 10^(pKzO - pH_ery0) + cdCO2N*10^(pH_ery0 - pKcO))
        "fraction of heamoglobin units with HN2 form of amino-terminus at pH=7.4 (pH_ery=7.19), pCO2=40mmHg, T=37degC and sO2=1";
      sCO2N = 10^(pH_ery0 - pKcO)*fzcON*cdCO2N
        "CO2 saturation of hemoglobin amino-termini at pH=7.4 (pH_ery=7.19), pCO2=40mmHg, T=37degC and sO2=1";
      NSIDE = -cdCO2N*10^(pH_ery0 - pK) - ctHb_ery*(betaOxyHb*(pH_ery0 - pIo) + sCO2N*(1 +
        2*10^(pKzO - pH_ery0))/(1 + 10^(pKzO - pH_ery0)) + 0.82)
        "strong ion difference of red cells at pH=7.4 (pH_ery=7.19), pCO2=40mmHg, T=37degC and sO2=1";

      NSID = Hct*NSIDE + (1 - Hct)*NSIDP
        "strong ion difference of blood at pH=7.4 (pH_ery=7.19), pCO2=40mmHg, T=37degC and sO2=1";

      BEox = (-SID) - NSID "base excess of oxygenated blood";

      beta = 2.3*tHb + 8*tAlb + 0.075*tGlb + 0.309*tPO4 "buffer value of blood";

      pH = pH0 + (1/beta)*(((BEox + 0.3*(1 - sO2CO))/(1 - tHb/43)) - (cHCO3 - 24.5))
        "Van Slyke";
      pH_ery = 7.19 + 0.77*(pH - 7.4) + 0.035*(1 - sO2);

      sO2CO = _sO2CO(
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
            coordinateSystem(preserveAspectRatio=false)));
    end BloodGases;

  public
    redeclare replaceable model extends ChemicalSolution
      outer Modelica.Fluid.System system "System wide properties";

    protected
      Real I = 0 "mole-fraction-based ionic strength";
      Real C[nS - 1]=(X[1:(nS - 1)] ./ C2X);

      ThermodynamicState state;
      BloodGases bloodGases(
        p=p,
        T=310.15,
        C=C);
      Modelica.Units.SI.MoleFraction aO2;
      Modelica.Units.SI.MoleFraction aCO2;
      Modelica.Units.SI.MoleFraction aCO;
      Modelica.Units.SI.ChemicalPotential uO2;
      Modelica.Units.SI.ChemicalPotential uCO2;
      Modelica.Units.SI.ChemicalPotential uCO;
      Modelica.Units.SI.MolarEnthalpy hO2;
      Modelica.Units.SI.MolarEnthalpy hCO2;
      Modelica.Units.SI.MolarEnthalpy hCO;
      constant Chemical.Interfaces.IdealGas.SubstanceData O2=
          Chemical.Substances.Oxygen_gas();
      constant Chemical.Interfaces.IdealGas.SubstanceData CO2=
          Chemical.Substances.CarbonDioxide_gas();
      constant Chemical.Interfaces.IdealGas.SubstanceData CO=
          Chemical.Substances.CarbonMonoxide_gas();

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

      actualStreamSpecificEnthalpies = if EnthalpyNotUsed then zeros(nS) else
        actualStream(substances.h_outflow) ./ MMb "specific enthalpy in stream";

      aO2 = bloodGases.pO2/p;
      aCO2 = bloodGases.pCO2/p;
      aCO = bloodGases.pCO/p;

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

      substances.u = {0,uO2,uCO2,uCO,0,0,0,0,0,0,0,0,0};

      substances.h_outflow = {0,hO2,hCO2,hCO,0,0,0,0,0,0,0,0,0};

      massFlows = substances.q .* MMb;
    end ChemicalSolution;

    redeclare replaceable function extends setState_pTX
    algorithm
      state.T := T;
      state.p := p;
      state.X := X;
    end setState_pTX;

    redeclare replaceable function extends setState_phX
    algorithm
      state.p := p;
      state.T := 310.15 + h/_cp;
      state.X := X;
    end setState_phX;

    redeclare replaceable function extends density
    algorithm
      d := 1057;
    end density;

    redeclare function extends density_pTC
    algorithm
      d := 1057;
    end density_pTC;


    redeclare replaceable function extends specificEnthalpy
    algorithm
      h := (state.T - 310.15)*_cp;
    end specificEnthalpy;

    redeclare replaceable function extends specificHeatCapacityCp
      "Return specific heat capacity at constant pressure"
    algorithm
      cp := _cp;
    end specificHeatCapacityCp;


    redeclare replaceable function extends temperature
    algorithm
      T := state.T;
    end temperature;

    redeclare replaceable function extends pressure
    algorithm
      p := state.p;
    end pressure;
    annotation (Documentation(info="<html>
  <p>
  References:
  <br>
http://www.siggaard-andersen.dk
<br>
Marek Mateják, Tomáš Kulhánek, Stanislav Matoušek: Adair-based hemoglobin equilibrium with oxygen, carbon dioxide and hydrogen ion activity. Scandinavian Journal of Clinical and Laboratory Investigation, vol. 75, pp. 113-120, 2015/02/17 2015. (DOI:10.3109/00365513.2014.984320)
</p>
</html>"));
  end BloodBySiggaardAndersen;

  package BodyFluid "Simplified Human body fluid"
    extends Interfaces.PartialMedium(
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
      Modelica.Units.SI.Concentration c[nS]=cat(1,concentrations,{(1-(concentrations*((MMb.*sV)[1:nS-1])))/(MMb[nS]*sV[nS])});
    algorithm
      d:=c*MMb;
    end density_pTC;

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

      replaceable partial model ChemicalSolution
        Chemical.Interfaces.SubstancePorts_a substances[nS];
        Physiolibrary.Types.RealIO.PressureInput p "pressure";
        Physiolibrary.Types.RealIO.SpecificEnthalpyInput h "specific enthalpy";
        Physiolibrary.Types.RealIO.MassFractionInput X[nS] "mass fractions of substances";
        Physiolibrary.Types.RealIO.ElectricCurrentInput i "electric current from substances";

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

      constant Modelica.Units.SI.MolarMass MMb[nS] "Molar mass of base molecules";
      /*Be carefull: it could be different from molar mass of substance in solution */

      replaceable function density_pTC
        "Density at defined total amount of solvents base molecules per total volume"
        input Modelica.Units.SI.Pressure p "Pressure";
        input Modelica.Units.SI.Temperature T "Temperature";
        input Modelica.Units.SI.Concentration concentrations[nS-1] "Total amount of base molecules per total volume";
        /*Be carefull: it could be different from concentration of substance in solution */
        output Modelica.Units.SI.Density d "Density";
      end density_pTC;

    end PartialMedium;
  end Interfaces;
end Media;

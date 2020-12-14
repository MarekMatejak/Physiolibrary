within Physiolibrary;
package Media

  package SimpleBodyFluid "Simplified Human body fluid"
    extends Modelica.Media.Interfaces.PartialMedium(
      final mediumName="SimpleBodyFluid (Physiolibrary)",
      final substanceNames={"Na","HCO3-","K","Glu","Urea","Cl","Ca","Mg","Alb",
    "Glb","Others","H2O"},
      final singleState=true,
      final reducedX=false,
      final fixedX=true,
      ThermoStates = Modelica.Media.Interfaces.Choices.IndependentVariables.pTX,
      reference_X = x_default,
      reference_T = 310.15,
      reference_p = 101325,
      Temperature(
        min=273,
        max=350,
        start=310.15));

  protected
    constant Modelica.SIunits.Concentration concentrations_without_water_default[nCS-1]=
     {135,24,5,5,3,105,1.5,0.5,0.7,0.8,1e-6} "initial amounts of base molecules in mmol of substances per one liter [mmol/l]";

    constant Modelica.SIunits.Volume water_volume=1 - (concentrations_without_water_default*stateOfMatter.molarVolume(substanceData[1:nCS-1]));
    constant Modelica.SIunits.AmountOfSubstance water_n=water_volume/stateOfMatter.molarVolume(substanceData[nCS]);

    constant Modelica.SIunits.Concentration concentration_default[nCS]= cat(1,concentrations_without_water_default,{water_n});

    constant Modelica.SIunits.MoleFraction x_default[nCS]=concentration_default./(concentration_default*ones(nCS)) "initial mole fraction of substances";

    constant Modelica.SIunits.MolarMass MM_default = x_default*stateOfMatter.molarMass(substanceData);

    constant Modelica.SIunits.MolarVolume MV_default = x_default*stateOfMatter.molarVolume(substanceData);

    constant Modelica.SIunits.Density density_default = MM_default / MV_default "initial density";

  public
    package stateOfMatter = Chemical.Interfaces.Incompressible
    "Substances model to translate data into substance properties";

    constant Integer nCS=nX "Number of chemical substances";

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

    redeclare model extends BaseProperties(final standardOrderComponents=true)
      "Base properties of medium"

    equation
      1/d = (X./stateOfMatter.molarMass(substanceData)) * stateOfMatter.molarVolume(substanceData,T=T,p=p);
      h = (X./stateOfMatter.molarMass(substanceData)) * stateOfMatter.molarEnthalpy(substanceData,T=T,p=p);
      u = h - p/d;
      1/MM = (X./stateOfMatter.molarMass(substanceData)) * ones(nS);
      R = 8.3144/MM;
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
      Modelica.SIunits.ElectricPotential v "Electric potential of medium";
      MassFraction X[nS] "Mass fractions of substances";
      annotation (Documentation(info="<html>

</html>"));
    end ThermodynamicState;

    redeclare function extends setState_pTX
      "Return thermodynamic state as function of p, T and composition X or Xi"
      input Modelica.SIunits.ElectricPotential v=0;
    algorithm
      state.p :=p;
      state.T :=T;
      state.X :=X;
      state.v :=v;
    end setState_pTX;

   /* redeclare function extends setState_dTX
  algorithm 
    state.T :=T;
    state.X :=X;
  end setState_dTX;
*/
    redeclare function extends setState_phX
      "Return thermodynamic state as function of p, h and composition X or Xi"
      input Modelica.SIunits.ElectricPotential v=0;
    protected
      MolarMass MM = 1/(X*(ones(nCS)./stateOfMatter.molarMass(substanceData)));
    algorithm
      state.p :=p;
      state.T := stateOfMatter.solution_temperature(substanceData,h*MM,X./stateOfMatter.molarMass(substanceData),p);
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
      h := stateOfMatter.molarEnthalpy(substanceData[1],T=state.T,p=state.p) / stateOfMatter.molarMass(substanceData[1]);
    end specificEnthalpy;


    redeclare function extends specificEntropy "Return specific entropy"
    protected
      Real a[nS] "activities of substances";
      Modelica.SIunits.MolarEnergy u[nS] "electro-chemical potentials of substances in the solution";
    algorithm
      a := stateOfMatter.activityCoefficient(substanceData).*(state.X ./
        stateOfMatter.molarMass(substanceData)/(state.X*(ones(nS) ./
        stateOfMatter.molarMass(substanceData))));

      u := stateOfMatter.chemicalPotentialPure(
          substanceData,
          state.T,
          state.p,
          state.v) + Modelica.Constants.R*state.T*log(a) +
        stateOfMatter.chargeNumberOfIon(substanceData)*Modelica.Constants.F*state.v;

      s := (state.X ./ stateOfMatter.molarMass(substanceData)) * stateOfMatter.molarEntropy(u,substanceData,T=state.T,p=state.p);
      annotation (Documentation(info="<html>

</html>"));
    end specificEntropy;

    redeclare function extends specificHeatCapacityCp
      "Return specific heat capacity at constant pressure"
    algorithm
      cp := (state.X ./ stateOfMatter.molarMass(substanceData)) * stateOfMatter.molarHeatCapacityCp(substanceData,T=state.T,p=state.p);
      annotation (Documentation(info="<html>

</html>"));
    end specificHeatCapacityCp;

    redeclare function extends specificHeatCapacityCv
      "Return specific heat capacity at constant volume"
    algorithm
      cv := (state.X ./ stateOfMatter.molarMass(substanceData)) * stateOfMatter.molarHeatCapacityCv(substanceData,T=state.T,p=state.p);
      annotation (Documentation(info="<html>

</html>"));
    end specificHeatCapacityCv;

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
      d := (state.X*stateOfMatter.molarMass(substanceData)) / (state.X*stateOfMatter.molarVolume(substanceData));
    end density;

    redeclare function extends temperature
    algorithm
      T := state.T;
    end temperature;

    redeclare function extends pressure
    algorithm
      p := state.p;
    end pressure;

    function C_outflow
     input Modelica.SIunits.MassFraction x_mass[nCS];
     output Real C_outflow[nC];
    algorithm
      C_outflow := C_default;
      annotation(Inline=true);
    end C_outflow;

    function Xi_outflow
      input Modelica.SIunits.MassFraction x_mass[nCS];
      output Modelica.SIunits.MassFraction Xi[nXi];
    algorithm
      Xi := x_mass[1:nXi];
      annotation(Inline=true);
    end Xi_outflow;

    function x_mass
      input Modelica.SIunits.MassFraction actualStream_Xi[nXi];
      input Real actualStream_C[nC];
      output Modelica.SIunits.MassFraction x_mass[nCS];
    algorithm
      x_mass := actualStream_Xi;
      annotation(Inline=true);
    end x_mass;

    function concentration "Concentration of substances from Xi and C"
      input ThermodynamicState state;
      input Modelica.SIunits.MassFraction Xi[nXi];
      input Real C[nC];
      output Modelica.SIunits.Concentration concentration[nCS];
    algorithm
      concentration := Xi*density(state)./stateOfMatter.molarMass(substanceData);
    end concentration;

    function specificEnthalpyOffsets "Difference between chemical substance enthalpy and medium substance enthalpy at temperature 298.15 K and 100kPa"
      input Modelica.SIunits.ElectricPotential v=0;
      input Real I=0;
      output SpecificEnthalpy h[nCS];
    algorithm
      h := zeros(nCS);
    end specificEnthalpyOffsets;


  end SimpleBodyFluid;
end Media;

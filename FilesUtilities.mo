within Physiolibrary2013;
package FilesUtilities
  extends Types.Utilities;
  redeclare function extends readInputReal
    import Modelica.Utilities.*;

  protected
    String fn;
    String line;
    Integer nextIndex;
    Integer lineLen;
    Integer iline=1;
    Boolean found = false;
    Boolean endOfFile=false;
    String str;
    Real inputValue;
    Integer typeDef;
  algorithm
    fn:="io/input.txt";

    if not Files.exist(fn) then
       Streams.error("readRealParameter(\""+name+"\", \""+ fn + "\")  Error: the file does not exist.\n");
    else

    typeDef:=UnitDerivations.findUnit(storeUnit);

    //Format "<variableName>\n<value><unit>"
    (line, endOfFile) :=Streams.readLine(fn, iline);
    while not found and not endOfFile loop
         if line == name then
             // name found, get value of "name = value;"
             (line, endOfFile) :=Streams.readLine(fn, iline+1);
             lineLen := Strings.length(line);
             nextIndex:=1;

             /* 
  //Format "<variableName>=<value><unit>" 
  while not found and not endOfFile loop
       iline:=iline+1;
       (line, endOfFile) :=Streams.readLine(fn, iline);
       lineLen := Strings.length(line);

       if lineLen>3 then

         nextIndex:=1; //because Coleman does not use the right identifiers, scanIdentifier can not be used :(
         str:=Strings.substring(line,nextIndex,nextIndex);
         while ((nextIndex+1)<lineLen and (not Strings.isEqual(str," ")) and (not Strings.isEqual(str,"=")) and (not Strings.isEqual(str,"\t"))) loop
            nextIndex:=nextIndex+1;
            str:=Strings.substring(line,nextIndex,nextIndex);
         end while;
         str := Strings.substring(line,1,nextIndex-1);

         if str==name then
                 
           nextIndex:=Strings.Advanced.skipWhiteSpace(line,nextIndex);
           nextIndex:=Strings.Advanced.skipWhiteSpace(line,nextIndex+1); //skip '=' and white-spaces before/after
*/

             (inputValue,nextIndex) := Strings.scanReal(line, nextIndex);
             nextIndex:=Strings.Advanced.skipWhiteSpace(line,nextIndex);
             if nextIndex>lineLen then
               if Strings.length(Physiolibrary2013.FilesUtilities.UnitDerivations.RealTypeDef[
                typeDef].DisplayUnit)                                                            >0 then
                  Streams.error("No units detected for variable '" + name + "' in file '"+fn+"'. Expected unis are '" +
                Physiolibrary2013.FilesUtilities.UnitDerivations.RealTypeDef[
                typeDef].DisplayUnit                                                             + "'!\n");
               end if;
             else
               str :=Strings.substring(line, Strings.Advanced.skipWhiteSpace(line,nextIndex),  Strings.length(line));
               if str<>Physiolibrary2013.FilesUtilities.UnitDerivations.RealTypeDef[
                typeDef].DisplayUnit then
                  Streams.error("Units '" +str + "' not expected for variable '" + name + "' in file '"+fn+"'. Expected unis are '" +
                Physiolibrary2013.FilesUtilities.UnitDerivations.RealTypeDef[
                typeDef].DisplayUnit                                                                             + "'!\n");
               end if;
             end if;
             value := inputValue*Physiolibrary2013.FilesUtilities.UnitDerivations.RealTypeDef[
            typeDef].Scale                                                                 +
            Physiolibrary2013.FilesUtilities.UnitDerivations.RealTypeDef[
            typeDef].Offset;
             found := true;
          // end if;  //Format "<variableName>=<value><unit>"

           //Format "<variableName>\n<value><unit>"
           else
           // wrong name, skip lines
             iline := iline + 2;
             // read next variable name
             (line, endOfFile) :=Streams.readLine(fn, iline);

           end if;
       end while;

       if not found then
          Streams.error("Parameter \"" + name + "\" not found in file \"" + fn + "\"\n");
       end if;
     end if;

  end readInputReal;

  redeclare function extends readInputBoolean

  algorithm
    value:=(readInputReal(name,"")>0.005);
  end readInputBoolean;

  redeclare function extends writeReal "Write the value to file"
    import Modelica.Utilities.*;

  protected
    String fn;
    Integer typeDef "Variable type";

  algorithm
    fn:="io/output.txt";

    if not Files.exist(fn) then
       if not Files.exist("io") then
           Files.createDirectory("io");
       end if;
    end if;

    typeDef:=UnitDerivations.findUnit(storeUnit);

    Streams.print( name + "\n" + String( ((value-Physiolibrary2013.FilesUtilities.UnitDerivations.RealTypeDef[
      typeDef].Offset)                                                                                      /
      Physiolibrary2013.FilesUtilities.UnitDerivations.RealTypeDef[typeDef].Scale))                                                                                       + " " +
      Physiolibrary2013.FilesUtilities.UnitDerivations.RealTypeDef[typeDef].DisplayUnit,
                                                                        fn);

  end writeReal;

  redeclare function extends writeBoolean
   import Modelica.Utilities.*;
  protected
    String fn;

  algorithm
    fn:="io/output.txt";

    if not Files.exist(fn) then
       if not Files.exist("io") then
           Files.createDirectory("io");
       end if;
    end if;

    Streams.print( name + "\n" + String(if value then 1 else 0),      fn);

  end writeBoolean;

  redeclare function extends writeComparation
    "Compare and write the result and the value to file"
    import Modelica.Utilities.*;

  protected
    String fn;
    Real outputInitialValue;
    Real outputFinalValue;
    Real outputDefaultValue;
    Integer typeDef "Variable output units";

  algorithm
    fn:="io/comparation.txt";

    if not Files.exist(fn) then
       if not Files.exist("output") then
           Files.createDirectory("output");
       end if;
    end if;

    typeDef:=UnitDerivations.findUnit(storeUnit);

    outputDefaultValue :=((defaultValue -Physiolibrary2013.FilesUtilities.UnitDerivations.RealTypeDef[
      typeDef].Offset)                                                                               /
      Physiolibrary2013.FilesUtilities.UnitDerivations.RealTypeDef[typeDef].Scale);
    outputInitialValue :=((initialValue -Physiolibrary2013.FilesUtilities.UnitDerivations.RealTypeDef[
      typeDef].Offset)                                                                               /
      Physiolibrary2013.FilesUtilities.UnitDerivations.RealTypeDef[typeDef].Scale);
    outputFinalValue :=((finalValue -Physiolibrary2013.FilesUtilities.UnitDerivations.RealTypeDef[
      typeDef].Offset)                                                                            /
      Physiolibrary2013.FilesUtilities.UnitDerivations.RealTypeDef[typeDef].Scale);

    Streams.print( ( if (abs(outputDefaultValue)>Modelica.Constants.eps) then String( abs((outputFinalValue-outputDefaultValue)/outputDefaultValue)) else  "Zero vs. " + String( outputFinalValue))  + " ; " + name + " : default="  + String(outputDefaultValue) + " " +
      Physiolibrary2013.FilesUtilities.UnitDerivations.RealTypeDef[typeDef].DisplayUnit                                                                                 +", initial=" + String(outputInitialValue) +" " +
      Physiolibrary2013.FilesUtilities.UnitDerivations.RealTypeDef[typeDef].DisplayUnit                                                                                 + ", final=" + String(outputFinalValue) +" " +
      Physiolibrary2013.FilesUtilities.UnitDerivations.RealTypeDef[typeDef].DisplayUnit,                                                                                 fn);

  end writeComparation;

  redeclare function extends writeBooleanComparation
    "Compare and write the result and the value to file"
    import Modelica.Utilities.*;

  protected
    String fn;
    Real outputInitialValue;
    Real outputFinalValue;
    Real outputDefaultValue;
  algorithm
    fn:="io/comparation.txt";

    if not Files.exist(fn) then
       if not Files.exist("output") then
           Files.createDirectory("output");
       end if;
    end if;
     if (defaultValue==finalValue) then

         Streams.print("0 ; "+ name + " : default=" + String(if defaultValue then 1 else 0) +", initial=" + String(if initialValue then 1 else 0) + ", final=" + String(if finalValue then 1 else 0), "differences.txt");
       else
         Streams.print("! ; " + name + " : default=" + String(if defaultValue then 1 else 0) +", initial=" + String(if initialValue then 1 else 0)+ ", final=" + String(if finalValue then 1 else 0), "differences.txt");
     end if;

  end writeBooleanComparation;

  package UnitDerivations

   function findUnit
     input String unitToFind "display unit to find in RealTypeDef";
     output Integer typeDef "index in RealTypeDef";
   algorithm
     typeDef:=0;
     for i in 1:size(RealTypeDef,1) loop
       if RealTypeDef[i].DisplayUnit == unitToFind then
         typeDef:=i;
         break;
       end if;
     end for;
     if typeDef==0 then
        Modelica.Utilities.Streams.error("Unit \"" + unitToFind + "\" not defined in FileUtilities.UnitDerivations.RealTypeRecord.\n");
     end if;
   end findUnit;

   record RealTypeRecord "The Real Type definition"
     parameter String Quantity="" "Quantity";
     parameter String Unit="1" "SI unit";
     parameter String DisplayUnit="1" "Display unit";

     parameter Real Scale=1
        "Scale from display unit to SI unit such that x <d> = x*s+o <u>";
     parameter Real Offset=0
        "Offset from display unit to SI unit such that x <d> = x*s+o <u>";

     parameter Real Min=-Modelica.Constants.inf "minimal value";
     parameter Real Max=+Modelica.Constants.inf; // Inf denotes a large value
     parameter Real Start = Offset; // Initial value
     parameter Real Nominal = Scale; // Nominal value
     parameter StateSelect StateSelection = StateSelect.default;
   end RealTypeRecord;

    constant RealTypeRecord RealTypeDef[:]={RealTypeRecord(),
        RealTypeRecord(),RealTypeRecord(
          Quantity="Energy",
          Unit="J",
          DisplayUnit="kcal",
          Scale=4186.8),RealTypeRecord(
          Quantity="Time",
          Unit="s",
          DisplayUnit="min",
          Scale=1/60),RealTypeRecord(
          Quantity="Mass",
          Unit="kg",
          Min=0,
          DisplayUnit="g",
          Scale=1e-3),RealTypeRecord(
          Quantity="MassFlowRate",
          Unit="kg/s",
          DisplayUnit="mg/min",
          Scale=(1e-6)*60),RealTypeRecord(
          Quantity="Density",
          Unit="kg/m3",
          Min=0,
          DisplayUnit="kg/l",
          Scale=1e3),RealTypeRecord(
          Quantity="Length",
          Unit="m",
          DisplayUnit="cm",
          Scale=1e-2),RealTypeRecord(
          Quantity="Acceleration",
          Unit="m/s2",
          DisplayUnit="m/s2",
          Scale=1),RealTypeRecord(
          Quantity="Pressure",
          Unit="Pa",
          DisplayUnit="mmHg",
          Scale=101325/760),RealTypeRecord(
          Quantity="Volume",
          Unit="m3",
          DisplayUnit="ml",
          Scale=1e-6),RealTypeRecord(
          Quantity="VolumeFlowRate",
          Unit="m3/s",
          DisplayUnit="ml/min",
          Scale=(1e-6)*60),RealTypeRecord(
          Quantity="Concentration",
          Unit="mol/m3",
          DisplayUnit="mmol/l",
          Scale=1,
          Start=1),RealTypeRecord(
          Quantity="AmountOfSubstance",
          Unit="mol",
          DisplayUnit="mmol",
          Scale=1e-3),RealTypeRecord(
          Quantity="MolarFlowRate",
          Unit="mol/s",
          DisplayUnit="mmol/min",
          Scale=(1e-3)/60),RealTypeRecord(
          Quantity="Energy",
          Unit="J",
          DisplayUnit="kcal",
          Scale=4186.8),RealTypeRecord(
          Quantity="ThermodynamicTemperature",
          Unit="K",
          DisplayUnit="degC",
          Scale=1,
          Offset=273.15,
          Start=310.15),RealTypeRecord(
          Quantity="Power",
          Unit="W",
          DisplayUnit="kcal/min",
          Scale=4186.8*60),RealTypeRecord(
          Quantity="ThermalConductance",
          Unit="W/K",
          DisplayUnit="kcal/(min.degC)",
          Scale=4186.8*60),RealTypeRecord(
          Quantity="SpecificHeatCapacity",
          Unit="J/(kg.K)",
          DisplayUnit="kcal/(degC.kg)",
          Scale=4186.8),RealTypeRecord(
          Quantity="SpecificEnergy",
          Unit="J/kg",
          DisplayUnit="kcal/kg",
          Scale=4186.8),RealTypeRecord(
          Quantity="ElectricPotential",
          Unit="V",
          DisplayUnit="mV",
          Scale=1e-3),RealTypeRecord(
          Quantity="ElectricCharge",
          Unit="C",
          DisplayUnit="mEq",
          Scale=(1e-3)*(9.64853399*10^4)),RealTypeRecord(
          Quantity="ElectricCurrent",
          Unit="A",
          DisplayUnit="mEq/min",
          Scale=(1e-3)*(9.64853399*10^4)*60),RealTypeRecord(
          Quantity="Fraction",
          Unit="1",
          DisplayUnit="%",
          Scale=1e-2),RealTypeRecord(
          Quantity="OsmoticMembramePermeability",
          Unit="m6/(mol.s)",
          DisplayUnit="ml/(mOsmol.min)",
          Scale=(1e-6)/((1e-3)*60)),RealTypeRecord(
          Quantity="DiffusionMembranePermeability",
          Unit="m3/s",
          DisplayUnit="ml/min",
          Scale=(1e-3)*60),RealTypeRecord(
          Quantity="HydraulicConductance",
          Unit="m3/(Pa.s)",
          DisplayUnit="ml/(mmHg.min)",
          Scale=(1e-6)/((101325/760)*60)),RealTypeRecord(
          Quantity="HydraulicCompliance",
          Unit="m3/Pa",
          DisplayUnit="ml/mmHg",
          Scale=(1e-6)/(101325/760)),RealTypeRecord(
          Quantity="HydraulicInertance",
          Unit="Pa.s2/m3",
          DisplayUnit="mmHg.min2/ml",
          Scale=((101325/760)*(60^2)/(1e-6))),RealTypeRecord(
          Quantity="GasSolubility",
          Unit="mol/(m3.Pa)",
          DisplayUnit="mmol/(l.mmHg)",
          Scale=(1e-3)/((1e-3)*(101325/760))),RealTypeRecord(
          Quantity="Osmolarity",
          Unit="mol",
          DisplayUnit="mOsm",
          Scale=(1e-3))}
      "All defined Real types - units, displayUnits, conversions, nominals";

  end UnitDerivations;
  annotation (Documentation(revisions="<html>
<p>Licensed by Marek Matejak under the Modelica License 2</p>
<p>Copyright &copy; 2008-2013, Marek Matejak.</p>
<p><br/><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Physiolibrary2013.UsersGuide.ModelicaLicense2\">Physiolibrary2013.UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p>
</html>"));
end FilesUtilities;

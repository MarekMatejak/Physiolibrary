within Physiolibrary;
package UsersGuide "User's Guide"
  extends Modelica.Icons.Information;

  class Overview "Overview of Physiolibrary"
    extends Modelica.Icons.Information;
    annotation (
      Documentation(info = "<html>
<p>ThePhysiolibrary consists of the following main sub-libraries: </p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><p align=\"center\"><b>Library Components</b></p></td>
<td><p align=\"center\"><b>Description</b></p></td>
</tr>
<tr>
<td valign=\"top\"><p><img src=\"modelica://Physiolibrary/Resources/Images/UserGuide/Hydraulic.png\"/></p></td>
<td valign=\"middle\"><p><a href=\"modelica://Physiolibrary.Fluid\">Fluid</a></p><p>The main usage of the hydraulic domain in human physiology is modeling of the cardio-vascular system. And because there are no extreme thermodynamic conditions, the system can be really simple &mdash;it is only necessary to model conditions for incompressible water, at normal liquid-water temperatures and with relative pressure 5-20kPa. This boring thermodynamic state leads to the very simple blocks of hydraulic resistance, hydrostatic pressure, volumetric flow, inertia and finally the block of blood accumulation in elastic vessels.</p></td>
</tr>
<tr>
<td valign=\"top\"><p><img src=\"modelica://Physiolibrary/Resources/Images/UserGuide/Thermal.png\"/></p></td>
<td valign=\"middle\"><p><a href=\"modelica://Physiolibrary.Thermal\">Thermal</a></p><p>For the human body to function optimally, it is critical to hold the core temperature at 35&ndash;39&deg;C. A fever of 41&deg;C for more than a short period of time causes brain damage. If the core temperature falls below 10&deg;C, the heart stops. As in the hydraulic domain, the thermal domain is simplified to these conditions. </p><p>In the Thermal package extends the package Modelica.Thermal.HeatTransfer from Modelica Standard Library 3.2 (MSL), where the connector is composed of temperature and heat flow. The main blocks in Thermal are: Conductor, IdealRadiator and HeatAccumulation. The heat conductor conducts the heat from the source, such us muscles or metabolically active tissue, to its surrounding. IdealRadiator delivers heat to tissues by blood circulation. HeatAccumulation plays a role in accumulating thermal energy in each tissue mass driven by its heat capacity. We recommend to use this block instead of Modelica.Thermal.HeatTransfer.HeatCapacitor to have possibility of variable mass amount or to have a support for calculation of steady state. </p></td>
</tr>
<tr>
<td valign=\"top\"><p><img src=\"modelica://Physiolibrary/Resources/Images/UserGuide/Population.png\"/></p></td>
<td valign=\"middle\"><p><a href=\"modelica://Physiolibrary.Population\">Population</a></p><p>Population models are based on increasing and decreasing of average number of population members. The number of population member is a nonflow variable in connectors and flow variable is the change of population members. The growth or differentiation of cells can be modeled as stream from one population component to another, where each population component could be defined by selected age, type, function or wathever..</p><p>Even the domain is integer, all is modeled by real numbers. </p></td>
</tr>
</table>
</html>"));
  end Overview;

  class Connectors "Connectors"
    extends Modelica.Icons.Information;
    annotation (
      Documentation(info="<html>
<p>The Physiolibrary defines the most important <b>elementary connectors</b> in various domains. If any possible, a user should utilize these connectors in order that components from the Physiolibrary and from other libraries can be combined without problems. The following elementary connectors are defined (the meaning of potential, flow, and stream variables is explained in section &quot;Connector Equations&quot; below): </p>
<table cellspacing=\"0\" cellpadding=\"1\" border=\"1\"><tr>
<td valign=\"top\"><p><b>domain</b></p></td>
<td valign=\"top\"><p><b>potential</b></p><p>variables</p></td>
<td valign=\"top\"><p><b>flow</b></p><p>variables</p></td>
<td valign=\"top\"><p><b>stream</b></p><p>variables</p></td>
<td valign=\"top\"><p><b>connector definition</b></p></td>
<td valign=\"top\"><p><b>icons</b></p></td>
</tr>
<tr>
<td valign=\"top\"><p><b>hydraulic (fluid)</b></p></td>
<td valign=\"top\"><p>absolute pressure</p></td>
<td valign=\"top\"><p>mass flow</p></td>
<td valign=\"top\"><p>enthalpy, substances concentrations</p></td>
<td valign=\"top\"><p><br><br><br><a href=\"modelica://Modelica.Fluid.Interfaces\">Modelica.Fluid.Interfaces</a> </p><p>FluidPort, FluidPort_a, FluidPort_b</p>
<p><a href=\"modelica://Physiolibrary.Fluid.Interfaces\">Fluid.Interfaces</a> </p><p>FluidPort, FluidPort_a, FluidPort_b</p></td>
<td valign=\"top\"><p><img src=\"modelica://Physiolibrary/Resources/Images/UserGuide/FluidPorts.png\"/></p></td>
</tr>
<tr>
<td valign=\"top\"><p><b>thermal</b></p></td>
<td valign=\"top\"><p>temperature</p></td>
<td valign=\"top\"><p>heat flow rate</p></td>
<td valign=\"top\"></td>
<td valign=\"top\"><p><br><br><br><br><br><a href=\"modelica://Modelica.Thermal.HeatTransfer.Interfaces\">Modelica.Thermal.HeatTransfer.Interfaces</a> </p><p>HeatPort, HeatPort_a, HeatPort_b</p><p><a href=\"modelica://Physiolibrary.Thermal.Interfaces\">Thermal.Interfaces</a> </p><p>HeatPort, HeatPort_a, HeatPort_b</p></td>
<td valign=\"top\"><p><br><img src=\"modelica://Physiolibrary/Resources/Images/UserGuide/ThermalPorts.png\"/></p></td>
</tr>
<tr>
<td valign=\"top\"><p><b>population</b></p></td>
<td valign=\"top\"><p>the number</p><p>of population members</p></td>
<td valign=\"top\"><p>change </p><p>of the number of population members</p></td>
<td valign=\"top\"></td>
<td valign=\"top\"><p><br><br><br><br><br><a href=\"modelica://Physiolibrary.Population.Interfaces\">Population.Interfaces</a> </p><p>PopulationPort, PopulationPort_a, PopulationPort_b</p></td>
<td valign=\"top\"><p><img src=\"modelica://Physiolibrary/Resources/Images/UserGuide/PopulationPorts.png\"/></p></td>
</tr>
<tr>
<td valign=\"top\"><p><b>block</b></p><p>diagram</p></td>
<td valign=\"top\"><p>Real unit-typed variables</p></td>
<td valign=\"top\"></td>
<td valign=\"top\"></td>
<td valign=\"top\"><p><br><br><br><br><br><br><br><br><br><br><a href=\"modelica://Physiolibrary.Types.RealIO\">Types.RealIO</a> </p><p>EnergyInput, EnergyOutput, TimeInput, TimeOutput, MassInput, MassOutput, MassFlowRateInput, MassFlowRateOutput, HeightInput, HeightOutput, AccelerationInput, AccelerationOutput, PressureInput, PressureOutput, VolumeInput, VolumeOutput, VolumeFlowRateInput, VolumeFlowRateOutput, ConcentrationInput, ConcentrationOutput, OsmolarityInput, OsmolarityOutput, AmountOfSubstanceInput, AmountOfSubstanceOutput, MolarFlowRateInput, MolarFlowRateOutput, DiffusionPermeabilityInput, DiffusionPermeabilityOutput, HeatInput, HeatOutput, TemperatureInput, TemperatureOutput, HeatFlowRateInput, HeatFlowRateOutput, ThermalConductanceInput, ThermalConductanceOutput, ElectricCurrentInput, ElectricCurrentOutput, ElectricChargeInput, ElectricChargeOutput, ElectricPotentialInput, ElectricPotentialOutput, FractionInput, FractionOutput, FrequencyInput, FrequencyOutput, OsmoticPermeabilityInput, OsmoticPermeabilityOutput, HydraulicConductanceInput, HydraulicConductanceOutput, HydraulicComplianceInput, HydraulicComplianceOutput, HydraulicInertanceInput, HydraulicInertanceOutput, GasSolubilityInput, GasSolubilityOutput, DensityInput, SpecificEnergyInput, SpecificEnergyOutput, SpecificHeatCapacityInput, SpecificHeatCapacityOutput</p></td>
<td valign=\"top\"><p><img src=\"modelica://Physiolibrary/Resources/Images/UserGuide/Signals.png\"/></p></td>
</tr>
</table>
<p><br><br><br><br><br><br><br>In all domains, usually 2 connectors are defined. The variable declarations are <b>identical</b>, only the icons are different in order that it is easy to distinguish connectors of the same domain that are attached at the same component. </p>
</html>"));
  end Connectors;

  package ReleaseNotes "Release notes"
    class Version_3_0_0 "Version 3.0.0 (Oct. 10, 2023)"
      extends Modelica.Icons.ReleaseNotes;
      annotation (
        Documentation(info="<html>
<ul>
<li> using Chemical 1.4 instead of Physiolibrary.Chemical and Physiolibrary.Osmotic</li>
<li> support of Modelica.Fluid and Modelica.Media concept instead of Physiolibrary.Hydraulic</li>
<li> model of Blood using blood plasma and red cells composition with Henderson-Hasselbalch;Hemoglobin-O2,CO2,H+,CO binding;Chloride shift;Osmosis</li>
<li> support of modeling of respiratory and cardiovascular blood gases transport</li>
<li> obsolete previous Physiolibrary steady state concept</li>
</ul>
</html>"));
    end Version_3_0_0;

    extends Modelica.Icons.ReleaseNotes;

    class Version_2_3_1 "Version 2.3.1 (Sep. 15, 2015)"
      extends Modelica.Icons.ReleaseNotes;
      annotation (
        Documentation(info = "<html>
<ul>
<li>Change of license to <a href=\"http://opensource.org/licenses/BSD-3-Clause\">BSD</a>: </li>
<li><ul>
<li><font style=\"color: #333333; \">no additional restricions</font></li>
<li><font style=\"color: #333333; \">supported decentralized development</font></li>
</ul></li>
<li><font style=\"color: #333333; \">Fix:</font></li>
<li><ul>
<li><font style=\"color: #333333; \">External pressure of elastic vessel compartment.</font></li>
</ul></li>
<li>New example of pulsative blood circulation by Willem van Meurs 2011</li>
<li>Support of [Physiomodel 1.0.0] (https://github.com/physiology/Physiomodel/releases/tag/v1.0.0)</li>
</ul>
</html>"));
    end Version_2_3_1;

    class Version_2_3_0 "Version 2.3.0 (Feb. 16, 2015)"
      extends Modelica.Icons.ReleaseNotes;
      annotation (
        Documentation(info = "<html>
<ul>
<li><font style=\"color: #333333; \">New:</font></li>
<li><ul>
<li><font style=\"color: #333333; \">Population domain for population models of organisms, cells,..</font></li>
<li><font style=\"color: #333333; \">cardiovascular models as example of Hydraulic domain</font></li>
<li><font style=\"color: #333333; \">components: osmotic reabsorption, ideal osmotic flow filtration</font></li>
<li><font style=\"color: #333333; \">display units: umol/min,nmol/min,pmol/min,l/day</font></li>
<li><font style=\"color: #333333; \">icons: heart ventricle icon, microcirculation, population</font></li>
<li><font style=\"color: #333333; \">blocks: 1(one) as constant, energy per mass, DegradationGain, FractionGain</font></li>
<li><font style=\"color: #333333; \">installation to System Modeler script (Resources/Install)</font></li>
</ul></li>
<li><font style=\"color: #333333; \">Fix:</font></li>
<li><ul>
<li><font style=\"color: #333333; \">OsmoticCell with more possible membrane type interfaces</font></li>
<li><font style=\"color: #333333; \">factors: dissabling option and with decadic logarith</font></li>
<li><font style=\"color: #333333; \">redefinition of unmeasurables physical quantities</font></li>
<li><font style=\"color: #333333; \">manipulation with initial input and final output values of variables</font></li>
<li><font style=\"color: #333333; \">units of heart starling slopes in CardiovascularSystem_GCG</font></li>
</ul></li>
<li><font style=\"color: #333333; \">Rename:</font></li>
<li><ul>
<li><font style=\"color: #333333; \">units Torr with capital 'T' (from name - Evangelista Torricelli)</font></li>
<li><font style=\"color: #333333; \">Blocks.Math.Exponentiation to Blocks.Math.Power</font></li>
</ul></li>
</ul>
</html>"));
    end Version_2_3_0;

    class Version_2_2_0 "Version 2.2.0 (Sep. 06, 2014)"
      extends Modelica.Icons.ReleaseNotes;
      annotation (
        Documentation(info = "<html>
<ul>
<li><font style=\"color: #333333; \">New:</font></li>
<li><ul>
<li><font style=\"color: #333333; \">read/write of values in non-SI units</font></li>
<li><font style=\"color: #333333; \">outflow/inflow sources</font></li>
<li><font style=\"color: #333333; \">chemical internal heats</font></li>
<li><font style=\"color: #333333; \">passive fluxes through membranes</font></li>
</ul></li>
<li><font style=\"color: #333333; \">Fix:</font></li>
<li><ul>
<li><font style=\"color: #333333; \">collapsing ElasticVessel at negative sucking pressures</font></li>
<li><font style=\"color: #333333; \">concentrations are always per volume of whole solution</font></li>
<li><font style=\"color: #333333; \">determining of Dymola installation folder</font></li>
</ul></li>
<li><font style=\"color: #333333; \">Rename:</font></li>
<li><ul>
<li><font style=\"color: #333333; \">actualFlow, actualConc, .. in sensors</font></li>
<li><font style=\"color: #333333; \">FlowConcentrationMeasure to IncrementalFlowConcentrationMeasure</font></li>
<li><font style=\"color: #333333; \">thermal OutStream to MassOutflow</font></li>
</ul></li>
</ul>
</html>"));
    end Version_2_2_0;

    class Version_2_1_1 "Version 2.1.1 (May. 02, 2014)"
      extends Modelica.Icons.ReleaseNotes;
      annotation (
        Documentation(info = "<html>
<ul>
<li><font style=\"color: #333333; \">New:</font></li>
<li><ul>
<li><font style=\"color: #333333; \">compoment HydraulicComponents.IdealValve for modeling aortic, pulmonary, triscupid and mitral valve</font></li>
<li><font style=\"color: #333333; \">types pH, VolumeDensityOfCharge</font></li>
<li><font style=\"color: #333333; \">examples: Osmotic.Examples.CelebrospinalFluid, Hydraulic.Examples.Windkessel and Hydraulic.Example.MinimalCirculation</font></li>
</ul></li>
<li><font style=\"color: #333333; \">Fix:</font></li>
<li><ul>
<li>role of hydraulic pressure in Osmotic.Components.Membrane</li>
</ul></li>
</ul>
</html>"));
    end Version_2_1_1;

    class Version_2_1 "Version 2.1 (Feb. 28, 2014)"
      extends Modelica.Icons.ReleaseNotes;
      annotation (
        Documentation(info = "<html>
<ul>
<li><font style=\"color: #333333; \">Upgrade to MSL 3.2.1 (still compatible with MSL 3.2)</font></li>
<li><font style=\"color: #333333; \">New:</font></li>
<li><ul>
<li><font style=\"color: #333333; \">constants HydraulicResistanceConst, HydraulicElastanceConst and HydraulicElastanceToComplianceConst and type HydraulicElastance</font></li>
<li><font style=\"color: #333333; \">display units for hydraulic resistance/conductance/compliance/elastance, for gas solubility</font></li>
<li><font style=\"color: #333333; \">steady state component ElectricChargeConservationLaw</font></li>
</ul></li>
<li><font style=\"color: #333333; \">Rename:</font></li>
<li><ul>
<li><font style=\"color: #333333; \">HydraulicResistanceConst to HydraulicResistanceToConductanceConst</font></li>
</ul></li>
<li><font style=\"color: #333333; \">Fix:</font></li>
<li><ul>
<li><font style=\"color: #333333; \">gas solution in liquid with corrected GasSolubility type</font></li>
<li><font style=\"color: #333333; \">bidirectional stream flows</font></li>
<li><font style=\"color: #333333; \">steady state example of dissolved oxygen</font></li>
<li><font style=\"color: #333333; \">installation batch file for Dymola in Windows</font></li>
<li><font style=\"color: #333333; \">references in overview (user&apos;s guide)</font></li>
</ul></li>
</ul>
</html>"));
    end Version_2_1;

    class Version_2_0 "Version 2.0 (Jan. 26, 2014)"
      extends Modelica.Icons.ReleaseNotes;
      annotation (
        Documentation(info = "<html>
<p><ul>
<li><font style=\"color: #333333; \">Renamed classes</font></li>
<li>Conditional inputs to blocks</li>
<li>Removed Mixed package</li>
<li>Rebuilt steady states</li>
<li><font style=\"color: #333333; \">New icons and examples</font></li>
</ul></p>
</html>"));
    end Version_2_0;

    class Version_1_2 "Version 1.2 (Jan 15, 2014)"
      extends Modelica.Icons.ReleaseNotes;
      annotation (
        Documentation(info = "<html>
<p><ul>
<li><font style=\"color: #333333; \">Package structure Physiolibrary.{domain}.[Examples|Components|Sources|Interfaces].{component}</font></li>
<li><font style=\"color: #333333; \">New icons</font></li>
<li><font style=\"color: #333333; \">Thermal: Relative heat energy to normal body temperature (37degC)</font></li>
<li><font style=\"color: #333333; \">New examples: Guyton-Coleman-Granger cardiovascular model, Coleman thermal energy transfers</font></li>
</ul></p>
</html>"));
    end Version_1_2;

    class Version_1_1 "Version 1.1 (Dec. 30, 2013)"
      extends Modelica.Icons.ReleaseNotes;
      annotation (
        Documentation(info = "<html>
<p><ul>
<li><font style=\"color: #333333; \">Heat connector compatibility between Thermal package and Modelica.Thermal.HeatTransfer package (MSL 3.2)</font></li>
<li><font style=\"color: #333333; \">Some English language corrections</font></li>
<li><font style=\"color: #333333; \">Hydrostatic pressure patch</font></li>
<li><font style=\"color: #333333; \">New examples</font></li>
</ul></p>
</html>"));
    end Version_1_1;

    class Version_1_0 "Version 1.0.0 (Dec. 09, 2013)"
      extends Modelica.Icons.ReleaseNotes;
      annotation (
        Documentation(info = "<html>
<p><ul>
<li>migration to GITHub https://github.com/MarekMatejak/Physiolibrary from http://patf-biokyb.lf1.cuni.cz/repos/Modelica/Physiolibrary svn repository, commit 4947 </li>
<li><font style=\"color: #333333; \">The library uses the Modelica Standard Library (MSL) version 3.2.</font></li>
<li><font style=\"color: #333333; \">Contains nice physiological icons.</font></li>
<li><font style=\"color: #333333; \">Support for physiological units: min,kcal,mmHg,ml,mEq,..</font></li>
<li><font style=\"color: #333333; \">Base blocks for chemical, hydraulical, osmotic, thermal or mixed domains</font></li>
<li><font style=\"color: #333333; \">Support of equilibrated systems</font></li>
<li><font style=\"color: #333333; \">Support for expandable inputs/outputs/tests lists</font></li>
</ul></p>
</html>"));
    end Version_1_0;
    annotation (
      Documentation(info = "<html>
<p>This section summarizes the changes that have been performed on the Physiolibrary. </p>
</html>"));
  end ReleaseNotes;

  class Contact "Contact"
    extends Modelica.Icons.Contact;
    annotation (
      Documentation(info = "<html>
<p>Marek Matej&aacute;k</p>
<p>email: marek@matfy.cz</p>
<p>skype: marek.matejak</p>
<p>tel: +420 776 301 395</p>
</html>"));
  end Contact;

  class License "BSD 3-Clause License"
    extends Modelica.Icons.Information;
    annotation (
      Documentation(info = "<html>
<p>All files in this directory (Physiolibrary) and in all subdirectories, especially all files that build package &quot;Physiolibrary&quot; are licensed by Marek Matejak under the <a href=\"http://opensource.org/licenses/BSD-3-Clause\">BSD 3-Clause License</a> (with exception of files &quot;Resources/*&quot;). </p>
<p><b>Licensor:</b></p>
<p>Marek Matej&aacute;k,</p>
<p>Hviezdoslavova 632/41,</p>
<p>916 01 Star&aacute; Tur&aacute;, </p>
<p>Slovak Republic,</p>
<p>email: marek@matfyz.cz</p>
<p><b><span style=\"color: #008000;\">Organization: </span></b></p>
<p>General University Hospital in Prague, U Nemocnice 499/2, 128 08 Prague 2, Czech Republic</p>
<p>Institute of Pathological Physiology, First Faculty of Medicine, Charles University in Prague,U Nemocnice 5, 128 53 Prague 2, Czech Republic</p>
<p><b>Copyright notices of the files:</b></p>
<p>Copyright (c) 2008-2022, Marek Matej&aacute;k, Charles University in Prague, General University Hospital in Prague</p>
<p><br>All rights reserved. </p>
<p>Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met: </p>
<p>1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer. </p>
<p>2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution. </p>
<p>3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission. </p>
<p>THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS &quot;AS IS&quot; AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.</p>
</html>"));
  end License;

  class NewRelease "Publishing new release"
    extends Modelica.Icons.Information;
    annotation (
      Documentation(info = "<html>
<p><br>New release must be numbered by Semantic Versioning 2.0.0, see <a href=\"http://semver.org/\">semver.org</a>. </p>
<p><br>If minor version, then the conversion script must be written and connected with package Physiolibrary using &quot;annotation(conversion(from(version=..)))&quot;! </p>
<p><br>To clean the code from dummy annotations try to use script <a href=\"https://github.com/dietmarw/trimtrailingwhitespaces\">ttws</a>. </p>
<p>To check english spelling try to use <a href=\"https://github.com/vlajos/misspell_fixer\">missspell_fixer</a>.</p>
<p><br>Update version number to &quot;X.Y.Z&quot;: </p>
<ul>
<li>At package Physiolibrary annotation: (version=&quot;X.Y.Z&quot;) together with &quot;versionBuild&quot;, &quot;versionDate&quot; and &quot;dateModified&quot; attribute </li>
<li>At file &quot;./Physiolibrary/libraryinfo.mos&quot; </li>
</ul>
<p><br>Update release notes: </p>
<ul>
<li>At UsersGuide.ReleaseNotes</li>
<li>At file &quot;./README.md&quot;, together with update of &quot;Current release&quot; section.</li>
</ul>
<p><br>Publish release in GitHub: </p>
<ul>
<li>Prepare release in &quot;master&quot; branch</li>
<li>Install, Check, Test, Test, Test.. </li>
<li>Draft a new <a href=\"https://github.com/impact/impact/blob/master/resources/docs/modelica2015/paper/impact.md#impact-on-library-developers\">release from &quot;master&quot;</a> branch with number &quot;vX.Y.Z&quot; and with release notes. </li>
</ul>
</html>"));
  end NewRelease;
  annotation (
    DocumentationClass = true,
    Documentation(info = "<html>
<p>Package <b>Physiolibrary</b> is a modelica package for <b>Human Physiology</b> that is developed from <b>HumMod</b> modelica implementation, see <a href=\"http://patf-biokyb.lf1.cuni.cz/wiki/hummod/hummod\">http://hummod.org</a>. It provides constants, types, connectors, partial models and model components fitted for physiological models of human body. </p>
<p>This is a short <b>User&apos;s Guide</b> for the overall library. Some of the main sublibraries have their own User&apos;s Guides that can be accessed by the following links: </p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td valign=\"top\"><p><a href=\"modelica://Physiolibrary.Fluid\">Fluid</a></p></td>
<td valign=\"top\"><p>Library of hydraulic domain. For modeling of cardiovascular system.</p></td>
</tr>
<tr>
<td valign=\"top\"><p><a href=\"modelica://Physiolibrary.Thermal\">Thermal</a></p></td>
<td valign=\"top\"><p>Library of termoregulation support. As extension of Modelica.Thermal.HeatTransfer.</p></td>
</tr>
<tr>
<td valign=\"top\"><p><a href=\"modelica://Physiolibrary.Population\">Population</a></p></td>
<td valign=\"top\"><p>Library for population models such as predator-prey or cells population.</p></td>
</tr>
<tr>
<td valign=\"top\"><p><a href=\"modelica://Physiolibrary.Icons\">Icons</a></p></td>
<td valign=\"top\"><p>Icons</p></td>
</tr>
<tr>
<td valign=\"top\"><p><a href=\"modelica://Physiolibrary.Types\">Types</a></p></td>
<td valign=\"top\"><p>Physiological types. Physiological unit vs. SI units, nominals, inputs/outputs, typed constants.</p></td>
</tr>
<tr>
<td valign=\"top\"><p><a href=\"modelica://Physiolibrary.Blocks\">Blocks</a></p></td>
<td valign=\"top\"><p>Useful blocks, that are missing in package Modelica.Blocks (MSL 3.2), cubic interpolation curves, multiplication factors.</p></td>
</tr>
</table>
</html>"));
end UsersGuide;

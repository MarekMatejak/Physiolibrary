within ;
package Physiolibrary "System biology, integrative physiology and pathophysiology modelling library"
  package UsersGuide "User's Guide"
    extends Modelica.Icons.Information;

    class Overview "Overview of Physiolibrary"
        extends Modelica.Icons.Information;

       annotation (Documentation(info="<html>
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

   annotation (Documentation(info="<html>
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
<p><a href=\"Fluid.Interfaces\">Fluid.Interfaces</a> </p><p>FluidPort, FluidPort_a, FluidPort_b</p></td>
<td valign=\"top\"><p><img src=\"modelica://Physiolibrary/Resources/Images/UserGuide/FluidPorts.png\"/></p></td>
</tr>
<tr>
<td valign=\"top\"><p><b>thermal</b></p></td>
<td valign=\"top\"><p>temperature</p></td>
<td valign=\"top\"><p>heat flow rate</p></td>
<td valign=\"top\"></td>
<td valign=\"top\"><p><br><br><br><br><br><a href=\"modelica://Modelica.Thermal.HeatTransfer.Interfaces\">Modelica.Thermal.HeatTransfer.Interfaces</a> </p><p>HeatPort, HeatPort_a, HeatPort_b</p><p><a href=\"Thermal.Interfaces\">Thermal.Interfaces</a> </p><p>HeatPort, HeatPort_a, HeatPort_b</p></td>
<td valign=\"top\"><p><br><img src=\"modelica://Physiolibrary/Resources/Images/UserGuide/ThermalPorts.png\"/></p></td>
</tr>
<tr>
<td valign=\"top\"><p><b>population</b></p></td>
<td valign=\"top\"><p>the number</p><p>of population members</p></td>
<td valign=\"top\"><p>change </p><p>of the number of population members</p></td>
<td valign=\"top\"></td>
<td valign=\"top\"><p><br><br><br><br><br><a href=\"Population.Interfaces\">Population.Interfaces</a> </p><p>PopulationPort, PopulationPort_a, PopulationPort_b</p></td>
<td valign=\"top\"><p><img src=\"modelica://Physiolibrary/Resources/Images/UserGuide/PopulationPorts.png\"/></p></td>
</tr>
<tr>
<td valign=\"top\"><p><b>block</b></p><p>diagram</p></td>
<td valign=\"top\"><p>Real unit-typed variables</p></td>
<td valign=\"top\"></td>
<td valign=\"top\"></td>
<td valign=\"top\"><p><br><br><br><br><br><br><br><br><br><br><a href=\"Types.RealIO\">Types.RealIO</a> </p><p>EnergyInput, EnergyOutput, TimeInput, TimeOutput, MassInput, MassOutput, MassFlowRateInput, MassFlowRateOutput, HeightInput, HeightOutput, AccelerationInput, AccelerationOutput, PressureInput, PressureOutput, VolumeInput, VolumeOutput, VolumeFlowRateInput, VolumeFlowRateOutput, ConcentrationInput, ConcentrationOutput, OsmolarityInput, OsmolarityOutput, AmountOfSubstanceInput, AmountOfSubstanceOutput, MolarFlowRateInput, MolarFlowRateOutput, DiffusionPermeabilityInput, DiffusionPermeabilityOutput, HeatInput, HeatOutput, TemperatureInput, TemperatureOutput, HeatFlowRateInput, HeatFlowRateOutput, ThermalConductanceInput, ThermalConductanceOutput, ElectricCurrentInput, ElectricCurrentOutput, ElectricChargeInput, ElectricChargeOutput, ElectricPotentialInput, ElectricPotentialOutput, FractionInput, FractionOutput, FrequencyInput, FrequencyOutput, OsmoticPermeabilityInput, OsmoticPermeabilityOutput, HydraulicConductanceInput, HydraulicConductanceOutput, HydraulicComplianceInput, HydraulicComplianceOutput, HydraulicInertanceInput, HydraulicInertanceOutput, GasSolubilityInput, GasSolubilityOutput, DensityInput, SpecificEnergyInput, SpecificEnergyOutput, SpecificHeatCapacityInput, SpecificHeatCapacityOutput</p></td>
<td valign=\"top\"><p><img src=\"modelica://Physiolibrary/Resources/Images/UserGuide/Signals.png\"/></p></td>
</tr>
</table>
<p><br><br><br><br><br><br><br>In all domains, usually 2 connectors are defined. The variable declarations are <b>identical</b>, only the icons are different in order that it is easy to distinguish connectors of the same domain that are attached at the same component. </p>
</html>"));
  end Connectors;

  package ReleaseNotes "Release notes"
  class Version_3_0_0 "Version 3.0 (Nov. 26, 2020)"
    extends Modelica.Icons.ReleaseNotes;

     annotation (Documentation(info="<html>
<ul>
<li>using Chemical 1.4 instead of Physiolibrary.Chemical and Physiolibrary.Osmotic</li>
<li>support of Modelica.Fluid and Modelica.Media concept instead of Physiolibrary.Hydraulic</li>
<li>obsolete previous Physiolibrary steady state concept</li>
</ul>
</html>"));
  end Version_3_0_0;
    extends Modelica.Icons.ReleaseNotes;

  class Version_2_3_1 "Version 2.3.1 (Sep. 15, 2015)"
    extends Modelica.Icons.ReleaseNotes;

     annotation (Documentation(info="<html>
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

     annotation (Documentation(info="<html>
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

     annotation (Documentation(info="<html>
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

     annotation (Documentation(info="<html>
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

     annotation (Documentation(info="<html>
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

     annotation (Documentation(info="<html>
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

     annotation (Documentation(info="<html>
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

     annotation (Documentation(info="<html>
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

  annotation (Documentation(info="<html>
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
   annotation (Documentation(info="<html>
<p>This section summarizes the changes that have been performed on the Physiolibrary. </p>
</html>"));
  end ReleaseNotes;

  class Contact "Contact"
    extends Modelica.Icons.Contact;

   annotation (Documentation(info="<html>
<p>Marek Matej&aacute;k</p>
<p>email: marek@matfy.cz</p>
<p>skype: marek.matejak</p>
<p>tel: +420 776 301 395</p>
</html>"));

  end Contact;

  class License "BSD 3-Clause License"
       extends Modelica.Icons.Information;
      annotation (Documentation(info="<html>
<p>All files in this directory (Physiolibrary) and in all subdirectories, especially all files that build package &quot;Physiolibrary&quot; are licensed by Marek Matejak under the <a href=\"http://opensource.org/licenses/BSD-3-Clause\">BSD 3-Clause License</a> (with exception of files &quot;Resources/*&quot;). </p>
<p><b>Licensor:</b></p>
<p>Marek Matej&aacute;k,</p>
<p>Hviezdoslavova 632/41,</p>
<p>916 01 Star&aacute; Tur&aacute;, </p>
<p>Slovak Republic,</p>
<p>email: marek@matfyz.cz</p>
<p><b><span style=\"color: #008000;\">Organization: </span></b></p>
<p>Institute of Pathological Physiology, First Faculty of Medicine, Charles University in Prague,</p>
<p>U Nemocnice 5, 128 53 Prague 2, Czech Republic</p>
<p><b>Copyright notices of the files:</b></p>
<p>Copyright (c) 2008-2020, Marek Matej&aacute;k, Charles University in Prague</p>
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

   annotation (Documentation(info="<html>
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
  annotation (DocumentationClass=true, Documentation(info="<html>
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

 extends Modelica.Icons.Package;

  package Fluid "Physiological fluids with static and dynamic properties"
    extends Modelica.Icons.Package;
    package Components
      extends Modelica.Icons.Package;
      model Conductor "Hydraulic resistor, where conductance=1/resistance"
       extends Physiolibrary.Fluid.Interfaces.OnePort;

       extends Physiolibrary.Icons.HydraulicResistor;

        parameter Boolean useConductanceInput=false
          "=true, if external conductance value is used"
          annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="Conditional inputs"));

        parameter Physiolibrary.Types.HydraulicConductance Conductance=0
          "Hydraulic conductance if useConductanceInput=false"
          annotation (Dialog(enable=not useConductanceInput));

        Physiolibrary.Types.RealIO.HydraulicConductanceInput cond(start=
              Conductance)=c if useConductanceInput annotation (Placement(
              transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,60})));
    protected
         Physiolibrary.Types.HydraulicConductance c;
         constant Boolean GenerateConductanceConnection = true;

      equation

        if not useConductanceInput and GenerateConductanceConnection then
          c=Conductance;
        end if;

        volumeFlowRate = (c * (q_in.p  - q_out.p));

        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                  -100,-100},{100,100}}),
                         graphics={Text(
                extent={{-220,-40},{200,-80}},
                lineColor={127,0,0},
                fillColor={58,117,175},
                fillPattern=FillPattern.Solid,
                textString="%name")}),
          Documentation(revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
<p>All rights reserved. </p>
</html>",   info="<html>
<p>This hydraulic conductance (resistance) element contains two connector sides. No hydraulic medium volume is changing in this element during simulation. That means that sum of flow in both connector sides is zero. The flow through element is determined by <b>Ohm&apos;s law</b>. It is used conductance (=1/resistance) because it could be numerical zero better then infinity in resistance. </p>
</html>"));
      end Conductor;

      model Resistor
        extends Physiolibrary.Fluid.Components.Conductor(final Conductance=1/
              Resistance, final useConductanceInput=false, final GenerateConductanceConnection = false);
        parameter Physiolibrary.Types.HydraulicResistance Resistance=Modelica.Constants.inf
          "Hydraulic conductance if useConductanceInput=false"
          annotation (Dialog(enable=not useResistanceInput));

        parameter Boolean useResistanceInput=false
          "=true, if external resistance value is used"
          annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="Conditional inputs"));

        Physiolibrary.Types.RealIO.HydraulicResistanceInput resistance(start=
              Resistance)=1/c if useResistanceInput annotation (Placement(
              transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,60})));
      equation
        if not useResistanceInput then
          c=1/Resistance;
        end if;
      end Resistor;

      model ElasticVessel
        "Elastic compartment as chemical solution envelop"
        extends Physiolibrary.Icons.ElasticBalloon;

        extends Physiolibrary.Fluid.Interfaces.Accumulation(
          final pressure_start=p_initial);

         parameter Real Compliance(unit="m3/Pa")=1e+3
          "Compliance e.g. TidalVolume/TidalPressureGradient if useComplianceInput=false"
          annotation (Dialog(enable=not useComplianceInput));

      parameter Modelica.Units.SI.Volume ZeroPressureVolume=1e-11
        "Functional Residual Capacity. Maximal fluid volume, that does not generate pressure if useV0Input=false"
        annotation (Dialog(enable=not useV0Input));   //default = 1e-5 ml

      parameter Modelica.Units.SI.AbsolutePressure ExternalPressure=
          101325
        "External absolute pressure if useExternalPressureInput=false."
        annotation (Dialog(enable=not useExternalPressureInput));

      parameter Modelica.Units.SI.Volume ResidualVolume=1e-9
        "Residual volume. Or maximal fluid volume, which generate negative collapsing pressure in linear model"
        annotation (Dialog(tab="Advanced", group=
              "Pressure-Volume relationship"));

      Modelica.Units.SI.Volume excessVolume
        "Additional fluid volume, that generate pressure";

         parameter Boolean useV0Input = false
          "=true, if zero-pressure-fluid_volume input is used"
          annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="Conditional inputs"));

         Modelica.Blocks.Interfaces.RealInput
            zeroPressureVolume(unit="m3", displayUnit="l", start=
              ZeroPressureVolume)=zpv if useV0Input annotation (Placement(
              transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={-80,80}), iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-20,90})));
         parameter Boolean useComplianceInput = false
          "=true, if compliance input is used"
          annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="Conditional inputs"));

         Modelica.Blocks.Interfaces.RealInput
            compliance(unit="m3/Pa", start=
              Compliance)=c if useComplianceInput annotation (Placement(
              transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,80}), iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={20,90})));
         parameter Boolean useExternalPressureInput = false
          "=true, if external pressure input is used"
          annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="Conditional inputs"));


         Modelica.Blocks.Interfaces.RealInput
                externalPressure(unit="Pa", start=
              ExternalPressure)=ep if useExternalPressureInput annotation (
            Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={80,80}), iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={60,90})));

         Modelica.Blocks.Interfaces.RealOutput
                fluidVolume(unit="m3") = volume annotation (Placement(
              transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={116,-60}),iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={100,-80})));


         parameter Boolean useSigmoidCompliance = false "sigmoid compliance e.g. lungs"
           annotation(Evaluate=true, choices(checkBox=true),Dialog(tab="Advanced",group="Pressure-Volume relationship"));

      parameter Modelica.Units.SI.Volume VitalCapacity=0.00493
        "Relative volume capacity if useSigmoidCompliance" annotation (
          Dialog(
          enable=useSigmoidCompliance,
          tab="Advanced",
          group="Pressure-Volume relationship"));

      parameter Modelica.Units.SI.Volume BaseTidalVolume=0.000543
        "Base value of tidal volume" annotation (Dialog(
          enable=useSigmoidCompliance,
          tab="Advanced",
          group="Pressure-Volume relationship"));




    protected
         constant Boolean GenerateComplianceConnection = true;
      Modelica.Units.SI.Volume zpv;
      Modelica.Units.SI.Pressure ep;
         Real c(unit="m3/Pa");


      parameter Modelica.Units.SI.Volume BaseMeanVolume=
          ZeroPressureVolume + BaseTidalVolume/2
        "Point of equality with linear presentation such as (FunctionalResidualCapacity + TidalVolume/2)";
      Modelica.Units.SI.Pressure d_sigmoid=(BaseMeanVolume -
          ResidualVolume)*(VitalCapacity - (BaseMeanVolume -
          ResidualVolume))/(c*VitalCapacity);
      Modelica.Units.SI.Pressure c_sigmoid=(BaseMeanVolume -
          ZeroPressureVolume)/c + d_sigmoid*log((VitalCapacity/(
          BaseMeanVolume - ResidualVolume) - 1));

      Modelica.Units.SI.Pressure relative_pressure;

      /*parameter Modelica.Units.SI.Pressure d_sigmoid_initial= (BaseMeanVolume -
    ResidualVolume)*(VitalCapacity - (BaseMeanVolume -
    ResidualVolume))/(Compliance*VitalCapacity);
parameter Modelica.Units.SI.Pressure c_sigmoid_initial=(BaseMeanVolume -
    ZeroPressureVolume)/Compliance + d_sigmoid_initial*log((VitalCapacity/(
    BaseMeanVolume - ResidualVolume) - 1));*/
          parameter Modelica.Units.SI.Pressure p_initial = system.p_ambient; /*(if (not useSigmoidCompliance) then
    (if (volume_start > ResidualVolume)
    then (max( 0, volume_start - ZeroPressureVolume)/Compliance + ExternalPressure)
    else ((-ExternalPressure/log(Modelica.Constants.eps))*
       log(max(Modelica.Constants.eps, volume_start/ResidualVolume)) + ExternalPressure))
    else (-(d_sigmoid_initial)*log((VitalCapacity/(volume_start - ResidualVolume)) - 1) + (c_sigmoid_initial) + ExternalPressure));
*/
      equation

        //elastic compartment
        if not useV0Input then
          zpv=ZeroPressureVolume;
        end if;
        if not useComplianceInput and GenerateComplianceConnection then
          c=Compliance;
        end if;
        if not useExternalPressureInput then
          ep=ExternalPressure;
        end if;

        excessVolume = max( 0, volume - zpv);

        relative_pressure = pressure - ep;

        pressure = if (not useSigmoidCompliance) then smooth(0, if noEvent(volume >
          ResidualVolume) then (excessVolume/c + ep) else ((-ep/log(Modelica.Constants.eps))*log(max(Modelica.Constants.eps,
          volume/ResidualVolume)) + ep)) else (-d_sigmoid*log((VitalCapacity/(volume -
          ResidualVolume)) - 1) + c_sigmoid + ep);



       annotation (
          Icon(coordinateSystem(
                preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}), graphics={
                                   Text(
                extent={{-280,-104},{280,-142}},
                lineColor={127,0,0},
                fillColor={58,117,175},
                fillPattern=FillPattern.Solid,
                textString="%name")}),
          Documentation(revisions="<html>
<p>2020 by Marek Matejak, http://www.physiolib.com </p>
</html>",   info="<html>
<h4>amountOfSolution = &sum; amountOfSubstances</h4>
<h4>mass = &sum; massOfSubstances</h4>
<h4>volume = &sum; volumeOfSubstances</h4>
<h4>freeGibbsEnergy = &sum; freeGibbsEnergiesOfSubstances</h4>
<p>To calculate the sum of extensive substance's properties is misused the Modelica \"flow\" prefix even there are not real physical flows. </p>
</html>"));
      end ElasticVessel;

      model ElasticVesselElastance
        extends Physiolibrary.Fluid.Components.ElasticVessel(final Compliance=1
              /Elastance, final useComplianceInput=false, final GenerateComplianceConnection = false);
        parameter Physiolibrary.Types.HydraulicElastance Elastance=1
          "Elastance if useComplianceInput=false"
          annotation (Dialog(enable=not useComplianceInput));

        Types.RealIO.HydraulicElastanceInput
            elastance(start=Elastance)=1/c if useElastanceInput annotation (Placement(
              transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,80}), iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={20,90})));

        parameter Boolean useElastanceInput = false
          "=true, if elastance input is used"
          annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="Conditional inputs"));
      equation
        if not useElastanceInput then
          c=1/Elastance;
        end if;
      end ElasticVesselElastance;

      model HydrostaticColumn
        "Hydrostatic column pressure between two connectors (with specific muscle pump effect)"
        extends Physiolibrary.Icons.HydrostaticGradient;
        extends Interfaces.OnePort_UpDown;

        replaceable package Medium =
            Media.Water                                   constrainedby
        Media.Interfaces.PartialMedium
        "Medium model"   annotation (choicesAllMatching=true);

        outer Modelica.Fluid.System system "System wide properties";

        parameter Boolean useHeightInput = false "=true, if height input is used"
          annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="Conditional inputs"));
        parameter Physiolibrary.Types.Height H=0
          "Height of hydrostatic column if useHeightInput=false"
          annotation (Dialog(enable=not useHeightInput));

        Physiolibrary.Types.RealIO.HeightInput height(start=H)=h if
          useHeightInput "Vertical distance between top and bottom connector"
          annotation (Placement(transformation(extent={{-20,-20},{20,20}},
                origin={-110,0}), iconTransformation(extent={{-130,-20},{-90,20}})));
        parameter Boolean usePumpEffect = false
          "=true, if musce pump effect is used"
          annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="Conditional inputs"));
        Physiolibrary.Types.RealIO.FractionInput pumpEffect(start=PumpEffect)=
          pe if usePumpEffect annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,100})));
    protected
        parameter Physiolibrary.Types.Fraction PumpEffect=1
          "Pump effect if usePumpEffect=false"
          annotation (Dialog(enable=not usePumpEffect));
    protected
        Physiolibrary.Types.Fraction pe;
        Physiolibrary.Types.Height h;
      equation
        if not useHeightInput then
          h=H;
        end if;
        if not usePumpEffect then
          pe = PumpEffect;
       end if;

        q_down.p = q_up.p + system.g*density*h*pe;

       annotation (
          Documentation(revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>",   info="<html>
<p>The hydrostatic pressure is proportional to height of the column.&nbsp;</p>
</html>"), Icon(graphics={         Text(
                extent={{-210,-66},{210,-106}},
                lineColor={127,0,0},
                fillColor={58,117,175},
                fillPattern=FillPattern.Solid,
                textString="%name")}));
      end HydrostaticColumn;

      model Inertia "Inertia of the volumetric flow"
        extends Physiolibrary.Fluid.Interfaces.OnePort; //(q_in(m_flow(start=massFlow_start)));
        extends Physiolibrary.Icons.Inertance;
        parameter Physiolibrary.Types.MassFlowRate massFlow_start=0
          "Mass flow start value"
          annotation (Dialog(group="Initialization"));

        parameter Physiolibrary.Types.HydraulicInertance I "Inertance";
      initial equation
        q_in.m_flow = massFlow_start;
      equation
        I*der(q_in.m_flow) = (q_in.p - q_out.p);
        annotation (                Documentation(info="<html>
<p>Inertance I of the simple tube could be calculated as I=ro*l/A, where ro is fuid density, l is tube length and A is tube cross-section area.</p>
</html>",   revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>"), Icon(graphics={         Text(
                extent={{-212,-58},{208,-98}},
                lineColor={127,0,0},
                fillColor={58,117,175},
                fillPattern=FillPattern.Solid,
                textString="%name")}));
      end Inertia;

      model IdealValve
        extends Icons.IdealValve;
        extends Physiolibrary.Fluid.Interfaces.OnePort;
         Boolean open(start=true) "Switching state";
         Real passableVariable(start=0, final unit="1")
          "Auxiliary variable for actual position on the ideal diode characteristic";
        /*  = 0: knee point
      < 0: below knee point, diode locking
      > 0: above knee point, diode conducting */
        parameter Physiolibrary.Types.HydraulicConductance _Gon(
          final min=0,
          displayUnit="l/(mmHg.min)")=1.2501026264094e-02
          "Forward state-on conductance (open valve conductance)"
          annotation (Dialog(enable=not useLimitationInputs)); //= the same as resistance 1e-5 mmHg/(l/min)
        parameter Physiolibrary.Types.HydraulicConductance _Goff(
          final min=0,
          displayUnit="l/(mmHg.min)")=1.2501026264094e-12
          "Backward state-off conductance (closed valve conductance)"
          annotation (Dialog(enable=not useLimitationInputs)); //= 1e-5 (l/min)/mmHg
        parameter Physiolibrary.Types.Pressure Pknee(final min=0)=0
          "Forward threshold pressure";
        parameter Boolean useLimitationInputs = false
          "=true, if Gon and Goff are from inputs"
          annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="Conditional inputs"));
        Physiolibrary.Types.RealIO.HydraulicConductanceInput Gon(start=_Gon)=
          gon if useLimitationInputs
          "open valve conductance = infinity for ideal case" annotation (
            Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={-60,100})));
        Physiolibrary.Types.RealIO.HydraulicConductanceInput Goff(start=_Goff)=
          goff if useLimitationInputs
          "closed valve conductance = zero for ideal case" annotation (
            Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={60,100})));
    protected
        constant Boolean GenerateConductanceConnection = true;
        Physiolibrary.Types.HydraulicConductance gon;
        Physiolibrary.Types.HydraulicConductance goff;
        constant Physiolibrary.Types.Pressure unitPressure=1;
        constant Physiolibrary.Types.VolumeFlowRate unitFlow=1;

      equation

        if not useLimitationInputs and GenerateConductanceConnection then
          gon = _Gon;
          goff = _Goff;
        end if;
        open = passableVariable > Modelica.Constants.eps;
        dp = (passableVariable*unitFlow)*(if open then 1/gon else 1) + Pknee;
        volumeFlowRate = (passableVariable*unitPressure)*(if open then 1 else goff) + goff*Pknee;

        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}),
                               graphics={
              Text(
                extent={{-188,-100},{196,-130}},
                lineColor={127,0,0},
                fillPattern=FillPattern.Sphere,
                fillColor={255,85,85},
                textString="%name")}),
          Documentation(info="<html>
<p>Ideal Valve allows a volumetric flow in one direction in case of pressure gradient is greater. </p>
</html>",   revisions="<html>
</html>"));
      end IdealValve;

      model IdealValveResistance
        extends Physiolibrary.Fluid.Components.IdealValve(final _Gon=1/_Ron, final _Goff=1/_Roff,
        final useLimitationInputs=false, GenerateConductanceConnection = false);

        parameter Physiolibrary.Types.HydraulicResistance _Ron(displayUnit=
            "(mmHg.min)/l")=79.993432449
          "forward state resistance"
          annotation (Dialog(enable=not useResistanceInputs));
        parameter Physiolibrary.Types.HydraulicResistance _Roff=799934324490.0
          "Backward state-off resistance (closed valve resistance)"
          annotation (Dialog(enable=not useResistanceInputs));

        parameter Boolean useResistanceInputs = false
          "=true, if Ron and Roff are from inputs"
          annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="Conditional inputs"));

        Physiolibrary.Types.RealIO.HydraulicResistanceInput Ron(start=_Ron)=
          1/gon if useResistanceInputs
          "open valve resistancece = zero for ideal case" annotation (
            Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={-60,100})));
        Physiolibrary.Types.RealIO.HydraulicResistanceInput Roff(start=_Roff)=
          1/goff if useResistanceInputs
          "closed valve resistance = infinity for ideal case" annotation (
            Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={60,100})));
      equation
        if not useResistanceInputs then
          gon = 1/_Ron;
          goff = 1/_Roff;
        end if;
      end IdealValveResistance;

      model MassPump "Prescribed mass flow"
        extends Icons.Pump;
        extends Physiolibrary.Fluid.Interfaces.OnePort;
        extends Physiolibrary.Fluid.Interfaces.ConditionalMassFlow;
      equation
        massFlowRate = q;
       annotation (
          Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                  100,100}}), graphics={
              Text(
                extent={{-150,-90},{150,-50}},
                lineColor={127,0,0},
                textString="%name")}),         Documentation(revisions="<html>
<table>
<tr>
<td>Author:</td>
<td>Marek Matejak</td>
</tr>
<td>Web:</td>
<td>http://www.physiolib.com</td>
</tr>
<tr>
<td>Date of:</td>
<td>october 2017-2018</td>
</tr>
</table>
</html>",       info="<html>
<p><font style=\"font-size: 9pt; \">This element needs to be connected only to next hydraulic elements, which contain calculation of hydraulic pressure in connector. It is because equation contains only </font><b><font style=\"font-size: 9pt; \">hydraulic volume flow</font></b><font style=\"font-size: 9pt; \"> variable, which is set to value of input signal variable. </font></p>
</html>"));
      end MassPump;

      model VolumePump "Prescribed mass flow"
        extends Icons.Pump;
        extends Physiolibrary.Fluid.Interfaces.OnePort;
        extends Physiolibrary.Fluid.Interfaces.ConditionalVolumeFlow;
      equation
        volumeFlowRate = q;
       annotation (
          Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                  100,100}}), graphics={
              Text(
                extent={{-150,-90},{150,-50}},
                lineColor={127,0,0},
                textString="%name")}),         Documentation(revisions="<html>
<table>
<tr>
<td>Author:</td>
<td>Marek Matejak</td>
</tr>
<td>Web:</td>
<td>http://www.physiolib.com</td>
</tr>
<tr>
<td>Date of:</td>
<td>october 2017-2018</td>
</tr>
</table>
</html>",       info="<html>
<p><font style=\"font-size: 9pt; \">This element needs to be connected only to next hydraulic elements, which contain calculation of hydraulic pressure in connector. It is because equation contains only </font><b><font style=\"font-size: 9pt; \">hydraulic volume flow</font></b><font style=\"font-size: 9pt; \"> variable, which is set to value of input signal variable. </font></p>
</html>"));
      end VolumePump;

      model Reabsorption "Divide inflow to outflow and reabsorption"
        import Physiolibrary;
        extends Physiolibrary.Icons.Reabsorption;

        replaceable package Medium =
          Physiolibrary.Media.Water                     constrainedby
        Physiolibrary.Media.Interfaces.PartialMedium
        "Medium model"   annotation (choicesAllMatching=true);

        Physiolibrary.Fluid.Interfaces.FluidPort_a Inflow(redeclare package Medium =
                                                                                 Medium)
          annotation (Placement(transformation(extent={{-114,26},{-86,54}})));
        Physiolibrary.Fluid.Interfaces.FluidPort_b Outflow(redeclare package Medium =
                                                                                  Medium)
          annotation (Placement(transformation(extent={{86,26},{114,54}})));
        Physiolibrary.Fluid.Interfaces.FluidPort_b Reabsorption(redeclare package
          Medium =                                                                     Medium)
          annotation (Placement(transformation(extent={{-14,-114},{14,-86}})));
        Physiolibrary.Types.RealIO.FractionInput FractReab
          annotation (Placement(transformation(extent={{-100,-60},{-60,-20}})));
        parameter Boolean useExternalOutflowMin = false
          "=true, if minimal outflow is garanted"
          annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="Conditional inputs"));
        parameter Physiolibrary.Types.VolumeFlowRate OutflowMin=0
          "Minimal outflow if useExternalOutflowMin=false"
          annotation (Dialog(enable=not useExternalOutflowMin));

        Physiolibrary.Types.RealIO.VolumeFlowRateInput outflowMin(start=
              OutflowMin)=om if useExternalOutflowMin annotation (Placement(
              transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={40,80})));
    protected
         Physiolibrary.Types.VolumeFlowRate om;
         Physiolibrary.Types.Density density;
      equation
        if not useExternalOutflowMin then
          om = OutflowMin;
        end if;
        Inflow.p = Outflow.p;
        0 = Inflow.m_flow + Outflow.m_flow + Reabsorption.m_flow;
       // assert(Inflow.q>=-Modelica.Constants.eps,"Only one directional flow is supported!");
        Reabsorption.m_flow = -max(0,FractReab*(Inflow.m_flow-om*density));
        density = Medium.density(Medium.setState_phX(Inflow.p,inStream(Inflow.h_outflow),inStream(Inflow.Xi_outflow)));

      //Solve streams variable as in connection of all three connectors:
        0=Inflow.m_flow * Inflow.h_outflow
        + Outflow.m_flow * actualStream(Outflow.h_outflow)
        + Reabsorption.m_flow * actualStream(Reabsorption.h_outflow);
        0=Inflow.m_flow * actualStream(Inflow.h_outflow)
        + Outflow.m_flow * Outflow.h_outflow
        + Reabsorption.m_flow * actualStream(Reabsorption.h_outflow);
        0=Inflow.m_flow * actualStream(Inflow.h_outflow)
        + Outflow.m_flow * actualStream(Outflow.h_outflow)
        + Reabsorption.m_flow * Reabsorption.h_outflow;

        zeros(Inflow.Medium.nXi) =
         Inflow.m_flow * Inflow.Xi_outflow
        + Outflow.m_flow * actualStream(Outflow.Xi_outflow)
        + Reabsorption.m_flow * actualStream(Reabsorption.Xi_outflow);
        zeros(Outflow.Medium.nXi) =
         Inflow.m_flow * actualStream(Inflow.Xi_outflow)
        + Outflow.m_flow * Outflow.Xi_outflow
        + Reabsorption.m_flow * actualStream(Reabsorption.Xi_outflow);
        zeros(Reabsorption.Medium.nXi) =
         Inflow.m_flow * actualStream(Inflow.Xi_outflow)
        + Outflow.m_flow * actualStream(Outflow.Xi_outflow)
        + Reabsorption.m_flow * Reabsorption.Xi_outflow;

        zeros(Inflow.Medium.nC) =
         Inflow.m_flow * Inflow.C_outflow
        + Outflow.m_flow * actualStream(Outflow.C_outflow)
        + Reabsorption.m_flow * actualStream(Reabsorption.C_outflow);
        zeros(Outflow.Medium.nC) =
         Inflow.m_flow * actualStream(Inflow.C_outflow)
        + Outflow.m_flow * Outflow.C_outflow
        + Reabsorption.m_flow * actualStream(Reabsorption.C_outflow);
        zeros(Reabsorption.Medium.nC) =
         Inflow.m_flow * actualStream(Inflow.C_outflow)
        + Outflow.m_flow * actualStream(Outflow.C_outflow)
        + Reabsorption.m_flow * Reabsorption.C_outflow;

        annotation (Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},
                  {100,100}}),       graphics={Text(
                extent={{-100,130},{100,108}},
                lineColor={127,0,0},
                textString="%name")}),        Documentation(revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>",       info="<html>
<p><h4><font color=\"#008000\">Hydraulic Reabsorption</font></h4></p>
<p>If useOutflowMin=false then the next schema is used.</p>
<p><ul>
<li><img src=\"modelica://Physiolibrary/Resources/Images/UserGuide/HydraulicReabsorption.png\"/></li>
</ul></p>
<p><br/>If  useOutflowMin=true then the extended schema is used:</p>
<p><ul>
<li><img src=\"modelica://Physiolibrary/Resources/Images/UserGuide/HydraulicReabsorptionWithOutflowMin.png\"/></li>
</ul></p>
</html>"));
      end Reabsorption;

    annotation (Documentation(info="<html>
<p>Main components for physiological fluid modeling.</p>
</html>"));
    end Components;

    package Interfaces
      extends Modelica.Icons.InterfacesPackage;
      connector FluidPort = Modelica.Fluid.Interfaces.FluidPort (
          redeclare replaceable package Medium = Physiolibrary.Media.Water);
      connector FluidPort_a "Hydraulical inflow connector"
        extends FluidPort;
        annotation (defaultComponentName="port_a",
                    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics={Ellipse(
                extent={{-40,40},{40,-40}},
                lineColor={0,0,0},
                fillColor={127,0,0},
                fillPattern=FillPattern.Solid), Text(extent={{-150,110},{150,50}},
                  textString="%name")}),
             Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                  100,100}}), graphics={Ellipse(
                extent={{-100,100},{100,-100}},
                lineColor={127,0,0},
                fillColor={127,0,0},
                fillPattern=FillPattern.Solid,
                lineThickness=0.5),             Ellipse(
                extent={{-100,100},{100,-100}},
                lineColor={0,0,0},
                fillColor={127,0,0},
                fillPattern=FillPattern.Solid)}),
          Documentation(info="<html>
<p>
Connector with one flow signal of type Real.
</p>
</html>", revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, marek@matfyz.cz </p>
</html>"));
      end FluidPort_a;

      connector FluidPort_b "Hydraulical outflow connector"
        extends FluidPort;
        annotation (defaultComponentName="port_b",
                    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics={
              Ellipse(
                extent={{-40,40},{40,-40}},
                lineColor={0,0,0},
                fillColor={127,0,0},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{-30,30},{30,-30}},
                lineColor={127,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Text(extent={{-150,110},{150,50}}, textString="%name")}),
             Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                  100,100}}), graphics={
              Ellipse(
                extent={{-100,100},{100,-100}},
                lineColor={127,0,0},
                fillColor={127,0,0},
                fillPattern=FillPattern.Solid,
                lineThickness=0.5),
              Ellipse(
                extent={{-100,100},{100,-100}},
                lineColor={0,0,0},
                fillColor={127,0,0},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{-80,80},{80,-80}},
                lineColor={127,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}));
      end FluidPort_b;

      connector FluidPorts_a
        "Fluid connector with filled, large icon to be used for vectors of FluidPorts (vector dimensions must be added after dragging)"
      extends FluidPort;
      annotation (defaultComponentName="ports_a",
                  Diagram(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-50,-200},{50,200}},
            initialScale=0.2), graphics={
            Text(extent={{-75,130},{75,100}}, textString="%name"),
            Rectangle(
              extent={{25,-100},{-25,100}},
              lineColor={127,0,0}),
            Ellipse(
              extent={{-25,90},{25,40}},
              lineColor={0,0,0},
              fillColor={127,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-25,25},{25,-25}},
              lineColor={0,0,0},
              fillColor={127,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-25,-40},{25,-90}},
              lineColor={0,0,0},
              fillColor={127,0,0},
              fillPattern=FillPattern.Solid)}),
           Icon(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-50,-200},{50,200}},
            initialScale=0.2), graphics={
            Rectangle(
              extent={{50,-200},{-50,200}},
              lineColor={127,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
                lineThickness=0.5),
            Ellipse(
              extent={{-50,180},{50,80}},
              lineColor={0,0,0},
              fillColor={127,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-50,50},{50,-50}},
              lineColor={0,0,0},
              fillColor={127,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-50,-80},{50,-180}},
              lineColor={0,0,0},
              fillColor={127,0,0},
              fillPattern=FillPattern.Solid)}));
      end FluidPorts_a;

      partial model OnePort "Hydraulical OnePort"
        replaceable package Medium =
           Media.Water                                   constrainedby
        Media.Interfaces.PartialMedium
        "Medium model"   annotation (choicesAllMatching=true);


        outer Modelica.Fluid.System system "System wide properties";

        FluidPort_a q_in(redeclare package Medium = Medium) "Inflow"
          annotation (Placement(transformation(extent={{-114,-14},{-86,14}})));
        FluidPort_b q_out(redeclare package Medium = Medium) "Outflow"
          annotation (Placement(transformation(extent={{86,-14},{114,14}})));
         Physiolibrary.Types.MassFlowRate massFlowRate "Mass flow";

         Physiolibrary.Types.VolumeFlowRate volumeFlowRate "Volume flow";

         Physiolibrary.Types.Pressure dp "Pressure gradient";

         Modelica.Units.SI.Density density(start=Medium.density_pTX(
                  system.p_ambient,
                  system.T_ambient,
                  Medium.reference_X));                                                                                                     //, density_outflow;

         parameter Boolean EnthalpyNotUsed = false
          annotation(Evaluate=true, HideResult=true, choices(checkBox=true), Dialog(tab="Advanced", group="Performance"));
      equation
        q_in.m_flow + q_out.m_flow = 0;
        massFlowRate = q_in.m_flow;
        dp = q_in.p - q_out.p;


        q_in.Xi_outflow = inStream(q_out.Xi_outflow);
        q_in.C_outflow = inStream(q_out.C_outflow);


        q_out.Xi_outflow = inStream(q_in.Xi_outflow);
        q_out.C_outflow = inStream(q_in.C_outflow);

        volumeFlowRate*density  = massFlowRate;

        if
          ( EnthalpyNotUsed) then
          q_in.h_outflow = Medium.specificEnthalpy_pTX(system.p_ambient, system.T_ambient, Medium.reference_X);
          q_out.h_outflow = Medium.specificEnthalpy_pTX(system.p_ambient, system.T_ambient, Medium.reference_X);
          density = Medium.density_pTX(q_in.p, system.T_ambient, Medium.reference_X);
        else
          q_in.h_outflow = inStream(q_out.h_outflow);
          q_out.h_outflow = inStream(q_in.h_outflow);

          // medium density
          density = if (q_in.m_flow >= 0)  then
           Medium.density_phX(q_in.p, inStream(q_in.h_outflow), inStream(q_in.Xi_outflow))
          else
           Medium.density_phX(q_out.p, inStream(q_out.h_outflow), inStream(q_out.Xi_outflow));
        end if;
      end OnePort;

      partial model OnePort_UpDown "OnePort with different position of connectors"
       replaceable package Medium =
           Media.Water                                   constrainedby
        Media.Interfaces.PartialMedium
        "Medium model"   annotation (choicesAllMatching=true);
            //Physiolibrary.Chemical.Examples.Media.SimpleBodyFluid_C

        Physiolibrary.Fluid.Interfaces.FluidPort_a q_up(redeclare package Medium =
                     Medium) "Top site" annotation (Placement(transformation(
                extent={{86,26},{114,54}}), iconTransformation(extent={{86,26},
                  {114,54}})));
        Physiolibrary.Fluid.Interfaces.FluidPort_a q_down(redeclare package Medium =
                     Medium) "Bottom site" annotation (Placement(transformation(
                extent={{84,-56},{112,-28}}), iconTransformation(extent={{84,-56},
                  {112,-28}})));

         Physiolibrary.Types.MassFlowRate massFlowRate "Mass flow";

         Physiolibrary.Types.VolumeFlowRate volumeFlowRate "Volume flow";

         Physiolibrary.Types.Pressure dp "Pressure gradient";

      Modelica.Units.SI.Density density;
      equation
        q_up.m_flow + q_down.m_flow = 0;
        massFlowRate = q_up.m_flow;
        dp = q_up.p - q_down.p;

        q_up.h_outflow = inStream(q_down.h_outflow);
        q_up.Xi_outflow = inStream(q_down.Xi_outflow);
        q_up.C_outflow = inStream(q_down.C_outflow);

        q_down.h_outflow = inStream(q_up.h_outflow);
        q_down.Xi_outflow = inStream(q_up.Xi_outflow);
        q_down.C_outflow = inStream(q_up.C_outflow);

        volumeFlowRate*density  = massFlowRate;

         // medium density
        density = if (q_up.m_flow >=0)  then
         Medium.density(Medium.setState_phX(q_up.p, inStream(q_up.h_outflow), inStream(q_up.Xi_outflow)))
         else
         Medium.density(Medium.setState_phX(q_down.p, inStream(q_down.h_outflow), inStream(q_down.Xi_outflow)));

       annotation (
          Documentation(revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>",   info="<html>
      <p>One port for hydrostatic column.&nbsp;</p>
</html>"));
      end OnePort_UpDown;

      partial model ConditionalMassFlow
        "Input of solution mass flow vs. parametric solution mass flow"

        parameter Boolean useSolutionFlowInput = false
          "=true, if solution flow input is used instead of parameter SolutionFlow"
        annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="Conditional inputs"));

        parameter Physiolibrary.Types.MassFlowRate SolutionFlow=0
          "Mass flow of solution if useSolutionFlowInput=false" annotation (
            HideResult=not useSolutionFlowInput, Dialog(enable=not
                useSolutionFlowInput));

      Physiolibrary.Types.RealIO.MassFlowRateInput solutionFlow(start=
        SolutionFlow)=q if useSolutionFlowInput annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,40}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,70})));

      Physiolibrary.Types.MassFlowRate q "Current solution flow";
      equation
      if not useSolutionFlowInput then
        q = SolutionFlow;
      end if;

      end ConditionalMassFlow;

       partial model ConditionalVolumeFlow "Input of solution volume flow vs. parametric solution volume flow"

      parameter Boolean useSolutionFlowInput=false
        "=true, if solution flow input is used instead of parameter SolutionFlow"
        annotation (
        Evaluate=true,
        HideResult=true,
        choices(checkBox=true),
        Dialog(group="Conditional inputs"));

      parameter Physiolibrary.Types.VolumeFlowRate SolutionFlow=0
        "Mass flow of solution if useSolutionFlowInput=false" annotation (
          HideResult=not useSolutionFlowInput, Dialog(enable=not
              useSolutionFlowInput));

      Physiolibrary.Types.RealIO.VolumeFlowRateInput solutionFlow(start=
        SolutionFlow) =
                      q if useSolutionFlowInput annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,40}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,70})));

      Physiolibrary.Types.VolumeFlowRate q "Current solution flow";
       equation
      if not useSolutionFlowInput then
        q = SolutionFlow;
      end if;

       end ConditionalVolumeFlow;

      partial model Accumulation
        extends Physiolibrary.Fluid.Interfaces.CompositionSetup;

      /*  replaceable package Medium = Physiolibrary.Media.Water
    constrainedby Media.Interfaces.PartialMedium      "Medium model"
    annotation (choicesAllMatching=true);                                  //Chemical.Media.Water_Incompressible

  outer Modelica.Fluid.System system "System wide properties";
*/
        parameter Integer nPorts=0 "Number of hydraulic ports" annotation (
            Evaluate=true, Dialog(connectorSizing=true, group="Ports"));

        Interfaces.FluidPorts_a q_in[nPorts](redeclare package Medium = Medium)
          annotation (Placement(transformation(extent={{-10,-28},{10,28}}),
              iconTransformation(
              extent={{-7,-26},{7,26}},
              rotation=180,
              origin={-1,0})));

        parameter Boolean useSubstances=false
          "=true, if substance ports are used" annotation (
          Evaluate=true,
          HideResult=true,
          choices(checkBox=true),
          Dialog(group="Conditional inputs"));

        parameter Boolean onElectricGround=false
          "=true, if electric potencial is zero" annotation (
          Evaluate=true,
          choices(checkBox=true));
          //,Dialog(group="Conditional inputs"));

        Chemical.Interfaces.SubstancePorts_a substances[Medium.nS] if
                                           useSubstances
          annotation (Placement(transformation(extent={{-110,-40},{-90,40}}),
              iconTransformation(extent={{-110,-40},{-90,40}})));


        Medium.ChemicalSolution chemicalSolution(
           p=pressure, h=enthalpy/mass, X=if
                                            (not Medium.reducedX) then massFractions else cat(1,massFractions,{1-sum(massFractions)}), i=i, EnthalpyNotUsed=EnthalpyNotUsed) if
                useSubstances;

        parameter Boolean use_mass_start=false
          "Use mass_start, otherwise volume_start"
          annotation (Evaluate=true, choices(checkBox=true), Dialog(group="Initialization"));

        parameter Physiolibrary.Types.Volume volume_start=0.001
          "Total volume of solution start value"
          annotation (HideResult=use_mass_start, Dialog(enable=not use_mass_start, group="Initialization"));

        parameter Physiolibrary.Types.Mass mass_start(displayUnit="kg")=1
          "Total mass of solution start value"
          annotation (HideResult=not use_mass_start, Dialog(enable=use_mass_start, group="Initialization"));


      /*
  parameter Boolean use_mass_start=false
    "use mass_start, otherwise volume_start"
    annotation (Evaluate=true, choices(checkBox=true), Dialog(group="Initialization"));
  parameter Physiolibrary.Types.Volume volume_start=0.001
    "Total volume of solution start value"
    annotation (HideResult=use_mass_start, Dialog(enable=not use_mass_start, group="Initialization"));

  parameter Physiolibrary.Types.Mass mass_start(displayUnit="kg")=1
    "Total mass of solution start value"
    annotation (HideResult=not use_mass_start, Dialog(enable=use_mass_start, group="Initialization"));


  parameter Physiolibrary.Fluid.Interfaces.CompositionType compositionType=
      Physiolibrary.Fluid.Interfaces.CompositionType.MassFraction
    "type of used substances start values"
    annotation (Evaluate=true, Dialog(group="Initialization of medium composition"));

  parameter Modelica.Units.SI.MassFraction massFractions_start[:]=
   Medium.reference_X
    "Initial mass fractions of solutes. If size is nS-1 then last fraction is 1-sum(others). If size is nS then they are scaled to sum = 1."
    annotation (Dialog(enable=(compositionType == Physiolibrary.Fluid.Interfaces.CompositionType.MassFraction),
                                                                                     group="Initialization of medium composition"));

/*  parameter Modelica.Units.SI.Mass massPartition_start[Medium.nS]=
    Medium.reference_X
    "Initial masses of substances per sample [nS]"
    annotation (Dialog(enable=(compositionType == Physiolibrary.Fluid.Interfaces.CompositionType.MassPartition),
                                                                                  group="Initialization of medium composition"));
*/
      /*
  parameter Modelica.Units.SI.Concentration concentration_start[:]=
  ((Medium.reference_X ./ Medium.MMb) * Medium.density_pTX(pressure_start,temperature_start,Medium.reference_X))
    "Initial concentration of solutes base molecule. 
    Can be in size nS for all substances, nS-1 where last substance is calculated from other substances specific volumes, or nS-2 where nS-2-th substance is calculated from electroneutrality"
    annotation (Dialog(enable=(compositionType == Physiolibrary.Fluid.Interfaces.CompositionType.Concentration),
                                                                                  group="Initialization of medium composition"));
                                                                  //=ones(0)

/*  parameter Modelica.Units.SI.AmountOfSubstance amountPartition_start[Medium.nS]=Medium.reference_X
     ./ Medium.MMb
  "Initial amount of base molecules per sample [nS]"
    annotation (Dialog(enable=(compositionType == Physiolibrary.Fluid.Interfaces.CompositionType.AmountOfBaseMoleculePartition),
                                                                                                  group=
        "Initialization of medium composition"));*/



        parameter Boolean EnthalpyNotUsed=false annotation (
          Evaluate=true,
          HideResult=true,
          choices(checkBox=true),
          Dialog(tab="Advanced", group="Performance"));


        parameter Boolean useThermalPort = false "Is thermal port pressent?"
          annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="Conditional inputs"));


        Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort(T=Medium.temperature_phX(pressure,enthalpy/mass,massFractions),
            Q_flow=heatFromEnvironment) if useThermalPort annotation (Placement(
              transformation(extent={{-70,-90},{-50,-70}}), iconTransformation(
                extent={{-62,-104},{-58,-100}})));

    protected
        parameter Physiolibrary.Types.Mass tm_start(displayUnit="kg")=
          if use_mass_start then mass_start else
          volume_start*Medium.density_pTX(pressure_start,temperature_start,x_mass_start) "If both mass_start and volume_start are filled";

      /*
parameter Modelica.Units.SI.MassFraction x_mass_start[Medium.nS]=
    if (Medium.nS<2) then {1}
    elseif (u)
    then (
       if 
         (size(concentration_start,1)==Medium.nS-2) then 
       cat( 1,
          (concentration_start .* Medium.MMb[1:Medium.nS - 2])./
           Medium.density_pTC(
            pressure_start,
            temperature_start,
            concentration_start),
          { - concentration_start * (Medium.zb[1:Medium.nS - 2]) * Medium.MMb[Medium.nS - 1]/
           Medium.density_pTC(
            pressure_start,
            temperature_start,
            concentration_start),
            1  -
            (sum(concentration_start .* Medium.MMb[1:Medium.nS - 2])
            - (concentration_start * (Medium.zb[1:Medium.nS - 2])) * Medium.MMb[Medium.nS - 1])./
           Medium.density_pTC(
            pressure_start,
            temperature_start,
            concentration_start)})
       elseif (size(concentration_start,1)==Medium.nS-1) then 
         cat( 1,
          (concentration_start .* Medium.MMb[1:Medium.nS - 1])./
           Medium.density_pTC(
            pressure_start,
            temperature_start,
            concentration_start),
          { 1  -
            (sum(concentration_start .* Medium.MMb[1:Medium.nS - 1]))./
           Medium.density_pTC(
            pressure_start,
            temperature_start,
            concentration_start)})
       elseif (size(concentration_start,1)==Medium.nS) then 
         ((concentration_start .* Medium.MMb) ./ sum(concentration_start .* Medium.MMb))
           else ones(Medium.nS))
       elseif (compositionType == Physiolibrary.Fluid.Interfaces.CompositionType.Concentration) then (
         if 
           (size(massFractions_start,1)==Medium.nS-1) then 
         cat(
          1,
          massFractions_start,
          {1 - sum(massFractions_start)})
         elseif (size(massFractions_start,1)==Medium.nS) then 
           (massFractions_start ./ sum(massFractions_start))
         else ones(Medium.nS))
         else ones(Medium.nS)
  "Initial mass fractions of substances";
   /* if (compositionType == Physiolibrary.Fluid.Interfaces.CompositionType.MassFraction)
    then cat(
          1,
          massFractions_start,
          {1 - sum(massFractions_start)})*/
        /*  elseif (compositionType == Physiolibrary.Fluid.Interfaces.CompositionType.MassPartition)
    then (massPartition_start ./ sum(massPartition_start))*/

      //    else ((amountPartition_start .* Medium.MMb) ./ sum(amountPartition_start .* Medium.MMb))

        parameter Modelica.Units.SI.Mass m_start[Medium.nXi]=tm_start*x_mass_start[1:Medium.nXi];

        Modelica.Units.SI.ElectricCurrent i;

    public
        Physiolibrary.Types.HeatFlowRate heatFromEnvironment;

        Physiolibrary.Types.Pressure pressure;
        Physiolibrary.Types.Enthalpy enthalpy(start=tm_start*Medium.specificEnthalpy_pTX(pressure_start,temperature_start,x_mass_start));
        Physiolibrary.Types.Mass mass( start = tm_start);
        Physiolibrary.Types.Mass substanceMasses[Medium.nXi]( start = m_start);
        Physiolibrary.Types.MassFraction massFractions[Medium.nXi];
        Physiolibrary.Types.MassFraction xx_mass[nPorts,Medium.nXi] "Substance mass fraction per fluid port";



        Physiolibrary.Types.Volume volume;

        Physiolibrary.Types.Density density;

    protected
        Physiolibrary.Types.RealIO.SpecificEnthalpyOutput specificEnthalpies[Medium.nS];
        Physiolibrary.Types.RealIO.MassFlowRateOutput massFlows[Medium.nS];
        Physiolibrary.Types.RealIO.ElectricPotentialOutput v;


      initial equation
        assert(abs(1-sum(x_mass_start))<1e-5,"Sum of x_mass_start must be 1. (Composition initialization failed)");

        /* assert(
  not ((compositionType == Physiolibrary.Fluid.Interfaces.CompositionType.Concentration) and (size(concentration_start,1)==Medium.nS-2) and (Medium.nS<2) or 
  (Medium.zb[Medium.nS - 1]==0)), "Initial electroneutral concentration composition is not supported with this medium (try to use mass fractions)!");
*/
      /*  assert(
  not ((compositionType == Physiolibrary.Fluid.Interfaces.CompositionType.Concentration) and (size(concentration_start,1)>=Medium.nS-2)),
  "Initial concentration composition must have at least nS-2 values!");
*/

        if
          (Medium.reducedX) then
          mass = tm_start;
        end if;
        substanceMasses = m_start;
        if not EnthalpyNotUsed then
          enthalpy=tm_start*Medium.specificEnthalpy_pTX(pressure_start,temperature_start,x_mass_start);
        end if;
      equation
        if
          (onElectricGround) then
          v=0;
        else
          i=0;
        end if;

        if (not useThermalPort) then
          heatFromEnvironment = 0;
        end if;

        if useSubstances then
          connect(substances,chemicalSolution.substances);
          connect(chemicalSolution.massFlows,massFlows);
          connect(chemicalSolution.actualStreamSpecificEnthalpies,specificEnthalpies);
          connect(v,chemicalSolution.v);
        else
          massFlows = zeros(Medium.nS);
          specificEnthalpies = zeros(Medium.nS); // not used
          if
            (not onElectricGround) then //both electric variables set to zero
             v=0;
          else
             i=0;
          end if;
        end if;

        der(substanceMasses) =
            q_in.m_flow * xx_mass
         +  massFlows[1:Medium.nXi];

        if
          (Medium.reducedX) then
             der(mass) = ones(nPorts) * q_in.m_flow  + massFlows*ones(Medium.nS);
        else mass = sum(substanceMasses);
        end if;

        massFractions = substanceMasses ./ mass;

       if EnthalpyNotUsed then
         enthalpy = mass*Medium.specificEnthalpy_pTX(system.p_ambient, system.T_ambient, Medium.reference_X);
       else
        der(enthalpy) =
            q_in.m_flow * actualStream(q_in.h_outflow)
         +  massFlows*specificEnthalpies
         +  heatFromEnvironment;
       end if;

         volume = mass/density;

         if EnthalpyNotUsed then
            density = Medium.density_pTX(pressure,temperature_start,massFractions);
         else
            density = Medium.density_phX(pressure,enthalpy/mass,massFractions);
         end if;


         for i in 1:nPorts loop
           xx_mass[i,:] = actualStream(q_in[i].Xi_outflow);
           q_in[i].p = pressure;
           q_in[i].h_outflow = enthalpy/mass;
           q_in[i].Xi_outflow = massFractions;
         end for;




        annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
              coordinateSystem(preserveAspectRatio=false)));
      end Accumulation;

      partial model PartialAbsoluteSensor
        "Partial component to model a sensor that measures a potential variable"

        replaceable package Medium=Physiolibrary.Media.Water constrainedby
        Physiolibrary.Media.Interfaces.PartialMedium
          "Medium in the sensor"
          annotation(choicesAllMatching=true);

        FluidPort_a port(redeclare package Medium=Medium, m_flow(min=0))
          annotation (Placement(transformation(
              origin={0,-100},
              extent={{-10,-10},{10,10}},
              rotation=90)));

      equation
        port.m_flow = 0;
        port.h_outflow = Medium.h_default;
        port.Xi_outflow = Medium.X_default[1:Medium.nXi];
        port.C_outflow = zeros(Medium.nC);
        annotation (Documentation(info="<html>
<p>
Partial component to model an <strong>absolute sensor</strong>. Can be used for pressure sensor models.
Use for other properties such as temperature or density is discouraged, because the enthalpy at the connector can have different meanings, depending on the connection topology. Use <code>PartialFlowSensor</code> instead.
as signal.
</p>
</html>"));
      end PartialAbsoluteSensor;

      partial model CompositionSetup "Initial substances composition setup"

        replaceable package Medium = Physiolibrary.Media.Water
          constrainedby Media.Interfaces.PartialMedium      "Medium model"
          annotation (choicesAllMatching=true);                                  //Chemical.Media.Water_Incompressible

        outer Modelica.Fluid.System system "System wide properties";



        parameter Boolean use_concentration_start=false
          "* Use concentration_start, otherwise massFraction_start"
          annotation (Evaluate=true, choices(checkBox=true), Dialog(group="Initialization of medium composition"));

        parameter Modelica.Units.SI.MassFraction massFractions_start[:]=
         Medium.reference_X
          "* Masses of all base molecules. If size is nS-1 then last value is 1-sum(others). If size is nS then all values are scaled to sum==1."
          annotation (Dialog(enable=not use_concentration_start, group="Initialization of medium composition"));


        parameter Modelica.Units.SI.Concentration concentration_start[:]=
        ((Medium.reference_X ./ Medium.MMb) * Medium.density_pTX(pressure_start,temperature_start,Medium.reference_X))
          "* Amounts of all base molecules. If size is nS then mass fractions are scaled all base substance masses to sum=1 (this is not a good idea for non-gaseous solutions). If size is nS-1 then last substance is calculated from other specific volumes. If size is nS-2 then last but one substance is calculated from electroneutrality and last substance from specific volumes."
          annotation (Dialog(enable=use_concentration_start, group="Initialization of medium composition"));

        parameter Modelica.Units.SI.Temperature temperature_start=system.T_ambient
          "Initial temperature"
          annotation (Dialog(group="Initialization"));


        parameter Modelica.Units.SI.Pressure pressure_start=system.p_ambient
          "Initial pressure"
          annotation (Dialog(group="Initialization"));



    protected
        parameter Modelica.Units.SI.MassFraction x_mass_start[Medium.nS]=
          if (Medium.nS<2) then {1}
          elseif (use_concentration_start)
          then (
             if (size(concentration_start,1)==Medium.nS-2) then
             cat( 1,
                (concentration_start .* Medium.MMb[1:Medium.nS - 2])./
                 Medium.density_pTC(
                  pressure_start,
                  temperature_start,
                  concentration_start),
                { - concentration_start * (Medium.zb[1:Medium.nS - 2]) * Medium.MMb[Medium.nS - 1]/
                 Medium.density_pTC(
                  pressure_start,
                  temperature_start,
                  concentration_start),
                  1  -
                  (sum(concentration_start .* Medium.MMb[1:Medium.nS - 2])
                  - (concentration_start * (Medium.zb[1:Medium.nS - 2])) * Medium.MMb[Medium.nS - 1])./
                 Medium.density_pTC(
                  pressure_start,
                  temperature_start,
                  concentration_start)})
             elseif (size(concentration_start,1)==Medium.nS-1) then
               cat( 1,
                (concentration_start .* Medium.MMb[1:Medium.nS - 1])./
                 Medium.density_pTC(
                  pressure_start,
                  temperature_start,
                  concentration_start),
                { 1  -
                  (sum(concentration_start .* Medium.MMb[1:Medium.nS - 1]))./
                 Medium.density_pTC(
                  pressure_start,
                  temperature_start,
                  concentration_start)})
             elseif (size(concentration_start,1)==Medium.nS) then
               ((concentration_start .* Medium.MMb) ./ sum(concentration_start .* Medium.MMb))
                 else ones(Medium.nS))
             else (
               if
                 (size(massFractions_start,1)==Medium.nS-1) then
               cat(
                1,
                massFractions_start,
                {1 - sum(massFractions_start)})
               elseif (size(massFractions_start,1)==Medium.nS) then
                 (massFractions_start ./ sum(massFractions_start))
               else ones(Medium.nS))
        "Initial mass fractions of substances";

        annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
              coordinateSystem(preserveAspectRatio=false)));
      end CompositionSetup;
    end Interfaces;

     package Sensors
       extends Modelica.Icons.SensorsPackage;
       model FlowMeasure "Volumetric flow between ports"
      extends Physiolibrary.Fluid.Interfaces.OnePort;
        // extends Icons.FlowMeasure;
      extends Modelica.Icons.RoundSensor;

      Physiolibrary.Types.RealIO.MassFlowRateOutput massFlow
        "Actual mass flow rate" annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,-60}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,120})));

      Physiolibrary.Types.VolumeFlowRate volumeInflowRate;
      Physiolibrary.Types.VolumeFlowRate volumeOutflowRate;

    protected
      Medium.ThermodynamicState state_inflow
        "state for medium inflowing through q_in";
      Medium.ThermodynamicState state_outflow
        "state for medium outflowing through q_out";

      Modelica.Units.SI.Density density_inflow;
      Modelica.Units.SI.Density density_outflow;
       equation

      q_out.p = q_in.p;
      massFlow = q_in.m_flow;

      // medium states
      state_inflow = Medium.setState_phX(
               q_in.p,
               inStream(q_in.h_outflow),
               inStream(q_in.Xi_outflow));
      state_outflow = Medium.setState_phX(
               q_out.p,
               inStream(q_out.h_outflow),
               inStream(q_out.Xi_outflow));

      density_inflow = Medium.density(state_inflow);
      density_outflow = Medium.density(state_outflow);

      volumeInflowRate = massFlow/density_inflow;
      volumeOutflowRate = massFlow/density_outflow;
      annotation (Documentation(revisions=
                            "<html>
	<p><i>2009-2018</i></p>
	<p>Marek Matejak, marek@matfyz.cz </p>
	</html>"),       Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}),
           graphics={
        Text( extent={{-25,-11},{34,-70}},
              lineColor={0,0,0},
              textString="V'")}));
       end FlowMeasure;

       model PressureMeasure "Hydraulic pressure at port"
         extends Physiolibrary.Icons.PressureMeasure;

         replaceable package Medium =
             Media.Water                                   constrainedby
        Media.Interfaces.PartialMedium
             "Medium model"
             annotation (choicesAllMatching=true);

         outer Modelica.Fluid.System system "System wide properties";

         parameter Boolean GetAbsolutePressure = false "if false then output pressure is relative to ambient pressure"
            annotation(Evaluate=true, choices(checkBox=true));

         Physiolibrary.Fluid.Interfaces.FluidPort_a q_in(redeclare package Medium =
            Medium)
        annotation (Placement(transformation(extent={{-60,-80},{-20,-40}})));
         Physiolibrary.Types.RealIO.PressureOutput pressure "Pressure"
        annotation (Placement(transformation(extent={{40,-60},{80,-20}})));

       equation

         pressure = q_in.p - (if GetAbsolutePressure then 0 else system.p_ambient);
         q_in.m_flow = 0;

         q_in.h_outflow = 0;
         q_in.Xi_outflow = zeros(Medium.nXi);
         q_in.C_outflow = zeros(Medium.nC);

        annotation (Documentation(revisions=
                            "<html>
        <p><i>2009-2018</i></p>
        <p>Marek Matejak, marek@matfyz.cz </p>
        </html>"));
       end PressureMeasure;

       model MassFractions "Ideal one port mass fraction sensor"
         extends Physiolibrary.Fluid.Interfaces.PartialAbsoluteSensor(
          redeclare replaceable package Medium = Media.Water);
         extends Modelica.Icons.RoundSensor;
         parameter String substanceName="CO2" "Name of mass fraction";

         Modelica.Blocks.Interfaces.RealOutput Xi "Mass fraction in port medium"
        annotation (Placement(transformation(extent={{100,-10},{120,10}})));


    protected
         parameter Integer ind(fixed=false)
        "Index of species in vector of independent mass fractions";
         Medium.MassFraction XiVec[Medium.nS]
        "Mass fraction vector, needed because indexed argument for the operator inStream is not supported";

       initial algorithm
         ind := -1;
         for i in 1:Medium.nS loop
            if (Modelica.Utilities.Strings.isEqual(Medium.substanceNames[i],
                substanceName)) then
                    ind := i;
            end if;
         end for;
         assert(ind > 0, "Mass fraction '" + substanceName +
        "' is not present in medium '"
         + Medium.mediumName + "'.\n"
         + "Check sensor parameter and medium model.");
       equation

         XiVec[1:Medium.nXi] = inStream(port.Xi_outflow);
         if (Medium.reducedX) then
           XiVec[Medium.nX] = 1 - sum(XiVec[1:Medium.nXi]);
         end if;
         Xi = XiVec[ind];

       annotation (defaultComponentName="massFraction",
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}), graphics={
        Line(points={{0,-70},{0,-100}}, color={0,0,127}),
        Text(extent={{-150,72},{150,112}},textString="%name",lineColor={
                  162,29,33}),
        Text(extent={{160,-30},{60,-60}},textString="Xi"),
        Line(points={{70,0},{100,0}}, color={0,0,127})}),
        Documentation(info=
                     "<html>
        <p>
        This component monitors the mass fraction contained in the fluid passing its port.
        The sensor is ideal, i.e., it does not influence the fluid.
        </p>
        </html>",       revisions="<html>
        <ul>
        <li>2011-12-14: Stefan Wischhusen: Initial Release.</li>
        </ul>
        </html>"));
       end MassFractions;
     /*
	  model MolarConcentrations "Ideal one port molarity sensor"
	    extends Modelica.Fluid.Sensors.BaseClasses.PartialAbsoluteSensor(redeclare
		package Medium = Physiolibrary.Media.SimpleWater);
	    extends Modelica.Icons.RotationalSensor;
	    parameter String substanceName = "CO2" "Name of substance";

	    Types.RealIO.ConcentrationOutput c "Molar concentration in port medium"
	      annotation (Placement(transformation(extent={{100,-10},{120,10}})));

	  protected
	    parameter Integer ind(fixed=false)
	      "Index of species in vector of independent mass fractions";
	    Types.Concentration cVec[Medium.nCS]
	      "Concentration vector, needed because indexed argument for the operator inStream is not supported";
	    Medium.ThermodynamicState state = Medium.setState_phX(port.p,inStream(port.h_outflow));

	  initial algorithm
	    ind:= -1;
	    for i in 1:Medium.nXi loop
	      if ( Modelica.Utilities.Strings.isEqual(Medium.substanceNames[i], substanceName)) then
		ind := i;
	      end if;
	    end for;
	    assert(ind > 0, "Mass fraction '" + substanceName + "' is not present in medium '"
		   + Medium.mediumName + "'.\n"
		   + "Check sensor parameter and medium model.");
	  equation
	    cVec = Medium.concentration(state,inStream(port.Xi_outflow),inStream(port.C_outflow));
	    c = cVec[ind];
	  annotation (defaultComponentName="massFraction",
	    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
		      100}}), graphics={
		  Line(points={{0,-70},{0,-100}}, color={0,0,127}),
		  Text(
		    extent={{-150,80},{150,120}},
		    textString="%name",
		    lineColor={0,0,255}),
		  Text(
		    extent={{160,-30},{60,-60}},
		    textString="Xi"),
		  Line(points={{70,0},{100,0}}, color={0,0,127})}),
	    Documentation(info="<html>
	<p>
	This component monitors the mass fraction contained in the fluid passing its port.
	The sensor is ideal, i.e., it does not influence the fluid.
	</p>
	</html>",   revisions="<html>
	<ul>
	<li>2011-12-14: Stefan Wischhusen: Initial Release.</li>
	</ul>
	</html>"));
	end MolarConcentrations;
	*/
       model PartialPressure
         "Measure of partial pressure of the substance"
         extends Modelica.Icons.RoundSensor;
         extends Chemical.Interfaces.PartialSubstance;

         replaceable package Medium = Physiolibrary.Media.Water
           constrainedby Media.Interfaces.PartialMedium      "Medium model"
           annotation (choicesAllMatching=true);

         Physiolibrary.Types.RealIO.PressureOutput partialPressure
        "Partial pressure of the substance in gaseous solution"
          annotation (
             Placement(transformation(
               extent={{-20,-20},{20,20}},
               rotation=270,
               origin={0,-60}), iconTransformation(
               extent={{-20,-20},{20,20}},
               origin={-100,0},
             rotation=180)));

         Interfaces.FluidPort_a referenceFluidPort(redeclare package Medium =
               Medium)
           annotation (Placement(transformation(extent={{-10,-108},{10,-88}})));

    protected
         Medium.ThermodynamicState state;
       equation

         partialPressure = x*state.p;

         state = Medium.setState_phX(referenceFluidPort.p,inStream(referenceFluidPort.h_outflow),inStream(referenceFluidPort.Xi_outflow));

         //aliases
         temperature = state.T;
         pressure = state.p;
         electricPotential = 0; //not used
         moleFractionBasedIonicStrength = 0; //not used

         //sensor = zero flows
         port_a.q = 0;
         referenceFluidPort.m_flow = 0;
         referenceFluidPort.h_outflow = Medium.h_default;
         referenceFluidPort.Xi_outflow = Medium.reference_X[1:Medium.nXi];


        annotation (
           Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{
                 100,100}}),   graphics={
               Text(
                 extent={{-31,-3},{28,-62}},
                 lineColor={0,0,0},
               textString="p"),
               Line(
                 points={{70,0},{80,0}},
                 color={127,0,127}),
        Text(extent={{-150,72},{150,112}},textString="%name",lineColor={
                  162,29,33})}),
           Documentation(revisions="<html>
<p><i>2009-2015</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
       end PartialPressure;

       model Temperature "Temperature sensor"
         extends Physiolibrary.Fluid.Interfaces.PartialAbsoluteSensor(
          redeclare replaceable package Medium = Media.Water);
         extends Modelica.Icons.RoundSensor;

         Physiolibrary.Types.RealIO.TemperatureOutput T "Temperature"
        annotation (Placement(transformation(extent={{100,-10},{120,10}})));


       equation
          T = Medium.temperature_phX(port.p,inStream(port.h_outflow), inStream(port.Xi_outflow));

       annotation (defaultComponentName="temperature",
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}), graphics={
        Line(points={{0,-70},{0,-100}}, color={0,0,127}),
        Text(extent={{-150,80},{150,120}},                   lineColor={
                  162,29,33},
                 textString="%name"),
        Text(extent={{160,-30},{60,-60}},
                 textString="T",
                 textColor={0,0,0}),
        Line(points={{70,0},{100,0}}, color={0,0,127})}),
        Documentation(info=
                     "<html>
        <p>
        This component monitors the temperature contained in the fluid passing its port.
        The sensor is ideal, i.e., it does not influence the fluid.
        </p>
        </html>"));
       end Temperature;

       model pH "Measure of pH (acidity) of the solution"
         extends Modelica.Icons.RoundSensor;
         extends Chemical.Interfaces.PartialSubstance(final substanceData=
               if useHydronium then
                  Chemical.Substances.Hydronium_aqueous()
               else
                  Chemical.Substances.Proton_aqueous(),
               redeclare final package stateOfMatter =
            Chemical.Interfaces.Incompressible);

         replaceable package Medium = Physiolibrary.Media.Water
           constrainedby Media.Interfaces.PartialMedium      "Medium model"
           annotation (choicesAllMatching=true);

         Physiolibrary.Types.RealIO.pHOutput pH "Acidity of the solution" annotation (
             Placement(transformation(
               extent={{-20,-20},{20,20}},
               rotation=270,
               origin={0,-60}), iconTransformation(
               extent={{-20,-20},{20,20}},
               origin={-100,0},
               rotation=180)));

         parameter Boolean useHydronium=false "Measured substance is H3O+ instead of H+";
         Interfaces.FluidPort_a referenceFluidPort(redeclare package Medium =
               Medium)
           annotation (Placement(transformation(extent={{-10,-108},{10,-88}})));

    protected
         Medium.ThermodynamicState state;
       equation

         pH = -log10(a);

         state = Medium.setState_phX(referenceFluidPort.p,inStream(referenceFluidPort.h_outflow),inStream(referenceFluidPort.Xi_outflow));

         //aliases
         temperature = state.T;
         pressure = state.p;
         electricPotential = 0; //not used
         moleFractionBasedIonicStrength = 0; //not used

         //sensor = zero flows
         port_a.q = 0;
         referenceFluidPort.m_flow = 0;
         referenceFluidPort.h_outflow = Medium.h_default;
         referenceFluidPort.Xi_outflow = Medium.reference_X[1:Medium.nXi];

        annotation (
           Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{
                 100,100}}),   graphics={
               Text(
                 extent={{-31,-3},{28,-62}},
                 lineColor={0,0,0},
               textString="p"),
               Line(
                 points={{70,0},{80,0}},
                 color={127,0,127}),
        Text(extent={{-150,72},{150,112}},textString="%name",lineColor={
                  162,29,33})}),
           Documentation(revisions="<html>
<p><i>2009-2015</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
       end pH;

       model BloodGasesMeasurement
         extends Modelica.Icons.RoundSensor;

         outer Modelica.Fluid.System system;

         replaceable package Medium = Physiolibrary.Media.BloodBySiggaardAndersen
                                                        "Blood"
           annotation (choicesAllMatching=true);

         Physiolibrary.Fluid.Interfaces.FluidPort_a referenceFluidPort(redeclare
          package
             Medium = Medium)
           annotation (Placement(transformation(extent={{-10,-108},{10,-88}})));

         Physiolibrary.Fluid.Sensors.PartialPressure pO2_measure(
           redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
           substanceData=Chemical.Substances.Oxygen_gas(),
           redeclare package Medium = Medium)
           annotation (Placement(transformation(extent={{50,50},{30,70}})));
         Physiolibrary.Fluid.Sensors.pH pH_measure(redeclare package Medium =
               Medium)
           annotation (Placement(transformation(extent={{-24,-70},{-44,-50}})));
         Physiolibrary.Fluid.Sensors.PartialPressure pCO2_measure(
           redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
           substanceData=Chemical.Substances.CarbonDioxide_gas(),
           redeclare package Medium = Medium)
           annotation (Placement(transformation(extent={{12,-10},{-8,10}})));
         Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasureSystemicCapillaries(
             redeclare package Medium = Medium)
           annotation (Placement(transformation(
               extent={{-10,-10},{10,10}},
               rotation=0,
               origin={78,-76})));
         Chemical.Interfaces.SubstancePort_a CO2
           annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
         Chemical.Interfaces.SubstancePort_a H_plus "H+"
           annotation (Placement(transformation(extent={{-110,-70},{-90,-50}})));
         Chemical.Interfaces.SubstancePort_a O2
           annotation (Placement(transformation(extent={{-110,50},{-90,70}})));
         Physiolibrary.Types.RealIO.PressureOutput pressure annotation (Placement(
               transformation(extent={{98,-110},{118,-90}}), iconTransformation(extent={{98,-110},
                   {118,-90}})));
         Physiolibrary.Types.RealIO.pHOutput pH
           annotation (Placement(transformation(extent={{98,-70},{118,-50}})));
         Physiolibrary.Types.RealIO.PressureOutput pO2
           annotation (Placement(transformation(extent={{98,50},{118,70}})));
         Physiolibrary.Types.RealIO.PressureOutput pCO2
           annotation (Placement(transformation(extent={{98,-10},{118,10}})));
       equation

         connect(pressureMeasureSystemicCapillaries.q_in, referenceFluidPort) annotation (
             Line(
             points={{74,-82},{74,-90},{40,-90},{40,-84},{0,-84},{0,-98}},
             color={127,0,0},
             thickness=0.5));
         connect(pCO2_measure.referenceFluidPort, referenceFluidPort) annotation (Line(
             points={{2,-9.8},{2,-84},{0,-84},{0,-98}},
             color={127,0,0},
             thickness=0.5));
         connect(pH_measure.referenceFluidPort, referenceFluidPort) annotation (Line(
             points={{-34,-69.8},{-34,-82},{0,-82},{0,-98}},
             color={127,0,0},
             thickness=0.5));
         connect(pO2_measure.referenceFluidPort, referenceFluidPort) annotation (Line(
             points={{40,50.2},{40,-84},{0,-84},{0,-98}},
             color={127,0,0},
             thickness=0.5));
         connect(pCO2_measure.port_a, CO2)
           annotation (Line(points={{-8,0},{-100,0}}, color={158,66,200}));
         connect(H_plus, pH_measure.port_a)
           annotation (Line(points={{-100,-60},{-44,-60}}, color={158,66,200}));
         connect(pO2_measure.port_a, O2)
           annotation (Line(points={{30,60},{-100,60}}, color={158,66,200}));
         connect(pressureMeasureSystemicCapillaries.pressure, pressure) annotation (Line(
               points={{84,-80},{96,-80},{96,-100},{108,-100}}, color={0,0,127}));
         connect(pO2_measure.partialPressure, pO2)
           annotation (Line(points={{50,60},{108,60}}, color={0,0,127}));
         connect(pCO2_measure.partialPressure, pCO2)
           annotation (Line(points={{12,0},{108,0}}, color={0,0,127}));
         connect(pH_measure.pH, pH)
           annotation (Line(points={{-24,-60},{108,-60}}, color={0,0,127}));
         annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Text(extent={{-150,80},{150,120}},textString="%name",lineColor={
                  162,29,33})}),                                        Diagram(
               coordinateSystem(preserveAspectRatio=false)));
       end BloodGasesMeasurement;
     end Sensors;

     package Sources
       extends Modelica.Icons.SourcesPackage;
       model MassInflowSource "Prescribed mass flow rate at port with unlimited mass"
         extends Physiolibrary.Fluid.Interfaces.ConditionalMassFlow;

         replaceable package Medium =
               Media.Water
           "Medium model"   annotation (choicesAllMatching=true);

         outer Modelica.Fluid.System system "System wide properties";



         parameter Modelica.Units.SI.MassFraction substances[Medium.nS-1]=Medium.X_default[
          1:Medium.nS-1] "Mass fractions of substances in medium";

         Physiolibrary.Fluid.Interfaces.FluidPort_b q_out(redeclare package Medium =
            Medium)
        annotation (Placement(transformation(extent={{86,-14},{114,14}})));

         parameter Types.Temperature T=system.T_ambient "Fluid temperature";

    protected
         parameter Types.Pressure P=system.p_ambient "Fluid pressure";

         parameter Modelica.Units.SI.MassFraction X[Medium.nS]=cat(1,substances,{1-sum(substances)});
         parameter Modelica.Units.SI.SpecificEnthalpy h=
          Medium.specificEnthalpy(Medium.setState_pTX(
                 P,
                 T,
                 X)) "Fluid enthalphy";
       equation
         q_out.m_flow = -q;

         q_out.h_outflow = h;
         q_out.Xi_outflow = X[1:Medium.nXi];
         q_out.C_outflow = zeros(Medium.nC);
        annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={
        Rectangle(extent={{-100,-50},{100,50}},lineColor={0,0,0},fillColor={255,
              255,255},fillPattern=FillPattern.Solid),
        Polygon(points={{-80,25},{80,0},{-80,-25},{-80,25}},lineColor={0,0,0},
              fillColor={0,0,0},fillPattern=FillPattern.Solid),
        Text(extent={{-150,-94},{150,-54}},textString="%name",lineColor={0,0,
              255})}), Documentation(revisions =          "<html>
        <table>
        <tr>
        <td>Author:</td>
        <td>Marek Matejak</td>
        </tr>
        <tr>
        <td>By:</td>
        <td>marek@matfyz.cz</td>
        </tr>
        <tr>
        <td>Date of:</td>
        <td>january 2009-2018</td>
        </tr>
        </table>
        </html>",       info="<html>
        <p><font style=\"font-size: 9pt; \">This element needs to be connected only to next hydraulic elements, which contain calculation of hydraulic pressure in connector. It is because equation contains only </font><b><font style=\"font-size: 9pt; \">hydraulic volume flow</font></b><font style=\"font-size: 9pt; \"> variable, which is set to value of input signal variable. </font></p>
        </html>"));
       end MassInflowSource;

       model VolumeInflowSource "Prescribed volume flow rate at port with unlimited mass"
         extends Physiolibrary.Fluid.Interfaces.ConditionalVolumeFlow;

         replaceable package Medium =
               Media.Water
           "Medium model"   annotation (choicesAllMatching=true);

         outer Modelica.Fluid.System system "System wide properties";



         parameter Modelica.Units.SI.MassFraction substances[Medium.nS-1]=Medium.X_default[
          1:Medium.nS-1] "Mass fractions of substances in medium";

       /*  parameter Real C[Medium.nC]=Medium.C_default
 "Extra properties of fluid";
*/

         Physiolibrary.Fluid.Interfaces.FluidPort_b q_out(redeclare package Medium =
            Medium)
        annotation (Placement(transformation(extent={{86,-14},{114,14}})));


         parameter Types.Temperature T=system.T_ambient "Fluid temperature";
         parameter Types.Pressure P=system.p_ambient "Fluid pressure";

    protected
         parameter Modelica.Units.SI.MassFraction X[Medium.nS]=cat(1,substances,{1-sum(substances)});

         parameter Modelica.Units.SI.SpecificEnthalpy h=
          Medium.specificEnthalpy(Medium.setState_pTX(
                 P,
                 T,
                 X)) "Fluid enthalphy";

         Modelica.Units.SI.Density density;

       equation
         q_out.m_flow = -q*density;

         q_out.h_outflow = h;
         q_out.Xi_outflow = X[1:Medium.nXi];
         q_out.C_outflow = zeros(Medium.nC);
         density = Medium.density(Medium.setState_phX(
               P,
               inStream(q_out.h_outflow),
               inStream(q_out.Xi_outflow)));

         // medium density

        annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={
        Rectangle(extent={{-100,-50},{100,50}},lineColor={0,0,0},fillColor={255,
              255,255},fillPattern=FillPattern.Solid),
        Polygon(points={{-80,25},{80,0},{-80,-25},{-80,25}},lineColor={0,0,0},
              fillColor={0,0,0},fillPattern=FillPattern.Solid),
        Text(extent={{-150,-94},{150,-54}},textString="%name",lineColor={0,0,
              255})}), Documentation(revisions =          "<html>
        <table>
        <tr>
        <td>Author:</td>
        <td>Marek Matejak</td>
        </tr>
        <tr>
        <td>By:</td>
        <td>marek@matfyz.cz</td>
        </tr>
        <tr>
        <td>Date of:</td>
        <td>january 2009-2018</td>
        </tr>
        </table>
        </html>",       info="<html>
        <p><font style=\"font-size: 9pt; \">This element needs to be connected only to next hydraulic elements, which contain calculation of hydraulic pressure in connector. It is because equation contains only </font><b><font style=\"font-size: 9pt; \">hydraulic volume flow</font></b><font style=\"font-size: 9pt; \"> variable, which is set to value of input signal variable. </font></p>
        </html>"));
       end VolumeInflowSource;

       model PressureSource "Prescribed pressure at port with unlimited mass"
         parameter Modelica.Units.SI.Pressure pressure_start=system.p_ambient
           "Initial pressure"
           annotation (Dialog(enable=not usePressureInput,group="Initialization"));

         extends Physiolibrary.Fluid.Interfaces.CompositionSetup;
         /*
    replaceable package Medium =
        Physiolibrary.Media.Water                                   constrainedby 
    Physiolibrary.Media.Interfaces.PartialMedium
    "Medium model"   annotation (choicesAllMatching=true);

    outer Modelica.Fluid.System system "System wide properties";
*/
           parameter Boolean usePressureInput = false
           "=true, if pressure input is used"
             annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="Conditional inputs"));



        //   parameter Physiolibrary.Types.Pressure P=system.p_ambient
       //    "Hydraulic pressure if usePressureInput=false"
       //    annotation (Dialog(enable=not usePressureInput));

           Physiolibrary.Types.RealIO.PressureInput pressure(start=pressure_start)=p if
           usePressureInput "Pressure"
           annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));
           Physiolibrary.Fluid.Interfaces.FluidPort_a y(redeclare package Medium =
               Medium) "PressureFlow output connectors"
           annotation (Placement(transformation(extent={{84,-16},{116,16}})));

        //   parameter Types.Temperature T = system.T_ambient "Fluid temperature";

       //  parameter Modelica.Units.SI.MassFraction substances[Medium.nS-1]=Medium.reference_X[1:Medium.nS-1] "Mass fractions of substances in Medium";

       /*  parameter Physiolibrary.Fluid.Interfaces.CompositionType compositionType=
      Physiolibrary.Fluid.Interfaces.CompositionType.MassFraction
    "type of used substances start values"
    annotation (Evaluate=true, Dialog(group="Initialization of medium composition"));

  parameter Modelica.Units.SI.MassFraction massFractions_start[:]=
   Medium.reference_X
    "Initial mass fractions of solutes [nS-1]"
    annotation (Dialog(enable=(compositionType == Physiolibrary.Fluid.Interfaces.CompositionType.MassFraction),
                                                                                     group="Initialization of medium composition"));

/*  parameter Modelica.Units.SI.MassFraction massPartition_start[Medium.nS]=
    Medium.reference_X
    "Initial masses of substances per sample [nS]"
    annotation (Dialog(enable=(compositionType == Physiolibrary.Fluid.Interfaces.CompositionType.MassPartition),
                                                                                  group="Initialization of medium composition"));
*/
       /*  parameter Modelica.Units.SI.Concentration concentration_start[:]=
    ((Medium.reference_X ./ Medium.MMb) * Medium.density_pTX(pressure_start,temperature_start,Medium.reference_X))
    "Initial concentration of solutes base molecule [nS-2]"
    annotation (Dialog(enable=(compositionType == Physiolibrary.Fluid.Interfaces.CompositionType.Concentration),
                                                                                  group="Initialization of medium composition"));
/*
parameter Modelica.Units.SI.Molality amountPartition_start[Medium.nS]=Medium.reference_X
     ./ Medium.MMb
  "Initial amount of base molecules per sample [nS]"
    annotation (Dialog(enable=(compositionType == Physiolibrary.Fluid.Interfaces.CompositionType.AmountOfBaseMoleculePartition),
                                                                                                  group=
        "Initialization of medium composition"));
*/
       /*  parameter Modelica.Units.SI.Temperature temperature_start = T;
  parameter Modelica.Units.SI.Pressure pressure_start = P;

  parameter Modelica.Units.SI.MassFraction X[Medium.nS]=
      if (compositionType == Physiolibrary.Fluid.Interfaces.CompositionType.Concentration) and (Medium.nS<2)
    then 
      {1}
    elseif (compositionType == Physiolibrary.Fluid.Interfaces.CompositionType.Concentration)
    then (
       if 
         (size(concentration_start,1)==Medium.nS-2) then 
       cat( 1,
          (concentration_start .* Medium.MMb[1:Medium.nS - 2])./
           Medium.density_pTC(
            pressure_start,
            temperature_start,
            concentration_start),
          { - concentration_start * (Medium.zb[1:Medium.nS - 2]) * Medium.MMb[Medium.nS - 1]/
           Medium.density_pTC(
            pressure_start,
            temperature_start,
            concentration_start),
            1  -
            (sum(concentration_start .* Medium.MMb[1:Medium.nS - 2])
            - (concentration_start * (Medium.zb[1:Medium.nS - 2])) * Medium.MMb[Medium.nS - 1])./
           Medium.density_pTC(
            pressure_start,
            temperature_start,
            concentration_start)})
       elseif (size(concentration_start,1)==Medium.nS-1) then 
         cat( 1,
          (concentration_start .* Medium.MMb[1:Medium.nS - 1])./
           Medium.density_pTC(
            pressure_start,
            temperature_start,
            concentration_start),
          { 1  -
            (sum(concentration_start .* Medium.MMb[1:Medium.nS - 1]))./
           Medium.density_pTC(
            pressure_start,
            temperature_start,
            concentration_start)})
       else 
         ((concentration_start .* Medium.MMb) ./ sum(concentration_start .* Medium.MMb)))
       else (
         if 
           (size(massFractions_start,1)==Medium.nS-1) then 
         cat(
          1,
          massFractions_start,
          {1 - sum(massFractions_start)})
         else 
           (massFractions_start ./ sum(massFractions_start)))
  "Mass fractions of substances";


*/

    protected
          Physiolibrary.Types.Pressure p;
          Modelica.Units.SI.SpecificEnthalpy h=
          Medium.specificEnthalpy_pTX(
                 p,
                 temperature_start,
                 x_mass_start) "Fluid enthalphy";
       equation
           if not usePressureInput then
             p=pressure_start;
           end if;
           y.p = p;

           y.h_outflow = h;
           y.Xi_outflow = x_mass_start[1:Medium.nXi];
           y.C_outflow = zeros(Medium.nC);


           annotation (Documentation(info="<html>
        <p>Model has a vector of continuous Real input signals as pressures for vector of pressure-flow connectors. </p>
        <p>Usage in tests: Set defaul volume&gt;0 and try to set STEADY in instances to &quot;false&quot;!</p>
        </html>",         revisions=
              "<html>
        <p><i>2009-2018</i></p>
        <p>Marek Matejak, marek@matfyz.cz </p>
        </html>"),         Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}),
               graphics={
          Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          pattern=LinePattern.None,
          fillColor={170,255,255},
          fillPattern=FillPattern.Backward),
          Text(
            extent={{0,0},{-100,-100}},
            lineColor={0,0,0},
          textString="P"),
          Line(
            points={{-100,0},{56,0}},
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
            lineColor={0,0,255})}));
       end PressureSource;

       model MassOutflowSource "Prescribed flow at port with unlimited mass storage"
         extends Physiolibrary.Fluid.Interfaces.ConditionalMassFlow;

         replaceable package Medium =
             Media.Water                                   constrainedby
        Media.Interfaces.PartialMedium
           "Medium model"   annotation (choicesAllMatching=true);

         outer Modelica.Fluid.System system "System wide properties";

         Physiolibrary.Fluid.Interfaces.FluidPort_a q_in(redeclare package Medium =
            Medium) annotation (Placement(transformation(extent={{-114,-14},{-86,
                14}}), iconTransformation(extent={{-114,-14},{-86,14}})));

         parameter Modelica.Units.SI.MassFraction substances[Medium.nS-1]=Medium.X_default[
          1:Medium.nS-1] "Mass fractions of substances in medium";

         parameter Types.Temperature T=system.T_ambient "Fluid temperature";


    protected
         parameter Modelica.Units.SI.MassFraction X[Medium.nS]=cat(1,substances,{1-sum(substances)});

         parameter Types.Pressure P=system.p_ambient "Fluid pressure";

         parameter Modelica.Units.SI.SpecificEnthalpy h=
          Medium.specificEnthalpy(Medium.setState_pTX(
                 P,
                 T,
                 X)) "Fluid enthalphy";
       equation
         q_in.m_flow = q;

         q_in.h_outflow = h;
         q_in.Xi_outflow = X[1:Medium.nXi];
         q_in.C_outflow = zeros(Medium.nC);
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),
          graphics={
        Rectangle(extent={{-100,-50},{100,50}},lineColor={0,0,0},fillColor={255,
              255,255},fillPattern=FillPattern.Solid),
        Polygon(points={{-80,25},{80,0},{-80,-25},{-80,25}},lineColor={0,0,0},
              fillColor={0,0,0},fillPattern=FillPattern.Solid),
        Text(extent={{-150,-94},{150,-54}},textString="%name",lineColor={0,0,
              255})}), Documentation(revisions =          "<html>
        <table>
        <tr>
        <td>Author:</td>
        <td>Marek Matejak</td>
        </tr>
        <tr>
        <td>By:</td>
        <td>marek@matfyz.cz</td>
        </tr>
        <tr>
        <td>Date of:</td>
        <td>january 2009-2018</td>
        </tr>
        </table>
        </html>",       info="<html>
        <p><font style=\"font-size: 9pt; \">This element needs to be connected only to next hydraulic elements, which contain calculation of hydraulic pressure in connector. It is because equation contains only </font><b><font style=\"font-size: 9pt; \">hydraulic volume flow</font></b><font style=\"font-size: 9pt; \"> variable, which is set to value of input signal variable. </font></p>
        </html>"));
       end MassOutflowSource;

       model VolumeOutflowSource "Prescribed flow at port with unlimited mass storage"
         extends Physiolibrary.Fluid.Interfaces.ConditionalVolumeFlow;

         replaceable package Medium =
             Media.Water                                   constrainedby
        Media.Interfaces.PartialMedium
           "Medium model"   annotation (choicesAllMatching=true);

         outer Modelica.Fluid.System system "System wide properties";

         Physiolibrary.Fluid.Interfaces.FluidPort_a q_in(redeclare package Medium =
            Medium) annotation (Placement(transformation(extent={{-114,-14},{-86,
                14}}), iconTransformation(extent={{-114,-14},{-86,14}})));


         parameter Modelica.Units.SI.MassFraction substances[Medium.nS-1]=Medium.X_default[
          1:Medium.nS-1] "Mass fractions of substances in medium";

         parameter Types.Temperature T=system.T_ambient "Fluid temperature";

         parameter Types.Pressure P=system.p_ambient "Fluid pressure";

    protected
         parameter Modelica.Units.SI.MassFraction X[Medium.nS]=cat(1,substances,{1-sum(substances)});

         parameter Modelica.Units.SI.SpecificEnthalpy h=
          Medium.specificEnthalpy(Medium.setState_pTX(
                 P,
                 T,
                 X)) "Fluid enthalphy";
         Modelica.Units.SI.Density density;
       equation
         q_in.m_flow = q*density;

         q_in.h_outflow = h;
         q_in.Xi_outflow = X[1:Medium.nXi];
         q_in.C_outflow = zeros(Medium.nC);

         // medium density
         density = Medium.density(Medium.setState_phX(
               P,
               inStream(q_in.h_outflow),
               inStream(q_in.Xi_outflow)));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),
          graphics={
        Rectangle(extent={{-100,-50},{100,50}},lineColor={0,0,0},fillColor={255,
              255,255},fillPattern=FillPattern.Solid),
        Polygon(points={{-80,25},{80,0},{-80,-25},{-80,25}},lineColor={0,0,0},
              fillColor={0,0,0},fillPattern=FillPattern.Solid),
        Text(extent={{-150,-94},{150,-54}},textString="%name",lineColor={0,0,
              255})}), Documentation(revisions =          "<html>
        <table>
        <tr>
        <td>Author:</td>
        <td>Marek Matejak</td>
        </tr>
        <tr>
        <td>By:</td>
        <td>marek@matfyz.cz</td>
        </tr>
        <tr>
        <td>Date of:</td>
        <td>january 2009-2018</td>
        </tr>
        </table>
        </html>",       info="<html>
        <p><font style=\"font-size: 9pt; \">This element needs to be connected only to next hydraulic elements, which contain calculation of hydraulic pressure in connector. It is because equation contains only </font><b><font style=\"font-size: 9pt; \">hydraulic volume flow</font></b><font style=\"font-size: 9pt; \"> variable, which is set to value of input signal variable. </font></p>
        </html>"));
       end VolumeOutflowSource;
     end Sources;

     package Examples
       "Examples that demonstrate usage of the Pressure flow components"
     extends Modelica.Icons.ExamplesPackage;

       model MinimalCirculation "Minimal circulation models driven by cardiac output"
      extends Modelica.Icons.Example;

      Physiolibrary.Fluid.Components.MassPump heart(useSolutionFlowInput=
            true)
        annotation (Placement(transformation(extent={{-20,60},{0,80}})));
       Physiolibrary.Fluid.Components.ElasticVessel arteries(
        volume_start(displayUnit="l") = 0.001,
        nPorts=3,
        Compliance(displayUnit="ml/mmHg") = 1.1625954425608e-08,
        ZeroPressureVolume(displayUnit="ml") = 0.00085)
        annotation (Placement(transformation(extent={{54,40},{78,62}})));

       Physiolibrary.Fluid.Components.ElasticVessel veins(
        volume_start(displayUnit="l") = 0.0032,
        nPorts=2,
        ZeroPressureVolume(displayUnit="ml") = 0.00295,
        Compliance(displayUnit="ml/mmHg") = 6.1880080007267e-07)
        annotation (Placement(transformation(extent={{-58,40},{-38,60}})));

      Modelica.Blocks.Sources.Pulse pulse(
        width=25,
        period=60/75,
        amplitude=3.3e-1)
        annotation (Placement(transformation(extent={{-94,74},{-74,94}})));
      Sensors.PressureMeasure pressureMeasure
        annotation (Placement(transformation(extent={{82,68},{102,88}})));
      Sensors.FlowMeasure flowMeasure
        annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
        rotation=180,
        origin={22,32})));
      Components.Conductor resistance(Conductance=6.2755151845753e-09)
        annotation (Placement(transformation(extent={{-18,22},{2,42}})));
       equation
      connect(
          pulse.y, heart.solutionFlow) annotation (Line(points={{-73,84},{-10,
              84},{-10,77}}, color={0,0,127}));
      connect(
          veins.q_in[1], heart.q_in) annotation (Line(
          points={{-48.1,51.3},{-46,51.3},{-46,70},{-20,70}},
          color={127,0,0},
          thickness=0.5));
      connect(
          pressureMeasure.q_in, arteries.q_in[1]) annotation (Line(
          points={{88,72},{88,52.9067},{65.88,52.9067}},
          color={127,0,0},
          thickness=0.5));
      connect(
          resistance.q_in, veins.q_in[2]) annotation (Line(
          points={{-18,32},{-32,32},{-32,48.7},{-48.1,48.7}},
          color={127,0,0},
          thickness=0.5));
      connect(
          heart.q_out, arteries.q_in[2]) annotation (Line(
          points={{0,70},{65.88,70},{65.88,51}},
          color={127,0,0},
          thickness=0.5));
      connect(
          resistance.q_out, flowMeasure.q_out) annotation (Line(
          points={{2,32},{12,32}},
          color={127,0,0},
          thickness=0.5));
      connect(
          flowMeasure.q_in, arteries.q_in[3]) annotation (Line(
          points={{32,32},{38,32},{38,49.0933},{65.88,49.0933}},
          color={127,0,0},
          thickness=0.5));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={Text(
              extent={{-54,98},{66,88}},
              lineColor={175,175,175},
              textString="Minimal circulation driven by cardiac output")}),
        Documentation(revisions=
                              "<html>
	<p><i>2014-2018</i></p>
	<p>Marek Matejak, marek@matfyz.cz </p>
	</html>"),experiment(StopTime=10));
       end MinimalCirculation;

       model Windkessel_2element "Two-element Windkessel model"
      extends Modelica.Icons.Example;
       Physiolibrary.Fluid.Components.ElasticVessel arteries(
        ZeroPressureVolume(displayUnit="ml") = 0.00085,
        volume_start(displayUnit="l") = 0.97e-3,
        nPorts=3,
        Compliance(displayUnit="ml/mmHg") = 1.0500862061839e-08)
        annotation (Placement(transformation(extent={{-12,38},{8,58}})));

      Physiolibrary.Fluid.Components.Conductor resistance(Conductance(
        displayUnit="ml/(mmHg.s)") = 8.1006650191331e-09) annotation (Placement(
            transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={18,34})));
      Utilities.Pulses pulses(QP(displayUnit="kg/s") =
         0.424, HR=1.2)
        annotation (Placement(transformation(extent={{-80,58},{-60,78}})));
      Sources.MassInflowSource unlimitedPump(useSolutionFlowInput=true)
        annotation (Placement(transformation(extent={{-48,38},{-28,58}})));
      Sources.PressureSource unlimitedVolume
        annotation (Placement(transformation(extent={{-56,0},{-36,20}})));
      Sensors.PressureMeasure pressureMeasure
        annotation (Placement(transformation(extent={{50,56},{70,76}})));
      Sensors.FlowMeasure flowMeasure
        annotation (Placement(
            transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-2,10})));
       equation
      connect(
          arteries.q_in[1], resistance.q_in) annotation (Line(
          points={{-2.1,49.7333},{18,49.7333},{18,44}},
          color={127,0,0},
          thickness=0.5));
      connect(
          pulses.massflowrate, unlimitedPump.solutionFlow) annotation (Line(
            points={{-61,68},{-38,68},{-38,55}}, color={0,0,127}));
      connect(
          unlimitedPump.q_out, arteries.q_in[2]) annotation (Line(
          points={{-28,48},{-16,48},{-16,48},{-2.1,48}},
          color={127,0,0},
          thickness=0.5));
      connect(
          arteries.q_in[3], pressureMeasure.q_in) annotation (Line(
          points={{-2.1,46.2667},{-2,46.2667},{-2,60},{56,60}},
          color={127,0,0},
          thickness=0.5));
      connect(
          resistance.q_out, flowMeasure.q_in) annotation (Line(
          points={{18,24},{18,10},{8,10}},
          color={127,0,0},
          thickness=0.5));
      connect(
          flowMeasure.q_out, unlimitedVolume.y) annotation (Line(
          points={{-12,10},{-36,10}},
          color={127,0,0},
          thickness=0.5));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={Text(
       extent={{-74,90},{46,80}},
       lineColor={175,175,175},
       textString="2-element Windkessel model")}),
        Documentation(revisions=
                            "<html>
	<ul>
	<li><i>Sep 2014</i> by Tomas Kulhanek:
	<br/>Updated pulse generator and diagram to conform electric analogy diagrams.
	</li>
	<li><i>May 2014 </i> by Marek Matejak:
	<br/>Created.
	</li>
	</ul>
	</html>",   info="<html>
	<p>Two-element windkessel model consisting of resistance and compliance element.</p>
	<ul>
	<li>Frank O (1899) Die Grundform des arteriellen Pulses. Z Biol 37:483&ndash;526</li>
	<li>Westerhof, N., Lankhaar, J.-W., &amp; Westerhof, B. E. (2009). The arterial Windkessel. <i>Medical &amp; Biological Engineering &amp; Computing</i>, <i>47</i>(2), 131&ndash;41. doi:10.1007/s11517-008-0359-2</li>
	<li><a href=\"http://en.wikipedia.org/wiki/Windkessel_effect\">http://en.wikipedia.org/wiki/Windkessel_effect</a></li>
	</ul>
	</html>"),experiment(StopTime=5));
       end Windkessel_2element;

       model Windkessel_3element "Three-element windkessel model"
      extends Modelica.Icons.Example;
      Physiolibrary.Fluid.Sources.MassInflowSource heart(
          useSolutionFlowInput=
       true) annotation (Placement(transformation(extent={{-50,38},{-30,58}})));
       Physiolibrary.Fluid.Components.ElasticVessel arteries(
        ZeroPressureVolume(displayUnit="l") = 0.00085,
        Compliance(displayUnit="ml/mmHg") = 1.0500862061839e-08,
        volume_start(displayUnit="l") = 0.97e-3,
        nPorts=3)
        annotation (Placement(transformation(extent={{16,38},{36,58}})));
      Physiolibrary.Fluid.Components.Conductor resistance(Conductance(
        displayUnit="ml/(mmHg.s)") = 8.1006650191331e-09) annotation (Placement(
            transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={50,34})));
      Physiolibrary.Fluid.Sources.PressureSource veins
        annotation (
          Placement(
        transformation(extent={{-10,-10},{10,10}}, origin={-40,20})));
      Utilities.Pulses pulses(
        QP(displayUnit="kg/s") = 0.424,
        TD1(displayUnit="s"),
        HR(displayUnit="1/min") = 1.2)
        annotation (Placement(transformation(extent={{-64,58},{-44,78}})));
      Physiolibrary.Fluid.Components.Conductor impedance(Conductance(
        displayUnit="ml/(mmHg.s)") = 1.5001231516913e-06) annotation (Placement(
            transformation(extent={{-10,-10},{10,10}}, origin={-6,50})));
      Sensors.PressureMeasure pressureMeasure
        annotation (Placement(transformation(extent={{58,66},{78,86}})));
      Sensors.FlowMeasure flowMeasure
        annotation (Placement(
            transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={12,20})));
       equation
      connect(
          pulses.massflowrate, heart.solutionFlow) annotation (Line(points={{-45,
              68},{-40,68},{-40,55}}, color={0,0,127}));
      connect(
          heart.q_out, impedance.q_in) annotation (Line(points={{-30,48},{-24,
              48},{-24,50},{-16,50}}, thickness=1));
      connect(
          impedance.q_out, arteries.q_in[1]) annotation (Line(
          points={{4,50},{16,50},{16,49.7333},{25.9,49.7333}},
          color={127,0,0},
          thickness=0.5));
      connect(
          arteries.q_in[2], resistance.q_in) annotation (Line(
          points={{25.9,48},{50,48},{50,44}},
          color={127,0,0},
          thickness=0.5));
      connect(
          resistance.q_out, flowMeasure.q_in) annotation (Line(
          points={{50,24},{50,20},{22,20}},
          color={127,0,0},
          thickness=0.5));
      connect(
          flowMeasure.q_out, veins.y) annotation (Line(
          points={{2,20},{-30,20}},
          color={127,0,0},
          thickness=0.5));
      connect(
          pressureMeasure.q_in, arteries.q_in[3]) annotation (Line(
          points={{64,70},{26,70},{26,46.2667},{25.9,46.2667}},
          color={127,0,0},
          thickness=0.5));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={Text(
       extent={{-74,90},{46,80}},
       lineColor={175,175,175},
       textString="3-element Windkessel model")}),
        Documentation(revisions=
                            "<html>
	<ul>
	<li><i>Sep 2014</i> by Tomas Kulhanek: <br>Created. </li>
	</ul>
	<p> </p>
	</html>",   info="<html>
	<p>Three-element windkessel model, updated two-element windkessel model with an impedance element. Impedance can be approximated by resistance.</p>
	<ul>
	<li>Westerhof N, Elzinga G (1991) Normalized input impedance and arterial decay time over heart period are independent of animal size. Am J Physiol 261:R126&ndash;R133</li>
	<li>Westerhof, N., Lankhaar, J.-W., &amp; Westerhof, B. E. (2009). The arterial Windkessel. <i>Medical &amp; Biological Engineering &amp; Computing</i>, <i>47</i>(2), 131&ndash;41. doi:10.1007/s11517-008-0359-2</li>
	</ul>
	</html>"),experiment(StopTime=5));
       end Windkessel_3element;

       model Windkessel_4element "Four-element windkessel model"
      extends Modelica.Icons.Example;
      Physiolibrary.Fluid.Sources.MassInflowSource heart(
          useSolutionFlowInput=
       true) annotation (Placement(transformation(extent={{-50,38},{-30,58}})));
       Physiolibrary.Fluid.Components.ElasticVessel arteries(
        volume_start(displayUnit="l") = 0.97e-3,
        nPorts=4,
        ZeroPressureVolume(displayUnit="ml") = 0.00085,
        Compliance(displayUnit="ml/mmHg") = 1.0500862061839e-8)
        annotation (Placement(transformation(extent={{16,38},{36,58}})));
      Physiolibrary.Fluid.Components.Conductor resistance(Conductance(
        displayUnit="ml/(mmHg.s)") = 8.1006650191331e-09) annotation (Placement(
            transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={48,34})));
      Physiolibrary.Fluid.Sources.PressureSource veins
        annotation (
          Placement(
        transformation(extent={{-10,-10},{10,10}}, origin={-40,20})));
      Utilities.Pulses pulses(QP(displayUnit="kg/s") =
         0.424, HR=1.2)
        annotation (Placement(transformation(extent={{-64,58},{-44,78}})));
      Physiolibrary.Fluid.Components.Conductor impedance(Conductance(
        displayUnit="ml/(mmHg.s)") = 1.5001231516913e-06) annotation (Placement(
            transformation(extent={{-10,-10},{10,10}}, origin={-6,48})));
      Physiolibrary.Fluid.Components.Inertia inertia(I(displayUnit=
              "mmHg.s2/g") =
             666.611937075, massFlow_start(displayUnit="kg/min")=
          0.083333333333333)
        annotation (Placement(transformation(extent={{-16,56},{4,76}})));
      Sensors.PressureMeasure pressureMeasure
        annotation (Placement(transformation(extent={{62,64},{82,84}})));
      Sensors.FlowMeasure flowMeasure
        annotation (Placement(
            transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={14,20})));
       equation
      connect(
          pulses.massflowrate, heart.solutionFlow) annotation (Line(points={{-45,
              68},{-40,68},{-40,55}}, color={0,0,127}));
      connect(
          heart.q_out, impedance.q_in)
        annotation (Line(points={{-30,48},{-16,48}}, thickness=1));
      connect(
          heart.q_out, inertia.q_in) annotation (Line(points={{-30,48},{-26,48},
              {-26,66},{-16,66}}, thickness=1));
      connect(
          inertia.q_out, arteries.q_in[1]) annotation (Line(
          points={{4,66},{16,66},{16,49.95},{25.9,49.95}},
          color={127,0,0},
          thickness=0.5));
      connect(
          impedance.q_out, arteries.q_in[2]) annotation (Line(
          points={{4,48},{16,48},{16,48.65},{25.9,48.65}},
          color={127,0,0},
          thickness=0.5));
      connect(
          arteries.q_in[3], resistance.q_in) annotation (Line(
          points={{25.9,47.35},{48,47.35},{48,44}},
          color={127,0,0},
          thickness=0.5));
      connect(
          pressureMeasure.q_in, arteries.q_in[4]) annotation (Line(
          points={{68,68},{25.9,68},{25.9,46.05}},
          color={127,0,0},
          thickness=0.5));
      connect(
          resistance.q_out, flowMeasure.q_in) annotation (Line(
          points={{48,24},{48,20},{24,20}},
          color={127,0,0},
          thickness=0.5));
      connect(
          flowMeasure.q_out, veins.y) annotation (Line(
          points={{4,20},{-30,20}},
          color={127,0,0},
          thickness=0.5));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={Text(
       extent={{-74,90},{46,80}},
       lineColor={175,175,175},
       textString="4-element Windkessel model")}),
        Documentation(revisions=
                            "<html>
	<ul>
	<li><i>Sep 2014</i> by Tomas Kulhanek: <br>Created. </li>
	</ul>
	</html>",   info="<html>
	<p>Four-element windkessel model, updated three-element windkessel model with an inertia element. </p>
	<ul>
	<li>Stergiopulos N, Westerhof BE, Westerhof N (1999) Total arterial inertance as the fourth element of the windkessel model. Am J Physiol 276:H81&ndash;H88</li>
	<li>Westerhof, N., Lankhaar, J.-W., &amp; Westerhof, B. E. (2009). The arterial Windkessel. <i>Medical &amp; Biological Engineering &amp; Computing</i>, <i>47</i>(2), 131&ndash;41. doi:10.1007/s11517-008-0359-2</li>
	</ul>
	</html>"),experiment(StopTime=5));
       end Windkessel_4element;

       model CardiovascularSystem_GCG "Cardiovascular part of Guyton-Coleman-Granger's model from 1972"
      extends Modelica.Icons.Example;
      import Hydraulic = Physiolibrary.Fluid;
       Hydraulic.Components.ElasticVessel pulmonaryVeinsAndLeftAtrium(
        volume_start=0.4e-3,
        nPorts=3,
        ZeroPressureVolume(displayUnit="ml") = 0.0004,
        Compliance(displayUnit="ml/mmHg") = 7.5006157584566e-8)
        annotation (Placement(transformation(extent={{4,74},{24,94}})));
       Hydraulic.Components.ElasticVessel pulmonaryArteries(
        volume_start=0.38e-3,
        nPorts=2,
        ZeroPressureVolume(displayUnit="ml") = 0.00030625,
        Compliance(displayUnit="ml/mmHg") = 3.6002955640592e-8)
        annotation (Placement(transformation(extent={{-62,74},{-42,94}})));
      Hydraulic.Components.Conductor pulmonary(Conductance(displayUnit=
              "l/(mmHg.min)") = 4.1665920538226e-08)
        annotation (Placement(transformation(extent={{-30,74},{-10,94}})));
       Hydraulic.Components.ElasticVessel arteries(
        volume_start=0.85e-3,
        nPorts=5,
        ZeroPressureVolume(displayUnit="ml") = 0.000495,
        Compliance(displayUnit="ml/mmHg") = 2.6627185942521e-8)
        annotation (Placement(transformation(extent={{14,-46},{34,-26}})));
       Hydraulic.Components.ElasticVessel veins(
        volume_start=3.25e-3,
        nPorts=4,
        ZeroPressureVolume(displayUnit="ml") = 0.00295,
        Compliance(displayUnit="ml/mmHg") = 6.1880080007267e-7)
        annotation (Placement(transformation(extent={{-64,-46},{-44,-26}})));
      Hydraulic.Components.Conductor nonMuscle(Conductance(displayUnit=
              "l/(mmHg.min)") = 3.5627924852669e-09)
        annotation (Placement(transformation(extent={{-24,-46},{-4,-26}})));
      Hydraulic.Sensors.PressureMeasure pressureMeasure
        annotation (Placement(transformation(extent={{-78,26},{-58,46}})));
      Hydraulic.Components.MassPump rightHeart(useSolutionFlowInput=true)
        annotation (Placement(transformation(extent={{-56,8},{-36,28}})));
      Physiolibrary.Types.Constants.MassFlowRateConst RNormalCO(k(
            displayUnit=
         "kg/min") = 0.083333333333333)
        annotation (Placement(transformation(extent={{-60,40},{-52,48}})));
      Hydraulic.Sensors.PressureMeasure pressureMeasure1
        annotation (Placement(transformation(extent={{-8,26},{12,46}})));
      Hydraulic.Components.MassPump leftHeart(useSolutionFlowInput=true)
        annotation (Placement(transformation(extent={{16,6},{36,26}})));
      Physiolibrary.Types.Constants.MassFlowRateConst LNormalCO(k(
            displayUnit=
         "kg/min") = 0.083333333333333)
        annotation (Placement(transformation(extent={{12,42},{20,50}})));
      Hydraulic.Components.Conductor kidney(Conductance(displayUnit=
              "l/(mmHg.min)") = 1.4126159678427e-09)
        annotation (Placement(transformation(extent={{-24,-64},{-4,-44}})));
      Hydraulic.Components.Conductor muscle(Conductance(displayUnit=
              "l/(mmHg.min)") = 1.3001067314658e-09)
        annotation (Placement(transformation(extent={{-24,-28},{-4,-8}})));
      Hydraulic.Components.Conductor largeVeins(Conductance(displayUnit=
              "l/(mmHg.min)") = 1.6888886482791e-07) annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-84,-8})));
       Hydraulic.Components.ElasticVessel rightAtrium(
        volume_start=0.1e-3,
        nPorts=3,
        ZeroPressureVolume(displayUnit="ml") = 0.0001,
        Compliance(displayUnit="ml/mmHg") = 3.7503078792283e-8)
        annotation (Placement(transformation(extent={{-82,8},{-62,28}})));
      Physiolibrary.Blocks.Factors.Spline rightStarling(data={{-6,0,0},{-3,
        0.15,0.104},{-1,0.52,0.48},{2,1.96,0.48},{4,2.42,0.123},{8,2.7,0}}, Xscale=
           101325/760)
        "At filling pressure 0mmHg (because external thorax pressure is -4mmHg) is normal cardiac output (effect=1)."
        annotation (Placement(transformation(extent={{-56,22},{-36,42}})));
      Physiolibrary.Blocks.Factors.Spline leftStarling(data={{-4,0,0},{-1,
        0.72,0.29},{0,1.01,0.29},{3,1.88,0.218333},{10,2.7,0}}, Xscale=
        101325/760)
        "At filling pressure -0.0029mmHg (because external thorax pressure is -4mmHg) is normal cardiac output (effect=1)."
        annotation (Placement(transformation(extent={{16,22},{36,42}})));
      inner Modelica.Fluid.System system
        annotation (Placement(transformation(extent={{68,62},{88,82}})));
      Hydraulic.Sensors.PressureMeasure MeanArterialPressure "MAP"
        annotation (Placement(transformation(extent={{74,-34},{94,-14}})));
       equation
      connect(
          RNormalCO.y, rightStarling.yBase) annotation (Line(points={{-51,44},{
              -46,44},{-46,34}}, color={0,0,127}));
      connect(
          LNormalCO.y, leftStarling.yBase)
        annotation (Line(points={{21,46},{26,46},{26,34}}, color={0,0,127}));
      connect(
          rightHeart.solutionFlow, rightStarling.y) annotation (Line(points={{-46,
              25},{-46,28},{-46,28}}, color={0,0,127}));
      connect(
          leftStarling.y, leftHeart.solutionFlow)
        annotation (Line(points={{26,28},{26,23}}, color={0,0,127}));
      connect(
          pressureMeasure.pressure, rightStarling.u)
        annotation (Line(points={{-62,32},{-54,32}}, color={0,0,127}));
      connect(
          pressureMeasure1.pressure, leftStarling.u)
        annotation (Line(points={{8,32},{18,32}}, color={0,0,127}));
      connect(
          rightHeart.q_out, pulmonaryArteries.q_in[1]) annotation (Line(
          points={{-36,18},{-30,18},{-30,60},{-82,60},{-82,85.3},{-52.1,85.3}},
          color={127,0,0},
          thickness=0.5));

      connect(
          pulmonary.q_in, pulmonaryArteries.q_in[2]) annotation (Line(
          points={{-30,84},{-42,84},{-42,82.7},{-52.1,82.7}},
          color={127,0,0},
          thickness=0.5));
      connect(
          pulmonary.q_out, pulmonaryVeinsAndLeftAtrium.q_in[1]) annotation (
          Line(
          points={{-10,84},{2,84},{2,85.7333},{13.9,85.7333}},
          color={127,0,0},
          thickness=0.5));
      connect(
          pulmonaryVeinsAndLeftAtrium.q_in[2], leftHeart.q_in) annotation (Line(
          points={{13.9,84},{36,84},{36,60},{-12,60},{-12,16},{16,16}},
          color={127,0,0},
          thickness=0.5));
      connect(
          pressureMeasure1.q_in, pulmonaryVeinsAndLeftAtrium.q_in[3])
        annotation (Line(
          points={{-2,30},{-12,30},{-12,60},{36,60},{36,84},{13.9,84},{13.9,82.2667}},
          color={127,0,0},
          thickness=0.5));
      connect(
          leftHeart.q_out, arteries.q_in[1]) annotation (Line(
          points={{36,16},{54,16},{54,-33.92},{23.9,-33.92}},
          color={127,0,0},
          thickness=0.5));
      connect(
          muscle.q_out, arteries.q_in[2]) annotation (Line(
          points={{-4,-18},{10,-18},{10,-34.96},{23.9,-34.96}},
          color={127,0,0},
          thickness=0.5));
      connect(
          nonMuscle.q_out, arteries.q_in[3]) annotation (Line(
          points={{-4,-36},{10,-36},{10,-36},{23.9,-36}},
          color={127,0,0},
          thickness=0.5));
      connect(
          kidney.q_out, arteries.q_in[4]) annotation (Line(
          points={{-4,-54},{10,-54},{10,-37.04},{23.9,-37.04}},
          color={127,0,0},
          thickness=0.5));
      connect(
          muscle.q_in, veins.q_in[1]) annotation (Line(
          points={{-24,-18},{-40,-18},{-40,-34.05},{-54.1,-34.05}},
          color={127,0,0},
          thickness=0.5));
      connect(
          nonMuscle.q_in, veins.q_in[2]) annotation (Line(
          points={{-24,-36},{-40,-36},{-40,-35.35},{-54.1,-35.35}},
          color={127,0,0},
          thickness=0.5));
      connect(
          kidney.q_in, veins.q_in[3]) annotation (Line(
          points={{-24,-54},{-38,-54},{-38,-36.65},{-54.1,-36.65}},
          color={127,0,0},
          thickness=0.5));
      connect(
          veins.q_in[4], largeVeins.q_out) annotation (Line(
          points={{-54.1,-37.95},{-84,-37.95},{-84,-18}},
          color={127,0,0},
          thickness=0.5));
      connect(
          largeVeins.q_in, rightAtrium.q_in[1]) annotation (Line(
          points={{-84,2},{-86,2},{-86,19.7333},{-72.1,19.7333}},
          color={127,0,0},
          thickness=0.5));
      connect(
          rightAtrium.q_in[2], rightHeart.q_in) annotation (Line(
          points={{-72.1,18},{-64,18},{-64,18},{-56,18}},
          color={127,0,0},
          thickness=0.5));
      connect(
          rightAtrium.q_in[3], pressureMeasure.q_in) annotation (Line(
          points={{-72.1,16.2667},{-72,16.2667},{-72,30}},
          color={127,0,0},
          thickness=0.5));
      connect(
          arteries.q_in[5], MeanArterialPressure.q_in) annotation (Line(
          points={{23.9,-38.08},{80,-38.08},{80,-30}},
          color={127,0,0},
          thickness=0.5));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={Text(
              extent={{-82,-80},{80,-100}},
              lineColor={175,175,175},
              textString=
       "Circulation part of Guyton-Coleman-Granger's model from 1972")}),
       Documentation(info="<html>
	<p>Cardiovascular subsystem in famous Guyton-Coleman-Granger model from 1972. </p>
	<p><br/>Model, all parameters and all initial values are from article: </p>
	<p>A.C. Guyton, T.G. Coleman, H.J. Granger (1972). &quot;Circulation: overall regulation.&quot; Annual review of physiology 34(1): 13-44.</p>
	</html>",   revisions="<html>
	<p><i>2014-2018</i></p>
	<p>Marek Matejak, marek@matfyz.cz </p>
	</html>"),experiment(StopTime=300));
       end CardiovascularSystem_GCG;

       package Utilities "Utility components used by package Examples"
       extends Modelica.Icons.UtilitiesPackage;

         model Pulses "example pulse flow generator"
             import Physiolibrary.Types.*;
             Physiolibrary.Types.RealIO.MassFlowRateOutput massflowrate
               annotation (Placement(transformation(extent={{80,-10},{100,10}}),
            iconTransformation(extent={{80,-10},{100,10}})));
             discrete Time T0 "beginning of cardiac cycle";
             Boolean b(start=false);
             discrete Time HP "duration of cardiac cycle";
             parameter Frequency HR=1.2;
             Time tc "relative time in carciac cycle";
             parameter Time TD1=0.07 "relative time of start of systole";
             discrete Time TD2 "relative time of end of systole";
             parameter MassFlowRate QP=0.424 "peak mass flowrate";
         initial equation
               T0 = 0 "set beginning of cardiac cycle";
               HP = 1/HR "update length of carciac cycle";
               TD2 = TD1 + (2/5)/HR "compute end time of systole";
         equation
             b = time - pre(T0) >= pre(HP) "true if new cardiac cycle begins";
             when {b} then
               T0 = time "set beginning of cardiac cycle";
               HP = 1/HR "update length of carciac cycle";
               TD2 = TD1 + (2/5)*HP "compute end time of systole";
             end when;
             tc = time - T0 "relative time in carciac cycle";
             massflowrate = if tc < TD1 then 0 else if tc < TD2 then sin((tc - TD1)/
               (TD2 - TD1)*Modelica.Constants.pi)*QP else 0
               "zero before and after systole, otherwise sin up to peak flow";
             annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Rectangle(
                  extent={{-80,80},{80,-80}},
                  lineColor={0,0,255},
                  fillColor={255,255,170},
                  fillPattern=FillPattern.Solid),Line(
                  points={{-70,0},{-50,0},{-48,2},{-42,52},{-36,60},{-28,52},{-24,
                2},{-20,0},{14,0},{18,2},{24,48},{24,54},{32,58},{40,50},{44,2},
                {50,0},{74,0}},
                  color={0,0,255},
                  smooth=Smooth.Bezier),
            Text(
              extent={{-80,108},{80,88}},
              lineColor={0,0,255},
              textString="%name"),
            Text(
              extent={{-80,-92},{78,-112}},
              lineColor={0,0,255},
              textString="rate=%HR")}));
         end Pulses;
       end Utilities;

       package Kofranek2014 "models of cardiovascular system used in www.physiome.cz/atlas"
      extends Modelica.Icons.ExamplesPackage;
         model NonPulsatileCirculation
             extends Physiolibrary.Icons.CardioVascular;
           Physiolibrary.Fluid.Components.ElasticVessel PulmonaryArteries(
             useV0Input=true,
             useComplianceInput=true,
             nPorts=2,
             volume_start=0.373e-3)
             annotation (Placement(transformation(extent={{-40,28},{-20,48}})));
             Physiolibrary.Types.Constants.HydraulicComplianceConst CAP(k=
            2.2576853432954e-08)
               annotation (Placement(transformation(extent={{-50,56},{-36,70}})));
             Physiolibrary.Types.Constants.VolumeConst V0AP(k=0.000327)
               annotation (Placement(transformation(extent={{-66,44},{-52,58}})));
             Components.Resistor                      TotalPulmonaryResistance(
            useResistanceInput=true)
               annotation (Placement(transformation(extent={{-2,28},{18,48}})));
             Types.Constants.HydraulicResistanceConst                            RP(k(
            displayUnit="(mmHg.s)/l") = 9332567.11905)
               annotation (Placement(transformation(extent={{-12,60},{0,70}})));
           Physiolibrary.Fluid.Components.ElasticVessel PulmonaryVeins(
             useV0Input=true,
             useComplianceInput=true,
             volume_start=0.704e-3,
             nPorts=2)
             annotation (Placement(transformation(extent={{42,28},{62,48}})));
             Physiolibrary.Types.Constants.HydraulicComplianceConst CVP(k=
            2.250184727537e-7)
               annotation (Placement(transformation(extent={{36,60},{50,74}})));
             Physiolibrary.Types.Constants.VolumeConst V0VP(k=0.000435)
               annotation (Placement(transformation(extent={{20,48},{34,62}})));
           Physiolibrary.Fluid.Components.ElasticVessel SystemicVeins(
             useV0Input=true,
             useComplianceInput=true,
             volume_start=3.922e-3,
             nPorts=2)
             annotation (Placement(transformation(extent={{-46,-70},{-26,-50}})));
             Physiolibrary.Types.Constants.HydraulicComplianceConst CVS(k=
            1.5001231516913e-6) annotation (Placement(transformation(extent=
               {{-52,-42},{-38,-28}})));
             Physiolibrary.Types.Constants.VolumeConst V0VS(k=0.002845)
               annotation (Placement(transformation(extent={{-74,-54},{-60,-40}})));
             Components.Resistor                      TotalSystemicResistance(
            useResistanceInput=true)
               annotation (Placement(transformation(extent={{16,-70},{-4,-50}})));
             Types.Constants.HydraulicResistanceConst                            RT(k(
            displayUnit="(mmHg.s)/l") = 133322387.415)
               annotation (Placement(transformation(extent={{-14,-50},{-4,-40}})));
           Physiolibrary.Fluid.Components.ElasticVessel SystemicArteries(
             useV0Input=true,
             useComplianceInput=true,
             nPorts=3,
             volume_start=0.672e-3)
             annotation (Placement(transformation(extent={{36,-70},{56,-50}})));
             Physiolibrary.Types.Constants.HydraulicComplianceConst CAS(k=
            1.1250923637685e-08)
               annotation (Placement(transformation(extent={{30,-38},{44,-24}})));
             Physiolibrary.Types.Constants.VolumeConst V0AS(k=0.000529)
               annotation (Placement(transformation(extent={{14,-50},{28,-36}})));
             replaceable Parts.HeartPump rightHeart(StarlingSlope(displayUnit=
              "ml/(mmHg.s)") = 1.2503526469347e-07)
                    constrainedby Parts.HeartInterface
               annotation (Placement(transformation(extent={{-72,-10},{-48,16}})));
             replaceable Parts.HeartPump leftHeart(StarlingSlope(displayUnit=
              "ml/(mmHg.s)") = 7.5006157584566e-08)
                   constrainedby Parts.HeartInterface
               annotation (Placement(transformation(extent={{74,-10},{52,10}})));
             inner Modelica.Fluid.System system(p_ambient(displayUnit="mmHg")=
                 101325.0144354)
               annotation (Placement(transformation(extent={{-94,70},{-74,90}})));
             Sensors.PressureMeasure pressureMeasure
               annotation (Placement(transformation(extent={{68,-66},{88,-46}})));
         equation
             connect(CAP.y, PulmonaryArteries.compliance) annotation (Line(
                 points={{-34.25,63},{-28,63},{-28,47}},
                 color={0,0,127}));
             connect(V0AP.y, PulmonaryArteries.zeroPressureVolume) annotation (Line(
                 points={{-50.25,51},{-50.25,50.5},{-32,50.5},{-32,47}},
                 color={0,0,127}));
             connect(CVP.y, PulmonaryVeins.compliance) annotation (Line(
                 points={{51.75,67},{54,67},{54,47}},
                 color={0,0,127}));
             connect(CVS.y, SystemicVeins.compliance) annotation (Line(
                 points={{-36.25,-35},{-34,-35},{-34,-51}},
                 color={0,0,127}));
             connect(CAS.y, SystemicArteries.compliance) annotation (Line(
                 points={{45.75,-31},{48,-31},{48,-51}},
                 color={0,0,127}));
             connect(PulmonaryVeins.zeroPressureVolume, V0VP.y) annotation (Line(
                 points={{50,47},{40,47},{40,55},{35.75,55}},
                 color={0,0,127}));
             connect(SystemicVeins.zeroPressureVolume, V0VS.y) annotation (Line(
                 points={{-38,-51},{-52,-51},{-52,-47},{-58.25,-47}},
                 color={0,0,127}));
             connect(V0AS.y, SystemicArteries.zeroPressureVolume) annotation (Line(
                 points={{29.75,-43},{44,-43},{44,-51}},
                 color={0,0,127}));
             connect(rightHeart.q_out, PulmonaryArteries.q_in[1]) annotation (Line(
                 points={{-48,3},{-40,3},{-40,39.3},{-30.1,39.3}},
                 color={127,0,0},
                 thickness=0.5));
             connect(PulmonaryArteries.q_in[2], TotalPulmonaryResistance.q_in)
               annotation (Line(
                 points={{-30.1,36.7},{-16,36.7},{-16,38},{-2,38}},
                 color={127,0,0},
                 thickness=0.5));
             connect(TotalPulmonaryResistance.q_out, PulmonaryVeins.q_in[1])
               annotation (Line(
                 points={{18,38},{34,38},{34,39.3},{51.9,39.3}},
                 color={127,0,0},
                 thickness=0.5));
             connect(PulmonaryVeins.q_in[2], leftHeart.q_in) annotation (Line(
                 points={{51.9,36.7},{74,36.7},{74,0}},
                 color={127,0,0},
                 thickness=0.5));
             connect(leftHeart.q_out, SystemicArteries.q_in[1]) annotation (Line(
                 points={{52,2.22045e-16},{50,2.22045e-16},{50,-58.2667},{45.9,-58.2667}},
                 color={127,0,0},
                 thickness=0.5));
             connect(SystemicArteries.q_in[2], TotalSystemicResistance.q_in)
               annotation (Line(
                 points={{45.9,-60},{30,-60},{30,-60},{16,-60}},
                 color={127,0,0},
                 thickness=0.5));
             connect(TotalSystemicResistance.q_out, SystemicVeins.q_in[1])
               annotation (Line(
                 points={{-4,-60},{-20,-60},{-20,-58.7},{-36.1,-58.7}},
                 color={127,0,0},
                 thickness=0.5));
             connect(SystemicVeins.q_in[2], rightHeart.q_in) annotation (Line(
                 points={{-36.1,-61.3},{-80,-61.3},{-80,3},{-72,3}},
                 color={127,0,0},
                 thickness=0.5));
             connect(SystemicArteries.q_in[3], pressureMeasure.q_in) annotation (
                 Line(
                 points={{45.9,-61.7333},{60,-61.7333},{60,-62},{74,-62}},
                 color={127,0,0},
                 thickness=0.5));
        connect(RT.y, TotalSystemicResistance.resistance)
          annotation (
            Line(
              points={{-2.75,-45},{-2.75,-44.5},{6,-44.5},{6,-54}}, color={0,0,
                127}));
        connect(RP.y, TotalPulmonaryResistance.resistance)
          annotation (
            Line(
              points={{1.5,65},{1.5,65.5},{8,65.5},{8,44}}, color={0,0,127}));
             annotation ( Documentation(info="<html>
	<p>Model of cardiovascular system using to demonstrate elastic and resistance features of veins and arteries in pulmonary and systemic circulation and influence of cardiac output on it. </p>
	<ul>
	<li>J. Kofranek, S. Matousek, J. Rusz, P. Stodulka, P. Privitzer,M. Matejak, M. Tribula, The Atlas of Physiology and Pathophysiology: Web-based multimedia enabled interactive simulations., Comput. Methods Programs Biomed. 104 (2) (2011) 143&ndash;53. doi:10.1016/j.cmpb.2010.12.007.</li>
	<li>Kofr&aacute;nek J, Matej&aacute;k M, Je~ek F, Privitzer P, &Scaron;ilar J. V&yacute;ukov&yacute; webov&yacute; simulator krevn&iacute;ho obhu. In: Sborn&iacute;k PY&iacute;spvko MEDSOFT 2011: 106-121. </li>
	<li>Tribula M, Je~ek F, Privitzer P, Kofr&aacute;nek J, Kolman J. Webov&yacute; v&yacute;ukov&yacute; simul&aacute;tor krevn&iacute;ho obhu. In: Sborn&iacute;k PY&iacute;spvko MEDSOFT 2013: 197-204.</li>
	<li><a href=\"http://physiome.cz/atlas/cirkulace/05/SimpleUncontrolledSimulation.html\">http://physiome.cz/atlas/cirkulace/05/SimpleUncontrolledSimulation.html</a></li>
	</ul>
	</html>"),           experiment(StopTime=5));
         end NonPulsatileCirculation;

         model PulsatileCirculation
               extends NonPulsatileCirculation(
               redeclare Parts.PulsatileHeartPump rightHeart(pulses(
              QP=0.338)),
               redeclare Parts.PulsatileHeartPump leftHeart(pulses(QP=
               0.338)),
               CAS(k=7.2755972857029e-9),
               SystemicArteries(volume_start=0.603e-3),
               SystemicVeins(volume_start=3.991e-3));

             annotation ( Documentation(info="<html>
	<p>Extension of the model of cardiovascular system with pulsatile dynamics</p>
	<ul>
	<li>Kulh&aacute;nek T, Tribula M, Kofr&aacute;nek J, Matej&aacute;k M. Simple models of the cardiovascular system for educational and research purposes. MEFANET Journal 2014. Available at WWW:<a href=\"
	 http://mj.mefanet.cz/mj-04140914\"> http://mj.mefanet.cz/mj-04140914</a>.</li>
	</ul>
	</html>"),           experiment(StopTime=5));
         end PulsatileCirculation;

         package Parts "Utility components used by package KofranekModels2013"
           extends Modelica.Icons.UtilitiesPackage;
             model HeartPump "Heart as pump, which flowrate is determined
\t  by the StarlingSlope and filling pressure."
               extends HeartInterface;

               outer Modelica.Fluid.System system "System wide properties";

               extends Physiolibrary.Fluid.Interfaces.OnePort;

               parameter Physiolibrary.Types.HydraulicConductance StarlingSlope;


             equation
                q_in.m_flow = StarlingSlope*(q_in.p-system.p_ambient)*density;

                annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={
                  {-100,-100},{100,100}}), graphics={Polygon(
                 points={{32,-34},{24,-24},{18,-10},{18,-8},{22,22},{
                  24,24},{34,40},{30,70},{26,82},{-22,100},{-26,42},{-26,40},
                  {-30,-6},{-30,-10},{-6,-40},{52,-74},{32,-34}},
                 lineColor={0,0,127},
                 smooth=Smooth.Bezier,
                 fillColor={255,170,170},
                 fillPattern=FillPattern.Solid),Text(
                 extent={{-100,-60},{102,-98}},
                 lineColor={0,0,127},
                 fillColor={255,170,170},
                 fillPattern=FillPattern.Solid,
                 textString="%name")}));
             end HeartPump;

             model PulsatileHeartPump "Heart as pump, which flowrate is determined
\t  by the StarlingSlope and filling pressure."
               extends HeartInterface;

               replaceable package Medium =
                  Media.Water                                   constrainedby
            Media.Interfaces.PartialMedium
               "Medium model"   annotation (choicesAllMatching=true);

          Physiolibrary.Fluid.Interfaces.FluidPort_a q_in(redeclare package Medium =
                               Media.Water) annotation (Placement(
                transformation(extent={{-64,0},{-44,20}}),
                iconTransformation(extent={{-110,-10},{-90,10}})));
          Physiolibrary.Fluid.Interfaces.FluidPort_b q_out(redeclare package Medium =
                               Media.Water) annotation (Placement(
                transformation(extent={{42,2},{62,22}}),
                iconTransformation(extent={{42,2},{62,22}})));
               Utilities.Pulses pulses
                 annotation (Placement(transformation(extent={{-40,30},{-20,50}})));
               Physiolibrary.Fluid.Components.MassPump pump(useSolutionFlowInput=
              true)
                 annotation (Placement(transformation(extent={{-14,2},{6,22}})));

             equation
               connect(pump.q_out, q_out) annotation (Line(points={{6,12},{52,
                  12}}, thickness=1));
               connect(pump.solutionFlow, pulses.massflowrate) annotation (Line(points={{
                  -4,19},{-4,40},{-21,40}}, color={0,0,127}));
               connect(q_in, pump.q_in) annotation (Line(points={{-54,10},{-34,
                  10},{-34,12},{-14,12}}, thickness=1));

               annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={
                  {-100,-100},{100,100}}), graphics={Polygon(
                 points={{32,-34},{24,-24},{18,-10},{18,-8},{22,22},{
                  24,24},{34,40},{30,70},{26,82},{-22,100},{-26,42},{-26,40},
                  {-30,-6},{-30,-10},{-6,-40},{52,-74},{32,-34}},
                 lineColor={0,0,127},
                 smooth=Smooth.Bezier,
                 fillColor={255,170,170},
                 fillPattern=FillPattern.Solid),Text(
                 extent={{-100,-60},{102,-98}},
                 lineColor={0,0,127},
                 fillColor={255,170,170},
                 fillPattern=FillPattern.Solid,
                 textString="%name")}));
             end PulsatileHeartPump;

             partial model HeartInterface
               annotation (Icon(coordinateSystem(preserveAspectRatio=false)),
              Diagram(coordinateSystem(preserveAspectRatio=false)));
             end HeartInterface;
         end Parts;

      annotation (Documentation(info=
                                 "<html>
	<p>Model of cardiovascular system using to demonstrate elastic and resistance features of veins and arteries in pulmonary and systemic circulation and influence of cardiac output on it.</p>
	</html>"));
       end Kofranek2014;

       package Fernandez2013 "Model of CVS introduced by Fernandez de Canete et al. 2013"
      extends Modelica.Icons.ExamplesPackage;

         model PulsatileCirculation
             "Model of cardiovascular system with pulsatile dynamic"
                extends Physiolibrary.Icons.CardioVascular;

             Physiolibrary.Fluid.Components.Conductor RPulmonaryVeins(Conductance(
            displayUnit="ml/(mmHg.s)") = 7.425609600872e-08) annotation (
                 Placement(transformation(origin={-220,60}, extent={{15,-15},{-15,
                15}})));
             Physiolibrary.Fluid.Components.Inertia pulmonaryVeinsInertia(
                 massFlow_start(displayUnit="kg/s") = 0.02225, I(displayUnit=
              "mmHg.s2/g") = 410.6329532382) annotation (Placement(
            transformation(origin={-278,60}, extent={{15,-15},{-15,15}})));
             Physiolibrary.Fluid.Components.Conductor RPulmonaryArtery(Conductance(
            displayUnit="ml/(mmHg.s)") = 2.2216823876548e-07) annotation (
                 Placement(transformation(origin={200,58}, extent={{17.5,-17.5},{-17.5,
                17.5}})));
             Physiolibrary.Fluid.Components.Inertia pulmonaryArterialInertia(
                 massFlow_start(displayUnit="g/min") = 0.00073233333333333, I(
            displayUnit="mmHg.s2/g") = 99.99179056125) annotation (
                 Placement(transformation(origin={156,58}, extent={{15,-15},{-15,
                15}})));
           Physiolibrary.Fluid.Components.ElasticVessel pulmonaryVeins(
             volume_start=0.6597e-3,
             nPorts=2,
             ZeroPressureVolume=0.0001,
             Compliance=3.5027875591992e-07) annotation (Placement(transformation(
            origin={-279,-3}, extent={{-15,-15},{15,15}})));
             Physiolibrary.Fluid.Components.IdealValve mitralValve(_Gon(
            displayUnit="ml/(mmHg.s)") = 1.9996641612045e-06) annotation (
                 Placement(transformation(origin={-243,-3}, extent={{-15,-15},{15,
                15}})));
           Physiolibrary.Fluid.Components.ElasticVessel leftVentricle(
             useComplianceInput=true,
             useExternalPressureInput=true,
             nPorts=3,
             volume_start=0.2097e-3,
             ZeroPressureVolume=9e-05) annotation (Placement(transformation(origin=
             {-209,-3}, extent={{-15,-15},{15,15}})));
             Physiolibrary.Fluid.Components.Conductor RLeftMyo(Conductance=
            9.3757696980707e-08) annotation (Placement(transformation(
              origin={-181,-3}, extent={{-15,-15},{15,15}})));
             Physiolibrary.Fluid.Components.IdealValve aorticValve(_Gon(
            displayUnit="ml/(mmHg.s)") = 1.9996641612045e-06) annotation (
                 Placement(transformation(origin={-143,-3}, extent={{-15,-15},{15,
                15}})));
           Physiolibrary.Fluid.Components.ElasticVessel aorta(
             nPorts=3,
             Compliance(displayUnit="ml/mmHg") = 1.6501354668604e-09,
             volume_start=0.046e-3,
             ZeroPressureVolume=3e-05) annotation (Placement(transformation(origin=
             {-111,-3}, extent={{-15,-15},{15,15}})));
             Physiolibrary.Fluid.Components.Conductor Raorta(Conductance=
            1.1108411938274e-07) annotation (Placement(transformation(
              origin={-79,-3}, extent={{-15,-15},{15,15}})));
             Physiolibrary.Fluid.Components.Inertia aorticInertia(massFlow_start(
            displayUnit="kg/min") = 0.010385, I(displayUnit="mmHg.s2/g")=
                 109.99096961738) annotation (Placement(transformation(origin={-37,
                -3}, extent={{-15,-15},{15,15}})));
           Physiolibrary.Fluid.Components.ElasticVessel arteries(
             nPorts=3,
             Compliance=1.0950899007347e-08,
             volume_start=0.805e-3,
             ZeroPressureVolume=0.0007) annotation (Placement(transformation(
            origin={-1,-3}, extent={{-15,-15},{15,15}})));
             Physiolibrary.Fluid.Components.Conductor RSystemic(Conductance=
            7.5006157584566e-09) annotation (Placement(transformation(
              origin={31,-3}, extent={{-15,-15},{15,15}})));
             Physiolibrary.Fluid.Components.Inertia systemicInertia(massFlow_start(
            displayUnit="kg/min") = 0.07935, I=479.960594694) annotation (
                 Placement(transformation(origin={75,-3}, extent={{-15,-15},{15,15}})));
             Physiolibrary.Fluid.Components.IdealValve tricuspidValve(_Gon(
            displayUnit="ml/(mmHg.s)") = 1.9996641612045e-06) annotation (
                 Placement(transformation(origin={137,-3}, extent={{-15,-15},{15,
                15}})));
           Physiolibrary.Fluid.Components.ElasticVessel rightVentricle(
             useComplianceInput=true,
             useExternalPressureInput=true,
             nPorts=3,
             volume_start=0.18e-3,
             ZeroPressureVolume=7e-05) annotation (Placement(transformation(origin=
             {171,-3}, extent={{-15,-15},{15,15}})));
             Physiolibrary.Fluid.Components.Conductor RRightMyo(Conductance=
            4.2858518443821e-07) annotation (Placement(transformation(
              origin={207,-3}, extent={{-15,-15},{15,15}})));
             Physiolibrary.Fluid.Components.IdealValve pulmonaryValve(_Gon(
            displayUnit="ml/(mmHg.s)") = 1.9996641612045e-06) annotation (
                 Placement(transformation(origin={243,-3}, extent={{-15,-15},{15,
                15}})));
           Physiolibrary.Fluid.Components.ElasticVessel pulmonaryArtery(
             nPorts=2,
             volume_start=0.021e-3,
             ZeroPressureVolume=2e-05,
             Compliance(displayUnit="ml/mmHg") = 6.7505541826109e-10) annotation (
               Placement(transformation(origin={243,57}, extent={{-15,-15},{15,15}})));
           Physiolibrary.Fluid.Components.ElasticVessel pulmonaryArterioles(
             nPorts=2,
             volume_start=0.637e-3,
             ZeroPressureVolume=0.0006,
             Compliance(displayUnit="ml/mmHg") = 2.0026644075079e-08) annotation (
               Placement(transformation(origin={124,58}, extent={{-15,-15},{15,15}})));
           Physiolibrary.Fluid.Components.ElasticVessel veins(
             volume_start=2.443e-3,
             nPorts=2,
             Compliance(displayUnit="ml/mmHg") = 1.5001231516913e-07,
             ZeroPressureVolume=0.00237) annotation (Placement(transformation(
            origin={105,-3}, extent={{-15,-15},{15,15}})));
             Parts.TimeVaryingElastance timeVaryingElastanceLeft(
               Ed(displayUnit="mmHg/ml") = 13332238.7415,
               Es(displayUnit="mmHg/ml") = 183318282.69563,
               Pi0(displayUnit="mmHg") = 6666.11937075)
               annotation (Placement(transformation(extent={{-222,16},{-202,36}})));
             Parts.TimeVaryingElastance timeVaryingElastanceRight(
               Ed(displayUnit="mmHg/ml") = 3999671.62245,
               Es(displayUnit="mmHg/ml") = 43729743.0721,
               Pi0(displayUnit="mmHg") = 3199.73729796)
               annotation (Placement(transformation(extent={{164,18},{184,38}})));
             Physiolibrary.Types.Constants.FrequencyConst heartRate(k(displayUnit=
              "Hz") = 1.2) annotation (Placement(transformation(extent={{-262,
                30},{-244,42}})));
             inner Modelica.Fluid.System system(p_ambient(displayUnit="mmHg")=
                 101325.0144354)
               annotation (Placement(transformation(extent={{-94,70},{-74,90}})));
             Sensors.PressureMeasure arteriesPressure
               annotation (Placement(transformation(extent={{26,-72},{46,-52}})));
             Sensors.PressureMeasure rightVentriclePressure
               annotation (Placement(transformation(extent={{182,-68},{202,-48}})));
             Sensors.PressureMeasure leftVentriclePressure
               annotation (Placement(transformation(extent={{-206,-72},{-186,-52}})));
             Sensors.PressureMeasure aortaPressure
               annotation (Placement(transformation(extent={{-108,-68},{-88,-48}})));
         equation
             connect(Raorta.q_out, aorticInertia.q_in) annotation (Line(
                 points={{-64,-3},{-52,-3}},
                 thickness=1));
             connect(timeVaryingElastanceLeft.C, leftVentricle.compliance)
               annotation (Line(
                 points={{-212,17},{-206,17},{-206,10.5}},
                 color={0,0,127}));
             connect(timeVaryingElastanceRight.C, rightVentricle.compliance)
               annotation (Line(
                 points={{174,19},{174,10.5},{174,10.5}},
                 color={0,0,127}));
             connect(timeVaryingElastanceLeft.Pi, leftVentricle.externalPressure)
               annotation (Line(
                 points={{-205,17},{-205,16.5},{-200,16.5},{-200,10.5}},
                 color={0,0,127}));
             connect(timeVaryingElastanceRight.Pi, rightVentricle.externalPressure)
               annotation (Line(
                 points={{181,19},{181,10.5},{180,10.5}},
                 color={0,0,127}));
             connect(heartRate.y, timeVaryingElastanceLeft.HR) annotation (Line(
                 points={{-241.75,36},{-232.375,36},{-232.375,33.6},{-220.6,33.6}},
                 color={0,0,127}));
             connect(RSystemic.q_out, systemicInertia.q_in) annotation (Line(
                 points={{46,-3},{60,-3}},
                 thickness=1));
             connect(heartRate.y, timeVaryingElastanceRight.HR) annotation (Line(
                 points={{-241.75,36},{-34,36},{-34,35.6},{165.4,35.6}},
                 color={0,0,127}));
             connect(RRightMyo.q_out, pulmonaryValve.q_in) annotation (Line(
                 points={{222,-3},{228,-3}},
                 thickness=1));
             connect(RPulmonaryArtery.q_out, pulmonaryArterialInertia.q_in)
               annotation (Line(
                 points={{182.5,58},{171,58}},
                 thickness=1));
             connect(RPulmonaryVeins.q_out, pulmonaryVeinsInertia.q_in) annotation (
                 Line(
                 points={{-235,60},{-263,60}},
                 thickness=1));
             connect(RLeftMyo.q_out, aorticValve.q_in) annotation (Line(
                 points={{-166,-3},{-158,-3}},
                 thickness=1));
             connect(RPulmonaryVeins.q_in, pulmonaryArterioles.q_in[1])
               annotation (Line(
                 points={{-205,60},{-40,60},{-40,59.95},{123.85,59.95}},
                 color={127,0,0},
                 thickness=0.5));
             connect(pulmonaryArterioles.q_in[2], pulmonaryArterialInertia.q_out)
               annotation (Line(
                 points={{123.85,56.05},{133,56.05},{133,58},{141,58}},
                 color={127,0,0},
                 thickness=0.5));
             connect(RPulmonaryArtery.q_in, pulmonaryArtery.q_in[1]) annotation (
                 Line(
                 points={{217.5,58},{229.75,58},{229.75,58.95},{242.85,58.95}},
                 color={127,0,0},
                 thickness=0.5));
             connect(pulmonaryArtery.q_in[2], pulmonaryValve.q_out) annotation (
                 Line(
                 points={{242.85,55.05},{292,55.05},{292,-3},{258,-3}},
                 color={127,0,0},
                 thickness=0.5));
             connect(tricuspidValve.q_out, rightVentricle.q_in[1]) annotation (
                 Line(
                 points={{152,-3},{162,-3},{162,-0.4},{170.85,-0.4}},
                 color={127,0,0},
                 thickness=0.5));
             connect(RRightMyo.q_in, rightVentricle.q_in[2]) annotation (Line(
                 points={{192,-3},{181,-3},{181,-3},{170.85,-3}},
                 color={127,0,0},
                 thickness=0.5));
             connect(tricuspidValve.q_in, veins.q_in[1]) annotation (Line(
                 points={{122,-3},{114,-3},{114,-1.05},{104.85,-1.05}},
                 color={127,0,0},
                 thickness=0.5));
             connect(systemicInertia.q_out, veins.q_in[2]) annotation (Line(
                 points={{90,-3},{98,-3},{98,-4.95},{104.85,-4.95}},
                 color={127,0,0},
                 thickness=0.5));
             connect(RSystemic.q_in, arteries.q_in[1]) annotation (Line(
                 points={{16,-3},{8,-3},{8,-0.4},{-1.15,-0.4}},
                 color={127,0,0},
                 thickness=0.5));
             connect(aorticInertia.q_out, arteries.q_in[2]) annotation (Line(
                 points={{-22,-3},{-11,-3},{-11,-3},{-1.15,-3}},
                 color={127,0,0},
                 thickness=0.5));
             connect(Raorta.q_in, aorta.q_in[1]) annotation (Line(
                 points={{-94,-3},{-104,-3},{-104,-0.4},{-111.15,-0.4}},
                 color={127,0,0},
                 thickness=0.5));
             connect(aorticValve.q_out, aorta.q_in[2]) annotation (Line(
                 points={{-128,-3},{-120,-3},{-120,-3},{-111.15,-3}},
                 color={127,0,0},
                 thickness=0.5));
             connect(mitralValve.q_out, leftVentricle.q_in[1]) annotation (Line(
                 points={{-228,-3},{-220,-3},{-220,-0.4},{-209.15,-0.4}},
                 color={127,0,0},
                 thickness=0.5));
             connect(leftVentricle.q_in[2], RLeftMyo.q_in) annotation (Line(
                 points={{-209.15,-3},{-203.725,-3},{-203.725,-3},{-196,-3}},
                 color={127,0,0},
                 thickness=0.5));

             connect(pulmonaryVeins.q_in[1], pulmonaryVeinsInertia.q_out)
               annotation (Line(
                 points={{-279.15,-1.05},{-318,-1.05},{-318,60},{-293,60}},
                 color={127,0,0},
                 thickness=0.5));
             connect(pulmonaryVeins.q_in[2], mitralValve.q_in) annotation (Line(
                 points={{-279.15,-4.95},{-268.725,-4.95},{-268.725,-3},{-258,-3}},
                 color={127,0,0},
                 thickness=0.5));

             connect(arteriesPressure.q_in, arteries.q_in[3]) annotation (Line(
                 points={{32,-68},{32,-69},{-1.15,-69},{-1.15,-5.6}},
                 color={127,0,0},
                 thickness=0.5));
             connect(rightVentricle.q_in[3], rightVentriclePressure.q_in) annotation (Line(
                 points={{170.85,-5.6},{170.85,-64},{188,-64}},
                 color={127,0,0},
                 thickness=0.5));
             connect(leftVentricle.q_in[3], leftVentriclePressure.q_in) annotation (Line(
                 points={{-209.15,-5.6},{-209.15,-68},{-200,-68}},
                 color={127,0,0},
                 thickness=0.5));
             connect(aortaPressure.q_in, aorta.q_in[3]) annotation (Line(
                 points={{-102,-64},{-112,-64},{-112,-5.6},{-111.15,-5.6}},
                 color={127,0,0},
                 thickness=0.5));
             annotation(Diagram(coordinateSystem(extent={{-350,-100},{400,100}},      preserveAspectRatio=false,  grid = {2, 2})),
                               Icon(coordinateSystem(extent={{-350,
                -100},{400,100}},                                                                                                    preserveAspectRatio = true, grid = {2, 2})),
               Documentation(info="<html>
	<p>Model of cardiovascular system with pulsatile dynamics</p>
	<ul>
	<li>Javier Fernandez de Canete, P del Saz-Orozco, D Moreno-Boza, E Duran-Venegas (2013), <a href=\"http://www.mendeley.com/library/#\">Object-oriented modeling and simulation of the closed loop cardiovascular systemby using SIMSCAPE.</a> <i>Computers in biology and medicine</i> 43 (4) p. 323-33</li>
	<li>Kulh&aacute;nek T, Tribula M, Kofr&aacute;nek J, Matej&aacute;k M. Simple models of the cardiovascular system for educational and research purposes<i>. MEFANET Journal 2014</i>. Available at WWW: http://mj.mefanet.cz/mj-04140914.</li>
	</ul>
	</html>",                  revisions="<html>
	<ul>
	<li><i>Sep 2014 </i>by Tomas Kulhanek: <br>Created. </li>
	</ul>
	</html>"),           experiment(StopTime=5));
         end PulsatileCirculation;

         package Parts "Utility components used by package KofranekModels2013"
             extends Modelica.Icons.UtilitiesPackage;
             model TimeVaryingElastance

               outer Modelica.Fluid.System system "System wide properties";

               parameter Physiolibrary.Types.HydraulicElastance Ed
                 "elastance of diastole";
               parameter Physiolibrary.Types.HydraulicElastance Es
                 "elastance of systole";
               parameter Physiolibrary.Types.Pressure Pi0
                 "peak isovolumic pressure";
               parameter Physiolibrary.Types.Frequency HR_start = 1 "Initial hear rate";

               Physiolibrary.Types.Time tm
                 "relative time from the beginning of cardiac cycle";
               discrete Physiolibrary.Types.Time HP "heart period";
               discrete Physiolibrary.Types.Time t0
                 "time of beginning of the cardiac cycle";
               discrete Physiolibrary.Types.Time ts "duration of systole";
               Real a;
               Physiolibrary.Types.RealIO.HydraulicComplianceOutput C annotation (Placement(
                transformation(extent={{-4,-102},{16,-82}}),
              iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={0,-90})));
              Physiolibrary.Types.HydraulicElastance E;
               Physiolibrary.Types.RealIO.PressureOutput Pi annotation (Placement(
              transformation(extent={{-72,-100},{-52,-80}}),
              iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={70,-90})));
               Physiolibrary.Types.RealIO.FrequencyInput HR "heart rate"
                 annotation (Placement(transformation(extent={{-106,56},{-66,96}}),
              iconTransformation(extent={{-106,56},{-66,96}})));
             initial equation
               HP = 1/HR_start;
               t0 = 0;
               ts = 0.16+0.3/HR_start;
             equation
               tm = time - pre(t0);
               if (tm<pre(ts)) then
                 a= (1-cos(2*Modelica.Constants.pi*tm/pre(ts)))/2;
               else
                 a=0;
               end if;
               E=Ed+Es*a;
               C=1/E;
               Pi = Pi0*a + system.p_ambient;
               when { tm >= pre(HP)} then
                 HP = 1/HR;
                 t0= time;
                 ts = 0.16+0.3*HP;
               end when;
               annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}),
                 graphics={
              Rectangle(
                extent={{-80,80},{80,-80}},
                lineColor={0,0,255},
                fillColor={170,255,255},
                fillPattern=FillPattern.Solid),
              Line(
                points={{-78,0},{-68,18},{-54,52},{-44,64},{-30,60},{-26,46}},
                color={0,0,255}),
              Line(
                points={{-26,46},{-26,32},{-20,10},{-8,2},{36,2},{80,2}},
                color={0,0,255}),
              Text(
                extent={{-70,98},{-22,80}},
                lineColor={0,0,255},
                textString="HR"),
              Text(
                extent={{-74,-40},{40,-80}},
                lineColor={0,0,255},
                textString="Et"),
              Text(
                extent={{42,-40},{100,-80}},
                lineColor={0,0,255},
                textString="Pi"),
              Text(
                extent={{-272,16},{276,-40}},
                lineColor={0,0,255},
                textString="%name")}));
             end TimeVaryingElastance;
         end Parts;
       end Fernandez2013;

       package MeursModel2011 "models of cardiovascular system used in www.physiome.cz/atlas"
      extends Modelica.Icons.ExamplesPackage;
         package Parts "Utility components used by package KofranekModels2013"
             extends Modelica.Icons.UtilitiesPackage;
             model AtrialElastance
               extends HeartIntervals;
               Physiolibrary.Types.RealIO.HydraulicElastanceOutput Et
                 "elasticity" annotation (Placement(transformation(extent={{100,-10},
                  {120,10}}), iconTransformation(extent={{100,-20},{138,18}})));

               parameter Physiolibrary.Types.HydraulicElastance EMIN
                 "Diastolic elastance";
             parameter Boolean useEs_extInput = false
                 "=true, if external elastance/compliance value is used"
                 annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="Conditional inputs"));
               parameter Physiolibrary.Types.HydraulicElastance EMAX
                 "Maximum systolic elastance"
                 annotation (Dialog(enable=not useEs_extInput));
             Physiolibrary.Types.RealIO.HydraulicComplianceInput Es_ext=1/es_int if useEs_extInput annotation (Placement(
              transformation(extent={{60,60},{100,100}}),
              iconTransformation(extent={{-20,-20},{20,20}}, origin={-80,80})));
        protected
                Physiolibrary.Types.HydraulicElastance es_int;
             equation
               if not useEs_extInput then
                 es_int=EMAX;
               end if;
               Et = smooth( 1, if time - T0 < Tas then
                  EMIN + (es_int - EMIN) * sin(Modelica.Constants.pi * (time - T0) / Tas)
               else
                  EMIN);

               annotation(Icon(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
                  -100},{100,100}}),                                                                        graphics={  Rectangle(extent = {{-100, 82}, {100, -100}}, pattern = LinePattern.None,
                  lineThickness =                                                                                                   1, fillColor = {255, 255, 170},
                  fillPattern =                                                                                                   FillPattern.Solid, lineColor = {0, 0, 255}), Text(extent={{
             -98,82},{98,24}},                                                                                                    lineColor = {0, 0, 255},
                  lineThickness =                                                                                                   1, fillColor = {255, 255, 170},
                  fillPattern =                                                                                                   FillPattern.Solid, textString = "Atrial elastance"), Line(points = {{-78, -34}, {-76, -26}, {-70, -14}, {-58, 6}, {-36, 36}, {-14, 14}, {-6, -10}, {0, -32}, {6, -34}, {88, -34}, {94, -34}}, color = {0, 0, 255}, smooth = Smooth.Bezier), Text(extent = {{-220, -102}, {200, -120}}, lineColor = {0, 0, 255},
                  lineThickness =                                                                                                   1, fillColor = {255, 255, 170},
                  fillPattern =                                                                                                   FillPattern.Solid, textString = "%name"), Text(extent = {{72, 4}, {102, -8}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 170},
                  fillPattern =                                                                                                   FillPattern.Solid, textString = "Ct")}));
             end AtrialElastance;

             model VentricularElastance
               extends HeartIntervals;
               Physiolibrary.Types.RealIO.HydraulicElastanceOutput Et
                 "ventricular elasticity" annotation (Placement(transformation(
                extent={{100,-10},{120,10}}), iconTransformation(extent={{
                  100,4},{138,42}})));
               Modelica.Blocks.Interfaces.RealOutput Et0
                 "normalized ventricular elasticity (0..1)"                                         annotation(Placement(transformation(extent = {{100, -24}, {120, -4}}), iconTransformation(extent = {{100, -40}, {138, -2}})));
               Physiolibrary.Types.RealIO.TimeOutput HeartInterval "eapsed time"
                 annotation (Placement(transformation(extent={{102,-42},{122,-22}}),
              iconTransformation(extent={{100,-98},{138,-60}})));

               parameter Physiolibrary.Types.HydraulicElastance EMIN
                 "Diastolic elastance ";
               constant Real Kn = 0.57923032735652;
               //Kn is always = 0.5792303273565197
               //... the t * sin(pi*t) has its maximum at t = 0.645773676543406 and = 0.5792303273565197
               //Equation to calculate normalized elastance ET0 was:
               //Et0=EMIN+(EMAX-EMIN)*((time-T0)-(Tas+Tav))/Tvs)*sin(Modelica.Constants.pi*(((time-T0)-(Tas+Tav))/Tvs));
             parameter Boolean useEs_extInput = false
                 "=true, if external elastance/compliance value is used"
                 annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="Conditional inputs"));
               parameter Physiolibrary.Types.HydraulicElastance EMAX
                 "Maximum systolic elastance"
                 annotation (Dialog(enable=not useEs_extInput));
             Physiolibrary.Types.RealIO.HydraulicComplianceInput Es_ext(start=1/
              EMAX)=1/es_int if useEs_extInput annotation (Placement(
              transformation(extent={{60,60},{100,100}}),
              iconTransformation(extent={{-20,-20},{20,20}}, origin={-80,80})));
        protected
                Physiolibrary.Types.HydraulicElastance es_int;
             equation
               if not useEs_extInput then
                 es_int=EMAX;
               end if;
               HeartInterval = time - T0;
               Et = EMIN + (es_int - EMIN) * Et0;
               Et0 = smooth(1, if HeartInterval >= Tas + Tav and HeartInterval < Tas + Tav + Tvs then
                  (HeartInterval - (Tas + Tav)) / Tvs * sin(Modelica.Constants.pi * (HeartInterval - (Tas + Tav)) / Tvs) / Kn
               else 0);

               annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-98, 82}, {100, -100}}, pattern = LinePattern.None,
                  lineThickness =                                                                                                   1, fillColor = {255, 255, 170},
                  fillPattern =                                                                                                   FillPattern.Solid, lineColor = {0, 0, 255}), Text(extent = {{-82, 82}, {80, 24}}, lineColor = {0, 0, 255},
                  lineThickness =                                                                                                   1, fillColor = {255, 255, 170},
                  fillPattern =                                                                                                   FillPattern.Solid, textString = "Ventricular elastance"), Line(points = {{-72, -34}, {-62, -34}, {-52, -34}, {-44, 8}, {-18, 38}, {-12, 14}, {-6, -10}, {0, -32}, {6, -34}, {88, -34}, {94, -34}}, color = {0, 0, 255}, smooth = Smooth.Bezier), Text(extent = {{-220, -102}, {200, -120}}, lineColor = {0, 0, 255},
                  lineThickness =                                                                                                   1, fillColor = {255, 255, 170},
                  fillPattern =                                                                                                   FillPattern.Solid, textString = "%name"), Text(extent = {{96, -32}, {68, -8}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 170},
                  fillPattern =                                                                                                   FillPattern.Solid, textString = "Et0"), Text(extent = {{42, -72}, {88, -84}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 170},
                  fillPattern =                                                                                                   FillPattern.Solid, textString = "Heart interval"), Text(extent = {{62, 30}, {96, 8}}, lineColor = {0, 0, 255},
                  lineThickness =                                                                                                   1, fillColor = {255, 255, 170},
                  fillPattern =                                                                                                   FillPattern.Solid, textString = "Ct")}));
             end VentricularElastance;

             model HeartIntervals
               discrete Physiolibrary.Types.Time Tas;
               discrete Physiolibrary.Types.Time T0;
               discrete Physiolibrary.Types.Time Tvs;
               parameter Physiolibrary.Types.Time Tav(displayUnit="s")=0.01
                 "atrioventricular delay";
               parameter Physiolibrary.Types.Frequency HR_start=1.2
                 "initial heart rate";
               discrete Modelica.Units.SI.Time HP(start=0) "heart period";
               Boolean b(start = false);
               Physiolibrary.Types.RealIO.FrequencyInput HR(start=1.2)
                 "heart rate" annotation (Placement(transformation(extent={{-12,68},
                  {28,108}}), iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,80})));
             initial equation
                 T0 = 0 "start time of cardiac cycle";
                 HP = 1 / HR_start "update heart period per heart rate";
                 Tas = 0.03 + 0.09  / HR_start "duration of atrial systole";
                 Tvs = 0.16 + 0.2  / HR_start "duration of ventricular systole";
             equation
               b = time - pre(T0) >= pre(HP) "true if new pulse occurs";
               when { b} then
                 T0 = time "start time of cardiac cycle";
                 HP = 1 / HR "update heart period per heart rate";
                 Tas = 0.03 + 0.09 * HP "duration of atrial systole";
                 Tvs = 0.16 + 0.2 * HP "duration of ventricular systole";
               end when;
               annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Text(extent={{
             -64,102},{-6,78}},                                                                                                    lineColor = {0, 0, 255}, textString = "HR")}));
             end HeartIntervals;
         end Parts;

         model HemodynamicsMeurs_flatNorm
           extends Physiolibrary.Icons.CardioVascular;
           Physiolibrary.Fluid.Components.ElasticVesselElastance Epa(
          volume_start=0.000106,
             ZeroPressureVolume=5e-05,
          ExternalPressure=101325 - 533.28954966,
          Elastance=31064116.267695,
             nPorts=2)
             annotation (Placement(transformation(extent={{-94,84},{-66,112}})));
             Physiolibrary.Fluid.Components.Resistor Rpp(
                 Resistance(displayUnit="(mmHg.s)/ml") = 14665462.61565)
               annotation (Placement(transformation(extent={{-56,85},{-22,111}})));
           Physiolibrary.Fluid.Components.ElasticVesselElastance Epv(
          volume_start=0.000518,
             ZeroPressureVolume=0.35e-3,
          ExternalPressure=101325 - 533.28954966,
          Elastance=6066168.6273825,
             nPorts=2)
             annotation (Placement(transformation(extent={{-14,84},{20,112}})));
             Physiolibrary.Fluid.Components.Resistor Rlain( Resistance(displayUnit="(mmHg.s)/ml") = 399967.162245)
               annotation (Placement(transformation(extent={{26,86},{56,110}})));
           Physiolibrary.Fluid.Components.ElasticVesselElastance LeftAtrium(
             useElastanceInput=true,
             volume_start=9.31e-05,
             ZeroPressureVolume=3e-05,
             ExternalPressure=101325 - 533.28954966,
             nPorts=2)
             annotation (Placement(transformation(extent={{74,50},{102,78}})));
           Physiolibrary.Fluid.Components.ElasticVesselElastance LeftVentricle(
             useElastanceInput=true,
             volume_start=0.144e-3,
             ZeroPressureVolume=6e-05,
             ExternalPressure=101325 - 533.28954966,
             nPorts=2)
             annotation (Placement(transformation(extent={{150,50},{178,78}})));
             Physiolibrary.Fluid.Components.IdealValveResistance AorticValve(
               _Roff(displayUnit="g/(mmHg.s)") = Modelica.Constants.inf,
               _Ron(displayUnit="(mmHg.s)/ml") = 1066579.09932)
               annotation (Placement(transformation(extent={{184,76},{208,52}})));
             Parts.AtrialElastance LAtrialElastance(
               Tav(displayUnit="s"),
               EMIN=15998686.4898,
               EMAX=37330268.4762)
               annotation (Placement(transformation(extent={{80,92},{118,124}})));
             Parts.VentricularElastance LVentricularElastance(EMIN=11999014.86735,
                 EMAX=533289549.66)
               annotation (Placement(transformation(extent={{164,88},{200,120}})));
             Physiolibrary.Fluid.Components.IdealValveResistance MitralValve(
               _Roff(displayUnit="g/(mmHg.s)") = Modelica.Constants.inf,
               _Ron(displayUnit="(mmHg.s)/ml") = 399967.162245) annotation (
                 Placement(transformation(origin={127,64}, extent={{-13,12},{13,-12}})));
           Physiolibrary.Fluid.Components.ElasticVesselElastance Eitha(
             ExternalPressure=101325 - 533.28954966,
             nPorts=3,
             volume_start=0.204e-3,
             ZeroPressureVolume=0.00014,
             Elastance=190651014.00345)
             annotation (Placement(transformation(extent={{168,6},{190,28}})));
           Physiolibrary.Fluid.Components.ElasticVesselElastance Eetha(
             volume_start=0.526e-3,
             ZeroPressureVolume=0.37e-3,
             Elastance=74127247.40274,
             nPorts=3)
             annotation (Placement(transformation(extent={{56,4},{82,30}})));
             Physiolibrary.Fluid.Components.Inertia inertia(I(displayUnit=
              "mmHg.s2/g") = 93.3256711905, massFlow_start(displayUnit=
              "g/min") = 2.1666666666667e-02) annotation (Placement(
            transformation(
            extent={{-11,-11},{11,11}},
            rotation=180,
            origin={141,17})));
             Physiolibrary.Fluid.Components.Resistor Retha( Resistance(displayUnit="(mmHg.s)/ml") = 7999343.2449)
               annotation (Placement(transformation(extent={{90,6},{112,28}})));
             Physiolibrary.Fluid.Components.Resistor Rsart( Resistance(displayUnit="(mmHg.s)/ml") = 106657909.932)
               annotation (Placement(transformation(extent={{14,-13},{-14,13}},
              origin={24,19})));
             Physiolibrary.Fluid.Components.Resistor Rsven( Resistance(displayUnit="(mmHg.s)/ml") = 26664477.483)
               annotation (Placement(transformation(extent={{14,-13},{-14,13}},
              origin={-60,17})));
           Physiolibrary.Fluid.Components.ElasticVesselElastance Est(
             volume_start=0.283e-3,
             ZeroPressureVolume=0.185e-3,
             Elastance=34930465.50273,
             nPorts=3)
             annotation (Placement(transformation(extent={{-28,6},{-4,28}})));
             Physiolibrary.Fluid.Components.Resistor Rethv( Resistance(displayUnit="(mmHg.s)/ml") = 11999014.86735)
               annotation (Placement(transformation(extent={{-120,4},{-146,30}})));
             Physiolibrary.Fluid.Components.Resistor Rrain( Resistance(displayUnit="(mmHg.s)/ml") = 399967.162245)
               annotation (Placement(transformation(extent={{-208,4},{-236,30}})));
           Physiolibrary.Fluid.Components.ElasticVesselElastance Eithv(
            volume_start=1.48e-3,
             ZeroPressureVolume=1.19e-3,
             ExternalPressure=101325 - 533.28954966,
             Elastance=2426467.450953,
             nPorts=3)
             annotation (Placement(transformation(extent={{-194,4},{-166,30}})));
           Physiolibrary.Fluid.Components.ElasticVesselElastance Eethv(
             volume_start=1.53e-3,
             ZeroPressureVolume=1e-3,
             Elastance=2253148.3473135,
             nPorts=3)
             annotation (Placement(transformation(extent={{-108,4},{-82,30}})));
           Physiolibrary.Fluid.Components.ElasticVesselElastance RightAtrium(
             useElastanceInput=true,
             volume_start=0.000135,
             ZeroPressureVolume=3e-05,
             ExternalPressure=101325 - 533.28954966,
             nPorts=2)
             annotation (Placement(transformation(extent={{-242,44},{-214,72}})));
           Physiolibrary.Fluid.Components.ElasticVesselElastance RightVentricle(
             useElastanceInput=true,
             volume_start=0.131e-3,
             ZeroPressureVolume=4e-05,
             ExternalPressure=101325 - 533.28954966,
             nPorts=2)
             annotation (Placement(transformation(extent={{-170,42},{-140,72}})));
             Physiolibrary.Fluid.Components.IdealValveResistance PulmonaryValve(
               _Roff(displayUnit="g/(mmHg.s)") = Modelica.Constants.inf,
               _Ron(displayUnit="(mmHg.s)/ml") = 399967.162245) annotation (
                 Placement(transformation(extent={{-132,70},{-106,44}})));
             Parts.AtrialElastance RAtrialElastance(EMIN=6666119.37075, EMAX=
            19998358.11225)
               annotation (Placement(transformation(extent={{-244,86},{-206,118}})));
             Parts.VentricularElastance RVentricularElastance(EMIN=7599376.082655,
                 EMAX=65327969.83335)
               annotation (Placement(transformation(extent={{-180,88},{-150,122}})));
             Physiolibrary.Fluid.Components.IdealValveResistance TricuspidValve(
               _Roff=Modelica.Constants.inf,
               _Ron(displayUnit="(mmHg.s)/ml") = 399967.162245) annotation (
                 Placement(transformation(origin={-189,58}, extent={{-13,12},{13,-12}})));
             replaceable Physiolibrary.Types.Constants.FrequencyConst HeartRate(k(
            displayUnit="1/min") = 1.2) annotation (Placement(
            transformation(origin={-243,128.5}, extent={{-11,-6.5},{11,6.5}})));
             inner Modelica.Fluid.System system(p_ambient(displayUnit="mmHg")=
                 101325.0144354, T_ambient=310.15)
               annotation (Placement(transformation(extent={{-48,144},{-28,164}})));
             Sensors.PressureMeasure EithaPressure annotation (Placement(
            transformation(extent={{176,-54},{196,-34}})));
             Sensors.PressureMeasure EethaPressure
               annotation (Placement(transformation(extent={{78,-56},{98,-36}})));
             Sensors.PressureMeasure EstPressure
               annotation (Placement(transformation(extent={{-12,-52},{8,-32}})));
             Sensors.PressureMeasure EethvPressure annotation (Placement(
            transformation(extent={{-92,-52},{-72,-32}})));
             Sensors.PressureMeasure EithvPressure annotation (Placement(
            transformation(extent={{-166,-54},{-146,-34}})));
         equation
             connect(Retha.q_out, inertia.q_out) annotation (Line(
                 points={{112,17},{130,17}},
                 thickness=1));
             connect(HeartRate.y,RAtrialElastance. HR) annotation(Line(points = {{-229.25, 128.5}, {-225, 128.5}, {-225, 114.8}}, color = {0, 0, 127}));
             connect(RVentricularElastance.HR, HeartRate.y) annotation(Line(points = {{-165, 118.6}, {-165, 128.5}, {-229.25, 128.5}}, color = {0, 0, 127}));
             connect(LAtrialElastance.HR, HeartRate.y) annotation (Line(
                 points={{99,120.8},{99,128.5},{-229.25,128.5}},
                 color={0,0,127}));
             connect(LVentricularElastance.HR, HeartRate.y) annotation (Line(
                 points={{182,116.8},{182,128.5},{-229.25,128.5}},
                 color={0,0,127}));
             connect(Rrain.q_out, RightAtrium.q_in[1]) annotation (Line(
                 points={{-236,17},{-254,17},{-254,59.82},{-228.14,59.82}},
                 color={127,0,0},
                 thickness=0.5));
             connect(RightAtrium.q_in[2], TricuspidValve.q_in) annotation (Line(
                 points={{-228.14,56.18},{-214,56.18},{-214,58},{-202,58}},
                 color={127,0,0},
                 thickness=0.5));
             connect(TricuspidValve.q_out, RightVentricle.q_in[1]) annotation (
                 Line(
                 points={{-176,58},{-166,58},{-166,58.95},{-155.15,58.95}},
                 color={127,0,0},
                 thickness=0.5));
             connect(RightVentricle.q_in[2], PulmonaryValve.q_in) annotation (Line(
                 points={{-155.15,55.05},{-143.725,55.05},{-143.725,57},{-132,57}},
                 color={127,0,0},
                 thickness=0.5));

             connect(PulmonaryValve.q_out, Epa.q_in[1]) annotation (Line(
                 points={{-106,57},{-94,57},{-94,99.82},{-80.14,99.82}},
                 color={127,0,0},
                 thickness=0.5));
             connect(Epa.q_in[2], Rpp.q_in) annotation (Line(
                 points={{-80.14,96.18},{-68,96.18},{-68,98},{-56,98}},
                 color={127,0,0},
                 thickness=0.5));
             connect(Rpp.q_out, Epv.q_in[1]) annotation (Line(
                 points={{-22,98},{-8,98},{-8,99.82},{2.83,99.82}},
                 color={127,0,0},
                 thickness=0.5));
             connect(Epv.q_in[2], Rlain.q_in) annotation (Line(
                 points={{2.83,96.18},{16,96.18},{16,98},{26,98}},
                 color={127,0,0},
                 thickness=0.5));
             connect(Rlain.q_out, LeftAtrium.q_in[1]) annotation (Line(
                 points={{56,98},{70,98},{70,65.82},{87.86,65.82}},
                 color={127,0,0},
                 thickness=0.5));
             connect(LeftAtrium.q_in[2], MitralValve.q_in) annotation (Line(
                 points={{87.86,62.18},{102,62.18},{102,64},{114,64}},
                 color={127,0,0},
                 thickness=0.5));
             connect(MitralValve.q_out, LeftVentricle.q_in[1]) annotation (Line(
                 points={{140,64},{154,64},{154,66},{163.86,66},{163.86,65.82}},
                 color={127,0,0},
                 thickness=0.5));
             connect(LeftVentricle.q_in[2], AorticValve.q_in) annotation (Line(
                 points={{163.86,62.18},{172,62.18},{172,64},{184,64}},
                 color={127,0,0},
                 thickness=0.5));
             connect(AorticValve.q_out, Eitha.q_in[1]) annotation (Line(
                 points={{208,64},{224,64},{224,18.9067},{178.89,18.9067}},
                 color={127,0,0},
                 thickness=0.5));
             connect(inertia.q_in, Eitha.q_in[2]) annotation (Line(
                 points={{152,17},{164,17},{164,17},{178.89,17}},
                 color={127,0,0},
                 thickness=0.5));
             connect(Retha.q_in, Eetha.q_in[1]) annotation (Line(
                 points={{90,17},{80,17},{80,19.2533},{68.87,19.2533}},
                 color={127,0,0},
                 thickness=0.5));
             connect(Rsart.q_in, Eetha.q_in[2]) annotation (Line(
                 points={{38,19},{52,19},{52,17},{68.87,17}},
                 color={127,0,0},
                 thickness=0.5));
             connect(Est.q_in[1], Rsart.q_out) annotation (Line(
                 points={{-16.12,18.9067},{-3.18,18.9067},{-3.18,19},{10,19}},
                 color={127,0,0},
                 thickness=0.5));
             connect(Est.q_in[2], Rsven.q_in) annotation (Line(
                 points={{-16.12,17},{-31.18,17},{-31.18,17},{-46,17}},
                 color={127,0,0},
                 thickness=0.5));
             connect(Rsven.q_out, Eethv.q_in[1]) annotation (Line(
                 points={{-74,17},{-86,17},{-86,19.2533},{-95.13,19.2533}},
                 color={127,0,0},
                 thickness=0.5));
             connect(Rethv.q_in, Eethv.q_in[2]) annotation (Line(
                 points={{-120,17},{-107,17},{-107,17},{-95.13,17}},
                 color={127,0,0},
                 thickness=0.5));
             connect(Rethv.q_out, Eithv.q_in[1]) annotation (Line(
                 points={{-146,17},{-164,17},{-164,19.2533},{-180.14,19.2533}},
                 color={127,0,0},
                 thickness=0.5));
             connect(Rrain.q_in, Eithv.q_in[2]) annotation (Line(
                 points={{-208,17},{-194,17},{-194,17},{-180.14,17}},
                 color={127,0,0},
                 thickness=0.5));
             connect(EithaPressure.q_in, Eitha.q_in[3]) annotation (Line(
                 points={{182,-50},{180,-50},{180,15.0933},{178.89,15.0933}},
                 color={127,0,0},
                 thickness=0.5));
             connect(EethaPressure.q_in, Eetha.q_in[3]) annotation (Line(
                 points={{84,-52},{84,-54},{68.87,-54},{68.87,14.7467}},
                 color={127,0,0},
                 thickness=0.5));
             connect(EstPressure.q_in, Est.q_in[3]) annotation (Line(
                 points={{-6,-48},{-16.12,-48},{-16.12,15.0933}},
                 color={127,0,0},
                 thickness=0.5));
             connect(EethvPressure.q_in, Eethv.q_in[3]) annotation (Line(
                 points={{-86,-48},{-95.13,-48},{-95.13,14.7467}},
                 color={127,0,0},
                 thickness=0.5));
             connect(Eithv.q_in[3], EithvPressure.q_in) annotation (Line(
                 points={{-180.14,14.7467},{-180.14,-50},{-160,-50}},
                 color={127,0,0},
                 thickness=0.5));
           connect(
                RAtrialElastance.Et, RightAtrium.elastance) annotation (Line(
              points={{-202.39,101.84},{-202.39,85.92},{-225.2,85.92},{-225.2,
                70.6}}, color={0,0,127}));
           connect(
                RVentricularElastance.Et, RightVentricle.elastance) annotation (
           Line(points={{-147.15,108.91},{-134,108.91},{-134,76},{-152,76},{
                -152,70.5}}, color={0,0,127}));
           connect(
                LAtrialElastance.Et, LeftAtrium.elastance) annotation (Line(
              points={{121.61,107.84},{121.61,91.92},{90.8,91.92},{90.8,76.6}},
              color={0,0,127}));
           connect(
                LVentricularElastance.Et, LeftVentricle.elastance) annotation (
            Line(points={{203.42,107.68},{222,107.68},{222,76.6},{166.8,76.6}},
              color={0,0,127}));
             annotation(Diagram(coordinateSystem(extent={{-280,-140},{280,180}},      preserveAspectRatio=false)),             Icon(coordinateSystem(extent = {{-280, -140}, {280, 180}}, preserveAspectRatio = false), graphics),
               Documentation(info="<html>
        <p>Model of cardiovascular system using to demonstrate elastic and resistance features of veins and arteries in pulmonary and systemic circulation and influence of cardiac output on it.</p>
        <ul>
        <li>J. A. Goodwin, W. L. van Meurs, C. D. Sa Couto, J. E. W.Beneken, S. A. Graves, A model for educational simulation of infant cardiovascular physiology., Anesthesia and analgesia 99 (6)(2004) 1655&ndash;1664. doi:10.1213/01.ANE.0000134797.52793.AF.</li>
        <li>C. D. Sa Couto, W. L. van Meurs, J. A. Goodwin, P. Andriessen,A Model for Educational Simulation of Neonatal Cardiovascular Pathophysiology, Simulation in Healthcare 1 (Inaugural) (2006) 4&ndash;12.</li>
        <li>W. van Meurs, Modeling and Simulation in Biomedical Engineering: Applications in Cardiorespiratory Physiology, McGraw-Hill Professional, 2011.</li>
        </ul>
        </html>",                  revisions="<html>
        <ul>
        <li><i>Jul 2015 </i>by Tomas Kulhanek: Created. </li>
        </ul>
        </html>"),           experiment(StopTime=5));
         end HemodynamicsMeurs_flatNorm;
      annotation (Documentation(info=
                                "<html>
	</html>"));
       end MeursModel2011;

       package Dialysis
         extends Modelica.Icons.ExamplesPackage;
         model DialysisMembrane
           import Physiolibrary;

           replaceable package BloodPlasma = Physiolibrary.Media.BodyFluid constrainedby
          Physiolibrary.Media.BodyFluid "Medium model of blood plasma" annotation (
               choicesAllMatching=true);

           replaceable package Dialysate = Physiolibrary.Media.BodyFluid constrainedby
          Physiolibrary.Media.BodyFluid "Medium model of dialysate" annotation (
               choicesAllMatching=true);

           parameter Physiolibrary.Types.HydraulicCompliance Compliance=7.5006157584566e-09
             "Hydraulic compliance";

           parameter Physiolibrary.Types.HydraulicResistance Resistance=15998686.4898
             "Hydraulic resistance";

           parameter Physiolibrary.Types.Permeability Permeabilities[BloodPlasma.nS]={1e-06,1e-06,1e-06,1e-06,1e-06,1e-06,1e-06,1e-06,
               0,0,0,1e-06}
             "Membrane permeability coeficients for {Na,HCO3-,K,Glu,Urea,Cl,Ca,Mg,Alb,Glb,Others,H2O}";

           parameter Modelica.Units.SI.MassFraction InitialPlasma[BloodPlasma.nS-1](displayUnit="%")={0.0031,0.0015,0.0002,0.0009,0.0018,
             0.0038,6e-05,1.2e-05,0.047,0.053,1e-11}
               "Initial blood plasma substances mass fractions {Na,HCO3-,K,Glu,Urea,Cl,Ca,Mg,Alb,Glb,Others,H2O}"
               annotation (Dialog(group="Initialization"));
           //concentrations: { 135,24,5,5,30,105,1.5,0.5,0.7,0.8,1e-06} mmmol/L
           parameter Modelica.Units.SI.MassFraction InitialDialysate[Dialysate.nS-1](displayUnit="%")={0.0032,0.002,0.00012,0.0009,1e-11,
             0.004,6e-05,1.2e-05,1e-08,1e-08,0.00028}
               "Initial dialysate substances mass fractions {Na,HCO3-,K,Glu,Urea,Cl,Ca,Mg,Alb,Glb,Others,H2O}"
               annotation (Dialog(group="Initialization"));
           //concantrations: {138,32,3,5,1e-06,111,1e-06,1e-06,1e-06,1e-06,1e-06} mmol/L

           parameter Modelica.Units.SI.Pressure InitialBloodPressure(displayUnit="mmHg") = 0
             "Initial relative blood pressure"
             annotation (Dialog(group="Initialization"));
           parameter Modelica.Units.SI.Pressure InitialDialysatePressure(displayUnit="mmHg") = 0
             "Initial relative dialysate pressure"
             annotation (Dialog(group="Initialization"));


           Physiolibrary.Fluid.Components.Resistor blood_pipe(
             redeclare package Medium = BloodPlasma,
             EnthalpyNotUsed=false,
             Resistance(displayUnit="(mmHg.min)/l") = Resistance) annotation (Placement(
                 transformation(
                 extent={{-10,-10},{10,10}},
                 rotation=90,
                 origin={-94,-58})));
           Physiolibrary.Fluid.Components.Resistor dialysatePipe(
             redeclare package Medium = Dialysate,
             EnthalpyNotUsed=false,
             Resistance=Resistance) annotation (Placement(transformation(
                 extent={{-10,-10},{10,10}},
                 rotation=270,
                 origin={94,48})));


           Physiolibrary.Fluid.Interfaces.FluidPort_a blood_in(redeclare package
            Medium =
                 BloodPlasma)
             annotation (Placement(transformation(extent={{-70,-110},{-50,-90}})));
           Physiolibrary.Fluid.Interfaces.FluidPort_b blood_out(redeclare package
            Medium =
                 BloodPlasma)
             annotation (Placement(transformation(extent={{-70,110},{-50,90}})));
           Physiolibrary.Fluid.Interfaces.FluidPort_a dialysate_in(redeclare package
            Medium =
                 Dialysate) annotation (Placement(transformation(extent={{50,110},{70,90}})));
           Physiolibrary.Fluid.Interfaces.FluidPort_b dialysate_out(redeclare package
            Medium =
                 Dialysate) annotation (Placement(transformation(extent={{50,-110},{70,-90}})));

           Chemical.Components.Membrane membrane[BloodPlasma.nS](each EnthalpyNotUsed=false, KC=
                 Permeabilities)
                            annotation (Placement(transformation(extent={{-8,-14},{12,6}})));

           Physiolibrary.Fluid.Components.ElasticVessel bloodVessel(
             redeclare package Medium = BloodPlasma,
             useSubstances=true,
             volume_start=InitialBloodPressure*Compliance,
             massFractions_start=InitialPlasma,
             EnthalpyNotUsed=false,
             Compliance(displayUnit="ml/mmHg") = Compliance,
             ZeroPressureVolume(displayUnit="m3"),
             nPorts=2) annotation (Placement(transformation(
                 extent={{-10,-10},{10,10}},
                 rotation=180,
                 origin={-68,-4})));

           Physiolibrary.Fluid.Components.ElasticVessel dialysateVessel(
             redeclare package Medium = Dialysate,
             useSubstances=true,
             onElectricGround=true,
             volume_start=InitialDialysatePressure*Compliance,
             massFractions_start=InitialDialysate,
             EnthalpyNotUsed=false,
             Compliance(displayUnit="ml/mmHg") = Compliance,
             nPorts=2) annotation (Placement(transformation(extent={{66,-14},{86,6}})));

         equation

           connect(membrane.port_b, dialysateVessel.substances)
             annotation (Line(points={{12,-4},{66,-4}}, color={158,66,200}));
           connect(bloodVessel.substances, membrane.port_a)
             annotation (Line(points={{-58,-4},{-8,-4}}, color={158,66,200}));
           connect(blood_pipe.q_in, blood_in) annotation (Line(
               points={{-94,-68},{-94,-100},{-60,-100}},
               color={127,0,0},
               thickness=0.5));
           connect(blood_pipe.q_out, bloodVessel.q_in[1]) annotation (Line(
               points={{-94,-48},{-94,-5.3},{-67.9,-5.3}},
               color={127,0,0},
               thickness=0.5));
           connect(dialysatePipe.q_in, dialysate_in) annotation (Line(
               points={{94,58},{94,100},{60,100}},
               color={127,0,0},
               thickness=0.5));
           connect(dialysatePipe.q_out, dialysateVessel.q_in[1]) annotation (Line(
               points={{94,38},{94,-2},{75.9,-2},{75.9,-2.7}},
               color={127,0,0},
               thickness=0.5));
           connect(blood_out, bloodVessel.q_in[2]) annotation (Line(
               points={{-60,100},{-94,100},{-94,-2.7},{-67.9,-2.7}},
               color={127,0,0},
               thickness=0.5));
           connect(dialysate_out, dialysateVessel.q_in[2]) annotation (Line(
               points={{60,-100},{94,-100},{94,-5.3},{75.9,-5.3}},
               color={127,0,0},
               thickness=0.5));
           annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={Rectangle(
                   extent={{-100,100},{0,-100}},
                   lineColor={255,255,0},
                   fillColor={238,46,47},
                   fillPattern=FillPattern.VerticalCylinder), Rectangle(
                   extent={{0,100},{100,-100}},
                   lineColor={255,255,0},
                   fillPattern=FillPattern.VerticalCylinder,
                   fillColor={28,108,200})}), Diagram(coordinateSystem(preserveAspectRatio=false)));
         end DialysisMembrane;

         model Dialysis
           extends Modelica.Icons.Example;

           replaceable package BloodPlasma =
               Physiolibrary.Media.BodyFluid
               "Medium model of blood plasma"
              annotation (choicesAllMatching=true);


           replaceable package Dialysate =
               Physiolibrary.Media.BodyFluid
               "Medium model of dialysate"
              annotation (choicesAllMatching=true);


           parameter Integer N=5 "Number of parts";

         parameter Modelica.Units.SI.MassFraction PlasmaSubstances[
           BloodPlasma.nS-1](displayUnit="%")={0.00310,0.00146,0.0002,0.0009,0.0018,
             0.00376,6e-05,1e-05,0.04655,0.0532,1e-11}
            "Mass fractions of {Na,HCO3-,K,Glu,Urea,Cl,Ca,Mg,Alb,Glb,Others} in inflowing blood plasma";
           //{135,24,5,5,30,106,1.5,0.5,0.7,0.8,1e-6};

         parameter Modelica.Units.SI.MassFraction DialysateSubstances[
           Dialysate.nS-1](displayUnit="%")={0.00317,0.00195,0.000117,0.0009,6e-11,0.004,
             6e-05,1e-05,6e-08,6e-08,0.000281}
             "Mass fractions of {Na,HCO3-,K,Glu,Urea,Cl,Ca,Mg,Alb,Glb,Others} in inflowing dialysate";
           /*{138,32,3,5,1e-6,113,1.5,0.5,1e-6,1e-6,15.6};*/

         parameter Modelica.Units.SI.Pressure InitialBloodPressure=23998.0297347
                                      "Initial blood pressure";

         parameter Modelica.Units.SI.Pressure InitialDialysatePressure=78660.20857485
                                                  "Initial dialysate pressure";


           Physiolibrary.Fluid.Examples.Dialysis.DialysisMembrane dialysis[N](
             each InitialPlasma=PlasmaSubstances,
             each InitialDialysate=DialysateSubstances,
             InitialBloodPressure={i*(InitialBloodPressure)/(N + 1) for i in 1:N},
             InitialDialysatePressure={(N - i + 1)*(InitialDialysatePressure)/(N + 1)
                 for i in 1:N},
          each Permeabilities={1,1,1,1,1,1,0,0,0,0,0,1}*1e-6,
             redeclare package BloodPlasma = BloodPlasma,
             redeclare package Dialysate = Dialysate)
             annotation (Placement(transformation(extent={{16,-18},{36,2}})));

           inner Modelica.Fluid.System system(T_ambient=310.15)
             annotation (Placement(transformation(extent={{-92,-6},{-72,14}})));

         Modelica.Blocks.Sources.Sine sine_blood_pressure_input(
           f(displayUnit="1/min") = 0.16666666666667,
           amplitude=20000,
           offset=InitialBloodPressure + 101325) annotation (Placement(
               transformation(extent={{-50,-76},{-30,-56}})));
         Modelica.Blocks.Sources.Sine sine_dialysate_pressure_input(
           f(displayUnit="1/min") = 0.41666666666667,
           amplitude=50000,
           offset=InitialDialysatePressure + 101325)
           annotation (Placement(transformation(extent={{94,60},{74,80}})));
           Physiolibrary.Fluid.Sources.PressureSource blood_output(redeclare package Medium =
                                BloodPlasma) annotation (Placement(
                 transformation(extent={{-74,60},{-54,80}})));
           Physiolibrary.Fluid.Sources.PressureSource blood_input(redeclare package Medium =
                                BloodPlasma, usePressureInput=true,
            massFractions_start=PlasmaSubstances)
             annotation (Placement(transformation(extent={{-16,-84},{4,-64}})));

           Sources.PressureSource dialysate_input(
          redeclare package Medium = Dialysate,
          usePressureInput=true,
           massFractions_start=DialysateSubstances)
             annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={48,70})));

           Physiolibrary.Fluid.Sources.PressureSource dialysate_output(
               redeclare package Medium = Dialysate) annotation (Placement(
                 transformation(
                 extent={{-10,-10},{10,10}},
                 rotation=180,
                 origin={86,-74})));
         Physiolibrary.Fluid.Components.Resistor resistorB(
             redeclare package Medium = BloodPlasma,
             EnthalpyNotUsed=true,
             Resistance=15998686.4898) annotation (Placement(transformation(
                   extent={{-26,60},{-6,80}})));
         Physiolibrary.Fluid.Components.Resistor resistorD(redeclare package Medium =
                        Dialysate, Resistance=15998686.4898) annotation (
               Placement(transformation(extent={{40,-84},{60,-64}})));
           Sensors.MassFractions Urea_bloodOut(redeclare package Medium = BloodPlasma, substanceName="Urea")
          annotation (Placement(transformation(extent={{-36,18},{-16,38}})));
           Sensors.MassFractions Urea_dialysateOut(redeclare package Medium =
              BloodPlasma,
               substanceName="Urea")
             annotation (Placement(transformation(extent={{64,-24},{84,-4}})));
         equation

           for i in 1:N-1 loop
             connect(dialysis[i].blood_out, dialysis[i+1].blood_in);
           end for;

           for i in 1:N-1 loop
             connect(dialysis[i+1].dialysate_out, dialysis[i].dialysate_in);
           end for;

           connect(blood_input.y, dialysis[1].blood_in) annotation (Line(
               points={{4,-74},{20,-74},{20,-18}},
               color={127,0,0},
               thickness=0.5));
           connect(sine_blood_pressure_input.y, blood_input.pressure) annotation (Line(
                 points={{-29,-66},{-24,-66},{-24,-74},{-16,-74}}, color={0,0,127}));
           connect(dialysate_input.y, dialysis[N].dialysate_in) annotation (Line(
               points={{38,70},{32,70},{32,2}},
               color={127,0,0},
               thickness=0.5));
           connect(sine_dialysate_pressure_input.y,dialysate_input.pressure)
             annotation (Line(points={{73,70},{58,70}},                 color={0,0,127}));
         connect(resistorB.q_out, dialysis[N].blood_out) annotation (Line(
             points={{-6,70},{20,70},{20,2}},
             color={127,0,0},
             thickness=0.5));
         connect(resistorB.q_in, blood_output.y) annotation (Line(
             points={{-26,70},{-54,70}},
             color={127,0,0},
             thickness=0.5));
         connect(resistorD.q_in, dialysis[1].dialysate_out) annotation (Line(
             points={{40,-74},{32,-74},{32,-18}},
             color={127,0,0},
             thickness=0.5));
         connect(resistorD.q_out, dialysate_output.y) annotation (Line(
             points={{60,-74},{76,-74}},
             color={127,0,0},
             thickness=0.5));
           connect(
                dialysis[N].blood_out, Urea_bloodOut.port)
          annotation (Line(
            points={{20,2},{20,12},{-26,12},{-26,18}},
            color={127,0,0},
            thickness=0.5));
           connect(
                dialysis[1].dialysate_out, Urea_dialysateOut.port)
          annotation (Line(
            points={{32,-18},{32,-30},{74,-30},{74,-24}},
            color={127,0,0},
            thickness=0.5));
           annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
                 coordinateSystem(preserveAspectRatio=false)),
             experiment(
               StopTime=30,
               Tolerance=1e-05,
               __Dymola_Algorithm="Dassl"));
         end Dialysis;

       end Dialysis;

       model MinimalRespiration "Minimal respiration model"
         extends Modelica.Icons.Example;

         import Modelica.Units.SI.*;

         replaceable package Air = Media.Air;

         parameter Frequency RespirationRate(displayUnit="1/min") = 0.2
        "Respiration rate";
         parameter Volume ResidualVolume(displayUnit="l") = 0.0013
        "Lungs residual volume";

         parameter Volume FunctionalResidualCapacity(displayUnit="l")=
        0.00231
        "Functional residual capacity";
         parameter Physiolibrary.Types.HydraulicResistance TotalResistance(
          displayUnit="(cmH2O.s)/l") = 147099.75
        "Total lungs pathways conductance";
         parameter Physiolibrary.Types.HydraulicCompliance TotalCompliance(
          displayUnit="ml/mmHg") = 6.0004926067653e-07 "Total lungs compliance";

         parameter Pressure Pmin(displayUnit="kPa") = -1000
        "Relative external lungs pressure minimum caused by respiratory muscles";
         parameter Pressure Pmax(displayUnit="kPa") = 0
        "Relative external lungs pressure maximum";
         parameter Real RespiratoryMusclePressureCycle[:,3]={
        {0,system.p_ambient + Pmax,0},
        {3/8,system.p_ambient + Pmin,0},
        {1,system.p_ambient + Pmax,0}}
        "Absolute external lungs pressure during respiration cycle scaled to time period (0,1)";


         parameter Volume LungsAirVolume_initial=FunctionalResidualCapacity;



         Blocks.Source.PeriodicCurveSource respiratoryMusclePressureCycle(
          data=
            RespiratoryMusclePressureCycle)
        "Relative position in respiratory cycle (0,1) to absolute external lungs pressure"
        annotation (Placement(transformation(extent={{18,54},{38,74}})));

       Physiolibrary.Fluid.Components.ElasticVessel lungs(
        redeclare package Medium = Air,
        use_mass_start=false,
        volume_start=LungsAirVolume_initial,
        use_concentration_start=true,
        massFractions_start=Air.reference_X,
        concentration_start=((Air.reference_X ./ Air.MMb)*Air.density_pTX(
                   101325,
                   298.15,
                   Air.reference_X))[1:Air.nS - 1],
        EnthalpyNotUsed=false,
        ZeroPressureVolume=FunctionalResidualCapacity,
        Compliance=TotalCompliance,
        useExternalPressureInput=true,
        nPorts=2) "Lungs"
        annotation (Placement(transformation(extent={{36,-28},{56,-8}})));


         Physiolibrary.Fluid.Sensors.PressureMeasure lungsPressureMeasure(
          redeclare package Medium = Air) "Lungs pressure"
        annotation (Placement(transformation(extent={{70,-20},{90,0}})));

         inner Modelica.Fluid.System system(T_ambient=310.15)
         "Human body system setting"
        annotation (Placement(transformation(extent={{60,66},{80,86}})));

         Physiolibrary.Fluid.Sources.PressureSource environment(redeclare package
          Medium = Air)                           "External environment"
        annotation (Placement(transformation(extent={{-76,-30},{-56,-10}})));

         Components.Resistor resistor(redeclare package Medium = Air,
        EnthalpyNotUsed=false,
          Resistance=
            TotalResistance)
        annotation (Placement(transformation(extent={{-6,-30},{14,-10}})));

         Types.Constants.FrequencyConst frequency(k=RespirationRate)
        annotation (Placement(transformation(extent={{-46,62},{-38,70}})));
         Sensors.FlowMeasure flowMeasure(redeclare package Medium = Air)
        annotation (Placement(transformation(extent={{-40,-30},{-20,-10}})));
       equation

         connect(
          lungsPressureMeasure.q_in, lungs.q_in[1]) annotation (Line(
          points={{76,-16},{76,-16.7},{45.9,-16.7}},
          color={127,0,0},
          thickness=0.5));
         connect(
          resistor.q_out, lungs.q_in[2]) annotation (Line(
          points={{14,-20},{28,-20},{28,-19.3},{45.9,-19.3}},
          color={127,0,0},
          thickness=0.5));
         connect(
          frequency.y, respiratoryMusclePressureCycle.frequence) annotation (
          Line(points={{-37,66},{-8,66},{-8,64},{18,64}}, color={0,0,127}));
         connect(
          respiratoryMusclePressureCycle.val, lungs.externalPressure)
        annotation (Line(points={{38,64},{52,64},{52,-9}}, color={0,0,127}));
         connect(
              environment.y, flowMeasure.q_in)
        annotation (Line(
          points={{-56,-20},{-40,-20}},
          color={127,0,0},
          thickness=0.5));
         connect(
              flowMeasure.q_out, resistor.q_in)
        annotation (Line(
          points={{-20,-20},{-6,-20}},
          color={127,0,0},
          thickness=0.5));
         annotation (
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}})),
        Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
        experiment(StopTime=16, __Dymola_Algorithm="Dassl"),
        Documentation(info=
                       "<html>
        <p>References:</p>
        <p><br>Mecklenburgh, J. S., and W. W. Mapleson. &quot;Ventilatory assistance and respiratory muscle activity. 1: Interaction in healthy volunteers.&quot; <i>British journal of anaesthesia</i> 80.4 (1998): 422-433.</p>
        </html>"));
       end MinimalRespiration;

       model BloodGasesEquilibrium
         extends Modelica.Icons.Example;

         import Modelica.Units.SI.*;

         replaceable package Air = Chemical.Media.SimpleAir_C; //Chemical.Media.Air_MixtureGasNasa;
         replaceable package Blood =
          Physiolibrary.Media.BloodBySiggaardAndersen;

         inner Modelica.Fluid.System system(T_ambient=310.15)
                                            "Human body system setting"
           annotation (Placement(transformation(extent={{60,66},{80,86}})));

         Physiolibrary.Fluid.Components.ElasticVessel blood(
        redeclare package Medium = Blood,
        useSubstances=true,
        use_mass_start=true,
        mass_start=1,
        concentration_start(displayUnit="mmol/l") = {0.45,8.2,21.5,1e-06,8.4,0.042,
          0.042,0.66,28,0.153,5.4,37},
        EnthalpyNotUsed=false,
        Compliance=1,
        nPorts=3) annotation (Placement(transformation(extent={{-4,-52},{16,-32}})));
       // massFractions_start=zeros(Blood.nS - 1),
       // massPartition_start=zeros(Blood.nS),
       // amountPartition_start=zeros(Blood.nS),
         Chemical.Components.GasSolubility gasSolubility(KC=1e-6)
        annotation (Placement(transformation(extent={{-58,-20},{-38,0}})));
         Chemical.Components.GasSolubility gasSolubility1(KC=1e-6)
        annotation (Placement(transformation(extent={{-40,-20},{-20,0}})));
         Chemical.Components.GasSolubility gasSolubility2(KC=1e-7)
        annotation (Placement(transformation(extent={{-22,-20},{-2,0}})));
         Chemical.Sources.ExternalIdealGasSubstance O2(
        substanceData=Chemical.Substances.Oxygen_gas(),
        usePartialPressureInput=false,
        PartialPressure(displayUnit="mmHg") = 133.322387415)
        annotation (Placement(transformation(extent={{-96,18},{-76,38}})));
         Chemical.Sources.ExternalIdealGasSubstance CO2(substanceData=
            Chemical.Substances.CarbonDioxide_gas(), PartialPressure(
            displayUnit="mmHg") = 5332.8954966)
        annotation (Placement(transformation(extent={{-70,52},{-50,72}})));
         Chemical.Sources.ExternalIdealGasSubstance CO(substanceData=
            Chemical.Substances.CarbonMonoxide_gas(),
          PartialPressure(displayUnit="mmHg") = 0.000133322387415) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={28,34})));
         Sensors.pH pH(redeclare package Medium = Media.BloodBySiggaardAndersen)
           "Acidity of blood"
        annotation (Placement(transformation(extent={{54,-74},{74,-54}})));
         Sensors.PartialPressure pO2(
           redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
           substanceData=Chemical.Substances.Oxygen_gas(),
           redeclare package Medium = Media.BloodBySiggaardAndersen)
           "Partial pressure of O2 in blood"
           annotation (Placement(transformation(extent={{-78,-70},{-58,-50}})));
         Sensors.MassFractions XO2(redeclare package Medium =
            Media.BloodBySiggaardAndersen,
             substanceName="O2") "Mass fraction of O2 in blood"
           annotation (Placement(transformation(extent={{44,-20},{64,0}})));
       equation

         connect(
              gasSolubility.liquid_port, blood.substances[2])
        annotation (Line(points={{-48,-20},{-48,-42},{-4,-42}}, color={158,66,200}));
         connect(
              gasSolubility1.liquid_port, blood.substances[3])
        annotation (Line(points={{-30,-20},{-30,-48},{-4,-48},{-4,-42}}, color={158,66,200}));
         connect(
              O2.port_a, gasSolubility.gas_port)
        annotation (Line(points={{-76,28},{-48,28},{-48,0}}, color={158,66,200}));
         connect(
              CO2.port_a, gasSolubility1.gas_port)
        annotation (Line(points={{-50,62},{-30,62},{-30,0}}, color={158,66,200}));
         connect(
              CO.port_a, gasSolubility2.gas_port)
        annotation (Line(points={{18,34},{-12,34},{-12,0}}, color={158,66,200}));
         connect(
              gasSolubility2.liquid_port, blood.substances[4])
        annotation (Line(points={{-12,-20},{-12,-42},{-4,-42}}, color={158,66,200}));
         connect(
              pH.port_a, blood.substances[13]) annotation (Line(points={{74,-64},{78,
              -64},{78,-34},{20,-34},{20,-28},{-12,-28},{-12,-42},{-4,-42}}, color={
              158,66,200}));
         connect(
              pH.referenceFluidPort, blood.q_in[1]) annotation (Line(
          points={{64,-73.8},{64,-78},{4,-78},{4,-46},{5.9,-46},{5.9,-40.2667}},
          color={127,0,0},
          thickness=0.5));
         connect(gasSolubility.liquid_port, pO2.port_a) annotation (Line(points={{-48,-20},{-48,
                 -42},{-54,-42},{-54,-60},{-58,-60}}, color={158,66,200}));
         connect(pO2.referenceFluidPort, blood.q_in[2]) annotation (Line(
             points={{-68,-69.8},{-32,-69.8},{-32,-60},{4,-60},{4,-46},{5.9,-46},{5.9,-42}},
             color={127,0,0},
             thickness=0.5));
         connect(XO2.port, blood.q_in[3]) annotation (Line(
             points={{54,-20},{54,-50},{20,-50},{20,-56},{4,-56},{4,-46},{5.9,-46},{
              5.9,-43.7333}},
             color={127,0,0},
             thickness=0.5));

         annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                   {100,100}})),                                        Diagram(
               coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
           experiment(
          StopTime=1,
          __Dymola_fixedstepsize=0.1,
          __Dymola_Algorithm="Dassl"),
           Documentation(info="<html>
<p>References:</p>
<p><br>Mecklenburgh, J. S., and W. W. Mapleson. &quot;Ventilatory assistance and respiratory muscle activity. 1: Interaction in healthy volunteers.&quot; <i>British journal of anaesthesia</i> 80.4 (1998): 422-433.</p>
</html>"));
       end BloodGasesEquilibrium;

       model Respiration "Human respiration model"
         extends Modelica.Icons.Example;

         import Modelica.Units.SI.*;

         replaceable package Air = Media.Air;               //Chemical.Media.SimpleAir_C; //Kitware.Air_IdealGas; //Chemical.Media.SimpleAir_C; //Chemical.Media.Air_MixtureGasNasa;
         replaceable package PleuralFluid =
             Physiolibrary.Media.Water;

         parameter Boolean EnthalpyNotUsed = false;

         parameter Pressure IntrathoraxPressure = system.p_ambient - 700;
         parameter Frequency RespirationRate=0.08                                                               "Respiration rate";
         parameter Volume ResidualVolume=0.0013                                                      "Lungs residual volume";
         parameter Volume TotalLungCapacity=0.00623                                                      "Total Lung Capacity";
         parameter Volume BaseTidalVolume=0.0005                                                      "Base Tidal Volume";
         parameter Volume LungsAirVolume_initial = 0.0031 "Initial volume of alveolar space";
         parameter Volume pleuralVolume_initial = 0.0001 "Initial volume of pleural fluid";

         parameter Volume FunctionalResidualCapacity=0.00231                                                      "Functional residual capacity";

         parameter Physiolibrary.Types.HydraulicResistance TotalResistance=147099.75
           "Total lungs pathways resistance";

         parameter Real BronchiResistanceFraction = 0.3;
         parameter Real AlveoliDuctResistanceFraction = 0.2;
         parameter Real TracheaResistanceFraction = 1 - (BronchiResistanceFraction+AlveoliDuctResistanceFraction)/2;

         parameter Physiolibrary.Types.HydraulicResistance TracheaResistance=TotalResistance*TracheaResistanceFraction
           "Left Bronchi Resistance";
         parameter Physiolibrary.Types.HydraulicResistance LeftBronchiResistance=TotalResistance*BronchiResistanceFraction
           "Left Bronchi Resistance";
         parameter Physiolibrary.Types.HydraulicResistance LeftAlveoliResistance=TotalResistance*AlveoliDuctResistanceFraction
           "Left Alveoli Resistance";
           parameter Physiolibrary.Types.HydraulicResistance RightBronchiResistance=TotalResistance*BronchiResistanceFraction
           "Right Bronchi Resistance";
           parameter Physiolibrary.Types.HydraulicResistance RightAlveoliResistance=TotalResistance*AlveoliDuctResistanceFraction
           "Right Alveoli Resistance";

         parameter Physiolibrary.Types.HydraulicCompliance TotalCompliance(displayUnit=
              "l/cmH2O")=1.0197162129779e-06            "Total lungs compliance";

         parameter Pressure Pmin=-533.28954966                                   "Relative external lungs pressure minimum caused by respiratory muscles";
         parameter Pressure Pmax(displayUnit="mmHg")=0    "Relative external lungs pressure maximum";
         parameter Real RespiratoryMusclePressureCycle[:,3] = {
               {0,Pmax,0},
               {3/8,Pmin,0},
               {1,Pmax,0}}
                 "Absolute external lungs pressure during respiration cycle scaled to time period (0,1)";

         parameter Temperature CoreTemperature=310.15                       "body temperature";
         parameter Temperature EnvironmentTemperature=298.15                       "external air temperature";

         parameter Mass m_initial = LungsAirVolume_initial*Air.density(Air.setState_pTX(system.p_ambient
                + Pmax, CoreTemperature,Air.reference_X));

       //  parameter Density d = Air.density(Air.setState_pTX(system.p_ambient+Pmax,CoreTemperature));

         Physiolibrary.Blocks.Source.PeriodicCurveSource respiratoryMusclePressureCycle(data=
               RespiratoryMusclePressureCycle)
           "Relative position in respiratory cycle (0,1) to absolute external lungs pressure"
           annotation (Placement(transformation(extent={{-34,72},{-14,92}})));

         Physiolibrary.Fluid.Components.ElasticVessel leftAlveoli(
           redeclare package Medium = Air,
           volume_start=LungsAirVolume_initial,
        use_concentration_start=true,
           concentration_start={100,40,47,760 - 187},
           useThermalPort=true,
           ZeroPressureVolume=FunctionalResidualCapacity,
           ResidualVolume=ResidualVolume,
           Compliance=TotalCompliance,
           useExternalPressureInput=true,
           useSigmoidCompliance=true,
           VitalCapacity=TotalLungCapacity - ResidualVolume,
           BaseTidalVolume=BaseTidalVolume,
           useSubstances=true,
           EnthalpyNotUsed=EnthalpyNotUsed,
           nPorts=2) "Left alveolar space" annotation (Placement(transformation(extent={{-162,16},{-142,36}})));     //0.0133,

         Physiolibrary.Fluid.Sensors.PressureMeasure leftPleauralPressure(redeclare
          package Medium =    PleuralFluid, GetAbsolutePressure=true)
           "Left Pleaural pressure" annotation (Placement(transformation(
               extent={{10,-10},{-10,10}},
               rotation=0,
               origin={-70,64})));

         inner Modelica.Fluid.System system(T_ambient=CoreTemperature)
                                            "Human body system setting"
           annotation (Placement(transformation(extent={{60,66},{80,86}})));

         Physiolibrary.Fluid.Sources.PressureSource environment(redeclare package
          Medium =            Air, temperature_start=EnvironmentTemperature)
           "External environment"
           annotation (Placement(transformation(extent={{-360,78},{-340,98}})));

         Physiolibrary.Fluid.Components.Resistor leftBronchi(redeclare package Medium =
               Air,
           EnthalpyNotUsed=EnthalpyNotUsed,
           Resistance=LeftBronchiResistance)
           annotation (Placement(transformation(extent={{-252,24},{-232,44}})));

         Physiolibrary.Types.Constants.FrequencyConst frequency(k=RespirationRate)
           annotation (Placement(transformation(extent={{-54,78},{-46,86}})));
         Chemical.Sources.SubstanceOutflow O2_left(SubstanceFlow(displayUnit="mmol/min")=
                0.0001285)
           annotation (Placement(transformation(extent={{-166,-16},{-146,4}})));
         Chemical.Sources.SubstanceInflowT CO2_left(
                                                   SubstanceFlow(displayUnit="mmol/min")=
                0.00010283333333333,
           redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
           substanceData=Chemical.Substances.CarbonDioxide_gas())
           annotation (Placement(transformation(extent={{-218,-16},{-198,4}})));
         Physiolibrary.Fluid.Sensors.PressureMeasure leftAlveolarPressure(redeclare
          package Medium =    Air) "Left Alveolar pressure"
           annotation (Placement(transformation(extent={{-124,22},{-104,42}})));
         Modelica.Blocks.Math.Add musclePressure annotation (Placement(transformation(
               extent={{-10,-10},{10,10}},
               rotation=270,
               origin={42,20})));
         Physiolibrary.Types.Constants.PressureConst ambient_pressure(k=
               IntrathoraxPressure)
           annotation (Placement(transformation(extent={{84,44},{74,52}})));
         Physiolibrary.Fluid.Components.Resistor rightBronchi(redeclare package Medium =
               Air,
           EnthalpyNotUsed=EnthalpyNotUsed,
           Resistance=RightBronchiResistance)
           annotation (Placement(transformation(extent={{-252,-54},{-232,-34}})));
         Physiolibrary.Fluid.Components.ElasticVessel rightAlveoli(
           redeclare package Medium = Air,
           volume_start=LungsAirVolume_initial,
        use_concentration_start=true,
           concentration_start={100,40,47,760 - 187},
           useThermalPort=true,
           ZeroPressureVolume=FunctionalResidualCapacity,
           ResidualVolume=ResidualVolume,
           Compliance=TotalCompliance,
           useExternalPressureInput=true,
           useSigmoidCompliance=true,
           VitalCapacity=TotalLungCapacity - ResidualVolume,
           BaseTidalVolume=BaseTidalVolume,
           useSubstances=true,
           EnthalpyNotUsed=EnthalpyNotUsed,
           nPorts=6) "Right alveolar space" annotation (Placement(transformation(extent={{-156,-58},{-136,-38}})));
         Chemical.Sources.SubstanceInflowT CO2_right(
                                                    SubstanceFlow(displayUnit="mmol/min")=
                0.00010283333333333,
           redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
           substanceData=Chemical.Substances.CarbonDioxide_gas())
           annotation (Placement(transformation(extent={{-220,-96},{-200,-76}})));
         Chemical.Sources.SubstanceOutflow O2_right(SubstanceFlow(displayUnit="mmol/min")=
                0.0001285)
           annotation (Placement(transformation(extent={{-158,-96},{-138,-76}})));
         Physiolibrary.Fluid.Components.ElasticVessel leftPlearalSpace(
           redeclare package Medium = PleuralFluid,
           volume_start=pleuralVolume_initial,
           useThermalPort=false,
           ZeroPressureVolume=pleuralVolume_initial,
           Compliance=TotalCompliance,
           useExternalPressureInput=true,
           useSigmoidCompliance=false,
           useSubstances=false,
           nPorts=1) "Left Plearal space"
           annotation (Placement(transformation(extent={{-76,18},{-56,38}})));
         Physiolibrary.Fluid.Sensors.PressureMeasure rightPleauralPressure(redeclare
          package Medium =    PleuralFluid, GetAbsolutePressure=true)
           "Right pleaural pressure" annotation (Placement(transformation(
               extent={{10,-10},{-10,10}},
               rotation=0,
               origin={-70,-12})));
         Physiolibrary.Fluid.Components.ElasticVessel rightPleuralSpace(
           redeclare package Medium = PleuralFluid,
           volume_start=pleuralVolume_initial,
           ZeroPressureVolume=pleuralVolume_initial,
           Compliance=TotalCompliance,
           useExternalPressureInput=true,
           useSigmoidCompliance=false,
           useSubstances=false,
           nPorts=1) "Right Plearal space"
           annotation (Placement(transformation(extent={{-76,-58},{-56,-38}})));
         Physiolibrary.Fluid.Sensors.PressureMeasure rightAlveolarPressure(redeclare
          package Medium =    Air) "Right Alveolar pressure"
           annotation (Placement(transformation(extent={{-134,-38},{-114,
                -18}})));
         Physiolibrary.Fluid.Components.Resistor trachea(
           redeclare package Medium = Air,
           EnthalpyNotUsed=EnthalpyNotUsed,
           Resistance=0.5*TracheaResistance)
           annotation (Placement(transformation(extent={{-298,-10},{-278,10}})));
         Physiolibrary.Fluid.Components.Resistor leftAlveolarDuct(
           redeclare package Medium = Air,
           EnthalpyNotUsed=EnthalpyNotUsed,
           Resistance=LeftAlveoliResistance)
           annotation (Placement(transformation(extent={{-210,24},{-190,44}})));
         Physiolibrary.Fluid.Sensors.FlowMeasure flowMeasure(redeclare package Medium =
               Air)
           annotation (Placement(transformation(extent={{-10,-10},{10,10}},
               rotation=270,
               origin={-318,66})));
         Physiolibrary.Fluid.Components.Resistor rightAlveolarDuct(
           redeclare package Medium = Air,
           EnthalpyNotUsed=EnthalpyNotUsed,
           Resistance=RightAlveoliResistance)
           annotation (Placement(transformation(extent={{-212,-54},{-192,
                -34}})));
         Physiolibrary.Fluid.Components.ElasticVessel upperRespiratoryTract(
           redeclare package Medium = Air,
        use_concentration_start=true,
           useSubstances=true,
        volume_start=9.98e-05,
           concentration_start={100,40,47,760 - 187},
           useThermalPort=true,
           Compliance=TotalCompliance/100,
           ZeroPressureVolume(displayUnit="ml") = 0.0001,
           ExternalPressure=system.p_ambient,
           ResidualVolume(displayUnit="ml") = 0.0001,
           nPorts=4) annotation (Placement(transformation(extent={{-328,-10},{-308,10}})));
         Physiolibrary.Fluid.Components.Resistor upperRespiratoryTractResistance(
           redeclare package Medium = Air,
           EnthalpyNotUsed=EnthalpyNotUsed,
           Resistance=0.5*TracheaResistance) annotation (Placement(
               transformation(
               extent={{-10,-10},{10,10}},
               rotation=90,
               origin={-318,32})));
         Chemical.Sources.PureSubstance water(redeclare package stateOfMatter =
               Chemical.Interfaces.Incompressible, substanceData=
               Chemical.Substances.Water_liquid()) annotation (Placement(
               transformation(
               extent={{-10,-10},{10,10}},
               rotation=180,
               origin={-314,-68})));
         Chemical.Components.GasSolubility gasSolubility1(KC=1e-5) annotation (
             Placement(transformation(extent={{-362,-48},{-342,-28}})));
         Physiolibrary.Fluid.Sensors.PartialPressure pCO2(
           redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
           substanceData=Chemical.Substances.CarbonDioxide_gas(),
           redeclare package Medium = Air)
           annotation (Placement(transformation(extent={{-218,-62},{-198,-82}})));
         Physiolibrary.Fluid.Sensors.PartialPressure pO2(
           redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
           substanceData=Chemical.Substances.Oxygen_gas(),
           redeclare package Medium = Air)
           annotation (Placement(transformation(extent={{-138,-64},{-158,-84}})));
         Physiolibrary.Fluid.Sensors.Temperature Temperature_alveolar(redeclare
          package Medium =    Air)
           annotation (Placement(transformation(extent={{-110,-40},{-90,
                -20}})));
         Physiolibrary.Fluid.Sensors.PartialPressure pH2O_alveolar(
           redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
           substanceData=Chemical.Substances.Water_gas(),
           redeclare package Medium = Air)
           annotation (Placement(transformation(extent={{-122,-66},{-102,-86}})));
         Physiolibrary.Fluid.Sensors.PartialPressure pH2O_upperRespiratory(
           redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
           substanceData=Chemical.Substances.Water_gas(),
           redeclare package Medium = Air)
           annotation (Placement(transformation(extent={{-364,34},{-344,14}})));
         Physiolibrary.Fluid.Sensors.Temperature Temperature_upperRespiratory(
             redeclare package Medium = Air)
           annotation (Placement(transformation(extent={{-298,30},{-278,50}})));
         Physiolibrary.Fluid.Sensors.Temperature Temperature_mouth(redeclare package
          Medium =            Air)
           annotation (Placement(transformation(extent={{-296,72},{-276,92}})));
         Physiolibrary.Thermal.Components.Conductor conductor(Conductance(
               displayUnit="W/K") = 10)
           annotation (Placement(transformation(extent={{-302,-44},{-322,
                -24}})));
         Physiolibrary.Thermal.Sources.UnlimitedHeat coreHeat(T=system.T_ambient)
           annotation (Placement(transformation(extent={{-274,-44},{-294,-24}})));
         Physiolibrary.Thermal.Components.Conductor conductor1(Conductance(
            displayUnit="W/K") = 10)
           annotation (Placement(transformation(extent={{-210,6},{-230,26}})));
         Physiolibrary.Thermal.Components.Conductor conductor2(Conductance(
            displayUnit="W/K") = 10)
           annotation (Placement(transformation(extent={{-208,-40},{-228,
                -20}})));
         Modelica.Blocks.Math.Add add(y(start=system.p_ambient))
           annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-46,46})));
         Modelica.Blocks.Math.Add add1(y(start=system.p_ambient))
           annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-46,-32})));
       equation

         connect(frequency.y, respiratoryMusclePressureCycle.frequence)
           annotation (Line(points={{-45,82},{-34,82}},                   color={0,0,127}));
         connect(leftAlveoli.substances[1], O2_left.port_a) annotation (Line(points={{-162,26},
                 {-180,26},{-180,-6},{-166,-6}},     color={158,66,200}));
         connect(CO2_left.port_b, leftAlveoli.substances[2]) annotation (Line(points={{-198,-6},
                 {-182,-6},{-182,26},{-162,26}},     color={158,66,200}));
         connect(ambient_pressure.y, musclePressure.u1)
           annotation (Line(points={{72.75,48},{48,48},{48,32}}, color={0,0,127}));
         connect(musclePressure.u2, respiratoryMusclePressureCycle.val)
           annotation (Line(points={{36,32},{36,82},{-14,82}},color={0,0,127}));
         connect(CO2_right.port_b, rightAlveoli.substances[2]) annotation (Line(points={{-200,
                 -86},{-178,-86},{-178,-48},{-156,-48}},       color={158,66,200}));
         connect(O2_right.port_a, rightAlveoli.substances[1]) annotation (Line(points={{-158,
                 -86},{-176,-86},{-176,-48},{-156,-48}},      color={158,66,200}));
         connect(leftAlveolarPressure.q_in, leftAlveoli.q_in[1]) annotation (Line(
             points={{-118,26},{-152,26},{-152,24},{-152.1,24},{-152.1,27.3}},
             color={127,0,0},
             thickness=0.5));
         connect(leftPlearalSpace.q_in[1], leftPleauralPressure.q_in) annotation (Line(
             points={{-66.1,28},{-66.1,48},{-66,48},{-66,58}},
             color={127,0,0},
             thickness=0.5));
         connect(leftPleauralPressure.pressure, leftAlveoli.externalPressure)
           annotation (Line(points={{-76,60},{-146,60},{-146,35}}, color={0,0,127}));
         connect(rightPleuralSpace.q_in[1], rightPleauralPressure.q_in) annotation (
             Line(
             points={{-66.1,-48},{-66.1,-28},{-66,-28},{-66,-18}},
             color={127,0,0},
             thickness=0.5));
         connect(rightAlveoli.externalPressure, rightPleauralPressure.pressure)
           annotation (Line(points={{-140,-39},{-140,-16},{-76,-16}}, color={0,0,127}));
         connect(rightAlveoli.q_in[1], rightAlveolarPressure.q_in) annotation (Line(
             points={{-146.1,-45.8333},{-148,-45.8333},{-148,-60},{-128,-60},{-128,-34}},
             color={127,0,0},
             thickness=0.5));

         connect(leftBronchi.q_out, leftAlveolarDuct.q_in) annotation (Line(
             points={{-232,34},{-210,34}},
             color={127,0,0},
             thickness=0.5));
         connect(leftAlveolarDuct.q_out, leftAlveoli.q_in[2]) annotation (Line(
             points={{-190,34},{-152,34},{-152,30},{-152.1,30},{-152.1,
              24.7}},
             color={127,0,0},
             thickness=0.5));
         connect(trachea.q_out, leftBronchi.q_in) annotation (Line(
             points={{-278,0},{-268,0},{-268,34},{-252,34}},
             color={127,0,0},
             thickness=0.5));
         connect(trachea.q_out, rightBronchi.q_in) annotation (Line(
             points={{-278,0},{-268,0},{-268,-44},{-252,-44}},
             color={127,0,0},
             thickness=0.5));
         connect(environment.y, flowMeasure.q_in) annotation (Line(
             points={{-340,88},{-318,88},{-318,76}},
             color={127,0,0},
             thickness=0.5));
         connect(rightBronchi.q_out, rightAlveolarDuct.q_in) annotation (Line(
             points={{-232,-44},{-212,-44}},
             color={127,0,0},
             thickness=0.5));
         connect(rightAlveolarDuct.q_out, rightAlveoli.q_in[2]) annotation (Line(
             points={{-192,-44},{-146,-44},{-146,-46.7},{-146.1,-46.7}},
             color={127,0,0},
             thickness=0.5));

         connect(upperRespiratoryTract.q_in[1], trachea.q_in) annotation (Line(
             points={{-318.1,1.95},{-318.1,-6},{-318,-6},{-318,-2},{-298,
              -2},{-298,0}},
             color={127,0,0},
             thickness=0.5));
         connect(flowMeasure.q_out, upperRespiratoryTractResistance.q_out)
           annotation (Line(
             points={{-318,56},{-318,42}},
             color={127,0,0},
             thickness=0.5));
         connect(upperRespiratoryTractResistance.q_in, upperRespiratoryTract.q_in[
           2]) annotation (Line(
             points={{-318,22},{-318,0.65},{-318.1,0.65}},
             color={127,0,0},
             thickness=0.5));
         connect(water.port_a, gasSolubility1.liquid_port) annotation (Line(
               points={{-324,-68},{-352,-68},{-352,-48}}, color={158,66,200}));
         connect(gasSolubility1.gas_port, upperRespiratoryTract.substances[3])
           annotation (Line(points={{-352,-28},{-352,2},{-328,2},{-328,0}},
               color={158,66,200}));
         connect(pCO2.port_a, CO2_right.port_b) annotation (Line(points={{-198,-72},
                 {-190,-72},{-190,-86},{-200,-86}}, color={158,66,200}));
         connect(pCO2.referenceFluidPort, rightAlveoli.q_in[3]) annotation (Line(
             points={{-208,-62.2},{-184,-62.2},{-184,-44},{-148,-44},{-148,-49.3},{
              -146.1,-49.3},{-146.1,-47.5667}},
             color={127,0,0},
             thickness=0.5));
         connect(pO2.port_a, O2_right.port_a) annotation (Line(points={{-158,-74},
                 {-164,-74},{-164,-86},{-158,-86}}, color={158,66,200}));
         connect(pO2.referenceFluidPort, rightAlveoli.q_in[4]) annotation (Line(
             points={{-148,-64.2},{-148,-44},{-146.1,-44},{-146.1,-48.4333}},
             color={127,0,0},
             thickness=0.5));
         connect(pH2O_alveolar.port_a, rightAlveoli.substances[3]) annotation (
             Line(points={{-102,-76},{-94,-76},{-94,-48},{-156,-48}}, color={158,66,
                 200}));
         connect(pH2O_alveolar.referenceFluidPort, rightAlveoli.q_in[5])
           annotation (Line(
             points={{-112,-66.2},{-112,-50},{-146,-50},{-146,-44},{-146.1,
              -44},{-146.1,-49.3}},
             color={127,0,0},
             thickness=0.5));
         connect(pH2O_upperRespiratory.port_a, upperRespiratoryTract.substances[3])
           annotation (Line(points={{-344,24},{-334,24},{-334,0},{-328,0}}, color=
                {158,66,200}));
         connect(pH2O_upperRespiratory.referenceFluidPort, upperRespiratoryTract.q_in[
           3]) annotation (Line(
             points={{-354,33.8},{-354,48},{-330,48},{-330,14},{-318.1,14},
              {-318.1,-0.65}},
             color={127,0,0},
             thickness=0.5));
         connect(
              conductor.q_out, upperRespiratoryTract.heatPort)
           annotation (
         Line(
          points={{-322,-34},{-324,-34},{-324,-10.2}},
          color={191,0,0},
          thickness=0.5));
         connect(
              conductor1.q_out, coreHeat.port) annotation (Line(
          points={{-230,16},{-238,16},{-238,-16},{-298,-16},{-298,-34},{
              -294,-34}},
          color={191,0,0},
          thickness=0.5));
         connect(
              coreHeat.port, conductor.q_in)
           annotation (Line(
          points={{-294,-34},{-302,-34}},
          color={191,0,0},
          thickness=0.5));
         connect(
              conductor2.q_out, coreHeat.port) annotation (Line(
          points={{-228,-30},{-238,-30},{-238,-16},{-298,-16},{-298,-34},{
              -294,-34}},
          color={191,0,0},
          thickness=0.5));
         connect(
              conductor1.q_in, leftAlveoli.heatPort)
           annotation (Line(
          points={{-210,16},{-158,15.8}},
          color={191,0,0},
          thickness=0.5));
         connect(
              conductor2.q_in, rightAlveoli.heatPort)
           annotation (Line(
          points={{-208,-30},{-168,-30},{-168,-58.2},{-152,-58.2}},
          color={191,0,0},
          thickness=0.5));
         connect(
              flowMeasure.q_in, Temperature_mouth.port) annotation (Line(
          points={{-318,76},{-318,82},{-298,82},{-298,72},{-286,72}},
          color={127,0,0},
          thickness=0.5));
         connect(
              upperRespiratoryTract.q_in[4], Temperature_upperRespiratory.port)
        annotation (Line(
          points={{-318.1,-1.95},{-318.1,10},{-318,10},{-318,8},{-288,8},{
              -288,30}},
          color={127,0,0},
          thickness=0.5));
         connect(
              rightAlveoli.q_in[6], Temperature_alveolar.port)
           annotation (
         Line(
          points={{-146.1,-50.1667},{-100,-50.1667},{-100,-40}},
          color={127,0,0},
          thickness=0.5));
         connect(
              musclePressure.y, add.u1)
        annotation (Line(points={{42,9},{42,-2},{-34,-2},{-34,40}}, color={0,0,127}));
         connect(
              add.y, leftPlearalSpace.externalPressure)
        annotation (Line(points={{-57,46},{-60,46},{-60,37}}, color={0,0,127}));
         connect(
              leftAlveolarPressure.pressure, add.u2)
           annotation (Line(points={{-108,28},
              {-100,28},{-100,68},{-22,68},{-22,52},{-34,52}}, color={0,0,127}));
         connect(
              musclePressure.y, add1.u2) annotation (Line(points={{42,9},{42,-2},{-34,
              -2},{-34,-26}}, color={0,0,127}));
         connect(
              add1.y, rightPleuralSpace.externalPressure)
        annotation (Line(points={{-57,-32},{-60,-32},{-60,-39}}, color={0,0,127}));
         connect(
              rightAlveolarPressure.pressure, add1.u1) annotation (Line(points={{-118,
              -32},{-106,-32},{-106,-66},{-18,-66},{-18,-38},{-34,-38}}, color={0,0,
              127}));
         annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
               coordinateSystem(preserveAspectRatio=false, extent={{-360,-100},{100,100}})),
           experiment(
          StopTime=60,
          Tolerance=1e-05,
          __Dymola_Algorithm="Dassl"),
           Documentation(info="<html>
<p>References:</p>
<p><br>Mecklenburgh, J. S., and W. W. Mapleson. &quot;Ventilatory assistance and respiratory muscle activity. 1: Interaction in healthy volunteers.&quot; <i>British journal of anaesthesia</i> 80.4 (1998): 422-433.</p>
</html>"));
       end Respiration;

       model AirWaterSaturation "Human respiration model"
         extends Modelica.Icons.Example;

         import Modelica.Units.SI.*;

         replaceable package Air = Media.Air;               //Chemical.Media.SimpleAir_C; //Kitware.Air_IdealGas; //Chemical.Media.SimpleAir_C; //Chemical.Media.Air_MixtureGasNasa;
         replaceable package PleuralFluid =
             Physiolibrary.Media.Water;

         parameter Boolean EnthalpyNotUsed = false;

         parameter Pressure IntrathoraxPressure = system.p_ambient - 700;
         parameter Frequency RespirationRate=0.08                                                               "Respiration rate";
         parameter Volume ResidualVolume=0.0013                                                      "Lungs residual volume";
         parameter Volume TotalLungCapacity=0.00623                                                      "Total Lung Capacity";
         parameter Volume BaseTidalVolume=0.0005                                                      "Base Tidal Volume";
         parameter Volume LungsAirVolume_initial = FunctionalResidualCapacity "Initial volume of alveolar space";
         parameter Volume pleuralVolume_initial = 0.0001 "Initial volume of pleural fluid";

         parameter Volume FunctionalResidualCapacity=0.00231                                                      "Functional residual capacity";

         parameter Physiolibrary.Types.HydraulicResistance TotalResistance=147099.75
           "Total lungs pathways resistance";

         parameter Real BronchiResistanceFraction = 0.3;
         parameter Real AlveoliDuctResistanceFraction = 0.2;
         parameter Real TracheaResistanceFraction = 1 - (BronchiResistanceFraction+AlveoliDuctResistanceFraction)/2;

         parameter Physiolibrary.Types.HydraulicResistance TracheaResistance=TotalResistance*TracheaResistanceFraction
           "Left Bronchi Resistance";
         parameter Physiolibrary.Types.HydraulicResistance LeftBronchiResistance=TotalResistance*BronchiResistanceFraction
           "Left Bronchi Resistance";
         parameter Physiolibrary.Types.HydraulicResistance LeftAlveoliResistance=TotalResistance*AlveoliDuctResistanceFraction
           "Left Alveoli Resistance";
           parameter Physiolibrary.Types.HydraulicResistance RightBronchiResistance=TotalResistance*BronchiResistanceFraction
           "Right Bronchi Resistance";
           parameter Physiolibrary.Types.HydraulicResistance RightAlveoliResistance=TotalResistance*AlveoliDuctResistanceFraction
           "Right Alveoli Resistance";

         parameter Physiolibrary.Types.HydraulicCompliance TotalCompliance(displayUnit=
              "l/cmH2O")=1.0197162129779e-06            "Total lungs compliance";

         parameter Pressure Pmin=-533.28954966                                   "Relative external lungs pressure minimum caused by respiratory muscles";
         parameter Pressure Pmax(displayUnit="mmHg")=0    "Relative external lungs pressure maximum";
         Chemical.Components.GasSolubility gasSolubility1(KC=1e-7) annotation (
             Placement(transformation(extent={{-362,-48},{-342,-28}})));
         parameter Real RespiratoryMusclePressureCycle[:,3] = {
               {0,Pmax,0},
               {3/8,Pmin,0},
               {1,Pmax,0}}
                 "Absolute external lungs pressure during respiration cycle scaled to time period (0,1)";

         parameter Temperature CoreTemperature=310.15                       "body temperature";
         parameter Temperature EnvironmentTemperature=298.15                       "external air temperature";

         parameter Mass m_initial = LungsAirVolume_initial*Air.density(Air.setState_pTX(system.p_ambient
                + Pmax, CoreTemperature,Air.reference_X));

       //  parameter Density d = Air.density(Air.setState_pTX(system.p_ambient+Pmax,CoreTemperature));
                                                                                                                     //0.0133,

         inner Modelica.Fluid.System system(T_ambient=CoreTemperature)
                                            "Human body system setting"
           annotation (Placement(transformation(extent={{60,66},{80,86}})));

         Physiolibrary.Fluid.Sources.PressureSource environment(redeclare package
          Medium =            Air, temperature_start=EnvironmentTemperature)
           "External environment"
           annotation (Placement(transformation(extent={{-360,78},{-340,98}})));

         Physiolibrary.Fluid.Sensors.FlowMeasure flowMeasure(redeclare package Medium =
               Air)
           annotation (Placement(transformation(extent={{-10,-10},{10,10}},
               rotation=270,
               origin={-318,66})));
         Physiolibrary.Fluid.Components.ElasticVessel upperRespiratoryTract(
           redeclare package Medium = Air,
           useSubstances=true,
        volume_start=0.0001,
        massFractions_start=Air.reference_X[1:Air.nS - 1],
           useThermalPort=true,
           Compliance=TotalCompliance/100,
           ZeroPressureVolume(displayUnit="ml") = 0.0001,
           ExternalPressure=system.p_ambient,
           ResidualVolume(displayUnit="ml") = 0.0001,
           nPorts=3)
           annotation (Placement(transformation(extent={{-328,-10},{-308,10}})));
         Physiolibrary.Fluid.Components.Resistor upperRespiratoryTractResistance(
           redeclare package Medium = Air,
           EnthalpyNotUsed=EnthalpyNotUsed,
           Resistance=0.5*TracheaResistance) annotation (Placement(
               transformation(
               extent={{-10,-10},{10,10}},
               rotation=90,
               origin={-318,32})));
         Chemical.Sources.PureSubstance water(redeclare package stateOfMatter =
               Chemical.Interfaces.Incompressible, substanceData=
               Chemical.Substances.Water_liquid()) annotation (Placement(
               transformation(
               extent={{-10,-10},{10,10}},
               rotation=180,
               origin={-314,-68})));
         Physiolibrary.Fluid.Sensors.PartialPressure pH2O_upperRespiratory(
           redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
           substanceData=Chemical.Substances.Water_gas(),
           redeclare package Medium = Air)
           annotation (Placement(transformation(extent={{-364,34},{-344,14}})));
         Physiolibrary.Fluid.Sensors.Temperature Temperature_upperRespiratory(
             redeclare package Medium = Air)
           annotation (Placement(transformation(extent={{-298,30},{-278,50}})));
         Physiolibrary.Fluid.Sensors.Temperature Temperature_mouth(redeclare package
          Medium =            Air)
           annotation (Placement(transformation(extent={{-296,72},{-276,92}})));
         Physiolibrary.Thermal.Components.Conductor conductor(Conductance(
               displayUnit="W/K") = 10)
           annotation (Placement(transformation(extent={{-302,-44},{-322,
                -24}})));
         Physiolibrary.Thermal.Sources.UnlimitedHeat coreHeat(T=system.T_ambient)
           annotation (Placement(transformation(extent={{-274,-44},{-294,-24}})));
       equation

         connect(environment.y, flowMeasure.q_in) annotation (Line(
             points={{-340,88},{-318,88},{-318,76}},
             color={127,0,0},
             thickness=0.5));

         connect(flowMeasure.q_out, upperRespiratoryTractResistance.q_out)
           annotation (Line(
             points={{-318,56},{-318,42}},
             color={127,0,0},
             thickness=0.5));
         connect(upperRespiratoryTractResistance.q_in, upperRespiratoryTract.q_in[1])
               annotation (Line(
             points={{-318,22},{-318,1.73333},{-318.1,1.73333}},
             color={127,0,0},
             thickness=0.5));
         connect(water.port_a, gasSolubility1.liquid_port) annotation (Line(
               points={{-324,-68},{-352,-68},{-352,-48}}, color={158,66,200}));
         connect(gasSolubility1.gas_port, upperRespiratoryTract.substances[3])
           annotation (Line(points={{-352,-28},{-352,2},{-328,2},{-328,0}},
               color={158,66,200}));
         connect(pH2O_upperRespiratory.port_a, upperRespiratoryTract.substances[3])
           annotation (Line(points={{-344,24},{-334,24},{-334,0},{-328,0}}, color=
                {158,66,200}));
         connect(pH2O_upperRespiratory.referenceFluidPort, upperRespiratoryTract.q_in[2])
               annotation (Line(
             points={{-354,33.8},{-354,48},{-330,48},{-330,14},{-318.1,14},{-318.1,
              1.11022e-16}},
             color={127,0,0},
             thickness=0.5));
      connect(conductor.q_out, upperRespiratoryTract.heatPort)
        annotation (
         Line(
          points={{-322,-34},{-324,-34},{-324,-10.2}},
          color={191,0,0},
          thickness=0.5));
      connect(coreHeat.port, conductor.q_in)
        annotation (Line(
          points={{-294,-34},{-302,-34}},
          color={191,0,0},
          thickness=0.5));
      connect(flowMeasure.q_in, Temperature_mouth.port) annotation (Line(
          points={{-318,76},{-318,82},{-298,82},{-298,72},{-286,72}},
          color={127,0,0},
          thickness=0.5));
      connect(upperRespiratoryTract.q_in[3], Temperature_upperRespiratory.port)
        annotation (Line(
          points={{-318.1,-1.73333},{-318.1,10},{-318,10},{-318,8},{-288,8},{-288,30}},
          color={127,0,0},
          thickness=0.5));
         annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
               coordinateSystem(preserveAspectRatio=false, extent={{-360,-100},{100,100}})),
           experiment(StopTime=200, __Dymola_Algorithm="Dassl"),
           Documentation(info="<html>
<p>References:</p>
<p><br>Mecklenburgh, J. S., and W. W. Mapleson. &quot;Ventilatory assistance and respiratory muscle activity. 1: Interaction in healthy volunteers.&quot; <i>British journal of anaesthesia</i> 80.4 (1998): 422-433.</p>
</html>"));
       end AirWaterSaturation;

       package BloodGasesTransport
      "Transport of O2 and CO2 through respiration and circulation in human body"
         model BloodyMary
             replaceable package Blood =
                 Physiolibrary.Media.BloodBySiggaardAndersen annotation(choicesAllMatching=True);
             replaceable package Air =
                 Physiolibrary.Media.Air annotation(choicesAllMatching=True);

             parameter Physiolibrary.Types.Frequency RR=0.286
                                                         "Respiration rate";
             parameter Physiolibrary.Types.Volume TV=0.0005
                                                         "Tidal volume";
             parameter Physiolibrary.Types.Volume DV=0.00015
                                                          "Dead space volume";

             parameter Physiolibrary.Types.VolumeFlowRate CO=9.1666666666667e-05
                                                             "Cardiac output";

             parameter Physiolibrary.Types.HydraulicConductance cShunt=
            1.250102626409427e-07*((1/3)*0.02);
             parameter Physiolibrary.Types.HydraulicConductance cTotalVentilation=
            1.019716212977928e-05*((1/1.5));
             parameter Physiolibrary.Types.HydraulicConductance cTotalCirculation=
            1.250102626409427e-07*((1/3)*(1 - 0.02));

           parameter Types.MolarFlowRate O2_consumption=1.666666666666667e-05*(2*7.71)
                                                        "Tissue consumption of O2 by metabolism";
           parameter Types.MolarFlowRate CO2_production=1.666666666666667e-05*(2*6.17)
                                                                 "Tissue production of CO2 by metabolism";
           parameter Types.HydraulicConductance TotalSystemicConductance=
            1.250102626409427e-07*((1/20))
                 "Total systemic blood circulation conductance";

             parameter Integer NA=1    "Number of pulmonary alveolar units";
             parameter Integer NT=1    "Number of systemic tissue units";

           Physiolibrary.Fluid.Components.VolumePump deadSpaceVentilation(redeclare
            package Medium = Air,
          useSolutionFlowInput=true,
                                  SolutionFlow=DV*RR)
          annotation (Placement(transformation(extent={{-14,-52},{6,-32}})));
           Physiolibrary.Fluid.Sources.PressureSource pressureSource(redeclare package
            Medium =                                                                            Air)
             annotation (Placement(transformation(extent={{-96,-52},{-76,-32}})));
           Physiolibrary.Fluid.Sources.VolumeOutflowSource volumeOutflow(
          useSolutionFlowInput=true,                                     SolutionFlow=TV*RR, redeclare
            package Medium =                                                                                            Air)
             annotation (Placement(transformation(extent={{64,-52},{84,-32}})));
           Physiolibrary.Fluid.Components.VolumePump leftHeartPump(
             redeclare package Medium = Blood,
             useSolutionFlowInput=true,
             SolutionFlow(displayUnit="l/min") = 8.3333333333333e-05) annotation (Placement(transformation(
                 extent={{-10,-10},{10,10}},
                 rotation=270,
                 origin={42,-150})));
           Physiolibrary.Fluid.Components.VolumePump rightHeartPump(
             redeclare package Medium = Blood,
             useSolutionFlowInput=true,
             SolutionFlow(displayUnit="l/min") = 8.3333333333333e-05) annotation (Placement(transformation(
                 extent={{-10,-10},{10,10}},
                 rotation=90,
                 origin={-50,-150})));
           Physiolibrary.Fluid.Components.ElasticVessel pulmonaryArteries(
             redeclare package Medium = Blood,
             volume_start(displayUnit="l") = 0.00038,
             Compliance(displayUnit="ml/mmHg") = 3.6002955640592e-08,
             ZeroPressureVolume(displayUnit="l") = 0.0003,
             nPorts=4) annotation (Placement(transformation(extent={{-60,-112},{-40,
                  -92}})));
           Physiolibrary.Fluid.Components.ElasticVessel pulmonaryVeins(
             redeclare package Medium = Blood,
             volume_start(displayUnit="l") = 0.0004,
             Compliance(displayUnit="ml/mmHg") = 7.5006157584566e-08,
             ZeroPressureVolume(displayUnit="l") = 0.0004,
             nPorts=4) annotation (Placement(transformation(extent={{32,-112},{52,-92}})));
           Physiolibrary.Fluid.Components.ElasticVessel systemicArteries(
             redeclare package Medium = Blood,
          useSubstances=true,
             volume_start(displayUnit="l") = 0.00085,
             Compliance(displayUnit="ml/mmHg") = 2.6627185942521e-08,
             ZeroPressureVolume(displayUnit="l") = 0.00045,
             nPorts=3) annotation (Placement(transformation(extent={{52,-206},{32,-186}})));
           Physiolibrary.Fluid.Components.ElasticVessel systemicVeins(
             redeclare package Medium = Blood,
             volume_start(displayUnit="l") = 0.00325,
             Compliance(displayUnit="ml/mmHg") = 6.1880080007267e-07,
             ZeroPressureVolume(displayUnit="l") = 0.00295,
             nPorts=3) annotation (Placement(transformation(extent={{-60,-206},{-40,
                  -186}})));
           Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasureVeins(redeclare
            package Medium =                                                                           Blood)
                                                                            annotation (
               Placement(transformation(
                 extent={{10,-10},{-10,10}},
                 rotation=0,
                 origin={-70,-192})));
           Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasurePulmArteries(redeclare
            package Medium =                                                                                  Blood)
             annotation (Placement(transformation(extent={{-60,-108},{-80,-88}})));
           Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasurePulmVeins(redeclare
            package Medium =                                                                               Blood)
             annotation (Placement(transformation(extent={{52,-108},{72,-88}})));
           Types.Constants.VolumeFlowRateConst leftCardiacOutput(k=CO) annotation (
            Placement(transformation(
              extent={{-4,-4},{4,4}},
              rotation=180,
              origin={76,-150})));
           Modelica.Blocks.Math.MultiProduct multiProduct1(nu=2) annotation (Placement(
                 transformation(
                 extent={{-6,-6},{6,6}},
                 rotation=0,
                 origin={-70,-150})));
           Physiolibrary.Types.Constants.HydraulicConductanceConst hydraulicConductance1(k=1.250102626409427e-07*(5/4))
                                             annotation (Placement(transformation(
                 extent={{-4,-4},{4,4}},
                 rotation=270,
                 origin={-80,-132})));
           Physiolibrary.Fluid.Components.Conductor pulmonaryShunt(redeclare package
            Medium = Blood, Conductance(displayUnit="l/(cmH2O.s)") = cShunt)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={-4,-104})));
           Physiolibrary.Fluid.Examples.BloodGasesTransport.AlveolarUnit alveolarUnit[NA](
          redeclare package Blood = Blood,
          redeclare package Air = Air,
          cVentilation=ones(NA)*(cTotalVentilation/NA),
          cCirculation=ones(NA)*(cTotalCirculation/NA)) annotation (Placement(
              transformation(rotation=0, extent={{-20,-96},{12,-64}})));
           Sensors.BloodGasesMeasurement arterial(redeclare package Medium = Blood)
          annotation (Placement(transformation(extent={{70,-198},{90,-178}})));
           TissueUnit tissueUnit[NT](
          O2_consumption=fill(O2_consumption/NT, NT),
          CO2_production=fill(CO2_production/NT, NT),
          Conductance=fill(TotalSystemicConductance/NT, NT),
          redeclare package Blood = Blood)
             annotation (Placement(transformation(extent={{-14,-202},{12,-188}})));
        RespiratoryCenter respiratoryCenter(DV=DV)
          annotation (Placement(transformation(extent={{40,2},{20,22}})));
         equation
           connect(
                deadSpaceVentilation.q_out, volumeOutflow.q_in) annotation (Line(
            points={{6,-42},{64,-42}},
            color={127,0,0},
            thickness=0.5));
           connect(
                pressureSource.y, deadSpaceVentilation.q_in) annotation (Line(
            points={{-76,-42},{-14,-42}},
            color={127,0,0},
            thickness=0.5));
           connect(rightHeartPump.q_out,pulmonaryArteries. q_in[1]) annotation (Line(
               points={{-50,-140},{-50,-116},{-50.1,-116},{-50.1,-100.05}},
               color={127,0,0},
               thickness=0.5));
           connect(leftHeartPump.q_in,pulmonaryVeins. q_in[1])
             annotation (Line(
               points={{42,-140},{42,-100},{41.9,-100},{41.9,-100.05}},
               color={127,0,0},
               thickness=0.5));
           connect(leftHeartPump.q_out,systemicArteries. q_in[1])
             annotation (Line(
               points={{42,-160},{42,-194.267},{42.1,-194.267}},
               color={127,0,0},
               thickness=0.5));
           connect(rightHeartPump.q_in,systemicVeins. q_in[1]) annotation (Line(
               points={{-50,-160},{-50,-194.267},{-50.1,-194.267}},
               color={127,0,0},
               thickness=0.5));
           connect(pressureMeasureVeins.q_in,systemicVeins. q_in[2]) annotation (Line(
               points={{-66,-198},{-50,-198},{-50,-196},{-50.1,-196}},
               color={127,0,0},
               thickness=0.5));
           connect(pressureMeasurePulmArteries.q_in,pulmonaryArteries. q_in[2])
             annotation (Line(
               points={{-66,-104},{-50,-104},{-50,-101.35},{-50.1,-101.35}},
               color={127,0,0},
               thickness=0.5));
           connect(pulmonaryVeins.q_in[2],pressureMeasurePulmVeins. q_in) annotation (Line(
               points={{41.9,-101.35},{42,-101.35},{42,-104},{58,-104}},
               color={127,0,0},
               thickness=0.5));
           connect(multiProduct1.y,rightHeartPump. solutionFlow)
             annotation (Line(points={{-62.98,-150},{-57,-150}},
                                                             color={0,0,127}));
           connect(hydraulicConductance1.y,multiProduct1. u[1]) annotation (Line(points={{-80,
                -137},{-80,-148},{-76,-148},{-76,-147.9}}, color={0,0,127}));
           connect(pressureMeasureVeins.pressure,multiProduct1. u[2]) annotation (Line(
                 points={{-76,-196},{-80,-196},{-80,-152.1},{-76,-152.1}},
                                                                     color={0,0,127}));
           connect(
                pulmonaryShunt.q_in, pulmonaryArteries.q_in[3]) annotation (Line(
            points={{-14,-104},{-50.1,-104},{-50.1,-102.65}},
            color={127,0,0},
            thickness=0.5));
           connect(
                pulmonaryShunt.q_out, pulmonaryVeins.q_in[3]) annotation (Line(
            points={{6,-104},{41.9,-104},{41.9,-102.65}},
            color={127,0,0},
            thickness=0.5));
           for i in 1:NA loop
           connect(alveolarUnit[i].q_in1, pulmonaryArteries.q_in[4]) annotation (Line(
               points={{-20,-80},{-30,-80},{-30,-100},{-50.1,-100},{-50.1,-103.95}},
               color={127,0,0},
               thickness=0.5));
           connect(alveolarUnit[i].q_in, pressureSource.y)
             annotation (Line(
               points={{-7.2,-72},{-64,-72},{-64,-42},{-76,-42}},
               color={127,0,0},
               thickness=0.5));
           connect(alveolarUnit[i].q_out, volumeOutflow.q_in)
             annotation (Line(
               points={{-0.8,-72},{52,-72},{52,-42},{64,-42}},
               color={127,0,0},
               thickness=0.5));
           connect(alveolarUnit[i].q_out1, pulmonaryVeins.q_in[4]) annotation (Line(
               points={{12,-80},{22,-80},{22,-98},{42,-98},{42,-103.95},{41.9,-103.95}},
               color={127,0,0},
               thickness=0.5));
           end for;
           connect(
                leftHeartPump.solutionFlow, leftCardiacOutput.y)
          annotation (Line(points={{49,-150},{71,-150}},
                                                       color={0,0,127}));
           connect(
                systemicArteries.q_in[2], arterial.referenceFluidPort) annotation (
            Line(
            points={{42.1,-196},{42.1,-200},{80,-200},{80,-197.8}},
            color={127,0,0},
            thickness=0.5));
           connect(
                systemicArteries.substances[2], arterial.O2) annotation (Line(points={{52,-196},
                {52,-192},{62,-192},{62,-182},{70,-182}},           color={158,66,200}));
           connect(
                systemicArteries.substances[3], arterial.CO2) annotation (Line(points={{52,-196},
                {52,-194},{64,-194},{64,-188},{70,-188}},            color={158,66,200}));
           connect(
                arterial.H_plus, systemicArteries.substances[13]) annotation (Line(
              points={{70,-194},{66,-194},{66,-196},{52,-196}}, color={158,66,200}));

           for i in 1:NT loop
             connect(
                tissueUnit[i].q_in, systemicArteries.q_in[3]) annotation (Line(
              points={{13.6611,-195.21},{28,-195.21},{28,-196},{42.1,-196},{42.1,
                  -197.733}},
              color={127,0,0},
              thickness=0.5));
             connect(
                tissueUnit[i].q_out, systemicVeins.q_in[3]) annotation (Line(
              points={{-15.2278,-194.93},{-50.1,-194.93},{-50.1,-197.733}},
              color={127,0,0},
              thickness=0.5));
           end for;

        connect(respiratoryCenter.deadSpaceVentilation, deadSpaceVentilation.solutionFlow)
          annotation (Line(points={{24,1.2},{24,-14},{-4,-14},{-4,-35}}, color={0,0,
                127}));
        connect(respiratoryCenter.ventilation, volumeOutflow.solutionFlow) annotation
          (Line(points={{29.6,1.3},{29.6,-14},{74,-14},{74,-35}}, color={0,0,127}));
        connect(arterial.pO2, respiratoryCenter.pO2) annotation (Line(points={{90.8,
                -182},{96,-182},{96,3},{40.6,3}}, color={0,0,127}));
        connect(arterial.pCO2, respiratoryCenter.pCO2) annotation (Line(points={{90.8,
                -188},{100,-188},{100,11},{40.4,11}}, color={0,0,127}));
           annotation (
             Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-220},{100,40}})),
             Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-220},{100,40}})),
          experiment(StopTime=1800, __Dymola_Algorithm="Dassl"));
         end BloodyMary;

         model TissueUnit
           extends Physiolibrary.Icons.SystemicCirculation;

           parameter Types.MolarFlowRate O2_consumption=1.666666666666667e-05*(2*7.71)
          "Tissue consumption of O2 by metabolism";
           parameter Types.MolarFlowRate CO2_production=1.666666666666667e-05*(2*6.17)
          "Tissue production of CO2 by metabolism";
           parameter Types.HydraulicConductance Conductance=1.250102626409427e-07*((1/
            20)) "Tissue blood flow conductance";

           parameter Types.Fraction ArteriesViensResistanceRatio=(7/8)
          "Ratio between arteries and veins resistance";

           Components.Resistor systemicArteriesResistance(redeclare package Medium = Blood,
               Resistance=(1/Conductance)*ArteriesViensResistanceRatio) annotation (Placement(transformation(
                 extent={{-10,-10},{10,10}},
                 rotation=180,
                 origin={22,30})));
           Components.Resistor systemicVeinsResistance(redeclare package Medium = Blood,
               Resistance=(1/Conductance)*(1-ArteriesViensResistanceRatio)) annotation (Placement(transformation(
                 extent={{-10,-10},{10,10}},
                 rotation=180,
                 origin={-22,30})));
           Components.ElasticVessel systemicCapillaries(
             redeclare package Medium = Blood,
             useSubstances=true,
             volume_start(displayUnit="l") = 0.0003,
             Compliance(displayUnit="ml/mmHg") = 3.0002463033826e-08,
             ZeroPressureVolume(displayUnit="l") = 0.0002,
             nPorts=3) annotation (Placement(transformation(
                 extent={{10,-10},{-10,10}},
                 rotation=0,
                 origin={-2,-14})));
           Chemical.Sources.SubstanceOutflow O2_left(SubstanceFlow(displayUnit="mmol/min")=
               O2_consumption)
                          annotation (Placement(transformation(
                 extent={{-10,-10},{10,10}},
                 rotation=180,
                 origin={-70,-38})));
           Chemical.Sources.SubstanceInflowT CO2_left(
             SubstanceFlow(displayUnit="mmol/min") = CO2_production,
             redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
             substanceData=Chemical.Substances.CarbonDioxide_gas()) annotation (Placement(
                 transformation(
                 extent={{-10,-10},{10,10}},
                 rotation=180,
                 origin={70,-38})));
           Sensors.BloodGasesMeasurement tissue annotation (Placement(transformation(
                 extent={{10,10},{-10,-10}},
                 rotation=180,
                 origin={38,-8})));
             replaceable package Blood =
                 Media.BloodBySiggaardAndersen               annotation(choicesAllMatching=True);
           Interfaces.FluidPort_a q_in(redeclare package Medium = Blood)
             annotation (Placement(transformation(rotation=0, extent={{83,-5},{96,6}}),
                 iconTransformation(extent={{95,-7},{108,4}})));
           Interfaces.FluidPort_b q_out(redeclare package Medium = Blood)
             annotation (Placement(transformation(rotation=0, extent={{-97,-5},{-84,6}}),
                 iconTransformation(extent={{-105,-5},{-92,6}})));
        Types.RealIO.PressureOutput pressure annotation (Placement(transformation(
                extent={{56,-36},{76,-16}}), iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={60,-64})));
        Types.RealIO.PressureOutput pO2 annotation (Placement(transformation(extent={{
                  56,4},{76,24}}), iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-60,-64})));
        Types.RealIO.PressureOutput pCO2 annotation (Placement(transformation(extent={
                  {56,-8},{76,12}}), iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-20,-64})));
        Types.RealIO.pHOutput pH annotation (Placement(transformation(extent={{56,-22},
                  {76,-2}}), iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={20,-64})));
         equation
           connect(systemicVeinsResistance.q_in, systemicCapillaries.q_in[1]) annotation (Line(
               points={{-12,30},{-4,30},{-4,-12.2667},{-1.9,-12.2667}},
               color={127,0,0},
               thickness=0.5));
           connect(systemicArteriesResistance.q_out, systemicCapillaries.q_in[2]) annotation (
               Line(
               points={{12,30},{-2,30},{-2,-14},{-1.9,-14}},
               color={127,0,0},
               thickness=0.5));
           connect(systemicCapillaries.substances[2],O2_left. port_a)
             annotation (Line(points={{8,-14},{8,-12},{14,-12},{14,-38},{-60,-38}},        color={158,66,200}));
           connect(systemicCapillaries.substances[3],CO2_left. port_b)
             annotation (Line(points={{8,-14},{18,-14},{18,-38},{60,-38}},                color={158,66,200}));
           connect(tissue.referenceFluidPort, systemicCapillaries.q_in[3]) annotation (Line(
               points={{38,-17.8},{38,-20},{-1.9,-20},{-1.9,-15.7333}},
               color={127,0,0},
               thickness=0.5));
           connect(tissue.CO2, systemicCapillaries.substances[3])
             annotation (Line(points={{28,-8},{18,-8},{18,-14},{8,-14}}, color={158,66,200}));
           connect(systemicCapillaries.substances[2], tissue.O2) annotation (Line(points={{8,-14},
                   {8,-12},{14,-12},{14,-2},{28,-2}}, color={158,66,200}));
           connect(tissue.H_plus, systemicCapillaries.substances[13]) annotation (Line(points={{
                   28,-14},{20,-14},{20,-16},{8,-16},{8,-14}}, color={158,66,200}));
           connect(q_in, systemicArteriesResistance.q_in)
             annotation (Line(points={{89.5,0.5},{70,0.5},{70,30},{32,30}},
                                                                        color={127,0,0}));
           connect(q_out, systemicVeinsResistance.q_out)
             annotation (Line(points={{-90.5,0.5},{-44,0.5},{-44,30},{-32,30}},
                                                                            color={127,0,0}));
        connect(tissue.pressure, pressure)
          annotation (Line(points={{48.8,-18},{48.8,-26},{66,-26}}, color={0,0,127}));
        connect(tissue.pO2, pO2) annotation (Line(points={{48.8,-2},{52,-2},{52,14},{
                66,14}}, color={0,0,127}));
        connect(tissue.pCO2, pCO2) annotation (Line(points={{48.8,-8},{54,-8},{54,2},{
                66,2}}, color={0,0,127}));
        connect(tissue.pH, pH) annotation (Line(points={{48.8,-14},{52,-14},{52,-12},{
                66,-12}}, color={0,0,127}));
           annotation (Diagram(coordinateSystem(extent={{-90,-50},{90,50}})), Icon(
                 coordinateSystem(extent={{-90,-50},{90,50}})));
         end TissueUnit;

    public
         model AlveolarUnit
           extends Physiolibrary.Icons.PulmonaryCirculation;
           Physiolibrary.Fluid.Components.Resistor pulmonaryResistanceA(redeclare
            package Medium =                                                                       Blood, Resistance=(1/
                 cCirculation)*(7/8))
                                    annotation (Placement(transformation(
                 extent={{-10,-10},{10,10}},
                 rotation=0,
                 origin={-18,-70})));
           Physiolibrary.Fluid.Components.Resistor pulmonaryResistanceB(redeclare
            package Medium =                                                                       Blood, Resistance=(1/
                 cCirculation)*(1/8))
                                    annotation (Placement(transformation(
                 extent={{-10,-10},{10,10}},
                 rotation=0,
                 origin={14,-70})));
           Physiolibrary.Fluid.Components.ElasticVessel pulmonaryCapillaries(
             redeclare package Medium = Blood,
             useSubstances=true,
             volume_start(displayUnit="l") = 0.00015,
             Compliance(displayUnit="ml/mmHg") = 3.0002463033826e-08,
             ZeroPressureVolume(displayUnit="l") = 0.0001,
             nPorts=3) annotation (Placement(transformation(
                 extent={{10,-10},{-10,10}},
                 rotation=0,
                 origin={-2,-36})));
           Chemical.Components.GasSolubility O2(KC=1e-4) annotation (Placement(transformation(extent={{-28,-16},
                     {-8,4}})));
           Chemical.Components.GasSolubility CO2(KC=1e-4) annotation (Placement(transformation(extent={{2,-14},
                     {22,6}})));
           Physiolibrary.Fluid.Components.Conductor conductorA(redeclare package
            Medium =                                                                      Air, Conductance(displayUnit="l/(cmH2O.s)")=
                  cVentilation) annotation (Placement(transformation(
                 extent={{-10,-10},{10,10}},
                 rotation=0,
                 origin={-70,28})));
           Physiolibrary.Fluid.Sensors.FlowMeasure flowMeasureInAlveoli(redeclare
            package Medium =                                                                       Air)
             annotation (Placement(transformation(extent={{-46,18},{-26,38}})));
           Physiolibrary.Fluid.Components.ElasticVessel alveoli(
             redeclare package Medium = Air,
             useSubstances=true,
             onElectricGround=false,
             volume_start(displayUnit="l") = 0.0023,
             Compliance(displayUnit="ml/mmHg") = 6.0004926067653e-07,
             ZeroPressureVolume(displayUnit="l") = 0.0013,
             ExternalPressure(displayUnit="mmHg") = 100791.72488574,
          nPorts=2)    annotation (Placement(transformation(
                 extent={{-10,-10},{10,10}},
                 rotation=90,
                 origin={-6,28})));
           Physiolibrary.Fluid.Sensors.FlowMeasure flowMeasureOutAlveoli(redeclare
            package Medium =                                                                        Air)
             annotation (Placement(transformation(extent={{20,18},{40,38}})));
             replaceable package Blood =
                 Physiolibrary.Media.BloodBySiggaardAndersen annotation(choicesAllMatching=True);
             replaceable package Air =
                 Physiolibrary.Media.Air annotation(choicesAllMatching=True);
             parameter Physiolibrary.Types.HydraulicConductance cVentilation=1.250102626409427e-07*(1/1.5);
             parameter Physiolibrary.Types.HydraulicConductance cCirculation=1.250102626409427e-07*(1/3);
           Physiolibrary.Fluid.Interfaces.FluidPort_a q_in(redeclare package Medium = Air)
             annotation (Placement(transformation(rotation=0, extent={{-30,40},{-10,60}}),
                 iconTransformation(extent={{-30,40},{-10,60}})));
           Physiolibrary.Fluid.Interfaces.FluidPort_b q_out(redeclare package Medium = Air)
             annotation (Placement(transformation(rotation=0, extent={{10,40},{30,60}}),
                 iconTransformation(extent={{10,40},{30,60}})));
           Physiolibrary.Fluid.Interfaces.FluidPort_a q_in1(redeclare package Medium = Blood)
             annotation (Placement(transformation(rotation=0, extent={{-114,-80},{-94,-60}}),
                 iconTransformation(extent={{-110,-10},{-90,10}})));
           Physiolibrary.Fluid.Interfaces.FluidPort_b q_out1(redeclare package Medium = Blood)
             annotation (Placement(transformation(rotation=0, extent={{90,-80},{110,-60}}),
                 iconTransformation(extent={{90,-10},{110,10}})));
           Physiolibrary.Fluid.Components.Conductor conductorB(redeclare package
            Medium =                                                                      Air, Conductance(displayUnit="l/(cmH2O.s)")=
                  cVentilation)        annotation (Placement(transformation(
                 extent={{-10,-10},{10,10}},
                 rotation=0,
                 origin={60,28})));
           Sensors.BloodGasesMeasurement alveolar(redeclare package Medium = Blood)
             annotation (Placement(transformation(extent={{36,-42},{56,-22}})));
           Types.RealIO.PressureOutput pressure annotation (Placement(transformation(extent={{100,-52},
                     {120,-32}}),      iconTransformation(extent={{-10,-10},{10,10}},
                 rotation=270,
                 origin={60,-50})));
           Types.RealIO.pHOutput pH
             annotation (Placement(transformation(extent={{100,-30},{120,-10}}),
                 iconTransformation(
                 extent={{-10,-10},{10,10}},
                 rotation=270,
                 origin={20,-50})));
           Types.RealIO.PressureOutput pO2
             annotation (Placement(transformation(extent={{100,2},{120,22}}),
                 iconTransformation(
                 extent={{-10,-10},{10,10}},
                 rotation=270,
                 origin={-60,-50})));
           Types.RealIO.PressureOutput pCO2
             annotation (Placement(transformation(extent={{100,-16},{120,4}}),
                 iconTransformation(
                 extent={{-10,-10},{10,10}},
                 rotation=270,
                 origin={-20,-50})));
         equation
           connect(O2.gas_port,alveoli. substances[1])
             annotation (Line(points={{-18,4},{-18,18},{-6,18}},            color={158,66,200}));
           connect(alveoli.substances[2],CO2. gas_port)
             annotation (Line(points={{-6,18},{12,18},{12,6}},              color={158,66,200}));
           connect(O2.liquid_port, pulmonaryCapillaries.substances[2])
             annotation (Line(points={{-18,-16},{-18,-20},{8,-20},{8,-36}},
                                                                 color={158,66,200}));
           connect(CO2.liquid_port, pulmonaryCapillaries.substances[3])
             annotation (Line(points={{12,-14},{12,-36},{8,-36}},
                                                               color={158,66,200}));
           connect(pulmonaryResistanceB.q_in, pulmonaryCapillaries.q_in[1])
             annotation (Line(
               points={{4,-70},{-2,-70},{-2,-34.2667},{-1.9,-34.2667}},
               color={127,0,0},
               thickness=0.5));
           connect(pulmonaryResistanceA.q_out, pulmonaryCapillaries.q_in[2])
             annotation (Line(
               points={{-8,-70},{-4,-70},{-4,-36},{-1.9,-36}},
               color={127,0,0},
               thickness=0.5));
           connect(q_in, conductorA.q_in) annotation (Line(
               points={{-20,50},{-86,50},{-86,28},{-80,28}},
               color={127,0,0},
               thickness=0.5));
           connect(conductorA.q_out, flowMeasureInAlveoli.q_in)
             annotation (Line(
               points={{-60,28},{-46,28}},
               color={127,0,0},
               thickness=0.5));
           connect(q_in1, pulmonaryResistanceA.q_in)
             annotation (Line(
               points={{-104,-70},{-28,-70}},
               color={127,0,0},
               thickness=0.5));
           connect(pulmonaryResistanceB.q_out, q_out1)
             annotation (Line(
               points={{24,-70},{100,-70}},
               color={127,0,0},
               thickness=0.5));
           connect(flowMeasureOutAlveoli.q_out, conductorB.q_in)
             annotation (Line(
               points={{40,28},{50,28}},
               color={127,0,0},
               thickness=0.5));
           connect(conductorB.q_out, q_out)
             annotation (Line(
               points={{70,28},{74,28},{74,50},{20,50}},
               color={127,0,0},
               thickness=0.5));
           connect(alveolar.referenceFluidPort, pulmonaryCapillaries.q_in[3]) annotation (Line(
               points={{46,-41.8},{46,-52},{-1.9,-52},{-1.9,-37.7333}},
               color={127,0,0},
               thickness=0.5));
           connect(alveolar.O2, pulmonaryCapillaries.substances[2]) annotation (Line(points={{36,-26},
                   {8,-26},{8,-36}},                     color={158,66,200}));
           connect(alveolar.CO2, pulmonaryCapillaries.substances[3]) annotation (Line(points={{36,-32},
                   {12,-32},{12,-36},{8,-36}},           color={158,66,200}));
           connect(alveolar.H_plus, pulmonaryCapillaries.substances[13]) annotation (Line(
                 points={{36,-38},{8,-38},{8,-36}},                color={158,66,200}));
           connect(alveolar.pressure, pressure)
             annotation (Line(points={{56.8,-42},{110,-42}},                 color={0,0,127}));
           connect(alveolar.pH, pH)
             annotation (Line(points={{56.8,-38},{96,-38},{96,-20},{110,-20}},
                                                                           color={0,0,127}));
           connect(alveolar.pCO2, pCO2)
             annotation (Line(points={{56.8,-32},{94,-32},{94,-6},{110,-6}},
                                                                           color={0,0,127}));
           connect(alveolar.pO2, pO2)
             annotation (Line(points={{56.8,-26},{90,-26},{90,12},{110,12}}, color={0,0,127}));
           connect(pressure, pressure)
             annotation (Line(points={{110,-42},{110,-42}}, color={0,0,127}));
        connect(flowMeasureInAlveoli.q_out, alveoli.q_in[1]) annotation (Line(
            points={{-26,28},{-7.3,27.9}},
            color={127,0,0},
            thickness=0.5));
        connect(flowMeasureOutAlveoli.q_in, alveoli.q_in[2]) annotation (Line(
            points={{20,28},{-4.7,27.9}},
            color={127,0,0},
            thickness=0.5));
           annotation (
             Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
             Icon(coordinateSystem(extent={{-100,-100},{100,100}})));
         end AlveolarUnit;

         model RespiratoryCenter
           extends Physiolibrary.Icons.RespiratoryCenter;
           Modelica.Blocks.Math.Add add annotation (Placement(transformation(
                 extent={{-7,-7},{7,7}},
                 rotation=90,
                 origin={-59,15})));
           Physiolibrary.Types.Constants.PressureConst pressure(k(displayUnit="kPa") = -
               pCO2_ZeroVentilation)
             annotation (Placement(transformation(
                 extent={{-4,-4},{4,4}},
                 rotation=90,
                 origin={-56,-10})));
           Physiolibrary.Types.Constants.HydraulicConductanceConst hydraulicConductance2(k(
                 displayUnit="ml/(kPa.min)") = 2.5e-07) annotation (Placement(transformation(
                 extent={{-4,-4},{4,4}},
                 rotation=90,
                 origin={-68,-48})));
           Modelica.Blocks.Math.Product product3 annotation (Placement(transformation(
                 extent={{-10,-10},{10,10}},
                 rotation=90,
                 origin={-52,40})));
           Modelica.Blocks.Math.Max totalVentilation annotation (Placement(transformation(
                 extent={{-7,-7},{7,7}},
                 rotation=90,
                 origin={-67,69})));
           Modelica.Blocks.Sources.Constant const(k=0) annotation (Placement(transformation(
                 extent={{-4,-4},{4,4}},
                 rotation=90,
                 origin={-72,52})));
           Modelica.Blocks.Math.Add add1(k2=+1) annotation (Placement(transformation(
                 extent={{-6,-6},{6,6}},
                 rotation=90,
                 origin={52,-2})));
           Physiolibrary.Types.Constants.VolumeConst deadspace_c(k(displayUnit="l") = 0.00035)
             annotation (Placement(transformation(
                 extent={{-4,-4},{4,4}},
                 rotation=90,
                 origin={70,-38})));
           Modelica.Blocks.Math.Division respirationRate annotation (Placement(transformation(
                 extent={{-6,-6},{6,6}},
                 rotation=90,
                 origin={50,42})));
           Modelica.Blocks.Math.Product RR_multiply annotation (Placement(transformation(
                 extent={{-7,-7},{7,7}},
                 rotation=180,
                 origin={39,63})));
           Physiolibrary.Types.Constants.VolumeConst base_deadspace_volume(k=DV) annotation (
               Placement(transformation(
                 extent={{-4,-4},{4,4}},
                 rotation=180,
                 origin={70,64})));
           Physiolibrary.Types.Constants.VolumeConst volume(k(displayUnit="l") = 0.0023)
             annotation (Placement(transformation(
                 extent={{-4,-4},{4,4}},
                 rotation=90,
                 origin={68,-2})));
           Modelica.Blocks.Math.Min tidalVolume annotation (Placement(transformation(
                 extent={{-5,-5},{5,5}},
                 rotation=90,
                 origin={55,21})));
           Modelica.Blocks.Math.Division slope annotation (Placement(transformation(
                 extent={{-6,-6},{6,6}},
                 rotation=90,
                 origin={-30,0})));
           Modelica.Blocks.Math.Max max1 annotation (Placement(transformation(
                 extent={{-5,-5},{5,5}},
                 rotation=90,
                 origin={-27,-29})));
           Modelica.Blocks.Math.Add add2(k2=-1) annotation (Placement(transformation(
                 extent={{-6,-6},{6,6}},
                 rotation=90,
                 origin={-40,-58})));
           Modelica.Blocks.Sources.Constant const2(k=5000 - 4300) annotation (Placement(
                 transformation(
                 extent={{-5,-5},{5,5}},
                 rotation=90,
                 origin={-23,-63})));
           Modelica.Blocks.Math.Product product4 annotation (Placement(transformation(
                 extent={{-6,-6},{6,6}},
                 rotation=90,
                 origin={36,-38})));
           Modelica.Blocks.Sources.Constant const3(k=4300) annotation (Placement(transformation(
                 extent={{-6,-6},{6,6}},
                 rotation=90,
                 origin={-36,-88})));
           Modelica.Blocks.Math.Gain W(k=(90*(101325/760) - 4.3*1000)) annotation (Placement(
                 transformation(
                 extent={{-5,-5},{5,5}},
                 rotation=90,
                 origin={-59,-31})));
           Physiolibrary.Types.Constants.FrequencyConst m(k=0.505) annotation (Placement(
                 transformation(
                 extent={{-4,-4},{4,4}},
                 rotation=180,
                 origin={70,-70})));

           parameter Physiolibrary.Types.Pressure pCO2_ZeroVentilation(displayUnit="kPa")=4800
                                                                       "Long term adaptation for pCO2 during acidosis/alcalosis";
           parameter Physiolibrary.Types.Volume DV=0.00015
                                                   "Deadspace volume";
           Modelica.Blocks.Interfaces.RealOutput deadSpaceVentilation annotation (Placement(
                 transformation(rotation=0, extent={{98,21.5},{118,46.5}}),
                 iconTransformation(
                 extent={{-10,-12.5},{10,12.5}},
                 rotation=270,
                 origin={60,-108})));
           Modelica.Blocks.Interfaces.RealInput pCO2 "Arterial pCO2"
             annotation (Placement(transformation(rotation=0, extent={{-96,-20.5},{-76,
                  4.5}}),
                 iconTransformation(
                 extent={{-10,-12.5},{10,12.5}},
                 rotation=0,
                 origin={-104,-10})));
           Modelica.Blocks.Interfaces.RealInput pO2 "Arterial pO2"
             annotation (Placement(transformation(rotation=0, extent={{-82,-96.5},{-62,
                  -71.5}}),
                 iconTransformation(
                 extent={{-10,-12.5},{10,12.5}},
                 rotation=0,
                 origin={-106,-90})));
           Modelica.Blocks.Interfaces.RealOutput ventilation annotation (Placement(
                 transformation(rotation=0, extent={{-26,76.5},{-6,101.5}}),
                 iconTransformation(
                 extent={{-10,-12.5},{10,12.5}},
                 rotation=270,
                 origin={4,-107})));
         equation
           connect(const.y, totalVentilation.u1)
             annotation (Line(points={{-72,56.4},{-71.2,60.6}}, color={0,0,127}));
           connect(pressure.y,add. u2) annotation (Line(points={{-56,-5},{-46,-5},{-46,
                6.6},{-54.8,6.6}},color={0,0,127}));
           connect(add.y,product3. u1) annotation (Line(points={{-59,22.7},{-72,22.7},
                {-72,28},{-58,28}},color={0,0,127}));
           connect(totalVentilation.u2, product3.y)
             annotation (Line(points={{-62.8,60.6},{-52,60.6},{-52,51}},   color={0,0,127}));
           connect(deadspace_c.y,add1. u2) annotation (Line(points={{70,-33},{70,-26},
                {55.6,-26},{55.6,-9.2}},      color={0,0,127}));
           connect(base_deadspace_volume.y,RR_multiply. u2) annotation (Line(points={{65,64},
                {65,67.2},{47.4,67.2}},             color={0,0,127}));
           connect(respirationRate.y,RR_multiply. u1) annotation (Line(points={{50,48.6},
                {62,48.6},{62,56},{54,56},{54,58.8},{47.4,58.8}},
                 color={0,0,127}));
           connect(tidalVolume.u1,add1. y)
             annotation (Line(points={{52,15},{52,4.6}},      color={0,0,127}));
           connect(tidalVolume.y,respirationRate. u2) annotation (Line(points={{55,26.5},
                {53.6,26.5},{53.6,34.8}},               color={0,0,127}));
           connect(volume.y,tidalVolume. u2) annotation (Line(points={{68,3},{68,15},{
                58,15}},            color={0,0,127}));
           connect(totalVentilation.y, respirationRate.u1) annotation (Line(points={{-67,
                76.7},{-67,78},{24,78},{24,30},{46.4,30},{46.4,34.8}},
                                                       color={0,0,127}));
           connect(const2.y,max1. u2) annotation (Line(points={{-23,-57.5},{-26,-57.5},
                {-26,-42},{-24,-42},{-24,-35}},
                                              color={0,0,127}));
           connect(add2.y,max1. u1)
             annotation (Line(points={{-40,-51.4},{-30,-51.4},{-30,-35}}, color={0,0,127}));
           connect(max1.y,slope. u2) annotation (Line(points={{-27,-23.5},{-26,-23.5},
                {-26,-7.2},{-26.4,-7.2}}, color={0,0,127}));
           connect(product4.u1, totalVentilation.y) annotation (Line(points={{32.4,
                -45.2},{32.4,-52},{24,-52},{24,78},{-67,78},{-67,76.7}},
                 color={0,0,127}));
           connect(const3.y,add2. u2) annotation (Line(points={{-36,-81.4},{-32,-81.4},
                {-32,-78},{-36,-78},{-36,-65.2},{-36.4,-65.2}},    color={0,0,127}));
           connect(product4.y,add1. u1) annotation (Line(points={{36,-31.4},{36,-9.2},
                {48.4,-9.2}},             color={0,0,127}));
           connect(slope.y,product3. u2) annotation (Line(points={{-30,6.6},{-30,18},{
                -46,18},{-46,28}},       color={0,0,127}));
           connect(hydraulicConductance2.y,W. u)
             annotation (Line(points={{-68,-43},{-68,-37},{-59,-37}},
                                                                    color={0,0,127}));
           connect(W.y,slope. u1) annotation (Line(points={{-59,-25.5},{-59,-18},{
                -33.6,-18},{-33.6,-7.2}},     color={0,0,127}));
           connect(m.y,product4. u2) annotation (Line(points={{65,-70},{48,-70},{48,
                -64},{39.6,-64},{39.6,-45.2}},      color={0,0,127}));
           connect(deadSpaceVentilation, RR_multiply.y) annotation (Line(points={{108,34},
                {90,34},{90,90},{26,90},{26,63},{31.3,63}},
                                                color={0,0,127}));
           connect(pCO2, add.u1)
             annotation (Line(points={{-86,-8},{-63.2,-8},{-63.2,6.6}}, color={0,0,127}));
           connect(pO2, add2.u1)
             annotation (Line(points={{-72,-84},{-52,-84},{-52,-65.2},{-43.6,-65.2}},
                                                                           color={0,0,127}));
           connect(ventilation, totalVentilation.y) annotation (Line(points={{-16,89},
                {-67,89},{-67,76.7}},                      color={0,0,127}));
           annotation (Diagram(                                              graphics={
                 Text(
                   extent={{6,-76},{34,-84}},
                   textColor={28,108,200},
                   textString="Calculation of slope")}));
         end RespiratoryCenter;
       end BloodGasesTransport;
     end Examples;
  annotation (Documentation(info="<html>
<p>The main usage of this fluid domain is modeling of the cardio-vascular, respiratory and lymhpatic system in human physiology. And because there are no extreme thermodynamic conditions, the system can be really simple &mdash;it is only necessary to model conditions for ideal gases, for incompressible liquids, at normal liquid temperatures and with relative pressure 5-20kPa. This boring thermodynamic state leads to the very simple blocks of resistance,  pressure, volumetric flow, inertia and finally the block of blood accumulation in elastic comparments.</p>
</html>"));
  end Fluid;

   package Thermal
     "Domain with Temperature and Heat Flow - extension of Modelica.Thermal.HeatTransfer"
    extends Modelica.Icons.Package;
     package Examples
       "Examples that demonstrate usage of the Pressure flow components"
     extends Modelica.Icons.ExamplesPackage;

       model SkinHeatFlow
       extends Modelica.Icons.Example;

      Components.IdealRadiator skinCirculation(MassFlow(displayUnit=
              "g/min") =
          0.0028333333333333) "Blood flow through skin"
        annotation (Placement(transformation(extent={{16,-32},{36,-12}})));
      Sources.UnlimitedHeat bodyCore(T(displayUnit="degC") = 310.15)
        annotation (Placement(transformation(extent={{-20,-30},{0,-10}})));
      Sources.UnlimitedHeat skin(T(displayUnit="degC") = 301.15)
        annotation (Placement(transformation(extent={{-8,4},{12,24}})));
       equation
      connect(
          skinCirculation.q_in, bodyCore.port) annotation (Line(
          points={{16,-20},{0,-20}},
          color={191,0,0},
          thickness=1));
      connect(
          skin.port, skinCirculation.q_out) annotation (Line(
          points={{12,14},{26,14},{26,-12}},
          color={191,0,0},
          thickness=1));
      annotation (experiment(StopTime=10000, Tolerance=1e-006),
          Documentation(
            revisions="<html>
	<p><i>2014-2018</i></p>
	<p>Marek Matejak, marek@matfyz.cz </p>
	</html>"));
       end SkinHeatFlow;

       model MuscleHeat
       extends Modelica.Icons.Example;

      Components.HeatAccumulation muscle(
        relativeHeat_start=52125.66,
        SpecificHeat=3475.044,
        Weight(displayUnit="kg") = 15)
        annotation (Placement(transformation(extent={{16,22},{36,42}})));
      Components.IdealRadiator
         muscleCirculation(MassFlow(displayUnit="g/min") = 0.0114)
        "Blood circulation in skeletal muscle"
        annotation (Placement(transformation(extent={{16,-32},{36,-12}})));
      Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow generatedHeat(
          Q_flow=
            13.956) "Heat energy created by muscle"
        annotation (Placement(transformation(extent={{-32,20},{-12,40}})));
      Sources.UnlimitedHeat body(T(displayUnit="degC") =
         310.15)
        annotation (Placement(transformation(extent={{-32,-30},{-12,-10}})));
       equation
      connect(
          muscle.q_in, generatedHeat.port)
            annotation (Line(
          points={{26,32},{8,32},{8,30},{-12,30}},
          color={191,0,0},
          thickness=1));
      connect(
          muscleCirculation.q_in, body.port) annotation (Line(
          points={{16,-20},{-12,-20}},
          color={191,0,0},
          thickness=1));
      connect(
          muscle.q_in, muscleCirculation.q_out) annotation (Line(
          points={{26,32},{26,-12}},
          color={191,0,0},
          thickness=1));
      annotation (experiment(StopTime=10000, Tolerance=1e-006),
          Documentation(
            revisions="<html>
	<p><i>2014-2018</i></p>
	<p>Marek Matejak, marek@matfyz.cz </p>
	</html>"));
       end MuscleHeat;

       model ThermalBody_QHP
      import Physiolibrary;
      extends Modelica.Icons.Example;
      Thermal.Components.HeatAccumulation core(SpecificHeat=3475.044,
          Weight=
        10.75) annotation (Placement(transformation(extent={{-12,-4},{8,16}})));
      Thermal.Components.HeatAccumulation GILumen(Weight=1)
        annotation (Placement(transformation(extent={{40,-52},{60,-32}})));
      Thermal.Components.HeatAccumulation skeletalMuscle(SpecificHeat=
        3475.044, Weight=7.05)
        annotation (Placement(transformation(extent={{36,42},{56,62}})));
      Thermal.Components.IdealRadiator muscleBloodFlow(
        MassFlow(displayUnit="g/min") = 0.0114,
        useMassFlowInput=false,
        SpecificHeat=3851.856) annotation (Placement(transformation(extent={{-10,
                -10},{10,10}}, origin={32,30})));
      Thermal.Sources.MassOutflow urination
        annotation (Placement(transformation(extent={{-28,-60},{-48,-40}})));
      Thermal.Sources.MassOutflow lungsVapor(
        VaporizationHeat(displayUnit="kcal/g") = 2428344,
        SpecificHeat(displayUnit="kcal/(kg.K)"),
        MassFlow(displayUnit="g/min") = 4.6666666666667e-06)
        annotation (Placement(transformation(extent={{12,66},{32,86}})));
      Thermal.Components.HeatAccumulation skin(
        relativeHeat_start=-8373.6,
        SpecificHeat=3475.044,
        Weight=0.56)
        annotation (Placement(transformation(extent={{-68,4},{-48,24}})));
      Thermal.Components.IdealRadiator skinBloodFlow(
        MassFlow(displayUnit="g/min") = 0.0028333333333333,
        useMassFlowInput=false,
        SpecificHeat=3851.856) annotation (Placement(transformation(extent={{10,
                -10},{-10,10}}, origin={-28,2})));
      Thermal.Sources.MassOutflow insensibleVapor(
        VaporizationHeat(displayUnit="kcal/g") = 2428344,
        SpecificHeat(displayUnit="kcal/(kg.K)"),
        MassFlow(displayUnit="g/min") = 6.5e-06)
        annotation (Placement(transformation(extent={{-48,32},{-28,52}})));
      Thermal.Sources.MassOutflow sweating(VaporizationHeat(displayUnit=
              "kcal/g") = 2428344, SpecificHeat(displayUnit="kcal/(kg.K)"))
        annotation (Placement(transformation(extent={{-44,58},{-24,78}})));
      Modelica.Thermal.HeatTransfer.Components.ThermalConductor
        lumenVolume(G(
        displayUnit="kcal/(min.K)") = 1)
        annotation (Placement(transformation(extent={{32,-60},{12,-40}})));
      Modelica.Thermal.HeatTransfer.Components.ThermalConductor air(G(
        displayUnit="kcal/(min.K)") = 2.4423)                   annotation (Placement(
            transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-76,50})));
      Thermal.Sources.UnlimitedHeat ambient(T=295.15)
        annotation (
          Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-76,84})));
      Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow
        skinMetabolicHeat(
          Q_flow=
        1.95384)
        annotation (Placement(transformation(extent={{-92,2},{-72,22}})));
      Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow
        coreMetabolicHeat(
          Q_flow=
        55.824) annotation (Placement(transformation(extent={{86,-6},{66,14}})));
      Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow
        muscleMetabolicHeat(
          Q_flow(
        displayUnit="kcal/min") = 9.7692) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={78,60})));
      Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow foodHeatIntake(
          Q_flow=
           0)   annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={78,-38})));
      Thermal.Components.Stream foodAbsorption(SpecificHeat=4186.8)
        annotation (Placement(transformation(extent={{44,-32},{24,-12}})));
       equation

      connect(
          core.q_in, muscleBloodFlow.q_in) annotation (Line(
          points={{-2,6},{-2,32},{22,32}},
          color={191,0,0},
          thickness=1));
      connect(
          skeletalMuscle.q_in, muscleBloodFlow.q_out) annotation (Line(
          points={{46,52},{32,52},{32,40}},
          color={191,0,0},
          thickness=1));
      connect(
          core.q_in, urination.q_in) annotation (Line(
          points={{-2,6},{-6,6},{-6,-50},{-28,-50}},
          color={191,0,0},
          thickness=1));
      connect(
          core.q_in, lungsVapor.q_in) annotation (Line(
          points={{-2,6},{-2,76},{12,76}},
          color={191,0,0},
          thickness=1));
      connect(
          skin.q_in, insensibleVapor.q_in) annotation (Line(
          points={{-58,14},{-58,42},{-48,42}},
          color={191,0,0},
          thickness=1));
      connect(
          sweating.q_in, insensibleVapor.q_in) annotation (Line(
          points={{-44,68},{-58,68},{-58,42},{-48,42}},
          color={191,0,0},
          thickness=1));
      connect(
          GILumen.q_in, lumenVolume.port_a) annotation (Line(
          points={{50,-42},{40,-42},{40,-50},{32,-50}},
          color={191,0,0},
          thickness=1));
      connect(
          core.q_in, lumenVolume.port_b) annotation (Line(
          points={{-2,6},{2,6},{2,-50},{12,-50}},
          color={191,0,0},
          thickness=1));
      connect(
          skin.q_in, air.port_b) annotation (Line(
          points={{-58,14},{-58,30},{-76,30},{-76,40}},
          color={191,0,0},
          thickness=1));
      connect(
          skin.q_in, skinMetabolicHeat.port)
       annotation (Line(
          points={{-58,14},{-66,14},{-66,12},{-72,12}},
          color={191,0,0},
          thickness=1));
      connect(
          GILumen.q_in, foodHeatIntake.port)
             annotation (Line(
          points={{50,-42},{60,-42},{60,-38},{68,-38}},
          color={191,0,0},
          thickness=1));
      connect(
          skeletalMuscle.q_in, muscleMetabolicHeat.port)
            annotation (Line(
          points={{46,52},{58,52},{58,60},{68,60}},
          color={191,0,0},
          thickness=1));
      connect(
          core.q_in, coreMetabolicHeat.port)
       annotation (Line(
          points={{-2,6},{32,6},{32,4},{66,4}},
          color={191,0,0},
          thickness=1));
      connect(
          skinBloodFlow.q_in, core.q_in) annotation (Line(
          points={{-18,4},{-12,4},{-12,6},{-2,6}},
          color={191,0,0},
          thickness=1));
      connect(
          GILumen.q_in,foodAbsorption. q_in)
             annotation (Line(
          points={{50,-42},{50,-22},{44,-22}},
          color={191,0,0},
          thickness=1));
      connect(
          foodAbsorption.q_out, core.q_in)
           annotation (Line(
          points={{24,-22},{2,-22},{2,6},{-2,6}},
          color={191,0,0},
          thickness=1));
      connect(
          ambient.port, air.port_a) annotation (Line(
          points={{-76,74},{-76,60}},
          color={191,0,0},
          thickness=1));
      connect(
          skinBloodFlow.q_out, skin.q_in) annotation (Line(
          points={{-28,12},{-28,14},{-58,14}},
          color={191,0,0},
          thickness=1));
      annotation (Documentation(revisions=
                                       "<html>
	<p><i>2014-2018</i></p>
	<p>Marek Matejak, marek@matfyz.cz </p>
	</html>"),experiment(StopTime=3600));
       end ThermalBody_QHP;

       model SkinHeatTransferOnBloodFlow
       extends Modelica.Icons.Example;

      Components.IdealRadiator skinCirculation(MassFlow(displayUnit=
              "g/min") =
          0.0028333333333333) "Blood circulation through skin"
        annotation (Placement(transformation(extent={{16,-32},{36,-12}})));
      Sources.UnlimitedHeat core(T(displayUnit="degC") =
         310.15)
        annotation (Placement(transformation(extent={{-32,-30},{-12,-10}})));
      Sources.UnlimitedHeat skin(T(displayUnit="degC") = 301.15)
        annotation (Placement(transformation(extent={{-12,2},{8,22}})));
       equation
      connect(
          skinCirculation.q_in, core.port) annotation (Line(
          points={{16,-20},{-12,-20}},
          color={191,0,0},
          thickness=1));
      connect(
          skin.port, skinCirculation.q_out) annotation (Line(
          points={{8,12},{26,12},{26,-12}},
          color={191,0,0},
          thickness=1));
      annotation (experiment(StopTime=10000, Tolerance=1e-006),
          Documentation(
            revisions="<html>
	<p><i>2014-2018</i></p>
	<p>Marek Matejak, marek@matfyz.cz </p>
	</html>", info = "<html>
	<p>This flow rate can affect how much heat leaves the body, especially in cold conditions. This is shown in this model, where modeling constant temperatures of the body core (37&deg;C) and skin (28&deg;C), with a skin blood flow of 170 g/min and blood specific heat of 0.92 kcal/(kg.K), gives heat losses of about 1.4 kcal/min.</p>
	</html>"));
       end SkinHeatTransferOnBloodFlow;
     end Examples;

     package Components
       extends Modelica.Icons.Package;

       model HeatAccumulation "Accumulating of heat to substance"
      extends Physiolibrary.Icons.HeatAccumulation;
       //  extends Physiolibrary.SteadyStates.Interfaces.SteadyState(state_start=
       //        relativeHeat_start, storeUnit="kcal");
      Interfaces.HeatPort_b q_in "Heat inflow/outflow connector"
        annotation (Placement(transformation(extent={{-10,-10},{10,10}})));

      parameter Physiolibrary.Types.Heat relativeHeat_start=0
        "Heat start value = weight*(initialTemperature - 37degC)*specificHeat"
        annotation (Dialog(group="Initialization"));

      parameter Physiolibrary.Types.SpecificHeatCapacity SpecificHeat=
          4186.8
        "Mass specific heat";
      Physiolibrary.Types.Temperature T "Current temperature";

      Physiolibrary.Types.RealIO.HeatOutput relativeHeat(start=
        relativeHeat_start)
        "Current accumulated heat = weight*(T - 37degC)*specificHeat"
        annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,-100}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={60,-100})));                                           //nominal=1
        //absoluteHeat =  weight*310.15*specificHeat + relativeHeat

      constant Physiolibrary.Types.Temperature NormalBodyTemperature=
          310.15
        "Shift of absolute zero temperature to normal body values";

      parameter Boolean useMassInput=false "=true, if mass input is used"
        annotation (
        Evaluate=true,
        HideResult=true,
        choices(checkBox=true),
        Dialog(group="Conditional inputs"));

      parameter Physiolibrary.Types.Mass Weight=1
        "Total mass weight if useMassInput=false"
        annotation (Dialog(enable=not useMassInput));
      Physiolibrary.Types.RealIO.MassInput weight(start=Weight) = m if
        useMassInput "Weight of mass, where the heat are accumulated"
        annotation (Placement(transformation(extent={{-120,60},{-80,100}})));
    protected
      Physiolibrary.Types.Mass m;

       equation
      if not useMassInput then
        m = Weight;
      end if;

      q_in.T = NormalBodyTemperature + relativeHeat/(m*SpecificHeat);
      T = q_in.T;

      //state = relativeHeat;  //
      der(relativeHeat) = q_in.Q_flow;
      //change = q_in.Q_flow;
      annotation (Documentation(revisions=
                                      "<html>
	<p><i>2009-2018</i></p>
	<p>Marek Matejak, marek@matfyz.cz </p>
	</html>",   info="<html>
	<p>The &quot;HeatAccumulation&quot; library class models heat accumulation in Physiolibrary. This class has one thermal connector with temperature and heat flow. Heat energy is accumulated inside the class, stored in the variable &quot;relativeHeat&quot;. This value is relative to normal body temperature of 37 &deg;C; a positive value therefore indicates an internal temperature above 37 &deg;C, while a negative value indicates temperature below 37 &deg;C. Of course the particular value of temperature depends on the mass and specific heat of the instance.</p>
	</html>"),Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
         graphics={
        Text(extent={{-80,100},{220,140}},textString="%name",lineColor={0,0,255})}));
       end HeatAccumulation;

       model IdealRadiator "Closed circiut radiator, where outflowed = ambient temperature"
      extends Interfaces.ConditionalMassFlow;
      extends Physiolibrary.Icons.Radiator;

      parameter Physiolibrary.Types.SpecificHeatCapacity SpecificHeat=
          3851.856
        "Specific heat of flow circuit medium";
      //default heat capacity of blood is used as 0.92 kcal/(degC.kg)

      Thermal.Interfaces.HeatPort_a q_in
        annotation (Placement(transformation(extent={{-110,10},{-90,30}})));
      Thermal.Interfaces.HeatPort_b q_out
        annotation (Placement(transformation(extent={{-10,90},{10,110}})));
       equation
      q_in.Q_flow + q_out.Q_flow = 0;
       //  assert(substanceFlow>=-Modelica.Constants.eps,"In IdealRadiator must be always the forward flow direction! Not 'substanceFlow<0'!");
      q_in.Q_flow = q*(q_in.T - q_out.T)*SpecificHeat;

        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={
        Text(extent={{-144,-142},{156,-102}},textString="%name",lineColor={0,0,
              255})}), Documentation(revisions =          "<html>
	<p><i>2009-2018</i></p>
	<p>Marek Matejak, marek@matfyz.cz </p>
	</html>",       info="<html>
	<p>This class has two thermal connectors &ndash; one for liquid inside the radiator and another for the material around the radiator. Note that there is no liquid flow inside these connectors. The liquid flow can be described by a parameter or input to the instance. Together with the liquid specific heat, this flow determines the amount of heat flux from the liquid to a surrounding environment of different temperature. The calculation fulfills the ideal condition of microcirculation, where the outflowing blood has the same temperature as a tissue. This is really useful for modeling body thermal transfers, because the transfer of heat with blood flow is more significant than the typical rate of conduction through solid mass.&nbsp;</p>
	<p><br>The real inflow to radiator can be described by substanceFlow and temperature q_in.T.</p>
	<p><b>q_in.q=q_out.q is not the heat inflow to Radiator input</b>, but the heat convected from radiator to environment!</p>
	<p>The environment temperature is the same as radiator output temperature q_out.T. </p>
	<p>And the flow of heat from radiator to environment is driven by Fick principle.</p>
	</html>"));
       end IdealRadiator;

       model Conductor "Heat resistor"
        extends Interfaces.OnePort;
        extends Physiolibrary.Icons.Resistor;

      parameter Boolean useConductanceInput=false
        "=true, if external conductance value is used" annotation (
        Evaluate=true,
        HideResult=true,
        choices(checkBox=true),
        Dialog(group="Conditional inputs"));

      parameter Physiolibrary.Types.ThermalConductance Conductance=0
        "Thermal conductance if useConductanceInput=false"
        annotation (Dialog(enable=not useConductanceInput));

      Physiolibrary.Types.RealIO.ThermalConductanceInput conductance(
          start=
        Conductance) =
                     c if useConductanceInput annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,40})));

    protected
      Physiolibrary.Types.ThermalConductance c;
       equation
      if not useConductanceInput then
        c = Conductance;
      end if;

      q_in.Q_flow = c*(q_in.T - q_out.T);
      annotation (Icon(graphics={Text(
                     extent={{-70,-30},{70,30}},
                     textString="%name",
                     lineColor={0,0,255})}), Documentation(revisions=
                                                   "<html>
	<p><i>2009-2018</i></p>
	<p>Marek Matejak, marek@matfyz.cz </p>
	</html>"));
       end Conductor;

       model Stream "Flow of whole heated mass"
      extends Interfaces.OnePort;
      extends Interfaces.ConditionalMassFlow;

      parameter Physiolibrary.Types.SpecificHeatCapacity SpecificHeat
        "Of flow circuit medium";

       equation
      q_in.Q_flow = if (q > 0) then q*q_in.T*SpecificHeat else q*q_out.T*
        SpecificHeat;

        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={
        Rectangle(extent={{-100,-50},{100,50}},lineColor={0,0,127},fillColor={
              255,255,255},fillPattern=FillPattern.Solid),
        Polygon(points={{-80,25},{80,0},{-80,-25},{-80,25}},lineColor={191,0,0},
              fillColor={255,255,255},fillPattern=FillPattern.Solid),
        Text(extent={{20,-84},{320,-44}},textString="%name",lineColor={0,0,255})}),
          Documentation(revisions =                       "<html>
	<p><i>2009-2018</i></p>
	<p>Marek Matejak, marek@matfyz.cz </p>
	</html>",   info="<html>
	<p><h4><font color=\"#008000\">Bidirectional heated mass flow by temperature</font></h4></p>
	<p>Possible field values: </p>
	<table cellspacing=\"2\" cellpadding=\"0\" border=\"0.1\"><tr>
	<td></td>
	<td><p align=\"center\"><h4>forward flow</h4></p></td>
	<td><p align=\"center\"><h4>backward flow</h4></p></td>
	</tr>
	<tr>
	<td><p align=\"center\"><h4>massFlow</h4></p></td>
	<td><p align=\"center\">&gt;=0</p></td>
	<td><p align=\"center\">&lt;=0</p></td>
	</tr>
	<tr>
	<td><p align=\"center\"><h4>q_in.q</h4></p></td>
	<td><p align=\"center\">=massFlow*q_in.T*SpecificHeat</p></td>
	<td><p align=\"center\">=-q_out.q</p></td>
	</tr>
	<tr>
	<td><p align=\"center\"><h4>q_out.q</h4></p></td>
	<td><p align=\"center\">=-q_in.q</p></td>
	<td><p align=\"center\">=massFlow*q_out.T*SpecificHeat</p></td>
	</tr>
	</table>
	<br/>
	</html>"));
       end Stream;

     end Components;

     package Sources
       extends Modelica.Icons.SourcesPackage;
       model UnlimitedHeat "Prescribed temperature"

         outer Modelica.Fluid.System system "System wide properties";

         parameter Boolean useTemperatureInput=false
        "=true, if fixed temperature is from input instead of parameter"
        annotation (
        Evaluate=true,
        HideResult=true,
        choices(checkBox=true),
        Dialog(group="Conditional inputs"));

         parameter Physiolibrary.Types.Temperature T=system.T_ambient
        "Fixed temperature at port if useTemperatureInput=false"
        annotation (Dialog(enable=not useTemperatureInput));

         parameter Boolean isIsolatedInSteadyState=false
        "=true, if there is no flow at port in steady state"
        annotation (Dialog(group="Simulation", tab="Equilibrium"));


         Interfaces.HeatPort_b port
        annotation (Placement(transformation(extent={{90,-10},{110,10}})));

    protected
         Physiolibrary.Types.Temperature t "Current temperature";
    public
         Physiolibrary.Types.RealIO.TemperatureInput temperature(start=T)=
        t if
        useTemperatureInput
        annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));

       equation
         if not useTemperatureInput then
        t = T;
         end if;

         port.T = t;

         annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent=
               {{-100,
                -100},{100,100}}),
          graphics={
        Text(extent={{-150,150},{150,110}},textString="%name",lineColor={0,0,
              255}),
        Text(extent={{-150,-110},{150,-140}},lineColor={0,0,0},textString=
              "T=%T"),
        Rectangle(extent={{-100,100},{100,-100}},lineColor={0,0,0},pattern=
              LinePattern.None,fillColor={159,159,223},fillPattern=FillPattern.Backward),
        Text(extent={{0,0},{-100,-100}},lineColor={0,0,0},textString="K"),
        Line(points={{-52,0},{56,0}},color={191,0,0},thickness=0.5),
        Polygon(points={{50,-20},{50,20},{90,0},{50,-20}},lineColor={191,0,0},
              fillColor={191,0,0},fillPattern=FillPattern.Solid)}),
          Documentation(info=
                       "<HTML>
        <p>
        This model defines a fixed temperature T at its port in Kelvin,
        i.e., it defines a fixed temperature as a boundary condition.
        </p>
        </HTML>
        ",       revisions=
         "<html>
        <p><i>2009-2018</i></p>
        <p>Marek Matejak, marek@matfyz.cz </p>
        </html>"));
       end UnlimitedHeat;

       model MassOutflow "One-directional outflow of heated mass with enthalpy (vaporization heat)"
      extends Interfaces.ConditionalMassFlow;

      Interfaces.HeatPort_a q_in "flow circuit"
        annotation (Placement(
        transformation(extent={{-110,-10},{-90,10}})));
      parameter Physiolibrary.Types.SpecificEnergy VaporizationHeat=0
        "Used for whole outflow stream";
      // or 2428344 for water vaporization
      parameter Physiolibrary.Types.SpecificHeatCapacity SpecificHeat=
          4186.8
        "Of outflowing medium";
      //default heat capacity of water is 1 kcal/(degC.kg)

       equation
       //  assert(liquidOutflow_>=-Modelica.Constants.eps,"HeatOutstream must have always one forward flow direction! Not 'liquidOutflow_<0'!");
      q_in.Q_flow = q*(q_in.T*SpecificHeat + VaporizationHeat);

        annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}),
          graphics={
        Rectangle(extent={{-100,-50},{100,50}},lineColor={0,0,127},fillColor={
              255,255,255},fillPattern=FillPattern.Solid),
        Polygon(points={{-80,25},{80,0},{-80,-25},{-80,25}},lineColor={191,0,0},
              fillColor={255,255,255},fillPattern=FillPattern.Solid),
        Text(extent={{20,-84},{320,-44}},textString="%name",lineColor={0,0,255})}),
          Documentation(revisions =                       "<html>
	<p><i>2009-2018</i></p>
	<p>Marek Matejak, marek@matfyz.cz </p>
	</html>"));
       end MassOutflow;

       model MassInflow "One-directional inflow of heated mass with enthalpy (heat of solvation)"
      extends Interfaces.ConditionalMassFlow;
      extends Interfaces.ConditionalTemperature;

      Interfaces.HeatPort_b q_out "flow circuit" annotation (Placement(
        transformation(extent={{90,-10},{110,10}}), iconTransformation(extent={{
                90,-10},{110,10}})));
      parameter Physiolibrary.Types.SpecificEnergy dH=0
        "Enthalpy of incoming substance (i.e. enthalpy of solvation)";
      // or 2428344 for water vaporization
      parameter Physiolibrary.Types.SpecificHeatCapacity SpecificHeat=
          4186.8
        "Of inflowing medium";
      //default heat capacity of water is 1 kcal/(degC.kg)

       equation
       //  assert(liquidOutflow_>=-Modelica.Constants.eps,"HeatOutstream must have always one forward flow direction! Not 'liquidOutflow_<0'!");
      q_out.Q_flow = -q*(temperature*SpecificHeat + dH);

        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={
        Rectangle(extent={{-100,-50},{100,50}},lineColor={0,0,127},fillColor={
              255,255,255},fillPattern=FillPattern.Solid),
        Polygon(points={{-80,25},{80,0},{-80,-25},{-80,25}},lineColor={191,0,0},
              fillColor={255,255,255},fillPattern=FillPattern.Solid),
        Text(extent={{20,-84},{320,-44}},textString="%name",lineColor={0,0,255})}),
          Documentation(revisions =                       "<html>
	<p><i>2014-2018</i></p>
	<p>Marek Matejak, marek@matfyz.cz </p>
	</html>"));
       end MassInflow;
     end Sources;

     package Interfaces
       extends Modelica.Icons.InterfacesPackage;

       connector HeatPort =
        Modelica.Thermal.HeatTransfer.Interfaces.HeatPort (                   T(displayUnit="degC"),Q_flow(displayUnit="kcal/min", nominal=4186.8/60));
       connector HeatPort_a "Heat inflow"
      extends HeatPort;

      annotation (
        defaultComponentName="port_a",
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}), graphics={Rectangle(
                     extent={{-20,10},{20,-10}},
                     lineColor={191,0,0},
                     lineThickness=0.5),
                                      Rectangle(
                     extent={{-100,100},{100,-100}},
                     lineColor={191,0,0},
                     fillColor={191,0,0},
                     fillPattern=FillPattern.Solid)}),
        Diagram(graphics={Rectangle(
                     extent={{-40,40},{40,-40}},
                     lineColor={191,0,0},
                     fillColor={191,0,0},
                     fillPattern=FillPattern.Solid),Text(
                     extent={{-160,110},{40,50}},
                     lineColor={191,0,0},
                     textString="%name")}));
       end HeatPort_a;

       connector HeatPort_b "Heat outflow"
      extends HeatPort;

       annotation (
        defaultComponentName="port_b",
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}), graphics={Rectangle(
                     extent={{-20,10},{20,-10}},
                     lineColor={191,0,0},
                     lineThickness=0.5),
                                      Rectangle(
                     extent={{-100,100},{100,-100}},
                     lineColor={191,0,0},
                     fillColor={255,255,255},
                     fillPattern=FillPattern.Solid)}),
        Diagram(graphics={Rectangle(
                     extent={{-40,40},{40,-40}},
                     lineColor={191,0,0},
                     fillColor={255,255,255},
                     fillPattern=FillPattern.Solid),Text(
                     extent={{-160,110},{40,50}},
                     lineColor={191,0,0},
                     textString="%name")}));

       end HeatPort_b;

       partial model OnePort "Heat OnePort"

      HeatPort_a q_in
        annotation (Placement(
        transformation(extent={{-110,-10},{-90,10}})));
      HeatPort_b q_out
        annotation (Placement(
        transformation(extent={{90,-10},{110,10}})));
       equation
      q_in.Q_flow + q_out.Q_flow = 0;
      annotation (Documentation(revisions=
                                       "<html>
	<p><i>2009-2018</i></p>
	<p>Marek Matejak, marek@matfyz.cz </p>
	</html>"));
       end OnePort;

       partial model ConditionalMassFlow "Input of mass flow vs. parametric mass flow"

      parameter Boolean useMassFlowInput=false
        "=true, if mass flow input is used instead of parameter MassFlow"
        annotation (
        Evaluate=true,
        HideResult=true,
        choices(checkBox=true),
        Dialog(group="Conditional inputs"));

      parameter Physiolibrary.Types.MassFlowRate MassFlow=0
        "Mass flow if useMassFlowInput=false"
        annotation (Dialog(enable=not useMassFlowInput));

      Physiolibrary.Types.RealIO.MassFlowRateInput massFlow(start=
            MassFlow) = q if
       useMassFlowInput annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={-80,70})));

      Physiolibrary.Types.MassFlowRate q "Current mass flow";
       equation
      if not useMassFlowInput then
        q = MassFlow;
      end if;

       end ConditionalMassFlow;

       partial model ConditionalTemperature "Input of temperature vs. parametric temperature"

      parameter Boolean useTemperatureInput=false
        "=true, if temperature input is used instead of parameter T"
        annotation (
        Evaluate=true,
        HideResult=true,
        choices(checkBox=true),
        Dialog(group="Conditional inputs"));

      parameter Physiolibrary.Types.Temperature T=0
        "Temperature if useTemperatureInput=false"
        annotation (Dialog(enable=not useTemperatureInput));

      Physiolibrary.Types.RealIO.TemperatureInput t(start=T) =
        temperature if
        useTemperatureInput annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={-80,70}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,70})));

      Physiolibrary.Types.Temperature temperature "Current temperature";
       equation
      if not useTemperatureInput then
        temperature = T;
      end if;

       end ConditionalTemperature;
     end Interfaces;
     annotation (Documentation(revisions="<html>
	<p>Copyright (c) 2008-2018, Marek Matej&aacute;k, marek@matfyz.cz </p>
	<p>All rights reserved. </p>
	</html>"));
   end Thermal;

   package Population
     "Domain for populatiom models for cells, viruses, bacterias, tissues, organism etc."
     extends Modelica.Icons.Package;
     package Examples "Examples that demonstrate usage of the Population models"
        extends Modelica.Icons.ExamplesPackage;

       model PredatorPrey "LotkaVolterra equations"
      extends Modelica.Icons.Example;

      Components.Population predator(population_start=2)
        annotation (Placement(transformation(extent={{-8,42},{12,62}})));
      Components.Reproduction reproduction2(useChangePerMemberInput=true)
        annotation (Placement(transformation(extent={{-52,42},{-32,62}})));
      Components.Mortality mortality2(LifeTime(displayUnit="s") = 1)
        annotation (Placement(transformation(extent={{34,42},{54,62}})));
      Components.Reproduction reproduction1(LifeTime(displayUnit="s") = 1)
        annotation (Placement(transformation(extent={{-56,-40},{-36,-20}})));
      Components.Mortality mortality1(useChangePerMemberInput=true)
        annotation (Placement(transformation(extent={{32,-40},{52,-20}})));
      Components.Population prey(population_start=1)
        annotation (Placement(transformation(extent={{-12,-40},{8,-20}})));
      Physiolibrary.Types.Constants.PopulationChangePerMemberConst
        preyMortality(LifeTime(
        displayUnit="s") = 1)
        annotation (Placement(transformation(extent={{28,-4},{36,4}})));
      Physiolibrary.Blocks.Factors.Normalization predatorEffect
        annotation (Placement(transformation(extent={{52,-24},{32,-4}})));
      Physiolibrary.Types.Constants.PopulationChangePerMemberConst
        predatorReproduction(LifeTime(
        displayUnit="s") = 1)
        annotation (Placement(transformation(extent={{-56,80},{-48,88}})));
      Physiolibrary.Blocks.Factors.Normalization preyEffekt
        annotation (Placement(transformation(extent={{-52,60},{-32,80}})));
       equation
      connect(
          preyMortality.y, predatorEffect.yBase)
        annotation (Line(points={{37,0},{42,0},{42,-12}}, color={0,0,127}));
      connect(
          predator.population, predatorEffect.u) annotation (Line(points={{8,42},
              {8,20},{56,20},{56,-14},{50,-14}}, color={0,0,127}));
      connect(
          predatorReproduction.y, preyEffekt.yBase) annotation (Line(points={{-47,
              84},{-42,84},{-42,72}}, color={0,0,127}));
      connect(
          prey.population, preyEffekt.u) annotation (Line(points={{4,-40},{4,-48},
              {-66,-48},{-66,70},{-50,70}}, color={0,0,127}));
      connect(
          reproduction2.port_b, predator.port) annotation (Line(
          points={{-32,52},{2,52}},
          color={0,127,127},
          thickness=1));
      connect(
          predator.port, mortality2.port_a) annotation (Line(
          points={{2,52},{34.2,52}},
          color={0,127,127},
          thickness=1));
      connect(
          reproduction1.port_b, prey.port) annotation (Line(
          points={{-36,-30},{-2,-30}},
          color={0,127,127},
          thickness=1));
      connect(
          prey.port, mortality1.port_a) annotation (Line(
          points={{-2,-30},{32.2,-30}},
          color={0,127,127},
          thickness=1));
      connect(
          preyEffekt.y, reproduction2.changePerMember)
        annotation (Line(points={{-42,66},{-42,56}}, color={0,0,127}));
      connect(
          predatorEffect.y, mortality1.changePerMember)
        annotation (Line(points={{42,-18},{42,-26}}, color={0,0,127}));
      annotation (experiment(StopTime=20), __Dymola_experimentSetupOutput(
            equdistant=false));
       end PredatorPrey;
     end Examples;

     package Components
       extends Modelica.Icons.Package;
       model Population
      extends Physiolibrary.Icons.Population;
       /*  extends Physiolibrary.SteadyStates.Interfaces.SteadyState(
	    state(nominal=NominalPopulation),
	    change(nominal=NominalPopulationChange),
	    state_start=population_start,
	    storeUnit="1");
	*/
      parameter Physiolibrary.Types.Population population_start(nominal=
        NominalPopulation) =
                           1e-8 "Initial population size in compartment"
        annotation (HideResult=true, Dialog(group="Initialization"));

      parameter Physiolibrary.Types.Population NominalPopulation=1
        "Numerical scale. Default is 1, but for huge amount of cells it should be any number in the appropriate numerical order of typical amount."
        annotation (HideResult=true, Dialog(tab="Solver", group=
              "Numerical support of very huge populations"));
      parameter Physiolibrary.Types.PopulationChange
        NominalPopulationChange=1/                                         (60*60*24)
        "Numerical scale. Default change is 1 individual per day, but for much faster or much slower chnages should be different."
        annotation (HideResult=true, Dialog(tab="Solver", group=
              "Numerical support of very fast or very slow changes"));

      Interfaces.PopulationPort_b port(population(nominal=
              NominalPopulation),
          change(nominal=NominalPopulationChange)) annotation (Placement(
            transformation(extent={{-10,-10},{10,10}}), iconTransformation(
              extent={{-10,-10},{10,10}})));

      Physiolibrary.Types.RealIO.PopulationOutput population(start=
        population_start, nominal=NominalPopulation) annotation (Placement(
            transformation(extent={{46,-102},{66,-82}}),
        iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={60,-100})));
       equation
      port.population = population;

      //state = population; //
      der(population) = port.change;
      //change = port.change;
      annotation (Icon(graphics={Text(
                     extent={{-112,100},{248,140}},
                     lineColor={0,0,255},
                     textString="%name")}), Documentation(revisions=
                                                  "<html>
	<p><i>2014-2018</i></p>
	<p>Marek Matejak, marek@matfyz.cz </p>
	</html>"));
       end Population;

       model Reproduction "As population change per one individual"
      extends Interfaces.ConditionalLifeTime;
      Interfaces.PopulationPort_b port_b annotation (Placement(
            transformation(
              extent={{90,-10},{110,10}}), iconTransformation(extent={{90,-10},
                {110,10}})));
       equation
      port_b.change = -changePerPopulationMember*port_b.population;
      annotation (Icon(graphics={
        Rectangle(extent={{-100,-52},{100,48}},lineColor={0,0,127},fillColor={
              255,255,255},fillPattern=FillPattern.Solid,rotation=360),
        Polygon(points={{-80,23},{80,-2},{-80,-27},{-80,23}},lineColor={0,127,
              127},rotation=360),
        Text(extent={{-150,-20},{150,20}},lineColor={0,0,255},origin={-8,-78},
              rotation=360,textString="%name")}));
       end Reproduction;

       model Mortality "As population change per one individual"
      extends Interfaces.ConditionalLifeTime;
      Interfaces.PopulationPort_a port_a annotation (Placement(
            transformation(
              extent={{-108,-10},{-88,10}}), iconTransformation(extent={{-108,-10},
                {-88,10}})));
       equation
      port_a.change = changePerPopulationMember*port_a.population;
      annotation (Icon(graphics={
        Rectangle(extent={{-100,-50},{100,50}},lineColor={0,0,127},fillColor={
              255,255,255},fillPattern=FillPattern.Solid,rotation=360),
        Polygon(points={{-80,25},{80,0},{-80,-25},{-80,25}},lineColor={0,127,
              127},rotation=360),
        Text(extent={{-150,-20},{150,20}},lineColor={0,0,255},origin={-8,-76},
              rotation=360,textString="%name")}));
       end Mortality;

       model Stream "As population change per one individual"
      extends Interfaces.OnePort;
      extends Interfaces.ConditionalLifeTime;

       equation
      port_a.change = if (changePerPopulationMember > 0) then
        changePerPopulationMember*port_a.population else
        changePerPopulationMember*port_b.population;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent=
               {{-100,
                -100},{100,100}}), graphics={
        Rectangle(extent={{-100,-50},{100,50}},lineColor={0,0,127},fillColor={
              255,255,255},fillPattern=FillPattern.Solid,rotation=360),
        Polygon(points={{-80,25},{80,0},{-80,-25},{-80,25}},lineColor={0,127,
              127},rotation=360),
        Text(extent={{-150,-20},{150,20}},lineColor={0,0,255},origin={-8,-76},
              rotation=360,textString="%name")}));
       end Stream;

       model Change
      extends Interfaces.OnePort;
      extends Interfaces.ConditionalChange;

       equation
      port_a.change = change;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent=
               {{-100,
                -100},{100,100}}), graphics={
        Rectangle(extent={{-100,-50},{100,50}},lineColor={0,127,127},fillColor=
              {255,255,255},fillPattern=FillPattern.Solid,rotation=360),
        Polygon(points={{-80,25},{80,0},{-80,-25},{-80,25}},lineColor={0,127,
              127},fillColor={0,127,127},fillPattern=FillPattern.Solid,rotation=
               360),
        Text(extent={{-150,-20},{150,20}},lineColor={0,0,255},origin={-8,-76},
              rotation=360,textString="%name")}));
       end Change;
     end Components;

     package Sources
       extends Modelica.Icons.SourcesPackage;
       model Growth
        extends Interfaces.ConditionalChange;
      Interfaces.PopulationPort_b port_b annotation (Placement(
            transformation(
              extent={{90,-10},{110,10}}), iconTransformation(extent={{90,-10},
                {110,10}})));
       equation
      port_b.change = -change;
      annotation (Icon(graphics={
        Rectangle(extent={{-100,-52},{100,48}},lineColor={0,127,127},fillColor=
              {255,255,255},fillPattern=FillPattern.Solid,rotation=360),
        Polygon(points={{-80,23},{80,-2},{-80,-27},{-80,23}},rotation=360,
              fillColor={0,127,127},fillPattern=FillPattern.Solid,pattern=
              LinePattern.None,lineColor={0,127,127}),
        Text(extent={{-150,-20},{150,20}},lineColor={0,0,255},origin={-8,-78},
              rotation=360,textString="%name")}));
       end Growth;

       model Loss
        extends Interfaces.ConditionalChange;
      Interfaces.PopulationPort_a port_a annotation (Placement(
            transformation(
              extent={{-110,-10},{-90,10}}),
           iconTransformation(extent={{-110,-10},{-90,10}})));
       equation
      port_a.change = change;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent=
               {{-100,
                -100},{100,100}}), graphics={
        Rectangle(extent={{-100,-52},{100,48}},lineColor={0,127,127},fillColor=
              {255,255,255},fillPattern=FillPattern.Solid,rotation=360),
        Polygon(points={{-80,23},{80,-2},{-80,-27},{-80,23}},lineColor={0,127,
              127},rotation=360,fillColor={0,127,127},fillPattern=FillPattern.Solid),
        Text(extent={{-150,-20},{150,20}},lineColor={0,0,255},origin={-8,-78},
              rotation=360,textString="%name")}));
       end Loss;
     end Sources;

     package Interfaces
       extends Modelica.Icons.InterfacesPackage;
       connector PopulationPort "Average number of population members and their change"
      Physiolibrary.Types.Population population
        "Average number of population individuals";
      flow Physiolibrary.Types.PopulationChange change
        "Average population change = change of population individuals";
      annotation (Documentation(revisions=
                                      "<html>
	<p><i>2014-2018</i></p>
	<p>Marek Matejak, marek@matfyz.cz </p>
	</html>"));
       end PopulationPort;

       connector PopulationPort_a "Increase (or decrease) of population"
      extends PopulationPort;

       annotation (
        defaultComponentName="port_a",
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}), graphics={Rectangle(
                     extent={{-20,10},{20,-10}},
                     lineColor={0,127,127},
                     lineThickness=1),Rectangle(
                     extent={{-100,100},{100,-100}},
                     lineColor={0,127,127},
                     fillColor={0,127,127},
                     fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}),
        graphics={Rectangle(extent={{-40,40},{40,-40}},lineColor={0,127,127},
              fillColor={0,127,127},fillPattern=FillPattern.Solid),Text(
                     extent={{-160,110},{40,50}},
                     lineColor={0,127,127},
                     textString="%name")}),
        Documentation(info=
                       "<html>
	<p>
	Connector with one flow signal of type Real.
	</p>
	</html>", revisions="<html>
	<p><i>2014-2018</i></p>
	<p>Marek Matejak, marek@matfyz.cz </p>
	</html>"));

       end PopulationPort_a;

       connector PopulationPort_b "Decrease (or increase) of population"
      extends PopulationPort;

       annotation (
        defaultComponentName="port_b",
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}), graphics={Rectangle(
                     extent={{-20,10},{20,-10}},
                     lineColor={0,127,127},
                     lineThickness=1),Rectangle(
                     extent={{-100,100},{100,-100}},
                     lineColor={0,127,127},
                     fillColor={255,255,255},
                     fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}),
        graphics={Rectangle(extent={{-40,40},{40,-40}},lineColor={0,127,127},
              fillColor={0,127,127},fillPattern=FillPattern.Solid),Text(
                     extent={{-160,112},{40,52}},
                     lineColor={0,127,127},
                     fillColor={0,127,127},
                     fillPattern=FillPattern.Solid,
                     textString="%name")}),
        Documentation(info=
                       "<html>
	<p>
	Connector with one flow signal of type Real.
	</p>
	</html>", revisions="<html>
	<p><i>2014-2018</i></p>
	<p>Marek Matejak, marek@matfyz.cz </p>
	</html>"));

       end PopulationPort_b;

       partial model OnePort "Partial change of population between two ports without its accumulation"

      PopulationPort_b port_b
        annotation (Placement(transformation(extent={{90,-10},{110,10}})));
      PopulationPort_a port_a
        annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
       equation
      port_a.change + port_b.change = 0;
       end OnePort;

       partial model ConditionalChange "Input of population change vs. parametric constant change"

      parameter Boolean useChangeInput=false
        "=true, if real input connector is used instead of parameter PopulationChange"
        annotation (
        Evaluate=true,
        HideResult=true,
        choices(checkBox=true),
        Dialog(group="Conditional inputs"));

      parameter Physiolibrary.Types.PopulationChange PopulationChange=0
        "Population change if useChangeInput=false" annotation (HideResult=
        not useChangeInput, Dialog(enable=not useChangeInput));

      Physiolibrary.Types.RealIO.PopulationChangeInput populationChange(
          start=
        PopulationChange) =
                          change if useChangeInput annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,60}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,40})));

      Physiolibrary.Types.PopulationChange change
        "Current population change";
       equation
      if not useChangeInput then
        change = PopulationChange;
      end if;

       end ConditionalChange;

       partial model ConditionalLifeTime "Input of population change per one population member vs. parametric lifetime"

      parameter Boolean useChangePerMemberInput=false
        "=true, if real input connector is used instead of parameter LifeTime"
        annotation (
        Evaluate=true,
        HideResult=true,
        choices(checkBox=true),
        Dialog(group="Conditional inputs"));

      parameter Physiolibrary.Types.Time LifeTime=1e-8
        "Mean life time for population (=1.44*halftime) if useChangePerMember=false"
        annotation (HideResult=not useChangePerMemberInput, Dialog(enable=not
              useChangePerMemberInput));

      Physiolibrary.Types.RealIO.PopulationChangePerMemberInput
        changePerMember(
          start=1/
        LifeTime) =
                  changePerPopulationMember if useChangePerMemberInput
        annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,60}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,40})));

      Physiolibrary.Types.PopulationChangePerMember
        changePerPopulationMember
        "Current population change per individual";
       equation
      if not useChangePerMemberInput then
        changePerPopulationMember = 1/LifeTime;
      end if;

       end ConditionalLifeTime;
     end Interfaces;
     annotation (Documentation(revisions="<html>
	<p>Copyright (c) 2008-2018, Marek Matej&aacute;k, marek@matfyz.cz </p>
	<p>All rights reserved. </p>
	</html>"));
   end Population;

   package Icons "Icons for physiological models"
     //extends Modelica.Icons.IconsPackage;
     extends Modelica.Icons.Package;

     class Golem

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-98},{100,100}},
              fileName="modelica://Physiolibrary/Resources/Icons/golem.png")}));
     end Golem;

     class CardioVascular

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
              fileName="modelica://Physiolibrary/Resources/Icons/csv.png")}));
     end CardioVascular;

     class Water

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
              fileName="modelica://Physiolibrary/Resources/Icons/indexVoda.png")}));
     end Water;

     class Electrolytes

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
              fileName=
                "modelica://Physiolibrary/Resources/Icons/electrolytes.png")}));
     end Electrolytes;

     class Proteins

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-98,-100},{100,100}},
              fileName="modelica://Physiolibrary/Resources/Icons/protein.png")}));
     end Proteins;

     class Gases

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
              fileName="modelica://Physiolibrary/Resources/Icons/gases.png")}));
     end Gases;

     class NutrientsMetabolism

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
              fileName="modelica://Physiolibrary/Resources/Icons/vyziva.png")}));
     end NutrientsMetabolism;

     class Heat

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
              fileName="modelica://Physiolibrary/Resources/Icons/ohen.png")}));
     end Heat;

     class Hormones

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
              fileName="modelica://Physiolibrary/Resources/Icons/hormony.png")}));
     end Hormones;

     class Nerves

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
              fileName=
                "modelica://Physiolibrary/Resources/Icons/nervyNeuron.png")}));
     end Nerves;

     class Setup

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
              fileName="modelica://Physiolibrary/Resources/Icons/setup.png")}));
     end Setup;

     class Status

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-98,-100},{100,
     100}}, fileName="modelica://Physiolibrary/Resources/Icons/tissueFitness.png")}));
     end Status;

     class SkeletalMuscle

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-70,-80},{40,92}}, fileName=
               "modelica://Physiolibrary/Resources/Icons/sval.png")}));
     end SkeletalMuscle;

     class Bone

       annotation (Icon(coordinateSystem(preserveAspectRatio=true,  extent={{-100,-100},{
              100,100}}), graphics={Rectangle(
        extent={{-100,-100},{100,100}},
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid,
        pattern=LinePattern.None), Bitmap(extent={{-88,-84},{52,96}}, fileName=
                "modelica://Physiolibrary/Resources/Icons/bone.png")}));
     end Bone;

     class OtherTissue

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-74,-94},{48,60}}, fileName=
               "modelica://Physiolibrary/Resources/Icons/pojivovaTkan.png")}));
     end OtherTissue;

     class RespiratoryMuscle

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-66,-86},{44,86}}, fileName=
               "modelica://Physiolibrary/Resources/Icons/respiracniSvaly.png")}));
     end RespiratoryMuscle;

     class Fat

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-84,-68},{38,86}}, fileName=
               "modelica://Physiolibrary/Resources/Icons/tukovaBunka.png")}));
     end Fat;

     class Skin

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-74,-84},{48,56}}, fileName=
               "modelica://Physiolibrary/Resources/Icons/skin.png")}));
     end Skin;

     class Brain

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-78,-92},{44,62}}, fileName=
               "modelica://Physiolibrary/Resources/Icons/brain.png")}));
     end Brain;

     class GITract

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-80,-80},{42,74}}, fileName=
               "modelica://Physiolibrary/Resources/Icons/traviciTrakt.png")}));
     end GITract;

     class LeftHeart

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
          graphics={Bitmap(extent={{-96,-100},{24,100}}, fileName=
                "modelica://Physiolibrary/Resources/Icons/srdceLeva.png")}));
     end LeftHeart;

     class RightHeart

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
          graphics={Bitmap(extent={{-26,-100},{92,66}}, fileName=
                "modelica://Physiolibrary/Resources/Icons/srdceprava.png")}));
     end RightHeart;

     class Liver

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-84,-100},{86,34}},
              fileName="modelica://Physiolibrary/Resources/Icons/jatra.png")}));
     end Liver;

     class Kidney

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-92,-88},{40,86}}, fileName=
               "modelica://Physiolibrary/Resources/Icons/kidney.png")}));
     end Kidney;

     class Bladder

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Rectangle(
        extent={{-100,-100},{100,100}},
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid,
        pattern=LinePattern.None), Bitmap(extent={{-92,-88},{40,86}}, fileName=
                "modelica://Physiolibrary/Resources/Icons/mocovyMechyr.png")}));
     end Bladder;

     class GILumen

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
              fileName=
                "modelica://Physiolibrary/Resources/Icons/traviciTrakt2.png")}));
     end GILumen;

     class ThyroidGland

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-92,-88},{40,86}}, fileName=
               "modelica://Physiolibrary/Resources/Icons/stitnaZlaza.png")}));
     end ThyroidGland;

     class Pancreas

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
              fileName="modelica://Physiolibrary/Resources/Icons/pankreas.png")}));
     end Pancreas;

     class AdrenalGland

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
              fileName=
                "modelica://Physiolibrary/Resources/Icons/nadledviny.png")}));
     end AdrenalGland;

     class Lungs

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-70,-80},{40,92}}, fileName=
               "modelica://Physiolibrary/Resources/Icons/plice.png")}));
     end Lungs;

     class Tissues

       annotation (Icon(coordinateSystem(preserveAspectRatio=true,  extent={{-100,-100},{
              100,100}}), graphics={
      Bitmap(extent={{-46,26},{32,98}}, fileName="modelica://Physiolibrary/Resources/Icons/bone.png"),
      Bitmap(extent={{-62,-92},{50,-10}}, fileName="modelica://Physiolibrary/Resources/Icons/skin.png"),
      Bitmap(extent={{-38,-20},{64,90}}, fileName="modelica://Physiolibrary/Resources/Icons/sval.png"),
      Bitmap(extent={{-10,-56},{102,36}}, fileName=
     "modelica://Physiolibrary/Resources/Icons/traviciTrakt.png"),
      Text(
        extent={{64,-66},{94,-96}},
        lineColor={0,0,0},
        textString="..."),
      Bitmap(extent={{-98,-30},{-24,36}}, fileName="modelica://Physiolibrary/Resources/Icons/brain.png")}));

     end Tissues;

     class Peritoneum

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-70,-80},{40,92}}, fileName=
               "modelica://Physiolibrary/Resources/Icons/peritoneum.png")}));
     end Peritoneum;

     class Plasma

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-70,-80},{40,92}}, fileName=
               "modelica://Physiolibrary/Resources/Icons/plazma.png")}));
     end Plasma;

     class Hypophysis

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
              fileName="modelica://Physiolibrary/Resources/Icons/hypofyza.png")}));
     end Hypophysis;

     class Heart

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
              fileName="modelica://Physiolibrary/Resources/Icons/heart.png")}));
     end Heart;

     class SweatGland

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
              fileName=
                "modelica://Physiolibrary/Resources/Icons/potniZlaza.png")}));
     end SweatGland;

     class Cell

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
          graphics={Bitmap(extent={{-100,-100},{100,100}}, fileName=
                "modelica://Physiolibrary/Resources/Icons/OsmothicCell.png")}));
     end Cell;

     package HeatLib
       extends BaseLib;
       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-82},{76,44}},
              fileName="modelica://Physiolibrary/Resources/Icons/ohen.png")}));

     end HeatLib;

     package StatusLib
       extends BaseLib;
       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-96,40},{72,-96}}, fileName=
               "modelica://Physiolibrary/Resources/Icons/tissueFitness.png")}));

     end StatusLib;

      package NervesLib
       extends BaseLib;
       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-96,-96},{72,42}}, fileName=
               "modelica://Physiolibrary/Resources/Icons/nervyNeuron.png")}));

      end NervesLib;

     package NutrientsMetabolismLib
       extends BaseLib;
       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-98,-100},{80,40}},
              fileName="modelica://Physiolibrary/Resources/Icons/vyziva.png")}));

     end NutrientsMetabolismLib;

     package OxygenLib
       extends BaseLib;
       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-96,-98},{78,42}}, fileName=
               "modelica://Physiolibrary/Resources/Icons/O2.png")}));
     end OxygenLib;

     package ProteinsLib
       extends BaseLib;
       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-98,-98},{76,42}}, fileName=
               "modelica://Physiolibrary/Resources/Icons/protein.png")}));

     end ProteinsLib;

     package SetupLib
       extends BaseLib;
       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-94,-98},{72,44}}, fileName=
               "modelica://Physiolibrary/Resources/Icons/setup.png")}));

     end SetupLib;

     package CardioVascularLib
       extends BaseLib;
       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-96,-100},{76,42}},
              fileName="modelica://Physiolibrary/Resources/Icons/csv.png")}));

     end CardioVascularLib;

     package WaterLib
      extends BaseLib;
       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-90,-84},{72,42}}, fileName=
               "modelica://Physiolibrary/Resources/Icons/indexVoda.png")}));

     end WaterLib;

      package KidneyLib
       extends BaseLib;
       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-96,-96},{72,42}}, fileName=
               "modelica://Physiolibrary/Resources/Icons/Kidney.png")}));

      end KidneyLib;

     package ElectrolytesLib
       extends BaseLib;
       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-78,-94},{64,38}}, fileName=
               "modelica://Physiolibrary/Resources/Icons/electrolytes.png")}));

     end ElectrolytesLib;

     package GasesLib
       extends BaseLib;
       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-88,-82},{66,34}}, fileName=
               "modelica://Physiolibrary/Resources/Icons/gases.png")}));

     end GasesLib;

     package GolemLib
       extends BaseLib;
       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-96,-98},{78,42}}, fileName=
               "modelica://Physiolibrary/Resources/Icons/golem.png")}));
     end GolemLib;

     package BaseLib
       extends Modelica.Icons.Package;
     end BaseLib;

     package HormonesLib
       extends BaseLib;
       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-88,-88},{74,30}}, fileName=
               "modelica://Physiolibrary/Resources/Icons/hormony.png")}));

     end HormonesLib;

      package AutonomicControlLib
       extends BaseLib;
       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-96,-96},{72,42}}, fileName=
               "modelica://Physiolibrary/Resources/Icons/sympatetickeNervy.png")}));

      end AutonomicControlLib;

     partial class Resistor

      annotation (Icon(coordinateSystem(
      preserveAspectRatio=true,
      extent={{-100,-100},{100,100}},
      grid={2,2}), graphics={
      Rectangle(
        extent={{-70,-30},{70,30}},
        lineColor={0,0,0},
        fillColor={241,241,241},
        fillPattern=FillPattern.Solid),
      Line(points={{-90,0},{-70,0}}),
      Line(points={{70,0},{90,0}})}));
     end Resistor;

     class Lymph

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
              fileName="modelica://Physiolibrary/Resources/Icons/Lymph.png")}));
     end Lymph;

     class RespiratoryCenter

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
              fileName=
                "modelica://Physiolibrary/Resources/Icons/respiracniCentrum.png")}));
     end RespiratoryCenter;

     class Oxygen

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={
         Bitmap(extent={{-100,-100},{100,100}}, fileName=
     "modelica://Physiolibrary/Resources/Icons/O2.png")}));
     end Oxygen;

     class CarbonDioxide

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={
         Bitmap(extent={{-100,-100},{100,100}}, fileName=
     "modelica://Physiolibrary/Resources/Icons/prvkyCO2.png")}));
     end CarbonDioxide;

     class AcidBase

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={
         Bitmap(extent={{-100,-100},{100,100}}, fileName=
     "modelica://Physiolibrary/Resources/Icons/acidobaze.png")}));
     end AcidBase;

     class Ventilation

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
              fileName="modelica://Physiolibrary/Resources/Icons/dychani.png")}));
     end Ventilation;

     class PeripheralChemoreceptors

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
              fileName=
                "modelica://Physiolibrary/Resources/Icons/baroreflex.png")}));
     end PeripheralChemoreceptors;

     class HeatCore

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
              {100,100}}), graphics={Bitmap(extent={{-100,100},{
     100,-100}}, fileName=
     "modelica://Physiolibrary/Resources/Icons/torzo2.png")}));
     end HeatCore;

     class Glycogen

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={
      Rectangle(
        extent={{-100,-100},{100,100}},
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid,
        pattern=LinePattern.None),     Bitmap(extent={{-100,-100},{100,100}},
      fileName=
     "modelica://Physiolibrary/Resources/Icons/glykogen.png")}));
     end Glycogen;

     class Lipids

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
      100}}, fileName=
     "modelica://Physiolibrary/Resources/Icons/FattyAcid.png")}));
     end Lipids;

     class KetoAcids

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
      100}}, fileName=
     "modelica://Physiolibrary/Resources/Icons/KetoAcid.png")}));
     end KetoAcids;

     class Glucose

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
      100}}, fileName="modelica://Physiolibrary/Resources/Icons/glucose.png")}));
     end Glucose;

     class Lactate

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
      100}}, fileName="modelica://Physiolibrary/Resources/Icons/Lactate.png")}));
     end Lactate;

     class AminoAcids

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
      100}}, fileName=
     "modelica://Physiolibrary/Resources/Icons/AminoAcid.png")}));
     end AminoAcids;

     class Urea

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
      100}}, fileName="modelica://Physiolibrary/Resources/Icons/Urea.png")}));
     end Urea;

     class MetabolismPart

       annotation ( Icon(coordinateSystem(
        preserveAspectRatio=true, extent={{-100,-100},{100,120}}),
      graphics={             Bitmap(extent={{28,120},{98,44}}, fileName=
                "modelica://Physiolibrary/Resources/Icons/ohen.png")}));
     end MetabolismPart;

     class CellularMetabolism

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
      100}}, fileName=
     "modelica://Physiolibrary/Resources/Icons/cellularMetabolism.png")}));
     end CellularMetabolism;

     class FemaleSex

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
      100}}, fileName=
     "modelica://Physiolibrary/Resources/Icons/hormonesFemaleSex.png")}));
     end FemaleSex;

     class Barroreceptor

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
      100}}, fileName=
     "modelica://Physiolibrary/Resources/Icons/baroreflex.png")}));
     end Barroreceptor;

     class NervusVagus

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
      100}}, fileName="modelica://Physiolibrary/Resources/Icons/vagus.png")}));
     end NervusVagus;

     class SympatheticNerves

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
      100}}, fileName=
     "modelica://Physiolibrary/Resources/Icons/sympatetickeNervy.png")}));
     end SympatheticNerves;

     class PhysicalExercise

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
      100}}, fileName="modelica://Physiolibrary/Resources/Icons/cviceni.png")}));
     end PhysicalExercise;

     class SinoatrialNode

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
     100}}, fileName="modelica://Physiolibrary/Resources/Icons/SANode.png")}));
     end SinoatrialNode;

     block StatusNormal

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
     100}}, fileName=
     "modelica://Physiolibrary/Resources/Icons/siluetaNormal.png")}));
     end StatusNormal;

     block StatusConfused

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
     100}}, fileName=
     "modelica://Physiolibrary/Resources/Icons/siluetaZmateni.png")}));
     end StatusConfused;

     block StatusImpaired

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
     100}}, fileName=
     "modelica://Physiolibrary/Resources/Icons/siluetaVaznejsiStav.png")}));
     end StatusImpaired;

     block StatusNotBreathing

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
     100}}, fileName=
     "modelica://Physiolibrary/Resources/Icons/siluetaNedychaSam.png")}));
     end StatusNotBreathing;

     block StatusComatose

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
     100}}, fileName=
     "modelica://Physiolibrary/Resources/Icons/siluetaKoma.png")}));
     end StatusComatose;

     block StatusMayBeDead

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
     100}}, fileName=
     "modelica://Physiolibrary/Resources/Icons/siluetaSkoroMrtvy.png")}));
     end StatusMayBeDead;

     block StatusIsReallyDead

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
     100}}, fileName=
     "modelica://Physiolibrary/Resources/Icons/siluetaMrtvy.png")}));
     end StatusIsReallyDead;

     class SkeletalMuscleAcidity

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
     100}}, fileName=
     "modelica://Physiolibrary/Resources/Icons/kyselostVeSvalech.png")}));
     end SkeletalMuscleAcidity;

     class Sodium

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
     100}}, fileName="modelica://Physiolibrary/Resources/Icons/Na.png")}));
     end Sodium;

     class Potassium

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
     100}}, fileName="modelica://Physiolibrary/Resources/Icons/K.png")}));
     end Potassium;

     class Phosphate

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
     100}}, fileName="modelica://Physiolibrary/Resources/Icons/fosfat.png")}));
     end Phosphate;

     class Sulphate

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
     100}}, fileName=
     "modelica://Physiolibrary/Resources/Icons/sulfat02.png")}));
     end Sulphate;

     class Amonium

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
     100}}, fileName="modelica://Physiolibrary/Resources/Icons/NH4.png")}));
     end Amonium;

     class Chloride

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
     100}}, fileName="modelica://Physiolibrary/Resources/Icons/Cl.png")}));
     end Chloride;

     class LungShunt

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
     100}}, fileName=
     "modelica://Physiolibrary/Resources/Icons/lungBloodFlow.png")}));
     end LungShunt;

     class Hydrostatics

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
     100}}, fileName=
     "modelica://Physiolibrary/Resources/Icons/pressureMeassure.png")}));
     end Hydrostatics;

     class UpperTorso

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
     100}}, fileName="modelica://Physiolibrary/Resources/Icons/torzo1.png")}));
     end UpperTorso;

     class MiddleTorso

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
     100}}, fileName="modelica://Physiolibrary/Resources/Icons/torzo2.png")}));
     end MiddleTorso;

     class LowerTorso

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
     100}}, fileName="modelica://Physiolibrary/Resources/Icons/torzo3.png")}));
     end LowerTorso;

     class RedCells

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
     100}}, fileName=
     "modelica://Physiolibrary/Resources/Icons/cervenaKrvinka.png")}));
     end RedCells;

     class SystemicCirculation

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
     100}}, fileName=
     "modelica://Physiolibrary/Resources/Icons/krevniRecisteSiluetacloveka.png")}));
     end SystemicCirculation;

     class PulmonaryCirculation

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
     100}}, fileName=
     "modelica://Physiolibrary/Resources/Icons/krevniRecistePlice.png")}));
     end PulmonaryCirculation;

     class Blood

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
     100}}, fileName=
     "modelica://Physiolibrary/Resources/Icons/bloodProperties.png")}));
     end Blood;

     class BaseFactorIcon0

       annotation (Icon(graphics={  Rectangle(
        extent={{-100,-40},{100,60}},
        lineColor={0,127,0},
        fillColor={255,255,255},
        fillPattern=FillPattern.Sphere), Text(
        extent={{-76,-22},{64,44}},
        lineColor={0,0,0},
        textString="%name")}));
     end BaseFactorIcon0;

     partial class BaseFactorIcon

       Modelica.Blocks.Interfaces.RealInput yBase
          annotation (Placement(transformation(extent={{-20,-20},{20,20}},
      rotation=270,
      origin={0,20})));
       Modelica.Blocks.Interfaces.RealOutput y
       annotation (Placement(transformation(extent={{-20,-20},{20,20}},
      rotation=270,
      origin={0,-40})));

      annotation (Icon(coordinateSystem(
      preserveAspectRatio=true,
      extent={{-100,-100},{100,100}},
      grid={2,2}), graphics={Rectangle(
        extent={{-100,-20},{100,20}},
        lineColor={95,95,95},
        fillColor={255,255,255},
        fillPattern=FillPattern.Sphere), Text(
        extent={{-90,-10},{92,10}},
        textString="%name",
        lineColor={0,0,0})}));
     end BaseFactorIcon;

     partial class BaseFactorIcon2

       Modelica.Blocks.Interfaces.RealInput yBase
          annotation (Placement(transformation(extent={{-20,-20},{20,20}},
      rotation=270,
      origin={0,60})));
       Modelica.Blocks.Interfaces.RealOutput y
       annotation (Placement(transformation(extent={{-20,-20},{20,20}},
      rotation=270,
      origin={0,-60})));

      annotation (Icon(coordinateSystem(
      preserveAspectRatio=true,
      extent={{-100,-100},{100,100}},
      grid={2,2}), graphics={Rectangle(
        extent={{-100,-50},{100,50}},
        lineColor={0,127,0},
        fillColor={255,255,255},
        fillPattern=FillPattern.Sphere), Text(
        extent={{-86,-36},{100,40}},
        textString="%name",
        lineColor={0,0,0},
        fillPattern=FillPattern.Sphere)}));
     end BaseFactorIcon2;

     partial class BaseFactorIcon3

       Modelica.Blocks.Interfaces.RealInput yBase
          annotation (Placement(transformation(extent={{-20,-20},{20,20}},
      rotation=270,
      origin={0,20})));
       Modelica.Blocks.Interfaces.RealOutput y
       annotation (Placement(transformation(extent={{-20,-20},{20,20}},
      rotation=270,
      origin={0,-40})));

      annotation (Icon(coordinateSystem(
      preserveAspectRatio=true,
      extent={{-100,-100},{100,100}},
      grid={2,2}), graphics={Rectangle(
        extent={{-100,-20},{100,20}},
        lineColor={0,127,0},
        fillColor={255,255,255},
        fillPattern=FillPattern.Sphere), Text(
        extent={{-90,-10},{92,10}},
        textString="%name",
        lineColor={0,0,0})}));
     end BaseFactorIcon3;

     partial class BaseFactorIcon4

       Modelica.Blocks.Interfaces.RealInput yBase
          annotation (Placement(transformation(extent={{-20,-20},{20,20}},
      rotation=270,
      origin={0,20})));
       Modelica.Blocks.Interfaces.RealOutput y
       annotation (Placement(transformation(extent={{-20,-20},{20,20}},
      rotation=270,
      origin={0,-40})));

      annotation (Icon(coordinateSystem(
      preserveAspectRatio=true,
      extent={{-100,-100},{100,100}},
      grid={2,2}), graphics={Rectangle(
        extent={{-100,-20},{100,20}},
        lineColor={127,0,0},
        fillColor={255,255,255},
        fillPattern=FillPattern.Sphere), Text(
        extent={{-90,-10},{92,10}},
        textString="%name",
        lineColor={0,0,0})}));
     end BaseFactorIcon4;

     partial class BaseFactorIcon5

       Modelica.Blocks.Interfaces.RealInput yBase
          annotation (Placement(transformation(extent={{-20,-20},{20,20}},
      rotation=270,
      origin={0,20})));
       Modelica.Blocks.Interfaces.RealOutput y
       annotation (Placement(transformation(extent={{-20,-20},{20,20}},
      rotation=270,
      origin={0,-40})));

      annotation (Icon(coordinateSystem(
      preserveAspectRatio=true,
      extent={{-100,-100},{100,100}},
      grid={2,2}), graphics={Rectangle(
        extent={{-100,-20},{100,20}},
        lineColor={0,0,255},
        fillColor={255,255,255},
        fillPattern=FillPattern.Sphere), Text(
        extent={{-90,-10},{92,10}},
        textString="%name",
        lineColor={0,0,0})}));
     end BaseFactorIcon5;

     partial class BaseFactorIcon6

       Modelica.Blocks.Interfaces.RealInput yBase
          annotation (Placement(transformation(extent={{-20,-20},{20,20}},
      rotation=270,
      origin={0,20})));
       Modelica.Blocks.Interfaces.RealOutput y
       annotation (Placement(transformation(extent={{-20,-20},{20,20}},
      rotation=270,
      origin={0,-40})));

      annotation (Icon(coordinateSystem(
      preserveAspectRatio=true,
      extent={{-100,-100},{100,100}},
      grid={2,2}), graphics={Rectangle(
      extent={{-100,-20},{100,20}},
      lineColor={0,87,87},
      fillColor={255,255,255},
      fillPattern=FillPattern.Sphere)}));
     end BaseFactorIcon6;

     partial class ConversionIcon "Base icon for conversion functions"

       annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
              100,100}}), graphics={
      Rectangle(
        extent={{-100,-100},{100,100}},
        lineColor={191,0,0},
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid),
      Line(points={{-74,0},{30,0}}, color={191,0,0}),
      Polygon(
        points={{80,0},{20,20},{20,-20},{80,0}},
        lineColor={191,0,0},
        fillColor={191,0,0},
        fillPattern=FillPattern.Solid)}));

     end ConversionIcon;

     partial class Diffusion

       annotation (Icon(graphics={Bitmap(extent={{-100,-100},{100,100}}, fileName=
     "modelica://Physiolibrary/Resources/Icons/diffusion.png")}));

     end Diffusion;

     class Substance

    annotation (Icon(coordinateSystem(
        preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
      graphics={Bitmap(extent={{-100,-100},{100,100}}, fileName=
     "modelica://Physiolibrary/Resources/Icons/Concentration.png")}));
     end Substance;

     class Speciation

       annotation ( Icon(coordinateSystem(
        preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
      graphics={Bitmap(extent={{-100,-100},{100,100}}, fileName=
     "modelica://Physiolibrary/Resources/Icons/Speciation.png"), Text(
        extent={{-182,-84},{60,-118}},
        lineColor={0,0,255},
        textString="%name")}));
     end Speciation;

     class MolarFlowMeasure

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
              fileName=
                "modelica://Physiolibrary/Resources/Icons/molarFlowMeassure.png")}));
     end MolarFlowMeasure;

     class GasSolubility

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
              fileName=
     "modelica://Physiolibrary/Resources/Icons/GasSolubility.png")}));
     end GasSolubility;

     class Reabsorption

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
              fileName=
     "modelica://Physiolibrary/Resources/Icons/reabsorption.svg")}));
     end Reabsorption;

     class Reabsorption2

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
              fileName=
     "modelica://Physiolibrary/Resources/Icons/reabsorption.png")}));
     end Reabsorption2;

     class Dilution

       annotation (Icon(graphics={     Bitmap(extent={{-100,-101},{100,101}},
            fileName="modelica://Physiolibrary/Resources/Icons/dilution.png",
        origin={0,33},
        rotation=270)}));
     end Dilution;

     partial class ElasticBalloon

     annotation (Icon(graphics={     Bitmap(extent={{-100,-100},{100,100}}, fileName=
                  "modelica://Physiolibrary/Resources/Icons/elastic_vessel.svg")}));
     end ElasticBalloon;

     class BloodElasticCompartment

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
     100}}, fileName=
     "modelica://Physiolibrary/Resources/Icons/elastickyKompartment.png")}));
     end BloodElasticCompartment;

     class BloodSequesteredCompartment

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
     100}}, fileName=
     "modelica://Physiolibrary/Resources/Icons/sequerestedVolume.png")}));
     end BloodSequesteredCompartment;

     partial class HydraulicResistor

     annotation (Icon(graphics={    Bitmap(extent={{-120,-42},{120,44}},
              fileName="modelica://Physiolibrary/Resources/Icons/resistor.svg")}));
     end HydraulicResistor;

     class FlowMeasure

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={
           Bitmap(extent={{-100,-100},{100,100}}, fileName=
                "modelica://Physiolibrary/Resources/Icons/flowMeassure.png")}));
     end FlowMeasure;

     class Membrane

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
              fileName="modelica://Physiolibrary/Resources/Icons/membrane.png")}));
     end Membrane;

     class PressureMeasure

       annotation ( Icon(graphics={Bitmap(extent={
     {-100,-100},{100,100}}, fileName=
     "modelica://Physiolibrary/Resources/Icons/pressureMeassure.png")}));
     end PressureMeasure;

     class InternalElasticBalloon

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
              fileName=
     "modelica://Physiolibrary/Resources/Icons/elastic_membrane.svg")}));
     end InternalElasticBalloon;

     class Inertance

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
              fileName=
     "modelica://Physiolibrary/Resources/Icons/inertia.svg")}));
     end Inertance;

     class HydrostaticGradient

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
          graphics={Bitmap(extent={{-100,-100},{102,100}}, fileName=
                "modelica://Physiolibrary/Resources/Icons/hydrostatic_column.svg")}));

     end HydrostaticGradient;

     class Radiator

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
              fileName="modelica://Physiolibrary/Resources/Icons/Radiator.png")}));
     end Radiator;

     class MichaelisMenten

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-80,-84},{86,26}}, fileName=
     "modelica://Physiolibrary/Resources/Icons/MichaelisMenten.png")}));
     end MichaelisMenten;

     class HeatAccumulation

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
              fileName=
     "modelica://Physiolibrary/Resources/Icons/HeatAccumulation.png")}));
     end HeatAccumulation;

     class OsmoticCell

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
              fileName=
     "modelica://Physiolibrary/Resources/Icons/OsmothicCell.png")}));
     end OsmoticCell;

     class IdealGas

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
              fileName="modelica://Physiolibrary/Resources/Icons/IdealGas.png")}));
     end IdealGas;

     class PartialPressure

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
              fileName=
     "modelica://Physiolibrary/Resources/Icons/PartialPressure.png")}));
     end PartialPressure;

     class ConservationLaw

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={
      Rectangle(
        extent={{-100,-100},{100,100}},
        fillColor={170,255,213},
        fillPattern=FillPattern.Solid,
        pattern=LinePattern.None),
      Polygon(
        points={{-40,-60},{-40,-20},{-80,-40},{-40,-60}},
        pattern=LinePattern.None,
        fillColor={0,0,0},
        fillPattern=FillPattern.Solid,
        lineColor={0,0,0}),
      Line(
        points={{-80,10},{-80,-80},{-80,-80}})}));
     end ConservationLaw;

     class Nephron

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
          graphics={Bitmap(extent={{-100,-100},{100,100}}, fileName=
                "modelica://Physiolibrary/Resources/Icons/Nefron.png")}));
     end Nephron;

     class Torso

       annotation (Icon(graphics={            Bitmap(extent={{-28,58},{28,98}},
      fileName="modelica://Physiolibrary/Resources/Icons/torzo1.png"),
           Bitmap(extent={{-40,-24},{40,56}},
      fileName="modelica://Physiolibrary/Resources/Icons/torzo2.png"),
           Bitmap(extent={{-40,-98},{40,-18}},
      fileName="modelica://Physiolibrary/Resources/Icons/torzo3.png")}));
     end Torso;

     class PerfusionOD

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={
         Bitmap(extent={{-160,-100},{152,100}}, fileName=
     "modelica://Physiolibrary/Resources/Icons/perfusion.png")}));
     end PerfusionOD;

     class PerfusionDO

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={
         Bitmap(extent={{-160,-100},{160,100}}, fileName=
     "modelica://Physiolibrary/Resources/Icons/perfusion2.png")}));
     end PerfusionDO;

     class CollapsingVessel

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={
         Bitmap(extent={{-100,-100},{100,100}}, fileName=
     "modelica://Physiolibrary/Resources/Icons/kolaps.png")}));
     end CollapsingVessel;

     class PeripheralCirculation

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={
         Bitmap(extent={{-100,-100},{100,100}}, fileName=
     "modelica://Physiolibrary/Resources/Icons/krevniReciste.png")}));
     end PeripheralCirculation;

     class HeartVentricle

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={
         Bitmap(extent={{-100,-100},{100,100}}, fileName=
     "modelica://Physiolibrary/Resources/Icons/komoraSrdce.png")}));
     end HeartVentricle;

     class Population

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
              fileName="modelica://Physiolibrary/Resources/Icons/Populace.png")}));
     end Population;

     class FlowFiltration

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-74},{100,100}},
              fileName=
     "modelica://Physiolibrary/Resources/Icons/flowFiltration.png")}));
     end FlowFiltration;

     class Microcirculation

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Bitmap(extent={{-100,-98},{100,100}},
              fileName=
                "modelica://Physiolibrary/Resources/Icons/microcirculation.png")}));
     end Microcirculation;

     class IdealValve

     annotation (Icon(graphics={     Bitmap(extent={{-100,-100},{100,100}},
              fileName=
                "modelica://Physiolibrary/Resources/Icons/ideal_valve.svg")}));
     end IdealValve;

     class Pump

     annotation (Icon(graphics={     Bitmap(extent={{-100,-100},{100,100}},
              fileName="modelica://Physiolibrary/Resources/Icons/pump.svg")}));
     end Pump;

     model Arteries

       annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
               Bitmap(
                   extent={{-87.243,-87.3037},{87.243,87.3037}},
                   fileName=
                "modelica://Physiolibrary/Resources/Icons/Arteries.png",
               origin={4.25124,18.8661},
                   rotation=75)}), Diagram(coordinateSystem(preserveAspectRatio=
                 false)));

     end Arteries;

     class Atrium

       annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
               Bitmap(extent={{-100,-100},{100,100}}, fileName=
                "modelica://Physiolibrary/Resources/Icons/Atrium.png")}),
           Diagram(coordinateSystem(preserveAspectRatio=false)));
     end Atrium;

     class Cardio

       annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
               Bitmap(extent={{-100,-100},{100,100}}, fileName=
                "modelica://Physiolibrary/Resources/Icons/Cardio.png"),Bitmap(
               extent={{-50,-38},{52,62}}, fileName=
                "modelica://Physiolibrary/Resources/Icons/Cross.png")}), Diagram(
             coordinateSystem(preserveAspectRatio=false)));
     end Cardio;

     class ECMO

       annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
               Bitmap(extent={{-100,-100},{100,100}}, fileName=
                "modelica://Physiolibrary/Resources/Icons/ECMO.png")}),
           Diagram(coordinateSystem(preserveAspectRatio=false)));
     end ECMO;

     class Heart_detailed

       annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
               Bitmap(extent={{-100,-100},{100,100}}, fileName=
                "modelica://Physiolibrary/Resources/Icons/Heart_detailed.png")}),
           Diagram(coordinateSystem(preserveAspectRatio=false)));
     end Heart_detailed;

     class O2

       annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
               Bitmap(extent={{-100,-100},{100,100}}, fileName=
                "modelica://Physiolibrary/Resources/Icons/O2.png")}), Diagram(
             coordinateSystem(preserveAspectRatio=false)));
     end O2;

     class Screw

       annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
               Bitmap(
               extent={{-100,-100},{100,100}},
                   fileName="modelica://Physiolibrary/Resources/Icons/Screw.png",
               origin={2,-4},
               rotation=90)}), Diagram(coordinateSystem(preserveAspectRatio=
                 false)));
     end Screw;

     class Settings

       annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
               Bitmap(extent={{-100,-100},{100,100}}, fileName=
                "modelica://Physiolibrary/Resources/Icons/Settings.png")}),
           Diagram(coordinateSystem(preserveAspectRatio=false)));
     end Settings;

       class Valve

       annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
               Bitmap(extent={{-100,-100},{100,100}}, fileName=
                "modelica://Physiolibrary/Resources/Icons/Valve.png")}), Diagram(
             coordinateSystem(preserveAspectRatio=false)));
       end Valve;

       class Ventricle

       annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
               Bitmap(extent={{-100,-100},{100,100}}, fileName=
                "modelica://Physiolibrary/Resources/Icons/Ventricle.png")}),
           Diagram(coordinateSystem(preserveAspectRatio=false)));
       end Ventricle;

       class Vessels

       annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
               Bitmap(
               extent={{-130.465,-88.1195},{130.465,88.1195}},
               origin={0.99971,8.9994},
               rotation=-68,
                   fileName=
                "modelica://Physiolibrary/Resources/Icons/Vessels.png")}),
           Diagram(coordinateSystem(preserveAspectRatio=false)));

       end Vessels;
     annotation (Documentation(revisions=""));
   end Icons;

   package Types "Physiological units with nominals"
     //extends Modelica.Icons.TypesPackage;
     extends Modelica.Icons.Package;
   //If you have an idea to add the next physiological type to the next version, please write me at marek@matfyz.cz. Thank you

     package UsersGuide "User's Guide"
       extends Modelica.Icons.Information;

     class NewType "Adding new type"
       extends Modelica.Icons.Information;

      annotation (Documentation(info="<html>
	<p>Definition of new type (&quot;QuantityX&quot;) in Physiolibrary:</p>
	<ul>
	<li>Define base type Types.QuantityX with SI units in &quot;final unit&quot;, default display units and nominal (e.g. value of one display unit at SI units). </li>
	</ul>
	<p>Optional: </p>
	<ul>
	<li>Define typed input and output connectors for QuantityX: Types.RealIO.QuantityXInput and Types.RealIO.QuantityXOutput. </li>
	<li>Define typed constant for QuantityX: Types.Constants.QuantityXConst </li>
	<li>Define typed RealInputParameter for QuantityX: Types.RealInputParameters.QuantityX </li>
	<li>Define typed replaceable variable RealTypes for QuantityX: Types.RealTypes.QuantityX </li>
	</ul>
	</html>"));
     end NewType;
     annotation (DocumentationClass=true, Documentation(info="<html>
	<p>Package <b>Physiolibrary</b> is a modelica package for <b>Human Physiology</b> that is developed from <b>HumMod</b> modelica implementation, see <a href=\"http://patf-biokyb.lf1.cuni.cz/wiki/hummod/hummod\">http://hummod.org</a>. It provides constants, types, connectors, partial models and model components fitted for physiological models of human body. </p>
	<p>This is a short <b>User&apos;s Guide</b> for the overall library. Some of the main sublibraries have their own User&apos;s Guides that can be accessed by the following links: </p>
	<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
	<td valign=\"top\"><p>Types </p></td>
	<td valign=\"top\"><p>Physiological types. Physiological unit vs. SI units, nominals, inputs/outputs, typed constants.</p></td>
	</tr>
	<tr>
	<td valign=\"top\"><p>Blocks</p></td>
	<td valign=\"top\"><p>Useful blocks, that are missing in package Modelica.Blocks (MSL 3.2), cubic interpolation curves, multiplication factors.</p></td>
	</tr>
	<tr>
	<td valign=\"top\"><p>Chemical</p></td>
	<td valign=\"top\"><p>Library to chemical subsystems such as intravascular, interstitial or intracellular chemical substances in fluxes and interactions.</p></td>
	</tr>
	<tr>
	<td valign=\"top\"><p>Hydraulic</p></td>
	<td valign=\"top\"><p>Library to hydraulic subsystems such as in cardiovascular system.</p></td>
	</tr>
	<tr>
	<td valign=\"top\"><p>Thermal</p></td>
	<td valign=\"top\"><p>Library of termoregulation support.</p></td>
	</tr>
	<tr>
	<td valign=\"top\"><p>Osmotic</p></td>
	<td valign=\"top\"><p>Library to model water fluxes through semipermeable membrane caused by osmotic pressure.</p></td>
	</tr>
	<tr>
	<td valign=\"top\"><p>Mixed</p></td>
	<td valign=\"top\"><p>Library to join domains above together.</p></td>
	</tr>
	<tr>
	<td valign=\"top\"><p>Icons</p></td>
	<td valign=\"top\"><p>Icons</p></td>
	</tr>
	<tr>
	<td valign=\"top\"><p>FileUtilities</p></td>
	<td valign=\"top\"><p>Read/write values from/to file. </p></td>
	</tr>
	</table>
	</html>"));
     end UsersGuide;

     package Constants
       extends Modelica.Icons.SourcesPackage;

     block AccelerationConst "Constant signal of type Acceleration"
      parameter Types.Acceleration k "Constant Acceleration output value";
      RealIO.AccelerationOutput y "Acceleration constant" annotation (Placement(
            transformation(extent={{40,-10},{60,10}}),
       iconTransformation(extent={{40,-10},{60,10}})));
     equation
      y = k;
       annotation (defaultComponentName="acceleration",
        Diagram(coordinateSystem(extent={{-40,-40},{40,40}})),
        Icon(
      coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
            graphics={
      Rectangle(extent={{-40,40},{40,-40}},
        lineColor={0,0,0},
     radius=10,
        fillColor={236,236,236},
          fillPattern=FillPattern.Solid),
      Text( extent={{-100,-44},{100,-64}},
        lineColor={0,0,0},
         fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
     textString="%name"),
      Text(         extent={{-40,10},{40,-10}},
        lineColor={0,0,0},
     fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
         textString="Const")}));
     end AccelerationConst;

     block AmountOfSubstanceConst "Constant signal of type AmountOfSubstance"
      parameter Types.AmountOfSubstance k
        "Constant AmountOfSubstance output value";
      RealIO.AmountOfSubstanceOutput y "AmountOfSubstance constant" annotation (
         Placement(transformation(extent={{40,-10},{60,10}}),
       iconTransformation(extent={{40,-10},{60,10}})));
     equation
      y = k;
       annotation (defaultComponentName="amountOfSubstance",
        Diagram(coordinateSystem(extent={{-40,-40},{40,40}})),
        Icon(
      coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
            graphics={
      Rectangle(extent={{-40,40},{40,-40}},
        lineColor={0,0,0},
     radius=10,
        fillColor={236,236,236},
          fillPattern=FillPattern.Solid),
      Text( extent={{-100,-44},{100,-64}},
        lineColor={0,0,0},
         fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
     textString="%name"),
      Text(         extent={{-40,10},{40,-10}},
        lineColor={0,0,0},
     fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
         textString="Const")}));
     end AmountOfSubstanceConst;

     block ConcentrationConst "Constant signal of type Concentration"
      parameter Types.Concentration k "Constant Concentration output value";
      RealIO.ConcentrationOutput y "Concentration constant" annotation (
          Placement(transformation(extent={{40,-10},{60,10}}),
       iconTransformation(extent={{40,-10},{60,10}})));
     equation
      y = k;
       annotation (defaultComponentName="concentration",
        Diagram(coordinateSystem(extent={{-40,-40},{40,40}})),
        Icon(
      coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
            graphics={
      Rectangle(extent={{-40,40},{40,-40}},
        lineColor={0,0,0},
     radius=10,
        fillColor={236,236,236},
          fillPattern=FillPattern.Solid),
      Text( extent={{-100,-44},{100,-64}},
        lineColor={0,0,0},
         fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
     textString="%name"),
      Text(         extent={{-40,10},{40,-10}},
        lineColor={0,0,0},
     fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
         textString="Const")}));
     end ConcentrationConst;

     block DensityConst "Constant signal of type Density"
      parameter Types.Density k "Constant Density output value";
      RealIO.DensityOutput y "Density constant" annotation (Placement(
            transformation(extent={{40,-10},{60,10}}),
       iconTransformation(extent={{40,-10},{60,10}})));
     equation
      y = k;
       annotation (defaultComponentName="density",
        Diagram(coordinateSystem(extent={{-40,-40},{40,40}})),
        Icon(
      coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
            graphics={
      Rectangle(extent={{-40,40},{40,-40}},
        lineColor={0,0,0},
     radius=10,
        fillColor={236,236,236},
          fillPattern=FillPattern.Solid),
      Text( extent={{-100,-44},{100,-64}},
        lineColor={0,0,0},
         fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
     textString="%name"),
      Text(         extent={{-40,10},{40,-10}},
        lineColor={0,0,0},
     fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
         textString="Const")}));
     end DensityConst;

     block DiffusionPermeabilityConst
      "Constant signal of type DiffusionPermeability"
      parameter Types.DiffusionPermeability k
        "Constant DiffusionPermeability output value";
      RealIO.DiffusionPermeabilityOutput y "DiffusionPermeability constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
       iconTransformation(extent={{40,-10},{60,10}})));
     equation
      y = k;
       annotation (defaultComponentName="diffusionPermeability",
        Diagram(coordinateSystem(extent={{-40,-40},{40,40}})),
        Icon(
      coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
            graphics={
      Rectangle(extent={{-40,40},{40,-40}},
        lineColor={0,0,0},
     radius=10,
        fillColor={236,236,236},
          fillPattern=FillPattern.Solid),
      Text( extent={{-100,-44},{100,-64}},
        lineColor={0,0,0},
         fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
     textString="%name"),
      Text(         extent={{-40,10},{40,-10}},
        lineColor={0,0,0},
     fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
         textString="Const")}));
     end DiffusionPermeabilityConst;

     block ElectricChargeConst "Constant signal of type ElectricCharge"
      parameter Types.ElectricCharge k "Constant ElectricCharge output value";
      RealIO.ElectricChargeOutput y "ElectricCharge constant" annotation (
          Placement(transformation(extent={{40,-10},{60,10}}),
       iconTransformation(extent={{40,-10},{60,10}})));
     equation
      y = k;
       annotation (defaultComponentName="electricCharge",
        Diagram(coordinateSystem(extent={{-40,-40},{40,40}})),
        Icon(
      coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
            graphics={
      Rectangle(extent={{-40,40},{40,-40}},
        lineColor={0,0,0},
     radius=10,
        fillColor={236,236,236},
          fillPattern=FillPattern.Solid),
      Text( extent={{-100,-44},{100,-64}},
        lineColor={0,0,0},
         fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
     textString="%name"),
      Text(         extent={{-40,10},{40,-10}},
        lineColor={0,0,0},
     fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
         textString="Const")}));
     end ElectricChargeConst;

     block ElectricCurrentConst "Constant signal of type ElectricCurrent"
      parameter Types.ElectricCurrent k "Constant ElectricCurrent output value";
      RealIO.ElectricCurrentOutput y "ElectricCurrent constant" annotation (
          Placement(transformation(extent={{40,-10},{60,10}}),
       iconTransformation(extent={{40,-10},{60,10}})));
     equation
      y = k;
       annotation (defaultComponentName="electricCurrent",
        Diagram(coordinateSystem(extent={{-40,-40},{40,40}})),
        Icon(
      coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
            graphics={
      Rectangle(extent={{-40,40},{40,-40}},
        lineColor={0,0,0},
     radius=10,
        fillColor={236,236,236},
          fillPattern=FillPattern.Solid),
      Text( extent={{-100,-44},{100,-64}},
        lineColor={0,0,0},
         fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
     textString="%name"),
      Text(         extent={{-40,10},{40,-10}},
        lineColor={0,0,0},
     fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
         textString="Const")}));
     end ElectricCurrentConst;

     block ElectricPotentialConst "Constant signal of type ElectricPotential"
      parameter Types.ElectricPotential k
        "Constant ElectricPotential output value";
      RealIO.ElectricPotentialOutput y "ElectricPotential constant" annotation (
         Placement(transformation(extent={{40,-10},{60,10}}),
       iconTransformation(extent={{40,-10},{60,10}})));
     equation
      y = k;
       annotation (defaultComponentName="electricPotential",
        Diagram(coordinateSystem(extent={{-40,-40},{40,40}})),
        Icon(
      coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
            graphics={
      Rectangle(extent={{-40,40},{40,-40}},
        lineColor={0,0,0},
     radius=10,
        fillColor={236,236,236},
          fillPattern=FillPattern.Solid),
      Text( extent={{-100,-44},{100,-64}},
        lineColor={0,0,0},
         fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
     textString="%name"),
      Text(         extent={{-40,10},{40,-10}},
        lineColor={0,0,0},
     fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
         textString="Const")}));
     end ElectricPotentialConst;

       block EnergyConst "Constant signal of type Energy"
         parameter Types.Energy k "Constant Energy output value";
         RealIO.EnergyOutput y "Energy constant" annotation (Placement(
            transformation(extent={{40,-10},{60,10}}),
       iconTransformation(extent={{40,-10},{60,10}})));
       equation
         y = k;
       annotation (defaultComponentName="energy",
        Diagram(coordinateSystem(extent={{-40,-40},{40,40}})),
        Icon(coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=
                false), graphics={
            Rectangle(
              extent={{-40,40},{40,-40}},
        lineColor={0,0,0},
              radius=10,
        fillColor={236,236,236},
          fillPattern=FillPattern.Solid),
            Text(
              extent={{-100,-44},{100,-64}},
        lineColor={0,0,0},
         fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
              textString="%name"),
            Text(
              extent={{-40,10},{40,-10}},
        lineColor={0,0,0},
              fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
         textString="Const")}));
       end EnergyConst;

       block EnthalpyConst "Constant signal of type Enthalpy"
         parameter Types.Enthalpy k "Constant Enthalpy output value";
         RealIO.EnthalpyOutput y "Enthalpy constant" annotation (Placement(
            transformation(extent={{40,-10},{60,10}}),
       iconTransformation(extent={{40,-10},{60,10}})));
       equation
         y = k;
       annotation (defaultComponentName="enthalpy",
        Diagram(coordinateSystem(extent={{-40,-40},{40,40}})),
        Icon(coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=
                false), graphics={
            Rectangle(
              extent={{-40,40},{40,-40}},
        lineColor={0,0,0},
              radius=10,
        fillColor={236,236,236},
          fillPattern=FillPattern.Solid),
            Text(
              extent={{-100,-44},{100,-64}},
        lineColor={0,0,0},
         fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
              textString="%name"),
            Text(
              extent={{-40,10},{40,-10}},
        lineColor={0,0,0},
              fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
         textString="Const")}));
       end EnthalpyConst;

       block MolarEnthalpyConst "Constant signal of type MolarEnthalpy"
         parameter Types.MolarEnthalpy k "Constant Enthalpy output value";
         RealIO.MolarEnthalpyOutput y "Molar Enthalpy constant" annotation (Placement(
            transformation(extent={{40,-10},{60,10}}),
       iconTransformation(extent={{40,-10},{60,10}})));
       equation
         y = k;
       annotation (defaultComponentName="molarEnthalpy",
        Diagram(coordinateSystem(extent={{-40,-40},{40,40}})),
        Icon(coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=
                false), graphics={
            Rectangle(
              extent={{-40,40},{40,-40}},
        lineColor={0,0,0},
              radius=10,
        fillColor={236,236,236},
          fillPattern=FillPattern.Solid),
            Text(
              extent={{-100,-44},{100,-64}},
        lineColor={0,0,0},
         fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
              textString="%name"),
            Text(
              extent={{-40,10},{40,-10}},
        lineColor={0,0,0},
              fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
         textString="Const")}));
       end MolarEnthalpyConst;

     block FractionConst "Constant signal of type Fraction"
      parameter Types.Fraction k "Constant Fraction output value";
      RealIO.FractionOutput y "Fraction constant" annotation (Placement(
            transformation(extent={{40,-10},{60,10}}),
       iconTransformation(extent={{40,-10},{60,10}})));
     equation
      y = k;
       annotation (defaultComponentName="fraction",
        Diagram(coordinateSystem(extent={{-40,-40},{40,40}})),
        Icon(
      coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
            graphics={
      Rectangle(extent={{-40,40},{40,-40}},
        lineColor={0,0,0},
     radius=10,
        fillColor={236,236,236},
          fillPattern=FillPattern.Solid),
      Text( extent={{-100,-44},{100,-64}},
        lineColor={0,0,0},
         fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
     textString="%name"),
      Text(         extent={{-40,10},{40,-10}},
        lineColor={0,0,0},
     fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
         textString="Const")}));
     end FractionConst;

     block FrequencyConst "Constant signal of type Frequency"
      parameter Types.Frequency k "Constant Frequency output value";
      RealIO.FrequencyOutput y "Frequency constant" annotation (Placement(
            transformation(extent={{40,-10},{60,10}}),
       iconTransformation(extent={{40,-10},{60,10}})));
     equation
      y = k;
       annotation (defaultComponentName="frequency",
        Diagram(coordinateSystem(extent={{-40,-40},{40,40}})),
        Icon(
      coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
            graphics={
      Rectangle(extent={{-40,40},{40,-40}},
        lineColor={0,0,0},
     radius=10,
        fillColor={236,236,236},
          fillPattern=FillPattern.Solid),
      Text( extent={{-100,-44},{100,-64}},
        lineColor={0,0,0},
         fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
     textString="%name"),
      Text(         extent={{-40,10},{40,-10}},
        lineColor={0,0,0},
     fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
         textString="Const")}));
     end FrequencyConst;

     block GasSolubilityConst "Constant signal of type GasSolubility"
      parameter Types.GasSolubility k "Constant GasSolubility output value";
      RealIO.GasSolubilityOutput y "GasSolubility constant" annotation (
          Placement(transformation(extent={{40,-10},{60,10}}),
       iconTransformation(extent={{40,-10},{60,10}})));
     equation
      y = k;
       annotation (defaultComponentName="gasSolubility",
        Diagram(coordinateSystem(extent={{-40,-40},{40,40}})),
        Icon(
      coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
            graphics={
      Rectangle(extent={{-40,40},{40,-40}},
        lineColor={0,0,0},
     radius=10,
        fillColor={236,236,236},
          fillPattern=FillPattern.Solid),
      Text( extent={{-100,-44},{100,-64}},
        lineColor={0,0,0},
         fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
     textString="%name"),
      Text(         extent={{-40,10},{40,-10}},
        lineColor={0,0,0},
     fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
         textString="Const")}));
     end GasSolubilityConst;

     block HeatConst "Constant signal of type Heat"
      parameter Types.Heat k "Constant Heat output value";
      RealIO.HeatOutput y "Heat constant" annotation (Placement(transformation(
              extent={{40,-10},{60,10}}),
       iconTransformation(extent={{40,-10},{60,10}})));
     equation
      y = k;
       annotation (defaultComponentName="heat",
        Diagram(coordinateSystem(extent={{-40,-40},{40,40}})),
        Icon(
      coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
            graphics={
      Rectangle(extent={{-40,40},{40,-40}},
        lineColor={0,0,0},
     radius=10,
        fillColor={236,236,236},
          fillPattern=FillPattern.Solid),
      Text( extent={{-100,-44},{100,-64}},
        lineColor={0,0,0},
         fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
     textString="%name"),
      Text(         extent={{-40,10},{40,-10}},
        lineColor={0,0,0},
     fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
         textString="Const")}));
     end HeatConst;

     block HeightConst "Constant signal of type Height"
      parameter Types.Height k "Constant Height output value";
      RealIO.HeightOutput y "Height constant" annotation (Placement(
            transformation(extent={{40,-10},{60,10}}),
       iconTransformation(extent={{40,-10},{60,10}})));
     equation
      y = k;
       annotation (defaultComponentName="height",
        Diagram(coordinateSystem(extent={{-40,-40},{40,40}})),
        Icon(
      coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
            graphics={
      Rectangle(extent={{-40,40},{40,-40}},
        lineColor={0,0,0},
     radius=10,
        fillColor={236,236,236},
          fillPattern=FillPattern.Solid),
      Text( extent={{-100,-44},{100,-64}},
        lineColor={0,0,0},
         fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
     textString="%name"),
      Text(         extent={{-40,10},{40,-10}},
        lineColor={0,0,0},
     fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
         textString="Const")}));
     end HeightConst;

     block HeatFlowRateConst "Constant signal of type HeatFlowRate"
      parameter Types.HeatFlowRate k "Constant HeatFlowRate output value";
      RealIO.HeatFlowRateOutput y "HeatFlowRate constant" annotation (Placement(
            transformation(extent={{40,-10},{60,10}}),
       iconTransformation(extent={{40,-10},{60,10}})));
     equation
      y = k;
       annotation (defaultComponentName="heatFlowRate",
        Diagram(coordinateSystem(extent={{-40,-40},{40,40}})),
        Icon(
      coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
            graphics={
      Rectangle(extent={{-40,40},{40,-40}},
        lineColor={0,0,0},
     radius=10,
        fillColor={236,236,236},
          fillPattern=FillPattern.Solid),
      Text( extent={{-100,-44},{100,-64}},
        lineColor={0,0,0},
         fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
     textString="%name"),
      Text(         extent={{-40,10},{40,-10}},
        lineColor={0,0,0},
     fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
         textString="Const")}));
     end HeatFlowRateConst;

     block HydraulicComplianceConst "Constant signal of type HydraulicCompliance"
      parameter Types.HydraulicCompliance k
        "Constant HydraulicCompliance output value";
      RealIO.HydraulicComplianceOutput y "HydraulicCompliance constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
       iconTransformation(extent={{40,-10},{60,10}})));
     equation
      y = k;
       annotation (defaultComponentName="hydraulicCompliance",
        Diagram(coordinateSystem(extent={{-40,-40},{40,40}})),
        Icon(
      coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
            graphics={
      Rectangle(extent={{-40,40},{40,-40}},
        lineColor={0,0,0},
     radius=10,
        fillColor={236,236,236},
          fillPattern=FillPattern.Solid),
      Text( extent={{-100,-44},{100,-64}},
        lineColor={0,0,0},
         fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
     textString="%name"),
      Text(         extent={{-40,10},{40,-10}},
        lineColor={0,0,0},
     fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
         textString="Const")}));
     end HydraulicComplianceConst;

     block HydraulicElastanceConst
      "Obsolete, please use HydraulicCompliance instead!"
       extends Modelica.Icons.ObsoleteModel;
      parameter Types.HydraulicElastance k "Hydraulic elastance";
      RealIO.HydraulicElastanceOutput y "HydraulicElastance constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
       iconTransformation(extent={{40,-10},{60,10}})));
     equation
      y = k;
       annotation (defaultComponentName="hydraulicElastance",
         Icon(
      coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
            graphics={
      Rectangle(extent={{-40,40},{40,-40}},
        lineColor={0,0,0},
     radius=10,
        fillColor={236,236,236},
          fillPattern=FillPattern.Solid),
      Text( extent={{-100,-44},{100,-64}},
        lineColor={0,0,0},
         fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
     textString="%name"),
      Text(         extent={{-40,10},{40,-10}},
        lineColor={0,0,0},
     fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
         textString="Const")}),
        Documentation(info=
                       "<html>
        <p>Please use the reciprocal value of hydraulic elastance, wich is called hydraulic compliance for the compatibility with other blocks and models!</p>
        <p>Even it is not recommended, you can use this block, but do not forget to make reciprocal value (in example using Blocks.Math.Reciprocal) before connecting to library components!</p>
        </html>"));
     end HydraulicElastanceConst;

     block HydraulicElastanceToComplianceConst
      "Constant signal of type HydraulicCompliance from HydraulicElastance constant"
      parameter Types.HydraulicElastance k
        "Reciprocal constant value of hydraulic compliance";
      RealIO.HydraulicComplianceOutput y "HydraulicCompliance constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
       iconTransformation(extent={{40,-10},{60,10}})));
     equation
      y = 1/k;
       annotation (defaultComponentName="hydraulicElastance2Compliance",
        Diagram(coordinateSystem(extent={{-40,-40},{40,40}})),
        Icon(
      coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
            graphics={
      Rectangle(extent={{-40,40},{40,-40}},
        lineColor={0,0,0},
     radius=10,
        fillColor={236,236,236},
          fillPattern=FillPattern.Solid),
      Text( extent={{-100,-44},{100,-64}},
        lineColor={0,0,0},
         fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
     textString="%name"),
      Text(         extent={{-40,10},{40,-10}},
        lineColor={0,0,0},
     fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
         textString="Const")}));
     end HydraulicElastanceToComplianceConst;

     block HydraulicConductanceConst
      "Constant signal of type HydraulicConductance"
      parameter Types.HydraulicConductance k
        "Constant HydraulicConductance output value";
      RealIO.HydraulicConductanceOutput y "HydraulicConductance constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
       iconTransformation(extent={{40,-10},{60,10}})));
     equation
      y = k;
       annotation (defaultComponentName="hydraulicConductance",
        Diagram(coordinateSystem(extent={{-40,-40},{40,40}})),
        Icon(
      coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
            graphics={
      Rectangle(extent={{-40,40},{40,-40}},
        lineColor={0,0,0},
     radius=10,
        fillColor={236,236,236},
          fillPattern=FillPattern.Solid),
      Text( extent={{-100,-44},{100,-64}},
        lineColor={0,0,0},
         fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
     textString="%name"),
      Text(         extent={{-40,10},{40,-10}},
        lineColor={0,0,0},
     fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
         textString="Const")}));
     end HydraulicConductanceConst;

     block HydraulicResistanceConst
      "Obsolete, please use HydraulicConductance instead!"

      parameter Types.HydraulicResistance k "Hydraulic resistance";
      Modelica.Blocks.Interfaces.RealOutput
          y(final quantity="HydraulicConductance",final unit="(Pa.s)/m3", displayUnit="(mmHg.min)/ml", nominal=(1e+6)*(133.322387415)*60)
        "HydraulicResistance constant" annotation (Placement(transformation(
              extent={{40,-10},{60,10}}),
       iconTransformation(extent={{40,-10},{60,10}})));
     equation
      y = k;
       annotation (defaultComponentName="hydraulicResistance",
         Icon(
      coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
            graphics={
      Rectangle(extent={{-40,40},{40,-40}},
        lineColor={0,0,0},
     radius=10,
        fillColor={236,236,236},
          fillPattern=FillPattern.Solid),
      Text( extent={{-100,-44},{100,-64}},
        lineColor={0,0,0},
         fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
     textString="%name"),
      Text(         extent={{-40,10},{40,-10}},
        lineColor={0,0,0},
     fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
         textString="Const")}),
        Documentation(info=
                       "<html>
        <p>Please use the reciprocal value of hydraulic resistance, wich is called hydraulic conductance for the compatibility with other blocks and models!</p>
        <p>Because zero hydraulic conductance means zero volumetric flow, it is much better to use this reciprocal value of hydraulic resistance.</p>
        <p>Even it is not recommended, you can use this block, but do not forget to make reciprocal value (in example using Blocks.Math.Reciprocal) before connecting to library components!</p>
        </html>"));
     end HydraulicResistanceConst;

     block HydraulicResistanceToConductanceConst
      "Constant signal of type HydraulicConductance from HydraulicResistance parameter"
      parameter Types.HydraulicResistance k
        "Reciprocal constant value of hydraulic conductance";
      RealIO.HydraulicConductanceOutput y "HydraulicConductance constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
       iconTransformation(extent={{40,-10},{60,10}})));
     equation
      y = 1/k;
       annotation (defaultComponentName="hydraulicResistance2conductance",
        Diagram(coordinateSystem(extent={{-40,-40},{40,40}})),
        Icon(
      coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
            graphics={
      Rectangle(extent={{-40,40},{40,-40}},
        lineColor={0,0,0},
     radius=10,
        fillColor={236,236,236},
          fillPattern=FillPattern.Solid),
      Text( extent={{-100,-44},{100,-64}},
        lineColor={0,0,0},
         fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
     textString="%name"),
      Text(         extent={{-40,10},{40,-10}},
        lineColor={0,0,0},
     fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
         textString="Const")}));
     end HydraulicResistanceToConductanceConst;

     block HydraulicInertanceConst "Constant signal of type HydraulicInertance"
      parameter Types.HydraulicInertance k
        "Constant HydraulicInertance output value";
      RealIO.HydraulicInertanceOutput y "HydraulicInertance constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
       iconTransformation(extent={{40,-10},{60,10}})));
     equation
      y = k;
       annotation (defaultComponentName="hydraulicInertance",
        Diagram(coordinateSystem(extent={{-40,-40},{40,40}})),
        Icon(
      coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
            graphics={
      Rectangle(extent={{-40,40},{40,-40}},
        lineColor={0,0,0},
     radius=10,
        fillColor={236,236,236},
          fillPattern=FillPattern.Solid),
      Text( extent={{-100,-44},{100,-64}},
        lineColor={0,0,0},
         fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
     textString="%name"),
      Text(         extent={{-40,10},{40,-10}},
        lineColor={0,0,0},
     fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
         textString="Const")}));
     end HydraulicInertanceConst;

     block MassConst "Constant signal of type Mass"
      parameter Types.Mass k "Constant Mass output value";
      RealIO.MassOutput y "Mass constant" annotation (Placement(transformation(
              extent={{40,-10},{60,10}}),
       iconTransformation(extent={{40,-10},{60,10}})));
     equation
      y = k;
       annotation (defaultComponentName="mass",
        Diagram(coordinateSystem(extent={{-40,-40},{40,40}})),
        Icon(
      coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
            graphics={
      Rectangle(extent={{-40,40},{40,-40}},
        lineColor={0,0,0},
     radius=10,
        fillColor={236,236,236},
          fillPattern=FillPattern.Solid),
      Text( extent={{-100,-44},{100,-64}},
        lineColor={0,0,0},
         fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
     textString="%name"),
      Text(         extent={{-40,10},{40,-10}},
        lineColor={0,0,0},
     fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
         textString="Const")}));
     end MassConst;

     block MassConcentrationConst "Constant signal of type MassConcentration"
      parameter Types.MassConcentration k
        "Constant MassConcentration output value";
      RealIO.MassConcentrationOutput y "MassConcentration constant" annotation (
         Placement(transformation(extent={{40,-10},{60,10}}),
       iconTransformation(extent={{40,-10},{60,10}})));
     equation
      y = k;
       annotation (defaultComponentName="massConcentration",
        Diagram(coordinateSystem(extent={{-40,-40},{40,40}})),
        Icon(
      coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
            graphics={
      Rectangle(extent={{-40,40},{40,-40}},
        lineColor={0,0,0},
     radius=10,
        fillColor={236,236,236},
          fillPattern=FillPattern.Solid),
      Text( extent={{-100,-44},{100,-64}},
        lineColor={0,0,0},
         fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
     textString="%name"),
      Text(         extent={{-40,10},{40,-10}},
        lineColor={0,0,0},
     fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
         textString="Const")}));
     end MassConcentrationConst;

     block MassFlowRateConst "Constant signal of type MassFlowRate"
      parameter Types.MassFlowRate k "Constant MassFlowRate output value";
      RealIO.MassFlowRateOutput y "MassFlowRate constant" annotation (Placement(
            transformation(extent={{40,-10},{60,10}}),
       iconTransformation(extent={{40,-10},{60,10}})));
     equation
      y = k;
       annotation (defaultComponentName="massFlowRate",
        Diagram(coordinateSystem(extent={{-40,-40},{40,40}})),
        Icon(
      coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
            graphics={
      Rectangle(extent={{-40,40},{40,-40}},
        lineColor={0,0,0},
     radius=10,
        fillColor={236,236,236},
          fillPattern=FillPattern.Solid),
      Text( extent={{-100,-44},{100,-64}},
        lineColor={0,0,0},
         fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
     textString="%name"),
      Text(         extent={{-40,10},{40,-10}},
        lineColor={0,0,0},
     fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
         textString="Const")}));
     end MassFlowRateConst;

     block MolarFlowRateConst "Constant signal of type MolarFlowRate"
      parameter Types.MolarFlowRate k "Constant MolarFlowRate output value";
      RealIO.MolarFlowRateOutput y "MolarFlowRate constant" annotation (
          Placement(transformation(extent={{40,-10},{60,10}}),
       iconTransformation(extent={{40,-10},{60,10}})));
     equation
      y = k;
       annotation (defaultComponentName="molarFlowRate",
        Diagram(coordinateSystem(extent={{-40,-40},{40,40}})),
        Icon(
      coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
            graphics={
      Rectangle(extent={{-40,40},{40,-40}},
        lineColor={0,0,0},
     radius=10,
        fillColor={236,236,236},
          fillPattern=FillPattern.Solid),
      Text( extent={{-100,-44},{100,-64}},
        lineColor={0,0,0},
         fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
     textString="%name"),
      Text(         extent={{-40,10},{40,-10}},
        lineColor={0,0,0},
     fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
         textString="Const")}));
     end MolarFlowRateConst;

     block OsmolarityConst "Constant signal of type Osmolarity"
      parameter Types.Osmolarity k "Constant Osmolarity output value";
      RealIO.OsmolarityOutput y "Osmolarity constant" annotation (Placement(
            transformation(extent={{40,-10},{60,10}}),
       iconTransformation(extent={{40,-10},{60,10}})));
     equation
      y = k;
       annotation (defaultComponentName="osmolarity",
        Diagram(coordinateSystem(extent={{-40,-40},{40,40}})),
        Icon(
      coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
            graphics={
      Rectangle(extent={{-40,40},{40,-40}},
        lineColor={0,0,0},
     radius=10,
        fillColor={236,236,236},
          fillPattern=FillPattern.Solid),
      Text( extent={{-100,-44},{100,-64}},
        lineColor={0,0,0},
         fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
     textString="%name"),
      Text(         extent={{-40,10},{40,-10}},
        lineColor={0,0,0},
     fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
         textString="Const")}));
     end OsmolarityConst;

     block OsmoticPermeabilityConst "Constant signal of type OsmoticPermeability"
      parameter Types.OsmoticPermeability k
        "Constant OsmoticPermeability output value";
      RealIO.OsmoticPermeabilityOutput y "OsmoticPermeability constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
       iconTransformation(extent={{40,-10},{60,10}})));
     equation
      y = k;
       annotation (defaultComponentName="osmoticPermeability",
        Diagram(coordinateSystem(extent={{-40,-40},{40,40}})),
        Icon(
      coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
            graphics={
      Rectangle(extent={{-40,40},{40,-40}},
        lineColor={0,0,0},
     radius=10,
        fillColor={236,236,236},
          fillPattern=FillPattern.Solid),
      Text( extent={{-100,-44},{100,-64}},
        lineColor={0,0,0},
         fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
     textString="%name"),
      Text(         extent={{-40,10},{40,-10}},
        lineColor={0,0,0},
     fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
         textString="Const")}));
     end OsmoticPermeabilityConst;

     block PressureConst "Constant signal of type Pressure"
      parameter Types.Pressure k "Constant Pressure output value";
      RealIO.PressureOutput y "Pressure constant" annotation (Placement(
            transformation(extent={{40,-10},{60,10}}),
       iconTransformation(extent={{40,-10},{60,10}})));
     equation
      y = k;
       annotation (defaultComponentName="pressure",
        Diagram(coordinateSystem(extent={{-40,-40},{40,40}})),
        Icon(
      coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
            graphics={
      Rectangle(extent={{-40,40},{40,-40}},
        lineColor={0,0,0},
     radius=10,
        fillColor={236,236,236},
          fillPattern=FillPattern.Solid),
      Text( extent={{-100,-44},{100,-64}},
        lineColor={0,0,0},
         fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
     textString="%name"),
      Text(         extent={{-40,10},{40,-10}},
        lineColor={0,0,0},
     fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
         textString="Const")}));
     end PressureConst;

     block SpecificEnergyConst "Constant signal of type SpecificEnergy"
      parameter Types.SpecificEnergy k "Constant SpecificEnergy output value";
      RealIO.SpecificEnergyOutput y "SpecificEnergy constant" annotation (
          Placement(transformation(extent={{40,-10},{60,10}}),
       iconTransformation(extent={{40,-10},{60,10}})));
     equation
      y = k;
       annotation (defaultComponentName="specificEnergy",
        Diagram(coordinateSystem(extent={{-40,-40},{40,40}})),
        Icon(
      coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
            graphics={
      Rectangle(extent={{-40,40},{40,-40}},
        lineColor={0,0,0},
     radius=10,
        fillColor={236,236,236},
          fillPattern=FillPattern.Solid),
      Text( extent={{-100,-44},{100,-64}},
        lineColor={0,0,0},
         fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
     textString="%name"),
      Text(         extent={{-40,10},{40,-10}},
        lineColor={0,0,0},
     fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
         textString="Const")}));
     end SpecificEnergyConst;

     block SpecificEnthalpyConst "Constant signal of type SpecificEnthalpy"
      parameter Types.SpecificEnthalpy k "Constant SpecificEnthalpy output value";
      RealIO.SpecificEnthalpyOutput y "SpecificEnthalpy constant" annotation (
          Placement(transformation(extent={{40,-10},{60,10}}),
       iconTransformation(extent={{40,-10},{60,10}})));
     equation
      y = k;
       annotation (defaultComponentName="specificEnthalpy",
        Diagram(coordinateSystem(extent={{-40,-40},{40,40}})),
        Icon(
      coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
            graphics={
      Rectangle(extent={{-40,40},{40,-40}},
        lineColor={0,0,0},
     radius=10,
        fillColor={236,236,236},
          fillPattern=FillPattern.Solid),
      Text( extent={{-100,-44},{100,-64}},
        lineColor={0,0,0},
         fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
     textString="%name"),
      Text(         extent={{-40,10},{40,-10}},
        lineColor={0,0,0},
     fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
         textString="Const")}));
     end SpecificEnthalpyConst;

     block SpecificHeatCapacityConst
      "Constant signal of type SpecificHeatCapacity"
      parameter Types.SpecificHeatCapacity k
        "Constant SpecificHeatCapacity output value";
      RealIO.SpecificHeatCapacityOutput y "SpecificHeatCapacity constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
       iconTransformation(extent={{40,-10},{60,10}})));
     equation
      y = k;
       annotation (defaultComponentName="specificHeatCapacity",
        Diagram(coordinateSystem(extent={{-40,-40},{40,40}})),
        Icon(
      coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
            graphics={
      Rectangle(extent={{-40,40},{40,-40}},
        lineColor={0,0,0},
     radius=10,
        fillColor={236,236,236},
          fillPattern=FillPattern.Solid),
      Text( extent={{-100,-44},{100,-64}},
        lineColor={0,0,0},
         fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
     textString="%name"),
      Text(         extent={{-40,10},{40,-10}},
        lineColor={0,0,0},
     fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
         textString="Const")}));
     end SpecificHeatCapacityConst;

     block TemperatureConst "Constant signal of type Temperature"
      parameter Types.Temperature k "Constant Temperature output value";
      RealIO.TemperatureOutput y "Temperature constant" annotation (Placement(
            transformation(extent={{40,-10},{60,10}}),
       iconTransformation(extent={{40,-10},{60,10}})));
     equation
      y = k;
       annotation (defaultComponentName="temperature",
        Diagram(coordinateSystem(extent={{-40,-40},{40,40}})),
        Icon(
      coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
            graphics={
      Rectangle(extent={{-40,40},{40,-40}},
        lineColor={0,0,0},
     radius=10,
        fillColor={236,236,236},
          fillPattern=FillPattern.Solid),
      Text( extent={{-100,-44},{100,-64}},
        lineColor={0,0,0},
         fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
     textString="%name"),
      Text(         extent={{-40,10},{40,-10}},
        lineColor={0,0,0},
     fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
         textString="Const")}));
     end TemperatureConst;

     block ThermalConductanceConst "Constant signal of type ThermalConductance"
      parameter Types.ThermalConductance k
        "Constant ThermalConductance output value";
      RealIO.ThermalConductanceOutput y "ThermalConductance constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
       iconTransformation(extent={{40,-10},{60,10}})));
     equation
      y = k;
       annotation (defaultComponentName="thermalConductance",
        Diagram(coordinateSystem(extent={{-40,-40},{40,40}})),
        Icon(
      coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
            graphics={
      Rectangle(extent={{-40,40},{40,-40}},
        lineColor={0,0,0},
     radius=10,
        fillColor={236,236,236},
          fillPattern=FillPattern.Solid),
      Text( extent={{-100,-44},{100,-64}},
        lineColor={0,0,0},
         fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
     textString="%name"),
      Text(         extent={{-40,10},{40,-10}},
        lineColor={0,0,0},
     fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
         textString="Const")}));
     end ThermalConductanceConst;

     block TimeConst "Constant signal of type Time"
      parameter Types.Time k "Constant Time output value";
      RealIO.TimeOutput y "Time constant" annotation (Placement(transformation(
              extent={{40,-10},{60,10}}),
       iconTransformation(extent={{40,-10},{60,10}})));
     equation
      y = k;
       annotation (defaultComponentName="time",
        Diagram(coordinateSystem(extent={{-40,-40},{40,40}})),
        Icon(
      coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
            graphics={
      Rectangle(extent={{-40,40},{40,-40}},
        lineColor={0,0,0},
     radius=10,
        fillColor={236,236,236},
          fillPattern=FillPattern.Solid),
      Text( extent={{-100,-44},{100,-64}},
        lineColor={0,0,0},
         fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
     textString="%name"),
      Text(         extent={{-40,10},{40,-10}},
        lineColor={0,0,0},
     fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
         textString="Const")}));
     end TimeConst;

     block VolumeFlowRateConst "Constant signal of type VolumeFlowRate"
      parameter Types.VolumeFlowRate k "Constant VolumeFlowRate output value";
      RealIO.VolumeFlowRateOutput y "VolumeFlowRate constant" annotation (
          Placement(transformation(extent={{40,-10},{60,10}}),
       iconTransformation(extent={{40,-10},{60,10}})));
     equation
      y = k;
       annotation (defaultComponentName="volumeFlowRate",
        Diagram(coordinateSystem(extent={{-40,-40},{40,40}})),
        Icon(
      coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
            graphics={
      Rectangle(extent={{-40,40},{40,-40}},
        lineColor={0,0,0},
     radius=10,
        fillColor={236,236,236},
          fillPattern=FillPattern.Solid),
      Text( extent={{-100,-44},{100,-64}},
        lineColor={0,0,0},
         fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
     textString="%name"),
      Text(         extent={{-40,10},{40,-10}},
        lineColor={0,0,0},
     fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
         textString="Const")}));
     end VolumeFlowRateConst;

     block VolumeConst "Constant signal of type Volume"
      parameter Types.Volume k "Constant Volume output value";
      RealIO.VolumeOutput y "Volume constant" annotation (Placement(
            transformation(extent={{40,-10},{60,10}}),
       iconTransformation(extent={{40,-10},{60,10}})));
     equation
      y = k;
       annotation (defaultComponentName="volume",
        Diagram(coordinateSystem(extent={{-40,-40},{40,40}})),
        Icon(
      coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
            graphics={
      Rectangle(extent={{-40,40},{40,-40}},
        lineColor={0,0,0},
     radius=10,
        fillColor={236,236,236},
          fillPattern=FillPattern.Solid),
      Text( extent={{-100,-44},{100,-64}},
        lineColor={0,0,0},
         fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
     textString="%name"),
      Text(         extent={{-40,10},{40,-10}},
        lineColor={0,0,0},
     fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
         textString="Const")}));
     end VolumeConst;

     block DeprecatedUntypedConstant
      "Deprecated Untyped Constant for automatic conversion from initial versions of Physiolibrary"
       extends Modelica.Icons.ObsoleteModel;
      parameter Real k "Untyped constant output value";
      parameter String varName="";
      parameter String units="1";

      Modelica.Blocks.Interfaces.RealOutput
         y "Untyped constant" annotation (Placement(transformation(extent={{40,
                -10},{60,10}}),
       iconTransformation(extent={{40,-10},{60,10}})));
     equation
      y = k;
       annotation (defaultComponentName="acceleration",
         Icon(
      coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
            graphics={
      Rectangle(extent={{-40,40},{40,-40}},
        lineColor={0,0,0},
     radius=10,
        fillColor={236,236,236},
          fillPattern=FillPattern.Solid),
      Text( extent={{-100,-44},{100,-64}},
        lineColor={0,0,0},
         fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
     textString="%name"),
      Text(         extent={{-40,10},{40,-10}},
        lineColor={0,0,0},
     fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
         textString="Const")}));
     end DeprecatedUntypedConstant;

     block pHConst "Constant signal of type pH"
      parameter Types.pH k "Constant pH output value";
      Types.RealIO.pHOutput y "pH constant" annotation (Placement(
        transformation(extent={{40,-10},{60,10}}), iconTransformation(extent={{
                40,-10},{60,10}})));
     equation
      y = k;
       annotation (defaultComponentName="pH",
        Diagram(coordinateSystem(extent={{-40,-40},{40,40}})),
        Icon(
      coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
            graphics={
      Rectangle(extent={{-40,40},{40,-40}},
        lineColor={0,0,0},
     radius=10,
        fillColor={236,236,236},
          fillPattern=FillPattern.Solid),
      Text( extent={{-100,-44},{100,-64}},
        lineColor={0,0,0},
         fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
     textString="%name"),
      Text(         extent={{-40,10},{40,-10}},
        lineColor={0,0,0},
     fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
         textString="Const")}));
     end pHConst;

     block VolumeDensityOfChargeConst
      "Constant signal of type VolumeDensityOfCharge"
      parameter Types.VolumeDensityOfCharge k
        "Constant VolumeDensityOfCharge output value";
      Types.RealIO.VolumeDensityOfChargeOutput y
        "VolumeDensityOfCharge constant" annotation (Placement(transformation(
              extent={{40,-10},{60,10}}), iconTransformation(extent={{40,-10},{
     60,10}})));
     equation
      y = k;
       annotation (defaultComponentName="volumeDensityOfCharge",
        Diagram(coordinateSystem(extent={{-40,-40},{40,40}})),
        Icon(
      coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
            graphics={
      Rectangle(extent={{-40,40},{40,-40}},
        lineColor={0,0,0},
     radius=10,
        fillColor={236,236,236},
          fillPattern=FillPattern.Solid),
      Text( extent={{-100,-44},{100,-64}},
        lineColor={0,0,0},
         fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
     textString="%name"),
      Text(         extent={{-40,10},{40,-10}},
        lineColor={0,0,0},
     fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
         textString="Const")}));
     end VolumeDensityOfChargeConst;

     block VelocityConst "Constant signal of type Velocity"
      parameter Types.Velocity k "Constant Velocity output value";
      Types.RealIO.VelocityOutput y "Velocity constant" annotation (Placement(
        transformation(extent={{40,-10},{60,10}}), iconTransformation(extent={{
                40,-10},{60,10}})));
     equation
      y = k;
       annotation (defaultComponentName="velocity",
        Diagram(coordinateSystem(extent={{-40,-40},{40,40}})),
        Icon(
      coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
            graphics={
      Rectangle(extent={{-40,40},{40,-40}},
        lineColor={0,0,0},
     radius=10,
        fillColor={236,236,236},
          fillPattern=FillPattern.Solid),
      Text( extent={{-100,-44},{100,-64}},
        lineColor={0,0,0},
         fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
     textString="%name"),
      Text(         extent={{-40,10},{40,-10}},
        lineColor={0,0,0},
     fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
         textString="Const")}));
     end VelocityConst;

     block PowerConst "Constant signal of type Power"
      parameter Types.Power k "Constant Power output value";
      RealIO.PowerOutput y "Power constant" annotation (Placement(
            transformation(extent={{40,-10},{60,10}}),
       iconTransformation(extent={{40,-10},{60,10}})));
     equation
      y = k;
       annotation (defaultComponentName="power",
        Diagram(coordinateSystem(extent={{-40,-40},{40,40}})),
        Icon(
      coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
            graphics={
      Rectangle(extent={{-40,40},{40,-40}},
        lineColor={0,0,0},
     radius=10,
        fillColor={236,236,236},
          fillPattern=FillPattern.Solid),
      Text( extent={{-100,-44},{100,-64}},
        lineColor={0,0,0},
         fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
     textString="%name"),
      Text(         extent={{-40,10},{40,-10}},
        lineColor={0,0,0},
     fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
         textString="Const")}));
     end PowerConst;

     block PositionConst "Constant signal of type Position"
      parameter Types.Position k "Constant Position output value";
      RealIO.PositionOutput y "Position constant" annotation (Placement(
            transformation(extent={{40,-10},{60,10}}),
       iconTransformation(extent={{40,-10},{60,10}})));
     equation
      y = k;
       annotation (defaultComponentName="height",
        Diagram(coordinateSystem(extent={{-40,-40},{40,40}})),
        Icon(
      coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
            graphics={
      Rectangle(extent={{-40,40},{40,-40}},
        lineColor={0,0,0},
     radius=10,
        fillColor={236,236,236},
          fillPattern=FillPattern.Solid),
      Text( extent={{-100,-44},{100,-64}},
        lineColor={0,0,0},
         fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
     textString="%name"),
      Text(         extent={{-40,10},{40,-10}},
        lineColor={0,0,0},
     fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
         textString="Const")}));
     end PositionConst;

       block MolarEnergyConst "Constant signal of type MolarEnergy"
         parameter Types.MolarEnergy k "Constant MolarEnergy output value";
         RealIO.MolarEnergyOutput y "MolarEnergy constant" annotation (
          Placement(
            transformation(extent={{40,-10},{60,10}}),
       iconTransformation(extent={{40,-10},{60,10}})));
       equation
         y = k;
       annotation (defaultComponentName="molarEnergy",
        Diagram(coordinateSystem(extent={{-40,-40},{40,40}})),
        Icon(coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=
                false), graphics={
            Rectangle(
              extent={{-40,40},{40,-40}},
        lineColor={0,0,0},
              radius=10,
        fillColor={236,236,236},
          fillPattern=FillPattern.Solid),
            Text(
              extent={{-100,-44},{100,-64}},
        lineColor={0,0,0},
         fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
              textString="%name"),
            Text(
              extent={{-40,10},{40,-10}},
        lineColor={0,0,0},
              fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
         textString="Const")}));
       end MolarEnergyConst;

     block OneConst "1"

      RealIO.FractionOutput y "=1" annotation (Placement(transformation(extent=
                {{40,-10},{60,10}}),
       iconTransformation(extent={{40,-10},{60,10}})));
     equation
      y = 1;
       annotation (defaultComponentName="one",
        Diagram(coordinateSystem(extent={{-40,-40},{40,40}})),
        Icon(
      coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
            graphics={
      Rectangle(extent={{-40,40},{40,-40}},
        lineColor={0,0,0},
     radius=10,
        fillColor={236,236,236},
          fillPattern=FillPattern.Solid),
      Text( extent={{-100,-44},{100,-64}},
        lineColor={0,0,0},
         fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
     textString="%name"),
      Text(         extent={{-40,40},{40,-40}},
        lineColor={0,0,0},
     fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
        textString="1")}));
     end OneConst;

       block PopulationConst "Constant signal of type Population"
         parameter Types.Population k "Constant Population output value";
         RealIO.PopulationOutput y "Population constant" annotation (
          Placement(
            transformation(extent={{40,-10},{60,10}}),
       iconTransformation(extent={{40,-10},{60,10}})));
       equation
         y = k;
       annotation (defaultComponentName="population",
        Diagram(coordinateSystem(extent={{-40,-40},{40,40}})),
        Icon(coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=
                false), graphics={
            Rectangle(
              extent={{-40,40},{40,-40}},
        lineColor={0,0,0},
              radius=10,
        fillColor={236,236,236},
          fillPattern=FillPattern.Solid),
            Text(
              extent={{-100,-44},{100,-64}},
        lineColor={0,0,0},
         fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
              textString="%name"),
            Text(
              extent={{-40,10},{40,-10}},
        lineColor={0,0,0},
              fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
         textString="Const")}));
       end PopulationConst;

       block PopulationChangeConst "Constant signal of type PopulationChange"
         parameter Types.PopulationChange k
        "Constant PopulationChange output value";
         RealIO.PopulationChangeOutput y "PopulationChange constant"
        annotation (
          Placement(transformation(extent={{40,-10},{60,10}}),
       iconTransformation(extent={{40,-10},{60,10}})));
       equation
         y = k;
       annotation (defaultComponentName="populationChange",
        Diagram(coordinateSystem(extent={{-40,-40},{40,40}})),
        Icon(coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=
                false), graphics={
            Rectangle(
              extent={{-40,40},{40,-40}},
        lineColor={0,0,0},
              radius=10,
        fillColor={236,236,236},
          fillPattern=FillPattern.Solid),
            Text(
              extent={{-100,-44},{100,-64}},
        lineColor={0,0,0},
         fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
              textString="%name"),
            Text(
              extent={{-40,10},{40,-10}},
        lineColor={0,0,0},
              fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
         textString="Const")}));
       end PopulationChangeConst;

       block PopulationChangePerMemberConst
         "Constant signal of type PopulationChangePerMember"
         parameter Types.Time LifeTime
        "Mean lifetime as 1/PopulationChangePerMember output value";
         RealIO.PopulationChangePerMemberOutput y
        "PopulationChangePerMember constant" annotation (Placement(
            transformation(extent={{40,-10},{60,10}}),
       iconTransformation(extent={{40,-10},{60,10}})));
       equation
         y = 1/LifeTime;
       annotation (defaultComponentName="populationChangePerMember",
        Diagram(coordinateSystem(extent={{-40,-40},{40,40}})),
        Icon(coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=
                false), graphics={
            Rectangle(
              extent={{-40,40},{40,-40}},
        lineColor={0,0,0},
              radius=10,
        fillColor={236,236,236},
          fillPattern=FillPattern.Solid),
            Text(
              extent={{-100,-44},{100,-64}},
        lineColor={0,0,0},
         fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
              textString="%name"),
            Text(
              extent={{-40,10},{40,-10}},
        lineColor={0,0,0},
              fillColor={236,236,236},
        fillPattern=FillPattern.Solid,
         textString="Const")}));
       end PopulationChangePerMemberConst;
     end Constants;

     package RealIO
       extends Modelica.Icons.Package;

       connector AccelerationInput = input Acceleration
         "input Acceleration as connector" annotation (
         defaultComponentName="acceleration",
         Icon(graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={0,0,127},
               fillPattern=FillPattern.Solid)},
       coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
         Diagram(coordinateSystem(
        preserveAspectRatio=true, initialScale=0.2,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{0,50},{100,0},{0,-50},{0,50}},
               lineColor={0,0,127},fillColor={0,0,127},fillPattern=FillPattern.Solid),
               Text(
                 extent={{-10,85},{-10,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
            <p>
            Connector with one input signal of type Acceleration.
            </p>
            </html>"));
       connector AccelerationOutput = output Acceleration
         "output Acceleration as connector" annotation (
         defaultComponentName="acceleration",
         Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={255,255,255},
               fillPattern=FillPattern.Solid)}),
         Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{-100,50},{0,0},{-100,-50},{-100,50}},
               lineColor={0,0,127},fillColor={255,255,255},fillPattern=FillPattern.Solid),
               Text(
                 extent={{30,110},{30,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
       connector AmountOfSubstanceInput = input AmountOfSubstance
         "input AmountOfSubstance as connector" annotation (
         defaultComponentName="amountofsubstance",
         Icon(graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={0,0,127},
               fillPattern=FillPattern.Solid)},
       coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
         Diagram(coordinateSystem(
        preserveAspectRatio=true, initialScale=0.2,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{0,50},{100,0},{0,-50},{0,50}},
               lineColor={0,0,127},fillColor={0,0,127},fillPattern=FillPattern.Solid),
               Text(
                 extent={{-10,85},{-10,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
            <p>
            Connector with one input signal of type AmountOfSubstance.
            </p>
            </html>"));
       connector AmountOfSubstanceOutput = output AmountOfSubstance
         "output AmountOfSubstance as connector" annotation (
         defaultComponentName="amountofsubstance",
         Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={255,255,255},
               fillPattern=FillPattern.Solid)}),
         Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{-100,50},{0,0},{-100,-50},{-100,50}},
               lineColor={0,0,127},fillColor={255,255,255},fillPattern=FillPattern.Solid),
               Text(
                 extent={{30,110},{30,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
       connector ConcentrationInput = input Concentration
         "input Concentration as connector" annotation (
         defaultComponentName="concentration",
         Icon(graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={0,0,127},
               fillPattern=FillPattern.Solid)},
       coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
         Diagram(coordinateSystem(
        preserveAspectRatio=true, initialScale=0.2,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{0,50},{100,0},{0,-50},{0,50}},
               lineColor={0,0,127},fillColor={0,0,127},fillPattern=FillPattern.Solid),
               Text(
                 extent={{-10,85},{-10,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
            <p>
            Connector with one input signal of type Concentration.
            </p>
            </html>"));
       connector ConcentrationOutput = output Concentration
         "output Concentration as connector" annotation (
         defaultComponentName="concentration",
         Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={255,255,255},
               fillPattern=FillPattern.Solid)}),
         Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{-100,50},{0,0},{-100,-50},{-100,50}},
               lineColor={0,0,127},fillColor={255,255,255},fillPattern=FillPattern.Solid),
               Text(
                 extent={{30,110},{30,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
       connector DiffusionPermeabilityInput = input DiffusionPermeability
         "input DiffusionPermeability as connector" annotation (
         defaultComponentName="diffusionmembranepermeability",
         Icon(graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={0,0,127},
               fillPattern=FillPattern.Solid)},
       coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
         Diagram(coordinateSystem(
        preserveAspectRatio=true, initialScale=0.2,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{0,50},{100,0},{0,-50},{0,50}},
               lineColor={0,0,127},fillColor={0,0,127},fillPattern=FillPattern.Solid),
               Text(
                 extent={{-10,85},{-10,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
            <p>
            Connector with one input signal of type DiffusionMembranePermeability.
            </p>
            </html>"));
       connector DiffusionPermeabilityOutput = output DiffusionPermeability
         "output DiffusionPermeability as connector" annotation (
         defaultComponentName="diffusionmembranepermeability",
         Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={255,255,255},
               fillPattern=FillPattern.Solid)}),
         Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{-100,50},{0,0},{-100,-50},{-100,50}},
               lineColor={0,0,127},fillColor={255,255,255},fillPattern=FillPattern.Solid),
               Text(
                 extent={{30,110},{30,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
       connector ElectricCurrentInput = input ElectricCurrent
         "input ElectricCurrent as connector" annotation (
         defaultComponentName="electriccurrent",
         Icon(graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={0,0,127},
               fillPattern=FillPattern.Solid)},
       coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
         Diagram(coordinateSystem(
        preserveAspectRatio=true, initialScale=0.2,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{0,50},{100,0},{0,-50},{0,50}},
               lineColor={0,0,127},fillColor={0,0,127},fillPattern=FillPattern.Solid),
               Text(
                 extent={{-10,85},{-10,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
            <p>
            Connector with one input signal of type ElectricCurrent.
            </p>
            </html>"));
       connector ElectricCurrentOutput = output ElectricCurrent
         "output ElectricCurrent as connector" annotation (
         defaultComponentName="electriccurrent",
         Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={255,255,255},
               fillPattern=FillPattern.Solid)}),
         Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{-100,50},{0,0},{-100,-50},{-100,50}},
               lineColor={0,0,127},fillColor={255,255,255},fillPattern=FillPattern.Solid),
               Text(
                 extent={{30,110},{30,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
       connector ElectricChargeInput = input ElectricCharge
         "input ElectricCharge as connector" annotation (
         defaultComponentName="electriccharge",
         Icon(graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={0,0,127},
               fillPattern=FillPattern.Solid)},
       coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
         Diagram(coordinateSystem(
        preserveAspectRatio=true, initialScale=0.2,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{0,50},{100,0},{0,-50},{0,50}},
               lineColor={0,0,127},fillColor={0,0,127},fillPattern=FillPattern.Solid),
               Text(
                 extent={{-10,85},{-10,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
            <p>
            Connector with one input signal of type ElectricCharge.
            </p>
            </html>"));
       connector ElectricChargeOutput = output ElectricCharge
         "output ElectricCharge as connector" annotation (
         defaultComponentName="electriccharge",
         Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={255,255,255},
               fillPattern=FillPattern.Solid)}),
         Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{-100,50},{0,0},{-100,-50},{-100,50}},
               lineColor={0,0,127},fillColor={255,255,255},fillPattern=FillPattern.Solid),
               Text(
                 extent={{30,110},{30,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
       connector EnergyInput = input Energy "input Energy as connector" annotation (
         defaultComponentName="energy",
         Icon(graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={0,0,127},
               fillPattern=FillPattern.Solid)},
       coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
         Diagram(coordinateSystem(
        preserveAspectRatio=true, initialScale=0.2,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{0,50},{100,0},{0,-50},{0,50}},
               lineColor={0,0,127},fillColor={0,0,127},fillPattern=FillPattern.Solid),
               Text(
                 extent={{-10,85},{-10,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
            <p>
            Connector with one input signal of type Energy.
            </p>
            </html>"));
       connector EnergyOutput = output Energy "output Energy as connector"
         annotation (
         defaultComponentName="energy",
         Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={255,255,255},
               fillPattern=FillPattern.Solid)}),
         Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{-100,50},{0,0},{-100,-50},{-100,50}},
               lineColor={0,0,127},fillColor={255,255,255},fillPattern=FillPattern.Solid),
               Text(
                 extent={{30,110},{30,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
       connector EnthalpyInput = input Enthalpy "input Enthalpy as connector" annotation (
         defaultComponentName="enthalpy",
         Icon(graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={0,0,127},
               fillPattern=FillPattern.Solid)},
       coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
         Diagram(coordinateSystem(
        preserveAspectRatio=true, initialScale=0.2,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{0,50},{100,0},{0,-50},{0,50}},
               lineColor={0,0,127},fillColor={0,0,127},fillPattern=FillPattern.Solid),
               Text(
                 extent={{-10,85},{-10,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
            <p>
            Connector with one input signal of type Enthalpy.
            </p>
            </html>"));
       connector EnthalpyOutput = output Enthalpy "output Enthalpy as connector"
         annotation (
         defaultComponentName="enthalpy",
         Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={255,255,255},
               fillPattern=FillPattern.Solid)}),
         Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{-100,50},{0,0},{-100,-50},{-100,50}},
               lineColor={0,0,127},fillColor={255,255,255},fillPattern=FillPattern.Solid),
               Text(
                 extent={{30,110},{30,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
       connector MolarEnthalpyInput = input MolarEnthalpy "input MolarEnthalpy as connector" annotation (
         defaultComponentName="molarEnthalpy",
         Icon(graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={0,0,127},
               fillPattern=FillPattern.Solid)},
       coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
         Diagram(coordinateSystem(
        preserveAspectRatio=true, initialScale=0.2,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{0,50},{100,0},{0,-50},{0,50}},
               lineColor={0,0,127},fillColor={0,0,127},fillPattern=FillPattern.Solid),
               Text(
                 extent={{-10,85},{-10,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
            <p>
            Connector with one input signal of type MolarEnthalpy.
            </p>
            </html>"));
       connector MolarEnthalpyOutput = output MolarEnthalpy "output MolarEnthalpy as connector"
         annotation (
         defaultComponentName="molarEnthalpy",
         Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={255,255,255},
               fillPattern=FillPattern.Solid)}),
         Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{-100,50},{0,0},{-100,-50},{-100,50}},
               lineColor={0,0,127},fillColor={255,255,255},fillPattern=FillPattern.Solid),
               Text(
                 extent={{30,110},{30,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
       connector HeatInput = input Heat "input Heat as connector" annotation (
         defaultComponentName="heat",
         Icon(graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={0,0,127},
               fillPattern=FillPattern.Solid)},
       coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
         Diagram(coordinateSystem(
        preserveAspectRatio=true, initialScale=0.2,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{0,50},{100,0},{0,-50},{0,50}},
               lineColor={0,0,127},fillColor={0,0,127},fillPattern=FillPattern.Solid),
               Text(
                 extent={{-10,85},{-10,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
            <p>
            Connector with one input signal of type Heat.
            </p>
            </html>"));
       connector HeatOutput = output Heat "output Heat as connector" annotation (
         defaultComponentName="heat",
         Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={255,255,255},
               fillPattern=FillPattern.Solid)}),
         Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{-100,50},{0,0},{-100,-50},{-100,50}},
               lineColor={0,0,127},fillColor={255,255,255},fillPattern=FillPattern.Solid),
               Text(
                 extent={{30,110},{30,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
       connector HeatFlowRateInput = input HeatFlowRate
         "input HeatFlowRate as connector" annotation (
         defaultComponentName="heatflowrate",
         Icon(graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={0,0,127},
               fillPattern=FillPattern.Solid)},
       coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
         Diagram(coordinateSystem(
        preserveAspectRatio=true, initialScale=0.2,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{0,50},{100,0},{0,-50},{0,50}},
               lineColor={0,0,127},fillColor={0,0,127},fillPattern=FillPattern.Solid),
               Text(
                 extent={{-10,85},{-10,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
            <p>
            Connector with one input signal of type HeatFlowRate.
            </p>
            </html>"));
       connector HeatFlowRateOutput = output HeatFlowRate
         "output HeatFlowRate as connector" annotation (
         defaultComponentName="heatflowrate",
         Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={255,255,255},
               fillPattern=FillPattern.Solid)}),
         Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{-100,50},{0,0},{-100,-50},{-100,50}},
               lineColor={0,0,127},fillColor={255,255,255},fillPattern=FillPattern.Solid),
               Text(
                 extent={{30,110},{30,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
       connector HeightInput = input Height "input Height as connector" annotation (
         defaultComponentName="height",
         Icon(graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={0,0,127},
               fillPattern=FillPattern.Solid)},
       coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
         Diagram(coordinateSystem(
        preserveAspectRatio=true, initialScale=0.2,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{0,50},{100,0},{0,-50},{0,50}},
               lineColor={0,0,127},
               fillColor={0,0,127},
               fillPattern=FillPattern.Solid), Text(
               extent={{-10,85},{-10,60}},
               lineColor={0,0,127},
               textString="%name")}),
         Documentation(info=
                       "<html>
            <p>
            Connector with one input signal of type Height.
            </p>
            </html>"));
       connector HeightOutput = output Height "output Height as connector"
         annotation (
         defaultComponentName="height",
         Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={255,255,255},
               fillPattern=FillPattern.Solid)}),
         Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{-100,50},{0,0},{-100,-50},{-100,50}},
               lineColor={0,0,127},fillColor={255,255,255},fillPattern=FillPattern.Solid),
               Text(
                 extent={{30,110},{30,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
       connector MassInput = input Mass "input Mass as connector" annotation (
         defaultComponentName="mass",
         Icon(graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={0,0,127},
               fillPattern=FillPattern.Solid)},
       coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
         Diagram(coordinateSystem(
        preserveAspectRatio=true, initialScale=0.2,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{0,50},{100,0},{0,-50},{0,50}},
               lineColor={0,0,127},fillColor={0,0,127},fillPattern=FillPattern.Solid),
               Text(
                 extent={{-10,85},{-10,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
            <p>
            Connector with one input signal of type Mass.
            </p>
            </html>"));
       connector MassOutput = output Mass "output Mass as connector" annotation (
         defaultComponentName="mass",
         Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={255,255,255},
               fillPattern=FillPattern.Solid)}),
         Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{-100,50},{0,0},{-100,-50},{-100,50}},
               lineColor={0,0,127},fillColor={255,255,255},fillPattern=FillPattern.Solid),
               Text(
                 extent={{30,110},{30,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
       connector MassFractionInput = input MassFraction "input Mass Fraction as connector" annotation (
         defaultComponentName="massFraction",
         Icon(graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={0,0,127},
               fillPattern=FillPattern.Solid)},
       coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
         Diagram(coordinateSystem(
        preserveAspectRatio=true, initialScale=0.2,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{0,50},{100,0},{0,-50},{0,50}},
               lineColor={0,0,127},fillColor={0,0,127},fillPattern=FillPattern.Solid),
               Text(
                 extent={{-10,85},{-10,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
            <p>
            Connector with one input signal of type MassFraction.
            </p>
            </html>"));
       connector MassFractionOutput = output MassFraction "output MassFraction as connector" annotation (
         defaultComponentName="massFraction",
         Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={255,255,255},
               fillPattern=FillPattern.Solid)}),
         Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{-100,50},{0,0},{-100,-50},{-100,50}},
               lineColor={0,0,127},fillColor={255,255,255},fillPattern=FillPattern.Solid),
               Text(
                 extent={{30,110},{30,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
       connector MassFlowRateInput = input MassFlowRate
         "input MassFlowRate as connector" annotation (
         defaultComponentName="massflowrate",
         Icon(graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={0,0,127},
               fillPattern=FillPattern.Solid)},
       coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
         Diagram(coordinateSystem(
        preserveAspectRatio=true, initialScale=0.2,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{0,50},{100,0},{0,-50},{0,50}},
               lineColor={0,0,127},
               fillColor={0,0,127},
               fillPattern=FillPattern.Solid), Text(
               extent={{-10,85},{-10,60}},
               lineColor={0,0,127},
               textString="%name")}),
         Documentation(info=
                       "<html>
            <p>
            Connector with one input signal of type MassFlowRate.
            </p>
            </html>"));
       connector MassFlowRateOutput = output MassFlowRate
         "output MassFlowRate as connector" annotation (
         defaultComponentName="massflowrate",
         Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={255,255,255},
               fillPattern=FillPattern.Solid)}),
         Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{-100,50},{0,0},{-100,-50},{-100,50}},
               lineColor={0,0,127},
               fillColor={255,255,255},
               fillPattern=FillPattern.Solid), Text(
               extent={{30,110},{30,60}},
               lineColor={0,0,127},
               textString="%name")}),
         Documentation(info=
                       "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
       connector MolarFlowRateInput = input MolarFlowRate
         "input MolarFlowRate as connector" annotation (
         defaultComponentName="molarflowrate",
         Icon(graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={0,0,127},
               fillPattern=FillPattern.Solid)},
       coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
         Diagram(coordinateSystem(
        preserveAspectRatio=true, initialScale=0.2,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{0,50},{100,0},{0,-50},{0,50}},
               lineColor={0,0,127},fillColor={0,0,127},fillPattern=FillPattern.Solid),
               Text(
                 extent={{-10,85},{-10,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
            <p>
            Connector with one input signal of type MolarFlowRate.
            </p>
            </html>"));
       connector MolarFlowRateOutput = output MolarFlowRate
         "output MolarFlowRate as connector" annotation (
         defaultComponentName="molarflowrate",
         Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={255,255,255},
               fillPattern=FillPattern.Solid)}),
         Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{-100,50},{0,0},{-100,-50},{-100,50}},
               lineColor={0,0,127},fillColor={255,255,255},fillPattern=FillPattern.Solid),
               Text(
                 extent={{30,110},{30,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
       connector OsmolarityInput = input Osmolarity
         "input Concentration as connector" annotation (
         defaultComponentName="osmolarity",
         Icon(graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={0,0,127},
               fillPattern=FillPattern.Solid)},
       coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
         Diagram(coordinateSystem(
        preserveAspectRatio=true, initialScale=0.2,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{0,50},{100,0},{0,-50},{0,50}},
               lineColor={0,0,127},fillColor={0,0,127},fillPattern=FillPattern.Solid),
               Text(
                 extent={{-10,85},{-10,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
            <p>
            Connector with one input signal of type Concentration.
            </p>
            </html>"));
       connector OsmolarityOutput = output Osmolarity
         "output Concentration as connector" annotation (
         defaultComponentName="osmolarity",
         Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={255,255,255},
               fillPattern=FillPattern.Solid)}),
         Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{-100,50},{0,0},{-100,-50},{-100,50}},
               lineColor={0,0,127},fillColor={255,255,255},fillPattern=FillPattern.Solid),
               Text(
                 extent={{30,110},{30,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
       connector PressureInput = input Pressure "input Pressure as connector"
         annotation (
         defaultComponentName="pressure",
         Icon(graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={0,0,127},
               fillPattern=FillPattern.Solid)},
       coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
         Diagram(coordinateSystem(
        preserveAspectRatio=true, initialScale=0.2,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{0,50},{100,0},{0,-50},{0,50}},
               lineColor={0,0,127},fillColor={0,0,127},fillPattern=FillPattern.Solid),
               Text(
                 extent={{-10,85},{-10,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
            <p>
            Connector with one input signal of type Pressure.
            </p>
            </html>"));
       connector PressureOutput = output Pressure "output Pressure as connector"
         annotation (
         defaultComponentName="pressure",
         Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={255,255,255},
               fillPattern=FillPattern.Solid)}),
         Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{-100,50},{0,0},{-100,-50},{-100,50}},
               lineColor={0,0,127},
               fillColor={255,255,255},
               fillPattern=FillPattern.Solid), Text(
               extent={{30,110},{30,60}},
               lineColor={0,0,127},
               textString="%name")}),
         Documentation(info=
                       "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
       connector VolumeInput = input Volume "input Volume as connector" annotation (
         defaultComponentName="volume",
         Icon(graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={0,0,127},
               fillPattern=FillPattern.Solid)},
       coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
         Diagram(coordinateSystem(
        preserveAspectRatio=true, initialScale=0.2,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{0,50},{100,0},{0,-50},{0,50}},
               lineColor={0,0,127},fillColor={0,0,127},fillPattern=FillPattern.Solid),
               Text(
                 extent={{-10,85},{-10,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
            <p>
            Connector with one input signal of type Volume.
            </p>
            </html>"));
       connector VolumeOutput = output Volume "output Volume as connector"
         annotation (
         defaultComponentName="volume",
         Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={255,255,255},
               fillPattern=FillPattern.Solid)}),
         Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{-100,50},{0,0},{-100,-50},{-100,50}},
               lineColor={0,0,127},fillColor={255,255,255},fillPattern=FillPattern.Solid),
               Text(
                 extent={{30,110},{30,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
       connector VolumeFlowRateInput = input VolumeFlowRate
         "input VolumeFlowRate as connector" annotation (
         defaultComponentName="volumeflowrate",
         Icon(graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={0,0,127},
               fillPattern=FillPattern.Solid)},
       coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
         Diagram(coordinateSystem(
        preserveAspectRatio=true, initialScale=0.2,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{0,50},{100,0},{0,-50},{0,50}},
               lineColor={0,0,127},
               fillColor={0,0,127},
               fillPattern=FillPattern.Solid), Text(
               extent={{-10,85},{-10,60}},
               lineColor={0,0,127},
               textString="%name")}),
         Documentation(info=
                       "<html>
            <p>
            Connector with one input signal of type VolumeFlowRate.
            </p>
            </html>"));
       connector VolumeFlowRateOutput = output VolumeFlowRate
         "output VolumeFlowRate as connector" annotation (
         defaultComponentName="volumeflowrate",
         Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={255,255,255},
               fillPattern=FillPattern.Solid)}),
         Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{-100,50},{0,0},{-100,-50},{-100,50}},
               lineColor={0,0,127},fillColor={255,255,255},fillPattern=FillPattern.Solid),
               Text(
                 extent={{30,110},{30,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
       connector TemperatureInput = input Temperature
         "input Temperature as connector" annotation (
         defaultComponentName="temperature",
         Icon(graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={0,0,127},
               fillPattern=FillPattern.Solid)},
       coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
         Diagram(coordinateSystem(
        preserveAspectRatio=true, initialScale=0.2,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{0,50},{100,0},{0,-50},{0,50}},
               lineColor={0,0,127},fillColor={0,0,127},fillPattern=FillPattern.Solid),
               Text(
                 extent={{-10,85},{-10,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
            <p>
            Connector with one input signal of type Temperature.
            </p>
            </html>"));
       connector TemperatureOutput = output Temperature
         "output Temperature as connector" annotation (
         defaultComponentName="temperature",
         Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={255,255,255},
               fillPattern=FillPattern.Solid)}),
         Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{-100,50},{0,0},{-100,-50},{-100,50}},
               lineColor={0,0,127},fillColor={255,255,255},fillPattern=FillPattern.Solid),
               Text(
                 extent={{30,110},{30,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
       connector TimeInput = input Time "input Time as connector" annotation (
         defaultComponentName="time",
         Icon(graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={0,0,127},
               fillPattern=FillPattern.Solid)},
       coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
         Diagram(coordinateSystem(
        preserveAspectRatio=true, initialScale=0.2,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{0,50},{100,0},{0,-50},{0,50}},
               lineColor={0,0,127},fillColor={0,0,127},fillPattern=FillPattern.Solid),
               Text(
                 extent={{-10,85},{-10,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
            <p>
            Connector with one input signal of type Time.
            </p>
            </html>"));
       connector TimeOutput = output Time "output Time as connector" annotation (
         defaultComponentName="time",
         Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={255,255,255},
               fillPattern=FillPattern.Solid)}),
         Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{-100,50},{0,0},{-100,-50},{-100,50}},
               lineColor={0,0,127},
               fillColor={255,255,255},
               fillPattern=FillPattern.Solid), Text(
               extent={{30,110},{30,60}},
               lineColor={0,0,127},
               textString="%name")}),
         Documentation(info=
                       "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
       connector ThermalConductanceInput = input ThermalConductance
         "input ThermalConductance as connector" annotation (
         defaultComponentName="thermalconductance",
         Icon(graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={0,0,127},
               fillPattern=FillPattern.Solid)},
       coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
         Diagram(coordinateSystem(
        preserveAspectRatio=true, initialScale=0.2,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{0,50},{100,0},{0,-50},{0,50}},
               lineColor={0,0,127},fillColor={0,0,127},fillPattern=FillPattern.Solid),
               Text(
                 extent={{-10,85},{-10,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
            <p>
            Connector with one input signal of type ThermalConductance.
            </p>
            </html>"));
       connector ThermalConductanceOutput = output ThermalConductance
         "output ThermalConductance as connector" annotation (
         defaultComponentName="thermalconductance",
         Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={255,255,255},
               fillPattern=FillPattern.Solid)}),
         Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{-100,50},{0,0},{-100,-50},{-100,50}},
               lineColor={0,0,127},fillColor={255,255,255},fillPattern=FillPattern.Solid),
               Text(
                 extent={{30,110},{30,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
       connector ElectricPotentialInput = input ElectricPotential
         "input ElectricPotential as connector" annotation (
         defaultComponentName="electricpotential",
         Icon(graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={0,0,127},
               fillPattern=FillPattern.Solid)},
       coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
         Diagram(coordinateSystem(
        preserveAspectRatio=true, initialScale=0.2,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{0,50},{100,0},{0,-50},{0,50}},
               lineColor={0,0,127},fillColor={0,0,127},fillPattern=FillPattern.Solid),
               Text(
                 extent={{-10,85},{-10,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
            <p>
            Connector with one input signal of type ElectricPotential.
            </p>
            </html>"));
       connector ElectricPotentialOutput = output ElectricPotential
         "output ElectricPotential as connector" annotation (
         defaultComponentName="electricpotential",
         Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={255,255,255},
               fillPattern=FillPattern.Solid)}),
         Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{-100,50},{0,0},{-100,-50},{-100,50}},
               lineColor={0,0,127},fillColor={255,255,255},fillPattern=FillPattern.Solid),
               Text(
                 extent={{30,110},{30,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
       connector FractionInput = input Fraction "input Fraction as connector"
         annotation (
         defaultComponentName="fraction",
         Icon(graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={0,0,127},
               fillPattern=FillPattern.Solid)},
       coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
         Diagram(coordinateSystem(
        preserveAspectRatio=true, initialScale=0.2,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{0,50},{100,0},{0,-50},{0,50}},
               lineColor={0,0,127},
               fillColor={0,0,127},
               fillPattern=FillPattern.Solid), Text(
               extent={{-10,85},{-10,60}},
               lineColor={0,0,127},
               textString="%name")}),
         Documentation(info=
                       "<html>
            <p>
            Connector with one input signal of type Fraction.
            </p>
            </html>"));
       connector FractionOutput = output Fraction "output Fraction as connector"
         annotation (
         defaultComponentName="fraction",
         Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={255,255,255},
               fillPattern=FillPattern.Solid)}),
         Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{-100,50},{0,0},{-100,-50},{-100,50}},
               lineColor={0,0,127},fillColor={255,255,255},fillPattern=FillPattern.Solid),
               Text(
                 extent={{30,110},{30,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
       connector FrequencyInput = input Frequency "input Frequency as connector"
         annotation (
         defaultComponentName="frequency",
         Icon(graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={0,0,127},
               fillPattern=FillPattern.Solid)},
       coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
         Diagram(coordinateSystem(
        preserveAspectRatio=true, initialScale=0.2,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{0,50},{100,0},{0,-50},{0,50}},
               lineColor={0,0,127},
               fillColor={0,0,127},
               fillPattern=FillPattern.Solid), Text(
               extent={{-10,85},{-10,60}},
               lineColor={0,0,127},
               textString="%name")}),
         Documentation(info=
                       "<html>
            <p>
            Connector with one input signal of type Frequency.
            </p>
            </html>"));
       connector FrequencyOutput = output Frequency "output Frequency as connector"
         annotation (
         defaultComponentName="frequency",
         Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={255,255,255},
               fillPattern=FillPattern.Solid)}),
         Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{-100,50},{0,0},{-100,-50},{-100,50}},
               lineColor={0,0,127},
               fillColor={255,255,255},
               fillPattern=FillPattern.Solid), Text(
               extent={{30,110},{30,60}},
               lineColor={0,0,127},
               textString="%name")}),
         Documentation(info=
                       "<html>
          <p>
          Connector with one output signal of type Frequency.
          </p>
          </html>"));
       connector OsmoticPermeabilityInput = input OsmoticPermeability
         "input OsmoticPermeability as connector" annotation (
         defaultComponentName="osmoticmembranepermeability",
         Icon(graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={0,0,127},
               fillPattern=FillPattern.Solid)},
       coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
         Diagram(coordinateSystem(
        preserveAspectRatio=true, initialScale=0.2,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{0,50},{100,0},{0,-50},{0,50}},
               lineColor={0,0,127},fillColor={0,0,127},fillPattern=FillPattern.Solid),
               Text(
                 extent={{-10,85},{-10,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
            <p>
            Connector with one input signal of type OsmoticMembranePermeability.
            </p>
            </html>"));
       connector OsmoticPermeabilityOutput = output OsmoticPermeability
         "output OsmoticPermeability as connector" annotation (
         defaultComponentName="osmoticmembranepermeability",
         Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={255,255,255},
               fillPattern=FillPattern.Solid)}),
         Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{-100,50},{0,0},{-100,-50},{-100,50}},
               lineColor={0,0,127},fillColor={255,255,255},fillPattern=FillPattern.Solid),
               Text(
                 extent={{30,110},{30,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
       connector HydraulicConductanceInput = input HydraulicConductance
         "input HydraulicConductance as connector" annotation (
         defaultComponentName="hydraulicconductance",
         Icon(graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={0,0,127},
               fillPattern=FillPattern.Solid)},
       coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
         Diagram(coordinateSystem(
        preserveAspectRatio=true, initialScale=0.2,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{0,50},{100,0},{0,-50},{0,50}},
               lineColor={0,0,127},
               fillColor={0,0,127},
               fillPattern=FillPattern.Solid), Text(
               extent={{-10,85},{-10,60}},
               lineColor={0,0,127},
               textString="%name")}),
         Documentation(info=
                       "<html>
            <p>
            Connector with one input signal of type HydraulicConductance.
            </p>
            </html>"));
       connector HydraulicConductanceOutput = output HydraulicConductance
         "output HydraulicConductance as connector" annotation (
         defaultComponentName="hydraulicconductance",
         Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={255,255,255},
               fillPattern=FillPattern.Solid)}),
         Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{-100,50},{0,0},{-100,-50},{-100,50}},
               lineColor={0,0,127},fillColor={255,255,255},fillPattern=FillPattern.Solid),
               Text(
                 extent={{30,110},{30,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
       connector HydraulicResistanceInput = input HydraulicResistance
         "input HydraulicResistance as connector" annotation (
         defaultComponentName="hydraulicResistance",
         Icon(graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={0,0,127},
               fillPattern=FillPattern.Solid)},
       coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
         Diagram(coordinateSystem(
        preserveAspectRatio=true, initialScale=0.2,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{0,50},{100,0},{0,-50},{0,50}},
               lineColor={0,0,127},
               fillColor={0,0,127},
               fillPattern=FillPattern.Solid), Text(
               extent={{-10,85},{-10,60}},
               lineColor={0,0,127},
               textString="%name")}),
         Documentation(info=
                       "<html>
            <p>
            Connector with one input signal of type HydraulicResistance.
            </p>
            </html>"));
       connector HydraulicResistanceOutput = output HydraulicResistance
         "output HydraulicResistance as connector" annotation (
         defaultComponentName="hydraulicResistance",
         Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={255,255,255},
               fillPattern=FillPattern.Solid)}),
         Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{-100,50},{0,0},{-100,-50},{-100,50}},
               lineColor={0,0,127},fillColor={255,255,255},fillPattern=FillPattern.Solid),
               Text(
                 extent={{30,110},{30,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
       connector HydraulicComplianceInput = input HydraulicCompliance
         "input HydraulicCompliance as connector" annotation (
         defaultComponentName="hydrauliccompliance",
         Icon(graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={0,0,127},
               fillPattern=FillPattern.Solid)},
       coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
         Diagram(coordinateSystem(
        preserveAspectRatio=true, initialScale=0.2,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{0,50},{100,0},{0,-50},{0,50}},
               lineColor={0,0,127},
               fillColor={0,0,127},
               fillPattern=FillPattern.Solid), Text(
               extent={{-10,85},{-10,60}},
               lineColor={0,0,127},
               textString="%name")}),
         Documentation(info=
                       "<html>
            <p>
            Connector with one input signal of type HydraulicCompliance.
            </p>
            </html>"));
       connector HydraulicComplianceOutput = output HydraulicCompliance
         "output HydraulicCompliance as connector" annotation (
         defaultComponentName="hydrauliccompliance",
         Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={255,255,255},
               fillPattern=FillPattern.Solid)}),
         Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{-100,50},{0,0},{-100,-50},{-100,50}},
               lineColor={0,0,127},
               fillColor={255,255,255},
               fillPattern=FillPattern.Solid), Text(
               extent={{30,110},{30,60}},
               lineColor={0,0,127},
               textString="%name")}),
         Documentation(info=
                       "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
        connector HydraulicElastanceInput = input HydraulicElastance
         "input HydraulicElastance as connector" annotation (
         defaultComponentName="hydraulicelastance",
         Icon(graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={0,0,127},
               fillPattern=FillPattern.Solid)}, coordinateSystem(
             extent={{-100,-100},{100,100}},
             preserveAspectRatio=true,
             initialScale=0.2)),
         Diagram(coordinateSystem(
        preserveAspectRatio=true, initialScale=0.2,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{0,50},{100,0},{0,-50},{0,50}},
               lineColor={0,0,127},
               fillColor={0,0,127},
               fillPattern=FillPattern.Solid), Text(
               extent={{-10,85},{-10,60}},
               lineColor={0,0,127},
               textString="%name")}),
         Documentation(info=
                       "<html>
            <p>
            Connector with one input signal of type HydraulicElastance.
            </p>
            </html>"));
       connector HydraulicElastanceOutput = output HydraulicElastance
         "output HydraulicElastance as connector" annotation (
         defaultComponentName="hydraulicelastance",
         Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={255,255,255},
               fillPattern=FillPattern.Solid)}),
         Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{-100,50},{0,0},{-100,-50},{-100,50}},
               lineColor={0,0,127},
               fillColor={255,255,255},
               fillPattern=FillPattern.Solid), Text(
               extent={{30,110},{30,60}},
               lineColor={0,0,127},
               textString="%name")}),
         Documentation(info=
                       "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
       connector DensityInput =input Density "input Density as connector"
         annotation (
         defaultComponentName="density",
         Icon(graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={0,0,127},
               fillPattern=FillPattern.Solid)},
       coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
         Diagram(coordinateSystem(
        preserveAspectRatio=true, initialScale=0.2,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{0,50},{100,0},{0,-50},{0,50}},
               lineColor={0,0,127},fillColor={0,0,127},fillPattern=FillPattern.Solid),
               Text(
                 extent={{-10,85},{-10,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
            <p>
            Connector with one input signal of type Volume.
            </p>
            </html>"));
       connector DensityOutput =output Density "output Density as connector"
         annotation (
         defaultComponentName="density",
         Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={255,255,255},
               fillPattern=FillPattern.Solid)}),
         Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{-100,50},{0,0},{-100,-50},{-100,50}},
               lineColor={0,0,127},fillColor={255,255,255},fillPattern=FillPattern.Solid),
               Text(
                 extent={{30,110},{30,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
       connector HydraulicInertanceInput = input HydraulicInertance
         "input HydraulicInertance as connector" annotation (
         defaultComponentName="hydraulicinertance",
         Icon(graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={0,0,127},
               fillPattern=FillPattern.Solid)},
       coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
         Diagram(coordinateSystem(
        preserveAspectRatio=true, initialScale=0.2,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{0,50},{100,0},{0,-50},{0,50}},
               lineColor={0,0,127},fillColor={0,0,127},fillPattern=FillPattern.Solid),
               Text(
                 extent={{-10,85},{-10,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
            <p>
            Connector with one input signal of type HydraulicInertance.
            </p>
            </html>"));
       connector HydraulicInertanceOutput = output HydraulicInertance
         "output HydraulicInertance as connector" annotation (
         defaultComponentName="hydraulicinertance",
         Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={255,255,255},
               fillPattern=FillPattern.Solid)}),
         Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{-100,50},{0,0},{-100,-50},{-100,50}},
               lineColor={0,0,127},fillColor={255,255,255},fillPattern=FillPattern.Solid),
               Text(
                 extent={{30,110},{30,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
       connector GasSolubilityInput = input GasSolubility
         "input GasSolubility as connector" annotation (
         defaultComponentName="gassolubility",
         Icon(graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={0,0,127},
               fillPattern=FillPattern.Solid)},
       coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
         Diagram(coordinateSystem(
        preserveAspectRatio=true, initialScale=0.2,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{0,50},{100,0},{0,-50},{0,50}},
               lineColor={0,0,127},fillColor={0,0,127},fillPattern=FillPattern.Solid),
               Text(
                 extent={{-10,85},{-10,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
            <p>
            Connector with one input signal of type GasSolubility.
            </p>
            </html>"));
       connector GasSolubilityOutput = output GasSolubility
         "output GasSolubility as connector" annotation (
         defaultComponentName="gassolubility",
         Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={255,255,255},
               fillPattern=FillPattern.Solid)}),
         Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{-100,50},{0,0},{-100,-50},{-100,50}},
               lineColor={0,0,127},fillColor={255,255,255},fillPattern=FillPattern.Solid),
               Text(
                 extent={{30,110},{30,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
       connector SpecificEnergyInput =
          input SpecificEnergy "input SpecificEnergy as connector" annotation (
         defaultComponentName="specificEnergy",
         Icon(graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={0,0,127},
               fillPattern=FillPattern.Solid)},
       coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
         Diagram(coordinateSystem(
        preserveAspectRatio=true, initialScale=0.2,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{0,50},{100,0},{0,-50},{0,50}},
               lineColor={0,0,127},fillColor={0,0,127},fillPattern=FillPattern.Solid),
               Text(
                 extent={{-10,85},{-10,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
            <p>
            Connector with one input signal of type Volume.
            </p>
            </html>"));
       connector SpecificEnergyOutput =
           output SpecificEnergy "output SpecificEnergy as connector" annotation (
         defaultComponentName="specificEnergy",
         Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={255,255,255},
               fillPattern=FillPattern.Solid)}),
         Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{-100,50},{0,0},{-100,-50},{-100,50}},
               lineColor={0,0,127},fillColor={255,255,255},fillPattern=FillPattern.Solid),
               Text(
                 extent={{30,110},{30,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
       connector SpecificEnthalpyInput =
          input SpecificEnthalpy "input SpecificEnthalpy as connector" annotation (
         defaultComponentName="specificEnthalpy",
         Icon(graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={0,0,127},
               fillPattern=FillPattern.Solid)},
       coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
         Diagram(coordinateSystem(
        preserveAspectRatio=true, initialScale=0.2,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{0,50},{100,0},{0,-50},{0,50}},
               lineColor={0,0,127},fillColor={0,0,127},fillPattern=FillPattern.Solid),
               Text(
                 extent={{-10,85},{-10,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
            <p>
            Connector with one input signal of type SpecificEnthalpy.
            </p>
            </html>"));
       connector SpecificEnthalpyOutput =
           output SpecificEnthalpy "output SpecificEnthalpy as connector" annotation (
         defaultComponentName="specificEnthalpy",
         Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={255,255,255},
               fillPattern=FillPattern.Solid)}),
         Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{-100,50},{0,0},{-100,-50},{-100,50}},
               lineColor={0,0,127},fillColor={255,255,255},fillPattern=FillPattern.Solid),
               Text(
                 extent={{30,110},{30,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));

       connector SpecificHeatCapacityInput =
          input SpecificHeatCapacity "input SpecificHeatCapacity as connector"
         annotation (
         defaultComponentName="specificHeatCapacity",
         Icon(graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={0,0,127},
               fillPattern=FillPattern.Solid)},
       coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
         Diagram(coordinateSystem(
        preserveAspectRatio=true, initialScale=0.2,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{0,50},{100,0},{0,-50},{0,50}},
               lineColor={0,0,127},fillColor={0,0,127},fillPattern=FillPattern.Solid),
               Text(
                 extent={{-10,85},{-10,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
            <p>
            Connector with one input signal of type Volume.
            </p>
            </html>"));
       connector SpecificHeatCapacityOutput =
           output SpecificHeatCapacity "output SpecificHeatCapacity as connector"
         annotation (
         defaultComponentName="specificHeatCapacity",
         Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={255,255,255},
               fillPattern=FillPattern.Solid)}),
         Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{-100,50},{0,0},{-100,-50},{-100,50}},
               lineColor={0,0,127},fillColor={255,255,255},fillPattern=FillPattern.Solid),
               Text(
                 extent={{30,110},{30,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
          <p>
          Connector with one output signal of type Real.
          </p>
          </html>"));
       connector pHInput =           input pH "input pH as connector" annotation (
         defaultComponentName="pH",
         Icon(graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={0,0,127},
               fillPattern=FillPattern.Solid)},
       coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
         Diagram(coordinateSystem(
        preserveAspectRatio=true, initialScale=0.2,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{0,50},{100,0},{0,-50},{0,50}},
               lineColor={0,0,127},fillColor={0,0,127},fillPattern=FillPattern.Solid),
               Text(
                 extent={{-10,85},{-10,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
            <p>
            Connector with one input signal of type pH.
            </p>
            </html>"));
       connector pHOutput =           output pH "output pH as connector" annotation (
         defaultComponentName="pH",
         Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={255,255,255},
               fillPattern=FillPattern.Solid)}),
         Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{-100,50},{0,0},{-100,-50},{-100,50}},
               lineColor={0,0,127},fillColor={255,255,255},fillPattern=FillPattern.Solid),
               Text(
                 extent={{30,110},{30,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
          <p>
          Connector with one output signal of type pH.
          </p>
          </html>"));
       connector VolumeDensityOfChargeInput =           input VolumeDensityOfCharge
         "input VolumeDensityOfCharge as connector" annotation (
         defaultComponentName="volumeDensityOfCharge",
         Icon(graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={0,0,127},
               fillPattern=FillPattern.Solid)},
       coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
         Diagram(coordinateSystem(
        preserveAspectRatio=true, initialScale=0.2,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{0,50},{100,0},{0,-50},{0,50}},
               lineColor={0,0,127},fillColor={0,0,127},fillPattern=FillPattern.Solid),
               Text(
                 extent={{-10,85},{-10,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
            <p>
            Connector with one input signal of type VolumeDensityOfCharge.
            </p>
            </html>"));
       connector VolumeDensityOfChargeOutput =           output VolumeDensityOfCharge
                                 "output VolumeDensityOfCharge as connector"
         annotation (
         defaultComponentName="volumeDensityOfCharge",
         Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={255,255,255},
               fillPattern=FillPattern.Solid)}),
         Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{-100,50},{0,0},{-100,-50},{-100,50}},
               lineColor={0,0,127},fillColor={255,255,255},fillPattern=FillPattern.Solid),
               Text(
                 extent={{30,110},{30,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
          <p>
          Connector with one output signal of type VolumeDensityOfCharge.
          </p>
          </html>"));
       connector MassConcentrationInput =
          input MassConcentration "input MassConcentration as connector" annotation (
         defaultComponentName="massConcentration",
         Icon(graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={0,0,127},
               fillPattern=FillPattern.Solid)},
       coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
         Diagram(coordinateSystem(
        preserveAspectRatio=true, initialScale=0.2,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{0,50},{100,0},{0,-50},{0,50}},
               lineColor={0,0,127},fillColor={0,0,127},fillPattern=FillPattern.Solid),
               Text(
                 extent={{-10,85},{-10,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
            <p>
            Connector with one input signal of type MassConcentration.
            </p>
            </html>"));
       connector MassConcentrationOutput =
           output MassConcentration "output MassConcentration as connector"
         annotation (
         defaultComponentName="massConcentration",
         Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={255,255,255},
               fillPattern=FillPattern.Solid)}),
         Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{-100,50},{0,0},{-100,-50},{-100,50}},
               lineColor={0,0,127},fillColor={255,255,255},fillPattern=FillPattern.Solid),
               Text(
                 extent={{30,110},{30,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
          <p>
          Connector with one output signal of type MassConcentration.
          </p>
          </html>"));
       connector VelocityInput =      input Velocity "input Velocity as connector"
         annotation (
         defaultComponentName="velocity",
         Icon(graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={0,0,127},
               fillPattern=FillPattern.Solid)},
       coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
         Diagram(coordinateSystem(
        preserveAspectRatio=true, initialScale=0.2,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{0,50},{100,0},{0,-50},{0,50}},
               lineColor={0,0,127},fillColor={0,0,127},fillPattern=FillPattern.Solid),
               Text(
                 extent={{-10,85},{-10,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
            <p>
            Connector with one input signal of type Velocity.
            </p>
            </html>"));
       connector VelocityOutput =      output Velocity
         "output Velocity as connector" annotation (
         defaultComponentName="velocity",
         Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={255,255,255},
               fillPattern=FillPattern.Solid)}),
         Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{-100,50},{0,0},{-100,-50},{-100,50}},
               lineColor={0,0,127},fillColor={255,255,255},fillPattern=FillPattern.Solid),
               Text(
                 extent={{30,110},{30,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
          <p>
          Connector with one output signal of type Velocity.
          </p>
          </html>"));
       connector PowerInput = input Power "input Power as connector" annotation (
         defaultComponentName="power",
         Icon(graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={0,0,127},
               fillPattern=FillPattern.Solid)},
       coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
         Diagram(coordinateSystem(
        preserveAspectRatio=true, initialScale=0.2,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{0,50},{100,0},{0,-50},{0,50}},
               lineColor={0,0,127},fillColor={0,0,127},fillPattern=FillPattern.Solid),
               Text(
                 extent={{-10,85},{-10,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
            <p>
            Connector with one input signal of type Power.
            </p>
            </html>"));
       connector PowerOutput = output Power "output Power as connector" annotation (
         defaultComponentName="power",
         Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={255,255,255},
               fillPattern=FillPattern.Solid)}),
         Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{-100,50},{0,0},{-100,-50},{-100,50}},
               lineColor={0,0,127},fillColor={255,255,255},fillPattern=FillPattern.Solid),
               Text(
                 extent={{30,110},{30,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
          <p>
          Connector with one output signal of type Power.
          </p>
          </html>"));
       connector PositionInput = input Position "input Position as connector"
         annotation (
         defaultComponentName="position",
         Icon(graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={0,0,127},
               fillPattern=FillPattern.Solid)},
       coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
         Diagram(coordinateSystem(
        preserveAspectRatio=true, initialScale=0.2,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{0,50},{100,0},{0,-50},{0,50}},
               lineColor={0,0,127},fillColor={0,0,127},fillPattern=FillPattern.Solid),
               Text(
                 extent={{-10,85},{-10,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
            <p>
            Connector with one input signal of type Position.
            </p>
            </html>"));
       connector PositionOutput = output Position "output Position as connector"
         annotation (
         defaultComponentName="position",
         Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={255,255,255},
               fillPattern=FillPattern.Solid)}),
         Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{-100,50},{0,0},{-100,-50},{-100,50}},
               lineColor={0,0,127},fillColor={255,255,255},fillPattern=FillPattern.Solid),
               Text(
                 extent={{30,110},{30,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
          <p>
          Connector with one output signal of type Position.
          </p>
          </html>"));
        connector MolarEnergyInput = input MolarEnergy
         "input MolarEnergy as connector" annotation (
         defaultComponentName="molarEnergy",
         Icon(graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={0,0,127},
               fillPattern=FillPattern.Solid)}, coordinateSystem(
             extent={{-100,-100},{100,100}},
             preserveAspectRatio=true,
             initialScale=0.2)),
         Diagram(coordinateSystem(
        preserveAspectRatio=true, initialScale=0.2,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{0,50},{100,0},{0,-50},{0,50}},
               lineColor={0,0,127},fillColor={0,0,127},fillPattern=FillPattern.Solid),
               Text(
                  extent={{-10,85},{-10,60}},
                  lineColor={0,0,127},
                  textString="%name")}),
         Documentation(info=
                       "<html>
            <p>
            Connector with one input signal of type MolarEnergy.
            </p>
            </html>"));
       connector MolarEnergyOutput = output MolarEnergy
         "output MolarEnergy as connector" annotation (
         defaultComponentName="molarEnergy",
         Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={255,255,255},
               fillPattern=FillPattern.Solid)}),
         Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{-100,50},{0,0},{-100,-50},{-100,50}},
               lineColor={0,0,127},fillColor={255,255,255},fillPattern=FillPattern.Solid),
               Text(
                 extent={{30,110},{30,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
          <p>
          Connector with one output signal of type MolarEnergy.
          </p>
          </html>"));
        connector PopulationInput =  input Population
         "input Population as connector" annotation (
         defaultComponentName="population",
         Icon(graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={0,0,127},
               fillPattern=FillPattern.Solid)}, coordinateSystem(
             extent={{-100,-100},{100,100}},
             preserveAspectRatio=true,
             initialScale=0.2)),
         Diagram(coordinateSystem(
        preserveAspectRatio=true, initialScale=0.2,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{0,50},{100,0},{0,-50},{0,50}},
               lineColor={0,0,127},fillColor={0,0,127},fillPattern=FillPattern.Solid),
               Text(
                  extent={{-10,85},{-10,60}},
                  lineColor={0,0,127},
                  textString="%name")}),
         Documentation(info=
                       "<html>
            <p>
            Connector with one input signal of type Population.
            </p>
            </html>"));
       connector PopulationOutput =  output Population
         "output Population as connector" annotation (
         defaultComponentName="population",
         Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={255,255,255},
               fillPattern=FillPattern.Solid)}),
         Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{-100,50},{0,0},{-100,-50},{-100,50}},
               lineColor={0,0,127},fillColor={255,255,255},fillPattern=FillPattern.Solid),
               Text(
                 extent={{30,110},{30,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
          <p>
          Connector with one output signal of type Population.
          </p>
          </html>"));
        connector PopulationChangeInput =
         input PopulationChange "input PopulationChange as connector" annotation (
         defaultComponentName="populationChange",
         Icon(graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={0,0,127},
               fillPattern=FillPattern.Solid)}, coordinateSystem(
             extent={{-100,-100},{100,100}},
             preserveAspectRatio=true,
             initialScale=0.2)),
         Diagram(coordinateSystem(
        preserveAspectRatio=true, initialScale=0.2,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{0,50},{100,0},{0,-50},{0,50}},
               lineColor={0,0,127},fillColor={0,0,127},fillPattern=FillPattern.Solid),
               Text(
                  extent={{-10,85},{-10,60}},
                  lineColor={0,0,127},
                  textString="%name")}),
         Documentation(info=
                       "<html>
            <p>
            Connector with one input signal of type PopulationChange.
            </p>
            </html>"));
       connector PopulationChangeOutput =
         output PopulationChange "output PopulationChange as connector" annotation (
         defaultComponentName="populationChange",
         Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={255,255,255},
               fillPattern=FillPattern.Solid)}),
         Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{-100,50},{0,0},{-100,-50},{-100,50}},
               lineColor={0,0,127},fillColor={255,255,255},fillPattern=FillPattern.Solid),
               Text(
                 extent={{30,110},{30,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
          <p>
          Connector with one output signal of type PopulationChange.
          </p>
          </html>"));
       connector PopulationChangePerMemberInput =
         input PopulationChangePerMember
         "input PopulationChangePerMember as connector" annotation (
         defaultComponentName="populationChangePerMember",
         Icon(graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={0,0,127},
               fillPattern=FillPattern.Solid)},
       coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
         Diagram(coordinateSystem(
        preserveAspectRatio=true, initialScale=0.2,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{0,50},{100,0},{0,-50},{0,50}},
               lineColor={0,0,127},fillColor={0,0,127},fillPattern=FillPattern.Solid),
               Text(
                 extent={{-10,85},{-10,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
            <p>
            Connector with one input signal of type PopulationChangePerMember.
            </p>
            </html>"));
       connector PopulationChangePerMemberOutput =
         output PopulationChangePerMember
         "output PopulationChangePerMember as connector" annotation (
         defaultComponentName="populationChangePerMember",
         Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
               points={{-100,100},{100,0},{-100,-100},{-100,100}},
               lineColor={0,0,127},
               fillColor={255,255,255},
               fillPattern=FillPattern.Solid)}),
         Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(points={{-100,50},{0,0},{-100,-50},{-100,50}},
               lineColor={0,0,127},fillColor={255,255,255},fillPattern=FillPattern.Solid),
               Text(
                 extent={{30,110},{30,60}},
                 lineColor={0,0,127},
                 textString="%name")}),
         Documentation(info=
                       "<html>
          <p>
          Connector with one output signal of type PopulationChangePerMember.
          </p>
          </html>"));
     end RealIO;

       expandable connector BusConnector
       "Empty control bus that is adapted to the signals connected to it"

       annotation (
         Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={2,2},
        initialScale=0.2), graphics={
        Rectangle(
               extent={{-20,2},{20,-2}},
               lineColor={0,0,255},
               lineThickness=0.5),
        Polygon(
               points={{-80,50},{80,50},{100,30},{80,-40},{60,-50},{-60,-50},{-80,-40},
                   {-100,30},{-80,50}},
               lineColor={0,0,0},
               fillColor={0,0,255},
               fillPattern=FillPattern.Solid),
        Ellipse(
               extent={{-65,25},{-55,15}},
               lineColor={0,0,0},
               fillColor={0,0,0},
               fillPattern=FillPattern.Solid),
        Ellipse(
               extent={{-5,25},{5,15}},
               lineColor={0,0,0},
               fillColor={0,0,0},
               fillPattern=FillPattern.Solid),
        Ellipse(
               extent={{55,25},{65,15}},
               lineColor={0,0,0},
               fillColor={0,0,0},
               fillPattern=FillPattern.Solid),
        Ellipse(
               extent={{-35,-15},{-25,-25}},
               lineColor={0,0,0},
               fillColor={0,0,0},
               fillPattern=FillPattern.Solid),
        Ellipse(
               extent={{25,-15},{35,-25}},
               lineColor={0,0,0},
               fillColor={0,0,0},
               fillPattern=FillPattern.Solid)}),
         Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={2,2},
        initialScale=0.2), graphics={
        Polygon(points={{-40,25},{40,25},{50,15},{40,-20},{30,-25},{-30,-25},{-40,
       -20},{-50,15},{-40,25}},lineColor={0,0,0},fillColor={0,0,255},
              fillPattern=
               FillPattern.Solid),
        Ellipse(extent={{-32.5,7.5},{-27.5,12.5}},lineColor={0,0,0},fillColor={0,0,
               0},fillPattern=FillPattern.Solid),
        Ellipse(extent={{-2.5,12.5},{2.5,7.5}},lineColor={0,0,0},fillColor={0,0,0},
               fillPattern=FillPattern.Solid),
        Ellipse(extent={{27.5,12.5},{32.5,7.5}},lineColor={0,0,0},fillColor={0,0,0},
               fillPattern=FillPattern.Solid),
        Ellipse(extent={{-17.5,-7.5},{-12.5,-12.5}},lineColor={0,0,0},fillColor={0,
               0,0},fillPattern=FillPattern.Solid),
        Ellipse(extent={{12.5,-7.5},{17.5,-12.5}},lineColor={0,0,0},fillColor={0,0,
               0},fillPattern=FillPattern.Solid),
        Text(extent={{-150,70},{150,40}},lineColor={0,0,0},textString="%name")}),
         Documentation(info=
                       "<html>
        <p>
        This connector defines the \"expandable connector\" that
        is used as bus in the Physiomodel (www.physiomodel.org).
        Note, this connector is \"empty\". When using it, the actual content is
        constructed by the signals connected to this bus.
        </p>
        </html>"));

       end BusConnector;

     type Energy = Modelica.Units.SI.Energy (
                                           displayUnit="kcal", nominal=4186.8);
     type Time = Modelica.Units.SI.Time (
                                       displayUnit="min", nominal=60);
     type Frequency = Modelica.Units.SI.Frequency (
                                                 displayUnit="1/min");
     type Mass = Modelica.Units.SI.Mass (
                                       displayUnit="g", nominal=1e-3, min=0, max=Modelica.Constants.inf);
     type MassFraction = Modelica.Units.SI.MassFraction (
                                                       nominal=1e-2, min=ModelicaServices.Machine.small, max=Modelica.Constants.inf);
     type MassFlowRate = Modelica.Units.SI.MassFlowRate (
                                                       displayUnit="mg/min", nominal=(1e-6)/60);
     type Density = Modelica.Units.SI.Density (
                                             displayUnit="kg/l", nominal=1e-3);
     type MolarMass = Modelica.Units.SI.MolarMass (
                                                 displayUnit="kDa", nominal=1);
     type Height = Modelica.Units.SI.Height (
                                           displayUnit="cm", nominal=1e-2);
     type Position = Modelica.Units.SI.Position (
                                               displayUnit="cm", nominal=1e-2);
     type Velocity = Modelica.Units.SI.Velocity (
                                               displayUnit="km/h", nominal=1);
     type Acceleration = Modelica.Units.SI.Acceleration (
                                                       displayUnit="m/s2", nominal=1);
     type AbsolutePressure = Modelica.Units.SI.AbsolutePressure (
                                                               displayUnit="mmHg", nominal=101325, min=0, max=Modelica.Constants.inf);
     type Pressure =  Modelica.Units.SI.Pressure (
                                                displayUnit="mmHg", nominal=133.322387415);
     type Volume =  Modelica.Units.SI.Volume (
                                            displayUnit="ml", nominal=1e-6, min=0, max=Modelica.Constants.inf);
     type VolumeFlowRate = Modelica.Units.SI.VolumeFlowRate (
                                                           displayUnit="ml/min", nominal=(1e-6)/60);
     type VolumeFraction = Modelica.Units.SI.VolumeFraction (
                                                       nominal=1e-2, min=ModelicaServices.Machine.small, max=Modelica.Constants.inf);
     type MoleFraction = Modelica.Units.SI.MoleFraction (
                                                       nominal=1e-2, min=ModelicaServices.Machine.small, max=Modelica.Constants.inf);
     replaceable type Concentration = Modelica.Units.SI.Concentration(displayUnit="mmol/l", min=ModelicaServices.Machine.small, max=Modelica.Constants.inf) constrainedby Real;
     replaceable type AmountOfSubstance =
      Modelica.Units.SI.AmountOfSubstance (                                   displayUnit="mmol", min=0, max=Modelica.Constants.inf) constrainedby Real;
     replaceable type MolarFlowRate = Modelica.Units.SI.MolarFlowRate (
                                                                     displayUnit="mmol/min") constrainedby Real;
     replaceable type MolarEnergy = Modelica.Units.SI.MolarEnergy (
                                                                 displayUnit="kcal/mol", nominal=4186.8) constrainedby Real
       "chemical internal energy, chemical enthalpy, Gibb's energy ..";
     type MassConcentration =
      Modelica.Units.SI.MassConcentration (
                                         displayUnit="mg/l", nominal=1e-3, min=ModelicaServices.Machine.small, max=Modelica.Constants.inf);
     type Osmolarity = Modelica.Units.SI.Concentration(displayUnit="mosm/l", nominal=1, min=ModelicaServices.Machine.small, max=Modelica.Constants.inf);
     type Heat = Modelica.Units.SI.Heat (
                                       displayUnit="kcal", nominal=4186800); //needed to heat 1 liter of water by 1 degC
     type Temperature = Modelica.Units.SI.Temperature (
                                                     displayUnit="degC", nominal=1, min=0);
     type HeatFlowRate = Modelica.Units.SI.HeatFlowRate (
                                                       displayUnit="kcal/min", nominal=4186.8/60);
     type Power = Modelica.Units.SI.Power (
                                         displayUnit="kcal/min", nominal=4186.8/60);
     type PowerPerMass = Real(final quantity="Power per Mass",final unit="W/kg",displayUnit="cal/(g.min)", nominal=4.1868/(0.001*60));
     type ThermalConductance = Modelica.Units.SI.ThermalConductance (
                                                                   displayUnit="kcal/(min.K)", nominal=4186.8/60);
     type SpecificHeatCapacity = Modelica.Units.SI.SpecificHeatCapacity (
                                                                       displayUnit="kcal/(kg.K)", nominal=4186.8);
     type SpecificEnergy = Modelica.Units.SI.SpecificEnergy (
                                                           displayUnit="kcal/kg", nominal=4186.8)
       "vaporization, ..";
     type SpecificEnthalpy = Modelica.Units.SI.SpecificEnthalpy (
                                                           displayUnit="kcal/kg", nominal=1e5);
     type ElectricPotential = Modelica.Units.SI.ElectricPotential (
                                                                 displayUnit="mV", nominal=1e-3);
     type ElectricCharge = Modelica.Units.SI.ElectricCharge (
                                                           displayUnit="meq", nominal=1e-3);
     type VolumeDensityOfCharge =
      Modelica.Units.SI.VolumeDensityOfCharge (
                                             displayUnit="meq/l", nominal=(9.64853399*10^4));
     type ElectricCurrent = Modelica.Units.SI.ElectricCurrent (
                                                             displayUnit="meq/min", nominal=(9.64853399*10^4/1000)/60);
   //unknown units in Standard Modelica Library 3.2
     type Fraction = Real(final quantity="Fraction",final unit="1", displayUnit="%", nominal=1e-2);
     type pH =       Real(final quantity="pH",final unit="1",final displayUnit="1", nominal=7, min=0, max=14);
     type Permeability = Real(final quantity="Permeability", final unit="mol2.s-1.J-1", displayUnit="mol2.min-1.kJ-1", nominal=1e-6, min=0);
     type OsmoticPermeability = Real(final quantity="OsmoticPermeability",final unit="m3/(Pa.s)", displayUnit="ml/(mmHg.min)", nominal=(1e-6)/((133.322387415)*60), min=0);
     type DiffusionPermeability = Real(final quantity="DiffusionPermeability", final unit="m3/s", displayUnit="ml/min", nominal=(1e-6)/60, min=0);
     type HydraulicConductance = Real(final quantity="HydraulicConductance",final unit="m3/(Pa.s)", displayUnit="l/(mmHg.min)", nominal=(1e-3)/((133.322387415)*60), min=0);
     type HydraulicResistance = Real(final quantity="HydraulicConductance",final unit="(Pa.s)/m3", displayUnit="(mmHg.min)/l", nominal=(1e+3)*(133.322387415)*60, min=0);
     type HydraulicCompliance =  Real(final quantity="HydraulicCompliance",final unit="m3/Pa", displayUnit="ml/mmHg", nominal=(1e-6)/(133.322387415));
     type HydraulicElastance = Real(final quantity="HydraulicElastance",final unit="Pa/m3", displayUnit="mmHg/ml", nominal=(133.322387415)/(1e-6));
     type HydraulicInertance =  Real(final quantity="HydraulicInertance",final unit="Pa.s2/kg", displayUnit="mmHg.min2/g", nominal=((133.322387415)*(60^2)/(1e-3)));
     type GasSolubility = Real(final quantity="GasSolubility", final unit="(mol/m3)/(mol/m3)", displayUnit="(mmol/l)/kPa at 25degC", nominal=1e-2, min=0)
       "Gas solubility in liquid";
     type GasSolubilityPa = Real(final quantity="GasSolubilityPa", final unit="(mol/m3)/Pa", nominal=1e-4, min=0)
       "Gas solubility in liquid by partial pressure";
     type StoichiometricNumber = Modelica.Units.SI.StoichiometricNumber;// Integer(final quantity="StoichiometricNumber", min=1);

     type Population = Real (final quantity="Population", final unit="1", displayUnit="1", min=0)
       "Average number of population individuals";
     type PopulationChange = Real (final quantity="PopulationChange", final unit="1/s", displayUnit="1/d")
       "Average change of population individuals";
     type PopulationChangePerMember = Real (final quantity="PopulationChangePerMember", final unit="1/s", displayUnit="1/d")
       "Average change per population individual";
     type Area = Modelica.Units.SI.Area(displayUnit="cm2",nominal=1e-4)
       "Type for area";
     type Length = Modelica.Units.SI.Length(displayUnit="cm",nominal=1e-2)
       "Type for length and radius";
     type Enthalpy = Modelica.Units.SI.Enthalpy(displayUnit="kcal", nominal=4186.8) "Heat energy";
     type MolarEnthalpy = Modelica.Units.SI.MolarEnthalpy(displayUnit="kcal/mol", nominal=4186.8) "Heat energy of substance";
     annotation (Documentation(revisions="<html>
        <p>Copyright (c) 2017-2018, Marek Matej&aacute;k, http://www.physiolib.com </p>
        </html>"));
   end Types;

   package Blocks "Base Signal Blocks Library"
     extends Modelica.Icons.Package;
     package Math "Modelica.Math extension"
       extends Modelica.Icons.Package;
       model Integrator "Integrator with support of steady state calculation."
        // extends Physiolibrary.SteadyStates.Interfaces.SteadyState(state_start=
        //       y_start, state(nominal=NominalValue));

      parameter Real k=1 "Integrator gain";

      parameter Real y_start=0
        "Initial or guess value of output (= state)"
        annotation (Dialog(group="Initialization"));
      extends Modelica.Blocks.Interfaces.SISO(
                                          u(nominal=NominalValue/k),y(start=y_start,nominal=NominalValue));

      parameter Real NominalValue=1
        "Numerical scale. For some substances such as hormones, hydronium or hydroxide ions should be set."
        annotation (HideResult=true, Dialog(tab="Solver", group=
              "Numerical support of very small concentrations"));
       equation
      //state = y;  //
      der(y) = k*u;
      //change = k*u;

      annotation (
        defaultComponentName="int",
        Documentation(info=
                       "<html>
	<p>
	This blocks computes output <b>y</b> (element-wise) as
	<i>integral</i> of the input <b>u</b> multiplied with
	the gain <i>k</i>:
	</p>
	<pre>
		 k
	     y = - u
		 s
	</pre>

	<p>
	It might be difficult to initialize the integrator in steady state.
	This is discussed in the description of package
	<a href=\"Modelica://Modelica.Blocks.Continuous#info\">Continuous</a>.
	</p>

	</html>
	"),       Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={2,2}), graphics={
        Line(points={{-80,78},{-80,-90}}, color={192,192,192}),
        Polygon(points={{-80,90},{-88,68},{-72,68},{-80,90}},lineColor={192,192,
              192},fillColor={192,192,192},fillPattern=FillPattern.Solid),
        Line(points={{-90,-80},{82,-80}}, color={192,192,192}),
        Polygon(points={{90,-80},{68,-72},{68,-88},{90,-80}},lineColor={192,192,
              192},fillColor={192,192,192},fillPattern=FillPattern.Solid),
        Text(extent={{0,-10},{60,-70}},lineColor={192,192,192},textString="I"),
        Text(extent={{-150,-150},{150,-110}},lineColor={0,0,0},textString=
              "k=%k"),
        Line(points={{-80,-80},{80,80}}, color={0,0,127})}),
        Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={2,2}), graphics={
        Rectangle(extent={{-60,60},{60,-60}}, lineColor={0,0,255}),
        Line(points={{-100,0},{-60,0}}, color={0,0,255}),
        Line(points={{60,0},{100,0}}, color={0,0,255}),
        Text(extent={{-36,60},{32,2}},lineColor={0,0,0},textString="k"),
        Text(extent={{-32,0},{36,-58}},lineColor={0,0,0},textString="s"),
        Line(points={{-46,0},{46,0}})}));
       end Integrator;

       block Add "u + parameter"

             parameter Real k(start=1) "value added to input signal";
    public
             Modelica.Blocks.Interfaces.RealInput u "Input signal connector"
               annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
             Modelica.Blocks.Interfaces.RealOutput y "Output signal connector"
               annotation (Placement(transformation(extent={{100,-10},{120,10}})));

       equation
             y = k+u;
             annotation (defaultComponentName="add",
               Documentation(info="<html>
	<p>This block computes output <i>y</i> as <i>sum</i> of offset <i>k</i> with the input <i>u</i>: </p>
	<p><code>    y = k + u;</code> </p>
	</html>"),           Icon(coordinateSystem(
               preserveAspectRatio=false,
               extent={{-100,-100},{100,100}},
               grid={2,2}), graphics={
               Polygon(
          points={{-100,100},{100,40},{100,-40},{-100,-100},{-100,100}},
          lineColor={0,0,127},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
               Text(
          extent={{-100,-42},{100,40}},
          lineColor={0,0,0},
          textString="u+%k"),
               Text(
          extent={{-150,140},{150,100}},
          textString="%name",
          lineColor={0,0,255})}),
               Diagram(coordinateSystem(
               preserveAspectRatio=true,
               extent={{-100,-100},{100,100}},
               grid={2,2}), graphics={Polygon(
          points={{-100,-100},{-100,100},{100,0},{-100,-100}},
          lineColor={0,0,127},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid), Text(
          extent={{-76,38},{0,-34}},
          lineColor={0,0,255},
          textString="k")}));
       end Add;

       block Reciprocal "1 / u"
             extends Modelica.Blocks.Interfaces.SISO;
       equation
             y = 1/u;
             annotation (defaultComponentName="rec",
               Icon(coordinateSystem(
               preserveAspectRatio=true,
               extent={{-100,-100},{100,100}},
               grid={2,2}), graphics={Text(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          textString="1/u")}),
               Documentation(info="<html>
	<p>This blocks computes the output <b>y</b> as <i>reciprocal value</i> of the input <b>u</b>: </p>
	<p><code>    y = 1 / u ;</code> </p>
	</html>"));
       end Reciprocal;

       block Power "b ^ u"

             parameter Boolean useBaseInput = false
           "=true, if exponential base input is used instead of parameter Base"
             annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="Conditional inputs"));

                   parameter Real Base=10 "exponential base if useBaseInput=false"
                     annotation (Dialog(enable=not useBaseInput));

                   Modelica.Blocks.Interfaces.RealOutput y
                     annotation (Placement(transformation(extent={{100,-10},{120,10}})));
                   Modelica.Blocks.Interfaces.RealInput base(start=Base) = b if useBaseInput annotation (Placement(
                         transformation(extent={{-120,40},{-80,80}})));
                   Modelica.Blocks.Interfaces.RealInput exponent annotation (Placement(
                         transformation(extent={{-120,-80},{-80,-40}})));

    protected
                   Real b "Current exponential base";
       equation
                   if not useBaseInput then
                     b = Base;
                   end if;

                   y = b^exponent;
                    annotation (defaultComponentName="pow",
                     Documentation(info="<html>
<p>y = base^exponent</p>
</html>"),           Icon(coordinateSystem(
                     preserveAspectRatio=true,
                     extent={{-100,-100},{100,100}},
                     grid={2,2},
                         initialScale=0.04), graphics={Rectangle(
                       extent={{-100,-100},{100,100}},
                       lineColor={0,0,127},
                       fillColor={255,255,255},
                       fillPattern=FillPattern.Solid), Text(
                       extent={{-100,-40},{100,40}},
                       lineColor={0,0,0},
                           textString="b^u")}));
       end Power;

      block Min "Pass through the smallest signal"
        extends Modelica.Blocks.Interfaces.MISO;
      equation
         y = min(u);
        annotation (defaultComponentName="min", Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={Text(
                extent={{-90,36},{90,-36}},
                lineColor={160,160,164},
                textString="min()")}),
                                Documentation(info="<html>
<p>
This block computes the output <b>y</b> as <i>minimum</i> of
the Real inputs <b>u[1]</b>,<b>u[2]</b> .. <b>u[nin]</b>:
</p>
<pre>    y = <b>min</b> ( u );
</pre>
</html>
"));
      end Min;

          block Log10AsEffect "min( 0, log10(u) )"

            extends Modelica.Blocks.Interfaces.SISO;
          equation
            y = if u>1 then Modelica.Math.log10(u) else 0;
            annotation (defaultComponentName="logEffect",
              Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={
              Polygon(
                points={{90,0},{68,8},{68,-8},{90,0}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),
              Line(points={{-90,0},{68,0}}, color={192,192,192}),
              Polygon(
                points={{-80,90},{-88,68},{-72,68},{-80,90}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),
              Line(points={{-80,-80},{-80,68}}, color={192,192,192}),
              Text(
                extent={{-44,-56},{94,-80}},
                lineColor={192,192,192},
                textString="max(log10,0)"),
              Line(points={{-100,0},{-80,0},{-78,0},{-74,0},{-76,0},{-74,0},{-72,
                    0},{-69.5,6.08},{-64.7,15.9},{-57.5,26},{-47,36.1},{-31.8,
                    46.1},{-10.1,56},{22.1,66},{68.7,76.1},{80,78}}, color={0,0,
                    0})}),
              Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={
              Line(points={{-80,80},{-88,80}}, color={192,192,192}),
              Line(points={{-80,-80},{-88,-80}}, color={192,192,192}),
              Line(points={{-80,-90},{-80,84}}, color={192,192,192}),
              Text(
                extent={{-65,96},{-38,78}},
                lineColor={160,160,164},
                textString="y"),
              Polygon(
                points={{-80,100},{-86,84},{-74,84},{-80,100}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),
              Line(points={{-100,0},{84,0}}, color={192,192,192}),
              Polygon(
                points={{100,0},{84,6},{84,-6},{100,0}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),
              Line(points={{-100,0},{-80,0},{-78,0},{-74,0},{-76,0},{-74,0},{-72,
                    0},{-69.5,6.08},{-64.7,15.9},{-57.5,26},{-47,36.1},{-31.8,
                    46.1},{-10.1,56},{22.1,66},{68.7,76.1},{80,78}}, color={0,0,
                    0}),
              Text(
                extent={{70,-3},{90,-23}},
                textString="20",
                lineColor={0,0,255}),
              Text(
                extent={{-78,-1},{-58,-21}},
                textString="1",
                lineColor={0,0,255}),
              Text(
                extent={{-109,72},{-89,88}},
                textString=" 1.3",
                lineColor={0,0,255}),
              Text(
                extent={{-109,-88},{-89,-72}},
                textString="-1.3",
                lineColor={0,0,255}),
              Text(
                extent={{62,30},{90,10}},
                lineColor={160,160,164},
                textString="u")}),
              Documentation(info="<html>
<p>This blocks computes the output <b>y</b> as the <i>base 10 logarithm</i> of the input <b>u </b>if <b>u&gt;1</b> or 0 otherwise </p>
<p><code>    y = if(u&gt;1) <b>log10</b>( u ) else 0;</code></p>
</html>"));
          end Log10AsEffect;

          block Parts "Divide the input value by weights"
            extends Modelica.Blocks.Interfaces.SIMO;
            parameter Real w[nout]=ones(nout) "Optional: weight coefficients";
    protected
           Real coef;
           Real weight[nout];
          equation
            ones(nout)*weight = 1;
            for i in 1:nout loop
                weight[i] = w[i] * coef;
                y[i] = u * weight[i];
            end for;
            annotation (defaultComponentName="parts",
              Documentation(info="<html>
<p>This blocks divide input value u to output array y by weights. The sum of output values is equal to input value <b>u</b>: </p>
<p><code>    u = (w[1]*y[1] + w[2]*y[2] + ... + w[n]*y[n]) / (w[1] + w[2] + ... + w[n]);</code></p>
<p>Example: </p>
<pre>     parameter:   nin = 3;  w=ones(3);

  results in the following equations:

<p><code>     y[1]=u/3,  y[2]=u/3,  y[3]=u/3;</code> </p>
</html>"),    Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={Text(
                extent={{-100,-100},{100,100}},
                lineColor={0,0,0},
                textString="Parts")}));
          end Parts;

          block HomotopyStrongComponentBreaker
      "Break the strong component in normalized signal with independent default constant value"
            extends Modelica.Blocks.Interfaces.SISO;
            parameter Real defaultValue=1;
            parameter Real defaultSlope=0;
          equation
            y = homotopy(u,defaultValue + defaultSlope*(u-defaultValue));
            //y = homotopy(u,defaultValue);
             annotation (defaultComponentName="homotopy",
              Documentation(info="<html>
<p>This blocks should solve the initial strong component problem. In the non-linear-strong-component-cycled place, where the default or mean value of variable is known.</p>
<p>For example the regulation loop L driven by loop-dependent effect E with default value 1:</p>
<p> </p>
<p>E=f(L(E)) can be rewritten to E=f(L( H )), where H is output from this block with input E. </p>
</html>"),    Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2},
                  initialScale=0.04), graphics={Text(
                extent={{-100,-24},{96,20}},
                lineColor={0,0,255},
                    textString="Homotopy")}),
              Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2},
                  initialScale=0.04), graphics={Rectangle(
                extent={{-100,-100},{100,100}},
                lineColor={0,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{-98,-18},{98,26}},
                lineColor={0,0,255},
                    textString="Homotopy")}));
          end HomotopyStrongComponentBreaker;

          block DegradationGain "Output the degradation flow from HalfTime and the amount as the input signal"

            parameter Physiolibrary.Types.Time HalfTime
          "Half time to compute degradation from amount or mass";
    public
            Modelica.Blocks.Interfaces.RealInput u "Input signal connector" annotation (
                Placement(transformation(extent={{-140,-20},{-100,20}})));
            Modelica.Blocks.Interfaces.RealOutput y "Output signal connector" annotation (
               Placement(transformation(extent={{100,-10},{120,10}})));

          equation
            y = (Modelica.Math.log(2)/HalfTime)*u;
            annotation (
              Documentation(info="<html>
<p>
This block computes output <i>y</i> as
<i>product</i> of gain <i>k</i> with the
input <i>u</i>:
</p>
<pre>
    y = k * u;
</pre>

</html>"),           Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}}), graphics={
              Polygon(
                points={{-100,-100},{-100,100},{100,0},{-100,-100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-150,140},{150,100}},
                textString="%name",
                lineColor={0,0,255})}),
              Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}}), graphics={Polygon(
                points={{-100,-100},{-100,100},{100,0},{-100,-100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{-76,38},{0,-34}},
                textString="k",
                lineColor={0,0,255})}));
          end DegradationGain;

          block FractionGain "Output the fraction of the input signal"

            parameter Physiolibrary.Types.Fraction f
          "Half time to compute degradation from amount or mass";
    public
            Modelica.Blocks.Interfaces.RealInput u "Input signal connector" annotation (
                Placement(transformation(extent={{-140,-20},{-100,20}})));
            Modelica.Blocks.Interfaces.RealOutput y "Output signal connector" annotation (
               Placement(transformation(extent={{100,-10},{120,10}})));

          equation
            y = f*u;
            annotation (
              Documentation(info="<html>
<p>
This block computes output <i>y</i> as
<i>product</i> of gain <i>k</i> with the
input <i>u</i>:
</p>
<pre>
    y = k * u;
</pre>

</html>"),           Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}}), graphics={
              Polygon(
                points={{-100,-100},{-100,100},{100,0},{-100,-100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-150,140},{150,100}},
                textString="%name",
                lineColor={0,0,255})}),
              Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}}), graphics={Polygon(
                points={{-100,-100},{-100,100},{100,0},{-100,-100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{-76,38},{0,-34}},
                textString="k",
                lineColor={0,0,255})}));
          end FractionGain;
     end Math;

    package Interpolation "Empirical Dependence of Two Variables"
      extends Modelica.Icons.Package;
     function Spline "Cubic spline interpolation function"

          input Real[:] x "x coordinations of interpolating points"; //souradnice x souradnice uzlovych bodu
          input Real[:,4] a
          "cubic polynom coefficients of curve segments between interpolating points";                   //parametry kubiky

          input Real xVal "input value of x to calculate y value"; //vstupni hodnota

          output Real yVal "y value at xVal";
     //     output Real outExtra;
    protected
        Integer index "index of segment";
        Integer n "number of interpolating points";

     algorithm
            // Najdi interval, ve kterem se nachazi xVal

            if (xVal <= x[1]) then //kdyz je hodnota xVal pred prvnim uzlovym bodem

              yVal := xVal * a[1,3] + a[1,4]; //pocitam primku

            else
              n := size(x,1); //pocet uzlovych bodu
              if (xVal>=x[n]) then //kdyz je hodnota xVal za poslednim uzlovym bodem

                 yVal := xVal * a[n+1,3] + a[n+1,4];  //pocitam primku

            else
              index := 2;
              while  xVal > x[index] and index < n loop
                index:=index+1;
              end while;
              yVal := ((a[index,1]*xVal + a[index,2])*xVal + a[index,3])*xVal + a[index,4];

              /*
         x1:=x[index-1];
         x2:=x[index];
         y1:=y[index-1];
         y2:=y[index];
         slope1:=slope[index-1];
         slope2:=slope[index];

         a1:=-(-x2*slope2 - x2*slope1 + slope2*x1 + slope1*x1 + 2*y2 - 2*y1)/(x2 - x1)^3;
         a2:=(-x2^2*slope2-2*x2^2*slope1-3*x2*y1+x2*slope1*x1+3*x2*y2-x2*slope2*x1-3*y1*x1+slope1*x1^2+3*y2*x1+2*slope2*x1^2)/(x2-x1)^3;
         a3:=-(-slope1*x2^3-2*x2^2*slope2*x1-x2^2*slope1*x1+x2*slope2*x1^2+2*x2*slope1*x1^2+6*x2*x1*y2-6*x2*x1*y1+slope2*x1^3)/(x2-x1)^3;
         a4:=(-slope1*x2^3*x1+y1*x2^3-slope2*x1^2*x2^2+slope1*x1^2*x2^2-3*y1*x2^2*x1+3*y2*x1^2*x2+slope2*x1^3*x2-y2*x1^3)/(x2-x1)^3;

         yVal :=a1*(xVal)^3 + a2*(xVal)^2 + a3*(xVal) + a4;
         */
              end if;
           end if;
       //    outExtra := xVal + yVal;
          annotation(derivative(noDerivative=x,noDerivative=a) = Spline_der,
                        Documentation(revisions="<html>
<p>author: Ondrej Vacek</p>
</html>"));
     end Spline;

     function SplineCoefficients "Cubic spline interpolation coefficients"

          input Real[:] x "x coordinations of interpolating points";
          input Real[:] y "y coordinations of interpolating points";
          input Real[:] slope "slopes at interpolating points";

          output Real[size(x,1)+1,4] a
          "cubic polynom coefficients of curve segments between interpolating points";                               //pocet hodnot ctyrech parametru kubiky je o jeden vic nez pocet bodu

    protected
        Integer n "number of interpolating points";
        Integer i "index of segment";

        Real x1 "previos point";
        Real x2 "current point";

        Real y1 "previous point";
        Real y2 "current point";
        Real slope1 "previous point";
        Real slope2 "current point";

     algorithm
        n := size(x,1);//pocet uzlovych bodu
        for i in 2:n loop //cyklus od 2 do n
              x1:=x[i-1]; //predchozi bod
              x2:=x[i];  //soucasny bod
              y1:=y[i-1]; //predchozi bod
              y2:=y[i]; //soucasny bod
              slope1:=slope[i-1]; //predchozi bod
              slope2:=slope[i]; //soucasny bod
              //vypocty parametru kubiky (od 2 do n) podle souradnic a smernic dvou bodu : y=a[i,4]+a[i,3]*x+a[i,2]*x^2+a[i,1]*x^3
              a[i,1]:=-(-x2*slope2 - x2*slope1 + x1*slope2 + x1*slope1 + 2*y2 - 2*y1)/((x2 - x1)^3);
              a[i,2]:=(-(x2^2)*slope2-2*(x2^2)*slope1-3*x2*y1+x2*slope1*x1+3*x2*y2-x2*slope2*x1-3*y1*x1+slope1*(x1^2)+3*y2*x1+2*slope2*(x1^2))/((x2-x1)^3);
              a[i,3]:=-(-slope1*(x2^3)-2*(x2^2)*slope2*x1-(x2^2)*slope1*x1+x2*slope2*(x1^2)+2*x2*slope1*(x1^2)+6*x2*x1*y2-6*x2*x1*y1+slope2*(x1^3))/((x2-x1)^3);
              a[i,4]:=(-slope1*(x2^3)*x1+y1*(x2^3)-slope2*(x1^2)*(x2^2)+slope1*(x1^2)*(x2^2)-3*y1*(x2^2)*x1+3*y2*(x1^2)*x2+slope2*(x1^3)*x2-y2*(x1^3))/((x2-x1)^3);
        end for;
        a[1,  :] := { 0, 0, slope[1], y[1] - x[1]*slope[1]}; //vypocet prvni sady parametru kubiky  - primky
        a[n+1,:] := { 0, 0, slope[n], y[n] - x[n]*slope[n]}; //vypocet posledni sady parametru kubiky - primky

            annotation (Documentation(revisions="<html>
<p>author: Ondrej Vacek</p>
</html>"));
     end SplineCoefficients;

          model Curve
            "2D natural cubic interpolation spline defined with (x,y,slope) points"

               parameter Real x[:] = fill(Modelica.Constants.N_A,1)
          "x coordinations of interpolating points";
               parameter Real y[:] = fill(Modelica.Constants.N_A,1)
          "y coordinations of interpolating points";
               parameter Real slope[:] = fill(Modelica.Constants.N_A,1)
          "slopes at interpolating points";

               parameter Real[:,3] data = transpose({x,y,slope})
          "Array of interpolating points as {x,y,slope}";

              parameter Real Xscale = 1 "conversion scale to SI unit of x values";
              parameter Real Yscale = 1 "conversion scale to SI unit of y values";

               Modelica.Blocks.Interfaces.RealInput u
                            annotation (Placement(transformation(extent={{-120,
                  -20},{-80,20}})));
               Modelica.Blocks.Interfaces.RealOutput val
                               annotation (Placement(transformation(extent={{80,-20},
                  {120,20}})));

    protected
              parameter Real a[:,:] = SplineCoefficients( data[:, 1]*Xscale,data[:, 2]*Yscale,data[:, 3]*Yscale/Xscale)
          "cubic polynom coefficients of curve segments between interpolating points";

          equation
            val = Spline(
                  data[:, 1]*Xscale,
                  a,
                  u);

             annotation ( Icon(coordinateSystem(
                preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
              graphics={
              Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(
                points={{-70,-76},{-20,-48},{0,12},{34,62},{76,72}},
                color={0,0,127},
                smooth=Smooth.Bezier),
              Line(
                points={{-48,-82},{-48,90},{-48,90}},
                color={0,0,127},
                smooth=Smooth.Bezier,
                arrow={Arrow.None,Arrow.Filled}),
              Line(
                points={{-72,-74},{68,-74},{68,-74}},
                color={0,0,127},
                smooth=Smooth.Bezier,
                arrow={Arrow.None,Arrow.Filled})}));
          end Curve;

     function Spline_der
       "Derivative of Cubic spline interpolation function"

          input Real[:] x "x coordinations of interpolating points"; //souradnice x souradnice uzlovych bodu
          input Real[:,4] a
          "cubic polynom coefficients of curve segments between interpolating points";                   //parametry kubiky

          input Real xVal "input value of x to calculate y value"; //vstupni hodnota

          input Real xVal_der;

          output Real yVal_der "derivative y at xVal";

    protected
        Integer index "index of segment";
        Integer n "number of interpolating points";

     algorithm
            // Najdi interval, ve kterem se nachazi xVal

            if (xVal <= x[1]) then //kdyz je hodnota xVal pred prvnim uzlovym bodem

              //yVal := xVal * a[1,3] + a[1,4]; //pocitam primku
              yVal_der := xVal_der * a[1,3];

            else
              n := size(x,1); //pocet uzlovych bodu
              if (xVal>=x[n]) then //kdyz je hodnota xVal za poslednim uzlovym bodem

                 //yVal := xVal * a[n+1,3] + a[n+1,4];  //pocitam primku
                 yVal_der := xVal_der * a[n+1,3];

            else
              index := 2;
              while  xVal > x[index] and index < n loop
                index:=index+1;
              end while;
              //yVal := ((a[index,1]*xVal + a[index,2])*xVal + a[index,3])*xVal + a[index,4];

              yVal_der := ( (a[index,1]*xVal_der) * xVal +
                            (a[index,1]*xVal + a[index,2]) * xVal_der)        * xVal +
                          ( (a[index,1]*xVal + a[index,2])*xVal + a[index,3]) * xVal_der;

              /*
         x1:=x[index-1];
         x2:=x[index];
         y1:=y[index-1];
         y2:=y[index];
         slope1:=slope[index-1];
         slope2:=slope[index];

         a1:=-(-x2*slope2 - x2*slope1 + slope2*x1 + slope1*x1 + 2*y2 - 2*y1)/(x2 - x1)^3;
         a2:=(-x2^2*slope2-2*x2^2*slope1-3*x2*y1+x2*slope1*x1+3*x2*y2-x2*slope2*x1-3*y1*x1+slope1*x1^2+3*y2*x1+2*slope2*x1^2)/(x2-x1)^3;
         a3:=-(-slope1*x2^3-2*x2^2*slope2*x1-x2^2*slope1*x1+x2*slope2*x1^2+2*x2*slope1*x1^2+6*x2*x1*y2-6*x2*x1*y1+slope2*x1^3)/(x2-x1)^3;
         a4:=(-slope1*x2^3*x1+y1*x2^3-slope2*x1^2*x2^2+slope1*x1^2*x2^2-3*y1*x2^2*x1+3*y2*x1^2*x2+slope2*x1^3*x2-y2*x1^3)/(x2-x1)^3;

         yVal :=a1*(xVal)^3 + a2*(xVal)^2 + a3*(xVal) + a4;
         */
              end if;
           end if;
       //    outExtra := xVal + yVal;
            annotation (Documentation(revisions="<html>
<p>author: Ondrej Vacek</p>
</html>"));
     end Spline_der;
    end Interpolation;

    package Factors "Multiplication Effects"
      extends Modelica.Icons.Package;
      model Normalization "effect = u/NormalValue"
       extends Physiolibrary.Icons.BaseFactorIcon;

       parameter Real NormalValue=1
          "Normal value of u, because y=(u/NormalValue)*yBase.";

       parameter Boolean enabled=true "disabled => y=yBase";

       Modelica.Blocks.Interfaces.RealInput u
                    annotation (Placement(transformation(extent={{-100,-20},{-60,
                  20}})));

        Physiolibrary.Types.Fraction effect;
      equation
        effect = if enabled then u/NormalValue else 1;
        y=effect*yBase;
        annotation ( Documentation(revisions="<html>
<p><i>2009-2018</i></p>
<p>Marek Matejak, marek@matfyz.cz </p>
</html>", info="<html>
<p><h4>y = yBase * u</h4></p>
</html>"));
      end Normalization;

      model DamagedFraction "effect = 1 - DamagedAreaFraction"
       extends Physiolibrary.Icons.BaseFactorIcon;

       parameter Physiolibrary.Types.Fraction DamagedAreaFraction=0;

        Physiolibrary.Types.Fraction effect;
      equation
        effect = 1-DamagedAreaFraction;
        y=yBase*effect;
      end DamagedFraction;

      model Spline "effect = spline(data,u)"
       extends Physiolibrary.Icons.BaseFactorIcon4;
       Modelica.Blocks.Interfaces.RealInput u(nominal=Xscale)
                    annotation (Placement(transformation(extent={{-100,-20},{-60,
                  20}})));

       parameter Boolean enabled=true "disabled => y=yBase";

       parameter Real[:,3] data = {{0,0,0}} "Array of interpolating points as {x,y,slope}";

       parameter Real Xscale = 1 "conversion scale to SI unit of x values";
       parameter Real Yscale = 1 "conversion scale to SI unit of y values";

       parameter Boolean UsePositiveLog10 = false
          "x = if u/scaleX <=1 then 0 else log10(u/scaleX)";

        Physiolibrary.Types.Fraction effect
          "Multiplication coeffecient for yBase to reach y";

    protected
          parameter Real a[:,:] = if enabled then Interpolation.SplineCoefficients(
                                                            data[:, 1],data[:, 2]*Yscale,data[:, 3]*Yscale) else zeros(1,1)
          "Cubic polynom coefficients of curve segments between interpolating points";

      equation
        effect = if not enabled then 1 elseif UsePositiveLog10 then Interpolation.Spline(data[:, 1],a,if u/Xscale <= 1 then 0 else log10(u/Xscale))
         else Interpolation.Spline(data[:, 1],a,u/Xscale);

        y=effect*yBase;
        annotation ( Documentation(revisions="<html>
<p><i>2009-2018</i></p>
<p>Marek Matejak, marek@matfyz.cz </p>
</html>"));
      end Spline;

      model LagSpline "Adapt the input signal before interpolation"
       extends Physiolibrary.Icons.BaseFactorIcon5;
       Modelica.Blocks.Interfaces.RealInput u
                    annotation (Placement(transformation(extent={{-100,-20},{-60,
                  20}})));

       parameter Boolean enabled=true "disabled => y=yBase";

       parameter Physiolibrary.Types.Time HalfTime(displayUnit="min")=1;
                                                         //=3462.468;

       parameter Real initialValue = 1 "as u/Xscale";

       parameter Real Xscale = 1 "conversion scale to SI unit of x values";
       parameter Real Yscale = 1 "conversion scale to SI unit of y values";

       parameter Boolean UsePositiveLog10 = false
          "x = if u_delayed/scaleX <=1 then 0 else log10(u_delayed/scaleX)";

       parameter Real[:,3] data = {{0,0,0}};
        Blocks.Math.Integrator integrator(
          k=(Modelica.Math.log(2)/HalfTime),
          y_start=initialValue*Xscale,
          NominalValue=Xscale) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-38,38})));
        Modelica.Blocks.Math.Feedback feedback annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-38,68})));
        Physiolibrary.Types.Fraction effect;
        Spline spline(
          data=data,
          Xscale=Xscale,
          Yscale=Yscale,
          UsePositiveLog10=UsePositiveLog10,
          enabled=enabled)
          annotation (Placement(transformation(extent={{-10,-18},{10,2}})));
      equation
        effect = spline.effect;
        connect(feedback.y, integrator.u) annotation (Line(
            points={{-38,59},{-38,50}},
            color={0,0,127}));
        connect(integrator.y, feedback.u2) annotation (Line(
            points={{-38,27},{-38,16},{-62,16},{-62,68},{-46,68}},
            color={0,0,127}));
        connect(feedback.u1, u) annotation (Line(
            points={{-38,76},{-38,94},{-88,94},{-88,0},{-80,0}},
            color={0,0,127}));
        connect(integrator.y, spline.u) annotation (Line(
            points={{-38,27},{-38,-8},{-8,-8}},
            color={0,0,127}));
        connect(yBase, spline.yBase) annotation (Line(
            points={{0,20},{0,-6}},
            color={0,0,127}));
        connect(spline.y, y) annotation (Line(
            points={{0,-12},{0,-40}},
            color={0,0,127}));
        annotation ( Documentation(revisions="<html>
<p><i>2009-2018</i></p>
<p>Marek Matejak, marek@matfyz.cz </p>
</html>",   info="<html>
<p>If the input signal u is constant and it is different from starting delayed input d, the middle value between u and d will be reached after HalfTime.</p>
<p>The mathematical background:</p>
<p>d&apos;(t) = k*(u(t) - d(t))       =&gt;       The solution of d(t) in special case, if u(t) is constant at each time t:  d(t)=u+(d(0)-u)*e^(-k*t),  where the definition of HalfTime is  d(HalfTime) = d(0) + (d(0)-u)/2.</p>
</html>"));
      end LagSpline;

      model SplineLag "Adapt the effect after interpolation"
       extends Physiolibrary.Icons.BaseFactorIcon3;
       Modelica.Blocks.Interfaces.RealInput u
                    annotation (Placement(transformation(extent={{-100,-20},{-60,
                  20}})));

       parameter Boolean enabled=true "disabled => y=yBase";

       parameter Physiolibrary.Types.Time HalfTime(displayUnit="d")=1;
                                                      //Tau(unit="day");

       parameter String stateName=getInstanceName()
          "Name in Utilities input/output function"
           annotation (Evaluate=true, HideResult=true, Dialog(group="Value I/O",tab="IO"));

       parameter Real Xscale = 1 "conversion scale to SI unit of x values";

       parameter Boolean UsePositiveLog10 = false
          "x = if u/scaleX <=1 then 0 else log10(u/scaleX)";

       parameter Real[:,3] data = {{0,0,0}};
        Modelica.Blocks.Math.Product product annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={0,-32})));
        Blocks.Math.Integrator integrator(
          y_start=1,
          k=(Modelica.Math.log(2)/HalfTime))
                               annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-26,12})));
        Modelica.Blocks.Math.Feedback feedback annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-26,44})));
        Physiolibrary.Types.Fraction effect;
        Spline spline(
          data=data,
          Xscale=Xscale,
          UsePositiveLog10=UsePositiveLog10,
          enabled=enabled)
          annotation (Placement(transformation(extent={{-36,56},{-16,76}})));
        Physiolibrary.Types.Constants.FractionConst fraction(k(displayUnit="1")=
               1)
          annotation (Placement(transformation(extent={{-44,82},{-36,90}})));
      equation
        //der(effect) = (ln(2)/HalfTime)*(spline(data,u)-effect)
        effect = integrator.y;
        connect(yBase, product.u1) annotation (Line(
            points={{0,20},{0,30},{0,-20},{6,-20}},
            color={0,0,127}));
        connect(product.y, y) annotation (Line(
            points={{-2.02067e-015,-43},{-2.02067e-015,-55.5},{0,-55.5},{0,-40}},
            color={0,0,127}));
        connect(feedback.y, integrator.u) annotation (Line(
            points={{-26,35},{-26,24}},
            color={0,0,127}));
        connect(integrator.y, feedback.u2) annotation (Line(
            points={{-26,1},{-26,-8},{-50,-8},{-50,44},{-34,44}},
            color={0,0,127}));
        connect(integrator.y, product.u2) annotation (Line(
            points={{-26,1},{-26,-8},{-6,-8},{-6,-20}},
            color={0,0,127}));
        connect(feedback.u1, spline.y) annotation (Line(
            points={{-26,52},{-26,62}},
            color={0,0,127}));
        connect(u, spline.u) annotation (Line(
            points={{-80,0},{-82,0},{-82,66},{-34,66}},
            color={0,0,127}));
        connect(fraction.y, spline.yBase) annotation (Line(
            points={{-35,86},{-26,86},{-26,68}},
            color={0,0,127}));
        annotation ( Documentation(revisions="<html>
<p><i>2009-2018</i></p>
<p>Marek Matejak, marek@matfyz.cz </p>
</html>"));
      end SplineLag;

      model SplineLagOrZero "LagSpline if not Failed"
       extends Physiolibrary.Icons.BaseFactorIcon2;
       Modelica.Blocks.Interfaces.RealInput u
                    annotation (Placement(transformation(extent={{-120,-40},{-80,
                  0}}), iconTransformation(extent={{-120,-40},{-80,0}})));

       parameter Boolean enabled=true "disabled => y=yBase";

       parameter Physiolibrary.Types.Time HalfTime(displayUnit="d")=1;
       parameter Real[:,3] data= {{0,0,0}};

       parameter String stateName=getInstanceName()
          "Name in Utilities input/output function"
           annotation (Evaluate=true, HideResult=true, Dialog(group="Value I/O",tab="IO"));

       parameter Real Xscale = 1 "conversion scale to SI unit of x values";

        Interpolation.Curve
                     curve(
        x=data[:, 1],
        y=data[:, 2],
        slope=data[:, 3],
          Xscale=Xscale)
          annotation (Placement(transformation(extent={{-76,-10},{-56,10}})));
        Modelica.Blocks.Math.Product product annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={0,-50})));
        Blocks.Math.Integrator integrator(
          y_start=1,
          k=(Modelica.Math.log(2)/HalfTime))
                               annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-14,-6})));
        Modelica.Blocks.Math.Feedback feedback annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-14,26})));
        Modelica.Blocks.Logical.Switch switch1
          annotation (Placement(transformation(extent={{-48,40},{-28,60}})));
        Modelica.Blocks.Sources.Constant      Constant1(k=0)
          annotation (Placement(transformation(extent={{-70,52},{-58,64}})));
        Modelica.Blocks.Interfaces.BooleanInput
                                              Failed
                            annotation (Placement(transformation(extent={{-120,20},{-80,
                  60}})));
         Physiolibrary.Types.Fraction effect;
        Modelica.Blocks.Logical.Switch switch2
          annotation (Placement(transformation(extent={{-24,90},{-4,70}})));
        Physiolibrary.Types.Constants.OneConst One
          annotation (Placement(transformation(extent={{-60,78},{-40,98}})));
        Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=enabled)
          annotation (Placement(transformation(extent={{-96,62},{-76,82}})));
      equation
        effect = integrator.y;
        connect(curve.u, u) annotation (Line(
            points={{-76,0},{-88,0},{-88,-20},{-100,-20}},
            color={0,0,127}));
        connect(yBase, product.u1) annotation (Line(
            points={{0,60},{0,31},{0,-38},{6,-38}},
            color={0,0,127}));
        connect(product.y, y) annotation (Line(
            points={{-2.02067e-015,-61},{-2.02067e-015,-55.5},{0,-55.5},{0,-60}},
            color={0,0,127}));
        connect(feedback.y, integrator.u) annotation (Line(
            points={{-14,17},{-14,6}},
            color={0,0,127}));
        connect(integrator.y, feedback.u2) annotation (Line(
            points={{-14,-17},{-14,-26},{-38,-26},{-38,26},{-22,26}},
            color={0,0,127}));
        connect(integrator.y, product.u2) annotation (Line(
            points={{-14,-17},{-14,-26},{-6,-26},{-6,-38}},
            color={0,0,127}));
        connect(curve.val, switch1.u3) annotation (Line(
            points={{-56,0},{-54,0},{-54,42},{-50,42}},
            color={0,0,127}));
        connect(Constant1.y, switch1.u1) annotation (Line(
            points={{-57.4,58},{-50,58}},
            color={0,0,127}));
        connect(switch1.u2, Failed) annotation (Line(
            points={{-50,50},{-58,50},{-58,38},{-80,38},{-80,40},{-100,40}},
            color={255,0,255}));
        connect(switch2.y, feedback.u1) annotation (Line(
            points={{-3,80},{0,80},{0,64},{-14,64},{-14,34}},
            color={0,0,127}));
        connect(booleanConstant.y, switch2.u2) annotation (Line(
            points={{-75,72},{-38,72},{-38,80},{-26,80}},
            color={255,0,255}));
        connect(switch2.u1, switch1.y) annotation (Line(
            points={{-26,72},{-34,72},{-34,66},{-22,66},{-22,50},{-27,50}},
            color={0,0,127}));
        connect(One.y, switch2.u3) annotation (Line(
            points={{-37.5,88},{-26,88}},
            color={0,0,127}));
        annotation (        Documentation(revisions="<html>
<p><i>2009-2018</i></p>
<p>Marek Matejak, marek@matfyz.cz </p>
</html>"));
      end SplineLagOrZero;
    end Factors;

    package Source
          model PeriodicCurveSource
            "Periodic signal source as 2D natural cubic interpolation spline defined with (x,y,slope) points on scaled preriod interval (0,1)"

            import Modelica.Constants.pi;

               parameter Real x[:] = fill(Modelica.Constants.N_A,1)
          "x coordinations of interpolating points";
               parameter Real y[:] = fill(Modelica.Constants.N_A,1)
          "y coordinations of interpolating points";
               parameter Real slope[:] = fill(Modelica.Constants.N_A,1)
          "slopes at interpolating points";

               parameter Real[:,3] data = transpose({x,y,slope})
          "Array of interpolating points as {x,y,slope}";

              parameter Real Xscale = 1 "conversion scale to SI unit of x values";
              parameter Real Yscale = 1 "conversion scale to SI unit of y values";

               Physiolibrary.Types.RealIO.FrequencyInput frequence
          annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));
               Modelica.Blocks.Interfaces.RealOutput val
                               annotation (Placement(transformation(extent={{80,-20},
                  {120,20}})));

              parameter Integer nu = 4*9*25;
    protected
              parameter Real a[:,:] = Interpolation.SplineCoefficients(
                                                          data[:, 1]*Xscale,data[:, 2]*Yscale,data[:, 3]*Yscale/Xscale)
                         "cubic polynom coefficients of curve segments between interpolating points";


              parameter Real curve[nu] = { Physiolibrary.Blocks.Interpolation.Spline(
                                                                                 data[:, 1], a, i/(nu-1)) for i in 0:nu-1};

              parameter Integer nfi = div(nu,2)+1;
              constant Complex I(re=0, im=1);
              Complex complexValue;

              parameter Complex c[nfi] = FFT(curve, nfi) "Fourier series coefficients";

          equation

            complexValue = sum( c[j+1] * Modelica.ComplexMath.exp(2*pi*I*j*time*frequence) for j in 0:nfi-1);  //Inverse Fourier transformation

            val = complexValue.re;

             annotation ( Icon(coordinateSystem(
                preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
              graphics={
              Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(
                points={{-70,-76},{-20,-48},{0,12},{34,62},{76,72}},
                color={0,0,127},
                smooth=Smooth.Bezier),
              Line(
                points={{-48,-82},{-48,90},{-48,90}},
                color={0,0,127},
                smooth=Smooth.Bezier,
                arrow={Arrow.None,Arrow.Filled}),
              Line(
                points={{-72,-74},{68,-74},{68,-74}},
                color={0,0,127},
                smooth=Smooth.Bezier,
                arrow={Arrow.None,Arrow.Filled})}));
          end PeriodicCurveSource;

      function FFT "Get fourier series coeficient"
        import Modelica.Constants.pi;
        input Real f[:] "equidistant-sampled function";
        input Integer nfi = div(size(f,1),2)+1 "";
        output Complex c[nfi] "Fourier series coeficient";
    protected
        Real Ai[nfi] "FFT amplitudes of interested frequency points";
        Real Phii[nfi] "FFT phases of interested frequency points";
        Integer info "Information flag from FFT computation; = 0: FFT successfully computed";
      algorithm
        (info,Ai,Phii) :=  Modelica.Math.FastFourierTransform.realFFT(f, nfi);
        for j in 1:nfi loop
           c[j] :=  Complex(re=Ai[j]*cos(Phii[j]*(pi/180)),im=Ai[j]*sin(Phii[j]*(pi/180)));
        end for;
      end FFT;
    end Source;
    annotation (Documentation(revisions="<html>
<p>Copyright (c) 2008-2015, Marek Matej&aacute;k, marek@matfyz.cz </p>
<p>All rights reserved. </p>
</html>"));
   end Blocks;

  annotation (
preferredView="info",
version="3.0.0-alpha9",
versionDate="2021-01-27",
dateModified = "2021-01-27 10:14:41Z",
uses(
    Modelica(version="4.0.0"),
    Complex(version="4.0.0"),
    Chemical(version="1.4.0"),
    ModelicaHackathonPoriz(version="1")),
    conversion(
  from(version="BioChem-1.0.1", script="modelica://Physiolibrary/Resources/Scripts/Dymola/ConvertBioChem_1.0.1_to_Physiolibrary_2.3.mos",
      to="3.0.0"),
  from(version="0.4980", script="modelica://Physiolibrary/Resources/Scripts/Dymola/ConvertPhysiolibrary_from_0.4980_to_2.3.mos",
      to="3.0.0"),
  from(version="1.0", script="modelica://Physiolibrary/Resources/Scripts/Dymola/ConvertPhysiolibrary_from_1.0_to_3.0.mos",
      to="3.0.0"),
  from(version="1.1", script="modelica://Physiolibrary/Resources/Scripts/Dymola/ConvertPhysiolibrary_from_1.1_to_3.0.mos",
      to="3.0.0"),
  from(version="1.2", script="modelica://Physiolibrary/Resources/Scripts/Dymola/ConvertPhysiolibrary_from_1.2_to_3.0.mos",
      to="3.0.0"),
  from(version="2.0", script="modelica://Physiolibrary/Resources/Scripts/Dymola/ConvertPhysiolibrary_from_2.0_to_3.0.mos",
      to="3.0.0"),
  from(version="2.1", script="modelica://Physiolibrary/Resources/Scripts/Dymola/ConvertPhysiolibrary_from_2.1_to_3.0.mos",
      to="3.0.0"),
  from(version="2.1.0", script="modelica://Physiolibrary/Resources/Scripts/Dymola/ConvertPhysiolibrary_from_2.1_to_3.0.mos",
      to="3.0.0"),
  from(version="2.1.1", script="modelica://Physiolibrary/Resources/Scripts/Dymola/ConvertPhysiolibrary_from_2.1_to_3.0.mos",
      to="3.0.0"),
  from(version="2.1.2", script="modelica://Physiolibrary/Resources/Scripts/Dymola/ConvertPhysiolibrary_from_2.1_to_3.0.mos",
      to="3.0.0"),
  from(version="2.2.0", script="modelica://Physiolibrary/Resources/Scripts/Dymola/ConvertPhysiolibrary_from_2.2_to_3.0.mos",
      to="3.0.0"),
  from(version="2.3.0", script="modelica://Physiolibrary/Resources/Scripts/Dymola/ConvertPhysiolibrary_from_2.3_to_3.0.mos",
      to="3.0.0"),
  from(version="2.3.1", script="modelica://Physiolibrary/Resources/Scripts/Dymola/ConvertPhysiolibrary_from_2.3_to_3.0.mos",
      to="3.0.0"),
  from(version="2.3.2", script="modelica://Physiolibrary/Resources/Scripts/Dymola/ConvertPhysiolibrary_from_2.3_to_3.0.mos",
      to="3.0.0")),
  Documentation(revisions="<html>
<p>Copyright (c) 2021, Marek Matej&aacute;k, Ph.D. </p>
<p>All rights reserved. </p>
<p>Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met: </p>
<ol>
<li>Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer. </li>
<li>Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution. </li>
<li>Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission. </li>
</ol>
<p>THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS &quot;AS IS&quot; AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.</p>
</html>", info="<html>
<ul>
<li>Web pages: <a href=\"http://www.physiolibrary.org\">www.physiolibrary.org</a></li>
<li><a href=\"modelica://Physiolibrary.UsersGuide.Overview\">Overview</a></li>
<li><a href=\"modelica://Physiolibrary.UsersGuide.Connectors\">Connectors</a></li>
<li><a href=\"modelica://Physiolibrary.UsersGuide.Contact\">Contact</a> </li>
</ul>
<p><br>The origin of this Modelica Physiolibrary was in the first version of our HumMod Golem Edition model implementation, where it was called HumMod.Library. As the successors of Guyton&apos;s Medical Physiology School write, the original HumMod model is &ldquo;The best, most complete, mathematical model of human physiology ever created&rdquo;.</p>
<p>We are also developing many types of smaller physiological models for use in medical education, so it was essential to separate this library from our HumMod Modelica implementation. This separation improves the quality of the next HumMod release and provides a useful Modelica library to modelers in this bioscience.</p>
<p>The library contains only carefully-chosen elementary physiological laws, which are the basis of more complex physiological processes.</p>
<p><br>Physiology is a very progressive discipline, that examines how the living body works. And it is no surprise that all processes in the human body are driven by physical laws of nature. The great challenge is to marry old empirical experiments with the &ldquo;new&rdquo; physical principles. Many teams and projects in the word deal with this formalization of physiology, for example: Physiome, SBML, EuroPhysiome, VPH, CellML etc. It is our hope that this library helps this unflagging effort of physiologists to exactly describe the processes.</p>
</html>"));
end Physiolibrary;

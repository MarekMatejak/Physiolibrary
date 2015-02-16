within ;
package Physiolibrary "Modelica library for Physiology (version 2.3.0)"
 extends Modelica.Icons.Package;


  package UsersGuide "User's Guide"
    extends Modelica.Icons.Information;

  class Overview "Overview of Physiolibrary"
    extends Modelica.Icons.Information;

   annotation (Documentation(info="<html>
<p>ThePhysiolibrary consists of the following main sub-libraries: </p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><p align=\"center\"><h4>Library Components</h4></p></td>
<td><p align=\"center\"><h4>Description</h4></p></td>
</tr>
<tr>
<td valign=\"top\"><p><img src=\"modelica://Physiolibrary/Resources/Images/UserGuide/Chemical.png\"/></p></td>
<td valign=\"middle\"><p><a href=\"modelica://Physiolibrary.Chemical\">Chemical</a></p><p>In physiology books, chapters about chemical substances are organized by their types. The main reason for this is that each substance in the human body is regulated in a different way. For example the regulation of sodium is different from the regulation of potassium, and from the regulation of glucose, and so on. This view leads to the idea of having separate models of each substance. The origin of different flows and regulations is the (cellular) membrane. Water and solutions can cross it in different directions at the same time. Crossings occur for different reasons: water is driven mostly by osmotic gradients, electrolytes are driven by charge to reach Donnan&apos;s equilibrium, and some solutes can even be actively transported against their concentration or electrical gradients. And all this is specifically driven from the higher levels by neural and hormonal responses.&nbsp; </p><p>In Physiolibrary flows and fluxes of solutes are supported mostly by the Chemical package. All parts inside this Chemical package use the connector ChemicalPort, which defines the molar concentration and molar flow/flux rate of one solute. This is the supporting infrastructure for modeling membrane diffusion, accumulations of substances, reversal chemical reactions, Henry&apos;s law of gas solubility, dilution with additional solvent flow, membrane reabsorption, chemical degradation and physiological clearance. </p></td>
</tr>
<tr>
<td valign=\"top\"><p><img src=\"modelica://Physiolibrary/Resources/Images/UserGuide/Hydraulic.png\"/></p></td>
<td valign=\"middle\"><p><a href=\"modelica://Physiolibrary.Hydraulic\">Hydraulic</a></p><p>The main usage of the hydraulic domain in human physiology is modeling of the cardio-vascular system. And because there are no extreme thermodynamic conditions, the system can be really simple &mdash;it is only necessary to model conditions for incompressible water, at normal liquid-water temperatures and with relative pressure 5-20kPa. This boring thermodynamic state leads to the very simple blocks of hydraulic resistance, hydrostatic pressure, volumetric flow, inertia and finally the block of blood accumulation in elastic vessels.</p></td>
</tr>
<tr>
<td valign=\"top\"><p><img src=\"modelica://Physiolibrary/Resources/Images/UserGuide/Thermal.png\"/></p></td>
<td valign=\"middle\"><p><a href=\"modelica://Physiolibrary.Thermal\">Thermal</a></p><p>For the human body to function optimally, it is critical to hold the core temperature at 35&ndash;39&deg;C. A fever of 41&deg;C for more than a short period of time causes brain damage. If the core temperature falls below 10&deg;C, the heart stops. As in the hydraulic domain, the thermal domain is simplified to these conditions. </p><p>In the Thermal package extends the package Modelica.Thermal.HeatTransfer from Modelica Standard Library 3.2 (MSL), where the connector is composed of temperature and heat flow. The main blocks in Thermal are: Conductor, IdealRadiator and HeatAccumulation. The heat conductor conducts the heat from the source, such us muscles or metabolically active tissue, to its surrounding. IdealRadiator delivers heat to tissues by blood circulation. HeatAccumulation plays a role in accumulating thermal energy in each tissue mass driven by its heat capacity. We recommend to use this block instead of Modelica.Thermal.HeatTransfer.HeatCapacitor to have possibility of variable mass amount or to have a support for calculation of steady state. </p></td>
</tr>
<tr>
<td valign=\"top\"><p><img src=\"modelica://Physiolibrary/Resources/Images/UserGuide/Osmotic.png\"/></p></td>
<td valign=\"middle\"><p><a href=\"modelica://Physiolibrary.Osmotic\">Osmotic</a></p><p>One of the basic phenomenon of biological systems is the osmotically-driven flow of water. This is always connected with semipermeable membranes. The different concentrations of impermeable solutes on both sides of the membrane causes the hydrostatic pressure at the concentrated side to rise. This pressure difference is called osmotic pressure. Osmotic pressure is linearly proportional to the concentration gradient of impermeable solutes. The osmolarity (osmotic concentration) is also one of the main indexes of human body balance, called homeostasis. Its value should not significantly deviate for a long period of time from a value of 285-295 mosm/l. </p><p>In Physiolibrary the osmotic connector OsmoticPort is composed of the osmotic concentration and the volumetric flux of permeable liquid. The two main blocks are called Membrane and OsmoticCell. Here, inside the membrane blocks, it is of course possible to also define hydraulic pressure and temperatures effects on both sides of membrane. </p></td>
</tr>
<tr>
<td valign=\"top\"><p><img src=\"modelica://Physiolibrary/Resources/Images/UserGuide/Population.png\"/></p></td>
<td valign=\"middle\"><p><a href=\"modelica://Physiolibrary.Population\">Population</a></p><p>Population models are based on increasing and decreasing of average number of population members. The number of population member is a nonflow variable in connectors and flow variable is the change of population members. The growth or differentiation of cells can be modeled as stream from one population component to another, where each population component could be defined by selected age, type, function or wathever..</p><p>Even the domain is integer, all is modeled by real numbers. </p></td>
</tr>
<tr>
<td valign=\"top\"><p><img src=\"modelica://Physiolibrary/Resources/Images/UserGuide/SteadyState.png\"/></p></td>
<td valign=\"middle\"><p><a href=\"modelica://Physiolibrary.SteadyStates\">SteadyStates</a></p><p>One of the main question in clinical medicine is how to stabilize the patient. In the fact of the oscillating heart, breathing, circadian rhythm or menstruation cycle the model could be designed as non-oscillating with variables such as period times, amplitudes, frequencies, mean values and other phase space variables. This type of model has better numerical stability for longer simulation time and even more it can be &QUOT;stabilized&QUOT;. This stabilization we called steady state. </p><p>To be mathematically exact, we define an <i><b>steady state system</b></i> (SSS) as a non-differential system derived from a original differential system (DS) by using zero derivations and by adding <b>additional steady state equations</b> (ASSE). The number of the ASSE must be the same as the number of algebraically dependent equations in the non-differential system derived from DS by setting zero derivations. The ASSE describes the system from the top view mostly such as the equations of mass conservation laws or the boundary equation of environment sources. To define a model as an SSS the user must switch each Simulation parameter in each block to value Types.SimulationType.SteadyState and must have correctly defined all necessary ASSE. This setting caused to ignoring any start values for any state and add zero derivation equations instead. Today does not exist Modelica environment, which could automatically find and remove generated dependent equations by this way. So the correct number of states must be marked as dependent (parameter isDependent) and the same number of ASSE must be inserted. Despite the fact, that model in this steady-state setting will be not locally balanced it should be globally balanced and without any dependent equation.</p><p>Adding of one ASSE is possible by inserting and connecting of the energy or mass conservation law block from package SteadyState.Components. Other possibilities is in blocks of environment&nbsp; sources, where the setting of parameter isIsolatedInSteadyState&nbsp; add the equation of the zero mass/volume/energy flow from or to environment. </p><p>The model in steady state often changes to one big nonlinear strong component, but without solver stiff or convergence problems. Especially in quick chemical reaction kinetics is not necessary to have very rapid molar fluxes, when it always reach equilibrium. This design also approve to create steady stated parts in dynamical model without huge rebuilding. It also&nbsp; brings other benefits. To see these possibilities, one have to realize that conservation laws could be invariances in a dynamical simulation. This is really useful for debugging. </p><p>It is always a big challenge to nicely solve initial values of differential system. However, it should be possible to solve the SSS in initial phase. And this is the idea behind the Types.SimulationTypes.InitSteadyState option for models already extended with ASSE to support SSS. </p></td>
</tr>
</table>
</html>"));
  end Overview;

  class Connectors "Connectors"
    extends Modelica.Icons.Information;

   annotation (Documentation(info="<html>
<p>The Physiolibrary defines the most important <b>elementary connectors</b> in various domains. If any possible, a user should utilize these connectors in order that components from the Physiolibrary and from other libraries can be combined without problems. The following elementary connectors are defined (the meaning of potential, flow, and stream variables is explained in section &QUOT;Connector Equations&QUOT; below): </p>
<table cellspacing=\"0\" cellpadding=\"1\" border=\"1\"><tr>
<td valign=\"top\"><h4>domain</h4></td>
<td valign=\"top\"><h4>potential</h4><p>variables</p></td>
<td valign=\"top\"><h4>flow</h4><p>variables</p></td>
<td valign=\"top\"><h4>stream</h4><p>variables</p></td>
<td valign=\"top\"><h4>connector definition</h4></td>
<td valign=\"top\"><h4>icons</h4></td>
</tr>
<tr>
<td valign=\"top\"><h4>chemical</h4></td>
<td valign=\"top\"><p>molar concentration</p></td>
<td valign=\"top\"><p>molar flow</p></td>
<td valign=\"top\"></td>
<td valign=\"top\"><p><br><br><br><a href=\"Chemical.Interfaces\">Chemical.Interfaces</a> </p><p>ChemicalPort, ChemicalPort_a, ChemicalPort_b</p></td>
<td valign=\"top\"><p><img src=\"modelica://Physiolibrary/Resources/Images/UserGuide/ChemicalPorts.png\"/></p></td>
</tr>
<tr>
<td valign=\"top\"><h4>hydraulic</h4></td>
<td valign=\"top\"><p>pressure</p></td>
<td valign=\"top\"><p>volumetric flow</p></td>
<td valign=\"top\"></td>
<td valign=\"top\"><p><br><br><br><a href=\"Hydraulic.Interfaces\">Hydraulic.Interfaces</a> </p><p>HydraulicPort, HydraulicPort_a, HydraulicPort_b</p></td>
<td valign=\"top\"><p><img src=\"modelica://Physiolibrary/Resources/Images/UserGuide/HydraulicPorts.png\"/></p></td>
</tr>
<tr>
<td valign=\"top\"><h4>osmotic</h4></td>
<td valign=\"top\"><p>osmolarity</p></td>
<td valign=\"top\"><p>permeable liquid volumetric flow </p></td>
<td valign=\"top\"></td>
<td valign=\"top\"><p><br><br><br><a href=\"Osmotic.Interfaces\">Osmotic.Interfaces</a> </p><p>OsmoticPort, OsmoticPort_a, OsmoticPort_b</p></td>
<td valign=\"top\"><p><img src=\"modelica://Physiolibrary/Resources/Images/UserGuide/OsmoticPorts.png\"/></p></td>
</tr>
<tr>
<td valign=\"top\"><h4>thermal</h4></td>
<td valign=\"top\"><p>temperature</p></td>
<td valign=\"top\"><p>heat flow rate</p></td>
<td valign=\"top\"></td>
<td valign=\"top\"><p><br><br><br><a href=\"modelica://Modelica.Thermal.HeatTransfer.Interfaces\">Modelica.Thermal.HeatTransfer.Interfaces</a> </p><p>HeatPort, HeatPort_a, HeatPort_b</p><p><a href=\"Thermal.Interfaces\">Thermal.Interfaces</a> </p><p>HeatPort, HeatPort_a, HeatPort_b</p></td>
<td valign=\"top\"><p><br><img src=\"modelica://Physiolibrary/Resources/Images/UserGuide/ThermalPorts.png\"/></p></td>
</tr>
<tr>
<td valign=\"top\"><h4>population</h4></td>
<td valign=\"top\"><p>the number</p><p>of population members</p></td>
<td valign=\"top\"><p>change </p><p>of the number of population members</p></td>
<td valign=\"top\"></td>
<td valign=\"top\"><p><br><br><br><a href=\"Population.Interfaces\">Population.Interfaces</a> </p><p>PopulationPort, PopulationPort_a, PopulationPort_b</p></td>
<td valign=\"top\"><p><img src=\"modelica://Physiolibrary/Resources/Images/UserGuide/PopulationPorts.png\"/></p></td>
</tr>
<tr>
<td valign=\"top\"><h4>block</h4><p>diagram</p></td>
<td valign=\"top\"><p>Real unit-typed variables</p></td>
<td valign=\"top\"></td>
<td valign=\"top\"></td>
<td valign=\"top\"><p><br><br><br><br><br><br><a href=\"Types.RealIO\">Types.RealIO</a> </p><p>EnergyInput, EnergyOutput, TimeInput, TimeOutput, MassInput, MassOutput, MassFlowRateInput, MassFlowRateOutput, HeightInput, HeightOutput, AccelerationInput, AccelerationOutput, PressureInput, PressureOutput, VolumeInput, VolumeOutput, VolumeFlowRateInput, VolumeFlowRateOutput, ConcentrationInput, ConcentrationOutput, OsmolarityInput, OsmolarityOutput, AmountOfSubstanceInput, AmountOfSubstanceOutput, MolarFlowRateInput, MolarFlowRateOutput, DiffusionPermeabilityInput, DiffusionPermeabilityOutput, HeatInput, HeatOutput, TemperatureInput, TemperatureOutput, HeatFlowRateInput, HeatFlowRateOutput, ThermalConductanceInput, ThermalConductanceOutput, ElectricCurrentInput, ElectricCurrentOutput, ElectricChargeInput, ElectricChargeOutput, ElectricPotentialInput, ElectricPotentialOutput, FractionInput, FractionOutput, FrequencyInput, FrequencyOutput, OsmoticPermeabilityInput, OsmoticPermeabilityOutput, HydraulicConductanceInput, HydraulicConductanceOutput, HydraulicComplianceInput, HydraulicComplianceOutput, HydraulicInertanceInput, HydraulicInertanceOutput, GasSolubilityInput, GasSolubilityOutput, DensityInput, SpecificEnergyInput, SpecificEnergyOutput, SpecificHeatCapacityInput, SpecificHeatCapacityOutput</p></td>
<td valign=\"top\"><p><img src=\"modelica://Physiolibrary/Resources/Images/UserGuide/Signals.png\"/></p></td>
</tr>
</table>
<p><br><br><br><br><br>In all domains, usually 2 connectors are defined. The variable declarations are <b>identical</b>, only the icons are different in order that it is easy to distinguish connectors of the same domain that are attached at the same component. </p>
</html>"));
  end Connectors;

    class ModelicaLicense2 "Modelica License 2"

      annotation (Documentation(info="<html>
<p>All files in this directory (Physiolibrary) and in all subdirectories, especially all files that build package &QUOT;Physiolibrary&QUOT; are licensed by <u><b>Marek Matejak</b></u> under the <u><b>Modelica License 2 </b></u>(with exception of files &QUOT;Resources/*&QUOT;). </p>
<p><h4>Licensor:</h4></p>
<p>Marek Matej&aacute;k,</p>
<p>Hviezdoslavova 632/41,</p>
<p>916 01 Star&aacute; Tur&aacute;, </p>
<p>Slovak Republic, </p>
<p>Charles University in Prague, Czech Republic</p>
<p><br/>email: marek@matfyz.cz</p>
<p><h4>Copyright notices of the files:</h4></p>
<p>Copyright &copy; 2008-2015, Marek Matejak, Charles University in Prague, First Faculty of Medicine, Institute of Pathological Physiology</p>
<p><br/><br/>This package with all of its subpackages is released under the &ldquo;Modelica License 2&rdquo; (if not explicitly noted otherwise). </p>
<p><br/><a href=\"#The_Modelica_License_2-outline\">The Modelica License 2</a></p>
<p><br/><a href=\"#How_to_Apply_the_Modelica_License_2-outline\">How to Apply the Modelica License 2</a></p>
<p><br/><a href=\"#Frequently_Asked_Questions-outline\">Frequently Asked Questions</a></p>
<p><br/><b><font style=\"color: #008000; \">The Modelica License 2</font></b> </p>
<p><b><font style=\"font-size: 10pt; \">Preamble.</b> The goal of this license is that Modelica related model libraries, software, images, documents, data files etc. can be used freely in the original or a modified form, in open source and in commercial environments (as long as the license conditions below are fulfilled, in particular sections 2c) and 2d). The Original Work is provided free of charge and the use is completely at your own risk. Developers of free Modelica packages are encouraged to utilize this license for their work. </p>
<p>The Modelica License applies to any Original Work that contains the following licensing notice adjacent to the copyright notice(s) for this Original Work: </p>
<p><b>Licensed by Marek Matejak under the Modelica License 2</b> </p>
<p><h4>1. Definitions.</h4></p>
<p>&ldquo;License&rdquo; is this Modelica License. </p>
<p>&ldquo;Original Work&rdquo; is any work of authorship, including software, images, documents, data files, that contains the above licensing notice or that is packed together with a licensing notice referencing it. </p>
<p>&ldquo;Licensor&rdquo; is the provider of the Original Work who has placed this licensing notice adjacent to the copyright notice(s) for the Original Work. The Original Work is either directly provided by the owner of the Original Work, or by a licensee of the owner. </p>
<p>&ldquo;Derivative Work&rdquo; is any modification of the Original Work which represents, as a whole, an original work of authorship. For the matter of clarity and as examples: </p>
<p>Derivative Work shall not include work that remains separable from the Original Work, as well as merely extracting a part of the Original Work without modifying it. </p>
<p>Derivative Work shall not include (a) fixing of errors and/or (b) adding vendor specific Modelica annotations and/or (c) using a subset of the classes of a Modelica package, and/or (d) using a different representation, e.g., a binary representation. </p>
<p>Derivative Work shall include classes that are copied from the Original Work where declarations, equations or the documentation are modified. </p>
<p>Derivative Work shall include executables to simulate the models that are generated by a Modelica translator based on the Original Work (of a Modelica package). </p>
<p>&ldquo;Modified Work&rdquo; is any modification of the Original Work with the following exceptions: (a) fixing of errors and/or (b) adding vendor specific Modelica annotations and/or (c) using a subset of the classes of a Modelica package, and/or (d) using a different representation, e.g., a binary representation. </p>
<p>&QUOT;Source Code&QUOT; means the preferred form of the Original Work for making modifications to it and all available documentation describing how to modify the Original Work. </p>
<p>&ldquo;You&rdquo; means an individual or a legal entity exercising rights under, and complying with all of the terms of, this License. </p>
<p>&ldquo;Modelica package&rdquo; means any Modelica library that is defined with the &ldquo;<b>package</b></font><font style=\"font-size: 9pt; \">&nbsp;&LT;Name&GT;&nbsp;...&nbsp;</font><font style=\"font-size: 10pt; \">end</font><font style=\"font-size: 9pt; \">&nbsp;&LT;Name&GT;;</font><font style=\"font-size: 10pt; \">&rdquo; Modelica language element. </p>
<p><b>2. Grant of Copyright License.</b> Licensor grants You a worldwide, royalty-free, non-exclusive, sublicensable license, for the duration of the copyright, to do the following: </p>
<p>To reproduce the Original Work in copies, either alone or as part of a collection. </p>
<p>To create Derivative Works according to Section 1d) of this License. </p>
<p>To distribute or communicate to the public copies of the <u>Original Work</u> or a <u>Derivative Work</u> under <u>this License</u>. No fee, neither as a copyright-license fee, nor as a selling fee for the copy as such may be charged under this License. Furthermore, a verbatim copy of this License must be included in any copy of the Original Work or a Derivative Work under this License.</p>
<p>For the matter of clarity, it is permitted A) to distribute or communicate such copies as part of a (possible commercial) collection where other parts are provided under different licenses and a license fee is charged for the other parts only and B) to charge for mere printing and shipping costs. </p>
<p>To distribute or communicate to the public copies of a <u>Derivative Work</u>, alternatively to Section 2c), under <u>any other license</u> of your choice, especially also under a license for commercial/proprietary software, as long as You comply with Sections 3, 4 and 8 below. </p>
<p>For the matter of clarity, no restrictions regarding fees, either as to a copyright-license fee or as to a selling fee for the copy as such apply. </p>
<p>To perform the Original Work publicly. </p>
<p>To display the Original Work publicly. </p>
<p><b>3. Acceptance.</b> Any use of the Original Work or a Derivative Work, or any action according to either Section 2a) to 2f) above constitutes Your acceptance of this License. </p>
<p><b>4. Designation of Derivative Works and of Modified Works. </b>The identifying designation of Derivative Work and of Modified Work must be different to the corresponding identifying designation of the Original Work. This means especially that the (root-level) name of a Modelica package under this license must be changed if the package is modified (besides fixing of errors, adding vendor specific Modelica annotations, using a subset of the classes of a Modelica package, or using another representation, e.g. a binary representation). </p>
<p><b>5. Grant of Patent License.</b> Licensor grants You a worldwide, royalty-free, non-exclusive, sublicensable license, under patent claims owned by the Licensor or licensed to the Licensor by the owners of the Original Work that are embodied in the Original Work as furnished by the Licensor, for the duration of the patents, to make, use, sell, offer for sale, have made, and import the Original Work and Derivative Works under the conditions as given in Section 2. For the matter of clarity, the license regarding Derivative Works covers patent claims to the extent as they are embodied in the Original Work only. </p>
<p><b>6. Provision of Source Code.</b> Licensor agrees to provide You with a copy of the Source Code of the Original Work but reserves the right to decide freely on the manner of how the Original Work is provided.</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;For the matter of clarity, Licensor might provide only a binary representation of the Original Work. In that case, You may (a) either reproduce the Source Code from the binary representation if this is possible (e.g., by performing a copy of an encrypted Modelica package, if encryption allows the copy operation) or (b) request the Source Code from the Licensor who will provide it to You. </p>
<p><b>7. Exclusions from License Grant.</b> Neither the names of Licensor, nor the names of any contributors to the Original Work, nor any of their trademarks or service marks, may be used to endorse or promote products derived from this Original Work without express prior permission of the Licensor. Except as otherwise expressly stated in this License and in particular in Sections 2 and 5, nothing in this License grants any license to Licensor&rsquo;s trademarks, copyrights, patents, trade secrets or any other intellectual property, and no patent license is granted to make, use, sell, offer for sale, have made, or import embodiments of any patent claims.</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;No license is granted to the trademarks of Licensor even if such trademarks are included in the Original Work, except as expressly stated in this License. Nothing in this License shall be interpreted to prohibit Licensor from licensing under terms different from this License any Original Work that Licensor otherwise would have a right to license. </p>
<p><b>8. Attribution Rights.</b> You must retain in the Source Code of the Original Work and of any Derivative Works that You create, all author, copyright, patent, or trademark notices, as well as any descriptive text identified therein as an &QUOT;Attribution Notice&QUOT;. The same applies to the licensing notice of this License in the Original Work. For the matter of clarity, &ldquo;author notice&rdquo; means the notice that identifies the original author(s). </p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;You must cause the Source Code for any Derivative Works that You create to carry a prominent Attribution Notice reasonably calculated to inform recipients that You have modified the Original Work. </p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;In case the Original Work or Derivative Work is not provided in Source Code, the Attribution Notices shall be appropriately displayed, e.g., in the documentation of the Derivative Work. </p>
<p><h4>9. Disclaimer of Warranty. </h4></p>
<p><u>The Original Work is provided under this License on an &QUOT;as is&QUOT; basis and without warranty, either express or implied, including, without limitation, the warranties of non-infringement, merchantability or fitness for a particular purpose. The entire risk as to the quality of the Original Work is with You.</u> This disclaimer of warranty constitutes an essential part of this License. No license to the Original Work is granted by this License except under this disclaimer. </p>
<p><b>10. Limitation of Liability.</b> Under no circumstances and under no legal theory, whether in tort (including negligence), contract, or otherwise, shall the Licensor, the owner or a licensee of the Original Work be liable to anyone for any direct, indirect, general, special, incidental, or consequential damages of any character arising as a result of this License or the use of the Original Work including, without limitation, damages for loss of goodwill, work stoppage, computer failure or malfunction, or any and all other commercial damages or losses. This limitation of liability shall not apply to the extent applicable law prohibits such limitation. </p>
<p><b>11. Termination.</b> This License conditions your rights to undertake the activities listed in Section 2 and 5, including your right to create Derivative Works based upon the Original Work, and doing so without observing these terms and conditions is prohibited by copyright law and international treaty. Nothing in this License is intended to affect copyright exceptions and limitations. This License shall terminate immediately and You may no longer exercise any of the rights granted to You by this License upon your failure to observe the conditions of this license. </p>
<p><b>12. Termination for Patent Action.</b> This License shall terminate automatically and You may no longer exercise any of the rights granted to You by this License as of the date You commence an action, including a cross-claim or counterclaim, against Licensor, any owners of the Original Work or any licensee alleging that the Original Work infringes a patent. This termination provision shall not apply for an action alleging patent infringement through combinations of the Original Work under combination with other software or hardware. </p>
<p><b>13. Jurisdiction.</b> Any action or suit relating to this License may be brought only in the courts of a jurisdiction wherein the Licensor resides and under the laws of that jurisdiction excluding its conflict-of-law provisions. The application of the United Nations Convention on Contracts for the International Sale of Goods is expressly excluded. Any use of the Original Work outside the scope of this License or after its termination shall be subject to the requirements and penalties of copyright or patent law in the appropriate jurisdiction. This section shall survive the termination of this License. </p>
<p><b>14. Attorneys&rsquo; Fees.</b> In any action to enforce the terms of this License or seeking damages relating thereto, the prevailing party shall be entitled to recover its costs and expenses, including, without limitation, reasonable attorneys&apos; fees and costs incurred in connection with such action, including any appeal of such action. This section shall survive the termination of this License. </p>
<p><b>15. Miscellaneous.</b> </p>
<p>If any provision of this License is held to be unenforceable, such provision shall be reformed only to the extent necessary to make it enforceable. </p>
<p>No verbal ancillary agreements have been made. Changes and additions to this License must appear in writing to be valid. This also applies to changing the clause pertaining to written form. </p>
<p>You may use the Original Work in all ways not otherwise restricted or conditioned by this License or by law, and Licensor promises not to interfere with or be responsible for such uses by You. </p>
<p><br/><b></font><font style=\"color: #008000; \">How to Apply the Modelica License 2</font></b> </p>
<p><font style=\"font-size: 10pt; \">At the top level of your Modelica package and at every important subpackage, add the following notices in the info layer of the package: </p>
<p>Licensed by &LT;Licensor&GT; under the Modelica License 2</p>
<p>Copyright &copy; &LT;year1&GT;-&LT;year2&GT;, &LT;name of copyright holder(s)&GT;. </p>
<p><i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> or visit <a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i> </p>
<p>Include a copy of the Modelica License 2 under <b>&LT;library&GT;.UsersGuide.ModelicaLicense2</b> (use <a href=\"http://www.modelica.org/licenses/ModelicaLicense2.mo\">http://www.modelica.org/licenses/ModelicaLicense2.mo</a>). Furthermore, add the list of authors and contributors under <b>&LT;library&GT;.UsersGuide.Contributors</b> or <b>&LT;library&GT;.UsersGuide.Contact</b>. </p>
<p>For example, sublibrary Modelica.Blocks of the Modelica Standard Library may have the following notices: </p>
<p>Licensed by Modelica Association under the Modelica License 2</p>
<p>Copyright &copy; 1998-2008, Modelica Association. </p>
<p><i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> or visit <a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i> </p>
<p>For C-source code and documents, add similar notices in the corresponding file. </p>
<p>For images, add a &ldquo;readme.txt&rdquo; file to the directories where the images are stored and include a similar notice in this file. </p>
<p>In these cases, save a copy of the Modelica License 2 in one directory of the distribution, e.g., <a href=\"http://www.modelica.org/licenses/ModelicaLicense2.html\">http://www.modelica.org/licenses/ModelicaLicense2.html</a> in directory <b>&LT;library&GT;/Resources/Documentation/ModelicaLicense2.html</b>. </p>
<p><br/><b><font style=\"font-size: 6pt; color: #008000; \">Frequently Asked Questions</font></b></p>
<p><font style=\"font-size: 10pt; \">This section contains questions/answer to users and/or distributors of Modelica packages and/or documents under Modelica License 2. Note, the answers to the questions below are not a legal interpretation of the Modelica License 2. In case of a conflict, the language of the license shall prevail. </p>
<p><b></font><font style=\"color: #008000; \">Using or Distributing a Modelica <u>Package</u> under the Modelica License 2</font></b> </p>
<p><b><font style=\"font-size: 10pt; \">What are the main differences to the previous version of the Modelica License?</b></p>
<p><ol>
<li>Modelica License 1 is unclear whether the licensed Modelica package can be distributed under a different license. Version 2 explicitly allows that &ldquo;Derivative Work&rdquo; can be distributed under any license of Your choice, see examples in Section 1d) as to what qualifies as Derivative Work (so, version 2 is clearer). </li>
<li>If You modify a Modelica package under Modelica License 2 (besides fixing of errors, adding vendor specific Modelica annotations, using a subset of the classes of a Modelica package, or using another representation, e.g., a binary representation), you must rename the root-level name of the package for your distribution. In version 1 you could keep the name (so, version 2 is more restrictive). The reason of this restriction is to reduce the risk that Modelica packages are available that have identical names, but different functionality. </li>
<li>Modelica License 1 states that &ldquo;It is not allowed to charge a fee for the original version or a modified version of the software, besides a reasonable fee for distribution and support&rdquo;. Version 2 has a similar intention for all Original Work under <u>Modelica License 2</u> (to remain free of charge and open source) but states this more clearly as &ldquo;No fee, neither as a copyright-license fee, nor as a selling fee for the copy as such may be charged&rdquo;. Contrary to version 1, Modelica License 2 has no restrictions on fees for Derivative Work that is provided under a different license (so, version 2 is clearer and has fewer restrictions). </li>
<li>Modelica License 2 introduces several useful provisions for the licensee (articles 5, 6, 12), and for the licensor (articles 7, 12, 13, 14) that have no counter part in version 1. </li>
<li>Modelica License 2 can be applied to all type of work, including documents, images and data files, contrary to version 1 that was dedicated for software only (so, version 2 is more general). </li>
</ol></p>
<p><h4>Can I distribute a Modelica package (under Modelica License 2) as part of my commercial Modelica modeling and simulation environment?</h4></p>
<p>Yes, according to Section 2c). However, you are not allowed to charge a fee for this part of your environment. Of course, you can charge for your part of the environment. </p>
<p><h4>Can I distribute a Modelica package (under Modelica License 2) under a different license?</h4></p>
<p>No. The license of an unmodified Modelica package cannot be changed according to Sections 2c) and 2d). This means that you cannot <u>sell</u> copies of it, any distribution has to be free of charge. </p>
<p><h4>Can I distribute a Modelica package (under Modelica License 2) under a different license when I first encrypt the package?</h4></p>
<p>No. Merely encrypting a package does not qualify for Derivative Work and therefore the encrypted package has to stay under Modelica License 2. </p>
<p><h4>Can I distribute a Modelica package (under Modelica License 2) under a different license when I first add classes to the package?</h4></p>
<p>No. The package itself remains unmodified, i.e., it is Original Work, and therefore the license for this part must remain under Modelica License 2. The newly added classes can be, however, under a different license. </p>
<p><b>Can I copy a class out of a Modelica package (under Modelica License 2) and include it <u>unmodified</u> in a Modelica package under a <u>commercial/proprietary license</u>?</b></p>
<p>No, according to article 2c). However, you can include model, block, function, package, record and connector classes in your Modelica package under <u>Modelica License 2</u>. This means that your Modelica package could be under a commercial/proprietary license, but one or more classes of it are under Modelica License 2.</p>
<p>Note, a &ldquo;type&rdquo; class (e.g., type Angle = Real(unit=&rdquo;rad&rdquo;)) can be copied and included unmodified under a commercial/proprietary license (for details, see the next question). </p>
<p><b>Can I copy a type class or <u>part</u> of a model, block, function, record, connector class, out of a Modelica package (under Modelica License 2) and include it modified or unmodified in a Modelica package under a <u>commercial/proprietary</u> license</b></p>
<p>Yes, according to article 2d), since this will in the end usually qualify as Derivative Work. The reasoning is the following: A type class or part of another class (e.g., an equation, a declaration, part of a class description) cannot be utilized &ldquo;by its own&rdquo;. In order to make this &ldquo;usable&rdquo;, you have to add additional code in order that the class can be utilized. This is therefore usually Derivative Work and Derivative Work can be provided under a different license. Note, this only holds, if the additional code introduced is sufficient to qualify for Derivative Work. Merely, just copying a class and changing, say, one character in the documentation of this class would be no Derivative Work and therefore the copied code would have to stay under Modelica License 2. </p>
<p><b>Can I copy a class out of a Modelica package (under Modelica License 2) and include it in <u>modified </u>form in a <u>commercial/proprietary</u> Modelica package?</b></p>
<p>Yes. If the modification can be seen as a &ldquo;Derivative Work&rdquo;, you can place it under your commercial/proprietary license. If the modification does not qualify as &ldquo;Derivative Work&rdquo; (e.g., bug fixes, vendor specific annotations), it must remain under Modelica License 2. This means that your Modelica package could be under a commercial/proprietary license, but one or more parts of it are under Modelica License 2. </p>
<p><h4>Can I distribute a &ldquo;save total model&rdquo; under my commercial/proprietary license, even if classes under Modelica License 2 are included?</h4></p>
<p>Your classes of the &ldquo;save total model&rdquo; can be distributed under your commercial/proprietary license, but the classes under Modelica License 2 must remain under Modelica License 2. This means you can distribute a &ldquo;save total model&rdquo;, but some parts might be under Modelica License 2. </p>
<p><h4>Can I distribute a Modelica package (under Modelica License 2) in encrypted form?</h4></p>
<p>Yes. Note, if the encryption does not allow &ldquo;copying&rdquo; of classes (in to unencrypted Modelica source code), you have to send the Modelica source code of this package to your customer, if he/she wishes it, according to article&nbsp;6. </p>
<p><h4>Can I distribute an executable under my commercial/proprietary license, if the model from which the executable is generated uses models from a Modelica package under Modelica License 2?</h4></p>
<p>Yes, according to article 2d), since this is seen as Derivative Work. The reasoning is the following: An executable allows the simulation of a concrete model, whereas models from a Modelica package (without pre-processing, translation, tool run-time library) are not able to be simulated without tool support. By the processing of the tool and by its run-time libraries, significant new functionality is added (a model can be simulated whereas previously it could not be simulated) and functionality available in the package is removed (e.g., to build up a new model by dragging components of the package is no longer possible with the executable). </p>
<p><h4>Is my modification to a Modelica package (under Modelica License 2) a Derivative Work?</h4></p>
<p>It is not possible to give a general answer to it. To be regarded as &QUOT;an original work of authorship&QUOT;, a derivative work must be different enough from the original or must contain a substantial amount of new material. Making minor changes or additions of little substance to a preexisting work will not qualify the work as a new version for such purposes. </p>
<p><b></font><font style=\"color: #008000; \">Using or Distributing a Modelica <u>Document</u> under the Modelica License 2</font></b> </p>
<p><font style=\"font-size: 10pt; \">This section is devoted especially for the following applications:</p>
<p>A Modelica tool extracts information out of a Modelica package and presents the result in form of a &ldquo;manual&rdquo; for this package in, e.g., html, doc, or pdf format. </p>
<p>The Modelica language specification is a document defining the Modelica language. It will be licensed under Modelica License 2. </p>
<p>Someone writes a book about the Modelica language and/or Modelica packages and uses information which is available in the Modelica language specification and/or the corresponding Modelica package. </p>
<p><h4>Can I sell a manual that was basically derived by extracting information automatically from a Modelica package under Modelica License 2 (e.g., a &ldquo;reference guide&rdquo; of the Modelica Standard Library):</h4></p>
<p>Yes. Extracting information from a Modelica package, and providing it in a human readable, suitable format, like html, doc or pdf format, where the content is significantly modified (e.g. tables with interface information are constructed from the declarations of the public variables) qualifies as Derivative Work and there are no restrictions to charge a fee for Derivative Work under alternative 2d). </p>
<p><b>Can I copy a text passage out of a Modelica document (under Modelica License 2) and use it <u>unmodified</u> in my document (e.g. the Modelica syntax description in the Modelica Specification)?</b></p>
<p>Yes. In case you distribute your document, the copied parts are still under Modelica License 2 and you are not allowed to charge a license fee for this part. You can, of course, charge a fee for the rest of your document. </p>
<p><b>Can I copy a text passage out of a Modelica document (under Modelica License 2) and use it in <u>modified</u> form in my document?</b></p>
<p>Yes, the creation of Derivative Works is allowed. In case the content is significantly modified this qualifies as Derivative Work and there are no restrictions to charge a fee for Derivative Work under alternative 2d). </p>
<p><h4>Can I sell a printed version of a Modelica document (under Modelica License 2), e.g., the Modelica Language Specification?</h4></p>
<p>No, if you are not the copyright-holder, since article 2c) does not allow a selling fee for a (in this case physical) copy. However, mere printing and shipping costs may be recovered.</p>
</html>"));
    end ModelicaLicense2;

  package ReleaseNotes "Release notes"
    extends Modelica.Icons.ReleaseNotes;

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
<li><font style=\"color: #333333; \">The library uses the Modelica Standard Libary (MSL) version 3.2.</font></li>
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

  class NewRealease "Publishing new release"
    extends Modelica.Icons.Information;

   annotation (Documentation(info="<html>
<p><br>New release must be numbered by Semantic Versioning 2.0, see <a href=\"http://semver.org/\">semver.org</a>. </p>
<p><br>If minor version, then the conversion script must be written and connected with package Physiolibrary using &QUOT;annotation(conversion(from(version=..)))&QUOT;! </p>
<p><br>To clean the code from dummy annotations try to use script <a href=\"https://github.com/dietmarw/trimtrailingwhitespaces\">ttws</a>. </p>
<p><br>Update version number to &QUOT;X.Y.Z&QUOT;: </p>
<ul>
<li>At package Physiolibrary annotation: (version=&QUOT;X.Y.Z&QUOT;) together with &QUOT;versionBuild&QUOT;, &QUOT;versionDate&QUOT; and &QUOT;dateModified&QUOT; attribute </li>
<li>At head of package Physiolibrary &QUOT;Physiological domains library (version X.Y.Z)&QUOT; </li>
<li>At file &QUOT;./Physiolibrary/libraryinfo.mos&QUOT; </li>
</ul>
<p><br>Update release notes: </p>
<ul>
<li>At UsersGuide.ReleaseNotes</li>
<li>At file &QUOT;./README.md&QUOT;, together with update of &QUOT;Current release&QUOT; section.</li>
</ul>
<p><br>Publish release in GitHub: </p>
<ul>
<li>Prepare release in &QUOT;master&QUOT; branch</li>
<li>Install, Check, Test, Test, Test (stop-time of examples).. </li>
<li>Delete branch &QUOT;release&QUOT; </li>
<li>Create new branch &QUOT;release&QUOT; from &QUOT;master&QUOT; branch </li>
<li>Rename directory &QUOT;Physiolibrary&QUOT; in release branch to directory &QUOT;Physiolibrary X.Y.Z&QUOT; </li>
<li>Commint and Push </li>
<li>Draft a new release from &QUOT;release&QUOT; branch with number &QUOT;vX.Y.Z&QUOT; and with release notes. </li>
</ul>
</html>"));
  end NewRealease;

  class Contact "Contact"
    extends Modelica.Icons.Contact;

   annotation (Documentation(info="<html>
<p>Marek Matejak</p>
<p>email: marek@matfy.cz</p>
<p>skype: marek.matejak</p>
<p>tel: +420 776 301 395</p>
<p><br>Graphics of icons:</p>
<p>Martin Broz,</p>
<p>Veronika Sykorova</p>
<p>email: elvenfall@gmail.com</p>
</html>"));

  end Contact;

  annotation (__Dymola_DocumentationClass=true, Documentation(info="<html>
<p>Package <b>Physiolibrary</b> is a modelica package for <b>Human Physiology</b> that is developed from <b>HumMod</b> modelica implementation, see <a href=\"http://patf-biokyb.lf1.cuni.cz/wiki/hummod/hummod\">http://hummod.org</a>. It provides constants, types, connectors, partial models and model components fitted for physiological models of human body. </p>
<p>This is a short <b>User&apos;s Guide</b> for the overall library. Some of the main sublibraries have their own User&apos;s Guides that can be accessed by the following links: </p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td valign=\"top\"><p><a href=\"modelica://Physiolibrary.Chemical\">Chemical</a></p></td>
<td valign=\"top\"><p>Library of chemical domain.</p></td>
</tr>
<tr>
<td valign=\"top\"><p><a href=\"modelica://Physiolibrary.Hydraulic\">Hydraulic</a></p></td>
<td valign=\"top\"><p>Library of hydraulic domain. For modeling of cardiovascular system.</p></td>
</tr>
<tr>
<td valign=\"top\"><p><a href=\"modelica://Physiolibrary.Thermal\">Thermal</a></p></td>
<td valign=\"top\"><p>Library of termoregulation support. As extension of Modelica.Thermal.HeatTransfer.</p></td>
</tr>
<tr>
<td valign=\"top\"><p><a href=\"modelica://Physiolibrary.Osmotic\">Osmotic</a></p></td>
<td valign=\"top\"><p>Library to model water fluxes through semipermeable membrane caused by osmotic pressure.</p></td>
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
<td valign=\"top\"><p>Usefull blocks, that are missing in package Modelica.Blocks (MSL 3.2), cubic interpolation curves, multiplication factors.</p></td>
</tr>
</table>
</html>"));
  end UsersGuide;


  annotation (preferredView="info",
version="2.3.0",
versionBuild=1,
versionDate="2015-02-16",
dateModified = "2015-02-16 15:49:00Z",
revisionId="",
uses(Modelica(version="3.2.1")),
conversion(
  from(version="BioChem-1.0.1", script="modelica://Physiolibrary/Resources/Scripts/Dymola/ConvertBioChem_1.0.1_to_Physiolibrary_2.3.mos"),
  from(version="0.4980", script="modelica://Physiolibrary/Resources/Scripts/Dymola/ConvertPhysiolibrary_from_0.4980_to_2.3.mos"),
  from(version="1.0", script="modelica://Physiolibrary/Resources/Scripts/Dymola/ConvertPhysiolibrary_from_1.0_to_2.3.mos"),
  from(version="1.1", script="modelica://Physiolibrary/Resources/Scripts/Dymola/ConvertPhysiolibrary_from_1.1_to_2.3.mos"),
  from(version="1.2", script="modelica://Physiolibrary/Resources/Scripts/Dymola/ConvertPhysiolibrary_from_1.2_to_2.3.mos"),
  from(version="2.0", script="modelica://Physiolibrary/Resources/Scripts/Dymola/ConvertPhysiolibrary_from_2.0_to_2.3.mos"),
  from(version="2.1", script="modelica://Physiolibrary/Resources/Scripts/Dymola/ConvertPhysiolibrary_from_2.1_to_2.3.mos"),
  from(version="2.1.0", script="modelica://Physiolibrary/Resources/Scripts/Dymola/ConvertPhysiolibrary_from_2.1_to_2.3.mos"),
  from(version="2.1.1", script="modelica://Physiolibrary/Resources/Scripts/Dymola/ConvertPhysiolibrary_from_2.1_to_2.3.mos"),
  from(version="2.1.2", script="modelica://Physiolibrary/Resources/Scripts/Dymola/ConvertPhysiolibrary_from_2.1_to_2.3.mos"),
  from(version="2.2.0", script="modelica://Physiolibrary/Resources/Scripts/Dymola/ConvertPhysiolibrary_from_2.2_to_2.3.mos")),
  Documentation(revisions="<html>
<p>Licensed by Marek Matejak under the Modelica License 2</p>
<p>Copyright &copy; 2008-2014, Marek Matejak, Charles University in Prague.</p>
<p><br/><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Physiolibrary.UsersGuide.ModelicaLicense2\">UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p>
</html>", info="<html>
<ul>
<li>Web pages: <a href=\"http://www.physiolibrary.org\">www.physiolibrary.org</a></li>
<li><a href=\"modelica://Physiolibrary.UsersGuide.Overview\">Overview</a></li>
<li><a href=\"modelica://Physiolibrary.UsersGuide.Connectors\">Connectors</a></li>
<li><a href=\"modelica://Physiolibrary.UsersGuide.Contact\">Contact</a></li>
</ul>

<p><br/>The origin of this Modelica Physiolibrary was in the first version of our HumMod Golem Edition model implementation, where it was called HumMod.Library. As the successors of Guyton&apos;s Medical Physiology School write, the original HumMod model is &ldquo;The best, most complete, mathematical model of human physiology ever created&rdquo;.</p>
<p>We are also developing many types of smaller physiological models for use in medical education, so it was essential to separate this library from our HumMod Modelica implementation. This separation improves the quality of the next HumMod release and provides a useful Modelica library to modelers in this bioscience.</p>
<p>The library contains only carefully-chosen elementary physiological laws, which are the basis of more complex physiological processes. For example from only two type of blocks (Chemical.ChemicalReaction and Chemical.Substance) it is possible to compose the allosteric transitions or the Michaelis-Menten equation.</p>
<p><br/>Physiology is a very progressive discipline, that examines how the living body works. And it is no surprise that all processes in the human body are driven by physical laws of nature. The great challenge is to marry old empirical experiments with the &ldquo;new&rdquo; physical principles. Many teams and projects in the word deal with this formalization of physiology, for example: Physiome, SBML, EuroPhysiome, VPH, CellML etc. It is our hope that this library helps this unflagging effort of physiologists to exactly describe the processes.</p>
</html>"));
end Physiolibrary;

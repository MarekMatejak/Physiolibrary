package Physiolibrary "System biology, integrative physiology and pathophysiology modelling library"

  extends Modelica.Icons.Package;









  annotation (
    preferredView = "info",
    version = "3.1.0-alpha",
    versionDate = "2023-10-10",
    dateModified = "2023-10-10 1:00:00Z",
    uses(Modelica(version = "4.0.0"), Complex(version = "4.0.0"),
      Chemical(version="1.5.0-alpha")),
    conversion(
      from(version = "BioChem-1.0.1", script = "modelica://Physiolibrary/Resources/Scripts/Dymola/ConvertBioChem_1.0.1_to_Physiolibrary_2.3.mos", to = "3.0.0"),
      from(version = "0.4980", script = "modelica://Physiolibrary/Resources/Scripts/Dymola/ConvertPhysiolibrary_from_0.4980_to_2.3.mos", to = "3.0.0"),
      from(version = "1.0", script = "modelica://Physiolibrary/Resources/Scripts/Dymola/ConvertPhysiolibrary_from_1.0_to_3.0.mos", to = "3.0.0"),
      from(version = "1.1", script = "modelica://Physiolibrary/Resources/Scripts/Dymola/ConvertPhysiolibrary_from_1.1_to_3.0.mos", to = "3.0.0"),
      from(version = "1.2", script = "modelica://Physiolibrary/Resources/Scripts/Dymola/ConvertPhysiolibrary_from_1.2_to_3.0.mos", to = "3.0.0"),
      from(version = "2.0", script = "modelica://Physiolibrary/Resources/Scripts/Dymola/ConvertPhysiolibrary_from_2.0_to_3.0.mos", to = "3.0.0"),
      from(version = "2.1", script = "modelica://Physiolibrary/Resources/Scripts/Dymola/ConvertPhysiolibrary_from_2.1_to_3.0.mos", to = "3.0.0"),
      from(version = "2.1.0", script = "modelica://Physiolibrary/Resources/Scripts/Dymola/ConvertPhysiolibrary_from_2.1_to_3.0.mos", to = "3.0.0"),
      from(version = "2.1.1", script = "modelica://Physiolibrary/Resources/Scripts/Dymola/ConvertPhysiolibrary_from_2.1_to_3.0.mos", to = "3.0.0"),
      from(version = "2.1.2", script = "modelica://Physiolibrary/Resources/Scripts/Dymola/ConvertPhysiolibrary_from_2.1_to_3.0.mos", to = "3.0.0"),
      from(version = "2.2.0", script = "modelica://Physiolibrary/Resources/Scripts/Dymola/ConvertPhysiolibrary_from_2.2_to_3.0.mos", to = "3.0.0"),
      from(version = "2.3.0", script = "modelica://Physiolibrary/Resources/Scripts/Dymola/ConvertPhysiolibrary_from_2.3_to_3.0.mos", to = "3.0.0"),
      from(version = "2.3.1", script = "modelica://Physiolibrary/Resources/Scripts/Dymola/ConvertPhysiolibrary_from_2.3_to_3.0.mos", to = "3.0.0"),
      from(version = "2.3.2", script = "modelica://Physiolibrary/Resources/Scripts/Dymola/ConvertPhysiolibrary_from_2.3_to_3.0.mos", to = "3.0.0"),
      from(version = "3.0.0-alpha11", script = "modelica://Physiolibrary/Resources/Scripts/Dymola/ConvertPhysiolibrary_from_3.0.0-alpha11_to_3.0.0.mos", to = "3.0.0")),
    Documentation(revisions = "<html>
<p>Copyright (c) 2023, Marek Matej&aacute;k, Ph.D. </p>
<p>All rights reserved. </p>
<p>Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met: </p>
<ol>
<li>Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer. </li>
<li>Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution. </li>
<li>Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission. </li>
</ol>
<p>THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS &quot;AS IS&quot; AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.</p>
</html>", info = "<html>
<ul>
<li>Web pages: <a href=\"http://www.physiolibrary.org\">www.physiolibrary.org</a></li>
<li><a href=\"modelica://Physiolibrary.UsersGuide.Overview\">Overview</a></li>
<li><a href=\"modelica://Physiolibrary.UsersGuide.Connectors\">Connectors</a></li>
<li><a href=\"modelica://Physiolibrary.UsersGuide.Contact\">Contact</a> </li>
</ul>
<p><br>The origin of this Modelica Physiolibrary was in the first version of our HumMod Golem Edition model implementation, where it was called HumMod.Library. As the successors of Guyton&apos;s Medical Physiology School write, the original HumMod model was &ldquo;The best, most complete, mathematical model of human physiology ever created&rdquo;.</p>
<p>We are also developing many types of smaller physiological models for use in medical education, so it was essential to separate this library from our HumMod Modelica implementation. This separation improves the quality of the next HumMod release and provides a useful Modelica library to modelers in this bioscience.</p>
<p>The library contains only carefully-chosen elementary physiological laws, which are the basis of more complex physiological processes.</p>
<p><br>Physiology is a very progressive discipline, that examines how the living body works. And it is no surprise that all processes in the human body are driven by physical laws of nature. The great challenge is to marry old empirical experiments with the &ldquo;new&rdquo; physical principles. Many teams and projects in the word deal with this formalization of physiology, for example: Physiome, SBML, EuroPhysiome, VPH, CellML etc. It is our hope that this library helps this unflagging effort of physiologists to exactly describe the processes.</p>
</html>"));
end Physiolibrary;

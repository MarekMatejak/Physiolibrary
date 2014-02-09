(* Content-type: application/vnd.wolfram.cdf.text *)

(*** Wolfram CDF File ***)
(* http://www.wolfram.com/cdf *)

(* CreatedBy='Mathematica 9.0' *)

(*************************************************************************)
(*                                                                       *)
(*  The Mathematica License under which this file was created prohibits  *)
(*  restricting third parties in receipt of this file from republishing  *)
(*  or redistributing it by any means, including but not limited to      *)
(*  rights management or terms of use, without the express consent of    *)
(*  Wolfram Research, Inc. For additional information concerning CDF     *)
(*  licensing and redistribution see:                                    *)
(*                                                                       *)
(*        www.wolfram.com/cdf/adopting-cdf/licensing-options.html        *)
(*                                                                       *)
(*************************************************************************)

(*CacheID: 234*)
(* Internal cache information:
NotebookFileLineBreakTest
NotebookFileLineBreakTest
NotebookDataPosition[      1063,         20]
NotebookDataLength[    152996,       3312]
NotebookOptionsPosition[    151783,       3249]
NotebookOutlinePosition[    152323,       3271]
CellTagsIndexPosition[    152280,       3268]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell[TextData[{
 "Lumped Adair-based parameter model of the equilibrium between oxygen, \
carbon dioxide, hydrogen ion activity and human hemoglobin A in erythrolysate \
at 37\[Degree]C\n",
 StyleBox["(Marek Matej\[AAcute]k)", "Subtitle"]
}], "Title", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell["Parameters", "Section", "PluginEmbeddedContent"],

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"aO2", " ", "=", " ", 
    RowBox[{"1.34", "*", 
     RowBox[{"10", "^", 
      RowBox[{"-", "3"}]}]}]}], ";"}], " ", 
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{
     RowBox[{"mmol", "/", "l"}], "/", "mmHg"}], ";", " ", 
    "\[IndentingNewLine]", 
    RowBox[{
    "CO2", " ", "solubility", " ", "by", " ", "Bartels", " ", "et", " ", 
     RowBox[{"al", "."}]}]}], "*)"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"aCO2", "=", 
   RowBox[{"30.66", "*", 
    RowBox[{"10", "^", 
     RowBox[{"-", "3"}]}]}]}], ";", 
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{
     RowBox[{"mmol", "/", "l"}], "/", "mmHg"}], ";", 
    RowBox[{"O2", " ", "solubility", " ", "by", " ", "Maas", " ", "et", " ", 
     RowBox[{"al", "."}]}]}], "*)"}]}]}], "Input", "PluginEmbeddedContent"],

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"pKzD", "=", "7.73"}], ";", " ", 
   RowBox[{"pKcD", "=", 
    RowBox[{"4.54", "+", "3"}]}], ";", " ", 
   RowBox[{"pKzO", "=", "7.25"}], ";", " ", 
   RowBox[{"pKcO", "=", 
    RowBox[{"5.35", "+", "3"}]}], ";"}], "   ", 
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{"Valine", "-", 
     RowBox[{
     "1", " ", "hemoglobin", " ", "subunit", " ", "acid", " ", "disociation", 
      " ", "constants"}]}], ",", 
    RowBox[{"fitted", " ", "to", " ", "Bauer", " ", "et", " ", 
     RowBox[{"al", "'"}], "s", " ", "carboxylation"}]}], " ", 
   "*)"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"pKhD", "=", "7.52"}], ";", " ", 
  RowBox[{"pKhO", "=", "6.89"}], ";", " ", 
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{
    "side", " ", "chains", " ", "of", " ", "hemoglobin", " ", "subunit", " ", 
     "acid", " ", "dissociation", " ", "constants"}], ",", " ", 
    RowBox[{"fitted", " ", "parameters", " ", "to", " ", "Siggaard"}]}], " ", 
   "*)"}]}]}], "Input", "PluginEmbeddedContent"],

Cell[BoxData[
 RowBox[{
  RowBox[{
   RowBox[{"a1", "=", "81.3"}], ";", 
   RowBox[{"a2", "=", "7195"}], ";", 
   RowBox[{"a3", "=", "71948"}], ";", 
   RowBox[{"a4", "=", 
    RowBox[{"2.0939", "*", 
     RowBox[{"10", "^", "8"}]}]}], ";"}], 
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{
     RowBox[{
      RowBox[{"Adair", "'"}], "s", " ", "coeficients", " ", "of", " ", 
      "specific", " ", "CO2"}], "-", "H", "-", 
     RowBox[{
     "striped", " ", "form", " ", "of", " ", "hemoglobin", " ", 
      "tetramer"}]}], ",", " ", 
    RowBox[{"fitted", " ", "to", " ", "Severinghaus", " ", "ODC"}]}], " ", 
   "*)"}]}]], "Input", "PluginEmbeddedContent"]
}, Open  ]],

Cell[CellGroupData[{

Cell["Model", "Section", "PluginEmbeddedContent"],

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{
    RowBox[{"fzc", "[", 
     RowBox[{"pKz_", ",", "pKc_"}], "]"}], ":=", 
    RowBox[{"1", "/", 
     RowBox[{"(", 
      RowBox[{"1", "+", 
       RowBox[{"10", "^", 
        RowBox[{"(", 
         RowBox[{"pKz", "-", "pH"}], ")"}]}], " ", "+", " ", 
       RowBox[{"CO2", "*", 
        RowBox[{"10", "^", 
         RowBox[{"(", 
          RowBox[{"pH", "-", "pKc"}], ")"}]}]}]}], ")"}]}]}], ";"}], " ", 
  RowBox[{"(*", 
   RowBox[{
    RowBox[{"fraction", " ", "of", " ", "NH2"}], "-", " ", 
    RowBox[{"form", " ", "of", " ", "N"}], "-", 
    RowBox[{"terminus", " ", "on", " ", "hemoglobin", " ", "subunits"}]}], 
   "*)"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{
    RowBox[{"fh", "[", "pK_", "]"}], ":=", 
    RowBox[{"1", "/", 
     RowBox[{"(", 
      RowBox[{
       RowBox[{"10", "^", 
        RowBox[{"(", 
         RowBox[{"pK", "-", "pH"}], ")"}]}], "+", "1"}], ")"}]}]}], ";", " ", 
   RowBox[{"(*", 
    RowBox[{
    "fraction", " ", "of", " ", "striped", " ", "form", " ", "of", " ", 
     "lumped", " ", "acid", " ", "side", " ", "for", " ", "hemoglobin", " ", 
     "subunit", " ", "side", " ", "chains"}], "*)"}], "\[IndentingNewLine]", 
   RowBox[{"fnD", "=", 
    RowBox[{
     RowBox[{"fh", "[", "pKhD", "]"}], "*", 
     RowBox[{"fzc", "[", 
      RowBox[{"pKzD", ",", "pKcD"}], "]"}]}]}], ";", " ", 
   RowBox[{"fnO", "=", 
    RowBox[{
     RowBox[{"fh", "[", "pKhO", "]"}], "*", 
     RowBox[{"fzc", "[", 
      RowBox[{"pKzO", ",", "pKcO"}], "]"}]}]}], ";"}], "   ", 
  RowBox[{"(*", 
   RowBox[{
    RowBox[{"fraction", " ", "of", " ", "specific", " ", "CO2"}], "-", "H", 
    "-", 
    RowBox[{
    "striped", " ", "form", " ", "of", " ", "hemoglobin", " ", "subunits"}]}],
    "*)"}]}]}], "Input", "PluginEmbeddedContent"],

Cell[BoxData[
 RowBox[{
  RowBox[{
   RowBox[{"x", "=", 
    RowBox[{"O2", "*", 
     RowBox[{"(", 
      RowBox[{"fnD", "/", "fnO"}], ")"}]}]}], ";", "  ", 
   RowBox[{"(*", " ", 
    RowBox[{
     RowBox[{"Adair", "'"}], "s", " ", "dependency", " ", "on", " ", "pH", 
     " ", "and", " ", "CO2"}], " ", "*)"}], "\[IndentingNewLine]", 
   RowBox[{"sO2", " ", "=", " ", 
    RowBox[{
     RowBox[{"(", 
      RowBox[{
       RowBox[{
        RowBox[{"(", 
         RowBox[{"1", "/", "4"}], ")"}], "a1", " ", "x"}], " ", "+", " ", 
       RowBox[{
        RowBox[{"(", 
         RowBox[{"2", "/", "4"}], ")"}], "a2", " ", 
        RowBox[{"x", "^", "2"}]}], " ", "+", " ", 
       RowBox[{
        RowBox[{"(", 
         RowBox[{"3", "/", "4"}], ")"}], "a3", " ", 
        RowBox[{"x", "^", "3"}]}], " ", "+", " ", 
       RowBox[{
        RowBox[{"(", 
         RowBox[{"4", "/", "4"}], ")"}], "a4", " ", 
        RowBox[{"x", "^", "4"}]}]}], ")"}], "/", 
     RowBox[{"(", 
      RowBox[{"1", "+", 
       RowBox[{"a1", " ", "x"}], " ", "+", " ", 
       RowBox[{"a2", " ", 
        RowBox[{"x", "^", "2"}]}], " ", "+", " ", 
       RowBox[{"a3", " ", 
        RowBox[{"x", "^", "3"}]}], " ", "+", " ", 
       RowBox[{"a4", " ", 
        RowBox[{"x", "^", "4"}]}]}], ")"}]}]}], ";"}], " ", 
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{"Adair", "'"}], "s", " ", "oxygen", " ", "dissociation", " ", 
    "curve", " ", 
    RowBox[{"(", "ODC", ")"}], " ", "equation"}], " ", "*)"}]}]], "Input", \
"PluginEmbeddedContent"],

Cell[BoxData[
 RowBox[{
  RowBox[{
   RowBox[{"dHh", "=", 
    RowBox[{"-", 
     RowBox[{"(", 
      RowBox[{
       RowBox[{"fh", "[", "pKhD", "]"}], "-", 
       RowBox[{"fh", "[", "pKhO", "]"}]}], ")"}]}]}], ";", "  ", 
   RowBox[{"(*", " ", 
    RowBox[{
     RowBox[{"Bohr", "'"}], "s", " ", "protons", " ", "of", " ", "reaction", 
     " ", "h"}], " ", "*)"}], "\[IndentingNewLine]", 
   RowBox[{"dHz", "=", " ", 
    RowBox[{
     RowBox[{
      RowBox[{"(", 
       RowBox[{"10", "^", 
        RowBox[{"(", 
         RowBox[{"pKzD", "-", "pH"}], ")"}]}], ")"}], "*", 
      RowBox[{"fzc", "[", 
       RowBox[{"pKzD", ",", "pKcD"}], "]"}]}], "-", " ", 
     RowBox[{
      RowBox[{"(", " ", 
       RowBox[{"10", "^", 
        RowBox[{"(", 
         RowBox[{"pKzO", "-", "pH"}], ")"}]}], ")"}], "*", 
      RowBox[{"fzc", "[", 
       RowBox[{"pKzO", ",", "pKcO"}], "]"}]}]}]}], ";", " ", 
   RowBox[{"(*", " ", 
    RowBox[{
     RowBox[{"Bohr", "'"}], "s", " ", "protons", " ", "of", " ", "reaction", 
     " ", "z"}], " ", "*)"}], "\[IndentingNewLine]", 
   RowBox[{"dHc", "=", 
    RowBox[{"-", 
     RowBox[{"(", " ", 
      RowBox[{
       RowBox[{"CO2", "*", 
        RowBox[{"10", "^", 
         RowBox[{"(", 
          RowBox[{"pH", "-", "pKcD"}], ")"}]}], "*", 
        RowBox[{"fzc", "[", 
         RowBox[{"pKzD", ",", "pKcD"}], "]"}]}], "-", "  ", 
       RowBox[{"CO2", "*", 
        RowBox[{"10", "^", 
         RowBox[{"(", 
          RowBox[{"pH", "-", "pKcO"}], ")"}]}], "*", 
        RowBox[{"fzc", "[", 
         RowBox[{"pKzO", ",", "pKcO"}], "]"}]}]}], ")"}]}]}], ";", " ", 
   RowBox[{"(*", " ", 
    RowBox[{
     RowBox[{"Bohr", "'"}], "s", " ", "protons", " ", "of", " ", "reaction", 
     " ", "c"}], " ", "*)"}], "\[IndentingNewLine]", 
   RowBox[{"dH", "=", 
    RowBox[{"(", 
     RowBox[{"dHz", "+", "dHc", " ", "+", " ", "dHh"}], ")"}]}], ";"}], " ", 
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{
     RowBox[{"Bohr", "'"}], "s", " ", "protons"}], " ", "=", " ", 
    RowBox[{
    "number", " ", "of", " ", "protons", " ", "released", " ", "during", " ", 
     "oxygenation", " ", "per", " ", "one", " ", "hemoglobin", " ", 
     "subunit"}]}], " ", "*)"}]}]], "Input", "PluginEmbeddedContent"],

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"sCO2D", "=", " ", 
    RowBox[{"CO2", "/", 
     RowBox[{"(", 
      RowBox[{
       RowBox[{"10", "^", 
        RowBox[{"(", 
         RowBox[{"pKcD", "-", "pH", "+", "pKzD", "-", "pH"}], ")"}]}], "+", 
       RowBox[{"10", "^", 
        RowBox[{"(", 
         RowBox[{"pKcD", "-", "pH"}], ")"}]}], "+", "CO2"}], ")"}]}]}], ";"}],
   "  ", 
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{"CO2", " ", "saturation", " ", "on", " ", "deoxy"}], "-", 
    "hemoglobin"}], "*)"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"sCO2O", "=", " ", 
   RowBox[{"CO2", "/", 
    RowBox[{"(", 
     RowBox[{
      RowBox[{"10", "^", 
       RowBox[{"(", 
        RowBox[{"pKcO", "-", "pH", "+", "pKzO", "-", "pH"}], ")"}]}], "+", 
      RowBox[{"10", "^", 
       RowBox[{"(", 
        RowBox[{"pKcO", "-", "pH"}], ")"}]}], "+", "CO2"}], ")"}]}]}], ";", 
  " ", 
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{"CO2", " ", "saturation", " ", "on", " ", "oxy"}], "-", 
    "hemoglobin"}], "*)"}]}]}], "Input", "PluginEmbeddedContent"],

Cell[BoxData[
 RowBox[{
  RowBox[{"sCO2", "=", " ", 
   RowBox[{
    RowBox[{"sO2", "*", "sCO2O"}], " ", "+", " ", 
    RowBox[{
     RowBox[{"(", 
      RowBox[{"1", "-", "sO2"}], ")"}], "*", "sCO2D"}]}]}], ";", " ", 
  RowBox[{"(*", " ", 
   RowBox[{"CO2", " ", "hemoglobin", " ", "saturation"}], " ", 
   "*)"}]}]], "Input", "PluginEmbeddedContent"]
}, Open  ]],

Cell[CellGroupData[{

Cell["Measurements", "Section", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"fnD", "/", "fnO"}], " ", "/.", " ", 
  RowBox[{"{", 
   RowBox[{
    RowBox[{"CO2", "\[Rule]", "0"}], ",", " ", 
    RowBox[{"pH", "->", "7.2464"}]}], "}"}]}]], "Input", \
"PluginEmbeddedContent"],

Cell[BoxData["0.24847616345225676`"], "Output", "PluginEmbeddedContent"]
}, Open  ]],

Cell[CellGroupData[{

Cell["\<\
Severinghaus, J. W. (1979). \[OpenCurlyDoubleQuote]Simple, accurate equations \
for human blood O2 dissociation computations.\[CloseCurlyDoubleQuote] Journal \
of applied physiology 46(3): 599-602.\
\>", "Subsection", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"Severinghaus", "=", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"1", ",", ".6"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"2", ",", "1.19"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"4", ",", "2.56"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"6", ",", "4.37"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"8", ",", "6.68"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"10", ",", "9.58"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"12", ",", "12.96"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"14", ",", "16.89"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"16", ",", "21.4"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"18", ",", "26.5"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"20", ",", "32.12"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"22", ",", "37.6"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"24", ",", "43.14"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"26", ",", "48.27"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"28", ",", "53.16"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"30", ",", "57.54"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"32", ",", "61.69"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"34", ",", "65.16"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"36", ",", "68.63"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"38", ",", "71.94"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"40", ",", "74.69"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"42", ",", "77.29"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"44", ",", "79.55"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"46", ",", "81.71"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"48", ",", "83.52"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"50", ",", "85.08"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"52", ",", "86.59"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"54", ",", "87.7"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"56", ",", "88.93"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"58", ",", "89.95"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"60", ",", "90.85"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"65", ",", "92.73"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"70", ",", "94.06"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"75", ",", "95.1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"80", ",", "95.84"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"85", ",", "96.42"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"90", ",", "96.88"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"95", ",", "97.25"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"100", ",", "97.49"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"110", ",", "97.91"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"120", ",", "98.21"}], "}"}]}], "}"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{"Show", "[", 
  RowBox[{
   RowBox[{"Plot", "[", 
    RowBox[{
     RowBox[{
      RowBox[{"100", "*", "sO2"}], "/.", " ", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"O2", "\[Rule]", 
         RowBox[{"pO2", "*", "aO2"}]}], ",", 
        RowBox[{"pH", "\[Rule]", "7.2464"}], ",", " ", 
        RowBox[{"CO2", "\[Rule]", 
         RowBox[{"aCO2", "*", "0"}]}]}], "}"}]}], ",", " ", 
     RowBox[{"{", 
      RowBox[{"pO2", ",", "0", ",", "120"}], "}"}], ",", " ", 
     RowBox[{"AxesLabel", " ", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{"\"\<pO2 [mmHg]\>\"", ",", "\"\<sO2 [%]\>\""}], "}"}]}], ",", 
     " ", 
     RowBox[{"PlotRange", "\[Rule]", "All"}], ",", 
     RowBox[{"PlotLegends", "\[Rule]", 
      RowBox[{"{", "\"\<model\>\"", "}"}]}]}], "]"}], ",", 
   RowBox[{"ListPlot", "[", 
    RowBox[{"Severinghaus", ",", 
     RowBox[{"PlotLegends", "\[Rule]", 
      RowBox[{
      "{", "\"\<collected data of ODC by Severinghaus1979\>\"", "}"}]}]}], 
    "]"}]}], "]"}]}], "Input", "PluginEmbeddedContent"],

Cell[BoxData[
 TemplateBox[{GraphicsBox[{{{}, {}, {
       Hue[0.67, 0.6, 0.6], 
       LineBox[CompressedData["
1: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
68pYUP4fKH8ItA==
        "]]}}, {{}, {
       RGBColor[0.24720000000000014`, 0.24, 0.6], 
       PointBox[CompressedData["
1:eJw10T1LA0EQBuBDrNKoYCEp4meRA5HgFyEa8xo9E88YcmcSIwYFQTvROloI
YilB8B+onVhKyhDRSuvYhpSmECRWFt7evLtwHM/t3Mzs7OjBiXvYYxiG6T3q
Les7MeOvdoIfEGjencYDP3Q/zgafUq1KL8RD9AA9glro6supBekJmOVqoxse
p8PoOCrCpCdx72VvtiN0BEf+mqOn5X0Ro2ehspX7QM/j412tJB2Fq9LfWHQM
L154dSxNL8Jv99aml6C6Db1maEj/n1l6Wc5v5+ik7IcdegX+8f60V8WPLm1J
fXeLXoOMVzuFuCpwnKfTaFVUh9rr0p9VoG38eukaD9obcv6Odkbmu1CkN2X/
XDsr832mkcOwKjC1zTk7ch+XdN2V+DfayEv9Lo2C3H+wxP+LMp8oXWdcjjZ2
5P72dfyuzLei9/dkHtcl/APzM6jC
        "]]}, {}}}, AspectRatio -> 
    NCache[GoldenRatio^(-1), 0.6180339887498948], Axes -> True, AxesLabel -> {
      FormBox["\"pO2 [mmHg]\"", TraditionalForm], 
      FormBox["\"sO2 [%]\"", TraditionalForm]}, AxesOrigin -> {0, 0}, 
    Method -> {}, PlotRange -> {All, All}, PlotRangeClipping -> True, 
    PlotRangePadding -> {Automatic, Automatic}],TagBox[
    GridBox[{{
       TemplateBox[{"\"model\""}, "LineLegend", DisplayFunction -> (StyleBox[
          StyleBox[
           PaneBox[
            TagBox[
             GridBox[{{
                TagBox[
                 GridBox[{{
                    GraphicsBox[{{
                    Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    Hue[0.67, 0.6, 0.6]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    Hue[0.67, 0.6, 0.6]], {}}}, AspectRatio -> Full, 
                    ImageSize -> {20, 10}, PlotRangePadding -> None, 
                    ImagePadding -> 1, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #}}, 
                  GridBoxAlignment -> {
                   "Columns" -> {Center, Left}, "Rows" -> {{Baseline}}}, 
                  AutoDelete -> False, 
                  GridBoxDividers -> {
                   "Columns" -> {{False}}, "Rows" -> {{False}}}, 
                  GridBoxItemSize -> {
                   "Columns" -> {{All}}, "Rows" -> {{All}}}, 
                  GridBoxSpacings -> {
                   "Columns" -> {{0.5}}, "Rows" -> {{0.8}}}], "Grid"]}}, 
              GridBoxAlignment -> {"Columns" -> {{Left}}, "Rows" -> {{Top}}}, 
              AutoDelete -> False, 
              GridBoxItemSize -> {
               "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
              GridBoxSpacings -> {"Columns" -> {{1}}, "Rows" -> {{0}}}], 
             "Grid"], Alignment -> Left, AppearanceElements -> None, 
            ImageMargins -> {{5, 5}, {5, 5}}, ImageSizeAction -> 
            "ResizeToFit"], LineIndent -> 0, StripOnInput -> False], {
          FontFamily -> "Times"}, Background -> Automatic, StripOnInput -> 
          False]& ), Editable -> True, 
        InterpretationFunction :> (RowBox[{"LineLegend", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"Directive", "[", 
                 RowBox[{"Hue", "[", 
                   RowBox[{"0.67`", ",", "0.6`", ",", "0.6`"}], "]"}], "]"}], 
               "}"}], ",", 
             RowBox[{"{", #, "}"}], ",", 
             RowBox[{"LegendLayout", "\[Rule]", "\"Column\""}]}], "]"}]& )]}, {
       TemplateBox[{"\"collected data of ODC by Severinghaus1979\""}, 
        "PointLegend", DisplayFunction -> (StyleBox[
          StyleBox[
           PaneBox[
            TagBox[
             GridBox[{{
                TagBox[
                 GridBox[{{
                    GraphicsBox[{{}, {
                    Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    RGBColor[0.24720000000000014`, 0.24, 0.6]], {
                    Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    RGBColor[0.24720000000000014`, 0.24, 0.6]], 
                    PointBox[
                    NCache[{
                    Scaled[{
                    Rational[1, 2], 
                    Rational[1, 2]}]}, {
                    Scaled[{0.5, 0.5}]}]]}}}, AspectRatio -> Full, 
                    ImageSize -> {10, 10}, PlotRangePadding -> None, 
                    ImagePadding -> 1, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #}}, 
                  GridBoxAlignment -> {
                   "Columns" -> {Center, Left}, "Rows" -> {{Baseline}}}, 
                  AutoDelete -> False, 
                  GridBoxDividers -> {
                   "Columns" -> {{False}}, "Rows" -> {{False}}}, 
                  GridBoxItemSize -> {
                   "Columns" -> {{All}}, "Rows" -> {{All}}}, 
                  GridBoxSpacings -> {
                   "Columns" -> {{0.5}}, "Rows" -> {{0.8}}}], "Grid"]}}, 
              GridBoxAlignment -> {"Columns" -> {{Left}}, "Rows" -> {{Top}}}, 
              AutoDelete -> False, 
              GridBoxItemSize -> {
               "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
              GridBoxSpacings -> {"Columns" -> {{1}}, "Rows" -> {{0}}}], 
             "Grid"], Alignment -> Left, AppearanceElements -> None, 
            ImageMargins -> {{5, 5}, {5, 5}}, ImageSizeAction -> 
            "ResizeToFit"], LineIndent -> 0, StripOnInput -> False], {
          FontFamily -> "Times"}, Background -> Automatic, StripOnInput -> 
          False]& ), Editable -> True, 
        InterpretationFunction :> (RowBox[{"PointLegend", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"Directive", "[", 
                 RowBox[{"RGBColor", "[", 
                   
                   RowBox[{
                    "0.24720000000000014`", ",", "0.24`", ",", "0.6`"}], 
                   "]"}], "]"}], "}"}], ",", 
             RowBox[{"{", #, "}"}], ",", 
             RowBox[{"LegendLayout", "\[Rule]", "\"Column\""}], ",", 
             RowBox[{"LegendMarkers", "\[Rule]", "False"}]}], "]"}]& )]}}, 
     AutoDelete -> False, GridBoxAlignment -> {"Columns" -> {{Left}}}, 
     GridBoxItemSize -> {"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
      GridBoxSpacings -> {"Columns" -> {{0}}}], "Grid"]},
  "Legended",
  DisplayFunction->(GridBox[{{
      TagBox[
       ItemBox[
        PaneBox[
         TagBox[#, "SkipImageSizeLevel"], Alignment -> {Center, Baseline}, 
         BaselinePosition -> Baseline], DefaultBaseStyle -> "Labeled"], 
       "SkipImageSizeLevel"], 
      ItemBox[#2, DefaultBaseStyle -> "LabeledLabel"]}}, 
    GridBoxAlignment -> {"Columns" -> {{Center}}, "Rows" -> {{Center}}}, 
    AutoDelete -> False, GridBoxItemSize -> Automatic, 
    BaselinePosition -> {1, 1}]& ),
  Editable->True,
  InterpretationFunction->(RowBox[{"Legended", "[", 
     RowBox[{#, ",", 
       RowBox[{"Placed", "[", 
         RowBox[{#2, ",", "After"}], "]"}]}], "]"}]& )]], "Output", \
"PluginEmbeddedContent"]
}, Open  ]],

Cell[BoxData[
 RowBox[{"Manipulate", "[", 
  RowBox[{
   RowBox[{"Show", "[", 
    RowBox[{
     RowBox[{"Plot", "[", 
      RowBox[{
       RowBox[{
        RowBox[{"100", "*", "sO2"}], "/.", " ", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"O2", "\[Rule]", 
           RowBox[{"pO2", "*", "aO2"}]}], ",", 
          RowBox[{"pH", "\[Rule]", 
           RowBox[{"7.2464", "+", 
            RowBox[{"0.796", 
             RowBox[{"(", 
              RowBox[{"pHp", "-", "7.4"}], ")"}]}]}]}], ",", " ", 
          RowBox[{"CO2", "\[Rule]", 
           RowBox[{"aCO2", "*", "pCO2"}]}]}], "}"}]}], ",", " ", 
       RowBox[{"{", 
        RowBox[{"pO2", ",", "0", ",", "120"}], "}"}], ",", " ", 
       RowBox[{"AxesLabel", " ", "\[Rule]", 
        RowBox[{"{", 
         RowBox[{"\"\<pO2 [mmHg]\>\"", ",", "\"\<sO2 [%]\>\""}], "}"}]}], ",",
        " ", 
       RowBox[{"PlotRange", "\[Rule]", "All"}], ",", 
       RowBox[{"PlotLegends", "\[Rule]", 
        RowBox[{"{", "\"\<model\>\"", "}"}]}]}], "]"}], ",", 
     RowBox[{"ListPlot", "[", 
      RowBox[{"Severinghaus", ",", 
       RowBox[{"PlotLegends", "\[Rule]", 
        RowBox[{"{", "\"\<Data by Severinghaus1979\>\"", "}"}]}]}], "]"}]}], 
    "]"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"pHp", ",", "7.4", ",", "\"\<Plasma pH\>\""}], "}"}], ",", "7", 
     ",", "7.8"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
      "pCO2", ",", "0", ",", " ", "\"\<Partial pressure of pCO2 [mmHg]\>\""}],
       "}"}], ",", "0", ",", "200"}], "}"}]}], "]"}]], "Input", \
"PluginEmbeddedContent"]
}, Open  ]],

Cell[CellGroupData[{

Cell["\<\
Bauer, C. and E. Schr\[ODoubleDot]der (1972). \
\[OpenCurlyDoubleQuote]Carbamino compounds of haemoglobin in human adult and \
foetal blood.\[CloseCurlyDoubleQuote] The Journal of physiology 227(2): \
457-471.\
\>", "Subsection", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"Bauer", "=", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"7.00", ",", "0.051"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.02", ",", "0.068"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.03", ",", "0.086"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.04", ",", "0.063"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.04", ",", "0.083"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.07", ",", "0.066"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.09", ",", "0.100"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.12", ",", "0.079"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.14", ",", "0.069"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.15", ",", "0.090"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.16", ",", "0.095"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.19", ",", "0.145"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.25", ",", "0.150"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.28", ",", "0.143"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.29", ",", "0.192"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.31", ",", "0.158"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.38", ",", "0.215"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.39", ",", "0.189"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.44", ",", "0.251"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.44", ",", "0.270"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.45", ",", "0.272"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.46", ",", "0.225"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.48", ",", "0.286"}], "}"}]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"6.93", ",", "0.011"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"6.99", ",", "0.013"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.00", ",", "0.023"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.01", ",", "0.023"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.05", ",", "0.032"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.06", ",", "0.017"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.07", ",", "0.026"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.08", ",", "0.018"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.08", ",", "0.031"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.11", ",", "0.039"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.16", ",", "0.028"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.20", ",", "0.047"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.21", ",", "0.05"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.23", ",", "0.026"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.23", ",", "0.060"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.31", ",", "0.065"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.32", ",", "0.063"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.32", ",", "0.047"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.34", ",", "0.07"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.39", ",", "0.097"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.40", ",", "0.086"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.44", ",", "0.121"}], "}"}]}], "}"}]}], "}"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{"Show", "[", 
  RowBox[{
   RowBox[{"Plot", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"sCO2D", "/.", 
        RowBox[{"{", 
         RowBox[{"CO2", "\[Rule]", 
          RowBox[{"40", "*", "aCO2"}]}], "}"}]}], ",", 
       RowBox[{"sCO2O", "/.", 
        RowBox[{"{", 
         RowBox[{"CO2", "\[Rule]", 
          RowBox[{"40", "*", "aCO2"}]}], "}"}]}]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"pH", ",", "6.9", ",", "7.5"}], "}"}], ",", 
     RowBox[{"PlotLegends", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{
       "\"\<current model deoxy Hb\>\"", ",", 
        "\"\<current model oxy Hb\>\""}], "}"}]}], ",", 
     RowBox[{"AxesLabel", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{"\"\<pH\>\"", ",", "\"\<sCO2\n[mols CO2 per mols Heme]\>\""}], 
       "}"}]}], ",", 
     RowBox[{"PlotLabel", "\[Rule]", "\"\<pCO2=40 mmHg\>\""}]}], "]"}], ",", 
   RowBox[{"ListPlot", "[", 
    RowBox[{"Bauer", ",", 
     RowBox[{"PlotLegends", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{
       "\"\<deoxy Hb measurements by Bauer1972\>\"", ",", 
        "\"\<oxy Hb measurements by Bauer1972\>\""}], "}"}]}]}], "]"}]}], 
  "]"}]}], "Input", "PluginEmbeddedContent"],

Cell[BoxData[
 TemplateBox[{GraphicsBox[{{{}, {}, {
       Hue[0.67, 0.6, 0.6], 
       LineBox[CompressedData["
1:eJwV0Hs0lHkcBnBNSs1SbSn0vj+FTSpid7rYOPv9Ot3rtC7RispiUk3rWmGV
s4mktKKtnDGFmYYkyrikJsnkEhq3nwrJJkkku3QRUrPv/vGc53zO899j4hPo
spunpaW1hcv/bfdpf4pYzOCcnyYoBS+l0NqmaKnhHDsq1CrqkUJoySf9Mc7n
LbzfrHgjhfyo6DMeKQyqyk5etR+SgoWuJIaRMDgc91uLo0YK+ia1AZcuMhgj
mzzlPCODt5ssVkvTGFyZGhcscZVBamp3f1YGg4uC7eekVstAlJA2cCefwbTe
uZ/d6y6DkBdoOlTKoO+pmybxajl8sPOZ2lfL4FS/rc5LaQYM3E1O725h8PvE
38HxcyboV7wQ8boZvHLZ3O8CyQL5zIBXZkMM2mA4r8PvKtSaG8+c8pXBELWL
XtLtbDC+1xU8jc+ijexRqHpiDrSn9UUZGrB4be/affyIXKjUnlS5xoxFXojn
Rub1dVhnvUYpsGZRciT4uOHSPLCRVXqZ27NY3VRYvWGCAtaLPW3tNnC7jnd/
W70CHrQKVFvdWBwOL3TA4nz4u8N6fKkPi6073RmfjAIw3YMiywAWZ7weXy0/
XQgNtn/FWR1mUV/N71AlFUF2wlib0wkWowtGFu4+cxP+sZS3h51j8b3R2EeX
3GKoTgw+4y3ldjZX98+mW9AYvjXUP5fFWL9Zy/Pe3gaHq2F6kUoWfXCni3DJ
HXi+M6/lehWLmiQe3+bXEtBv1XW9TFnsLT6skym+C/kp145KnrNYVd6RNTBa
CpEvdnUW9bP4TDSFt3hhGSiCXAebR1hclj7yw6yeMjhS6Z9fOImgILQrgclS
wcFUyZXibwmWPDmwV8/3Pjy+982WUmOC5l+jij2WlYNwd+KC14sJ7kmb1vTu
SzmcbLTNoysI3s+ZHedfUwEGMWb9qtUE1e6Rz+pyKqH5jun2ZkeCxLcg3vRE
FYzYCcN6dxAUeV0oT4h4AJtQWT1vH8HPTMqNJcJqEPCXqY0OEdzvdG14jmMN
HGcH/zA4RjBJ/MvRYNda0C4o81uZQLDMs7kh6OeH8Dap+YuHhOB3zuYtXb5q
2L+Cv94hi+Ba+aobVRF1YODlVr6xkKBtuxZNj6kHy8auf91UBJ3r+LrD2Q0Q
WBnjGFNH8OCDkMxM70bYcHST96E2guMpHmeTBxrhVLSLmaiH4LvDOsML45pg
jB9oGPWOoFA52659LgX3SXz9Ys72SpvTgYRCkUY+fYDzyoBOvvZ8CkEfnk7e
/p7g2YlPE60WUOjpWPfR5gPBnoofS49ZU2jOM6adHwlO16guLF9DIWdbfTyO
EuzQNtaU+FPgO+87EcrZqG350LYgCns2a0fncNZ7eXf6UAgFU1wVYThG8MD2
0aYF4RTEizL3DnLujzUUJR2jEDseuTZ9nKC7SWVnUDKF7mFDhyecK8SR5/VS
KDgMFdjrfiHYPX9GaPZFCuOv+gThnBVhl5TdUgohDW6mTl+5vyMdnTxzKDTW
DJJYzsmF9T6j1ylYVcQblXC2HGxPT1ZQ6L2lmmGhIeiKEWmPblJYV7BDdxfn
x4IRrwO3KchzP+mc4zza17F5ZgkFXtbZibWcXz408VWUUvCSWWk0nI1QmeGk
ovAfLrFIOA==
        "]]}, {
       Hue[0.9060679774997897, 0.6, 0.6], 
       LineBox[CompressedData["
1:eJwVzHtUjHkcx/HOSNkxuSQqz/OLylJIMYtW8f12SKnoohyUohO60KQrpVam
DI10kWVKpYR0YZqkeRpJGDFL2rIYnbZ0kiK7RaTOqH32j895n9c/H9NAgdde
jpaW1mZ2/9duJCxXIqEw6dz5x/cXiuG1uurVE9bxI8EhlUvEEHtnxGCM9fLZ
reoLNmKQJQszduZSaNPXaRm5RgwWvLwUKo/CIVfjtGVbxGBgqgrPv0ihxy5R
UHOMGAZcLNYXFbL/h6ZsKVeKoaCg52PpFQod628Gdu0/DaFnCj8pZBTG+Adz
bNrSIYgjMBu6S+Gk2xdi+CszYNgu8Kd+FYVnBe+d3d0z4VP9+Us9ryh00t8Q
dZXKAoOHb0M5PRSGPai3D+/OghL98HfmQxRyq910vt/PBtVCE/0p4xRGdVmO
DpeeBZOG7kPTuDT+cFWObD6ZA+2F/clGhjSKIqRbBSnnQKk9WbnBnEaZo6Yy
6sjvsNF6Qx3fmka96DTP0cjzYFOsDFhoT6MV2mXFn74AThJfWztnGkdk8gXZ
+RJoes1v3OpDo/eJCjPPP3Ph7w5rzbJAGs9tenS8bOpFMNuPoUvDadRNbZg0
2z4fntuePWmVQKOOvtFQT3YBlJ0ZU3uIaFyj63Z0Vmch/LO0pD0uh8YZDuN7
fMsuwePMQxl7imjcJUlK7A0ugpbDW2MPVtLIO6z/hG9aDA7X4/QS62jUb9rX
vXOwGDp3SV/deERjzOlwzQv5ZTB4zfO+3EqjyfzS+MUpJSDLLT+W10mj5SJD
3fTgK5D41r+r5iONv055VGjleBWqIrwH277T2Dct5UOF/TU4qjwouzWZYFi/
2nabbSlEF+Rdq51J0OFAr1RryXX4q2Hq5rsmBOO+WIi07cogaG/mz+8XE+Qo
5nQKHMrhVIuttHUVwT+Smn1bXSrAMMX8Y+N6gt+mf6mfE10JbQqzHW3uBGeu
XZ2wPfsGfLcLiuvzI7i2YoFpVutNcMG6x/NCCIqGO+UioRT43F+eGscQPKb2
jnaaVwWp9OBvhscJho9pC3c/qwLt6nv7Vp8hmHXyhZYqWgYDWW0/duYRTAvM
4ZdbV0PYKq6TQynB8TuqyPsD1WAY4PNg0y2Crr3li6D4Fixt6f7Xp5FgR9Pc
9ZUHakCgTHFPeUawxqloJdf6Njgfc9kToyZ47cNNT+nn25Am9DIP7SWYcETT
2/C0Fsa4AqPkzwQHk6tdFPly2D6Za1DL+pRPQu6BIjnUTJRM/8Q6QSvKx+SK
HCKG3+js+ELQq1lHT1ghh96OjV9thgmWlHoJPRVyaJOatHZ9JfjmHjeLo5ZD
xbZmMY4SfHlknU+NAQNczxBRLOu5zMzZ0UYM7HfVFlawjneuQz7NgBmuiTca
IzirvrBdZs6AxPJq8CDrG0KX+bUrGDihSXS8pCGYw8vsb/NgoOebkcNL1hnt
xiESbwYchqrteT8IPtVTeQdsZ0Dzrp9/mPU9pipiIICByOc+Zh7jBLvrFyum
ChhoeTJITrAeXRt98UUkA1YPxcZ3WMvX8T7kxzLQJ2+cYTFBMF1hp1qexMDG
aj+eP2u/5R1+mmQGSipHdHNYu1FvfZtSGeCUZk9Ssd4d5daUfYqBgGKriQnW
gSsWFPqnM/AfnAo2Ag==
        "]]}}, {{}, {{
        RGBColor[0.24720000000000014`, 0.24, 0.6], 
        PointBox[CompressedData["
1:eJxTTMoPSmViYGAQB2IQDQEyDi/VDDnWyKyyF1nn/rBKRMZhzhGFDUUZG+3l
W18H7pCTccjaUzJZgmWbvWZM/6GvGjIOIY+XzgYqgfOLMya+rbHfau8B1L3O
XcbBx7zTMeHpBnuwdIyMw6yZILDTvhpsgYzDZd8kgQjLLfZg6X4ZB5funOe/
V260h6iTceC6vrjAlmu7/RIgeX2xjEPQDjmQS+wPg5QfknGA6DtkD3G/rIMx
GByGulfWAWjYx0u+h6Duk3X4VQfywQl7W7DBslD7j9iDlbfKOkDo01D3yDr8
u1IBDJITUPtkHVYBTUsSuADnQ/x50f7sGRCQhYbXRXuws6/LOkDEz9i/ARn7
GuaeS/YAswap2Q==
         "]]}, {
        RGBColor[0.6, 0.24, 0.4428931686004542], 
        PointBox[CompressedData["
1:eJxTTMoPSmViYGAQA2IQvUOu9XXgDmmHXZ48TNrtbfbfNGL6D32VdrDccqJs
3/wuewYwkHGISrG+79873Z7r+uICWy4E3xgMZBz+rPx4yTdpgb0tWIGMw5wj
ChuKMibaezysElnnLgM1b5Z9ENhCGQew7rxJcH4ERIF9IdgAGQftdrGb574v
tl9SABKQcah8qWbIsWaO/dkzICDjsApkncAKe7Bzrss4zJoJAivt3wSCDETY
B+ND/LkO6j5ZB4i5G6Duk3UIebx0NtDJcD7MfFBoaMTIOkDM2WgP5vbLOixy
3fb575Ud9hB7ZR2y9pRMlmDZZn8YJH1I1iHh6QWl2z/32QMAEp6iyg==
         "]]}}, {}}}, AspectRatio -> 
    NCache[GoldenRatio^(-1), 0.6180339887498948], Axes -> True, AxesLabel -> {
      FormBox["\"pH\"", TraditionalForm], 
      FormBox["\"sCO2\\n[mols CO2 per mols Heme]\"", TraditionalForm]}, 
    AxesOrigin -> {6.9, 0}, Method -> {}, PlotLabel -> 
    FormBox["\"pCO2=40 mmHg\"", TraditionalForm], 
    PlotRange -> {{6.9, 7.5}, {0., 0.2930490129883779}}, PlotRangeClipping -> 
    True, PlotRangePadding -> {
      Scaled[0.02], 
      Scaled[0.02]}],TagBox[
    GridBox[{{
       TemplateBox[{"\"current model deoxy Hb\"", "\"current model oxy Hb\""},
         "LineLegend", DisplayFunction -> (StyleBox[
          StyleBox[
           PaneBox[
            TagBox[
             GridBox[{{
                TagBox[
                 GridBox[{{
                    GraphicsBox[{{
                    Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    Hue[0.67, 0.6, 0.6]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    Hue[0.67, 0.6, 0.6]], {}}}, AspectRatio -> Full, 
                    ImageSize -> {20, 10}, PlotRangePadding -> None, 
                    ImagePadding -> 1, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #}, {
                    GraphicsBox[{{
                    Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    Hue[0.9060679774997897, 0.6, 0.6]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    Hue[0.9060679774997897, 0.6, 0.6]], {}}}, AspectRatio -> 
                    Full, ImageSize -> {20, 10}, PlotRangePadding -> None, 
                    ImagePadding -> 1, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #2}}, 
                  GridBoxAlignment -> {
                   "Columns" -> {Center, Left}, "Rows" -> {{Baseline}}}, 
                  AutoDelete -> False, 
                  GridBoxDividers -> {
                   "Columns" -> {{False}}, "Rows" -> {{False}}}, 
                  GridBoxItemSize -> {
                   "Columns" -> {{All}}, "Rows" -> {{All}}}, 
                  GridBoxSpacings -> {
                   "Columns" -> {{0.5}}, "Rows" -> {{0.8}}}], "Grid"]}}, 
              GridBoxAlignment -> {"Columns" -> {{Left}}, "Rows" -> {{Top}}}, 
              AutoDelete -> False, 
              GridBoxItemSize -> {
               "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
              GridBoxSpacings -> {"Columns" -> {{1}}, "Rows" -> {{0}}}], 
             "Grid"], Alignment -> Left, AppearanceElements -> None, 
            ImageMargins -> {{5, 5}, {5, 5}}, ImageSizeAction -> 
            "ResizeToFit"], LineIndent -> 0, StripOnInput -> False], {
          FontFamily -> "Times"}, Background -> Automatic, StripOnInput -> 
          False]& ), Editable -> True, 
        InterpretationFunction :> (RowBox[{"LineLegend", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{
                 RowBox[{"Directive", "[", 
                   RowBox[{"Hue", "[", 
                    RowBox[{"0.67`", ",", "0.6`", ",", "0.6`"}], "]"}], "]"}],
                  ",", 
                 RowBox[{"Directive", "[", 
                   RowBox[{"Hue", "[", 
                    RowBox[{"0.9060679774997897`", ",", "0.6`", ",", "0.6`"}],
                     "]"}], "]"}]}], "}"}], ",", 
             RowBox[{"{", 
               RowBox[{#, ",", #2}], "}"}], ",", 
             RowBox[{"LegendLayout", "\[Rule]", "\"Column\""}]}], "]"}]& )]}, {
       TemplateBox[{
        "\"deoxy Hb measurements by Bauer1972\"", 
         "\"oxy Hb measurements by Bauer1972\""}, "PointLegend", 
        DisplayFunction -> (StyleBox[
          StyleBox[
           PaneBox[
            TagBox[
             GridBox[{{
                TagBox[
                 GridBox[{{
                    GraphicsBox[{{}, {
                    Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    RGBColor[0.24720000000000014`, 0.24, 0.6]], {
                    Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    RGBColor[0.24720000000000014`, 0.24, 0.6]], 
                    PointBox[
                    NCache[{
                    Scaled[{
                    Rational[1, 2], 
                    Rational[1, 2]}]}, {
                    Scaled[{0.5, 0.5}]}]]}}}, AspectRatio -> Full, 
                    ImageSize -> {10, 10}, PlotRangePadding -> None, 
                    ImagePadding -> 1, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #}, {
                    GraphicsBox[{{}, {
                    Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    RGBColor[0.6, 0.24, 0.4428931686004542]], {
                    Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    RGBColor[0.6, 0.24, 0.4428931686004542]], 
                    PointBox[
                    NCache[{
                    Scaled[{
                    Rational[1, 2], 
                    Rational[1, 2]}]}, {
                    Scaled[{0.5, 0.5}]}]]}}}, AspectRatio -> Full, 
                    ImageSize -> {10, 10}, PlotRangePadding -> None, 
                    ImagePadding -> 1, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #2}}, 
                  GridBoxAlignment -> {
                   "Columns" -> {Center, Left}, "Rows" -> {{Baseline}}}, 
                  AutoDelete -> False, 
                  GridBoxDividers -> {
                   "Columns" -> {{False}}, "Rows" -> {{False}}}, 
                  GridBoxItemSize -> {
                   "Columns" -> {{All}}, "Rows" -> {{All}}}, 
                  GridBoxSpacings -> {
                   "Columns" -> {{0.5}}, "Rows" -> {{0.8}}}], "Grid"]}}, 
              GridBoxAlignment -> {"Columns" -> {{Left}}, "Rows" -> {{Top}}}, 
              AutoDelete -> False, 
              GridBoxItemSize -> {
               "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
              GridBoxSpacings -> {"Columns" -> {{1}}, "Rows" -> {{0}}}], 
             "Grid"], Alignment -> Left, AppearanceElements -> None, 
            ImageMargins -> {{5, 5}, {5, 5}}, ImageSizeAction -> 
            "ResizeToFit"], LineIndent -> 0, StripOnInput -> False], {
          FontFamily -> "Times"}, Background -> Automatic, StripOnInput -> 
          False]& ), Editable -> True, 
        InterpretationFunction :> (RowBox[{"PointLegend", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{
                 RowBox[{"Directive", "[", 
                   RowBox[{"RGBColor", "[", 
                    
                    RowBox[{
                    "0.24720000000000014`", ",", "0.24`", ",", "0.6`"}], 
                    "]"}], "]"}], ",", 
                 RowBox[{"Directive", "[", 
                   RowBox[{"RGBColor", "[", 
                    
                    RowBox[{
                    "0.6`", ",", "0.24`", ",", "0.4428931686004542`"}], "]"}],
                    "]"}]}], "}"}], ",", 
             RowBox[{"{", 
               RowBox[{#, ",", #2}], "}"}], ",", 
             RowBox[{"LegendLayout", "\[Rule]", "\"Column\""}], ",", 
             RowBox[{"LegendMarkers", "\[Rule]", "False"}]}], "]"}]& )]}}, 
     AutoDelete -> False, GridBoxAlignment -> {"Columns" -> {{Left}}}, 
     GridBoxItemSize -> {"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
      GridBoxSpacings -> {"Columns" -> {{0}}}], "Grid"]},
  "Legended",
  DisplayFunction->(GridBox[{{
      TagBox[
       ItemBox[
        PaneBox[
         TagBox[#, "SkipImageSizeLevel"], Alignment -> {Center, Baseline}, 
         BaselinePosition -> Baseline], DefaultBaseStyle -> "Labeled"], 
       "SkipImageSizeLevel"], 
      ItemBox[#2, DefaultBaseStyle -> "LabeledLabel"]}}, 
    GridBoxAlignment -> {"Columns" -> {{Center}}, "Rows" -> {{Center}}}, 
    AutoDelete -> False, GridBoxItemSize -> Automatic, 
    BaselinePosition -> {1, 1}]& ),
  Editable->True,
  InterpretationFunction->(RowBox[{"Legended", "[", 
     RowBox[{#, ",", 
       RowBox[{"Placed", "[", 
         RowBox[{#2, ",", "After"}], "]"}]}], "]"}]& )]], "Output", \
"PluginEmbeddedContent"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["\<\
Siggaard-Andersen, O. (1971). \[OpenCurlyDoubleQuote]Oxygen-Linked Hydrogen \
Ion Binding of Human Hemoglobin. Effects of Carbon Dioxide and 2, \
3-Diphosphoglycerate I. Studies on Erythrolysate.\[CloseCurlyDoubleQuote] \
Scandinavian Journal of Clinical & Laboratory Investigation 27(4): 351-360.\
\>", "Subsection", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"Siggaard", "=", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"6.10", ",", "0.040"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"6.19", ",", "0.110"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"6.29", ",", "0.175"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"6.39", ",", "0.224"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"6.50", ",", "0.286"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"6.60", ",", "0.348"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"6.70", ",", "0.399"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"6.81", ",", "0.445"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"6.90", ",", "0.484"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.00", ",", "0.520"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.11", ",", "0.553"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.21", ",", "0.566"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.31", ",", "0.558"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.40", ",", "0.545"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.51", ",", "0.523"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.61", ",", "0.504"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.72", ",", "0.479"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.80", ",", "0.445"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.91", ",", "0.414"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"8.01", ",", "0.380"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"8.09", ",", "0.348"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"8.20", ",", "0.310"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"8.30", ",", "0.286"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"8.39", ",", "0.256"}], "}"}]}], "}"}], ",", "\n", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"6.09", ",", "0.032"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"6.19", ",", "0.100"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"6.29", ",", "0.154"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"6.39", ",", "0.212"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"6.50", ",", "0.271"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"6.59", ",", "0.321"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"6.71", ",", "0.391"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"6.81", ",", "0.440"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"6.91", ",", "0.472"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.00", ",", "0.499"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.10", ",", "0.530"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.20", ",", "0.531"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.31", ",", "0.515"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.40", ",", "0.469"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.51", ",", "0.426"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.61", ",", "0.361"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.70", ",", "0.295"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.80", ",", "0.213"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.90", ",", "0.121"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"8.01", ",", "0.046"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"8.09", ",", 
         RowBox[{"-", "0.036"}]}], "}"}]}], "}"}], ",", "\n", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"6.09", ",", "0.032"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"6.19", ",", "0.101"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"6.29", ",", "0.158"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"6.39", ",", "0.212"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"6.50", ",", "0.272"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"6.60", ",", "0.322"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"6.70", ",", "0.375"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"6.81", ",", "0.427"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"6.90", ",", "0.450"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.00", ",", "0.481"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.10", ",", "0.485"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.21", ",", "0.477"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.31", ",", "0.415"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.40", ",", "0.352"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.50", ",", "0.283"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.60", ",", "0.197"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.70", ",", "0.100"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.79", ",", "0.007"}], "}"}]}], "}"}], ",", "\n", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"6.09", ",", "0.031"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"6.19", ",", "0.097"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"6.30", ",", "0.152"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"6.39", ",", "0.209"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"6.49", ",", "0.262"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"6.60", ",", "0.315"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"6.70", ",", "0.359"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"6.81", ",", "0.402"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"6.90", ",", "0.415"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.00", ",", "0.422"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.10", ",", "0.402"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.21", ",", "0.375"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.30", ",", "0.299"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.40", ",", "0.198"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.50", ",", "0.100"}], "}"}]}], "}"}], ",", "\n", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"6.10", ",", "0.025"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"6.20", ",", "0.085"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"6.30", ",", "0.148"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"6.39", ",", "0.208"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"6.49", ",", "0.249"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"6.59", ",", "0.298"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"6.70", ",", "0.328"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"6.79", ",", "0.337"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"6.90", ",", "0.332"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.00", ",", "0.311"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.10", ",", "0.259"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.19", ",", "0.175"}], "}"}]}], "}"}]}], 
    "\[IndentingNewLine]", "}"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"Show", "[", 
  RowBox[{
   RowBox[{"Plot", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"dH", "/.", 
        RowBox[{"{", 
         RowBox[{"CO2", "\[Rule]", 
          RowBox[{"aCO2", "*", "0"}]}], "}"}]}], " ", ",", 
       RowBox[{"dH", "/.", 
        RowBox[{"{", 
         RowBox[{"CO2", "\[Rule]", 
          RowBox[{"aCO2", "*", "11"}]}], "}"}]}], " ", ",", 
       RowBox[{"dH", "/.", 
        RowBox[{"{", 
         RowBox[{"CO2", "\[Rule]", 
          RowBox[{"aCO2", "*", "34"}]}], "}"}]}], " ", ",", 
       RowBox[{"dH", "/.", 
        RowBox[{"{", 
         RowBox[{"CO2", "\[Rule]", 
          RowBox[{"aCO2", "*", "80"}]}], "}"}]}], " ", ",", 
       RowBox[{"dH", "/.", 
        RowBox[{"{", 
         RowBox[{"CO2", "\[Rule]", 
          RowBox[{"aCO2", "*", "200"}]}], "}"}]}]}], " ", "}"}], ",", " ", 
     RowBox[{"{", 
      RowBox[{"pH", ",", "6.5", ",", "8"}], "}"}], ",", "\[IndentingNewLine]", 
     RowBox[{"AxesLabel", " ", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{"\"\<pH\>\"", ",", "\"\<\[CapitalDelta]H+\>\""}], "}"}]}], ",",
      " ", 
     RowBox[{"PlotLegends", "\[Rule]", 
      RowBox[{"Placed", "[", 
       RowBox[{
        RowBox[{"{", 
         RowBox[{
         "\"\<model at pCO2=0mmHg\>\"", ",", "\"\<model at pCO2=11mmHg\>\"", 
          ",", "\"\<model at pCO2=34mmHg\>\"", ",", 
          "\"\<model at pCO2=80mmHg\>\"", ",", 
          "\"\<model at pCO2=200mmHg\>\""}], "}"}], ",", "Above"}], "]"}]}]}],
     "]"}], ",", 
   RowBox[{"ListPlot", "[", 
    RowBox[{"Siggaard", ",", 
     RowBox[{"PlotLegends", "\[Rule]", 
      RowBox[{"{", "\"\<Data by Siggaard1971\>\"", "}"}]}]}], "]"}]}], 
  "]"}]}], "Input", "PluginEmbeddedContent"],

Cell[BoxData[
 TemplateBox[{GraphicsBox[{{{}, {}, {
       Hue[0.67, 0.6, 0.6], 
       LineBox[CompressedData["
1:eJwV1nk4VesXB3AiSUUZc+x9TqQMIQppfJe4lDEyJZJEUgil5FdukyQJCUWo
DN3qlhQqGYuUkkwdmfeWIgp1zem3+us8n+c5e3rf9X7XUtzlb+s5Q0BAQFRQ
QODPr3TfPPzhgMb9s12v5taT1PR1yUfQ/UxviNn8eqLquE93CL2C/rajWqqe
rHtR5cUIcmBu4g7xGk498Ug9Vf1CiAPOAXt/N6nWk1zb8fhzszjQZLNOfNS4
nmwp7FaRkuCAcfXQpN+xenIhqtByKZcDnaJKL/W/15O53eJ1jRs48CJY6f7/
ehvIrzMyTc6uHBBVrKVFPzSSz5cPJZqEciCct3hTc3kT+eAcGluYzAG7vjhJ
uYoPZLWP7hyRpxx4FHZu8ZkCPrmudamo+SMHJNsyVIqLm8kMd3NN6UkOZCZt
mhle+pE0tuVTyvIKoHFxtNP2fgu5J1FlXLRaAcbkrw8b3G8l4+ej+pc5KQDn
cM2t+VfbyLrg2zaCwQqQ0/LmlkNoOzkj4/fdLUEBdj5I0fvs3UHgd/fc+EcK
cHmbwOYAXicRTBX0sGlUgJ/xyufPRHeSwtuHgw/9pwBylnllX/7rJJ8Fr8/2
l6IgzuWu5q0tXURe/EDj0EoKNrelpqy/20WKdg8vMrOlQLI9SOvJRBfZc4CT
uSyIgvchj4rCTRki1pfcE3SJgpe+B/1FIhnCKUp37Uf/LDmwYgCtHpPZsDue
AmqnUlD9eYaY698vt79MwWgs+KZeYEjUyfLUVYkUsKm3DLViGSKh0OsweZWC
mB4re70khkhb6L88eYMC8znFoZ2ZDOHdq82OfUDBsy7ehcwShggvfGwknUtB
eMb1pNBShnw5kdaRgBZ9KihsU8aQHHs/uZSHFAik9Y+PlzNk4685Z7PyKFj0
0M3NuJIhXhamXoVPKPjfrfNjT98w5G5fkfKnMgokvrhnaTUzJMYus3RPOQXM
9MMjg+hDxVEufeh9keHZDz4yZEPc9vjvzykQMTfhrGhlSO3qcaGJCgo2VXna
LOtgyI8IXVb8NQV2RRKD090MWaNy57pBHQVWjYc2qg8yZNOO2Eu56J2Sx6aq
0Q6XD5/RqKdAPH7rEt8hhgQJGe9d1ECBc4fS83+H8f06WrVFmygwsFyvqfof
Q+gk8dIPzRRcWah+R3CCIQKzA9uDuyi4XeL8zkSIJeLgVDuIzt3dQprQ1OEN
5T4MBUc+9FOewixZ/UksawdLQeTh49SJmSwJLLvpa/IJ19MxfHnuLJZ0hzRO
yfRSkPnydsLYHJa87DNQyBukIJjJGJORZkn0WelbGkMUmDkb7o1B2ykP6mag
578mZmIyLOl0zba6NExB/h511yn0WK3MyYCfuJ5V2hXNcixRLRj+ojlGQXrA
zLgQBZZEnrqbn/WbAotxsXILJZZsWRRhxBWgIV27TjkPLVvkUXsZXaHtOEIt
ZsmNEU7faUEaTszz+dSHfrr3HO0hRMNVDY/hsCUs+WrtdZo3i4amJ/ZF0aos
saAW2SaJ0+DTKVK1QYslPdbtQhwJGmIFr+mmoP8+lZKXjJYXSfo5hs7rWyif
Np+GRZ0RfjnLWcJ9sqAzU5KGXfnfN8npsOS7vZDfQ1kaNBR7o16sxPc/V8bT
k6MhKuGzmpwuS5SLwt7no8XCz8jvRTspT+k+XUhD6vGAQTE9lpQO/5ws5dDQ
7vY61ESfJXEXe87VcGkYXPx2OsWAJRrPM9Zu4dEQYX2qtBtdObJr4D16Tb5a
w7LVLJlw7djSuAivD+AOFaA9NPhyrUr4/SsuClStYYnuq1eZvUtpKB2U8n25
jiU1U2cd96nQcNJZb7PwepZ4a5vMHkBT9L1gQF9LLN8/qErDtrMnK/LRIl6F
K0fVaVBqrtBJ3sCSDzP+LRNeTsPb1sPrjYAlV4V8Xh1De5cWfAxA7xBWeT+C
3m+7vyMN3TPzeucXbXy/Ewq8CfSI6OXfb1bQMFE/EJxtiPs123aWyUoaZI9o
Wb9HHxeTkChBD0TmRU+gReae4z7QpeG68gkj8424/xLH1l/Wp8FZJOTUJ/RH
iTV/ia+i4c4Zx8tiRixJnT9qcRadcdpWfDl6qWSAS4gBDTdsI/WC0foynqGu
a2h4vjzU6RfaQcHyyZINNFg3+fR/M2YJhxIrS0XX3e/xFfuLJe3Uyyo5QoOi
qoHDErQX15A/G3D/Uiy2b0MHK+qNDhjS4Dtar/8UvUZpeNprIw2iOfHfatHT
SvdFOtFlHPF5n9HhymqydUY0zGihjy8wYcllFVov/y8apjOdtN3QTqof1y03
wXqVDqcD0JRaovEt9NjNrQEn0RnqC+yumtJwackLi5to72U126U2Yb28cG/I
RWtonPeIQru2x5eXoR9pzgw6vpkGkysP6trQR7TKj46iXYISfvah1y0PO3nA
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
        "]]}, {
       Hue[0.9060679774997897, 0.6, 0.6], 
       LineBox[CompressedData["
1:eJwV1nc8l98XAHChQaFvVj7u46OFJMlMwz1JUohUUhmFKEpSZJRdIomKhgZF
SpoiER+jRITIyvo8hUpWtKxfv9Nfz+v9us+699x7zpnjeNBqj6CAgIDwJAGB
f1epHjG8cGCCm7xStbeWXk9ameiLDlRRlbo8UEtVtrlrf0cbCZeoTxuupStf
lrl8nMQB/8E4tc8jtdTpeljFSyEO3LNLMr4ztY4+sRq5EDmVA6d0yHvdeXXU
Mq9TWVKCA9HWO83Dd9TRM9F55koKHLBeZ7qqqbyOzugUr6034EDJuhQlrYL3
dOKEdMMOOw5cnW1v6pRaTz/He180DuDAsLWRsXRUA23cERCXl8iBYiMDC5+w
Rqrvpj19Si4H2iIC8133N9Fk9fP5zR84IPlyrXK9azMV3G26WGqMAz8fH9Jf
b/uB1rdlk/ly8rBn3kc5dmULfSBRZpSvLw/qIceD1Ba10pHT0b2LbOShdobo
USrURlf6pG+a5CMPcplzs9Oq2+gJaY8BhwR5EOx71Ol7q53C384ZF57i+Oe4
nSr2HXTS9UlOm+rlgTenw99WjE/z0o/6eP+UB7EYv66J3Xz6eVKyyEFJAmLP
vDdM3OFTOXHP+u9aBFznpiW59fLpEdnruu7aBNbsGzex6uPTKsXKi53oqt4G
G/1+Pg3XUtnRqENgYZ7lg8mDfNpvw29/oUfAq7pC9eIwnxbfsvwSsYJAM8Su
ujbKp+76S8eYNQSkxnP2ak9jaamhg+1FtNCa3BvTRFiqaHYmf6YRgQUx3/Va
0Q32X4OE1hLIDtE/HTKdpRCeLPzVmMBbtcxnL8VZKlX9n/jTDQQk+MHjatIs
zXceUtxgRWC0XK8pbA5Le4WF0t6i5yssa948l6WcVMnFmzYTqBXzmj1vHkt9
u7T1bbYQKBpMsOTNZ6mmy9FNLtYEyvtLkvqVWXrHdTwkdAeBbeO8SBV1lp5z
m/Ip15FAw7lnZVOXs7RQVHafgROBY8EJsjz0QLryQBH6oQV71XsFS82+mYyV
ORMI3VCynr+SpVP3n5ZsdCGg/PH3ggzK0mMHZhoNuxE4J2nwhFnLUldPTuqi
wwSulC094GLB0o0+iqUZ6JymSzqTLFmqfUzp8+IjBOSFN2snogVPaS7U8CZg
m9FSV7mJpVdvbLivfZSASfzEBaUtLK2p8s9aFUAgszq5L9OGpcsWt7yyCCNw
Rvmmu/Zuliposd016J/bLGKz0JP1P0+1CidgVLCyU8eRpbVGw+u3nCDQ2/Bn
trYTS/fbTq+yiSCQHNH2UGkPS5NPr2jYfZpARHqeY+delor2JHYfPk9gY8OR
HYUHcb3zk+x60bbqFVxFT5aqxqa+d75A4K+b38IgtKnuw+Kt8QQq9y8WWXGI
pdGhxdf1LmK8quf/vOvFUgn5r9ZjVwi0K03YOHvj/ujve3s4kYDWoKFFDlqj
aMioF73v5fyI6T4stXQd12y7SqBEVCLvIfpcpoQE7zqBJa1F6gNHcb+Y6b4O
vUkgpf8jd4M/S+dzVxiMoVVy0uXPoXWGaNbhWwRCAuysm9HWl9bfck4hIKrZ
HLEngKUXO22DjG8TyM8IbjhyDOd3PExPNB092XPCIxDnZ3nqQSg6fHi8Lh29
fN6ZBWPoWlLd3YXeWZ4g2XuPgKxZYuH2IIyXdPrA2/sE3DsMYFkwS7kPatLi
HhOwObjMtCaEpcKzc9ZIPSHgd0f8jVAoS7+E3OhIQCsvz3fQRT/a6iF7NZNA
2d53VZfQhhPTI25nETjySj7bKoylSq7DcxdmE3BhRrsC0dPffSi4hw45L74o
Hf0+5e6vR88IJE0T/TGBdjFb55L3nECAflLAlXCWbshWFzTIJfBBNdyCh16i
KHO9EL3RWUDvE/rPcGf9qzw8j7I/qMoJlrbaVR4yeUFAY1h493p04etMsQr0
wWb+hX3oyMTQtTX5BDosF2unoT0mu7FWBQQ63+vdeIm2OrjpeD06ev1qwqI5
axSzPvAIbH96wlT2JEszevLndxUR0Ny33s8XHbsltdC1mIBIBc8jBu1dEG3b
g17ukHTkFtrg3M4LAyUEXsxtfPQGPXfcUMPrJYH1QuXdreipLqqVP9AlvrZq
/ega/RGh0VcEarYmdYlFsPTpLf6NY6UY3yl9NgR9WaxsxV/0oQ7JloXowKMP
G0NeEzit/cldF+3IJhwWLiPw48DC6YZoY9NAiQh0/5SsHDO0ataeeyLlBGRi
thyxRotzzddFo71TG1Y5oIdPaX8Sf0PghqCotCu6aUg+KO6fPfJHDqBf2ArJ
S1UQYEp53w6jk0p7shPQniMdPb7ocI1aK7lKXL8Zfb+Oofdeed6fiNaVzZYI
RpsLJ0cpvMXzbiSqE4rW9DillIxWq89xCUPLNB0snleF50E+LuWfR1dvs7+N
nhfo2P/v/o57BqMq1QTs/cbXhKBfSisl3EMvuqqeGoi+EySmqV6D748s+y8A
Hf31x9tHaNPRy5E+6EObW/dpvSMg/NxrxiG0dX7J5Gy00u25V9zQy5XvJS+r
JaCQ7afphDaxjzv/BA0GfW47/90ff/SEWh3OJ3vJWyu0c6Xd0dvoaC3O9vXo
w0JG+xTfE9jVckKcokOXq+68gg76aNqnhY49NNNcqp7AljNrfyqjMzpaNaY1
4Pqp6wf/i3euTMncULTpeJfgX9wPZeZ3pcbRYozagwF0Z573n4FGAhee9hyv
Qg8N7ezZ10SgMETm5gu0gKph66d/3mjYfxfNXBIvbGzG/WU06X8haLXqH483
fSBgaGRStB+9fErLrQp01OCve9Zo6yNpEbwWAk33h38po53vnfHTbyUQJ/PL
WgLt9fGweyY6qqWs7SeejxhLsEhrI5DbauJQiL4aobR6TjsB6eH07Sno9IIZ
WoloYc46/wj0a7VmmbMdeN4FLy02RQuIeLX7sATM807ZlOF5FgebmkH0Z4e0
4FQ0OWpQ7PaRQE98w9sQtH6X6G37TwQcteoa9NBeRbcOGHcReLwRblzG/BH8
J9KhEL1mfvu3g+iYJZ6blncTMF7parsWfe/aSh31z7h+VXfv9GG+6vSrH5f+
ivXKd/SrFnroUV7/WbR299imf/lO4EsyX6SHwFjU69Z3mA8Za4+XE2inFeo7
9qOtNadGd/USWGpjNZiA+fN1zzL5rEE8j5w/bsWYb2MipO6ofcf6GbFq0Qn0
lvmD2inoVbPLpdah+XZpG88PYbzqljiVHcd8ViMdeugHxifj3tdCzO8qz4a+
LP6D9TZJMiQS60H/5irvVHRVfGSpAfrp4F1BZoSA23RDrWE/7E9Ud5MZowR2
doyFbEdvv1Zt0TNGIKZC8bu8L0ujwjKyb/8lIHe6fvQo1i9LxVNrFAQYEDlX
lMpFy+Q71cSj7yZMeJceYenNX5ye8EkMbLT7duI/dO6+SMZJiIEpiht2XcP6
+M3CJZw7lYFg8cedp7HemhFFq0viDEicybctwXrcbdEuxJFgIGCW5KW16OCw
q1mJaLj+8G2pK0uzembL3ZjJwK/9i5VLXbAfeP4fP3UWA9lyFmdznLGf2Srk
kSnDwOvDHOn9u7Cenu2OrFJgwKWlWEhsG+7nkpQVllwGwn7/XeNhjf3cL8e+
d2hHVsu/aivmD7sOy3pFBmQ0Jl6fxn7ESa1JtnUuA7nGEV0j2K9ol5enflVi
YK3l7hkpZixtFLxfJLyEgRf9OupLVrP0ipBb+XG057eZNQHAUnth5Xe/0LeD
20++xv6pe3Iy/4sGA6bxQ5q2Biz9NS3+b6UmA9xF7qH+2H/JSBxfFa/LwJ04
854oHdwv8ubPFxgwMN77k46qYH0hokXX0UlPmjYvRLeT12WyFL+/4KPfNuz/
XBRWN4kAAwJXpMcfLWCpzxyd332rGagMymuwwX4yXpnRyV7LQHmcbl2APNZT
rb5HxuY4fzNHB3Ex7JcqotvK0YMKF0Onz8B67qQmar6RgV2/ok5PxX5W+5y7
02YLBoyfb9k4jv3whcGv0rs2MWBNxi40CbN06/1uf7+tDMg6bJO0HefTBiW+
UYYdAwrvfFfH9PBpo1xd038eGH9df5pYwqdKsnuTzqH5kjMNthXzqY/UhKvk
Qdw/35RUZhXxcT2Uf0t5MiA5fLMgvIBPrYUDpGd7MeDb4j5s+xzf3z/XSsGH
gTdGHoeaH/BpfYlXhWogAwXOpQcFL/Np3YFZBWticLw90mOWG5+unjF5nmkG
AwPVwWc7pvBplsO1wpZKBgL/pzTdXqqDJk58aVv9jYH9hU/p0+nt1F8kJkdc
RAEYT2/vTz2t1OFNU4XzQgUwsU6r9Ytrodn1Dfax6xTguURhO9X8QCUT/FXX
7lWAI6UGmUEXm+jHpHfe1ScVoHUkOP3ERAO9KxcaWJiiAHqyvdnZW+qpz7om
3vJXOL7uRVShZx3N4rHBUZ8UIPdq0Y6Gy+/oaG+sv5MwF5SHpSI2SVbTZacu
L701nwu7ar4+ffXlDf1yYOveHEMuVHb2SbR9L6XXpz1rtHbiQkdYjW1mQjEt
7asofRPCBW9bB+c/4y/oZ1h+OPUGF458WHFG9OdTKr5+o41IIRdyOAXJxhfv
0LRE6XzDdi7E3tZwf2AQR2PF5J6Uo/kWiyqXP46l/kEkzbKDCwIm66Nq58VS
M6d5cfZ8LsyMj881mRVDB1WX7vH/yIUavSWat+9E0mW5ZmJPuvF/tXwd65uD
6ZumMLs5A/j8ySDHKfN1eZkbIqzu/HPmhV06Z814V19ErVsyyIXgbs0X9pO3
8TyS4pau+s4FuCLVt5Q682btvTF5+zAXFCVfNcY1e/F2/s69H/ubC56PAvLP
zwnlGe0ruCn7B58XPen9QC+Mp95SdPE6+pHVlZQM83CeAK8sJGOEC0mvFw1Y
+Z3kpZxs2Fo2hu879KVnTXUU78yf5g0W41zQeD8mcbTzNM/HrY02oC0bz+VF
j0TzTDZ2LuycwO8teKTuMO8sb2nhZwX3/3FBxZu2iZFYHkfzm+QQ+ovKY1W7
27E8oZT+aX5/cTzwjec1jTher/TQxF/0TJP7SVW5cbz/AwvXkXs=
        "]]}, {
       Hue[0.1421359549995791, 0.6, 0.6], 
       LineBox[CompressedData["
1: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
        "]]}, {
       Hue[0.37820393249936934`, 0.6, 0.6], 
       LineBox[CompressedData["
1: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
        "]]}, {
       Hue[0.6142719099991583, 0.6, 0.6], 
       LineBox[CompressedData["
1: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
/oKFbRclLg4rw/8DhNQBJQ==
        "]]}}, {{}, {{
        RGBColor[0.24720000000000014`, 0.24, 0.6], 
        PointBox[CompressedData["
1:eJxTTMoPSmViYGCQAGIQnQYGEg7VIuvcH1YtsT/8VSOm/5CEgyaQ/Kqxxx5C
SzpA1B2zB/Fi+iUdKl+qGXKsOWPPAAZSDs9/r/x4yfeSPUSdlINQ84FTC12v
2Z89AwJSDh+WH/M277xpb8t1fXGBrTTUvjv2s2aCgLRDwtMLSrd/3oOaJ+Ow
pACk8oF9IViDjIMkSxif7qaH9iDdXNdlHMDWyzyCmifr4AQ24CHUPFkHiL6H
9mBpLjkH5ds/67L2wMyTcwh5vHT2EYUH9g+rQA6RcwAaPvf98nv2xmAgD3cf
xB3yDmDn1d2yb30duEOOVcEhaIcckHnDHqRKRE8B7l+I/xUcIO68DHWPAjx8
PEAWHldw+APiJl2wBwAFsK+V
         "]]}, {
        RGBColor[0.6, 0.24, 0.4428931686004542], 
        PointBox[CompressedData["
1:eJxTTMoPSmViYGAQBWIQHdN/6KtGjITDn5UfL/kmLbA/DOT1H5JwmDUTBHba
a4IVSDo0Hzi10HXbYXuw8n5Jh07HhKcXlE7bM4CBlMMnoG6BiIv2EPOkHFTZ
Gqc6d1+xv764wJbrupTDAin9uypsN+2BHKCItAPE3Dv2S0DSi6UdMia+rbE3
vQc1T8YhjE9309z39+3TwEDG4RvIWV8f2J89AwIyDqeBrvn89wHUPFmHapF1
7g+rHthD3C3rkLWnZLIEyz17sDSXnAPQcqCDbtsXgjXIOWw5UbZvvtR1qHly
Dg+rQAZcsjcGA3mo+tNQ8+QdQL69/XOffevrwB1yrAoOUSnW9/17l9uDbBXR
U3AA8abnLdoPANRNmTw=
         "]]}, {
        RGBColor[0.6, 0.5470136627990908, 0.24], 
        PointBox[{{6.09, 0.032}, {6.19, 0.101}, {6.29, 0.158}, {6.39, 
         0.212}, {6.5, 0.272}, {6.6, 0.322}, {6.7, 0.375}, {6.81, 0.427}, {
         6.9, 0.45}, {7., 0.481}, {7.1, 0.485}, {7.21, 0.477}, {7.31, 
         0.415}, {7.4, 0.352}, {7.5, 0.283}, {7.6, 0.197}, {7.7, 0.1}, {7.79, 
         0.007}}]}, {
        RGBColor[0.24, 0.6, 0.33692049419863584`], 
        PointBox[{{6.09, 0.031}, {6.19, 0.097}, {6.3, 0.152}, {6.39, 0.209}, {
         6.49, 0.262}, {6.6, 0.315}, {6.7, 0.359}, {6.81, 0.402}, {6.9, 
         0.415}, {7., 0.422}, {7.1, 0.402}, {7.21, 0.375}, {7.3, 0.299}, {7.4,
          0.198}, {7.5, 0.1}}]}, {
        RGBColor[0.24, 0.3531726744018182, 0.6], 
        PointBox[{{6.1, 0.025}, {6.2, 0.085}, {6.3, 0.148}, {6.39, 0.208}, {
         6.49, 0.249}, {6.59, 0.298}, {6.7, 0.328}, {6.79, 0.337}, {6.9, 
         0.332}, {7., 0.311}, {7.1, 0.259}, {7.19, 0.175}}]}}, {}}}, 
    AspectRatio -> NCache[GoldenRatio^(-1), 0.6180339887498948], Axes -> True,
     AxesLabel -> {
      FormBox["\"pH\"", TraditionalForm], 
      FormBox["\"\[CapitalDelta]H+\"", TraditionalForm]}, 
    AxesOrigin -> {6.6000000000000005`, 0}, Method -> {}, 
    PlotRange -> {{6.5, 8}, {-0.19165453239065355`, 0.6024724209303711}}, 
    PlotRangeClipping -> True, PlotRangePadding -> {
      Scaled[0.02], 
      Scaled[0.02]}],
   TemplateBox[{
    "\"model at pCO2=0mmHg\"", "\"model at pCO2=11mmHg\"", 
     "\"model at pCO2=34mmHg\"", "\"model at pCO2=80mmHg\"", 
     "\"model at pCO2=200mmHg\""}, "LineLegend", DisplayFunction -> (StyleBox[
      StyleBox[
       PaneBox[
        TagBox[
         GridBox[{{
            TagBox[
             GridBox[{{
                GraphicsBox[{{
                   Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    Hue[0.67, 0.6, 0.6]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                   Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    Hue[0.67, 0.6, 0.6]], {}}}, AspectRatio -> Full, 
                 ImageSize -> {20, 10}, PlotRangePadding -> None, 
                 ImagePadding -> 1, 
                 BaselinePosition -> (Scaled[0.1] -> Baseline)], #, 
                GraphicsBox[{{
                   Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    Hue[0.9060679774997897, 0.6, 0.6]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                   Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    Hue[0.9060679774997897, 0.6, 0.6]], {}}}, AspectRatio -> 
                 Full, ImageSize -> {20, 10}, PlotRangePadding -> None, 
                 ImagePadding -> 1, 
                 BaselinePosition -> (Scaled[0.1] -> Baseline)], #2}}, 
              GridBoxAlignment -> {
               "Columns" -> {Center, Left}, "Rows" -> {{Baseline}}}, 
              AutoDelete -> False, 
              GridBoxDividers -> {
               "Columns" -> {{False}}, "Rows" -> {{False}}}, 
              GridBoxItemSize -> {"Columns" -> {{All}}, "Rows" -> {{All}}}, 
              GridBoxSpacings -> {"Columns" -> {{0.8, 0.5}}}], "Grid"]}, {
            TagBox[
             GridBox[{{
                GraphicsBox[{{
                   Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    Hue[0.1421359549995791, 0.6, 0.6]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                   Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    Hue[0.1421359549995791, 0.6, 0.6]], {}}}, AspectRatio -> 
                 Full, ImageSize -> {20, 10}, PlotRangePadding -> None, 
                 ImagePadding -> 1, 
                 BaselinePosition -> (Scaled[0.1] -> Baseline)], #3, 
                GraphicsBox[{{
                   Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    Hue[0.37820393249936934`, 0.6, 0.6]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                   Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    Hue[0.37820393249936934`, 0.6, 0.6]], {}}}, AspectRatio -> 
                 Full, ImageSize -> {20, 10}, PlotRangePadding -> None, 
                 ImagePadding -> 1, 
                 BaselinePosition -> (Scaled[0.1] -> Baseline)], #4}}, 
              GridBoxAlignment -> {
               "Columns" -> {Center, Left}, "Rows" -> {{Baseline}}}, 
              AutoDelete -> False, 
              GridBoxDividers -> {
               "Columns" -> {{False}}, "Rows" -> {{False}}}, 
              GridBoxItemSize -> {"Columns" -> {{All}}, "Rows" -> {{All}}}, 
              GridBoxSpacings -> {"Columns" -> {{0.8, 0.5}}}], "Grid"]}, {
            TagBox[
             GridBox[{{
                GraphicsBox[{{
                   Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    Hue[0.6142719099991583, 0.6, 0.6]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                   Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    Hue[0.6142719099991583, 0.6, 0.6]], {}}}, AspectRatio -> 
                 Full, ImageSize -> {20, 10}, PlotRangePadding -> None, 
                 ImagePadding -> 1, 
                 BaselinePosition -> (Scaled[0.1] -> Baseline)], #5}}, 
              GridBoxAlignment -> {
               "Columns" -> {Center, Left}, "Rows" -> {{Baseline}}}, 
              AutoDelete -> False, 
              GridBoxDividers -> {
               "Columns" -> {{False}}, "Rows" -> {{False}}}, 
              GridBoxItemSize -> {"Columns" -> {{All}}, "Rows" -> {{All}}}, 
              GridBoxSpacings -> {"Columns" -> {{0.8, 0.5}}}], "Grid"]}}, 
          GridBoxAlignment -> {"Columns" -> {{Left}}, "Rows" -> {{Top}}}, 
          AutoDelete -> False, 
          GridBoxDividers -> {"Columns" -> {{None}}, "Rows" -> {{None}}}, 
          GridBoxItemSize -> {"Columns" -> {{All}}, "Rows" -> {{All}}}, 
          GridBoxSpacings -> {"Columns" -> {{0}}, "Rows" -> {{1}}}], "Grid"], 
        Alignment -> Left, AppearanceElements -> None, 
        ImageMargins -> {{5, 5}, {5, 5}}, ImageSizeAction -> "ResizeToFit"], 
       LineIndent -> 0, StripOnInput -> False], {FontFamily -> "Times"}, 
      Background -> Automatic, StripOnInput -> False]& ), Editable -> True, 
    InterpretationFunction :> (RowBox[{"LineLegend", "[", 
       RowBox[{
         RowBox[{"{", 
           RowBox[{
             RowBox[{"Directive", "[", 
               RowBox[{"Hue", "[", 
                 RowBox[{"0.67`", ",", "0.6`", ",", "0.6`"}], "]"}], "]"}], 
             ",", 
             RowBox[{"Directive", "[", 
               RowBox[{"Hue", "[", 
                 RowBox[{"0.9060679774997897`", ",", "0.6`", ",", "0.6`"}], 
                 "]"}], "]"}], ",", 
             RowBox[{"Directive", "[", 
               RowBox[{"Hue", "[", 
                 RowBox[{"0.1421359549995791`", ",", "0.6`", ",", "0.6`"}], 
                 "]"}], "]"}], ",", 
             RowBox[{"Directive", "[", 
               RowBox[{"Hue", "[", 
                 RowBox[{"0.37820393249936934`", ",", "0.6`", ",", "0.6`"}], 
                 "]"}], "]"}], ",", 
             RowBox[{"Directive", "[", 
               RowBox[{"Hue", "[", 
                 RowBox[{"0.6142719099991583`", ",", "0.6`", ",", "0.6`"}], 
                 "]"}], "]"}]}], "}"}], ",", 
         RowBox[{"{", 
           RowBox[{#, ",", #2, ",", #3, ",", #4, ",", #5}], "}"}], ",", 
         RowBox[{"LegendLayout", "\[Rule]", "\"Row\""}]}], "]"}]& )],
   TemplateBox[{"\"Data by Siggaard1971\""}, "PointLegend", 
    DisplayFunction -> (StyleBox[
      StyleBox[
       PaneBox[
        TagBox[
         GridBox[{{
            TagBox[
             GridBox[{{
                GraphicsBox[{{}, {
                   Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    RGBColor[0.24720000000000014`, 0.24, 0.6]], {
                    Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    RGBColor[0.24720000000000014`, 0.24, 0.6]], 
                    PointBox[
                    NCache[{
                    Scaled[{
                    Rational[1, 2], 
                    Rational[1, 2]}]}, {
                    Scaled[{0.5, 0.5}]}]]}}}, AspectRatio -> Full, 
                 ImageSize -> {10, 10}, PlotRangePadding -> None, 
                 ImagePadding -> 1, 
                 BaselinePosition -> (Scaled[0.1] -> Baseline)], #}}, 
              GridBoxAlignment -> {
               "Columns" -> {Center, Left}, "Rows" -> {{Baseline}}}, 
              AutoDelete -> False, 
              GridBoxDividers -> {
               "Columns" -> {{False}}, "Rows" -> {{False}}}, 
              GridBoxItemSize -> {"Columns" -> {{All}}, "Rows" -> {{All}}}, 
              GridBoxSpacings -> {"Columns" -> {{0.5}}, "Rows" -> {{0.8}}}], 
             "Grid"]}}, 
          GridBoxAlignment -> {"Columns" -> {{Left}}, "Rows" -> {{Top}}}, 
          AutoDelete -> False, 
          GridBoxItemSize -> {
           "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
          GridBoxSpacings -> {"Columns" -> {{1}}, "Rows" -> {{0}}}], "Grid"], 
        Alignment -> Left, AppearanceElements -> None, 
        ImageMargins -> {{5, 5}, {5, 5}}, ImageSizeAction -> "ResizeToFit"], 
       LineIndent -> 0, StripOnInput -> False], {FontFamily -> "Times"}, 
      Background -> Automatic, StripOnInput -> False]& ), Editable -> True, 
    InterpretationFunction :> (RowBox[{"PointLegend", "[", 
       RowBox[{
         RowBox[{"{", 
           RowBox[{
             RowBox[{"Directive", "[", 
               RowBox[{"RGBColor", "[", 
                 RowBox[{"0.24720000000000014`", ",", "0.24`", ",", "0.6`"}], 
                 "]"}], "]"}], ",", 
             RowBox[{"Directive", "[", 
               RowBox[{"RGBColor", "[", 
                 RowBox[{"0.6`", ",", "0.24`", ",", "0.4428931686004542`"}], 
                 "]"}], "]"}], ",", 
             RowBox[{"Directive", "[", 
               RowBox[{"RGBColor", "[", 
                 RowBox[{"0.6`", ",", "0.5470136627990908`", ",", "0.24`"}], 
                 "]"}], "]"}], ",", 
             RowBox[{"Directive", "[", 
               RowBox[{"RGBColor", "[", 
                 RowBox[{"0.24`", ",", "0.6`", ",", "0.33692049419863584`"}], 
                 "]"}], "]"}], ",", 
             RowBox[{"Directive", "[", 
               RowBox[{"RGBColor", "[", 
                 RowBox[{"0.24`", ",", "0.3531726744018182`", ",", "0.6`"}], 
                 "]"}], "]"}]}], "}"}], ",", 
         RowBox[{"{", #, "}"}], ",", 
         RowBox[{"LegendLayout", "\[Rule]", "\"Column\""}], ",", 
         RowBox[{"LegendMarkers", "\[Rule]", "False"}]}], "]"}]& )]},
  "Legended",
  DisplayFunction->(GridBox[{{
      ItemBox[#2, DefaultBaseStyle -> "LabeledLabel"], ""}, {
      TagBox[
       ItemBox[
        PaneBox[
         TagBox[#, "SkipImageSizeLevel"], Alignment -> {Center, Baseline}, 
         BaselinePosition -> Baseline], DefaultBaseStyle -> "Labeled"], 
       "SkipImageSizeLevel"], 
      ItemBox[#3, DefaultBaseStyle -> "LabeledLabel"]}}, 
    GridBoxAlignment -> {"Columns" -> {{Center}}, "Rows" -> {{Center}}}, 
    AutoDelete -> False, GridBoxItemSize -> Automatic, 
    BaselinePosition -> {2, 1}]& ),
  Editable->True,
  InterpretationFunction->(RowBox[{"Legended", "[", 
     RowBox[{#, ",", 
       RowBox[{"{", 
         RowBox[{
           RowBox[{"Placed", "[", 
             RowBox[{#2, ",", "Above"}], "]"}], ",", 
           RowBox[{"Placed", "[", 
             RowBox[{#3, ",", "After"}], "]"}]}], "}"}]}], 
     "]"}]& )]], "Output", "PluginEmbeddedContent"]
}, Open  ]],

Cell[BoxData[""], "Input", "PluginEmbeddedContent"]
}, Open  ]],

Cell[CellGroupData[{

Cell["\<\
Naeraa, N., et al. (1963). \[OpenCurlyDoubleQuote]The influence of \
simultaneous, independent changes in pH and carbon dioxide tension on the in \
vitro oxygen tension-saturation relationship of human blood.\
\[CloseCurlyDoubleQuote] Scandinavian Journal of Clinical & Laboratory \
Investigation 15(2): 141-151.\
\>", "Subsection", "PluginEmbeddedContent"],

Cell[BoxData[
 RowBox[{
  RowBox[{
   RowBox[{"Naeraa", " ", "=", " ", 
    RowBox[{"{", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{
        RowBox[{"Table", "[", 
         RowBox[{"49.7", ",", " ", 
          RowBox[{"{", "6", "}"}]}], "]"}], ",", " ", 
        RowBox[{"Table", "[", 
         RowBox[{"50.2", ",", " ", 
          RowBox[{"{", "7", "}"}]}], "]"}], ",", " ", 
        RowBox[{"Table", "[", 
         RowBox[{"49.9", ",", " ", 
          RowBox[{"{", "6", "}"}]}], "]"}], ",", " ", 
        RowBox[{"Table", "[", 
         RowBox[{"51.3", ",", " ", 
          RowBox[{"{", "6", "}"}]}], "]"}], ",", " ", 
        RowBox[{"Table", "[", 
         RowBox[{"52.8", ",", " ", 
          RowBox[{"{", "3", "}"}]}], "]"}], ",", " ", 
        RowBox[{"Table", "[", 
         RowBox[{"82.5", ",", " ", 
          RowBox[{"{", "7", "}"}]}], "]"}], ",", " ", 
        RowBox[{"Table", "[", 
         RowBox[{"87.7", ",", " ", 
          RowBox[{"{", "7", "}"}]}], "]"}], ",", " ", 
        RowBox[{"Table", "[", 
         RowBox[{"88.2", ",", " ", 
          RowBox[{"{", "6", "}"}]}], "]"}], ",", " ", 
        RowBox[{"Table", "[", 
         RowBox[{"88.8", ",", " ", 
          RowBox[{"{", "6", "}"}]}], "]"}]}], "}"}], ",", " ", "\n", "    ", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"Table", "[", 
         RowBox[{"20.3", ",", " ", 
          RowBox[{"{", "6", "}"}]}], "]"}], ",", " ", 
        RowBox[{"Table", "[", 
         RowBox[{"45.7", ",", " ", 
          RowBox[{"{", "7", "}"}]}], "]"}], ",", " ", 
        RowBox[{"Table", "[", 
         RowBox[{"63.2", ",", " ", 
          RowBox[{"{", "6", "}"}]}], "]"}], ",", " ", 
        RowBox[{"Table", "[", 
         RowBox[{"82.", ",", " ", 
          RowBox[{"{", "6", "}"}]}], "]"}], ",", " ", 
        RowBox[{"Table", "[", 
         RowBox[{"0.", ",", " ", 
          RowBox[{"{", "3", "}"}]}], "]"}], ",", " ", 
        RowBox[{"Table", "[", 
         RowBox[{"21.8", ",", " ", 
          RowBox[{"{", "7", "}"}]}], "]"}], ",", " ", 
        RowBox[{"Table", "[", 
         RowBox[{"40.7", ",", " ", 
          RowBox[{"{", "7", "}"}]}], "]"}], ",", " ", 
        RowBox[{"Table", "[", 
         RowBox[{"63.8", ",", " ", 
          RowBox[{"{", "6", "}"}]}], "]"}], ",", " ", 
        RowBox[{"Table", "[", 
         RowBox[{"89.9", ",", " ", 
          RowBox[{"{", "6", "}"}]}], "]"}]}], "}"}], ",", " ", "\n", "    ", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"{", 
         RowBox[{
         "7.291", ",", " ", "7.37", ",", " ", "7.47", ",", " ", "7.543", ",", 
          " ", "7.637", ",", " ", "7.775"}], "}"}], ",", " ", 
        RowBox[{"{", 
         RowBox[{
         "7.149", ",", " ", "7.193", ",", " ", "7.281", ",", " ", "7.35", ",",
           " ", "7.416", ",", " ", "7.483", ",", " ", "7.557"}], "}"}], ",", 
        " ", 
        RowBox[{"{", 
         RowBox[{
         "7.06", ",", " ", "7.202", ",", " ", "7.258", ",", " ", "7.321", ",",
           " ", "7.38", ",", " ", "7.444"}], "}"}], ",", " ", "\n", "     ", 
        RowBox[{"{", 
         RowBox[{
         "7.024", ",", " ", "7.141", ",", " ", "7.198", ",", " ", "7.248", 
          ",", " ", "7.3", ",", " ", "7.35"}], "}"}], ",", " ", 
        RowBox[{"{", 
         RowBox[{"7.443", ",", " ", "7.624", ",", " ", "7.842"}], "}"}], ",", 
        " ", 
        RowBox[{"{", 
         RowBox[{
         "7.218", ",", " ", "7.312", ",", " ", "7.418", ",", " ", "7.528", 
          ",", " ", "7.588", ",", " ", "7.665", ",", " ", "7.776"}], "}"}], 
        ",", " ", 
        RowBox[{"{", 
         RowBox[{
         "7.159", ",", " ", "7.192", ",", " ", "7.28", ",", " ", "7.341", ",",
           " ", "7.428", ",", " ", "7.505", ",", " ", "7.557"}], "}"}], ",", 
        " ", "\n", "     ", 
        RowBox[{"{", 
         RowBox[{
         "7.02", ",", " ", "7.164", ",", " ", "7.222", ",", " ", "7.266", ",",
           " ", "7.352", ",", " ", "7.409"}], "}"}], ",", " ", 
        RowBox[{"{", 
         RowBox[{
         "7.03", ",", " ", "7.099", ",", " ", "7.171", ",", " ", "7.208", ",",
           " ", "7.249", ",", " ", "7.32"}], "}"}]}], "}"}], ",", " ", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"{", 
         RowBox[{
         "0.787", ",", " ", "0.825", ",", " ", "0.858", ",", " ", "0.871", 
          ",", " ", "0.897", ",", " ", "0.922"}], "}"}], ",", " ", "\n", 
        "     ", 
        RowBox[{"{", 
         RowBox[{
         "0.692", ",", " ", "0.728", ",", " ", "0.768", ",", " ", "0.799", 
          ",", " ", "0.825", ",", " ", "0.85", ",", " ", "0.86"}], "}"}], ",",
         " ", 
        RowBox[{"{", 
         RowBox[{
         "0.646", ",", " ", "0.714", ",", " ", "0.746", ",", " ", "0.775", 
          ",", " ", "0.809", ",", " ", "0.825"}], "}"}], ",", " ", 
        RowBox[{"{", 
         RowBox[{
         "0.604", ",", " ", "0.668", ",", " ", "0.702", ",", " ", "0.745", 
          ",", " ", "0.77", ",", " ", "0.789"}], "}"}], ",", " ", 
        RowBox[{"{", 
         RowBox[{"0.905", ",", " ", "0.934", ",", " ", "0.968"}], "}"}], ",", 
        " ", "\n", "     ", 
        RowBox[{"{", 
         RowBox[{
         "0.934", ",", " ", "0.946", ",", " ", "0.965", ",", " ", "0.974", 
          ",", " ", "0.978", ",", " ", "0.983", ",", " ", "0.985"}], "}"}], 
        ",", " ", 
        RowBox[{"{", 
         RowBox[{
         "0.935", ",", " ", "0.947", ",", " ", "0.95", ",", " ", "0.961", ",",
           " ", "0.969", ",", " ", "0.972", ",", " ", "0.979"}], "}"}], ",", 
        " ", 
        RowBox[{"{", 
         RowBox[{
         "0.902", ",", " ", "0.929", ",", " ", "0.941", ",", " ", "0.954", 
          ",", " ", "0.962", ",", " ", "0.967"}], "}"}], ",", " ", "\n", 
        "     ", 
        RowBox[{"{", 
         RowBox[{
         "0.9", ",", " ", "0.92", ",", " ", "0.932", ",", " ", "0.941", ",", 
          " ", "0.948", ",", " ", "0.949"}], "}"}]}], "}"}]}], "}"}]}], ";"}],
   " "}]], "Input", "PluginEmbeddedContent"],

Cell[BoxData[
 RowBox[{
  RowBox[{"d", "[", "a_", "]"}], ":=", 
  RowBox[{"Join", "[", 
   RowBox[{
    RowBox[{"Transpose", "[", 
     RowBox[{"{", 
      RowBox[{"a", "[", 
       RowBox[{"[", "1", "]"}], "]"}], "}"}], "]"}], ",", 
    RowBox[{"Transpose", "[", 
     RowBox[{"{", 
      RowBox[{"a", "[", 
       RowBox[{"[", "2", "]"}], "]"}], "}"}], "]"}], ",", "2"}], 
   "]"}]}]], "Input", "PluginEmbeddedContent"],

Cell[BoxData[
 RowBox[{
  RowBox[{"curves", "=", 
   RowBox[{
    RowBox[{"Table", "[", 
     RowBox[{
      RowBox[{"sO2", "/.", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"O2", "->", 
          RowBox[{
           RowBox[{"Naeraa", "[", 
            RowBox[{"[", 
             RowBox[{"1", ",", "i", ",", "1"}], "]"}], "]"}], "*", "aO2"}]}], 
         ",", " ", 
         RowBox[{"CO2", "->", 
          RowBox[{
           RowBox[{"Naeraa", "[", 
            RowBox[{"[", 
             RowBox[{"2", ",", "i", ",", "1"}], "]"}], "]"}], "*", 
           "aCO2"}]}]}], "}"}]}], ",", 
      RowBox[{"{", 
       RowBox[{"i", ",", "1", ",", "9"}], "}"}]}], "]"}], " ", "/.", " ", 
    RowBox[{"{", 
     RowBox[{"pH", "\[Rule]", " ", 
      RowBox[{"7.2464", "+", 
       RowBox[{"0.796", 
        RowBox[{"(", 
         RowBox[{"pHp", "-", "7.4"}], ")"}]}]}]}], "}"}]}]}], ";"}]], "Input",\
 "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Show", "[", 
  RowBox[{
   RowBox[{"Plot", "[", 
    RowBox[{"curves", ",", 
     RowBox[{"{", 
      RowBox[{"pHp", ",", "7", ",", "8"}], "}"}], ",", 
     RowBox[{"AxesLabel", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{"\"\<pHp\>\"", ",", "\"\<sO2\>\""}], "}"}]}], ",", " ", 
     RowBox[{"PlotRange", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{"0.6", ",", "1"}], "}"}]}], ",", 
     RowBox[{"PlotLegends", "\[Rule]", 
      RowBox[{"{", "\"\<model\>\"", "}"}]}]}], "]"}], ",", 
   RowBox[{"ListPlot", "[", 
    RowBox[{
     RowBox[{"Table", "[", 
      RowBox[{
       RowBox[{"d", "[", 
        RowBox[{"Naeraa", "[", 
         RowBox[{"[", 
          RowBox[{
           RowBox[{"{", 
            RowBox[{"3", ",", "4"}], "}"}], ",", "i"}], "]"}], "]"}], "]"}], 
       ",", 
       RowBox[{"{", 
        RowBox[{"i", ",", "1", ",", "9"}], "}"}]}], "]"}], ",", 
     RowBox[{"PlotLegends", "\[Rule]", 
      RowBox[{"{", "\"\<Data by Naeraa1963\>\"", "}"}]}]}], "]"}]}], 
  "]"}]], "Input", "PluginEmbeddedContent"],

Cell[BoxData[
 TemplateBox[{GraphicsBox[{{{}, {}, {
       Hue[0.67, 0.6, 0.6], 
       LineBox[CompressedData["
1:eJwV0H1UjHkUB/AJvRCWtEk9L1rLRC1SqVjuVbJqSXmZzZZeUSZlI2J72Tpb
aLbN4KyKbEqKWqFoN2m0pnEQrdBqG50MT1Mz8zxno6ZI2N/+cc/3fM499/vH
dYjatX7bGJFItJbM/zmpKMxEJKLw64D2XN6Fg9imtJhA4hVDYmOYKwfNXNGD
M8SNd0dD2tw4SP1CXbjChMLaV+8+r/PggFd8s+jHMRRG2bwt/WEZB/c1gdFm
phSOOLqutPLjQCb2UU2cQKE0qErlHsGBRa04Z4Y16Qt0nrYnj4Ma73DNy7kU
7pB1nE94zcH7sfV5Xy6nsO+38ErfdT3gU3/2kwXrKRTn5Q6cutADnr2jEY9i
KBxtMJ4onqCF1lX7zcelUlghL2+x3KqFaWxUuvYohW9UXgPZSi1sMDy7E1VB
YWR8XdlJthfcdAdi4xsoLJB0STv29EJzeHaHYxuFNQ5Oao8HvWA0rz29u4dC
n1nJleVMHziUJS6WvKUwKNMyJmVnH4z+8WuxfjKNGFay7KiiDw58FLZMmkXj
q9GWaR0WOihTVPHPPWm009izjRId3EscCQgIoLErTVmfckYHxyRxZv5RNCru
2qlUL3RgcdU/byiZxsMuhcsNYj3M9FkT55JLY2L4SH7nNj1o/W/Y0qU0jg9J
nMWU6+H8qsbC0t9plEBqoOSFHiyTnu+qa6FRvmRG3PB0A9B2u21SNDSqs337
QtcZ4OGr2VatRhqjzeYqZRkGSG+Uaq6PZ3Cyfk2BtNoAahMmM5hl0LDYXlzc
ZYB/kgf2Zrky+HOp1HajOQ8Ht3ssjfRj0FTjOmHiIh7m+0188jSMQY8K7q/c
zTwkbxl769luBjdZ7NT4p/KwSx+bcewwg12iLVl/FvNgcaH/+N9FDG5s4KvU
Ch6KQsanXL3M4KeVESqZmofug/JFPrcZTJtju6n+DQ/Kl14Q0clgd63HVlcr
AST1QdT8fgbTnWtb3zsJIGv6KUA2jkXPHsXCBG8B6hskGzNsWfxstlXCoESA
/AXyeeL5LA7vzwk+GyeATbthU6g3i3LdY2N2mgArB64FeQezSCnPJ8UfESDe
dKrDrXgWTXY01xwvFsDDL8/3YSaLvidzhLiLAlw2/X7JkXwWB59PHXJsEODe
wKGsZ1UsdivMLZ/eFqC7fU6p8iaL/axkr3ebAGcXuslD2ll0ZpcfTVILYNEY
/ThTx2LllVDF8EsBymqn3FcTnzrcXmTPCYCVjc3uehZ/GdcUC8TJ+dPrdMRL
a4x3DhJrE1sKgngWO20WV1n3CKCc4xrm8C+Lm6nCt85aAdLlY3RNgyw+nuvw
aF2fAHaHLmnsjCyeViVsTSS+lhbamUTc6i7jjhHz0roWxyEW8x65V7cTh/hK
q+XDLOamVcd8qxPAc6RtT8QI2Tue2BuhF+BJf/rO68ROq6doM4i/63XaZv2O
xTM3s1aWEFc8yZbcIQ6tiWnRENtc8vJa+J5Fsw1RJlEGAWrOaV1kxJncO00m
8dqi4/M44siqc5dLiLNyBPuCD+T+qputhnhmxknr18QxkewVES/AjX1fTVrz
kfxvxmzPmcTB8YOm5cRT5asvAvFAdMmHj8Tb9+VOCSf+D+gGUt8=
        "]]}, {
       Hue[0.9060679774997897, 0.6, 0.6], 
       LineBox[CompressedData["
1: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
H1k0Xg==
        "]]}, {
       Hue[0.1421359549995791, 0.6, 0.6], 
       LineBox[CompressedData["
1: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
        "]]}, {
       Hue[0.37820393249936934`, 0.6, 0.6], 
       LineBox[CompressedData["
1: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
        "]]}, {
       Hue[0.6142719099991583, 0.6, 0.6], 
       LineBox[CompressedData["
1:eJwVzXs01HkYBvBBEyNKkYrfzJctadW6b1Ft71uSEpNRi00ucZKjtS6JriKT
omiiDLuq7aKUPSuXiFI21rGoQ6tShDmZYcZcWLGlYr/7x3Oe8znPH49lWIzv
Hm0Wi+VN838bFgZrsVgMRpxCh81lUoisP7bXh1q8PN6kulwKjQOFT3+lPt+y
bNSqUgpHv+kuWK/F4K1Z43k61VJQPvJ3TNNmcILU5jx6KIU2iU/4TDaDh1SH
0alZCpnWbn8a6DMoJdMWC/qkoFdhnbHIhMGOdIV/k4EMyjeESN59zWBF1rZO
zxgZfNGpyV67jsHeFcLW+BYZuNVcn2Pny6AHx6bg9VeD4DL4OfT5XgYNwvkm
iamD8GzTQd0ZRxlMd72dG9I1CMYkLFl2nsH2sLCxbuch2D7c0xx2i/6HRCjq
s4bAWX4oMvoBgz1W84ue9w5BY8jJrmUdDNrv1LkkcpbDuG7FpXgpg7nNtwMT
TsjB8kbcSr+PDBr9ZM0va5PD5/uXryhmc/HI2fD5TWYKODStCjJczMXEPtva
73Yr4MajEmW/CxfPzZqoeX9HAS1xk3w+n4sX3HyNc0cUkOO3b6ZnGBcbXGpc
2XbDoFfpmT2RxMXx5QcSdGOHwcLNa5/DWS62/SEUWN8ZBpnnw4Xca1xs3+vh
HywbhuJNdQXXqrlYaVP2QzVPCbMS+mOqWrkYyPZ27PJRAtcs3vSIhItaBSW/
XRQqoX3Uat6zcS52XXFacrxcCcl1UZJaDg+jR+9dELxVQrcWLzWA8JB1VKy/
h6OC10ljB4ROPBzamcMOsldBesSqNbu38ND8suUH3wAV2G4x6HwVzMPF5gfy
/I+pIClI50lPPA97jJNWf7ykghhFZErOabobnjy9+7EK9G6P5L4s5OH6D8S8
pUcFhYGcI5V3ebg1+GmJ7gcV9KWLHN2aeCjmSzoHjNXQ8M4VQt/w8Evo1GTo
CjX41QgY2xEe2md9bA90V0Nm/Rl+5gyClT69+lsD1VDzwG9HykKC/JYML1GM
GsR2IhtrW4LttiderhOqwfTF8Pe7NhC8eaV/PDxPDRvH7gk2BBDM8nIpeFus
hmj2XMsn0QSNiuPS+mrUsGpLtnt7KsHt88P7/2pWw1324dXnxAQDzrh8+vxK
DS1jp4Q9JQQLDK8+FkjV0Pdi6bWGxwR7OOyyq6NquG7vLAp8QbCkiJfvMKUG
vbrwv1PlBMPEWW0rORq4UWHU1k39VpF1OoIa79Q1fqsg6JYhXZVHnSReUCWn
VpQWx45Ty+Ja8wVKgovK+z0r9DXQsNQp2FJDcIRlVbTCQAPJIm15/XuCTyLX
cEznaMDsVKnEbJzgzrP9KzdS3zu2600CtWP21oB4amVUVeuyCYKChpTEZ9SB
7lG/i/4lOEPSZJFupAGXyY79oZMEzfdX2Y3N1UDnSPKPtdSmgm2/WMzTQOzg
8j0mnwjqaw9MelPf6jzp10ztsWZ2XjG1aamrq/0XghExDWuDjDVQXiRzyKQ+
uC1/cya1d2GuzQD1/eK0zdXUwgyVef4UQXdOyZK5JhqwSPnZ5B/qilIVax31
w0QPQ69pgscNd3REUQdEv2ffpDaIlVwUU4+FX52apu5dXMBvpP4PsoE8fg==

        "]]}, {
       Hue[0.8503398874989481, 0.6, 0.6], 
       LineBox[CompressedData["
1:eJwVz3s0lHkYB/Ah99FlS0O8F7KLanNJCls9D6JIc5CGImROS8oR1Q5ilnKJ
rFVt281uu1JSp1QuRchim6I6tdHVtuTSGb3zviOpsyr2t38853s+/3zP97GJ
TQrZoisSidaS+z+nlkbpiEQUDrcWBqUbcBDfkhkXRFwcJsqxMeSgfaD03m/E
gtVo+W3ijIUvjnvpUBhgv7pKYswB1xy2aJ8uhdaeqYNXxBzc7QuSG+hTyNot
fjwwg4NCe58/TU0o3BatvLHMigOjavuCOWYUBlb98XWNEwdXvaP7+udRODfK
4um0CA4+T6kvXraCwn5oCPTay4FP/enpTiEUNlp6De6u4MD99aeYv+IoNN9g
vzPpPgf3/VIN9TJI32TyiqwRDmaxscqhgxSenK5InSnRwLo3PbdjKyh0XrNH
ne+ugcXqtPjEGxT2qtRH5GEaaI/OferwkMKfXR9rdys0MGZY/UvKIIXSDTeL
qJ80YFOevET2L4WzTCae6VRp4NP1X08NT6ORSV9/p7dDA2mTmk1TbWlUHdTm
XezXQHnzBa7Xncbue+f3+n3WQEfyuFQqpXHOqx+UtrN5OCTbZhAQS6NLwxPF
mvk8GNUEFL9X0Ojsp69rhjxY+wRucymi0Ve+devGdTwMBTRa0GU0OhVcS7eO
4+GcX9Pxsms0DtZaqHal8SDe1ZtU10mjafvmK6cKeKAtUyR7+mgUeXv7LDzB
w4ORr2beH6PRPd4hq+UcD8qmhL4GYwYHgrpmYR0PL3SY7HCWQfMDd16J23l4
phjdnePKYDEjVjs84CHv26XfbPZn8NGZXJvve3hw9DftehLF4IbQi+ZPX/Og
2DSltSeFwRQTY3vVCA9Jw/FZh/Yz+LIU9Xs/kv8qtYcflzI46annelVPgNII
4z01lxn822Hk+j1TAf7JK1nkc4tBaeGJZIPZArT1e0DMcwabQ2o2OVICyOqD
KUctgwu8LhXF2QpQ2HJAWqjHoufl5vEL8wSovyELzbJg0THXtUnuJMBRp5L5
9o4sxhm1CnPdBJB0v1kf6c1iaObqCnNPAVaO1gZ7h7N41+KdxAQESNT/wqY1
kcWYl8ZtGT4CLPUv9n2QzWJy46py/1UCXNZP9/zxKIsyxVikeI0AHaP5OT0X
WNweOLzRQ0r2d9uVtd1ksfLWkT5xsACnnReXRHSzmJlRm9+xTgCjJvmjbDWL
8xKsGmbIBCivnnH3BXHakkMrLYnxfFO72zCLrdraO7bEiqPmdWpiZrth+xLi
oeTOY8Eciysk6tRI4jY71ygbgcXetxsHzhIrS3TVLe9YTHDLUy0NE8Ayv6rP
cozFAKldJRLXZkY+30W8/HRRrj8xl1DX6fCexXBJlWMEcYRvwqWSDyw+K4vx
VhK7jz/cGTPOomW0zY424i6tcnsDsa84e6KTeMfrBVvMPrKosq3O7yKu6MqV
3Sa2PXmwcJBYUuXh4fyZxScnA0MMwwW4embIpZA4+EzotenEa0sPzx8g/jDb
zdyCOKdAY3VsgsUdX+5VORBbZ50we0u8frnW3IW48btVUwMnWdxf7SH3IA5P
fKd/lrjLJ7rSi3hU/vvEJHHt+c3D/sT/AbRtMZw=
        "]]}, {
       Hue[0.08640786499873876, 0.6, 0.6], 
       LineBox[CompressedData["
1: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
fH7K3Ebbf6nUV0D3uN4cGUX/niRxesz/Ax/QSuo=
        "]]}, {
       Hue[0.3224758424985268, 0.6, 0.6], 
       LineBox[CompressedData["
1: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
c3/aaAr+H+5SFSA=
        "]]}, {
       Hue[0.5585438199983166, 0.6, 0.6], 
       LineBox[CompressedData["
1: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
+mV0hB38f3zz+Yc=
        "]]}}, {{}, {{
        RGBColor[0.24720000000000014`, 0.24, 0.6], 
        PointBox[{{7.291, 0.787}, {7.37, 0.825}, {7.47, 0.858}, {7.543, 
         0.871}, {7.637, 0.897}, {7.775, 0.922}}]}, {
        RGBColor[0.6, 0.24, 0.4428931686004542], 
        PointBox[{{7.149, 0.692}, {7.193, 0.728}, {7.281, 0.768}, {7.35, 
         0.799}, {7.416, 0.825}, {7.483, 0.85}, {7.557, 0.86}}]}, {
        RGBColor[0.6, 0.5470136627990908, 0.24], 
        PointBox[{{7.06, 0.646}, {7.202, 0.714}, {7.258, 0.746}, {7.321, 
         0.775}, {7.38, 0.809}, {7.444, 0.825}}]}, {
        RGBColor[0.24, 0.6, 0.33692049419863584`], 
        PointBox[{{7.024, 0.604}, {7.141, 0.668}, {7.198, 0.702}, {7.248, 
         0.745}, {7.3, 0.77}, {7.35, 0.789}}]}, {
        RGBColor[0.24, 0.3531726744018182, 0.6], 
        PointBox[{{7.443, 0.905}, {7.624, 0.934}, {7.842, 0.968}}]}, {
        RGBColor[0.6, 0.24, 0.5632658430022722], 
        PointBox[{{7.218, 0.934}, {7.312, 0.946}, {7.418, 0.965}, {7.528, 
         0.974}, {7.588, 0.978}, {7.665, 0.983}, {7.776, 0.985}}]}, {
        RGBColor[0.6, 0.42664098839727194`, 0.24], 
        PointBox[{{7.159, 0.935}, {7.192, 0.947}, {7.28, 0.95}, {7.341, 
         0.961}, {7.428, 0.969}, {7.505, 0.972}, {7.557, 0.979}}]}, {
        RGBColor[0.2634521802031821, 0.6, 0.24], 
        PointBox[{{7.02, 0.902}, {7.164, 0.929}, {7.222, 0.941}, {7.266, 
         0.954}, {7.352, 0.962}, {7.409, 0.967}}]}, {
        RGBColor[0.24, 0.47354534880363613`, 0.6], 
        PointBox[{{7.03, 0.9}, {7.099, 0.92}, {7.171, 0.932}, {7.208, 
         0.941}, {7.249, 0.948}, {7.32, 0.949}}]}}, {}}}, AspectRatio -> 
    NCache[GoldenRatio^(-1), 0.6180339887498948], Axes -> True, AxesLabel -> {
      FormBox["\"pHp\"", TraditionalForm], 
      FormBox["\"sO2\"", TraditionalForm]}, AxesOrigin -> {7., 0.6}, 
    Method -> {}, PlotRange -> {{7, 8}, {0.6, 1}}, PlotRangeClipping -> True, 
    PlotRangePadding -> {
      Scaled[0.02], Automatic}],TagBox[
    GridBox[{{
       TemplateBox[{"\"model\""}, "LineLegend", DisplayFunction -> (StyleBox[
          StyleBox[
           PaneBox[
            TagBox[
             GridBox[{{
                TagBox[
                 GridBox[{{
                    GraphicsBox[{{
                    Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    Hue[0.67, 0.6, 0.6]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    Hue[0.67, 0.6, 0.6]], {}}}, AspectRatio -> Full, 
                    ImageSize -> {20, 10}, PlotRangePadding -> None, 
                    ImagePadding -> 1, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #}}, 
                  GridBoxAlignment -> {
                   "Columns" -> {Center, Left}, "Rows" -> {{Baseline}}}, 
                  AutoDelete -> False, 
                  GridBoxDividers -> {
                   "Columns" -> {{False}}, "Rows" -> {{False}}}, 
                  GridBoxItemSize -> {
                   "Columns" -> {{All}}, "Rows" -> {{All}}}, 
                  GridBoxSpacings -> {
                   "Columns" -> {{0.5}}, "Rows" -> {{0.8}}}], "Grid"]}}, 
              GridBoxAlignment -> {"Columns" -> {{Left}}, "Rows" -> {{Top}}}, 
              AutoDelete -> False, 
              GridBoxItemSize -> {
               "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
              GridBoxSpacings -> {"Columns" -> {{1}}, "Rows" -> {{0}}}], 
             "Grid"], Alignment -> Left, AppearanceElements -> None, 
            ImageMargins -> {{5, 5}, {5, 5}}, ImageSizeAction -> 
            "ResizeToFit"], LineIndent -> 0, StripOnInput -> False], {
          FontFamily -> "Times"}, Background -> Automatic, StripOnInput -> 
          False]& ), Editable -> True, 
        InterpretationFunction :> (RowBox[{"LineLegend", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{
                 RowBox[{"Directive", "[", 
                   RowBox[{"Hue", "[", 
                    RowBox[{"0.67`", ",", "0.6`", ",", "0.6`"}], "]"}], "]"}],
                  ",", 
                 RowBox[{"Directive", "[", 
                   RowBox[{"Hue", "[", 
                    RowBox[{"0.9060679774997897`", ",", "0.6`", ",", "0.6`"}],
                     "]"}], "]"}], ",", 
                 RowBox[{"Directive", "[", 
                   RowBox[{"Hue", "[", 
                    RowBox[{"0.1421359549995791`", ",", "0.6`", ",", "0.6`"}],
                     "]"}], "]"}], ",", 
                 RowBox[{"Directive", "[", 
                   RowBox[{"Hue", "[", 
                    
                    RowBox[{
                    "0.37820393249936934`", ",", "0.6`", ",", "0.6`"}], "]"}],
                    "]"}], ",", 
                 RowBox[{"Directive", "[", 
                   RowBox[{"Hue", "[", 
                    RowBox[{"0.6142719099991583`", ",", "0.6`", ",", "0.6`"}],
                     "]"}], "]"}], ",", 
                 RowBox[{"Directive", "[", 
                   RowBox[{"Hue", "[", 
                    RowBox[{"0.8503398874989481`", ",", "0.6`", ",", "0.6`"}],
                     "]"}], "]"}], ",", 
                 RowBox[{"Directive", "[", 
                   RowBox[{"Hue", "[", 
                    
                    RowBox[{
                    "0.08640786499873876`", ",", "0.6`", ",", "0.6`"}], "]"}],
                    "]"}], ",", 
                 RowBox[{"Directive", "[", 
                   RowBox[{"Hue", "[", 
                    RowBox[{"0.3224758424985268`", ",", "0.6`", ",", "0.6`"}],
                     "]"}], "]"}], ",", 
                 RowBox[{"Directive", "[", 
                   RowBox[{"Hue", "[", 
                    RowBox[{"0.5585438199983166`", ",", "0.6`", ",", "0.6`"}],
                     "]"}], "]"}]}], "}"}], ",", 
             RowBox[{"{", #, "}"}], ",", 
             RowBox[{"LegendLayout", "\[Rule]", "\"Column\""}]}], "]"}]& )]}, {
       TemplateBox[{"\"Data by Naeraa1963\""}, "PointLegend", 
        DisplayFunction -> (StyleBox[
          StyleBox[
           PaneBox[
            TagBox[
             GridBox[{{
                TagBox[
                 GridBox[{{
                    GraphicsBox[{{}, {
                    Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    RGBColor[0.24720000000000014`, 0.24, 0.6]], {
                    Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    RGBColor[0.24720000000000014`, 0.24, 0.6]], 
                    PointBox[
                    NCache[{
                    Scaled[{
                    Rational[1, 2], 
                    Rational[1, 2]}]}, {
                    Scaled[{0.5, 0.5}]}]]}}}, AspectRatio -> Full, 
                    ImageSize -> {10, 10}, PlotRangePadding -> None, 
                    ImagePadding -> 1, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #}}, 
                  GridBoxAlignment -> {
                   "Columns" -> {Center, Left}, "Rows" -> {{Baseline}}}, 
                  AutoDelete -> False, 
                  GridBoxDividers -> {
                   "Columns" -> {{False}}, "Rows" -> {{False}}}, 
                  GridBoxItemSize -> {
                   "Columns" -> {{All}}, "Rows" -> {{All}}}, 
                  GridBoxSpacings -> {
                   "Columns" -> {{0.5}}, "Rows" -> {{0.8}}}], "Grid"]}}, 
              GridBoxAlignment -> {"Columns" -> {{Left}}, "Rows" -> {{Top}}}, 
              AutoDelete -> False, 
              GridBoxItemSize -> {
               "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
              GridBoxSpacings -> {"Columns" -> {{1}}, "Rows" -> {{0}}}], 
             "Grid"], Alignment -> Left, AppearanceElements -> None, 
            ImageMargins -> {{5, 5}, {5, 5}}, ImageSizeAction -> 
            "ResizeToFit"], LineIndent -> 0, StripOnInput -> False], {
          FontFamily -> "Times"}, Background -> Automatic, StripOnInput -> 
          False]& ), Editable -> True, 
        InterpretationFunction :> (RowBox[{"PointLegend", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{
                 RowBox[{"Directive", "[", 
                   RowBox[{"RGBColor", "[", 
                    
                    RowBox[{
                    "0.24720000000000014`", ",", "0.24`", ",", "0.6`"}], 
                    "]"}], "]"}], ",", 
                 RowBox[{"Directive", "[", 
                   RowBox[{"RGBColor", "[", 
                    
                    RowBox[{
                    "0.6`", ",", "0.24`", ",", "0.4428931686004542`"}], "]"}],
                    "]"}], ",", 
                 RowBox[{"Directive", "[", 
                   RowBox[{"RGBColor", "[", 
                    
                    RowBox[{
                    "0.6`", ",", "0.5470136627990908`", ",", "0.24`"}], "]"}],
                    "]"}], ",", 
                 RowBox[{"Directive", "[", 
                   RowBox[{"RGBColor", "[", 
                    
                    RowBox[{
                    "0.24`", ",", "0.6`", ",", "0.33692049419863584`"}], 
                    "]"}], "]"}], ",", 
                 RowBox[{"Directive", "[", 
                   RowBox[{"RGBColor", "[", 
                    
                    RowBox[{
                    "0.24`", ",", "0.3531726744018182`", ",", "0.6`"}], "]"}],
                    "]"}], ",", 
                 RowBox[{"Directive", "[", 
                   RowBox[{"RGBColor", "[", 
                    
                    RowBox[{
                    "0.6`", ",", "0.24`", ",", "0.5632658430022722`"}], "]"}],
                    "]"}], ",", 
                 RowBox[{"Directive", "[", 
                   RowBox[{"RGBColor", "[", 
                    
                    RowBox[{
                    "0.6`", ",", "0.42664098839727194`", ",", "0.24`"}], 
                    "]"}], "]"}], ",", 
                 RowBox[{"Directive", "[", 
                   RowBox[{"RGBColor", "[", 
                    
                    RowBox[{
                    "0.2634521802031821`", ",", "0.6`", ",", "0.24`"}], "]"}],
                    "]"}], ",", 
                 RowBox[{"Directive", "[", 
                   RowBox[{"RGBColor", "[", 
                    
                    RowBox[{
                    "0.24`", ",", "0.47354534880363613`", ",", "0.6`"}], 
                    "]"}], "]"}]}], "}"}], ",", 
             RowBox[{"{", #, "}"}], ",", 
             RowBox[{"LegendLayout", "\[Rule]", "\"Column\""}], ",", 
             RowBox[{"LegendMarkers", "\[Rule]", "False"}]}], "]"}]& )]}}, 
     AutoDelete -> False, GridBoxAlignment -> {"Columns" -> {{Left}}}, 
     GridBoxItemSize -> {"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
      GridBoxSpacings -> {"Columns" -> {{0}}}], "Grid"]},
  "Legended",
  DisplayFunction->(GridBox[{{
      TagBox[
       ItemBox[
        PaneBox[
         TagBox[#, "SkipImageSizeLevel"], Alignment -> {Center, Baseline}, 
         BaselinePosition -> Baseline], DefaultBaseStyle -> "Labeled"], 
       "SkipImageSizeLevel"], 
      ItemBox[#2, DefaultBaseStyle -> "LabeledLabel"]}}, 
    GridBoxAlignment -> {"Columns" -> {{Center}}, "Rows" -> {{Center}}}, 
    AutoDelete -> False, GridBoxItemSize -> Automatic, 
    BaselinePosition -> {1, 1}]& ),
  Editable->True,
  InterpretationFunction->(RowBox[{"Legended", "[", 
     RowBox[{#, ",", 
       RowBox[{"Placed", "[", 
         RowBox[{#2, ",", "After"}], "]"}]}], "]"}]& )]], "Output", \
"PluginEmbeddedContent"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}, Open  ]]
},
WindowSize->{1896.0833333333333`, 2591.},
Visible->True,
AuthoredSize->{1896.0833333333333`, 2591.},
ScrollingOptions->{"HorizontalScrollRange"->Fit,
"VerticalScrollRange"->Fit},
ShowCellBracket->False,
Deployed->True,
CellContext->Notebook,
TrackCellChangeTimes->False,
FrontEndVersion->"9.0 for Microsoft Windows (64-bit) (January 25, 2013)",
StyleDefinitions->"Default.nb"
]
(* End of Notebook Content *)

(* Internal cache information *)
(*CellTagsOutline
CellTagsIndex->{}
*)
(*CellTagsIndex
CellTagsIndex->{}
*)
(*NotebookFileOutline
Notebook[{
Cell[CellGroupData[{
Cell[1485, 35, 276, 5, 164, "Title"],
Cell[CellGroupData[{
Cell[1786, 44, 54, 0, 44, "Section"],
Cell[1843, 46, 826, 25, 57, "Input"],
Cell[2672, 73, 1039, 27, 57, "Input"],
Cell[3714, 102, 660, 19, 16, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[4411, 126, 49, 0, 44, "Section"],
Cell[4463, 128, 1823, 53, 77, "Input"],
Cell[6289, 183, 1523, 44, 57, "Input"],
Cell[7815, 229, 2237, 63, 77, "Input"],
Cell[10055, 294, 1068, 33, 37, "Input"],
Cell[11126, 329, 352, 10, 16, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[11515, 344, 56, 0, 44, "Section"],
Cell[CellGroupData[{
Cell[11596, 348, 231, 7, 16, "Input"],
Cell[11830, 357, 72, 0, 16, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[11939, 362, 252, 4, 29, "Subsection"],
Cell[CellGroupData[{
Cell[12216, 370, 3935, 115, 97, "Input"],
Cell[16154, 487, 9391, 189, 206, "Output"]
}, Open  ]],
Cell[25560, 679, 1622, 45, 37, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[27219, 729, 264, 5, 29, "Subsection"],
Cell[CellGroupData[{
Cell[27508, 738, 4743, 133, 117, "Input"],
Cell[32254, 873, 13304, 274, 242, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[45607, 1153, 352, 5, 59, "Subsection"],
Cell[CellGroupData[{
Cell[45984, 1162, 8796, 243, 237, "Input"],
Cell[54783, 1407, 44182, 799, 314, "Output"]
}, Open  ]],
Cell[98980, 2209, 51, 0, 16, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[99068, 2214, 367, 6, 59, "Subsection"],
Cell[99438, 2222, 5972, 146, 157, "Input"],
Cell[105413, 2370, 421, 13, 16, "Input"],
Cell[105837, 2385, 928, 29, 16, "Input"],
Cell[CellGroupData[{
Cell[106790, 2418, 1053, 30, 16, "Input"],
Cell[107846, 2450, 43885, 793, 237, "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature Iv0HPktGTQhHWAKhWmUouxO7 *)

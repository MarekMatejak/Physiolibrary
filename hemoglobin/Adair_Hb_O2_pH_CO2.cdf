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
NotebookDataLength[    233646,       5285]
NotebookOptionsPosition[    232064,       5212]
NotebookOutlinePosition[    232608,       5235]
CellTagsIndexPosition[    232565,       5232]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell[TextData[{
 "Adair-based hemoglobin equilibrium with oxygen, carbon dioxide and hydrogen \
ion activity \n",
 StyleBox["(Marek Matej\[AAcute]k, Tom\[AAcute]\[SHacek] Kulh\[AAcute]nek, \
Stanislav Matou\[SHacek]ek)", "Subtitle"]
}], "Title", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell["Parameters", "Section", "PluginEmbeddedContent"],

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"aO2", " ", "=", " ", 
    RowBox[{"1.005", "*", 
     RowBox[{"10", "^", 
      RowBox[{"-", "5"}]}]}]}], " ", ";"}], " ", 
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{
     RowBox[{
      RowBox[{"mol", ".", "m"}], "-", 
      RowBox[{"3.", "Pa"}], "-", "1"}], " ", "=", " ", 
     RowBox[{
      RowBox[{
       RowBox[{"0.01005", " ", 
        RowBox[{"mmol", ".", "l"}]}], "-", 
       RowBox[{"1.", "kPa"}], "-", "1"}], " ", "=", " ", 
      RowBox[{
       RowBox[{"1.34", "*", 
        RowBox[{"10", "^", 
         RowBox[{"-", "3"}]}], " ", 
        RowBox[{"mmol", ".", "l"}]}], "-", 
       RowBox[{"1.", "mmHg"}], "-", "1"}]}]}], ";", "  ", 
    "\[IndentingNewLine]", 
    RowBox[{
    "CO2", " ", "solubility", " ", "by", " ", "Bartels", " ", "et", " ", 
     RowBox[{"al", "."}]}]}], "*)"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"aCO2", "=", 
    RowBox[{"2.3", "*", 
     RowBox[{"10", "^", 
      RowBox[{"-", "4"}]}]}]}], ";"}], 
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{
     RowBox[{
      RowBox[{"mol", ".", "m"}], "-", 
      RowBox[{"3.", "Pa"}], "-", "1"}], " ", "=", " ", 
     RowBox[{
      RowBox[{
       RowBox[{"0.23", " ", 
        RowBox[{"mmol", ".", "l"}]}], "-", 
       RowBox[{"1.", "kPa"}], "-", "1"}], " ", "=", " ", 
      RowBox[{
       RowBox[{"30.66", "*", 
        RowBox[{"10", "^", 
         RowBox[{"-", "3"}]}], " ", 
        RowBox[{"mmol", ".", "l"}]}], "-", 
       RowBox[{"1.", "mmHg"}], "-", "1"}]}]}], ";", 
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
  RowBox[{
   RowBox[{"pKhD", "=", "7.52"}], ";", " ", 
   RowBox[{"pKhO", "=", "6.89"}], ";"}], " ", 
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{
    "side", " ", "chains", " ", "of", " ", "hemoglobin", " ", "subunit", " ", 
     "acid", " ", "dissociation", " ", "constants"}], ",", " ", 
    RowBox[{"fitted", " ", "parameters", " ", "to", " ", "Siggaard"}]}], " ", 
   "*)"}]}]}], "Input", "PluginEmbeddedContent"],

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"K1", "=", "0.0121"}], ";", " ", 
   RowBox[{"K2", "=", "0.0117"}], ";", " ", 
   RowBox[{"K3", "=", "0.0871"}], ";", " ", 
   RowBox[{"K4", "=", "0.000386"}], ";"}], " ", 
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
   "*)"}], "\[IndentingNewLine]"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"{", 
    RowBox[{"a1", ",", "a2", ",", "a3", ",", "a4"}], "}"}], "=", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"1", "/", "K1"}], ",", 
     RowBox[{"1", "/", 
      RowBox[{"(", 
       RowBox[{"K1", " ", "K2"}], ")"}]}], ",", " ", 
     RowBox[{"1", "/", 
      RowBox[{"(", 
       RowBox[{"K1", " ", "K2", " ", "K3"}], ")"}]}], ",", " ", 
     RowBox[{"1", "/", 
      RowBox[{"(", 
       RowBox[{"K1", " ", "K2", " ", "K3", " ", "K4"}], ")"}]}]}], "}"}]}], 
  ";"}]}], "Input", "PluginEmbeddedContent"]
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
         RowBox[{"pK", "-", "pH"}], ")"}]}], "+", "1"}], ")"}]}]}], ";"}], 
  " ", 
  RowBox[{"(*", 
   RowBox[{
   "fraction", " ", "of", " ", "striped", " ", "form", " ", "of", " ", 
    "lumped", " ", "acid", " ", "side", " ", "for", " ", "hemoglobin", " ", 
    "subunit", " ", "side", " ", "chains"}], "*)"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"fnD", "=", 
    RowBox[{
     RowBox[{"fh", "[", "pKhD", "]"}], "*", 
     RowBox[{"fzc", "[", 
      RowBox[{"pKzD", ",", "pKcD"}], "]"}]}]}], ";"}], " ", 
  RowBox[{"(*", 
   RowBox[{
    RowBox[{"fraction", " ", "of", " ", "selected", " ", "CO2"}], "-", "H", 
    "-", 
    RowBox[{
    "striped", " ", "form", " ", "of", " ", "deoxyhemoglobin", " ", 
     "subunits"}]}], "*)"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"fnO", "=", 
    RowBox[{
     RowBox[{"fh", "[", "pKhO", "]"}], "*", 
     RowBox[{"fzc", "[", 
      RowBox[{"pKzO", ",", "pKcO"}], "]"}]}]}], ";"}], 
  RowBox[{"(*", 
   RowBox[{
    RowBox[{"fraction", " ", "of", " ", "selected", " ", "CO2"}], "-", "H", 
    "-", 
    RowBox[{
    "striped", " ", "form", " ", "of", " ", "deoxyhemoglobin", " ", 
     "subunits"}]}], "*)"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"sCO2D", "=", 
    RowBox[{
     RowBox[{"10", "^", 
      RowBox[{"(", 
       RowBox[{"pH", "-", "pKcD"}], ")"}]}], " ", 
     RowBox[{"fzc", "[", 
      RowBox[{"pKzD", ",", "pKcD"}], "]"}], " ", "CO2"}]}], ";"}], "  ", 
  RowBox[{"(*", " ", 
   RowBox[{"CO2", " ", "saturation", " ", "on", " ", "deoxyhemoglobin"}], 
   "*)"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"sCO2O", "=", 
    RowBox[{
     RowBox[{"10", "^", 
      RowBox[{"(", 
       RowBox[{"pH", "-", "pKcO"}], ")"}]}], " ", 
     RowBox[{"fzc", "[", 
      RowBox[{"pKzO", ",", "pKcO"}], "]"}], " ", "CO2"}]}], ";"}], " ", 
  RowBox[{"(*", " ", 
   RowBox[{"CO2", " ", "saturation", " ", "on", " ", "oxyhemoglobin"}], 
   "*)"}], "\[IndentingNewLine]"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"dHh", "=", 
    RowBox[{"-", 
     RowBox[{"(", 
      RowBox[{
       RowBox[{"fh", "[", "pKhD", "]"}], "-", 
       RowBox[{"fh", "[", "pKhO", "]"}]}], ")"}]}]}], ";"}], "  ", 
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{"Bohr", "'"}], "s", " ", "protons", " ", "of", " ", "reaction", 
    " ", "h"}], " ", "*)"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
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
       RowBox[{"pKzO", ",", "pKcO"}], "]"}]}]}]}], ";"}], " ", 
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{"Bohr", "'"}], "s", " ", "protons", " ", "of", " ", "reaction", 
    " ", "z"}], " ", "*)"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
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
         RowBox[{"pKzO", ",", "pKcO"}], "]"}]}]}], ")"}]}]}], ";"}], " ", 
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{"Bohr", "'"}], "s", " ", "protons", " ", "of", " ", "reaction", 
    " ", "c"}], " ", "*)"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
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
     "subunit"}]}], " ", "*)"}]}]}], "Input", "PluginEmbeddedContent"],

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"x", "=", 
    RowBox[{"O2", "*", 
     RowBox[{"(", 
      RowBox[{"fnD", "/", "fnO"}], ")"}]}]}], ";"}], "  ", 
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{"Adair", "'"}], "s", " ", "dependency", " ", "on", " ", "pH", " ",
     "and", " ", "CO2"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{"Adair", "'"}], "s", " ", "oxygen", " ", "dissociation", " ", 
    "curve", " ", 
    RowBox[{"(", "ODC", ")"}], " ", "equation"}], " ", 
   "*)"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
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
        RowBox[{"x", "^", "4"}]}]}], ")"}]}]}], ";"}], " "}]}], "Input", \
"PluginEmbeddedContent"],

Cell[BoxData[
 RowBox[{
  RowBox[{
   RowBox[{"sCO2", "=", " ", 
    RowBox[{
     RowBox[{"sO2", "*", "sCO2O"}], " ", "+", " ", 
     RowBox[{
      RowBox[{"(", 
       RowBox[{"1", "-", "sO2"}], ")"}], "*", "sCO2D"}]}]}], ";"}], " ", 
  RowBox[{"(*", " ", 
   RowBox[{"CO2", " ", "hemoglobin", " ", "saturation"}], " ", 
   "*)"}]}]], "Input", "PluginEmbeddedContent"],

Cell[BoxData[
 RowBox[{
  RowBox[{"dTH", " ", "=", " ", 
   RowBox[{
    RowBox[{"sO2", " ", "dH"}], " ", "+", " ", 
    RowBox[{"sCO2D", " ", 
     RowBox[{"(", 
      RowBox[{"1", "+", 
       RowBox[{"1", "/", 
        RowBox[{"(", 
         RowBox[{"1", "+", 
          RowBox[{"10", "^", 
           RowBox[{"(", 
            RowBox[{"pH", "-", "pKzD"}], ")"}]}]}], ")"}]}]}], ")"}]}]}]}], 
  ";"}]], "Input", "PluginEmbeddedContent"]
}, Open  ]],

Cell[CellGroupData[{

Cell["Measurements", "Section", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell["\<\
Severinghaus, J. W. (1979). \[OpenCurlyDoubleQuote]Simple, accurate equations \
for human blood O2 dissociation computations.\[CloseCurlyDoubleQuote] Journal \
of applied physiology 46(3): 599-602.\
\>", "Subsection", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell[BoxData[{
 StyleBox[
  RowBox[{
   RowBox[{
    RowBox[{"Severinghaus", "=", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"0.133", ",", "0.006"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"0.267", ",", "0.0119"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"0.533", ",", "0.0256"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"0.8", ",", "0.0437"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"1.07", ",", "0.0668"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"1.33", ",", "0.0958"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"1.6", ",", "0.1296"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"1.87", ",", "0.1689"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"2.13", ",", "0.214"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"2.4", ",", "0.265"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"2.67", ",", "0.3212"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"2.93", ",", "0.376"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"3.2", ",", "0.4314"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"3.47", ",", "0.4827"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"3.73", ",", "0.5316"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"4.", ",", "0.5754"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"4.27", ",", "0.6169"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"4.53", ",", "0.6516"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"4.8", ",", "0.6863"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"5.07", ",", "0.7194"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"5.33", ",", "0.7469"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"5.6", ",", "0.7729"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"5.87", ",", "0.7955"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"6.13", ",", "0.8171"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"6.4", ",", "0.8352"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"6.67", ",", "0.8508"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"6.93", ",", "0.8659"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.2", ",", "0.877"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.47", ",", "0.8893"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"7.73", ",", "0.8995"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"8.", ",", "0.9085"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"8.67", ",", "0.9273"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"9.33", ",", "0.9406"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"10.", ",", "0.951"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"10.7", ",", "0.9584"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"11.3", ",", "0.9642"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"12.", ",", "0.9688"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"12.7", ",", "0.9725"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"13.3", ",", "0.9749"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"14.7", ",", "0.9791"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"16.", ",", "0.9821"}], "}"}]}], "}"}]}], ";"}], " "}],
  FontFamily->"Courier New",
  FontSize->13,
  FontWeight->"Bold"], "\[IndentingNewLine]", 
 StyleBox[
  RowBox[{"Show", "[", 
   RowBox[{
    RowBox[{"Plot", "[", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{
        RowBox[{"sO2", "/.", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{"O2", "\[Rule]", 
            RowBox[{"pO2", "*", "1000", "*", "aO2"}]}], ",", 
           RowBox[{"pH", "\[Rule]", "7.2464"}], ",", 
           RowBox[{"CO2", "\[Rule]", 
            RowBox[{"aCO2", "*", "0"}]}]}], "}"}]}], ",", 
        RowBox[{"sO2", "/.", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{"O2", "\[Rule]", 
            RowBox[{"pO2", "*", "1000", "*", "aO2"}]}], ",", 
           RowBox[{"pH", "\[Rule]", "7.0"}], ",", 
           RowBox[{"CO2", "\[Rule]", 
            RowBox[{"aCO2", "*", "0"}]}]}], "}"}]}], ",", 
        RowBox[{"sO2", "/.", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{"O2", "\[Rule]", 
            RowBox[{"pO2", "*", "1000", "*", "aO2"}]}], ",", 
           RowBox[{"pH", "\[Rule]", "7.5"}], ",", 
           RowBox[{"CO2", "\[Rule]", 
            RowBox[{"aCO2", "*", "0"}]}]}], "}"}]}]}], "}"}], ",", 
      RowBox[{"{", 
       RowBox[{"pO2", ",", "0", ",", "16"}], "}"}], ",", 
      RowBox[{"Frame", "\[Rule]", "True"}], ",", 
      RowBox[{"FrameLabel", "\[Rule]", 
       RowBox[{"{", 
        RowBox[{"\"\<pO2 [kPa]\>\"", ",", "\"\<sO2\>\""}], "}"}]}], ",", 
      RowBox[{"LabelStyle", "\[Rule]", 
       RowBox[{"Directive", "[", 
        RowBox[{"Black", ",", 
         RowBox[{"FontFamily", "\[Rule]", "\"\<Times New Roman\>\""}], ",", 
         "18"}], "]"}]}], ",", 
      RowBox[{"PlotRange", "\[Rule]", "All"}]}], "]"}], ",", 
    "\[IndentingNewLine]", 
    RowBox[{"Plot", "[", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{
        RowBox[{"sO2", "/.", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{"O2", "\[Rule]", 
            RowBox[{"pO2", "*", "1000", "*", "aO2"}]}], ",", 
           RowBox[{"pH", "\[Rule]", "7.2464"}], ",", 
           RowBox[{"CO2", "\[Rule]", 
            RowBox[{"aCO2", "*", "16000"}]}]}], "}"}]}], ",", 
        RowBox[{"sO2", "/.", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{"O2", "\[Rule]", 
            RowBox[{"pO2", "*", "1000", "*", "aO2"}]}], ",", 
           RowBox[{"pH", "\[Rule]", "7.0"}], ",", 
           RowBox[{"CO2", "\[Rule]", 
            RowBox[{"aCO2", "*", "16000"}]}]}], "}"}]}], ",", 
        RowBox[{"sO2", "/.", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{"O2", "\[Rule]", 
            RowBox[{"pO2", "*", "1000", "*", "aO2"}]}], ",", 
           RowBox[{"pH", "\[Rule]", "7.5"}], ",", 
           RowBox[{"CO2", "\[Rule]", 
            RowBox[{"aCO2", "*", "16000"}]}]}], "}"}]}]}], "}"}], ",", 
      RowBox[{"{", 
       RowBox[{"pO2", ",", "0", ",", "16"}], "}"}], ",", 
      "\[IndentingNewLine]", 
      RowBox[{"PlotStyle", "\[Rule]", 
       RowBox[{"Dashing", "[", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"0.02", "*", 
           RowBox[{"(", 
            RowBox[{"1", "-", 
             RowBox[{"16000", "/", "26660"}]}], ")"}]}], ",", 
          RowBox[{"0.02", "*", 
           RowBox[{"(", 
            RowBox[{"16000", "/", "26660"}], ")"}]}]}], "}"}], "]"}]}]}], 
     "]"}], ",", 
    RowBox[{"Plot", "[", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{
        RowBox[{"sO2", "/.", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{"O2", "\[Rule]", 
            RowBox[{"pO2", "*", "1000", "*", "aO2"}]}], ",", 
           RowBox[{"pH", "\[Rule]", "7.2464"}], ",", 
           RowBox[{"CO2", "\[Rule]", 
            RowBox[{"aCO2", "*", "5333"}]}]}], "}"}]}], ",", 
        RowBox[{"sO2", "/.", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{"O2", "\[Rule]", 
            RowBox[{"pO2", "*", "1000", "*", "aO2"}]}], ",", 
           RowBox[{"pH", "\[Rule]", "7.0"}], ",", 
           RowBox[{"CO2", "\[Rule]", 
            RowBox[{"aCO2", "*", "5333"}]}]}], "}"}]}], ",", 
        RowBox[{"sO2", "/.", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{"O2", "\[Rule]", 
            RowBox[{"pO2", "*", "1000", "*", "aO2"}]}], ",", 
           RowBox[{"pH", "\[Rule]", "7.5"}], ",", 
           RowBox[{"CO2", "\[Rule]", 
            RowBox[{"aCO2", "*", "5333"}]}]}], "}"}]}]}], "}"}], ",", 
      RowBox[{"{", 
       RowBox[{"pO2", ",", "0", ",", "16"}], "}"}], ",", 
      RowBox[{"PlotStyle", "\[Rule]", 
       RowBox[{"Dashing", "[", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"0.02", "*", 
           RowBox[{"(", 
            RowBox[{"1", "-", 
             RowBox[{"5333", "/", "26660"}]}], ")"}]}], ",", 
          RowBox[{"0.02", "*", 
           RowBox[{"(", 
            RowBox[{"5333", "/", "26660"}], ")"}]}]}], "}"}], "]"}]}]}], 
     "]"}], ",", 
    RowBox[{"ListPlot", "[", 
     RowBox[{"Severinghaus", ",", 
      RowBox[{"PlotMarkers", "\[Rule]", 
       RowBox[{"Table", "[", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{
           RowBox[{"Graphics", "[", 
            RowBox[{
             RowBox[{"{", 
              RowBox[{"Circle", "[", 
               RowBox[{
                RowBox[{"{", 
                 RowBox[{"0", ",", "0"}], "}"}], ",", "1"}], "]"}], "}"}], 
             ",", 
             RowBox[{"BaseStyle", "\[Rule]", "Inherited"}]}], "]"}], ",", 
           ".03"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"c", ",", 
           RowBox[{"{", "1", "}"}]}], "}"}]}], "]"}]}]}], "]"}]}], "]"}],
  FontFamily->"Courier New",
  FontSize->13,
  FontWeight->"Bold"]}], "Input", "PluginEmbeddedContent",
 FontFamily->"Times New Roman",
 FontSize->24,
 FontWeight->"Plain"],

Cell[BoxData[
 GraphicsBox[{{{}, {}, 
    {Hue[0.67, 0.6, 0.6], LineBox[CompressedData["
1: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
/UrscyW/N5PwPUXxte1tDH0UnWMxCP8HYbk63Q==
      "]]}, 
    {Hue[0.9060679774997897, 0.6, 0.6], LineBox[CompressedData["
1:eJwVz2s01AkYBnC3lm6KqTRqxoxm3PnrJpV632VKjWRNCrnUSnLbFAqdSmON
dJFysGYRlUoYo4yy0UUclVNkaSUyNVk7Y2b+Ui5HW2ZnPzznOb9vz8MMi+Pt
19PR0fHW5v/m7pd3PlbkbYzP2SC6ZcvdaOBhfkhKTYTswxMJJQY2sLKkoKiW
mg5xLvfSVs90Ba+XPXeKqblwkhLPLDfdAv7hkw9yqGWQ5v7lUj47AN4Rpz2y
qBIwaeJ20LwioXShT8ZZagucrAjkzMhLBr5RrfUZajc85sRGCKzPQEDgFfGn
0UH4wrSb3CUshNkafrAnfQSK6WbW56uuA9uXlDefG4Orm+Pz+zKqIal9LRSM
TUGVq+W6EbkEzCQmA7q6GviyNst7n00D3JV5vOhw08MKN7u4lpwmeBJdvCRQ
ZYAnjjO20litMG61YZ7oF0PsbWYFNI21gd5U5fwl7Fm4fetDzovAV+Ci2Xt3
R/Uc9I+28cl17YIX6avaW+3mYezwvd5l7L/A4qJy6hY5H6V9vJS24F5QTkoH
XjubYlEBvZ61qx/KhhvajC9Q8MIzs014VArGtJsjg4ML0DQmkbLb+QOcj6qL
KGUtwvaEem7nURlMYOVgZKoZHuuR8UUPP0LiihbJoubFKE8e76f0DIK0uuVc
J9Mcp04xV1kq/4Z/o7sLbY8tQbehc3S6dAjsfzScjmhYijs/R+42qvoHPK8y
D9w2o2PgyOmUoAQ5JNH2WH4ItsCbdM42GVUBDqqds3u8GVhzOik6q0oBlHmf
jFq+MnCs29vw+7phMHhUKF5WxMQy4fG3w7eHIWZVQ+9ML0vMm7UpwpOthMqt
YaUPJyyxQ2+668BZJYwrzecP5S9DMvwuw0qqhLodnvq5HBYy2pr72perIHWL
oEQyxMKYDzKGZ5IKmO+4b64J2Bhmaxr0TaKCdWvSc6krrDAo51l73qgKgukd
U7pdVih/l2ndyVLDeFuW7BDfGuds0LVx9VdDgUFoIo9lg9UbfTq/8dVAGai7
qtdigwondzmvXA0zTvD91h62xbkffz3i064GnVuhYpmpHXql1moaSTXE/y7O
Mn1ih35n5nxTG5PwwD7TyOSgPZ4SDj/vsyfBhBvvkGbsgG4Jny/d4ZDQ7/iq
K6XRAYf7a6sEISTUXAbWYKgjOkU1ieTxJISIXUxo045ofCBtZVAGCacEV/j9
FU7Ii2IdUwhJEMlphcbbCIzLDKvrqSAhs1iwd2A7gY9eeQgZlSSE89Tsal8C
edtpEVFaL21srPH2J5DrPHD/q9Zns4Naz4cRWCYo9F0qIiHSRTg6K4VARupC
tyAxCZbpC7YY3iCwtPQm51ktCdOux+f2lBOY7MYNNJaQ0Kv++OeNSgKlAz8E
+Gl90b82ZPNtAp/+NEp5r7XGjpcgaCTwuzg1Y6JO+7cz+7J+F4HMIfNQi3oS
6jMm93W9JrAV4xeHa527fo/ttTfa/ayDD8q19rruJHEfINBbeOTp8j9IuJ/8
8jlfQaBOa02/+30S8h1XZ/uqCNSnmqsztD4sK/JjjhAYIoqRt2ltsy1W+niM
QJGtooTXQIKBbnfZxUkCYzrYwflav69bH733K4G0FbH6b7VujL5GOH8nsPZG
Sx6tkYTfLGaPazQEEifXUH7W+j8HHEnk
      "]]}, 
    {Hue[0.1421359549995791, 0.6, 0.6], LineBox[CompressedData["
1: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
BUt8XXvB5NwcA00Nm9XPSfw/vJXP8w==
      "]]}}, {{}, {}, 
    {Hue[0.67, 0.6, 0.6], 
     Dashing[{0.007996999249812453, 0.012003000750187547`}], 
     LineBox[CompressedData["
1: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
IJL6upHqpERCIDkxvZ7+hYT/AAxX5/Q=
      "]]}, 
    {Hue[0.9060679774997897, 0.6, 0.6], 
     Dashing[{0.007996999249812453, 0.012003000750187547`}], 
     LineBox[CompressedData["
1:eJwVznk41Akcx3FnROsMjTJiZoTBryfMouP77WAcqXU1JaZZBlFaxbOtHj2l
kNwVpe1SI6s8qFCtK8estqgIi9TQpBrM/KicbY2d/ePzfJ7Xf2+LsF/8I1SU
lJR8Ffv/vSMkXU2jBRvYberefU3sDWqbTeOGKAmQ4VneOPOMAY7XCi9XUVJg
gSk+WNvlDD7P+u5doeQD23Ny2ckBd+DwZxvOUorhQZ7Qy2I0CN4QpzZnU6oh
p1lym6oZCUVG29MyKEJw/7Zxn4P7r5CsWbXqNKUH3iealYoa0mDnruuVk59G
4Ltdg9u5rkLQXkgOYVMn4K8jH2MSggXA8CMlrZlTMOroaLxJtQwOP3eFwql5
iL7Hq3rjfQ9MqvVFysoL4Op0uL/02AO4L97c8WKdCgZvLJqbNWqElpgry3dJ
1fBGm3Z4ekcLTFut1y2P1cBJ7nYXt8dtoDJfprecoYWUnhw2r6AdWAu8+wEV
S7CD6cy2WdcJHSlOz9tsdfHh1Ez6l7aXYJ43Pn+L1MPUoGqBwc1eGJ8dEvWu
NsCVnEeL3Lj9UDxW91QnxxCtrFk+D7YPgo7ZHxMjI0vxs7yZ40MTQVZ0TWQR
3Rh189TnmnYMwwyWjew9ZoKsTknK45tvIWGNsNq4dRkaxc9xeO1iGKoQZnZZ
mCLvm+Xfi768g39jei7ZHFmOWWOnXT5/HwHmRg15ZN0KjKCenfQRvwf2DYuo
uyZUfFc8bEwXfoDDZnss34aYo9jL0LH85EewkwZp9/muxPhXSYUZDhIw1J3U
FH5diUNuKbWx/0hA7dGlStplC4yLecg04o/CPqe6gcU+lqjx0jWnlRyFMq+w
osYZS1ySDBd3R4/B9Lip3ofzNByOHbzW1TkGNQFs1fwtdDShBwSGssbhmGfq
teoPdLSOdyq3zxoHizfe/YJUBhZmy0ua+8fB7ceUfMoaK9ySlNbgTpdCCPXF
vHK3FRZ45p3cxZfC9NNscVzyKpSfLou9IJBCoRo3wZ9ujfdrDeujBqRgKKq5
oSK0RnmjpW3zYhmoH00OdD1og3siQvRbXWWgdItbKTawxaAd6fu6wmRw6PfK
bIMWW3xlHk8XZMqggZmuqX+AiY9paxO4d2Sg733I7oSOHXZ6MPU+vZDBa/vO
7sR6O1xP3e+ZNiGDO1eBPsK1x4+MYNVmLRJCK1n6ZnJ79GaqeZ+ikXA89Xry
69sO+KfV8/H4dSSUS8wu6Wwl8PgZX1UtfxLSr6TyRNsIbA8cnI5UmO8vY1T4
Eei8k9HeqvCK+vo7vhwCzzWsoB4NICEjd3dbVhiBDnRRJBlIwl7WxU9aiQSC
oCW7nUOCZcpST40SAg+EVR2PCyVB7pL0Q18pgdbqc8NPFB6QvXtZUkagnSCc
QeOSkMepCvW4S6DXk8HgXoUXbP3jU+sJXBx9ItGFR8Lrrtyrqt0EmpXY586H
kfAwbTa8u5fAnkw5yy+chPy1e2wE/QR6KBe3lirsc9OhepOIwLc/Xcjk8Emo
/e3Zk+RRArl8r76qCBLO2zvn+kkVvR2SEq1IEg6KLwdaTBCYVnF3988KW2/d
P9Q0ReC2r6MJOlEkqCn3FOfNEngr/MAAX+HhmrUxvK+KHrYHrU7h+hgBsfo7
gXHLkvz195JwwVx7emGBwAIP06gohf8DZ0dERQ==
      "]]}, 
    {Hue[0.1421359549995791, 0.6, 0.6], 
     Dashing[{0.007996999249812453, 0.012003000750187547`}], 
     LineBox[CompressedData["
1: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
RjdnlW2U+qq+snh2lsChPKOHv0v9Hz3K080=
      "]]}}, {{}, {}, 
    {Hue[0.67, 0.6, 0.6], 
     Dashing[{0.015999249812453115`, 0.004000750187546887}], 
     LineBox[CompressedData["
1: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
Xwh85RDJp8v9s7m6WCYj0C5WUXxW7v8BqKIC1A==
      "]]}, 
    {Hue[0.9060679774997897, 0.6, 0.6], 
     Dashing[{0.015999249812453115`, 0.004000750187546887}], 
     LineBox[CompressedData["
1:eJwVz3k41Akcx3HXPpUrR1uGHMM4Bz9LiqTvN+NJhlakR60ja1MhR6XHth1W
i2yuWSupTEZ0MibH2Io2j0bPo2NqHA8pR0zCzPxk1zQ702Jn//g87+f154ea
kB6RqKWhobFTvf/LTJwWdc5c3Pp2mKebvj14qw7DPGOMkgkl7nHmI16O4FVd
WdVCyQWdtXSGnc8mCHk52MymlEN8A+ebBQyCqAOKR2WUOvCcGH7CiYiCEeI8
o5jSCq6uNAPuiUPA+Tos/wJFAD7RaQz+wyzIWdni+CulHzp8Lf0PMApg774a
3qd5MZwKHEtL/u0K6C3nxARZzUFYfcaS/qs6sA8np58ULsBFs7u3or25kCX0
hcoFJaQMOxn9I2mBda3Go5qayxCoWmwO6H4AbROMF6+2aKGf5P7y7apO6Epm
W+yT6uD0jYpQ3zEByB38V3NTVyBPmXnl3v4e0FLWG1nY62LGJpHh824hbFyO
b9vdqI/XNwfn+5v3wovcDcKnLqsxtrrjZpa4H6xZEuUd0gjjo/yHBhcHQaIY
Gx3wMMFZhd3rxolhqJttf2ZYYooJqi27YuUjYGh5a04sXoMBHsNhhanjUJTE
P8ihrcWG898XWPLfw2esFx/OXod0bc9IquYkZHoKWtc+MUOWF7/ggrUYxhoF
hSKqOQY+5ko6/T7Al+T+q84/WaBg67GXQp8poG9bsXSwfT3+nVRe02T4EYKu
Uw81rbPChZC4GdnYR8iy3G/7PsYa17xtbOeUToOrdI/e4E4bdFKaPtalz4Dp
6k8rBSobXFLVBLC6ZkDn8VWeXRUVw5tOG+Rtm4WUDe1vVoXYYmZ2e6beo1mo
D07g/PnZFg1SmWc5zhKQS8yNpirsUDv3war+XAnwdwdplwfS8MvcX4mKEQlk
78irbp2iYW3DZLe2sxSoI8yh2jx73CV8LnqaIoXNm3LLKZ4O2FMxTkvlSiHG
6pVSs88BizwZuktiKcifFU9k5Dgia0T+R5uFDCp14jIjaE7YEJ2wSDBlYDrK
v64lcELvI0q98eMy+OpMTqTvUWfsnr2f5s2WgcadON6EiQu22epH/tIpg2NX
eMUmXS6oNBUd+n1SBo/oBSuN0+go7H2gNNMmwZh5zPWcoSveZZ7to1uR8M7t
dd/JDlcMS09M2uJLwr1rQBPHuaHypE1jyS4SYnkbjS2X3HCKVhsjSCTh57ya
nHd33ZFedktmdooE7rTlVcNQAtcnZw+wikkoYOfFj35LoF7+873jah+IkNk3
hhP42ejfLqKEhPUdHfd2RhHoNOUZKlT7Qmn006IEAvdwjL10WSQc3nh5Xvck
gWX2kdFnykiwzV2zY8VNAo/4fvku/BIJSz6nDQZvEygqMhGy1X4jm+y9WU9g
39AO51m1WVEtsdubCAw+4VN5rpKEZZeI43kdap9x29d8Wf1XVHpNu49AlYqb
blBFwv18xQ99AwSevm2btFftcr/9zrVDBPo0hYbUqh1yw701YJTAOdGHHh82
CQ9/fNmTM0NgK9O9KeEaCRVu3qXhUgLtJWHzDWofnaiKpM4RWJeRYa5Q2yn0
yFjnAoEp7F7HwmoSdDT761gKAv2PO+gPqD3O90uOVxG4uZD9xopDQkdyLeGx
SKB8HlmH1b5krSdfXiaQz6N4NKv9H45XUGI=
      "]]}, 
    {Hue[0.1421359549995791, 0.6, 0.6], 
     Dashing[{0.015999249812453115`, 0.004000750187546887}], 
     LineBox[CompressedData["
1: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

      "]]}}, {{}, GraphicsComplexBox[CompressedData["
1:eJxTTMoPSmViYGAIAmIQvUBK/64K20H7X3VZe0omV9h78TBpt4tdtC9xm/KN
Lb7DvnSyBEsY30N7XWeZ14/MZtnPmgkCL+3D5q9eeyN+mb186+vAHXIf7S/l
x7Ofk9xo7/GwSmSd+1f7Gx++eEW27YCq/2nf9Oj4jN3TDti/Aapuff3X/tk6
1SfN847ac11fXGDLxehgyLFGJirltL0xGDA7fNOI6T/09YI9iNSIYXVYm3mv
sKvvin2hLUgHu8Oqj5d8kwRuQM3ndHBYcn8f35zb9oe/gjRyO2SBlD+5Zw82
/jqvg/j2iwz3mB7aM4CBgMP7k4ed1mY+sgc6FuhiQYeyB3MEl+59DPWPkMO7
KCe7FzefQN0j7JB+9XmW9renUP+JOOw7KK4WzPrcPgjknUBRh/k2OldmPXtu
nwYGYg6OYA+/sK8GWyDucPsnKIBf2oONb5VwWPjDEBgEr6Dul3SovbA58uvO
V/Zg56yTcnD59fb1AcvX9mDjd0g7LEzf/Kp462v7s2dAQAbq/zf2YOc8lHXw
Wcblplr6Bhq+cg5JAhGWW068gfpXweG+f+/0PKG3kPAIV3R4NXUTT+Gat/aa
oABeoeSQePiydqrkO6h6FQdrsIZ3UP+oOkyfwF9ltvod1L1qDmDn3oKp13Ao
XNN9O4PhPVS9pgMkHN9D1Ws5BN6Srkk0gsnrOmTmf2g9GfIeqt/A4cXNNb9i
ct/bj6bH0fQ4mNIjAJ0mW7w=
     "], {
      {RGBColor[0.24720000000000014`, 0.24, 0.6], InsetBox[
        GraphicsBox[
         {RGBColor[0.24720000000000014`, 0.24, 0.6], CircleBox[{0, 0}]}], 42, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.24720000000000014`, 0.24, 0.6], CircleBox[{0, 0}]}], 43, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.24720000000000014`, 0.24, 0.6], CircleBox[{0, 0}]}], 44, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.24720000000000014`, 0.24, 0.6], CircleBox[{0, 0}]}], 45, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.24720000000000014`, 0.24, 0.6], CircleBox[{0, 0}]}], 46, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.24720000000000014`, 0.24, 0.6], CircleBox[{0, 0}]}], 47, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.24720000000000014`, 0.24, 0.6], CircleBox[{0, 0}]}], 48, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.24720000000000014`, 0.24, 0.6], CircleBox[{0, 0}]}], 49, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.24720000000000014`, 0.24, 0.6], CircleBox[{0, 0}]}], 50, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.24720000000000014`, 0.24, 0.6], CircleBox[{0, 0}]}], 51, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.24720000000000014`, 0.24, 0.6], CircleBox[{0, 0}]}], 52, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.24720000000000014`, 0.24, 0.6], CircleBox[{0, 0}]}], 53, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.24720000000000014`, 0.24, 0.6], CircleBox[{0, 0}]}], 54, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.24720000000000014`, 0.24, 0.6], CircleBox[{0, 0}]}], 55, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.24720000000000014`, 0.24, 0.6], CircleBox[{0, 0}]}], 56, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.24720000000000014`, 0.24, 0.6], CircleBox[{0, 0}]}], 57, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.24720000000000014`, 0.24, 0.6], CircleBox[{0, 0}]}], 58, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.24720000000000014`, 0.24, 0.6], CircleBox[{0, 0}]}], 59, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.24720000000000014`, 0.24, 0.6], CircleBox[{0, 0}]}], 60, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.24720000000000014`, 0.24, 0.6], CircleBox[{0, 0}]}], 61, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.24720000000000014`, 0.24, 0.6], CircleBox[{0, 0}]}], 62, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.24720000000000014`, 0.24, 0.6], CircleBox[{0, 0}]}], 63, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.24720000000000014`, 0.24, 0.6], CircleBox[{0, 0}]}], 64, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.24720000000000014`, 0.24, 0.6], CircleBox[{0, 0}]}], 65, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.24720000000000014`, 0.24, 0.6], CircleBox[{0, 0}]}], 66, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.24720000000000014`, 0.24, 0.6], CircleBox[{0, 0}]}], 67, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.24720000000000014`, 0.24, 0.6], CircleBox[{0, 0}]}], 68, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.24720000000000014`, 0.24, 0.6], CircleBox[{0, 0}]}], 69, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.24720000000000014`, 0.24, 0.6], CircleBox[{0, 0}]}], 70, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.24720000000000014`, 0.24, 0.6], CircleBox[{0, 0}]}], 71, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.24720000000000014`, 0.24, 0.6], CircleBox[{0, 0}]}], 72, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.24720000000000014`, 0.24, 0.6], CircleBox[{0, 0}]}], 73, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.24720000000000014`, 0.24, 0.6], CircleBox[{0, 0}]}], 74, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.24720000000000014`, 0.24, 0.6], CircleBox[{0, 0}]}], 75, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.24720000000000014`, 0.24, 0.6], CircleBox[{0, 0}]}], 76, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.24720000000000014`, 0.24, 0.6], CircleBox[{0, 0}]}], 77, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.24720000000000014`, 0.24, 0.6], CircleBox[{0, 0}]}], 78, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.24720000000000014`, 0.24, 0.6], CircleBox[{0, 0}]}], 79, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.24720000000000014`, 0.24, 0.6], CircleBox[{0, 0}]}], 80, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.24720000000000014`, 0.24, 0.6], CircleBox[{0, 0}]}], 81, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.24720000000000014`, 0.24, 0.6], CircleBox[{0, 0}]}], 82, 
        Automatic, Scaled[{0.03, 0.03}]]}, {}}], {}}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->True,
  AxesOrigin->{0, 0},
  Frame->True,
  FrameLabel->{{
     FormBox["\"sO2\"", TraditionalForm], None}, {
     FormBox["\"pO2 [kPa]\"", TraditionalForm], None}},
  LabelStyle->Directive[
    GrayLevel[0], FontFamily -> "Times New Roman", 18],
  Method->{},
  PlotRange->{All, All},
  PlotRangeClipping->True,
  PlotRangePadding->{Automatic, Automatic}]], "Output", \
"PluginEmbeddedContent"]
}, Open  ]],

Cell[BoxData[
 RowBox[{"Manipulate", "[", 
  RowBox[{
   RowBox[{"Plot", "[", 
    RowBox[{
     RowBox[{"sO2", "/.", " ", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"O2", "\[Rule]", 
         RowBox[{"pO2", "*", "1000", "*", "aO2"}]}], ",", 
        RowBox[{"pH", "\[Rule]", 
         RowBox[{"7.2464", "+", 
          RowBox[{"0.796", 
           RowBox[{"(", 
            RowBox[{"pHp", "-", "7.4"}], ")"}]}]}]}], ",", " ", 
        RowBox[{"CO2", "\[Rule]", 
         RowBox[{"aCO2", "*", "1000", "*", "pCO2"}]}]}], "}"}]}], ",", " ", 
     RowBox[{"{", 
      RowBox[{"pO2", ",", "0", ",", "16"}], "}"}], ",", " ", 
     RowBox[{"AxesLabel", " ", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{"\"\<pO2 [kPa]\>\"", ",", "\"\<sO2\>\""}], "}"}]}], ",", " ", 
     RowBox[{"PlotRange", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{"0", ",", "1"}], "}"}]}]}], "]"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"pHp", ",", "7.4", ",", "\"\<Plasma pH\>\""}], "}"}], ",", "7", 
     ",", "7.8"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"pCO2", ",", "0", ",", " ", "\"\<pCO2 [kPa]\>\""}], "}"}], ",", 
     "0", ",", "27"}], "}"}]}], "]"}]], "Input", "PluginEmbeddedContent"],

Cell[BoxData[
 RowBox[{"Manipulate", "[", 
  RowBox[{
   RowBox[{"Show", "[", 
    RowBox[{
     RowBox[{"Plot", "[", 
      RowBox[{
       RowBox[{"sO2", "/.", " ", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"O2", "\[Rule]", 
           RowBox[{"pO2", "*", "1000", "*", "aO2"}]}], ",", 
          RowBox[{"pH", "\[Rule]", 
           RowBox[{"7.2464", "+", 
            RowBox[{"0.796", 
             RowBox[{"(", 
              RowBox[{"pHp", "-", "7.4"}], ")"}]}]}]}], ",", " ", 
          RowBox[{"CO2", "\[Rule]", 
           RowBox[{"aCO2", "*", "1000", "*", "pCO2"}]}]}], "}"}]}], ",", " ", 
       RowBox[{"{", 
        RowBox[{"pO2", ",", "0", ",", "16"}], "}"}], ",", " ", 
       RowBox[{"AxesLabel", " ", "\[Rule]", 
        RowBox[{"{", 
         RowBox[{"\"\<pO2[kPa]\>\"", ",", "\"\<sO2\>\""}], "}"}]}], ",", " ", 
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
      RowBox[{"pCO2", ",", "0", ",", " ", "\"\<pCO2[kPa]\>\""}], "}"}], ",", 
     "0", ",", "27"}], "}"}]}], "]"}]], "Input", "PluginEmbeddedContent"]
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
     "\[IndentingNewLine]", 
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
          RowBox[{"40", "*", 
           RowBox[{"(", 
            RowBox[{"101325", "/", "760"}], ")"}], "*", "aCO2"}]}], "}"}]}], 
       ",", 
       RowBox[{"sCO2O", "/.", 
        RowBox[{"{", 
         RowBox[{"CO2", "\[Rule]", 
          RowBox[{"40", "*", 
           RowBox[{"(", 
            RowBox[{"101325", "/", "760"}], ")"}], "*", "aCO2"}]}], "}"}]}]}],
       "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"pH", ",", "6.9", ",", "7.5"}], "}"}], ",", 
     RowBox[{"PlotLegends", "\[Rule]", 
      RowBox[{"Placed", "[", 
       RowBox[{
        RowBox[{"{", 
         RowBox[{
         "\"\<current model deoxy Hb\>\"", ",", 
          "\"\<current model oxy Hb\>\""}], "}"}], ",", "Below"}], "]"}]}], 
     ",", 
     RowBox[{"PlotStyle", "->", 
      RowBox[{"Dashing", "[", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"0.02", "*", 
          RowBox[{"(", 
           RowBox[{"1", "-", 
            RowBox[{"5333", "/", "16000"}]}], ")"}]}], ",", 
         RowBox[{"0.02", "*", 
          RowBox[{"(", 
           RowBox[{"5333", "/", "16000"}], ")"}]}]}], "}"}], "]"}]}], ",", 
     "\[IndentingNewLine]", "\[IndentingNewLine]", 
     RowBox[{"Frame", "\[Rule]", "True"}], ",", 
     RowBox[{"FrameLabel", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{"\"\<pH\>\"", ",", "\"\<sCO2\>\""}], "}"}]}], ",", 
     RowBox[{"LabelStyle", "\[Rule]", 
      RowBox[{"Directive", "[", 
       RowBox[{"Black", ",", 
        RowBox[{"FontFamily", "\[Rule]", "\"\<Times New Roman\>\""}], ",", 
        "18"}], "]"}]}]}], "]"}], ",", 
   RowBox[{"ListPlot", "[", 
    RowBox[{"Bauer", ",", 
     RowBox[{"PlotMarkers", "\[Rule]", 
      RowBox[{"Table", "[", " ", 
       RowBox[{
        RowBox[{"{", 
         RowBox[{
          RowBox[{"Graphics", "[", 
           RowBox[{
            RowBox[{"{", 
             RowBox[{"Circle", "[", 
              RowBox[{
               RowBox[{"{", 
                RowBox[{"0", ",", "0"}], "}"}], ",", "1"}], "]"}], "}"}], ",", 
            RowBox[{"BaseStyle", "\[Rule]", " ", "Inherited"}]}], "]"}], ",", 
          ".03"}], "}"}], ",", 
        RowBox[{"{", 
         RowBox[{"c", " ", ",", " ", 
          RowBox[{"{", "1", "}"}]}], "}"}]}], "]"}]}], ",", 
     RowBox[{"PlotLegends", "\[Rule]", 
      RowBox[{"Placed", "[", 
       RowBox[{
        RowBox[{"{", 
         RowBox[{
         "\"\<deoxy Hb measurements by Bauer1972\>\"", ",", 
          "\"\<oxy Hb measurements by Bauer1972\>\""}], "}"}], ",", "Below"}],
        "]"}]}]}], "]"}]}], "]"}]}], "Input", "PluginEmbeddedContent"],

Cell[BoxData[
 TemplateBox[{GraphicsBox[{{{}, {}, {
       Hue[0.67, 0.6, 0.6], 
       Dashing[{0.01333375, 0.00666625}], 
       LineBox[CompressedData["
1:eJwVzHs81Xccx3GJWmenLNkD/X5fiooanZrW5LQ+Hw92ui3KSStr2REp5tBW
FCmitHoU3RaHcE4ShdzllutxOYnT13KpVYSQFIsuJvbbH+/H6/H85z3fzdfJ
Q1NDQ2MTt/8rfO8ti4lh0MMnJLWhSw5t7Vmt9ZzfVCj5Dr1y8C95rzfG+StJ
yhz1Szlkh4ZFusgYFEnS+C3DcjDnx4YzsQxKzEMy+ifloDdfJb0ax6BGaE+t
gFXAqw3mdvIEBn9YfGOatbMC4uO7B1KuMzjDKdF9Tb0CvM4lDBZnM9hv6SCf
0ngN3DV9TYbvMtj8XXC/8H4SjAjdZvSrGDxgo7enl16HwdIrid2tDP67aXX+
7PFk0Kvu9NLsZrDkoea4xCgFknSlPabDDM7VcunK9kwF1SIj3c8mGJSt+eXg
/qKbYFT2fP8sHovnvfPnFGilweOE/lADfRZrNF1PaASlg1JLW2lvymLlqN1p
ti8DRAL7IisBi396ixvjl2bCMoXSddFqFp+S6dKHU7JgbcxP1sJ1LBqkf5P/
a1MW1LZZVYidWTTpSBtuL8iGp08E40vdWJwV09agmZwDJp7oZSFl8WLkhdyN
Z3OhyfriKcsgFrf+5fDI70Ie3Dw31r45gkWzHwf2MlH58Noi6XHAJRavfnnc
aXZGAdRF7Y+UyFncnnAzVkzvgPqQ2N8nnUVxsk3C0cFCsE0NmBlcxKK3tyRQ
aFEMz37ObM2oYdHRzjhKR1ICem38rdcoi9KcjOGzslLIlt0KiX3G4stK/86n
Y3chuHNXR94Ai4oW75k3zMohy2/rUPMHFl26Xy+4/KIcjih9snO1CSosSz0V
KRVwID72RsFsgp6PDXujd1fCw7LPN901Iuiu80A8sKIK3D2iFvYuIWhmuMf+
1EQV/KG2zqQrCW47XFk7XVUN+uGmAxV2BI8I7Xf5pCuhudhkR7Mjwb9lBZM1
ETXwQege0LeTYFfLxzjroFrYgEV1xvsIGg5HRj9yrwMr3ooGw4ME6xbcblM5
1sMJduiY/nGC2qLo2iXOKtDKKd/z7TmCIlpMBI734NX55k8usQTLq/edT3Zv
AO+VvLW2KQSPLp6XExl0H/RdnavW5xL8JDYolJ5oBAv18zfOFdyfQCWov9UE
vspwx/D7BCfIFLmumxrWhWyQHGwnGNzp9kz7tRpOhzmZer0gaJXHK44+9QDG
eL4Gof8Q1Iqbhg4Mhe3aPL0CzlsU/NjnhELeZJLOIGfRimTTgHkU/EYeTdvx
liDD8ytNXEjhxRPR6LIRgh8d3XTfCSg0ZxrRjlGCC5a2rkq1p5C2rfEMfiQ4
w8EMlksp8Lbsi/DnvHyulvCeHwXPjVphaZxNuhx3e/xOwQRtAg3GCOYs0Vkl
O0QhZnHy3iHOo9ZmH7TDKJwcD/4+cZygG3u6pOcKhe53BrYtnG+Xvw08LqNg
O5yzmv+JoOzrlR7GVymM9/RbHeKcF2NcukNB4bcmZ5PNEwTH4gIPq9MoqOuH
yEnO9X2Jl6W3KVhWnzEs4SwYET/hZ1Pou1PxhfkkwWO6Nm/WF1AQ5ezk7+Is
nupS2FdIISn9/fRLnBN8OzIiSihoplyYquI8WVbVtKiMgqvCcnKS8xGXMaam
gsJ/2yNDKA==
        "]]}, {
       Hue[0.9060679774997897, 0.6, 0.6], 
       Dashing[{0.01333375, 0.00666625}], 
       LineBox[CompressedData["
1:eJwV0XlYzHkcB/A27G6zg9aTbXrm9w21EltCtNXk+XwqkhwJsza3DmPyZKLt
2A5FyTE6qLTTMZNpOkhMTcf8kiMZHTalsR3OKJFE56KN9uePz/N+Xs/7n/fz
fOZ4iTb66uro6Kxj7mvyPuxPl0i4GH9HbaqcJ4b2juK2esbsaYPv0i3EEFz1
wWCM8dSHtSfjFouh5EhM4tZ0LgoEmoW7eWIwZ2fEcjO4mN1kZUfcxWAwp+FA
ViYXU/pdhNeDxfDWzdz5vIyLox4Ok6R3xCCVdvcV5HKxLiEuvn3fafBLkPVf
LeGiCyfAZ+mDePDRFZkMXudivVdUpbNNIozwvPR6G7h4utU/7Il7EvRfS8vu
buNiGcWK4FFnwOD2cz/dbi7+tF3wRq/rDChmHHhpOshFzU29JRk1Z6HBzHjG
91+YPbcmGmUXksH4xouD01gULg4tsNM5mQKPZL1HOIYUqj2ThucfSwXN5Cma
FaYUrglau98m7By4WK2otLai8FOax/rbgWmwSK7ZZeZAYWfF9Lb18X/BKsk2
W54rhXYLDglEUgnUtltXb+JTWPONXbRtSzo8fWI1vtCLQpt4lkUmOxNMBOhn
cYBCWZyBTH95FjTZJp+wDKcw6NNsdV+yFC4mjHVsOE5h5pLaaXM7ZfDOQvEo
JIXCMM6A7ZuL2VCXdDBxz3kKq5ItI8KF56E5dFOwfxGFK1KXVdybIwfHCyFT
IyspbMvvCR4fkMOzHcq2y3corEt9PRZB54BBO3tzTguzv2p0pD1WASXphdEZ
zygMtWDXOAlzIfL5zs6yPgq3ZZ3b8mZlHhQHbB7QfqRwnpYTcHB5PkRo/EtK
pxDUV3rkmtgVwB/SjPyKHwmuvNuqevDLBfjnxg/rrhsT9I7U033Ouwg+vklz
Xy0gGOA5FL7ZqRBONtsqW2yYfmap+Y01l8Aw1rSv2png8FXvQnZQEWivmnhq
3QneStwxb0vyZfjI8wl5vZ3gseioExLtFXDDyrpZQoI2j8dS9WOVYM1a+rdR
EMEQ5ejEg1nFcIwaiDI8SnCLZYbTcGMxTFbd3PtrAkFx1WF6T1AJvD2j/bw1
g+DRfcIA10Uq2G/DWuVYQNByb5e9b78KDHfxa1aXEuTjU9tX8lKwaH7xnl9N
cChTz2qbfxmINLHusY0EN0TOLb9mVQ6u0W57gjoIpvX0+QqHy+FUzEZTvx6C
gfZuZlGNFTDGEnGODBGMv+ssiJaq4fcpLIMKxkZOIfcXy9VQNqGY3s+YZD3O
68pVQ8DIw289hwk2DXokuxapoeeJy+iiEYIS0Z+BhlVq0CqNWzpHCbp/cePX
d6jh0m/3xPiJ4P3ZdjWRM2lgeQiPBzOWr6ezHIxoEKyZHHOJca9Wv/s/igYT
tA/jjBEsXL21NPxnGiTz8/YNMFZ5vfSOtqYhbjxyZfY4wbt5aydJPWjo/pfj
2Mr4XE1OljefBsdBlQP7M8GxVaaK+Z40jL/stQ5lfFhxZbR8Nw2HmvgmG74w
/152qrBVRENz/QCJY1w2uzhfFkiD5W2xUdXXPtFcXxhCw2t1tb75BMGn7ymz
z4dpcFFtZ+9k3PUwR1t7lAZF0YfvUhjPdEjsPxtHg27B2UkNjO2ndgfuPEXD
LrnlxATjIZf8vQsSaPgf73k/PA==
        "]]}}, {{}, 
      GraphicsComplexBox[CompressedData["
1:eJxTTMoPSmViYGCIAmIQDQEyDi/VDDnWyKyyF1nn/rBKRMZhzhGFDUUZG+3l
W18H7pCTccjaUzJZgmWbvWZM/6GvGjIOIY+XzgYqgfOLMya+rbHfau8B1L3O
XcbBx7zTMeHpBnuwdIyMw6yZILDTvhpsgYzDZd8kgQjLLfZg6X4ZB5funOe/
V260h6iTceC6vrjAlmu7/RIgeX2xjEPQDjmQS+wPg5QfknGA6DtkD3G/rIMx
GByGulfWAWjYx0u+h6Duk3X4VQfywQl7W7DBslD7j9iDlbfKOkDo01D3yDr8
u1IBDJITUPtkHVYBTUsSuADnQ/x50f7sGRCQhYbXRXuws6/LOkDEz9i/ARn7
GuaeS/YQb0g77PLkYdJub7P/BjLuq7SD5ZYTZfvmd9nD4iMqxfq+f+90e0g4
IPgQf8o4/AEZl7QA6h9YfE2Ehz/EvFn2kHCTcQDrzpsE50dAFNgXgg2QcdBu
F7t57vtieHhXghPEHKj/ZKD+XwH1Hyw+V0L9h7APxof4cx08vCHmboC6Txae
fmB8mPmQ9CLrADFnIzw+Frlu+/z3yg5o+pCFp0dYfCQ8vaB0++c++9H0PJqe
h1N6BgDempRa
       "], {{
         RGBColor[0.24720000000000014`, 0.24, 0.6], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24720000000000014`, 0.24, 0.6], 
            CircleBox[{0, 0}]}], 46, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24720000000000014`, 0.24, 0.6], 
            CircleBox[{0, 0}]}], 47, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24720000000000014`, 0.24, 0.6], 
            CircleBox[{0, 0}]}], 48, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24720000000000014`, 0.24, 0.6], 
            CircleBox[{0, 0}]}], 49, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24720000000000014`, 0.24, 0.6], 
            CircleBox[{0, 0}]}], 50, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24720000000000014`, 0.24, 0.6], 
            CircleBox[{0, 0}]}], 51, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24720000000000014`, 0.24, 0.6], 
            CircleBox[{0, 0}]}], 52, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24720000000000014`, 0.24, 0.6], 
            CircleBox[{0, 0}]}], 53, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24720000000000014`, 0.24, 0.6], 
            CircleBox[{0, 0}]}], 54, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24720000000000014`, 0.24, 0.6], 
            CircleBox[{0, 0}]}], 55, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24720000000000014`, 0.24, 0.6], 
            CircleBox[{0, 0}]}], 56, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24720000000000014`, 0.24, 0.6], 
            CircleBox[{0, 0}]}], 57, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24720000000000014`, 0.24, 0.6], 
            CircleBox[{0, 0}]}], 58, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24720000000000014`, 0.24, 0.6], 
            CircleBox[{0, 0}]}], 59, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24720000000000014`, 0.24, 0.6], 
            CircleBox[{0, 0}]}], 60, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24720000000000014`, 0.24, 0.6], 
            CircleBox[{0, 0}]}], 61, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24720000000000014`, 0.24, 0.6], 
            CircleBox[{0, 0}]}], 62, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24720000000000014`, 0.24, 0.6], 
            CircleBox[{0, 0}]}], 63, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24720000000000014`, 0.24, 0.6], 
            CircleBox[{0, 0}]}], 64, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24720000000000014`, 0.24, 0.6], 
            CircleBox[{0, 0}]}], 65, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24720000000000014`, 0.24, 0.6], 
            CircleBox[{0, 0}]}], 66, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24720000000000014`, 0.24, 0.6], 
            CircleBox[{0, 0}]}], 67, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24720000000000014`, 0.24, 0.6], 
            CircleBox[{0, 0}]}], 68, Automatic, 
          Scaled[{0.03, 0.03}]]}, {
         RGBColor[0.6, 0.24, 0.4428931686004542], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.6, 0.24, 0.4428931686004542], 
            CircleBox[{0, 0}]}], 69, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.6, 0.24, 0.4428931686004542], 
            CircleBox[{0, 0}]}], 70, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.6, 0.24, 0.4428931686004542], 
            CircleBox[{0, 0}]}], 71, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.6, 0.24, 0.4428931686004542], 
            CircleBox[{0, 0}]}], 72, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.6, 0.24, 0.4428931686004542], 
            CircleBox[{0, 0}]}], 73, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.6, 0.24, 0.4428931686004542], 
            CircleBox[{0, 0}]}], 74, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.6, 0.24, 0.4428931686004542], 
            CircleBox[{0, 0}]}], 75, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.6, 0.24, 0.4428931686004542], 
            CircleBox[{0, 0}]}], 76, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.6, 0.24, 0.4428931686004542], 
            CircleBox[{0, 0}]}], 77, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.6, 0.24, 0.4428931686004542], 
            CircleBox[{0, 0}]}], 78, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.6, 0.24, 0.4428931686004542], 
            CircleBox[{0, 0}]}], 79, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.6, 0.24, 0.4428931686004542], 
            CircleBox[{0, 0}]}], 80, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.6, 0.24, 0.4428931686004542], 
            CircleBox[{0, 0}]}], 81, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.6, 0.24, 0.4428931686004542], 
            CircleBox[{0, 0}]}], 82, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.6, 0.24, 0.4428931686004542], 
            CircleBox[{0, 0}]}], 83, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.6, 0.24, 0.4428931686004542], 
            CircleBox[{0, 0}]}], 84, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.6, 0.24, 0.4428931686004542], 
            CircleBox[{0, 0}]}], 85, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.6, 0.24, 0.4428931686004542], 
            CircleBox[{0, 0}]}], 86, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.6, 0.24, 0.4428931686004542], 
            CircleBox[{0, 0}]}], 87, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.6, 0.24, 0.4428931686004542], 
            CircleBox[{0, 0}]}], 88, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.6, 0.24, 0.4428931686004542], 
            CircleBox[{0, 0}]}], 89, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.6, 0.24, 0.4428931686004542], 
            CircleBox[{0, 0}]}], 90, Automatic, 
          Scaled[{0.03, 0.03}]]}, {}}], {}}}, AspectRatio -> 
    NCache[GoldenRatio^(-1), 0.6180339887498948], Axes -> True, 
    AxesOrigin -> {6.9, 0}, Frame -> True, FrameLabel -> {{
       FormBox["\"sCO2\"", TraditionalForm], None}, {
       FormBox["\"pH\"", TraditionalForm], None}}, LabelStyle -> Directive[
      GrayLevel[0], FontFamily -> "Times New Roman", 18], Method -> {}, 
    PlotRange -> {{6.9, 7.5}, {0., 0.2930770180914022}}, PlotRangeClipping -> 
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
                    Hue[0.67, 0.6, 0.6], 
                    Dashing[{0.01333375, 0.00666625}]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    Hue[0.67, 0.6, 0.6], 
                    Dashing[{0.01333375, 0.00666625}]], {}}}, AspectRatio -> 
                    Full, ImageSize -> {20, 10}, PlotRangePadding -> None, 
                    ImagePadding -> 1, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #, 
                    GraphicsBox[{{
                    Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    Hue[0.9060679774997897, 0.6, 0.6], 
                    Dashing[{0.01333375, 0.00666625}]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    Hue[0.9060679774997897, 0.6, 0.6], 
                    Dashing[{0.01333375, 0.00666625}]], {}}}, AspectRatio -> 
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
                  GridBoxSpacings -> {"Columns" -> {{0.8, 0.5}}}], "Grid"]}}, 
              GridBoxAlignment -> {"Columns" -> {{Left}}, "Rows" -> {{Top}}}, 
              AutoDelete -> False, 
              GridBoxDividers -> {"Columns" -> {{None}}, "Rows" -> {{None}}}, 
              GridBoxItemSize -> {"Columns" -> {{All}}, "Rows" -> {{All}}}, 
              GridBoxSpacings -> {"Columns" -> {{0}}, "Rows" -> {{1}}}], 
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
                   RowBox[{
                    RowBox[{"Hue", "[", 
                    RowBox[{"0.67`", ",", "0.6`", ",", "0.6`"}], "]"}], ",", 
                    RowBox[{"Dashing", "[", 
                    RowBox[{"{", 
                    RowBox[{"0.01333375`", ",", "0.00666625`"}], "}"}], 
                    "]"}]}], "]"}], ",", 
                 RowBox[{"Directive", "[", 
                   RowBox[{
                    RowBox[{"Hue", "[", 
                    RowBox[{"0.9060679774997897`", ",", "0.6`", ",", "0.6`"}],
                     "]"}], ",", 
                    RowBox[{"Dashing", "[", 
                    RowBox[{"{", 
                    RowBox[{"0.01333375`", ",", "0.00666625`"}], "}"}], 
                    "]"}]}], "]"}]}], "}"}], ",", 
             RowBox[{"{", 
               RowBox[{#, ",", #2}], "}"}], ",", 
             RowBox[{"LegendLayout", "\[Rule]", "\"Row\""}]}], "]"}]& )], 
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
                    InsetBox[
                    GraphicsBox[{
                    CircleBox[{0, 0}, 1]}, {DefaultBaseStyle -> {"Graphics", {
                    AbsolutePointSize[6]}, 
                    Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    RGBColor[0.24720000000000014`, 0.24, 0.6]]}, BaseStyle -> 
                    Inherited}], 
                    NCache[
                    Scaled[{
                    Rational[1, 2], 
                    Rational[1, 2]}], 
                    Scaled[{0.5, 0.5}]], Automatic, 
                    Scaled[1]]}}}, AspectRatio -> Full, ImageSize -> {10, 10},
                     PlotRangePadding -> None, ImagePadding -> 1, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #}}, 
                  GridBoxAlignment -> {
                   "Columns" -> {Center, Left}, "Rows" -> {{Baseline}}}, 
                  AutoDelete -> False, 
                  GridBoxDividers -> {
                   "Columns" -> {{False}}, "Rows" -> {{False}}}, 
                  GridBoxItemSize -> {
                   "Columns" -> {{All}}, "Rows" -> {{All}}}, 
                  GridBoxSpacings -> {"Columns" -> {{0.8, 0.5}}}], "Grid"]}, {
                TagBox[
                 GridBox[{{
                    GraphicsBox[{{}, {
                    Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    RGBColor[0.6, 0.24, 0.4428931686004542]], {
                    InsetBox[
                    GraphicsBox[{
                    CircleBox[{0, 0}, 1]}, {DefaultBaseStyle -> {"Graphics", {
                    AbsolutePointSize[6]}, 
                    Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    RGBColor[0.6, 0.24, 0.4428931686004542]]}, BaseStyle -> 
                    Inherited}], 
                    NCache[
                    Scaled[{
                    Rational[1, 2], 
                    Rational[1, 2]}], 
                    Scaled[{0.5, 0.5}]], Automatic, 
                    Scaled[1]]}}}, AspectRatio -> Full, ImageSize -> {10, 10},
                     PlotRangePadding -> None, ImagePadding -> 1, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #2}}, 
                  GridBoxAlignment -> {
                   "Columns" -> {Center, Left}, "Rows" -> {{Baseline}}}, 
                  AutoDelete -> False, 
                  GridBoxDividers -> {
                   "Columns" -> {{False}}, "Rows" -> {{False}}}, 
                  GridBoxItemSize -> {
                   "Columns" -> {{All}}, "Rows" -> {{All}}}, 
                  GridBoxSpacings -> {"Columns" -> {{0.8, 0.5}}}], "Grid"]}}, 
              GridBoxAlignment -> {"Columns" -> {{Left}}, "Rows" -> {{Top}}}, 
              AutoDelete -> False, 
              GridBoxDividers -> {"Columns" -> {{None}}, "Rows" -> {{None}}}, 
              GridBoxItemSize -> {"Columns" -> {{All}}, "Rows" -> {{All}}}, 
              GridBoxSpacings -> {"Columns" -> {{0}}, "Rows" -> {{1}}}], 
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
             RowBox[{"LegendLayout", "\[Rule]", "\"Row\""}], ",", 
             RowBox[{"LegendMarkers", "\[Rule]", 
               RowBox[{"{", 
                 RowBox[{"{", 
                   RowBox[{
                    GraphicsBox[{
                    CircleBox[{0, 0}, 1]}, BaseStyle -> Inherited], ",", 
                    "0.03`"}], "}"}], "}"}]}]}], "]"}]& )]}}, AutoDelete -> 
     False, GridBoxAlignment -> {"Columns" -> {{Left}}, "Rows" -> {{Bottom}}},
      GridBoxItemSize -> {
      "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
     GridBoxSpacings -> {"Columns" -> {{0}}}], "Grid"]},
  "Legended",
  DisplayFunction->(GridBox[{{
      TagBox[
       ItemBox[
        PaneBox[
         TagBox[#, "SkipImageSizeLevel"], Alignment -> {Center, Baseline}, 
         BaselinePosition -> Baseline], DefaultBaseStyle -> "Labeled"], 
       "SkipImageSizeLevel"]}, {
      ItemBox[#2, DefaultBaseStyle -> "LabeledLabel"]}}, 
    GridBoxAlignment -> {"Columns" -> {{Center}}, "Rows" -> {{Center}}}, 
    AutoDelete -> False, GridBoxItemSize -> Automatic, 
    BaselinePosition -> {1, 1}]& ),
  Editable->True,
  InterpretationFunction->(RowBox[{"Legended", "[", 
     RowBox[{#, ",", 
       RowBox[{"Placed", "[", 
         RowBox[{#2, ",", "Below"}], "]"}]}], "]"}]& )]], "Output", \
"PluginEmbeddedContent"]
}, Open  ]],

Cell[BoxData[
 RowBox[{"Manipulate", "[", 
  RowBox[{
   RowBox[{"Plot", "[", 
    RowBox[{
     RowBox[{"sCO2", "/.", " ", 
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
      RowBox[{"pCO2", ",", "0", ",", "16000"}], "}"}], ",", " ", 
     RowBox[{"AxesLabel", " ", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{"\"\<pCO2[Pa]\>\"", ",", "\"\<sCO2\>\""}], "}"}]}], ",", " ", 
     RowBox[{"PlotRange", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{"0", ",", ".5"}], "}"}]}]}], "]"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"pHp", ",", "7.4", ",", "\"\<Plasma pH\>\""}], "}"}], ",", "7", 
     ",", "7.8"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"pO2", ",", "0", ",", " ", "\"\<pO2[Pa]\>\""}], "}"}], ",", "0",
      ",", "16000"}], "}"}]}], "]"}]], "Input", "PluginEmbeddedContent"]
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
      RowBox[{"dH", "/.", 
       RowBox[{"{", 
        RowBox[{"CO2", "\[Rule]", 
         RowBox[{"aCO2", "*", "0"}]}], "}"}]}], "  ", "}"}], ",", " ", 
     RowBox[{"{", 
      RowBox[{"pH", ",", "6.5", ",", "8"}], "}"}], ",", "\[IndentingNewLine]", 
     RowBox[{"PlotRange", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"-", "0.1"}], ",", "0.65"}], "}"}]}], ",", 
     "\[IndentingNewLine]", 
     RowBox[{"Frame", "\[Rule]", "True"}], ",", "\[IndentingNewLine]", 
     RowBox[{"FrameLabel", " ", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{"\"\<pH\>\"", ",", "\"\<\[CapitalDelta]H+\>\""}], "}"}]}], ",",
      " ", "\[IndentingNewLine]", 
     RowBox[{"LabelStyle", "\[Rule]", 
      RowBox[{"Directive", "[", 
       RowBox[{"Black", ",", 
        RowBox[{"FontFamily", "\[Rule]", "\"\<Times New Roman\>\""}], ",", 
        "18"}], "]"}]}], ",", 
     RowBox[{"PlotLegends", "\[Rule]", 
      RowBox[{"Placed", "[", 
       RowBox[{
        RowBox[{"{", 
         RowBox[{
         "\"\<at pCO2=0Pa\>\"", ",", "\"\<at pCO2=1.47kPa\>\"", ",", 
          "\"\<at pCO2=4.53kPa\>\"", ",", "\"\<at pCO2=10.67kPa\>\"", ",", 
          "\"\<at pCO2=26.66kPa\>\""}], "}"}], ",", "Below"}], "]"}]}]}], 
    "]"}], ",", "\[IndentingNewLine]", 
   RowBox[{"Plot", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{",", 
       RowBox[{"dH", "/.", 
        RowBox[{"{", 
         RowBox[{"CO2", "\[Rule]", 
          RowBox[{"aCO2", "*", "1470"}]}], "}"}]}]}], "  ", "}"}], ",", " ", 
     RowBox[{"{", 
      RowBox[{"pH", ",", "6.5", ",", "8"}], "}"}], ",", 
     RowBox[{"PlotStyle", "\[Rule]", 
      RowBox[{"Dashing", "[", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"0.02", "*", 
          RowBox[{"(", 
           RowBox[{"1", "-", 
            RowBox[{"1470", "/", "16000"}]}], ")"}]}], ",", 
         RowBox[{"0.02", "*", 
          RowBox[{"(", 
           RowBox[{"1470", "/", "16000"}], ")"}]}]}], "}"}], "]"}]}]}], "]"}],
    ",", "\[IndentingNewLine]", 
   RowBox[{"Plot", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{",", ",", 
       RowBox[{"dH", "/.", 
        RowBox[{"{", 
         RowBox[{"CO2", "\[Rule]", 
          RowBox[{"aCO2", "*", "4530"}]}], "}"}]}]}], "  ", "}"}], ",", " ", 
     RowBox[{"{", 
      RowBox[{"pH", ",", "6.5", ",", "8"}], "}"}], ",", 
     RowBox[{"PlotStyle", "\[Rule]", 
      RowBox[{"Dashing", "[", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"0.02", "*", 
          RowBox[{"(", 
           RowBox[{"1", "-", 
            RowBox[{"4530", "/", "16000"}]}], ")"}]}], ",", 
         RowBox[{"0.02", "*", 
          RowBox[{"(", 
           RowBox[{"4530", "/", "16000"}], ")"}]}]}], "}"}], "]"}]}]}], "]"}],
    ",", "\[IndentingNewLine]", 
   RowBox[{"Plot", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{",", ",", ",", 
       RowBox[{"dH", "/.", 
        RowBox[{"{", 
         RowBox[{"CO2", "\[Rule]", 
          RowBox[{"aCO2", "*", "10670"}]}], "}"}]}]}], "  ", "}"}], ",", " ", 
     RowBox[{"{", 
      RowBox[{"pH", ",", "6.5", ",", "8"}], "}"}], ",", 
     RowBox[{"PlotStyle", "\[Rule]", 
      RowBox[{"Dashing", "[", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"0.02", "*", 
          RowBox[{"(", 
           RowBox[{"1", "-", 
            RowBox[{"10670", "/", "16000"}]}], ")"}]}], ",", 
         RowBox[{"0.02", "*", 
          RowBox[{"(", 
           RowBox[{"10670", "/", "16000"}], ")"}]}]}], "}"}], "]"}]}]}], 
    "]"}], ",", "\[IndentingNewLine]", 
   RowBox[{"Plot", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{",", ",", ",", ",", 
       RowBox[{"dH", "/.", 
        RowBox[{"{", 
         RowBox[{"CO2", "\[Rule]", 
          RowBox[{"aCO2", "*", "26660"}]}], "}"}]}]}], " ", "}"}], ",", " ", 
     RowBox[{"{", 
      RowBox[{"pH", ",", "6.5", ",", "8"}], "}"}], ",", 
     RowBox[{"PlotStyle", "\[Rule]", 
      RowBox[{"Dashing", "[", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"0.02", "*", 
          RowBox[{"(", 
           RowBox[{"1", "-", 
            RowBox[{"26660", "/", "16000"}]}], ")"}]}], ",", 
         RowBox[{"0.02", "*", 
          RowBox[{"(", 
           RowBox[{"26660", "/", "16000"}], ")"}]}]}], "}"}], "]"}]}]}], 
    "]"}], ",", "\[IndentingNewLine]", "\[IndentingNewLine]", 
   RowBox[{"ListPlot", "[", 
    RowBox[{"Siggaard", ",", 
     RowBox[{"PlotMarkers", "\[Rule]", 
      RowBox[{"Table", "[", " ", 
       RowBox[{
        RowBox[{"{", 
         RowBox[{
          RowBox[{"Graphics", "[", 
           RowBox[{
            RowBox[{"{", 
             RowBox[{"Circle", "[", 
              RowBox[{
               RowBox[{"{", 
                RowBox[{"0", ",", "0"}], "}"}], ",", "1"}], "]"}], "}"}], ",", 
            RowBox[{"BaseStyle", "\[Rule]", " ", "Inherited"}]}], "]"}], ",", 
          ".03"}], "}"}], ",", 
        RowBox[{"{", 
         RowBox[{"c", " ", ",", " ", 
          RowBox[{"{", "1", "}"}]}], "}"}]}], "]"}]}], ",", 
     RowBox[{"PlotLegends", "\[Rule]", 
      RowBox[{"Placed", "[", 
       RowBox[{
        RowBox[{"{", "\"\<Data by Siggaard1971\>\"", "}"}], ",", "Below"}], 
       "]"}]}]}], "]"}]}], "]"}]}], "Input", "PluginEmbeddedContent"],

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
        "]]}}, {{}, {}, {}, {
       Hue[0.9060679774997897, 0.6, 0.6], 
       Dashing[{0.018162499999999998`, 0.0018375}], 
       LineBox[CompressedData["
1:eJwV1nk4VVsUAHAZKpmSMfZ1Rak0SVIke4nqFTIUSSGRqTKkkAYZyhCFSl7K
UERoFJHhoh6KMmUO90SUTNHTgOet/jrf7zv3nLvP2muvtRYd8jA/zMvDw8M/
i4fnz1VyQAQvcmC7c80ZqcEGmpisk+CHFuzx/itkpIEu23tE4xv67ZbyveNj
DVTnVZXTx1ly0CQwoNvwq4E6JAZXv+KTg2Fe+xVX5zTSp+a/roXPkYPGvIsH
Fik3UtPC3qUSYnLgUnFY1t26kUZFFhqrKMhBrJ6Qf+nrRircK9rQpCsH6fkf
7siUvKfTF6SarW3kYJ3nk1L9tCbaf/3kjW2n5cD5eYLWt/Bm2mJ9OqYwQQ7k
14pmGAW3UC03DaHZL+TAD87IbjzaSlNWXy1ua5cDobAq8UTnNsprb7hKclIO
8mkwR/BAO23qzCOLF8rD78t3n8TrdNCHYlUGxVryEJ5XI9Sm+oH+uhQ5uMJK
HlQPp+pzeTupjk+m2SwfebAwn/LfVNtJL0i5j9jFyUN2pnLK1J0uCjO9wtee
ycPXVQUqCTbddFbiLAezJnl4t8vurJAIlxZm+vqc/FceZIv27U+x59L+WSmC
HhIEcvxy0q5lcOlCUc+mb+sIZPQobBn/yqUnZBI1j2gQ6LdTetw+yKXvFGtu
9KLjSmIulA1xaci6ZdYt6wmskfhyOGqES4etuF1FGwgIRwxNsMa5tPyu6efQ
TQRE30ysUvrNpUe01k6y9Am8K9K8nDuHoRVb7A7cQO8uzQwNn8tQRaOo4vkG
BBQPaX88IMjQZtsvAXxbCZQ96imYJcRQCEnh/7KNgHILM6QvylDJWnHRZzsJ
CBrn62RKMrTYcUxxpzmB9BVbZacVGTrIz5f+Fj2yfKihZhFD5dIkVpntJiAb
/rA6QYmhfp80tKz2EHDwDPTZsJih6k6+Zk6WBKQ+Xsg8vJShGc5TgUHWBKxX
S1ncXsXQWLfZPS8OYXzE/f/z1WJo6TwZV10HAp2PennXaDN0JHPpSBnaPPnv
zZ/QRl//mqxyJGAj8HWPiQ5D5xy9JNHiRMCj35VfjjL0zLH5BuNuBJL1vqiF
GzDU2VMubYU3gWuZNxa83cXQXT6KFdloMaOcKGcThmqcUelfdYIAuPHQWaYM
5Q1TX652kkDr9x366mYMvZW084GGLwFy3qomYjdD6975524+TUCyzu+hlBVD
N67q+MckmEBe3vMlMQcZqrCO6atDO0c1/BS3Z6iAVv8c8xAC4mXzJmPQDQbj
O/ZcIPBP+filK4cYevSA0DurUAK2HpfbzjsyNOXSpmb7SwS2FsL4JheGzhtI
6PO+SoBdNHN7gQfGuzjZZhB9YyuROI5WjU5773iNgIaFV00d2lDzUbnFdQL/
lksKRXoyNDKoPHHDDQLLqFfOLy+Gisl/sZy8ScBimUrEkxOYH8NDb70TCORn
bFwtcJKhamVjBoPozv2VElZoU+cp9c5bBNIKsu5MomNzxMQ4iQQKjBvfaPli
vhhpVgbdIaB6v00h9hRDF7M36U6ixxYfq2hDrx+jud53CUzvrM5W9GeoZfyO
u46pBDJf6KzPRt/oPRCw7R4Bz4ydai9O4/edDd4wL5OAZuDg/Sdn8ftMwx4G
oTWe66gOobWVo5ZMolUdn/QtPcfQ/a/jJAaz0GoHJRLQt6QyR94+IPBfmO4G
vwCGsh/Wpcc8IXAn+myISCBD+WXz9SWfEgjwirsL6M+BSd1xaMmkg23H0Y8t
3GVu5WC8SjTD3qO3TAuF3sslINK7eigyiKEqzuNKy/Pw/ERIF+WjherbS7LQ
J6aEk3vQ71PvTzx+TmDU0PKeZjBDnYy2OxUWECipfHivHr0zbzWv7gsCs/0O
yk6g1yhKJ5aiJ5uDbi8MYejP8d6mfwoJBPUZMjboDzY1Xn8V4fnqv5R0Dl1a
mSNSjfbS9PBMRIcnBG2tKyZgtXz3jg60u4AbY15C4OLDIdOfaHMPs7NN6K6t
dm6SFzC++oq57RwC7hun6negsweKF38qIyAvG+N+Hx29J63UuRzXH793pgR9
siTywAD69fKDyY1o3dj910ZeEpixcV/wG600tUXt+CvMlxSxHqGLeB6dVGu+
o7s0VV8SdJ3WL77f/xAwduJ7sgn97C436UwFgRAt25Id6L9FqjbNoGNq3dot
0ed8H7UEVhLoOPGD3wF9iInz5q8iMD+8YbM7epvhObFQNAS8CfFDq+YezhJ8
TYDpfNAWiBZlG2+PRLfrGupEoMfDNHpE3xC4auKVHYNuHZMPiEHz1g8vj0cX
HeCTl6wmwLkR++w2OrliIC8OLRC5wugOOkStwXxhDYE398NG09AuNwuGE9CV
PKdSMtDG/CkRCm8JhD6rts1Eq7uHqaSgvadMlmWhpVs9ypXfEehRbpr+c/+3
3l7be+glEard99HdWbq/l9VifbrDrklHv5JSictCJ3wPfpWKzggQUV9dh/GX
X1qVjI788v3tY3RXZWtzAtpr9wfXdfUEmotcRq+jLYtfCuShxxvuSV5Bay/N
StnYQKBt4pB+KPov25irT9G/2mQWBvz5/XXfCysbcX21vrI+aMcaG9976M7+
/XpH0d58Bq6K7/H/4fZVe3SQtur+m2h1QSmxP/sV7TXfWLKJgFnArZw/+5nd
/UFtbjMBnSLquxr9QvqlUhB62y7RODa6yvi+5BT60mLzTjF0b+HJnyMtBG59
TOodwnwaG9s/4NqK51XSJrUDzaO65UMP2p09cakKzYoXLW1pI1DBp9yQhF5Z
+/2JWTuB0nQ3tQi09uyOu9Vol4J/c73RlifSQzkdBAyP6moaoB2zok5pfcD6
t++x2gr08Y/eR3LQLw3fmYmjL5uCSXongeJLvnP+nKdboSp6i7oIPE1/nlCC
ziwRXpeAHj4sYpmCrlzZJn2lmwC/vKOOI5pH8HiXD0Mge0tmdTeeb1GwqhtF
f24NiixCE1/dcrePBEwdtx+PR2t9mnfPtofAwTKebGP08bK7x7Z9IrBpwZr3
D7CenP8ZbleKfmVtnx+MvrzG00y7D/eXWJdaobNu66xf3Y/vuyqyiQfde6pp
SuoLAaHsCy0GWL/GHhcOX0F7PvzeJIHm+ZzCFRwgcH987g/mPMbT0v3VNPrd
eEzyabSl+pzIT4ME9lrpRqVi/awc2CifO4r7XfHfgxqsv5dDJTNWfiMwq/Uc
/xX0nsWjGqnobdqLQkzRXJv0XVfH8L7ozv/qzmA9q5MK8vqO84drQnsl1vdl
z8c+r/qJ+fZ8RDoK+8Pw7ncn09BJvPajeuhno/d5Wb+wHz0dHf3XD+cTVXsi
/JtA3c1Bp/3ofbdrTQYmMV9ye5QI9p+I4Oy8ezMEPhh6cU5gPzNVDNNX4GHB
7HlSU/Jo6WKHuuvoVNdem3Jvht6ZkBsImcWCH2WXooXRL1zDWQ58LNidlfEw
DvvjVxOnEPYcFtRlP8sJdMd5gyiax4uyoCH8uvhTZ4b2mXTxyYmxoOZvk7p1
6PPBt3IT0Or2S8KfOTE0d0B2YdJ8fD7z6uenh3EeKBDnpi1gwdZvUdZ3HXCe
seBzz5FmgWj7p6/mdthPr/SFv1NgwaT+dN1XC8znl6mbTNksSDJYfcUIXTFx
aKgevXm/qn72HqwfNt2mTYosqK3niXTBecRhZavMByUWdKyIv/0e5xeN16/T
vqiwYG2gZaq/IUNbeB+U8a9hAadZ+PA0zkc3+dxen0XrFXqE7UDb8i+tn0Dz
fUssvaaL3yeQwv2sxoK9x/g8lm1m6MTc6zM16ixYZWFWZoDzl7TY2c3XNVnw
ufrRUjMNzBd544IluixQnIy1ycf5To7MK0tEX8teN9ynwtAuUlklQ/F+wfto
SbSTgl6rILBgh9sroWM4H/osWv9jSI8FwVPSzQtwnry+lLU+bysL+tOLMtfK
YT9dN/R4mzHG50jYm0KcV49WR3a+Rhv67LDOn4f93GHlPONdLLBJvVWbg/Ot
RuwRh90mLPA8leiWjvPwtdEvUgfN/sTrpl0gH0MtHvT5n7JggfJBHXWeSS5t
VuEaZNuwYLHwof5lX7i0ZWFjq7g7C7YfXeauVM6lKjIuybFojX/F6ztLudRH
ctpZwoMFTmvM2fEcLsZj6Q9JT8wPrTtnBYu51JL/tJTscRbUv5SF7uf4/mEl
cwUfFizZG1tv+YBLm14er1Y9x4LCCN+Wkze4tPHYghL9yyww2Rrk6uXCpXrC
AsqG2SyIaRGskBbg0ly726UdNSwwKmSnes3vpgnTnzv1vmJ+PBGiHnO6qL/g
5XxRQQWIIX23Dfo+ULs3rdWOyxVgr6PdL5/IDprX1GwbvV0B4hIY/a6V7VQi
zl91q4sCvJDlm8mLaaUfk+tP1l5UgCcHCuJsfjTT+wuDzpWmKoD28xH9dbua
qM/2Vo72Pwow3DAw0OnaSHM5zPmIHgU4tPWWQnJsPf09GO3vwM+Gg5OV+br8
tXRj2N9r7y5mA7OGrlRqe0M/H7Nwyd/CBiMdt6UVTAVNnPu8xdKBDcUnjDo3
XCynFUPVFW8C2RAX3Fnm11FE+0HbOy2JDVZRjjJajc+o6I5dVoKlbKiLd7B3
351B0xOkird0scHvuuDHqOfRNFpk4dPXfyzN6VNQjab+ASTdtJsNj83r8ny0
rlAjB+UYWy4+LzyYvoo/io6qrj3s/5ENyVcfn8q5GUY3vjASedqH69+TzD0R
H0DftAbbLBphA4+NuPL3LkNOzs5Q8wz0eY801bsPLDm3iiK2rxlFn5kjOOFm
x3FPjlm7+Rs6wzMpwsuFs8AlSWDfOBu4z/5+tH3sBGf/jxcPon+wQfH0I2Gv
VcEcA9eSOzI/2WDqHeJ0Wj+Es7qj7EYimqvmK+667wKHh1MVmP2LDXB6hhkK
CeWkXmy2qJpkw/z+MKWb7Zc4UT/bdppMoQumCgpHIjk+bp20GW06d/ZTDv9l
zl+7epf3TrNBNl9BZYNMNGdtab/Ckf/YUDrPel9kSjRHTv2rxBja6vGywIYV
MRy+1OG5p2bwfSIZlwXzYjiDUmPTM+ifIr+Pr4VYzv/vsZjf
        "]]}}, {{}, {}, {}, {}, {
       Hue[0.1421359549995791, 0.6, 0.6], 
       Dashing[{0.014337500000000001`, 0.0056625}], 
       LineBox[CompressedData["
1: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
        "]]}}, {{}, {}, {}, {}, {}, {
       Hue[0.37820393249936934`, 0.6, 0.6], 
       Dashing[{0.0066625, 0.0133375}], 
       LineBox[CompressedData["
1:eJwV1nk8VOsbAHAklUpdW5ozDLLdCpFE0ftaQkSllCUqe6gUyZVfMhIVNyRL
i5AiUcgejmVmEArZzkkpSyhbWmjB77l/nc/3MzPveT7P9o6c8ylrNwE+Pr4t
/Hx8/z3FP62EBwPHbq1u65dvRympercDwZ+/FQ8PKbYjlUPeWl/A+RtDlo6q
tCM9ToN7Pz8DszPYxyfV2pFLSlgTZxEDbx82Tv+zrR0VWP+Mv7IEvL6+SGp/
O9r7fFBZbBUDywXmJNiEtaPoqOeWSjIMvC2gxPX1QDtaMSjS3rmDgZ+wS+bC
C1+juXCJLntHBlYjW7rSznag4ZtnE03OM7BQsmLEhHon6rY/H/v8NgPPMJW0
vnzrRLpeWsuFyhk49Nk2P4uHXShN7UYlRTOwmbujtbFjNxI4ZqEq/puBf5pa
6uov7kGdb4uZCmsJbDjIpsxv9qAnqxqMK3UJLGMn1b1BjkL35DwWtLcR+FSA
YaToOgrFbBYqzwNHbtJUnFWgkN8hY/WM7QTW2iIgW61CIZ171Wuv6RPYxrdq
qdEmCtWolU3YGhD446JtcuKIQh2W2UnfzAj813V51OdAoZ/XosY22BJYeEtT
yEwshdIXyRneBweaBVtG3aDQ7vNFiQw7Al/eXTDGukmhFK93hsvsCbwx9dhd
oyQKGe7alPzRgcCHr5WXBKdQ6KpQx860IwT+3n53T1E2hRihxD1JDwJrrIgT
1KulUN3s02/RYPvlt4Ye1VHIx9fYfLEngXcEl4VLcilUdeTE96/gWb5JvrF6
CjnvIC3avAgs6Lr4dUQLhR7/dp69dpLA69L2u7J7KKQXkL2PP4DAYokyaiHj
FCq7JNfMBh9LUTvcN0Eh7RtJJoLnCPwqJvGX/hSFNuVd3r4kkMB/Rv8X/mOa
QoqfnBVXBhG4criv6sAshUSciJ9SFwjcJPoXgytAo/c7o1I3XSbwwO4ZQ19J
GjkeWEQUgHHbqxV319CIdg66uTmCwGjPHvUGKRp1hHhe1Y6EeIosz68laNRY
Zuyvd5XAw51xjCwWjQpU50zN/oXz/R+1+qvQKFzi5OSRBAKfjV45xdOh0cYv
A2QP2EeUO5WjS6P2ZruYfYkETs539ondRiPZSzs1jJII/KRsrM1Gj0YV00w/
pVsQz8Pwnc2IRt9eNf0Yu0tgvhb9XadMaHT7sUG9WwqBA65y8vRMaWQYUZL4
DlweknVlqRmNYnbc12m9R2DR68rRt3fRaENuUNCzNAK7lBx78WQ3jZyv/j3/
zwMC6139knTFmkbL3O+9nAYPaTFe6e+nUZ6BxD3vhwSOzVM4MQWen+XDjpkE
vujJfrfXhka3PHpC8SPo3/I34fOHaNRmHLF4SS6BS7zXuKxwpFGg7FxnCPhu
R0brQ7DMnzMPZ8Hmxx/dQU408nnmZPrpCYFdl1Vb+hyh0VJ57SsteQReakku
KjhGI7wwuCK+kMCW0xv1Jtxo9Py0vsCaIoj3veZsoDuNtAdvziSDRc2Sq/g9
IL+NJv33igk87hTnsdKTRlI3skoelxI4YjhSYqUXjW4s5s9VKyNwON/Qqkiw
SKBdej645Vm5CL83jQQdhaNLygnct7xfchw8peTjXFdB4BN2cXq5J2jkncw5
ZFIJv1faaCJ1kkYfl0tbNoJvRByzCgX3TrVsfVVF4F8NBYcsT9GooVx95Ztq
Amez2LotvjQyUo0UcKoh8H37q+tUTtOo6t77mffgjBw7oVBw4aXY/o+1BK61
dn+28QyNUq2+lkxzCDw5MZ7g7UcjosYi9yyXwFdWDmoWgxM2Z6TPgisEumvm
wVFSNtHzPJh3dlvRFX8aLbmWyw6tJ7BfmOfaZjB7bnGgYAOBi82JEyvOQn36
i52FGwkctPT7h8vgrwdW2UaDRd/n8NeAT9Z7WK5+AfnD6SI/wa45UjqSTQRW
djw+7hxAoz6Z06rJ4IFTLZXxYPvYRnlmM4Gdym4EcsB7A4JWyrcQOCfnRLb0
ORo1jbQLPAAbq0nImoJNHDbMKr+E/CeY/O8kuKYlbDwb/I/l7pobYD3c26/6
isDnPvt+LgaXFGj15IEP6S386gZrKka3bG4l8IEdhpM/wCrCO0p12wjcaCUW
phZIo/vBCbkV4G57HTlTsMzkRDpqh/qI4TRHcPIx06RacN35AIEzYPGOe9E7
XxO4ukHZ+BL4usksuwHc4Z7qFg8WLtsbaNFB4MczG93TwZc3PDrxEiyyn7Hz
CZg/hd9lXyeBtSOK+EvBWgF7vraBT6imB5Ngd6u7YdZdBH6X8myY89/7lT6L
vQZfUzEwbAA3z+tk7O+GfWGRfq0RvNB1WasDzF+pVvff55pPOzgHeghs5bFj
hAt2i5C36QSHHf/7VzU46YjvkA0F+0LKbLYM3LS16mwXeHhu+kMeeH7VCqFD
NPQTzS5+ANYYsUvoBu97uPdsEti1OlPJ9g2B6egi6SvgxKTvxT3giB/CT8+B
X/gamdr1ErgnOFvFFTxnFttNgdH38StW4E1yfR72bwl8xEe9XRvs8nPjLA0O
Vm7kkwYntAVFOrwjcHOGhAQ/uPFRg1QvuO/2KZEBqN+fUMlHh/sIPDGnMVYL
Vrd31X0L3vKjJDcV7KxZ0Oj4nsB2nw5bB4Pr+y0/OX2AerLPGKqCf5XfDuoD
z6y9HSUA3nhjVPhoP8QfZ13SCf0YZxS+4dgAgZXS3j8+C3bKqPBxGSJwVEfm
wm3o79hg4bkB8MBZf72jYM4B22jXj1BfxecH5MHrF3/LdRuG/T2wSSIV5um7
24ZJj1ECLzmwjhMK86ey45+QEbCSnEKTFthesn7V8U8EXjGVnDUE81zNc97k
9ZnAEkPugxgcpXzrtM843J9LFa3ewn4gF4b5x8EHvnrNXABPd2+JOzEB+8FW
44wM2DayreDkJIEbnF5QB2G/KIwu/eb7hcAM3aVH/9tPz7PPBZz9TuBlqn7V
U8dh/+3lHB4HG9+SXRwI9v++2sjtB4EHu+47zMF+VMPZq2xmCKwzuV1PAJza
2Zul9ZPA7hc2VX2DfXuZz/DN1z8Ental7IJhHw88+LfGe47Ap88ZsAePwn62
eJM5AA6vogvNwT9v+vu/nof+9yC1/4J97rMhc+UzPiYm47emXj5Mo30HV+Az
gkxs6DuYJgr3xZPftkqfwGr6F7c4HIT5SnuwwnkxE8+HDDWlwf3C+byD2ifE
xL67ty+oHIB9H3r6jMZSJrap9vJj7aMRM6crY2o5E5/e7q2aY06jYf60ZafE
mJjPJb3dAO5PqR2t4l/+c9n6Nq3tNDILWmD5iTPxx5l1nopw32ZPO2qfk2Bi
sX5jx4WtsO8GGC4ha5gYi9vZJGyG+5YTX3GdYGJPhc9Ce9fTiC8y8lTeOiZW
VJrumpCA+eGUBGkqMHH34MiHG+LQn3zD4YVg48g//tpiNKoL3HmnVJGJ46Ki
NfxXQz6PCzRWKzMxr/P7jzZhGq2wCJZv28DEVWznXZILFFor4tv5ZTP45Xuq
aohC/mtStL21mJi/vefypkEKvZRtThwEu5qX8qX2U+jSZhX77i1M/GnvK7vA
PgpN2L5/V7GViTuy+xJFKArV3t87ErGdiccUP862NlHIW1fjt7QREzscvy/y
+CmFeIZHDieC/eVOFnfmUkh2d3TlamMm/jU7LTv/mEJdTqMhi3YycZ4Jv75Z
FoXwpTTBURMmnjJXuFKTSiHxV3+JFJozcc/mWE0z+H9Z6Tota27NxHKpBaP3
fSk0JrgoswX8Sz1U0O4k/F98IKa6bz8TCzYY+C/3oVDgkJau7QEm1mrx2Ofp
QSFN93P73A8ysfwj0V/8ThTK8vgTyrZnYj0HN26hOYXivIQGyp2hX4zmvCTl
KeThy3iwwQ/O/2XhXdnQg6wCZHk54F7HqrzX3B6kFaw0rOrPxLHi1w4O1/Yg
gUjNvzedZeKo8opaocoedOeeea7WOSZmix1nKOX3oNaXQUX655m4MON83sek
HqSj+oa7Jwzyt+/76En3HiT86fZHvxtQ7xcXY5J/diNGZarjGPiwy9MPxj+6
0fqYBx2u8UzM6qZGxqe7kYX201qbm0zsru24VnesG0Wxa1O2JjKxSeUbwcJ3
3WgVMXrw9y0m1h9Ik9Cr60biu7Xr2elMHHzhRuXNq92I9aQ1Mzafia/+iFEJ
EO1G25Qfp+m0M3HxBLdPebIT1X/SIYqmIL4nLyIMyzvQbqasdZKINDZexrhW
6/UadQvk1giqS+PHW+4Q6m/bUMfm8TwTS2lsOSEnw7JqRd1rX/f8dVIa/7jy
P7HAJS3o9QnRKqN/pfET5d3CQ3aNyGDF4nUWOdL4tfkLpnIbFxUduVv9plka
K1dNtZp+rkG350beGnyWxs0Lbr1aERUoaNm/pSLLZHCvC8/EyqsIHXnR0+T6
twxuZlt9j8h/jIo7u5xiTGWw7/m/x5sE7yCxhKD1Oz1lMF8SQ6a2fivZn9p2
9tVlGdz6M7Mq1CeZfLSWfaE6QwZXOxzyvbAliwww7SG3ceG8nQassDf5ZBH5
4eLVARl8UWCvfFBVMflrLCbIRZCFMc/becmF56ROZLLGfQUWFjR/YOaQSJIj
J2w8Sw1ZOD7qGv+0fw25/5to/zYjFk7da2d773wNWRXU6lAJPrDv5lYzdg0Z
H2Gxp9aYhU9mesZGXa8hUZqBdrMJC7vXq9b0PaohEzpUBd+bs3BPqsHVvLc1
pNF2odQl+1lYSsOpdsGglkxZWtJ90IWFZ0WdGYFztaTmYb/MVnAS2yUmV6CO
rH+qfs7clYUzEg/t7FtSR04dzJLc4cbCTCr25FbROtLoQbKNogcLR9a+eFWu
VEeOGAS//uoF8btZO4jsqSM1zxu8ijkD5zvvVxm/U0fyxpt4L0JZmGP7RjFP
lUOKZv5Pw5DNwvQydZEhDQ555Kj6nTJwTn50uKQ2h5xtjzudFcbC4nx7FE7t
4JDrS+2Yl8NZ2PO5hvaMFYf8lz182uAKC7fuDtnjcopDHlyzSLo0BvKppR2T
l8sh01sLI9RjWfiielxDYD6HnLziPv0QLDU+kalfxCEj/zTW34xjYQULnlNl
BYcs/xBzxi8ezsvg1MY3cUiZHJkGtSQW5qteLZ4xwiGH8Ta/B/dYuJnX6msu
yyWXxr4UUE6F+Azeak6v45IqH5zjssC2XHv5BGUu6RV6Lf9xGgtfWt4X3a7G
Jcdqeifz77NwByu9UFqfS04ZhvhUZYJ/m6rP23LJX8Yct+6n8P1qV+fJaC7J
uGn73TaPhfPO+Q/JxHLJ7UNjl2hwzFF2qXk8lwwOl8h4mw/xZwvtT7zFJRe4
7v0Dz6DeqxoCBTO5pKDpsiNTJSz8LVshVJ3kkiK7rGyXVbPwmMVyz9YxLmnr
/kGfDbYdMzvuOMkl74f5r/sNFnz4Zf/wFy6pU3VrYqyGhV0HDUa//OCSxzYP
X2qtg/5dkFLr5+ORhdIX8xPrWbh3dNtXdXEeaT+dL6z0Ct7XcWR5hA6PzFi1
cyoF3DE4vfLZNh45ubGnc00rC8sqmEj16vHISx7zqcvaoJ8WLzZTNOCRub3m
W8fbWfjonw61+F08kq9+wKWwC/ys/cugHY/MvC1RafgOvs92lLQL5JExK9cW
NIJTtxffdAzikUEhzMy9fZAfu4hIp2AeudtlXazTe4j3utBLm4s8cmq9hltQ
P/Sj6ZP5tZE8Uqd898qCjyzsKziq8iuBR8pt3CugOwzz1VoRxkvikcIp+2dI
8CX3cY/rt3hkb6j9h5YR6M/pgTbJFB4ZusuzaPQTxCOUZf0ng0e+6AlzlJtk
4dKpVXrrCnjkM/MI6yxws15fW+kzHnmn4qqp+hQLbypfs8SiiEeeTI3V0P/C
wqt7LWzcSnmkqOe9xXZfoR4z5zNPV/FIh5ny3JgZFj7Mv9HuUyOPND5elb5m
FvrZ8NE18yYeqfamJjEFPPKizC+zGfJFNoTm/ARby3sdegX5v9xl0/Ab5rns
m2RMB4+MnqXM9/xh4QrZSWZXJ48M8HqLusCBA8kDUt080sxq8O/BORbW0Ysp
jad4pEb1sIz3PAuv6Lrf2ELzSIbmZ7Fp8J+2mdRFvTxyUcbE0n8WYF6sp5D2
Wx45JjE9twAujPiS6faOR/4f+uY3cA==
        "]]}}, {{}, {}, {}, {}, {}, {}, {
       Hue[0.6142719099991583, 0.6, 0.6], 
       Dashing[{-0.013325, 0.033325}], 
       LineBox[CompressedData["
1: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
u8v4Ujhkjb/eIsl7BDI17xEeSuaQWv1XpzPA3zPSlj9P4pAqL3f0Zd8nEJ/d
r2VnEjikVErhg5IqAilQWs3NkRxyTPGoS/0jAt0ev7KN249D5phPPBhvgPNz
3wupXDMOyX2D+/CeNgLtq72c+nKmldwUaDHxDiwf1XFh1VQr6WZ+PdqqnUDB
BxV0T060kk0L2nl7Owik6ch4LvmjlUx39Buwfk8gjvvOc/pfWkkNuY/u9j0E
KnbJ6137ppU8lPfo6OEBAlkbmkai7Faypjgo8ORvAoV9tPUs1oXvee5cQV9x
GTThbO7P6/OOlF7q1/Zrowy61uV1eZ1XC/nYdXyVmZUMskuSmT14v5l092Pk
rw+QQYYWHed+aDaRQiOZgwEpMqiv3+gJK/4lybrTUnCpQga1jzcWu319Tuqs
LcnVbpVB0XeanEqn68kXI9rEvTEZVBUyKr5Z+Qm5S2aVVfpSWaSod7Mj9N0j
smNR2RNedVk0pikYLjtyn6Q3fmfv2C2LJFRU/YwvVpAd0pxOsWOyKCdCYjCX
r5Dk+CyvNUySRXUxDTfM0zJJfWE++Z2lsogr1qhYqyeavOd4va6rSRZF2Kgn
DoydwZnzwz3632RRy++i6cF/V3GIYFLVUkEmqrMbpTSMcnHYpi7RZHBjlLbg
WYdcHOmo5CkmxETaMmvdXgbm4vh7T6UlljBRsr6u9uqiXJzqPB0iLcJEiDNl
LCFyE1PVTnprxJjINmF35J93N/Go58anW6Vh/XedFbRFHnZ81fnadR0TVe1o
pqaIAnzh6ZqQHjC7XOXtgHoBfvjQT2m/MhPlBNbrvzAswBIli88ar4f/1322
wdm7AL86r71dWRX2G6Xj96u6AG/anc7+qQHPT17aGLOvEAu12FwN0Yb9ewoZ
RIcX4ftt7YeSjZlobKmDh0VZCa5y5dsgbsJEfgFm6sa4BFdPbORLBTtF34hS
f1eCH4ldKsk0/f/7OXa9myzBT3fvnLm9k4lW+V9mO2wrxW+e4UuPLWC90gDn
yrNS3H+vsGHEhom4VPINM5rL8KBRR5qPLcTjwGr1ot4yPMTh8x4Dsy8ukSz+
UYZHfrmITdnBev9d38KW3sFjqrKHuA/Cdc0s0ZO77+C5/EvTkk5w/0jB3dTG
O1g8NUT5Pw8msjR54/aaKsfbxwv2YvCnTalTYk/KsZd52+mtnkwU8Zf8uLO5
HNfxa7xV9YL9cyu8zBgux0eDBgJWHmWi9LvFGhZL2fi5reXjIV/Ij/j5XkV9
Ng4hFC0TgmB9+Ow29ZtsnB+0N5j3FBO1bLuSsKSQjVs4ETfDwEpHWvHnMjZe
e6Fr8ngwE83IvBsIrWZjei4540AorL+GrN1b2Fit92+fSjjkV5f2k5ln476c
dyffxkK8BRPMRKwq8DOXya3GcUy0+HP3VVGbCly4RnKhFtw4WY+WHqzAxwoP
xt6Jh+f1TjyaOVKB/5YPpSYmMJHo18SYhOAKLIHnH+xMYqJONW7uW9kVeEfP
uj8vrkI8VoYfuDdUgddl76olU2F/MXcPLh6twMLOvlEPwDlfVOasxypwa/9d
oYI0iNfD77KfZyqw4yhJxGbAfjcsVnggWIlP/bXWNboO++s7y++qXImLpKPC
6vIg3x+VDr11r8ROx+PcDfKZyGSrpsNL70os9fqCZQNYI9Bp32PfShx7Om11
421Y39W6OSWoErt8LH3+thDybRq/bDq2Esvkdyz9WAr7dXQ9kZtXiZM1VLPn
70I+/ui0pXRVYuNzG+LD74El1YRaeyvxwuct/tz3oX7zvROF+iqxT4qBId8D
eN6XsnNew5XYbMpmSLga4kc/zh+crMQ8j6LUZR7D/rh7W94JUzjQuBPrPIP3
keRVjdOmsI1P9wIF9rgSKP5Vh8LaKZ/0VJ9DPFyuWe7Qo/Cf3uEa1gsmiv/y
u2Ncn8JhgbMPeF9Cv7H47CV2Ujg2n8FuboL9SBqtCT1IYffXzJ/GbyBf26Vj
Ug5R2OTXarUnYPZy9qECJwoL6a0vpZrh+rRy4hNXCifR2wrTW6AeRa4srTtK
4VQehxwXmomGA12uD4VSOGid88cucOErv6qqMxS2tTjCtG6D+ivxPH42nMKM
TJ8s43aI3yfFJrFoCt/YEJau0gnxuL56/9Q5Ct92zk6e6oL8Zz6qHUulcFzc
rbe+3bA+uLPjdDqFPcoKln4Fp8+L3OW9RmHl2fILXT0Qr+GWWoHrFL6TXBdf
9xHqbf7fwa6bFL6HP0ckfIF8jkrff1hGYa/Tjf0i/RAPs7hjrHIKr9pabnIJ
rO2YahPOpnBC5WnR9AHYr9iKFxoUhQ/lS+bkD0E/H/zmbV9FYXGXBZ51wzBP
NGtn06sp3MgccC8FaysrvG19SOEN6ZXq1FeIh4HCQe3HFOY/vxvXfYP1CQyL
108oXGO8Sd5oFPaz55Fn/1MK+/EScS/A7NWdfTP1FP5wZti8+Ts4bPSv+HMK
l/tF93b9hPo2jJAWfwXx3F89PzUB14M3Rm55R2ER8RznkEnop+aP7wVaKfz0
beyzeTB7SW4tB6xiui+Rdwry4Vu75RBNYS7dnzLLZyCfkR1btndAfGbaIq6C
O8ey0Tew171H/VKzUG/NKqMpnRSm1RJKWX/g/dv7tTrfU7hITkFXdQ7yozr2
VaUb4tO7JIcNbrnFZfsALJE5zrNpHvo1zydcrwfqT6Lutc4C5Lc9l0+vl8Ib
391WrwWLGgt53QcPJyam6P+DfnkilrL+I4WtBA4cMOFioUL2tu2Cnygs0KCP
X4OVFs098wc/ilCSt+BmoU/L02TbwYp/fo9YL2IhP+srxpc/U7jrfrf5e7DJ
+2TWCDg5oL7yIA8LedRmter1QX+MJocc5oX1xsvbOsHuy3yC+8Ear24PMr/A
+2qanjrCx0JcxH5eZ7D+PoWgQXCVQINGNvhOIHegOz8LNY6kHHsPJjJ6TgyD
tUs86pb1Uzi+pjrAU4CF4h/2KxmAf/dcPT4C/iRRXOwHduE67u+9mIUQaW+S
CX672txvFOy3I5X3KVj3P2VfH0EWaqld+NwPLnLnP/YDbPJ04xeeAQqvTOg7
6isE8RijhVjg6NJa7zFwvHfkAS3wWPM1L/8lcP+Hjg5TsMOvQM9xsKVbYJQd
+JX4Xo8AYVj/4I/DEfAWLXX3SbDJDLePDzjPdonbSREWsn2nVOkPFgsdcp0C
d3ou0TgODrtefzhoKQuJuv339Rj4G852mQE3Dvp/cgfb9oU6By9jobG49VIO
4Ge8tk5/wNpOwinm4A1rNzmGirJQxL+yvbrgbFPRQ3Ng7WNFBxXBwkdHD54R
g+eppLGFwcFJjQcWwKs2LLP6CfEYZOfZhy9noeGRQsNm8F5OhB2XOORH+29c
Ebju90HbSLC2f5ZcJDhDZ8X+aAnI75bVjgpgfodf+3hXsFBdicbiccjf8fA3
e8+CUcdn0Rrwroaze+JWgseDdxqAqwedLRdLstCMUWwUF1hRcLvFOfAp8Qj5
GqgfLvOpXeelIH9XIsoUwD5+rTuFpeG6UGFmG9Tfh8t3zBLBOZEL85Hgux1u
JhcZ8LywgHUtUL8ezh2GKTIQ/6RZFwOo/7ZoykBCFuqPR1qnHfrD4PZF/atg
v9E3GW5gmW/GZBoT+qOWNX8a+qvlRJVO5ioWYvdbX4voorBe2pWtMnLw/s2S
8zMfKFxc7ad9HbxY/s6cDzhmQUkrezXE/5R3927oZ+34DM1bayCfARdcB9qh
HoNOxBIKEM++8endYDd3i64UcKfOymKqjcIpO/jOxijC+iL28UCYJz94/TuP
KEF/aX558x7mUV6kSbiSCgs5feX1k26i8DZ/eToHnN6b/Hnfawq3Oi0oSatC
/S5bfjkR5tk/8m6roBoLSdE/H0w1Uth+gaX4TR3ikddtXviMwqKh001lGyGe
ei1HEmopXODVKqe4CfanvuzeNZiv2+3LAm+ApUbHXQofUdh76+FVFzdDfFFk
Xw3M4+fTzQF+WyCeUmcL6u9T+PSJ24yN22C/VQXzNndg/vhYe1QZQD0lvXHM
zYR6mlzep2MI8Sw9rboDzpfakJYDj8HD29VUhuH8uRK30+KpEeTzofZzeTif
yFx9raYd0F/eBDs4Gc5DWpX3kxnES/6N/80YChtu488R2Avrk2Q3z3jB/HhS
L50Aluq2e2TsSWEpk8gU4X1Qbz7j+Io7xHPfXKyYNcTP3eO/tXDeXjs27kPY
QD8lnT2n5gD9ndu7Tf0A9KdJ8OQLczg/Fz/o2H8Y5suGLgktDeivgwEFLWCN
QgenA2oUflGuHmTmCvmv2FkdpgL37y9cuf0IxBfHXMNKsL/8DGsFd6iXc392
KstBPPRPcya8YP+9kr/zxOB5ofpvk49D/7Wan9/2qxI///76+atImC+CFo93
lVTiIaQTkJ8N+zEe0iHEKvFSU3NbwTr4f36BC2zrClyQueKxQS/Ec87nln0G
GyeLSFe+BHcKlp36exW+X8NlCiw/wvNOqRVmXmbjXYflLx36BO+/I5f4cJ6N
x5Q1j4T0wfWe4lCLMDbWfrhLpHIQ6klZylb2MBu/6ox2kPsJ/bEyfYmFChtT
ZnFWheDCgWpOjxIbZz1KMFYfg3rrD5Q7qsDGx3Iuaer9gusVI1ZxTDZe7pHN
ZzcB89AtS7NKlI0PTD8sS56GfMpKTAqOlGMjz9qbkjPwPhtWeUp/KcdqXU/S
boBbNJ+KKXWXYy7cGFk6C++3kClgCN/vebHt1o1/Yf8VAq98K8tx4sx7M4s5
qL8wzVXBJeU40KuHbAdbhrs/jswrxybm/ev65+F+novtyanlWLNuiOm9APdv
NbZJu1iOGRu+iY+DW4QylK7Hl2OevB+Lg/9Bvaz4sutmZDkeXTE+/w9cJx71
/HZIOf4f52oWxQ==
        "]]}}, {{}, 
      GraphicsComplexBox[CompressedData["
1:eJztlGtIVEEUxxcxCYkIkdi9e/fu7YkRFRERETKnIioiIg2JkAipEJGykiAT
ISJEJEQkwp5mhgQSEVuYiIVupmm57q6PdW3dLUIiyh5sZg9oZs7cs/TB733Y
gd17h3vmzPn/5n9mUcHxnCMpNpvNw3/ieVQOO5zNvLc9VtbEuuJZ+TWddljB
/+NZ7QyfDsC4biZm+TUOOPN++dq5Lf3MJocGk7/ufvHv9jOM0yDj/NMXt7YN
s5f9Ymjwubl714aqEMtOH7ldku1U+42zK/ViOOHQO9/i8ExE5dOhqURERtkJ
uUAHR2re/FUPYkysTh/RQW6vv1H5XLBFJoipfC7AdTEmP6cbsCQ8U1HUbuUz
YN/bO1e9ZpTFykQhBvDk16eaI2ydHG6qD+twgyyvYoxd+LC31ZhjQk6rwV9H
mYjKXG2SXtRvAtYZUPWYxGeH2PC5Cb/FtMDHJN58u5o3EH9c95j4y/SPuoh/
1WYhuI/4f+WrF+wfVPk0WJZ27tLW6qDipUGDtub10rQEf8xr6XNCYe3HcrY+
wT9PAplQenT4LsqKR9V56tDHq/n2J0r8kVeU+Be1l9bZUyPEn2/OCwoTf0/P
6Y6b2ojKZwCeg5/4Y3yfyudW/ugg/gcOb5rYc7GZ+IvZ5WONT2bjif5I8AwI
XBu9s/K85jXvnywcJD8PTOdyxwTJzxg3SjwrF4ZeTeeGyc8YN048xW6engjx
RC4T5Oe2nfNSVlZGiCfWNUY88fuwymco/1v9ZsCNKdFgvcTzX/+4Vb+Wk99E
NfwEiE+jOM5gq+LvANkupQm/cbjC4gx94IAfAofXR3xwnwQfPK9h4vOJu+tg
W4j4WPosPvwjVxgmPla8xcfijfW51HkFiA/6v5f4WPqt+w3n9ao+O6Duh6S3
ulh0aCfpRTwJvS26cNwA9Ze0W0aA9GI/BBVvJzwT9qkdIr2nZIMNkV7RncWT
AdL7U+Cu86nz0Om+Td7Pyfs5eT8n7+fk/fx/3s9/AaXFEZ8=
       "], {{
         RGBColor[0.24720000000000014`, 0.24, 0.6], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24720000000000014`, 0.24, 0.6], 
            CircleBox[{0, 0}]}], 91, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24720000000000014`, 0.24, 0.6], 
            CircleBox[{0, 0}]}], 92, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24720000000000014`, 0.24, 0.6], 
            CircleBox[{0, 0}]}], 93, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24720000000000014`, 0.24, 0.6], 
            CircleBox[{0, 0}]}], 94, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24720000000000014`, 0.24, 0.6], 
            CircleBox[{0, 0}]}], 95, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24720000000000014`, 0.24, 0.6], 
            CircleBox[{0, 0}]}], 96, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24720000000000014`, 0.24, 0.6], 
            CircleBox[{0, 0}]}], 97, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24720000000000014`, 0.24, 0.6], 
            CircleBox[{0, 0}]}], 98, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24720000000000014`, 0.24, 0.6], 
            CircleBox[{0, 0}]}], 99, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24720000000000014`, 0.24, 0.6], 
            CircleBox[{0, 0}]}], 100, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24720000000000014`, 0.24, 0.6], 
            CircleBox[{0, 0}]}], 101, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24720000000000014`, 0.24, 0.6], 
            CircleBox[{0, 0}]}], 102, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24720000000000014`, 0.24, 0.6], 
            CircleBox[{0, 0}]}], 103, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24720000000000014`, 0.24, 0.6], 
            CircleBox[{0, 0}]}], 104, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24720000000000014`, 0.24, 0.6], 
            CircleBox[{0, 0}]}], 105, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24720000000000014`, 0.24, 0.6], 
            CircleBox[{0, 0}]}], 106, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24720000000000014`, 0.24, 0.6], 
            CircleBox[{0, 0}]}], 107, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24720000000000014`, 0.24, 0.6], 
            CircleBox[{0, 0}]}], 108, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24720000000000014`, 0.24, 0.6], 
            CircleBox[{0, 0}]}], 109, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24720000000000014`, 0.24, 0.6], 
            CircleBox[{0, 0}]}], 110, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24720000000000014`, 0.24, 0.6], 
            CircleBox[{0, 0}]}], 111, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24720000000000014`, 0.24, 0.6], 
            CircleBox[{0, 0}]}], 112, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24720000000000014`, 0.24, 0.6], 
            CircleBox[{0, 0}]}], 113, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24720000000000014`, 0.24, 0.6], 
            CircleBox[{0, 0}]}], 114, Automatic, 
          Scaled[{0.03, 0.03}]]}, {
         RGBColor[0.6, 0.24, 0.4428931686004542], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.6, 0.24, 0.4428931686004542], 
            CircleBox[{0, 0}]}], 115, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.6, 0.24, 0.4428931686004542], 
            CircleBox[{0, 0}]}], 116, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.6, 0.24, 0.4428931686004542], 
            CircleBox[{0, 0}]}], 117, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.6, 0.24, 0.4428931686004542], 
            CircleBox[{0, 0}]}], 118, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.6, 0.24, 0.4428931686004542], 
            CircleBox[{0, 0}]}], 119, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.6, 0.24, 0.4428931686004542], 
            CircleBox[{0, 0}]}], 120, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.6, 0.24, 0.4428931686004542], 
            CircleBox[{0, 0}]}], 121, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.6, 0.24, 0.4428931686004542], 
            CircleBox[{0, 0}]}], 122, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.6, 0.24, 0.4428931686004542], 
            CircleBox[{0, 0}]}], 123, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.6, 0.24, 0.4428931686004542], 
            CircleBox[{0, 0}]}], 124, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.6, 0.24, 0.4428931686004542], 
            CircleBox[{0, 0}]}], 125, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.6, 0.24, 0.4428931686004542], 
            CircleBox[{0, 0}]}], 126, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.6, 0.24, 0.4428931686004542], 
            CircleBox[{0, 0}]}], 127, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.6, 0.24, 0.4428931686004542], 
            CircleBox[{0, 0}]}], 128, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.6, 0.24, 0.4428931686004542], 
            CircleBox[{0, 0}]}], 129, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.6, 0.24, 0.4428931686004542], 
            CircleBox[{0, 0}]}], 130, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.6, 0.24, 0.4428931686004542], 
            CircleBox[{0, 0}]}], 131, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.6, 0.24, 0.4428931686004542], 
            CircleBox[{0, 0}]}], 132, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.6, 0.24, 0.4428931686004542], 
            CircleBox[{0, 0}]}], 133, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.6, 0.24, 0.4428931686004542], 
            CircleBox[{0, 0}]}], 134, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.6, 0.24, 0.4428931686004542], 
            CircleBox[{0, 0}]}], 135, Automatic, 
          Scaled[{0.03, 0.03}]]}, {
         RGBColor[0.6, 0.5470136627990908, 0.24], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.6, 0.5470136627990908, 0.24], 
            CircleBox[{0, 0}]}], 136, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.6, 0.5470136627990908, 0.24], 
            CircleBox[{0, 0}]}], 137, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.6, 0.5470136627990908, 0.24], 
            CircleBox[{0, 0}]}], 138, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.6, 0.5470136627990908, 0.24], 
            CircleBox[{0, 0}]}], 139, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.6, 0.5470136627990908, 0.24], 
            CircleBox[{0, 0}]}], 140, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.6, 0.5470136627990908, 0.24], 
            CircleBox[{0, 0}]}], 141, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.6, 0.5470136627990908, 0.24], 
            CircleBox[{0, 0}]}], 142, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.6, 0.5470136627990908, 0.24], 
            CircleBox[{0, 0}]}], 143, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.6, 0.5470136627990908, 0.24], 
            CircleBox[{0, 0}]}], 144, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.6, 0.5470136627990908, 0.24], 
            CircleBox[{0, 0}]}], 145, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.6, 0.5470136627990908, 0.24], 
            CircleBox[{0, 0}]}], 146, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.6, 0.5470136627990908, 0.24], 
            CircleBox[{0, 0}]}], 147, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.6, 0.5470136627990908, 0.24], 
            CircleBox[{0, 0}]}], 148, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.6, 0.5470136627990908, 0.24], 
            CircleBox[{0, 0}]}], 149, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.6, 0.5470136627990908, 0.24], 
            CircleBox[{0, 0}]}], 150, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.6, 0.5470136627990908, 0.24], 
            CircleBox[{0, 0}]}], 151, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.6, 0.5470136627990908, 0.24], 
            CircleBox[{0, 0}]}], 152, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.6, 0.5470136627990908, 0.24], 
            CircleBox[{0, 0}]}], 153, Automatic, 
          Scaled[{0.03, 0.03}]]}, {
         RGBColor[0.24, 0.6, 0.33692049419863584`], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24, 0.6, 0.33692049419863584`], 
            CircleBox[{0, 0}]}], 154, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24, 0.6, 0.33692049419863584`], 
            CircleBox[{0, 0}]}], 155, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24, 0.6, 0.33692049419863584`], 
            CircleBox[{0, 0}]}], 156, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24, 0.6, 0.33692049419863584`], 
            CircleBox[{0, 0}]}], 157, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24, 0.6, 0.33692049419863584`], 
            CircleBox[{0, 0}]}], 158, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24, 0.6, 0.33692049419863584`], 
            CircleBox[{0, 0}]}], 159, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24, 0.6, 0.33692049419863584`], 
            CircleBox[{0, 0}]}], 160, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24, 0.6, 0.33692049419863584`], 
            CircleBox[{0, 0}]}], 161, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24, 0.6, 0.33692049419863584`], 
            CircleBox[{0, 0}]}], 162, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24, 0.6, 0.33692049419863584`], 
            CircleBox[{0, 0}]}], 163, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24, 0.6, 0.33692049419863584`], 
            CircleBox[{0, 0}]}], 164, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24, 0.6, 0.33692049419863584`], 
            CircleBox[{0, 0}]}], 165, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24, 0.6, 0.33692049419863584`], 
            CircleBox[{0, 0}]}], 166, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24, 0.6, 0.33692049419863584`], 
            CircleBox[{0, 0}]}], 167, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24, 0.6, 0.33692049419863584`], 
            CircleBox[{0, 0}]}], 168, Automatic, 
          Scaled[{0.03, 0.03}]]}, {
         RGBColor[0.24, 0.3531726744018182, 0.6], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24, 0.3531726744018182, 0.6], 
            CircleBox[{0, 0}]}], 169, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24, 0.3531726744018182, 0.6], 
            CircleBox[{0, 0}]}], 170, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24, 0.3531726744018182, 0.6], 
            CircleBox[{0, 0}]}], 171, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24, 0.3531726744018182, 0.6], 
            CircleBox[{0, 0}]}], 172, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24, 0.3531726744018182, 0.6], 
            CircleBox[{0, 0}]}], 173, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24, 0.3531726744018182, 0.6], 
            CircleBox[{0, 0}]}], 174, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24, 0.3531726744018182, 0.6], 
            CircleBox[{0, 0}]}], 175, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24, 0.3531726744018182, 0.6], 
            CircleBox[{0, 0}]}], 176, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24, 0.3531726744018182, 0.6], 
            CircleBox[{0, 0}]}], 177, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24, 0.3531726744018182, 0.6], 
            CircleBox[{0, 0}]}], 178, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24, 0.3531726744018182, 0.6], 
            CircleBox[{0, 0}]}], 179, Automatic, 
          Scaled[{0.03, 0.03}]], 
         InsetBox[
          GraphicsBox[{
            RGBColor[0.24, 0.3531726744018182, 0.6], 
            CircleBox[{0, 0}]}], 180, Automatic, 
          Scaled[{0.03, 0.03}]]}, {}}], {}}}, AspectRatio -> 
    NCache[GoldenRatio^(-1), 0.6180339887498948], Axes -> True, 
    AxesOrigin -> {6.6000000000000005`, 0}, Frame -> True, FrameLabel -> {{
       FormBox["\"\[CapitalDelta]H+\"", TraditionalForm], None}, {
       FormBox["\"pH\"", TraditionalForm], None}}, LabelStyle -> Directive[
      GrayLevel[0], FontFamily -> "Times New Roman", 18], Method -> {}, 
    PlotRange -> {{6.5, 8}, {-0.1, 0.65}}, PlotRangeClipping -> True, 
    PlotRangePadding -> {
      Scaled[0.02], Automatic}],TagBox[
    GridBox[{{
       TemplateBox[{
        "\"at pCO2=0Pa\"", "\"at pCO2=1.47kPa\"", "\"at pCO2=4.53kPa\"", 
         "\"at pCO2=10.67kPa\"", "\"at pCO2=26.66kPa\""}, "LineLegend", 
        DisplayFunction -> (StyleBox[
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
                  GridBoxSpacings -> {"Columns" -> {{0.8, 0.5}}}], "Grid"]}}, 
              GridBoxAlignment -> {"Columns" -> {{Left}}, "Rows" -> {{Top}}}, 
              AutoDelete -> False, 
              GridBoxDividers -> {"Columns" -> {{None}}, "Rows" -> {{None}}}, 
              GridBoxItemSize -> {"Columns" -> {{All}}, "Rows" -> {{All}}}, 
              GridBoxSpacings -> {"Columns" -> {{0}}, "Rows" -> {{1}}}], 
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
                    InsetBox[
                    GraphicsBox[{
                    CircleBox[{0, 0}, 1]}, {DefaultBaseStyle -> {"Graphics", {
                    AbsolutePointSize[6]}, 
                    Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    RGBColor[0.24720000000000014`, 0.24, 0.6]]}, BaseStyle -> 
                    Inherited}], 
                    NCache[
                    Scaled[{
                    Rational[1, 2], 
                    Rational[1, 2]}], 
                    Scaled[{0.5, 0.5}]], Automatic, 
                    Scaled[1]]}}}, AspectRatio -> Full, ImageSize -> {10, 10},
                     PlotRangePadding -> None, ImagePadding -> 1, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #}}, 
                  GridBoxAlignment -> {
                   "Columns" -> {Center, Left}, "Rows" -> {{Baseline}}}, 
                  AutoDelete -> False, 
                  GridBoxDividers -> {
                   "Columns" -> {{False}}, "Rows" -> {{False}}}, 
                  GridBoxItemSize -> {
                   "Columns" -> {{All}}, "Rows" -> {{All}}}, 
                  GridBoxSpacings -> {"Columns" -> {{0.8, 0.5}}}], "Grid"]}}, 
              GridBoxAlignment -> {"Columns" -> {{Left}}, "Rows" -> {{Top}}}, 
              AutoDelete -> False, 
              GridBoxDividers -> {"Columns" -> {{None}}, "Rows" -> {{None}}}, 
              GridBoxItemSize -> {"Columns" -> {{All}}, "Rows" -> {{All}}}, 
              GridBoxSpacings -> {"Columns" -> {{0}}, "Rows" -> {{1}}}], 
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
                    "]"}]}], "}"}], ",", 
             RowBox[{"{", #, "}"}], ",", 
             RowBox[{"LegendLayout", "\[Rule]", "\"Row\""}], ",", 
             RowBox[{"LegendMarkers", "\[Rule]", 
               RowBox[{"{", 
                 RowBox[{"{", 
                   RowBox[{
                    GraphicsBox[{
                    CircleBox[{0, 0}, 1]}, BaseStyle -> Inherited], ",", 
                    "0.03`"}], "}"}], "}"}]}]}], "]"}]& )]}}, AutoDelete -> 
     False, GridBoxAlignment -> {"Columns" -> {{Left}}, "Rows" -> {{Bottom}}},
      GridBoxItemSize -> {
      "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
     GridBoxSpacings -> {"Columns" -> {{0}}}], "Grid"]},
  "Legended",
  DisplayFunction->(GridBox[{{
      TagBox[
       ItemBox[
        PaneBox[
         TagBox[#, "SkipImageSizeLevel"], Alignment -> {Center, Baseline}, 
         BaselinePosition -> Baseline], DefaultBaseStyle -> "Labeled"], 
       "SkipImageSizeLevel"]}, {
      ItemBox[#2, DefaultBaseStyle -> "LabeledLabel"]}}, 
    GridBoxAlignment -> {"Columns" -> {{Center}}, "Rows" -> {{Center}}}, 
    AutoDelete -> False, GridBoxItemSize -> Automatic, 
    BaselinePosition -> {1, 1}]& ),
  Editable->True,
  InterpretationFunction->(RowBox[{"Legended", "[", 
     RowBox[{#, ",", 
       RowBox[{"Placed", "[", 
         RowBox[{#2, ",", "Below"}], "]"}]}], "]"}]& )]], "Output", \
"PluginEmbeddedContent"]
}, Open  ]],

Cell[BoxData[
 RowBox[{"ListPlot", "[", 
  RowBox[{"Siggaard", ",", 
   RowBox[{"PlotMarkers", "\[Rule]", 
    RowBox[{"{", "\[IndentingNewLine]", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{
        RowBox[{"Graphics", "[", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{"Disk", "[", 
            RowBox[{
             RowBox[{"{", 
              RowBox[{"0", ",", "0"}], "}"}], ",", "1"}], "]"}], "}"}], ",", 
          RowBox[{"BaseStyle", "\[Rule]", " ", "Inherited"}]}], "]"}], ",", 
        "0.03"}], "}"}], ",", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"Graphics", "[", 
         RowBox[{
          RowBox[{"{", " ", 
           RowBox[{"Rectangle", "[", "]"}], "}"}], ",", 
          RowBox[{"BaseStyle", "\[Rule]", " ", "Inherited"}]}], "]"}], ",", 
        "0.03"}], "}"}], ",", "\[IndentingNewLine]", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"Graphics", "[", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{"Polygon", "[", 
            RowBox[{"{", 
             RowBox[{
              RowBox[{"{", 
               RowBox[{"0", ",", "0"}], "}"}], ",", 
              RowBox[{"{", 
               RowBox[{
                RowBox[{"1", "/", "2"}], ",", "1"}], "}"}], ",", 
              RowBox[{"{", 
               RowBox[{"1", ",", "0"}], "}"}]}], "}"}], "]"}], "}"}], ",", 
          RowBox[{"BaseStyle", "\[Rule]", " ", "Inherited"}]}], "]"}], ",", 
        "0.03"}], "}"}], ",", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"Graphics", "[", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{"Rectangle", "[", "]"}], "}"}], ",", 
          RowBox[{"BaseStyle", "\[Rule]", " ", "Inherited"}]}], "]"}], ",", 
        "0.03"}], "}"}], ",", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"Graphics", "[", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{"Circle", "[", 
            RowBox[{
             RowBox[{"{", 
              RowBox[{"0", ",", "0"}], "}"}], ",", "1"}], "]"}], "}"}], ",", 
          RowBox[{"BaseStyle", "\[Rule]", " ", "Inherited"}]}], "]"}], ",", 
        "0.03"}], "}"}]}], "}"}]}], ",", 
   RowBox[{"PlotLegends", "\[Rule]", 
    RowBox[{"Placed", "[", 
     RowBox[{
      RowBox[{"{", "\"\<Data by Siggaard1971\>\"", "}"}], ",", "Below"}], 
     "]"}]}]}], "]"}]], "Input", "PluginEmbeddedContent"],

Cell[BoxData[
 RowBox[{"Manipulate", "[", 
  RowBox[{
   RowBox[{"Plot", "[", 
    RowBox[{
     RowBox[{"dTH", "/.", " ", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"O2", "\[Rule]", 
         RowBox[{"pO2", "*", "aO2"}]}], ",", " ", 
        RowBox[{"CO2", "\[Rule]", 
         RowBox[{"aCO2", "*", "pCO2"}]}]}], "}"}]}], ",", " ", 
     RowBox[{"{", 
      RowBox[{"pH", ",", "6.5", ",", "8"}], "}"}], ",", " ", 
     RowBox[{"AxesLabel", " ", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{
       "\"\<pH\>\"", ",", 
        "\"\<dTH - total titration shift with Bohr protons and \
carbamination\>\""}], "}"}]}], ",", " ", 
     RowBox[{"PlotRange", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"-", ".2"}], ",", "1"}], "}"}]}]}], "]"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"pO2", ",", "13000", ",", "\"\<pO2 [Pa]\>\""}], "}"}], ",", "0",
      ",", "160000"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"pCO2", ",", "0", ",", " ", "\"\<pCO2[Pa]\>\""}], "}"}], ",", 
     "0", ",", "16000"}], "}"}]}], "]"}]], "Input", "PluginEmbeddedContent"]
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
             RowBox[{"1", ",", "i", ",", "1"}], "]"}], "]"}], "*", 
           RowBox[{"(", 
            RowBox[{"101325", "/", "760"}], ")"}], "*", "aO2"}]}], ",", " ", 
         RowBox[{"CO2", "->", 
          RowBox[{
           RowBox[{"Naeraa", "[", 
            RowBox[{"[", 
             RowBox[{"2", ",", "i", ",", "1"}], "]"}], "]"}], "*", 
           RowBox[{"(", 
            RowBox[{"101325", "/", "760"}], ")"}], "*", "aCO2"}]}]}], "}"}]}],
       ",", 
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
 RowBox[{
  RowBox[{"Table", "[", 
   RowBox[{
    RowBox[{
     RowBox[{"Naeraa", "[", 
      RowBox[{"[", 
       RowBox[{"2", ",", "i", ",", "1"}], "]"}], "]"}], "*", 
     RowBox[{"(", 
      RowBox[{"101.325", "/", "760"}], ")"}]}], ",", 
    RowBox[{"{", 
     RowBox[{"i", ",", "1", ",", "9"}], "}"}]}], "]"}], " "}]], "Input", \
"PluginEmbeddedContent"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "2.7064440789473685`", ",", "6.0928322368421055`", ",", 
   "8.425973684210527`", ",", "10.932434210526315`", ",", "0.`", ",", 
   "2.9064276315789477`", ",", "5.426220394736842`", ",", 
   "8.505967105263158`", ",", "11.985680921052632`"}], "}"}]], "Output", \
"PluginEmbeddedContent"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"plotstyles", "=", 
   RowBox[{"Table", "[", 
    RowBox[{
     RowBox[{"Dashing", "[", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"0.02", "*", 
         RowBox[{"(", 
          RowBox[{"1", "-", 
           RowBox[{
            RowBox[{"Naeraa", "[", 
             RowBox[{"[", 
              RowBox[{"2", ",", "i", ",", "1"}], "]"}], "]"}], "*", 
            RowBox[{
             RowBox[{"(", 
              RowBox[{"101325", "/", "760"}], ")"}], "/", "16000"}]}]}], 
          ")"}]}], ",", 
        RowBox[{"0.02", "*", 
         RowBox[{"Naeraa", "[", 
          RowBox[{"[", 
           RowBox[{"2", ",", "i", ",", "1"}], "]"}], "]"}], "*", 
         RowBox[{
          RowBox[{"(", 
           RowBox[{"101325", "/", "760"}], ")"}], "/", "16000"}]}]}], "}"}], 
      "]"}], ",", 
     RowBox[{"{", 
      RowBox[{"i", ",", "1", ",", "9"}], "}"}]}], "]"}]}], " ", 
  ";"}]], "Input", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Show", "[", 
  RowBox[{
   RowBox[{"Plot", "[", 
    RowBox[{"curves", ",", 
     RowBox[{"{", 
      RowBox[{"pHp", ",", "7", ",", "8"}], "}"}], ",", 
     RowBox[{"Frame", "\[Rule]", "True"}], ",", 
     RowBox[{"FrameLabel", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{"\"\<pHp\>\"", ",", "\"\<sO2\>\""}], "}"}]}], ",", " ", 
     RowBox[{"PlotStyle", "\[Rule]", "plotstyles"}], ",", 
     "\[IndentingNewLine]", 
     RowBox[{"LabelStyle", "\[Rule]", 
      RowBox[{"Directive", "[", 
       RowBox[{"Black", ",", 
        RowBox[{"FontFamily", "\[Rule]", "\"\<Times New Roman\>\""}], ",", 
        "18"}], "]"}]}], ",", " ", 
     RowBox[{"PlotRange", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{"0.6", ",", "1"}], "}"}]}]}], "]"}], ",", 
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
     RowBox[{"PlotMarkers", "\[Rule]", 
      RowBox[{"Table", "[", " ", 
       RowBox[{
        RowBox[{"{", 
         RowBox[{
          RowBox[{"Graphics", "[", 
           RowBox[{
            RowBox[{"{", 
             RowBox[{"Circle", "[", 
              RowBox[{
               RowBox[{"{", 
                RowBox[{"0", ",", "0"}], "}"}], ",", "1"}], "]"}], "}"}], ",", 
            RowBox[{"BaseStyle", "\[Rule]", " ", "Inherited"}]}], "]"}], ",", 
          ".03"}], "}"}], ",", 
        RowBox[{"{", 
         RowBox[{"c", " ", ",", " ", 
          RowBox[{"{", "1", "}"}]}], "}"}]}], "]"}]}]}], "]"}]}], 
  "]"}]], "Input", "PluginEmbeddedContent"],

Cell[BoxData[
 GraphicsBox[{{{}, {}, 
    {Hue[0.67, 0.6, 0.6], 
     Dashing[{0.016616944901315787`, 0.003383055098684211}], 
     LineBox[CompressedData["
1:eJwVz3k41HkcB/BBcmTSIVn7O7IlZUVhlw59PpmtHioZtbSrmKVSJKFNh9Go
qGaRo9Ixu2zK1SMWEaLD1ErlSaUDHWoMc/y2ItmdHPvtj/fzfl7/vd82IVF+
m/R5PN4qki/NlwXp8XgU6vkNeI5xVsCW6+IwX+Ks9vTqXS4KkCtk93OJxZUX
7VWuCoif03F6iR6FRwIczVrcFKBtCHA+qE9hm8WEumwPBdzr8g0da0jhDaej
9fZeCpDaCW6ZmVIo8RSO+ogUYFxhd/QrCwrDctPkqWkKKPcM7no7m8KSzvKg
lD4FDBvUpC1aTGHe1s+6Tau7QVCTZ+7kR2Ejs1/WUNQN7j1DoodhFEanJqbK
TZXQsmy30Zh4Cpt9AkucNyphMhuSoMyg8MJVs8JLjUpYo+lsCimgMNuAfiNn
e8BVtWdLZB2F7g7DHQY7e0AenPRsViuFi3J+Dtx4vwcGjCp+j+mmsODW3n8e
Mb1gcz76e///KJTJhG5F23ph6MofOerxNOYb3tx+raEX9oxyG/jTaaRuTN8+
1kQF5xsual+702h7ZChW46+C5midj48PjSNDK9uLclWQ6R8x1juERtOzW9P6
36jAuNI77VMcjXnPAg5azVLDNMHKiHkpNJ58yV9itFkNSu+rVvQ5Gvt65xh6
56uhcFn96XPVNArizq5JfKOGcTtfR1XdpdHuxGSpjZUGaOsYy31dNJoPrhhO
Wq2BBx9sJ7UM0DjDpri1XKKBhPrwrloTBvuO685kXNJAhx6TuI5lMIYRj8hf
aOB5XP+vh1wYLK169nC3kRaSN7st/MWLweTbmOLkrAVHL7PHT4MYbAnnM6U/
aSFug8HNzhgGB0NcJm6L10KUeosk8wiD7Skekq4cLRgXvc96ImNwdqUwRdeg
BVmgyb7KMgbDzK8cL+zQwqvkdGfBbQbF9UX6T/7VQuPb+SBqZ3BhZqjp6kkc
+NcIKcf3DMa/qAi2cuBAev03H+kYFqvzA/8+7MlBTZ3/WokVi3ob90/lB3CQ
7ZRub+fIYnH7CtO6CA4s2zQ/rvdkcUFqwR2ZmIMf+i8LPdexWPJyZsjBYxxE
Gk60uRnJosnTHU2FORy4eaUtfZDI4oUn5gJJCQdlhnsXHMtmUbzCNmlRHQfN
/YcPdV5ksXHVkEp1m4NXbTPPNV5jMWbUpGxtKwd5c13TA9vInmbum+QODozr
Qx8lqlgMDq2tNVZwcL5iwr0O4qak4pMOxFhcL/9OzeI7lZnIlzgue2qViviy
h2tdNrEy+u4poZZFVhCcZdvNQeNMlyCbdyyeuFN530PJQUK6vur6Rxa7PU4m
iHo5sD5c2mU9wOKcjO3jDxBfFq9v30nc6jclJY9YG151d9YnFseJnvsqiQOX
hl9KH2SxgZXyIlQcuOtaY0U6Fp+Xjuh2qDl4/D5hWy0xj+JvzSDe0fPtJovP
LGbstrz1F3HB4yT/JmJuZMbyPmLL0vnz5w5/+SOOjdFwUH5BOU9KPFtaJswk
XiXLslcQ5w/20+XEh45yX58aYdF2yhXJB+JpkjMWfcQap8VTJ2o5uLprOX/l
KIux3Kuzc4nXRX40zCeW8nLH+xL3h/45MkrcZ50YFUX8P5vNU48=
      "]]}, 
    {Hue[0.9060679774997897, 0.6, 0.6], 
     Dashing[{0.012383959703947367`, 0.007616040296052632}], 
     LineBox[CompressedData["
1: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
      "]]}, 
    {Hue[0.1421359549995791, 0.6, 0.6], 
     Dashing[{0.009467532894736841, 0.010532467105263158`}], 
     LineBox[CompressedData["
1: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

      "]]}, 
    {Hue[0.37820393249936934`, 0.6, 0.6], 
     Dashing[{0.006334457236842106, 0.013665542763157896`}], 
     LineBox[CompressedData["
1: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
ACf1ED87aklizj114zc4wu/a8nPw/wAWCSK3
      "]]}, 
    {Hue[0.6142719099991583, 0.6, 0.6], Dashing[{0.02, 0.}], 
     LineBox[CompressedData["
1:eJwVy3tUjAkcxvHpXjSR5rTkvdQ6W8k1NYT4/TRCIQbbZiuRE3OyY7qoVCa1
jUrIuK3sJnQROostspNK22Ql1m3LRq3MaqZmmnmnjPuq2Xf/eM73fP54PGIl
6+IsORzOanb/l1uyyYLDIfBO9gGrnb+oQdQs3b6Wdb5WNNRTo4bWvpI/zrKO
M995uvKaGvbM6D61xIJAfVD34ak31KBv+mZOriWB+0tta/oa1HBftXarrQ2B
dblvqje2qaHQS3DbcQyBw5OFXy7uVYN9rdf+STwC23zbMhhHDdQExaheTSVw
gX/uwhSJBkasFEWBiwl8HbeXd6ZdAwJF+bhZ6wj0k33MtpvSDwH9nzc/2c7+
FzpKK3P64cGy3XbWewi0ccrylHf1gwsdm6U5QqB3rlc+lz8A6wd72mKrCMxo
qA8wHRoAf226SHyTwO+XRolsegegNWZfl/djArdNmlKu9NfCW7va00lqApvM
4viq77XgUZE4N/wjgS9WNvH77mvh86+lZ3ROJL7/Vnb2g5sO0s2GaO4UEqUh
xUrJFh1UNFXrXwaQmD4pa6xntQ7aEz+FhYWR+Gp9Z4FySAdHw3fYhsaSOHDo
Yov/rEGwvxZa9C6NxLtLHr3gJwyCu2DVDt+DJAZKXIs3XBoETWjDRLKMxGTx
zpWFmkG4sKzxVNkNEm1FfkYVpYexu15K6u6R2GuhTLYQ6oF0S3LNVJGYaatP
apTp4dHwVxMevCVx+MDxnMoaPWQ1xqvqHSgU8IoOpv6th24LKieCpjCqyEla
4GCAZ2mmFJkfhT3H87h7Zxsgb9u8hVtCKLRzj8tIjjDAzBDHjr82UUitjjuT
KjVAWrRVS08ShfwTtVrXUgNIdKLsowUUdvpPvCu9ZQD7i0PHnpZQ2MwVOKl7
DFAS6ZB57SqFP5t8t3h8MEBvnnyO4HcKS+alBo64MKB8NR82P6eQUbzj757O
QLhCSMwcotBErn+SGMxAYfOBsEJrGlOmeppiIhlQ3AzfkD2RxtuVCdMrJAyc
nCX38ZpJI7HPt0IoY8C1c/DrqCAalebohyk/MLDUdF0YFEHjP8OKVOYCA2Ib
Z48WMY1VDe6pRgUD80KKgh/l0BigHrF81sbAVZuMBYdP0sjN7Fo+touBdlO+
rKeaRuu5vDUxagZ6Oz3LlLdo9Nnzk/zyMAPls/3lkZ005vmgctEoA/aNW//M
0dKYEF0aEeRghIra8fe7WceG6p2TWOOlxla+jkbTjKNN51innfyiTsv6tMo0
zBljBE3ivWKhnsZ268TfmlgrPf02eRhpnH48xjbA0QhZcktt8xsazQdD0GOc
Edzyr6jc3tIozhbuWMP6ujTq+S7W5z7ShVLW+vi6e97vaDzhQpU/Yx0ZHH9Z
/p7G8w9Hgo6MN0LAp8fJmz/RyOmARaPORugYyvqunnW9Lvj8tAlGSOifFsf7
l8YX6SusNrKu6tgX3sY6NGbtqVrWrlfmz589QqOwqo0vcjFCTaXGt5C13cA4
OMF6dckxnz7Woct2Brawlu03TC4epbHotNSF4BnBPftH3mvW2/h8wwrWDanL
uavMNGZ6O99MYR0hfmNznvX4Vp60jLVp67lRM+uCDQK/h6z/A9YjPJg=
      "]]}, 
    {Hue[0.8503398874989481, 0.6, 0.6], 
     Dashing[{0.016366965460526316`, 0.0036330345394736843`}], 
     LineBox[CompressedData["
1:eJwVz3s0lHkcBnDkurS0yVbeC7kNJY1S6PL9LpWTmEg7OauQjkjNzpou040j
6xKVZtOJNG0JudTJlMuuRB1s26ZEqa1oy9HqGO+8L4kOkv3tH895zue/57GP
kW+MNdDT0wsm+b+nqyP19fQodFeIfyg25iD+blJcCHGrJiFrvQkHLe/Ujy4R
F8rtrnwgPuLede47fQq7Y8ZK0YwDrnGz588GFFbYuj7qMufgYU/IdmMjCjdO
NZ//egYH2S7+f1h8ReFbefCKHbYcmFa5ZM2xpnBinuu81x4c3PSL6ul1pdD0
Wlje0ggOJqfV5axYReE198GeuFQO/OuKLD02UphoK2w4X8qB9/vP0U/iKLxT
nHMmt42DtrUHTAyPUCia/UlUNMTBTDYmue8XCvflPbVcYqODsIHu+zGlFKoU
4sVl3jpY0n8wXlZP4eteh/LUzTpoiUp/Ieog/2WqmlylDkZMqi4o/qVQ93gn
5XNGB/bFiUulYxSWO2pW0ZU6+Pz7rxe1X9OY5ugsjD/QwcEp3dbpDjSOFvlk
3evVQXHjVe6tN43znkhDIid18CBxXCKR0FhaqXTyncXDaeku48AYGtOhceY2
Nx5MqwNzRpU01l+PTxchD3b+QbvEJ2gMqHgjyMJ46Au8PZu+TKOqmhnzjOOh
bG3Ducu/0ShuPxuUcZAH871v5bWtNCocjMI1WTzQcxU2h3to1NzPNFhZwEP7
kNM3bSM0Nh4wTnxcxkNyQ0LPLTMGm/TW+0tqeejSZ46GswzSPpsC57Tw8FI5
vC9tMYMGFU4Xvdp5yNixbPm2dQyyRRb2x7t5WLjOovPvSAb73XJkve95UG6d
1tStYHAw+UtfxxAPcm18yuljDF7Xxs3XTpB/5YO5z9UM1o0c76g3FEAdYXa4
WsNggfzGy+cWArzJUHn632OwxOzsDMtZAjT3+kD0KwZ32h0+sZQSQFoXSi0c
ZFCnHAmQOwiQffe4JNuQRQ/nkpAqVwHq6qWbUmazWC1OqknwECDPQ+XmspDF
JsuyY65eAtg8G/h+ix+LQ57FHO0rwOrhmlC/cBbztQoTKxBAZjTDvknG4gtl
SWyqvwDL1uWsaT/K4qy/Ogw2BAigMTrkeyqPxT0nd++3Wi/Ag+HMtO6rLAYV
zfFeJSH7nzlfbr7Doig+PtMqVICiRUtUEc9YlLzbPdIWJoBpw/anR/tZ9EuY
HLWWClBcZfWwi7i8oDCFIcaKhhYvLYvisQ+GImJl3re1/cSrky5N+hL3Jbbm
h3Is+nqvrIwmbnZeHGkvsLjARWx9lThZZdB/9yOLN7SntMs3CzA3s7Jn7giL
USGxrauJa5K2vNpLfGiRfmkwMZdQ2yoaZbFy7ylJFHHEmoTrqk8smp+0jUol
9h7v2BM9zqLDhDrjT+LOweTdt4gHnnhZtxP/9H5+rPUEi0c2FapfEJd2pkvv
EztKhy/0E9tU+vgsmmQxKTA/xjxcgJslfeJs4tqdXfdmEgerc93eEdu7f3Ki
iNOydLb5X1gczavvXEBsl1Jg/YF4661YRy/i2/sDpgdNsfh6/8CPK4nDZR+N
rhAvzw6uXkM8vL3wyxTxP5oTH4OJ/wOU8Ttb
      "]]}, 
    {Hue[0.08640786499873876, 0.6, 0.6], 
     Dashing[{0.013217224506578949`, 0.006782775493421054}], 
     LineBox[CompressedData["
1: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
      "]]}, 
    {Hue[0.3224758424985268, 0.6, 0.6], 
     Dashing[{0.009367541118421053, 0.010632458881578948`}], 
     LineBox[CompressedData["
1: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
s3rK/gNmamYMXQT/DwGDFRQ=
      "]]}, 
    {Hue[0.5585438199983166, 0.6, 0.6], 
     Dashing[{0.00501789884868421, 0.014982101151315791`}], 
     LineBox[CompressedData["
1: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
H+yyZ4hBA0975iz+Ac8IuHwRB/8Pfj/86Q==
      "]]}}, {{}, GraphicsComplexBox[CompressedData["
1:eJztU+tLFFEUX6QiJEJCeti9MxVSSYVELGEi5wRJhj0oIUJKZMmQsHdsZVJE
iERJiR+0F6IWPVgqQiREJEJre4lEIRKLiLnrNjt3kOhN0ZxzR/cv6NseWGbv
3DPn/B7nLA4c2lGR5vP5qtwfPTdcrIr9zpH4MtjTkpUbh9OZDzaOVEvcx/EZ
RqrphcSPP8/s7z5uwan40tUzVxoYEqV784ctAH9Z16ZLBm4NZOzK60jAtatu
LDBxYW4ke8Y5G866XzU2C6TqkewozDn/9FVrn8DHN507z4tjkNcRDvaYEn9R
+cZx0H0l9i16dLSyIQ6M714ST/7wtvomJXENhwWqxkWwzsBaa/sTo9aCgvTB
9sMFAhln6BOkraibO9QvcBb/icKHk3QhPfwxYNhFEt++oRgHXUfivKH+7yWj
cVjFQJP9mc98gVTVTYD7E++2BK4IfFG89sL68jFoPkgMBVLZcDAKr1sLO7/8
EUio0gdjoHFLvEXH9iTfY5UNdg3EPX0kflu++/KzrwkYG1jiSm94eGygLH+Z
ieV8oUDzEFP3uo5ErlOotF8hidpHBXwUBrquuZI4sIyOpYbnhwM51Pau4fnt
ANnTkmV6+jpAJAfaBCZYbht+lIzevt4r0DXJVUKByYmTeik4QcbvkVjfRMIo
YFidEv0MwNF6TzdQ93Gm/NT6OsDjmCmQ60QSMJsNEch5XTZo3gI1L6X9yJDI
9OoU3OilQZLIPoeVh18ij9XEJF7h+Z+AzWRjhcAjPEg28F48FHiACdrQRna+
T/ZjG/4KpKmYtlNBEQstUfukILVfqf1K7df/269/ZAQy/Q==
     "], {
      {RGBColor[0.24720000000000014`, 0.24, 0.6], InsetBox[
        GraphicsBox[
         {RGBColor[0.24720000000000014`, 0.24, 0.6], CircleBox[{0, 0}]}], 55, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.24720000000000014`, 0.24, 0.6], CircleBox[{0, 0}]}], 56, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.24720000000000014`, 0.24, 0.6], CircleBox[{0, 0}]}], 57, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.24720000000000014`, 0.24, 0.6], CircleBox[{0, 0}]}], 58, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.24720000000000014`, 0.24, 0.6], CircleBox[{0, 0}]}], 59, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.24720000000000014`, 0.24, 0.6], CircleBox[{0, 0}]}], 60, 
        Automatic, Scaled[{0.03, 0.03}]]}, 
      {RGBColor[0.6, 0.24, 0.4428931686004542], InsetBox[
        GraphicsBox[
         {RGBColor[0.6, 0.24, 0.4428931686004542], CircleBox[{0, 0}]}], 61, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.6, 0.24, 0.4428931686004542], CircleBox[{0, 0}]}], 62, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.6, 0.24, 0.4428931686004542], CircleBox[{0, 0}]}], 63, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.6, 0.24, 0.4428931686004542], CircleBox[{0, 0}]}], 64, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.6, 0.24, 0.4428931686004542], CircleBox[{0, 0}]}], 65, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.6, 0.24, 0.4428931686004542], CircleBox[{0, 0}]}], 66, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.6, 0.24, 0.4428931686004542], CircleBox[{0, 0}]}], 67, 
        Automatic, Scaled[{0.03, 0.03}]]}, 
      {RGBColor[0.6, 0.5470136627990908, 0.24], InsetBox[
        GraphicsBox[
         {RGBColor[0.6, 0.5470136627990908, 0.24], CircleBox[{0, 0}]}], 68, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.6, 0.5470136627990908, 0.24], CircleBox[{0, 0}]}], 69, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.6, 0.5470136627990908, 0.24], CircleBox[{0, 0}]}], 70, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.6, 0.5470136627990908, 0.24], CircleBox[{0, 0}]}], 71, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.6, 0.5470136627990908, 0.24], CircleBox[{0, 0}]}], 72, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.6, 0.5470136627990908, 0.24], CircleBox[{0, 0}]}], 73, 
        Automatic, Scaled[{0.03, 0.03}]]}, 
      {RGBColor[0.24, 0.6, 0.33692049419863584`], InsetBox[
        GraphicsBox[
         {RGBColor[0.24, 0.6, 0.33692049419863584`], CircleBox[{0, 0}]}], 74, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.24, 0.6, 0.33692049419863584`], CircleBox[{0, 0}]}], 75, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.24, 0.6, 0.33692049419863584`], CircleBox[{0, 0}]}], 76, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.24, 0.6, 0.33692049419863584`], CircleBox[{0, 0}]}], 77, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.24, 0.6, 0.33692049419863584`], CircleBox[{0, 0}]}], 78, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.24, 0.6, 0.33692049419863584`], CircleBox[{0, 0}]}], 79, 
        Automatic, Scaled[{0.03, 0.03}]]}, 
      {RGBColor[0.24, 0.3531726744018182, 0.6], InsetBox[
        GraphicsBox[
         {RGBColor[0.24, 0.3531726744018182, 0.6], CircleBox[{0, 0}]}], 80, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.24, 0.3531726744018182, 0.6], CircleBox[{0, 0}]}], 81, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.24, 0.3531726744018182, 0.6], CircleBox[{0, 0}]}], 82, 
        Automatic, Scaled[{0.03, 0.03}]]}, 
      {RGBColor[0.6, 0.24, 0.5632658430022722], InsetBox[
        GraphicsBox[
         {RGBColor[0.6, 0.24, 0.5632658430022722], CircleBox[{0, 0}]}], 83, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.6, 0.24, 0.5632658430022722], CircleBox[{0, 0}]}], 84, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.6, 0.24, 0.5632658430022722], CircleBox[{0, 0}]}], 85, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.6, 0.24, 0.5632658430022722], CircleBox[{0, 0}]}], 86, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.6, 0.24, 0.5632658430022722], CircleBox[{0, 0}]}], 87, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.6, 0.24, 0.5632658430022722], CircleBox[{0, 0}]}], 88, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.6, 0.24, 0.5632658430022722], CircleBox[{0, 0}]}], 89, 
        Automatic, Scaled[{0.03, 0.03}]]}, 
      {RGBColor[0.6, 0.42664098839727194`, 0.24], InsetBox[
        GraphicsBox[
         {RGBColor[0.6, 0.42664098839727194`, 0.24], CircleBox[{0, 0}]}], 90, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.6, 0.42664098839727194`, 0.24], CircleBox[{0, 0}]}], 91, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.6, 0.42664098839727194`, 0.24], CircleBox[{0, 0}]}], 92, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.6, 0.42664098839727194`, 0.24], CircleBox[{0, 0}]}], 93, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.6, 0.42664098839727194`, 0.24], CircleBox[{0, 0}]}], 94, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.6, 0.42664098839727194`, 0.24], CircleBox[{0, 0}]}], 95, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.6, 0.42664098839727194`, 0.24], CircleBox[{0, 0}]}], 96, 
        Automatic, Scaled[{0.03, 0.03}]]}, 
      {RGBColor[0.2634521802031821, 0.6, 0.24], InsetBox[
        GraphicsBox[
         {RGBColor[0.2634521802031821, 0.6, 0.24], CircleBox[{0, 0}]}], 97, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.2634521802031821, 0.6, 0.24], CircleBox[{0, 0}]}], 98, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.2634521802031821, 0.6, 0.24], CircleBox[{0, 0}]}], 99, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.2634521802031821, 0.6, 0.24], CircleBox[{0, 0}]}], 100, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.2634521802031821, 0.6, 0.24], CircleBox[{0, 0}]}], 101, 
        Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.2634521802031821, 0.6, 0.24], CircleBox[{0, 0}]}], 102, 
        Automatic, Scaled[{0.03, 0.03}]]}, 
      {RGBColor[0.24, 0.47354534880363613`, 0.6], InsetBox[
        GraphicsBox[
         {RGBColor[0.24, 0.47354534880363613`, 0.6], CircleBox[{0, 0}]}], 103,
         Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.24, 0.47354534880363613`, 0.6], CircleBox[{0, 0}]}], 104,
         Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.24, 0.47354534880363613`, 0.6], CircleBox[{0, 0}]}], 105,
         Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.24, 0.47354534880363613`, 0.6], CircleBox[{0, 0}]}], 106,
         Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.24, 0.47354534880363613`, 0.6], CircleBox[{0, 0}]}], 107,
         Automatic, Scaled[{0.03, 0.03}]], InsetBox[
        GraphicsBox[
         {RGBColor[0.24, 0.47354534880363613`, 0.6], CircleBox[{0, 0}]}], 108,
         Automatic, Scaled[{0.03, 0.03}]]}, {}}], {}}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->True,
  AxesOrigin->{7., 0.6},
  Frame->True,
  FrameLabel->{{
     FormBox["\"sO2\"", TraditionalForm], None}, {
     FormBox["\"pHp\"", TraditionalForm], None}},
  ImageSize->{741., Automatic},
  LabelStyle->Directive[
    GrayLevel[0], FontFamily -> "Times New Roman", 18],
  Method->{},
  PlotRange->{{7, 8}, {0.6, 1}},
  PlotRangeClipping->True,
  PlotRangePadding->{
    Scaled[0.02], Automatic}]], "Output", "PluginEmbeddedContent"]
}, Open  ]],

Cell[BoxData[
 RowBox[{"Manipulate", "[", 
  RowBox[{
   RowBox[{"Plot", "[", 
    RowBox[{
     RowBox[{"sO2", "/.", " ", 
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
      RowBox[{"pH", ",", "6.5", ",", "8"}], "}"}], ",", " ", 
     RowBox[{"AxesLabel", " ", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{"\"\<pH\>\"", ",", "\"\<sO2\>\""}], "}"}]}], ",", " ", 
     RowBox[{"PlotRange", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{"0", ",", "1"}], "}"}]}]}], "]"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"pO2", ",", "13000", ",", "\"\<pO2 [Pa]\>\""}], "}"}], ",", "0",
      ",", "16000"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"pCO2", ",", "0", ",", " ", "\"\<pCO2[Pa]\>\""}], "}"}], ",", 
     "0", ",", "16000"}], "}"}]}], "]"}]], "Input", "PluginEmbeddedContent"]
}, Open  ]],

Cell[CellGroupData[{

Cell["Results", "Subsection", "PluginEmbeddedContent"],

Cell[BoxData[
 RowBox[{
  RowBox[{"result", "=", 
   RowBox[{"GraphicsGrid", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"Show", "[", 
          RowBox[{
           RowBox[{"Plot", "[", 
            RowBox[{
             RowBox[{"{", 
              RowBox[{
               RowBox[{"sO2", "/.", 
                RowBox[{"{", 
                 RowBox[{
                  RowBox[{"O2", "\[Rule]", 
                   RowBox[{"pO2", "*", "1000", "*", "aO2"}]}], ",", 
                  RowBox[{"pH", "\[Rule]", "7.2464"}], ",", 
                  RowBox[{"CO2", "\[Rule]", 
                   RowBox[{"aCO2", "*", "0"}]}]}], "}"}]}], ",", 
               RowBox[{"sO2", "/.", 
                RowBox[{"{", 
                 RowBox[{
                  RowBox[{"O2", "\[Rule]", 
                   RowBox[{"pO2", "*", "1000", "*", "aO2"}]}], ",", 
                  RowBox[{"pH", "\[Rule]", "7.0"}], ",", 
                  RowBox[{"CO2", "\[Rule]", 
                   RowBox[{"aCO2", "*", "0"}]}]}], "}"}]}], ",", 
               RowBox[{"sO2", "/.", 
                RowBox[{"{", 
                 RowBox[{
                  RowBox[{"O2", "\[Rule]", 
                   RowBox[{"pO2", "*", "1000", "*", "aO2"}]}], ",", 
                  RowBox[{"pH", "\[Rule]", "7.5"}], ",", 
                  RowBox[{"CO2", "\[Rule]", 
                   RowBox[{"aCO2", "*", "0"}]}]}], "}"}]}]}], "}"}], ",", 
             RowBox[{"{", 
              RowBox[{"pO2", ",", "0", ",", "16"}], "}"}], ",", 
             RowBox[{"Frame", "\[Rule]", "True"}], ",", 
             RowBox[{"FrameLabel", "\[Rule]", 
              RowBox[{"{", 
               RowBox[{"\"\<pO2 [kPa]\>\"", ",", "\"\<sO2\>\""}], "}"}]}], 
             ",", 
             RowBox[{"LabelStyle", "\[Rule]", 
              RowBox[{"Directive", "[", 
               RowBox[{"Black", ",", 
                RowBox[{"FontFamily", "\[Rule]", "\"\<Times New Roman\>\""}], 
                ",", "36"}], "]"}]}], ",", 
             RowBox[{"PlotRange", "\[Rule]", "All"}]}], "]"}], ",", 
           RowBox[{"Plot", "[", 
            RowBox[{
             RowBox[{"{", 
              RowBox[{
               RowBox[{"sO2", "/.", 
                RowBox[{"{", 
                 RowBox[{
                  RowBox[{"O2", "\[Rule]", 
                   RowBox[{"pO2", "*", "1000", "*", "aO2"}]}], ",", 
                  RowBox[{"pH", "\[Rule]", "7.2464"}], ",", 
                  RowBox[{"CO2", "\[Rule]", 
                   RowBox[{"aCO2", "*", "5333"}]}]}], "}"}]}], ",", 
               RowBox[{"sO2", "/.", 
                RowBox[{"{", 
                 RowBox[{
                  RowBox[{"O2", "\[Rule]", 
                   RowBox[{"pO2", "*", "1000", "*", "aO2"}]}], ",", 
                  RowBox[{"pH", "\[Rule]", "7.0"}], ",", 
                  RowBox[{"CO2", "\[Rule]", 
                   RowBox[{"aCO2", "*", "5333"}]}]}], "}"}]}], ",", 
               RowBox[{"sO2", "/.", 
                RowBox[{"{", 
                 RowBox[{
                  RowBox[{"O2", "\[Rule]", 
                   RowBox[{"pO2", "*", "1000", "*", "aO2"}]}], ",", 
                  RowBox[{"pH", "\[Rule]", "7.5"}], ",", 
                  RowBox[{"CO2", "\[Rule]", 
                   RowBox[{"aCO2", "*", "5333"}]}]}], "}"}]}]}], "}"}], ",", 
             RowBox[{"{", 
              RowBox[{"pO2", ",", "0", ",", "16"}], "}"}], ",", 
             RowBox[{"PlotStyle", "\[Rule]", 
              RowBox[{"Dashing", "[", 
               RowBox[{"{", 
                RowBox[{
                 RowBox[{"0.02", "*", 
                  RowBox[{"(", 
                   RowBox[{"1", "-", 
                    RowBox[{"5333", "/", "26660"}]}], ")"}]}], ",", 
                 RowBox[{"0.02", "*", 
                  RowBox[{"(", 
                   RowBox[{"5333", "/", "26660"}], ")"}]}]}], "}"}], 
               "]"}]}]}], "]"}], ",", 
           RowBox[{"Plot", "[", 
            RowBox[{
             RowBox[{"{", 
              RowBox[{
               RowBox[{"sO2", "/.", 
                RowBox[{"{", 
                 RowBox[{
                  RowBox[{"O2", "\[Rule]", 
                   RowBox[{"pO2", "*", "1000", "*", "aO2"}]}], ",", 
                  RowBox[{"pH", "\[Rule]", "7.2464"}], ",", 
                  RowBox[{"CO2", "\[Rule]", 
                   RowBox[{"aCO2", "*", "16000"}]}]}], "}"}]}], ",", 
               RowBox[{"sO2", "/.", 
                RowBox[{"{", 
                 RowBox[{
                  RowBox[{"O2", "\[Rule]", 
                   RowBox[{"pO2", "*", "1000", "*", "aO2"}]}], ",", 
                  RowBox[{"pH", "\[Rule]", "7.0"}], ",", 
                  RowBox[{"CO2", "\[Rule]", 
                   RowBox[{"aCO2", "*", "16000"}]}]}], "}"}]}], ",", 
               RowBox[{"sO2", "/.", 
                RowBox[{"{", 
                 RowBox[{
                  RowBox[{"O2", "\[Rule]", 
                   RowBox[{"pO2", "*", "1000", "*", "aO2"}]}], ",", 
                  RowBox[{"pH", "\[Rule]", "7.5"}], ",", 
                  RowBox[{"CO2", "\[Rule]", 
                   RowBox[{"aCO2", "*", "16000"}]}]}], "}"}]}]}], "}"}], ",", 
             RowBox[{"{", 
              RowBox[{"pO2", ",", "0", ",", "16"}], "}"}], ",", 
             RowBox[{"PlotStyle", "\[Rule]", 
              RowBox[{"Dashing", "[", 
               RowBox[{"{", 
                RowBox[{
                 RowBox[{"0.02", "*", 
                  RowBox[{"(", 
                   RowBox[{"1", "-", 
                    RowBox[{"16000", "/", "26660"}]}], ")"}]}], ",", 
                 RowBox[{"0.02", "*", 
                  RowBox[{"(", 
                   RowBox[{"16000", "/", "26660"}], ")"}]}]}], "}"}], 
               "]"}]}]}], "]"}], ",", 
           RowBox[{"ListPlot", "[", 
            RowBox[{"Severinghaus", ",", 
             RowBox[{"PlotMarkers", "\[Rule]", 
              RowBox[{"Table", "[", 
               RowBox[{
                RowBox[{"{", 
                 RowBox[{
                  RowBox[{"Graphics", "[", 
                   RowBox[{
                    RowBox[{"{", 
                    RowBox[{"Circle", "[", 
                    RowBox[{
                    RowBox[{"{", 
                    RowBox[{"0", ",", "0"}], "}"}], ",", "1"}], "]"}], "}"}], 
                    ",", 
                    RowBox[{"BaseStyle", "\[Rule]", "Inherited"}]}], "]"}], 
                  ",", ".015"}], "}"}], ",", 
                RowBox[{"{", 
                 RowBox[{"c", ",", 
                  RowBox[{"{", "1", "}"}]}], "}"}]}], "]"}]}]}], "]"}]}], 
          "]"}], ",", 
         RowBox[{"Show", "[", 
          RowBox[{
           RowBox[{"Plot", "[", 
            RowBox[{
             RowBox[{"{", 
              RowBox[{
               RowBox[{"sCO2D", "/.", 
                RowBox[{"{", 
                 RowBox[{"CO2", "\[Rule]", 
                  RowBox[{"40", "*", 
                   RowBox[{"(", 
                    RowBox[{"101325", "/", "760"}], ")"}], "*", "aCO2"}]}], 
                 "}"}]}], ",", 
               RowBox[{"sCO2O", "/.", 
                RowBox[{"{", 
                 RowBox[{"CO2", "\[Rule]", 
                  RowBox[{"40", "*", 
                   RowBox[{"(", 
                    RowBox[{"101325", "/", "760"}], ")"}], "*", "aCO2"}]}], 
                 "}"}]}]}], "}"}], ",", 
             RowBox[{"{", 
              RowBox[{"pH", ",", "6.9", ",", "7.5"}], "}"}], ",", 
             RowBox[{"PlotStyle", "\[Rule]", 
              RowBox[{"Dashing", "[", 
               RowBox[{"{", 
                RowBox[{
                 RowBox[{"0.02", "*", 
                  RowBox[{"(", 
                   RowBox[{"1", "-", 
                    RowBox[{"5333", "/", "26660"}]}], ")"}]}], ",", 
                 RowBox[{"0.02", "*", 
                  RowBox[{"(", 
                   RowBox[{"5333", "/", "26660"}], ")"}]}]}], "}"}], "]"}]}], 
             ",", 
             RowBox[{"Frame", "\[Rule]", "True"}], ",", 
             RowBox[{"FrameLabel", "\[Rule]", 
              RowBox[{"{", 
               RowBox[{"\"\<pH\>\"", ",", "\"\<sCO2\>\""}], "}"}]}], ",", 
             RowBox[{"LabelStyle", "\[Rule]", 
              RowBox[{"Directive", "[", 
               RowBox[{"Black", ",", 
                RowBox[{"FontFamily", "\[Rule]", "\"\<Times New Roman\>\""}], 
                ",", "36"}], "]"}]}]}], "]"}], ",", 
           RowBox[{"ListPlot", "[", 
            RowBox[{"Bauer", ",", 
             RowBox[{"PlotMarkers", "\[Rule]", 
              RowBox[{"Table", "[", 
               RowBox[{
                RowBox[{"{", 
                 RowBox[{
                  RowBox[{"Graphics", "[", 
                   RowBox[{
                    RowBox[{"{", 
                    RowBox[{"Circle", "[", 
                    RowBox[{
                    RowBox[{"{", 
                    RowBox[{"0", ",", "0"}], "}"}], ",", "1"}], "]"}], "}"}], 
                    ",", 
                    RowBox[{"BaseStyle", "\[Rule]", "Inherited"}]}], "]"}], 
                  ",", ".03"}], "}"}], ",", 
                RowBox[{"{", 
                 RowBox[{"c", ",", 
                  RowBox[{"{", "1", "}"}]}], "}"}]}], "]"}]}]}], "]"}]}], 
          "]"}]}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"Show", "[", 
          RowBox[{
           RowBox[{"Plot", "[", 
            RowBox[{
             RowBox[{"{", 
              RowBox[{"dH", "/.", 
               RowBox[{"{", 
                RowBox[{"CO2", "\[Rule]", 
                 RowBox[{"aCO2", "*", "0"}]}], "}"}]}], "}"}], ",", 
             RowBox[{"{", 
              RowBox[{"pH", ",", "6.5", ",", "8"}], "}"}], ",", 
             RowBox[{"PlotRange", "\[Rule]", 
              RowBox[{"{", 
               RowBox[{
                RowBox[{"-", "0.1"}], ",", "0.65"}], "}"}]}], ",", 
             RowBox[{"Frame", "\[Rule]", "True"}], ",", 
             RowBox[{"FrameLabel", "\[Rule]", 
              RowBox[{"{", 
               RowBox[{"\"\<pH\>\"", ",", "\"\<\[CapitalDelta]H+\>\""}], 
               "}"}]}], ",", 
             RowBox[{"LabelStyle", "\[Rule]", 
              RowBox[{"Directive", "[", 
               RowBox[{"Black", ",", 
                RowBox[{"FontFamily", "\[Rule]", "\"\<Times New Roman\>\""}], 
                ",", "36"}], "]"}]}]}], "]"}], ",", 
           RowBox[{"Plot", "[", 
            RowBox[{
             RowBox[{"{", 
              RowBox[{",", 
               RowBox[{"dH", "/.", 
                RowBox[{"{", 
                 RowBox[{"CO2", "\[Rule]", 
                  RowBox[{"aCO2", "*", "1470"}]}], "}"}]}]}], "}"}], ",", 
             RowBox[{"{", 
              RowBox[{"pH", ",", "6.5", ",", "8"}], "}"}], ",", 
             RowBox[{"PlotStyle", "\[Rule]", 
              RowBox[{"Dashing", "[", 
               RowBox[{"{", 
                RowBox[{
                 RowBox[{"0.02", "*", 
                  RowBox[{"(", 
                   RowBox[{"1", "-", 
                    RowBox[{"1470", "/", "26660"}]}], ")"}]}], ",", 
                 RowBox[{"0.02", "*", 
                  RowBox[{"(", 
                   RowBox[{"1470", "/", "26660"}], ")"}]}]}], "}"}], 
               "]"}]}]}], "]"}], ",", 
           RowBox[{"Plot", "[", 
            RowBox[{
             RowBox[{"{", 
              RowBox[{",", " ", ",", 
               RowBox[{"dH", "/.", 
                RowBox[{"{", 
                 RowBox[{"CO2", "\[Rule]", 
                  RowBox[{"aCO2", "*", "4530"}]}], "}"}]}]}], "}"}], ",", 
             RowBox[{"{", 
              RowBox[{"pH", ",", "6.5", ",", "8"}], "}"}], ",", 
             RowBox[{"PlotStyle", "\[Rule]", 
              RowBox[{"Dashing", "[", 
               RowBox[{"{", 
                RowBox[{
                 RowBox[{"0.02", "*", 
                  RowBox[{"(", 
                   RowBox[{"1", "-", 
                    RowBox[{"4530", "/", "26660"}]}], ")"}]}], ",", 
                 RowBox[{"0.02", "*", 
                  RowBox[{"(", 
                   RowBox[{"4530", "/", "26660"}], ")"}]}]}], "}"}], 
               "]"}]}]}], "]"}], ",", 
           RowBox[{"Plot", "[", 
            RowBox[{
             RowBox[{"{", 
              RowBox[{",", " ", ",", " ", ",", 
               RowBox[{"dH", "/.", 
                RowBox[{"{", 
                 RowBox[{"CO2", "\[Rule]", 
                  RowBox[{"aCO2", "*", "10670"}]}], "}"}]}]}], "}"}], ",", 
             RowBox[{"{", 
              RowBox[{"pH", ",", "6.5", ",", "8"}], "}"}], ",", 
             RowBox[{"PlotStyle", "\[Rule]", 
              RowBox[{"Dashing", "[", 
               RowBox[{"{", 
                RowBox[{
                 RowBox[{"0.02", "*", 
                  RowBox[{"(", 
                   RowBox[{"1", "-", 
                    RowBox[{"10670", "/", "26660"}]}], ")"}]}], ",", 
                 RowBox[{"0.02", "*", 
                  RowBox[{"(", 
                   RowBox[{"10670", "/", "26660"}], ")"}]}]}], "}"}], 
               "]"}]}]}], "]"}], ",", 
           RowBox[{"Plot", "[", 
            RowBox[{
             RowBox[{"{", 
              RowBox[{",", " ", ",", " ", ",", " ", ",", 
               RowBox[{"dH", "/.", 
                RowBox[{"{", 
                 RowBox[{"CO2", "\[Rule]", 
                  RowBox[{"aCO2", "*", "26660"}]}], "}"}]}]}], "}"}], ",", 
             RowBox[{"{", 
              RowBox[{"pH", ",", "6.5", ",", "8"}], "}"}], ",", 
             RowBox[{"PlotStyle", "\[Rule]", 
              RowBox[{"Dashing", "[", 
               RowBox[{"{", 
                RowBox[{
                 RowBox[{"0.02", "*", 
                  RowBox[{"(", 
                   RowBox[{"1", "-", 
                    RowBox[{"26660", "/", "26660"}]}], ")"}]}], ",", 
                 RowBox[{"0.02", "*", 
                  RowBox[{"(", 
                   RowBox[{"26660", "/", "26660"}], ")"}]}]}], "}"}], 
               "]"}]}]}], "]"}], ",", 
           RowBox[{"ListPlot", "[", 
            RowBox[{"Siggaard", ",", 
             RowBox[{"PlotMarkers", "\[Rule]", 
              RowBox[{"Table", "[", 
               RowBox[{
                RowBox[{"{", 
                 RowBox[{
                  RowBox[{"Graphics", "[", 
                   RowBox[{
                    RowBox[{"{", 
                    RowBox[{"Circle", "[", 
                    RowBox[{
                    RowBox[{"{", 
                    RowBox[{"0", ",", "0"}], "}"}], ",", "1"}], "]"}], "}"}], 
                    ",", 
                    RowBox[{"BaseStyle", "\[Rule]", "Inherited"}]}], "]"}], 
                  ",", ".03"}], "}"}], ",", 
                RowBox[{"{", 
                 RowBox[{"c", ",", 
                  RowBox[{"{", "1", "}"}]}], "}"}]}], "]"}]}]}], "]"}]}], 
          "]"}], ",", 
         RowBox[{"Show", "[", 
          RowBox[{
           RowBox[{"Plot", "[", 
            RowBox[{"curves", ",", 
             RowBox[{"{", 
              RowBox[{"pHp", ",", "7", ",", "8"}], "}"}], ",", 
             RowBox[{"Frame", "\[Rule]", "True"}], ",", 
             RowBox[{"FrameLabel", "\[Rule]", 
              RowBox[{"{", 
               RowBox[{"\"\<pHp\>\"", ",", "\"\<sO2\>\""}], "}"}]}], ",", 
             RowBox[{"PlotStyle", "\[Rule]", "plotstyles"}], ",", 
             RowBox[{"LabelStyle", "\[Rule]", 
              RowBox[{"Directive", "[", 
               RowBox[{"Black", ",", 
                RowBox[{"FontFamily", "\[Rule]", "\"\<Times New Roman\>\""}], 
                ",", "36"}], "]"}]}], ",", 
             RowBox[{"PlotRange", "\[Rule]", 
              RowBox[{"{", 
               RowBox[{"0.6", ",", "1"}], "}"}]}]}], "]"}], ",", 
           RowBox[{"ListPlot", "[", 
            RowBox[{
             RowBox[{"Table", "[", 
              RowBox[{
               RowBox[{"d", "[", 
                RowBox[{"Naeraa", "[", 
                 RowBox[{"[", 
                  RowBox[{
                   RowBox[{"{", 
                    RowBox[{"3", ",", "4"}], "}"}], ",", "i"}], "]"}], "]"}], 
                "]"}], ",", 
               RowBox[{"{", 
                RowBox[{"i", ",", "1", ",", "9"}], "}"}]}], "]"}], ",", 
             RowBox[{"PlotMarkers", "\[Rule]", 
              RowBox[{"Table", "[", 
               RowBox[{
                RowBox[{"{", 
                 RowBox[{
                  RowBox[{"Graphics", "[", 
                   RowBox[{
                    RowBox[{"{", 
                    RowBox[{"Circle", "[", 
                    RowBox[{
                    RowBox[{"{", 
                    RowBox[{"0", ",", "0"}], "}"}], ",", "1"}], "]"}], "}"}], 
                    ",", 
                    RowBox[{"BaseStyle", "\[Rule]", "Inherited"}]}], "]"}], 
                  ",", ".03"}], "}"}], ",", 
                RowBox[{"{", 
                 RowBox[{"c", ",", 
                  RowBox[{"{", "1", "}"}]}], "}"}]}], "]"}]}]}], "]"}]}], 
          "]"}]}], "}"}]}], "}"}], ",", 
     RowBox[{"ImageSize", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{"2000", ",", "1300"}], "}"}]}]}], "]"}]}], ";"}]], "Input", \
"PluginEmbeddedContent"],

Cell[BoxData[
 RowBox[{
  RowBox[{"Export", "[", 
   RowBox[{"\"\<Results.eps\>\"", ",", "result"}], "]"}], ";", " ", 
  RowBox[{"(*", " ", 
   RowBox[{"save", " ", "to", " ", "user", " ", "Documents", " ", "folder"}], 
   " ", "*)"}], "\[IndentingNewLine]", "\n"}]], "Input", \
"PluginEmbeddedContent"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
},
WindowSize->{1867, 6281},
Visible->True,
AuthoredSize->{1867, 6281},
ScrollingOptions->{"HorizontalScrollRange"->Fit,
"VerticalScrollRange"->Fit},
ShowCellBracket->False,
Deployed->True,
CellContext->Notebook,
TrackCellChangeTimes->False,
Magnification->1.4000000953674316`,
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
Cell[1485, 35, 270, 5, 229, "Title"],
Cell[CellGroupData[{
Cell[1780, 44, 54, 0, 60, "Section"],
Cell[1837, 46, 1694, 52, 103, "Input"],
Cell[3534, 100, 1054, 28, 76, "Input"],
Cell[4591, 130, 1192, 34, 76, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[5820, 169, 49, 0, 60, "Section"],
Cell[5872, 171, 5198, 158, 292, "Input"],
Cell[11073, 331, 1573, 47, 76, "Input"],
Cell[12649, 380, 371, 11, 21, "Input"],
Cell[13023, 393, 439, 14, 21, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[13499, 412, 56, 0, 60, "Section"],
Cell[CellGroupData[{
Cell[13580, 416, 252, 4, 39, "Subsection"],
Cell[CellGroupData[{
Cell[13857, 424, 8936, 246, 677, "Input"],
Cell[22796, 672, 29142, 522, 346, "Output"]
}, Open  ]],
Cell[51953, 1197, 1247, 34, 49, "Input"],
Cell[53203, 1233, 1569, 41, 76, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[54809, 1279, 264, 5, 39, "Subsection"],
Cell[CellGroupData[{
Cell[55098, 1288, 6316, 178, 319, "Input"],
Cell[61417, 1468, 23272, 533, 402, "Output"]
}, Open  ]],
Cell[84704, 2004, 1226, 34, 49, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[85967, 2043, 352, 5, 80, "Subsection"],
Cell[CellGroupData[{
Cell[86344, 2052, 12337, 343, 643, "Input"],
Cell[98684, 2397, 57089, 1169, 367, "Output"]
}, Open  ]],
Cell[155788, 3569, 2334, 65, 103, "Input"],
Cell[158125, 3636, 1143, 33, 49, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[159305, 3674, 367, 6, 80, "Subsection"],
Cell[159675, 3682, 5972, 146, 265, "Input"],
Cell[165650, 3830, 421, 13, 21, "Input"],
Cell[166074, 3845, 1077, 32, 21, "Input"],
Cell[CellGroupData[{
Cell[167176, 3881, 375, 12, 21, "Input"],
Cell[167554, 3895, 328, 7, 20, "Output"]
}, Open  ]],
Cell[167897, 3905, 959, 29, 21, "Input"],
Cell[CellGroupData[{
Cell[168881, 3938, 1823, 51, 76, "Input"],
Cell[170707, 3991, 42562, 752, 682, "Output"]
}, Open  ]],
Cell[213284, 4746, 1218, 34, 49, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[214539, 4785, 54, 0, 39, "Subsection"],
Cell[214596, 4787, 17122, 411, 616, "Input"],
Cell[231721, 5200, 303, 7, 76, "Input"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature Ru0l3kjHHIpJUC1WupxiWlRt *)

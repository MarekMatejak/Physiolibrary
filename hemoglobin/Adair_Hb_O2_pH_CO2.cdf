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
NotebookDataLength[    161104,       3561]
NotebookOptionsPosition[    159903,       3500]
NotebookOutlinePosition[    160443,       3522]
CellTagsIndexPosition[    160400,       3519]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell[TextData[{
 "Adair-based human hemoglobin A equilibrium with oxygen, carbon dioxide and \
hydrogen ion activity in erythrolysate at 37\[Degree]C",
 "\n",
 StyleBox["(Marek Matej\[AAcute]k)", "Subtitle"]
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

Cell[BoxData[
 RowBox[{
  RowBox[{"a1", "=", "82.782"}], ";", 
  RowBox[{"a2", "=", "7065"}], ";", 
  RowBox[{"a3", "=", "81115"}], ";", 
  RowBox[{"a4", "=", 
   RowBox[{"2.101", "*", 
    RowBox[{"10", "^", "8"}]}]}], ";", 
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
 RowBox[{
  RowBox[{"Severinghaus", "=", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"133.", ",", "0.006"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"267.", ",", "0.0119"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"533.", ",", "0.0256"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"800.", ",", "0.0437"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"1.07", "*", 
        RowBox[{"10", "^", "3"}]}], ",", "0.0668"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"1.33", "*", 
        RowBox[{"10", "^", "3"}]}], ",", "0.0958"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"1.60", "*", 
        RowBox[{"10", "^", "3"}]}], ",", "0.1296"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"1.87", "*", 
        RowBox[{"10", "^", "3"}]}], ",", "0.1689"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"2.13", "*", 
        RowBox[{"10", "^", "3"}]}], ",", "0.214"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"2.40", "*", 
        RowBox[{"10", "^", "3"}]}], ",", "0.265"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"2.67", "*", 
        RowBox[{"10", "^", "3"}]}], ",", "0.3212"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"2.93", "*", 
        RowBox[{"10", "^", "3"}]}], ",", "0.376"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"3.20", "*", 
        RowBox[{"10", "^", "3"}]}], ",", "0.4314"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"3.47", "*", 
        RowBox[{"10", "^", "3"}]}], ",", "0.4827"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"3.73", "*", 
        RowBox[{"10", "^", "3"}]}], ",", "0.5316"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"4.00", "*", 
        RowBox[{"10", "^", "3"}]}], ",", "0.5754"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"4.27", "*", 
        RowBox[{"10", "^", "3"}]}], ",", "0.6169"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"4.53", "*", 
        RowBox[{"10", "^", "3"}]}], ",", "0.6516"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"4.80", "*", 
        RowBox[{"10", "^", "3"}]}], ",", "0.6863"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"5.07", "*", 
        RowBox[{"10", "^", "3"}]}], ",", "0.7194"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"5.33", "*", 
        RowBox[{"10", "^", "3"}]}], ",", "0.7469"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"5.60", "*", 
        RowBox[{"10", "^", "3"}]}], ",", "0.7729"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"5.87", "*", 
        RowBox[{"10", "^", "3"}]}], ",", "0.7955"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"6.13", "*", 
        RowBox[{"10", "^", "3"}]}], ",", "0.8171"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"6.40", "*", 
        RowBox[{"10", "^", "3"}]}], ",", "0.8352"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"6.67", "*", 
        RowBox[{"10", "^", "3"}]}], ",", "0.8508"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"6.93", "*", 
        RowBox[{"10", "^", "3"}]}], ",", "0.8659"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"7.20", "*", 
        RowBox[{"10", "^", "3"}]}], ",", "0.877"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"7.47", "*", 
        RowBox[{"10", "^", "3"}]}], ",", "0.8893"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"7.73", "*", 
        RowBox[{"10", "^", "3"}]}], ",", "0.8995"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"8.00", "*", 
        RowBox[{"10", "^", "3"}]}], ",", "0.9085"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"8.67", "*", 
        RowBox[{"10", "^", "3"}]}], ",", "0.9273"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"9.33", "*", 
        RowBox[{"10", "^", "3"}]}], ",", "0.9406"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"1.00", "*", 
        RowBox[{"10", "^", "4"}]}], ",", "0.951"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"1.07", "*", 
        RowBox[{"10", "^", "4"}]}], ",", "0.9584"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"1.13", "*", 
        RowBox[{"10", "^", "4"}]}], ",", "0.9642"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"1.20", "*", 
        RowBox[{"10", "^", "4"}]}], ",", "0.9688"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"1.27", "*", 
        RowBox[{"10", "^", "4"}]}], ",", "0.9725"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"1.33", "*", 
        RowBox[{"10", "^", "4"}]}], ",", "0.9749"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"1.47", "*", 
        RowBox[{"10", "^", "4"}]}], ",", "0.9791"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"1.60", "*", 
        RowBox[{"10", "^", "4"}]}], ",", "0.9821"}], "}"}]}], "}"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{"Show", "[", 
  RowBox[{
   RowBox[{"Plot", "[", 
    RowBox[{
     RowBox[{"sO2", "/.", " ", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"O2", "\[Rule]", 
         RowBox[{"pO2", "*", "aO2"}]}], ",", 
        RowBox[{"pH", "\[Rule]", "7.2464"}], ",", " ", 
        RowBox[{"CO2", "\[Rule]", 
         RowBox[{"aCO2", "*", "0"}]}]}], "}"}]}], ",", " ", 
     RowBox[{"{", 
      RowBox[{"pO2", ",", "0", ",", "16000"}], "}"}], ",", " ", 
     RowBox[{"AxesLabel", " ", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{"\"\<pO2 [Pa]\>\"", ",", "\"\<sO2\>\""}], "}"}]}], ",", " ", 
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
        "]]}}, {{}, {
       RGBColor[0.24720000000000014`, 0.24, 0.6], 
       PointBox[CompressedData["
1:eJxTTMoPSmViYGDQBGIQDQYLEhx+1WXtKZlcYQ/mbyhwKHGb8o0tvgPCX9Hg
oOss8/qR2SwIn6HTIWz+6rU34pdB+DsmOFzKj2c/J7kRwj8xxeHGhy9ekW07
oOpnOjQ9Oj5j97QDEL7FXIdn61SfNM87CuEvWeBgyLFGJirlNIR/YJHDN42Y
/kNfL0D4d5Y4rM28V9jVdwXCf7LMYdXHS75JAjeg5q90cFhyfx/fnNsQvsxq
hyyQ8if3IHyVtQ7i2y8y3GN6COE7rHd4f/Kw09rMRxD+ug0OZQ/mCC7d+xjC
37TR4V2Uk92Lm0+g7tnkkH71eZb2t6cQ/rnNDvsOiqsFsz6H8C9tcZhvo3Nl
1jMo/8FWB0ewh19A+O+2Odz+CQrglxD+p+0OC38YAoPgFdT9Ox1qL2yO/LoT
yufb5eDy6+3rA5avIXyh3Q4L0ze/Kt4K5Svsgfr/DYSvt9fBZxmXm2oplG+0
zyFJIMJyywko32G/w33/3ul5Qm8h/PcHHF5N3cRTuAbKtzzkkHj4snaq5DsI
v+OwgzVYA5T/7IjD9An8VWar39n/BwHBYw5g596Cyhccdyhc0307g+E9NHxO
OMi3vg7cIQfl/zrpEHhLuibRCMrfdsYhM/9D68kQKN/hvMOLm2t+xeS+twcA
5grzeQ==
        "]]}, {}}}, AspectRatio -> 
    NCache[GoldenRatio^(-1), 0.6180339887498948], Axes -> True, AxesLabel -> {
      FormBox["\"pO2 [Pa]\"", TraditionalForm], 
      FormBox["\"sO2\"", TraditionalForm]}, AxesOrigin -> {0, 0}, 
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
      RowBox[{"pO2", ",", "0", ",", "16000"}], "}"}], ",", " ", 
     RowBox[{"AxesLabel", " ", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{"\"\<pO2 [Pa]\>\"", ",", "\"\<sO2\>\""}], "}"}]}], ",", " ", 
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
      RowBox[{"pCO2", ",", "0", ",", " ", "\"\<pCO2 [Pa]\>\""}], "}"}], ",", 
     "0", ",", "27000"}], "}"}]}], "]"}]], "Input", "PluginEmbeddedContent"],

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
           RowBox[{"pO2", "*", "aO2"}]}], ",", 
          RowBox[{"pH", "\[Rule]", 
           RowBox[{"7.2464", "+", 
            RowBox[{"0.796", 
             RowBox[{"(", 
              RowBox[{"pHp", "-", "7.4"}], ")"}]}]}]}], ",", " ", 
          RowBox[{"CO2", "\[Rule]", 
           RowBox[{"aCO2", "*", "pCO2"}]}]}], "}"}]}], ",", " ", 
       RowBox[{"{", 
        RowBox[{"pO2", ",", "0", ",", "16000"}], "}"}], ",", " ", 
       RowBox[{"AxesLabel", " ", "\[Rule]", 
        RowBox[{"{", 
         RowBox[{"\"\<pO2[Pa]\>\"", ",", "\"\<sO2\>\""}], "}"}]}], ",", " ", 
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
      RowBox[{"pCO2", ",", "0", ",", " ", "\"\<Partial pressure of CO2\>\""}],
       "}"}], ",", "0", ",", "27000"}], "}"}]}], "]"}]], "Input", \
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
      RowBox[{"{", 
       RowBox[{
       "\"\<current model deoxy Hb\>\"", ",", 
        "\"\<current model oxy Hb\>\""}], "}"}]}], ",", 
     RowBox[{"AxesLabel", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{"\"\<pH\>\"", ",", "\"\<sCO2\>\""}], "}"}]}], ",", 
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
      FormBox["\"sCO2\"", TraditionalForm]}, AxesOrigin -> {6.9, 0}, 
    Method -> {}, PlotLabel -> FormBox["\"pCO2=40 mmHg\"", TraditionalForm], 
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
      RowBox[{
       RowBox[{"dH", "/.", 
        RowBox[{"{", 
         RowBox[{"CO2", "\[Rule]", 
          RowBox[{"aCO2", "*", "0"}]}], "}"}]}], " ", ",", 
       RowBox[{"dH", "/.", 
        RowBox[{"{", 
         RowBox[{"CO2", "\[Rule]", 
          RowBox[{"aCO2", "*", "1470"}]}], "}"}]}], " ", ",", 
       RowBox[{"dH", "/.", 
        RowBox[{"{", 
         RowBox[{"CO2", "\[Rule]", 
          RowBox[{"aCO2", "*", "4530"}]}], "}"}]}], " ", ",", 
       RowBox[{"dH", "/.", 
        RowBox[{"{", 
         RowBox[{"CO2", "\[Rule]", 
          RowBox[{"aCO2", "*", "10670"}]}], "}"}]}], " ", ",", 
       RowBox[{"dH", "/.", 
        RowBox[{"{", 
         RowBox[{"CO2", "\[Rule]", 
          RowBox[{"aCO2", "*", "26660"}]}], "}"}]}]}], " ", "}"}], ",", " ", 
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
         "\"\<at pCO2=0Pa\>\"", ",", "\"\<at pCO2=1.47kPa\>\"", ",", 
          "\"\<at pCO2=4.53kPa\>\"", ",", "\"\<at pCO2=10.67kPa\>\"", ",", 
          "\"\<at pCO2=26.66kPa\>\""}], "}"}], ",", "Above"}], "]"}]}]}], 
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
1: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
        "]]}, {
       Hue[0.1421359549995791, 0.6, 0.6], 
       LineBox[CompressedData["
1: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
        "]]}, {
       Hue[0.37820393249936934`, 0.6, 0.6], 
       LineBox[CompressedData["
1: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
Wx45JjE9twAujPiS6faOR/4f+uY3cA==
        "]]}, {
       Hue[0.6142719099991583, 0.6, 0.6], 
       LineBox[CompressedData["
1:eJwV1nk8FV8bAHCyRRRRuMO9SSRZWyTRHMsvS4WULCVLsiakCGUPKVLKEoUi
ey7TQspRVCpJ7ljKUsmWVEKWQu/z/nU/38+cmXvm2c7IufhaHVnExcVVxc3F
9f9fiRER+GGgpkvyrxdxWsgbObqZp8B8BcNztm0tpJKN96Zf4JDefYN3OlpI
3YZGtz5uBhK9n9Fr191CHr4R/bqBh4GYp0XsSwdayEqr2SvnBBho/7+PCoYz
LaRlTf9a8WUMJG2+ee9m2Xdk4oWa3YpMBqrWolNWuL0jhfuXtrZtZ6A5d7np
iwvvyPmzK9rtHRiod2o27mRMKzl09WTajlAGGmivMmidbyU77EMv1WQyUJuC
t5HACQ4pQbrUbMpioF9usi9unuSQVvKmA2Xg6u+3nfWCOGTzt5Vbc64z0It/
c12+IRyy4XTlp5hsBgpM7W57GcEh2Te+qpvfYiD6mL3jnkQOGd9n0/ypmIFq
KhybivM55FavTUv4HzKQ70uBATcOhzQbmLc7B/53b1bgM80hDzq9KBSuYaAr
v+d+2LVzyIj99jvEHzHQx6bt/CbvOeRzg4jIVbUM9Hv3R6MVHznkXqJpWucp
A6EIzoGAEQ7p03S43/cVAxULsB5oc9FkmLHqxglwmuXZkXPcNJn8dCoy8DUD
/WVKvXq/iCbvVp1jnWlioBXL6hNO8tHkn7xy+4RmuK6nPJ8lRJNxZ/625LUy
0Ldv8/PFEjSZq5by+P0HBrqQJaVSu5YmvZZZFdh3MdCrHw6MXiWa3DQmeqkL
XMcZLppbR5ONFUmuPd0MdNT2d9FmFZr8sSlhyedeBspiTUinadCkzrZIu+E+
BroY9FZacitNthr7/p4agXx7NmXym9JklpLax6BvDKQ5rLNnFnxE8HvjDNj6
t9ylETOanHnllfVnlIFWW0eWNe6iSaa5m+HCDwby0ssyCrCE/e1zuMQ3AfE1
ZeyOtKHJRc47VSX+MtAJ290toa40+XupoM8FMIs0Oqp5hCaHHz0v5Z1jIPHA
+PIB8FspA5Xf4N/zd9aZucN+WrTXty8wEFV9vHuRF01uQYrr0hcRSKd0pmaD
L00q//jiIcpDII9DuvGtYGZWbmE8uGeidNzPjyZ5Z2SUgnlh/URzdpE/vG+5
+Fp7fgIV+mvuFDpBk0dZ3AoyQgTaWxfvHn+KJh3f1LpeAZeNXm4VC6ZJq9DT
ecJLCKTsWdOaAd7aMS0/D+6NUkzOD6FJ/os/VveKEEg7KO9nyWmazFnoWpUj
RqBPM2frAyJoMqU0w0lqOYG0sLDeIDjW3iYnGbxAVhvYRNKkz/1WVqQ4gXbc
MxnbFAX5OfaS6bKCQHPrSxt6o2myree+zBppAtmu0mr/FgvxWG0TeRt83rvc
yzyOJl3dpweUGASqSPAjy8HjY1vKVQkCOb79e9s7niZFeav1t8gSyKb6mv3b
czTZaWJ3uxp8seFej3wCTWYnzgrpMgmUrhqRGQhWk9ShEYtA1zfbN6w8T5O7
lGvczOQI1CVf/kD/Ak1K+B543QTWGXg7Fwfuov6qW6wm0AZh8aAmsJee7uxe
ebi/UG+xZSJNakZ1O7SDBZUbZC+CZ56ffmq7hkCz60qONIHjLB+fd1AgUMv3
D+f0k2jS/KrD2Edwgk2DazB45Yf5fS6KBDpywcK3HJx3eDvTfS2B1gwlia68
SJNPAzHbbx2B3Bipfm/ACTWOKybACYr+96bAe7i4Qk4qE+hGXsgaZjJNfjqH
DEPWEyjW+3CYO7ig+VPBHHjkzLD7OfAx8UjhcBUCHU0dOlUEns960hatSqC6
0dyl/eCGz846/Gqw/gXv5QXwBcVF2fHgp/0aOpKXaHKv902eJeoEaiwI4VcD
M9gGHong7ZVaUwbgvsm+pmUaBKrqq168H1y0NVrzMtjT2k7PHewXJp8qoUmg
B65eKYFg7fr6P6ngiiIDoRgw12JXR+kNBPKb25J7EfxiF29DJpg6kWOTAU66
lKfE3Aj16NWqkgve326UmAM2P7lmVQFYlhj4tXoTgdb7ftcoAfc7nt2fD04+
HnOoDFyap1CzdjOBmN2o8P8O+PqMVQzuMQsRKQXrqLnFqGgR6GVOfGIheFEA
/9c7YEWehrW3wC8f3N6tuYVAy7tiujLByXM7Kinwvzb5wstgW/2hlVraBFIf
nL0QB2bFxoVWgZcbOp0LAQ++WvtJZyuBRj3ZWd7gO8sajR6DtZlGz+3B2XLu
/7R0IJ7PSvea/v/5G/kfssGGUyqbtcBR/+WfUN5GoGyp7V5y/9+/jZF6HvjY
K7txIbCr55evsrrQv59mm8Yhf/tDo/LSwHke6bOdYO3sOunzegRatvLhjhzw
ugpHmnc7gQ77bHCLBDPqF5LCwCuvpbQ5gecGdXmPkwQ6bTqfywB/n+mq/Qa2
eDE3Pwn11ysUGnwEQb7EOAX/r88natU/bPUJxI6a7AsGVyLbolZwYrB2wG5w
ntX04V0GBPrQbWTBAscGbn5PGhLIR7pk+DHUv1ltRb3ifwS6zOdxeRD6Z1uL
ZVgO+Kxd4fFSsErfT23GDgKllmdf8wMv41e7I2IM/W5cjiegP+ndxemTJgRq
szK0HID+fuZouveYKYF2qa13ug6+7z8sMgxeZd1I7QWnX1WM7jIjkGWI4poa
mA8OPTd9nu4iUOehLOIkzBPzn/pKursJNClgs40FRtyf++6BN7Lbrr2A+bNa
gWVbZE6gDMf1kuLgwaOZBsmWBDISvjF9BeZZR5jOvOAeAu2/1S2gCW5Mfv8g
Gtwg+m/v67M0WXJXUjXIikCSGbw3/sRAf8ylSB7aR6D6ffe/GcJ8nD1/YXS9
LfT3YANPZDhN3uSRM7gFzuIJXsMD3hV6L41hB/PN0f98dBhN3vDqNRC0h/k0
4a8cfoYmDUw1MgYPQH5U0nOcQ2F+8NP/5TrC/etSRTiBNLkxzCNTyolAUkOL
HLeCu3/PjV0Eb7r9+ef1kzAvBxSywpwhnl/Mmp3hPGmtDxo/cJhAV3w3H6fh
vGFEEtkr3QmEku79cT1Kk/Uz5ZOJ4P03xsTKveH88TMy4/Mg0JC9lMs0nG+1
jj6/J8Brk9JKojxp0mU73vnOC+bdnFlntBvE46/LzPljcF6hnfoaTjSpG1i8
hzsQ+tXqcpGaFU1Wx8g1RYG9zhSVKe+hSa2U9B28QQRyCXx9fg2czxrs2G0C
pwg0fsaZFjOnSYURFwWREAJFaJsntMJ5v/QQMSsVBvl5nK04imBe/nchRyOW
QCFbbiudUYX87+MhKsFLh0XSN8L3xQeXkKsb4+D8dRKlh5ShvsI9ErTioR9v
HWSbwvfJy2qjE7oJMO+yA36Or4Z6V503Nkki0DPji5u6JGny7IpjPx1T4XzU
OubMBd9PKr++4E7wK6O2ywkLHLK1yS55TxqBqv8JtCyf55CrYv7TNEwn0CO5
lqOyfzjko3GZAMVrBNoyxrOOmOSQk29fT41eJ1BKskNg1RCHdElYtxCcTyA5
LtR66g2HFHTLbh4HX/+zR6jhNXw/6q/I9r5NoKt/VxmLvOKQCzNcyKGAQJXP
tJoznnPIa+6dkaiIQDnkGpFMzCHfGcXxCZQRSHrNJ8XtFRwS/esXvnKXQCYS
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
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
/HZIOf4f52oWxQ==
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
    PlotRange -> {{6.5, 8}, {-0.19161908800013794`, 0.6024724209303711}}, 
    PlotRangeClipping -> True, PlotRangePadding -> {
      Scaled[0.02], 
      Scaled[0.02]}],
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
                 BaselinePosition -> (Scaled[0.1] -> Baseline)], #2, 
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
                 BaselinePosition -> (Scaled[0.1] -> Baseline)], #3}}, 
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
                    Hue[0.37820393249936934`, 0.6, 0.6]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                   Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    Hue[0.37820393249936934`, 0.6, 0.6]], {}}}, AspectRatio -> 
                 Full, ImageSize -> {20, 10}, PlotRangePadding -> None, 
                 ImagePadding -> 1, 
                 BaselinePosition -> (Scaled[0.1] -> Baseline)], #4, 
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

Cell[BoxData[
 RowBox[{"Manipulate", "[", 
  RowBox[{
   RowBox[{"Plot", "[", 
    RowBox[{
     RowBox[{"dTH", "/.", " ", 
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
       RowBox[{"\"\<pH\>\"", ",", "\"\<dTH\>\""}], "}"}]}], ",", " ", 
     RowBox[{"PlotRange", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"-", ".2"}], ",", "1"}], "}"}]}]}], "]"}], ",", 
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
1:eJwVzX0w1HkcB3CpRSfXg021/fb345psEVGE4j4f61Kk7XlzIxQjzkNKOicR
dyTujj01sxLnklqdKc7TobYHZCrVcHE9bFdtftY+/Sa1dMdR970/3vOe13zm
M2+HqOTtMeZmZmabSf5vm/KIaWZmFJ6UL93k5s5C3M3M2K3EOlvv9qpVLHSx
5Q9+IV5d2iua78HCMRfVGf9pFE40R30YX8OC8fruVd+ZUxg+p0ne6cvCffXW
aAse+c/aclC6kYVCUcDtWZ9QuDwwMfpoJAtWjaKCRXwKN2Zcrmz9kYUGcaR6
cDmFe9hbB1resjA1va3I93MKbes9OoolQxDQdn72yu0UOlyoLtDWDIH38OTe
P2IpnKVWUW9mauBh4DeWM45RyA9LCYiI1oAtE5Wl+Ynsvzjeq+rQwA7D8ztR
CgpVR2otR+lh8NClxyVdpbDaebqf5+Fh6IrMe7Ksj8LZsU2FpfeHYcyysSJl
iEIZ5z7PmtaCQ/WhNdJxCvfZmAoGE7Qw2fpzpf5TIb6oLTo+pdRC+kcu3GaJ
EJuW7F+70UoH1ddrja+8hbjuVXWeu1QH9w5NSCQSIbq5RkhGK3VQIk2wCI4S
4pHFDb7i1zqwagouep8mxHHJ2qEEkR7sA0IS3H8Q4oHgdEFkjB40wdcWCquE
OLfRtfPiBT3UBCrPVP0uRM+2Kfa1Wg/Wqa+SW3qEeEMSVJa/wABCQYpdhlqI
BsUtdkRigN63S+c9HBOitVuF22fZBshSxqvbZ9IoLygO4l0xgGoanRPK0NjW
5yX2+8sAT9NMR3JX05h6mBWPWRjhxH6vdfuCaDzrcG5fvbsRXINm9T+OoLG7
38Xe40sjpIVP73ieQmPTloaB0QwjJOvjsktO0mjTddvtQKURrC6NnPqznMas
kswbhdeNUB42M6OpnsZL7xS2viojvDwhWxXQTeNk81194j9G6Bz0gb3PaPR7
xBvXzuVA2raNch2hsfO06atmZw4Kb34vKZzBYHjmhmKRmIO2q9Kd2QsZhH5t
XJ2UA/lKmZPIlUFL/+q3kQkc2A0Ydu0RM/jt0whTQCYHX5iat4lDGUzzj+lf
UcxBEm+uQ0cSgzWCGsnOSg68gorW9+Yw+DCdPe1ymYN63tG1xXIGWydDqgzt
HNwz5ec+r2WwZJezrKybg5cDjlWdNxi0zr3bYtHHwXk3D1nYANm7m5zro+LA
Shn9KEfHoLkvH5SDHFQ3zrmvIr6a1cuoifFXZZennkHPikluBstBmnxBi45Y
6VG/PYRYc6indJuRwXzeY79nxJ2OqyMc3jCYmvhbxbshDrJk5rqbo+Re9kg+
X8uBIL9OLRhjcFGv8wov4ubMPc9SiXfbbb0SSmyMb+lZ9p7BHr7VsbPEYevj
r8j+ZnB5RK6fvY4D74m+w3snGGx+TIc56jnoH8lKbCeeH5//IJD44LBzDP9f
Bjed0rrEEiv686R3iJ0Ula0KYrs6Hx+3KQaD8lzeiwwcNFzQuBcSC04onmwg
3lx+yoklPje58lIscW4Bt7j0A4M5jml8BbF9dhn/HTG9fl1dN/G1rzfYhHxk
cKRuobeGODRplHeR2Ewwr45n5MAUfe7DR+Idnk78pcT/AcQzTVY=
        "]]}, {
       Hue[0.9060679774997897, 0.6, 0.6], 
       LineBox[CompressedData["
1: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
        "]]}, {
       Hue[0.1421359549995791, 0.6, 0.6], 
       LineBox[CompressedData["
1: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
+H/6n4pN
        "]]}, {
       Hue[0.37820393249936934`, 0.6, 0.6], 
       LineBox[CompressedData["
1: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
n1w54L7iBg518JznveUVcOmK3Rou8P8BX2ktbA==
        "]]}, {
       Hue[0.6142719099991583, 0.6, 0.6], 
       LineBox[CompressedData["
1:eJwV0H881Accx/GT1ClUfk32/eG2FVp+m7R6+HyKY1qJLGx+TlOq6Urd9Iux
qE4/dktzrKOG1u8SpU53aij9sGJp+iHy44779T0/SpGx7/54P16P579vXqJg
VdIkDoezgt3/NZfGGXE4BPoO6d5JypWQfCt9XShrVdv63ikVSqjvkf51gvVl
oeCRsFIJu11eFC4xIpB3u+dAeJUSdDWRnnsmEegU5nTVQq6Exs7QNVNMCEwd
ya/Z06CEXEf/22bTCLyY4vN1crsSuJWOotnWBFo2es2YbaaCiqXxnd3OBEqc
t4+e2KSCf41lhxf7ETgQOSe+8Z4K/GWlM9xWEdjM/Fnt81Ev+PaOJfy9jkCb
Al5Aa2YvPAzcPnXybgKZC83X6lt7wYpOzFD9QmBLSGQu37sPwrVtdxNPEXh0
bZmx26E+8FbvSE65QWAnV2vOb++D+vicp07NBK48Vndvqrca3kytLEpVEnjM
cdP0/iw18Mq2+ESMEGg3TG/zaFTD2PXi4xoLEvMHuXZf2mtgx4Q+1vxjEjfZ
2AU2JGigrOac7pUviT33383bc1YD97eMhoSEkFhwRBQ0t18DRyI2TlmWSCLy
njdJXbXAvbLs8HAaiYfWNspKBVpw8F++0eMgiUyMR0fDGS2olsntyBISaz1j
UoxVWjgdqCgsuUZi2DqiPoHSwfRtrwRVD0jMkdfszwnVAWmfarurk0RZxIhD
ULYOmgbmWD58Q2JXXUyId4UOMhQbOqtNKSzfOnPJtJc6eGFEZUXRFLo4/xrP
M9XDs7QhYbYXhbFfVJ8g3PWwd+2CRd8GU9hqn/jOJkoPrsFmLa1xFOKqgHoy
XQ9psca1bakUdrVPLKot0oNAk5x5ZD+FKyw8hC439cA905/3j5TClTai4oI2
PUijTXddKacwWeBc+PStHjr2ij3971CYd3yR33UrBuq6F0LCcwoXB0Tl+8xn
IEIWRrj2Uxg4Jj7vxWcg99aBkNzJNNpslXd9Es2A7EbEV5l2NLoN6t5vFDAg
cRPPc3Sl8ejOM8lENgO2T7SrY5bSeFnT7e6fz0DA0NWwpVE0xv04llNzmoEU
k1m82hQaTxUKObUyBhYEH+Y3ZdG489FsxYW7DJSb7Pz8ZwmNt/lav65WBu4P
7ctuO0fjQzOpn6+SgY4nc0vqbtIoMaSHiwYYKHX3Fkc/oXH+KHxnP84AV7Hm
cZaaRm70SJGDqQHKKmc2vmDtIk+KC2WNZxX1n2lotPNzssxknSb5oErNuvii
IryDtWrLg4IwHY3fRB2EomkGqJvrFccz0CgS3ZHbmhkgQzxJfes1jY9pfRJn
hgHs913qtH9Do67kmcSV9dX0mOfbWDd05ypiWOs2VD1wGqbxpE9wz3XW0fwN
F8VvaRyxPXp880wD+I42b00YpdHnUGTTy1kGaOnP+L6adaxqDk63NMDm3k+T
rN/TeGWYKfVlfaolJ+Iu62JpRlAea9tLCxe6/0tj7fqB8SArA1ScVHnksp5l
GLQQsl4hzZvXw5puMbUqYZ0t0n9YMM7+ZZTz9j1rh8zfrAdZt/cZWp2sDSD/
Ich8+QSN5wXp51ezjkp5bfIHa363u/An1kNrfh+fYC0Qm3teYv0fnkJCIg==

        "]]}, {
       Hue[0.8503398874989481, 0.6, 0.6], 
       LineBox[CompressedData["
1:eJwVz3001XccB3DkMdVUuh76PVB5rIiSh1Wfz4hG3DwsbCJdq6TM6OFmSpzQ
rkk32qSjKSlWllaoy73leFqTnFpsTVaZuo1+9/cjrq0H2nd/fM7nvM77fM55
f2wlKeFb9XR0dELI/L9nlsXp6uhQuGBLbZ2NIQeJzQe3hxLrWzwe/5m47VnZ
3TPE68SyBSlGHBxY+qj0I10KFe4hASpjDribUe6H9Sg0UoTXRpty0DUQmmBo
QOEy95MGBWYc5Dv4tc+YTqF4aXL9M2sOjK85yKzMKVyfeFQR68rBVd/NA4NO
FM6zi29t+oyDyWmKwlVrKCySRIhHsznwU5z7wDWcwmq/RY8dqzjwevEu/tft
FIbo9srtujnoDthvpH+A9L3l7+U9ysFcVpKpPk5h8cTTvd3zNBDxsv+2pIrC
hvxV7QFeGlgxlJ6Y3EQh8ItN7KI00LY596HjfQrTx9Pm+0g1oDW6djrtOYXj
VpudBos1YFuZujLyNYWWx4M7Oi9r4N2N78uHZ9FoGnuTqenUQPp7TezMhTSq
a27oZwxqoPLmJe6pF43GqprVokkNdKa+EYvFNM4uOhOuNeehKHKnYZCExoQN
Fs6sMw/GdUGFE1IaTZoyKoaABxu/4J1uBTReqTzb7BbBgzpIaUlX0ChNDf/2
9TYeqgNUpRXXaUxjbHM3pPNguudpSsMdGpvnmP2VIeOBtk4TZQzQGHp8TJh+
iod7o3ZzurU0Zte0Z5RX85CpShpoNGHQabLV36aBh0e6THY0y6DVxPMwTSsP
f0jH9uYsZ7BCmfOF6T0e8rZ5frglkMHlIp8WST8PLoEzen6PYxDXZyuVL3iQ
xk5r6U9jUCG1qa0Z5SFlODGr6GsGR/Nu7e54S/77YaT4tzIG/wy1TyrVF6As
xiSj7gqDO1K7qupnCPAkT+7u18Gg0u6llWAuQOugN8T3MfijUn7BghIgUhFG
uYwweMhJvi9soQD5zd+I8/VZzPr045TvnARQNEV+kmXJYnHwklqxqwAlrnJn
BxcWNWF5cbM8BBD1vty4yZfF3l2SrGk+Aqwdqw/zjWaxYdPV6Ik1AiQbzLZt
SWbxfO6qLTv8BPAMLPS/l83iZJ/62Mp1Alwx+MrnWAmLO+cGFP8bJEDn2JGc
/kskl53otheT/r32Fa23WHxy8a7sdagA55atkMf0shijvR5/I0IAY1XCg+wh
cv+5o2JqowCV18y6HhF7a73WGkcKgBdVbR7DLJr/rf1lNrG0xKJhiNjGbX/7
ImJ16p2TYRyL1cN1B4KIW+2Xx9kKLA61tXAniDPlekPN4ywueaV6aBclgPWR
2gFrLYt9aepGF+L6g5v69hB3nO8p8STmkhruOE6wWOBp4BtIHOOfdFn+D4ui
wq6oXcReb+7vjn/DohFbLvuJuGckc1cj8azTmZaNxF++WLzV/C2LR6dcK1qI
q3pyI28TlyebXnhALKr19l42yaLHhCJFS3z1vNotn1hasLp3kjikrNj5GXGe
bqmHYbQAOTLN/JNTLI4c6lOLiG2yTpm/Is7Ub/FkiZX71s0Mfs+iT1zOYQfi
6ORxgwvEekELOl2JxxLOTr0njsspM/Ui/g+FYTyY
        "]]}, {
       Hue[0.08640786499873876, 0.6, 0.6], 
       LineBox[CompressedData["
1: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
B8WfoD3SreunPXDo4eQUWtZyjv4g+n9SrlYm
        "]]}, {
       Hue[0.3224758424985268, 0.6, 0.6], 
       LineBox[CompressedData["
1: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
0quPNcD/A+mr+m4=
        "]]}, {
       Hue[0.5585438199983166, 0.6, 0.6], 
       LineBox[CompressedData["
1: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
uuMb+KdL3vIK+JybXG4P+H8RfeuG
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
}, Open  ]]
}, Open  ]]
}, Open  ]]
},
WindowSize->{1166.1166666666666`, 3313.},
Visible->True,
AuthoredSize->{1166.1166666666666`, 3313.},
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
Cell[1485, 35, 245, 5, 229, "Title"],
Cell[CellGroupData[{
Cell[1755, 44, 54, 0, 44, "Section"],
Cell[1812, 46, 1694, 52, 77, "Input"],
Cell[3509, 100, 1054, 28, 77, "Input"],
Cell[4566, 130, 642, 18, 37, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[5245, 153, 49, 0, 44, "Section"],
Cell[5297, 155, 5198, 158, 217, "Input"],
Cell[10498, 315, 1573, 47, 57, "Input"],
Cell[12074, 364, 371, 11, 16, "Input"],
Cell[12448, 377, 439, 14, 16, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[12924, 396, 56, 0, 44, "Section"],
Cell[CellGroupData[{
Cell[13005, 400, 252, 4, 59, "Subsection"],
Cell[CellGroupData[{
Cell[13282, 408, 6174, 187, 177, "Input"],
Cell[19459, 597, 9633, 193, 218, "Output"]
}, Open  ]],
Cell[29107, 793, 1225, 34, 37, "Input"],
Cell[30335, 829, 1565, 42, 57, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[31937, 876, 264, 5, 59, "Subsection"],
Cell[CellGroupData[{
Cell[32226, 885, 4888, 138, 177, "Input"],
Cell[37117, 1025, 13280, 273, 248, "Output"]
}, Open  ]],
Cell[50412, 1301, 1226, 34, 37, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[51675, 1340, 352, 5, 59, "Subsection"],
Cell[CellGroupData[{
Cell[52052, 1349, 8767, 242, 337, "Input"],
Cell[60822, 1593, 43705, 790, 288, "Output"]
}, Open  ]],
Cell[104542, 2386, 1243, 35, 37, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[105822, 2426, 367, 6, 59, "Subsection"],
Cell[106192, 2434, 5972, 146, 257, "Input"],
Cell[112167, 2582, 421, 13, 16, "Input"],
Cell[112591, 2597, 1077, 32, 37, "Input"],
Cell[CellGroupData[{
Cell[113693, 2633, 1053, 30, 37, "Input"],
Cell[114749, 2665, 43881, 793, 237, "Output"]
}, Open  ]],
Cell[158645, 3461, 1218, 34, 37, "Input"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature Vwp#0X@6TylkPAK5jV6#0F#4 *)

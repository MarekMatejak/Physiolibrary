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
NotebookDataLength[    161158,       3562]
NotebookOptionsPosition[    159957,       3501]
NotebookOutlinePosition[    160497,       3523]
CellTagsIndexPosition[    160454,       3520]
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
kC8P0uH7Y7/Vwhqw8amsSOYxvv8H1adODw==
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
1:eJwVzns0lHkcx3HKZbR0tTZ6LuxWlE1uuazW94viUOZ02TQn0kShKRWp0Ypy
cinVhLRqKa207WbRjXJrxegU1UFJi60mT8NcnlJIRPa3f3zO+7z++1iF7Vqz
dZKOjk4g2f81yQ/V1dGhkK+/0KdZzEFUXWLkKuJj2aWbQh04kHP5jy4Q50j8
2lscOTiwqOusly6FLe6q6vIlHGjvrHc8PIlCjw2/7D3owcFDxapwA30KMyq7
T8704yDD2qfReAqFgjzbKa6hHAhuWB81N6VQjuVb9h3n4Lr3JkXPAgrntsfx
+/o5GJ9cKVvqSWHEF3fHtYFvwKfy4rTFayhMXXPcu+zyG3DrHRO3RVK4ftv7
F5UCJTz2jTfUO0ChZ5sTLgpTwiw2LEmZReG84VO9ZXeVsFbTfT/sMoWHl399
5RHdC86q/VHR1RQWWpikmcb2gnxT6nObVgr1lLr7k5p7YcjwxrnYNxRaCLNK
h6k+sCqKcQkaofB0hKlVh6QPxm6fL1BPpdEkdyo7UtMH+yf4jSbf0fi5IaZu
haEKiu4Ua1+50agjE+l5rlNBU8yoUCik0U0897NRgQqyg7YbBITRWBqfKBcr
VCC4GSD7KKXRxeioMGe+Gix9Vm53OE7jA5w+mLlFDcqAmtl0IY3d43EGPUVq
+MO39mzhLRrFLSEpCxRq+Cru1a6KZhqv+UQMd5hpgLaINUtQ0CjKS+tcIdRA
y/t5Mx8P0Wgetk6QflADSbUSRZURg5LuQfmeEg106TLJIpZBxnjUvKJbA/9I
B/amODGYrll1SWqghbQIV4/N/gzKzvm/XeqgBTt/46cdoQweOMHtbhJpQbpx
cn13LIOV9c5TchK0sEsddSj7CIPNnHmjWYEWBH/2n3qWz+A1TvjY444W8oON
Em5eZbDN0uv7oU4tvEzLdPS5x+DD6NRtdp+00NDjDuJOBjffrR67NoOHoMrV
lF0/g8V5rW5ptjxk1B0TZuixuCPmycoJLx4qq4N+OjSbRasH6nMngnjIXZy5
0NqOxXSn7KZl23kwa9esC/Fm0fDjj0V2iTwsGyhf7S1iUfCvj5Q+yUO0/gyr
+mgWB6xzwgMKeHD1ly1vSWaR8Zyz1aaEh6v6P/9wMpfFkNeRTpoqHpoG0lO6
i1nMf3Ha9fw9Hl62zy9s+JtFibreeGorDxftnTOD21mMX0ElLuviQVAb/iRZ
xaI/Y+vX3MND0Y3pD7uI4/nnzu+I8UqtfImaxW8D+6fN4niQ5n5ToSJWpkXK
NhArY5rPrNaySNk0/dVH3DDfKdTqHYvZ9W9jdJU8JGVOUtUNsuhT+8FhXh8P
FullCosh8u/9njZf4vLEkM44YtlIlTiKWCupaLb5yKK68ZJvMXHwcklp5jCL
5YqlbvYqHtxGW/eIR4k9X990UfPwtD9pRxUx5TzdaT3x7l7braafWdyZYV8g
Jb78NDXoPnGWaK3XbWKzMnd3+3EWW113lrhpeLh+SemQQfzsU0KeiDgw/9RC
jthzPEsaT5xylJ9z5guLV0sUI7eILQ/9avqBuKvR8kIHcc0+P5OVEyzWjMQ6
DxOLogf1fyeWj3VWmGl5GAj/7csE8c7kYGsX4v8APixTEw==
        "]]}, {
       Hue[0.9060679774997897, 0.6, 0.6], 
       LineBox[CompressedData["
1:eJwd1nk0lesXB3CESBqQqXPOQ91uk8wyhOcJKUMUJRkzZKyk3KsbyVhCkbqR
KIncEA3mUkIlJ4oyE3IMh9dQRKn47ff3x1lnfdZ61nrfvZ/93efIu/pZHebj
4eFpgA/9LZrqxMvDwyBPBvPlbVdysFflGc89YEXFxulCMQ6u4aTWp4PbPfWr
V0pwcPCWzuvbeRlEuYC9ly3JwdSzA6oRfAzS6eenrs/g4Ld9e9wEBRgEb6oT
WLueg2PWG75cuoRBcpBW9LAuBws9Xn9BRoJBqIZV5w95cfAjA+e+/o0MwvA2
NlN5xcG/F5Vd0tVnkIWjUzOSzAFsWHZnuZIVgwSuVszy9x/AWkO/DjV5MsiP
p/J979gDuMH41GL+YAYR0y2PH2INYnHkGjJ4mUEuHm5L8QwcxNajXbWu2Qyy
jk/MIebtIFbn/uN19AmDfGL+WKsnO4RrnKPaNjQyiFLpzu7AI0P42+LHaScG
GGRNM0+zeskQls/032rzg0FCtMseBc4P4V+lN2+NLGMS8+azPn4mw/ifhTFH
0bVMYmrUkiZ9cRhnPsulerWYZOu1c7+6PgzjOv85CwsLJsk+h1flSnJxoo2v
oKkrkxi5u62Ps+JioULTSzOBTOI/8NasMYGL5QzNfVXimCQ2p8bRu5aLB02f
SjMzmMT9tcIlDu8I/s+44npGCZNIL+jrx2qOYJGAXr9iNpNory4wkPMcwUzZ
E5JBfUxyjHCnlyaP4Pdf1ok1fGOS68mTwobVIzikwqevXJhFDJ2tAg6OjuBO
XlaYLWKR3LFn/AckRnF74NRfkWos0uigMWemNYrPeWhuczFhkW1iOvYfHEax
osnSj61OLHJq0bfZnSGjONBxUVXXCRZ54bvY4/CNUew34hWaGM0i1LprCS9K
R7HQvckrLaksYrX23t51TaM41V44qPABi/BMr0pX447innMJqoavWOSas2+6
Dg+Fq/u18aEOeJ+qPvshcQrblO1lKE7CeekfwVbrKRxTGWsRw4/I1iWZJSWa
FC57YrMvVBoRg0dR41uNKZyklLBpvSIifzix03T2UViyeXS/gwEiCX55sZXO
FDaaKtprYItIlXCvU7IPheOcp/YkgxtVqlOfg5vZynvGwR06Ui8GwR6ZuRYp
BxFZd4xVoe5L4Qv7b5t9tUNkNoMn4h24oSRuR4YjIt5L3u7iOUph22A3bT43
RB7ek2iy8KPwUYGV8lVHESnOTIpKP0nh4LmMg2LHENmUL2PwHBw3oZ7oCi78
V5DbDc5pt120yA8Rk8hNM7IBFB68nz5geBwRM/du0avgQzbKOS9PIOLjz6sR
/heFrbIt1d4EIsJILD5hEUhhTZNLO96HITK28/KW7NMU3vDdZfv6cEQGN2SV
V4FlszX0QsARaxYrfQLP83erK0QgEvK6sl4iiMKvKjf/ER2JyOcIu/5QsI3W
Gz5yHhFWQob/vmAKB6znryyIQ2Rqv6oi9wz0p6X1ieBFRGq7QnN4Q6D+qNwS
R3ClfuAyWbBuv1WByCVEgpM9LpqCF926fdMzHhF0LdUzB5woic+gREQesOvi
D5+l8AOB0zrxSYhYOSlXvQmlsJdehl8v+F+xzLfdYPm/6jJVkqEezc1VX8CJ
HNnlH8FKZ4KPyYRR+GT1k37pFEQ4Hp5vPcFbw37HZaQi4hVIbvGEU7jiV2hP
0W1EokImCtZEUPhv9XsSizMQKcqYlVMHKx5pNLEFJzscOLMDfLNTvnAO3DWx
7rsnOLS8KhpnItIsrDOTCzY6xa/65i4iut3LJZUjKVw3dT6yKxeRYfH+rxui
4H785uUU8hA5+GlrtCa4YySgIgjs6DUhbAwe7XOZkb2PyC67a02u4KXvt3kd
zEeEf2ry1A2wZd6EWcsDRNQ1w1YLn6PwR/cD4u+LELE8pPGyGezQW1+AihHR
TK4d6QMP2BuZ+4G1L//6NQaesVKJWlaCiOA6iyGB8xSW2i4ya16KiNBu9gd1
sB3zecebckTUXr8WjQf3NP+ZUf0ckbycUDGNaAqbivTwylYi4vooNQODi0mS
y3Hw3lQlhik4LnexPPMFIlJK1WwnsFbY8K2/qxBx+tjLOA9OUMhJ2/gSEReR
yegP4J8urr/Pgk/mXHjYBfZIknVsAf/Uf1Y9ANbli2VEvEJkQIM3axY83Op7
o+s15L1QwV72AoW3R2y5Hl+HyPGEJcn24LzSge8DYLVfjvZuYOnxNFtdNiLZ
r/yEfMHjtsukueCfOq3oNDhFceKaQT0i0x++GiaBv7Y/uPrtHZzXMXKrBzsu
9542e4+IHiOi+gO41kh+Xwb4OOuOaAf4ZsFlcctGyAsr3nkQbBp1IvG/JkQ8
WNZzv8F3lNUT7JsR2X/RW3RjDNzXONmYBy7M7C7ZAha8v7vqFzg1VMFSFeyz
0XM6rQURGVcXo21g5TUptr2tiMgVHzAxB7v23v2i3IYI6Wm02wO+cvNxTBi4
+pT6wX3gGdn6p2vaEWl7U8ZwAD8V55E/3IHIV7fpZz7g8cal5UVg9St9msfA
KEHGWrATEevKmjR/cPhStahs8FTjSeVTYBMBDy63C5GS4Tv+keDT1SfCdboR
MZQ7bnUenBd2dnUsWPAllosBr5hP3q3wCfYN/2R4PLhlhv3wWA/kWaTa/TpY
qKjN9Dk42rH9/g2w9smB/uW9iAgf4+GkgVMn5lc9BC/4nJfKADfcFyng7YN6
745IZIIXfKV3WYHf6B1eyKL7Maxyegq8Szb7xj3w1bv64kafEbHL8d+dC37p
bpZ3FTyjYEflgTf0uX/S6EfkR0rslwKw3S3/wHPgtvrWAw/BcY4hK1rBm8J3
5T4CT7QnGZziQD5+pMkUgeWSMztrwe4LUerFYCubhwEyA/B7sey6bgk4UuKZ
qA94RW2bSim4uKnubjk4gG0sUQYeTmjFIoOItJdy+mnLWHLa7MHZSoXp5WBT
0S/+eeDmhmLTJ+Bg9u8lv8E96uN9tPMvLMncPYRIy4K9x1Nwz04pvZvgffW8
bbRXCP7RMg4O0enbWgE2qFH2w8OIiHJ+htMOCNcTSgBjD+untLOI6e1e8GcH
7mfaLfM2OipcmAe35zO0hSrcPoSBgyVaZ2lnPl7xthM87z32//Mkp6JGYwSe
l5VXTLsr3aciHpzJI3WSdmCSVDEX7FKoKE1b7FJNvuEoIqPfv2XR75sf6Z+d
Bu4S8GPQNg1ipc+CV4ilBtH1Dvqzk/dSMH/WZ6vp/oR7nbqcC7bkWT1N94/p
vC5GYAz2k7m/KO3S/U3hzuDRI5HL6f7vMz8bVAaOvGozR9/XpIFCgPg4Iloz
3Hr6PuO0248cBcvUkJhCcPWfak7yE5Bf7+0V9Dw4MXttgsCXb0+oPQDPiV+0
bAYHL/a5kg9W5R0iFyYRuSb5dik9bw2zV7T7wZtWl/5Jz6P3OFHV+4KICv8/
G7PB6Z0pa7+AJ1TDufR86zbtZJh9RSSjoeFuOritdloiC/x87rv5TfDyYgvB
g1Mwn/+NW9P5CUng41ZOI2JecsP8Elj2fEGf7Dd6P67cGwsuOuPQEQBmB/+l
Hw2mfIrZG2YQ6f0q9jEMbL/DJz9hFpFS4+6Rk/S+2CaVPQL+0cSveRycqFpz
y+g7Ims1FI4cAdch1uXv4Lhv4ZfdwVpzjScPzcH/mZTYWmt6n02GHCkHNywb
c7AEHx/afFjiJ9Sj69xhCs7+GGVTC5bYHJKwHSxZoK2t/BvyOtPLpfffo6xB
lRjweA/f6w3g3alXNnHArXrGF9fSebowtjp5HpFz2drN0nT+QlMkvoJNO8Zs
xOn99vdOUfMFmOd37BeiYNuj0wJ3wbuTm1cJgafcbs8vgCuMRa35wP8DBfs3
pw==
        "]]}, {
       Hue[0.1421359549995791, 0.6, 0.6], 
       LineBox[CompressedData["
1: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
xOrHgrPwPvB/w4KXEw==
        "]]}, {
       Hue[0.37820393249936934`, 0.6, 0.6], 
       LineBox[CompressedData["
1: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
        "]]}, {
       Hue[0.6142719099991583, 0.6, 0.6], 
       LineBox[CompressedData["
1:eJwVx3s0VAkcwHGUGlIpj9C9c5setG2RsOj1+0U4KCfZlZNiouJoNZHSy8Qy
XnWYxjlRTQ+iVhyUJKJm01qlOmpRm1FNmqeZOzUoWx5794/v+Z4PJ4a3dY+J
kZHRZqb/P1McZWxkRGBPfslEVK0c4iVpcVsYzxLzvz+rk8Ojj+JnVxjb1A5/
XntLDidW9J3bYExgkoHb6dAgB+39basyTQh0LNY49zbL4alsS+w0UwLTHwfU
BLfLId/J908LcwKFrttXu/bLgVXvlGdvTaDZ6xH1gLkCbvlEywZ+IHB/2nDu
gUQFjE9pKli7nkCra4V9VzoU4Nt0dbbLVgJVOw+KLDlK8FKOcV/GEfjO4CNo
PKmE5/5Hpk89QeAV0f6cql4lWFExfMUZAhcPhNi4u6kgbFDaEXOdQJNnne1L
TqvAXX00PvEegW6ZEtbGfhU8iha8XvqCwK51JT6WbmoYmV5/MVlOoMGhUGGc
oQZOedJP4f8S6Fd3d3RTpxrG7l66rJlFYjHxqijJXgNHJ3U7Zy4isdv5RNxo
tAbK71dp33uR2ORYtl5SqYEnSd9CQkJI7NcXJ/H0GhCF75sWFENiI7cl+/OK
QWDdDir4kkriH11L3U15g7DAd9M+19MkCuockj0qB0ER1GJHlpE4eWN8PV8+
CL/7t54raySxVDpUpSK1MCPlPe9OJ4ljYX7V9lu0QDok2x6Xkag+ws1QZWqh
6/OSuc9HSIx7OToqu6kFfmuCrNmMjXYto9I2qRb6jNkZERQbe0xM/1KydPBP
6tChLDc2TiZKO2gXHWTv9VyzK5CNVimHLw9v04FzoEX3qyg2LlEK41lpOkjd
OeWhNJmNBSJ+R+NFHfA08emiXDYGcIJ/c36gA1blp6JeMRsPpRjblEt1II40
O367jo1OxnsNuq86eJctXOXbzsZdqjmGV1Y0tA14A/cNGxcuHz0bvZyG8KZQ
wvkTG3NE0ZF7/WjIl5wKyZ9KoUuF1JsbSUPTvfCf0+0o7F9z+2Atj4ZiF+Ey
J2cKy55aBMVn0WDbM/jLDh8KL0vaT509S8PGoYZQnwgKn7htF9lX0pBoOofz
MJHCsYnzqxY30+AZWODXlUEhujuC7WMa6kyPrS4spvBkhb1X6GsangzlZEmr
KLwv8FVVy2l41+NY1vaAwtwPK3CKgYarK92FkT0UetBtNecmaGC1xv6doabw
boXRhXIzPZTXWz7tY1wvbuF1M8YbrY88NBSWDHd4TjXXQ2rxvDtqxmE970tj
GSuSOktCtRSan+a95czQQ5ujWxRHT+HD3fPGLljogS80UUuGGXN7Zdmz9eCQ
UytzGKEwYvcOpwbGDWk73qQwBkEpd4CxNuFO59IvFOqaD9eApR4i/RJqhF8p
TJle3fiVsde3Fwe53ygMfu6ZuWeuHro/8X9tZrzQzn9aEeMDyh/3WH+n8FJu
YJqE8fVuQXgH48Ub1gXMt9KDba2398pxCitKPIK7GN+qULjmM7a9FrR/nPFm
cdGyj4yr83mCZdZ6yMrTzS+ZoJDF+VKYxXhB+nlrA+NjKVGZNxm3HA6YuWmS
Qt6HgYS3jCMSh02vMT7TlOc/w0YPQ7GlE5OMqwPCbL0Y/weGrkpm
        "]]}, {
       Hue[0.8503398874989481, 0.6, 0.6], 
       LineBox[CompressedData["
1:eJwVz3801Xccx3HRlYxNQtL3RyY0FqUsauv9DrFUt6SklPyYsuT4MXW7yR2H
VOpwcTY/sqzrR3atn6TdUNZVK1QKteWes6TU1fd+v7eQUrHP/nif13n893zb
RyWsjzE0MDBYQ+7/NS8Ln2RgQOF0S/kzhYiD2Ja0neuIF/tfXh1ozEHr07Lb
vxJ7N0WdfEV8YF5vyfJJxJudpqMJB9yVTR6ZhhQut0BbjSkHHX3roo1FFKZk
TlRbWHCQ4+x73cyUwuxSo1txdhyY1DkfmWlFYSdYNWjdOLjgs72v/wsKDaKb
9q7fwsFHI1Xu18soVLatsizI4MBXVfGZ+3oKa52eHOqq5sDr+YeI+zsp3JM8
5e2j2xzc8d83ZfIBCvefdCh/q+dgOhslG8insGx0oKLYWgfBLzU3o05R+CIx
IGmWlw4WaaWx8Y0UPqn8Kdpokw5atx/8e+49Cgvbz3d+LtHByJS6X5KfUThH
1RHRU6gD+8qkr0LeUfjUVTnnxhkdfPjjRPngpzSGHrP0PN+mA+mEbpu5A40l
Ztzw4X4dVF6p5R570WgcL8ua91EHbUljYrGYxmK7ujRrax4KQuKMA6NoFG85
ui3AhQeT+sDcNxIa22IVaIc8zPZdHbfgGI3Pz8j03wfzMBDYZEsraBQ2/F7t
vZOHGv/mEsUlGus808d/lvLwScrjhIZ2Gh3Mi0dvHeGBtku2Se0jPZaGmu2l
PHS+crS8M0Lje8Y5dayGB1nzrr7LUxkcPm2rT2/goXcSkxHKMjjNdnNncCsP
/0iG9mQtZNDxtXSapJOH7B2Ll0auZLBxor66S8OD20qz7ofhDFYFx0k9XvAg
2WZ0TZPMoFnXS6XTax4SBmPTCw4zmJoiXPX7QP77TV/4oIzBGaaXpLNEApSF
TU2tP8egMq3cZam5AP9myz18bzDoo/Sauc9aAHW/N0Q8YjDmOlNbQQkQogqi
3PQMagrDMh87CJDTclScM5nFovxvZ851EUDVGLIh3ZbFE+K8S0/cBShyl7s4
u7FYsK9RXekpgE3Py41bfVhcl9U/eHyJAH5DF4N8QllctcNGLQcB4kXT7K/F
s6gdLykU+QmweGXuis4MFl/lrfXrDhDgnGj/krwiFo1H2/4sWiVA29ChLE0t
i54L3Jb8JSb9PU4K9VUWh4t3mx0PEqBi/iJ5WA+Lju9D9Vs2CGDSHN2VoWUx
a1mPoyJEgMo6i45eYo+UjPpaYlQ2t3oOsijTPvzmIrGkaEaDltjsfjbeJB5I
ai8O4lis8jEy5onVTgvD7QUW8x64FHhtEkAmN9S2DJP+kev1t4jtDp3tsxth
sUvlX3qf+GLa1kcpxFXU0f29xNyuhva5b1i0ehDpqiMOW7HrjHyUReearWKL
UAG8xu79EDHG4jv/haUbibv1st2XiU9PDfwynDjxuWuM1XsWOyrmq3YQn+o+
GHKTuCYyUS0htjnr7T3/I4sVpndLSogvVA0syCE+kC81VBCvKSt0eUpczr+L
URJnHdHNKh5ncbfjj3Qj8ez0UqvXxK6pB5PUxE17A8xXT7C4sfy7lnbi0Phh
UTWx91ratJt4KPrk+ATx3YBzYg3xf8I6Qwo=
        "]]}, {
       Hue[0.08640786499873876, 0.6, 0.6], 
       LineBox[CompressedData["
1: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
        "]]}, {
       Hue[0.3224758424985268, 0.6, 0.6], 
       LineBox[CompressedData["
1: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
T5ZXwE57xC5lgP8P/SAA8g==
        "]]}, {
       Hue[0.5585438199983166, 0.6, 0.6], 
       LineBox[CompressedData["
1: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
2gWec0pdWQV3LwWFi4L/DwQJCRA=
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
Cell[4566, 130, 660, 19, 37, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[5263, 154, 49, 0, 44, "Section"],
Cell[5315, 156, 5198, 158, 217, "Input"],
Cell[10516, 316, 1573, 47, 57, "Input"],
Cell[12092, 365, 371, 11, 16, "Input"],
Cell[12466, 378, 439, 14, 16, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[12942, 397, 56, 0, 44, "Section"],
Cell[CellGroupData[{
Cell[13023, 401, 252, 4, 59, "Subsection"],
Cell[CellGroupData[{
Cell[13300, 409, 6174, 187, 177, "Input"],
Cell[19477, 598, 9629, 193, 218, "Output"]
}, Open  ]],
Cell[29121, 794, 1225, 34, 37, "Input"],
Cell[30349, 830, 1565, 42, 57, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[31951, 877, 264, 5, 59, "Subsection"],
Cell[CellGroupData[{
Cell[32240, 886, 4888, 138, 177, "Input"],
Cell[37131, 1026, 13280, 273, 248, "Output"]
}, Open  ]],
Cell[50426, 1302, 1226, 34, 37, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[51689, 1341, 352, 5, 59, "Subsection"],
Cell[CellGroupData[{
Cell[52066, 1350, 8767, 242, 337, "Input"],
Cell[60836, 1594, 43705, 790, 288, "Output"]
}, Open  ]],
Cell[104556, 2387, 1243, 35, 37, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[105836, 2427, 367, 6, 59, "Subsection"],
Cell[106206, 2435, 5972, 146, 257, "Input"],
Cell[112181, 2583, 421, 13, 16, "Input"],
Cell[112605, 2598, 1077, 32, 37, "Input"],
Cell[CellGroupData[{
Cell[113707, 2634, 1053, 30, 37, "Input"],
Cell[114763, 2666, 43921, 793, 237, "Output"]
}, Open  ]],
Cell[158699, 3462, 1218, 34, 37, "Input"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature 4uDF73LZwsHmJDKRoNqqrBon *)

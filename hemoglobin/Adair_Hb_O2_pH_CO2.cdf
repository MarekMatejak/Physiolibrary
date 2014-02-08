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
NotebookDataLength[    151869,       3306]
NotebookOptionsPosition[    150328,       3232]
NotebookOutlinePosition[    150864,       3254]
CellTagsIndexPosition[    150821,       3251]
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
    RowBox[{
    "CO2", " ", "solubility", " ", "by", " ", "Bartels", " ", "et", " ", 
     RowBox[{"al", "."}]}]}], "*)"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"aCO2", "=", 
    RowBox[{"30.66", "*", 
     RowBox[{"10", "^", 
      RowBox[{"-", "3"}]}]}]}], ";"}], 
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{
     RowBox[{"mmol", "/", "l"}], "/", "mmHg"}], ";", " ", 
    RowBox[{"O2", " ", "solubility", " ", "by", " ", "Siggaard"}]}], 
   "*)"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"pKzD", "=", "7.73"}], ";", " ", 
   RowBox[{"pKcD", "=", 
    RowBox[{"4.54", "+", "3"}]}], ";", " ", 
   RowBox[{"pKzO", "=", "7.25"}], ";", " ", 
   RowBox[{"pKcO", "=", 
    RowBox[{"5.35", "+", "3"}]}], ";"}], "   ", 
  RowBox[{"(*", " ", 
   RowBox[{"fitted", " ", "to", " ", "Bauer", " ", "et", " ", 
    RowBox[{"al", "'"}], "s", " ", "carboxylation"}], " ", 
   "*)"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"pKhD", "=", "7.52"}], ";", " ", 
   RowBox[{"pKhO", "=", "6.89"}], ";"}], " ", 
  RowBox[{"(*", " ", 
   RowBox[{
   "fitted", " ", "parameters", " ", "to", " ", "Siggaard", " ", "at", " ", 
    RowBox[{"al", ".", "'"}], "s"}], " ", "*)"}]}]}], "Input", \
"PluginEmbeddedContent"],

Cell[BoxData[
 RowBox[{
  RowBox[{
   RowBox[{"a1", "=", "77.49"}], ";", 
   RowBox[{"a2", "=", "6003"}], ";", 
   RowBox[{"a3", "=", "62623"}], ";", 
   RowBox[{"a4", "=", "1.473*^8"}], ";"}], 
  RowBox[{"(*", " ", 
   RowBox[{"fitted", " ", "to", " ", "Severinghaus", " ", "ODC"}], " ", 
   "*)"}]}]], "Input", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{"a1", "=", 
  RowBox[{"1", "/", ".0123"}]}], "\[IndentingNewLine]", 
 RowBox[{"a2", "=", 
  RowBox[{"1", "/", 
   RowBox[{"(", 
    RowBox[{".0123", "*", ".0113"}], ")"}]}]}], "\[IndentingNewLine]", 
 RowBox[{"a3", "=", 
  RowBox[{"1", "/", 
   RowBox[{"(", 
    RowBox[{".0123", "*", ".0113", "*", ".1"}], 
    ")"}]}]}], "\[IndentingNewLine]", 
 RowBox[{"a4", "=", 
  RowBox[{"1", "/", 
   RowBox[{"(", 
    RowBox[{".0123", "*", ".0113", "*", ".1", "*", ".0003436"}], ")"}], 
   RowBox[{"(*", " ", 
    RowBox[{"fitted", " ", "to", " ", "Severinghaus", " ", "ODC"}], " ", 
    "*)"}]}]}]}], "Input", "PluginEmbeddedContent"],

Cell[BoxData["81.30081300813008`"], "Output", "PluginEmbeddedContent"],

Cell[BoxData["7194.762213108857`"], "Output", "PluginEmbeddedContent"],

Cell[BoxData["71947.62213108856`"], "Output", "PluginEmbeddedContent"],

Cell[BoxData["2.0939354520107266`*^8"], "Output", "PluginEmbeddedContent"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Model", "Section", "PluginEmbeddedContent"],

Cell[BoxData[{
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
         RowBox[{"pH", "-", "pKc"}], ")"}]}]}]}], ")"}]}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"fh", "[", "pK_", "]"}], ":=", 
   RowBox[{"1", "/", 
    RowBox[{"(", 
     RowBox[{
      RowBox[{"10", "^", 
       RowBox[{"(", 
        RowBox[{"pK", "-", "pH"}], ")"}]}], "+", "1"}], ")"}]}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"fnD", "=", 
   RowBox[{
    RowBox[{"fh", "[", "pKhD", "]"}], "*", 
    RowBox[{"fzc", "[", 
     RowBox[{"pKzD", ",", "pKcD"}], "]"}]}]}], ";", " ", 
  RowBox[{"fnO", "=", 
   RowBox[{
    RowBox[{"fh", "[", "pKhO", "]"}], "*", 
    RowBox[{"fzc", "[", 
     RowBox[{"pKzO", ",", "pKcO"}], "]"}]}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"dHh", "=", 
   RowBox[{"-", 
    RowBox[{"(", 
     RowBox[{
      RowBox[{"fh", "[", "pKhD", "]"}], "-", 
      RowBox[{"fh", "[", "pKhO", "]"}]}], ")"}]}]}], 
  ";"}], "\[IndentingNewLine]", 
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
      RowBox[{"pKzO", ",", "pKcO"}], "]"}]}]}]}], 
  ";"}], "\[IndentingNewLine]", 
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
        RowBox[{"pKzO", ",", "pKcO"}], "]"}]}]}], ")"}]}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"dH", "=", 
   RowBox[{"(", 
    RowBox[{"dHz", "+", "dHc", " ", "+", " ", "dHh"}], ")"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"x", "=", 
   RowBox[{"O2", "*", 
    RowBox[{"(", 
     RowBox[{"fnD", "/", "fnO"}], ")"}]}]}], ";"}], "\[IndentingNewLine]", 
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
       RowBox[{"x", "^", "4"}]}]}], ")"}]}]}], ";"}]}], "Input", \
"PluginEmbeddedContent"],

Cell[BoxData[{
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
        RowBox[{"pKcD", "-", "pH"}], ")"}]}], "+", "CO2"}], ")"}]}]}], 
  ";"}], "\[IndentingNewLine]", 
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
        RowBox[{"pKcO", "-", "pH"}], ")"}]}], "+", "CO2"}], ")"}]}]}], 
  ";"}]}], "Input", "PluginEmbeddedContent"],

Cell[BoxData[
 RowBox[{
  RowBox[{"sCO2", "=", " ", 
   RowBox[{
    RowBox[{"sO2", "*", "sCO2O"}], " ", "+", " ", 
    RowBox[{
     RowBox[{"(", 
      RowBox[{"1", "-", "sO2"}], ")"}], "*", "sCO2D"}]}]}], ";"}]], "Input", \
"PluginEmbeddedContent"],

Cell[BoxData[""], "Input", "PluginEmbeddedContent"]
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

Cell[BoxData[
 RowBox[{
  RowBox[{"(", 
   RowBox[{"fnD", "/", "fnO"}], ")"}], "/.", 
  RowBox[{"{", 
   RowBox[{
    RowBox[{"pH", "\[Rule]", "7.2464"}], ",", " ", 
    RowBox[{"CO2", "\[Rule]", 
     RowBox[{"aCO2", "*", "0"}]}]}], "}"}]}]], "Input", \
"PluginEmbeddedContent"],

Cell[BoxData["0.24847616345225676`"], "Output", "PluginEmbeddedContent"]
}, Open  ]],

Cell[BoxData["0.24847616345225676`"], "Input", "PluginEmbeddedContent"],

Cell[BoxData[
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
      RowBox[{"120", ",", "98.21"}], "}"}]}], "}"}]}], ";"}]], "Input", \
"PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ss", "=", 
  RowBox[{
   RowBox[{"100", "*", "sO2"}], "/.", " ", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"O2", "\[Rule]", 
      RowBox[{"pO2", "*", "aO2"}]}], ",", 
     RowBox[{"pH", "\[Rule]", "7.2464"}], ",", " ", 
     RowBox[{"CO2", "\[Rule]", 
      RowBox[{"aCO2", "*", "0"}]}]}], "}"}]}]}]], "Input", \
"PluginEmbeddedContent"],

Cell[BoxData[
 FractionBox[
  RowBox[{"100", " ", 
   RowBox[{"(", 
    RowBox[{
     RowBox[{"0.006767440224106179`", " ", "pO2"}], "+", 
     RowBox[{"0.0003988095153262011`", " ", 
      SuperscriptBox["pO2", "2"]}], "+", 
     RowBox[{"1.991802632161819`*^-6", " ", 
      SuperscriptBox["pO2", "3"]}], "+", 
     RowBox[{"2.5734836568394465`*^-6", " ", 
      SuperscriptBox["pO2", "4"]}]}], ")"}]}], 
  RowBox[{"1", "+", 
   RowBox[{"0.027069760896424717`", " ", "pO2"}], "+", 
   RowBox[{"0.0007976190306524022`", " ", 
    SuperscriptBox["pO2", "2"]}], "+", 
   RowBox[{"2.6557368428824257`*^-6", " ", 
    SuperscriptBox["pO2", "3"]}], "+", 
   RowBox[{"2.5734836568394465`*^-6", " ", 
    SuperscriptBox["pO2", "4"]}]}]]], "Output", "PluginEmbeddedContent"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Show", "[", 
  RowBox[{
   RowBox[{"Plot", "[", 
    RowBox[{"ss", ",", " ", 
     RowBox[{"{", 
      RowBox[{"pO2", ",", "0", ",", "120"}], "}"}], ",", " ", 
     RowBox[{"AxesLabel", " ", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{"\"\<pO2 [mmHg]\>\"", ",", "\"\<sO2 [%]\>\""}], "}"}]}], ",", 
     RowBox[{"PlotRange", "\[Rule]", "All"}], ",", 
     RowBox[{"PlotLegends", "\[Rule]", 
      RowBox[{"{", "\"\<model\>\"", "}"}]}]}], "]"}], ",", 
   RowBox[{"ListPlot", "[", 
    RowBox[{"Severinghaus", ",", 
     RowBox[{"PlotLegends", "\[Rule]", 
      RowBox[{"{", "\"\<Data by Severinghaus1979\>\"", "}"}]}]}], "]"}]}], 
  "]"}]], "Input", "PluginEmbeddedContent"],

Cell[BoxData[
 TemplateBox[{GraphicsBox[{{{}, {}, {
       Hue[0.67, 0.6, 0.6], 
       LineBox[CompressedData["
1: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
hShCIuGK2P8B354A/g==
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
       TemplateBox[{"\"Data by Severinghaus1979\""}, "PointLegend", 
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
          RowBox[{"pH", "\[Rule]", "pHe"}], 
          RowBox[{"(*", 
           RowBox[{"7.2464", "+", 
            RowBox[{"0.796", 
             RowBox[{"(", 
              RowBox[{"pHp", "-", "7.4"}], ")"}]}]}], "*)"}], ",", " ", 
          RowBox[{"CO2", "\[Rule]", 
           RowBox[{"aCO2", "*", "pCO2"}]}]}], "}"}]}], ",", " ", 
       RowBox[{"{", 
        RowBox[{"pO2", ",", "0", ",", "120"}], "}"}], ",", " ", 
       RowBox[{"PlotRange", "\[Rule]", "All"}]}], "]"}], ",", 
     RowBox[{"ListPlot", "[", "Severinghaus", "]"}]}], "]"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"pHe", ",", "7.2464"}], "}"}], ",", "7", ",", "7.8"}], "}"}], 
   ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"pCO2", ",", "0"}], "}"}], ",", "0", ",", "200"}], "}"}]}], 
  "]"}]], "Input", "PluginEmbeddedContent"]
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

Cell[BoxData[
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
    "\[IndentingNewLine]", "}"}]}], ";"}]], "Input", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell[BoxData[
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
  "]"}]], "Input", "PluginEmbeddedContent"],

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
1:eJwV1nk4VV0XAHDXFCpUJO6+rkqRNIi8VOwVFUlCkSZkKqFSUi8iGjRTKYrM
SlJ6FRm7ppAKKUO4p0KZZ0UJ3/r+Os/vOc89d++19xrmOxyxdBYUEBAQYgkI
/P8p0zUTHwpw8HHM32PJNTQ6dl3kKfQWtbG1+Y9rqOpON61B9OEbXSnT0mro
upJylxaWAlQ2tMy9n1FDHaPPvi0RUgBfNeEFFUU1NN3yd9ilafg+u6pJnV9D
zXPbVOZIKYDGqfjrc2Z/pNeu5m5drKgAjz3fq+zx+0hntEnW1OorQP6mdwLX
nD7RifOydbv3KUCn2vt7Gfq1tP32ifBNvgqQw7pwrUGmjtbv9r2RG6kAgs4R
u9T+1lHdQ1rTRXMUYPB59LmGD/U0bvmt/M+N+P1HOdPcMxqo4P4ty2TGFSB+
vbCXZMhnWsvPJMrybBg0jO1evb2RPpUq35Cvywbv8PmaPopN9PeVqz1Lbdhg
F2yk5v2hia7zTrFgebPB/IgfZ8CrmZ6XPdxvd4cNd9wLzdPm8ilMtc0Ie8EG
ds7k/sooPs311BOUy2CD72PO355oPtVuuz16F50uXrBOIo5P1d9saonJZEOk
SOtTSOLTebeSXz7OYoOTUbfh/Sd8OrDY3aE4jw3if9QiZV7xaazZ8MuhEjZo
2/tuHeXzKSua5WhRy4YLWdGcA/IM1fLeNvwBLfLW5dN8NkNdzO6ftaxjQ2p4
sUwTYei7SZ3E7fVsaFr5ZMVmJYZG2B39bvUZ9xuyN2+OCkNXzv9yYDefDabB
ovH7tRhqm5jn7vidDT/l2IuatzL0hp/ERCua3ef3wWUbQ0t22Fxz+oHrT5wa
6jdnqJrIyBPndjboG3++ObGdoT+dl/Yf6GTD9MExTdHdDL2qcs/TvZcNJsqV
7u+cGZqbctL7xE82vPiTBKp+DJ1nXrK3F/0rxlrD9TRDvX5KGzr/YoPE5aas
ZH+GLocUKatRNhhLWlxeGMjQ2NrmZK3fbMhY5KUqdoGhFwQMmob/sqFy4yj/
aghDLaxnwDFhAg5zlG6eiWPo03GbxV1o+tR/3614hkrEJc1wECEgeFYrLTEB
99Ot/9lClIDU8ojWoiSGagd6HtMQI/C+/Ftg7yOGktS6xIHpBCovPZ0//h9D
21lx4kfmEAgbL9w1UoDr16+WGUR/qK2b3lXIUGOfKe5xGQJu4rZ9/CKGpgzt
0z4pS2Dg0VKDghKGHm5VcAyQI+A0Ejv7SDlDR0rC8kLYBCRPy5d6VTF0Eauk
bBYhoLkiTWNrNUOt9YZrbqHn2NoXL/zA0JcZFp3hHAJpakHWb2sY6vNAcm4s
l4B0W9ES4TqGCly8eOTZQgI5v31G2M0M1Sh56bNKGf9fNserDu0g0H7+BXra
4RrpED5Di09tjMpaRKDBnnXvD4PxdBV8U6BC4EJwAJPzjaEztvgt+LCUQIDG
xbgvPxiqF/x42XZ1AoGs8Zu+7bif4kadWvS5GHJHtoOhVWt1t31eRsBz3fdK
w06G3lT/5fttBb4v/Dp2sZuh8pJHawc1CWg1n43L6MfzlovWdtMiINa7aoHa
AEMrld6Ft6GPvA/qjkKf01TdXb8a9/P8r9XpQYb22Xxl8v4hIKKr7LdkGOPt
IAnaOgQmjBI1Q9EJbuvi0tDHxjNX/ETb+Ec4xusSKBIKGc4eYWhRgnlH8FoC
ev2dkct/4fk+8d/MWkfA+D3jGow+mZma4oMOo7anGLT6GzEPDz0Cajl/dgSP
MvROX8GgJSVw72HsZPEYQwdG+yzfoTfIfi2S/M3QLSzOi41AQOdYcvFOtIDM
v9466wn0KdWeakO76WqMcwwJiO5KTej4w9BSA7u94WiBa6C/aJyhSqbX8qU3
4HmVOcyyR9fZdgYIbSRgNGBlV41eeVDumx869fiSzyJ/GXrFc6PBL7S5Wugl
XTScixPu3ESg6S7naiT63rUqZwcjAnVVRvw36J93Jkqb0Bc0Zzj+Qqc82nWp
0phAZ6GbhMkEQ4WfB3cZbSYwZTV9qSfaLi9jSyG6tWur/x20TNUsyRcmBJq1
SnOa0Icb6JFlW3C9G1gJ4+g33zyqH6ClZ3Tlyk8yVLk7UkPJlMCNc0Ii2mj/
kTc376IryqpPm6MbJkaHZ28loC9Zu8gVrTltsdVVdE3arb8B6OvSOzJFzAgM
Lwxl3UZ3yAfJBaAzWWZayWiDhc9OjaFnC1iEZaPvqzOfPbcRmPWLzH+DHls9
Y203uq1xdWMd2pKuiXIyx3wq5fJa0E+MD07w0Xn9tlU9aDHLO7Y7LQj89+yk
xE+0w54SXjU6IqjvyDg632lIycSSwAoB46kpdI+w0MP3aL7IYLPgFEMVkuYs
s9hOIOvdsRtC6M0blZ9/QvObVpL/vz/1XUvXZgeB9o7rfpP4+wfnN/Ka0AYN
A/+NoWsXWW+0s8L6lZ+TO4AWLnV524IWbDK/+wO9yuWkhYs1gZMJciaN6P2i
F+s70VVZx9+/RYc+iNjnsRPvX++bBbnoV5setQ6glxkGbP5/vHp/ZLt62RDI
7h2DW2gSXNE/ii4wjxLzQ5uoNJ3w3UXAkFUV44BOPvA3MGg3gWe3/12zBF03
baaY6B4CeyLz14mjRZI51y+hr69aMqMdz9+hQ/9e6F4ClwNnSUehb1zcpiSz
D8+3b4/hcXSBqv2DcHS5tet6YzTHNTA92hbjmX0oshvvo6n4TZ0FdgQOCi3/
lY32eRT/Kgld3WUpfwHd0FlckWpPwNLTIVMOffOQaGuOA4Ht8yTWKmF+FEjI
ueo7Elh616S8GfOrP0WlvxDNbtGUD0ebdhuPlzsRcHFKFhJBT3O/MqfehYCv
Y07Xa8xn7RlRd3cfwP18+3ruKNopNZXLoF/+FmbmoYt63i/9fpBAyNWRCges
B34e0huGD2E+1hgGNP1k6OOZ8yu83QjYqauyvNCNTzTM/6A9FnjoSaD/6bPc
y/LA9WVXtqzAejR0+LaX1BECia6/qu2GGHrgqELS0uMEkiPf5Vr0MdTMW6k0
FW0wwtco78V+77e4fZkX1i+X24fXoQUvrlqy8gSBvdaNuoo9DI2KMXmidZJA
T7yQeBnW3+pKnww9XwLayz/KPGljaOanM3Wv0P8VHcucasV8abwwSv0IpL92
mGuOPvTjpq7Baay3bBWpLqz/wpMp+ZsCCBSLjtQKfmGozrKm19vOYn3OETcq
a2Cooua3H9XovQ5poT/r8T7otk+zPEdgSf710Pnomg3Dm3ecx37VPPHsWC1D
3fdOr7QJJsAqK3b5jf0s7srauv1XCLyeOfVPRAX2567IH8dvYb3crSA9Lwfz
KT92Xw+6ruyKmVQ2zhuhSZ+cwgjEX/0UKJyF9VY7rcjqNgETCffXHRk4bwQV
Rf8TTmBLp35mBPZrKXan9fg9ApOssO7byVi/TLXLguIJeMUuVRC6jfWJu1Z/
HC0iWq+XdYuhq4doxvEEAkOuFSZuN7H/RmxOcErE/LJR4b7F+SK8bW/ApgdY
PyYUkj0v4/pOn/1HIoXASr3Svl0BDOU+rX544z8CizuujIcdwPjNyzKUScf7
nuU60YbzT0dgzJc7aJ+zBv6rnBj6zOqwXNRzjEeV6fhre6xnE9ODH2QQeNqb
Vl+5C+c5UyOX3GwCuxS3FR3YwtDUrnzl74UElPbYZj1Xx3zfkVRwoIiAfYh6
U7oaQ0+8urq3C20pPXQ0TZWh+jf3hPUXE1hzdGI4Vhnvg+5voT+vcf5Y62Lm
jPPh8EWtVskKXA91Fjs+naFrVB7H6dRgP7J/uim2nU+NbW/cSkf7Bh9K9/rO
p9a3T55X/0hgYSjTtKmVT48LbXBV+oTx1BtzaWP4NPVL80qxOgI7OFt2Ctfx
KSdCsqD+M4Hvknvc64v5VED8GOP9jUDURYHG8vt8Wtalw84YwPP5EBL03oRP
rwfLJKsP4veoWADHmE93KA9oJaIb1yUaum3k06/7HprdGsJ4qmYpCwCfjlXL
BnmOYPylThtIreZT1ZdDHcvGCKjWKlQVKfLp5bOpmQ+mCFzL0rbyH2impkTJ
MkKSA3/v/7q7/loz/bGNEVKQ4sDT3NeqeZea6ZmzURmR6CrOehmtC800o2ue
fIw0BxadFGGRgGaqmD3ra9JsDpyu3L/y3dFm2m8ldPj5XA5UD2nyn2xvpjdD
flyqVOTA4sQeQ2+5Zlov+KRQeAUHrKUvN7LDm+gnzd5nm7Zy4MRp1RCPK420
Xv5jw6zDHBjSdlS4Dp/pR4/Zrwyvc+BgzNV5pR/r6foZIgu3pHKgj3Z7R+yr
oxl29wua3nFA5Yify86kTzRyooO/vpsDARkhrL6eGuojfj1LUlwR/p2p2t+g
/IHaVTS8dVqiCCp67IKnepU0s7bONtRIEdRpq5PJjgo6546P2saDihAVxIpZ
M/6atsR+OFF1QRH+jCREKTcX0kfyQf4FiYpQ4mp4zOhuLvU2auCtea0IA8Yp
shaf0mkG79uZy62K4O75rjL8XBL90xPq4yjMhZWD1a49RYFU5+JdjQRlLtjP
UZ1MCwzndXhYHcwy4IJAc1jjZt0UXrTYy3prRy6UPLa/r33tBa+0921pRSAX
8rrHyzmzc3ntsOZ4UgwXFhj2ZvidLeBJbjazES/ggkOa3Nx4v2Lew0jZfAOG
Cy1mu43dBUt5oTPl09+gU196CCjNLOX5BJCH5l+48HVkdVGlXCnP1HHhDduv
XBiQTN/PWVbKG1DTcPZp4YKozHqxgJ2lPJ0c05npP7jQVnn05fbHpbyKhrP7
5vdz4WDCTsH128p4z02CLZPRladbT1jtKuNF5V02WjHAhd3A6XFyLOMdjr2h
oTfIhR7l2V+9TpbxZh+MEdk1jPYKabGJKePtGc15EjrKhaPBgWs0+sp4G1xf
xcuNcUH6WNTbn6NlvOVNheHR6JTJhn0ZrHKeAK88MPU3F3b4nTm/SLacl3ih
zqp8nAv+vRZf36wt510b+2yy7S+ud0D3X5eN5TzvQ3xah87THJ09aVbOMzZr
W9I2wQWnqRZjRYdynkZBu6LbJBcuO8/8/sCtnKewqnvOEDq5RDhI7UQ5Tyix
T+zfKS6YL6jgPvIv5/XIDk1MoY/y7F4tuFjO+x/apL/E
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
}, Open  ]]
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
1:eJwVyXs81Xccx3GVW3fKVPr9ft88apRWLiXM2uezY6rjEUVljI5QGJn7JOXS
damHDj0eYRTpIrWWVEwuSehC5ZLVYuXkOMc55/cr7WCji333x/vxejwfb/Og
KK8dE3V0dNzp/u/0AskEHR0Gn5wtNAqxkUNY/d7QjdQ+CWv2P7eVQ6O84FER
9b7XCUNuK+SwZ1l33jcTGBSfXN1hvUoOfN13dvsn0j9y3u5RZzm0yjYG6+sx
WGMqjj62Vg4Zli5N06YweNg5v6hMIgfD65ZH5pkwyDmMBrw9JodyUYCsbwn1
SEfim0E5fJxUlfnV1wz6+i1a/cC9H1yqzs609mLQUJtavvBiPzgqP2zrCGVw
UsdwxBeTFfB4zS4D3T0MGrSpVaeCFDCbBKUoshjM9H+1nWtQwCZNz/2gEgan
toqUTpwSVqqSwiKrGfxh8+rslFglNAYcfL64ncECrnSGokUJwwbXT8X2M/hc
bqTwZwfA/FzMKu9RBr1mkVGniAH48PvpQvUMFu1Nmn18awcgaVzYOn0hiy3S
XemlBio4V3eZ73Vk8bjEe3beFhU8jBnz8PBgMTp5PDioUAXZ3hH6bkEsFleu
q6yQqcDwhlvmSCKL0gdn8pUWaljgsj7C9hiLG+5kt8m2q0HhVjOXLWYxyTVL
bHteDRfX1OYVV7LILFq2LkGmhqnxvVEVLSyW1ooSzOdogDWLNU2Wsei/c6o2
20MDbe8+n/V4mEWzWPuRllQNpNSGy25N5tD6PjlfcUUD3RO4dB/CodvSuV0j
PRr4M1GbcGAFh1Gi9vgKfR4OhTg4B4o5LPvLtT7Jlofl4mlPn0k4FF27FaLn
y0Pi1kkNPbEcfj/jmu+jZB6i1GFp2T9z6PkyNsijkAfD0sETfxRwmDW7k4+p
46HAb3LyjTIOy/vDBpZ08/DqkNTOpZlDo6OhNYH/8nC3zwm2veDwWaOZidxY
AO8qT2b5IIcb+jcYVy4VIKP+qEeGLsF7v74xshYJUFXtvTltLkGp7s2QGm8B
cqylVpbLCaahe25shACmXZot/iKCiU3R+X57BfhWe9NT5EPw9MMp+eLjAkTq
GZs3RBJMuXCyNaFQAAdxpmtbOkGdYn27TVcEKNPb/eXxHILiusDwz6oFeKg9
fKDnMsEsK/HQvWYBXnVZFN+9TbAnrz3QoV2AszYrpX5dBM080+IiuwUwrA3u
TFcRvCPLGtb2CXDuulFrN3VIvvnrOXIB8FJto72a4Mt5TI0zdWLOnAoV9ftl
Wx33UytiWnI9eYKd2kAv434B7lqskJi/JeifrjvTSiFAinSiqn6IYImvus59
QACzw1dlZsME13bGSaKob+71fxFPfduzUSOl5sMrWhaPEEw93fSkk9rPNfw3
6T8Em/Rya31UAjiOtcdtGyP440zBLkAtwNPBlJ23qIu9VpWlUkcrl+4weU8w
2SJufhF1ydOD3vep96V0VPdSm151crL5SHDLpfhFgRoBys8rbDOo41aWGKdT
uxecsJJTv7Pp44uoDxwR5ud+Imgv2RfZS70g7ReTv6kHx9SzdHgBan5aO339
OMFPstALhNonckjvAnVD83tLoNYGn/k0Tp3rV5ojof4Pj61RWg==
        "]]}, {
       Hue[0.9060679774997897, 0.6, 0.6], 
       LineBox[CompressedData["
1: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
0g==
        "]]}, {
       Hue[0.1421359549995791, 0.6, 0.6], 
       LineBox[CompressedData["
1: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
bovq
        "]]}, {
       Hue[0.37820393249936934`, 0.6, 0.6], 
       LineBox[CompressedData["
1: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
8JOnEFy0rx8PPyeJHx55rH9gHTRuWAn+P8XmGc4=
        "]]}, {
       Hue[0.6142719099991583, 0.6, 0.6], 
       LineBox[CompressedData["
1:eJwVzntUzHkYBvBQq1GDklR+F62ztOgeldv76jJI2nLJ2KmkUEonFUUxWySk
Y1MdaU9aJZJWmEqim8KWihCRCWEmc/tNCWtD7Xf/eM9zPuc85zmvZUj0mq1j
dXR0VpP7P/n5QWN0dCgM2m3j13lZBuGN+8N8iYVdeQK4KoPb7/I7zhAnvsya
Xy6RwT7rF3nLxlAYxx8ZPVYlA3X9BoeDYyksOLrdc/lNGbT3+Yb+oEch75bF
kdq7Mkif7X7HcAKF0QLzvMJeGehXzD5qbkJhQ2DlqrUGcpC4bep7+zOFR/qr
S3qj5PB9XM3xxUsptK8YrjFolYN7zdlJtmsoTPAtpfZa9oNL/7fgR2HkP92m
cDq5H+4L9ozX3UfhriWJTyd298MUNkQsP0FhSXqdOMfxPaxVSVtCSih8+Vfr
soMZ78FJsTc86iaFM6K8qwt638PtTYeeWT2k0Gbbwp4wRwV8Gl9xOlZGITvJ
I8s/RQGWxTEL/P+l8KT1yVsFbQr4dr3gT+VEGoeNt7o0mith76gmkD+TRu9L
6xmPYCUU15epX7vQeG6bQ4f+RSXcixn28fGhMbkhlKvUKiHLP/IHrxAaL4UE
2DnZqEC/0uv45wQaM+JKejyiVTDD3TvSPoPGwVXiDbGlKpB71ZrRRTQOLDm0
8LpMBRcEdXlF1TQ6zDzwimXUYLDrdfS1Nhr9DB1FPr5qoC1iTZP6aHzjpJth
kaqGzsGfjO9/opGvEhYZSdQgrovou8Fj8LFnvGBQqoYXY5gUIcugvdL5mTFP
A88ThnanOjLYUTD11jQ7DaRtc160eSWDRSvMIqcLNWCz0rCrO4jBsKWiudb7
NZAQOK5JGsvgil/Na3tOayBaGZ6cdYTBvw++zP2lQQP6pQPZT/MZ9DtfdqBZ
qoF8ES+p8gqD0hx5l8EXDbxKy3Rwv8ugZsOXJR+ncND81hWCexgcmnshKXEe
B/41fpTNAIMtWx4/+M2Tg/TGYz7puiymjWZv3yPioOam/7pkMxbj41zj70Zz
kGubOWe2DYstAjATp3Jg+kS1PsCNRbmg3KvsJAceQ1V+bkIWGxrWLbYu5SBK
z8iyKYpF0cZpvQtucOC88rhnZwqL/NdzeFatHFzRS1z4ey6L7ZX6dMgzDu4N
HU6VlrE4r3i8bp2Mg1dPZhU1N5A996+Fxh84OGvnlCl6wmJ3z9U1F0Y40K8L
fZyiIH3/5ackPC0UV0xuf0G809c+4g0xXqy7PV/JomXEDlvjCVpIyJ12TUHs
zXuXHUMsj2k75adm8cyPi+7YGmiheZZjkKWWRd683PZSQy2IM8cqGj+y2Cz1
SsuZpAWLw5f7LD6xuHmdaWsTcdX+gJ5dxGWFhaMDxOqIa21Wn1mMFOqtWD1Z
CyLPiPLMf1gcdAsW6BlpwWX4YVzwMIv16Ru/xRproWtAvOMGsbj6+r4zxDv7
5241+cqiYyN/sIO4pOuQfwtxWMv5KqspWjC97Opq953F/gUfynuJJefk9unE
Oe2BDyaYaGF1fvacd8Sgef7WmTj1qGb6qREWk0yNFCeIZyT/YfKBOKDx0fN6
4tr45XzvURY7nSX1KmJh1Ee988SiNkmu2VQtDIUWjowS57R0b/Ek/g9Tiz9G

        "]]}, {
       Hue[0.8503398874989481, 0.6, 0.6], 
       LineBox[CompressedData["
1:eJwVz3tUjHkYB/CKUWJWLoXZ951fnQ5Su8otyeV5uqgzqY5So0UkayfZlpJm
W7R1ujHZRGcVG7oMCVsUs4WUGnRi3Upk2tWsdOGd940Rp1a1v/3jOc/5nPP9
4/u1i9wZvM3MxMQkgN7/X1ywydTEhMG6b5ziO0QcRNXvV6yhtle6tqSO40Db
VfBnIfV5WT1xMudg39e64x6mDP425JuSaMEBd3PdglQzBnP9hW3WEzi4r1+z
dZyIwYLhl1UyKw5Uc7xuT7RkUKcqDFFLOLComnNw5jQG5epCtHPmoNJzs/7V
XAbztfa6zPUcDI+pyV6+ksGu9pak2ykceNWUTHIOZtDVTWUlKuXAredzxBMF
g/9MmpBs+YCDBz4/mo/dx6ClbDhk9jsOppLIpO4jDCbHX/5Ba22AtW87miJL
aZ+1XNQqNwMs6kuMirnO4OvO4KtO6wyg3Zz+3OExgwNtCVEypQEGzKtOxr2m
+Zjn0UO5BrBTx7rKBxkMGvNB01dugM/Vp06/+YLFvpIiaGk2QOKoIVxsz2Ln
VJOislcGUN+8wHW6sVhTZ37bf9gAzbFDgYGBLIaX3t++0JqHo/Id4/wiWVwx
eEnyrSMPFlf8sj8qWax0b9MuRh5svfx3zD/E4h2xxea0tTx0+92YwRazaFl8
/VOwgodzPrXHi/9g0bZ+r09FIg8T4jt3au6xuCsrOVR/kAdWEmezV8/iLGdb
v4QTPDx6N2vKgwEWRyS2NlZlPCTVRuuvjZfijeDTd3/V8KAzlaaEESl2ZYV2
KrQ8tCuNe9IWSpFddjhO9YiHjO+WLNsik6JnpLW8u4OHebKJrc82SbG0QZfu
3cuDMnxMQ0ecFBfFes11e8/DzjdRyUcPSDFTl1oe+pnuK+vPbSuQoshB8dZJ
JEDBhvF7r1yS4mn1SsfVYgFeZuQs8LojxYBC8dlMawEaXy2FiBdSDD8ktFYy
Ashrgph5/VK8UOvjJ9gLoKrPClSNJWgl3pPl6ihAzXV5SPIMgnnafX/1OwuQ
55zjOGcewV/aA05VLhbA5unb0I2eBDMONaSXuQvgbbwa5BlGsMT+JTkFAsSI
Jts1xBAUElyuTfEWYIkse9WjFIIX7zqs1PsKcEn0k/vhPIJxIo8j6tUCNBsz
0zouEFzWVNTTEkj7P51d3FhH8PLZYydLgwQocVmUs+EpwePLg6IUIQJY1G5t
Sekj+JV4TVa5XAB1ldV9HXVr6pWZ1dR4vla7+A3BFfmNxbeolXnTNX3Uvu1d
6lbq7th7+UEcwSeRftuHqBtnL9xkJxDsrgs1eq8TICnHrK/+A8EG1cjkNmpJ
ZoVeMkBwgYfXp7+pr+7f+CKeOsG4+lkPNRetuefwkaAy8mLmIPWGVdHlOZ8I
ug/eLGPCBHAberw7YojguZ/bjFuoW/uTvr9GvXtUkx5NvavHadu0fwmKqhRT
dlOXtqbLm6irqpczadQ2FUuXugwTNPVufneGuvJM93wV9cPtHuvLqQMKch27
qAdvZddqqNMOGr7MHyHYa1YRf5faNvnEtPfUvytSmx5S30jwFfuP0v0fXaY/
pw6L+SA6S30spjqik9q4tWhklLr3gORML/V/ul5LDg==
        "]]}, {
       Hue[0.08640786499873876, 0.6, 0.6], 
       LineBox[CompressedData["
1:eJwV1Hk01VsbB3CzBkKpcM85u1O3kBQqEbWfDIUk3DqUMispGVIKyTxfkaRB
dZOSJpK5VKheHSq6qPCGZSicc34VKYXu44+99vqstdfe32et79pcdz97Lwkx
MbEMXFO7fLazuJgYC5R7tfe0BAuo95Pje23RHbfq9D2PCujT3uyX/6DXVPiP
fkWHabef2yDOgnVOPSaKIQIqeOSgFy3BAokf2opWYQLa0G3rISPNgiFp/dDK
CAFNUjd9JjeDBZG2+kmpiQI67b56oqoyC+wdiywkLwhokYlLd48mC+as0JnG
PBbQCcmKVOP1LBBb7ldGuwXUtOKqwgp7FixNzrJtFBNSg4/jrm/2ssDH69/q
Jq6Qvtp4VFYqjAXprCT2ESqkc4h7eH86C7QaOT72zkL611BHnXseC46fbl2x
I1RIVw0c8/Z9wILXtM3DOlNIn7rEvtNoYsGWrlo3w0Ih/SZ7/2JgHwviD420
G9cJKTc3QJ83xgIpe9/jjz4I6Xj5pcuDs9iwcO3VCZlRIT32W7hbfhEbNlrE
x5XMENHcR7cEXQZsaNn5MVlqgYjyA37a2NiwQf/54dnvVoroKd5+GSt3Nmxz
Lfzmbi6i04qtUkeD2fAlaPPqfQ4iusDUer9uCp7v6ai23yui/VYPVdg5bHAJ
kF55IVhEb2ysOpdTxoaUz/OW3IgT0ZlBXX6l9WwQhsGh3gwRZasFzgvtZoPX
dsUmrysi2vhl8exX39hQ2/kqfv0dEQ2v8umunM6BgORD/9MqF9F2cU6kI+HA
9DFbM8taEX0fPHw4ZiUHkhkFm8kGEY3bs8bIzZIDH8bzy5taRXS5pVzzW2cO
HGtQb+Z3imjwbsmajkAO8AOjJjM/iqjfoHfEqQQONOrsLPZjcL78zxmt2Ry4
u1lZ33BURLOdpocWF3Ig3fnKTM9xEe2MS9Mzfc6Bt2tL009KMLS2x5C6tnEg
iqs0+E6WobwKO9byzxzYIBuuMU+eoUlPkm2SpAi0jZnPSlRiaMUD3rYIFQIZ
1c7bTsxlaNaKtKXqywkoHQ2z263K0HktQ9t3mRC4L1S5lMliqNlwiZ2JIwFP
oxT9m4ShvtJK3BpfAtxFY+usFjJ0jWWqeWMkAa175wSefzJU44fbBvUoAmtC
zLb7otXyVq8LRy950FV2GD0p9f9Vy6IJFDZ+9olDP3+i9WdCDIHV/rEJeWie
wQsJiCcwq0En5xM6SF3qSUEKAVtDqe17FjO0UDpk7cksAl8bXHu2LmGo97oc
vy50m7biDh6ae5ifq3uWAO9Ezotd6FO9agrNaBn7wAv70IdqH/SonCcwd91r
8Wi0fuRESk42gUdV4m3F6KrxiM6SKwRetjk9VFZn6JFV+cqyOQRmaCSfVEMv
P9Bk6Yie+71g9wL0pXZu8U+0wKVjUAsdUVmTQHMJtOg31pmgzY5K6b24TiB9
WU6GH5o/HB/TcYuAR2+r9zO0vd/kgmW3CRg53I3ko9sGg6pC0TFXH2W+Rg91
u42q3SGwryW54D1artHIe8ddAmNMf74QvfU2s7m1kMCFcaVKZQ2GNns6zGks
IVC7r2azC3pX18sCUkqgnxQ2eKD7nMys/dBnnvZbeKNH7XVjZ5XhfY06KwPQ
8zfM/G5dTqC7wPx1FHon+3Hbi0p8v75z8TV0Z8uSnNrHBMq/6Nv2o61mdoqr
PSGQm7IibRBdCllu/ugT4Xf4InTKLVkuu5oA/5XRiu9og8hPl4/UEDg9VFQq
q8nQtGU3L2o+I+B3I+2xOnpDtPa5k3wCdYpaVR7o2+V9P/rQ+zJHbPaiVUQX
HY3rCfib8Np90CLHWSoD6PluvT0B6PPLmTMmLwk4FBsVn0B/fV94+ttr7J8q
z/48+qrOqjSnFgK/yjUT6tHNItC8jV68/5LxK7TMnS0142i3Gl9BI9pHc+/I
xVYCYuqc9a1onYXnHbveYh903+R3oR/OEeN6tRGolhjMGZnK0yRXWYJ2kVwv
/x1N0lT/kmknkFI0HDiGjpJbGZuHjnofqzOJtpTeMzDQQeCKj12Q7FKGto7W
3zvYSeA2u5+jip5W8s7qMVq5JYH+gTY81Nej0IV5Waed2OhsZnLuPTRXrj+W
i3b/pBsy3E0gwCb6qiaaeZ9lcrSXgGqRuKQhesHZ3PY6dISMa9tatD3vXpBq
H/bjqvYdY3TpG/71SnSKu4o5oMPqJ2ZM9BNwj12zftNUniqPfyMHCJSl/9i+
DZ17X7GhHa0UkjSbh4abVU9XDxIYMg164YAOzppfOoC+WGW3xAndH1B/1k5A
oFfaLNsNHeV9NP0WWqIiV8sDzXZZnCQtJBDIdyvxRG+zPhFagXY3GS7bi65d
stKZyxAIUYg+5ot2ZnfxQtHy0Np+EP1zzt9bW9BjxkkG/mg98Y+Q+JlA8qt5
3YHof9rPL/ryhQD7epMoGB2eJjHwZIRAvLLFRARaLb6gW+0bgZ6IAekodMnx
XW1B6JJ9I9Oi0QKf0nqNUQJdzRaTMWgnc5+7ad8JWIr/upaAHjWanzeIVjD9
HpmIPqX39LLZDwIFpm6OSWg+4aT/QO+8FDGSjDb42XTI9SeB1OBfA6no5s/h
ByrRd/2Czp1E+3/U8lL+ReDBThfTNHRecyyvDh1E/o5LR5vU621dOE4gWrKJ
nEJ/qO7cFIY2ZhLuT3legaGhzgSB3wyPn4Euutavm4TOlz+45TR6S3bG0l60
vtkv/pRjEoV/nJ3E/29GSEnmVF8izit/RRdfObDwDPrhkU3y1r8JGLq8TZyy
o++I9HW08fPKoSkPe1yZ/I322THfIgv9H2oySBU=
        "]]}, {
       Hue[0.3224758424985268, 0.6, 0.6], 
       LineBox[CompressedData["
1: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
rxlIrwb/DxAy3hI=
        "]]}, {
       Hue[0.5585438199983166, 0.6, 0.6], 
       LineBox[CompressedData["
1:eJwV13k4VOsfAHBCdJGSW2jmvClbSVT2cF4kkmyV7EuSLZFsRdYshX7CvVKi
JJUsRcoaIZeULUtJZC2MQZZKjN/3/DXzec4887zLdztip7zMnNewsbHxsbOx
UZ/86XbwjYZbYzQtPpkxSNeayy4m4IzXC942xxhk/Uj6+7tgvzzBiwPgYNnP
aVrsNFyqcvHk6HEGyXh1cl/kGhr+87nXcMacQb4bNHFay0XDOpvZRTisGeQ1
KZ03fH/RsGB/shzNiUHyFEtdFRGiYYt93wnaBQZZpG0/OLyThiVkhKVGUxjk
CkfZdXVNGp7b0DhvXMwgdcruC8iZ0bBhUNCGjW0MUuXbskOHCw17XUv0FGAy
yJZDgdycwTR8veiA1xTPFLkJnQoZu0HDmQ61dh3iU+Sxyb7GUw9p+Nlqn/uS
5hSpMH7R1bOChvXPMRcOm0+R9fZRH6Xbafgxp2j96XNT5AJ38R2fURrmv1X1
uDVyihTLPq9k/puGHcVEQ1pSp8jl0ozMifV0bOUZ1nkmb4q8uDply7+Djj39
K9xvv5ois189YXxVoeNdB/vO67RPkW/PLxkZGdHx9OcfPZFDU2SSucdag1N0
nNX6vTd/dorkeW5wfTGAjgd7HotKsDPJbTqGHnvj6Vjpd49z4XomOWZQKUzP
omPtO/tl3WhM8tGhqrSsl3T8alYpeUGaSfL6fvV60UzHY++Edn/ZzyTpoj6b
gwbpOP+A/LEeTSbZNish2LJAx6pljk5m+kwypMp9sHwdgZUe0uImTZjkZ3Yi
3AIR+I15Y3KIJZP8FDDnd2U/gTdJLa+0OjDJ6DPKBxwPE/iDY6rRWlcmuecw
X2ePHYFNY+O3uJxjkgG2HLV9PgQunKdzVF9gkl4TrmFJsQS2tM+T/xbIJHke
zyR3pxO462ah+47LTDLdel3Q86cE1mDj+rs+jEkeDvxW8tczAnNF/X7eAV5M
eTPjAJadDDwyCDZpCT/DX0Tg24/pNiwwp9aS6ZliAv/iEOdTCWeSnpKT0sIv
COwlYPjoMVhz9l13UAWBtbaq90ZFMMmB6MR9Og0EFozw8Nx+hUma7a7LSQZX
5L76JgtuaF8QHQEbuhFWquACmjVH1H8EftjALWUCDi6S6GxoJLBYS4bjZbBw
f7mfQTOBl7/UWXWDTRVHS03bCJzrKHA6IopJ1g2rkg69BP6kp8dbF80kRXUK
/F+Cv6cdtn0P9s7aXrD+M4HZGGROD5jmyEuvAm+5yU9ngP37+5ZEvhBYSM0k
QyiGSUp/Cn3xYYDAG5XiZpzA8S1vZPVGCXwxO7HvD3hIVs05A7zVP0SAK5ZJ
qiQUpC+Ak7bEqq4Hjx5J5c0eI3D38zmfbWDNJtdxtu8Edis1CjoInq3jfVA+
QWBRScnha2DzMlPanhkCvxAa3LLxKpO8cE80IRTs//3BQ2Fw4tXhlTZwwUSz
3DZwk6XfwIVZAt89Te6UA6sv3cwq+0FgtfiBGkPwjgNfpXUXCNzHPxAZDZ6p
PKdos0TgMNcH9vNg/gfKOfng39Y+K0vgXQlsW1bBJ0Krk9mvMUkn26Rf9/7A
ecj0P14P7l4pqfi2DPE1rBcsDa7SXNG6sEpg5RdZ5VbgazVxRtc4ES5KoWWX
gQMYWZK9YFluU+Vq8GnhctZOLoRv23jW1YM1vL8XNIGl1RwbWsEzSFdgHTfC
I8FGAaNg81BWa8w6hNsSOaMF4pjkds3zplHrEa7k5rC1Awu4x+7sAv+a/rbe
Cbz8Tya7hADCC/VtZS7grqn3z+rBtPxnS97g2Du7BDk3IhxZ0igdCWYuD3dE
bEI4eA+/cg64rML8eJgwwtkf58W+Ub+/VzjdDRY791x/EmwRwxMnK4Lwzfs2
LtPgRbPy171gG12P+J9ghQm6nOJWhPeXZ/pxxzPJp8Kj6yboCAeEnnwjAQ5j
aTzABMKBQ9s9doKNR/7FqeBume88smBmoX7AQYTwUOXp3Qrg3Xp5IxnbEJ7u
09mkDX7kd6H62A6EFe9fdbQBB1q/s8oFq/RfiLEH62lJLLKJI9y0xe3BKfAY
X8/uArB/Q2CTK1g8W+0WjyTCHxsMinzBdzvY/aqkEdZ2zeGOA3uXWm0Q2omw
cm51QQKYzCh+4g6u6Zo/mgjud3Me2rIL9ke89P0HTGNvMvaRQTj3c6lTJjhV
LnGX1B6EBZ/dbnxGrT9DYzUAPO2t/74YXMs3+aERvFVYvLmE2u+47mV3OYRn
QjyKysCHsv+05ssjXG1hJvca3Cf4OJsFPsVKWKkF+4SbXzTei/Cq4Wp9PTjD
7tn2WXCOTjTZCF4UdvFT2I/wSXGN4RZwfIyQQRQ4665GUBt4++JrohscFHqJ
rwNs9IHWGKCAsFJ1nmgXOCehQ7RCEeGU0r/GesHqy6HTvEoIj1Vw6feBO9xl
623ARh907n8Bs/RiPVng9ynxul/B5ms0a7RUEL5a6qI6CmZ4T6YkgT2Lk5zH
wBEDN92GwZxnueO+gQsq5wSjVBH+4Nr+ehy8NuCxc6MawlbNrP4pcPqouZrI
AYT1pq93McH7jnMKuIOLfLzeTIPt9tqX8qojnD4mfmMW/GJSiNdYA+H1WYEf
58GGVrUDmWCxoay0BfBQo9fzGfCrreLHF8Hrc97aJmkibNKwp+QnOFsocN8w
2KKvzPoXWC1SgluBRFhAKfMP5TMOYU+7wFYrQVJL4OUW2ShJDM8F/IopJ2l8
tgwAF+U1q/wBvxJV4hDRQjivI0VuGXz86nCPG1iexXOP8sTPxLxy8PKfL7wr
4M1dkydstCE/ivPfU/7fSu9UMfiNV7YMC8wj+TaKVwfhTqeP4ZTDjMroTmDr
NIM2yr/9H5WUg6dEljevUvGSmXpU8CDC88ypE5Qn/osedQMXiIklUHaa8bv8
Gryv4t9Kyn3Czn+L6MJ91RuPUD6hdTzfG7z90FFOtgQm2eKmo9sIntNPpFE+
lLTvCzqEsHGXiCzl6nIxvwBwxNyEImWV4Q38reBnTziVKT/lZXsgqYdwK5er
POWdCtPqIeCydZu3U86y6e/sAgtUC/BR3hr1/qysPsInZM2Z1HpS8is5o8DD
1hONlPm6n6T3gSdN39+mHMW6paBwGOrNZjYXyizJa+/iwG5PI3dR9je+eHoY
7CtpOUad13SA67KaAcJ7QsNvUXa9ezIlCbxcs3KI8tfGQ7snwJI/Wiap+7Cc
VazXOgL5KbwYS7lDRMImDfxazZegbKAtND8DnrU1yKPut86dI17fEOEfMRf3
UVZP/rHjLlj/1ZpnVHzIjrQdMz6KMK+zVCoVPzl8NZM54LyBetZvMKFYGMkC
rw2qsaO8ITqhON8I4buS3dxUPMYWBB/hMkb4E/nDhIpf9h6PYRtwQ5x3EhXf
P6QMNvGZILzSnMqi8sHDRPWJE1igUXsn5ZFAaZ0KsN3a44Zz4K6mtRfcTaE/
ncwPovKp1KOuo9EM4bMPToZS+bg3pch92zGIN35TTwY4t/LemkCwZ2vpsUnw
bf6wfVLHEZbw6FlH5XNIoXpS1AmoNyqeW0fAP3tkdn0B6+QuvBui6i3b1loF
c4Qzr8z7D4IdTX/PDoMvBVg+7wcfnCsx1bZA+OXZvs6PVD2znzO5CU5u9zft
odbbLG/CBCdwdzVQ9etM9hOjW5YIlxd+vU3Vt6sn7h35YYVwrIvxdDO45WW8
bpYt1OdyW/UqKt/E3x78BbbwzdGtANsnch80skO4a1OtHlWPZ1wjtJfAjFo/
JapebxINJM0coL7Sx6vywBbBTqprnBB2Umr3u0X1k+93VSzAZgmlfDfB48f7
lQuo55Xh6VS/uCRrqWR1GuLJuiqH6id3+o32FzlD/8mYc46m6hNWkz3livDm
CZlEb7An10axWk/ojxnat0hw8FKWpeA5mCcO8MSqU+cxrZB0ChzytcRLlbqP
TxYcHF4Q35rvdu+n+l/+3VEdb4Sv8S/ZSoIdzOVz3/gg7PNlNZ0XbPbQeH9T
AML/dvcntUP/dkwf9BAJRNhcXaj6Pdj7xoVsN/BLncOjTeDrQal//3UR4l28
BNWCm40HfhpcQrjq0SPDIvDBX+cq3wUjLKWaFXMDrHz4um5bOMSH8s/oI2Dp
X45aUhEIj7PSbhwCiz5U1AgBuwwc/kcLzOL8orA7EuFzaZ0xyuCGGhnx2CuQ
7/mFIjvA5ipNa3AMwg5fD8/+gvnIV4qzpjAezmeHn38m+CnXJbX/pcL6NsTw
foR5zlUjy+srmKtJpqMdLOb3NnvvTYiP5PmkZnDSiKhAJ1jfYGFNNTVv1lUM
C9+CfEj/L/0BWCl8JT4rHe47w6z0PLhqOWyg5B70826hFC7w27mYK31PEK4v
fLSWBvOrmRdr2+48hEeHcyKEwL0TvlVB4NiPcr/5wJODjoui+Qj7FY10rcD8
zNd2wNWyAPY3zTg6ADbOmz7S/RTy5za/6j1w5+mTm9pKEN5BarCJgQe6JLPq
qhFePJkasAHm9fvyConWXfB/AgrPAyOhP1Q5fQgfh/7yMunEC3hfyS7e8O4z
WPzcgv5jMM6tqlecgP6kzKWUDg5I3fJiHPzPc7mVcPDY+eabpgyE7eXfkkfB
dZL77cSmYb4bGf53KBTyOXHNeM089KMyejIPWDSmcFB0Ae5PmlG1FMIkSy7b
9PqC58SjhhhghvuLZulFhNN8RUXawda67gWJPxHukWAcSAOrLLVfcFhC+Kn3
bwtpcOdMyNlycPdk/zZRsPc3GWehP9C/s+8M8YIfdkaZN4Jr/HOPTcP73OZC
VVX5FYTvGW5llICLHoztvQbOshyJeAg+mp68awS891fCpjTwlatTW2+yEL6S
HL09GLwt7JbQDzC7c89dT3Clvx6/4SrUq/N8IvZgC895rhywxn3JOBPwnNM9
1io4ZkTypxb4/2VBAiE=
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
    ImageSize -> {440., Automatic}, Method -> {}, 
    PlotRange -> {{7, 8}, {0.6, 1}}, PlotRangeClipping -> True, 
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
WindowSize->{929.2333333333333, 3608.},
Visible->True,
AuthoredSize->{929.2333333333333, 3608.},
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
Cell[1485, 35, 276, 5, 294, "Title"],
Cell[CellGroupData[{
Cell[1786, 44, 54, 0, 44, "Section"],
Cell[1843, 46, 1524, 46, 77, "Input"],
Cell[3370, 94, 337, 9, 16, "Input"],
Cell[CellGroupData[{
Cell[3732, 107, 651, 18, 77, "Input"],
Cell[4386, 127, 70, 0, 16, "Output"],
Cell[4459, 129, 70, 0, 16, "Output"],
Cell[4532, 131, 70, 0, 16, "Output"],
Cell[4605, 133, 74, 0, 16, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[4728, 139, 49, 0, 44, "Section"],
Cell[4780, 141, 3631, 120, 177, "Input"],
Cell[8414, 263, 768, 24, 37, "Input"],
Cell[9185, 289, 251, 8, 16, "Input"],
Cell[9439, 299, 51, 0, 16, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[9527, 304, 56, 0, 44, "Section"],
Cell[CellGroupData[{
Cell[9608, 308, 252, 4, 59, "Subsection"],
Cell[CellGroupData[{
Cell[9885, 316, 279, 9, 16, "Input"],
Cell[10167, 327, 72, 0, 16, "Output"]
}, Open  ]],
Cell[10254, 330, 71, 0, 16, "Input"],
Cell[10328, 332, 2907, 87, 117, "Input"],
Cell[CellGroupData[{
Cell[13260, 423, 364, 11, 16, "Input"],
Cell[13627, 436, 767, 19, 39, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[14431, 460, 699, 17, 37, "Input"],
Cell[15133, 479, 9378, 189, 206, "Output"]
}, Open  ]],
Cell[24526, 671, 1180, 34, 57, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[25743, 710, 264, 5, 59, "Subsection"],
Cell[CellGroupData[{
Cell[26032, 719, 4743, 133, 237, "Input"],
Cell[30778, 854, 13304, 274, 242, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[44131, 1134, 352, 5, 89, "Subsection"],
Cell[44486, 1141, 7080, 196, 317, "Input"],
Cell[CellGroupData[{
Cell[51591, 1341, 1738, 47, 117, "Input"],
Cell[53332, 1390, 44182, 799, 314, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[97563, 2195, 367, 6, 89, "Subsection"],
Cell[97933, 2203, 5972, 146, 297, "Input"],
Cell[103908, 2351, 421, 13, 16, "Input"],
Cell[104332, 2366, 928, 29, 37, "Input"],
Cell[CellGroupData[{
Cell[105285, 2399, 1053, 30, 37, "Input"],
Cell[106341, 2431, 43935, 795, 287, "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature 2uD8Pp#SYoifDCwqbD4c#0sY *)

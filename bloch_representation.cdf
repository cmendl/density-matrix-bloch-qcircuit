(* Content-type: application/vnd.wolfram.cdf.text *)

(*** Wolfram CDF File ***)
(* http://www.wolfram.com/cdf *)

(* CreatedBy='Mathematica 11.1' *)

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
NotebookDataPosition[      1064,         20]
NotebookDataLength[     15482,        474]
NotebookOptionsPosition[     14293,        431]
NotebookOutlinePosition[     14638,        446]
CellTagsIndexPosition[     14595,        443]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{
Cell[BoxData[
 RowBox[{
  RowBox[{"MatrixConjugate", "[", 
   RowBox[{"U_", ",", "rho_"}], "]"}], ":=", 
  RowBox[{"U", ".", "rho", ".", 
   RowBox[{"ConjugateTranspose", "[", "U", "]"}]}]}]], "Input",ExpressionUUID-\
>"84fda7c8-45e1-4b37-a5c3-3c3ae1bbbda3"],

Cell[BoxData[
 RowBox[{
  RowBox[{"S", "[", 
   RowBox[{"G_", ",", "rho_"}], "]"}], ":=", 
  RowBox[{
   RowBox[{"(", 
    RowBox[{
     RowBox[{"G", ".", "rho"}], "+", 
     RowBox[{"rho", ".", 
      RowBox[{"ConjugateTranspose", "[", "G", "]"}]}]}], ")"}], "/", 
   "2"}]}]], "Input",ExpressionUUID->"6afcc214-e701-4352-95cc-bb92ba152c62"],

Cell[BoxData[
 RowBox[{
  RowBox[{"A", "[", 
   RowBox[{"G_", ",", "rho_"}], "]"}], ":=", 
  RowBox[{"I", 
   RowBox[{
    RowBox[{"(", 
     RowBox[{
      RowBox[{"G", ".", "rho"}], "-", 
      RowBox[{"rho", ".", 
       RowBox[{"ConjugateTranspose", "[", "G", "]"}]}]}], ")"}], "/", 
    "2"}]}]}]], "Input",ExpressionUUID->"a5d51b80-fe4f-4a23-83fd-\
13d57038bb90"],

Cell[BoxData[
 RowBox[{
  RowBox[{"ApplyChannel", "[", 
   RowBox[{"Elist_", ",", "rho_"}], "]"}], ":=", 
  RowBox[{"Sum", "[", 
   RowBox[{
    RowBox[{"E", ".", "rho", ".", 
     RowBox[{"ConjugateTranspose", "[", "E", "]"}]}], ",", 
    RowBox[{"{", 
     RowBox[{"E", ",", "Elist"}], "}"}]}], "]"}]}]], "Input",ExpressionUUID->\
"48ad0137-4b4d-4263-93f6-4b14c227faf3"],

Cell[BoxData[
 RowBox[{
  RowBox[{"BlochRepresentationSingleQubit", "[", "op_", "]"}], ":=", 
  RowBox[{"Table", "[", 
   RowBox[{
    RowBox[{"FullSimplify", "[", 
     RowBox[{
      RowBox[{"Tr", "[", 
       RowBox[{
        RowBox[{"PauliMatrix", "[", "j", "]"}], ".", 
        RowBox[{"op", "[", 
         RowBox[{"PauliMatrix", "[", "k", "]"}], "]"}]}], "]"}], "/", "2"}], 
     "]"}], ",", 
    RowBox[{"{", 
     RowBox[{"j", ",", "0", ",", "3"}], "}"}], ",", 
    RowBox[{"{", 
     RowBox[{"k", ",", "0", ",", "3"}], "}"}]}], "]"}]}]], "Input",ExpressionU\
UID->"95db6b97-7c6e-4ab5-a75e-93c52ccb2de5"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"example", ":", " ", 
    RowBox[{
    "conjugation", " ", "by", " ", "the", " ", "Hadamard", " ", "gate"}]}], 
   " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"BlochRepresentationSingleQubit", "[", 
    RowBox[{
     RowBox[{"MatrixConjugate", "[", 
      RowBox[{
       RowBox[{"HadamardMatrix", "[", "2", "]"}], ",", "#"}], "]"}], "&"}], 
    "]"}], "//", "MatrixForm"}]}]], "Input",ExpressionUUID->"8559a3f2-c255-\
4d71-b491-19b4955e85ec"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {"1", "0", "0", "0"},
     {"0", "0", "0", "1"},
     {"0", "0", 
      RowBox[{"-", "1"}], "0"},
     {"0", "1", "0", "0"}
    },
    GridBoxAlignment->{
     "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, "Rows" -> {{Baseline}}, 
      "RowsIndexed" -> {}},
    GridBoxSpacings->{"Columns" -> {
        Offset[0.27999999999999997`], {
         Offset[0.7]}, 
        Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
        Offset[0.2], {
         Offset[0.4]}, 
        Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
  Function[BoxForm`e$, 
   MatrixForm[BoxForm`e$]]]], "Output",ExpressionUUID->"93b5af08-ef6f-4596-\
b896-f470ede2cf78"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"BlochRepresentationSingleQubit", "[", 
    RowBox[{
     RowBox[{"S", "[", 
      RowBox[{
       RowBox[{"HadamardMatrix", "[", "2", "]"}], ",", "#"}], "]"}], "&"}], 
    "]"}], "//", "MatrixForm"}]}]], "Input",ExpressionUUID->"d1aea7da-ee34-\
4ef0-b14c-66898a5dd4c3"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {"0", 
      FractionBox["1", 
       SqrtBox["2"]], "0", 
      FractionBox["1", 
       SqrtBox["2"]]},
     {
      FractionBox["1", 
       SqrtBox["2"]], "0", "0", "0"},
     {"0", "0", "0", "0"},
     {
      FractionBox["1", 
       SqrtBox["2"]], "0", "0", "0"}
    },
    GridBoxAlignment->{
     "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, "Rows" -> {{Baseline}}, 
      "RowsIndexed" -> {}},
    GridBoxSpacings->{"Columns" -> {
        Offset[0.27999999999999997`], {
         Offset[0.7]}, 
        Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
        Offset[0.2], {
         Offset[0.4]}, 
        Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
  Function[BoxForm`e$, 
   MatrixForm[BoxForm`e$]]]], "Output",ExpressionUUID->"aa5216b7-4727-4633-\
9571-356835242fe3"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"BlochRepresentationSingleQubit", "[", 
    RowBox[{
     RowBox[{"A", "[", 
      RowBox[{
       RowBox[{"HadamardMatrix", "[", "2", "]"}], ",", "#"}], "]"}], "&"}], 
    "]"}], "//", "MatrixForm"}]}]], "Input",ExpressionUUID->"6556e8ac-ed0e-\
43fb-ab95-96b7f0e5711a"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {"0", "0", "0", "0"},
     {"0", "0", 
      FractionBox["1", 
       SqrtBox["2"]], "0"},
     {"0", 
      RowBox[{"-", 
       FractionBox["1", 
        SqrtBox["2"]]}], "0", 
      FractionBox["1", 
       SqrtBox["2"]]},
     {"0", "0", 
      RowBox[{"-", 
       FractionBox["1", 
        SqrtBox["2"]]}], "0"}
    },
    GridBoxAlignment->{
     "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, "Rows" -> {{Baseline}}, 
      "RowsIndexed" -> {}},
    GridBoxSpacings->{"Columns" -> {
        Offset[0.27999999999999997`], {
         Offset[0.7]}, 
        Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
        Offset[0.2], {
         Offset[0.4]}, 
        Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
  Function[BoxForm`e$, 
   MatrixForm[BoxForm`e$]]]], "Output",ExpressionUUID->"3c52b977-72a3-4379-\
8bdb-d355b6380ed2"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"example", ":", " ", 
    RowBox[{"amplitude", " ", "damping", " ", "channel"}]}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"BlochRepresentationSingleQubit", "[", 
     RowBox[{
      RowBox[{"ApplyChannel", "[", 
       RowBox[{
        RowBox[{"{", 
         RowBox[{
          RowBox[{"DiagonalMatrix", "[", 
           RowBox[{"{", 
            RowBox[{"1", ",", 
             SqrtBox[
              RowBox[{"1", "-", "g"}]]}], "}"}], "]"}], ",", 
          RowBox[{"{", 
           RowBox[{
            RowBox[{"{", 
             RowBox[{"0", ",", 
              SqrtBox["g"]}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", "0"}], "}"}]}], "}"}]}], "}"}], ",", "#"}], 
       "]"}], "&"}], "]"}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"FullSimplify", "[", 
     RowBox[{"%", ",", 
      RowBox[{"Assumptions", "\[Rule]", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"0", "<", "g"}], ",", 
         RowBox[{"g", "<", "1"}]}], "}"}]}]}], "]"}], "//", 
    "MatrixForm"}]}]}]], "Input",ExpressionUUID->"9cb972de-522a-405a-b6ae-\
bc8cff385e97"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {"1", "0", "0", "0"},
     {"0", 
      SqrtBox[
       RowBox[{"1", "-", "g"}]], "0", "0"},
     {"0", "0", 
      SqrtBox[
       RowBox[{"1", "-", "g"}]], "0"},
     {"g", "0", "0", 
      RowBox[{"1", "-", "g"}]}
    },
    GridBoxAlignment->{
     "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, "Rows" -> {{Baseline}}, 
      "RowsIndexed" -> {}},
    GridBoxSpacings->{"Columns" -> {
        Offset[0.27999999999999997`], {
         Offset[0.7]}, 
        Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
        Offset[0.2], {
         Offset[0.4]}, 
        Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
  Function[BoxForm`e$, 
   MatrixForm[BoxForm`e$]]]], "Output",ExpressionUUID->"fd655eef-c0f8-4981-\
b371-d679b50d2cce"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"BlochRepresentationTwoQubits", "[", "op_", "]"}], ":=", 
  RowBox[{"Module", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{"pauli2", "=", 
      RowBox[{"Flatten", "[", 
       RowBox[{
        RowBox[{"Table", "[", 
         RowBox[{
          RowBox[{"KroneckerProduct", "[", 
           RowBox[{
            RowBox[{"PauliMatrix", "[", "j", "]"}], ",", 
            RowBox[{"PauliMatrix", "[", "k", "]"}]}], "]"}], ",", 
          RowBox[{"{", 
           RowBox[{"j", ",", "0", ",", "3"}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"k", ",", "0", ",", "3"}], "}"}]}], "]"}], ",", "1"}], 
       "]"}]}], "}"}], ",", 
    RowBox[{"Table", "[", 
     RowBox[{
      RowBox[{"FullSimplify", "[", 
       RowBox[{
        FractionBox["1", "4"], 
        RowBox[{"Tr", "[", 
         RowBox[{"sj", ".", 
          RowBox[{"op", "[", "sk", "]"}]}], "]"}]}], "]"}], ",", 
      RowBox[{"{", 
       RowBox[{"sj", ",", "pauli2"}], "}"}], ",", 
      RowBox[{"{", 
       RowBox[{"sk", ",", "pauli2"}], "}"}]}], "]"}]}], "]"}]}]], "Input",Expr\
essionUUID->"1318e337-ea82-46ba-87a9-382c3fbecdb7"],

Cell[BoxData[
 RowBox[{
  RowBox[{"Rxx", "[", "t_", "]"}], ":=", 
  RowBox[{"MatrixExp", "[", 
   RowBox[{
    RowBox[{"-", "\[ImaginaryI]"}], " ", "t", " ", 
    RowBox[{
     RowBox[{"KroneckerProduct", "[", 
      RowBox[{
       RowBox[{"PauliMatrix", "[", "1", "]"}], ",", 
       RowBox[{"PauliMatrix", "[", "1", "]"}]}], "]"}], "/", "2"}]}], 
   "]"}]}]], "Input",ExpressionUUID->"6df2842c-dc8a-428b-ba0a-f34c32409069"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"example", ":", " ", 
    RowBox[{"conjugation", " ", "by", " ", 
     RowBox[{"Rxx", "[", "t", "]"}]}]}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"BlochRepresentationTwoQubits", "[", 
    RowBox[{
     RowBox[{
      RowBox[{"Rxx", "[", "t", "]"}], ".", "#", ".", 
      RowBox[{"Rxx", "[", 
       RowBox[{"-", "t"}], "]"}]}], "&"}], "]"}], "//", 
   "MatrixForm"}]}]], "Input",ExpressionUUID->"7e6955bc-00c9-47d0-a61e-\
fb45b17e085e"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {"1", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", 
      "0", "0"},
     {"0", "1", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", 
      "0", "0"},
     {"0", "0", 
      RowBox[{"Cos", "[", "t", "]"}], "0", "0", "0", "0", 
      RowBox[{"-", 
       RowBox[{"Sin", "[", "t", "]"}]}], "0", "0", "0", "0", "0", "0", "0", 
      "0"},
     {"0", "0", "0", 
      RowBox[{"Cos", "[", "t", "]"}], "0", "0", 
      RowBox[{"Sin", "[", "t", "]"}], "0", "0", "0", "0", "0", "0", "0", "0", 
      "0"},
     {"0", "0", "0", "0", "1", "0", "0", "0", "0", "0", "0", "0", "0", "0", 
      "0", "0"},
     {"0", "0", "0", "0", "0", "1", "0", "0", "0", "0", "0", "0", "0", "0", 
      "0", "0"},
     {"0", "0", "0", 
      RowBox[{"-", 
       RowBox[{"Sin", "[", "t", "]"}]}], "0", "0", 
      RowBox[{"Cos", "[", "t", "]"}], "0", "0", "0", "0", "0", "0", "0", "0", 
      "0"},
     {"0", "0", 
      RowBox[{"Sin", "[", "t", "]"}], "0", "0", "0", "0", 
      RowBox[{"Cos", "[", "t", "]"}], "0", "0", "0", "0", "0", "0", "0", "0"},
     {"0", "0", "0", "0", "0", "0", "0", "0", 
      RowBox[{"Cos", "[", "t", "]"}], "0", "0", "0", "0", 
      RowBox[{"-", 
       RowBox[{"Sin", "[", "t", "]"}]}], "0", "0"},
     {"0", "0", "0", "0", "0", "0", "0", "0", "0", 
      RowBox[{"Cos", "[", "t", "]"}], "0", "0", 
      RowBox[{"-", 
       RowBox[{"Sin", "[", "t", "]"}]}], "0", "0", "0"},
     {"0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "1", "0", "0", "0", 
      "0", "0"},
     {"0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "1", "0", "0", 
      "0", "0"},
     {"0", "0", "0", "0", "0", "0", "0", "0", "0", 
      RowBox[{"Sin", "[", "t", "]"}], "0", "0", 
      RowBox[{"Cos", "[", "t", "]"}], "0", "0", "0"},
     {"0", "0", "0", "0", "0", "0", "0", "0", 
      RowBox[{"Sin", "[", "t", "]"}], "0", "0", "0", "0", 
      RowBox[{"Cos", "[", "t", "]"}], "0", "0"},
     {"0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", 
      "1", "0"},
     {"0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", 
      "0", "1"}
    },
    GridBoxAlignment->{
     "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, "Rows" -> {{Baseline}}, 
      "RowsIndexed" -> {}},
    GridBoxSpacings->{"Columns" -> {
        Offset[0.27999999999999997`], {
         Offset[0.7]}, 
        Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
        Offset[0.2], {
         Offset[0.4]}, 
        Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
  Function[BoxForm`e$, 
   MatrixForm[BoxForm`e$]]]], "Output",ExpressionUUID->"f925f7f6-8936-4ac0-\
9c47-3bec4eaa40ca"]
}, Open  ]]
},
WindowSize->{1132, 911},
WindowMargins->{{262, Automatic}, {85, Automatic}},
FrontEndVersion->"11.1 for Microsoft Windows (64-bit) (April 18, 2017)",
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
Cell[1464, 33, 258, 6, 30, "Input", "ExpressionUUID" -> \
"84fda7c8-45e1-4b37-a5c3-3c3ae1bbbda3"],
Cell[1725, 41, 342, 10, 30, "Input", "ExpressionUUID" -> \
"6afcc214-e701-4352-95cc-bb92ba152c62"],
Cell[2070, 53, 369, 12, 30, "Input", "ExpressionUUID" -> \
"a5d51b80-fe4f-4a23-83fd-13d57038bb90"],
Cell[2442, 67, 372, 10, 30, "Input", "ExpressionUUID" -> \
"48ad0137-4b4d-4263-93f6-4b14c227faf3"],
Cell[2817, 79, 612, 17, 30, "Input", "ExpressionUUID" -> \
"95db6b97-7c6e-4ab5-a75e-93c52ccb2de5"],
Cell[CellGroupData[{
Cell[3454, 100, 515, 14, 50, "Input", "ExpressionUUID" -> \
"8559a3f2-c255-4d71-b491-19b4955e85ec"],
Cell[3972, 116, 738, 21, 94, "Output", "ExpressionUUID" -> \
"93b5af08-ef6f-4596-b896-f470ede2cf78"]
}, Open  ]],
Cell[CellGroupData[{
Cell[4747, 142, 385, 10, 50, "Input", "ExpressionUUID" -> \
"d1aea7da-ee34-4ef0-b14c-66898a5dd4c3"],
Cell[5135, 154, 884, 28, 139, "Output", "ExpressionUUID" -> \
"aa5216b7-4727-4633-9571-356835242fe3"]
}, Open  ]],
Cell[CellGroupData[{
Cell[6056, 187, 385, 10, 50, "Input", "ExpressionUUID" -> \
"6556e8ac-ed0e-43fb-ab95-96b7f0e5711a"],
Cell[6444, 199, 932, 30, 139, "Output", "ExpressionUUID" -> \
"3c52b977-72a3-4379-8bdb-d355b6380ed2"]
}, Open  ]],
Cell[CellGroupData[{
Cell[7413, 234, 1189, 36, 81, "Input", "ExpressionUUID" -> \
"9cb972de-522a-405a-b6ae-bc8cff385e97"],
Cell[8605, 272, 831, 25, 106, "Output", "ExpressionUUID" -> \
"fd655eef-c0f8-4981-b371-d679b50d2cce"]
}, Open  ]],
Cell[9451, 300, 1143, 32, 84, "Input", "ExpressionUUID" -> \
"1318e337-ea82-46ba-87a9-382c3fbecdb7"],
Cell[10597, 334, 426, 11, 30, "Input", "ExpressionUUID" -> \
"6df2842c-dc8a-428b-ba0a-f34c32409069"],
Cell[CellGroupData[{
Cell[11048, 349, 513, 14, 50, "Input", "ExpressionUUID" -> \
"7e6955bc-00c9-47d0-a61e-fb45b17e085e"],
Cell[11564, 365, 2713, 63, 298, "Output", "ExpressionUUID" -> \
"f925f7f6-8936-4ac0-9c47-3bec4eaa40ca"]
}, Open  ]]
}
]
*)

(* NotebookSignature DvTf4f#ryA2bEAKsi7NqksVs *)

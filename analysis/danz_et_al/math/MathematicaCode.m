(*
# Belief Elicitation and Behavioral Incentive Compatibility
----------------------------------------------------------------------------------------------
## Mathematica Figure Code

## Preliminaries
Set directory as one directory down from notebook disk location
*)
SetDirectory[".."];

SetJupyterOutput[Automatic]; (* auto-detect the best or revert to default *)
SetJupyterOutput["SVG"];

(*
#### Labeling:
Text label functions:
*)
Tm[text_, mag_] := Style[text, Directive[{FontFamily -> Times, Round[14*mag], Black}]]
Mm[text_, mag_] := Style[ToExpression[text, TeXForm, HoldForm], 
  Directive[{FontFamily -> Times, Round[14*mag], Black}]]
LInt[x_, y_] := Rotate[Tm["[" <> ToString[x] <> "," <> ToString[y] <> ")", 2], rot*Degree]
RInt[x_, y_] := Rotate[Tm["(" <> ToString[x] <> "," <> ToString[y] <> "]", 2], rot*Degree]

(*
## Belief Reports
----------------------------------------------------------------------------------------------
## Read in Data
*)

AllBeliefData = Import["data/data-bsr-qsr.csv", "CSV", "HeaderLines" -> 1];
AllBeliefVars = Import["data/data-bsr-qsr.csv", "CSV"][[1]];
TableForm[Table[{i, AllBeliefVars[[i]]}, {i, 1, Length@AllBeliefVars}], TableHeadings -> {None, {"Index", "Variable"}}]
BSRBeliefData = Cases[AllBeliefData,{_,_,1,___}];

(*Read in {treatment, subjectid, period, belief1, post1} only for the BSR data:*)
DataPriors = BSRBeliefData[[All, {4, 5, 8, 15, 18}]];

InfPriors = Cases[DataPriors, {1, ___}][[All, {4, 5}]];
RCLPriors = Cases[DataPriors, {2, ___}][[All, {4, 5}]];
NoInfPriors = Cases[DataPriors, {3, ___}][[All, {4, 5}]];

(*Bin Specifications for the figure:*)
BinSpec20 = {{-20.5, -10.5, -0.5, 0.5, 10.5, 20.5, 30.5, 40.5, 50.5, 
     60.5, 70.5, 80.5} + 20};
BinSpec30 = {{-30.5, -20.5, -10.5, -0.5, 0.5, 10.5, 20.5, 30.5, 40.5, 
     50.5, 60.5, 70.5} + 30};

(*Create `PositionIn` function that enumerates a list:*)
PositionsIn[ListIn_] := Table[{i, ListIn[[i]]}, {i, 1, Length[ListIn]}]

ss = -2; (* This is the location for the truth in x-dimension *)
rot=45;
HistData20 = PositionsIn /@ {
    BinCounts[#, BinSpec20]/Length[#] &@Cases[NoInfPriors, {_, 20}][[All, 1]], 
    BinCounts[#, BinSpec20]/Length[#] &@Cases[InfPriors, {_, 20}][[All, 1]], 
    BinCounts[#, BinSpec20]/Length[#] &@Cases[RCLPriors, {_, 20}][[All, 1]]  };
HistData30 = PositionsIn /@ {
BinCounts[#, BinSpec30]/Length[#] &@Cases[NoInfPriors, {_, 30}][[All, 1]] , 
BinCounts[#, BinSpec30]/Length[#] &@Cases[InfPriors, {_, 30}][[All, 1]] , 
BinCounts[#, BinSpec30]/Length[#] &@Cases[RCLPriors, {_, 30}][[All, 1]] };

r = 0.15; (* Rescale the 100% Truth to the historgram on main axis*)
Reshuffler20[InData_] := {If[#[[1]] == 3, ss, If[#[[1]] > 3, #[[1]] - 1, #[[1]]]], If[#[[1]] == 3, #[[2]]*r/1, #[[2]]]} & /@ InData
Reshuffler30[InData_] := {If[#[[1]] == 4, ss, If[#[[1]] > 4, #[[1]] - 1, #[[1]]]], If[#[[1]] == 4, #[[2]]*r/1, #[[2]]]} & /@ InData

HistDataAlt20 = {Reshuffler20@HistData20[[1]], Reshuffler20@HistData20[[2]], Reshuffler20@HistData20[[3]]};
HistDataAlt30 = {Reshuffler30@HistData30[[1]], Reshuffler30@HistData30[[2]], Reshuffler30@HistData30[[3]]};

(*### Figure Options*)
Frame20Alt = Join[{{1, LInt[0, 0.1]}, {2, LInt[0.1, 0.2]}}, Table[{i - 1, RInt[(i - 2)/10.0, (i - 1)/10.0]}, {i, 4, 11}]];
Frame30Alt = Join[{{1, LInt[0, 0.1]}, {2, LInt[0.1, 0.2]}, {3, LInt[0.2, 0.3]}}, Table[{i - 1, RInt[(i - 2)/10.0, (i - 1)/10.0]}, {i, 5, 11}]];

FrameMass20 = Join[{{1, Tm["0", 2]}, {2, Tm["0.1", 2]}}, Table[{i, Tm[ToString[i/10.0], 2]}, {i, 3, 10}]];
FrameMass30 = Join[{{1, Tm["0", 2]}, {2, Tm["0.1", 2]}, {3, Tm["0.2", 2]}}, Table[{i, Tm[ToString[i/10.0], 2]}, {i, 4, 10}]];

(*Point Styling*)
DrawDiskInf[pos_] := Inset[Graphics[{FaceForm[Gray], EdgeForm[{Black, AbsoluteThickness[2]}], Disk[{0, 0}, 1], Point[{0, 0}]}, 
PlotRange -> {{-1.1, 1.1}, {-1.1, 1.1}}], pos, {0, 0}, 0.3]
DrawDiskNoInf[pos_] := Inset[Graphics[{FaceForm[White], EdgeForm[{Black, AbsoluteThickness[2]}], RegularPolygon[4], Point[{0, 0}]}, 
PlotRange -> {{-1.1, 1.1}, {-1.1, 1.1}}], pos, {0, 0}, 0.5, {{-1, 1}, {1, 1}}]
  DrawDiskRCL[pos_] := Inset[Graphics[{FaceForm[Gray], EdgeForm[{Black, AbsoluteThickness[2]}], Rotate[RegularPolygon[3], 180 Degree, {0, 0}], 
Point[{0, 0}]}, PlotRange -> {{-1.1, 1.1}, {-1.1, 1.1}}], pos, {0, 0}, 0.5]

FrameTicksError = Table[{i/100, Tm[ToString[i] <> "%", 3]}, {i, 0, 15, 5}];
FrameTicksExact = Table[{i/100, Tm[ToString[i] <> "%", 3]}, {i, 0, 75, 25}];
FrameTicks20 = Table[{i/100, Tm[ToString[i] <> "%", 3]}, {i, 0, 15, 5}];

(*Figure location parameters*)
spacingX = 0.4;
gg = 0.25;
sf = -2.5;
r = 0.15;
rot=0;

(*
### Figure 5: Proportion truthful, and distribution of response for false reports
* Figure 5(A) Prior of 0.2
* Figure 5(B) Prior of 0.3 
*)

Frame20Alt = Join[{{1, LInt[0, 0.1]}, {2, LInt[0.1, 0.2]}}, Table[{i - 1, RInt[(i - 2)/10.0, (i - 1)/10.0]}, {i, 4, 11}]];
Frame30Alt = Join[{{1, LInt[0, 0.1]}, {2, LInt[0.1, 0.2]}, {3, LInt[0.2, 0.3]}}, Table[{i - 1, RInt[(i - 2)/10.0, (i - 1)/10.0]}, {i, 5, 11}]];
Dist20Three[Title_:None]:=Graphics[{Black, AbsoluteThickness[2], 
  Table[Line[{{i - spacingX, -0.003}, {i - spacingX, -0.001}, {i + spacingX, -0.001}, {i + spacingX, -0.003}}], {i, 1, 10}], 
  Table[Line[{{i - spacingX, -0.003}, {i - spacingX, -0.001}, {i + spacingX, -0.001}, {i + spacingX, -0.003}}], {i, -2, -2}], 
  Line[{{0.25, 0}, {0.25, 0.16}}], Line[{{sf - 0.25, 0}, {sf - 0.25, 0.16}}], 
  Line[{{sf - 0.4, #}, {sf - 0.25, #}}] & /@ {r/4, r/2, 3*r/4, r}, Line[{{0.1, #}, {0.25, #}}] & /@ {0, 0.05, 0.1, 0.15},
  Gray, AbsoluteDashing[{2, 3}], 
  Line[{{0.25, #}, {11, #}}] & /@ {0.05, 0.1, 0.15}, Line[{{sf - 0.25, #}, {sf + 1.25, #}}] & /@ {r/4, r/2, 3*r/4, r}, PointSize[0.015],
  (* Data Plot *)
  FaceForm[Gray], EdgeForm[{Black, AbsoluteThickness[2]}], 
  Rectangle[{#[[1]] - spacingX, 0}, {#[[1]] - spacingX/3, #[[2]]}] & /@ HistDataAlt20[[2]], (*Information*)
  FaceForm[Lighter[Gray, 0.5]], EdgeForm[{Black, AbsoluteThickness[2]}], 
  Rectangle[{#[[1]] - spacingX/3, 0}, {#[[1]] + spacingX/3, #[[2]]}] & /@ HistDataAlt20[[3]],  (*RCL*)
   FaceForm[White], EdgeForm[{Black, AbsoluteThickness[2]}], 
  Rectangle[{#[[1]] + spacingX/3, 0}, {#[[1]] + spacingX, #[[2]]}] & /@ HistDataAlt20[[1]],  (*No Information*)
   AbsoluteThickness[1], AbsoluteDashing[None], Arrowheads[{-0.01, 0.01}], Black,
   
   Arrow[{{3 - spacingX, 0.165}, {5 + spacingX, 0.165}}], Inset[Tm["To center", 2], {4, 0.17}], 
   Arrow[{{1 - spacingX, 0.165}, {2 + spacingX, 0.165}}], Inset[Tm["To near extreme", 2], {1.5, 0.17}],  
   Arrow[{{6 - spacingX, 0.165}, {10 + spacingX, 0.165}}], Inset[Tm["To distant extreme", 2], {8, 0.17}], 
  Inset[#[[2]], {#[[1]] , -0.004}, {0, 1}] & /@ Frame20Alt, 
  Inset[Tm["Truthful reports", 3], {sf + 0.4,  -0.014}],
  Inset[Tm["100%", 2],  {sf - 0.45, r}, {1, 0}], 
  Inset[Tm["75%", 2],   {sf - 0.45, 3*r/4}, {1, 0}], 
  Inset[Tm["50%", 2],   {sf - 0.45, r/2}, {1, 0}], 
  Inset[Tm["25%", 2],   {sf - 0.45, r/4}, {1, 0}], 
  Inset[Tm["15%", 2],   {0, 0.15}, {1, 0}], 
  Inset[Tm["10%", 2],   {0, 0.1}, {1, 0}], 
  Inset[Tm["5%", 2],    {0, 0.05}, {1, 0}], 
  Inset[Rotate[Tm["Observed fraction of reports", 3], 90 Degree], {sf-1.1, 0.075}, {0, 0}], 
    Inset[Tm["False reports", 3], {5, -0.018}, {0, 0}], 
  Gray, AbsoluteThickness[2], AbsoluteDashing[{1, 4}], Line[{{-0.99, -0.02}, {-0.99, 0.165}}]}, PlotRange -> {{-4, 10.5}, {-0.025, 0.178}},
  AspectRatio -> 1/3, ImageSize -> 2048,PlotLabel-> Title]
  
  Dist30Three[ Title_:None, drawLegend_:False, lStartH_:8,lStartV_:0.12 , lw_:2,lh_:0.05 ]:=Graphics[{Black, AbsoluteThickness[2], 
  Table[Line[{{i - spacingX, -0.003}, {i - spacingX, -0.001}, {i + spacingX, -0.001}, {i + spacingX, -0.003}}], {i, 1, 10}], 
  Table[Line[{{i - spacingX, -0.003}, {i - spacingX, -0.001}, {i + spacingX, -0.001}, {i + spacingX, -0.003}}], {i, -2, -2}], 
  Line[{{0.25, 0}, {0.25, 0.16}}], Line[{{sf - 0.25, 0}, {sf - 0.25, 0.16}}], 
  Line[{{sf - 0.4, #}, {sf - 0.25, #}}] & /@ {r/4, r/2, 3*r/4, r}, Line[{{0.1, #}, {0.25, #}}] & /@ {0, 0.05, 0.1, 0.15},
  Gray, AbsoluteDashing[{2, 3}], 
  Line[{{0.25, #}, {11, #}}] & /@ {0.05, 0.1, 0.15}, Line[{{sf - 0.25, #}, {sf + 1.25, #}}] & /@ {r/4, r/2, 3*r/4, r}, PointSize[0.015],
  (* Data Plot *)
  FaceForm[Gray], EdgeForm[{Black, AbsoluteThickness[2]}], 
  Rectangle[{#[[1]] - spacingX, 0}, {#[[1]] - spacingX/3, #[[2]]}] & /@ HistDataAlt30[[2]],
  FaceForm[Lighter[Gray, 0.5]], EdgeForm[{Black, AbsoluteThickness[2]}], 
  Rectangle[{#[[1]] - spacingX/3, 0}, {#[[1]] + spacingX/3, #[[2]]}] & /@ HistDataAlt30[[3]],
  FaceForm[White], EdgeForm[{Black, AbsoluteThickness[2]}], 
  Rectangle[{#[[1]] + spacingX/3, 0}, {#[[1]] + spacingX, #[[2]]}] & /@ HistDataAlt30[[1]], FaceForm[White], Arrowheads[0.02], 
   AbsoluteThickness[1], AbsoluteDashing[None],Arrowheads[{-0.01, 0.01}], Black, 
   Arrow[{{4 - spacingX, 0.165}, {5 + spacingX, 0.165}}], Inset[Tm["To center", 2], {4.5, 0.17}], 
   Arrow[{{1 - spacingX, 0.165}, {3 + spacingX, 0.165}}], Inset[Tm["To near extreme", 2], {2, 0.17}],  
   Arrow[{{6 - spacingX, 0.165}, {10 + spacingX, 0.165}}], Inset[Tm["To distant extreme", 2], {8, 0.17}], 
  Inset[#[[2]], {#[[1]] , -0.004}, {0, 1}] & /@ Frame30Alt, 
  Inset[Tm["Truthful reports", 3], {sf + 0.4,  -0.014}],
  Inset[Tm["100%", 2], {sf - 0.45, r}, {1, 0}], 
  Inset[Tm["75%", 2], {sf - 0.45, 3*r/4}, {1, 0}], 
  Inset[Tm["50%", 2], {sf - 0.45, r/2}, {1, 0}], 
  Inset[Tm["25%", 2], {sf - 0.45, r/4}, {1, 0}], 
  Inset[Tm["15%", 2], {0, 0.15}, {1, 0}], 
  Inset[Tm["10%", 2], {0, 0.1}, {1, 0}], 
  Inset[Tm["5%", 2], {0, 0.05}, {1, 0}], 
  Inset[Rotate[Tm["Observed fraction of reports", 3], 90 Degree], {sf-1.1, 0.075}, {0, 0}], 
  Inset[Tm["False reports", 3], {5, -0.018}, {0, 0}], 
  Gray, AbsoluteThickness[2], AbsoluteDashing[{1, 4}], Line[{{-0.99, -0.02}, {-0.99, 0.165}}],
  If[drawLegend,{ FaceForm[White], EdgeForm[{Black, AbsoluteThickness[2]}],Rectangle[{lStartH,lStartV},{lStartH+2,lStartV+lh}], 
   FaceForm[Gray], EdgeForm[{Black, AbsoluteThickness[2]}],
  Rectangle[{lStartH+lw/10,lStartV+7*lh/10},{lStartH+2.25*lw/10,lStartV+9*lh/10}],
   Inset[Tm["Information", 2], {lStartH+2.6*lw/10,lStartV+8*lh/10}, {-1, 0}], 
  FaceForm[Lighter[Gray, 0.5]], EdgeForm[{Black, AbsoluteThickness[2]}],
  Inset[Tm["RCL", 2], {lStartH+2.6*lw/10,lStartV+5*lh/10}, {-1, 0}], 
  Rectangle[{lStartH+lw/10,lStartV+4*lh/10},{lStartH+2.25*lw/10,lStartV+6*lh/10}],
  FaceForm[White], EdgeForm[{Black, AbsoluteThickness[2]}], 
  Inset[Tm["No Information", 2], {lStartH+2.6*lw/10,lStartV+2*lh/10}, {-1, 0}], 
  Rectangle[{lStartH+lw/10,lStartV+1*lh/10},{lStartH+2.25*lw/10,lStartV+3*lh/10}]
  }
  
  ,{}]
  }, PlotRange -> {{-4, 10.5}, {-0.025, 0.178}},
 AspectRatio -> 1/3, ImageSize -> 2048,PlotLabel-> Title]
{#, Export["figures/pdf/Figure5combined-30.pdf", #],Export["figures/svg/Figure5combined-30.svg", #],Export["figures/eps/Figure5combined-30.eps", #]}& @ Dist30Three[None,True, 8,0.11,2,0.05]  
{#,Export["figures/pdf/Figure5combined-20.pdf", #]Export["figures/svg/Figure5combined-20.svg", #],Export["figures/eps/Figure5combined-20.eps", #]}& @ Dist20Three[]


(* ### Posterior Figures*)
StackedPosteriors=Join[Join[#,{2}]&/@BSRBeliefData[[All,{4,16,19,6,7}]],Join[#,{3}]&/@BSRBeliefData[[All,{4,17,20,6,7}]]];
(* Treatment files by: belief, bayes, scenario_order, scenarioid, guess_number*)
InfPosteriors=Cases[StackedPosteriors,{1,___}][[All,{2,3,4,5,6}]];
NoInfPosteriors=Cases[StackedPosteriors,{3,___}][[All,{2,3,4,5,6}]];
Slist=Union@InfPosteriors[[All,{3,4,5}]];(* Select out just the Scenario identifiers*)
Do[Sid[Slist[[i]]]=i,{i,1,Length@Slist}](*Enumerate scenariors*)


(*Calculate the distance between each report and the Bayesian posterior:*)
InfDist=SmoothKernelDistribution[Abs[#[[1]]-#[[2]]]&/@InfPosteriors[[All,{1,2}]],0.01];
NoInfDist=SmoothKernelDistribution[Abs[#[[1]]-#[[2]]]&/@NoInfPosteriors[[All,{1,2}]],0.05];

(*#### Appendix Figure A.2: Proportion of posterior reports by distance from Bayesian posterior*)
{#, Export["figures/pdf/Figure_A2.pdf", #],Export["figures/svg/Figure_A2.svg", #], Export["figures/eps/Figure_A2.eps", #]} &@Plot[{1-CDF[InfDist,x],1-CDF[NoInfDist,x]}, {x,10,40},
PlotStyle->{{Black, AbsoluteThickness[2]},{Gray, AbsoluteThickness[2],AbsoluteDashing[{10,5}]}},
AspectRatio -> 1, ImageSize ->1024, 
 Frame -> {True, True, False, False}, Prolog->{Gray,Dotted,AbsoluteThickness[1],Line[{{15,0},{15,0.5}}]},
 Epilog-> {Black, AbsoluteThickness[2], Line[{{25,0.4},{27.5,0.4}}], Inset[Tm["Information", 2],{28,0.4},{-1,0}], Gray, AbsoluteDashing[{10,5}], Line[{{25,0.375},{27.5,0.375}}],Inset[Tm["No Information", 2],{28,0.375},{-1,0}] },
 FrameTicks -> {
 {{10, Tm["0.1", 2]}, {20, Tm["0.20", 2]}, {30, Tm["0.3", 2]},{40, Tm["0.4", 2]}}
 ,{{0, Tm["0", 2]},{0.10, Tm["0.1", 2]}, {0.20, Tm["0.20", 2]}, {0.30, Tm["0.3", 2]},{0.40, Tm["0.4", 2]},{0.50, Tm["0.5", 2]}} },
 FrameLabel -> {Tm["Deviation size, x",3], Tm["Fraction of data with |q-\[Pi]|>x", 3], None, None  }, FrameTicksStyle -> Directive[{Black,16}]
 ]
 
 
Do[
(* Store as Data for the scenario and the bayesian posterior,quartiles*)
 InfScenario[Sid[S]] =Join[{#[[All,1]],#[[1,2]]},Quartiles[#[[All,1]]]]&@Cases[InfPosteriors,{_,_,S[[1]],S[[2]],S[[3]]}][[All,{1,2}]];
 NoInfScenario[Sid[S]] =Join[{#[[All,1]],#[[1,2]]},Quartiles[#[[All,1]]]]&@Cases[NoInfPosteriors,{_,_,S[[1]],S[[2]],S[[3]]}][[All,{1,2}]];
 ,{S,Slist}]


f[x_]:=x[[1]]-(x[[3]]-x[[2]])*(x[[1]]-50)/10000
InfOrder=OrderingBy[Table[Append[InfScenario[i][[{2,3,5}]],i],{i,1,60}],f];
InfQ=Table[Append[InfScenario[i][[{2,3,5}]],i],{i,1,60}][[InfOrder]];
NoInfQ=Table[Append[NoInfScenario[i][[{2,3,5}]],i],{i,1,60}][[InfOrder]];


(*#### Appendix Figure A3: Interquartile range by elicitation*)
DrawBayes[pos_] := Inset[Graphics[{FaceForm[Red], EdgeForm[Directive[{Black, AbsoluteThickness[1]}]], RegularPolygon[4], Red,Point[{0, 0}]}, 
PlotRange -> {{-1.1, 1.1}, {-1.1, 1.1}}], pos, {0, 0}, 0.75,{{-1, 1}, {1, 1}}]
DrawBayes[pos_] := Inset[Graphics[{FaceForm[Darker[Gray,0.5]], EdgeForm[Directive[{Black, AbsoluteThickness[1]}]], Disk[{0,0},{1,1}]}, 
PlotRange -> {{-1.1, 1.1}, {-1.1, 1.1}}], pos, {0, 0}, 0.75]

{#, Export["figures/pdf/Figure_A3.pdf", #],Export["figures/svg/Figure_A3.svg", #], Export["figures/eps/Figure_A3.eps", #]} &@Graphics[
 {Gray, AbsoluteDashing[{1, 3}], Line[{{0, 50}, {61, 50}}], 
  AbsoluteDashing[None],FaceForm[Gray], EdgeForm[Directive[{Black, AbsoluteThickness[1]}]],
  (* Draw the Information 80% Region *)
  Table[Rectangle[{i - 0.4, InfQ[[i, 2]] }, {i + 0.4, InfQ[[i,3]] },RoundingRadius -> 0.8], {i, 1, Length[InfQ]}], Black, PointSize[0.005],
  (* Draw the No Information 80% Region *)
  FaceForm[Lighter[White, 0.6]], EdgeForm[Directive[{Black, AbsoluteThickness[1]}]],
  Table[Rectangle[{i - 0.2, NoInfQ[[i,2]]}, {i + 0.2, NoInfQ[[i,3]]}, RoundingRadius -> 0.4], {i, 1, Length[NoInfQ]}], Black, PointSize[0.008],
  (* Draw the Bayesian Belief Point *)
  Red,Table[DrawBayes[{i, InfQ[[i, 1]]}], {i, 1, Length[InfQ]}],
  Inset[Graphics[{FaceForm[Gray], EdgeForm[Directive[{Black, AbsoluteThickness[1]}]], Rectangle[{-1, -1} {1, 1}, RoundingRadius -> 0.33]}], {45,  20 }, {0, 0}, 2], Inset[Tm["Information", 2], {45.5,20}, {-1, 1}],
  Inset[Graphics[{FaceForm[White], EdgeForm[Directive[{Black, AbsoluteThickness[1]}]], Rectangle[{-1, -1} {1, 1}, RoundingRadius -> 0.33]}], {45,  14 }, {0, 0}, 2], Inset[Tm["No Information", 2], {45.5, 14 }, {-1, 1}], 
  Red, PointSize[0.008],DrawBayes[{44, 6}], Inset[Tm["Bayesian posterior", 2], {45.5, 6}, {-1, 0}]}, AspectRatio -> 1, ImageSize -> 1400, 
 Frame -> {True, True, False, False}, FrameTicks -> { None, {{0, Tm["0.", 2]}, {25, Tm["0.25", 2]}, {50, Tm["0.5", 2]}, {75, Tm["0.75", 2]}, {100, Tm["1.", 2]}}, None, None },
 FrameLabel -> {Tm["Eliciation scenario (ordered by Bayesian belief)",3], Tm["Interquartile range for posterior", 3], None, None  }, FrameTicksStyle -> Directive[{Black, 16}]]


(*Calculate the symmetrized prior locations: *)
InfM50 = N@Mean[Boole[#[[1]] == 50] & /@Cases[InfPriors,{_,b_}/; b==50] ];
InfM20 = N@Mean[Boole[#[[1]] == 50] & /@Cases[InfPriors,{_,b_}/; b==20 || b==80] ];
InfM30 = N@Mean[Boole[#[[1]] == 50] & /@Cases[InfPriors,{_,b_}/; b==30 || b==70] ];

NoInfM50 = N@Mean[Boole[#[[1]] == 50] & /@Cases[NoInfPriors,{_,b_}/; b==50] ];
NoInfM20 = N@Mean[Boole[#[[1]] == 50] & /@Cases[NoInfPriors,{_,b_}/; b==20 || b==80] ];
NoInfM30 = N@Mean[Boole[#[[1]] == 50] & /@Cases[NoInfPriors,{_,b_}/; b==30 || b==70] ];


(*Calculate the kernel-smoothed probability of announcing the midpoint (symmetrized) using triangular kernel*)
ClearAll[\[Phi],InfMiddleF,NoInfMiddleF]
\[Phi][x_, \[Mu]_, \[Sigma]_] := If[ Abs[\[Mu] - x] < \[Sigma], 1 - Abs[\[Mu] - x]/\[Sigma] , 0]
\[Sigma]1 = 10;
\[Delta] = 0;

InfMiddleF = Total[Boole[#[[1]] >= 50 - \[Delta] && #[[1]] <= 50 + \[Delta] ]*\[Phi][If[z <= 50, Min[#[[2]], 100 - #[[2]]  ] , Max[#[[2]], 100 - #[[2]]  ] ], z, \[Sigma]1] & /@ InfPosteriors]/Total[\[Phi][If[z <= 50, Min[#[[2]], 100 - #[[2]]  ] , Max[#[[2]], 100 - #[[2]]  ] ], z, \[Sigma]1] & /@ InfPosteriors];
  
NoInfMiddleF = Total[Boole[#[[1]] >= 50 - \[Delta] && #[[1]] <= 50 + \[Delta] ]*\[Phi][If[z <= 50, Min[#[[2]], 100 - #[[2]]  ] , Max[#[[2]], 100 - #[[2]]  ] ], z, \[Sigma]1] & /@ NoInfPosteriors]/Total[\[Phi][If[z <= 50, Min[#[[2]], 100 - #[[2]]  ] , Max[#[[2]], 100 - #[[2]]  ] ], z, \[Sigma]1] & /@ NoInfPosteriors];

(*Define point styling for the priors*)
DrawDiskInf[pos_] := Inset[Graphics[{FaceForm[Gray], EdgeForm[Directive[{Black, AbsoluteThickness[2]}]], Disk[{0, 0}, 1], Point[{0, 0}]}, 
PlotRange -> {{-1.1, 1.1}, {-1.1, 1.1}}], pos, {0, 0}, 2]
DrawDiskNoInf[pos_] := Inset[Graphics[{FaceForm[White], EdgeForm[Directive[{Black, AbsoluteThickness[2]}]], RegularPolygon[4], Point[{0, 0}]}, 
PlotRange -> {{-1.1, 1.1}, {-1.1, 1.1}}], pos, {0, 0}, 2, {{-1, 1}, {1, 1}}]

(*#### Figure 7 Exact Center Reports*)
BeliefTicks = Table[{qq, If[Mod[qq, 20] == 0, Tm[ToString[N[qq/100]], 3], ""]}, {qq, 0, 100, 10}];
ProbTicks = Table[{qq, If[Mod[10 qq, 1] == 0, Mm[ToString[qq], 3], " "]}, {qq, 0,0.3, 0.05}];
(* This takes a little time to run ~ say 1 min *)
{#, Export["figures/pdf/Figure7.pdf", #],Export["figures/svg/Figure7.svg", #], Export["figures/eps/Figure7.eps", #]} &@Plot[{InfMiddleF, NoInfMiddleF}, {z, 0, 100},ImageSize -> 1400, Frame -> {True, True, False, False}, 
 FrameTicks -> {BeliefTicks, ProbTicks}, PlotStyle -> {Directive[{Black, AbsoluteThickness[2], AbsoluteDashing[None]}], Directive[{Gray, AbsoluteThickness[2], AbsoluteDashing[{5, 5}]}]}, 
 FrameLabel -> {Tm["Bayesian posterior, \[Pi]", 4], Tm["Probability exact-center belief", 4]}, 
 PlotRange -> {{0, 100}, {0, 0.27}},(* PlotLegends -> Placed[{Tm["Information", 2], Tm["No Information", 2]}, {0.2, 0.8}],*)
  AspectRatio -> 1, Prolog -> { 
   DrawDiskInf[{20, InfM20}], DrawDiskInf[{80, InfM20}], DrawDiskInf[{30, InfM30}], DrawDiskInf[{70, InfM30}],
   DrawDiskNoInf[{20, NoInfM20}], DrawDiskNoInf[{80, NoInfM20}],DrawDiskNoInf[{30, NoInfM30}], DrawDiskNoInf[{70, NoInfM30}],
   Black, AbsoluteThickness[2], AbsoluteDashing[None], Line[{{10,0.22},{15,0.22}}],DrawDiskInf[{8, 0.22}],Inset[Tm["Information",3],{16,0.22},{-1,0}],
   Gray, AbsoluteThickness[2], AbsoluteDashing[{5, 5}], Line[{{10,0.2},{15,0.2}}],DrawDiskNoInf[{8, 0.2}],Inset[Tm["No Information",3],{16,0.2},{-1,0}]
   }
 ]
(*
----------------------------------------------------------------------------------------------
## Belief Reports
----------------------------------------------------------------------------------------------
## Read in Data
*)
IncentiveData = Import["data/data-incentives-only.csv", "CSV", "HeaderLines" -> 1];
IncentiveDataVars = Import["data/data-incentives-only.csv", "CSV"][[1]];
TableForm[Table[{i, IncentiveDataVars[[i]]}, {i, 1, Length@IncentiveDataVars}], TableHeadings -> {None, {"Index", "Variable"}}]
(*Generate the counts for each marginal:*)
ChoiceList=Table[i,{i,0,100,10}];
NIncentiveData=Length@IncentiveData;
IncentiveCounts=Flatten[Table[{p20,p30,N@(Length@Cases[IncentiveData[[All,{2,3}]],{p20,p30}])},{p20,0,100,10},{p30,0,100,10}],1];
Mass20=Table[{1+(x)/10,Total@Cases[IncentiveCounts,{x,_,_}][[All,3]]/NIncentiveData},{x,ChoiceList}];
Mass30=Table[{1+(x)/10,Total@Cases[IncentiveCounts,{_,x,_}][[All,3]]/NIncentiveData},{x,ChoiceList}];

Reshuffler20s[InData_,sc_,z_]:={If[#[[1]]==z,ss,If[#[[1]]>z,#[[1]]-1,#[[1]]]],If[#[[1]]==z,#[[2]]*sc,#[[2]]]}&/@InData
Reshuffler30s[InData_,sc_,z_]:={If[#[[1]]==z,ss,If[#[[1]]>z,#[[1]]-1,#[[1]]]],If[#[[1]]==z,#[[2]]*sc,#[[2]]]}&/@InData
Mass20alt=Reshuffler20s[Mass20,0.25,3];
Mass30alt=Reshuffler30s[Mass30,0.25,4];

(*
#### Figure 9: Incentives Only Treatment
* Figure 9(A) Prob of 0.2
* Figure 9(B) Prob of 0.3
*)
r=0.25
{#, Export["figures/pdf/Figure9-A.pdf", #],Export["figures/svg/Figure9-A.svg", #], Export["figures/pdf/Figure9-A.eps", #]} &@Graphics[{
Black, AbsoluteThickness[2],
Table[Line[{{i-spacingX,-0.003},{i-spacingX,-0.001},{i+spacingX,-0.001},{i+spacingX,-0.003}}],{i,1,10}],
Table[Line[{{i-spacingX,-0.003},{i-spacingX,-0.001},{i+spacingX,-0.001},{i+spacingX,-0.003}}],{i,-2,-2}],
Line[{{0.25,0},{0.25,0.26}}],Line[{{sf-0.25,0},{sf-0.25,0.26}}],
Line[{{sf-0.4 ,#},{sf-0.25,#}}] &/@{r/4,r/2,3*r/4,r}, (* subhline*)
Line[{{0.1,#},{0.25,#}}]&/@{0,0.05,0.1,0.15,0.2,0.25},(* Main ticks*)
Gray,AbsoluteDashing[{2,3}],
Line[{{0.25,#},{11,#}}]&/@{0.05,0.1,0.15,0.2,0.25},
Line[{{sf-0.25,#},{sf+1.25,#}}]&/@{r/4,r/2,3*r/4,r},
PointSize[0.015],FaceForm[Lighter[Gray,0.5]],EdgeForm[{Black,AbsoluteThickness[2]}],
Rectangle[{#[[1]]-spacingX, 0} ,{#[[1]]+spacingX,#[[2]]} ]&/@Mass20alt,FaceForm[White],Arrowheads[0.02],
AbsoluteThickness[1],
Arrowheads[{-0.02,0.02}],Black,AbsoluteDashing[None],
Arrow[{{3-spacingX,0.255},{5+spacingX,0.255}}],
Inset[Tm["To center",2],{4,0.26}],
Inset[#[[2]],{#[[1]],-0.01}]&/@FrameMass20,
Inset[Tm["EU max",2],{sf+0.3,-0.013}],
Inset[Tm["100%",2],{sf - 0.45,r},{1,0}],
Inset[Tm["75%",2],{sf - 0.45,3*r/4},{1,0}],
Inset[Tm["50%",2],{sf - 0.45,r/2},{1,0}],
Inset[Tm["25%",2],{sf - 0.45,r/4},{1,0}],
Inset[Tm["25%",2],{0,0.25},{1,0}],
Inset[Tm["20%",2],{0,0.2},{1,0}],
Inset[Tm["15%",2],{0,0.15},{1,0}],
Inset[Tm["10%",2],{0,0.1},{1,0}],
Inset[Tm["5%",2],{0,0.05},{1,0}],
Inset[Rotate[Tm["Observed fraction of choices",3],90Degree],{-4.5,0.125}],
(* Inset[Tm["Effective report on chosen lottery",3],{2,-0.03}], *)
Gray,AbsoluteThickness[2],AbsoluteDashing[{1,4}],
Line[{{-0.99,-0.02},{-0.99,0.265}}]
},
PlotRange->{ {-5,11.2}, {-0.04, 0.266} },
AspectRatio->1.0,ImageSize->1024]


r=0.25
{#, Export["figures/pdf/Figure9-B.pdf", #], Export["figures/svg/Figure9-B.svg", #], Export["figures/eps/Figure9-B.eps", #]} &@Graphics[{
Black, AbsoluteThickness[2],
Table[Line[{{i-spacingX,-0.003},{i-spacingX,-0.001},{i+spacingX,-0.001},{i+spacingX,-0.003}}],{i,1,10}],
Table[Line[{{i-spacingX,-0.003},{i-spacingX,-0.001},{i+spacingX,-0.001},{i+spacingX,-0.003}}],{i,-2,-2}],
Line[{{0.25,0},{0.25,0.26}}],Line[{{sf-0.25,0},{sf-0.25,0.26}}],
Line[{{sf-0.4 ,#},{sf-0.25,#}}] &/@{r/4,r/2,3*r/4,r}, (* subhline*)
Line[{{0.1,#},{0.25,#}}]&/@{0,0.05,0.1,0.15,0.2,0.25},(* Main ticks*)
Gray,AbsoluteDashing[{2,3}],
Line[{{0.25,#},{11,#}}]&/@{0.05,0.1,0.15,0.2,0.25},
Line[{{sf-0.25,#},{sf+1.25,#}}]&/@{r/4,r/2,3*r/4,r},
PointSize[0.015],FaceForm[Lighter[Gray,0.5]],EdgeForm[{Black,AbsoluteThickness[2]}],
Rectangle[{#[[1]]-spacingX, 0} ,{#[[1]]+spacingX,#[[2]]} ]&/@Mass30alt,FaceForm[White],Arrowheads[0.02],
AbsoluteThickness[1],
Arrowheads[{-0.02,0.02}],Black,AbsoluteDashing[None],
Arrow[{{3-spacingX,0.255},{5+spacingX,0.255}}],
Inset[Tm["To center",2],{4,0.26}],
Inset[#[[2]],{#[[1]],-0.01}]&/@FrameMass30,
Inset[Tm["EU max",2],{sf+0.3,-0.013}],
Inset[Tm["100%",2],{sf - 0.45,r},{1,0}],
Inset[Tm["75%",2],{sf - 0.45,3*r/4},{1,0}],
Inset[Tm["50%",2],{sf - 0.45,r/2},{1,0}],
Inset[Tm["25%",2],{sf - 0.45,r/4},{1,0}],
Inset[Tm["25%",2],{0,0.25},{1,0}],
Inset[Tm["20%",2],{0,0.2},{1,0}],
Inset[Tm["15%",2],{0,0.15},{1,0}],
Inset[Tm["10%",2],{0,0.1},{1,0}],
Inset[Tm["5%",2],{0,0.05},{1,0}],
Inset[Rotate[Tm["Observed fraction of choices",3],90Degree],{-4.5,0.125}],
(* Inset[Tm["Effective report on chosen lottery",3],{2,-0.03}], *)
Gray,AbsoluteThickness[2],AbsoluteDashing[{1,4}],
Line[{{-0.99,-0.02},{-0.99,0.265}}]
},
PlotRange->{ {-5,11.2}, {-0.04, 0.266} },
AspectRatio->1.0,ImageSize->1024]

(*
## Neiderle and Vesterlund Replication
Read in data:
*)
NVData = Import["data/data-nv.csv", "CSV", "HeaderLines" -> 1];
NVDataVars = Import["data/data-nv.csv", "CSV"][[1]];
TableForm[Table[{i, NVDataVars[[i]]}, {i, 1, Length@NVDataVars}], TableHeadings -> {None, {"Index", "Variable"}}]

(*Read in {`info` , `female` , `b_to_1` , `b_to_2` , `b_to_3` , `b_to_4` }*)
NVBeliefs = NVData[[All, {4, 13, 9, 10, 11, 12}]];

(*Select Data by Treatment and Gender:*)
Do[NVd[tt, gender, i - 2] = N@Mean@Cases[NVBeliefs, {tt, gender, ___}][[All, i]], {tt, {0, 1}}, {gender, {0, 1}}, {i, 3, 6}]

(*
#### Figure 8: Elicited Likelihood of Performance Rank in Tournament
Graphics Choices :
*)
DrawDiskInf[pos_] := 
 Inset[Graphics[{FaceForm[Lighter[Blue, 0.5]], EdgeForm[{Black, AbsoluteThickness[2]}], Disk[], Point[{0, 0}]}, 
   PlotRange -> {{-1.1, 1.1}, {-1.1, 1.1}}], pos, {0, 0}, 0.1]
DrawDiskNoInf[pos_] := Inset[Graphics[{FaceForm[Lighter[Red, 0.5]], 
    EdgeForm[{Black, AbsoluteThickness[2]}], RegularPolygon[4], 
    Point[{0, 0}]}, PlotRange -> {{-2, 2}, {-1.1, 1.1}}], pos, {0, 0}, 0.2, {{-1, 1}, {1, 1}}]

(*Frame Tick*)
InTicks = {{{1, Tm["1st", 3]}, {2, Tm["2nd", 3]}, {3, Tm["3rd", 3]}, {4, Tm["4th", 3]}}, Table[{10*i, Tm[ToString[i/10.], 3]}, {i, 0, 4}]};

(* #### Figure 8(A) NV-no-information *)
{#, Export["figures/pdf/Figure8-NoInf.pdf", #],Export["figures/svg/Figure8-NoInf.svg", #], Export["figures/eps/Figure8-NoInf.eps", #]} &@
 Graphics[{Gray, AbsoluteDashing[{10, 5, 2, 5}], Line[{{0.8, 25}, {4.2, 25}}], Darker[Blue, 0.5], AbsoluteThickness[2], AbsoluteDashing[{2, 3}], 
 {Line[#], DrawDiskInf /@ #} &@
    Table[{i, NVd[0, 1, i]}, {i, 1, 4}], Darker[Red, 0.5], AbsoluteThickness[2], AbsoluteDashing[None], {Line[#], DrawDiskNoInf /@ #} &@
    Table[{i, NVd[0, 0, i]}, {i, 1, 4}]}, 
    PlotRange -> {{0.8, 4.2}, {0, 48}}, AspectRatio -> 1.0, ImageSize -> 1024, FrameTicks -> InTicks, 
  FrameLabel -> {Tm["Tournament rank (Task 2)", 3], Tm["Average belief on rank", 3]}, 
  Frame -> {True, True, False, False}]

(* #### Figure 8(B) NV-Information *)
{#, Export["figures/pdf/Figure8-Inf.pdf", #],Export["figures/svg/Figure8-Inf.svg", #], Export["figures/eps/Figure8-Inf.eps", #]} &@
Graphics[{Gray, AbsoluteDashing[{10, 5, 2, 5}], Line[{{0.8, 25}, {4.2, 25}}], 
Darker[Blue, 0.5], AbsoluteThickness[2], AbsoluteDashing[{2, 3}], {Line[#], DrawDiskInf /@ #} &@
Table[{i, NVd[1, 1, i]}, {i, 1, 4}], Darker[Red, 0.5], AbsoluteThickness[2], AbsoluteDashing[None], {Line[#], DrawDiskNoInf /@ #} &@
Table[{i, NVd[1, 0, i]}, {i, 1, 4}], EdgeForm[{Black, AbsoluteThickness[2]}], FaceForm[White], 
Rectangle[{0.9, 1}, {1.95, 6}], Black, AbsoluteThickness[2], AbsoluteDashing[None], Darker[Red, 0.5], Line[{{0.95, 2.5}, {1.25, 2.5}}], 
DrawDiskNoInf[{1.1, 2.5}], Inset[Tm["Male", 3], {1.6, 2.5}], Inset[Tm["Female", 3], {1.6, 4.5}], Darker[Blue, 0.5], 
   AbsoluteThickness[2], AbsoluteDashing[{2, 3}], 
   Line[{{0.95, 4.5}, {1.25, 4.5}}], DrawDiskInf[{1.1, 4.5}]}, 
  PlotRange -> {{0.8, 4.2}, {0, 48}}, AspectRatio -> 1.0, ImageSize -> 1024, FrameTicks -> InTicks, 
  FrameLabel -> {Tm["Tournament rank (Task 2)", 3], Tm["Average belief on rank", 3]}, 
  Frame -> {True, True, False, False}]

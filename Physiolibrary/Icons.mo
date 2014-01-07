within Physiolibrary;
package Icons "Icons for physiological models"

  package Library
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={
          Rectangle(
            extent={{-100,-100},{98,102}},
            fillColor={235,235,235},
            fillPattern=FillPattern.Solid,
            lineColor={0,0,255}),
          Polygon(
            points={{-100,102},{-80,122},{118,122},{98,102},{-100,102}},
            fillColor={235,235,235},
            fillPattern=FillPattern.Solid,
            lineColor={0,0,255}),
          Polygon(
            points={{118,122},{118,-80},{98,-100},{98,102},{118,122}},
            fillColor={235,235,235},
            fillPattern=FillPattern.Solid,
            lineColor={0,0,255}),
          Text(
            extent={{-120,175},{120,120}},
            lineColor={255,0,0},
            textString="%name")}));
  end Library;

  model Golem

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,98},{100,-100}},
              fileName="Resources/Icons/golem.png")}));
  end Golem;

  model CardioVascular

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
              fileName="Resources/Icons/csv.png")}));
  end CardioVascular;

  model Water

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
              fileName="Resources/Icons/indexVoda.png")}));
  end Water;

  model Electrolytes

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
              fileName="Resources/Icons/electrolytes.png")}));
  end Electrolytes;

  model Proteins

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-98,100},{100,-100}},
              fileName="Resources/Icons/protein.png")}));
  end Proteins;

  model Gases

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
              fileName="Resources/Icons/gases.png")}));
  end Gases;

  model NutrientsMetabolism

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
              fileName="Resources/Icons/vyziva.png")}));
  end NutrientsMetabolism;

  model Heat

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
              fileName="Resources/Icons/ohen.png")}));
  end Heat;

  model Hormones

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
              fileName="Resources/Icons/hormony.png")}));
  end Hormones;

  model Nerves

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
              fileName="Resources/Icons/nervyNeuron.png")}));
  end Nerves;

  model Setup

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
              fileName="Resources/Icons/setup.png")}));
  end Setup;

  model Status

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-98,-100},{100,
                100}}, fileName="Resources/Icons/tissueFitness.png")}));
  end Status;

  model SkeletalMuscle

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-70,92},{40,-80}},
              fileName="Resources/Icons/sval.png")}));
  end SkeletalMuscle;

  model Bone

    annotation (Icon(coordinateSystem(preserveAspectRatio=true,  extent={{-100,
              -100},{100,100}}), graphics={Rectangle(
            extent={{-100,100},{100,-100}},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            pattern=LinePattern.None), Bitmap(extent={{-88,96},{52,-84}},
              fileName="Resources/Icons/bone.jpg")}));
  end Bone;

  model OtherTissue

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-74,60},{48,-94}},
              fileName="Resources/Icons/pojivovaTkan.png")}));
  end OtherTissue;

  model RespiratoryMuscle

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-66,86},{44,-86}},
              fileName="Resources/Icons/respiracniSvaly.png")}));
  end RespiratoryMuscle;

  model Fat

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-84,86},{38,-68}},
              fileName="Resources/Icons/tukovaBunka.png")}));
  end Fat;

  model Skin

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-74,56},{48,-84}},
              fileName="Resources/Icons/skin.jpg")}));
  end Skin;

  model Brain

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-78,62},{44,-92}},
              fileName="Resources/Icons/brain.jpg")}));
  end Brain;

  model GITract

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-80,74},{42,-80}},
              fileName="Resources/Icons/traviciTrakt.png")}));
  end GITract;

  model LeftHeart

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
              {100,100}}),        graphics={Bitmap(extent={{-110,100},{10,-100}},
              fileName="Resources/Icons/srdceLeva.png")}), Diagram(
          coordinateSystem(extent={{-100,-100},{100,100}})));
  end LeftHeart;

  model RightHeart

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
              {100,100}}),       graphics={Bitmap(extent={{-18,66},{100,-100}},
              fileName="Resources/Icons/srdceprava.png")}), Diagram(
          coordinateSystem(extent={{-100,-100},{100,100}})));
  end RightHeart;

  model Liver

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-84,34},{86,-100}},
              fileName="Resources/Icons/jatra.png")}));
  end Liver;

  model Kidney

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-92,86},{40,-88}},
              fileName="Resources/Icons/kidney.jpg")}));
  end Kidney;

  model Bladder

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Rectangle(
            extent={{-100,100},{100,-100}},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            pattern=LinePattern.None), Bitmap(extent={{-92,86},{40,-88}},
              fileName="Resources/Icons/mocovyMechyr.png")}));
  end Bladder;

  model GILumen

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
              fileName="Resources/Icons/traviciTrakt2.png")}));
  end GILumen;

  model ThyroidGland

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-92,86},{40,-88}},
              fileName="Resources/Icons/stitnaZlaza.png")}));
  end ThyroidGland;

  model Pancreas

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
              fileName="Resources/Icons/pankreas.png")}));
  end Pancreas;

  model AdrenalGland

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
              fileName="Resources/Icons/nadledviny.png")}));
  end AdrenalGland;

  model Lungs

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-70,92},{40,-80}},
              fileName="Resources/Icons/plice.png")}));
  end Lungs;

  model Tissues

    annotation (Icon(coordinateSystem(preserveAspectRatio=true,  extent={{-100,
              -100},{100,100}}), graphics={
          Bitmap(extent={{-46,98},{32,26}}, fileName="Resources/Icons/bone.jpg"),
          Bitmap(extent={{-62,-10},{50,-92}}, fileName="Resources/Icons/skin.jpg"),
          Bitmap(extent={{-38,90},{64,-20}}, fileName="Resources/Icons/sval.png"),
          Bitmap(extent={{-10,36},{102,-56}}, fileName=
                "Resources/Icons/traviciTrakt.png"),
          Text(
            extent={{64,-66},{94,-96}},
            lineColor={0,0,0},
            textString="..."),
          Bitmap(extent={{-98,36},{-24,-30}}, fileName="Resources/Icons/brain.jpg")}));

  end Tissues;

  model Peritoneum

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-70,92},{40,-80}},
              fileName="Resources/Icons/peritoneum.png")}));
  end Peritoneum;

  model Plasma

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-70,92},{40,-80}},
              fileName="Resources/Icons/plazma.png")}));
  end Plasma;

  model Hypophysis

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
              fileName="Resources/Icons/hypofyza.png")}));
  end Hypophysis;

  model Heart

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
              fileName="Resources/Icons/heart.png")}));
  end Heart;

  model SweatGland

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
              fileName="Resources/Icons/potniZlaza.png")}));
  end SweatGland;

  model Cell

  end Cell;

  package BaseLib
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={
          Rectangle(
            extent={{-100,-100},{80,50}},
            fillColor={235,235,235},
            fillPattern=FillPattern.Solid,
            lineColor={0,0,255}),
          Polygon(
            points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}},
            fillColor={235,235,235},
            fillPattern=FillPattern.Solid,
            lineColor={0,0,255}),
          Polygon(
            points={{100,70},{100,-80},{80,-100},{80,50},{100,70}},
            fillColor={235,235,235},
            fillPattern=FillPattern.Solid,
            lineColor={0,0,255}),
          Text(
            extent={{-120,122},{120,73}},
            lineColor={255,0,0},
            textString="%name")}));
  end BaseLib;

   package AutonomicControlLib
    extends BaseLib;
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-96,42},{72,-96}},
              fileName="Resources/Icons/sympatetickeNervy.png")}));

   end AutonomicControlLib;

  package CardioVascularLib
    extends BaseLib;
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-96,42},{76,-100}},
              fileName="Resources/Icons/csv.png")}));

  end CardioVascularLib;

  package ElectrolytesLib
    extends BaseLib;
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-78,38},{64,-94}},
              fileName="Resources/Icons/electrolytes.png")}));

  end ElectrolytesLib;

  package GasesLib
    extends BaseLib;
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-88,34},{66,-82}},
              fileName="Resources/Icons/gases.png")}));

  end GasesLib;

  package GolemLib
    extends BaseLib;
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-96,42},{78,-98}},
              fileName="Resources/Icons/golem.png")}));
  end GolemLib;

  package HeatLib
    extends BaseLib;
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,44},{76,-82}},
              fileName="Resources/Icons/ohen.png")}));

  end HeatLib;

  package HormonesLib
    extends BaseLib;
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-88,30},{74,-88}},
              fileName="Resources/Icons/hormony.png")}));

  end HormonesLib;

   package KidneyLib
    extends BaseLib;
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-96,42},{72,-96}},
              fileName="Resources/Icons/Kidney.jpg")}));

   end KidneyLib;

   package NervesLib
    extends BaseLib;
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-96,42},{72,-96}},
              fileName="Resources/Icons/nervyNeuron.png")}));

   end NervesLib;

  package NutrientsMetabolismLib
    extends BaseLib;
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-98,40},{80,-100}},
              fileName="Resources/Icons/vyziva.png")}));

  end NutrientsMetabolismLib;

  package OxygenLib
    extends BaseLib;
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-96,42},{78,-98}},
              fileName="Resources/Icons/O2.jpg")}));
  end OxygenLib;

  package ProteinsLib
    extends BaseLib;
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-98,42},{76,-98}},
              fileName="Resources/Icons/protein.png")}));

  end ProteinsLib;

  package SetupLib
    extends BaseLib;
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-94,44},{72,-98}},
              fileName="Resources/Icons/setup.png")}));

  end SetupLib;

  package StatusLib
    extends BaseLib;
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-96,-96},{72,40}},
              fileName="Resources/Icons/tissueFitness.png")}));

  end StatusLib;

  package WaterLib
   extends BaseLib;
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-90,42},{72,-84}},
              fileName="Resources/Icons/indexVoda.png")}));

  end WaterLib;

  partial model Resistor

   annotation (
      Icon(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics={
          Rectangle(
            extent={{-70,30},{70,-30}},
            lineColor={0,0,0},
            fillColor={241,241,241},
            fillPattern=FillPattern.Solid),
          Line(points={{-90,0},{-70,0}}, color={0,0,0}),
          Line(points={{70,0},{90,0}}, color={0,0,0})}));
  end Resistor;

  model Lymph

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
              fileName="Resources/Icons/Lymph.png")}));
  end Lymph;

  model RespiratoryCenter

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
              fileName="Resources/Icons/respiracniCentrum.png")}));
  end RespiratoryCenter;

  model Oxygen

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={
                    Bitmap(extent={{-100,100},{100,-100}}, fileName=
                "Resources/Icons/O2.jpg")}));
  end Oxygen;

  model CarbonDioxide

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={
                    Bitmap(extent={{-100,100},{100,-100}}, fileName=
                "Resources/Icons/prvkyCO2.png")}));
  end CarbonDioxide;

  model AcidBase

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={
                    Bitmap(extent={{-100,100},{100,-100}}, fileName=
                "Resources/Icons/acidobaze.png")}));
  end AcidBase;

  model Ventilation

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
              fileName="Resources/Icons/dychani.png")}));
  end Ventilation;

  model PeripheralChemoreceptors

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
              fileName="Resources/Icons/baroreflex.png")}));
  end PeripheralChemoreceptors;

  model HeatCore

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
              -100,-100},{100,100}}), graphics={Bitmap(extent={{-100,100},{
                100,-100}}, fileName=
                "Resources/Icons/torzo2.png")}));
  end HeatCore;

  model Glycogen

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={
                               Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,255},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),Bitmap(extent={{-100,100},{100,
                -100}}, fileName=
                "Resources/Icons/glykogen.png")}));
  end Glycogen;

  model Lipids

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                -100}}, fileName=
                "Resources/Icons/FattyAcid.jpg")}));
  end Lipids;

  model KetoAcids

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                -100}}, fileName=
                "Resources/Icons/KetoAcid.jpg")}));
  end KetoAcids;

  model Glucose

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                -100}}, fileName="Resources/Icons/glucose.jpg")}));
  end Glucose;

  model Lactate

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                -100}}, fileName="Resources/Icons/Lactate.jpg")}));
  end Lactate;

  model AminoAcids

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                -100}}, fileName=
                "Resources/Icons/AminoAcid.jpg")}));
  end AminoAcids;

  model Urea

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                -100}}, fileName="Resources/Icons/Urea.jpg")}));
  end Urea;

  model MetabolismPart

    annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
              {100,120}}),            graphics), Icon(coordinateSystem(
            preserveAspectRatio=true, extent={{-100,-100},{100,120}}),
          graphics={             Rectangle(
            extent={{-100,120},{100,-100}},
            lineColor={0,0,255},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
                                 Bitmap(extent={{28,120},{98,44}}, fileName=
               "Resources/Icons/ohen.png")}));
  end MetabolismPart;

  model CellularMetabolism

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                -100}}, fileName=
                "Resources/Icons/cellularMetabolism.png")}));
  end CellularMetabolism;

  model FemaleSex

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                -100}}, fileName=
                "Resources/Icons/hormonesFemaleSex.png")}));
  end FemaleSex;

  model Barroreceptor

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                -100}}, fileName=
                "Resources/Icons/baroreflex.png")}));
  end Barroreceptor;

  model NervusVagus

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                -100}}, fileName="Resources/Icons/vagus.png")}));
  end NervusVagus;

  model SympatheticNerves

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                -100}}, fileName=
                "Resources/Icons/sympatetickeNervy.png")}));
  end SympatheticNerves;

  model PhysicalExercise

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                -100}}, fileName="Resources/Icons/cviceni.png")}));
  end PhysicalExercise;

  model SinoatrialNode

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                -100}}, fileName="Resources/Icons/SANode.png")}));
  end SinoatrialNode;

  block StatusNormal

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                -100}}, fileName=
                "Resources/Icons/siluetaNormal.png")}));
  end StatusNormal;

  block StatusConfused

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                -100}}, fileName=
                "Resources/Icons/siluetaZmateni.png")}));
  end StatusConfused;

  block StatusImpaired

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                -100}}, fileName=
                "Resources/Icons/siluetaVaznejsiStav.png")}));
  end StatusImpaired;

  block StatusNotBreathing

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                -100}}, fileName=
                "Resources/Icons/siluetaNedychaSam.png")}));
  end StatusNotBreathing;

  block StatusComatose

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                -100}}, fileName=
                "Resources/Icons/siluetaKoma.png")}));
  end StatusComatose;

  block StatusMayBeDead

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                -100}}, fileName=
                "Resources/Icons/siluetaSkoroMrtvy.png")}));
  end StatusMayBeDead;

  block StatusIsReallyDead

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                -100}}, fileName=
                "Resources/Icons/siluetaMrtvy.png")}));
  end StatusIsReallyDead;

  model SkeletalMuscleAcidity

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                -100}}, fileName=
                "Resources/Icons/kyselostVeSvalech.png")}));
  end SkeletalMuscleAcidity;

  model Sodium

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                -100}}, fileName="Resources/Icons/Na.jpg")}));
  end Sodium;

  model Potassium

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                -100}}, fileName="Resources/Icons/K.jpg")}));
  end Potassium;

  model Phosphate

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                -100}}, fileName="Resources/Icons/fosfat.png")}));
  end Phosphate;

  model Sulphate

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                -100}}, fileName=
                "Resources/Icons/sulfat02.png")}));
  end Sulphate;

  model Amonium

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                -100}}, fileName="Resources/Icons/NH4.jpg")}));
  end Amonium;

  model Chloride

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                -100}}, fileName="Resources/Icons/Cl.jpg")}));
  end Chloride;

  model LungShunt

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                -100}}, fileName=
                "Resources/Icons/lungBloodFlow.jpg")}));
  end LungShunt;

  model Hydrostatics

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                -100}}, fileName=
                "Resources/Icons/pressureMeassure.png")}));
  end Hydrostatics;

  model UpperTorso

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                -100}}, fileName="Resources/Icons/torzo1.png")}));
  end UpperTorso;

  model MiddleTorso

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                -100}}, fileName="Resources/Icons/torzo2.png")}));
  end MiddleTorso;

  model LowerTorso

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                -100}}, fileName="Resources/Icons/torzo3.png")}));
  end LowerTorso;

  model RedCells

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                -100}}, fileName=
                "Resources/Icons/cervenaKrvinka.png")}));
  end RedCells;

  model SystemicCirculation

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                -100}}, fileName=
                "Resources/Icons/krevniRecisteSiluetacloveka.png")}));
  end SystemicCirculation;

  model PulmonaryCirculation

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                -100}}, fileName=
                "Resources/Icons/krevniRecistePlice.png")}));
  end PulmonaryCirculation;

  model Blood

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                -100}}, fileName=
                "Resources/Icons/bloodProperties.jpg")}));
  end Blood;

  model BloodElasticCompartment

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                -100}}, fileName=
                "Resources/Icons/elastickyKompartment.png")}));
  end BloodElasticCompartment;

  model BloodSequesteredCompartment

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                -100}}, fileName=
                "Resources/Icons/sequerestedVolume.png")}));
  end BloodSequesteredCompartment;

  partial model BaseFactorIcon

    Modelica.Blocks.Interfaces.RealInput yBase
                     annotation (Placement(transformation(extent={{-20,-20},{
              20,20}},
          rotation=270,
          origin={6,80}),
          iconTransformation(extent={{-10,10},{10,30}}, rotation=-90)));
    Modelica.Blocks.Interfaces.RealOutput y
                  annotation (Placement(transformation(extent={{-20,-20},{20,
              20}},
          rotation=270,
          origin={0,-60}),
          iconTransformation(extent={{-10,-30},{10,-10}}, rotation=-90)));

   annotation (
      Icon(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics={Rectangle(
            extent={{-100,20},{100,-20}},
            lineColor={95,95,95},
            fillColor={255,255,255},
            fillPattern=FillPattern.Sphere), Text(
            extent={{-90,-10},{92,10}},
            textString="%name",
            lineColor={0,0,0})}), Diagram(coordinateSystem(
            preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
          graphics));
  end BaseFactorIcon;

  partial model BaseFactorIcon2

    Modelica.Blocks.Interfaces.RealInput yBase
                     annotation (Placement(transformation(extent={{-20,-20},{
              20,20}},
          rotation=270,
          origin={6,100}),
          iconTransformation(extent={{-10,-10},{10,10}},rotation=270,
          origin={0,50})));
    Modelica.Blocks.Interfaces.RealOutput y
                  annotation (Placement(transformation(extent={{-20,-20},{20,
              20}},
          rotation=270,
          origin={0,-80}),
          iconTransformation(extent={{-10,-10},{10,10}},  rotation=270,
          origin={0,-52})));

   annotation (
      Icon(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics={Rectangle(
            extent={{-100,50},{100,-50}},
            lineColor={0,127,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Sphere), Text(
            extent={{-86,-36},{100,40}},
            textString="%name",
            lineColor={0,0,0},
            fillPattern=FillPattern.Sphere)}), Diagram(coordinateSystem(
            preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
          graphics));
  end BaseFactorIcon2;

  partial model BaseFactorIcon3

    Modelica.Blocks.Interfaces.RealInput yBase
                     annotation (Placement(transformation(extent={{-20,-20},{
              20,20}},
          rotation=270,
          origin={6,80}),
          iconTransformation(extent={{-10,10},{10,30}}, rotation=-90)));
    Modelica.Blocks.Interfaces.RealOutput y
                  annotation (Placement(transformation(extent={{-20,-20},{20,
              20}},
          rotation=270,
          origin={0,-60}),
          iconTransformation(extent={{-10,-30},{10,-10}}, rotation=-90)));

   annotation (
      Icon(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics={Rectangle(
            extent={{-100,20},{100,-20}},
            lineColor={0,127,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Sphere), Text(
            extent={{-90,-10},{92,10}},
            textString="%name",
            lineColor={0,0,0})}), Diagram(coordinateSystem(
            preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
          graphics));
  end BaseFactorIcon3;

  partial model BaseFactorIcon4

    Modelica.Blocks.Interfaces.RealInput yBase
                     annotation (Placement(transformation(extent={{-20,-20},{
              20,20}},
          rotation=270,
          origin={6,80}),
          iconTransformation(extent={{-10,10},{10,30}}, rotation=-90)));
    Modelica.Blocks.Interfaces.RealOutput y
                  annotation (Placement(transformation(extent={{-20,-20},{20,
              20}},
          rotation=270,
          origin={0,-60}),
          iconTransformation(extent={{-10,-30},{10,-10}}, rotation=-90)));

   annotation (
      Icon(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics={Rectangle(
            extent={{-100,20},{100,-20}},
            lineColor={127,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Sphere), Text(
            extent={{-90,-10},{92,10}},
            textString="%name",
            lineColor={0,0,0})}), Diagram(coordinateSystem(
            preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
          graphics));
  end BaseFactorIcon4;

  partial model BaseFactorIcon5

    Modelica.Blocks.Interfaces.RealInput yBase
                     annotation (Placement(transformation(extent={{-20,-20},{
              20,20}},
          rotation=270,
          origin={6,80}),
          iconTransformation(extent={{-10,10},{10,30}}, rotation=-90)));
    Modelica.Blocks.Interfaces.RealOutput y
                  annotation (Placement(transformation(extent={{-20,-20},{20,
              20}},
          rotation=270,
          origin={0,-60}),
          iconTransformation(extent={{-10,-30},{10,-10}}, rotation=-90)));

   annotation (
      Icon(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics={Rectangle(
            extent={{-100,20},{100,-20}},
            lineColor={0,0,255},
            fillColor={255,255,255},
            fillPattern=FillPattern.Sphere), Text(
            extent={{-90,-10},{92,10}},
            textString="%name",
            lineColor={0,0,0})}), Diagram(coordinateSystem(
            preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
          graphics));
  end BaseFactorIcon5;

  partial model BaseFactorIcon6

    Modelica.Blocks.Interfaces.RealInput yBase
                     annotation (Placement(transformation(extent={{-20,-20},{
              20,20}},
          rotation=270,
          origin={6,80}),
          iconTransformation(extent={{-10,10},{10,30}}, rotation=-90)));
    Modelica.Blocks.Interfaces.RealOutput y
                  annotation (Placement(transformation(extent={{-20,-20},{20,
              20}},
          rotation=270,
          origin={0,-60}),
          iconTransformation(extent={{-10,-30},{10,-10}}, rotation=-90)));

   annotation (
      Icon(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics={Rectangle(
          extent={{-100,20},{100,-20}},
          lineColor={0,87,87},
          fillColor={255,255,255},
          fillPattern=FillPattern.Sphere)}),
                                  Diagram(coordinateSystem(
            preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
          graphics));
  end BaseFactorIcon6;

  partial class ConversionIcon "Base icon for conversion functions"

    annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
              -100},{100,100}}), graphics={
          Rectangle(
            extent={{-100,100},{100,-100}},
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

  model BaseFactorIcon0

    annotation (Icon(graphics={  Rectangle(
            extent={{-100,60},{100,-40}},
            lineColor={0,127,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Sphere), Text(
            extent={{-76,44},{64,-22}},
            lineColor={0,0,0},
            textString="%name")}));
  end BaseFactorIcon0;

  model MultXIcon "y na X"

    annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
              -100},{100,100}}), graphics={Rectangle(extent={{-100,100},{
                100,-100}}, lineColor={0,0,0}), Text(
            extent={{-100,40},{100,-20}},
            lineColor={0,0,0},
            textString="%u^%x")}), Diagram(coordinateSystem(
            preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
          graphics={Text(
            extent={{-100,40},{100,-20}},
            lineColor={0,0,0},
            textString="%u^%x")}));
  end MultXIcon;

    partial block BlockIcon_G "Basic graphical layout of input/output block"

      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
              100,100}}), graphics={Rectangle(
            extent={{-100,-100},{100,100}},
            lineColor={255,255,255},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid), Text(
            extent={{-150,150},{150,110}},
            textString="%name",
            lineColor={0,0,255})}),
      Documentation(info="<html>
<p>
Block that has only the basic icon for an input/output
block (no declarations, no equations). Most blocks
of package Modelica.Blocks inherit directly or indirectly
from this block.
</p>
</html>"));

    end BlockIcon_G;

  model FractionalConcentration

    annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
              -100},{100,100}}), graphics), Icon(coordinateSystem(
            preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
          graphics={Bitmap(extent={{-100,100},{100,-100}}, fileName=
                "Resources/Icons/concentrationCompartement.png"),
                    Bitmap(extent={{-100,100},{-20,20}},   fileName=
                "Resources/Icons/concentrationCompartement.png"), Text(
            extent={{-22,-102},{220,-136}},
            lineColor={0,0,255},
            textString="%name")}));
  end FractionalConcentration;

  partial model Diffusion

    annotation (Icon(graphics={Bitmap(extent={{-100,100},{100,-100}}, fileName=
                "Resources/Icons/diffusion.png")}));

  end Diffusion;

  model ConcentrationCompartment

      annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
              -100},{100,100}}), graphics), Icon(coordinateSystem(
            preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
          graphics={Bitmap(extent={{-100,100},{100,-100}}, fileName=
                "Resources/Icons/concentrationCompartement.png"), Text(
            extent={{-22,-102},{220,-136}},
            lineColor={0,0,255},
            textString="%name")}));
  end ConcentrationCompartment;

  model FlowMeasure

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={
                                    Bitmap(extent={{-100,100},{100,-100}},
              fileName="Resources/Icons/flowMeassure.png")}));
  end FlowMeasure;

  partial model HydraulicResistor

  annotation (Icon(graphics={    Bitmap(extent={{-120,44},{120,-42}},
              fileName="Resources/Icons/resistance.jpg")}));
  end HydraulicResistor;

  model ElasticBalloon

  annotation (Icon(graphics={     Bitmap(extent={{-100,100},{100,-100}},
              fileName="Resources/Icons/elastickyKompartment - Kopie.png")}));
  end ElasticBalloon;

  model Membrane

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
              fileName="Resources/Icons/membrane.png")}));
  end Membrane;

  model MolarFlowMeasure

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
              fileName="Resources/Icons/molarFlowMeassure.png")}));
  end MolarFlowMeasure;

  model Dilution

    annotation (Icon(graphics={     Bitmap(extent={{-140,100},{60,-100}},
              fileName="Resources/Icons/dilution.png")}));
  end Dilution;

  model GasSolubility
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
              fileName=
                "modelica://Physiolibrary/Resources/Icons/GasSolubility.png")}));
  end GasSolubility;

  model PressureMeasure

    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
              -100,-100},{100,100}}), graphics), Icon(graphics={Bitmap(extent={
                {-100,100},{100,-100}}, fileName=
                "Resources/Icons/pressureMeassure.png")}));
  end PressureMeasure;

  model Reabsorption

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
              fileName=
                "Resources/Icons/reabsorption.png")}));
  end Reabsorption;

  model Reabsorption2

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
              fileName=
                "Resources/Icons/reabsorption.png")}));
  end Reabsorption2;

  model InternalElasticBalloon

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
              fileName=
                "Resources/Icons/ventilatorCapacitance.png")}));
  end InternalElasticBalloon;

  model Inertance

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
              fileName=
                "Resources/Icons/ventilatorInertance.png")}));
  end Inertance;

  model HydrostaticGradient

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
              {100,100}}), graphics={Bitmap(extent={{-100,100},{102,-100}},
              fileName="Resources/Icons/hydrostaticGradient.png")}));

  end HydrostaticGradient;
  annotation (Documentation(revisions=""));
  model Radiator
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
              fileName="modelica://Physiolibrary/Resources/Icons/Radiator.png")}));
  end Radiator;

  model MichaelisMenten
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Bitmap(extent={{-82,78},{90,-94}},
              fileName=
                "modelica://Physiolibrary/Resources/Icons/MichaelisMenten.png")}));
  end MichaelisMenten;
end Icons;

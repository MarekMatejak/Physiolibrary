# Physiolibrary

Physiolibrary is a free open-source Modelica library designed for modeling human physiology. 
This library contains basic physical laws governing human physiology, usable for cardiovascular circulation,
metabolic processes, nutrient distribution, thermoregulation, gases transport, electrolyte regulation, 
water distribution, hormonal regulation and pharmacological regulation.

## Library description

The origin of this Modelica Physiolibrary was in the first version of our HumMod Golem Edition model implementation,
where it was called HumMod.Library. As the successors of Guyton's Medical Physiology School write, 
the original HumMod model is “The best, most complete, mathematical model of human phys-iology ever created” ( http:\\\\hummod.org ).

We are also developing many types of smaller physiological models for use in medical education, 
so it was essential to separate this library from our HumMod Modelica implementation. This separation improves 
the quality of the next HumMod release and provides a useful Modelica library to modelers in this bioscience.
The library contains only carefully-chosen elementary physiological laws, which are the basis of more complex physiological
processes. For example from only two type of blocks (Chemical.ChemicalReaction and Chemical.Substance) it is 
possible to compose the allosteric transitions or the Michaelis-Menten equation.

Library contains also the icons for higher level (HumMod) subsystem implementations:

![screenshot](screenshot.png)

## Current release

Download [Physiolibrary v1.0.0 (2013-12-09)](../../archive/v1.0.0.zip)

#### Release notes

*  [Version v1.0.0 (2013-12-09)](../../archive/v1.0.0.zip)
 * The library uses the latest Modelica Standard Libary (MSL) version 3.2.1 (but still works with version 3.2).
 * Added a couple of convenience source blocks for Real, Integer, and Boolean signals that are similar to the blocks
   found in the MSL, but have as output a clocked signal.
 * Added a couple of source blocks that are parametrized in terms of clock ticks rather than simulation time.
 * All new blocks are utilized in at least one test.

## License

This Modelica package is free software and the use is completely at your own risk;
it can be redistributed and/or modified under the terms of the [Modelica License 2](https://modelica.org/licenses/ModelicaLicense2).

## Development and contribution
Release manager: [Marek Matejak](www.physiome.cz)

You may report any issues by using the [Redmine Issue Tracker](http://physiome.lf1.cuni.cz:8080/redmine/projects/physiolibrary).




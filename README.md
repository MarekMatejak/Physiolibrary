Physiolibrary
=============

Physiolibrary is a free open-source Modelica library designed for modeling human physiology. 
This library contains basic physical laws governing human physiology, usable for cardiovascular circulation,
metabolic processes, nutrient distribution, thermoregulation, gases transport, electrolyte regulation, 
water distribution, hormonal regulation and pharmacological regulation.

The origin of this Modelica Physiolibrary was in the first version of our HumMod Golem Edition model implementation,
where it was called HumMod.Library. As the successors of Guyton's Medical Physiology School write, 
the original HumMod model is “The best, most complete, mathematical model of human phys-iology ever created” ( http:\\hummod.org ).

We are also developing many types of smaller physiological models for use in medical education, 
so it was essential to separate this library from our HumMod Modelica implementation. This separation improves 
the quality of the next HumMod release and provides a useful Modelica library to modelers in this bioscience.
The library contains only carefully-chosen elementary physiological laws, which are the basis of more complex physiological
processes. For example from only two type of blocks (Chemical.ChemicalReaction and Chemical.Substance) it is 
possible to compose the allosteric transitions or the Michaelis-Menten equation.

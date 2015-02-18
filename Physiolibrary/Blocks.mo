within Physiolibrary;
package Blocks "Base Signal Blocks Library"
  extends Modelica.Icons.Package;
  package Math "Modelica.Math extension"
    extends Modelica.Icons.Package;
    model Integrator "Integrator with support of steady state calculation."
      extends SteadyStates.Interfaces.SteadyState(
                                         state_start=y_start, state(nominal=NominalValue));

      parameter Real k=1 "Integrator gain";

      parameter Real y_start=0 "Initial or guess value of output (= state)"
        annotation (Dialog(group="Initialization"));
      extends Modelica.Blocks.Interfaces.SISO(u(nominal=NominalValue/k),y(nominal=NominalValue));

      parameter Real NominalValue = 1
        "Numerical scale. For some substances such as hormones, hydronium or hydroxide ions should be set."
          annotation ( HideResult=true, Dialog(tab="Solver",group="Numerical support of very small concentrations"));
    equation
      state = y;  //der(y) = k*u
      change = k*u;

      annotation (defaultComponentName="int",
        Documentation(info="<html>
<p>
This blocks computes output <b>y</b> (element-wise) as
<i>integral</i> of the input <b>u</b> multiplied with
the gain <i>k</i>:
</p>
<pre>
         k
     y = - u
         s
</pre>

<p>
It might be difficult to initialize the integrator in steady state.
This is discussed in the description of package
<a href=\"Modelica://Modelica.Blocks.Continuous#info\">Continuous</a>.
</p>

</html>
"),     Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={
            Line(points={{-80,78},{-80,-90}}, color={192,192,192}),
            Polygon(
              points={{-80,90},{-88,68},{-72,68},{-80,90}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,-80},{82,-80}}, color={192,192,192}),
            Polygon(
              points={{90,-80},{68,-72},{68,-88},{90,-80}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{0,-10},{60,-70}},
              lineColor={192,192,192},
              textString="I"),
            Text(
              extent={{-150,-150},{150,-110}},
              lineColor={0,0,0},
              textString="k=%k"),
            Line(points={{-80,-80},{80,80}}, color={0,0,127})}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={
            Rectangle(extent={{-60,60},{60,-60}}, lineColor={0,0,255}),
            Line(points={{-100,0},{-60,0}}, color={0,0,255}),
            Line(points={{60,0},{100,0}}, color={0,0,255}),
            Text(
              extent={{-36,60},{32,2}},
              lineColor={0,0,0},
              textString="k"),
            Text(
              extent={{-32,0},{36,-58}},
              lineColor={0,0,0},
              textString="s"),
            Line(points={{-46,0},{46,0}}, color={0,0,0})}));
    end Integrator;

        block Add "u + parameter"

          parameter Real k(start=1) "value added to input signal";
    public
          Modelica.Blocks.Interfaces.RealInput u "Input signal connector"
            annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
          Modelica.Blocks.Interfaces.RealOutput y "Output signal connector"
            annotation (Placement(transformation(extent={{100,-10},{120,10}})));

        equation
          y = k+u;
          annotation (defaultComponentName="add",
            Documentation(info="<html>
<p>This block computes output <i>y</i> as <i>sum</i> of offset <i>k</i> with the input <i>u</i>: </p>
<p><code>    y = k + u;</code> </p>
</html>"),  Icon(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={
            Polygon(
              points={{-100,100},{100,40},{100,-40},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              smooth=Smooth.None,
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-100,-42},{100,40}},
              lineColor={0,0,0},
              textString="u+%k"),
            Text(
              extent={{-150,140},{150,100}},
              textString="%name",
              lineColor={0,0,255})}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Polygon(
              points={{-100,-100},{-100,100},{100,0},{-100,-100}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{-76,38},{0,-34}},
              lineColor={0,0,255},
              textString="k")}));
        end Add;

        block Reciprocal "1 / u"
          extends Modelica.Blocks.Interfaces.SISO;
        equation
          y = 1/u;
          annotation (defaultComponentName="rec",
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Text(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,0},
              textString="1/u")}),
            Documentation(info="<html>
<p>This blocks computes the output <b>y</b> as <i>reciprocal value</i> of the input <b>u</b>: </p>
<p><code>    y = 1 / u ;</code> </p>
</html>"));
        end Reciprocal;

        block Power "b ^ u"

          parameter Boolean useBaseInput = false
        "=true, if exponential base input is used instead of parameter Base"
          annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

          parameter Real Base=10 "exponential base if useBaseInput=false"
            annotation (Dialog(enable=not useBaseInput));

          Modelica.Blocks.Interfaces.RealOutput y
            annotation (Placement(transformation(extent={{100,-10},{120,10}})));
          Modelica.Blocks.Interfaces.RealInput base(start=Base) = b if useBaseInput annotation (Placement(
                transformation(extent={{-120,40},{-80,80}})));
          Modelica.Blocks.Interfaces.RealInput exponent annotation (Placement(
                transformation(extent={{-120,-80},{-80,-40}})));

    protected
          Real b "Current exponential base";
        equation
          if not useBaseInput then
            b = Base;
          end if;

          y = b^exponent;
           annotation (defaultComponentName="pow",
            Documentation(info="<html>
<p>y = base^exponent</p>
</html>"),  Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
                initialScale=0.04), graphics={Rectangle(
              extent={{-100,-100},{100,100}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{-100,-40},{100,40}},
              lineColor={0,0,0},
                  textString="b^u")}));
        end Power;

    block Min "Pass through the smallest signal"
      extends Modelica.Blocks.Interfaces.MISO;
    equation
       y = min(u);
      annotation (defaultComponentName="min", Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={Text(
              extent={{-90,36},{90,-36}},
              lineColor={160,160,164},
              textString="min()")}),
                              Documentation(info="<html>
<p>
This block computes the output <b>y</b> as <i>minimum</i> of
the Real inputs <b>u[1]</b>,<b>u[2]</b> .. <b>u[nin]</b>:
</p>
<pre>    y = <b>min</b> ( u );
</pre>
</html>
"));
    end Min;

        block Log10AsEffect "min( 0, log10(u) )"

          extends Modelica.Blocks.Interfaces.SISO;
        equation
          y = if u>1 then Modelica.Math.log10(u) else 0;
          annotation (defaultComponentName="logEffect",
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={
            Polygon(
              points={{90,0},{68,8},{68,-8},{90,0}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,0},{68,0}}, color={192,192,192}),
            Polygon(
              points={{-80,90},{-88,68},{-72,68},{-80,90}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-80,-80},{-80,68}}, color={192,192,192}),
            Text(
              extent={{-44,-56},{94,-80}},
              lineColor={192,192,192},
              textString="max(log10,0)"),
            Line(points={{-100,0},{-80,0},{-78,0},{-74,0},{-76,0},{-74,0},{-72,
                  0},{-69.5,6.08},{-64.7,15.9},{-57.5,26},{-47,36.1},{-31.8,
                  46.1},{-10.1,56},{22.1,66},{68.7,76.1},{80,78}}, color={0,0,
                  0})}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={
            Line(points={{-80,80},{-88,80}}, color={192,192,192}),
            Line(points={{-80,-80},{-88,-80}}, color={192,192,192}),
            Line(points={{-80,-90},{-80,84}}, color={192,192,192}),
            Text(
              extent={{-65,96},{-38,78}},
              lineColor={160,160,164},
              textString="y"),
            Polygon(
              points={{-80,100},{-86,84},{-74,84},{-80,100}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-100,0},{84,0}}, color={192,192,192}),
            Polygon(
              points={{100,0},{84,6},{84,-6},{100,0}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-100,0},{-80,0},{-78,0},{-74,0},{-76,0},{-74,0},{-72,
                  0},{-69.5,6.08},{-64.7,15.9},{-57.5,26},{-47,36.1},{-31.8,
                  46.1},{-10.1,56},{22.1,66},{68.7,76.1},{80,78}}, color={0,0,
                  0}),
            Text(
              extent={{70,-3},{90,-23}},
              textString="20",
              lineColor={0,0,255}),
            Text(
              extent={{-78,-1},{-58,-21}},
              textString="1",
              lineColor={0,0,255}),
            Text(
              extent={{-109,72},{-89,88}},
              textString=" 1.3",
              lineColor={0,0,255}),
            Text(
              extent={{-109,-88},{-89,-72}},
              textString="-1.3",
              lineColor={0,0,255}),
            Text(
              extent={{62,30},{90,10}},
              lineColor={160,160,164},
              textString="u")}),
            Documentation(info="<html>
<p>This blocks computes the output <b>y</b> as the <i>base 10 logarithm</i> of the input <b>u </b>if <b>u&GT;1</b> or 0 otherwise </p>
<p><code>    y = if(u&GT;1) <b>log10</b>( u ) else 0;</code></p>
</html>"));
        end Log10AsEffect;

        block Parts "Divide the input value by weights"
          extends Modelica.Blocks.Interfaces.SIMO;
          parameter Real w[nout]=ones(nout) "Optional: weight coefficients";
    protected
         Real coef;
         Real weight[nout];
        equation
          ones(nout)*weight = 1;
          for i in 1:nout loop
              weight[i] = w[i] * coef;
              y[i] = u * weight[i];
          end for;
          annotation (defaultComponentName="parts",
            Documentation(info="<html>
<p>This blocks divide input value u to output array y by weights. The sum of output values is equal to input value <b>u</b>: </p>
<p><code>    u = (w[1]*y[1] + w[2]*y[2] + ... + w[n]*y[n]) / (w[1] + w[2] + ... + w[n]);</code></p>
<p>Example: </p>
<pre>     parameter:   nin = 3;  w=ones(3);

  results in the following equations:

<p><code>     y[1]=u/3,  y[2]=u/3,  y[3]=u/3;</code> </p>
</html>"),  Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Text(
              extent={{-100,-100},{100,100}},
              lineColor={0,0,0},
              textString="Parts")}));
        end Parts;

        block HomotopyStrongComponentBreaker
      "Break the strong component in normalized signal with independent default constant value"
          extends Modelica.Blocks.Interfaces.SISO;
          parameter Real defaultValue=1;
          parameter Real defaultSlope=0;
        equation
          y = homotopy(u,defaultValue + defaultSlope*(u-defaultValue));
          //y = homotopy(u,defaultValue);
           annotation (defaultComponentName="homotopy",
            Documentation(info="<html>
<p>This blocks should solve the initial strong component problem. In the non-linear-strong-component-cycled place, where the default or mean value of variable is known.</p>
<p>For example the regulation loop L driven by loop-dependent effect E with default value 1:</p>
<p> </p>
<p>E=f(L(E)) can be rewritten to E=f(L( H )), where H is output from this block with input E. </p>
</html>"),  Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
                initialScale=0.04), graphics={Text(
              extent={{-100,-24},{96,20}},
              lineColor={0,0,255},
                  textString="Homotopy")}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
                initialScale=0.04), graphics={Rectangle(
              extent={{-100,-100},{100,100}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{-98,-18},{98,26}},
              lineColor={0,0,255},
                  textString="Homotopy")}));
        end HomotopyStrongComponentBreaker;

        block DegradationGain
      "Output the degradation flow from HalfTime and the amount as the input signal"

          parameter Types.Time HalfTime
        "Half time to compute degradation from amount or mass";
    public
          Modelica.Blocks.Interfaces.RealInput u "Input signal connector" annotation (
              Placement(transformation(extent={{-140,-20},{-100,20}})));
          Modelica.Blocks.Interfaces.RealOutput y "Output signal connector" annotation (
             Placement(transformation(extent={{100,-10},{120,10}})));

        equation
          y = (Modelica.Math.log(2)/HalfTime)*u;
          annotation (
            Documentation(info="<html>
<p>
This block computes output <i>y</i> as
<i>product</i> of gain <i>k</i> with the
input <i>u</i>:
</p>
<pre>
    y = k * u;
</pre>

</html>"),         Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Polygon(
              points={{-100,-100},{-100,100},{100,0},{-100,-100}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-150,140},{150,100}},
              textString="%name",
              lineColor={0,0,255})}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={Polygon(
              points={{-100,-100},{-100,100},{100,0},{-100,-100}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{-76,38},{0,-34}},
              textString="k",
              lineColor={0,0,255})}));
        end DegradationGain;

        block FractionGain "Output the fraction of the input signal"

          parameter Types.Fraction f
        "Half time to compute degradation from amount or mass";
    public
          Modelica.Blocks.Interfaces.RealInput u "Input signal connector" annotation (
              Placement(transformation(extent={{-140,-20},{-100,20}})));
          Modelica.Blocks.Interfaces.RealOutput y "Output signal connector" annotation (
             Placement(transformation(extent={{100,-10},{120,10}})));

        equation
          y = f*u;
          annotation (
            Documentation(info="<html>
<p>
This block computes output <i>y</i> as
<i>product</i> of gain <i>k</i> with the
input <i>u</i>:
</p>
<pre>
    y = k * u;
</pre>

</html>"),         Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Polygon(
              points={{-100,-100},{-100,100},{100,0},{-100,-100}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-150,140},{150,100}},
              textString="%name",
              lineColor={0,0,255})}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={Polygon(
              points={{-100,-100},{-100,100},{100,0},{-100,-100}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{-76,38},{0,-34}},
              textString="k",
              lineColor={0,0,255})}));
        end FractionGain;
  end Math;

  package Interpolation "Empirical Dependence of Two Variables"
    extends Modelica.Icons.Package;
   function Spline "Cubic spline interpolation function"

        input Real[:] x "x coordinations of interpolating points"; //souradnice x souradnice uzlovych bodu
        input Real[:,4] a
        "cubic polynom coefficients of curve segments between interpolating points";                   //parametry kubiky
        input Real xVal "input value of x to calculate y value"; //vstupni hodnota

        output Real yVal "y value at xVal";
   //     output Real outExtra;
    protected
      Integer index "index of segment";
      Integer n "number of interpolating points";

   algorithm
          // Najdi interval, ve kterem se nachazi xVal

          if (xVal <= x[1]) then //kdyz je hodnota xVal pred prvnim uzlovym bodem

            yVal := xVal * a[1,3] + a[1,4]; //pocitam primku

          else
            n := size(x,1); //pocet uzlovych bodu
            if (xVal>=x[n]) then //kdyz je hodnota xVal za poslednim uzlovym bodem

               yVal := xVal * a[n+1,3] + a[n+1,4];  //pocitam primku

          else
            index := 2;
            while  xVal > x[index] and index < n loop
              index:=index+1;
            end while;
            yVal := ((a[index,1]*xVal + a[index,2])*xVal + a[index,3])*xVal + a[index,4];

            /*
         x1:=x[index-1];
         x2:=x[index];
         y1:=y[index-1];
         y2:=y[index];
         slope1:=slope[index-1];
         slope2:=slope[index];

         a1:=-(-x2*slope2 - x2*slope1 + slope2*x1 + slope1*x1 + 2*y2 - 2*y1)/(x2 - x1)^3;
         a2:=(-x2^2*slope2-2*x2^2*slope1-3*x2*y1+x2*slope1*x1+3*x2*y2-x2*slope2*x1-3*y1*x1+slope1*x1^2+3*y2*x1+2*slope2*x1^2)/(x2-x1)^3;
         a3:=-(-slope1*x2^3-2*x2^2*slope2*x1-x2^2*slope1*x1+x2*slope2*x1^2+2*x2*slope1*x1^2+6*x2*x1*y2-6*x2*x1*y1+slope2*x1^3)/(x2-x1)^3;
         a4:=(-slope1*x2^3*x1+y1*x2^3-slope2*x1^2*x2^2+slope1*x1^2*x2^2-3*y1*x2^2*x1+3*y2*x1^2*x2+slope2*x1^3*x2-y2*x1^3)/(x2-x1)^3;

         yVal :=a1*(xVal)^3 + a2*(xVal)^2 + a3*(xVal) + a4;
         */
            end if;
         end if;
     //    outExtra := xVal + yVal;
          annotation (Documentation(revisions="<html>
<p>author: Ondrej Vacek</p>
</html>"));
   end Spline;

   function SplineCoefficients "Cubic spline interpolation coefficients"

        input Real[:] x "x coordinations of interpolating points";
        input Real[:] y "y coordinations of interpolating points";
        input Real[:] slope "slopes at interpolating points";

        output Real[size(x,1)+1,4] a
        "cubic polynom coefficients of curve segments between interpolating points";                               //pocet hodnot ctyrech parametru kubiky je o jeden vic nez pocet bodu

    protected
      Integer n "number of interpolating points";
      Integer i "index of segment";

      Real x1 "previos point";
      Real x2 "current point";

      Real y1 "previous point";
      Real y2 "current point";
      Real slope1 "previous point";
      Real slope2 "current point";

   algorithm
      n := size(x,1);//pocet uzlovych bodu
      for i in 2:n loop //cyklus od 2 do n
            x1:=x[i-1]; //predchozi bod
            x2:=x[i];  //soucasny bod
            y1:=y[i-1]; //predchozi bod
            y2:=y[i]; //soucasny bod
            slope1:=slope[i-1]; //predchozi bod
            slope2:=slope[i]; //soucasny bod
            //vypocty parametru kubiky (od 2 do n) podle souradnic a smernic dvou bodu : y=a[i,4]+a[i,3]*x+a[i,2]*x^2+a[i,1]*x^3
            a[i,1]:=-(-x2*slope2 - x2*slope1 + x1*slope2 + x1*slope1 + 2*y2 - 2*y1)/(x2 - x1)^3;
            a[i,2]:=(-x2^2*slope2-2*x2^2*slope1-3*x2*y1+x2*slope1*x1+3*x2*y2-x2*slope2*x1-3*y1*x1+slope1*x1^2+3*y2*x1+2*slope2*x1^2)/(x2-x1)^3;
            a[i,3]:=-(-slope1*x2^3-2*x2^2*slope2*x1-x2^2*slope1*x1+x2*slope2*x1^2+2*x2*slope1*x1^2+6*x2*x1*y2-6*x2*x1*y1+slope2*x1^3)/(x2-x1)^3;
            a[i,4]:=(-slope1*x2^3*x1+y1*x2^3-slope2*x1^2*x2^2+slope1*x1^2*x2^2-3*y1*x2^2*x1+3*y2*x1^2*x2+slope2*x1^3*x2-y2*x1^3)/(x2-x1)^3;
      end for;
      a[1,  :] := { 0, 0, slope[1], y[1] - x[1]*slope[1]}; //vypocet prvni sady parametru kubiky  - primky
      a[n+1,:] := { 0, 0, slope[n], y[n] - x[n]*slope[n]}; //vypocet posledni sady parametru kubiky - primky

          annotation (Documentation(revisions="<html>
<p>author: Ondrej Vacek</p>
</html>"));
   end SplineCoefficients;

        model Curve
      "2D natural cubic interpolation spline defined with (x,y,slope) points"

             parameter Real x[:] = fill(Modelica.Constants.N_A,1)
        "x coordinations of interpolating points";
             parameter Real y[:] = fill(Modelica.Constants.N_A,1)
        "y coordinations of interpolating points";
             parameter Real slope[:] = fill(Modelica.Constants.N_A,1)
        "slopes at interpolating points";

             parameter Real[:,3] data = transpose({x,y,slope})
        "Array of interpolating points as {x,y,slope}";

            parameter Real Xscale = 1 "conversion scale to SI unit of x values";
            parameter Real Yscale = 1 "conversion scale to SI unit of y values";

             Modelica.Blocks.Interfaces.RealInput u
                          annotation (Placement(transformation(extent={{-120,
                -20},{-80,20}})));
             Modelica.Blocks.Interfaces.RealOutput val
                             annotation (Placement(transformation(extent={{80,-20},
                {120,20}})));

    protected
            parameter Real a[:,:] = SplineCoefficients( data[:, 1]*Xscale,data[:, 2]*Yscale,data[:, 3]*Yscale/Xscale)
        "cubic polynom coefficients of curve segments between interpolating points";

        equation
          val = Spline(
                data[:, 1]*Xscale,
                a,
                u);

           annotation ( Icon(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics={
            Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(
              points={{-70,-76},{-20,-48},{0,12},{34,62},{76,72}},
              color={0,0,127},
              smooth=Smooth.Bezier),
            Line(
              points={{-48,-82},{-48,90},{-48,90}},
              color={0,0,127},
              smooth=Smooth.Bezier,
              arrow={Arrow.None,Arrow.Filled}),
            Line(
              points={{-72,-74},{68,-74},{68,-74}},
              color={0,0,127},
              smooth=Smooth.Bezier,
              arrow={Arrow.None,Arrow.Filled})}));
        end Curve;
  end Interpolation;

  package Factors "Multiplication Effects"
    extends Modelica.Icons.Package;
    model Normalization "effect = u/NormalValue"
     extends Icons.BaseFactorIcon;

     parameter Real NormalValue=1
        "Normal value of u, because y=(u/NormalValue)*yBase.";

     parameter Boolean enabled=true "disabled => y=yBase";

     Modelica.Blocks.Interfaces.RealInput u
                  annotation (Placement(transformation(extent={{-100,-20},{-60,
                20}})));

      Types.Fraction effect;
    equation
      effect = if enabled then u/NormalValue else 1;
      y=effect*yBase;
      annotation ( Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>",
        info="<html>
<p><h4>y = yBase * u</h4></p>
</html>"));
    end Normalization;

    model DamagedFraction "effect = 1 - DamagedAreaFraction"
     extends Icons.BaseFactorIcon;

     parameter Types.Fraction DamagedAreaFraction = 0;

      Types.Fraction effect;
    equation
      effect = 1-DamagedAreaFraction;
      y=yBase*effect;
    end DamagedFraction;

    model Spline "effect = spline(data,u)"
     extends Icons.BaseFactorIcon4;
     Modelica.Blocks.Interfaces.RealInput u(nominal=Xscale)
                  annotation (Placement(transformation(extent={{-100,-20},{-60,
                20}})));

     parameter Boolean enabled=true "disabled => y=yBase";

     parameter Real[:,3] data "Array of interpolating points as {x,y,slope}";

     parameter Real Xscale = 1 "conversion scale to SI unit of x values";
     parameter Real Yscale = 1 "conversion scale to SI unit of y values";

     parameter Boolean UsePositiveLog10 = false
        "x = if u/scaleX <=1 then 0 else log10(u/scaleX)";

      Types.Fraction effect "Multiplication coeffecient for yBase to reach y";

    protected
        parameter Real a[:,:] = if enabled then Interpolation.SplineCoefficients(
                                                          data[:, 1],data[:, 2]*Yscale,data[:, 3]*Yscale) else zeros(1,1)
        "Cubic polynom coefficients of curve segments between interpolating points";

    equation
      effect = if not enabled then 1 elseif UsePositiveLog10 then Interpolation.Spline(data[:, 1],a,if u/Xscale <= 1 then 0 else log10(u/Xscale))
       else Interpolation.Spline(data[:, 1],a,u/Xscale);

      y=effect*yBase;
      annotation ( Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end Spline;

    model LagSpline "Adapt the input signal before interpolation"
     extends Icons.BaseFactorIcon5;
     Modelica.Blocks.Interfaces.RealInput u
                  annotation (Placement(transformation(extent={{-100,-20},{-60,
                20}})));

     parameter Boolean enabled=true "disabled => y=yBase";

     parameter Types.Time HalfTime(displayUnit="min"); //=3462.468;

     parameter Real initialValue = 1 "as u/Xscale";

     parameter Real Xscale = 1 "conversion scale to SI unit of x values";
     parameter Real Yscale = 1 "conversion scale to SI unit of y values";

     parameter Boolean UsePositiveLog10 = false
        "x = if u_delayed/scaleX <=1 then 0 else log10(u_delayed/scaleX)";

     parameter Real[:,3] data;
      Blocks.Math.Integrator integrator(k=(Modelica.Math.log(2)/
            HalfTime), y_start=initialValue*Xscale,
        NominalValue=Xscale)
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-38,38})));
      Modelica.Blocks.Math.Feedback feedback annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-38,68})));
      Types.Fraction effect;
      Spline spline(
        data=data,
        Xscale=Xscale,
        Yscale=Yscale,
        UsePositiveLog10=UsePositiveLog10,
        enabled=enabled)
        annotation (Placement(transformation(extent={{-10,-18},{10,2}})));
    equation
      effect = spline.effect;
      connect(feedback.y, integrator.u) annotation (Line(
          points={{-38,59},{-38,50}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(integrator.y, feedback.u2) annotation (Line(
          points={{-38,27},{-38,16},{-62,16},{-62,68},{-46,68}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(feedback.u1, u) annotation (Line(
          points={{-38,76},{-38,94},{-88,94},{-88,0},{-80,0}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(integrator.y, spline.u) annotation (Line(
          points={{-38,27},{-38,-8},{-8,-8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(yBase, spline.yBase) annotation (Line(
          points={{0,20},{0,-6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(spline.y, y) annotation (Line(
          points={{0,-12},{0,-40}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation ( Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>", info="<html>
<p>If the input signal u is constant and it is different from starting delayed input d, the middle value between u and d will be reached after HalfTime.</p>
<p>The mathematical background:</p>
<p>d&apos;(t) = k*(u(t) - d(t))       =&GT;       The solution of d(t) in special case, if u(t) is constant at each time t:  d(t)=u+(d(0)-u)*e^(-k*t),  where the definition of HalfTime is  d(HalfTime) = d(0) + (d(0)-u)/2.</p>
</html>"));
    end LagSpline;

    model SplineLag "Adapt the effect after interpolation"
     extends Icons.BaseFactorIcon3;
     Modelica.Blocks.Interfaces.RealInput u
                  annotation (Placement(transformation(extent={{-100,-20},{-60,
                20}})));

     parameter Boolean enabled=true "disabled => y=yBase";

     parameter Types.Time HalfTime(displayUnit="d");
                                                    //Tau(unit="day");

     parameter String stateName=getInstanceName()
        "Name in Utilities input/output function"
         annotation (Evaluate=true, HideResult=true, Dialog(group="Value I/O",tab="IO"));

     parameter Real Xscale = 1 "conversion scale to SI unit of x values";

     parameter Boolean UsePositiveLog10 = false
        "x = if u/scaleX <=1 then 0 else log10(u/scaleX)";

     parameter Real[:,3] data;
      Modelica.Blocks.Math.Product product annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={0,-32})));
      Blocks.Math.Integrator integrator(y_start=1, k=(
            Modelica.Math.log(2)/HalfTime),
        stateName=stateName)
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-26,12})));
      Modelica.Blocks.Math.Feedback feedback annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-26,44})));
      Types.Fraction effect;
      Spline spline(
        data=data,
        Xscale=Xscale,
        UsePositiveLog10=UsePositiveLog10,
        enabled=enabled)
        annotation (Placement(transformation(extent={{-36,56},{-16,76}})));
      Types.Constants.FractionConst fraction(k(displayUnit="1") = 1)
        annotation (Placement(transformation(extent={{-44,82},{-36,90}})));
    equation
      //der(effect) = (ln(2)/HalfTime)*(spline(data,u)-effect)
      effect = integrator.y;
      connect(yBase, product.u1) annotation (Line(
          points={{0,20},{0,30},{0,-20},{6,-20}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product.y, y) annotation (Line(
          points={{-2.02067e-015,-43},{-2.02067e-015,-55.5},{0,-55.5},{0,-40}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(feedback.y, integrator.u) annotation (Line(
          points={{-26,35},{-26,24}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(integrator.y, feedback.u2) annotation (Line(
          points={{-26,1},{-26,-8},{-50,-8},{-50,44},{-34,44}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(integrator.y, product.u2) annotation (Line(
          points={{-26,1},{-26,-8},{-6,-8},{-6,-20}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(feedback.u1, spline.y) annotation (Line(
          points={{-26,52},{-26,62}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(u, spline.u) annotation (Line(
          points={{-80,0},{-82,0},{-82,66},{-34,66}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(fraction.y, spline.yBase) annotation (Line(
          points={{-35,86},{-26,86},{-26,68}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation ( Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end SplineLag;

    model SplineLagOrZero "LagSpline if not Failed"
     extends Icons.BaseFactorIcon2;
     Modelica.Blocks.Interfaces.RealInput u
                  annotation (Placement(transformation(extent={{-120,-40},{-80,
                0}}), iconTransformation(extent={{-120,-40},{-80,0}})));

     parameter Boolean enabled=true "disabled => y=yBase";

     parameter Types.Time HalfTime(displayUnit="d");
     parameter Real[:,3] data;

     parameter String stateName=getInstanceName()
        "Name in Utilities input/output function"
         annotation (Evaluate=true, HideResult=true, Dialog(group="Value I/O",tab="IO"));

     parameter Real Xscale = 1 "conversion scale to SI unit of x values";

      Interpolation.Curve
                   curve(
      x=data[:, 1],
      y=data[:, 2],
      slope=data[:, 3],
        Xscale=Xscale)
        annotation (Placement(transformation(extent={{-76,-10},{-56,10}})));
      Modelica.Blocks.Math.Product product annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={0,-50})));
      Blocks.Math.Integrator integrator(y_start=1, k=(
            Modelica.Math.log(2)/HalfTime),
        stateName=stateName)
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-14,-6})));
      Modelica.Blocks.Math.Feedback feedback annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-14,26})));
      Modelica.Blocks.Logical.Switch switch1
        annotation (Placement(transformation(extent={{-48,40},{-28,60}})));
      Modelica.Blocks.Sources.Constant      Constant1(k=0)
        annotation (Placement(transformation(extent={{-70,52},{-58,64}})));
      Modelica.Blocks.Interfaces.BooleanInput
                                            Failed
                          annotation (Placement(transformation(extent={{-120,20},{-80,
                60}})));
       Types.Fraction effect;
      Modelica.Blocks.Logical.Switch switch2
        annotation (Placement(transformation(extent={{-24,90},{-4,70}})));
      Types.Constants.OneConst One
        annotation (Placement(transformation(extent={{-60,78},{-40,98}})));
      Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=enabled)
        annotation (Placement(transformation(extent={{-96,62},{-76,82}})));
    equation
      effect = integrator.y;
      connect(curve.u, u) annotation (Line(
          points={{-76,0},{-88,0},{-88,-20},{-100,-20}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(yBase, product.u1) annotation (Line(
          points={{0,60},{0,31},{0,-38},{6,-38}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product.y, y) annotation (Line(
          points={{-2.02067e-015,-61},{-2.02067e-015,-55.5},{0,-55.5},{0,-60}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(feedback.y, integrator.u) annotation (Line(
          points={{-14,17},{-14,6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(integrator.y, feedback.u2) annotation (Line(
          points={{-14,-17},{-14,-26},{-38,-26},{-38,26},{-22,26}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(integrator.y, product.u2) annotation (Line(
          points={{-14,-17},{-14,-26},{-6,-26},{-6,-38}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(curve.val, switch1.u3) annotation (Line(
          points={{-56,0},{-54,0},{-54,42},{-50,42}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Constant1.y, switch1.u1) annotation (Line(
          points={{-57.4,58},{-50,58}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(switch1.u2, Failed) annotation (Line(
          points={{-50,50},{-58,50},{-58,38},{-80,38},{-80,40},{-100,40}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(switch2.y, feedback.u1) annotation (Line(
          points={{-3,80},{0,80},{0,64},{-14,64},{-14,34}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(booleanConstant.y, switch2.u2) annotation (Line(
          points={{-75,72},{-38,72},{-38,80},{-26,80}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(switch2.u1, switch1.y) annotation (Line(
          points={{-26,72},{-34,72},{-34,66},{-22,66},{-22,50},{-27,50}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(One.y, switch2.u3) annotation (Line(
          points={{-37.5,88},{-26,88}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end SplineLagOrZero;
  end Factors;

  annotation (Documentation(revisions="<html>
<p>Licensed by Marek Matejak under the Modelica License 2</p>
<p>Copyright &copy; 2008-2014, Marek Matejak, Charles University in Prague.</p>
<p><br><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Physiolibrary.UsersGuide.ModelicaLicense2\">UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p>
</html>"));
end Blocks;

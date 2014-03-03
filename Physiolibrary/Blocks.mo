within Physiolibrary;
package Blocks "Base Signal Blocks Library"
  extends Modelica.Icons.Package;
  package Math "Modelica.Math extension"
    extends Modelica.Icons.Package;
    model Integrator "Integrator with support of steady state calculation."
      extends Physiolibrary.SteadyStates.Interfaces.SteadyState(
                                         state_start=y_start);

      parameter Real k=1 "Integrator gain";

      parameter Real y_start=0 "Initial or guess value of output (= state)"
        annotation (Dialog(group="Initialization"));
      extends Modelica.Blocks.Interfaces.SISO;

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
            Line(points={{-80,-80},{80,80}}, color={0,0,127}),
            Text(
              extent={{-150,106},{150,146}},
              lineColor={0,0,0},
              textString="%stateName")}),
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
            annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
              rotation=0)));
          Modelica.Blocks.Interfaces.RealOutput y "Output signal connector"
            annotation (Placement(transformation(extent={{100,-10},{120,10}},
              rotation=0)));

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
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics),
            Documentation(info="<html>
<p>This blocks computes the output <b>y</b> as <i>reciprocal value</i> of the input <b>u</b>: </p>
<p><code>    y = 1 / u ;</code> </p>
</html>"));
        end Reciprocal;

        block Exponentiation "b ^ u"

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
                  textString="b^u")}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
                initialScale=0.04), graphics));
        end Exponentiation;

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
              textString="Parts")}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics));
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

  end Math;

  package Interpolation "Empirical Dependence of Two Variables"
    extends Modelica.Icons.Package;
   function Spline "Cubic spline interpolation function"

        input Real[:] x; //souradnice x souradnice uzlovych bodu
        input Real[:,4] a; //parametry kubiky
        input Real xVal; //vstupni hodnota

        output Real yVal;
   //     output Real outExtra;
    protected
      Integer index;
      Integer n;

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

        input Real[:] x;
        input Real[:] y;
        input Real[:] slope;

        output Real[size(x,1)+1,4] a;//pocet hodnot ctyrech parametru kubiky je o jeden vic nez pocet bodu

    protected
      Integer n;
      Integer i;

      Real x1;
      Real x2;

      Real y1;
      Real y2;
      Real slope1;
      Real slope2;

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

             parameter Real x[:];
             parameter Real y[:];
             parameter Real slope[:];

             Modelica.Blocks.Interfaces.RealInput u
                          annotation (Placement(transformation(extent={{-120,
                -20},{-80,20}})));
             Modelica.Blocks.Interfaces.RealOutput val
                             annotation (Placement(transformation(extent={{80,-20},
                {120,20}})));

    protected
            parameter Real a[:,:] = SplineCoefficients(x,y,slope);

        equation
          val = Spline(
                x,
                a,
                u);

           annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),      graphics), Icon(coordinateSystem(
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
     Modelica.Blocks.Interfaces.RealInput u
                  annotation (Placement(transformation(extent={{-100,-20},{-60,
                20}})));

      Physiolibrary.Types.Fraction effect;
    equation
      effect = u/NormalValue;
      y=effect*yBase;
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false,extent={{-100,
                -100},{100,100}}), graphics), Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>",
        info="<html>
<p><h4>y = yBase * u</h4></p>
</html>"),
        Icon(graphics));
    end Normalization;

    model DamagedFraction "effect = 1 - DamagedAreaFraction"
     extends Icons.BaseFactorIcon;

     parameter Physiolibrary.Types.Fraction DamagedAreaFraction = 0;

      Physiolibrary.Types.Fraction effect;
    equation
      effect = 1-DamagedAreaFraction;
      y=yBase*effect;
    end DamagedFraction;

    model Spline "effect = spline(data,u)"
     extends Icons.BaseFactorIcon4;
     Modelica.Blocks.Interfaces.RealInput u
                  annotation (Placement(transformation(extent={{-100,-20},{-60,
                20}})));

     parameter Real[:,3] data;

      Physiolibrary.Types.Fraction effect;

    protected
        parameter Real a[:,:] = Interpolation.SplineCoefficients(
                                                          data[:, 1],data[:, 2],data[:, 3]);

    equation
      effect = Interpolation.Spline(
                             data[:, 1],a,u);
      y=effect*yBase;
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false,extent={{-100,
                -100},{100,100}}), graphics), Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end Spline;

    model SplineLag "Adapt the effect after interpolation"
     extends Icons.BaseFactorIcon3;
     Modelica.Blocks.Interfaces.RealInput u
                  annotation (Placement(transformation(extent={{-100,-20},{-60,
                20}})));
     parameter Physiolibrary.Types.Time HalfTime(displayUnit="d");
                                                    //Tau(unit="day");
     parameter Real[:,3] data;
      Interpolation.Curve
                   curve(
      x=data[:, 1],
      y=data[:, 2],
      slope=data[:, 3])
        annotation (Placement(transformation(extent={{-68,58},{-48,78}})));
      Modelica.Blocks.Math.Product product annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={0,-32})));
      Physiolibrary.Blocks.Math.Integrator integrator(y_start=1, k=(
            Modelica.Math.log(2)/HalfTime))
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-26,12})));
      Modelica.Blocks.Math.Feedback feedback annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-26,44})));
      Physiolibrary.Types.Fraction effect;
    equation
      //der(effect) = (ln(2)/HalfTime)*(spline(data,u)-effect)
      effect = integrator.y;
      connect(curve.u, u) annotation (Line(
          points={{-68,68},{-83,68},{-83,0},{-80,0}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(yBase, product.u1) annotation (Line(
          points={{0,20},{0,30},{0,-20},{6,-20}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product.y, y) annotation (Line(
          points={{-2.02067e-015,-43},{-2.02067e-015,-55.5},{0,-55.5},{0,-40}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(curve.val, feedback.u1) annotation (Line(
          points={{-48,68},{-26,68},{-26,52}},
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
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false,extent={{-100,
                -100},{100,100}}), graphics), Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end SplineLag;

    model LagSpline "Adapt the input signal before interpolation"
     extends Icons.BaseFactorIcon5;
     Modelica.Blocks.Interfaces.RealInput u
                  annotation (Placement(transformation(extent={{-100,-20},{-60,
                20}})));
     parameter Physiolibrary.Types.Time HalfTime(displayUnit="min")=3462.468;
                                                                 //40*60/Modelica.Math.log(2);
     parameter Real initialValue = 1; //40;
     parameter Real[:,3] data;
      Interpolation.Curve
                   curve(
      x=data[:, 1],
      y=data[:, 2],
      slope=data[:, 3])
        annotation (Placement(transformation(extent={{-28,18},{-8,38}})));
      Modelica.Blocks.Math.Product product annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={0,-32})));
      Physiolibrary.Blocks.Math.Integrator integrator(k=(Modelica.Math.log(2)/
            HalfTime), y_start=initialValue)
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-50,50})));
      Modelica.Blocks.Math.Feedback feedback annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-50,80})));
      Physiolibrary.Types.Fraction effect;
    equation
      effect = curve.val;
      connect(yBase, product.u1) annotation (Line(
          points={{0,20},{0,30},{0,-20},{6,-20}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product.y, y) annotation (Line(
          points={{-2.02067e-015,-43},{-2.02067e-015,-55.5},{0,-55.5},{0,-40}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(feedback.y, integrator.u) annotation (Line(
          points={{-50,71},{-50,62}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(integrator.y, feedback.u2) annotation (Line(
          points={{-50,39},{-50,28},{-74,28},{-74,80},{-58,80}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(feedback.u1, u) annotation (Line(
          points={{-50,88},{-50,94},{-88,94},{-88,0},{-80,0}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(integrator.y, curve.u) annotation (Line(
          points={{-50,39},{-50,28},{-28,28}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(curve.val, product.u2) annotation (Line(
          points={{-8,28},{-6,28},{-6,-20}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false,extent={{-100,
                -100},{100,100}}), graphics), Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>", info="<html>
<p>If the input signal u is constant and it is different from starting delayed input d, the middle value between u and d will be reached after HalfTime.</p>
<p>The mathematical background:</p>
<p>d&apos;(t) = k*(u(t) - d(t))       =&GT;       The solution of d(t) in special case, if u(t) is constant at each time t:  d(t)=u+(d(0)-u)*e^(-k*t),  where the definition of HalfTime is  d(HalfTime) = d(0) + (d(0)-u)/2.</p>
</html>"));
    end LagSpline;

    model SplineLagOrZero "LagSpline if not Failed"
     extends Icons.BaseFactorIcon2;
     Modelica.Blocks.Interfaces.RealInput u
                  annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));
     parameter Physiolibrary.Types.Time HalfTime(displayUnit="d");
     parameter Real[:,3] data;
      Interpolation.Curve
                   curve(
      x=data[:, 1],
      y=data[:, 2],
      slope=data[:, 3])
        annotation (Placement(transformation(extent={{-76,20},{-56,40}})));
      Modelica.Blocks.Math.Product product annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={0,-50})));
      Physiolibrary.Blocks.Math.Integrator integrator(y_start=1, k=(
            Modelica.Math.log(2)/HalfTime))
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-14,-6})));
      Modelica.Blocks.Math.Feedback feedback annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-14,26})));
      Modelica.Blocks.Logical.Switch switch1
        annotation (Placement(transformation(extent={{-36,40},{-16,60}})));
      Modelica.Blocks.Sources.Constant      Constant1(k=0)
        annotation (Placement(transformation(extent={{-82,62},{-62,82}})));
      Modelica.Blocks.Interfaces.BooleanInput
                                            Failed
                          annotation (Placement(transformation(extent={{-120,20},{-80,
                60}})));
       Physiolibrary.Types.Fraction effect;
    equation
      effect = integrator.y;
      connect(curve.u, u) annotation (Line(
          points={{-76,30},{-87,30},{-87,0},{-100,0}},
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
          points={{-14,17},{-14,14.25},{-14,14.25},{-14,11.5},{-14,6},{-14,6}},
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
      connect(switch1.y, feedback.u1) annotation (Line(
          points={{-15,50},{-14,50},{-14,34}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(curve.val, switch1.u3) annotation (Line(
          points={{-56,30},{-54,30},{-54,42},{-38,42}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Constant1.y, switch1.u1) annotation (Line(
          points={{-61,72},{-58,72},{-58,58},{-38,58}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(switch1.u2, Failed) annotation (Line(
          points={{-38,50},{-78,50},{-78,40},{-100,40}},
          color={255,0,255},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},
                {100,100}}),       graphics), Icon(coordinateSystem(
              preserveAspectRatio=true,  extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end SplineLagOrZero;
  end Factors;

  annotation (Documentation(revisions="<html>
<p>Licensed by Marek Matejak under the Modelica License 2</p>
<p>Copyright &copy; 2008-2014, Marek Matejak, Charles University in Prague.</p>
<p><br><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Physiolibrary.UsersGuide.ModelicaLicense2\">Physiolibrary.UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p>
</html>"));
end Blocks;

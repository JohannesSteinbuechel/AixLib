within AixLib.HVAC.FacadeVentilationUnit.BaseClasses;
model SetPower
  "This model defines a specific massflow rate based on the input power share"

  extends Modelica.Fluid.Interfaces.PartialTwoPort;

  parameter Modelica.SIunits.MassFlowRate m_flow_nominal=0.05
    "Nominal mass flow rate of fan";
  parameter Medium.AbsolutePressure p_start=Medium.p_default
    "Start value of pressure";
  parameter Real noUnits=1 "Number of identical FVU units";
  parameter Modelica.SIunits.PressureDifference dp_nominal=500
    "Initial pressure difference";
  parameter Medium.Temperature T_start=Medium.T_default
    "Start value of temperature";

  Modelica.Blocks.Tables.CombiTable1D volumeFlow(table=[0,1; 10,25; 20,40;
        30,60; 40,90; 50,100; 60,140; 70,175; 80,200; 90,225; 100,260])
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-56})));
  Modelica.Blocks.Interfaces.RealInput powerShare(
    min=0,
    max=100,
    nominal=60) "power share (percentage) for fan"
    annotation (Placement(transformation(
        origin={0,-100},
        extent={{-20,-20},{20,20}},
        rotation=90)));

  AixLib.Fluid.Movers.FlowControlled_m_flow fan(                     redeclare
      package Medium =                                                                          Medium,
    addPowerToMedium=false,
    m_flow_nominal=m_flow_nominal,
    T_start=T_start,
    m_flow(start=m_flow_nominal),
    dp(start=dp_nominal),
    dp_nominal=dp_nominal,
    p_start=p_start,
    riseTime=120,
    nominalValuesDefineDefaultPressureCurve=true)
    annotation (Placement(transformation(extent={{-10,10},{10,-10}})));
  Modelica.Blocks.Math.Gain gain(k=1.2/3600*noUnits)
                                             annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={0,-28})));
equation

  connect(port_a, fan.port_a)
    annotation (Line(points={{-100,0},{-56,0},{-10,0}}, color={0,127,255}));
  connect(fan.port_b, port_b)
    annotation (Line(points={{10,0},{56,0},{100,0}}, color={0,127,255}));
  connect(powerShare, volumeFlow.u[1]) annotation (Line(points={{0,-100},{0,
          -80},{-6.66134e-016,-80},{-6.66134e-016,-68}},
                                     color={0,0,127}));
  connect(gain.u, volumeFlow.y[1]) annotation (Line(points={{-4.44089e-016,
          -35.2},{-4.44089e-016,-46},{8.88178e-016,-46},{8.88178e-016,-45}},
                               color={0,0,127}));
  connect(gain.y, fan.m_flow_in) annotation (Line(points={{4.44089e-016,
          -21.4},{4.44089e-016,-24},{-0.2,-24},{-0.2,-12}},
                                       color={0,0,127}));
    annotation (choicesAllMatching=true,
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}})),
    Icon(graphics={
        Ellipse(
          extent={{-4,68},{4,0}},
          lineColor={0,0,0},
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-4,0},{4,-68}},
          lineColor={0,0,0},
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{0,4},{30,-4}},
          lineColor={0,0,0},
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-30,4},{0,-4}},
          lineColor={0,0,0},
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid),
        Ellipse(extent={{-30,68},{30,-68}}, lineColor={0,0,0}),
        Line(
          points={{8,54},{58,54}},
          color={170,213,255},
          arrow={Arrow.None,Arrow.Filled}),
        Line(
          points={{8,-44},{60,-44}},
          color={170,213,255},
          arrow={Arrow.None,Arrow.Filled}),
        Line(
          points={{-12,-20},{76,-20}},
          color={170,213,255},
          arrow={Arrow.None,Arrow.Filled}),
        Line(
          points={{0,8},{82,8}},
          color={170,213,255},
          arrow={Arrow.None,Arrow.Filled}),
        Line(
          points={{6,32},{76,32}},
          color={170,213,255},
          arrow={Arrow.None,Arrow.Filled})}),
    Documentation(info="<html>
<p>Thsi model sets the mass flow rate of the air flow through a facade ventilation unit based on the input value, which is the power share set point of the fan.</p>
</html>", revisions="<html>
<ul>
<li><i><span style=\"font-family: Arial,sans-serif;\">November 10, 2016&nbsp;</span></i> by Roozbeh Sangi and Marc Baranski:<br>Input changed from revolving speed to power.</li>
<li><i>August 20, 2008&nbsp;</i> by Peter Matthes:<br>Implemented.</li>
</ul>
</html>"));
end SetPower;
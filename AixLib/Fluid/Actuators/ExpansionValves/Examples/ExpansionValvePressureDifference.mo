within AixLib.Fluid.Actuators.ExpansionValves.Examples;
model ExpansionValvePressureDifference
  "Simple model to check different flow coefficient models with fixed inlet 
   and outlet states"
  extends Modelica.Icons.Example;

  // Define medium and parameters
  //
  package Medium =
   WorkingVersion.Media.Refrigerants.R134a.R134a_IIR_P1_395_T233_455_Horner
   "Actual medium of the compressor";

  parameter Modelica.SIunits.AbsolutePressure pInl=
    Medium.pressure(Medium.setBubbleState(Medium.setSat_T(TInl+5)))
    "Actual pressure at inlet conditions";
  parameter Modelica.SIunits.Temperature TInl = 348.15
    "Actual temperature at inlet conditions";
  parameter Modelica.SIunits.AbsolutePressure pOut=
    Medium.pressure(Medium.setDewState(Medium.setSat_T(TOut)))
    "Actual set point of the compressor's outlet pressure";
  parameter Modelica.SIunits.Temperature TOut = 278.15
    "Actual temperature at outlet conditions";

  parameter Modelica.SIunits.MassFlowRate m_flow_nominal = 0.1
    "Nominal mass flow rate";

  // Define components
  //
  AixLib.Fluid.Sources.FixedBoundary Source(
    redeclare package Medium = Medium,
    use_p=true,
    use_T=true,
    nPorts=1,
    p=pInl,
    T=TInl)
    "Source of constant pressure and temperature"
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  Modelica.Blocks.Sources.Sine valveOpening(
    amplitude=0.45,
    freqHz=1,
    offset=0.5)
    "Input signal to prediscribe expansion valve's opening"
    annotation (Placement(transformation(extent={{-80,40},{-60,60}})));
  WorkingVersion.Fluid.ExpansionValves.SimpleExpansionValves.IsothermalExpansionValve
    linearValve(
    redeclare package Medium = Medium,
    show_flow_coefficient=true,
    show_staInl=true,
    show_staOut=false,
    useInpFil=false,
    calcProc=WorkingVersion.Fluid.ExpansionValves.Utilities.Choices.CalcProc.flowCoefficient,
    AVal=2.01e-6,
    m_flow_nominal=m_flow_nominal,
    dpNom=1000000,
    redeclare model FlowCoefficient =
        WorkingVersion.Fluid.ExpansionValves.Utilities.FlowCoefficient.R134a.R134a_EEV_15)
    "Simple isothermal valve"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));

  AixLib.Fluid.Sources.FixedBoundary Sink(
    redeclare package Medium = Medium,
    p=pOut,
    T=TOut,
    nPorts=1)
    "Sink of constant pressure and temperature"
    annotation (Placement(transformation(extent={{80,-10},{60,10}})));

equation
  // Define connections of components
  //
  connect(Source.ports[1], linearValve.port_a)
    annotation (Line(points={{-60,0},{-10,0}}, color={0,127,255}));
  connect(valveOpening.y, linearValve.opeSet)
    annotation (Line(points={{-59,50},{-5,50},{-5,10.6}}, color={0,0,127}));
  connect(linearValve.port_b, Sink.ports[1])
    annotation (Line(points={{10,0},{60,0}}, color={0,127,255}));

end ExpansionValvePressureDifference;

within AixLib.Controls.Interfaces;
expandable connector BoilerControlBus
  "Standard data bus with boiler information"
  extends Modelica.Icons.SignalBus;

Boolean isOn "Switches Controler on and off";
Modelica.SIunits.Temperature TAmbient "Ambient air temperature";
Boolean switchToNightMode "Switches the boiler to night mode";
Modelica.SIunits.Power chemicalEnergyFlowRate "Flow of primary (chemical) energy into boiler";

  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Definition of a standard heat pump bus that contains basic data points that appear in every heat pump.</p>
</html>", revisions="<html>
<p>March 31, 2017, by Marc Baranski:</p>
<p>First implementation. </p>
</html>"));
end BoilerControlBus;
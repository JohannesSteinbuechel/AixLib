within AixLib.DataBase.ActiveWalls;
record UponorComfortPanelHL_Cooling
  "Ceiling cooling from Uponor Comfort panel HL"

extends ActiveWallBaseDataDefinition(
    Temp_nom=Modelica.SIunits.Conversions.from_degC({16,20,26}),
    q_dot_nom=74,
    k_isolation=0.38,
    VolumeWaterPerMeter=0.03848,
    Spacing=0.10,
    eps=0.9,
    C_ActivatedElement=1000,
    c_top_ratio=0.99,
    PressureDropExponent=1.8895,
    PressureDropCoefficient=32.981);
    annotation (Documentation(revisions="<html>
<ul>
<li><i>February 13, 2014&nbsp;</i> by Ana Constantin:<br/>
Implemented.</li>
</ul>
</html>",
      info="<html>
<h4><font color=\"#008000\">Overview</font></h4>
<p>Record for celing cooling system from Uponor Comfort panel HL.</p>
<p>Defines heat exchange properties and storage capacity of the active part of the wall.</p>
<h4><font color=\"#008000\">References</font></h4>
<p>Record is used with <a href=\"EBC.HVAC.Components.ActiveWalls.Panelheating_1D_Dis\">EBC.HVAC.Components.ActiveWalls.Panelheating_1D_Dis</a></p>
<p>Source:</p>
<ul>
<li>Product: Comfort Panel HL</li>
<li>Manufacturer: Uponor</li>
<li>Borschure: Geb&auml;udetechnik / TECHNISCHER GESAMTKATALOG 2013/14 / Uponor Kassettendeckensystzem Comfort Panel HL</li>
<li>c_top_ratio: guess value 99 %; goes towards the room</li>
<li>C_Floorheating: guess value (it shouldn&apos;t be too small, but the storage is minimal)</li>
<li>k_isolation: guess value according to the the PE-X material</li>
</ul>
</html>"));

end UponorComfortPanelHL_Cooling;
within AixLib.DataBase.Pipes.Copper;
record Copper_28x1_5 "Copper 28x1.5"

  extends PipeBaseDataDefinition(
    d_i=0.025,
    d_o=0.028,
    d=8900,
    lambda=393,
    c=390);
  // Constant chemical Values assumed

  annotation (Documentation(revisions="<html>
<ul>
<li><i>July 9, 2013&nbsp;</i> by Ole Odendahl:<br/>Formatted documentation appropriately</li>
<li><i>June 29, 2011&nbsp;</i> by Ana Constantin:<br/>Implemented.</li>
</ul>
</html>",
info="<html>
<h4><font color=\"#008000\">Overview</font></h4>
<p>
Record for copper pipe
</p>

<h4><font color=\"#008000\">References</font></h4>
<p>Record is used with <a href=\"HVAC.Components.Pipes.DynamicPipeEBC1\">HVAC.Components.Pipes.DynamicPipeEBC1</a></p>
<p>Source: </p>
<ul>
<li>DIN EN 1057:2010-06</li>
<li>Table 3, Page 14</li>
</ul>
</html>"));
end Copper_28x1_5;

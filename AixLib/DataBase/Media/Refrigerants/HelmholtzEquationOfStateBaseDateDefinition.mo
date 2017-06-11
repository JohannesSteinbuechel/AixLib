within AixLib.DataBase.Media.Refrigerants;
record HelmholtzEquationOfStateBaseDateDefinition
  "Base data definition for fitting coefficients of the Helmholtz EoS"
  extends Modelica.Icons.Record;

  parameter String name
  "Short description of the record"
  annotation (Dialog(group="General"));

  parameter Integer alpha_0_nL
  "Number of terms of the equation's (alpha_0) first part"
  annotation (Dialog(group="Ideal gas part"));
  parameter Real alpha_0_l1[:]
  "First coefficient of the equation's (alpha_0) first part"
  annotation (Dialog(group="Ideal gas part"));
  parameter Real alpha_0_l2[:]
  "Second coefficient of the equation's (alpha_0) first part"
  annotation (Dialog(group="Ideal gas part"));
  parameter Integer alpha_0_nP
  "Number of terms of the equation's (alpha_0) second part"
  annotation (Dialog(group="Ideal gas part"));
  parameter Real alpha_0_p1[:]
  "First coefficient of the equation's (alpha_0) second part"
  annotation (Dialog(group="Ideal gas part"));
  parameter Real alpha_0_p2[:]
  "Second coefficient of the equation's (alpha_0) second part"
  annotation (Dialog(group="Ideal gas part"));
  parameter Integer alpha_0_nE
  "Number of terms of the equation's (alpha_0) third part"
  annotation (Dialog(group="Ideal gas part"));
  parameter Real alpha_0_e1[:]
  "First coefficient of the equation's (alpha_0) third part"
  annotation (Dialog(group="Ideal gas part"));
  parameter Real alpha_0_e2[:]
  "Second coefficient of the equation's (alpha_0) third part"
  annotation (Dialog(group="Ideal gas part"));

  parameter Integer alpha_r_nP
  "Number of terms of the equation's (alpha_r) first part"
  annotation (Dialog(group="Residual part"));
  parameter Real alpha_r_p1[:]
  "First coefficient of the equation's (alpha_r) first part"
  annotation (Dialog(group="Residual part"));
  parameter Real alpha_r_p2[:]
  "Second coefficient of the equation's (alpha_r) first part"
  annotation (Dialog(group="Residual part"));
  parameter Real alpha_r_p3[:]
  "Third coefficient of the equation's (alpha_r) first part"
  annotation (Dialog(group="Residual part"));
  parameter Integer alpha_r_nB
  "Number of terms of the equation's (alpha_r) second part"
  annotation (Dialog(group="Residual part"));
  parameter Real alpha_r_b1[:]
  "First coefficient of the equation's (alpha_r) second part"
  annotation (Dialog(group="Residual part"));
  parameter Real alpha_r_b2[:]
  "Second coefficient of the equation's (alpha_r) second part"
  annotation (Dialog(group="Residual part"));
  parameter Real alpha_r_b3[:]
  "Third coefficient of the equation's (alpha_r) second part"
  annotation (Dialog(group="Residual part"));
  parameter Real alpha_r_b4[:]
  "Fourth coefficient of the equation's (alpha_r) second part"
  annotation (Dialog(group="Residual part"));
  parameter Integer alpha_r_nG
  "Number of terms of the equation's (alpha_r) third part"
  annotation (Dialog(group="Residual part"));
  parameter Real alpha_r_g1[:]
  "First coefficient of the equation's (alpha_r) third part"
  annotation (Dialog(group="Residual part"));
  parameter Real alpha_r_g2[:]
  "Second coefficient of the equation's (alpha_r) third part"
  annotation (Dialog(group="Residual part"));
  parameter Real alpha_r_g3[:]
  "Third coefficient of the equation's (alpha_r) third part"
  annotation (Dialog(group="Residual part"));
  parameter Real alpha_r_g4[:]
  "Fourth coefficient of the equation's (alpha_r) third part"
  annotation (Dialog(group="Residual part"));
  parameter Real alpha_r_g5[:]
  "Fifth coefficient of the equation's (alpha_r) third part"
  annotation (Dialog(group="Residual part"));
  parameter Real alpha_r_g6[:]
  "Sixth coefficient of the equation's (alpha_r) third part"
  annotation (Dialog(group="Residual part"));
  parameter Real alpha_r_g7[:]
  "Seventh coefficient of the equation's (alpha_r) third part"
  annotation (Dialog(group="Residual part"));

  annotation (Documentation(revisions="<html>
<ul>
  <li>
  June 9, 2017, by Mirko Engelpracht:<br/>
  First implementation (see <a href=\"https://github.com/RWTH-EBC/AixLib/issues/408\">issue 408</a>).
  </li>
</ul>
</html>", info="<html>
<p>This record is a base data definition for fitting coefficients of the <b>Helmholtz equation of state (EoS)</b>. The EoS allows the accurate description of fluids&apos; thermodynamic behaviour and uses the Helmholtz energy as fundamental thermodynamic relation with temperature and density as independent variables. The<b> general formula</b> of the EoS as it is implemented within <a href=\"modelica://AixLib.Media.Refrigerants.Interfaces.TemplateHybridTwoPhaseMedium\">AixLib.Media.Refrigerants.Interfaces.TemplateHybridTwoPhaseMedium</a> is given below:</p>
<p align=\"center\"><img src=\"modelica://AixLib/Resources/Images/DataBase/Media/Refrigerants/Helmholtz_EoS.png\"/> </p>
<p>As it can be seen, the general formula of the EoS can be divided in two part: The <b>ideal gas part</b> and the <b>residual part</b>. Both parts&apos; formulas are given below:</p>
<p align=\"center\"><img src=\"modelica://AixLib/Resources/Images/DataBase/Media/Refrigerants/Helmholtz_IdealGasPart.png\"/> </p>
<p align=\"center\"><img src=\"modelica://AixLib/Resources/Images/DataBase/Media/Refrigerants/Helmholtz_ResidualPart.png\"/> </p>
<p><br>Both, the ideal gas part and the residual part can be divided in three subparts (i.e. the summations) that contain different coefficients (e.g. nL, l<sub>i</sub>, p<sub>i</sub> or e<sub>i</sub>). These coefficients are the fitting coefficients and must be obtained during a fitting procedure. While the fitting procedure, the general formula of the EoS is fitted to external data (e.g. NIST Refprop 9.1) and the fitting coefficients are determined.</p>
<p><b>Assumptions and limitations</b> </p>
<p>The fitting procedure is performed for a<b> predefined range of the external data</b> that is given in terms of, for example, temperature and pressure. Therefore, all other thermodynamic state properties are also just defined within a certain predefined range and, as a consequence, the fitting coefficients are also just valid within the predefined range of Helmholtz energy.</p>
<p><b>References</b> </p>
<p>Thorade, Matthis; Saadat, Ali (2012): <a href=\"http://www.ep.liu.se/ecp/076/006/ecp12076006.pdf\">HelmholtzMedia - A fluid properties library</a>. In: <i>Proceedings of the 9th International Modelica Conference</i>; September 3-5; 2012; Munich; Germany. Link&ouml;ping University Electronic Press, S. 63&ndash;70.</p>
<p>Thorade, Matthis; Saadat, Ali (2013): <a href=\"http://gfzpublic.gfz-potsdam.de/pubman/item/escidoc:247373:5/component/escidoc:306833/247373.pdf\">Partial derivatives of thermodynamic state properties for dynamic simulation</a>. In:<i> Environmental earth sciences 70 (8)</i>, S. 3497&ndash;3503.</p>
<p>Sangi, Roozbeh; Jahangiri, Pooyan; Klasing, Freerk; Streblow, Rita; M&uuml;ller, Dirk (2014): <a href=\"http://dx.doi.org/10.3384/ecp14096\">A Medium Model for the Refrigerant Propane for Fast and Accurate Dynamic Simulations</a>. In: <i>The 10th International Modelica Conference</i>. Lund, Sweden, March 10-12, 2014: Link&ouml;ping University Electronic Press (Link&ouml;ping Electronic Conference Proceedings), S. 1271&ndash;1275</p>
</html>"));
end HelmholtzEquationOfStateBaseDateDefinition;

within PlanarMechanics.Sensors;
model TransformAbsoluteVector "Transform absolute vector in to another frame"
  extends Modelica.Icons.RotationalSensor;

  Interfaces.Frame_a frame_a
    "Coordinate system from which absolute kinematic quantities are measured"            annotation (Placement(
        transformation(extent={{-116,-16},{-84,16}})));

  Interfaces.Frame_resolve frame_resolve if
   (frame_r_in  == Modelica.Mechanics.MultiBody.Types.ResolveInFrameA.frame_resolve) or
   (frame_r_out == Modelica.Mechanics.MultiBody.Types.ResolveInFrameA.frame_resolve)
    "Coordinate system in which r_in or r_out is optionally resolved"
    annotation (Placement(transformation(extent={{84,-16},{116,16}}),
        iconTransformation(extent={{84,-15},{116,17}})));

  Modelica.Blocks.Interfaces.RealInput r_in[3]
    "Input vector resolved in frame defined by frame_r_in"
    annotation (Placement(transformation(extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={0,120})));
  Modelica.Blocks.Interfaces.RealOutput r_out[3]
    "Input vector r_in resolved in frame defined by frame_r_out"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={0,-110})));

  parameter Modelica.Mechanics.MultiBody.Types.ResolveInFrameA frame_r_in=
  Modelica.Mechanics.MultiBody.Types.ResolveInFrameA.frame_a
    "Frame in which vector r_in is resolved (1: world, 2: frame_a, 3: frame_resolve)";
  parameter Modelica.Mechanics.MultiBody.Types.ResolveInFrameA frame_r_out=
                  frame_r_in
    "Frame in which vector r_in shall be resolved and provided as r_out (1: world, 2: frame_a, 3: frame_resolve)";

protected
  Internal.BasicTransformAbsoluteVector basicTransformVector(frame_r_in=
        frame_r_in, frame_r_out=frame_r_out)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Interfaces.ZeroPosition zeroPosition if
    not (frame_r_in == Modelica.Mechanics.MultiBody.Types.ResolveInFrameA.frame_resolve or
         frame_r_out == Modelica.Mechanics.MultiBody.Types.ResolveInFrameA.frame_resolve)
    annotation (Placement(transformation(extent={{40,20},{60,40}})));

equation
  connect(basicTransformVector.frame_a, frame_a) annotation (Line(
      points={{-10,0},{-32.5,0},{-32.5,0},{-55,0},
          {-55,0},{-100,0}},
      color={95,95,95},
      thickness=0.5));
  connect(basicTransformVector.frame_resolve, frame_resolve) annotation (Line(
      points={{10,0},{32.5,0},{32.5,0},{55,0},
          {55,0},{100,0}},
      color={95,95,95},
      pattern=LinePattern.Dot));
  connect(zeroPosition.frame_resolve, basicTransformVector.frame_resolve)
    annotation (Line(
      points={{40,30},{30,30},{30,0},{10,0}},
      color={95,95,95},
      pattern=LinePattern.Dot));
  connect(basicTransformVector.r_out, r_out) annotation (Line(
      points={{0,-11},{0,-35.75},{0,-35.75},{0,
          -60.5},{0,-60.5},{0,-110}},
      color={0,0,127}));
  connect(basicTransformVector.r_in, r_in) annotation (Line(
      points={{0,12},{0,39},{0,39},{0,
          66},{0,66},{0,120}},
      color={0,0,127}));
  annotation (Icon(coordinateSystem(
          preserveAspectRatio=true,  extent={{-100,-100},{100,100}}),
        graphics={
        Line(
          points={{0,-70},{0,-100}},
          color={0,0,127}),
        Line(
          points={{0,100},{0,70}},
          color={0,0,127}),
        Text(
          extent={{-104,124},{-18,96}},
          textString="r_in"),
        Text(
          extent={{-124,-76},{2,-104}},
          textString="r_out"),
        Line(
          points={{95,0},{95,0},{70,0},{70,0}},
          pattern=LinePattern.Dot),
        Text(
          extent={{58,47},{189,22}},
          lineColor={95,95,95},
          textString="resolve"),
        Line(
          points={{-70,0},{-96,0},{-96,0}}),
        Text(
          extent={{-116,45},{-80,20}},
          lineColor={95,95,95},
          textString="a")}),
    Documentation(revisions="<html>
<p>
<img src=\"modelica://PlanarMechanics/Resources/Images/dlr_logo.png\" alt=\"DLR logo\">
<b>Developed 2010-2018 at the DLR Institute of System Dynamics and Control</b>
</p>
</html>",  info="<html>
<p>
The input vector \"Real r_in[3]\" is assumed to be an absolute kinematic quantity
of frame_a that is defined to be resolved in the frame defined
with parameter \"frame_r_in\". This model resolves vector r_in in the
coordinate system defined with parameter \"frame_r_out\" and returns the
transformed output vector as \"Real r_out[3]\";
</p>
</html>"));
end TransformAbsoluteVector;

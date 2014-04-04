within PlanarMechanics.Sensors.Internal;
partial model PartialAbsoluteSensor
  "Partial absolute sensor model for sensors defined by components"
  extends Modelica.Icons.RotationalSensor;

  Interfaces.Frame_a frame_a
    "Coordinate system at which the kinematic quantities are measured"          annotation (Placement(
        transformation(extent={{-116,-16},{-84,16}}, rotation=0)));

equation
   assert(cardinality(frame_a) > 0, "Connector frame_a must be connected at least once");
  annotation (Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics), Icon(coordinateSystem(preserveAspectRatio=true,
          extent={{-100,-100},{100,100}}), graphics={Text(
          extent={{-108,43},{-72,18}},
          lineColor={128,128,128},
          textString="a"), Line(
          points={{-70,0},{-96,0},{-96,0}},
          color={0,0,0},
          smooth=Smooth.None)}));
end PartialAbsoluteSensor;
use <./sides.scad>

// top_width & top_height are the dimensions of the top component that will fit into the container
// height includes the floor
// thickness is used for walls and floor and lip width and thickness
module container(top_width, top_length, height, thickness) {
  cutout_padding = 0.15;

  wall_height = height - thickness;
  lip_width = thickness;
  lip_thickness = thickness;

  box_width = top_width + (thickness * 2) + (cutout_padding * 2);
  box_length = top_length + (thickness * 2) + (cutout_padding * 2);

  // Sides
  translate([0, 0, thickness])
    sides(box_width, box_length, wall_height, thickness, lip_width, lip_thickness);

  // Floor
  cube([box_width, box_length, thickness]);
}

// test the component
container(220, 95, 50, 3);

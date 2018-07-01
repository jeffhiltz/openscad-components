use <./sides.scad>

/**
 * A collection of four sides and a floor for building a container.  It 
 * can hold a top or other components.
 *
 * @param top_width     width of the top it will hold (x-axis)
 * @param top_length    length of the top it will hold (y-axis)
 * @param height        combined height of the walls and floor (z-axis)
 * @param thickness     thickness of the sides and floor
 * @param lip_width     width of the lip that will hold components
 * @param lip_thickness thickness of the lip that will hold components
 */
 module container(top_width, top_length, height, thickness, lip_width, lip_thickness) {
  cutout_padding = 0.15;

  wall_height = height - thickness;

  box_width = top_width + (thickness * 2) + (cutout_padding * 2);
  box_length = top_length + (thickness * 2) + (cutout_padding * 2);

  // Sides
  translate([0, 0, thickness])
    sides(box_width, box_length, wall_height, thickness, lip_width, lip_thickness);

  // Floor
  cube([box_width, box_length, thickness]);
}

// test the component
container(220, 95, 50, 3, 3, 3);

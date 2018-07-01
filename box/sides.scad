/**
 * A single side for building a box that will hold other components.
 *
 * @param width         width of the side (x-axis)
 * @param height        height of the side (z-axis)
 * @param thickness     thickness of the side
 * @param lip_width     width of the lip that will hold components
 * @param lip_thickness thickness of the lip that will hold components
 */
 module side(width, height, thickness, lip_width, lip_thickness) {
  module lip(lip_width, lip_thickness) {
    translate([0, thickness, height - thickness - lip_thickness])
      cube([width, lip_width, lip_thickness]);
  }
  cube([width, thickness, height]);
  lip(lip_width, lip_thickness);
}

/**
 * A set of four sides for building a box that will hold other components.
 *
 * @param width         external width of the sides (x-axis)
 * @param length        external length of the sides (y-axis)
 * @param height        height of the sides (z-axis)
 * @param thickness     thickness of the sides
 * @param lip_width     width of the lip that will hold components
 * @param lip_thickness thickness of the lip that will hold components
 */
module sides(width, length, height, thickness, lip_width, lip_thickness) {
  translate([0, length, 0])
    rotate([0, 0, -90])
      side(length, height, thickness, lip_width, lip_thickness);
  translate([width, length, 0])
    rotate([0, 0, 180])
      side(width, height, thickness, lip_width, lip_thickness);
  translate([width, 0, 0])
    rotate([0, 0, 90])
      side(length, height, thickness, lip_width, lip_thickness);
  translate([0, 0, 0])
    rotate([0, 0, 0])
      side(width, height, thickness, lip_width, lip_thickness);
}

// Test the component
sides(220, 95, 50, 3, 3, 3);

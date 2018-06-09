$fn = 50;

/**
 * A component to hold a potentiometer.
 *
 * @param width        width of the component surface (x-axis)
 * @param length       length of the component surface (y-axis)
 * @param height       height of the component surface (z-axis)
 * @param notch_angles array of angles where to place notches
 */
module pot(width, length, height, notch_angles) {
  translate([width / 2, length / 2, height / 2]) {
    difference() {
      hole_radius = 3.6;
      notch_length = 10;
      notch_width = 2.5;
      notch_height = 2;

      // surface
      cube([width, length, height], true);

      // hole
      cylinder(h = 7, r = hole_radius, center = true);

      // notches
      for (notch_angle = notch_angles) {
        rotate([0, 0, notch_angle]) {
          translate([notch_width / -2, 0, -height / 2]) {
            cube([notch_width, notch_length, notch_height]);
          }
        }
      }
    }
  }
}

// Test the component
rows = 1;
columns = 8;

pot_length = 20;
pot_width = 25;
panel_thickness = 3;

for (i = [0:columns - 1]) {
  for (j = [0:rows - 1]) {
    translate([pot_width * i, pot_length * j, 0])
      pot(pot_width, pot_length, panel_thickness, [90 + (90 * j)]);
  }
}

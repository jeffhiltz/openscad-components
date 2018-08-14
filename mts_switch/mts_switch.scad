$fn = 64;

/**
 * A component to hold a MTS switch.  (eg: MTS-103)
 *
 * @param width        width of the component surface (x-axis)
 * @param length       length of the component surface (y-axis)
 * @param height       height of the component surface (z-axis)
 * @param tab_angle    orientation for alignment tab in degrees
 */
module mts(width, length, height, tab_angle = 0) {
  translate([width / 2, length / 2, height / 2]) {
    difference() {
      hole_radius = 3.0;
      sleve_height = 4.5;
      sleve_radius = 6.5;

      union() {
        // surface
        cube([width, length, height], true);
        // sleve
        translate([0, 0, (sleve_height - height) / -2])
          cylinder(h = sleve_height, r = sleve_radius, center = true);
        // tab
        tab_width = 8.0;
        tab_length = (length / 2) - 3.5;
        tab_height = sleve_height;
        rotate(tab_angle)
          translate([sleve_radius - (tab_width / 2), (tab_length / 2), (tab_height - height) / -2])
            cube([tab_width, tab_length, tab_height], center = true);
      }

      // hole
      cylinder(h = 7, r = hole_radius, center = true);
    }
  }
}

// Test the component
rows = 1;
columns = 1;

component_length = 25;
component_width = 25;
panel_thickness = 3;

for (i = [0:columns - 1]) {
  for (j = [0:rows - 1]) {
    translate([component_width * i, component_length * j, 0])
      mts(component_width, component_length, panel_thickness);
  }
}

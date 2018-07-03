$fn = 50;

/**
 * A component to hold a 3.5mm PJ392 jack.
 *
 * @param width        width of the component surface (x-axis)
 * @param length       length of the component surface (y-axis)
 * @param height       height of the component surface (z-axis)
 */
 module pj392(width, length, height) {
  translate([width / 2, length / 2, height / 2]) {
    difference() {
      hole_radius = 3.0;
      sleve_height = 4.5;
      recess_height = 1.7;

      union() {
        // surface
        cube([width, length, height], true);
        // sleve
        translate([0, 0, (sleve_height - height) / -2])
          cylinder(h = sleve_height, r = 5, center = true);
      }

      // hole
      cylinder(h = 7, r = hole_radius, center = true);

      // recess
      translate([0, 0, (height - recess_height) / 2])
        cylinder(h = recess_height, r = 4, center = true);
    }
  }
}


// Test the component
rows = 1;
columns = 2;

component_length = 20;
component_width = 20;
panel_thickness = 3;

for (i = [0:columns - 1]) {
  for (j = [0:rows - 1]) {
    translate([component_width * i, component_length * j, 0])
      pj392(component_width, component_length, panel_thickness);
  }
}

$fn = 64;

/**
 * A component to hold a micro USB breakout.
 *
 * @param width        width of the component surface (x-axis)
 * @param length       length of the component surface (y-axis)
 * @param height       height of the component surface (z-axis)
 * @param surround     boolean indicating whether surrounding walls should be rendered
 */
module micro_usb(width, length, height, surround = true) {
  translate([width / 2, length / 2, height / 2]) {
    peg_height = 4.0;
    peg_radius = 1.45;

    recess_width = 13.3;
    recess_length = 2.98;
    recess_height = 2.0;

    surround_height = 3.0;
    surround_width = 2.0;

    difference() {
      union() {
        // surface
        cube([width, length, height], true);
        
        // pegs
        translate([4.5, (-length / 2) + 9.3, height/2])
          cylinder(h = peg_height, r = peg_radius, center = false);
        // pegs
        translate([-4.5, (-length / 2) + 9.3, height/2])
          cylinder(h = peg_height, r = peg_radius, center = false);
        
        if (surround) {
          translate([(13.3 + (surround_width * 2)) / -2, (-length / 2), 0]) {
            difference() {
              cube([13.3 + (surround_width * 2), 15.6 + surround_width, surround_height]);
              translate([surround_width, 0, 0])
                cube([13.3, 15.6, surround_height]);
            }
          }
        }
      }
      
      // recess
      translate([-recess_width / 2, (-length / 2) + 14.11 - (recess_length / 2), (height / 2) - recess_height])
        cube([recess_width, recess_length, recess_height]);
    }
  }
}

// Test the component
rows = 1;
columns = 1;

component_length = 17.6;
component_width = 17.3;
panel_thickness = 2.0;

for (i = [0:columns - 1]) {
  for (j = [0:rows - 1]) {
    translate([component_width * i, component_length * j, 0])
      micro_usb(component_width, component_length, panel_thickness);
  }
}

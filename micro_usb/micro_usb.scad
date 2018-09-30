$fn = 64;

/**
 * A component to hold a micro USB breakout.
 *
 * @param height       height of the component surface (z-axis)
 */
module micro_usb(height) {
  peg_height = 4.0;
  peg_radius = 1.45;

  breakout_width = 13.3;
  breakout_length = 15.6;

  recess_width = breakout_width;
  recess_length = 2.98;
  recess_height = 2.0;

  surround_height = 3.0;
  surround_width = 2.0;

  width = breakout_width + (2 * surround_width);
  length = breakout_length + surround_width;

  translate([width / 2, length / 2, height / 2]) {
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
        
        translate([(breakout_width + (surround_width * 2)) / -2, (-length / 2), 0]) {
          difference() {
            cube([breakout_width + (surround_width * 2), breakout_length + surround_width, surround_height]);
            translate([surround_width, 0, 0])
              cube([breakout_width, breakout_length, surround_height]);
          }
        }
      }
      
      // recess
      translate([-recess_width / 2, (-length / 2) + (breakout_length - (recess_length / 2)) - (recess_length / 2), (height / 2) - recess_height])
        cube([recess_width, recess_length, recess_height]);
    }
  }
}

// Test the component
panel_thickness = 2.0;
micro_usb(panel_thickness);

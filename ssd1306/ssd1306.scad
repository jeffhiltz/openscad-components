$fn = 50;

// Desired dimensions for the whole panel
width = 45;
length = 35;

wall_thickness = 3.0;

// SSD1306 unit dimensions
unit_width = 27.9;
unit_length = 27.6;

width_padding = (width - unit_width) / 2;
length_padding = (length - unit_length) / 2;

// offset to result in screen cutout being centered on the component
screen_centering_offset = 1.8;

module ssd1306() {
  cutout_depth = 1.5;

  module surrounding() {
    l = unit_length + length_padding * 2;
    w = unit_width + width_padding * 2;
    h = wall_thickness;
    cube([l, w, h]);
  }

  module recess() {
    translate([length_padding + screen_centering_offset, width_padding, 0]) {
      cube([unit_length, unit_width, cutout_depth]); 
    }
  }
  
  module pegs() {
    radius = 1.4;
    height = 4.0;
    
    // top
    translate([length_padding + screen_centering_offset + radius + 1.3, width_padding + radius + 1.2, -height + cutout_depth]) {
      cylinder(height, radius * 1.0, radius);
    }
    translate([length_padding + screen_centering_offset + radius + 1.3, width_padding + unit_width - radius - 1.2, -height + cutout_depth]) {
      cylinder(height, radius * 1.0, radius);
    }
    
    // bottom
    translate([length_padding + screen_centering_offset + unit_length - radius - 0.4, width_padding + radius + 1.2, -height + cutout_depth]) {
      cylinder(height, radius * 1.0, radius);
    }
    translate([length_padding + screen_centering_offset + unit_length - radius - 0.4, width_padding + unit_width - radius - 1.2, -height + cutout_depth]) {
      cylinder(height, radius * 1.0, radius);
    }
    
    
  }
 
  // For the screen
  module cutout() {
    l = 14.0;
    w = 25.0;
    h = 1.7;
    center = width_padding + unit_width / 2;
    recessGap = 5.0;
    distanceFromCenter = w / 2;
    translate([length_padding + screen_centering_offset + recessGap, center - distanceFromCenter, 0]) {
      cube([l, w, wall_thickness]);
    }
  }
  
  // Space for the soldered pins
  module pins() {
    l = 2.5;
    w = 9.6;
    h = 1.9;
    recessGap = 1.0;
    translate([length_padding + screen_centering_offset + recessGap, width_padding + (unit_width - w) / 2, 0]) {
      cube([l, w, h]);
    }
  }
  
  difference() {
    surrounding();
    recess();
    cutout();
    pins();
  }
  pegs();
}

ssd1306();

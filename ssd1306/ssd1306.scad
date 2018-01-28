$fn = 50;

padding = 2.0;

wall_thickness = 2.0;

width = 27.9;
length = 30.1;

module ssd1306() {
  cutout_depth = 0.5;

  module surrounding() {
    l = length + padding * 2;
    w = width + padding * 2;
    h = wall_thickness;
    cube([l, w, h]);
  }

  module recess() {
    translate([padding, padding, 0]) {
      cube([length, width, cutout_depth]); 
    }
  }
  
  module pegs() {
    radius = 1.4;
    height = 5.0;
    
    // top
    translate([padding + radius + 1.3, padding + radius + 0.9, -height + cutout_depth]) {
      cylinder(height, radius * 1.0, radius);
    }
    translate([padding + radius + 1.3, padding + width - radius - 0.9, -height + cutout_depth]) {
      cylinder(height, radius * 1.0, radius);
    }
    
    // bottom
    translate([padding + length - radius - 0.4, padding + radius + 0.9, -height + cutout_depth]) {
      cylinder(height, radius * 1.0, radius);
    }
    translate([padding + length - radius - 0.4, padding + width - radius - 0.9, -height + cutout_depth]) {
      cylinder(height, radius * 1.0, radius);
    }
    
    
  }
 
  // For the screen
  module cutout() {
    l = 14.0;
    w = 25.0;
    h = 1.7;
    center = padding + width / 2;
    recessGap = 5.0;
    distanceFromCenter = w / 2;
    translate([padding + recessGap, center - distanceFromCenter, 0]) {
      cube([l, w, wall_thickness]);
    }
  }
  
  // Space for the soldered pins
  module pins() {
    l = 2.5;
    w = 9.6;
    h = 1.9;
    recessGap = 1.0;
    translate([padding + recessGap, padding + (width - w) / 2, 0]) {
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

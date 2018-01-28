$fn = 50;

padding = 2.0;

wall_thickness = 2.0;

width = 12.0;
length = 14.5;

module bme280() {
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
  
  module peg() {
    radius = 1.4;
    height = 3.0;
    center = padding + width / 2;
    recessGap = 1.5;
    distanceFromCenter = 2.7;
    translate([padding + radius + recessGap, center - distanceFromCenter, -height + cutout_depth]) {
      cylinder(height, radius * 1.0, radius);
    }
  }
 
  // For the sensor
  module cutout() {
    l = 3.0;
    w = 3.0;
    h = 1.7;
    center = padding + width / 2;
    recessGap = 1.8;
    distanceFromCenter = 0.7;
    translate([padding + recessGap, center + distanceFromCenter, 0]) {
      cube([l, w, wall_thickness]);
    }
  }
  
  // Space for the soldered pins
  module pins() {
    l = 2.5;
    w = 9.6;
    h = 1.9;
    recessGap = 1.5;
    translate([padding + length - l - recessGap, padding + (width - w) / 2, 0]) {
      cube([l, w, h]);
    }
  }
  
  difference() {
    surrounding();
    recess();
    cutout();
    pins();
  }
  peg();
}

bme280();

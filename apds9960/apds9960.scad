$fn = 50;

padding = 2.0;

wall_thickness = 2.0;

width = 13.5;
length = 13.0;

module apds9960() {
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
    height = 3.0;
    translate([padding + radius + 1, padding + radius + 1, -height + cutout_depth]) {
      cylinder(height, radius * 1.0, radius);
    }
    translate([padding + radius + 1, padding + width - radius - 1, -height + cutout_depth]) {
      cylinder(height, radius * 1.0, radius);
    }
  }
 
  module cutout() {
    l = 4.0;
    w = 2.5;
    h = 1.7;
    radius = h * 4;
    translate([padding + 1, padding + width / 2 - w/2, 0]) {
      cube([l, w, wall_thickness]);
      translate([l/2, w/2, h * 0.75 + radius]) {
        sphere(radius);
      }
    }
  }
  
  module pins() {
    l = 2.5;
    w = 12.0;
    h = 1.8;
    translate([padding + length - l - 1, padding + (width - w) / 2, 0]) {
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

apds9960();

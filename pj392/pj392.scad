$fn = 50;

// 3.5mm jack
module pj392(length, width, height) {
    difference() {
        hole_radius = 3.0;
        sleve_height = 4.5;
        
        union() {
          // surface
          cube([width, length, height], true);
          // sleve
          translate([0, 0, (sleve_height - height) / -2])
            cylinder(h = sleve_height, r = 4, center = true);
        }
      
        // hole
        cylinder(h = 7, r = hole_radius, center = true);
        
        // recess
        translate([0, 0, (height / 2) - 0.3])
          cylinder(h = 0.6, r = 4, center = true);
    }
}

rows = 1;
columns = 1;

component_length = 20;
component_width = 20;
panel_thickness = 3;

translate([component_width / 2, component_length / 2, 0]) {
    for (i = [0:columns - 1]) {
        for (j = [0:rows - 1]) {
            translate([component_width * i, component_length * j, 0])
                pj392(component_length, component_width, panel_thickness, [90 + (90 * j)]);
        }
    }
}
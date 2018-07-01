$fn = 50;

// mts-switch
module mts(length, width, height) {
    difference() {
        hole_radius = 3.0;
        sleve_height = 4.5;
        sleve_radius = 4.0;
        
        union() {
          // surface
          cube([width, length, height], true);
          // sleve
          translate([0, 0, (sleve_height - height) / -2])
            cylinder(h = sleve_height, r = sleve_radius, center = true);
          // tab
          tab_width = 1.0;
          tab_length = 1.0;
          tab_height = sleve_height + 1.0;
          tab_offset = 1.0;
          translate([tab_offset, 5.0 + (tab_length / 2), (tab_height - height) / -2])
            cube([tab_width, tab_length, tab_height], center = true);
        }
      
        // hole
        cylinder(h = 7, r = hole_radius, center = true);
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
                mts(component_length, component_width, panel_thickness, [90 + (90 * j)]);
        }
    }
}
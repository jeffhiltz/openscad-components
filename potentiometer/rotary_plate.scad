$fn = 50;

module pot(length, width, height, notch_angles) {
    difference() {
        hole_radius = 3.6;
        notch_length = 10;
        notch_width = 2.5;
        notch_height = 2;
        
        // surface
        cube([width, length, height], true);
        
        // hole
        cylinder(h = 7, r = hole_radius, center = true);

        // notches
        for (notch_angle = notch_angles) {
            rotate([0, 0, notch_angle]) {
                translate([notch_width / -2, 0, -height / 2]) {
                    cube([notch_width, notch_length, notch_height]);
                }
            }
        }
    }
}

rows = 1;
columns = 4;

pot_length = 20;
pot_width = 25;
panel_thickness = 3;

translate([pot_width / 2, pot_length / 2, 0]) {
    for (i = [0:columns - 1]) {
        for (j = [0:rows - 1]) {
            translate([pot_width * i, pot_length * j, 0])
                pot(pot_length, pot_width, panel_thickness, [90 + (90 * j)]);
        }
    }
}
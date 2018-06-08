$fn = 50;

module pot(length, width, height, notch_angles) {
    translate([width / 2, length / 2, height / 2]) {
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
}

rows = 1;
columns = 1;

pot_length = 30;
pot_width = 25;
panel_thickness = 3;


font = "Futura";

letter_size = 5;
letter_height = 0.5;
word = "VOL";

difference() {
    union(){
for (i = [0:columns - 1]) {
    for (j = [0:rows - 1]) {
        translate([pot_width * i, pot_length * j, 0])
            pot(pot_length, pot_width, panel_thickness, [45 + (90 * j)]);
    }
}


translate([pot_width / 2, (pot_length - 7.2) / 4, panel_thickness]) {
    linear_extrude(height = letter_height) {
        text(word, size = letter_size, font = font, halign = "center", valign = "center", $fn = 16);
    }
}
}

translate([pot_width / 2, pot_length - ((pot_length - 7.2) / 4), panel_thickness - (letter_height)]) {
    linear_extrude(height = letter_height) {
        text(word, size = letter_size, font = font, halign = "center", valign = "center", $fn = 16);
    }
}
}

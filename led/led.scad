$fn = 50;

module led(length, width, height) {
    difference() {
        hole_radius = 2.5;
        
        // surface
        cube([width, length, height], true);
        
        // hole
        cylinder(h = 7, r = hole_radius, center = true);
    }
}

rows = 1;
columns = 1;

led_length = 20;
led_width = 20;
panel_thickness = 3;

translate([led_width / 2, led_length / 2, 0]) {
    for (i = [0:columns - 1]) {
        for (j = [0:rows - 1]) {
            translate([led_width * i, led_length * j, 0])
                led(led_length, led_width, panel_thickness, [90 + (90 * j)]);
        }
    }
}
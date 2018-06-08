$fn = 50;

module headers(length, width, height, pins_length, pins_width) {
    translate([width / 2, length / 2, height / 2]) {
        difference() {
            hole_width = (pins_width * 2.54) + 0.6;
            hole_length = (pins_length * 2.54) + 0.6;
            
            // surface
            cube([width, length, height], true);
            
            // hole
            cube([hole_width, hole_length, height], true);
        }
    }
}

headers_length = 20;
headers_width = 25;
panel_thickness = 3;

headers(headers_length, headers_width, panel_thickness, 2, 8);


$fn = 50;

module headers(length, width, height, pins_length, pins_width) {
    hole_width = (pins_width * 2.54) + 0.6;
    hole_length = (pins_length * 2.54) + 0.6;

    surround_height = 8.5;
    surround_thickness = 1.0;
    lip_width = 0.75;

    translate([width / 2, length / 2, height / 2]) {
        difference() {
            union() {
                // surface
                cube([width, length, height], true);

                // surround
                color([0, 1, 0], alpha = 0.5)
                translate([0, 0, (surround_height + surround_thickness - height) / -2])
                    cube([
                        hole_width + (surround_thickness * 2),
                        hole_length + (surround_thickness * 2),
                        surround_height + surround_thickness
                    ], true);
            }

             // header body hole
            color([1, 0, 0])
                translate([0, 0, (surround_height - height) / -2])
                    cube([hole_width, hole_length, surround_height], true);

            // pins hole
            color([0, 0, 1])
            translate([0, 0, (surround_height + height) / -2])
                cube([hole_width - (lip_width * 2), hole_length - (lip_width * 2), surround_thickness + 10], true);

        }

    }
}

headers_length = 20;
headers_width = 25;
panel_thickness = 3;

headers(headers_length, headers_width, panel_thickness, 1, 8);


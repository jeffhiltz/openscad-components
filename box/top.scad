module surface(box_width, box_length, box_thickness, cutouts) {
    cutout_padding = 0.15;
  
    // a cutout to insert components.
    module cutout(width, length, x_offset, y_offset) {
      width = width + cutout_padding * 2;
      length = length + cutout_padding * 2;
      x_offset = x_offset - cutout_padding;
      y_offset = y_offset - cutout_padding;
      translate([x_offset, y_offset, 0])
        cube([width, length, box_thickness]);
    }

    // a lip to hold component in place.
    module lip(width, length, x_offset, y_offset, lip_width, lip_thickness) {
      width = width + cutout_padding * 2;
      length = length + cutout_padding * 2;
      x_offset = x_offset - cutout_padding;
      y_offset = y_offset - cutout_padding;
      translate([x_offset, y_offset, -lip_thickness]) {
        difference() {
          translate([-lip_width, -lip_width, 0])
            cube([width + lip_width * 2, length + lip_width * 2, lip_thickness]);
          translate([lip_width, lip_width, 0])
            cube([width - lip_width * 2, length - lip_width * 2, lip_thickness]);
        }
      }
    }


    difference() {
      cube([box_width, box_length, box_thickness]);
      for (c = cutouts) {
        cutout(c[0], c[1], c[2], c[3]);
      }
    }

    for (c = cutouts) {
      lip(c[0], c[1], c[2], c[3], 2, 1.25);
    }
}

// Test the component
box_width = 180;
box_length = 120;
box_thickness = 3;

cutouts = [
  [20, 100, 10, 10],
  [20, 100, 40, 10],
  [100, 20, 70, 10],
  [100, 20, 70, 40],
  [40, 40, 70, 70],
  [50, 40, 120, 70],
];

surface(box_width, box_length, box_thickness, cutouts);

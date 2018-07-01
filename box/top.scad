/**
 * A top surface which will hold other components in cutouts.
 * This component can be nested
 *
 * @param width        width of the component surface (x-axis)
 * @param length       length of the component surface (y-axis)
 * @param height       height of the component surface (z-axis)
 * @param cutouts      array of cutouts.  each cutout is array with four
                       values: cutout_width, cutout_length, x_offset, y_offset
 */
 module surface(width, length, height, cutouts) {
  cutout_padding = 0.15;

  // a cutout to insert components.
  module cutout(cutout_width, cutout_length, x_offset, y_offset) {
    cutout_width = cutout_width + cutout_padding * 2;
    cutout_length = cutout_length + cutout_padding * 2;
    x_offset = x_offset - cutout_padding;
    y_offset = y_offset - cutout_padding;
    translate([x_offset, y_offset, 0])
      cube([cutout_width, cutout_length, height]);
  }

  // a lip to hold component in place.
  module lip(cutout_width, cutout_length, x_offset, y_offset, lip_width, lip_thickness) {
    cutout_width = cutout_width + cutout_padding * 2;
    cutout_length = cutout_length + cutout_padding * 2;
    x_offset = x_offset - cutout_padding;
    y_offset = y_offset - cutout_padding;
    translate([x_offset, y_offset, -lip_thickness]) {
      difference() {
        translate([-lip_width, -lip_width, 0])
          cube([cutout_width + lip_width * 2, cutout_length + lip_width * 2, lip_thickness]);
        translate([lip_width, lip_width, 0])
          cube([cutout_width - lip_width * 2, cutout_length - lip_width * 2, lip_thickness]);
      }
    }
  }


  difference() {
    cube([width, length, height]);
    for (c = cutouts) {
      cutout(c[0], c[1], c[2], c[3]);
    }
  }

  for (c = cutouts) {
    lip(c[0], c[1], c[2], c[3], 2, 1.25);
  }
}

// Test the component
width = 180;
length = 120;
thickness = 3;

cutouts = [
  [20, 100, 10, 10],
  [20, 100, 40, 10],
  [100, 20, 70, 10],
  [100, 20, 70, 40],
  [40, 40, 70, 70],
  [50, 40, 120, 70],
];

surface(width, length, thickness, cutouts);

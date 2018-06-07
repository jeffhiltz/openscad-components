$fn = 50;

box_width = 200;
box_length = 140;
box_thickness = 4;

// width, length, x_offset, y_offset
cutouts = [
  [20, 100, 20, 20],
  [20, 100, 50, 20],
  [100, 20, 80, 20],
  [100, 20, 80, 50],
  [40, 40, 80, 80],
  [50, 40, 130, 80],
];


// a cutout to insert components.
module cutout(width, length, x_offset, y_offset) {
  translate([x_offset, y_offset, 0])
    cube([width, length, box_thickness]);
}

// a lip to hold component in place.
module lip(width, length, x_offset, y_offset, lip_width) {
  translate([x_offset, y_offset, -box_thickness]) {
    difference() {
      translate([-lip_width, -lip_width, 0])
        cube([width + lip_width * 2, length + lip_width * 2, box_thickness]);
      translate([lip_width, lip_width, 0])
        cube([width - lip_width * 2, length - lip_width * 2, box_thickness]);
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
  lip(c[0], c[1], c[2], c[3], 2);
}
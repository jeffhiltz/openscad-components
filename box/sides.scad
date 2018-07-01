module side(width, height, thickness, lip_width, lip_thickness) {
  module lip(lip_width, lip_thickness) {
    translate([0, thickness, height - thickness - lip_thickness])
      cube([width, lip_width, lip_thickness]);
  }
  cube([width, thickness, height]);
  lip(lip_width, lip_thickness);
}

module sides(width, length, height, thickness, lip_width, lip_thickness) {
  translate([0, length, 0])
    rotate([0, 0, -90])
      side(length, height, thickness, lip_width, lip_thickness);
  translate([width, length, 0])
    rotate([0, 0, 180])
      side(width, height, thickness, lip_width, lip_thickness);
  translate([width, 0, 0])
    rotate([0, 0, 90])
      side(length, height, thickness, lip_width, lip_thickness);
  translate([0, 0, 0])
    rotate([0, 0, 0])
      side(width, height, thickness, lip_width, lip_thickness);
}

// Test the component
sides(220, 95, 50, 3, 3, 3);

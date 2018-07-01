use <../../components/box/sides.scad>

cutout_padding = 0.15;

top_width = 220;
top_length = 95;

box_height = 47; // not including floor
box_thickness = 3;

lip_width = box_thickness;
lip_thickness = box_thickness;

box_width = top_width + (box_thickness * 2) + (cutout_padding * 2);
box_length = top_length + (box_thickness * 2) + (cutout_padding * 2);

// Sides
translate([0, 0, box_thickness])
  sides(box_width, box_length, box_height, box_thickness, lip_width, lip_thickness);

// Floor
cube([box_width, box_length, box_thickness]);

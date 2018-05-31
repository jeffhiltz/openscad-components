// Bezel for tiny Oled 0.96"
// Stiftleiste ist oben

$fn=50;
CLEARANCE=0.3;

WALL_THICKNESS=2.5;

OLED_XLENGTH=27.6 + CLEARANCE;
OLED_YLENGTH=27.8 + CLEARANCE;
OLED_XLEN_VISIBLE=25;
OLED_YLEN_VISIBLE=14.5;
OLED_FromTopToVisible=5.0+WALL_THICKNESS;

WALL_FRONT=1;
OUTER_LENGTH=WALL_THICKNESS*2 + 28;  // 28 is OLED_XLENGTH rounded up
EDGE_SIZE=4;
EDGE_ZLEN=1.9;
EDGE_PinHeight=0;

BOX_ZLENGTH=8;


module platform(x,y,dx,dy) {
    translate([x,y,WALL_FRONT+EDGE_ZLEN/2]) {
        translate([dx,dy,0]) cube([EDGE_SIZE, EDGE_SIZE, EDGE_ZLEN], center=true);
        cylinder(r1=1,r2=0.4,h=EDGE_PinHeight+EDGE_ZLEN/2);
    }
}

difference() {
    translate([0,0,BOX_ZLENGTH/2])
        cube([OUTER_LENGTH,OUTER_LENGTH,BOX_ZLENGTH], center=true);

    translate([0,OUTER_LENGTH/2 - OLED_YLEN_VISIBLE/2 - OLED_FromTopToVisible, 0])
        cube([OLED_XLEN_VISIBLE,OLED_YLEN_VISIBLE,100], center=true);
    translate([0,0,BOX_ZLENGTH/2 + WALL_FRONT])
    cube([OLED_XLENGTH+1, OLED_YLENGTH+1,BOX_ZLENGTH], center=true);
}

platform(-OLED_XLENGTH/2+EDGE_SIZE/2, -OLED_YLENGTH/2+EDGE_SIZE/2,-1,-1);
platform(OLED_XLENGTH/2-EDGE_SIZE/2, OLED_YLENGTH/2-EDGE_SIZE/2,1,1);
platform(OLED_XLENGTH/2-EDGE_SIZE/2, -OLED_YLENGTH/2+EDGE_SIZE/2,1,-1);
platform(-OLED_XLENGTH/2+EDGE_SIZE/2, OLED_YLENGTH/2-EDGE_SIZE/2,-1,1);

difference() {
    translate([0,0,WALL_FRONT/2])
      minkowski() {
        cube([OUTER_LENGTH+1, OUTER_LENGTH+1, WALL_FRONT], center=true);
        cylinder(r=2, h=0.001);
      }

    cube([OUTER_LENGTH,OUTER_LENGTH,BOX_ZLENGTH], center=true);
}

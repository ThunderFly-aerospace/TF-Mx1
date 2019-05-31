
//function for making hexagon
module hex(width, radius, height) {
	//witdh = diameter, radius = edge rounding, height = height

	hull() {
		translate([width/2-radius, 0, 0])cylinder(r=radius, h=height);
		rotate([0, 0, 60])translate([width/2-radius, 0, 0])cylinder(r=radius, h=height);
		rotate([0, 0, 120])translate([width/2-radius, 0, 0])cylinder(r=radius, h=height);
		rotate([0, 0, 180])translate([width/2-radius, 0, 0])cylinder(r=radius, h=height);
		rotate([0, 0, 240])translate([width/2-radius, 0, 0])cylinder(r=radius, h=height);
		rotate([0, 0, 300])translate([width/2-radius, 0, 0])cylinder(r=radius, h=height);
	}
}

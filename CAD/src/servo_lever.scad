include <../parameters.scad>

module servo_lever() {
    difference() {
        union() {
            hull() {
                cylinder(d=servo_gear_diameter+3, h=lever_thickness, $fn=40);
                translate([servo_lever_length, 0, 0])
                    cylinder(d=lever_hole_diameter+2, h=lever_thickness, $fn=20);
            }
            cylinder(d=servo_gear_diameter+3, h=servo_gear_height+1, $fn=40);
        }

        cylinder(d=servo_gear_diameter, h=servo_gear_height, $fn=20);

        translate([servo_lever_length, 0, 0])
            cylinder(d=lever_hole_diameter, h=10, $fn=20);

        translate([0, 0, servo_gear_height+0.25])
            cylinder(d=2.1, h=10, $fn=20);
    }
}

servo_lever();
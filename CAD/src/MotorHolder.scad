include <../parameters.scad>;
include <functions.scad>;

pipeInsideHeight = 20;
pipeInsideRadius = 13;
screwHoleHeight = 9;
screwPipeHoleOffset = 13;
nutHoleRadius = 5.5;
pipeNumberHoles = 3;
wireHoleRadius = 5;
motorPlatformHeight = 8;
motorPlatformLength = 30;
motorPlatformOffset = -4;
motorPlatformSuppWidth = 3;
motorPlatformRadius = 15;
motorScrewSmallRadius = 8;
motorScrewLargeRadius = 9.5;
motorScrewRotation = 45;
motorMiddleHoleRadius = 2.5;
motorMiddleHoleHeight = 1.5;

$fn = 100;

difference() {
	union() {
	    difference() {
		cylinder(pipeInsideHeight, pipeInsideRadius-global_clearance, pipeInsideRadius-global_clearance);
		translate([0, pipeInsideRadius/4, -1])
			cylinder(pipeInsideHeight+2, wireHoleRadius, wireHoleRadius);
	    }
	    translate([0, motorPlatformOffset, (motorPlatformLength+pipeInsideHeight)/2])
		intersection() {
		    translate([0, -motorPlatformOffset, 0])
			union() {
			    translate([0, 0, -pipeInsideRadius/2])
				cylinder(motorPlatformLength+pipeInsideHeight-pipeInsideRadius, pipeInsideRadius-global_clearance, pipeInsideRadius-global_clearance, true);
			    translate([0, 0, (motorPlatformLength+pipeInsideHeight)/2-motorPlatformRadius])
				sphere(motorPlatformRadius);
		    }
		    difference() {
			union() {
			    intersection() {
				translate([0, -motorPlatformOffset, 0])
					cylinder(motorPlatformLength+pipeInsideHeight, pipeInsideRadius-global_clearance, pipeInsideRadius-global_clearance, true);
				rotate([0, 0, 90])
					translate([-pipeInsideRadius/2, 0, 0])
						cube([pipeInsideRadius, motorPlatformSuppWidth, motorPlatformLength+pipeInsideHeight], true);
			    }
			    difference() {
				cube([motorPlatformRadius*2, motorPlatformHeight, motorPlatformLength+pipeInsideHeight], true);
				for(i = [0:2]) {
				    translate([0, 0, (motorPlatformLength+pipeInsideHeight)/2-motorPlatformRadius])
					rotate([0, 180*i+motorScrewRotation, 0])
						translate([motorScrewSmallRadius, 0, 0])
							rotate([90, 0, 0])
								cylinder(motorPlatformHeight+2, M3_screw_diameter/2, M3_screw_diameter/2,true);
				    translate([0, 0, (motorPlatformLength+pipeInsideHeight)/2-motorPlatformRadius])
						rotate([0, 180*i+90+motorScrewRotation, 0])
							translate([motorScrewLargeRadius, 0, 0])
								rotate([90, 0, 0])
									cylinder(motorPlatformHeight+2, M3_screw_diameter/2, M3_screw_diameter/2,true);
				}
			    }   
			}
			translate([0, -motorPlatformOffset, (motorPlatformLength+pipeInsideHeight)/2-motorPlatformRadius])
				rotate([90, 0, 0])
					cylinder(motorMiddleHoleHeight, motorMiddleHoleRadius, motorMiddleHoleRadius, true);
		    }
	    }
	}
	for(i = [0:pipeNumberHoles])
		rotate([0, 0, (360/pipeNumberHoles)*i+30])
			translate([pipeInsideRadius-screwHoleHeight, 0, pipeInsideHeight-screwPipeHoleOffset])
				rotate([0, 90, 0])
					union() {
						cylinder(screwHoleHeight, M3_screw_diameter/2, M3_screw_diameter/2);
						translate([0, 0, nutHoleRadius])
						union() {
							translate([-pipeInsideHeight/2, 0, 0])cube([pipeInsideHeight, M3_nut_diameter, M3_nut_height], true);
							translate([0, 0, -M3_nut_height/2])rotate([0, 0, 90])hex(M3_nut_diameter, 0.2, M3_nut_height);
						}
					}
}

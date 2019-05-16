pipeInsideHeight = 20;
pipeInsideRadius = 13;
screwHoleHeight = 10;
screwHoleSmallRadius = 1.25;
screwHoleLargeRadius = 1.6;
pipeNumberHoles = 3;
wireHoleRadius = 5;
motorPlatformHeight = 5;
motorPlatformLength = 30;
motorPlatformOffset = -2;
motorPlatformSuppWidth = 3;
motorPlatformRadius = 15;
motorScrewSmallRadius = 8;
motorScrewLargeRadius = 9.5;
motorScrewRotation = 45;
motorMiddleHoleRadius = 2.5;
motorMiddleHoleHeight = 1.5;

rotate([90, 0, 0]) {
    difference() {
        union() {
            difference() {
                cylinder(pipeInsideHeight, pipeInsideRadius, pipeInsideRadius);
                translate([0, pipeInsideRadius/4, -1]) {
                    cylinder(pipeInsideHeight+2, wireHoleRadius, wireHoleRadius);
                }
            }
            translate([0, motorPlatformOffset, (motorPlatformLength+pipeInsideHeight)/2]) {
                intersection() {
                    translate([0, -motorPlatformOffset, 0]) {
                        union() {
                            translate([0, 0, -pipeInsideRadius/2]) {
                                cylinder(motorPlatformLength+pipeInsideHeight-pipeInsideRadius, pipeInsideRadius, pipeInsideRadius, true);
                            }
                            translate([0, 0, (motorPlatformLength+pipeInsideHeight)/2-motorPlatformRadius]) {
                                sphere(motorPlatformRadius);
                            }
                        }
                    }
                    difference() {
                        union() {
                            intersection() {
                                translate([0, -motorPlatformOffset, 0]) {
                                        cylinder(motorPlatformLength+pipeInsideHeight, pipeInsideRadius, pipeInsideRadius, true);
                                    }
                                rotate([0, 0, 90]) {
                                    translate([-pipeInsideRadius/2, 0, 0]) {
                                        cube([pipeInsideRadius, motorPlatformSuppWidth, motorPlatformLength+pipeInsideHeight], true);
                                    }
                                }
                            }
                            difference() {
                                cube([motorPlatformRadius*2, motorPlatformHeight, motorPlatformLength+pipeInsideHeight], true);
                                for(i = [0:2]) {
                                    translate([0, 0, (motorPlatformLength+pipeInsideHeight)/2-motorPlatformRadius]) {
                                        rotate([0, 180*i+motorScrewRotation, 0]) {
                                            translate([motorScrewSmallRadius, 0, 0]) {
                                                rotate([90, 0, 0]) {
                                                    cylinder(motorPlatformHeight+2, screwHoleLargeRadius, screwHoleLargeRadius,true);
                                                }
                                            }
                                        }
                                    }
                                    translate([0, 0, (motorPlatformLength+pipeInsideHeight)/2-motorPlatformRadius]) {
                                        rotate([0, 180*i+90+motorScrewRotation, 0]) {
                                            translate([motorScrewLargeRadius, 0, 0]) {
                                                rotate([90, 0, 0]) {
                                                    cylinder(motorPlatformHeight+2, screwHoleLargeRadius, screwHoleLargeRadius,true);
                                                }
                                            }
                                        }
                                    }
                                }
                            }   
                        }
                        translate([0, -motorPlatformOffset, (motorPlatformLength+pipeInsideHeight)/2-motorPlatformRadius]) {
                            rotate([90, 0, 0]) {
                                cylinder(motorMiddleHoleHeight, motorMiddleHoleRadius, motorMiddleHoleRadius, true);
                            }
                        }
                    }
                }
            }
        }
        for(i = [0:pipeNumberHoles]){
            rotate([0, 0, (360/pipeNumberHoles)*i+30]) {
                translate([pipeInsideRadius-screwHoleHeight, 0, pipeInsideHeight/2]) {
                    rotate([0, 90, 0]) {
                        cylinder(screwHoleHeight, screwHoleSmallRadius, screwHoleSmallRadius);
                    }
                }
            }
        }
    }
}
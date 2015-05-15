// Adapto Flex is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/
// Originated from Adapto https://github.com/rotorit/Adapto
include <./inc/configuration.scad>
use <./inc/polyarc.scad>

yMotor();

module yMotor(){

    difference(){

	union(){
	    // frame mount
	    translate([0, frameX, 0])
		cube([45, thickness, frameY+thickness]);
	    cube([45, frameX+thickness+40, thickness]);
	    // nema bracing
	    hull(){
		translate([-2, frameX, 0])
		    cube([thickness, thickness, frameY+thickness]);
		translate([-2, frameX, 0])
		    cube([thickness, thickness+40, thickness]);
	    }
	    hull(){
		translate([42, frameX, 0])
		    cube([thickness, thickness, frameY+thickness]);
		translate([42, frameX, 0])
		    cube([thickness, thickness+40, thickness]);
	    }

	}// end union

	// frame mount holes
	translate([frameY/2, frameX+thickness+1, thickness+frameY/2])
	    rotate([90,0,0])
	    polyhole(d=M5, h=thickness+2);
	translate([45-frameY/2, frameX+thickness+1, thickness+frameY/2])
	    rotate([90,0,0])
	    polyhole(d=M5, h=thickness+2);
	translate([45/2, frameX/2, -1])
	    polyhole(d=M5, h=thickness+2);
	
	// nema holes
	translate([45/2, frameX+thickness+40/2, -1])
	    polyhole(d=22, h=thickness+2);
	translate([45/2+31/2, frameX+thickness+40/2+31/2, -1])
	    polyhole(d=M3, h=thickness+2);
	translate([45/2-31/2, frameX+thickness+40/2+31/2, -1])
	    polyhole(d=M3, h=thickness+2);
	translate([45/2+31/2, frameX+thickness+40/2-31/2, -1])
	    polyhole(d=M3, h=thickness+2);
	translate([45/2-31/2, frameX+thickness+40/2-31/2, -1])
	    polyhole(d=M3, h=thickness+2);
	
    }// end difference

}
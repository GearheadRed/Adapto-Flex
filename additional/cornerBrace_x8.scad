// Adapto Flex is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/
// Originated from Adapto https://github.com/rotorit/Adapto
include <../inc/configuration.scad>
use <../inc/polyarc.scad>

// Rotated to improve skin strength
rotate([90, 0, 0])
	cornerBrace();

module cornerBrace(){

	difference(){

		hull(){
			cube([frameY*2, frameX, thickness]);
			cube([thickness, frameX, frameY*2]);
		}

		// M5 holes
		translate([frameY+M5, frameX/2, -1])
			polyhole(d=M5, h=frameX);
		translate([-1, frameX/2, frameY+M5])
			rotate([0,90,0])
			polyhole(d=M5, h=frameX);
		// M5 allen recess
		translate([frameY+M5, frameX/2, thickness+2])
			polyhole(d=M5nut, h=frameX);
		translate([thickness+2, frameX/2, frameY+M5])
			rotate([0,90,0])
			polyhole(d=M5nut, h=frameX);

	}// end difference

}
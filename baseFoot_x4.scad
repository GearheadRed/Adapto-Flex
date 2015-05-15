// Adapto Flex is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/
// Originated from Adapto https://github.com/rotorit/Adapto
include <./inc/configuration.scad>
use <./inc/polyarc.scad>

foot();

module foot(){
height=65;

	difference(){

		union(){
			cube([frameX*2, frameX, thickness]);
			cube([frameX, frameX*2, thickness]);
			hull(){
				cube([2*frameX, thickness, thickness]);
				translate([0, 0, height-thickness-frameY/2])
					cube([frameX, thickness, thickness]);
			}
			hull(){
				cube([thickness, 2*frameX, thickness]);
				translate([0, 0, height-thickness-frameY/2])
					cube([thickness, frameX, thickness]);
			}

		}// end union

		// bolt holes
		translate([frameX/2, frameX/2, 0])
			polyhole(d=M5, h=thickness+2);
		translate([frameX/2, 3*frameX/2, 0])
			polyhole(d=M5, h=thickness+2);
		translate([3*frameX/2, frameX/2, 0])
			polyhole(d=M5, h=thickness+2);

	}// end difference

}
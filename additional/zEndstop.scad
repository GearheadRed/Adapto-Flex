// Adapto Flex is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/
// Originated from Adapto https://github.com/rotorit/Adapto
include <../inc/configuration.scad>
use <../inc/polyarc.scad>

zStop();

module zStop(){

	difference(){

		union(){

			translate([0, 0, 0])
			    polycyl(d=smoothRod+thickness, h=smoothRod);
			translate([-(smoothRod+thickness)/2, 0, 0])
			    cube([smoothRod+thickness, smoothRod*2, smoothRod]);

		}// end union

		translate([0, 0, -1])
		    polyhole(d=smoothRod, h=smoothRod+2);
		translate([-(smoothRod-2)/2, 0, -1])
		    cube([smoothRod-2, 40, smoothRod+2]);
		translate([0, smoothRod+M3, -1])
		    cube([smoothRod, 20, smoothRod+2]);

		// holes
		translate([-10, smoothRod/2+M3, smoothRod/2])
		    rotate([0, 90, 0])
		    polyhole(d=M3, h=20);
		translate([smoothRod/2+1.5, smoothRod/2+M3, smoothRod/2])
		    rotate([0, 90, 0])
		    polynut(d=M3nut, h=5);
		

	}// end difference

}
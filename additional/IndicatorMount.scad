// Adapto Flex is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/
// Originated from Adapto https://github.com/rotorit/Adapto
include <../inc/configuration.scad>
use <../inc/polyarc.scad>		

indicatorBracket();

module indicatorBracket(){

    difference(){

	union(){
	    
	    cube([70+smoothRod+thickness, smoothRod+thickness, smoothRod]);

	}// end union

	// rod holes
	translate([smoothRod/2+thickness/2, smoothRod/2+thickness/2-1, -1])
	    polyhole(d=smoothRod, h=smoothRod+2);
	translate([70+smoothRod/2+thickness/2, smoothRod/2+thickness/2-1, -1])
	    polyhole(d=smoothRod, h=smoothRod+2);
	
	// rod cutouts
	translate([thickness/2+1, -1, -1])
	    cube([smoothRod-1, smoothRod/2+thickness/2, smoothRod+2]);
	translate([70+thickness/2, -1, -1])
	    cube([smoothRod-1, smoothRod/2+thickness/2, smoothRod+2]);
	
	// indicator hole
	translate([smoothRod+thickness+14, smoothRod+thickness-7-6.75/2, -1])
	    polyhole(d=6.75, h=smoothRod+2);
	
	translate([smoothRod+thickness+6, -1, smoothRod-3])
	    cube([16, 20, 4]);
	
    }// end difference
}
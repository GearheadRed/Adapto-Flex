// Adapto Flex is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/
// Originated from Adapto https://github.com/rotorit/Adapto
include <./inc/configuration.scad>
use <./inc/polyarc.scad>

yBlock();

module yBlock(){
    length=M3nut*2+25+M3nut*2;

    difference(){

	union(){
	    // belt base
	    cube([length, linearBearing[2]/2, thickness]);
	    translate([length/2-linearBearing[1]/2, 0, 0])
		cube([linearBearing[1], linearBearing[2]/2, thickness/2+linearBearing[1]/2+smoothRod/2+frameY]);

	}// end union

	// base mount holes and traps
	translate([4, linearBearing[2]/4, -1])
	    polycyl(d=M3, h=thickness+2);
	translate([length-4, linearBearing[2]/4, -1])
	    polycyl(d=M3, h=thickness+2);

	// belt trap
	translate([length/2-linearBearing[1]/2+thickness, -1, thickness/2+linearBearing[1]/2+smoothRod/2+frameY/4])
	    cube([3, linearBearing[2]/2+2, frameY/2]);
	translate([length/2-linearBearing[1]/2+linearBearing[1]-thickness-3, -1, thickness/2+linearBearing[1]/2+smoothRod/2+frameY/4])
	    cube([3, linearBearing[2]/2+2, frameY/2]);
	
	translate([length/2-linearBearing[1]/2-1, linearBearing[2]/4+1, thickness/2+linearBearing[1]/2+smoothRod/2+frameY/4])
	    cube([thickness+2, 2, frameY/2]);
	translate([length/2-linearBearing[1]/2-1, linearBearing[2]/4-3, thickness/2+linearBearing[1]/2+smoothRod/2+frameY/4])
	    cube([thickness+2, 2, frameY/2]);
	
	
	translate([length/2-linearBearing[1]/2+linearBearing[1]-thickness-1, linearBearing[2]/4+1, thickness/2+linearBearing[1]/2+smoothRod/2+frameY/4])
	    cube([thickness+2, 2, frameY/2]);
	translate([length/2-linearBearing[1]/2+linearBearing[1]-thickness-1, linearBearing[2]/4-3, thickness/2+linearBearing[1]/2+smoothRod/2+frameY/4])
	    cube([thickness+2, 2, frameY/2]);

    }// end difference

}
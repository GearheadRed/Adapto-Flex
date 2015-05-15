// Adapto Flex is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/
// Originated from Adapto https://github.com/rotorit/Adapto
include <./inc/configuration.scad>
use <./inc/polyarc.scad>

//rotate([])
    beltTensioner();

module beltTensioner(){
    
    difference(){
        
        union(){
        
	    // mount bracket
	    translate([0, -linearBearing[2]/4-thickness/2, 0])
		cube([6, linearBearing[2]/2+thickness, thickness]);
	    // main tension
	    translate([6, -30/2, 0])
		cube([12, 30, 15]);
	    // slider
	    translate([6, 30/2+5, 0])
		cube([12, 13, 12]);
            
        }// end union
        
        // main slider bolt hole
        translate([12, -16, 7])
            rotate([-90, 0, 0])
            polyhole(d=M3, h=15);
        // slider bolt hole
        translate([12, 30/2-1, 8])
            rotate([-90, 0, 0])
            polyhole(d=M3, h=17);
        // mount holes
        translate([3, linearBearing[2]/2-thickness-3.25, -1])
            polyhole(d=M3, h=7);
        translate([3, -linearBearing[2]/2+thickness+3.25, -1])
            polyhole(d=M3, h=7);
        
        // main tension
        translate([9, -30/2+3, 10])
            cube([6, 2, 6]);
        translate([9, -30/2-1, 3])
            cube([6, 6, 8]);
        translate([9, -30/2+10, 3])
            cube([10, 21, 9]);
        translate([5, -30/2+10, 11])
            cube([14, 21, 6]);
        
        // slider
        translate([9, 30/2+10+3, -1])
            cube([6, 2, 6]);
        translate([9, 30/2+10+3, 4])
            cube([7, 6, 9]);
        translate([15, 30/2+4, 4])
            cube([4, 17, 9]);
        
    }// end difference

}
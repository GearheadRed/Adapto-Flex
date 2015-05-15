// Adapto Flex is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/
// Originated from Adapto https://github.com/rotorit/Adapto
include <../inc/configuration.scad>
use <../inc/polyarc.scad>

rotate([90, 0, 90])
    bedBlock();

module bedBlock(){

	difference(){
	    // block
	    cube([20, 20, 15]);
	    // glass plate and print surface
	    translate([3.5, 3.5, 12])
		cube([20, 20, 3.5]);
	    translate([4.24, 4.24, 12])
		polyhole(d=2, h=3.5);
	    // heated pcb (214x214x1.5mm
	    translate([7, 7, 10.3])
		cube([20, 20, 1.75]);
	    translate([7.74, 7.74, 10.3])
		polyhole(d=2, h=3.5);
	    // base plate
	    translate([7, 7, -.25])
		cube([20, 20, 3]);
	    translate([7.74, 7.74, -.25])
		polyhole(d=2, h=3);
	    
	    // mount hole and recess
	    translate([7+M3/2+1, 7+M3/2+1, -1])
		polyhole(d=M3, h=25);
	    translate([7+M3/2+1, 7+M3/2+1, 7])
		polyhole(d=M3nut+.5, h=25);
		
	    translate([20-M3/2-2, 20-M3/2-2, -1])
		polyhole(d=M3, h=25);
	    translate([20-M3/2-2, 20-M3/2-2, 7])
		polyhole(d=M3nut+.5, h=25);

	}// end difference

}
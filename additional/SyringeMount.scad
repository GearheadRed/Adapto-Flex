// Adapto Flex is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/
// Originated from Adapto https://github.com/rotorit/Adapto
include <../inc/configuration.scad>
use <../inc/polyarc.scad>		

Syringe_Mount();

module Syringe_Mount(){

    difference(){

	union(){
	    // syringe mount
	    translate([0, 14, 14.5])
		rotate([90, 0, 0])
		polycyl(d=25+7, h=30);
	    
	    // syringe retainer
	    hull(){
		translate([-3, -7.5, 25+thickness/2])
		    cube([6, 15, thickness/2+M3nut]);
		translate([0, 7.5, 14.5])
		    rotate([90, 0, 0])
		    polycyl(d=25+thickness-.1, h=15);
	    }
    
	    // carriage mount wings
	    hull(){
		translate([100/2-5, -70/2+15, 0])
		    polycyl(d=M5*2, h=thickness);
		translate([0, -thickness*2, 0])
		    cube([3, thickness, 25]);
	    }
	    hull(){
		translate([100/2-5, 70/2-20, 0])
		    polycyl(d=M5*2, h=thickness);
		translate([0, thickness, 0])
		    cube([3, thickness, 25]);
	    }
	    hull(){
		translate([-100/2+5, -70/2+15, 0])
		    polycyl(d=M5*2, h=thickness);
		translate([-3, -thickness*2, 0])
		    cube([3, thickness, 25]);
	    }
	    hull(){
		translate([-100/2+5, 70/2-20, 0])
		    polycyl(d=M5*2, h=thickness);
		translate([-3, thickness, 0])
		    cube([3, thickness, 25]);
	    }

	}// end union

	// syringe hole
	translate([0, -17, 14.5])
	    rotate([-90, 0, 0])
	    polyhole(d=25.5, h=32);
	
	// syringe hole split
	translate([-1, -17, 25])
	    cube([2, 32, 20]);
	
	// syringe retainer hole
	translate([-10, 0, 25+thickness/2+M3nut])
	    rotate([90, 0, 90])
	    polyhole(d=M3, h=20);
	translate([-8, 0, 25+thickness/2+M3nut])
	    rotate([90, 0, 90])
	    polynut(d=M3nut, h=5);
	translate([3, 0, 25+thickness/2+M3nut])
	    rotate([90, 0, 90])
	    polyhole(d=M3nut+.2, h=5);

	// carriage mount holes
	translate([100/2-5, 70/2-20, -1])
	    polyhole(d=M5, h=thickness*2);
	translate([-100/2+5, 70/2-20, -1])
	    polyhole(d=M5, h=thickness*2);
	translate([100/2-5, -70/2+15, -1])
	    polyhole(d=M5, h=thickness*2);
	translate([-100/2+5, -70/2+15, -1])
	    polyhole(d=M5, h=thickness*2);

	// carriage mount flats
	translate([100/2-5, 70/2-20, thickness])
	    polyhole(d=M5*2, h=thickness+30);
	translate([-100/2+5, 70/2-20, thickness])
	    polyhole(d=M5*2, h=thickness+30);
	translate([100/2-5, -70/2+15, thickness])
	    polyhole(d=M5*2, h=thickness+30);
	translate([-100/2+5, -70/2+15, thickness])
	    polyhole(d=M5*2, h=thickness+30);
	    
	// make sure the bottom stays flat
	translate([-100, -100, -5])
	    cube([200, 200, 5]);

    }// end difference

}
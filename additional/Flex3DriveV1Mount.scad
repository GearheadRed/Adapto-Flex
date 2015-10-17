// Adapto Flex is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/
// Originated from Adapto https://github.com/rotorit/Adapto
include <../inc/configuration.scad>
use <../inc/polyarc.scad>		

Flex3Drive_Mount();

module Flex3Drive_Mount(){
	
    difference(){

		union(){
			// Flex3Drive mount
			translate([-25.5, carriageDrop, 0])
				cube([61, thickness, thickness+32]);
		
			// carriage mount wings
			hull(){
				translate([100/2-5, -70/2+15, 0])
					polycyl(d=M5*2, h=thickness);
				translate([61-25.5, carriageDrop, 0])
					cube([3, thickness, thickness+32]);
			}
			hull(){
				translate([100/2-5, 70/2-20, 0])
					polycyl(d=M5*2, h=thickness);
				translate([61-25.5, carriageDrop, 0])
					cube([3, thickness, thickness+32]);
			}
			hull(){
				translate([-100/2+5, -70/2+15, 0])
					polycyl(d=M5*2, h=thickness);
				translate([-25.5-3, carriageDrop, 0])
					cube([3, thickness, thickness+32]);
			}
			hull(){
				translate([-100/2+5, 70/2-20, 0])
					polycyl(d=M5*2, h=thickness);
				translate([-25.5-3, carriageDrop, 0])
					cube([3, thickness, thickness+32]);
			}
	
		}// end union

		// j-head hole
        hull(){
            translate([0, carriageDrop-.01, 14.5])
                rotate([-90, 0, 0])
                polyhole(d=17, h=thickness+2);
            translate([0, carriageDrop-.01, 0])
                rotate([-90, 0, 0])
                polyhole(d=17, h=thickness+2);
            translate([0, carriageDrop-.01, 17])
                rotate([-90, 0, 0])
                polyhole(d=17, h=thickness);
            translate([0, carriageDrop+6, 25])
                rotate([-90, 0, 0])
                polyhole(d=17, h=thickness);
            translate([0, carriageDrop+6, 17])
                rotate([-90, 0, 0])
                polyhole(d=30, h=thickness);
        }
        
        // fan mount
        translate([-32/2, carriageDrop+2.5, 32])
            polycyl(d=3, h=thickness+2);
        translate([32/2, carriageDrop+2.5, 32])
            polycyl(d=3, h=thickness+2);
    
		// Flex3Drive mount holes
		translate([30, carriageDrop-1, 19.6])
			rotate([-90, 0, 0])
			polyhole(d=M5, h=thickness+2);
		translate([-20, carriageDrop-1, 19.6])
			rotate([-90, 0, 0])
			polyhole(d=M5, h=thickness+2);
		
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

    }// end difference

}
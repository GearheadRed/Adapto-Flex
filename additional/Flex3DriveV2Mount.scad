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
				cube([61, thickness, 33]);
		
			// carriage mount wings
			hull(){
				translate([100/2-5, -70/2+15, 0])
					polycyl(d=M5*2, h=thickness);
				translate([30+M3+.5, carriageDrop, 0])
					cube([3, thickness, 33]);
			}
			hull(){
				translate([100/2-5, 70/2-20, 0])
					polycyl(d=M5*2, h=thickness);
				translate([30+M3+.5, carriageDrop, 0])
					cube([3, thickness, 33]);
			}
			hull(){
				translate([-100/2+5, -70/2+15, 0])
					polycyl(d=M5*2, h=thickness);
				translate([-20-M3-3.5, carriageDrop, 0])
					cube([3, thickness, 33]);
			}
			hull(){
				translate([-100/2+5, 70/2-20, 0])
					polycyl(d=M5*2, h=thickness);
				translate([-20-M3-3.5, carriageDrop, 0])
					cube([3, thickness, 33]);
			}
	
		}// end union
		
		// Split the carriage
		
		translate([-17, carriageDrop-1, -1])
			cube([44, thickness+2, thickness+34]);
	 
		// Flex3Drive mount holes
		translate([30, carriageDrop-1, 9.6])
			rotate([-90, 0, 0])
			polyhole(d=M3, h=thickness+2);
		translate([30, carriageDrop-1, 19.6])
			rotate([-90, 0, 0])
			polyhole(d=M3, h=thickness+2);
		translate([30, carriageDrop-1, 29.6])
			rotate([-90, 0, 0])
			polyhole(d=M3, h=thickness+2);
		
		translate([-20, carriageDrop-1, 9.6])
			rotate([-90, 0, 0])
			polyhole(d=M3, h=thickness+2);
		translate([-20, carriageDrop-1, 19.6])
			rotate([-90, 0, 0])
			polyhole(d=M3, h=thickness+2);
		translate([-20, carriageDrop-1, 29.6])
			rotate([-90, 0, 0])
			polyhole(d=M3, h=thickness+2);
		
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
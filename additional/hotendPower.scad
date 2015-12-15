// Adapto Flex is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/
// Originated from Adapto https://github.com/rotorit/Adapto
include <../inc/configuration.scad>
use <../inc/polyarc.scad>

hotendPower();

module hotendPower(){

	difference(){

		union(){
			//corrugated tube holder
			hull(){
				translate([32, 15, 0])
					polycyl(d=20, h=20);
				translate([22, 0, 0])
					cube([1, 30, 3]);
			}
			hull(){	
				translate([0, 18.5, 0])
					cube([23, 2, 3]);
				translate([24, 18.5, 0])
					cube([1, 2, 20]);
			}
			translate([0, 0, 0])
			    cube([23, 30, 3]);

		}// end union

		// rca hole
		translate([12, 25, -1])
		    polyhole(d=6, h=5);
//			polyhole(d=9, h=5);
		
		// cat3 punchdown
		translate([2, 3, -1])
			cube([19, 14.5, 5]);
		translate([2, 2, 2])
			cube([19, 16.5, 2]);

		// corrugated tube
		translate([32, 15, -1])
		    polyhole(d=16, h=22);
		translate([32, 0, -1])
		    cube([23, 30, 22]);
		
		// zip tie holes
		difference(){
			translate([32, 15, 5])
				polycyl(d=20+3, h=thickness);
			translate([32, 15, 5])
				polycyl(d=20+.02, h=thickness+2);
		}

	}// end difference

}
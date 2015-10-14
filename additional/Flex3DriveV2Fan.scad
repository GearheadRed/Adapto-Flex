// Adapto Flex is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/
// Originated from Adapto https://github.com/rotorit/Adapto
include <../inc/configuration.scad>
use <../inc/polyarc.scad>


FlexFan();

module FlexFan(){
	
	difference(){
	union (){
	difference(){
	
		union(){
			// mount
			translate([-8, 0, 0])
			cube([8, 40, 39]);
			
			// duct
			hull(){
				translate([-8, 20, 19])
					rotate([0,90,0])
					polycyl(d=40, h=1);
				translate([13+7.2, 20-8, 4])
					cube([1, 16, 17]);
			}

		}// end union
		
		//fan duct
		hull(){
			translate([-9, 20, 19])
				rotate([0,90,0])
				polyhole(d=37.5, h=1);
			translate([13+7.2, 20-7, 4])
				cube([1, 14, 17]);
		}
		
		// pico body cutout
		translate([0, 12, -1])
			cube([10.5, 24, 6]);
		translate([13+7.2, 20, 0])
			polycyl(d=15.5, h=40);
		translate([13+7.2, 10, -1])
			cube([10, 20, 30]);
		
		// flat bottom
		translate([-20, -20, -10])
			cube([80, 80, 10]);
		
	}// end difference
	
	translate([-3, 12, 0])
	cube([3, 24, 9]);
	
	}
	// mount holes
	translate([-9, 40-3.5, 2.5])
		rotate([0, 90, 0])
		polyhole(d=3, h=10);
	translate([-9, 3.5, 2.5])
		rotate([0, 90, 0])
		polyhole(d=3, h=10);
	translate([-9, 40-3.5, 39-3.5])
		rotate([0, 90, 0])
		polyhole(d=3, h=10);
	translate([-9, 3.5, 39-3.5])
		rotate([0, 90, 0])
		polyhole(d=3, h=10);
	}
	
}
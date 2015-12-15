// Adapto Flex is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/
// Originated from Adapto https://github.com/rotorit/Adapto
include <../inc/configuration.scad>
use <../inc/polyarc.scad>


rotate([0,-90,0])
FlexFan();

module FlexFan(){
	
	difference(){ // difference 2
        
        union (){ // union 2
            
            difference(){ // difference 1
            
                union(){ // union 1
                    // mount
                    translate([-8, 0, 0])
                    cube([8, 40, 40]);
                    
                    // duct
                    hull(){
                        translate([-8, 20, 20])
                            rotate([0,90,0])
                            polycyl(d=40, h=1);
                        translate([31.5/2+5, 20-8, 4])
                            cube([1, 16, 20]);
                    }
        
                } // end union 1
                
                // fan duct
                hull(){
                    translate([-9, 20, 20])
                        rotate([0,90,0])
                        polyhole(d=37.5, h=1);
                    translate([31.5/2+5, 20-7, 4])
                        cube([1, 14, 19.5]);
                }
                
                // pico body cutout
				difference(){
					translate([0, 12, 0])
						cube([10.5, 24, 9]);
					translate([31.5/2+5, 24, -1])
						polycyl(d=31, h=11);
				}
                translate([13+7.2, 20, 0])
                    polycyl(d=15.5, h=40);
                translate([13+7.2, 10, -1])
                    cube([10, 20, 30]);
                
            } // end difference 1
            
            // extruder tab
            translate([-3, 12, 0])
                cube([3, 24, 9]);

        } // end union 2
        
        // extruder mount holes
        translate([-9, 16, 5.5])
            rotate([0, 90, 0])
            polyhole(d=M3, h=10);
        translate([-9, 31, 5.5])
            rotate([0, 90, 0])
            polyhole(d=M3, h=10);
        translate([-9, 31, 5.5])
            rotate([0, 90, 0])
            polyhole(d=6, h=6);
		
		// extruder slot mount plate
		translate([31.5/2+5, 24, -1])
			polycyl(d=32, h=4.75);
		translate([31.5/2+5, 24, 3.65])
			polycyl(d=16.1, h=1.7);
		
		translate([20, 24.5, 0])
			rotate([0,0,81.5])
			cube([3, 15, 9.5]);
		translate([10, 15, 0])
			rotate([0,0,-88.2])
			cube([3, 15, 9.5]);
        
        // fan mount holes
        translate([-9, 40-3.5, 3.5])
            rotate([0, 90, 0])
            polyhole(d=3, h=10);
        translate([-9, 3.5, 3.5])
            rotate([0, 90, 0])
            polyhole(d=3, h=10);
        translate([-9, 40-3.5, 40-3.5])
            rotate([0, 90, 0])
            polyhole(d=3, h=10);
        translate([-9, 3.5, 40-3.5])
            rotate([0, 90, 0])
            polyhole(d=3, h=10);
            
	} // end difference 2
	
}
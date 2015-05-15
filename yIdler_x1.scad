// Adapto Flex is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/
// Originated from Adapto https://github.com/rotorit/Adapto
include <./inc/configuration.scad>
use <./inc/polyarc.scad>

yIdler();
rotate([90, 0, 90])
    yIdler_Retainer();

module yIdler(){
    
    difference(){

	union(){
	    
	    hull(){
		cube([frameY+thickness*4, 1, rotaryBearing[1]]);
		translate([0, 10+frameX+15+rotaryBearing[1]/2, rotaryBearing[1]/2])
		    rotate([0,90,0])
		    polycyl(d=rotaryBearing[1], h=frameY+thickness*4);
	    }
		
	}// end union
	
	// cutout to make arms
	translate([thickness*2-.25, 10, -1])
	    cube([frameY+.5, frameX+15, rotaryBearing[1]+2]);
	
	// cutout to narrow for bearings
	translate([thickness*2+frameY/2-(rotaryBearing[2]*2+1)/2, 10+frameX, -1])
	    cube([rotaryBearing[2]*2+1, frameX+15, rotaryBearing[1]+2]);
	
	// tensioner bolt and nut trap
	translate([thickness*2+frameY/2, -1, rotaryBearing[1]/2])
	    rotate([-90, 0, 0])
	    polycyl(d=M5, h=frameX);
	translate([thickness*2+frameY/2, 8, rotaryBearing[1]/2])
	    rotate([-90, 0, 0])
	    polynut(d=M5nut, h=frameX);
	
	// bearing bolt hole
	translate([-1, 10+frameX+15+rotaryBearing[1]/3, rotaryBearing[1]/2])
	    rotate([0, 90, 0])
	    polycyl(d=rotaryBearing[0], h=frameY+thickness*4+2);

    }// end difference

}

module yIdler_Retainer(){
    
    difference(){

	union(){
	    
	    translate([frameY+thickness*4+20, 0, 0])
		cube([rotaryBearing[1]+thickness*2+M5nut*2, frameX, thickness*3]);
		
	}// end union
	
	// cutout to capture tensioner
	translate([frameY+thickness*4+20+M5nut+thickness-.25, -1, -.5])
	    cube([rotaryBearing[1]+.5, frameX+2, thickness*2+1]);
	
	// bolt flats
	translate([frameY+thickness*4+20-1, -1, thickness])
	    cube([M5nut+1, frameX+2, thickness*2+1]);
	translate([frameY+thickness*4+20+thickness*2+M5nut+rotaryBearing[1], -1, thickness])
	    cube([M5nut+1, frameX+2, thickness*2+1]);
	
	// bolt holes
	translate([frameY+thickness*4+20+M5nut/2, frameX/2, -1])
	    polycyl(d=M5, h=frameX);
	translate([frameY+thickness*4+20+thickness*2+M5nut+rotaryBearing[1]+M5nut/2, frameX/2, -1])
	    polycyl(d=M5, h=frameX);

    }// end difference

}
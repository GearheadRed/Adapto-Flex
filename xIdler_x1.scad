// Adapto Flex is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/
// Originated from Adapto https://github.com/rotorit/Adapto
include <./inc/configuration.scad>
use <./inc/polyarc.scad>
use <./inc/xBacker.scad>

if (Flex3Drive==true){
    rotate([0, -90, 0])
    difference(){
	union(){
	    xIdler();
	    Flex3DriveMount();
	}
	// make sure the smooth rod hole stays clear
	#translate([-70/2, 30+linearBearing[2]/2-5.5, thickness*2+linearBearing[1]+thickness*2+2+smoothRod/2])
	    rotate([90, 90, 0])
	    polyhole(d=smoothRod+.1, h=linearBearing[2]+2);
    }
}
else{
    rotate([0, 90, 0])
	xIdler();
}

module xIdler(){

    difference(){

	union(){

	    // import the base x backing model
	    xBacker();
	    
	    // create bearing bracket
	    hull(){
		translate([-(1.41*31+thickness*2+M3)/2, 30-18/2-6,  thickness*2+linearBearing[1]])
		    cube([1.41*31+thickness*2+M3, 1, 1]);
		translate([-(1.41*31+thickness*2+M3)/2, 30-rotaryBearing[1],  thickness*2+linearBearing[1]])
		    cube([1.41*31+thickness*2+M3, rotaryBearing[1]+.5, thickness+rotaryBearing[2]+thickness*2.5]);
	    }

	}// end union

	// bearing cutout
	%translate([rotaryBearing[1]/2-pullyDiameter/2, 30, thickness*2+linearBearing[1]+thickness*2-rotaryBearing[2]/2])
	    polycyl(d=rotaryBearing[1], h=rotaryBearing[2]*2);
	hull(){
	    translate([rotaryBearing[1]/2-pullyDiameter/2, 0, thickness*2+linearBearing[1]+thickness*2-rotaryBearing[2]/2-.25])
		polycyl(d=rotaryBearing[1]+5, h=rotaryBearing[2]*2+.5);
	    translate([rotaryBearing[1]/2-pullyDiameter/2, 30, thickness*2+linearBearing[1]+thickness*2-rotaryBearing[2]/2-.25])
		polycyl(d=rotaryBearing[1]+5, h=rotaryBearing[2]*2+.5);
	}

	// shaft cutout
	%translate([rotaryBearing[1]/2-pullyDiameter/2, 30, thickness*2+linearBearing[1]+thickness-.4])
	    polycyl(d=rotaryBearing[0], h=rotaryBearing[2]+thickness*2+2);
	hull(){
	    translate([rotaryBearing[1]/2-pullyDiameter/2, 30, thickness*2+linearBearing[1]+thickness-.4])
		polycyl(d=rotaryBearing[0], h=rotaryBearing[2]+thickness*2+2);
	    translate([rotaryBearing[1]/2-pullyDiameter/2, 60, thickness*2+linearBearing[1]+thickness-.4])
		polycyl(d=rotaryBearing[0], h=rotaryBearing[2]+thickness*2+2);
	}
	    
    }// end difference

}


module Flex3DriveMount(){
    
    difference(){
	
	union(){
	    
	    // nema mounting
	    hull(){
		#translate([-88/2, 30+18/2-1, 0])
		    cube([thickness+1, 1, thickness*2+linearBearing[1]+thickness*2+2+smoothRod/2+linearBearing[1]/2+1.9]);
		translate([-88/2, 30+zRodnut/2+thickness+M3, thickness*2+linearBearing[1]-31/2])
		    rotate([0, 90, 0])
		    polycyl(d=M3+thickness*2, h=thickness+1);
		translate([-88/2, 30+zRodnut/2+thickness+M3+31, thickness*2+linearBearing[1]-31/2])
		    rotate([0, 90, 0])
		    polycyl(d=M3+thickness*2, h=thickness+1);
		translate([-88/2, 30+zRodnut/2+thickness+M3, thickness*2+linearBearing[1]+31/2])
		    rotate([0, 90, 0])
		    polycyl(d=M3+thickness*2, h=thickness+1);
		translate([-88/2, 30+zRodnut/2+thickness+M3+31, thickness*2+linearBearing[1]+31/2])
		    rotate([0, 90, 0])
		    polycyl(d=M3+thickness*2, h=thickness+1);
	    }
	    
	}// end union
	
	// nema bolt holes
	translate([-88/2-1, 30+zRodnut/2+thickness+M3, thickness*2+linearBearing[1]-31/2])
	    rotate([0, 90, 0])
	    polyhole(d=M3, h=thickness+3);
	translate([-88/2-1, 30+zRodnut/2+thickness+M3+31, thickness*2+linearBearing[1]-31/2])
	    rotate([0, 90, 0])
	    polyhole(d=M3, h=thickness+3);
	translate([-88/2-1, 30+zRodnut/2+thickness+M3, thickness*2+linearBearing[1]+31/2])
	    rotate([0, 90, 0])
	    polyhole(d=M3, h=thickness+3);
	translate([-88/2-1, 30+zRodnut/2+thickness+M3+31, thickness*2+linearBearing[1]+31/2])
	    rotate([0, 90, 0])
	    polyhole(d=M3, h=thickness+3);

	// nema center axle cutout
	translate([-88/2-1, 30+zRodnut/2+thickness+M3+31/2, thickness*2+linearBearing[1]])
	    rotate([0, 90, 0])
	    polycyl(d=22, h=thickness+3);

    }// end difference
    
}
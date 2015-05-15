// Adapto Flex is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/
// Originated from Adapto https://github.com/rotorit/Adapto
include <../inc/configuration.scad>

// the defined bearing block bolt spacing
bearingBolt=M3nut*2+25+M3nut*2-8;
// bed size, based on mk2b pcb heated bed
bedX=214;
bedY=214;

bed();

module bed(){
    difference(){
	// bed space
	square([bedX,bedY]);
    
	// bearing block holes
	translate([bedX/2, thickness])
	    circle(r=M3/2);
	translate([bedX/2, thickness+bearingBolt])
	    circle(r=M3/2);
	
	translate([bedX/3, thickness])
	    circle(r=M3/2);
	translate([bedX/3, thickness+bearingBolt])
	    circle(r=M3/2);
	
	translate([bedX/3*2, thickness])
	    circle(r=M3/2);
	translate([bedX/3*2, thickness+bearingBolt])
	    circle(r=M3/2);
	
	translate([bedX/3, bedY-thickness])
	    circle(r=M3/2);
	translate([bedX/3, bedY-thickness-bearingBolt])
	    circle(r=M3/2);
	
	translate([bedX/3*2, bedY-thickness])
	    circle(r=M3/2);
	translate([bedX/3*2, bedY-thickness-bearingBolt])
	    circle(r=M3/2);
	
	// belt block holes
	translate([bedX/2-bearingBolt/2, bedY/2])
	    circle(r=M3/2);
	translate([bedX/2+bearingBolt/2, bedY/2])
	    circle(r=M3/2);
	translate([bedX/2-bearingBolt/2, bedY/3*2])
	    circle(r=M3/2);
	translate([bedX/2+bearingBolt/2, bedY/3*2])
	    circle(r=M3/2);
	    
	// heat bed holes
	translate([M3/2+1, M3/2+1])
	    circle(r=M3/2);
	translate([bedX-M3/2-1, M3/2+1])
	    circle(r=M3/2);
	translate([M3/2+1, bedY/2])
	    circle(r=M3/2);
	translate([bedX-M3/2-1, bedY/2])
	    circle(r=M3/2);
	translate([M3/2+1, bedY-M3/2-1])
	    circle(r=M3/2);
	translate([bedX-M3/2-1, bedY-M3/2-1])
	    circle(r=M3/2);
    }
}
// Adapto Flex is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/
// Originated from Adapto https://github.com/rotorit/Adapto
include <./inc/configuration.scad>
use <./inc/polyarc.scad>

xCarriage();

module xCarriage(){

    difference(){

	union(){

	    // base plate
	    translate([-100/2, -70/2, 0])
		cube([100, 70, thickness]);

	    // linear bearing traps
	    translate([100/2-linearBearing[2], 70/2, thickness+linearBearing[1]/2])
		rotate([0, 90, 0])
		polycyl(d=linearBearing[1]+thickness*2, h=linearBearing[2]);
	    translate([-100/2, 70/2, thickness+linearBearing[1]/2])
		rotate([0, 90, 0])
		polycyl(d=linearBearing[1]+thickness*2, h=linearBearing[2]);
	    translate([-linearBearing[2]/2, -70/2, thickness+linearBearing[1]/2])
		rotate([0, 90, 0])
		polycyl(d=linearBearing[1]+thickness*2, h=linearBearing[2]);

	    // back plate bearing trap reinforcements
	    translate([linearBearing[2]/2-thickness, -70/2, 0])
		cube([thickness*3, 70, linearBearing[0]]);
	    translate([-linearBearing[2]/2-thickness*2, -70/2, 0])
		cube([thickness*3, 70, linearBearing[0]]);

	    // belt bracket
	    translate([-40/2, -pullyDiameter/2+4, thickness])
		cube([40, thickness, 6]);
	    %translate([-40/2, -pullyDiameter/2-1, thickness])
		cube([40, 15, 18]);
	    
	    // bolt head raised traps
	    translate([100/2-5, 70/2-20, thickness])
		polycyl(d=M5nut*2, h=M5nutThickness);
	    translate([-100/2+5, 70/2-20, thickness])
		polycyl(d=M5nut*2, h=M5nutThickness);
	    translate([100/2-5, -70/2+15, thickness])
		polycyl(d=M5nut*2, h=M5nutThickness);
	    translate([-100/2+5, -70/2+15, thickness])
		polycyl(d=M5nut*2, h=M5nutThickness);

	    // the X smooth rods
	    %translate([-300/2, 70/2, thickness+linearBearing[1]/2])
		rotate([90, 0, 90])
		polycyl(d=smoothRod, h=300);
	    %translate([-300/2, -70/2, thickness+linearBearing[1]/2])
		rotate([90, 0, 90])
		polycyl(d=smoothRod, h=300);

	    // the linear bearings
	    %translate([100/2-linearBearing[2], 70/2, thickness+linearBearing[1]/2])
		rotate([0, 90, 0])
		polycyl(d=linearBearing[1], h=linearBearing[2]);
	    %translate([-100/2, 70/2, thickness+linearBearing[1]/2])
		rotate([0, 90, 0])
		polycyl(d=linearBearing[1], h=linearBearing[2]);

	    %translate([-linearBearing[2]/2, -70/2, thickness+linearBearing[1]/2])
		rotate([0, 90, 0])
		polycyl(d=linearBearing[1], h=linearBearing[2]);

	}// end union

	// the linear bearing channels
	translate([-300/2, 70/2, thickness+linearBearing[1]/2])
	    rotate([0, 90, 0])
	    polyhole(d=linearBearing[1], h=300);
	translate([-300/2, -70/2, thickness+linearBearing[1]/2])
	    rotate([0, 90, 0])
	    polyhole(d=linearBearing[1], h=300);
	translate([-300/2, 70/2-smoothRod/2, linearBearing[1]-thickness])
	    cube([300, smoothRod, thickness*5]);
	translate([-300/2, -70/2-smoothRod/2, linearBearing[1]-thickness])
	    cube([300, smoothRod, thickness*5]);

	// zip tie holes
	difference(){
	    translate([100/2-linearBearing[2]/2-thickness/2, 70/2, thickness+linearBearing[1]/2])
		rotate([0,90,0])
		polycyl(d=linearBearing[1]+thickness*2+5, h=thickness);
	    translate([100/2-linearBearing[2]/2-thickness/2-1, 70/2, thickness+linearBearing[1]/2])
		rotate([0,90,0])
		polycyl(d=linearBearing[1]+thickness*2+.02, h=thickness+2);
	}
	difference(){
	    translate([-100/2+linearBearing[2]/2-thickness/2, 70/2, thickness+linearBearing[1]/2])
		rotate([0,90,0])
		polycyl(d=linearBearing[1]+thickness*2+5, h=thickness);
	    translate([-100/2+linearBearing[2]/2-thickness/2-1, 70/2, thickness+linearBearing[1]/2])
		rotate([0,90,0])
		polycyl(d=linearBearing[1]+thickness*2+.02, h=thickness+2);
	}
	difference(){
	    translate([-thickness/2, -70/2, thickness+linearBearing[1]/2])
		rotate([0,90,0])
		polycyl(d=linearBearing[1]+thickness*2+5, h=thickness);
	    translate([-thickness/2-1, -70/2, thickness+linearBearing[1]/2])
		rotate([0,90,0])
		polycyl(d=linearBearing[1]+thickness*2+.02, h=thickness+2);
	}

	// belt trap
	%translate([-300/2, -pullyDiameter/2-2, thickness+3+7])
	    cube([300, 2, 6]);
	translate([linearBearing[2]/2-thickness-3.25, -pullyDiameter/2+3, thickness+3])
	    rotate([-90, 0, 0])
	    polyhole(d=M3, h=thickness+2);
	translate([-linearBearing[2]/2+thickness+3.25, -pullyDiameter/2+3, thickness+3])
	    rotate([-90, 0, 0])
	    polyhole(d=M3, h=thickness+2);

	// bolt holes
	translate([100/2-5, 70/2-20, -1])
	    polyhole(d=M5, h=thickness*2+2);
	translate([-100/2+5, 70/2-20, -1])
	    polyhole(d=M5, h=thickness*2+2);
	translate([100/2-5, -70/2+15, -1])
	    polyhole(d=M5, h=thickness*2+2);
	translate([-100/2+5, -70/2+15, -1])
	    polyhole(d=M5, h=thickness*2+2);

	// bolt head traps
	translate([100/2-5, 70/2-20, thickness])
	    rotate([0, 0, 90])
	    polynut(d=M5nut, h=M5nutThickness+1);
	translate([-100/2+5, 70/2-20, thickness])
	    rotate([0, 0, 90])
	    polynut(d=M5nut, h=M5nutThickness+1);
	translate([100/2-5, -70/2+15, thickness])
	    rotate([0, 0, 90])
	    polynut(d=M5nut, h=M5nutThickness+1);
	translate([-100/2+5, -70/2+15, thickness])
	    rotate([0, 0, 90])
	    polynut(d=M5nut, h=M5nutThickness+1);

	// flatten the sides
	translate([-70, -70, -70/3])
	    cube([20, 70*2, 70]);
	translate([50, -70, -70/3])
	    cube([20, 70*2, 70]);

    }// end difference

}
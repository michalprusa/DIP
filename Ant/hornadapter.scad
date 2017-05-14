
module Antenna(){
module M3hole(){
        cylinder(d=3.7,h=13, center = true,$fn=60);
        translate([0,0,10])cylinder(d=6.7,h=13, center = true,$fn=6);
    }

module pilar(length, dist){
    difference(){
    cube([8,9.15,length]);
    
    for (i = [8:dist:length]) {
            translate([2,9/2,i])rotate([0,90,0])M3hole();
        }
        
    }
    
    }

difference(){
translate([0,0,4])cube([41.5,41.4,8], center = true);

translate([0,0,6])cube([24,11,13], center = true);
    
    translate([-15.5,16.25,6])cylinder(d=4.5,h=13, center = true,$fn=60);
    translate([15.5,-16.25,6])cylinder(d=4.5,h=13, center = true,$fn=60);
    translate([-15.5,-16.25,6])cylinder(d=4.5,h=13, center = true,$fn=60);
    translate([15.5,16.25,6])cylinder(d=4.5,h=13, center = true,$fn=60);
    
    translate([0,0,4.5]){
    translate([-15.5,16.25,6])cylinder(d=8.5,h=13, center = true,$fn=6);
    translate([15.5,-16.25,6])cylinder(d=8.5,h=13, center = true,$fn=6);
    translate([-15.5,-16.25,6])cylinder(d=8.5,h=13, center = true,$fn=6);
    translate([15.5,16.25,6])cylinder(d=8.5,h=13, center = true,$fn=6);
    }
    
    translate([41.5/2, 41.4/2 , 0])rotate([0,0,45])cube([3,3,18], center = true);
    translate([-41.5/2, 41.4/2 , 0])rotate([0,0,45])cube([3,3,18], center = true);
    translate([41.5/2, -41.4/2 , 0])rotate([0,0,45])cube([3,3,18], center = true);
    translate([-41.5/2, -41.4/2 , 0])rotate([0,0,45])cube([3,3,18], center = true);
    
    translate([-41.5/2, -6 , 8])rotate([0,45,0])cube([0.5,60,0.5], center = true);
    translate([41.5/2, -6 , 8])rotate([0,45,0])cube([0.5,60,0.5], center = true);
    
    translate([-6, -41.5/2 , 8])rotate([45,0,0])cube([60,0.5,0.5], center = true);
    translate([-6, 41.5/2 , 8])rotate([45,0,0])cube([60,0.5,0.5], center = true);
    
}

/*
translate([-4,7,30])rotate([-13.85,0,0])pilar(140,25);
translate([-4,-7-9,27.7])rotate([13.85,0,0])pilar(140,25);

translate([-4,-7-9,8])pilar(25,25);
translate([-4,7,8])pilar(25,25);

translate([-4,6,8])cube([8,2,20]);
translate([-4,-7-1,8])cube([8,2,20]);
*/

import_stl("Horn10G-140mm.stl");
}


Antenna();
    
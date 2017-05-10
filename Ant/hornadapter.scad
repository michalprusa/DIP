difference(){
translate([0,0,4])cube([41.5,41.4,8], center = true);

translate([0,0,6])cube([24,11,13], center = true);
    
    translate([-15.5,16.25,6])cylinder(d=4.5,h=13, center = true);
    translate([15.5,-16.25,6])cylinder(d=4.5,h=13, center = true);
    translate([-15.5,-16.25,6])cylinder(d=4.5,h=13, center = true);
    translate([15.5,16.25,6])cylinder(d=4.5,h=13, center = true);

}


import_stl("Horn10G-140mm.stl");
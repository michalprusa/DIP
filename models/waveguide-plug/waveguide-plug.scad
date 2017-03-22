// Waveguide plug model

// Waveguide dimensions
WGw = 22.86; // Width of waveguide
WGh = 10.16; // Height of waveguide
WGl = 20;    // Length of waveguide

// Technological parameters
marginXY = 0.1;      // XY dimension margin
marginZ = 0.05;      // Z dimension margin

CCdim = 1;           // Corner cut definition

// Corner cut
module Ccut(){
        translate([0, ( WGl+marginXY )/2 , 0])rotate([0,45,0])cube([CCdim, WGl+2*marginXY , CCdim], center = true);
    }

// Waveguide plug
module WGplug(){
    
    difference(){
        // Main plug
        cube([WGw-marginXY, WGl-marginXY , WGh-marginZ]);
        
        translate([0,0,0]) Ccut(); // Bottom left 
        translate([WGw-marginXY,0,0]) Ccut(); // Bottom right 
        translate([0,0,WGh-marginZ]) Ccut(); // Top Left
        translate([WGw-marginXY,0,WGh-marginZ]) Ccut(); // Top Right
        
    }
    
}

// Final part render
WGplug();
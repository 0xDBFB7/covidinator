include <roundedcube.scad>
$fn = 100;
hole_diameter = 2;
strip_height = 3;

num_holes = 14;
hole_distance = 5;

translate([(num_holes*hole_distance+4*hole_distance)/2,0,0]){
roundedcube([num_holes+hole_distance,2*hole_diameter,strip_height],true,1,y);
}

cylinder(h=strip_height,d=hole_diameter);
translate([2*hole_distance,0,0]){
    for (i = [0:num_holes]) {
        translate([i*hole_distance,0,0]){
            cylinder(h=strip_height,d=hole_diameter);
        }
    }
}

translate([(num_holes*hole_distance+4*hole_distance),0,0]){
    cylinder(h=strip_height,d=hole_diameter);
}
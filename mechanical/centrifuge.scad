$fn = 40;

eppendorf_hole_diameter = 11.5;

extra_radius = 2;

shaft_diameter = 5;

//translate([0,0,8]) cylinder(d=8,h=15);


difference(){
    cylinder(d=70,h=8);
    union(){
        for(i = [0:3]){
            rotate(a=[0,0,i*(360/4)]){
                rotate(a=[-35,0,0]){
                    translate([0,-22,-20]) cylinder(d=eppendorf_hole_diameter,h=20);
                }
            }
        }

        for(i = [0:3]){
            rotate(a=[0,0,i*(360/4)+45]){
                translate([0,-45,0]) cylinder(d=40,h=20);
            }
        }
        translate([0,0,0]) cylinder(d=shaft_diameter+0.5,h=15);
    }
}
$fn= 20;

difference(){
    translate([-1,-1,0]) cube([102,97,8]);
    difference(){
        union(){
            cube([100,95,1.5]);
            //translate([0,0,-1]) cube([100,95,1]);

            for (i = [0:9]) {
                
                difference(){
                    translate([2.5,i*10+2.5,1]) cylinder(r=2.5,h=5);
                    union(){
                        translate([2.5,i*10+2.5,1]) cylinder(r=1.5,h=5);
                        translate([4,i*10+2.5,1]) cube([3,5,10],center=true);
                    }
                }
                
                difference(){ //far cubes
                    translate([100-2.5,i*10+2.5,1]) cylinder(r=2.5,h=5);
                    union(){
                        translate([100-2.5,i*10+2.5,1]) cylinder(r=1.5,h=5);
                        translate([100-4,i*10+2.5,1]) cube([3,5,10],center=true);
                    }
                }
                
                for (j = [1:2]) { //spacers
                    translate([j*30,i*10+2,1]) cube([7,1,5]);
                }
            }
        }

        union(){
            translate([6,5,0]) cube([21,85,10],center=false);
            translate([40,5,0]) cube([17,85,10],center=false);
            translate([70,5,0]) cube([23,85,10],center=false);
        }
    }
    union(){
            translate([7,6,0]) cube([19,83,10],center=false);
            translate([41,6,0]) cube([15,83,10],center=false);
            translate([71,6,0]) cube([21,83,10],center=false);
        }
}
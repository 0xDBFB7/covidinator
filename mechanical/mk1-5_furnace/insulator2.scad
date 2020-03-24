difference(){
     translate([-1,-1,-1])cube([72,75,8]);
    difference(){
        union(){
             translate([0,0,-1])cube([70,73,2]);
            for (i = [0:11]) {
                for (j = [0:3]) {
                    translate([j*(21),i*6.5,0])cube([7,1.5,6]);
                }
            }
        }
    }
}
        
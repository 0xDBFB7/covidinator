$fn = 30;
N = 10;

shaft_diam = 18;

eppen_ring = 68;
eppen_diameter = 12;

difference(){
    union(){
        cylinder(d=eppen_ring + (eppen_diameter*2)+4,h=4);
        cylinder(d=93,h=2);
    }

    union(){
        for(i = [0:N-1]){
            rotate([0,0,(360/N) * i]) translate([0,eppen_ring/2,0]) {
                cylinder(d=eppen_diameter,h=5);
                translate([1,-3,0]) rotate([0,0,(-25)]) cube([5,4,5]);
                translate([1,-3,0]) rotate([0,0,(-25)]) cube([5,4,5]);
            }
        }
        cylinder(d=shaft_diam,h=5);
    }
}

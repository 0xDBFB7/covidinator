$fn = 30;
N = 10;

shaft_diam = 17;

eppen_ring = 65;
eppen_diameter = 12;

difference(){
    union(){
        cylinder(d=eppen_ring + 24,h=4);
        cylinder(d=93,h=2);
    }

    union(){
        for(i = [0:N-1]){
            rotate([0,0,(360/N) * i]) translate([0,eppen_ring/2,0]) cylinder(d=eppen_diameter,h=5);
        }
        cylinder(d=shaft_diam,h=5);
    }
}

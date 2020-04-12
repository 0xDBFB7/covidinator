$fn=30;
//thanks https://www.thingiverse.com/jneilliii/!

function hex_to_pixel(hex,radius) = let(x=radius*sqrt(3)*(hex[0]+hex[1]/2),y=radius*3/2*hex[1]) [x,y];

module generate_hex_grid(external_radius=100,radius=10,gap=.5,height=1){
    // calculate number of rings based on external_radius and individual hex radius
    N = floor((external_radius/2)/radius);

    // generate list of cube coordinate points that are within the perimiter of the circle
    grid_points = [ for(a=[-N:N]) for(b=[-N:N]) for(c=[-N:N]) if(a+b+c==0) [a,b,c] ];

    // loop through points and draw "hexagon" at each location on cartesian coordinate
    for(i=grid_points) {
        translate(hex_to_pixel([i[0],i[2]],radius+(gap/2))) rotate(30) cylinder(r=((sqrt(3)*(radius))/2),h=height,center=true,$fn=60);
    };
};

mount_arm_height = 5;

pipette_height = 40;
petrie_dish_height=15;

difference(){
    union(){
        cylinder(r=70/2,h=35);
        cylinder(r=75/2,h=(pipette_height-petrie_dish_height));
    
        for(i = [0:3]){
            rotate([0,0,90*i+45]) translate([0,75/2,0]) cylinder(r=7,h=5);
        }
    }
    
    for(i = [0:3]){
        rotate([0,0,90*i]) translate([55.45/2,55.45/2,0]) cylinder(d=3.5,h=pipette_height-petrie_dish_height);
        rotate([0,0,90*i]) translate([55.45/2,55.45/2,5]) cylinder(d=5,h=pipette_height);
    }
    translate([0,0,35/2]) generate_hex_grid(60/2.0,radius=11.5/2, gap=4.5,height=35);
}

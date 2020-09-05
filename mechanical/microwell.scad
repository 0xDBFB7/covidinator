$fn = 30;

//5 microliter / (pi * ((2.5/2) mm)^2)

spacing = 8;

slide_height = 3.0;
slide_width = 18;
slide_length = 80;

hole_diameter = 2.5;

difference(){
    cube([slide_width, slide_length, slide_height], false);
    
    for(i = [0:1]){
        for(j = [0:7]){
            translate([(spacing*i)+5,(j*spacing)+10]){
                cylinder(d=hole_diameter, h=slide_height);
            }
        }
    }
}

num_cuvettes = 8;
$fn = 30;

//Edges should be broken with a ball-nose end mill.

cuvette_diameter = 1.0;
cuvette_bottom_margin = 0;
cuvette_depth = 0.7;

cuvette_spacing = 5.0;

access_hole_diameter = 3.0;

alignment_pin_diameter = 3.17500;
alignment_pin_x_offset = 3.5-(0.17500/2);//

slide_length = (cuvette_spacing) * num_cuvettes + 2*cuvette_spacing;

slide_height = 3.0;
slide_width = access_hole_diameter + alignment_pin_diameter/2 + alignment_pin_x_offset;

x_centerline = slide_width / 2.0;

hole_margin = 2.0;

echo(slide_length);
echo(slide_width);


difference(){
    cube([slide_width, slide_length, slide_height], false);
    
    union(){
        for (i = [-1:num_cuvettes]){
            y_centerline = i*cuvette_spacing + 1.5*cuvette_spacing;
            
            if(!(i < 0 || i == num_cuvettes)){
                translate([x_centerline, y_centerline, cuvette_bottom_margin])
                       cylinder(slide_height - (cuvette_bottom_margin+cuvette_depth)+1,
                                        d=cuvette_diameter,center=false);
                    
                translate([x_centerline, y_centerline, cuvette_bottom_margin+cuvette_depth])
                       cylinder(slide_height - (cuvette_bottom_margin+cuvette_depth)+1,
                                        d=access_hole_diameter,center=false);
            }
                    
            translate([0, y_centerline, cuvette_bottom_margin])
                   cylinder(slide_height,
                                    d=alignment_pin_diameter,center=false);
            
            translate([slide_width, y_centerline, cuvette_bottom_margin])
                   cylinder(slide_height,
                                    d=alignment_pin_diameter,center=false);
      
         
        }
        translate([x_centerline, 2.5, cuvette_bottom_margin])
                   cylinder(slide_height,
                                    d=2.0,center=false);
        translate([x_centerline, slide_length-2.5, cuvette_bottom_margin])
           cylinder(slide_height,
                            d=2.0,center=false);
    }
}



//         translate([x_centerline+access_hole_diameter/2+hole_margin, y_centerline-access_hole_diameter/2,0])/
//cube([10, access_hole_diameter, slide_height - (cuvette_bottom_margin+cuvette_depth)+1],center=false);
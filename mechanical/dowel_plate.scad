num_cuvettes = 8;
$fn = 30;

//Edges should be broken with a ball-nose end mill.

cuvette_diameter = 1.0;
cuvette_bottom_margin = 0;
cuvette_depth = 0.7;

cuvette_spacing = 6.0;

access_hole_diameter = 2.3;

alignment_pin_diameter = 2;
alignment_pin_x_offset = 3.5-(0.17500/2);

dowel_pin_diameter = 1.6;

slide_length = (cuvette_spacing) * num_cuvettes + 2*cuvette_spacing;

slide_height = 3.0;
slide_width = 3 + alignment_pin_diameter/2 + alignment_pin_x_offset;

x_centerline = slide_width / 2.0;

hole_margin = 2.0;

echo(slide_length);
echo(slide_width);

text_height = 0.5;
text_size = 1;
alpha = "ABCDEFGHIJKLMNOP";

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
                
                translate([x_centerline-text_size/2, y_centerline+cuvette_spacing/2-text_size/2, slide_height - text_height])             linear_extrude(text_height){ text(alpha[i], text_size); };
                
        
            }
                    
            translate([0, y_centerline, cuvette_bottom_margin])
                   cylinder(slide_height,
                                    d=alignment_pin_diameter,center=false);
            
            translate([slide_width, y_centerline, cuvette_bottom_margin])
                   cylinder(slide_height,
                                    d=alignment_pin_diameter,center=false);
            
            if(!(i < 0 || i == num_cuvettes+1)){
                translate([x_centerline*1.5, y_centerline-cuvette_spacing/1.5, cuvette_bottom_margin])
                       cylinder(slide_height,
                                        d=dowel_pin_diameter,center=false);
                translate([x_centerline*0.5, y_centerline-cuvette_spacing/3, cuvette_bottom_margin])
                       cylinder(slide_height,
                                        d=dowel_pin_diameter,center=false);
            }
            
         
        }
   
   
        
       
    }
}



//         translate([x_centerline+access_hole_diameter/2+hole_margin, y_centerline-access_hole_diameter/2,0])/
//cube([10, access_hole_diameter, slide_height - (cuvette_bottom_margin+cuvette_depth)+1],center=false);
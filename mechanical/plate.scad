num_cuvettes = 16;
$fn = 30;

cuvette_diameter = 1.0;
cuvette_bottom_margin = 0.2;
cuvette_depth = 0.5;

cuvette_spacing = 5.0;

access_hole_diameter = 7.0;

slide_length = (cuvette_spacing+1) * num_cuvettes;

slide_height = 3.0;
slide_width = 8.0;

x_centerline = slide_width / 2.0;

difference(){
    cube([slide_width, slide_length, slide_height], false);
    
    for (i = [0:num_cuvettes-1]) {
        y_centerline = i*cuvette_spacing + cuvette_spacing + access_hole_diameter/2;
        
        translate([x_centerline, y_centerline, cuvette_bottom_margin])
               cylinder(slide_height - (cuvette_bottom_margin+cuvette_depth)+1,
                                d=cuvette_diameter,center=false);
            
        translate([x_centerline, y_centerline, cuvette_bottom_margin+cuvette_depth])
               cylinder(slide_height - (cuvette_bottom_margin+cuvette_depth)+1,
                                d=access_hole_diameter,center=false);
            
        
      
    }
}
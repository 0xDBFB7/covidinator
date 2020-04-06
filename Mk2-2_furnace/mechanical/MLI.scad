$fn = 30;

inner_shell_width = 45;
shell_height = 45;
mold_thickness = 1;
shell_thickness = 1;
board_thickness = 5;
shell_radius = 5;

element_radius = 5;

shell_gap = 2;

N=2;
//cube([25.4,45,6.35]);

for(i = [0:N-1]){
     offset = shell_gap*i-1;
    translate([i*25,0,0]){
    difference(){
        hull(){
            translate([0,inner_shell_width/2,0]) cylinder(r=shell_radius+offset,h=shell_height);
            translate([0,-inner_shell_width/2,0]) cylinder(r=shell_radius+offset, h=shell_height);
            translate([board_thickness+shell_radius,0,0]) cylinder(r=element_radius+offset,h=shell_height);
            echo(board_thickness+shell_radius+element_radius+offset);
        }
        hull(){
            translate([0,inner_shell_width/2,-0.1]) cylinder(r=shell_radius-shell_thickness+offset,h=shell_height+0.2);
            translate([0,-inner_shell_width/2,-0.1]) cylinder(r=shell_radius-shell_thickness+offset, h=shell_height+0.2);
            translate([board_thickness+shell_radius,0,-0.1]) cylinder(r=element_radius-shell_thickness+offset,h=shell_height+0.2);
        }
    }
    }
}

//translate([-0,-15,-33]) cube([10,30,30]);
//translate([-0,-25/2,-3]) cube([4,25,30]);
//
//for(i = [0:N-1]){
//    hull(){
//        translate([0,inner_shell_width/2,shell_gap*i+shell_height]) cylinder(r=shell_radius+shell_gap*N-2,h=shell_thickness);
//        translate([0,-inner_shell_width/2,shell_gap*i+shell_height]) cylinder(r=shell_radius+shell_gap*N-2, h=shell_thickness);
//        translate([board_thickness+shell_radius,0,shell_gap*i+shell_height]) cylinder(r=element_radius+shell_gap*N-2,h=shell_thickness);
//    }
//}
//
//for(i = [0:N-1]){
//    hull(){
//        translate([0,inner_shell_width/2,-shell_gap*i]) cylinder(r=shell_radius+shell_gap*N-2,h=shell_thickness);
//        translate([0,-inner_shell_width/2,-shell_gap*i]) cylinder(r=shell_radius+shell_gap*N-2, h=shell_thickness);
//        translate([board_thickness+shell_radius,0,-shell_gap*i]) cylinder(r=element_radius+shell_gap*N-2,h=shell_thickness);
//    }
//}
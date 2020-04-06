$fn = 30;

inside_width = 45;
shell_thickness = 2;
board_thickness = 5;
element_thickness = 5;//actually 3.4

shell_gap = 1.6;

N = 3;

//cube([25.4,45,6.35]);

for(i = [0:N-1]){
    translate([0,0,i]) cube([board_thickness+element_thickness,inside_width,6.35]);
}

12.8 by 32 by 30
element is 3.3x24x60


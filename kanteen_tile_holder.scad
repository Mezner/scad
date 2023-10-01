// strap
interior=2;
thickness=.3;
exterior=interior+thickness;
height=3;
// pocket
pocket_exterior_width=2;
pocket_exterior_depth=1;
pocket_height=height;
pocket_thickness=.15;
pocket_inner_width=pocket_exterior_width - 2 * pocket_thickness;
pocket_inner_depth=pocket_exterior_depth - 2 * pocket_thickness;
pocket_inner_height = 200; // it's for exlusion, so okay to make large
pocket_cut_width=.4;
pocket_cut_floor=1;

difference() {
	cylinder (h = height, r=exterior, center = true, $fn=300);
	cylinder (h = height + 1, r = interior, center = true, $fn=100);
}

translate([-pocket_exterior_width/2, exterior-pocket_thickness, -pocket_height/2]) {
    difference() {
        cube([pocket_exterior_width, pocket_exterior_depth, pocket_height], $fn=300);
        translate([pocket_thickness, pocket_thickness, pocket_thickness]) {
            cube([pocket_inner_width, pocket_inner_depth, pocket_inner_height]);
        }
        translate([pocket_exterior_width / 2 - pocket_cut_width/2, pocket_thickness, pocket_cut_floor]) {
            cube([pocket_cut_width, pocket_inner_height, pocket_inner_height]);
        }
    }
    
}
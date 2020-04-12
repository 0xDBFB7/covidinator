// Thanks to the extremely detailad information @ http://www.redblobgames.com/grids/hexagons/
// I was able to generate this circular hexagonal grid generator about a circle given an external
// perimeter radius, radius of each individual hexagon, and gap between each hexagon.
//
// Using the excerpts from the range section of the site
// http://www.redblobgames.com/grids/hexagons/#range 
// I was able to generate a list of cube coordinate points and convert them to cartesian 
// points for placing cylinders
//
//for each -N ≤ dx ≤ N:
//    for each -N ≤ dy ≤ N:
//        for each -N ≤ dz ≤ N:
//            if dx + dy + dz = 0:
//                results.append(cube_add(center, Cube(dx, dy, dz)))
//
// more efficient method: unsure if this method could be implemented or not, can't wrap my head
// around the conversion in OpenSCAD.
//
//for each -N ≤ dx ≤ N:
//    for each max(-N, -dx-N) ≤ dy ≤ min(N, -dx+N):
//        var dz = -dx-dy
//        results.append(cube_add(center, Cube(dx, dy, dz)))
//
//function hex_to_pixel(hex):
//    x = size * sqrt(3) * (hex.q + hex.r/2)
//    y = size * 3/2 * hex.r
//    return Point(x, y)
//
// Usage: generate_hex_grid(external_radius=100,radius=10,gap=.5,height=1)
// Parameters: 
//      external_radius: radius of bound circle to generate hex grid in
//      radius: radius of the fake heagons
//      gap: distance between hexagons


// example removing generated hex grid from cylinder
difference(){
    cylinder(r=100,h=2,center=true);
    generate_hex_grid(radius=14,height=3,gap=4);
}
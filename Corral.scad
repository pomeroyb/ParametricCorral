//Fences motherfucker

fencePostWidth = 10;
fencePostTaperHeight = 12;
fencePostHeight = 50;
fencePostThickness = 2.5;
fencePostSpacing = 5;

corralLength = 15;

module fencePost(x,y,z, thickness, spacing){
	cubeLength = x + spacing;
	union(){
		linear_extrude(height = thickness, center = true, convexity = 10, twist = 0)
			translate([-x/2, 0, 0])
			polygon(points = [[0,0], [x,0], [x,z-y], [x/2,z], [0,z-y]], paths = [[0,1,2,3,4]]);

	
		translate([-(x+spacing)/2, spacing, -thickness/2])
			cube([cubeLength, 5, thickness], center = false);

		translate([-(x+spacing)/2, z-y-(spacing*2), -thickness/2])
			cube([cubeLength, 5, thickness], center = false);
		
	}
}

module fenceLine(spacing, postWidth, length){
	numberOfPosts = floor(length/(spacing+postWidth));
	echo(numberOfPosts);
	for( i = [1 : 1 : numberOfPosts] ) {
		echo(i);
		translate([(spacing+postWidth)*(i-1), 0, 0])
		fencePost(fencePostWidth, fencePostTaperHeight, fencePostHeight, fencePostThickness,fencePostSpacing);
	}
}



fenceLine(fencePostSpacing, fencePostWidth, corralLength);
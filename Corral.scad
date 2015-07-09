//Fences motherfucker

FencePostWidth = 10;
FencePostTaperHeight = 12;
FencePostHeight = 50;
FencePostThickness = 2.5;

FencePostSpaceing = 5;



module fencePost(x,y,z, thickness){
	linear_extrude(height = thickness, center = true, convexity = 10, twist = 0)
	polygon(points = [[0,0], [x,0], [x,z-y], [x/2,z], [0,z-y]], paths = [[0,1,2,3,4]]);
}

module fenceLine(spacing, length){
	
}

fencePost(FencePostWidth, FencePostTaperHeight, FencePostHeight, FencePostThickness);
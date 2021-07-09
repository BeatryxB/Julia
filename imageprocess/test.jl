using Images, Statistics, ImageBinarization, ImageEdgeDetection
begin
    cactus = red.(load("imageprocess\\IMG_3514.JPG"))
    #tinyCactus = shrink_image(cactus, 6)
end

corners = fastcorners(cactus, 10, 0.1)
img_copy = RGB.(cactus)
img_copy[corners] .= RGB(1.0, 0.0, 0.0)
img_copy

edge = detect_edges(cactus, Canny(spatial_scale = 2.5, low = ImageEdgeDetection.Percentile(5), high = ImageEdgeDetection.Percentile(90)))

mosaic(cactus, img_copy, edge, nrow=1)

save("imageprocess\\test.png",mosaic(cactus, img_copy, edge, nrow=3))

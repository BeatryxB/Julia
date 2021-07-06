begin
    using Images
    cactus = load("imageprocess\\IMG_3514.JPG")
    tinyCactus = shrink_images(cactus, 6)
end

cactus[1000:2000,1000:3000]

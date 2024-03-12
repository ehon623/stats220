library(magick)

# creating caption image by creating a blank image with annotated text and text content/attributes
caption_image <- image_blank(width = 500, 
                             height = 60, 
                             color = "#FFFFFF") %>%
  image_annotate(text = "When you're laughing with bro then you \nrealise STATS220 Project 1 is due",
                 font = "Impact", 
                 size = 21,
                 color = "#000000",
                 gravity = "center")

# assigning scaling image
image <- image_read(path = "https://upload.wikimedia.org/wikipedia/commons/6/62/Thomas_C._Lea_III_-_That_Two-Thousand_Yard_Stare_-_Original.jpg") %>%
  image_scale(500)

# combining caption and image
final_vector <- c(caption_image, image)

# appending final image
meme <- image_append(final_vector, stack = TRUE)
meme

# writing image as a png
image_write(meme, "my_meme.png")

pointing_image <- image_background(image_read(path = "https://images.emojiterra.com/google/noto-emoji/unicode-15.1/color/512px/1faf5.png"), "#4848db")

# creating each frame where text comes from the counts vector
frame1 <- image_scale(pointing_image, 500) %>%
  image_annotate(text = "YOU WILL LAUGH IN 4", size = 30, gravity = "center")

frame2 <- image_scale(pointing_image, 500) %>%
  image_annotate(text = "YOU WILL LAUGH IN 3", size = 30, gravity = "center")

frame3 <- image_scale(pointing_image, 500) %>%
  image_annotate(text = "YOU WILL LAUGH IN 2", size = 30, gravity = "center")

frame4 <- image_scale(pointing_image, 500) %>%
  image_annotate(text = "YOU WILL LAUGH IN 1", size = 30, gravity = "center")

# filler frame for inbetween the counts
filler_frame <- image_scale(pointing_image, 500) %>%
  image_annotate(text = "YOU WILL LAUGH IN   ", size = 30, gravity = "center")

# inserting the frames in order using a vector
motion_frames <- c(frame1, filler_frame, frame2, filler_frame, frame3, filler_frame, frame4, filler_frame, meme, meme, meme, meme)

# creating an animation with morph
animation <- image_morph(motion_frames) %>%
  image_animate(fps = 20)
animation

# writing animation as a gif
image_write(animation, "my_animation.gif")


**Assignment 3**
![](draw-my-hair.gif)

For this assignment, I decided to make a simple paint program. Originally, I wanted to make 
it a little more complex and game like by having a certain requirement of how the painting should be done(i.e. draw this hairstyle). But I realized that
my coding skill is not good enough that the paint program part alone takes up quite some time. Therefore, I decided to just make a drawing program. I made it so 
that if you touch the girl's face or go too far away from her head, messages like "Ouch!" will pop up to give it more of a gaming element.

To make this program, I used part of my self-portrait as the interface. Then, using arrays and for loops, I made the 16 color options on top of the screen.
By manipulating mousepressed(), mousedragged(), and pixels functions, I was able to get the painting functions working. In order to make the text changes, I created 
two boolean variables that start off as false. In mousepressed(), these varibles are changed to true if the position of the mouse is at the suitable places. 
I then used if statement to have the draw function draw out different texts based on the variable values.

What was difficult in this homework was to get the painting part to work. It would've been easy if I was just doing it on a plain background. But since I did it on
a girl's face with a solid square as the background, the draw function keeps overwriting the mouse so nothing show up. To workaround this, I used noLoop() to stop
the draw function from looping. Then, I used loadpixel in mousedragged() and saved all the pixels information to an array(global variable). Since I just saved the
new pixel's information to a global variable - if I can overwrite the canvas with that information, it would look like we just painted something. 
To do this, I also made a boolean variable that is set to false by default. The purpose of this is to mark the "first trial" of draw. This variable is set to true at
the end of draw function. So after the first time running the program, this variable will always be true. With the help of an if statement, I can set the canvas to be 
overwritten by the new pixels[] loaded in mousedragged(). Overall, this program was a lot more chanllenging than I thought, but I had fun and I am glad I figured it
out in the end.

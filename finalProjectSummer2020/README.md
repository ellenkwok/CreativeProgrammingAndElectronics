**Des Inv 23 - Summer 2020 Final Project - Fish In The Pond**

Has your daily life under a pandemic stress you out? Would you like to look at some fish swimming around and just relax? Enjoy this piece of interactive art where you can sit back and look at Koi fish at home!

**Materials used**

Photoresistor, potentiometer, button, ultrasonic sensor.

**Project description**

When you open the program up, you will see a pond like so with koi fish swimming inside it. In order to control the swimming speed of these fish, you can turn the potentiometer. By changing how bright the surrounding is, you can change the brightness of the pond as the photoresistor will take in the data. When you click on a button, a bubble will emerge. The maximum bubbles you can have is 8 bubbles. The purpose of this piece is to make something nice and calming, therefore, if you get too close to the Arduino and try to mess with it, these bubbles will pop and become a flower. This is detected by the ultrasonic sensor as it measures your distance away from the sensor. It will also make a pop sound when it pops. The cursor is a goldfish. All of these elements and background in this program are drawn in another program(Clip studio art) and uploaded to Processing.

**Problems Encountered**
When I was trying to incorporate the ultrasonic sensor, I found it difficult to make it work with the other sensors as a lot of examples on ultrasonic sensor uses the delay() function. I did not want to hold up other sensors for the ultrasonic sensor. In order to resolve this issue, I used this library called New Ping, which allows you to calculate distance without using the delay() function. I also found it difficult to edit the video for this presentation. The processing video ends up looking very choppy.

**Schematic**

[fish-in-pond-schematic.jpg]

**Screenshots of the program**

[swimming.png]

How the program initially looks like when opened.

[dark.png]

Limiting light inputs.

[bubble.png]

Pressing a button and adding a bubble to it.

[bubblePop.png]

Breaking the bubble with ultrasonic sensor.

[bubbleFlower.png]

Nice and soothing.

**Arduino Board**

[board.png]

**Link to the video

uploading to youtube, will update link once it's ready
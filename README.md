# whimsify-video-colors
Process that dynamically alters video colors using Matlab

![](https://cloud.githubusercontent.com/assets/12240257/7742659/be1b7e3a-ff5f-11e4-829a-f7fd1f01ae42.jpg)
![](https://cloud.githubusercontent.com/assets/12240257/7742661/c0dc2cc8-ff5f-11e4-9919-057d70964c53.jpg)

This code allows you to create a modified copy of a video clip saved in MP4 format, in which the colors are dynamically altered throughout the clip using a cycle of varying visual effects, producing a result that is peculiarly mesmerizing and a lot of fun to re-watch.

It works great on Finding Nemo! I had a lot of fun watching the warped version. 

Each pixel changes color as a function of both its original color, and how much time in the clip has passed, so not every pixel is the same color at the same time, and each individual character will take on different color combinations as the film progresses. For example, Nemo's father, Marlin, changes colors constantly throughout the film (except for his white stripes which stay white), from orange to green to purple to blue to red to pink, etc. And the environment changes as well throughout his journey to find Nemo. 

Matlab is an appropriate tool for this task. Manipulating videos and images, and matrix computations in general (as an image is really just a 2d matrix of RGB values), are accomplished effectively using Matlab. It allowed me to create a really cool process using very little and straightforward code. I'm a fan!

Feel free to use this on any video you'd like, and to use, change, or repurpose the code as you wish!
I hope you enjoy experimenting with this!

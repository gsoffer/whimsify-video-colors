# whimsify-video-colors
Process that dynamically alters video colors using Matlab

![](https://cloud.githubusercontent.com/assets/12240257/7742659/be1b7e3a-ff5f-11e4-829a-f7fd1f01ae42.jpg)
![](https://cloud.githubusercontent.com/assets/12240257/7742661/c0dc2cc8-ff5f-11e4-9919-057d70964c53.jpg)

This code allows you to create a modified copy of a video clip or movie saved in MP4 format, in which the colors are dynamically altered throughout the clip using a cycle of varying visual effects, producing a result that could be fun and mesmerizing to re-watch.

Works great on Finding Nemo! I had a lot of fun watching the warped version. 

Each pixel changes color as a function of both its original color and how much time in the film has passed, so not everything is the same color at the same time, and each individual character will take on different color combinations as the film progresses. For example, Nemo's dad changes colors constantly throughout the film (except for his white stripes which stay white), from orange to green to purple to blue to red to pink, etc. And the environment changes as well throughout his journey. 

If you are interested as to why I chose to create this using Matlab, I will explain:
I had fully intended on using a standard programming language (Python, Java, etc.) to create this project. However, as I began my research, I realized that manipulating videos and images, and matrix computations in general (as an image is really just a 2d matrix of RGB values), are accomplished simply using Matlab. In the end, Matlab allowed me to create a really cool process using very little, yet straightforward, code. I'm a fan!

Feel free to use this on any video you'd like, and to use, change, or repurpose the code as you wish!

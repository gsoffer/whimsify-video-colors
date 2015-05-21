# whimsify-video-colors
Process that dynamically alters video colors using Matlab

![](https://cloud.githubusercontent.com/assets/12240257/7742659/be1b7e3a-ff5f-11e4-829a-f7fd1f01ae42.jpg)

This code allows you to create a modified copy of a video clip or movie saved in MP4 format, in which the colors are dynamically altered throughout the clip using a cycle of varying visual effects I concocted, producing a result that could be fun and mesmerizing to re-watch.

Works great on Finding Nemo! Everything changes color as a function of both its original color and how much time in the film has passed, so not everything is the same color at the same time, and each individual character will take on different color combinations as the film progresses. For example, Nemo's dad changes colors constantly throughout the film (except for his white stripes which stay white), from orange to green to purple to blue to red to pink, etc. And the environment changes as well throughout his journey. 

In you are interested as to why I chose to create this using Matlab, I will explain:
I had fully intended on using a standard programming language (Python, Java, etc.) to create this project. However, as I began my research, I realized that manipulating videos and images, and matrix computations in general (as an image is really just a 2d matrix of RGB values), are accomplished simply and effectively using Matlab. This makes sense considering the common applications of Matlab in academia. In the end, Matlab allowed me to create a really cool process using very little, yet straightforward, code. I'm a new fan!

Of course, feel free to use this on any video you'd like, and to use, change, or repurpose the code as you wish!

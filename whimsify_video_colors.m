% whimsify-video-colors
% Dynamically change the colors of a video
% Written by Gil Soffer (Originally 05-21-2015)
% Works great on Finding Nemo, but use on anything!
% Feel free to modify and repurpose this code as you wish!



% Create the folder in which the image frames will be created
imagesFolder = 'frames';
mkdir(imagesFolder)

% Create a file handler for the input video
videoName = 'Finding Nemo.mp4';
inputVideo = VideoReader(videoName);

% Generate all image frames (jpegs named 00000001.jpg, 00000002.jpg. etc...)
ii = 1;
while hasFrame(inputVideo)
   img = readFrame(inputVideo);
   fileName = [sprintf('%08d',ii) '.jpg'];
   fullName = fullfile(imagesFolder, fileName);
   % Modify the images
   %---------------------------------------------------------------------
   % Store 2d matrices with R, G, and B values (unsigned 8-bit by default)
   redChannel = img(:, :, 1);
   greenChannel = img(:, :, 2);
   blueChannel = img(:, :, 3);
   % Store as signed 32 bit to allow for negatives and large intermediate computations
   origRed = int32(redChannel);
   origGreen = int32(greenChannel);
   origBlue = int32(blueChannel);
   % Assign the frames per swap (how slowly the colors change)
   framesPerColorSwap = 800;
   % Assign the number of color swaps (number of effect transitions)
   numColorSwaps = 11;
   % Assign multiplication factor that represents progress within each cycle
   multiplicationFactor = mod(ii, (framesPerColorSwap * numColorSwaps));
   if multiplicationFactor == 0
       multiplicationFactor = (framesPerColorSwap * numColorSwaps);
   end
   % R G B = 10 4 2 (red) -> 4 10 2 (green) -> 4 2 10 (blue) -> 10 2 4
   % (red) -> 2 10 4 (green) -> 2 4 10 (blue) -> 10 4 2 (red)
   % R G B = 3 10 5 (green) -> 10 3 5 (red) -> 10 5 3 (red) -> 3 5 10
   % (blue) -> 5 3 10 (blue) -> 5 10 3 (green) -> 3 10 5 (green)
   % R G B = 1 0 10 (blue) -> 0 1 10 (blue) -> 0 10 1 (green) -> 1 10 0
   % (green) -> 10 1 0 (red) -> 10 0 1 (red) -> 1 0 10 (blue)
   % RGB -> GRB
   if multiplicationFactor <= framesPerColorSwap
       difRedGreen = origRed - origGreen;
       newRed = uint8(origRed - round(difRedGreen * multiplicationFactor / framesPerColorSwap));
       newGreen = uint8(origGreen + round(difRedGreen * multiplicationFactor / framesPerColorSwap));
       newBlue = uint8(origBlue);
   % GRB -> BRG
   elseif multiplicationFactor <= (framesPerColorSwap * 2)
       difRedBlue = origRed - origBlue;
       newRed = uint8(origGreen);
       newGreen = uint8(origRed - round(difRedBlue * (multiplicationFactor - framesPerColorSwap) / framesPerColorSwap));
       newBlue = uint8(origBlue + round(difRedBlue * (multiplicationFactor - framesPerColorSwap) / framesPerColorSwap));
   % BRG -> RBG
   elseif multiplicationFactor <= (framesPerColorSwap * 3)
       difRedGreen = origRed - origGreen;
       newRed = uint8(origGreen + round(difRedGreen * (multiplicationFactor - (framesPerColorSwap * 2)) / framesPerColorSwap));
       newGreen = uint8(origBlue);
       newBlue = uint8(origRed - round(difRedGreen * (multiplicationFactor - (framesPerColorSwap * 2)) / framesPerColorSwap));
   % RBG -> GBR
   elseif multiplicationFactor <= (framesPerColorSwap * 4)
       difRedBlue = origRed - origBlue;
       newRed = uint8(origRed - round(difRedBlue * (multiplicationFactor - (framesPerColorSwap * 3)) / framesPerColorSwap));
       newGreen = uint8(origBlue + round(difRedBlue * (multiplicationFactor - (framesPerColorSwap * 3)) / framesPerColorSwap));
       newBlue = uint8(origGreen);
   % GBR -> BGR
   elseif multiplicationFactor <= (framesPerColorSwap * 5)
       difRedGreen = origRed - origGreen;
       newRed = uint8(origBlue);
       newGreen = uint8(origRed - round(difRedGreen * (multiplicationFactor - (framesPerColorSwap * 4)) / framesPerColorSwap));
       newBlue = uint8(origGreen + round(difRedGreen * (multiplicationFactor - (framesPerColorSwap * 4)) / framesPerColorSwap));
   % BGR -> RGB
   elseif multiplicationFactor <= (framesPerColorSwap * 6)
       difRedBlue = origRed - origBlue;
       newRed = uint8(origBlue + round(difRedBlue * (multiplicationFactor - (framesPerColorSwap * 5)) / framesPerColorSwap));
       newGreen = uint8(origGreen);
       newBlue = uint8(origRed - round(difRedBlue * (multiplicationFactor - (framesPerColorSwap * 5)) / framesPerColorSwap));
   % Red -> 0
   elseif multiplicationFactor <= (framesPerColorSwap * 7)
       newRed = uint8(origRed - round(origRed * (multiplicationFactor - (framesPerColorSwap * 6)) / framesPerColorSwap));
       newGreen = uint8(origGreen);
       newBlue = uint8(origBlue);
   % Green -> 0
   elseif multiplicationFactor <= (framesPerColorSwap * 8)
       newRed = uint8(round(origRed * (multiplicationFactor - (framesPerColorSwap * 7)) / framesPerColorSwap));
       newGreen = uint8(origGreen - round(origGreen * (multiplicationFactor - (framesPerColorSwap * 7)) / framesPerColorSwap));
       newBlue = uint8(origBlue);
   % Blue -> 0
   elseif multiplicationFactor <= (framesPerColorSwap * 9)
       newRed = uint8(origRed);
       newGreen = uint8(round(origGreen * (multiplicationFactor - (framesPerColorSwap * 8)) / framesPerColorSwap));
       newBlue = uint8(origBlue - round(origBlue * (multiplicationFactor - (framesPerColorSwap * 8)) / framesPerColorSwap));
   % Back to normal
   elseif multiplicationFactor <= (framesPerColorSwap * 10)
       newRed = uint8(origRed);
       newGreen = uint8(origGreen);
       newBlue = uint8(round(origBlue * (multiplicationFactor - (framesPerColorSwap * 9)) / framesPerColorSwap));
   % Stay on normal for one cycle
   else
       newRed = uint8(origRed);
       newGreen = uint8(origGreen);
       newBlue = uint8(origBlue);
   end
   img2 = cat(3, newRed, newGreen, newBlue);
   %---------------------------------------------------------------------
   imwrite(img2,fullName) % Create the actual image files
   ii = ii+1;
end

% Store the image names in an array
imageNames = dir(fullfile(imagesFolder,'*.jpg'));
imageNames = {imageNames.name}';


% Generate a new AVI file based on the modified images
outputVideo = VideoWriter('output_video.mp4', 'MPEG-4');
outputVideo.FrameRate = inputVideo.FrameRate;
open(outputVideo)
for ii = 1:length(imageNames)
   img = imread(fullfile(imagesFolder, imageNames{ii}));
   writeVideo(outputVideo, img)
end
close(outputVideo)



% Save the audio in your desired format (WAV used here):
% I don't have the latest version of MATLAB in which the audio and video can be exported to one file.
% For myself, and those in the same boat, just combine using your favorite video editor.
[y,Fs] = audioread(videoName);
audiowrite('output_audio.wav', y, Fs);


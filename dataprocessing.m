%% Video Resize (Training) 
vidobj = vision.VideoFileReader(fullfile('data','Train.mp4'))
viewer = vision.DeployableVideoPlayer;
videoFWriter = vision.VideoFileWriter(fullfile('data','Train1.mp4'));
numFrames = 0;
    while ~isDone(vidobj)
              A = step(vidobj);  
              viewframe = imresize(A,[416,416]);
              step(viewer, viewframe);
              numFrames = numFrames + 1;
              step(videoFWriter, viewframe);
    end
release(vidobj);
% release(viewer);
release(videoFWriter);
%% Video Resize (Test)
vidobj = vision.VideoFileReader(fullfile('data','Test1.mp4'))
viewer = vision.DeployableVideoPlayer;
videoFWriter = vision.VideoFileWriter(fullfile('data','Test2.mp4'));
numFrames = 0;
    while ~isDone(vidobj)
              A = step(vidobj);  
              viewframe = imresize(A,[416,416]);
              step(viewer, viewframe);
              numFrames = numFrames + 1;
              step(videoFWriter, viewframe);
    end
release(vidobj);
release(viewer);
release(videoFWriter);
%% Create Video Labeller
% save the gtruth as Train.mat
%% Create Training Data from Ground Truth Data
if ~exist('Train', 'var')
    load (fullfile("Utilities","Train.mat")) 
end

if ~isfolder(fullfile("TrainingData"))
    mkdir TrainingData
end

TrainingData = objectDetectorTrainingData(Train,'SamplingFactor',1,...
    'WriteLocation','TrainingData');
save('Utilities\TrainingData.mat','TrainingData');

% Display first few rows of the data set.
TrainingData(1:4,:)

%% Create Test Data
if ~isfolder(fullfile("TestData"))
    mkdir TestData
end
vid = VideoReader('data\Test2.mp4');
TestData = table('Size',[vid.NumberOfFrames 1],...
    'VariableTypes',{'cell'},...
    'VariableNames',{'imagefilename'});
cd TestData
for img=1:vid.NumberOfFrames
    filename=strcat('Frame',num2str(img),'.jpg');
    image=read(vid,img);
    imwrite(image,filename);
    TestData.imagefilename{img} = which(filename);
end
cd ..  
save('Utilities\TestData.mat','TestData');
%% Test data with bbox
if ~exist('Test', 'var')
    load (fullfile("Utilities","Test.mat"))
end

if ~isfolder(fullfile("TestData"))
    mkdir TestData
end

TestData = objectDetectorTrainingData(Test,'SamplingFactor',1,...
    'WriteLocation','TestData');
save('Utilities\TestData.mat','TestData');

% Display first few rows of the data set.
TestData(1:4,:)

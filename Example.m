% Added fake laser scanner to example

addpath('Mex')
addpath('utils')

% Start the Kinect Process
if(~exist('KinectHandles','var'))
    KinectHandles = mxMSCreateContext([2 1]);
end

% Get Photo and Depth-frame
I = mxMSPhoto(KinectHandles); 
raw = mxMSDepth(KinectHandles);
[r, theta, x, y] = scan2d(raw);

% Normalize Depth map to 0..1 range
D = raw; D = double(D); D = D-min(D(:)); D = D./(max(D(:)) + eps);

figure;
subplot(1,2,1), h1 = imshow(I);
subplot(1,2,2), h2 = imshow(D);

figure;
h = plot(x, y);
axis([-3 3 0 5]);

% Display 900 Frames
for i = 1:90000
    I = mxMSPhoto(KinectHandles);
    
    raw = mxMSDepth(KinectHandles);
    [r, theta, x, y] = scan2d(raw);
    D = raw; D = double(D);  D = D - min(D(:)); D = D./max(D(:));
    
    set(h1, 'CDATA', flipdim(I, 2)); % Update and flip image horizontally
    set(h2, 'CDATA', flipdim(D, 2)); % Update and flip image horizontally
    set(h, 'XData', x);
    set(h, 'YData', y);
    pause(0.01);
    drawnow; 
end

% Stop the Kinect Process
%mxMSDeleteContext(KinectHandles);

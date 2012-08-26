% This function mxMSDeleteContext, closes the Kinect-objects which connect
% to the Kinect streams, such as image, IR and depth. 
%
% mxMSDeleteContext(KinectHandles);
%
% inputs,
%   KinectHandles : Array with pointers to kinect node objects generated by
%          mxMSCreateContext, such as main, image, IR, Depth and User node.
%
% See also mxMSCreateContext, mxMSDepth, mxMSPhoto,
%		mxMSSkeleton, compile_cpp_files
%
% Mex-Wrapper is written by D.Kroon University of Twente (September 2011)  

Readme
=============

This project consists of a modified Matlab Kinect interface to work with the latest Microsoft Kinect SDK (v1.5). The original Kinect wrappers were developed by Dirk-Jan Kroon.

Robert Tang <opensource@robotang.co.nz>

Dependencies
------------

The following downloads are required:

* [Visual Studio C++](ttp://www.microsoft.com/visualstudio/en-us/products/2010-editions/visual-cpp-express)
* [Kinect SDK v 1.5](http://www.microsoft.com/en-us/kinectforwindows/develop/developer-downloads.aspx)
* [Kinect Developer Toolkit v1.5.2](http://www.microsoft.com/en-us/kinectforwindows/develop/developer-downloads.aspx)

Obviously you also need Matlab on your machine (with the Image Processing Toolbox) and an Xbox Kinect sensor. The skeletal viewer demos from the Developer toolkit work fine with a regular Xbox Kinect. However, if you do not have a Kinect, and you plan to do HCI-related projects on a PC, it might be a good idea to buy the Kinect sensor for Windows (especially for the 'near mode' which allows depth sensing to closer objects). Having said that, a regular Xbox Kinect worked fine for my purposes.

Installation
------------

Install Visual Studio C++ (2010 or later), the Kinect SDK and Developer toolkit. After this is done you are likely to need to reboot your PC. It would now be a good idea to confirm that you can build and run the VC++ demos (which will probably be installed at C:\Program Files\Microsoft SDKs\Kinect\Developer Toolkit v1.5.2\Samples\C++).

Clone this repository:

    git clone https://github.com/robotang/kinect-matlab.git

Now fire up Matlab and navigate to the root directory of the github project. If you have not used Matlab's mex before, you need to firstly configure it. Do this by running:

    mex -setup
    
in the Matlab console. Select the appropriate compiler, and run 

    compile_cpp_files
    
Happy hacking!

NB: I have yet to fix the Kinect audio wrappers

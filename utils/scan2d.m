%  Copyright (C) 2012, Robert Tang <opensource@robotang.co.nz>
%
%  This is free software; you can redistribute it and/or
%  modify it under the terms of the GNU Lesser General Public
%  License as published by the Free Software Foundation; either
%  version 2.1 of the License, or (at your option) any later version.
%
%  This program is distributed in the hope that it will be useful,
%  but WITHOUT ANY WARRANTY; without even the implied warranty of
%  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
%  Lesser General Public License for more details.
%
%  You should have received a copy of the GNU Lesser General Public Licence
%  along with this library; if not, see <http://www.gnu.org/licenses/>.

function [r, theta, x, y] = scan2d(raw_depth)

% Parameters
h = size(raw_depth, 1);
w = size(raw_depth, 2);
FOVx = 57/180*pi; % horizontal field of view of a kinect is 57 degrees

% Take centre row
l = double(raw_depth(h/2, :));

% Compute distance
y = raw2distance(l);
y(1:8) = y(9); % HACK - first eight pixels of depth map seem to always be zero. Assume value of ninth cell!
y = flipdim(y, 2);

% Calculate theta (approximately!)
index = (1:w) - w/2;
theta = (FOVx/w) * index;

% Calculate other values
x = y .* tan(theta);
r = sqrt(x.^2 + y.^2);

%
% Supporting functions
% 

function d = raw2distance(raw)
    % Ignore lower three bits (same as raw = raw >> 3)
    raw = raw/8; 
    
    % Convert to metres
    d = raw / 1000;

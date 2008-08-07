% [result] = transform_by_rigid2d(pointset, param)
% perform a 2D rigid transform on a pointset and
% return the transformed pointset
% Note that here 2D rigid transform is parametrized by [translation_x,
% translation_y, rotation_angle].
%
% See also: transform_by_rigid3d
function [result] = transform_by_rigid2d(pointset, param)
%%=====================================================================
%% $RCSfile: transform_by_rigid2d.m,v $
%% $Author: bjian $
%% $Date: 2008/06/28 23:32:20 $
%% $Revision: 1.1 $
%%=====================================================================
n = size(original_pointset,1);
% parameters of 2D-rigid transform
delta_x = param(1);   % translation in x-dimension
delta_y = param(2);   % translation in y-dimension
d_theta = param(3);   % rotation in radius
% form the rotation matrix
r = [cos(d_theta) -sin(d_theta);
     sin(d_theta)  cos(d_theta)];
% first rotate
result(:,1:2) = pointset(:,1:2) * r' ;
% than translate
result(:,1:2) = result(:,1:2) + ones(n,1)*[delta_x delta_y];

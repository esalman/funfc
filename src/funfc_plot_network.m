% funfc_plot_network(mask_, network_, th_) plots a network on current
% figure
% Input parameters:
%   mask_:      3D matrix of 1's and 0's
%   network_:   vector containing z-scores. should have the same length as
%               the number of 1's in the mask_
%   th_:        optional threshold for z-scores. Pass [], 0, null, false
%               etc to skip
%
% TODO add a structural mask.

function z = funfc_plot_network(mask_, network_, th_)
colormap gray

t1 = mask_;
t1( find(mask_(:)==1) ) = network_;
[~, y] = max( t1(:) );
[~, ~, z] = ind2sub(size(t1), y);
if th_, t1( find(abs(t1(:)) < th_) ) = 0; end;

% plot all slices
for j = 1:size(t1, 3)
    imagesc( t1(:,:,j) ), caxis([ -max(abs(t1(:))) max(abs(t1(:))) ]), axis image, colorbar
    title(['Axial slice: ' num2str(j)])
    pause(.1)
end;

% % plot particular slice
% z = 19;

% % plot slice with max z-score
% imagesc( t1(:,:,z) ), caxis([ -max(abs(t1(:))) max(abs(t1(:))) ]); axis image, colorbar
% % imagesc( t1(:,:,z) ), caxis([ 0 max(abs(t1(:))) ]), axis image, colorbar
% set(gca, 'xtick', [], 'ytick', []);



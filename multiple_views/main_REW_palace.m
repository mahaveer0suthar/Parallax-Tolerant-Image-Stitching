function main(exp_path)
run('/vlfeat-0.9.20/toolbox/vl_setup');

addpath('transforms');
% addpath('examples');

data_path = '/data/multiple_views/images/REW_palace/';
data_files = [dir([data_path '*.jpg']);dir([data_path '*.JPG']);dir([data_path '*.png']);dir([data_path '*.PNG'])];
im_n = size(data_files,1);
im = cell(im_n,1);
for ii = 1:im_n
    im{ii} = imread([data_path data_files(ii).name]);
end

edge_list = zeros(im_n-1,2);
for ei = 1:im_n-1
    edge_list(ei,:) = [ei,ei+1];
end
edge_list = cat(1, edge_list, [12,1; 24,13; 1,14; 2,15; 3,16; 4,17; 5,18; 6,19; 7,20; 8,21; 9,22; 10,23; 11,24]);

mosaic = REW_mosaic( im, edge_list, 0, 'equi', 0.04, data_path, exp_path );

end
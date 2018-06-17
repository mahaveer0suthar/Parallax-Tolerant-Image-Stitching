function main(exp_path)
run('/vlfeat-0.9.20/toolbox/vl_setup');

addpath('transforms');
% addpath('examples');

data_path = '/data/multiple_views/images/ANAP-roundabout/';
data_files = [dir([data_path '*.jpg']);dir([data_path '*.JPG']);dir([data_path '*.png']);dir([data_path '*.PNG'])];
im_n = size(data_files,1);
im = cell(im_n,1);
for ii = 1:im_n
    im{ii} = imread([data_path data_files(ii).name]);
end

edge_list = [1,2; 1,4; 2,3; 2,4; 3,4];

imsize = zeros(im_n,3);

%{
for ii = 1:im_n
    imsize(ii,:) = size(im{ii});
    if imsize(ii,1) > 720
        scale = 720/size(im{ii}, 1);
        im{ii} = imresize(im{ii}, scale);

        imsize(ii,:) = size(im{ii});
    end
end
%}

mosaic = REW_mosaic( im, edge_list, 2, 'persp', 0.04, data_path, exp_path );

end
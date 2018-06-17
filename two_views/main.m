function main(data_path, exp_path)
% data_path: path to folder containing two input images with .jpg extensions
% exp_path: path to preexisting folder to which resulting images will be written
load_data;

comp_KR;

mosaic_global;

mosaic_local_ori;

% draw_deformations;

% mosaic_with_similarity;
end
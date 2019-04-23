function [rf_img, bmode_img, scat_space, coords] = gen_uniform_img();

ax_img = 2/100; % axial range in cm
lat_img = 2/100; % lateral range in cm
current_dir = pwd;
cd ..
addpath(genpath('field_tools'))
cd(current_dir)
load('1MHz_psf_data.mat')
res_area = calcResCellPSF(psf, ax_psf, lat_psf);
%psf = psf(1:462, :);

ax_spacing = ax_psf(2) - ax_psf(1);
lat_spacing = lat_psf(2) - lat_psf(1);

num_ax_samples = ceil(ax_img / ax_spacing);
num_lat_samples = ceil(lat_img / lat_spacing);
scat_space_sz = [num_ax_samples, num_lat_samples]; 

scat_space = zeros(scat_space_sz);

ax = ((-num_ax_samples/2):((num_ax_samples-1)/2))*ax_spacing + params.focal_depth;
lat = (0:num_lat_samples-1)*lat_spacing;

img_area = ax_img * lat_img;
num_res_cells = img_area / res_area;
nScat = ceil(20*ceil(num_res_cells));

scat_space = scat_space(:);
scat_coords = randi(length(scat_space), nScat, 1); % generate Nscat random indices in scat_space vector  
scat_space(scat_coords)=1; % set those indices = 1, indicating presence of scatterer 
scat_space=reshape(scat_space, scat_space_sz);


%%
tmp = conv2(scat_space, psf, 'same');
%tmp = tmp(1:2500, :); % This cropping will need to be changed for different frequencies / image dimmensions!
%coords(1) - coords(1)-98;

rf_img=tmp/max(tmp(:)); % normalize rf image
bmode_img = db(abs(hilbert(rf_img)));
coords = [0,0,0,0];
end

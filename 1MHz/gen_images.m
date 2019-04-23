function [] = gen_images(set_num, batch_size, lesion_condition, contrast)
%UNTITLED26 Summary of this function goes here
%   Detailed explanation goes here
for i = 1:batch_size
    i
    if lesion_condition
        [rf_tmp, bmode_tmp, scat_space_tmp, coords_tmp] = gen_lesion_img(contrast);
    else
        [rf_tmp, bmode_tmp, scat_space_tmp, coords_tmp] = gen_uniform_img();
    end
    
    rf_img(:, :, i) = rf_tmp;
    bmode_img(:, :, i) = bmode_tmp;
    scat_space(:, :, i) = scat_space_tmp;
    coords(:, :, i) = coords_tmp;
    
end

if lesion_condition
    
    save([num2str(abs(contrast)), 'dB/Lesion_Images/set_', num2str(set_num), '_lesion_rf.mat'], 'rf_img', '-v7.3', '-nocompression')
    save([num2str(abs(contrast)), 'dB/Lesion_Images/set_', num2str(set_num), '_lesion_bmode.mat'], 'bmode_img', '-v7.3', '-nocompression')
    save([num2str(abs(contrast)), 'dB/Lesion_Images/set_', num2str(set_num), '_lesion_scat.mat'], 'scat_space', '-v7.3', '-nocompression')
    save([num2str(abs(contrast)), 'dB/Lesion_Images/set_', num2str(set_num), '_lesion_coords.mat'], 'coords', '-v7.3', '-nocompression')
else
        
    save([num2str(abs(contrast)), 'dB/Uniform_Images/set_', num2str(set_num), '_uniform_rf.mat'], 'rf_img', '-v7.3', '-nocompression')
    save([num2str(abs(contrast)), 'dB/Uniform_Images/set_', num2str(set_num), '_uniform_bmode.mat'], 'bmode_img', '-v7.3', '-nocompression')
    save([num2str(abs(contrast)), 'dB/Uniform_Images/set_', num2str(set_num), '_uniform_scat.mat'], 'scat_space', '-v7.3', '-nocompression')
    %save(['set_', num2str(set_num), '_uniform_coords.mat'], 'coords')
end

function [num_of_image] = CalNumPerImage(mat_in,image_length)
row_num=size(mat_in,1);
num_of_image=floor(row_num/image_length);

for image=1:num_of_image
    from_re=[mat_in((image-1)*image_length+1:image*image_length ,901:1100)...
        mat_in((image-1)*image_length+1:image*image_length,1265:1499)];
    
    limits=[16900,18600];
    
    recipe_name = inputname(1);
   
    imagesc(from_re');
    c = self_colormap(435);
    colormap(c);
    caxis(limits);
    set(gca,'position',[0 0 1 1]);

    saveas(gcf,['D:\All_MATLAB_Codes_ZheWu\CNNCodes\ImageDataSet\',...
        recipe_name,'_',sprintf('%03i',image),'.png']);%,int2str(image)]);
    close all;
    currentpng=imread(['D:\All_MATLAB_Codes_ZheWu\CNNCodes\ImageDataSet\',...
        recipe_name,'_',sprintf('%03i',image),'.png']);
    resizepng=imresize(currentpng,[110 110]);
    imwrite(resizepng,['D:\All_MATLAB_Codes_ZheWu\CNNCodes\ImageDataSet\',...
        recipe_name,'_',sprintf('%03i',image),'.png']);
    close all;
end

end


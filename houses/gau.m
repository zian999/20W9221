function img_gauss_conv = gau(file)

    %%%% step1: 读取原始图片数据
    %I = imread('psy9221_project2_face_A1.png');
    I = imread(file);
    % figure; imshow(I);

    %%%% step2: 生成高斯滤波模板
    sigma = 0.5;  %设定标准差值，该值越大，滤波效果（模糊）愈明显
    window = double(uint8(3*sigma)*2 + 1);  %设定滤波模板尺寸大小
    %fspecial('gaussian', hsize, sigma)产生滤波掩模
    G = fspecial('gaussian', window, sigma);

    %%%% step3: 图像各像素点进行高斯滤波
    %为了不出现黑边，使用参数'replicate'（输入图像的外部边界通过复制内部边界的值来扩展）
    %img_gauss_corr = imfilter(I,G,'corr','replicate','same');
    img_gauss_conv = imfilter(I,G,'conv','replicate','same');

    %%%% step4: 图像经高斯滤波前后对比 
%     figure(1)
%     imshow(I),title('原始图像');
% 
%     figure(2)
%     subplot(1,2,1),imshow(img_gauss_corr),title('高斯相关滤波图像');
%     subplot(1,2,2),imshow(img_gauss_conv),title('高斯卷积滤波图像');
end
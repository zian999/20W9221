fileFolder=fullfile('./');

dirOutput=dir(fullfile(fileFolder,'*.png'));

fileNames={dirOutput.name}';

size = 0.6:0.05:1;
for i = 1:length(fileNames)
    f = imread(fileNames{i});
    for j = 1:length(size)
        em_f = uint8(zeros(32,32,3)+255);
        bf = imresize(f,size(j));
        start = floor((32 - length(bf))/2 + 1);
        for k = 1:3
            em_f(start:(start+length(bf)-1),start:(start+length(bf)-1),k) = bf(:,:,k);
%             rgb_em = em_f(:,:,k);
%             rgb_em(start:(start+length(bf)-1),start:(start+length(bf)-1)) = rgb;
        end
        imwrite(em_f,strcat(num2str(size(j)),'/',fileNames{i}))
    end
end


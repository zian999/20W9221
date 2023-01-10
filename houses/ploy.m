x_r = repmat(-15.5:15.5,32,1);
y_r = -(x_r');
% t_all = zeros(32,32);
% b_all = zeros(32,32);

[t,b] = cart2pol(x_r,y_r);

size = 0.6:0.05:1;
for n = 1:length(size)
    fileFolder=fullfile(strcat(num2str(size(n)),'/'));
    dirOutput=dir(fullfile(fileFolder,'*.png'));
    fileNames={dirOutput.name}';
    for l = 1:length(fileNames)
    f = gau(strcat(num2str(size(n)),'/',fileNames{l}));

        f_pol = uint8(zeros(32,32,3)+255);
        t_ax = linspace(min(t(:)),max(t(:)),32);
        b_ax = linspace(min(b(:)),max(b(:)),32);

        dt = t_ax(2) - t_ax(1);
        db = b_ax(2) - b_ax(1);

        for m = 1:3
            for i = 1:32
                for j = 1:32
                   t_ind = t(i,j);
                   b_ind = b(i,j);
                   for k = 2:32
                       if t_ind == t_ax(k-1) || abs(t_ind - t_ax(k-1)) < dt/2
                           tidx = k - 1 ;
                       elseif t_ind == t_ax(k) || abs(t_ind - t_ax(k)) < dt/2
                           tidx = k;
                       end
                       if b_ind == b_ax(k-1) || abs(b_ind - b_ax(k-1)) < db/2
                           bidx = k - 1 ;
                       elseif b_ind == b_ax(k) || abs(b_ind - b_ax(k)) < db/2
                           bidx = k;
                       end
                   end
                   f_pol(tidx,bidx,m) = f(i,j,m);
                end
            end
            imwrite(f_pol,strcat(num2str(size(n)),'/',fileNames{l},'_pola.png'))
        end
    end
end
        %imshow(f_pol)           
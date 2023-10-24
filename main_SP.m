clc;
clear;
global KTYPE KSCALE C C_star data_flag C_end s C_star_end s_end
% use RBF kernel in SemiSVM.Kernel
KTYPE = 6;
result_SP = {};
data_flag = 'ijcnn1';
size_data = 9000;
K_CV = 5;
for num_CV = 2:K_CV
    KSCALE = 0.01;
    KSCALE_list = [];
    acc2 = zeros(1,10);
    time2 = zeros(1,10);
    C_mat2 = zeros(1,10);
    acc3 = zeros(1,10);
    time3 = zeros(1,10);
    C_star_mat3 = zeros(1,10);
    acc4 = zeros(1,10);
    time4 = zeros(1,10);
    s_mat4 = zeros(1,10);
    for num_KSCALE = 1:10
        load([data_flag, '/', data_flag, '_', num2str(size_data), '_CV_', num2str(num_CV)])
        KSCALE = KSCALE * 2;
        KSCALE_list(num_KSCALE, 1) = KSCALE;
        C = 2e-10;
        C_star = 2e-10;
        s = 0;
        C_end = 2^19;
        len1 = 1;
        % search C
        for i = 1:100000
            if C > C_end
                break;
            end
            [time,acc,C_mat,val_x,val_y,original_x,original_y,extended_x,extended_y,initial_solution,extended_real_y] = ...
                run_C(val_x,val_y,original_x,original_y,extended_x,extended_y,extended_real_y);
            len2 = length(acc);
            acc2(len1:len1+len2-1, num_KSCALE) = acc;
            time2(len1:len1+len2-1, num_KSCALE) = time;
            C_mat2(len1:len1+len2-1, num_KSCALE) = C_mat;
            len1 = len1 + len2;
        end
        [~, max_acc2_idx] = max(acc2(:,num_KSCALE));
        for i = max_acc2_idx:length(acc2(:,num_KSCALE))
            if C_mat2(i,num_KSCALE) > 5
                C = 1;
                break;
            end
            if acc2(i,num_KSCALE) ~= acc2(max_acc2_idx,num_KSCALE)
                C = C_mat2(i-1,num_KSCALE);
                break;
            end
        end
        C_star = 2e-10;
        s = 0;
        C_star_end = C;
        len1 = 1;
        % search C*
        for i = 1:100000
            if C_star > C_star_end
                break;
            end
            [time,acc,C_star_mat,val_x,val_y,original_x,original_y,extended_x,extended_y,initial_solution,extended_real_y] = ...
                run_C_star(val_x,val_y,original_x,original_y,extended_x,extended_y,extended_real_y);
            len2 = length(acc);
            acc3(len1:len1+len2-1, num_KSCALE) = acc;
            time3(len1:len1+len2-1, num_KSCALE) = time;
            C_star_mat3(len1:len1+len2-1, num_KSCALE) = C_star_mat;
            len1 = len1 + len2;
        end
        [~, max_acc3_idx] = max(acc3(:,num_KSCALE));
        C_star = C_star_mat3(max_acc3_idx,num_KSCALE);
        s = -1;
        s_end = 0;
        len1 = 1;
        % search s
        for i = 1:100000
            if s > s_end
                break;
            end
            [time,acc,s_mat,val_x,val_y,original_x,original_y,extended_x,extended_y,initial_solution,extended_real_y] = ...
                run_s(val_x,val_y,original_x,original_y,extended_x,extended_y,extended_real_y);
            len2 = length(acc);
            acc4(len1:len1+len2-1, num_KSCALE) = acc;
            time4(len1:len1+len2-1, num_KSCALE) = time;
            s_mat4(len1:len1+len2-1, num_KSCALE) = s_mat;
            len1 = len1 + len2;
        end
    end
    result_SP{num_CV, 1} = {acc2, time2, C_mat2, acc3, time3, C_star_mat3, acc4, time4. s_mat4};
end

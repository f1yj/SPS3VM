clc;
clear;
global KTYPE KSCALE C C_star s data_flag C_end s_end
% use RBF kernel in SemiSVM.Kernel
KTYPE = 6;
result_GS = {};
data_flag = 'ijcnn1';

K_CV = 5;
num_step = 1;
num_size = 1;
step_list = [1, 0.1, 0.01];
size_data_list = [9000, 12000, 15000, 18000];
step = step_list(num_step);
size_data = size_data_list(num_size);

for num_CV = 1:K_CV
    KSCALE = 0.01;
    KSCALE_list = [];
    acc = zeros(1,10);
    time = zeros(1,10);
    para_mat = zeros(1,30);
    for num_KSCALE = 1:10
        load([data_flag, '/', data_flag, '_', num2str(size_data), '_CV_', num2str(num_CV)])
        KSCALE = KSCALE * 2;
        KSCALE_list(num_KSCALE, 1) = KSCALE;
        C = 2^-10;
        C_star = 2^-10;
        s = -1;
        C_end = 2^10;
        s_end = 0;
        len1 = 1;
        while C <= C_end
            while C_star <= C
                while s < s_end
                    fprintf("C = %.4f, C_star = %.4f, s = %.4f\n", C, C_star, s)
                    tic
                    initial_solution=initial(original_x,original_y,extended_x,extended_y);
                    Q_LnonZero = SemiSVM.Kernel(initial_solution.x, val_x);
                    pred = sign((Q_LnonZero' * initial_solution.alpha) + initial_solution.b);
                    acc(len1, num_KSCALE) = getAcc(val_y, pred);
                    time(len1, num_KSCALE) = toc;
                    para_mat(len1, (num_KSCALE-1)*3+1) = C;
                    para_mat(len1, (num_KSCALE-1)*3+2) = C_star;
                    para_mat(len1, (num_KSCALE-1)*3+3) = s;
                    len1 = len1 + 1;
                    s = s + step;
                end
                C_star = C_star + step;
            end
            C = C + step;
        end
    end
    result_GS{num_CV, 1} = {acc, time, para_mat, KSCALE_list};
end
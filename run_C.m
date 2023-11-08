function [time,error,C_mat,val_x,val_y,original_x,original_y,extended_x,extended_y,initial_solution,extended_real_y]=...
    run_C(val_x,val_y,original_x,original_y,extended_x,extended_y,extended_real_y)
    initial_solution=initial(original_x,original_y,extended_x,extended_y);
    [time, error, C_mat] = ...
        IncSemiSVM_algorithm_C.Run(val_x,val_y,original_y,extended_x,extended_y,initial_solution,extended_real_y);
end


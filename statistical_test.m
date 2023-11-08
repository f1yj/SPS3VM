function [h, p] = statistical_test(acc1, acc2)
    [h,p] = ttest2(acc1, acc2, 'Vartype', 'unequal', 'Tail', 'right', 'Alpha', 0.01);

end
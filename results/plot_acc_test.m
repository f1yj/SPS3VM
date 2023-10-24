clear
load('acc_test.mat')
datasets = {'A9a', 'Codrna' ,'Dota2', 'Ijcnn1', 'Letter', 'Mushrooms', 'Satimage', 'Usps', 'Splice', 'Svmguide3'};

set(0, 'DefaultAxesFontName', 'Times New Roman');
set(0, 'DefaultAxesFontSize', 12);
set(0, 'DefaultAxesFontWeight', 'bold');

f = figure();
set(f, 'Position', 0.6*[300   300   1600   600])

for i = 1:length(datasets)  
    cost.A(:,i) = acc_SP_test(:,i)';
    cost.B(:,i) = acc_GS_test(:,i)';
end

b_h1 = boxplotCsub(cost.A, 1,'o',1,1,[0.7, 0.13, 0.13],false,1.5,false,[1 5],1.5,0.005,false);
b_h2 = boxplotCsub(cost.B, 1,'x',1,1,[0.24, 0.35, 0.67],false,1.5,false,[2 5],1.5,0.005,false);

ylabel('Accuracy');
set(gca, 'xticklabel',datasets);
legend( [b_h1(1,4) b_h2(2,4)], {'SPS^{3}VM', 'Grid Search'}, 'Location', 'N');
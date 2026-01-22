%wyznaczanie Ku i Pu

dane1 = readtable('SCOPE\scope_2');
dane1 = dane1(4:end, :);

t  = dane1{:,1};
x1 = dane1{:,2};
x2 = dane1{:,3};

idx_przed = t < -4.5;
idx_po = t > -4;

start_x1 = mean(x1(idx_przed));
start_x2 = mean(x2(idx_przed));
ofset = start_x2-start_x1;
x1_corr = x1;
x2_corr  = x2- ofset;

start_x1 = mean(x1_corr(idx_przed));
start_x2 = mean(x2_corr(idx_przed));
end_x1 = mean(x1_corr(idx_po));
end_x2 = mean(x2_corr(idx_po));

du = end_x1 - start_x1;
x1_norm = (x1_corr-start_x1)/du;
y_norm = (x2_corr-start_x2)/du;

plot(t, x1_norm, t, y_norm);
disp(['offset = ', num2str(ofset)]);
title('Odpowiedz skokowa do odczytu parametru Ku i Pu');
xlim([-4.5 -2]);
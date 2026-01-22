%zadanie PID (1) - dobieranie nastaw zieglera nicholsa 1

dane1 = readtable('SCOPE\scope_0 (1)');
dane1 = dane1(4:end, :);

t  = dane1{:,1};
x1 = dane1{:,2};
x2 = dane1{:,3};

idx_przed = t < -8.1;
idx_po = t > -8.05;

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

figure;
plot(t, x1_norm, t, y_norm);
disp(['offset = ', num2str(ofset)]);
title('odpowiedź skokowa do uzyskania parametrów K, To i Tp');
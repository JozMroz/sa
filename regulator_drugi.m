%regulator wyznaczony na zajęciach Zieglera 2

dane1 = readtable('SCOPE\scope_3');
dane1 = dane1(4:end, :);

t  = dane1{:,1};
x1 = dane1{:,2};
x2 = dane1{:,3};

idx_skoku = find(diff(x1) > max(diff(x1))*0.5, 1, 'first');
window = 10;
level_start_x1 = mean(x1(idx_skoku-window : idx_skoku-1));
level_start_x2 = mean(x2(idx_skoku-window : idx_skoku-1));

idx_ustalone = idx_skoku + round(length(t(t > -5 & t < -3))); 
level_end_x1 = mean(x1(idx_ustalone : idx_ustalone + window));

du = level_end_x1 - level_start_x1;
x1_norm = (x1 - level_start_x1) / du;
y_norm = (x2 - level_start_x2) / du;

plot(t, x1_norm, t, y_norm);
xlim([-4 -1.5]);
title('odpowiedź skokowa układu z regulatorem dobranym podczas pomiarów');

%wyznaczone parametry obiektu
K = 1;
To = 0.08;
Tp = 0.37;
%wyznaczenie Ku i Pu i porównanie z wynikami z zajęć
Ku = 11.5;
Pu=0.29;
%liczenie zieglerem
Kp = 0.6*Ku;
Ti = 0.5*Pu;
Td = 0.125*Pu;
Ki = Kp/Ti;
Kd = Kp*Td;
%wrzucic te nastawy jako początkowe do simulinka i porównac z odpowiedzią
%na zajęciach


%stworzyć algorytm w simulinku który będzie dobierał najlepsze
%nastawy dla tych war pocztkowych













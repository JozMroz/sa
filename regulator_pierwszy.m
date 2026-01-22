%regulator wyznaczony na zajęciach zielglera-nicholsa 1


dane1 = readtable('SCOPE\scope_1 (1)');
dane1 = dane1(4:end, :);

t  = dane1{:,1};
x1 = dane1{:,2};
x2 = dane1{:,3};

idx_skoku = find(diff(x1) > max(diff(x1))*0.5, 1, 'first');
window = 10;
level_start_x1 = mean(x1(idx_skoku-window : idx_skoku-1));
level_start_x2 = mean(x2(idx_skoku-window : idx_skoku-1));

idx_ustalone = idx_skoku + round(length(t(t > -5 & t < -3))); % przykładowy zakres
level_end_x1 = mean(x1(idx_ustalone : idx_ustalone + window));

du = level_end_x1 - level_start_x1;
x1_norm = (x1 - level_start_x1) / du;
y_norm = (x2 - level_start_x2) / du;

plot(t, x1_norm, t, y_norm);
xlim([-6 -2]);
title('odpowiedź skokowa układu z regulatorem dobranym podczas pomiarów');

%obiekt wyznaczony w pliku obiekt1_offset
K = 1;
To = 0.08;
Tp = 0.37;
%wyliczenie nastaw początkowych zieglera
Kp = 1.2*Tp/(K*To);
Ti = 2*To;
Td = 0.5*To;
Ki = Kp/Ti;
Kd = Kp*Td;
%wrzucenie teraz tego do simulinka i wyświetlenie wykresu


%ustawienie tych wartosci Kp, Ti i Td jako wartosci poczatkowych algorytmu















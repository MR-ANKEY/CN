fun = @(tau) 2*exp(-tau/1e-6);
[meanDelay, rmsDelay, symbolRate, coherenceBW] = meas_continuous_PDP(fun,0,10e-6);
tau = [0:0.01e-6:5e-6];
fun1 = 2*exp(-tau/1e-6);
plot (tau, fun1, 'r', 'LineWidth', 2);
title ('Power vs Delay', 'Fontsize',20);
xlabel ('Delay', 'Fontsize',16);
ylabel('Power(dBm)', 'Fontsize',16);

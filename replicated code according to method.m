
actual_load = [26, 27, 28, 29, 30]; 
predicted_load = [25.5, 27.5, 28.5, 29.5, 30.5]; 


temperature = [25, 26, 27, 28, 29]; 
peak_demand = [14000, 15000, 16000, 17000, 18000]; 


error = actual_load - predicted_load;


figure;
subplot(3, 1, 1);
plot(actual_load, 'b', 'LineWidth', 1.5); hold on;
scatter(1:length(actual_load), actual_load, 'b', 'filled');
title('Actual Data');

subplot(3, 1, 2); 
plot(predicted_load, 'r', 'LineWidth', 1.5); hold on;
scatter(1:length(predicted_load), predicted_load, 'r', 'filled');
title('Multiparameter Regression');

subplot(3, 1, 3); 
plot(error, 'k', 'LineWidth', 1); hold on;
scatter(1:length(error), error, 'k', 'filled');
title('Error of Prediction');
xlabel('Time');
ylabel('Load (MW)');


saveas(gcf, 'combined_load_plots.png');


p = polyfit(temperature, peak_demand, 1);
demand_fit = polyval(p, temperature);


figure;
scatter(temperature, peak_demand, 'b', 'filled'); hold on; 
plot(temperature, demand_fit, 'k', 'LineWidth', 1.5); 
title('Regression between Temperature and Demand');
xlabel('Temperature (C)');
ylabel('Peak Demand (MW)');
legend('Data Points', 'Linear Fit');
grid on;


saveas(gcf, 'temperature_demand_regression.png');

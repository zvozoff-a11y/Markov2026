clc;
clear;
close all;

Q = [-1 1 0 0;
    0 -1 1 0;
    0 0 -1 1;
    1 0 0 -1];

t = linspace(0,5,1001);
y0 = [1/3; 2/3; 0; 0];

[tOde, yOde] = ode45(@(t,y) Q.'*y, t, y0);
y1_th = yOde(:,1);


Nvals = [100, 1000, 10000, 100000];

figure;

for i = 1:length(Nvals)
    N = Nvals(i);

    f = fracstate1(N, t);

    subplot(2,2,i)
    hold on;
    plot(t, y1_th); 
    plot(t, f);

    xlabel('t');
    ylabel('Fraction');
    title(['N = ', num2str(N)]);
    legend('Theory y_1(t)', 'Simulation f(t)');
    
    xlim([0 5]);
    ylim([0 0.5]);
    grid on;
end

sgtitle('Theory vs Simulation State 1 Probability');

function f = fracstate1(N, tgrid)
    
    nt = length(tgrid);
    count_state1 = zeros(1, nt);

    for n = 1:N
        if rand < 1/3
            state = 1;
        else
            state = 2;
        end
        
        t = 0;
        idx = 1;   
        
        while idx <= nt
            
            tau = exprnd(1);
            t_next = t + tau;
            
            
            while idx <= nt && tgrid(idx) < t_next
                if state == 1
                    count_state1(idx) = count_state1(idx) + 1;
                end
                idx = idx + 1;
            end
            
            
            state = mod(state,4) + 1;
            t = t_next;
        end
    end

    f = count_state1 / N;
end
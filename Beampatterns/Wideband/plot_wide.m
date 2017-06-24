%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% This function plots the wideband beampattern
% Inputs
% freq_vec   - lower and upper frequency cutoffs
% micPos     - microphone position
% doa        - direction-of-arrival
% c          - velocity of sound
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function plot_wide(freq_vec,micPos,doa,c)
 f_min = freq_vec(1);
 f_max = freq_vec(2);
 f_vec = linspace(f_min,f_max,200);
 resp = zeros(360,size(f_vec,2));
 for k = 1:length(f_vec)
     f = f_vec(k);
     stv = exp(1i*2*pi*( f/c)*(micPos(1,:)'*cosd(doa)+micPos(2,:)'*sind(doa)));
        
     a = exp(1i*2*pi*( f/c)*(micPos(1,:)'*cosd(1:360)+micPos(2,:)'*sind(1:360)));
        
     resp(:,k) = a'*stv;
 end
 resp = abs(resp./max(max(abs(resp))));
 pow = 20*log10(resp);
 figure;mesh(f_vec,1:360,pow);axis ([f_vec(1), f_vec(end), 0,360, -inf, inf])  
 ylabel('Azimuth (Degrees)','fontsize',10,'fontweight','bold');
 xlabel('Frequency (Hz)','fontsize',10,'fontweight','bold');
 zlabel('Gain (dB)','fontsize',10,'fontweight','bold');
 title('Beampattern','fontsize',10,'fontweight','bold')
end


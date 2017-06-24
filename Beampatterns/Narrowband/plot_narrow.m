%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% This function plots the narrowband beampattern
% Inputs
% freq   - frequency
% micPos - microphone position
% doa    - direction-of-arrival
% c      - velocity of sound
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function plot_narrow(freq,micPos,doa,c)
stv = exp(1i*2*pi*(freq/c)*(micPos(1,:)'*cosd(doa)+ micPos(2,:)'*sind(doa)));       
a = exp(1i*2*pi*(freq/c)*(micPos(1,:)'*cosd(1:360)+ micPos(2,:)'*sind(1:360)));       
resp = a'*stv;
resp = abs(resp./max(abs(resp)));
pow = 20*log10(resp);
figure;plot(1:360,(pow),'linewidth',2);axis ([0, 360, -inf, inf])
xlabel('Azimuth (Degrees)','fontsize',10,'fontweight','bold');
ylabel('Gain (dB)','fontsize',10,'fontweight','bold');
title('Beampattern','fontsize',10,'fontweight','bold')
end


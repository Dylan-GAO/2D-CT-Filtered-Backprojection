function [RF] = ESFanRad(beta,s,D,x,y,u,v,alpha,rho)

% equispace projection;
% This function computes the Radon transform of ellipses
% centered at (x,y) with major axis u, minor axis v,
% rotated through angle alpha, with weight rho.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%   Equally Spaced !!       %%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

RF = zeros(size(s));
gama= atan(s/D);
t= s.*cos(gama);
phi= beta+ gama- pi/2;
% theta= [cos(phi'), sin(phi')];
mu=1;
for k=1:max(size(s))
    phi_1= phi(k);
    theta_1= [cos(phi_1),sin(phi_1)];
    t_1= t(k);
    for mu = 1:max(size(x))
        a = (u(mu)*cos(phi_1-alpha(mu)))^2+(v(mu)*sin(phi_1-alpha(mu)))^2;
        test = a-(t_1-[x(mu),y(mu)]*theta_1')^2;
        ind = (test>0);
        RF(k) = RF(k)+ rho(mu)*(2*u(mu)*v(mu)*sqrt(test*ind))/a;
    end  % end mu-loop;
end   % end i-loop;

%Specify parameters of ellipses for mathematical phantom. 
% xe = vector of x-coordinates of centers 
% ye = vector of y-coordinates of centers 
% ae = vector of first half axes
% be = vector of second half axes
% alpha = vector of rotation angles (degrees)
% rho = vector of densities 
xe=[0 0 0.22 -0.22 0 0 0 -0.08 0 0.06 0.5538];
ye=[0 -0.0184 0 0 0.35 0.1 -0.1 -0.605 -0.605 -0.605 -0.3858];
ae=[0.69 0.6624 0.11 0.16 0.21 0.046 0.046 0.046 0.023 0.023 0.0333];
be=[0.92 0.874 0.31 0.41 0.25 0.046 0.046 0.023 0.023 0.046 0.206];
alpha=[0 0 -18 18 0 0 0 0 0 0 -18];
rho=  [1 -0.98 -0.02 -0.02 0.01 0.01 0.01 0.01 0.01 0.01 0.03];
%end of input section
tic
my= 128;
mx= 128;
alpha= alpha*pi/180;
roi=[-1 1 -1 1];

xrange= -1+ 2/(2*mx)+[0:mx-1]/mx *2;
yrange= 1-  2/(2*my)-[0:my-1]/my *2;
xx=ones(my,1)*xrange;
yy=yrange'*ones(1,mx);
q= 64;    % 2*q is the number of detectors;
b= 360;   % number of view angles;
D= 20000;
R= 1;
beta=[1:360]*2*pi/360;
s_max= D*R/sqrt(D*D- R*R);                     
s= [-64:63]/64 *s_max;       % Equally Spaced!
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%   Equally Spaced !!!%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% gn= zeros(1,4*q+1);
% temp=[1:2*q+1];
% temp=1./(temp.*temp);
% gn(2*q+2:2:4*q+1)= -1/(2*pi*pi)*temp(1:2:2*q);
% gn(1:2*q)=fliplr(gn(2*q+2:4*q+1));
% gn(2*q+1)=1/8;
% figure,plot(gn)
% xlim([64 193]);
rps= 1/(pi*q);
bs= [-2*q:2*q-1]/(q*rps);
gn= slkernel(bs)/(rps^2); 
update=zeros(my,mx);
recon= zeros(my,mx);
%proj= zeros(128,360);
%RF= zeros(size(s));
for vi= 1:360
    beta= vi*pi/180+ pi/2;
    RF= proj(:,vi)';        %FanRad(beta, s, D, xe, ye, ae, be, alpha, rho);
%   proj(:,v)=RF';
% end
% ma= max(max(proj));
% mi= min(min(proj));
% figure, window3(0,0.2,roi,proj);
    RF= RF.*D./sqrt(D*D + s.^2);
    c1= conv(RF, gn);
%   c2= conv(c1(2*q+1:4*q), (hamming(4*q))');
    c2=c1;
    Q= real(c2(2*q+1:4*q))/q;   Q(2*q+1)= 0;
    r= sqrt(xx.^2 + yy.^2);
    op= xx*cos(beta)+ yy*sin(beta);
    U= (D+op)/D;
    ep= (sqrt( r.^2- op.^2));
    ep=real(ep);
    index= ((xx.*sin(beta)- yy.*cos(beta))< 0);
    index= (index-1)+ index;
    ep= ep.*index;
    s_1= D./(D+op).*ep/s_max *q;   % *q is critical!
    k1= floor(s_1);
    u=s_1- k1;
    k=max(1, k1+q+1);  k= min(k, 2*q);
    update=(1-u).*Q(k)+ u.*Q(k+1);
    recon= recon+ update./(U.^2);
    
end

recon= fliplr(flipud(recon*pi/180));        % Why need flip ???
recon= recon*pi/180;
ma= max(max(recon));
mi= min(min(recon));
reconstruction_time= toc
figure, window3(-0.003,0.003,roi,recon);
title('Equally Spaced Reconstruction,excircle R =1.414');
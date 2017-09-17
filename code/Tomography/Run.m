% Demo of Convolution Backprojection

clear
close all
print_flag = 0;

% Set image size NN
N = 32;
NN = 2*N+1;

% Set number of projection angles
K = 5;
M0 = 2^K;

% Set filter length L
L = NN;

x = -N:N;
y = -N:N;

%if(print_flag==1)
  %system('touch output.ps');
%end


% Create Phantom

z = Phantom(x,y);
DisplayImg(z,x,y)
title('Phantom Image');
xlabel('x coordinate');
ylabel('y coordinate');
if(print_flag==1)
  print -dpsc tmp1
  system('mv output.ps tmp2.ps; cat tmp2.ps tmp1.ps>output.ps;');
else
  pause
end

% Forward project phantom to form sinogram

theta = (180/M0)*(0:(M0-1));
pz = Project(z,theta);
DisplayImg(pz,x,theta)
title('Sinogram or Projections of Phantom')
xlabel('Projection Displacement')
ylabel('Projection Angle (degrees)')
if(print_flag==1)
  print -dpsc tmp1
  system('mv output.ps tmp2.ps; cat tmp2.ps tmp1.ps>output.ps;');
else
  pause
end


% Compute filter for CBP

[h,n] = CBPFilter(L);
figure
plot(n,h)
title('Filter Applied to Projections')
xlabel('Sample Number')
if(print_flag==1)
  print -dpsc tmp1
  system('mv output.ps tmp2.ps; cat tmp2.ps tmp1.ps>output.ps;');
else
  pause
end

% Apply filter to each projection angle

for j=1:M0
  tmp = conv( pz(j,:),h );
  pz(j,:) = tmp(L+1:L+NN);
end
DisplayImg(pz,x,theta)
title('Filtered Sinogram or Projections')
xlabel('Projection Displacement')
ylabel('Projection Angle (degrees)')
if(print_flag==1)
  print -dpsc tmp1
  system('mv output.ps tmp2.ps; cat tmp2.ps tmp1.ps>output.ps;');
else
  pause
end


% back projecti zero angle

pz0 = pz(1,:);
theta0 = 0;
zz = BackProj(pz0,theta0);
DisplayImg(zz,x,y)
title('Back Projection of Angle 0')
xlabel('x coordinate');
ylabel('y coordinate');
if(print_flag==1)
  print -dpsc tmp1
  system('mv output.ps tmp2.ps; cat tmp2.ps tmp1.ps>output.ps;');
else
  pause
end


% Progressively add Backprojections to illustrate reconstruction

for k=1:(K-1)

  samps = 2^k;
  j = 1:round(M0/samps):M0;

  pz0 = pz(j,:);
  theta0 = theta(j);
  zz = BackProj(pz0,theta0);
  DisplayImg(zz,x,y)
  
  S = sprintf('Reconstruction using %d Backprojections',samps);
  title(S)
  xlabel('x coordinate');
  ylabel('y coordinate');
  if(print_flag==1)
    print -dpsc tmp1
    system('mv output.ps tmp2.ps; cat tmp2.ps tmp1.ps>output.ps;');
  else
    pause
  end
end


% Compute full reconstruction

zz = BackProj(pz,theta);
DisplayImg(zz,x,y)
title('Completely Reconstructed Phantom')
xlabel('x coordinate');
ylabel('y coordinate');
if(print_flag==1)
  print -dpsc tmp1
  system('mv output.ps tmp2.ps; cat tmp2.ps tmp1.ps>output.ps;');
else
  pause
end

if(print_flag==1)
  system('rm tmp1.ps tmp2.ps');
end



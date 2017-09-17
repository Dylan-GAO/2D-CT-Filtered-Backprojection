function z = BackProj(pz,theta)

[M0,N] = size(pz);
tmp = zeros(N,N);
z = tmp;

for j=1:M0
 for k=1:N
  tmp(k,:) = pz(j,:);
 end
 z = z + imrotate(tmp,theta(j),'bilin','crop');
end

z = pi*z/M0;

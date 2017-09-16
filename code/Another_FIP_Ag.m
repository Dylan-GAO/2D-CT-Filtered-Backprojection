%��phantom�������Ի�÷���ͼ��
%��randon�ɻ�ò�ͬ�Ƕȵ�һάͶӰ��
 
clear all;
P = phantom('Modified Shepp-Logan',256);
R=radon(P);
figure;imshow(R,[]);
figure;
imshow(P,[]);title('����ͼ');
 
%ֱ�ӷ�ͶӰ��
l = pow2(nextpow2(size(R,1))-1);%�ع�ͼ��Ĵ�С
P_1 = zeros(l,l);%���ڴ���ع����ͼ��
 
for i=1 : size(R,2)
    tmp = imrotate( repmat(R(:,i),1,size(R,1)),i-1,'bilinear' );
    tmp = tmp(floor(size(tmp,1)/2-l/2)+1:floor(size(tmp,1)/2+l/2),floor(size(tmp,2)/2-l/2)+1:floor(size(tmp,2)/2+l/2));
    P_1=P_1+tmp;
end
P_1=P_1/size(R,2);
P_1=rot90(P_1);
figure;imshow(P_1,[]);title('ֱ�ӷ�ͶӰ��');
 
 
%�˲���ͶӰ��
N=180;
%�˲�
H=size(R,1);
h=zeros((H*2-1),1);
for i=0:H-1
    if i==0
        h(H-i)=1/4;
    elseif rem(i,2)==0
        h(H-i)=0;
        h(H+i)=0;
    else
        h(H-i)=-1/(i*pi)^2;
        h(H+i)=-1/(i*pi)^2;
    end
end
x=zeros(H,N);
for i=1:N
    s=R(:,i);
    xx=conv(s',h');
    x(:,i)=xx(H:2*H-1);
end
 
%��ͶӰ
P_3=zeros(l,l);
for i=1:l
    for j=1:l
        for k=1:180
            theta=k/180*pi;
            t=(j-l/2-0.5)*cos(theta)+(l/2+0.5-i)*sin(theta)+(H+1)/2;
            t1=floor(t);
            t2=floor(t+1); 
            P_3(i,j)=P_3(i,j)+(t2-t)*x(t1,k)+(t-t1)*x(t2,k);
        end
    end
end
P_3=pi/N*P_3;
figure;imshow(P_3,[]);title('�˲���ͶӰ��');

%svd decomposition

clc
close all
clear all

%document vector taken from the same example
A=[1 1 1 1;1 0 0 1;0 1 0 1;0 0 1 0;0 1 0 1];

%calculating the eigen vectors and eigen values of to find the vector V
[V, D]=eig(A'*A);

%square root of eigen values to find sigma Matrix
D1=sqrt(D);

%finding U Matrix


for i=1:4
        U(:,i)=(A*V(:,i))/(D1(i,i));
        end

%taking query vector again the same example of 'training dogs'

q=[1 0 1 0 0]';

r1=(U*D1*V(:,1))'*q;
r1=r1/(norm(U*D1*V(:,1))*norm(q));

r2=(U*D1*V(:,2))'*q;
r2=r2/(norm(U*D1*V(:,2))*norm(q));

r3=(U*D1*V(:,3))'*q;
r3=r3/(norm(U*D1*V(:,3))*norm(q));

r4=(U*D1*V(:,4))'*q;
r4=r4/(norm(U*D1*V(:,4))*norm(q));


r=[r1 r2 r3 r4];


m=max(r);

for i=1:4
        if m==r(i)
                disp 'the maximum relevant document using svd decomposition is ',i
        end
  end 

%*******************************************Accuracy and error 
A=U*D1*V';
U1=chop(U,3);
D11=chop(D1,3);
V1=chop(V,3); 
A1=U1*D11*V1';

Absolerror = norm(A-A1);
Relaterror = norm (A-A1)/norm(A);

disp 'forward error'
A-A1


%QR decomposition using Given's transform(complete final)

%document vector taken directly from previous result ,(modelling information using a vector)
A=[1 1 1 1;1 0 0 1;0 1 0 1;0 0 1 0;0 1 0 1];

G12=eye(5,5);

x1=A(1,1);
x2=A(2,1);
X=[x1 x2]'; 
c=x1/norm(X);
s=x2/norm(X);

G=[c s;-s c];

for i=1:2
        for j=1:2
                G12(i,j)=G(i,j);
        end
end

A=G12*A;
%A
%*********************************************
G45=eye(5,5);

x1=A(4,2);
x2=A(5,2);
X=[x1 x2]'; 
c=x1/norm(X);
s=x2/norm(X);
G45(4,4)=c;
G45(4,5)=s;
G45(5,4)=-s;
G45(5,5)=c;


A=G45*A;
%A
%*************************************************
G34=eye(5,5);

x1=A(3,2);
x2=A(4,2);
X=[x1 x2]'; 
c=x1/norm(X);
s=x2/norm(X);
G34(3,3)=c;
G34(3,4)=s;
G34(4,3)=-s;
G34(4,4)=c;


A=G34*A;
%A
%**********************************
G23=eye(5,5);

x1=A(2,2);
x2=A(3,2);
X=[x1 x2]'; 
c=x1/norm(X);
s=x2/norm(X);
G23(2,2)=c;
G23(2,3)=s;
G23(3,2)=-s;
G23(3,3)=c;


A=G23*A;
%A
%**********************************
G451=eye(5,5);

x1=A(4,3);
x2=A(5,3);
X=[x1 x2]'; 
c=x1/norm(X);
s=x2/norm(X);
G451(4,4)=c;
G451(4,5)=s;
G451(5,4)=-s;
G451(5,5)=c;


A=G451*A;
%A
%**********************************
G341=eye(5,5);

x1=A(3,3);
x2=A(4,3);
X=[x1 x2]'; 
c=x1/norm(X);
s=x2/norm(X);
G341(3,3)=c;
G341(3,4)=s;
G341(4,3)=-s;
G341(4,4)=c;


A=G341*A;
%A
R=A;
%R
%***************************
Q=G12'*G45'*G34'*G23'*G451'*G341';
%applying the cos formula we get cos(theta)=(QA(rj))'q/norm((QA(rj)))*norm(q)
q=[1 0 1 0 0]';

r1= (Q*R(:,1))'*q;
r1=r1/(norm(Q*R(:,1))*norm(q));
r2=(Q*R(:,2))'*q;
r2=r2/(norm(Q*R(:,2))*norm(q));
r3=(Q*R(:,3))'*q;
r3=r3/(norm(Q*R(:,3))*norm(q));
r4=(Q*R(:,4))'*q;
r4=r4/(norm(Q*R(:,4))*norm(q));

r=[r1 r2 r3 r4];

m=max(r);

for i=1:4
        if m==r(i)
                disp 'the maximum relevant document using qr decomposition is' ,i
        end
  end 
%******************************************

A=Q*R;
Q1=round(Q);
R1=round(R); 
A1=Q1*R1;

Absolerror = norm(A-A1);
Relaterror = norm (A-A1)/norm(A);

disp 'forward error'
A-A1

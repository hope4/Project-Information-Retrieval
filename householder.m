%qr decomposition using householder transformation(sucessfully done)

A=[1 1 1 1;1 0 0 1;0 1 0 1;0 0 1 0;0 1 0 1];


u1=A(:,1)+norm(A(:,1))*[1 0 0 0 0]';

B=2/(u1'*u1);

H1=eye(5)-B*(u1*u1');

A1=H1*A;
A=A1;
for i=2:5
         for j=2:4
         A2(i-1,j-1)=A(i,j);
         end
end


%**********************

u2=A2(:,1)+norm(A2(:,1))*[1 0 0 0]';

B=2/(u2'*u2);

H2=eye(4)-B*(u2*u2');

A3=H2*A2;

for i=2:5
         for j=2:4
         A(i,j)=A3(i-1,j-1);
         end
end

for i=3:5
         for j=3:4
         A4(i-2,j-2)=A(i,j);
         end
end

%****************************

u2=A4(:,1)+norm(A4(:,1))*[1 0 0]';

B=2/(u2'*u2);

H3=eye(3)-B*(u2*u2');

A5=H3*A4;

for i=3:5
         for j=3:4
         A(i,j)=A5(i-2,j-2);
         end
end

A6=[A(4,4) A(5,4)]';

%****************************
u2=A6(:,1)+norm(A6(:,1))*[1 0]';

B=2/(u2'*u2);

H4=eye(2)-B*(u2*u2');

A7=H4*A6;

A(4,4)=A7(1,1);
A(5,4)=A7(2,1);

%**********************************

H22=eye(5,5);
for i=2:5
        for j=2:5
            H22(i,j)=H2(i-1,j-1);    
        end
end

%***********************************

H33=eye(5,5);
for i=3:5
        for j=3:5
            H33(i,j)=H3(i-2,j-2);    
        end
end

%*************************************
H44=eye(5,5);
for i=4:5
        for j=4:5
            H44(i,j)=H4(i-3,j-3);    
        end
end
%*********************************
Q=H1*H22*H33*H44;
R=A;

%*****************************
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
Q1=chop(Q,3);
R1=chop(R,3); 
A1=Q1*R1;

Absolerror = norm(A-A1);
Relaterror = norm (A-A1)/norm(A);

disp 'forward error'
A-A1

%QR decomposition using Gram-Schmidt process

%document vector taken directly from previous result ,(modelling information using a vector)
A=[1 1 1 1;1 0 0 1;0 1 0 1;0 0 1 0;0 1 0 1];

%computing Orthogonal matrix(Q)

%A=[a b c d]  --> Q=[q1 q2 q3 q4]

q1=A(:,1)/norm(A(:,1)) ;
q2=A(:,2)-(transpose(q1)*A(:,2)*q1);
q2=q2/norm(q2);
q3=A(:,3)-(transpose(q1)*A(:,3)*q1)-(transpose(q2)*A(:,3)*q2);
q3=q3/norm(q3);
q4=A(:,4)-(transpose(q1)*A(:,4)*q1)-(transpose(q2)*A(:,4)*q2)-(transpose(q3)*A(:,4)*q3);
q4=q4/norm(q4);

Q=[q1 q2 q3 q4];

R=[transpose(q1)*A(:,1) transpose(q1)*A(:,2) transpose(q1)*A(:,3) transpose(q1)*A(:,4) ;0 transpose(q2)*A(:,2) transpose(q2)*A(:,3) transpose(q2)*A(:,4) ;0 0 transpose(q3)*A(:,3) transpose(q3)*A(:,4) ; 0 0 0 transpose(q4)*A(:,4) ];

%taking query vector again the same example of 'training dogs'

q=[1 0 1 0 0]';

%applying the cos formula we get cos(theta)=(QA(rj))'q/norm((QA(rj)))*norm(q)

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

%uncomment the below afterwards
for i=1:4
        if m==r(i)
               disp 'the maximum relevant document using qr decomposition is' ,i
       end
  end 

%*******************************************************

%CALCULATING THE ERROR ABSOLUTE AND RELATIVE BY CHOPPING Q AND R TO 3 DECIMAL POINTS
A=Q*R;
Q1=chop(Q,3);
R1=chop(R,3); 
A1=Q1*R1;

Absolerror = norm(A-A1);
Relaterror = norm (A-A1)/norm(A);

disp 'forward error'
A-A1;

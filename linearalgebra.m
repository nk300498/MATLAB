clc;clear all;

testcase = input('Enter the test case number: ');
 switch testcase
     
      case 0
      A=input('Enter matrix A=');
      b=input('Enter matrix b=');
      case 1
      A=[5 6 70 8 2 1;5 8 9 7 91 1;1 2 5 8 9 6;8 7 30 6 9 1;8 7 3 4 6 9;5 8 9 7 9 1];
      b=[5 8 9 7 2 9]';%take any value   
     
     case 2
       A=[5 6 7 8 2 1;5 8 9 7 9 1;1 2 5 8 9 6;8 7 3 6 9 1;2 0 8 9 3 7];  
       b=[2 8 9 7 3]';% take any value 
     
     case 3
         
        A=[1 0 0 0;0 1 0 0 ;0 0 1 0;0 0 0 1 ;0 0 0 0];
        b=[5 6 7 8 0]';
         
     case 4
         A=[1 3 3 2;2 6 9 7;-1 -3 3 4];
         b=[-2 1 0]';
         
 otherwise
 error('invalid test case');
 end
 
[n,m]=size(A);
r= rank( A );
%%




%% a

R = rref( A );

%%

%%b

Z = null(A) ;
Dimension_null_space= size(Z, 2); 
Dimension_column_space = r;



%%


%%c(special solution of AX=0)
 if rank(A)<m && rank(A)<n
     x2=input('Enter free variabe x2= ');
     x4=input('Enter free variabe x4= ');
         syms x1  x3  
         X=[x1;x2;x3;x4];
         eq=A*X==0;
         solx=solve(eq);
          x1=solx.x1;
       x3=solx.x3;
      N1=[x1;x2;x3;x4];


elseif n==m
    syms x1 x2 x3 x4 x5 x6
         X=[x1;x2;x3;x4;x5;x6];
         eq=A*X==0;
         solx=solve(eq);
          x1=solx.x1;
         x2=solx.x2;
       x3=solx.x3;
       x4=solx.x4;
      x5=solx.x5;
       x6=solx.x6;
      N1=[x1;x2;x3;x4;x5;x6];
      
elseif n<m     
    x6=input('Enter free variabe x6= ');
         syms x1 x2 x3 x4 x5 
         X=[x1;x2;x3;x4;x5;x6];
         eq=A*X==0;
         solx=solve(eq);
          x1=solx.x1;
         x2=solx.x2;
       x3=solx.x3;
       x4=solx.x4;
      x5=solx.x5;
      N1=[x1;x2;x3;x4;x5;x6]; 

      
 elseif n>m
      syms x1 x2 x3 x4 
         X=[x1;x2;x3;x4];
         eq=A*X==0;
         solx=solve(eq);
          x1=solx.x1;
         x2=solx.x2;
       x3=solx.x3;
        x4=solx.x4;
      N1=[x1;x2;x3;x4] ;
 end
 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 if rank(A)<m && rank(A)<n
     Y2=input('Enter free variabe Y2= ');
     Y4=input('Enter free variabe Y4= ');
         syms Y1  Y3  
         Y=[Y1;Y2;Y3;Y4];
         eq=A*Y==0;
         solY=solve(eq);
          Y1=solY.Y1;
          Y3=solY.Y3;
          N2=[Y1;Y2;Y3;Y4];


elseif n==m
    syms Y1 Y2 Y3 Y4 Y5 Y6
         Y=[Y1;Y2;Y3;Y4;Y5;Y6];
         eq=A*Y==0;
         solY=solve(eq);
          Y1=solY.Y1;
         Y2=solY.Y2;
       Y3=solY.Y3;
       Y4=solY.Y4;
      Y5=solY.Y5;
       Y6=solY.Y6;
      N2=[Y1;Y2;Y3;Y4;Y5;Y6];
      
elseif n<m     
    Y6=input('Enter free variabe Y6= ');
         syms Y1 Y2 Y3 Y4 Y5
         Y=[Y1;Y2;Y3;Y4;Y5;Y6];
         eq=A*Y==0;
         solY=solve(eq);
          Y1=solY.Y1;
         Y2=solY.Y2;
       Y3=solY.Y3;
       Y4=solY.Y4;
      Y5=solY.Y5;
      N2=[Y1;Y2;Y3;Y4;Y5;Y6]; 

      
 elseif n>m
      syms Y1 Y2 Y3 Y4 
         Y=[Y1;Y2;Y3;Y4];
         eq=A*Y==0;
         solY=solve(eq);
          Y1=solY.Y1;
         Y2=solY.Y2;
       Y3=solY.Y3;
        Y4=solY.Y4;
      N2=[Y1;Y2;Y3;Y4] ;
 end
 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%
    
    
    %% d(Particular solution of AX=b)
    if rank(A)<m && rank(A)<n
        
   Xp=R\b;  
    
    elseif n==m
    
    Xp=R\b;
    
    elseif n<m 
    
   Xp=R\b;
        
        
   elseif n>m
  
   Xp=R\b;
    
    end
    
    %%
    %d complete solution
    
    syms c1 c2
    Xcompl=Xp+c1*N1+c2*N2;
  
    %%
    disp(R)
    disp(Dimension_null_space)
    disp(Dimension_column_space)
    disp(N1)
    disp(N2)
    disp(Xp)
    disp(Xcompl)
   
    
    
    
    
    
    
    
    



     
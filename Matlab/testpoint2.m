clear
clc
 str2=['t00.9.3.2t02.0.5.4t02.9.4.1t03.3.2.4t03.8.4.8t05.1.5.3t05.8.3.3t07.0.1.0t08.0.3.0t08.9.4.5t10.4.3.7t10.7.4.2t11.0.1.7t12.3.3.0t12.8.5.1'];
  
  
for h=1:15
    str1='D:\Program Files\MATLAB\R2010b\bin\';
    str3=str2(h*9-8:h*9)
    A=dir(strcat(str1,str3));   %将路径下的文件读入结构体A
    
B={};
C=[];
K=[];
T{h}=[];
Q=[];
R=[];
S=[];
addpath(strcat(str1,str3));

for i=1:96
    B{i}=A(i+2).name;                   %dir函数不是按文件名读入文件
B=sortnat(B);                           %这里把所有的文件名都读入B矩阵
end                                     %调用sortnat函数将文件按名称排序再次存入矩阵B

for k=1:96
a=importdata(B{k});                      %读入文件
    for j=1:50
      b=a{j};
      b=str2num(b(30:32));               %提取信号强度信息
      C(j)=b;
     end
      [Value]=tabulate(C);               %取重数
      [m,n]=max(Value(:,2));
        K(k)=Value(n,1);
    
          x=fix((k-1)/16)+1;             
          y=mod(k,16);
          if y==0
              y=16;
          end
          
          T{h}(x,y)=K(k);
          
end


end
          




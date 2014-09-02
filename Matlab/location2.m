clear
clc
B={};
  
T=importdata('C:\Users\Administrator\Desktop\test.mat');
str1=['00.000.100.200.300.400.500.600.701.001.101.201.301.401.501.601.702.002.102.202.302.402.502.602.703.003.103.203.303.403.503.603.704.004.104.204.304.404.504.604.705.005.105.205.305.405.505.605.706.006.106.206.306.406.506.606.707.007.107.207.307.407.507.607.708.008.108.208.308.408.508.608.709.009.109.209.309.409.509.609.710.010.110.210.310.410.510.610.711.011.111.211.311.411.511.611.712.012.112.212.312.412.512.612.713.013.113.213.313.413.513.613.714.014.114.214.314.414.514.614.7']
str2=['t00.9.3.2t02.0.5.4t02.9.4.1t03.3.2.4t03.8.4.8t05.1.5.3t05.8.3.3t07.0.1.0t08.0.3.0t08.9.4.5t10.4.3.7t10.7.4.2t11.0.1.7t12.3.3.0t12.8.5.1'];
P=importdata('C:\Users\Administrator\Desktop\data.mat'); 
for c=1:15
    test=T{c};
    test=reshape(test,1,96);
    C=[];
    for k=1:120
        P{k}=reshape(P{k},1,96);
        for i=1:96
           a=P{k}(1,i);
           b=test(1,i);
           C(k,i)=(a*b)/(a^2+b^2-a*b);
        end
    end
    C=sum(C');
    [L,R]=max(C);
    D(c,:)=C(1,R)-C;
%     sprintf('The testpoint is %s',str2(c*9-8:c*9))
    sprintf('The location is %s',str1(R*4-3:R*4))
    
end
    
    
       
    
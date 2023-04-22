function [A,N] = s1(x)

% s1——按行分解矩阵！！！高位拆成++-
% x——m*24的总体矩阵

m= size(x,1);
for i=1:m
    % 局部存储变量，只对13-24进行处理
    X(1,9:20)=x(i,13:24);
    X(2,10:21)=x(i,13:24);
    % 负值行单独处理和存储
    a=x(i,13:24);
    index=strcmp(a,"");
    a(not(index))="-"+a(not(index));
    N(1*(i-1)+1,:)=a; %所有负值的集合
    A(2*(i-1)+1:2*(i-1)+2,:)=X;
    clear X
end % 每一行都经过了变换

A(:,24)="";
x(:,13:24)="";
A=vertcat(x,A);
% 最终输出A-(2*m,24) N-(m,12)

% 保留原结构
A(ismissing(A))=""; % 清除missing值
% N=flip(N);
end


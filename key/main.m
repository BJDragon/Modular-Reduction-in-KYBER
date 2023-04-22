addpath("24bit情况\")
clear
for i=1:24
    ci(i)="c"+(i-1); % 待处理数据
end

% 设置循环的终止条件
X=ci; % 初始赋值
N=[]; % 初始化Negtive矩阵

while continueT(X)
    [A,N1]=s1(X);
    N=vertcat(N,N1);
    X=s2(A);
end

N=s2(N); % 负行汇总
a=vertcat(X,N); % 最后结果，未抵消正负

function [C,nextCs]=vertX(X)
% 汇总成函数
% 功能为列向量去除空值，分解相同因子，汇总
% 列向量！
% 列向量！
% 列向量！
% 列向量！
% 列向量！
% 列向量！
% 输入为列向量，输出为保留的和下阶段的列向量
A=X;
index=strcmp(A,""); % 查找空元素位置
B(:,1)=A(not(index),1); % 非空元素赋值给B
[a,~,ci]=unique(B); % a——非空值，ci——非空值所在的位置
if size(a,1)~=0 % 至少含有一个量时

    for j=1:length(a)
        n(j)=sum(ci==j); % 每一个重复值的个数
        if rem(n(j), 2) == 0 % 余数为0，元素不保留！出错了，还有类似于3个的情况
            keep(j)=0; % 第j位置的元素不保留
            nextnum(j)=n(j)/2; % 继承下去的个数
        else
            keep(j)=1; % 保留时也只会存在一个
            if n(j)>=3
                nextnum(j)=(n(j)-1)/2;
            else
                 nextnum(j)=0;
            end
        end
    end

    keep=logical(keep);
    % 那么这一列中还保留的数据为一下部分
    C=a(keep); % 保留在这一行的

    % 接下来考虑数据传递问题

    % 继承下去的元素 a与nextnum的组合
    an=a(logical(nextnum));
    nextnum=nextnum(logical(nextnum));
nextCs=[];
    if size(an,1)~=0 % 有数值要传递时
        for i=1:length(an) %传递数值的个数
            for j=1:nextnum(i) % 每个数值对应的个数
                nextCs=vertcat(nextCs,an(i));
            end
        end
    else
        nextCs="";
    end

end
if size(a,1)==0 % 没有值时传递空值
    nextCs="";
    C="";
end

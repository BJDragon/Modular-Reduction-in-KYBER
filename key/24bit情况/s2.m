function [OutC] = s2(A)
% 数据非空值上移与合并同类相
B=strings(2*size(A,1),24); % 创建足够大的空区域

nB=B;
nB(1:size(A,1),1)=A(:,1);

for i=1:size(A,2)
    [C,nextCs]=vertX(nB(:,i));
    if i==1
        B(1:length(C),i)=C; % i=1只保留，不继承
        B(:,i)=sortrows(B(:,i),-1); % 降序排列
        nB(1:length([A(:,i+1);nextCs]),i+1)=vertcat(A(:,i+1),nextCs);% 继承数据
    elseif i<size(A,2)
        B(1:length(C),i)=C; % 经过了继承与合并
        B(:,i)=sortrows(B(:,i),-1);
        nB(1:length([A(:,i+1);nextCs]),i+1)=vertcat(A(:,i+1),nextCs);% 继承数据    
    else
        % i=24,没有递进，只需要去空值降序排列即可
        B(:,i)=sortrows(nB(:,i),-1);
    end


end


%% 计算非零行的行数
for l=1:size(B,1)
    num=sum(B(l,:)=="");
    if num==size(B,2)
        break
    end
end
l=l-1; % 行数
OutC=B(1:l,:);
end


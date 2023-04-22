function t=continueT(X)
% 是否已经全部降位完成
if sum(X(1,13:24)=="")==12
    t=false;
else 
    t=true;
end
end
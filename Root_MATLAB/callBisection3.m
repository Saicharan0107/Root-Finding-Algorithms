function [xBisection,count,flag]=callBisection3(callfx,xLeft,xRight,xTol,countMax)
xL=xLeft;
xR=xRight;
count=0;
rel_error=100;
while count<countMax && rel_error>=xTol
    xmid=(xL+xR)/2;
    if callfx(xmid)==0
        break;
    end
    if callfx(xmid)*callfx(xL)>0
        xL=xmid;
    elseif callfx(xmid)*callfx(xL)<0
        xR=xmid;
    end
    count=count+1;
    xnew=(xL+xR)/2;
    rel_error=100*abs((xnew-xmid)/xnew);
end
flag=true;
if rel_error>xTol
    flag=false;
end
xBisection=(xL+xR)/2;

return
end
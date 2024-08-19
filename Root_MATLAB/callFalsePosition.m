function [xFalsePosition,flag]=callFalsePosition(callf,xLeft,xRight,xTol)

xl=xLeft;
xr=xRight;
xerror=100;
count=0;
% xFalsePosition=1;
while xerror>=xTol && count<100
    if count~=0
        xprev=xn;
    end
    xn=(xl*callf(xl)-xr*callf(xr))/(callf(xr)-callf(xl));
    if callf(xl)*callf(xn)>0
        xl=xn;
    else
        xr=xn;
    end
    if count==0
        xerror=100;
    else
        xerror=abs((xn-xprev)/xprev)*100;
    end
    xFalsePosition=xn;
    count=count+1;
end

% while xerror>=xTol && count<100
%     xprev=xFalsePosition;
%     xn=(xl*callf(xl)-xr*callf(xr))/(callf(xr)-callf(xl));
%     if callf(xl)*callf(xn)>0
%         xl=xn;
%     else
%         xr=xn;
%     end
%     if count==0
%         xerror=100;
%     else
%         xerror=abs((xn-xprev)/xprev)*100;
%     end
%     xFalsePosition=xn;
%     count=count+1;
% end
if xerror<xTol
    flag=0;
else
    flag=1;
end
return
end
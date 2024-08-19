function [xFixedPoint,flag]=callFixedPoint(callg,xGuess,xTol)

xnew=xGuess;
xprev=xGuess+1;
count=0;
while 100*abs(xnew-xprev)/xprev>=xTol && count<100
    xprev=xnew;
    xnew=callg(xprev);
    count=count+1;
end
if 100*abs(xnew-xprev)/xprev>=xTol
    flag=1;
else
    flag=0;
end
xFixedPoint=xnew;
return
end

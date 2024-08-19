function [xNewton,count,flag]=callNewton3(callfx,callf1x,xGuess,xTol,countMax)
xprev=xGuess;
count=0;
rel_error=100;
while count<countMax && rel_error>=xTol
    if callfx(xprev)==0
        break;
    end
    xnew=xprev-callfx(xprev)/callf1x(xprev);
    count=count+1;
    rel_error=100*abs((xnew-xprev)/xnew);
    xprev=xnew;
end
flag=true;
if rel_error>xTol
    flag=false;
end
xNewton=xprev;
return
end
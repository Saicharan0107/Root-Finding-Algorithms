function [xsecant,flag]=callSecant(callfx,xGuess,xDelta,xTol)

xnew=xGuess;
xprev=xGuess+1;  %to pass the first iteration just add the value to the xGuess that is greater than xTol, in this case it is 1
count=0;
while 100*abs(xnew-xprev)/xprev>=xTol && count<100
    xprev=xnew;
    xnew=xprev-callfx(xprev)/((callfx(xprev+xDelta)-callfx(xprev))/xDelta);
    count=count+1;
end
if 100*abs(xnew-xprev)/xprev>=xTol
    flag=1;
else 
    flag=0;
end
xsecant=xnew;
return
end
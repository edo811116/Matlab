%function Mode=Mode_test(change,cast)
    M=zeros(cast(I)-1,2);
    s=2;
            M(1,1)=change(1,I);
            M(1,2)=M(1,2)+1;
            M(2,1)=change(2,I);
            M(2,2)=M(2,2)+1;
    a=0;
    for i=3:cast(I)-1
        for j=1:i-1
            if M(j,1)==change(i,I)
               M(j,2)=M(j,2)+1;
               a=0;
               break;
            else
               a=1;
            end
        end 
        if a~=0
            s=s+1;
            M(s,1)=change(i,I);
            M(s,2)=M(s,2)+1;
            a=0;
        end
    end
    for i=1:s
        if M(i,2)==max(M(:,2))
            Mode=M(i,1);
        end
    end
%end

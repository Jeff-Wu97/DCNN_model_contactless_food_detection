B_final=[];
Der = [];
year = 2017;

%% 01/06 03:00 UNTIL 01/06 10:00
d = 01;
month = 06;
for h=02:10
    if (h==02)
        m=40;
        for l=m:10:50
            B_final = read_file(d, month,year,h,l,B_final);
        end
        continue;
    end
    for m = 00:10:50
        B_final = read_file(d, month,year,h,m,B_final);
        if (h==10) && (m==20)
            break;
        end
    end
end

%%
B_final37=[B_final(2:end,:)]';
var37=[]; w=60;
for u=(w+1):size(B_final37,1)
    i = u-w:u-1;
    var37 = [var37 sum(var(B_final37(i,:),[],1))];
end
k=2;
while k<=size(B_final37,1)-1
    l = B_final37(k-1,:)-2*B_final37(k,:)+B_final37(k+1,:);
    Der = [Der norm(l)];
    k = k+1;
end

save recipe37.mat B_final37 var37

%%
figure('name','Recipe 37'),
ax1= subplot(121);plot(B_final37')
xlabel(ax1,'Features');
ylabel(ax1, 'Magnitude');
title('Frequency values for each observation');
ax2 = subplot(122);plot(B_final37)
xlabel(ax2, 'Time');
ylabel(ax2, 'Magnitude');
title('Observations over time');
%suptitle('Recipe 37');

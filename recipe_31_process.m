B_final = [];
Der = [];
year = 2017;

% Recipe 31

%% 31/05 14:10 UNTIL 31/05 15:50
d = 31;
month = 05;
for h=13:16
    if (h==13)
        m = 50;
        for l = m:10:50
            B_final = read_file(d, month,year,h,l,B_final);
        end
        continue;
    end
    for m = 00:10:50
        B_final = read_file(d, month,year,h,m,B_final);
        if (h==16) && (m==10)
            break;
        end
    end
end

%% 
B_final31=[B_final(2:end,:)]';
var31=[]; w=60;
for u=(w+1):size(B_final31,1)
    i = u-w:u-1;
    var31 = [var31 sum(var(B_final31(i,:),[],1))];
end
k=2;
%Der(1,1)=mean(mean(B_final31));
while k<=size(B_final31,1)-1
    l = B_final31(k-1,:)-2*B_final31(k,:)+B_final31(k+1,:);
    Der = [Der norm(l)];
    k = k+1;
end

save recipe31.mat B_final31 var31

%%
figure,
subplot(131),plot(B_final31),title('frequency Readings');
subplot(132),plot(var31),title('variance with 2min window');
subplot(133),plot(Der),title('Der');
%suptitle('Recipe 31');

figure('name','Recipe 31'),
ax1= subplot(121);plot(B_final31')
xlabel(ax1,'Features');
ylabel(ax1, 'Magnitude');
title('Frequency values for each observation');
ax2 = subplot(122);plot(B_final31)
xlabel(ax2, 'Time');
ylabel(ax2, 'Magnitude');
title('Observations over time');
%suptitle('Recipe 31');

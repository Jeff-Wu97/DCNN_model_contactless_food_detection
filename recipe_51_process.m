clear all; clc; close all;

B_final=[];
Der = [];
year = 2017;
month=05;
% Recipe 51

%% 31/05 00:20 UNTIL 31/05 14:00

d=31;
for h=01:12
    if (flag==1)
            break;
    end
    if (h==00)
        m = 20;
        for l = m:10:50
            B_final = read_file(d, month,year,h,l,B_final);
        end
        continue;
    end
    for m = 00:10:50
        B_final = read_file(d, month,year,h,m,B_final);
        if (h==12) && (m==30)
            flag=1;
            break;
        end
    end
end
flag=0;
%% 31/05 19:40 UNTIL 01/06 02:50
d = 31;
month = 05;
for h=20:23
    for m = 00:10:50
        B_final = read_file(d, month,year,h,m,B_final);
    end
end

d = 01;
month = 06;
for h=00:03
    if (flag==1)
            break;
    end
    for m = 00:10:50
        B_final = read_file(d, month,year,h,m,B_final);
        if (h==02) && (m==40)
            flag=1;
            break;
        end
    end
end

%%
B_final51=[B_final(2:end,:)]';
var51=[]; w=60;
for u=(w+1):size(B_final51,1)
    i = u-w:u-1;
    var51 = [var51 sum(var(B_final51(i,:),[],1))];
end


k=2;
while k<=size(B_final51,1)-1
    l = B_final51(k-1,:)-2*B_final51(k,:)+B_final51(k+1,:);
    Der = [Der norm(l)];
    k = k+1;
end

save recipe51.mat B_final51 var51
flag=0;
%%
figure,
subplot(131),plot(B_final51),title('frequency Readings');
subplot(132),plot(var51),title('variance with 2min window');
subplot(133),plot(Der),title('Der');

figure('name','Recipe 51'),
ax1= subplot(121);plot(B_final51')
xlabel(ax1,'Features');
ylabel(ax1, 'Magnitude');
title('Frequency values for each observation');
ax2 = subplot(122);plot(B_final51)
xlabel(ax2, 'Time');
ylabel(ax2, 'Magnitude');
title('Observations over time');
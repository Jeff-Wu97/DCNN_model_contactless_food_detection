B_final=[];
Der = [];
year = 2017;

% Recipe 35

%% 07/06 08:00 UNTIL 07/06 17:20
d = 07;
month = 06;
for h=07:17
    if (h==07)
        m=40;
        for l=m:10:50
            B_final = read_file(d,month,year,h,l,B_final);
        end
        continue;
    end
    for m = 00:10:50
        B_final = read_file(d,month,year,h,m,B_final);
        if (h==17) && (m==40)
            break;
        end
    end
end

%% 08/06 06:50 UNTIL 08/06 14:30
d = 08;
month = 06;
for h=06:14
    if (h==06)
        m = 30;
        for l = m:10:50
            B_final = read_file(d, month,year,h,l,B_final);
        end
        continue;
    end
    for m = 00:10:50
        B_final = read_file(d, month,year,h,m,B_final);
    end
end

%% 
B_final35=[B_final(2:end,:)]';
var35=[]; w=60;
for u=(w+1):size(B_final35,1)
    i = u-w:u-1;
    var35 = [var35 sum(var(B_final35(i,:),[],1))];
end

k=2;
while k<=size(B_final35,1)-1
    l = B_final35(k-1,:)-2*B_final35(k,:)+B_final35(k+1,:);
    Der = [Der norm(l)];
    k = k+1;
end
save recipe35.mat B_final35 var35

%%
figure,
subplot(131),plot(B_final35),title('frequency Readings');
subplot(132),plot(var35),title('variance with 2min window');
subplot(133),plot(Der),title('Der');
%suptitle('Recipe 35');

figure('name','Recipe 35'),
ax1= subplot(121);plot(B_final35')
xlabel(ax1,'Features');
ylabel(ax1, 'Magnitude');
title('Frequency values for each observation');
ax2 = subplot(122);plot(B_final35)
xlabel(ax2, 'Time');
ylabel(ax2, 'Magnitude');
title('Observations over time');
%suptitle('Recipe 35');

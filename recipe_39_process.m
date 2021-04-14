clear all; clc; close all;

B_final=[];
year = 2017;

% Recipe 39

%% 01/06 10:10 UNTIL 01/06 21:30
d = 01;
month = 06;
for h=09:21
    if (h==09)
        m = 50;
        for l = m:10:50
            B_final = read_file(d, month,year,h,l,B_final);
        end
        continue;
    end
    for m = 00:10:50
        B_final = read_file(d, month,year,h,m,B_final);
    end
end

%% 05/06 04:50 UNTIL 07/06 07:50
d = 05;
month = 06;
for h=04:24
    if (h==04)
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
flag = 0;
for d=06:07
    for h=01:24
        if (flag==1)
            break;
        end
        for m = 00:10:50
            B_final = read_file(d, month,year,h,m,B_final);
            if (d==07) && (h==08) && (m==10)
                flag = 1;
                break;
            end
        end
    end
end

%%
B_final39=[B_final(2:end,:)]';
var39=[]; w=60;
for u=(w+1):size(B_final39,1)
    i = u-w:u-1;
    var39 = [var39 sum(var(B_final39(i,:),[],1))];
end

save recipe39.mat B_final39 var39
flag=0;
%%
figure,
subplot(121),plot(B_final39'),title('frequency Readings');
subplot(122),plot(var39),title('variance with 2min window');

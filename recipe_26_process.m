B_final=[];
month = 05;
year = 2017;

% Recipe 26 
%% 30/05 03:50 UNTIL 30/05 16:50
d=30;
for h=03:17
    for m = 00:10:50
        if (h==3) && (m<30)
            continue;
        end
        B_final = read_file(d, month,year,h,m,B_final);
        if (h==17) && (m==10)
            break;
        end
    end
end

%% 01/06 21:40 UNTIL 03/06 04:40
d = 01;
month = 06;
for h=21:24
    if (h==21)
        m = 20;
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
for d=02:03
    for h=01:24
        if (flag==1)
            break;
        end
        for m = 00:10:50
            B_final = read_file(d, month,year,h,m,B_final);
            if (d==03) && (h==05) && (m==00)
                flag = 1;
                break;
            end
        end
    end
end

%% 08/06 14:40 UNTIL 09/06 04:00
d = 08;
month = 06;
for h=14:24
    if (h==14)
        m = 20;
        for l = m:10:50
            B_final = read_file(d, month,year,h,l,B_final);
        end
        continue;
    end
    for m = 00:10:50
        B_final = read_file(d, month,year,h,m,B_final);
    end
end
d = 09;
for h=01:04
    for m = 00:10:50
        B_final = read_file(d, month,year,h,m,B_final);
        if (h==04) && (m==20)
            break;
        end
    end
end

%% 
B_final26=[B_final(2:end,:)]';
var26=[]; w=60;
for u=(w+1):size(B_final26,1)
    i = u-w:u-1;
    var26 = [var26 sum(var(B_final26(i,:),[],1))];
end

save recipe26.mat B_final26 var26
flag=0;
%%
figure('name','Recipe 26'),
subplot(121),plot(B_final26),title('frequency Readings');
subplot(122),plot(var26),title('variance with 2min window');
%title('Recipe 26');


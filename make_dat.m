% Reformat the .txt

% cddata = '/Users/ypailhas/TaF_Data/DiverSense/Sensor Data/2017';
% cddatawrite = '/Users/ypailhas/TaF_Data/DiverSense/Sensor Data/2017/CrestData';

clear all; clc; close all;
nom    = 'D:\All_MATLAB_Codes_ZheWu\CNNCodes\DC Data 1.txt';


% Open file
% cd(cddata)
fileID = fopen(nom,'r');

% Read the date/time of the first ping
% Reading the date
[A] = fscanf(fileID,'%s',1);
datadate = char(A);
delim    = strfind(datadate,'-');
dataday  = str2double(datadate(1:(delim(1)-1)));
datamonth= str2double(datadate((delim(1)+1):(delim(2)-1)));
datayear = str2double(datadate((delim(2)+1):(end-1)));

% Reading the time
[A]      = fscanf(fileID,'%s',1);
datatime = char(A);
delim    = strfind(datatime,':');
datahh   = str2double(datatime(1:(delim(1)-1)));
datamm   = str2double(datatime((delim(1)+1):(delim(2)-1)));
datass   = str2double(datatime((delim(2)+1):end));
WRITEnomdate = sprintf('%04.0f%02.0f%02.0f',datayear,datamonth,dataday);
WRITEnomhour = sprintf('%02.0f',datahh);
WRITEnommin = sprintf('%02.0f',datamm);
%WRITEnomfile = [WRITEnomdate '_h' WRITEnomhour '.dat'];
WRITEnomfile = [WRITEnomdate '_h' WRITEnomhour '_m' WRITEnommin '.dat'];
fclose(fileID);


% Reopen the file
fileID = fopen(nom,'r');
% cd(cddatawrite)

Nsamp = 1501; % Number of data samples
Nline = 20000000;

tmp = [];


mincounter = 0;
%tic
for mm = 1:6000000 %300 => 10 min = 600 sec %%%%%%%%increase num(300000)
    % Reading the date
    [A] = fscanf(fileID,'%s',1);
    datadate = char(A);
    delim    = strfind(datadate,'-');
    dataday  = str2double(datadate(1:(delim(1)-1)));
    datamonth= str2double(datadate((delim(1)+1):(delim(2)-1)));
    datayear = str2double(datadate((delim(2)+1):(end-1)));
    
    % Reading the time
    [A]      = fscanf(fileID,'%s',1);
    datatime = char(A);
    delim    = strfind(datatime,':');
    datahh   = str2double(datatime(1:(delim(1)-1)));
    datamm   = str2double(datatime((delim(1)+1):(delim(2)-1)));
    datass   = str2double(datatime((delim(2)+1):end));
    datapasshh = uint16(datamm*60+datass);
    
%     if (mod(datamm,10)==0)
%         display (datatime);
%     end
    % Skiping the ':' character
    [~] = fscanf(fileID,'%s',1);
    
    % Name of the reformated file associated with the data line
    nomdate = sprintf('%04.0f%02.0f%02.0f',datayear,datamonth,dataday);
    nomhour = sprintf('%02.0f',datahh);
    nommin = sprintf('%02.0f',datamm);
    %nomfile = [nomdate '_h' nomhour '.dat'];
    nomfile = [nomdate '_h' nomhour '_m' nommin '.dat'];

   if exist(nomfile,'file')
%        Skip the line
       [A] = fgetl(fileID);
   else     
        if (~strcmp(nomfile,WRITEnomfile)) && (mod(datamm,10)==0)
            if ~isempty(tmp) 
                 % Write the file
                display(['Writing file: ' WRITEnomfile]);
                fileID2 = fopen(WRITEnomfile,'w');
                fwrite(fileID2,tmp','uint16');
                fclose(fileID2);
                % Empty tmp
                tmp = [];
            end
             % Change name for next file
            WRITEnomfile = nomfile;      
        end
    end
%   Read the line
    [A] = fgetl(fileID);
    AA  = uint16(str2num(A));    %#ok<ST2NM>
    tmp =  [tmp;[datapasshh, AA(2:(Nsamp-1))]]; %#ok<AGROW>
end
%toc
fclose(fileID);

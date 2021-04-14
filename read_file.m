function B = read_file( day, month, year, hour, minute,B )
    
    nomdate = sprintf('%04.0f%02.0f%02.0f',year,month,day);
    nomhour = sprintf('%02.0f',hour);
    nommin = sprintf('%02.0f',minute);
    nomfile = [nomdate '_h' nomhour '_m' nommin '.dat'];
    if exist(nomfile,'file')
        display(['Opening File' nomfile]);
        fileID = fopen(nomfile,'r');
        B = [B fread(fileID,[1500,inf],'uint16')];
        fclose(fileID);
    else
        display(['File does not exist: ' nomfile]);
    end
end







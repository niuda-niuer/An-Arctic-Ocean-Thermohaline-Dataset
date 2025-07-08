function idx = detect_duplication(lon1,lat1,time1,lon2,lat2,time2)
idx = true(length(lon1),1);
parfor i = 1:length(lon1)
    lonn = lon1(i);
    latt = lat1(i);
    timm = time1(i);
%     del_lon = round(abs(lonn - lon2),10);
%     del_lat = round(abs(latt - lat2),10);
    del_dist = distance(latt,lonn,lat2,lon2,6371);
    del_time = round(abs(timm - time2),10)*24;
%     idx1 = find(del_lon<=0.05&del_lat<=0.05&del_time<=5);%0 is deplication
    idx1 = find(del_dist<=0.01&del_time<=5);%0 is deplication
    if ~isempty(idx1)
        idx(i) = false;
    end
end
end
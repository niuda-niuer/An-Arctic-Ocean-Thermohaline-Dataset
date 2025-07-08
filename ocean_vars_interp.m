function [temp,salt,pres] = ocean_vars_interp(salt0,temp0,pres0,target)
n = size(salt0);
len = n(1,2);
wid = length(target);
temp = nan(wid,len);
salt = nan(wid,len);
parfor i = 1:len
    s = salt0(:,i);
    t = temp0(:,i);
    p = pres0(:,i);
    salt1 = nan(wid,1);
    temp1 = nan(wid,1);
    [s1,t1,p1] = ocean_constant_pres_vars(s,t,p);
    if length(~isnan(s1))>1
        % salt(:,i) = interp1(p1,s1,target);
        salt1 = interp1(p1,s1,target);
    elseif length(~isnan(s1))==1
        [vs,idxs] = find_nearest(p1,s1,target);
        % salt(idxs,i) = vs;
        salt1(idxs) = vs;
    end
    if length(~isnan(t1))>1
        % temp(:,i) = interp1(p1,t1,target);
        temp1 = interp1(p1,t1,target);
    elseif length(~isnan(s1))==1
        [vt,idxt] = find_nearest(p1,t1,target);
        % temp(idxt,i) = vt;
        temp1(idxt) = vt;
    end
    temp(:,i) = temp1;
    salt(:,i) = salt1;
end
pres = repmat(target, 1, len);
end








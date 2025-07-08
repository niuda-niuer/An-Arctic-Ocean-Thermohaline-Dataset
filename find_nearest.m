function [v,idx] = find_nearest(v0,p,target)
ind = find(~isnan(v0),1,'first');
pp = p(ind);
v = v0(ind);
[~, idx] = min(abs(pp - target));
end
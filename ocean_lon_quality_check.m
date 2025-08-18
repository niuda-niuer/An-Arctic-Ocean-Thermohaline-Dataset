function lon_qc = ocean_lon_quality_check(lon,lon_range)
% lon_range是lon的起始范围
lon_qc = lon>lon_range(1,1)&lon<lon_range(1,2);
end
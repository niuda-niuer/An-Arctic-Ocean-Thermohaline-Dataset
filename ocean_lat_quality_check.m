function lat_qc = ocean_lat_quality_check(lat,lat_range)
% lat_range是lat的起始范围
lat_qc = lat>lat_range(1,1)&lat<lat_range(1,2);
end
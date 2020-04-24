function tc = funfc_compute_hours(dat)

logfile = '/export/mialab/users/salman/funfc/results/compute.log';

dat{end+1} = datestr(datetime('now'));

fileID = fopen(logfile,'a');
fmt = '%s,%s,%s\n';
fprintf(fileID, fmt, dat{1,:});
fclose(fileID);
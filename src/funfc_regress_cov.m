function tc = funfc_regress_cov(tc, file_name, scansToInclude)

file_name = deblank(file_name);
X = icatb_load_ascii_or_mat(file_name);
if (~exist('scansToInclude', 'var') || isempty(scansToInclude))
    scansToInclude = (1:size(X, 1));
end
scansToInclude(scansToInclude > size(X, 1)) = [];
if (isempty(scansToInclude))
    error(['Please check file numbers specified for file ', file_name]);
end
X = icatb_zscore(X);
X = X(scansToInclude, :);
if (size(X, 1) ~= size(tc, 1))
    error(['Please check the timepoints in file ', file_name]);
end
betas = pinv(X)*tc;
tc = tc - X*betas;
% funfc_nanzscore(tc) 
% same as icatb_zscore but considering nan values

function tc = funfc_nanzscore(tc)

if isvector (tc)
    tc = detrend(tc, 0) / nanstd(tc);
    return;
end

for n = 1:size(tc, 2)
    tc(:, n) = detrend(tc(:, n), 0) ./ nanstd(tc(:, n));
end



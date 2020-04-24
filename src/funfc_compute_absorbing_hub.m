function [hubs, cumulative_hubs] = func_compute_absorbing_hub(meta_state_tcs, group_)
% calculate number of hubs

hubs = [];
for k = 1:size(Tcs,3)
    [C, ia, ic] = unique(Tcs(:,:,k),'rows','stable');
    c = sort(hist(ic,1:max(ic)));
    c1 = hist(c,1:max(c));
    hubs(k,1:length(c1)) = c1;
end;
t1 = hubs ~= 0;
hubs = zeros(size(hubs,2), length(groups_));
for k = 1:size(hubs,2)
%     % total number
%     ahubs_hist(k,1) = sum(t1(find(strcmp(metas_(:,6),'HC')),k));
%     ahubs_hist(k,2) = sum(t1(find(strcmp(metas_(:,6),'BPP')),k));
%     ahubs_hist(k,3) = sum(t1(find(strcmp(metas_(:,6),'SAD')),k));
%     ahubs_hist(k,4) = sum(t1(find(strcmp(metas_(:,6),'SZP')),k));
    % normqalized by nos of subjects
    hubs(k,1) = 100*sum(t1(find(strcmp(metas_(:,6),'HC')),k))/length(find(strcmp(metas_(:,6),'HC')));
    hubs(k,2) = 100*sum(t1(find(strcmp(metas_(:,6),'BPP')),k))/length(find(strcmp(metas_(:,6),'BPP')));
    hubs(k,3) = 100*sum(t1(find(strcmp(metas_(:,6),'SAD')),k))/length(find(strcmp(metas_(:,6),'SAD')));
    hubs(k,4) = 100*sum(t1(find(strcmp(metas_(:,6),'SZP')),k))/length(find(strcmp(metas_(:,6),'SZP')));
end;

cumulative_hubs = hubs;
for j = 1:size(hubs,1)
    for k = 1:size(hubs,2)
        cumulative_hubs( find(hubs(1:j-1,k) < hubs(j,k)), k ) = hubs(j,k);
    end;
end;
    

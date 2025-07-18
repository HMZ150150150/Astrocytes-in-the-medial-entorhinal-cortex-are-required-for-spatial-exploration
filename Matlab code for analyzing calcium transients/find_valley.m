function [valley_value,valley_loc]  = find_valley(data, threshold)
% �ҹ�ֵ
% ���ڹ�ֵ����ߵ���ұߵ���ȹ�ֵ����Ϊ�ǹ�ֵ
% data:һά����
% data = data_not(k, peak_tmp{k, 1}(i) : peak_tmp{k, 1}(i + 1));
if ~exist('threshold', 'var')
    threshold = max(data);
end
valley_value = [];
valley_loc = [];
data_len = length(data);
valley_cnt = 0;
for i = 2 : data_len - 1
    if data(i) <= threshold && data(i) <= data(i - 1) && data(i) <= data(i + 1)
        valley_cnt = valley_cnt + 1;
        valley_value(valley_cnt) = data(i);
        valley_loc(valley_cnt) = i;
    end
end

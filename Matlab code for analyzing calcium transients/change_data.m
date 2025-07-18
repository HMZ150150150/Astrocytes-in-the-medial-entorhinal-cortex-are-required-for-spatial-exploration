function [synch_ca_number,not_synch_ca_number,trace_end] = change_data(times,trace_number,trace_all,synch_ca_number_init,not_synch_ca_number_init)
num = 1;    % 计数
synch_ca_number = [];
not_synch_ca_number = [];
for i = trace_number
    synch_ca_number = [synch_ca_number;synch_ca_number_init(i,num)];
    not_synch_ca_number = [not_synch_ca_number;not_synch_ca_number_init(i,num)];
    num = num+1;
end

trace_end = {};
for i = 1:times           % 变为字符串储存
    resultString = '';
        for j =1:length(trace_all{i,1})
             if j < length(trace_all{i,1})
                 resultString = [resultString , num2str(trace_all{i,1}(j)) ,','];
             else
                 resultString = [resultString , num2str(trace_all{i,1}(j)) , ''];
             end
        end
    trace_end(i,1) = cellstr(resultString);
end
end


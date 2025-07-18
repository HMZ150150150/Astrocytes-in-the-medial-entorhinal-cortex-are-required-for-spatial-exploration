%% 生成txt 
clc;
clear all;
close all;

% file_path = 'F:\神经系统工程\数据\AD和WT数据\原始数据(滤波)';   
file_path = 'Z:\Y.S.F~\新建文件夹';
[fileNames,length_folder] = find_path(1,file_path);


for j = 1:length_folder-2
    % 二级目录 WT
    fileNames_2 = fullfile([file_path , '\' , cell2mat(fileNames(j+2))]);
    [fileNames_2,length_folder_2] = find_path(2,fileNames_2);
    
    % 三极目录 txt
    for m = 1:length_folder_2-2
        fileNames_3(m) = fullfile(file_path ,fileNames(j+2),cell2mat(fileNames_2(m + 2)));
        [fileNames_txt,length_folder_3] = find_path(3,cell2mat(fileNames_3(m)));
        if length_folder_3 == 0
           fprintf('%s中%s文件夹里没有文件！',cell2mat(fileNames(j+2)),cell2mat(fileNames_2(m+2)));
        end
        save_path = cell2mat(fileNames_3(m));
        
        % 获得excel表数据
        Table_1 = [];
        Table_2 = [];
        for k = 1:length_folder_3
            data_path = cell2mat(fileNames_txt(k));
            data = readtable([save_path,'\',data_path]);
            fs = 5;
            data = table2array(data);
            
            [day,focus] = find_day_focus(data_path);
            [T1,T2] = save_data(data,fs,day, focus, [save_path,'\',data_path]);   % roi_len为第一张表的行数
            Table_1 = [Table_1;T1];
            Table_2 = [Table_2;T2];
        end
        
        % 保存数据
        writetable(Table_1, save_path+ "\1.xlsx");
        writetable(Table_2, save_path+ "\2.xlsx");
    end
end



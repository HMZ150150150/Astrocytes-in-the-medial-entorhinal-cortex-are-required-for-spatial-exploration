function [fileNames,length_folder] = find_path(id,fileFolder)


if id ==3
    dirOutput = dir(fullfile(fileFolder,'*.txt'));
else
    dirOutput = dir(fullfile(fileFolder));
end
fileNames = {dirOutput.name};
length_folder = length(fileNames);
end


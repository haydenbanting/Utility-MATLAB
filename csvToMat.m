function M = csvToMat(filename, numCols, numHeaderLines)
%-------------------------------------------------------------------------%
% This function converts data stored in a csv file into a matrix. Header
% (labels) lines at top of file are ignored and only numeric data is
% stored. 
%
% Parameters
%   filename - path to csv file [string]
%   numCols - number of columns to read from file [int]
%   numHeaderLines - number of header lines at top of file [int]
%
% Returns
%   M - matrix containing numeric data from text file [NxM]
%-------------------------------------------------------------------------%
    fileID = fopen(filename,'rt');
    format = repmat('%f ', 1, numCols);
    data = textscan(fileID, format, 'delimiter', ',', ...
                    'HeaderLines', numHeaderLines);
    for i=1:length(data)
        M(:,i) = data{i};
    end   
    fclose(fileID);
end

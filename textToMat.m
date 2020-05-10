function M = textToMat(filename, numCols, numHeaderLines)
%-------------------------------------------------------------------------%
% Author: Hayden Banting
% Version: 10 May 2020
%
% This function converts numerical data stored in a text file into a
% matrx. Header lines (data labels) are ignored. Each column should contain
% the same number of data points, file is read until first blank line.
%
% Parameters
%   filename - path to text file [string]
%   numCols - number of columns to read from file [int]
%   numHeaderLines - number of header lines at top of file [int]
%
% Outputs
%   M - matrix containing numeric data from text file [NxM]
%
% Example use for a file with six columns of data and 1 header lines
%   M = textToMat('myfile.txt', 1, 6)
%-------------------------------------------------------------------------%
    fileID = fopen(filename, 'rt');
    format = repmat('%f ', 1, numCols);
    data = textscan(fileID, format, 'HeaderLines', numHeaderLines);
    M = zeros(length(data{1}), length(data));
    for i=1:length(data)
        M(:,i) = data{i};
    end 
    fclose(fileID);
end


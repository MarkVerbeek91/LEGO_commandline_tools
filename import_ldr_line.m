function data = import_ldr_line(str)

formatSpec = '%f%f%f%f%f%f%f%f%f%f%f%f%f%f%s%[^\n\r]';

dataArray = textscan(str, formatSpec);

dataArray{15} = strtrim(dataArray{15});

data.FileType = dataArray{:, 1};
data.Colour = dataArray{:, 2};
data.pos_x = dataArray{:, 3};
data.pos_y = dataArray{:, 4};
data.pos_z = dataArray{:, 5};
data.rot1 = dataArray{:, 6};
data.rot2 = dataArray{:, 7};
data.rot3 = dataArray{:, 8};
data.rot4 = dataArray{:, 9};
data.rot5 = dataArray{:, 10};
data.rot6 = dataArray{:, 11};
data.rot7 = dataArray{:, 12};
data.rot8 = dataArray{:, 13};
data.rot9 = dataArray{:, 14};
data.name = dataArray{:, 15};
data.name = data.name{1};

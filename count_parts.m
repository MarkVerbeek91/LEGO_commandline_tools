%%
% 

file = 'Gondela.ldr';

fid = fopen(file, 'r');

tline = 'A'; 

parts_list = [];
parts_numb = [];

while ischar(tline)
  
  tline = fgetl(fid);
  if ~isempty(tline) % check end of file
    
    matches = strfind(tline(1), '1');
    if matches == 1 % do something when part line
      part = import_ldr_line(tline);

      check = strcmp(part.name, parts_list);
      
      if isempty(parts_list)
        parts_list = {part.name};
        parts_numb = 1;
      else
        if max(check) == 1
          parts_numb(check) = parts_numb(check) + 1;
        else
          parts_list = [parts_list, part.name];
          parts_numb(end+1) = 1;
        end
      end
    end   
  end
end

fclose(fid);
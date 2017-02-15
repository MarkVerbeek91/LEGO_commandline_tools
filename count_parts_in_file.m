%%
% 
function [parts_list, parts_numb] =  count_parts_in_file(parts_list, parts_numb, file)

fid = fopen(file, 'r');

if fid == -1
  return
end

tline = 'A'; 

while ischar(tline) % loop through file
  
  tline = fgetl(fid);
  if ~isempty(tline) % check end of file
    
    matches = strfind(tline(1), '1');
    if matches == 1 % do something when part line
      part = import_ldr_line(tline);

      if ~isempty(cell2mat(textscan(part.name, '%d'))) % first characteur is number, probaly lego part
      
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
      else
        
        [parts_list, parts_numb] = count_parts_in_file(parts_list, parts_numb, part.name);
        
        
      end
    end   
  end
end

fclose(fid);



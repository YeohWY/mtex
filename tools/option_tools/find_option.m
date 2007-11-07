function pos = find_option(option_list,option,type)
% find postions of the options in option_list
%
%% Input
%  option_list   - Cell Array
%  options       - String Array
%
%% Output
%  pos           - doule

found = cellfun(@(c) (ischar(c) && ...
  any(strcmpi(c,option))),option_list);
pos = find(found);

% option value required ?
if ~isempty(pos) && nargin > 2 
  
  % last option can not have an value
  if pos(end) == length(option_list), pos = pos(1:end-1);end
  
  % check type for all found options
  for p = 1:length(pos)
    if isempty(type) || any(strcmpi(class(option_list{pos(p)+1}),type))
      pos = pos(p)+1;
      return
    else
      pos(p) = 0;
    end
  end
end

% no option required
if isempty(pos), pos = 0;else pos = pos(1);end
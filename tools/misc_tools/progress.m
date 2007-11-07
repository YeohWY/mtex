function progress(i,total,comment)
% display progress

global mtex_progress;

if ~isempty(mtex_progress) && ~mtex_progress, return;end

steps = 40;

cl = repmat('\b',1,steps+2);

ind = round(i/total*steps);

str = ['[',repmat('.',1,ind),repmat(' ',1,steps-ind),']'];

if i == 0
  if nargin <= 2, comment = 'calculate: ';end
  fprintf([comment,str]);
elseif i == total
  fprintf(repmat('\b',1,steps+13));
else
  fprintf([cl,str]);
end

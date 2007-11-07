function u = cunion(s)
% disjoint union 

if isempty(s)
	u = [];
    return
else
		
	if isa(s,'double')
		u = s(1);
		
		for i=1:length(s)
			if ~any(isnull(abs(u-s(i))))
				u = [u,s(i)]; %#ok<AGROW>
			end
		end
	else
		u = s(1);
		
		for i=1:length(s)
			if ~any(isnull(norm(u-s(i))))
				u = [u,s(i)]; %#ok<AGROW>
			end
		end
	end
end

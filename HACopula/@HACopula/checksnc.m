function checksnc(obj)
%CHECKSNC - checks for the SNC in all parent-child pairs
%
%
% Copyright 2017 Jan G�recki

% check if obj.Model is a generator
if ~isgenerator(obj.Family, obj.Parameter)
    error(['HACopula.checksnc: (' obj.Family ', ' num2str(obj.Parameter) ') is not a(n allowed) generator.']);
end
% check SNC with its children
for iChild = 1:size(obj.Child,2)
    if isa(obj.Child{iChild},'HACopula')
        % if the child is a fork, check the snc
        checksncrec(obj, obj.Child{iChild});
    end
end
end
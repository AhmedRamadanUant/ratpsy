function [valueCateg typeCateg] = gk_pyControl_getCategories(event, value_rename, type_rename, verbose)
% USAGE: [valueCateg typeCateg] = gk_pyControl_getCategories(event, [value_rename], [type_rename])
%
% INFO: this function will extract the value and type categories from
% events and can additionally rename the categories for easy entering in
% data tables
%
% INPUT:
% - event        : the event returned from gk_pyControl_collapse_events
% - value_rename : a cell with new names for the value categories [opt]
% - type_rename  : a cell with new names for the type categories [opt]
% - verbose      : if true print categories
%
% OUTPUT:
% - valueCatg : the value categories in a categorical variable
% - typeCateg : the type categories in a categorical variable
%
% v1.0 GAK 4 Mar 2020
if nargin<4
    verbose=0;
end


val_tmp=categorical(event.values);
if numel(categories(val_tmp))<20
    if verbose
        fprintf('Value Orig Categories:\n');
        cellfun(@(x) fprintf('\t%s\n',x),categories(val_tmp))
    end
else
    if verbose; fprintf('Value Orig Categories > 20 (not printed)\n'); end
end
typ_tmp=categorical(event.types);
if numel(categories(typ_tmp))<20
    if verbose
        fprintf('Type Orig Categories:\n');
        cellfun(@(x) fprintf('\t%s\n',x),categories(typ_tmp))
    end
else
    if verbose; fprintf('Type Orig Categories > 20 (not printed)\n'); end
end
if nargin==1 | isempty(value_rename)
    value_rename=categories(val_tmp);
end
if nargin<3 | isempty(type_rename)
    type_rename=categories(typ_tmp);
end
valueCateg=categorical(val_tmp,categories(val_tmp),value_rename);
typeCateg=categorical(typ_tmp,categories(typ_tmp),type_rename);


return
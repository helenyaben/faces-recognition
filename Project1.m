clc; clear all;
%% Read and basic manipulation

% Read the file.txt
X = readtable('results-Alex.txt');



% Create different tables to checj¡k the concat function
Y = setLabels(X);
L = setLabels(X);


for i = 1:length(L.id)  
    if i > 150 
        L.id(i) = 123456789;
    else 
        L.id(i) = 987654321;
    end
end


% Concat two tables thay can be or not normalized but they must both be 
% the same. 
G = concatTables(Y, L);

disp('we are here')
[T, summary] = featureNorm(G);
size(T)


T = realCateg(T);
size(T)



%% Create Real categories

% Create a subset of the data set
K = T(30:90,:);

% We have to get the real categories, we have 3 different categoires 
% *SAS.JPG --> Sad category
% *HAS.JPG --> Happy Category
% *NES.JPG --> Neutral Category

s_patt = 'SAS.JPG';
h_patt = 'HAS.JPG';
n_patt = 'NES.JPG';

s_vec = contains(K.file_ext,s_patt);
h_vec = contains(K.file_ext,h_patt)*2;
n_vec = contains(K.file_ext,n_patt)*3;

Input = s_vec + h_vec + n_vec;
V = [1 2 3];
S = {'Sad', 'Happy', 'Neutral'};
StrOut = repmat({'Unknown'}, size(Input));
[tf, idx] = ismember(Input, V);
StrOut(tf) = S(idx(tf));

K.RealCat = StrOut;




%%
t = table('Real Cat');
class(t)
table  = cell2table(cell(0,1), 'VariableNames', {'Exp'});

cel = {'HAP'}
p = table(cel)

for i = 1:length(y)
    if y(i) == 1
        t  = {'HAP'};
    else
        % nothing
    end
    

end

%%








%%
% Check the unique values for the table, we don't want repeated data
[C, ~, ci] = unique(G(:, 'id'));
means = accumarray(ci, G.time, [], @mean);
stddevs = accumarray(ci, G.time, [], @std);
output = [C num2cell([means stddevs])];
output.Properties.VariableNames = {'id', 'mean', 'sigma'};


T = innerjoin(G,output);

S = T(1:10,:);

S(S.time > 5 & S.time < 0.8, :) = [];


N = T(1:10,:);
% We can use than but with the other 
C = featureNorm(N, 2, 1);


%% 
T.norm = (T.time-T.mean);
T.norm = T.norm./T.sigma;

T.norm


%mean(G.time)
% T = groupfilter(G, 'id', 'time',@(x) mean(x));



%%
addnum(2, 3, 5)


function out = addnum(mat,n, p)
if nargin < 2
  n = 3;
  p = 4;
elseif nargin < 3 
  p = 10;
else 
    % do nothing
end
out = mat+n + p;
end

            
            
            
            
function [] = plotTime(T,s)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
id = unique(T.id);
z = length(id);

% Calculate the subplot dimensions. Being M the x components and N the y.
N1 = ceil(sqrt(z));
N2 = ceil(z/N1);

% Create a figure to store the suplots 
figure()
if nargin < 2
    for i = 1:z
        subplot(N2, N1, i)
        histogram(T(T.id == id(i),:).time, 50);
        title(sprintf('User id: %.2f',id(i)));
    end
    sgtitle('Time Distribution');
elseif nargin == 2
    if strcmp(s, 'time')
        for i = 1:z
            subplot(N2, N1, i)
            histogram(T(T.id == id(i),:).time, 50);
            title(sprintf('User id: %.2f',id(i)));
        end
        sgtitle('Time Distribution');
    
    elseif strcmp(s, 'norm')
        for i = 1:z
            subplot(N2, N1, i)
            histogram(T(T.id == id(i),:).norm, 50);
            title(sprintf('User id: %.2f',id(i)));
        end
        sgtitle('Norm Time Distribution');
        
    elseif strcmp(s, 'joinTime')
        for i = 1:z
            histogram(T(T.id == id(i),:).time, 50); 
            hold all;
        end
        title('Overlaped Histogams')
        hold off;
    elseif strcmp(s, 'joinNorm')
        for i = 1:z
            histogram(T(T.id == id(i),:).norm, 50);
            hold all;
        end
        title('Overlaped Histogams')
        hold off;
    elseif strcmp(s, 'joinLog')
        for i = 1:z
            histogram(T(T.id == id(i),:).logTime, 50);
            hold all;
        end
        title('Overlaped Histogams')
        hold off;
    elseif strcmp(s, 'joinNLog')
        for i = 1:z
            histogram(T(T.id == id(i),:).logNorm, 50);
            hold all;
        end
        title('Overlaped Histogams')
        hold off;
    else
        error('Argument does not match. Select time ot norm (normalized time)')
    end

end
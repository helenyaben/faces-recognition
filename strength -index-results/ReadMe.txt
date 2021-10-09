%POOLDIST Pools different gaussian distributions into one.
%   Possible values for m, second argument:
%   mean--> Avarages the time responses for each photo, not considering the
%   fotos where we have 0 values. (DEFAULT)
%   mean2--> Avarages the time responses for each photo, considering the
%   fotos where we have 0 values. Always sum(t)/N
%   conf--> Avarages the time responses for each photo, with the conf
%   function.
%   Possible values for n, third argument:
%   norm--> Uses the normalized times of each subject. (DEFAULT)
%   logNorm --> Uses the logarithmic times of each sbject.
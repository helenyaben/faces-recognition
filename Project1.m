clc; clear all;
%% Read and basic manipulation

% Read the file.txt

% Remember to add to path the Stimulus folder.
X = readtable('results.txt');

%{
R-Happy: 140
R-Sad: 140
R-Neutral: 48
%}

%% Set labels two our data
X = setLabels(X);

%% Concat two or mora tables 
% If we have more than one table or script to check and have more data 
% G = concatTables(Y, L);

%% Feature nomralization
figure()
plotTime(X, 'join')
title('Normal times with outliers') 

% Check if it's better to apply the log to all the data or to the data with
% non-outliers.
X_nout = X;
toDelate = X_nout.time > 3 | X_nout.time < 0.2;
X_nout(toDelate, :) = [];

figure()
plotTime(X_nout, 'join')
title('Normal time without outliers')









[T, summary] = featureNorm(X);

% Check the 10 first rows
T(1:10,:)
% check the sumary
summary

%% Create Real categories
T = realCateg(T);
% check the first 10 rowz
T(end-10:end,:)

%% Plot some data
% Look ot histograms are not really histograms, we should specify that
% folowws normalization and probability as below. Not sure, in the
% normalization data we already have it normalized 
plotTime(T, 'time');
plotTime(T, 'norm');
plotTime(T, 'join');

% Plot probability density function (pdf) for skewed gaussian distribution
figure()
x = summary(1,:).id;
y = T(T.id == summary(1,:).id,:).time;
pd = fitdist(y,'Norm');
x_values = 0:0.01:7;
p = pdf(pd,x_values);
plot(x_values,p)
hold on 
histogram(T(T.id == summary(1,:).id,:).time, 'Normalization','probability')
% Not exactly the same. 

% Useful links
% https://stats.stackexchange.com/questions/435114/generating-skew-normal-distribution-in-matlab
% https://se.mathworks.com/help/stats/pearsrnd.html
% https://se.mathworks.com/help/stats/fitdist.html#btu538h-distname

% It could be easier if we have the pdf of each histogram to make a better
% mapping

%{
As we can see in the plots, the distribution tends to follow a Gaussian
normal distribution skewwes to the lefs, that¡s why we can normalize it in
the norm distribution Z = x-mu(k)/sigma(k) beeing k subindex the person id.

As each one tends to have sligthly different values of mu and sigma, and we
want a continuous strength indicator, we can map the probability densifty
functions, in that case the histograms, into a range from 0 to 1 with the
equation: 'maping equation.PNG'. so we'll have a strength indicator, from
now on Si, Si(k). for each person. Once we have Si for each one we'll
calculate the mean  sum(Si(1) to Si(k))/k.
Look out, we'll need one for the Happy and one different to Sad. Our truly
range goes from [-1,1] but as the time respone will be in the same
conficdece interval and some in a while in the same value, we need to
separate them within the two categories. 
%}
I = imread('maping equation.PNG');
figure()
imshow(I)

%% Tasks 
%{
- Try to identify the missclassifications. In each experiment we will have
missclasifications, meaning that the person doing the actual experiment
wanted to classy the image as a happy image but he/she actually hit the
wrong key. 
% With the time response.

- Identify weird pre-clasifications. If we pre-classified a Neutral image
as Sad or Happy and none of the people that have done the experiment has
actually classified that especific image as the pre-classified category it
should be better to: change the category or either throw it to the bin.

- Get rid from the images that have been discharged. When we filtered our
data, either on the normalization (because it was out of range) or in some
of the missclassification errors. The problem is that we have only a few
experiments, say 5, so if one of the images has been thown away only once
when we calculate the Si mean the value will be reduced a lot. In addition,
if a image has been discharged because of the reponse time, there is a high
probability that some of the other people has also took to many time to
categorize it, so when doing the Si mean the value will be more reduced.

- Create a function that maps the data into a Si depending on the actual
category following the maping equation. So if by chance we find a better
way to do it it's easier to change.

-PCA. 
Patch transfer is a class to vectorize an image, only have to specify the
patch dimension, in this case i think is 1x1, it should also work with that

- Verify all images have the same size (it shouldn't be a problem for the
class) 
%}
            
            
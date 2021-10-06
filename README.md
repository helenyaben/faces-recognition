# faces-recognition
Cognitive modelling project. 

Pending tasks.


1 - MAX
 Get real categories from the neutral mages on the data

2 - Alex --> Almost Done
 Make the Strength index continuous

3 - Alex --> Almost Done
Make the data normal distributed 

4 - MAX
Identify weird pre-clasifications. If we pre-classified a Neutral image as Sad or 
Happy and none of the people that have done the experiment has actually classified
that specific image as the pre-classified category it should be better to: change 
the category or either throw it to the bin.

5 - MAX
Get rid from the images that have been discharged. When we filtered us
data, either on the normalization (because it was out of range) or in some
of the misclassification errors. The problem is that we have only a few
experiments, say 5, so if one of the images has been thrown away only once
when we calculate the Si mean the value will be reduced a lot. In addition,
if an image has been discharged because of the response time, there is a high
probability that some of the other people has also taken to many times to
categorize it, so when doing the Si mean the value will be more reduced.

6 - Alex --> Done
PCA: create column vectors of each photo and put it inside a matrix 

7 - Helen
Apply PCA 

8 - Helen
forward Selection of principal PCA

9 - All
Create a linear regression 





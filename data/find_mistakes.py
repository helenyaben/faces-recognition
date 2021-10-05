import pandas as pd
import numpy as np
import os

results = pd.read_csv('results_All.csv')
results['target'] = np.where(results['file_name'].str.contains(r'HAS'), 'Happy', 'Sad')
times = results['time'].values

mean_time = np.mean(times)
std_time = np.std(times)

wrong = results[results['guess']!=results['target']]

mistakes = wrong[wrong['time']<(mean_time-(std_time))]
print(mistakes)



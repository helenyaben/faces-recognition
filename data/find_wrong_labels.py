import pandas as pd
import numpy as np
import os

results = pd.read_csv('results_All.csv')
results['target'] = np.where(results['file_name'].str.contains(r'HAS'), 'Happy', 'Sad')

wrong = results[results['guess']!=results['target']]

print(wrong['file_name'].value_counts().loc[lambda x : x>3])
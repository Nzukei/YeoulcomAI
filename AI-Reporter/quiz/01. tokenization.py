import tensorflow as tf
import pandas as pd

data = pd.read_csv('../../data/titles.csv')
titles = data['title'].values

# 데이터 전처리과정
tokenizer = tf.keras.preprocessing.text.Tokenizer()
tokenizer.fit_on_texts(titles)
word_index = tokenizer.word_index

print(word_index)
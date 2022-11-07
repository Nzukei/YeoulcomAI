import tensorflow as tf
import pandas as pd
import numpy as np

data = pd.read_csv('../../data/titles.csv')
titles = data['title'].values

tokenizer = tf.keras.preprocessing.text.Tokenizer()
tokenizer.fit_on_texts(titles)
word_count = len(tokenizer.word_index) + 1


model = tf.keras.models.Sequential([
    tf.keras.layers.Embedding(word_count, 10),
    tf.keras.layers.SimpleRNN(32),
    tf.keras.layers.Dense(5),
    tf.keras.layers.Softmax()
])

pred = model.predict([[1, 2, 3]])
print(pred)
index = np.argmax(pred[0]) # 예측 값
print(index)
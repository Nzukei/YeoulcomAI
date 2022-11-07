import tensorflow as tf
import numpy as np
import pandas as pd

data = pd.read_csv('../../data/titles.csv')
titles = data['title'].values

# 데이터 전처리과정
tokenizer = tf.keras.preprocessing.text.Tokenizer()
tokenizer.fit_on_texts(titles)

x = []
y = []
for i in range(len(titles)):
    # sequence -> 수열 / 어떤 수의 나열로 바꿔서 표현해주는 것 (문장)
    sequence = tokenizer.texts_to_sequences([titles[i]])[0]
    e = np.array(sequence)
    n = len(sequence)
    for j in range(n-1):
        x.append(sequence[:j+1])
        y.append(e[j+1])

# pad_sequences 적용
padded = tf.keras.preprocessing.sequence.pad_sequences(x)
print(padded)

to_categorical = tf.keras.utils.to_categorical(
    y, num_classes=10000, dtype='float32'
)
print(to_categorical)
# print(y)
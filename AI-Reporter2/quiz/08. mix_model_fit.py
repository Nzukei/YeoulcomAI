import tensorflow as tf
import pandas as pd
import numpy as np
import os

data = pd.read_csv('../../data/titles.csv')
titles = data['title'].values

# 데이터 전처리과정
tokenizer = tf.keras.preprocessing.text.Tokenizer()
tokenizer.fit_on_texts(titles)
word_count = len(tokenizer.word_index) + 1

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
to_categorical = tf.keras.utils.to_categorical(
    y, num_classes=word_count, dtype='float32'
)

model = tf.keras.models.Sequential([
    tf.keras.layers.Embedding(word_count, 10),
    tf.keras.layers.SimpleRNN(50),
    tf.keras.layers.Dense(word_count),
    tf.keras.layers.Softmax()
])

if not os.path.exists('../logs'):
    os.path.exists('../logs')

tensorboard = tf.keras.callbacks.TensorBoard(log_dir='../logs')

model.compile(optimizer=tf.keras.optimizers.RMSprop(learning_rate=0.1),
              loss=tf.keras.losses.categorical_crossentropy,
              metrics=['acc'])

model.fit(padded, to_categorical, epochs=1000, callbacks=[tensorboard])
model.save('../models/final_model.h5')

# pred = model.predict([[1, 2, 3]])
# print(pred)
# index = np.argmax(pred[0]) # 예측 값
# print(index)
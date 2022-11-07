import streamlit as st
import tensorflow as tf
import pandas as pd
import numpy as np

data = pd.read_csv("C:/Users/User/PycharmProjects/AI-Reporter/data/titles.csv")
titles = data['title'].values

tokenizer = tf.keras.preprocessing.text.Tokenizer()
tokenizer.fit_on_texts(titles)
word_count = len(tokenizer.word_index) + 1

selectBox_list = []
index_word = ['' for _ in range(word_count)]
for k, v in tokenizer.word_index.items():
    index_word[v] = k
    selectBox_list.append(k)

model = tf.keras.models.load_model("C:/Users/User/PycharmProjects/AI-Reporter/AI-Reporter2/models/final_model.h5")

st.title('AI Reporter')

title = st.selectbox('키워드', selectBox_list)
length = st.slider('문장 길이', 2, 30)

if title != '':
    for i in range(length):
        sequence = tokenizer.texts_to_sequences([title])[0]
        predict = model.predict([sequence])
        index = np.argmax(predict[0])
        title += ' ' + index_word[index]
    st.text(title)


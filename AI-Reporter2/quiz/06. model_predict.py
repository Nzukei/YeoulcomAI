from tensorflow.keras.models import load_model

model_Embedding = load_model('../models/embedding.h5')
model_SimpleRNN = load_model('../models/SimpleRNN.h5')
model_Dense = load_model('../models/Dense.h5')
model_Softmax = load_model('../models/Softmax.h5')

pred = model_Embedding.predict([0, 1, 2])
print('Embedding 예측 값 : ', pred)

pred = model_SimpleRNN.predict([0, 1, 2])
print('Simple RNN 예측 값 : ', pred)

pred = model_Dense.predict([0, 1, 2])
print('Dense 예측 값 : ', pred)

pred = model_Softmax.predict([0, 1, 2])
print('Softmax 예측 값 : ', pred)
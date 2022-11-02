# keras 설치
import time
import gradio as gr
import keras_cv
import matplotlib.pyplot as plt
import tensorflow as tf
from tensorflow import keras
from translate import Translator

model = keras_cv.models.StableDiffusion(img_width=512, img_height=512) # 3~5분 정도 소요

# 이미지 보여주는 부분
def plot_images(images):
  plt.figure(figsize=(20, 20))
  for i in range(len(images)):
    ax = plt.subplot(1, len(images), i + 1)
    plt.imshow(images[i])
    plt.axis("off")
    plt.tight_layout()

images = model.text_to_image("photograph of an astronaut riding a horse", batch_size=3)

plot_images(images)

translator = Translator(from_lang="ko", to_lang="en")

translation = translator.translate("펭귄이 곰한테 뽀뽀하는 모습")

print(translation)

"""## 함수화"""

def generate_images(text, n=3):
  print(text)
  translation = translator.translate(text)
  print(translation)

  images = model.text_to_image(translation, batch_size=n)

  return images

images = generate_images("펭귄이 곰한테 뽀activate 뽀하는 모습")

plot_images(images)
def inference(text):
  image = generate_images(text, 1).squeeze()
  return image

demo = gr.Interface(fn=inference, inputs="text", outputs="image")

demo.launch(debug=True)

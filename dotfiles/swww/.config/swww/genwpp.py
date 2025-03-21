from PIL import Image, ImageFilter
import os

file_path = os.path.expanduser("~/.cache/swww/eDP-1")
with open(file_path, "r") as file:
    image_path = file.read().strip()

image = Image.open(image_path)

normal_path = os.path.expanduser("~/.config/swww/normal.png")
if os.path.exists(normal_path):
    os.remove(normal_path)
image.save(normal_path)

blur_size = 15
blur_passes = 3

for _ in range(blur_passes):
    image = image.filter(ImageFilter.GaussianBlur(blur_size))

blur_path = os.path.expanduser("~/.config/swww/blur.png")
if os.path.exists(blur_path):
    os.remove(blur_path)
image.save(blur_path)

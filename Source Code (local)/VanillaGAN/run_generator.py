import numpy as np
import matplotlib.pyplot as plt
from mnist_gan import Generator, load_model, show_generated_images, MODEL_DATA_FILENAME, MODEL_DATA_ROOT





G = Generator()

load_model(G, None) # Only loads G



# Generator a single image
#z = np.random.randn(1,100) # return sample from standard normal
#generated_image = G.forward(z).reshape(28,28)

# Rescale [-1, 1] to [0, 1] for display
#img = (generated_image + 1.0) / 2.0

# Display
#plt.imshow(img, cmap='gray')
#plt.axis('off')
#plt.title("Generated Image")
#plt.show()
#plt.close() # not really needed



# Generator a collage of images
show_generated_images(G, 5,5)
import cv2
import numpy as np
from matplotlib import pyplot as plt

background_image = cv2.imread('my_photo-1.jpg',0)
turbid_img = cv2.imread('my_photo-7.jpg',0)
turbid_img_2 = cv2.imread('my_photo-8.jpg',0)
clear_img = cv2.imread('my_photo-9.jpg',0)
clear_img_2 = cv2.imread('my_photo-10.jpg',0)

#https://stackoverflow.com/questions/48482317/slice-an-image-into-tiles-using-numpy/48483743

print(np.shape(clear_img))

def blockshaped(arr, nrows, ncols):
    """
    Return an array of shape (n, nrows, ncols) where
    n * nrows * ncols = arr.size

    If arr is a 2D array, the returned array should look like n subblocks with
    each subblock preserving the "physical" layout of arr.
    """
    h, w = arr.shape
    assert h % nrows == 0, "{} rows is not evenly divisble by {}".format(h, nrows)
    assert w % ncols == 0, "{} cols is not evenly divisble by {}".format(w, ncols)
    return (arr.reshape(h//nrows, nrows, -1, ncols)
               .swapaxes(1,2)
               .reshape(-1, nrows, ncols))


chunks =  blockshaped(clear_img, 144, 160)

t = []
for j in chunks:
    i = np.fft.fft2(j)
    t.append(np.linalg.norm(i[:,0:np.shape(i)[1]//4])/np.linalg.norm(i[:,np.shape(i)[1]//4:-1]))

print(np.max(t))


chunks =  blockshaped(clear_img_2, 144, 160)

t = []
for j in chunks:
    i = np.fft.fft2(j)
    t.append(np.linalg.norm(i[:,0:np.shape(i)[1]//4])/np.linalg.norm(i[:,np.shape(i)[1]//4:-1]))

print(np.max(t))

#

t = []
chunks =  blockshaped(turbid_img, 144, 160)
for j in chunks:
    i = np.fft.fft2(j)
    t.append(np.linalg.norm(i[:,0:np.shape(i)[1]//4])/np.linalg.norm(i[:,np.shape(i)[1]//4:-1]))

print(np.max(t))

t = []
chunks =  blockshaped(turbid_img_2, 144, 160)
for j in chunks:
    i = np.fft.fft2(j)
    t.append(np.linalg.norm(i[:,0:np.shape(i)[1]//4])/np.linalg.norm(i[:,np.shape(i)[1]//4:-1]))

print(np.max(t))


plt.imshow(clear_chunks[0])
plt.figure()

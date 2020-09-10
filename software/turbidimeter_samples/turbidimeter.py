import cv2
import numpy as np
from matplotlib import pyplot as plt

background_image = cv2.imread('my_photo-1.jpg',0)
turbid_img = cv2.imread('my_photo-5.jpg',0)
turbid_img_2 = cv2.imread('my_photo-4.jpg',0)
clear_img = cv2.imread('my_photo-2.jpg',0)
clear_img_2 = cv2.imread('my_photo-3.jpg',0)

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
# plt.imshow(clear_img - background_image)

#


# clear_img = np.array(clear_img, dtype=np.float)-np.array(background_image,dtype=np.float)
# clear_img_2 = np.array(clear_img_2, dtype=np.float)-np.array(background_image,dtype=np.float)
#

#
# turbid_img = np.array(turbid_img, dtype=np.float)-np.array(background_image,dtype=np.float)
# plt.imshow(turbid_img)
# plt.figure()
#
# turbid_img_2 = np.array(turbid_img_2, dtype=np.float)-np.array(background_image,dtype=np.float)

# idx = abs(clear_img[:,:]) < 100
# clear_img[idx] = 0
#
# idx = abs(clear_img_2[:,:]) < 100
# clear_img_2[idx] = 0
#
# idx = abs(turbid_img[:,:]) < 100
# turbid_img[idx] = 0
#
# idx = abs(turbid_img_2[:,:]) < 100
# turbid_img_2[idx] = 0



# print(np.max(clear_img))
# print(np.max(turbid_img))
#



#


bk_f = np.fft.fft2(background_image[:,:])[:,0]

# plt.imshow(clear_img)
# plt.figure()
#
# plt.imshow(turbid_img)
# plt.figure()

# turb_f = np.fft.fft2(turbid_img)
# turb_f_2 = np.fft.fft2(turbid_img_2)
# clear_f = np.fft.fft2(clear_img)
# clear_f_2 = np.fft.fft2(clear_img_2)

# idx = abs(turbid_img-background_image) < 50
# turbid_img[idx] = 0
# plt.imshow(turbid_img)
#
# print((np.linalg.norm(turb_f[:,0:np.shape(turb_f)[1]//4])/np.linalg.norm(turb_f[:,np.shape(turb_f)[1]//4:-1]))*(np.linalg.norm(turbid_img)))
# print((np.linalg.norm(turb_f_2[:,0:np.shape(turb_f_2)[1]//4])/np.linalg.norm(turb_f_2[:,np.shape(turb_f_2)[1]//4:-1])) * np.linalg.norm(turbid_img_2))
# print((np.linalg.norm(clear_f[:,0:np.shape(clear_f)[1]//4])/np.linalg.norm(clear_f[:,np.shape(clear_f)[1]//4:-1]))*(np.linalg.norm(clear_img)))
# print((np.linalg.norm(clear_f_2[:,0:np.shape(clear_f_2)[1]//4])/np.linalg.norm(clear_f_2[:,np.shape(clear_f_2)[1]//4:-1]))*np.linalg.norm(clear_img_2))

# abs_diff[np.where(abs_diff < 100)] = 0



# print(np.max(abs(turbid_img - background_image)))
# print(np.max(abs(turbid_img_2 - background_image)))
# print(np.max(abs(clear_img - background_image)))
# print(np.max(abs(clear_img - background_image)))
# plt.plot(turb_f-bk_f)
# plt.plot(clear_f-bk_f)

# plt.img()

# plt.figure()
# plt.imshow(abs_diff_clear)

# print(np.linalg.norm(abs_diff_turbid))
# print(np.linalg.norm(abs_diff_clear))

# img = cv2.imread('my_photo-1.jpg',0)
#
# bkgrnd = np.fft.fft(img[100,0:50])
# # fshift = np.fft.fftshift(f)
# # fshift = f
# # magnitude_spectrum = 20*np.log(np.abs(fshift))
# a = []
# for x, row in enumerate(img[::int(np.shape(img)[1]/50),:]):
#     for y in
#         f = np.fft.fft(row)
#         a.append(np.linalg.norm(f - bkgrnd))
#
# plt.plot(a)
plt.show()



plt.subplot(121),plt.imshow(img, cmap = 'gray')
plt.title('Input Image'), plt.xticks([]), plt.yticks([])
# plt.subplot(122),plt.imshow(magnitude_spectrum, cmap = 'gray')
plt.figure()
# for row in :
# plt.plot(magnitude_spectrum[0])
# plt.plot(magnitude_spectrum[:][270])

plt.title('Magnitude Spectrum'), plt.xticks([]), plt.yticks([])
plt.show()

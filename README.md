# k-means Hyperspectral Image Denoising

This slightly modified k-means algorithm was written in Matlab as part of my thesis:
["Denoising Hyperspectral Images by using Clustering Techniques with Point Representatives"](https://pergamos.lib.uoa.gr/uoa/dl/object/2925879). 

# Abstract

With the term “remote sensing” we mean the collection of information for an object without having physical contact with it. Today, the term is referred mainly to the use of sensors suitable for satellites and aircrafts, in order to select information from objects that lie on the surface of the earth. In this vein, hyperspectral remote sensing is the process during which the reflected electromagnetic radiance from the Earth is selected through suitable hyperspectral sensors, aiming at the study of the Earth’s surface and its characteristics. However, since the received radiance is corrupted due to noise phenomena (due to atmospheric phenomena and device noise), the quality of the received information is degraded. This gives rise to the need for developing techniques suitable for image denoising. Classic denoising methods, that attempt to remove the noise from each spectral band separately, were less effective, since they ignore the high spectral correlation between consecutive bands in hyperspectral images. That being said, the development of techniques that take advantage of this information is necessary.

To deal with the above, the approach followed in the frame of this thesis, is based on the use of clustering algorithms with point representatives. More specifically, we apply clustering algorithms (such as the k-means) on the pixels of a hyperspectral image, aiming at obtaining a large number of clusters, each one constituted by only a small number of pixels. In the sequel, considering the members of a cluster as noisy versions of a pixel (the cluster representative), we substituted all the pixels of the image that lie in the above cluster, by the associated cluster representative.

Experimentally, we worked as follows: we chose hyperspectral images with various characteristics and added white Gaussian noise to them. Then, we applied the clustering algorithms and, by using the resulting point representatives, we attempted to reconstruct the original hyperspectral images. Finally, we compared the results of our method with two other denoising algorithms that were used as a benchmark.

The study highlighted the suitability of our proposed method, specifically when the clustering algorithm k-means is used, as a denoising technique of hyperspectral images. Particularly, the yielded results were nearly as good as the results provided by our best benchmark technique, the AIRLS algorithm, both in SNR gain and execution time.


![alt text](https://github.com/konkall/k-means_denoising/blob/main/images/snr_in_out.png =250x250)



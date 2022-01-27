# MRCS
Multi Radii Circular Signature (MRCS) - A novel feature descriptor for object classification

The feature drescriptor is used for object classification. Input is binary image. Different radii circular signatures are considered for each input image.This drescriptor calculates number of peaks (transitions from binary 0 to 1) for each signatures. Binning is done for each signatures and this function also calculates number of occuurence of 1's for each bins.
 function [f,u]=mrcs(img,n,M)
 Input: Binary image 
 Output: Feature combination 
 where 
 n=Number of circular signatures 
 M=Number of partitions considered for each circular signatures
 f=Number of occurrence of 1's in each partitions 
 u=Peak counts for each circular signatures
 

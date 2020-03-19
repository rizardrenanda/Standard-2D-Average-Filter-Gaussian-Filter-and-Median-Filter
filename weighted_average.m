function filtered = weighted_average(image,kernel_size)
%Input: image file name and kernel size
%Output: Filtered Image using Average filter with weighted and normalized
%weights

%Read the image matrix from a grayscale input
I=imread(image);
%Read the image matrix from a RGB input
%I=rgb2gray(imread(image));

[m n]=size(I);
%Determine the padding size
pad_size=floor(kernel_size/2);
%Initialize the prior image with zero padding
pad_input=zeros([(m+(2*pad_size)) (n+(2*pad_size))]);
p=(pad_size+1):(pad_size+m);
q=(pad_size+1):(pad_size+n);
pad_input(p,q)=I;

%Initialize the kernel matrix
kernel=weighted_kernel(kernel_size);

%initialize summa
summa=0;

%initialize post image
post_image=zeros([(m+(2*pad_size)) (n+(2*pad_size))]);

%Filter the prior image
for i=(pad_size+1):(pad_size+m)
   for j=(pad_size+1):(pad_size+n)
      for k=1:kernel_size
         for l=1:kernel_size 
            summa=summa+kernel(k,l)*pad_input(i-1-pad_size+k,j-1-pad_size+l);
         end
      end
      %Assign the summation result to the post filtered image
      post_image(i,j)=ceil(summa);
      %reinitialize summa for the next summation
      summa=0;
   end
end

%Show the filtered image
filtered=post_image(p,q);
imshow(filtered,[0 255]);
title('Image Filtered with Weighted Average Filter');
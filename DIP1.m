%% Arithmetic Operations
figure(1)
I = imread("Img.jpg");
J= imread("img2.jpg");
% Reizing image so that it has same values.
J1 = imresize(J , [194 259]);
whos I
whos J
whos J1
subplot(2,1,1)
imshow(I)
title("Original Image 1",'r')
subplot(2,1,2)
imshow(J1)
title("original Image 2",'b')
figure(2)
% adding the a constant to the first image
subplot(2,2,1)
imshow(imadd(I,100))
title("Image 1->added constant value")
subplot(2,2,2)
imshow(imadd(I,J1))
title("Image 1->added with image 2")
subplot(2,2,3)
imshow(imsubtract(I,100))
title("Image 1->substracted constant value")
subplot(2,2,4)
imshow(imsubtract(I,J1))
title("Image 1->substracted with image 2")
figure(3)
subplot(2,2,1)
imshow(immultiply(I,5))
title("Image 1->multiplied constant value")
subplot(2,2,2)
imshow(I.*J1)
title("Image 1->multiplied with image 2")
subplot(2,2,3)
imshow(imdivide(I,5))
title("Image 1->divided constant value")
subplot(2,2,4)
imshow(I./J1)
title("Image 1->divided with image 2")




%% histogram Eqaulization
figure(4)
subplot(2,2,1)
imhist(I)
title('Original histogram -> Image1')
subplot(2,2,2)
imshow(I)
title('Original image')
I2=histeq(I);
subplot(2,2,4)
imshow(I2)
title('Equalized image')
subplot(2,2,3)
imhist(I2)
title('Equalized histogram -> Image1')
figure(5)
subplot(2,2,1)
imhist(J1)
title('Original histogram -> Image2')
subplot(2,2,2)
imshow(J1)
title('Original image')
J11=histeq(J1);
subplot(2,2,4)
imshow(J11)
title('Equalized image')
subplot(2,2,3)
imhist(J11)
title('Equalized histogram -> Image1')

%% RGB To Greyscale
figure(6)
I2G = rgb2gray(I2);
subplot(2,2,1)
imshow(I2)
title('Original image 1')
subplot(2,2,2)
imshow(I2G)
title('Greyscale Image 1')
J2G = rgb2gray(J11);
subplot(2,2,3)
imshow(J11)
title('Original image 2')
subplot(2,2,4)
imshow(J2G)
title('Greyscale Image 2')

%% Gamma Correction
figure(7)


subplot(3,2,1)
imshow(imadjust(I2,[],[],5)); 
title('For Higher Gamma Value Img-1');
subplot(3,2,2)
imshow(imadjust(J11,[],[],5)); 
title('For Higher Gamma Value Img-2');
subplot(3,2,3)
imshow(I2);
title('Original Image-1')
subplot(3,2,4)
imshow(J11);
title('Original Image-2')
subplot(3,2,5)
imshow(imadjust(I2,[],[],0.5)); 
title('For Lower Gamma Value Img-1');
subplot(3,2,6)
imshow(imadjust(J11,[],[],0.5)); 
title('For Lower Gamma Value Img-2');

%% Image negative
figure(8)
subplot(2,2,1)
imshow(I2)
title('original Image1')
subplot(2,2,2)
imshow(imcomplement(I2))
title('Image 1-> Negative')
subplot(2,2,3)
imshow(J11)
title('original Image2')
subplot(2,2,4)
imshow(imcomplement(J11))
title('Image 2-> Negative')
%% Image Cropping
figure(9)
subplot(2,1,1)
Ic1 = imcrop(I2,[75 68 130 112]);
imshow(Ic1)
title('cropped image-1')
subplot(2,1,2)
Jc1 = imcrop(J11,[75 68 130 112]);
imshow(Jc1)
title('cropped image-2')

%% image interpolate image 1
figure(10)
orange = [255 127 0]';
a = 0.45;
T = maketform('affine', [1 0 0; a 1 0; 0 0 1] );
R = makeresampler({'cubic','nearest'},'fill');
B = imtransform(I2,T,R,'FillValues',orange);
T1 = maketform('affine', [1 a 0; 0 1 0; 0 0 1] );
R1 = makeresampler({'cubic','nearest'},'fill');
B1 = imtransform(I2,T1,R1,'FillValues',orange);
subplot(3,2,1)
I22 = imresize(I2,2,"nearest");
imshow(I22)
whos I22
title('Resize Image-1')
subplot(3,2,2)
imshow(imrotate(I2,45,"nearest"))
title('Rotate Image-1')
subplot(3,2,3)
imshow(fliplr(I2))
title('Flip vertical Image-1')
subplot(3,2,4)
imshow(flipud(I2))
title('Flip Horizontal Image-1')
subplot(3,2,5)
imshow(B);
title('Horizontal Shear')
subplot(3,2,6)
imshow(B1);
title('Vertical Shear')

figure(11)

orange = [255 127 0]';
a2 = 0.45;
T2 = maketform('affine', [1 0 0; a2 1 0; 0 0 1] );
R2 = makeresampler({'cubic','nearest'},'fill');
B2 = imtransform(J11,T2,R2,'FillValues',orange);
T3 = maketform('affine', [1 a2 0; 0 1 0; 0 0 1] );
R3 = makeresampler({'cubic','nearest'},'fill');
B3 = imtransform(J11,T3,R3,'FillValues',orange);
subplot(3,2,1)
J12 = imresize(J11,2,"nearest");
imshow(J12)
whos J12
title('Resize Image-2')
subplot(3,2,2)
imshow(imrotate(J11,45,"nearest"))
title('Rotate Image-2')
subplot(3,2,3)
imshow(fliplr(J11))
title('Flip Vertical Image-2')
subplot(3,2,4)
imshow(flipud(J11))
title('Flip Horizontal Image-2')
subplot(3,2,5)
imshow(B2);
title('Horizontal Shear Image-2')
subplot(3,2,6)
imshow(B3);
title('Vertical Shear Image-2')













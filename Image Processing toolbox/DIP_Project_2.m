function varargout = DIP_Project_2(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, 'gui_Singleton',  gui_Singleton, 'gui_OpeningFcn', @DIP_Project_2_OpeningFcn, 'gui_OutputFcn',  @DIP_Project_2_OutputFcn, 'gui_LayoutFcn',  [] , 'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before DIP_Project_2 is made visible.
function DIP_Project_2_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% --- Outputs from this function are returned to the command line.
function varargout = DIP_Project_2_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;


% --- Executes on button press in laplacian.
function laplacian_Callback(hObject, eventdata, handles)
global im im2
im2=sharpen(im2);
axes(handles.axes2);
imshow(im2);

% --- Executes on button press in Unsharpmask.
function Unsharpmask_Callback(hObject, eventdata, handles)
global im im2
im2=unsharp_mask(im2);
axes(handles.axes2);
imshow(im2);
% --- Executes on button press in averagefilter.
function averagefilter_Callback(hObject, eventdata, handles)
global im im2
im2=average_filter(im2);
axes(handles.axes2);
imshow(im2);


% --- Executes on button press in gaussianfilter.
function gaussianfilter_Callback(hObject, eventdata, handles)
global im im2
im2=gauss_filter(im2);
axes(handles.axes2);
imshow(im2);

% --- Executes on button press in canny.
function canny_Callback(hObject, eventdata, handles)
global im im2
im2=canny_edge(im2);
axes(handles.axes2);
imshow(im2);

% --- Executes on button press in laplacianofgaussian.
function laplacianofgaussian_Callback(hObject, eventdata, handles)
global im im2
im2=LOG_edge(im2);
axes(handles.axes2);
imshow(im2);

% --- Executes on button press in robert.
function robert_Callback(hObject, eventdata, handles)
global im im2
im2=robert_edge(im2);
axes(handles.axes2);
imshow(im2);

% --- Executes on button press in Sobel.
function Sobel_Callback(hObject, eventdata, handles)
global im im2
im2=sobel_edge(im2);
axes(handles.axes2);
imshow(im2);
% --- Executes on button press in prewitt.
function prewitt_Callback(hObject, eventdata, handles)
global im im2
im2=prewitt_edge(im2);
axes(handles.axes2);
imshow(im2);

% --- Executes on button press in zerocross.
function zerocross_Callback(hObject, eventdata, handles)
global im im2
im2=zerocross_edge(im2);
axes(handles.axes2);
imshow(im2);

% --- Executes on button press in geometricmean.
function geometricmean_Callback(hObject, eventdata, handles)
global im im2
im2=geo_mean(im2);
axes(handles.axes2);
imshow(im2);

% --- Executes on button press in contraharmonicmean.
function contraharmonicmean_Callback(hObject, eventdata, handles)
global im im2
im2=contra_mean(im2);
axes(handles.axes2);
imshow(im2);
% --- Executes on button press in Arithmeticmean.
function Arithmeticmean_Callback(hObject, eventdata, handles)
global im im2
im2=average_filter(im2);
axes(handles.axes2);
imshow(im2);

% --- Executes on button press in adaptivemedianfilter.
function adaptivemedianfilter_Callback(hObject, eventdata, handles)
global im im2
im2=adaptive_median(im2);
axes(handles.axes2);
imshow(im2);

% --- Executes on button press in adaptivemeanfilter.
function adaptivemeanfilter_Callback(hObject, eventdata, handles)
global im im2
im2=adaptive_mean(im2);
axes(handles.axes2);
imshow(im2);

% --- Executes on button press in medianfilter.
function medianfilter_Callback(hObject, eventdata, handles)
global im im2
im2=median_filter(im2);
axes(handles.axes2);
imshow(im2);

% --- Executes on button press in maximumfilter.
function maximumfilter_Callback(hObject, eventdata, handles)
global im im2
im2=maximum_filter(im2);
axes(handles.axes2)
imshow(im2)
% --- Executes on button press in Minimumfilter.
function Minimumfilter_Callback(hObject, eventdata, handles)
global im im2
 im2=minimum_filter(im2);
 axes(handles.axes2)
 imshow(im2)
% --- Executes on button press in Midpointfilter.
function Midpointfilter_Callback(hObject, eventdata, handles)
global im im2
im2=midpoint(im2);
axes(handles.axes2)
imshow(im2)
% --- Executes on button press in Alphatrimfilter.
function Alphatrimfilter_Callback(hObject, eventdata, handles)
global im im2
im2=alpha_trim(im2);
axes(handles.axes2)
imshow(im2)
% --- Executes on button press in Save.
function Save_Callback(hObject, eventdata, handles)
global im im2

im=im2;
axes(handles.axes1)
imshow(im2)

% --- Executes on button press in SaveAs.
function SaveAs_Callback(hObject, eventdata, handles)
% global im im2
% [filename, pathname]=uiputfile({'*.jpg;*.tif;*.png;*.gif','All Image Files';'*.*','All Files' },'Save Image','C:\Users\Ahsan\Documents\MATLAB\Project\newfile.jpg');
% imwrite(im2,filename);
% im=im2;
% axes(handles.axes1)
% imshow(im2)
imsave(handles.axes2)
% --- Executes on button press in Reset.
function Reset_Callback(hObject, eventdata, handles)
global im im2
axes(handles.axes2);
imshow(im)
im2=im;


% --- Executes on button press in rgbtogray.
function rgbtogray_Callback(hObject, eventdata, handles)
global im im2
im2=rgb2gray(im2);
axes(handles.axes2);
imshow(im2)


% --- Executes on button press in Load.
function Load_Callback(hObject, eventdata, handles)
global im im2
[path,user_cance]=imgetfile();
if user_cance
    msgbox(sprintf('Error'),'Error','Error');
    return
end
im=imread(path);
axes(handles.axes1);
imshow(im)
im2=im;


% --- Executes on button press in Histogramequalization.
function Histogramequalization_Callback(hObject, eventdata, handles)
global im im2
im2=Histogram_Equalize(im2);
axes(handles.axes2);
imshow(im2);



function X1_Callback(hObject, eventdata, handles)
global X1
X1=str2num(get(hObject,'String'));


% --- Executes during object creation, after setting all properties.
function X1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Y1_Callback(hObject, eventdata, handles)
global Y1
Y1=str2num(get(hObject,'String'));


% --- Executes during object creation, after setting all properties.
function Y1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function X2_Callback(hObject, eventdata, handles)
global X2
X2=str2num(get(hObject,'String'));


% --- Executes during object creation, after setting all properties.
function X2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Y2_Callback(hObject, eventdata, handles)
global Y2
Y2=str2num(get(hObject,'String'));


% --- Executes during object creation, after setting all properties.
function Y2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in CropOkay.
function CropOkay_Callback(hObject, eventdata, handles)
global X1 Y1 X2 Y2 im im2
im2=imcrop(im2,[X1 Y1 X2 Y2]);
axes(handles.axes2);
imshow(im2);


% --- Executes on slider movement.
function Brightness_Callback(hObject, eventdata, handles)
global im im2
val=.5*get(hObject,'Value');
im2=im2+val;
axes(handles.axes2);
imshow(im2);


% --- Executes during object creation, after setting all properties.
function Brightness_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in resize.
function resize_Callback(hObject, eventdata, handles)
global im2 im
im2=resizeimage(im2);
axes(handles.axes2);
imshow(im2);


% --- Executes on button press in Dilation.
function Dilation_Callback(hObject, eventdata, handles)
global im2 im
im2=image_dilate(im2);
axes(handles.axes2);
imshow(im2);

% --- Executes on button press in Erosion.
function Erosion_Callback(hObject, eventdata, handles)
global im2 im
im2=image_erode(im2);
axes(handles.axes2);
imshow(im2);


% --- Executes on button press in Im2Binary.
function Im2Binary_Callback(hObject, eventdata, handles)
global im2 im
im2=im2double(im2);
 level=graythresh(im2);
% im2=im2bw(im2,level);

 im2=my_im2bw(im2,level);
axes(handles.axes2);
imshow(im2);


% --- Executes on button press in saltandpepper.
function saltandpepper_Callback(hObject, eventdata, handles)
global im2 im
im2=imnoise(im2,'salt & pepper');
axes(handles.axes2);
imshow(im2);


% --- Executes on button press in GaussianNoise.
function GaussianNoise_Callback(hObject, eventdata, handles)
global im2 im
im2=imnoise(im2,'gaussian');
axes(handles.axes2);
imshow(im2);


% --- Executes on button press in ImageOpening.
function ImageOpening_Callback(hObject, eventdata, handles)
global im2 im
im2=image_opening(im2);
axes(handles.axes2);
imshow(im2);


% --- Executes on button press in ImageClosing.
function ImageClosing_Callback(hObject, eventdata, handles)
global im2 im
im2=image_closing(im2);
axes(handles.axes2);
imshow(im2);


% --- Executes on button press in morphogradient.
function morphogradient_Callback(hObject, eventdata, handles)
global im2 im
im2=morphological_gradient(im2);
axes(handles.axes2);
imshow(im2);


% --- Executes on button press in hitmiss.
function hitmiss_Callback(hObject, eventdata, handles)
global im2
im2=hitmiss(im2);
axes(handles.axes2);
imshow(im2);


% --- Executes on button press in WeinerFilter.
function WeinerFilter_Callback(hObject, eventdata, handles)
global im im2
im2=WienerFilter(im2,im);
axes(handles.axes2);
imshow(im2);


% --- Executes on button press in Addnoiseweiner.
function Addnoiseweiner_Callback(hObject, eventdata, handles)
global im2
im2=addnoiseweiner(im2);
axes(handles.axes2);
imshow(im2);


% --- Executes on button press in LabelImage.
function LabelImage_Callback(hObject, eventdata, handles)
global im2
im2=bwlabel(im2,4);
im2=label2rgb(im2);%,'jet','w','shuffle');
axes(handles.axes2);
imshow(im2);


% --- Executes on button press in Fouriermag.
function Fouriermag_Callback(hObject, eventdata, handles)
global im2
im2=fftshift(log(abs(fft2(im2))));
im2=im2double(mat2gray(im2));
axes(handles.axes2);
imshow(im2);


% --- Executes on button press in fourierangle.
function fourierangle_Callback(hObject, eventdata, handles)
global im2
im2=im2double(im2);
im2=fftshift(angle(fft2(im2)));
im2=im2double(mat2gray(im2));
axes(handles.axes2);
imshow(im2);


% --- Executes on button press in convexhull.
function convexhull_Callback(hObject, eventdata, handles)
global im2
im2=convexhull(im2);
axes(handles.axes2);
imshow(im2);


% --- Executes on button press in Skeleton.
function Skeleton_Callback(hObject, eventdata, handles)
global im2
im2=bwmorph(im2,'skel');
axes(handles.axes2)
imshow(im2)


% --- Executes on button press in Thinning.
function Thinning_Callback(hObject, eventdata, handles)
global im2
im2=bwmorph(im2,'thin');
axes(handles.axes2)
imshow(im2)

% --- Executes on button press in Thickening.
function Thickening_Callback(hObject, eventdata, handles)
global im2
im2=bwmorph(im2,'thicken');
axes(handles.axes2)
imshow(im2)


% --- Executes on button press in fillholes.
function fillholes_Callback(hObject, eventdata, handles)
global im2
im2=bwmorph(im2,'fill');
axes(handles.axes2)
imshow(im2)


% --- Executes on button press in prune.
function prune_Callback(hObject, eventdata, handles)
global im2
im2=bwmorph(im2,'spur');
axes(handles.axes2)
imshow(im2)


% --- Executes on button press in Close.
function Close_Callback(hObject, eventdata, handles)
close


% --- Executes on button press in Watershed.
function Watershed_Callback(hObject, eventdata, handles)
global im2
im2=watershedseg(im2);
axes(handles.axes2)
imshow(im2)


% --- Executes on button press in Homomorphic.
function Homomorphic_Callback(hObject, eventdata, handles)
global im2
im2=homomorphic(im2);
axes(handles.axes2)
imshow(im2,[])

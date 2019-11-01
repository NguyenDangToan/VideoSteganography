function varargout = video_assessment(varargin)
% VIDEO_ASSESSMENT MATLAB code for video_assessment.fig
%      VIDEO_ASSESSMENT, by itself, creates a new VIDEO_ASSESSMENT or raises the existing
%      singleton*.
%
%      H = VIDEO_ASSESSMENT returns the handle to a new VIDEO_ASSESSMENT or the handle to
%      the existing singleton*.
%
%      VIDEO_ASSESSMENT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VIDEO_ASSESSMENT.M with the given input arguments.
%
%      VIDEO_ASSESSMENT('Property','Value',...) creates a new VIDEO_ASSESSMENT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before video_assessment_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to video_assessment_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help video_assessment

% Last Modified by GUIDE v2.5 20-Oct-2019 22:32:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @video_assessment_OpeningFcn, ...
                   'gui_OutputFcn',  @video_assessment_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before video_assessment is made visible.
function video_assessment_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to video_assessment (see VARARGIN)

% Choose default command line output for video_assessment
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes video_assessment wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = video_assessment_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edt_hide_message_Callback(hObject, eventdata, handles)
% hObject    handle to edt_hide_message (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edt_hide_message as text
%        str2double(get(hObject,'String')) returns contents of edt_hide_message as a double


% --- Executes during object creation, after setting all properties.
function edt_hide_message_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_hide_message (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_browse_video1.
function btn_browse_video1_Callback(hObject, eventdata, handles)
% hObject    handle to btn_browse_video1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[chosenfile, chosenpath] = uigetfile('*.avi', 'Select a video');
if ~ischar(chosenfile)
    return;   %user canceled dialog
end
filename = strcat(chosenpath, chosenfile);
set(handles.edt_stego_video1, 'String', filename);


function edt_stego_video1_Callback(hObject, eventdata, handles)
% hObject    handle to edt_stego_video1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edt_stego_video1 as text
%        str2double(get(hObject,'String')) returns contents of edt_stego_video1 as a double


% --- Executes during object creation, after setting all properties.
function edt_stego_video1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_stego_video1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_assess_frame.
function btn_assess_frame_Callback(hObject, eventdata, handles)
% hObject    handle to btn_assess_frame (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x2 = get(handles.edt_original_video1, 'String');
x1 = get(handles.edt_stego_video1, 'String');
h = msgbox('please wait');
a = ['ffmpeg -i ', x1,' -i ', x2, ' -lavfi  psnr=psnr.log -f null -'];
system(a);
delete(h);
helpdlg('Data hided successfully');
system('psnr.log');



% --- Executes on button press in btn_clear1.
function btn_clear1_Callback(hObject, eventdata, handles)
% hObject    handle to btn_clear1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edt_stego_video1, 'String', '');
set(handles.edt_original_video1, 'String', '');



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edt_original_video1_Callback(hObject, eventdata, handles)
% hObject    handle to edt_original_video1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edt_original_video1 as text
%        str2double(get(hObject,'String')) returns contents of edt_original_video1 as a double


% --- Executes during object creation, after setting all properties.
function edt_original_video1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_original_video1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_browse_original_video1.
function btn_browse_original_video1_Callback(hObject, eventdata, handles)
% hObject    handle to btn_browse_original_video1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[chosenfile, chosenpath] = uigetfile('*.avi', 'Select a video');
if ~ischar(chosenfile)
    return;   %user canceled dialog
end
filename = strcat(chosenpath, chosenfile);
set(handles.edt_original_video1, 'String', filename);

% --- Executes on button press in btn_close.
function btn_close_Callback(hObject, eventdata, handles)
% hObject    handle to btn_close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close()

% --- Executes on button press in btn_clear2.
function btn_clear2_Callback(hObject, eventdata, handles)
% hObject    handle to btn_clear2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edt_original_video2, 'String', '');
set(handles.edt_stego_video2, 'String', '');
% --- Executes on button press in btn_assess_audiio.
function btn_assess_audiio_Callback(hObject, eventdata, handles)
% hObject    handle to btn_assess_audiio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x1 = get(handles.edt_original_video2, 'String');
x2 = get(handles.edt_stego_video2, 'String');
h = msgbox('please wait');
[status, MSE, PSNR] = Assess_audio(x1, x2);
delete(h);
if(status==1)
    h = msgbox(['Successfully MSE =' num2str(MSE) ' PSNR=' num2str(PSNR)]);
    set(h, 'position', [100 220 500 100]); %makes box bigger
    ah = get( h, 'CurrentAxes' );
    ch = get( ah, 'Children' );
    set( ch, 'FontSize', 20 ); %makes text bigger
else
    helpdlg('Unsuccessful!!! error occured');
end




% --- Executes on button press in btn_browse_original_video2.
function btn_browse_original_video2_Callback(hObject, eventdata, handles)
% hObject    handle to btn_browse_original_video2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[chosenfile, chosenpath] = uigetfile('*.avi', 'Select a video');
if ~ischar(chosenfile)
    return;   %user canceled dialog
end
filename = strcat(chosenpath, chosenfile);
set(handles.edt_original_video2, 'String', filename);


function edt_original_video2_Callback(hObject, eventdata, handles)
% hObject    handle to edt_original_video2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edt_original_video2 as text
%        str2double(get(hObject,'String')) returns contents of edt_original_video2 as a double


% --- Executes during object creation, after setting all properties.
function edt_original_video2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_original_video2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edt_show_message2_Callback(hObject, eventdata, handles)
% hObject    handle to edt_show_message2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edt_show_message2 as text
%        str2double(get(hObject,'String')) returns contents of edt_show_message2 as a double


% --- Executes during object creation, after setting all properties.
function edt_show_message2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_show_message2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[chosenfile, chosenpath] = uigetfile('*.avi', 'Select a video');
if ~ischar(chosenfile)
    return;   %user canceled dialog
end
filename = strcat(chosenpath, chosenfile);
set(handles.edt_stego_video2, 'String', filename);


function edt_stego_video2_Callback(hObject, eventdata, handles)
% hObject    handle to edt_stego_video2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edt_stego_video2 as text
%        str2double(get(hObject,'String')) returns contents of edt_stego_video2 as a double


% --- Executes during object creation, after setting all properties.
function edt_stego_video2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_stego_video2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

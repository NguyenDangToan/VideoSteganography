function varargout = hide_file_in_audio(varargin)
% HIDE_FILE_IN_AUDIO MATLAB code for hide_file_in_audio.fig
%      HIDE_FILE_IN_AUDIO, by itself, creates a new HIDE_FILE_IN_AUDIO or raises the existing
%      singleton*.
%
%      H = HIDE_FILE_IN_AUDIO returns the handle to a new HIDE_FILE_IN_AUDIO or the handle to
%      the existing singleton*.
%
%      HIDE_FILE_IN_AUDIO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HIDE_FILE_IN_AUDIO.M with the given input arguments.
%
%      HIDE_FILE_IN_AUDIO('Property','Value',...) creates a new HIDE_FILE_IN_AUDIO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before hide_file_in_audio_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to hide_file_in_audio_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help hide_file_in_audio

% Last Modified by GUIDE v2.5 02-Oct-2019 10:47:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @hide_file_in_audio_OpeningFcn, ...
                   'gui_OutputFcn',  @hide_file_in_audio_OutputFcn, ...
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


% --- Executes just before hide_file_in_audio is made visible.
function hide_file_in_audio_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to hide_file_in_audio (see VARARGIN)

% Choose default command line output for hide_file_in_audio
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes hide_file_in_audio wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = hide_file_in_audio_OutputFcn(hObject, eventdata, handles) 
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
set(handles.edt_video_path1, 'String', filename);


function edt_video_path1_Callback(hObject, eventdata, handles)
% hObject    handle to edt_video_path1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edt_video_path1 as text
%        str2double(get(hObject,'String')) returns contents of edt_video_path1 as a double


% --- Executes during object creation, after setting all properties.
function edt_video_path1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_video_path1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_hide.
function btn_hide_Callback(hObject, eventdata, handles)
% hObject    handle to btn_hide (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x2 = get(handles.edt_file_path1, 'String');
x1 = get(handles.edt_video_path1, 'String');
x3 = get(handles.edt_password1, 'String');
h = msgbox('please wait');
[status]=Hide_data_audio(x1,x2, x3);
delete(h);
if(status==1)
    helpdlg('Data hided successfully');
else
    helpdlg('Unsuccessful!!! File size is too big');
end



% --- Executes on button press in btn_clear1.
function btn_clear1_Callback(hObject, eventdata, handles)
% hObject    handle to btn_clear1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edt_video_path1, 'String', '');
set(handles.edt_file_path1, 'String', '');



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



function edt_file_path1_Callback(hObject, eventdata, handles)
% hObject    handle to edt_file_path1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edt_file_path1 as text
%        str2double(get(hObject,'String')) returns contents of edt_file_path1 as a double


% --- Executes during object creation, after setting all properties.
function edt_file_path1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_file_path1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_browse_file1.
function btn_browse_file1_Callback(hObject, eventdata, handles)
% hObject    handle to btn_browse_file1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[chosenfile, chosenpath] = uigetfile('*.txt', 'Select a text file');
if ~ischar(chosenfile)
    return;   %user canceled dialog
end
filename = strcat(chosenpath, chosenfile);
set(handles.edt_file_path1, 'String', filename);

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
set(handles.edt_video_path2, 'String', '');
set(handles.edt_show_message2, 'String', '');

% --- Executes on button press in btn_retrieve.
function btn_retrieve_Callback(hObject, eventdata, handles)
% hObject    handle to btn_retrieve (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x1 = get(handles.edt_video_path2, 'String');
x2 = get(handles.edt_password2, 'String');
h = msgbox('please wait');
Retrieve_data_audio(x1,x2);
delete(h);
f1 = fopen('x.txt','r');
f = fread(f1);
s = char(f');
fclose(f1);
set(handles.edt_show_message2, 'String', s);
helpdlg('Data hided successfully');




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


% --- Executes on button press in btn_browse_video2.
function btn_browse_video2_Callback(hObject, eventdata, handles)
% hObject    handle to btn_browse_video2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[chosenfile, chosenpath] = uigetfile('*.avi', 'Select a video');
if ~ischar(chosenfile)
    return;   %user canceled dialog
end
filename = strcat(chosenpath, chosenfile);
set(handles.edt_video_path2, 'String', filename);


function edt_video_path2_Callback(hObject, eventdata, handles)
% hObject    handle to edt_video_path2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edt_video_path2 as text
%        str2double(get(hObject,'String')) returns contents of edt_video_path2 as a double


% --- Executes during object creation, after setting all properties.
function edt_video_path2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_video_path2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edt_password1_Callback(hObject, eventdata, handles)
% hObject    handle to edt_password1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edt_password1 as text
%        str2double(get(hObject,'String')) returns contents of edt_password1 as a double


% --- Executes during object creation, after setting all properties.
function edt_password1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_password1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edt_password2_Callback(hObject, eventdata, handles)
% hObject    handle to edt_password2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edt_password2 as text
%        str2double(get(hObject,'String')) returns contents of edt_password2 as a double


% --- Executes during object creation, after setting all properties.
function edt_password2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_password2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function varargout = hide_message(varargin)
% HIDE_MESSAGE MATLAB code for hide_message.fig
%      HIDE_MESSAGE, by itself, creates a new HIDE_MESSAGE or raises the existing
%      singleton*.
%
%      H = HIDE_MESSAGE returns the handle to a new HIDE_MESSAGE or the handle to
%      the existing singleton*.
%
%      HIDE_MESSAGE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HIDE_MESSAGE.M with the given input arguments.
%
%      HIDE_MESSAGE('Property','Value',...) creates a new HIDE_MESSAGE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before hide_message_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to hide_message_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help hide_message

% Last Modified by GUIDE v2.5 02-Oct-2019 12:13:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @hide_message_OpeningFcn, ...
                   'gui_OutputFcn',  @hide_message_OutputFcn, ...
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


% --- Executes just before hide_message is made visible.
function hide_message_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to hide_message (see VARARGIN)

% Choose default command line output for hide_message
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes hide_message wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = hide_message_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edt_hide_message1_Callback(hObject, eventdata, handles)
% hObject    handle to edt_hide_message1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edt_hide_message1 as text
%        str2double(get(hObject,'String')) returns contents of edt_hide_message1 as a double


% --- Executes during object creation, after setting all properties.
function edt_hide_message1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_hide_message1 (see GCBO)
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
x1 = get(handles.edt_video_path1, 'String');
message = get(handles.edt_hide_message1, 'String');
fid = fopen('message.txt','wb');
fwrite(fid,char(message),'char');
fclose(fid);
h = msgbox('please wait');
x2 = 'message.txt';
[status]=Hide_data_video(x1,x2);
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
set(handles.edt_hide_message1, 'String', '');
set(handles.edt_video_path1, 'String', '');

% --- Executes on button press in btn_close.
function btn_close_Callback(hObject, eventdata, handles)
% hObject    handle to btn_close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close()


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


% --- Executes on button press in btn_retrieve2.
function btn_retrieve2_Callback(hObject, eventdata, handles)
% hObject    handle to btn_retrieve2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x1 = get(handles.edt_video_path2, 'String');
x2 = 'key.txt';
h = msgbox('please wait');
[status]=Retrieve_data_video(x1,x2);
delete(h);
if(status==1)
    helpdlg('Data retrieved successfully');
    f1 = fopen('x.txt','r');
    f = fread(f1);
    s = char(f');
    set(handles.edt_show_message2, 'String', s);
else
    helpdlg('Unsuccessful!!! error occured');
end

% --- Executes on button press in btn_clear2.
function btn_clear2_Callback(hObject, eventdata, handles)
% hObject    handle to btn_clear2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edt_show_message2, 'String', '');
set(handles.edt_video_path2, 'String', '');


% --- Executes during object creation, after setting all properties.
function btn_hide_CreateFcn(hObject, eventdata, handles)
% hObject    handle to btn_hide (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

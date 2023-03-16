function varargout = SSP2023(varargin)
% SSP2023 MATLAB code for SSP2023.fig
%      SSP2023, by itself, creates a new SSP2023 or raises the existing
%      singleton*.
%
%      H = SSP2023 returns the handle to a new SSP2023 or the handle to
%      the existing singleton*.
%
%      SSP2023('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SSP2023.M with the given input arguments.
%
%      SSP2023('Property','Value',...) creates a new SSP2023 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SSP2023_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SSP2023_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SSP2023

% Last Modified by GUIDE v2.5 11-Jan-2023 22:39:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SSP2023_OpeningFcn, ...
                   'gui_OutputFcn',  @SSP2023_OutputFcn, ...
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


% --- Executes just before SSP2023 is made visible.
function SSP2023_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SSP2023 (see VARARGIN)

% Choose default command line output for SSP2023
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SSP2023 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

set(handles.panel_simulated2,'visible','on');
set(handles.panel_realsignals,'visible','off');
% --- Outputs from this function are returned to the command line.
function varargout = SSP2023_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btn_load.
function btn_load_Callback(hObject, eventdata, handles)
% hObject    handle to btn_load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global filename pathname;
[filename, pathname]=uigetfile('*.csv;*.xlsx;*.mat','Recored data');


% --- Executes on selection change in menu_method.
function menu_method_Callback(hObject, eventdata, handles)
% hObject    handle to menu_method (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global y ynoise t tt;
type=get(handles.menu_method,'value');
[Y,YN,Fv,tt]=process_signal(y,ynoise,type);
ax=handles.panel_plot;
plot_data(ynoise,YN,tt,Fv,t,ax,type);
% Hints: contents = cellstr(get(hObject,'String')) returns menu_method contents as cell array
%        contents{get(hObject,'Value')} returns selected item from menu_method


% --- Executes during object creation, after setting all properties.
function menu_method_CreateFcn(hObject, eventdata, handles)
% hObject    handle to menu_method (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in menu_type.
function menu_type_Callback(hObject, eventdata, handles)
% hObject    handle to menu_type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns menu_type contents as cell array
%        contents{get(hObject,'Value')} returns selected item from menu_type
val=get(handles.menu_type,'value');
if val==1
     set(handles.panel_simulated2,'visible','on');
    set(handles.panel_realsignals,'visible','off');
    set(handles.panel_CW,'visible','on');
   
else
    set(handles.panel_realsignals,'visible','on');
    set(handles.panel_simulated2,'visible','off');
    set(handles.panel_CW,'visible','off');
end

% --- Executes during object creation, after setting all properties.
function menu_type_CreateFcn(hObject, eventdata, handles)
% hObject    handle to menu_type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in menu_window.
function menu_window_Callback(hObject, eventdata, handles)
% hObject    handle to menu_window (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns menu_window contents as cell array
%        contents{get(hObject,'Value')} returns selected item from menu_window


% --- Executes during object creation, after setting all properties.
function menu_window_CreateFcn(hObject, eventdata, handles)
% hObject    handle to menu_window (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_L_Callback(hObject, eventdata, handles)
% hObject    handle to txt_L (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_L as text
%        str2double(get(hObject,'String')) returns contents of txt_L as a double


% --- Executes during object creation, after setting all properties.
function txt_L_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_L (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in menu_signals.
function menu_signals_Callback(hObject, eventdata, handles)
% hObject    handle to menu_signals (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns menu_signals contents as cell array
%        contents{get(hObject,'Value')} returns selected item from menu_signals
global y ynoise ;
val =get(handles.menu_signals,'value');
if val<=2
    set(handles.panel_fmod,'visible','off');
    set(handles.panel_subparam,'visible','off');
    set(handles.panel_Number,'visible','off');
elseif val<=4
    set(handles.panel_fmod,'visible','on');
    set(handles.panel_subparam,'visible','off');
    set(handles.panel_Number,'visible','off');
elseif val<=8
    set(handles.panel_fmod,'visible','off');
    set(handles.panel_subparam,'visible','off');
    set(handles.panel_Number,'visible','off');
elseif val==9
    set(handles.panel_subparam,'visible','on');
    set(handles.panel_Number,'visible','off');
else
    set(handles.panel_subparam,'visible','on');
    set(handles.panel_Number,'visible','on');
end
snr=str2double(get(handles.txt_snr,'string'));
Top=str2double(get(handles.txt_Top,'string'))*1e-6;
fc=str2double(get(handles.txt_Fc,'string'))*1e6;
ti=str2double(get(handles.txt_pw,'string'))*1e-6;
barker=1;
fm=str2double(get(handles.txt_fm,'string'))*1e6;
fmax=str2double(get(handles.txt_fmax,'string'))*1e6;
fmin=str2double(get(handles.txt_fmin,'string'))*1e6;
N=str2double(get(handles.txt_N,'string'));
[y,ynoise,t]=generate_signal(fc,fm,fmin,fmax,snr,Top,ti,val,N, barker);
% --- Executes during object creation, after setting all properties.
function menu_signals_CreateFcn(hObject, eventdata, handles)
% hObject    handle to menu_signals (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_Top_Callback(hObject, eventdata, handles)
% hObject    handle to txt_Top (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_Top as text
%        str2double(get(hObject,'String')) returns contents of txt_Top as a double


% --- Executes during object creation, after setting all properties.
function txt_Top_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_Top (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_pw_Callback(hObject, eventdata, handles)
% hObject    handle to txt_pw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_pw as text
%        str2double(get(hObject,'String')) returns contents of txt_pw as a double


% --- Executes during object creation, after setting all properties.
function txt_pw_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_pw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_Fc_Callback(hObject, eventdata, handles)
% hObject    handle to txt_Fc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_Fc as text
%        str2double(get(hObject,'String')) returns contents of txt_Fc as a double


% --- Executes during object creation, after setting all properties.
function txt_Fc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_Fc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_fm_Callback(hObject, eventdata, handles)
% hObject    handle to txt_fm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_fm as text
%        str2double(get(hObject,'String')) returns contents of txt_fm as a double


% --- Executes during object creation, after setting all properties.
function txt_fm_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_fm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_N_Callback(hObject, eventdata, handles)
% hObject    handle to txt_N (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_N as text
%        str2double(get(hObject,'String')) returns contents of txt_N as a double


% --- Executes during object creation, after setting all properties.
function txt_N_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_N (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_fmin_Callback(hObject, eventdata, handles)
% hObject    handle to txt_fmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_fmin as text
%        str2double(get(hObject,'String')) returns contents of txt_fmin as a double


% --- Executes during object creation, after setting all properties.
function txt_fmin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_fmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_fmax_Callback(hObject, eventdata, handles)
% hObject    handle to txt_fmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_fmax as text
%        str2double(get(hObject,'String')) returns contents of txt_fmax as a double


% --- Executes during object creation, after setting all properties.
function txt_fmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_fmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_snr_Callback(hObject, eventdata, handles)
% hObject    handle to txt_snr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_snr as text
%        str2double(get(hObject,'String')) returns contents of txt_snr as a double


% --- Executes during object creation, after setting all properties.
function txt_snr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_snr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

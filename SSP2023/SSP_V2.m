function varargout = SSP_V2(varargin)
% SSP_V2 MATLAB code for SSP_V2.fig
%      SSP_V2, by itself, creates a new SSP_V2 or raises the existing
%      singleton*.
%
%      H = SSP_V2 returns the handle to a new SSP_V2 or the handle to
%      the existing singleton*.
%
%      SSP_V2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SSP_V2.M with the given input arguments.
%
%      SSP_V2('Property','Value',...) creates a new SSP_V2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SSP_V2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SSP_V2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SSP_V2

% Last Modified by GUIDE v2.5 06-Mar-2023 15:12:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SSP_V2_OpeningFcn, ...
                   'gui_OutputFcn',  @SSP_V2_OutputFcn, ...
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


% --- Executes just before SSP_V2 is made visible.
function SSP_V2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SSP_V2 (see VARARGIN)

% Choose default command line output for SSP_V2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SSP_V2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SSP_V2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in menu_data.
function menu_data_Callback(hObject, eventdata, handles)
% hObject    handle to menu_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val=get(handles.menu_data,'value');
if val==1
    set(handles.menu_signals,'visible','on');
    set(handles.btn_loadrecorded,'visible','off');
%     set(handles.panel_cw,'visible','on');
%     set(handles.text6,'visible','off');
%     set(handles.txt_tir,'visible','off');
else
        set(handles.menu_signals,'visible','off');
    set(handles.btn_loadrecorded,'visible','on');
     set(handles.panel_cw,'visible','off');
    set(handles.panel_am,'visible','off');
    set(handles.panel_am,'visible','off');
    set(handles.panel_lfm,'visible','off');
    set(handles.panel_2lfm,'visible','off');
    set(handles.panel_lfm_cw,'visible','off');
    set(handles.panel_bpsk,'visible','off');
     set(handles.panel_costas,'visible','off');
end
% Hints: contents = cellstr(get(hObject,'String')) returns menu_data contents as cell array
%        contents{get(hObject,'Value')} returns selected item from menu_data


% --- Executes during object creation, after setting all properties.
function menu_data_CreateFcn(hObject, eventdata, handles)
% hObject    handle to menu_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in menu_signals.
function menu_signals_Callback(hObject, eventdata, handles)
% hObject    handle to menu_signals (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global val ax fc fs fmax fmin fm k amp Top ti snr y ynoise fc2 fmin2 fmax2 amp2;
amp2=0;
ax=handles.panel_plot;
val=get(handles.menu_signals,'value');
if val==1
    set(handles.panel_cw,'visible','on');
    set(handles.panel_am,'visible','off');
    set(handles.text6,'visible','off');
    set(handles.txt_tir,'visible','off');
    set(handles.panel_am,'visible','off');
    set(handles.panel_lfm,'visible','off');
    set(handles.panel_2lfm,'visible','off');
    set(handles.panel_lfm_cw,'visible','off');
    set(handles.panel_bpsk,'visible','off');
     set(handles.panel_costas,'visible','off');
elseif val==2
    set(handles.panel_cw,'visible','on');
    set(handles.panel_am,'visible','off');
    set(handles.text6,'visible','on');
    set(handles.txt_tir,'visible','on');
    set(handles.panel_am,'visible','off');
    set(handles.panel_lfm,'visible','off');
    set(handles.panel_2lfm,'visible','off');
    set(handles.panel_lfm_cw,'visible','off');
    set(handles.panel_bpsk,'visible','off');
     set(handles.panel_costas,'visible','off');
elseif val==3 | val==4
    set(handles.panel_cw,'visible','off');
    set(handles.panel_am,'visible','off');
    set(handles.panel_am,'visible','on');
    set(handles.panel_lfm,'visible','off');
    set(handles.panel_2lfm,'visible','off');
    set(handles.panel_lfm_cw,'visible','off');
    set(handles.panel_bpsk,'visible','off');
     set(handles.panel_costas,'visible','off');
elseif val==5
    set(handles.panel_cw,'visible','off');
    set(handles.panel_am,'visible','off');
    set(handles.panel_am,'visible','off');
    set(handles.panel_lfm,'visible','on');
    set(handles.panel_2lfm,'visible','off');
    set(handles.panel_lfm_cw,'visible','off');
    set(handles.panel_bpsk,'visible','off');
     set(handles.panel_costas,'visible','off');
elseif val==6
    set(handles.panel_cw,'visible','off');
    set(handles.panel_am,'visible','off');
    set(handles.panel_am,'visible','off');
    set(handles.panel_lfm,'visible','off');
    set(handles.panel_2lfm,'visible','off');
    set(handles.panel_lfm_cw,'visible','off');
    set(handles.panel_bpsk,'visible','on');
     set(handles.panel_costas,'visible','off');
      set(handles.menu_tib,'string',["13","26"]);
elseif val==7
    set(handles.panel_cw,'visible','off');
    set(handles.panel_am,'visible','off');
    set(handles.panel_am,'visible','off');
    set(handles.panel_lfm,'visible','off');
    set(handles.panel_2lfm,'visible','off');
    set(handles.panel_lfm_cw,'visible','off');
    set(handles.panel_bpsk,'visible','off');
     set(handles.panel_costas,'visible','on');
elseif val==8
    set(handles.panel_cw,'visible','off');
    set(handles.panel_am,'visible','off');
    set(handles.panel_am,'visible','off');
    set(handles.panel_lfm,'visible','off');
    set(handles.panel_2lfm,'visible','on');
    set(handles.panel_lfm_cw,'visible','off');
    set(handles.panel_bpsk,'visible','off');
     set(handles.panel_costas,'visible','off');
elseif val==9
    set(handles.panel_cw,'visible','off');
    set(handles.panel_am,'visible','off');
    set(handles.panel_am,'visible','off');
    set(handles.panel_lfm,'visible','off');
    set(handles.panel_2lfm,'visible','off');
    set(handles.panel_lfm_cw,'visible','on');
    set(handles.panel_bpsk,'visible','off');
     set(handles.panel_costas,'visible','off');
else
    set(handles.panel_cw,'visible','off');
    set(handles.panel_am,'visible','off');
    set(handles.panel_am,'visible','off');
    set(handles.panel_lfm,'visible','off');
    set(handles.panel_2lfm,'visible','off');
    set(handles.panel_lfm_cw,'visible','on');
    set(handles.panel_bpsk,'visible','on');
     set(handles.panel_costas,'visible','off');
end
% generate signal
val2=get(handles.menu_tib,'value');
fs=1e8;
switch val
    case 1
        fc=str2double(get(handles.txt_fc,'string'))*1e6;
        Top=str2double(get(handles.txt_Top,'string'))*1e-6;
        amp=str2double(get(handles.txt_amp,'string'));
        snr=str2double(get(handles.txt_snr1,'string'));
        fm=0;
        k=0;
        fmin=0;
        fmax=0;
        ti=0;
        fc2=0;
        fmin2=0;
        fmax2=0;
    case 2
        fc=str2double(get(handles.txt_fc,'string'))*1e6;
        Top=str2double(get(handles.txt_Top,'string'))*1e-6;
        amp=str2double(get(handles.txt_amp,'string'));
        snr=str2double(get(handles.txt_snr1,'string'));
        fm=0;
        k=0;
        fmin=0;
        fmax=0;
        ti=str2double(get(handles.txt_tir,'string'))*1e-6;
        fc2=0;
        fmin2=0;
        fmax2=0;
    case 3
        fc=str2double(get(handles.txt_fcam,'string'))*1e6;
        Top=str2double(get(handles.txt_Topam,'string'))*1e-6;
        amp=str2double(get(handles.edit7,'string'));
        snr=str2double(get(handles.txt_snr2,'string'));
        fm=str2double(get(handles.txt_fmam,'string'))*1e6;
        k=str2double(get(handles.txt_kam,'string'));
        fmin=0;
        fmax=0;
        ti=0;
        fc2=0;
        fmin2=0;
        fmax2=0;
    case 4
        fc=str2double(get(handles.txt_fcam,'string'))*1e6;
        Top=str2double(get(handles.txt_Topam,'string'))*1e-6;
        amp=str2double(get(handles.edit7,'string'));
        snr=str2double(get(handles.txt_snr2,'string'));
        fm=str2double(get(handles.txt_fmam,'string'))*1e6;
        k=str2double(get(handles.txt_kam,'string'));
        fmin=0;
        fmax=0;
        ti=0;
        fc2=0;
        fmin2=0;
        fmax2=0;
    case 5
        fc=str2double(get(handles.txt_fclfm,'string'))*1e6;
        Top=str2double(get(handles.txt_prilfm,'string'))*1e-6;
        amp=str2double(get(handles.txt_alfm,'string'));
        snr=str2double(get(handles.txt_snrlfm,'string'));
        fm=0;
        k=0;
        fmin=str2double(get(handles.txt_fmin,'string'))*1e6;
        fmax=str2double(get(handles.txt_fmax,'string'))*1e6;
        ti=str2double(get(handles.txt_tilfm,'string'))*1e-6;
         fc2=0;
        fmin2=0;
        fmax2=0;
    case 6
        fc=str2double(get(handles.txt_fcb,'string'))*1e6;
        Top=str2double(get(handles.txt_prib,'string'))*1e-6;
        amp=str2double(get(handles.txt_amb,'string'));
        snr=str2double(get(handles.txt_snrb,'string'));
        fm=0;
        k=0;
        fmin=0;
        fmax=0;
        if val2==1
        ti=13e-6;
        else
            ti=26e-6;
        end
         fc2=0;
        fmin2=0;
        fmax2=0;
    case 7
         fc=str2double(get(handles.txt_fchop,'string'))*1e6;
        Top=str2double(get(handles.txt_tihop,'string'))*1e-6;
        amp=str2double(get(handles.txt_amphop,'string'));
        snr=str2double(get(handles.txt_snrhop,'string'));
        fm=0;
        ti=str2double(get(handles.txt_tihop,'string'))*1e-6;
        k=0;
        fmin=str2double(get(handles.txt_fspace,'string'))*1e6;
        fmax=get(handles.menu_costas,'value');
         fc2=0;
        fmin2=0;
        fmax2=0;
    case 8
        fc=str2double(get(handles.txt_fclfm,'string'))*1e6;
        Top=str2double(get(handles.txt_prilfm,'string'))*1e-6;
        amp=str2double(get(handles.txt_alfm,'string'));
        snr=str2double(get(handles.edit58,'string'));
        fm=0;
        k=0;
        fmin=str2double(get(handles.txt_fmin,'string'))*1e6;
        fmax=str2double(get(handles.txt_fmax,'string'))*1e6;
        ti=str2double(get(handles.txt_tilfm,'string'))*1e-6;
        fc2=fc;
        fmin2=str2double(get(handles.txt_minfreq2,'string'))*1e6;
        fmax2=str2double(get(handles.txt_maxfreq2,'string'))*1e6;
    case 9
        fc=str2double(get(handles.txt_fclfm,'string'))*1e6;
        Top=str2double(get(handles.txt_prilfm,'string'))*1e-6;
        amp=str2double(get(handles.txt_alfm,'string'));
        snr=str2double(get(handles.txt_snrlfm,'string'));
        fm=0;
        k=0;
        fmin=str2double(get(handles.txt_fmin,'string'))*1e6;
        fmax=str2double(get(handles.txt_fmax,'string'))*1e6;
        ti=str2double(get(handles.txt_tilfm,'string'))*1e-6;
        fc2=str2double(get(handles.txt_freqcw,'string'))*1e6;
        fmin2=0;
        fmax2=0;
        amp2=str2double(get(handles.txt_ampcw,'string'));
    case 10
        fc=str2double(get(handles.txt_fclfm,'string'))*1e6;
        Top=str2double(get(handles.txt_prilfm,'string'))*1e-6;
        amp=str2double(get(handles.txt_alfm,'string'));
        snr=str2double(get(handles.edit49,'string'));
        fm=0;
        k=0;
        fmin=str2double(get(handles.txt_fmin,'string'))*1e6;
        fmax=str2double(get(handles.txt_fmax,'string'))*1e6;
        ti=str2double(get(handles.txt_tilfm,'string'))*1e-6;
        fc2=str2double(get(handles.txt_freqcw,'string'))*1e6;
        fmin2=0;
        fmax2=0;
        amp2=str2double(get(handles.txt_ampcw,'string'));


end
val3=get(handles.menu_data,'value');
if val3==1
   [y,ynoise,t]=gen_sig(fs,fc,amp,fm,k,fmin,fmax,Top,ti,snr,val,fc2,fmin2,fmax2,amp2);
end
plot_time(y,ynoise,t,ax);
% Hints: contents = cellstr(get(hObject,'String')) returns menu_signals contents as cell array
%        contents{get(hObject,'Value')} returns selected item from menu_signals


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


% --- Executes on selection change in menu_methods.
function menu_methods_Callback(hObject, eventdata, handles)
% hObject    handle to menu_methods (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global val ax fc fs fmax fmin fm k amp Top ti snr y ynoise fsreal yreal;
val2=get(handles.menu_methods,'value');
val3=get(handles.menu_data,'value');
if val3==1
    [Y,YN,Fv,t,tk]=process_signal(y,ynoise,fs,val2);
    plot_time_frequency(Y,YN,Fv,t,ax,val2);
else
    [Y,YN,Fv,t,tk]=process_signal(yreal,yreal,fsreal,val2);
    plot_reldata(YN,Fv,t,ax,val2)
end
 set(handles.txt_timep,'string','                   ');
 set(handles.txt_timep,'string',num2str(tk*1e3));
% Hints: contents = cellstr(get(hObject,'String')) returns menu_methods contents as cell array
%        contents{get(hObject,'Value')} returns selected item from menu_methods


% --- Executes during object creation, after setting all properties.
function menu_methods_CreateFcn(hObject, eventdata, handles)
% hObject    handle to menu_methods (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_loadrecorded.
function btn_loadrecorded_Callback(hObject, eventdata, handles)
% hObject    handle to btn_loadrecorded (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear yreal fsreal;
global val ax fc fs fmax fmin fm k amp Top ti snr y ynoise fsreal yreal Topreal;
[file,path] = uigetfile({'*.csv';'*.slx';'*.mat';'*.*'},...
                          'File Selector');
addpath(path);
yh=xlsread(file);
fsreal=1/3e-9;
Topreal=25e-6;
tk=0:1/fsreal:Topreal-1/fsreal;
yreal=zeros(1,length(tk));
yreal(:)=yh(1:length(tk));
ax=handles.panel_plot;
plt=subplot(2,3,1,'parent',ax);
cla(plt,'reset');
length(tk)
length(yreal)
plot(plt,tk*1e6,1e3*yreal,'linewidth',1.5);
xlabel(plt,'Time (\mus)');
ylabel(plt,'Amplitude (mV)');
grid(plt,'on');
axis(plt,[0 max(tk)*1e6 -2 2])
axis(plt,'square');
title(plt,'Recorded data');
function txt_fc_Callback(hObject, eventdata, handles)
% hObject    handle to txt_fc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global val ax fc fs fmax fmin fm k amp Top ti snr y ynoise ;
fc=str2double(get(handles.txt_fc,'string'))*1e6;
val3=get(handles.menu_data,'value');
if val3==1
    [y,ynoise,t]=gen_sig(fs,fc,amp,fm,k,fmin,fmax,Top,ti,snr,val);
end
val=get(handles.menu_signals,'value');
plot_time(y,ynoise,t,ax);

% Hints: get(hObject,'String') returns contents of txt_fc as text
%        str2double(get(hObject,'String')) returns contents of txt_fc as a double

% --- Executes during object creation, after setting all properties.
function txt_fc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_fc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
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

global val ax fc fs fmax fmin fm k amp Top ti snr y ynoise ;
Top=str2double(get(handles.txt_Top,'string'))*1e-6;
val3=get(handles.menu_data,'value');
if val3==1
    [y,ynoise,t]=gen_sig(fs,fc,amp,fm,k,fmin,fmax,Top,ti,snr,val);
end
val=get(handles.menu_signals,'value');
plot_time(y,ynoise,t,ax);
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



function txt_amp_Callback(hObject, eventdata, handles)
% hObject    handle to txt_amp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global val ax fc fs fmax fmin fm k amp Top ti snr y ynoise ;
amp=str2double(get(handles.txt_amp,'string'));
val3=get(handles.menu_data,'value');
if val3==1
    [y,ynoise,t]=gen_sig(fs,fc,amp,fm,k,fmin,fmax,Top,ti,snr,val);
end
val=get(handles.menu_signals,'value');
plot_time(y,ynoise,t,ax);
% Hints: get(hObject,'String') returns contents of txt_amp as text
%        str2double(get(hObject,'String')) returns contents of txt_amp as a double


% --- Executes during object creation, after setting all properties.
function txt_amp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_amp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_tir_Callback(hObject, eventdata, handles)
% hObject    handle to txt_tir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global val ax fc fs fmax fmin fm k amp Top ti snr y ynoise ;
ti=str2double(get(handles.txt_tir,'string'))*1e-6;
val3=get(handles.menu_data,'value');
if val3==1
    [y,ynoise,t]=gen_sig(fs,fc,amp,fm,k,fmin,fmax,Top,ti,snr,val);
end
val=get(handles.menu_signals,'value');
plot_time(y,ynoise,t,ax);
% Hints: get(hObject,'String') returns contents of txt_tir as text
%        str2double(get(hObject,'String')) returns contents of txt_tir as a double


% --- Executes during object creation, after setting all properties.
function txt_tir_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_tir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_fcam_Callback(hObject, eventdata, handles)
% hObject    handle to txt_fcam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global val ax fc fs fmax fmin fm k amp Top ti snr y ynoise ;
fc=str2double(get(handles.txt_fcam,'string'))*1e6;
val3=get(handles.menu_data,'value');
if val3==1
    [y,ynoise,t]=gen_sig(fs,fc,amp,fm,k,fmin,fmax,Top,ti,snr,val);
end
val=get(handles.menu_signals,'value');
plot_time(y,ynoise,t,ax);
% Hints: get(hObject,'String') returns contents of txt_fcam as text
%        str2double(get(hObject,'String')) returns contents of txt_fcam as a double


% --- Executes during object creation, after setting all properties.
function txt_fcam_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_fcam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_Topam_Callback(hObject, eventdata, handles)
% hObject    handle to txt_Topam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_Topam as text
%        str2double(get(hObject,'String')) returns contents of txt_Topam as a double

global val ax fc fs fmax fmin fm k amp Top ti snr y ynoise ;
Top=str2double(get(handles.txt_Topam,'string'))*1e-6;
val3=get(handles.menu_data,'value');
if val3==1
    [y,ynoise,t]=gen_sig(fs,fc,amp,fm,k,fmin,fmax,Top,ti,snr,val);
end
val=get(handles.menu_signals,'value');
plot_time(y,ynoise,t,ax);
% --- Executes during object creation, after setting all properties.
function txt_Topam_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_Topam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global val ax fc fs fmax fmin fm k amp Top ti snr y ynoise ;
amp=str2double(get(handles.edit7,'string'));
val3=get(handles.menu_data,'value');
if val3==1
    [y,ynoise,t]=gen_sig(fs,fc,amp,fm,k,fmin,fmax,Top,ti,snr,val);
end
val=get(handles.menu_signals,'value');
plot_time(y,ynoise,t,ax);
% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_fmam_Callback(hObject, eventdata, handles)
% hObject    handle to txt_fmam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global val ax fc fs fmax fmin fm k amp Top ti snr y ynoise ;
fm=str2double(get(handles.txt_fmam,'string'))*1e6;
val3=get(handles.menu_data,'value');
if val3==1
    [y,ynoise,t]=gen_sig(fs,fc,amp,fm,k,fmin,fmax,Top,ti,snr,val);
end
val=get(handles.menu_signals,'value');
plot_time(y,ynoise,t,ax);
% Hints: get(hObject,'String') returns contents of txt_fmam as text
%        str2double(get(hObject,'String')) returns contents of txt_fmam as a double


% --- Executes during object creation, after setting all properties.
function txt_fmam_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_fmam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_kam_Callback(hObject, eventdata, handles)
% hObject    handle to txt_kam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global val ax fc fs fmax fmin fm k amp Top ti snr y ynoise ;
k=str2double(get(handles.txt_kam,'string'));
val3=get(handles.menu_data,'value');
if val3==1
    [y,ynoise,t]=gen_sig(fs,fc,amp,fm,k,fmin,fmax,Top,ti,snr,val);
end
val=get(handles.menu_signals,'value');
plot_time(y,ynoise,t,ax);
% Hints: get(hObject,'String') returns contents of txt_kam as text
%        str2double(get(hObject,'String')) returns contents of txt_kam as a double


% --- Executes during object creation, after setting all properties.
function txt_kam_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_kam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_fclfm_Callback(hObject, eventdata, handles)
% hObject    handle to txt_fclfm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global val ax fc fs fmax fmin fm k amp Top ti snr y ynoise ;
fc=str2double(get(handles.txt_fclfm,'string'))*1e6;
val3=get(handles.menu_data,'value');
if val3==1
    [y,ynoise,t]=gen_sig(fs,fc,amp,fm,k,fmin,fmax,Top,ti,snr,val);
end
val=get(handles.menu_signals,'value');
plot_time(y,ynoise,t,ax);
% Hints: get(hObject,'String') returns contents of txt_fclfm as text
%        str2double(get(hObject,'String')) returns contents of txt_fclfm as a double


% --- Executes during object creation, after setting all properties.
function txt_fclfm_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_fclfm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_prilfm_Callback(hObject, eventdata, handles)
% hObject    handle to txt_prilfm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global val ax fc fs fmax fmin fm k amp Top ti snr y ynoise ;
Top=str2double(get(handles.txt_prilfm,'string'))*1e-6;
val3=get(handles.menu_data,'value');
if val3==1
    [y,ynoise,t]=gen_sig(fs,fc,amp,fm,k,fmin,fmax,Top,ti,snr,val);
end
val=get(handles.menu_signals,'value');
plot_time(y,ynoise,t,ax);
% Hints: get(hObject,'String') returns contents of txt_prilfm as text
%        str2double(get(hObject,'String')) returns contents of txt_prilfm as a double


% --- Executes during object creation, after setting all properties.
function txt_prilfm_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_prilfm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_alfm_Callback(hObject, eventdata, handles)
% hObject    handle to txt_alfm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global val ax fc fs fmax fmin fm k amp Top ti snr y ynoise ;
amp=str2double(get(handles.txt_alfm,'string'));
val3=get(handles.menu_data,'value');
if val3==1
    [y,ynoise,t]=gen_sig(fs,fc,amp,fm,k,fmin,fmax,Top,ti,snr,val);
end
val=get(handles.menu_signals,'value');
plot_time(y,ynoise,t,ax);
% Hints: get(hObject,'String') returns contents of txt_alfm as text
%        str2double(get(hObject,'String')) returns contents of txt_alfm as a double


% --- Executes during object creation, after setting all properties.
function txt_alfm_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_alfm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_tilfm_Callback(hObject, eventdata, handles)
% hObject    handle to txt_tilfm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global val ax fc fs fmax fmin fm k amp Top ti snr y ynoise ;
ti=str2double(get(handles.txt_tilfm,'string'))*1e-6;
val3=get(handles.menu_data,'value');
if val3==1
    [y,ynoise,t]=gen_sig(fs,fc,amp,fm,k,fmin,fmax,Top,ti,snr,val);
end
val=get(handles.menu_signals,'value');
plot_time(y,ynoise,t,ax);
% Hints: get(hObject,'String') returns contents of txt_tilfm as text
%        str2double(get(hObject,'String')) returns contents of txt_tilfm as a double


% --- Executes during object creation, after setting all properties.
function txt_tilfm_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_tilfm (see GCBO)
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
global val ax fc fs fmax fmin fm k amp Top ti snr y ynoise ;
fmax=str2double(get(handles.txt_fmax,'string'))*1e6;
val3=get(handles.menu_data,'value');
if val3==1
    [y,ynoise,t]=gen_sig(fs,fc,amp,fm,k,fmin,fmax,Top,ti,snr,val);
end
val=get(handles.menu_signals,'value');
plot_time(y,ynoise,t,ax);
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



function txt_fmin_Callback(hObject, eventdata, handles)
% hObject    handle to txt_fmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_fmin as text
%        str2double(get(hObject,'String')) returns contents of txt_fmin as a double
global val ax fc fs fmax fmin fm k amp Top ti snr y ynoise ;
fmin=str2double(get(handles.txt_fmin,'string'))*1e6;
val3=get(handles.menu_data,'value');
if val3==1
    [y,ynoise,t]=gen_sig(fs,fc,amp,fm,k,fmin,fmax,Top,ti,snr,val);
end
val=get(handles.menu_signals,'value');
plot_time(y,ynoise,t,ax);

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



function txt_fcb_Callback(hObject, eventdata, handles)
% hObject    handle to txt_fcb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global val ax fc fs fmax fmin fm k amp Top ti snr y ynoise ;
fc=str2double(get(handles.txt_fcb,'string'))*1e6;
val3=get(handles.menu_data,'value');
if val3==1
    [y,ynoise,t]=gen_sig(fs,fc,amp,fm,k,fmin,fmax,Top,ti,snr,val);
end
val=get(handles.menu_signals,'value');
plot_time(y,ynoise,t,ax);
% Hints: get(hObject,'String') returns contents of txt_fcb as text
%        str2double(get(hObject,'String')) returns contents of txt_fcb as a double


% --- Executes during object creation, after setting all properties.
function txt_fcb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_fcb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_prib_Callback(hObject, eventdata, handles)
% hObject    handle to txt_prib (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global val ax fc fs fmax fmin fm k amp Top ti snr y ynoise ;
Top=str2double(get(handles.txt_prib,'string'))*1e-6;
val3=get(handles.menu_data,'value');
if val3==1
    [y,ynoise,t]=gen_sig(fs,fc,amp,fm,k,fmin,fmax,Top,ti,snr,val);
end
val=get(handles.menu_signals,'value');
plot_time(y,ynoise,t,ax);
% Hints: get(hObject,'String') returns contents of txt_prib as text
%        str2double(get(hObject,'String')) returns contents of txt_prib as a double


% --- Executes during object creation, after setting all properties.
function txt_prib_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_prib (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_amb_Callback(hObject, eventdata, handles)
% hObject    handle to txt_amb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global val ax fc fs fmax fmin fm k amp Top ti snr y ynoise ;
amp=str2double(get(handles.txt_amb,'string'));
val3=get(handles.menu_data,'value');
if val3==1
    [y,ynoise,t]=gen_sig(fs,fc,amp,fm,k,fmin,fmax,Top,ti,snr,val);
end
val=get(handles.menu_signals,'value');
plot_time(y,ynoise,t,ax);
% Hints: get(hObject,'String') returns contents of txt_amb as text
%        str2double(get(hObject,'String')) returns contents of txt_amb as a double


% --- Executes during object creation, after setting all properties.
function txt_amb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_amb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in menu_tib.
function menu_tib_Callback(hObject, eventdata, handles)
% hObject    handle to menu_tib (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns menu_tib contents as cell array
%        contents{get(hObject,'Value')} returns selected item from menu_tib
global val ax fc fs fmax fmin fm k amp Top ti snr y ynoise ;
val2=get(handles.menu_tib,'value');
switch val
  case 6

        if val2==1
        ti=5e-6;
        else
            ti=10e-6;
        end
    case 7
        if val2==1
        ti=7e-6;
        else
            ti=14e-6;
        end
    case 8
        if val2==1
        ti=11e-6;
        else
            ti=22e-6;
        end
    case 9
        if val2==1
            ti=13e-6;
        else
            ti=26e-6;
        end
end
val3=get(handles.menu_data,'value');
if val3==1
    [y,ynoise,t]=gen_sig(fs,fc,amp,fm,k,fmin,fmax,Top,ti,snr,val);
end
val=get(handles.menu_signals,'value');
plot_time(y,ynoise,t,ax);
% --- Executes during object creation, after setting all properties.
function menu_tib_CreateFcn(hObject, eventdata, handles)
% hObject    handle to menu_tib (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_snr2_Callback(hObject, eventdata, handles)
% hObject    handle to txt_snr2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_snr2 as text
%        str2double(get(hObject,'String')) returns contents of txt_snr2 as a double
global val ax fc fs fmax fmin fm k amp Top ti snr y ynoise ;
snr=str2double(get(handles.txt_snr2,'string'));
val3=get(handles.menu_data,'value');
if val3==1
    [y,ynoise,t]=gen_sig(fs,fc,amp,fm,k,fmin,fmax,Top,ti,snr,val);
end
val=get(handles.menu_signals,'value');
plot_time(y,ynoise,t,ax);

% --- Executes during object creation, after setting all properties.
function txt_snr2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_snr2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_snrb_Callback(hObject, eventdata, handles)
% hObject    handle to txt_snrb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global val ax fc fs fmax fmin fm k amp Top ti snr y ynoise ;
snr=str2double(get(handles.txt_snrb,'string'));
val3=get(handles.menu_data,'value');
if val3==1
    [y,ynoise,t]=gen_sig(fs,fc,amp,fm,k,fmin,fmax,Top,ti,snr,val);
end
val=get(handles.menu_signals,'value');
plot_time(y,ynoise,t,ax);
% Hints: get(hObject,'String') returns contents of txt_snrb as text
%        str2double(get(hObject,'String')) returns contents of txt_snrb as a double


% --- Executes during object creation, after setting all properties.
function txt_snrb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_snrb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_snr1_Callback(hObject, eventdata, handles)
% hObject    handle to txt_snr1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global val ax fc fs fmax fmin fm k amp Top ti snr y ynoise ;
snr=str2double(get(handles.txt_snr1,'string'));
val3=get(handles.menu_data,'value');
if val3==1
    [y,ynoise,t]=gen_sig(fs,fc,amp,fm,k,fmin,fmax,Top,ti,snr,val);
end
val=get(handles.menu_signals,'value');
plot_time(y,ynoise,t,ax);
% Hints: get(hObject,'String') returns contents of txt_snr1 as text
%        str2double(get(hObject,'String')) returns contents of txt_snr1 as a double


% --- Executes during object creation, after setting all properties.
function txt_snr1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_snr1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_snrlfm_Callback(hObject, eventdata, handles)
% hObject    handle to txt_snrlfm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_snrlfm as text
%        str2double(get(hObject,'String')) returns contents of txt_snrlfm as a double
global val ax fc fs fmax fmin fm k amp Top ti snr y ynoise ;
snr=str2double(get(handles.txt_snrlfm,'string'));
val3=get(handles.menu_data,'value');
if val3==1
    [y,ynoise,t]=gen_sig(fs,fc,amp,fm,k,fmin,fmax,Top,ti,snr,val);
end
val=get(handles.menu_signals,'value');
plot_time(y,ynoise,t,ax);

% --- Executes during object creation, after setting all properties.
function txt_snrlfm_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_snrlfm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_fchop_Callback(hObject, eventdata, handles)
% hObject    handle to txt_fchop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_fchop as text
%        str2double(get(hObject,'String')) returns contents of txt_fchop as a double


% --- Executes during object creation, after setting all properties.
function txt_fchop_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_fchop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_tihop_Callback(hObject, eventdata, handles)
% hObject    handle to txt_tihop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_tihop as text
%        str2double(get(hObject,'String')) returns contents of txt_tihop as a double


% --- Executes during object creation, after setting all properties.
function txt_tihop_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_tihop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_amphop_Callback(hObject, eventdata, handles)
% hObject    handle to txt_amphop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_amphop as text
%        str2double(get(hObject,'String')) returns contents of txt_amphop as a double


% --- Executes during object creation, after setting all properties.
function txt_amphop_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_amphop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_fspace_Callback(hObject, eventdata, handles)
% hObject    handle to txt_fspace (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_fspace as text
%        str2double(get(hObject,'String')) returns contents of txt_fspace as a double


% --- Executes during object creation, after setting all properties.
function txt_fspace_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_fspace (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_Nhops_Callback(hObject, eventdata, handles)
% hObject    handle to txt_Nhops (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_Nhops as text
%        str2double(get(hObject,'String')) returns contents of txt_Nhops as a double


% --- Executes during object creation, after setting all properties.
function txt_Nhops_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_Nhops (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_snrhop_Callback(hObject, eventdata, handles)
% hObject    handle to txt_snrhop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_snrhop as text
%        str2double(get(hObject,'String')) returns contents of txt_snrhop as a double


% --- Executes during object creation, after setting all properties.
function txt_snrhop_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_snrhop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in menu_costas.
function menu_costas_Callback(hObject, eventdata, handles)
% hObject    handle to menu_costas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns menu_costas contents as cell array
%        contents{get(hObject,'Value')} returns selected item from menu_costas


% --- Executes during object creation, after setting all properties.
function menu_costas_CreateFcn(hObject, eventdata, handles)
% hObject    handle to menu_costas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_timep_Callback(hObject, eventdata, handles)
% hObject    handle to txt_timep (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_timep as text
%        str2double(get(hObject,'String')) returns contents of txt_timep as a double


% --- Executes during object creation, after setting all properties.
function txt_timep_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_timep (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit43_Callback(hObject, eventdata, handles)
% hObject    handle to edit43 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit43 as text
%        str2double(get(hObject,'String')) returns contents of edit43 as a double


% --- Executes during object creation, after setting all properties.
function edit43_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit43 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit44_Callback(hObject, eventdata, handles)
% hObject    handle to edit44 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit44 as text
%        str2double(get(hObject,'String')) returns contents of edit44 as a double


% --- Executes during object creation, after setting all properties.
function edit44_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit44 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit45_Callback(hObject, eventdata, handles)
% hObject    handle to edit45 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit45 as text
%        str2double(get(hObject,'String')) returns contents of edit45 as a double


% --- Executes during object creation, after setting all properties.
function edit45_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit45 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit46_Callback(hObject, eventdata, handles)
% hObject    handle to edit46 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit46 as text
%        str2double(get(hObject,'String')) returns contents of edit46 as a double


% --- Executes during object creation, after setting all properties.
function edit46_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit46 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit47_Callback(hObject, eventdata, handles)
% hObject    handle to edit47 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit47 as text
%        str2double(get(hObject,'String')) returns contents of edit47 as a double


% --- Executes during object creation, after setting all properties.
function edit47_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit47 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit48_Callback(hObject, eventdata, handles)
% hObject    handle to edit48 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit48 as text
%        str2double(get(hObject,'String')) returns contents of edit48 as a double


% --- Executes during object creation, after setting all properties.
function edit48_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit48 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit49_Callback(hObject, eventdata, handles)
% hObject    handle to edit49 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit49 as text
%        str2double(get(hObject,'String')) returns contents of edit49 as a double


% --- Executes during object creation, after setting all properties.
function edit49_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit49 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_freqcw_Callback(hObject, eventdata, handles)
% hObject    handle to txt_freqcw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_freqcw as text
%        str2double(get(hObject,'String')) returns contents of txt_freqcw as a double


% --- Executes during object creation, after setting all properties.
function txt_freqcw_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_freqcw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_ampcw_Callback(hObject, eventdata, handles)
% hObject    handle to txt_ampcw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_ampcw as text
%        str2double(get(hObject,'String')) returns contents of txt_ampcw as a double


% --- Executes during object creation, after setting all properties.
function txt_ampcw_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_ampcw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit52_Callback(hObject, eventdata, handles)
% hObject    handle to edit52 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit52 as text
%        str2double(get(hObject,'String')) returns contents of edit52 as a double


% --- Executes during object creation, after setting all properties.
function edit52_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit52 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit53_Callback(hObject, eventdata, handles)
% hObject    handle to edit53 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit53 as text
%        str2double(get(hObject,'String')) returns contents of edit53 as a double


% --- Executes during object creation, after setting all properties.
function edit53_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit53 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit54_Callback(hObject, eventdata, handles)
% hObject    handle to edit54 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit54 as text
%        str2double(get(hObject,'String')) returns contents of edit54 as a double


% --- Executes during object creation, after setting all properties.
function edit54_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit54 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit55_Callback(hObject, eventdata, handles)
% hObject    handle to edit55 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit55 as text
%        str2double(get(hObject,'String')) returns contents of edit55 as a double


% --- Executes during object creation, after setting all properties.
function edit55_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit55 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit56_Callback(hObject, eventdata, handles)
% hObject    handle to edit56 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit56 as text
%        str2double(get(hObject,'String')) returns contents of edit56 as a double


% --- Executes during object creation, after setting all properties.
function edit56_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit56 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit57_Callback(hObject, eventdata, handles)
% hObject    handle to edit57 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit57 as text
%        str2double(get(hObject,'String')) returns contents of edit57 as a double


% --- Executes during object creation, after setting all properties.
function edit57_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit57 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit58_Callback(hObject, eventdata, handles)
% hObject    handle to edit58 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit58 as text
%        str2double(get(hObject,'String')) returns contents of edit58 as a double


% --- Executes during object creation, after setting all properties.
function edit58_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit58 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_maxfreq2_Callback(hObject, eventdata, handles)
% hObject    handle to txt_maxfreq2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_maxfreq2 as text
%        str2double(get(hObject,'String')) returns contents of txt_maxfreq2 as a double


% --- Executes during object creation, after setting all properties.
function txt_maxfreq2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_maxfreq2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_minfreq2_Callback(hObject, eventdata, handles)
% hObject    handle to txt_minfreq2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_minfreq2 as text
%        str2double(get(hObject,'String')) returns contents of txt_minfreq2 as a double


% --- Executes during object creation, after setting all properties.
function txt_minfreq2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_minfreq2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

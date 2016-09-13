function varargout = SteganographieGUI(varargin)
% STEGANOGRAPHIEGUI MATLAB code for SteganographieGUI.fig
%      STEGANOGRAPHIEGUI, by itself, creates a new STEGANOGRAPHIEGUI or raises the existing
%      singleton*.
%
%      H = STEGANOGRAPHIEGUI returns the handle to a new STEGANOGRAPHIEGUI or the handle to
%      the existing singleton*.
%
%      STEGANOGRAPHIEGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in STEGANOGRAPHIEGUI.M with the given input arguments.
%
%      STEGANOGRAPHIEGUI('Property','Value',...) creates a new STEGANOGRAPHIEGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SteganographieGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SteganographieGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text_pathImagePorteuse to modify the response to help SteganographieGUI

% Last Modified by GUIDE v2.5 07-Dec-2014 13:40:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SteganographieGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @SteganographieGUI_OutputFcn, ...
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


% --- Executes just before SteganographieGUI is made visible.
function SteganographieGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SteganographieGUI (see VARARGIN)

% Choose default command line output for SteganographieGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SteganographieGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SteganographieGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in bouton_dissimulerMessage.
function bouton_dissimulerMessage_Callback(hObject, eventdata, handles)
    messageADissimuler = get(handles.edit_message,'String');
    trameBin = messageChar2TrameBin(messageADissimuler);
    pathImagePorteuse = get(handles.text_pathImagePorteuse,'String');
    [fileName,path] = uiputfile('*.bmp','Sauvegarder l image modifié');
    pathImageModifiee = strcat(path,fileName);
    dissimulerTrameBinaireDansImage(pathImagePorteuse,trameBin,pathImageModifiee);

% --- Executes on button press in bouton_dissimulerFichierBinaire.
function bouton_dissimulerFichierBinaire_Callback(hObject, eventdata, handles)
    [fileName,path] = uigetfile('*.*','Choisir un fichier binaire à dissimuler dans limage porteuse');
    pathFichierBinaire = strcat(path,fileName);

    pathImagePorteuse = get(handles.text_pathImagePorteuse,'String');
    
    [fileName,path] = uiputfile('*.bmp','Sauvegarder l image modifié');
    pathImageModifiee = strcat(path,fileName);
    
    trameFichierBinaire = fileBin2trameBin(pathFichierBinaire);
    dissimulerTrameBinaireDansImage(pathImagePorteuse,trameFichierBinaire,pathImageModifiee);


% --- Executes on button press in bouton_extraireMessage.
function bouton_extraireMessage_Callback(hObject, eventdata, handles)
    pathImagePorteuse = get(handles.text_pathImagePorteuse,'String');
    trameBin = extraireTrameBinaireDuneImage(pathImagePorteuse);
    message = trameBin2messageChar(trameBin);
    set(handles.edit_message,'String',message);


% --- Executes on button press in bouton_extraireFichierBinaire.
function bouton_extraireFichierBinaire_Callback(hObject, eventdata, handles)
    [fileName,path] = uiputfile('*.*','Choisir le nom du fichier binaire à sauvegarder');
    pathFichierBinaire = strcat(path,fileName);

    pathImagePorteuse = get(handles.text_pathImagePorteuse,'String');

    trameFichierBin = extraireTrameBinaireDuneImage(pathImagePorteuse);
    trameBin2fileBin(trameFichierBin,pathFichierBinaire);


% --- Executes during object creation, after setting all properties.
function edit_message_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end


% --- Executes on button press in bouton_load.
function bouton_load_Callback(hObject, eventdata, handles)
    [fileName,path] = uigetfile({'*.jpg';'*.bmp'},'Choisir une image porteuse');
    pathImagePorteuse = strcat(path,fileName);
    set(handles.text_pathImagePorteuse,'String',pathImagePorteuse);

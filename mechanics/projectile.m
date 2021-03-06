function varargout = projectile(varargin)
% PROJECTILE M-file for projectile.fig
%      PROJECTILE, by itself, creates a new PROJECTILE or raises the existing
%      singleton*.
%
%      H = PROJECTILE returns the handle to a new PROJECTILE or the handle to
%      the existing singleton*.
%
%      PROJECTILE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECTILE.M with the given input arguments.
%
%      PROJECTILE('Property','Value',...) creates a new PROJECTILE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before projectile_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to projectile_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help projectile

% Last Modified by GUIDE v2.5 05-Feb-2010 15:31:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @projectile_OpeningFcn, ...
                   'gui_OutputFcn',  @projectile_OutputFcn, ...
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


% --- Executes just before projectile is made visible.
function projectile_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to projectile (see VARARGIN)

% Choose default command line output for projectile
handles.output = hObject;

handles.vel = get(handles.slider_vel,'Value');
set(handles.edit_vel,'String','1');
handles.angle = get(handles.slider_angle,'Value');
set(handles.edit_angle,'String','45');
handles.h = get(handles.slider_h,'Value');
set(handles.edit_h,'String','0');
set(handles.edit_R,'String',' ');
handles.R = 0;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes projectile wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = projectile_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider_vel_Callback(hObject, eventdata, handles)
% hObject    handle to slider_vel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

handles.vel = get(hObject,'Value');
set(handles.edit_vel,'String',num2str(handles.vel,3));
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function slider_vel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_vel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_angle_Callback(hObject, eventdata, handles)
% hObject    handle to slider_angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

handles.angle = get(hObject,'Value');
set(handles.edit_angle,'String',num2str(handles.angle,3));
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function slider_angle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_h_Callback(hObject, eventdata, handles)
% hObject    handle to slider_h (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

handles.h = get(hObject,'Value');
set(handles.edit_h,'String',num2str(handles.h,3));
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function slider_h_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_h (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function edit_R_Callback(hObject, eventdata, handles)
% hObject    handle to edit_R (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_R as text
%        str2double(get(hObject,'String')) returns contents of edit_R as a double

set(hObject,'String',num2str(handles.R,3));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function edit_R_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_R (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit_vel_Callback(hObject, eventdata, handles)
% hObject    handle to edit_vel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_vel as text
%        str2double(get(hObject,'String')) returns contents of edit_vel as a double

if isnan(str2double(get(hObject,'String')))
    errordlg('Velocity should be a positive number.','Number Error');
    set(hObject,'String',num2str(handles.vel));
elseif str2double(get(hObject,'String'))<=0
    errordlg('Velocity should be a positive number.','Number Error');
    set(hObject,'String',num2str(handles.vel));
else
    handles.vel = str2double(get(hObject,'String'));
end
set(handles.slider_vel,'Value',handles.vel);
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function edit_vel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_vel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit_angle_Callback(hObject, eventdata, handles)
% hObject    handle to edit_angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_angle as text
%        str2double(get(hObject,'String')) returns contents of edit_angle as a double

if isnan(str2double(get(hObject,'String')))
    errordlg('Angle should be a positive number.','Number Error');
    set(hObject,'String',num2str(handles.angle));
elseif str2double(get(hObject,'String'))<=0
    errordlg('Angle should be a positive number.','Number Error');
    set(hObject,'String',num2str(handles.angle));
else
    handles.angle = str2double(get(hObject,'String'));
end
set(handles.slider_angle,'Value',handles.angle);
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function edit_angle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit_h_Callback(hObject, eventdata, handles)
% hObject    handle to edit_h (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_h as text
%        str2double(get(hObject,'String')) returns contents of edit_h as a double

if isnan(str2double(get(hObject,'String')))
    errordlg('Height should be a number.','Number Error');
    set(hObject,'String',num2str(handles.h));
elseif str2double(get(hObject,'String'))<0
    errordlg('Height should be positive or zero.','Number Error');
    set(hObject,'String',num2str(handles.h));
else
    handles.h = str2double(get(hObject,'String'));
end
set(handles.slider_h,'Value',handles.h);
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function edit_h_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_h (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in push_go.
function push_go_Callback(hObject, eventdata, handles)
% hObject    handle to push_go (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% check velocity input
if isnan(str2double(get(handles.edit_vel,'String')))
    errordlg('Velocity should be a positive number.','Number Error');
    set(hObject,'String',num2str(handles.vel));
    return;
elseif str2double(get(handles.edit_vel,'String'))<=0
    errordlg('Velocity should be a positive number.','Number Error');
    set(handles.edit_vel,'String',num2str(handles.vel));
    return;
else
    handles.vel = str2double(get(handles.edit_vel,'String'));
end
set(handles.slider_vel,'Value',handles.vel);

% check angle input
if isnan(str2double(get(handles.edit_angle,'String')))
    errordlg('Angle should be a positive number.','Number Error');
    set(handles.edit_angle,'String',num2str(handles.angle));
    return;
elseif str2double(get(handles.edit_angle,'String'))<=0
    errordlg('Angle should be a positive number.','Number Error');
    set(handles.edit_angle,'String',num2str(handles.angle));
    return;
else
    handles.angle = str2double(get(handles.edit_angle,'String'));
end
set(handles.slider_angle,'Value',handles.angle);

% check height input
if isnan(str2double(get(handles.edit_h,'String')))
    errordlg('Height should be a number.','Number Error');
    set(handles.edit_h,'String',num2str(handles.h));
    return;
elseif str2double(get(handles.edit_h,'String'))<0
    errordlg('Height should be positive or zero.','Number Error');
    set(handles.edit_h,'String',num2str(handles.h));
    return;
else
    handles.h = str2double(get(handles.edit_h,'String'));
end
set(handles.slider_h,'Value',handles.h);

% everything ok, go ahead with simulation
set(handles.slider_vel,'enable','off');
set(handles.slider_angle,'enable','off');
set(handles.slider_h,'enable','off');
set(hObject,'enable','off');
set(handles.edit_R,'String',' ');
set(handles.edit_vel,'enable','off');
set(handles.edit_angle,'enable','off');
set(handles.edit_h,'enable','off');
set(handles.edit_R,'enable','off');

hold off;
theta = handles.angle*pi/180;
v_in = handles.vel;
h = handles.h;
v = v_in*[cos(theta) sin(theta)];
d_in = [0 handles.h];
g = 9.81;
a = [0 -g];
handles.R = (v_in^2*sin(theta)*cos(theta)+v_in*cos(theta)*sqrt((v_in*sin(theta))^2 + 2*g*h))/g;
t_peak = v_in*sin(theta)/g;
d_peak = d_in + v*t_peak + 0.5*a*t_peak^2;
t_down = sqrt((v_in*sin(theta))^2 + 2*g*h)/g;
t_final = t_peak+t_down;
t_step = t_final/50;
t = 0;
d = d_in + v*t + 0.5*a*t^2;
plot(d(1),d(2),'o','MarkerSize',5); 
hold on;
if (~handles.R && ~d_peak(1)) || ~d_peak(2)
    axis([0 1 0 1])
else
    axis([0 1.2*(max(handles.R,d_peak(1))) 0 1.2*d_peak(2)])
end
xlabel('Horizontal Distance (m)','fontsize',10,'fontweight','b');
ylabel('Vertical Distance (m)','fontsize',10,'fontweight','b');
hold on
for t = t_step:t_step:t_final
    d = d_in + v*t + 0.5*a*t^2;
    plot(d(1),d(2),'o','MarkerSize',5); 
    pause(0.01)
end

set(handles.edit_R,'String',num2str(handles.R,3));

set(handles.slider_vel,'enable','on');
set(handles.slider_angle,'enable','on');
set(handles.slider_h,'enable','on');
set(hObject,'enable','on');
set(handles.edit_vel,'enable','on');
set(handles.edit_angle,'enable','on');
set(handles.edit_h,'enable','on');
set(handles.edit_R,'enable','on');

guidata(hObject, handles);

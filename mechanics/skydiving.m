function varargout = skydiving(varargin)
% SKYDIVING M-file for skydiving.fig
%      SKYDIVING, by itself, creates a new SKYDIVING or raises the existing
%      singleton*.
%
%      H = SKYDIVING returns the handle to a new SKYDIVING or the handle to
%      the existing singleton*.
%
%      SKYDIVING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SKYDIVING.M with the given input arguments.
%
%      SKYDIVING('Property','Value',...) creates a new SKYDIVING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before skydiving_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to skydiving_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help skydiving

% Last Modified by GUIDE v2.5 24-Jan-2012 13:34:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @skydiving_OpeningFcn, ...
                   'gui_OutputFcn',  @skydiving_OutputFcn, ...
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


% --- Executes just before skydiving is made visible.
function skydiving_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to skydiving (see VARARGIN)

% Choose default command line output for skydiving
handles.output = hObject;

handles.time1 = str2num(get(handles.edit_time1,'String'));
handles.time2 = str2num(get(handles.edit_time2,'String'));
handles.height = 4000;

set(handles.edit_time1,'enable','on');
set(handles.edit_time2,'enable','on');
set(handles.push_go,'enable','on');
set(handles.text_landing,'String',' ');
set(handles.text_speed,'String',' ');

axis(handles.axes1,[0 40 0 50]);
axis(handles.axes2,[0 40 0 50]);
axis(handles.axes3,[0 40 0 50]);
set(get(handles.axes3,'XLabel'),'String','time (s)')
set(get(handles.axes1,'Title'),'String','Height (m)')
set(get(handles.axes2,'Title'),'String','Velocity (m/s)')
set(get(handles.axes3,'Title'),'String','Air Resistance (N)')

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes skydiving wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = skydiving_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit_time1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_time1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_time1 as text
%        str2double(get(hObject,'String')) returns contents of edit_time1 as a double

if isnan(str2double(get(hObject,'String')))
    errordlg('Time should be a positive number.','Number Error');
    set(hObject,'String',num2str(handles.time1));
elseif str2double(get(hObject,'String'))<=0
    errordlg('Time should be a positive number.','Number Error');
    set(hObject,'String',num2str(handles.time1));
else
    handles.time1 = str2double(get(hObject,'String'));
end
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function edit_time1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_time1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_time2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_time2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_time2 as text
%        str2double(get(hObject,'String')) returns contents of edit_time2 as a double

if isnan(str2double(get(hObject,'String')))
    errordlg('Time should be a positive number.','Number Error');
    set(hObject,'String',num2str(handles.time2));
elseif str2double(get(hObject,'String'))<=0
    errordlg('Time should be a positive number.','Number Error');
    set(hObject,'String',num2str(handles.time2));
else
    handles.time2 = str2double(get(hObject,'String'));
end
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function edit_time2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_time2 (see GCBO)
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

if isnan(str2double(get(handles.edit_time1,'String')))
    errordlg('Time should be a positive number.','Number Error');
    set(handles.edit_time1,'String',num2str(handles.time1));
    return;
elseif str2double(get(handles.edit_time1,'String'))<=0
    errordlg('Time should be a positive number.','Number Error');
    set(handles.edit_time1,'String',num2str(handles.time1));
    return;
else
    handles.time1 = str2double(get(handles.edit_time1,'String'));
end

if isnan(str2double(get(handles.edit_time2,'String')))
    errordlg('Time should be a positive number.','Number Error');
    set(handles.edit_time2,'String',num2str(handles.time2));
    return;
elseif str2double(get(handles.edit_time2,'String'))<=0
    errordlg('Time should be a positive number.','Number Error');
    set(handles.edit_time2,'String',num2str(handles.time2));
    return;
else
    handles.time2 = str2double(get(handles.edit_time2,'String'));
end

if handles.time2<=handles.time1
    errordlg('Phase 3 has to start after phase 2!','Timing Error');
    return;
end

set(handles.edit_time1,'enable','off');
set(handles.edit_time2,'enable','off');
set(hObject,'enable','off');
set(handles.text_landing,'String',' ');


[time,fall,vel,F_air] = free_fall2(handles.time1,handles.time2,handles.height);

hold(handles.axes1,'off');
hold(handles.axes2,'off');
hold(handles.axes3,'off');

plot(handles.axes1,0,0); 
plot(handles.axes2,0,0);
plot(handles.axes3,0,0); 

set(get(handles.axes3,'XLabel'),'String','time (s)')
set(get(handles.axes1,'Title'),'String','Height (m)')
set(get(handles.axes2,'Title'),'String','Velocity (m/s)')
set(get(handles.axes3,'Title'),'String','Air Resistance (N)')

hold(handles.axes1,'on');
hold(handles.axes2,'on');
hold(handles.axes3,'on');

axis(handles.axes1,[0 time(end) 0 handles.height]);
axis(handles.axes2,[0 time(end) min(vel) 0]);
axis(handles.axes3,[0 time(end) 0 max(F_air)]);

for i = 1:length(time)
    plot(handles.axes1,time(i),fall(i),'bo'); 
    plot(handles.axes2,time(i),vel(i),'bo');
    plot(handles.axes3,time(i),F_air(i),'bo'); 
    pause(0.01)
end

measure_vel = vel(fall<2700 & fall>1700);
speed = abs(mean(measure_vel));
set(handles.text_speed,'String',num2str(speed));

if vel(end)<-10
    set(handles.text_landing,'String','Too high!');
else
    set(handles.text_landing,'String','OK!');
end

hold(handles.axes1,'off');
hold(handles.axes2,'off');
hold(handles.axes3,'off');

set(handles.edit_time1,'enable','on');
set(handles.edit_time2,'enable','on');
set(hObject,'enable','on');

guidata(hObject, handles);


function [time,height,vel,F_air] = free_fall2(time1,time2,height)

m = 70;
g = 9.81;

options = odeset('RelTol',1e-2,'AbsTol',[1e-2 1e-2],'NonNegative',1);

a0 = [height 0];
drag_constant1 = 0.1;
[T,Y] = ode45(@eq_motion,[0 time1],a0,options,drag_constant1,m,g);
Air = drag_constant1*(Y(:,2).^2);

ground = find(Y(:,1)==0,1,'first');

if ~isempty(ground)
    % return variables
    time = T(1:ground);
    height = Y(1:ground,1);
    vel = Y(1:ground,2);
    F_air = Air(1:ground);
    return;
end

a0 = [Y(end,1) Y(end,2)];
drag_constant2 = 0.2;
[T2,Y2] = ode45(@eq_motion,[time1 time2],a0,options,drag_constant2,m,g);
Air2 = drag_constant2*(Y2(:,2).^2);

ground = find(Y2(:,1)==0,1,'first');

if ~isempty(ground)
    % return variables
    time = [T; T2(1:ground)];
    height = [Y(:,1); Y2(1:ground,1)];
    vel = [Y(:,2); Y2(1:ground,2)];
    F_air = [Air; Air2(1:ground)];
    return;
end

a0 = [Y2(end,1) Y2(end,2)];
drag_constant3 = 10;

ok=1;
times = 1;
while ok
    times = times*10;
    [T3,Y3] = ode45(@eq_motion,[time2 times*time2],a0,options,drag_constant3,m,g);
    Air3 = drag_constant3*(Y3(:,2).^2);
    ground = find(Y3(:,1)==0,1,'first');
    if ~isempty(ground), ok=0; end
end

% return variables
time = [T; T2; T3(1:ground)];
height = [Y(:,1); Y2(:,1); Y3(1:ground,1)];
vel = [Y(:,2); Y2(:,2); Y3(1:ground,2)];
F_air = [Air; Air2; Air3(1:ground)];


function dy = eq_motion(t,y,drag_constant,m,g)
% the equations of motion for free fall in the presence of air resistance
dy = zeros(2,1);    % a column vector
dy(1) = y(2);
dy(2) = (drag_constant/m)*y(2)^2-g;

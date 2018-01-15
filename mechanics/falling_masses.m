function varargout = falling_masses(varargin)
% FALLING_MASSES M-file for falling_masses.fig
%      FALLING_MASSES, by itself, creates a new FALLING_MASSES or raises the existing
%      singleton*.
%
%      H = FALLING_MASSES returns the handle to a new FALLING_MASSES or the handle to
%      the existing singleton*.
%
%      FALLING_MASSES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FALLING_MASSES.M with the given input arguments.
%
%      FALLING_MASSES('Property','Value',...) creates a new FALLING_MASSES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before falling_masses_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to falling_masses_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help falling_masses

% Last Modified by GUIDE v2.5 24-Jan-2012 10:49:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @falling_masses_OpeningFcn, ...
                   'gui_OutputFcn',  @falling_masses_OutputFcn, ...
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


% --- Executes just before falling_masses is made visible.
function falling_masses_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to falling_masses (see VARARGIN)

% Choose default command line output for falling_masses
handles.output = hObject;

handles.mass1 = str2num(get(handles.edit_mass1,'String'));
handles.mass2 = str2num(get(handles.edit_mass2,'String'));
handles.height = str2num(get(handles.edit_height,'String'));
handles.air = get(handles.check_air,'Value');

set(handles.edit_mass1,'enable','on');
set(handles.edit_mass2,'enable','on');
set(handles.edit_height,'enable','on');
set(handles.check_air,'enable','on');
set(handles.push_go,'enable','on');

axis(handles.axes1,[0 10 0 50]);
axis(handles.axes2,[0 10 0 50]);
axis(handles.axes3,[0 10 0 50]);
set(get(handles.axes1,'XLabel'),'String','time (s)')
set(get(handles.axes2,'XLabel'),'String','time (s)')
set(get(handles.axes3,'XLabel'),'String','time (s)')
set(get(handles.axes1,'Title'),'String','Height (m)')
set(get(handles.axes2,'Title'),'String','Velocity (m/s)')
set(get(handles.axes3,'Title'),'String','Air Resistance (N)')

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes falling_masses wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = falling_masses_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit_mass1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_mass1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_mass1 as text
%        str2double(get(hObject,'String')) returns contents of edit_mass1 as a double

if isnan(str2double(get(hObject,'String')))
    errordlg('Mass should be a positive number.','Number Error');
    set(hObject,'String',num2str(handles.mass1));
elseif str2double(get(hObject,'String'))<=0
    errordlg('Mass should be a positive number.','Number Error');
    set(hObject,'String',num2str(handles.mass1));
else
    handles.mass1 = str2double(get(hObject,'String'));
end
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function edit_mass1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_mass1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_mass2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_mass2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_mass2 as text
%        str2double(get(hObject,'String')) returns contents of edit_mass2 as a double

if isnan(str2double(get(hObject,'String')))
    errordlg('Mass should be a positive number.','Number Error');
    set(hObject,'String',num2str(handles.mass2));
elseif str2double(get(hObject,'String'))<=0
    errordlg('Mass should be a positive number.','Number Error');
    set(hObject,'String',num2str(handles.mass2));
else
    handles.mass2 = str2double(get(hObject,'String'));
end
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function edit_mass2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_mass2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit_height_Callback(hObject, eventdata, handles)
% hObject    handle to edit_height (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_height as text
%        str2double(get(hObject,'String')) returns contents of edit_height as a double

if isnan(str2double(get(hObject,'String')))
    errordlg('Height should be a positive number.','Number Error');
    set(hObject,'String',num2str(handles.height));
elseif str2double(get(hObject,'String'))<=0
    errordlg('Height should be a positive number.','Number Error');
    set(hObject,'String',num2str(handles.height));
else
    handles.height = str2double(get(hObject,'String'));
end
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function edit_height_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_height (see GCBO)
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

if isnan(str2double(get(handles.edit_mass1,'String')))
    errordlg('Mass should be a positive number.','Number Error');
    set(handles.edit_mass1,'String',num2str(handles.mass1));
    return;
elseif str2double(get(handles.edit_mass1,'String'))<=0
    errordlg('Mass should be a positive number.','Number Error');
    set(handles.edit_mass1,'String',num2str(handles.mass1));
    return;
else
    handles.mass1 = str2double(get(handles.edit_mass1,'String'));
end

if isnan(str2double(get(handles.edit_mass2,'String')))
    errordlg('Mass should be a positive number.','Number Error');
    set(handles.edit_mass2,'String',num2str(handles.mass2));
    return;
elseif str2double(get(handles.edit_mass2,'String'))<=0
    errordlg('Mass should be a positive number.','Number Error');
    set(handles.edit_mass2,'String',num2str(handles.mass2));
    return;
else
    handles.mass2 = str2double(get(handles.edit_mass2,'String'));
end

if isnan(str2double(get(handles.edit_height,'String')))
    errordlg('Height should be a positive number.','Number Error');
    set(handles.edit_height,'String',num2str(handles.height));
    return;
elseif str2double(get(handles.edit_height,'String'))<=0
    errordlg('Height should be a positive number.','Number Error');
    set(handles.edit_height,'String',num2str(handles.height));
    return;
else
    handles.height = str2double(get(handles.edit_height,'String'));
end

set(handles.edit_mass1,'enable','off');
set(handles.edit_mass2,'enable','off');
set(handles.edit_height,'enable','off');
set(handles.check_air,'enable','off');
set(hObject,'enable','off');

[time1,fall1,vel1,F_air1] = free_fall(handles.mass1,handles.height,handles.air);
[time2,fall2,vel2,F_air2] = free_fall(handles.mass2,handles.height,handles.air);

if length(time1)>length(time2)
    time = time1;
    fall2 = [fall2 zeros(1,length(fall1)-length(fall2))];
    vel2 = [vel2 NaN*ones(1,length(vel1)-length(vel2))];
    F_air2 = [F_air2 NaN*ones(1,length(F_air1)-length(F_air2))];
else
    time = time2;
    fall1 = [fall1 zeros(1,length(fall2)-length(fall1))];
    vel1 = [vel1 NaN*ones(1,length(vel2)-length(vel1))];
    F_air1 = [F_air1 NaN*ones(1,length(F_air2)-length(F_air1))];
end

hold(handles.axes1,'off');
hold(handles.axes2,'off');
hold(handles.axes3,'off');

plot(handles.axes1,0,0); 
plot(handles.axes2,0,0);
plot(handles.axes3,0,0); 

set(get(handles.axes1,'XLabel'),'String','time (s)')
set(get(handles.axes2,'XLabel'),'String','time (s)')
set(get(handles.axes3,'XLabel'),'String','time (s)')
set(get(handles.axes1,'Title'),'String','Height (m)')
set(get(handles.axes2,'Title'),'String','Velocity (m/s)')
set(get(handles.axes3,'Title'),'String','Air Resistance (N)')

hold(handles.axes1,'on');
hold(handles.axes2,'on');
hold(handles.axes3,'on');

axis(handles.axes1,[0 time(end) 0 handles.height]);
axis(handles.axes2,[0 time(end) -max([vel1 vel2]) 0]);
if handles.air
    axis(handles.axes3,[0 time(end) 0 max([F_air1 F_air2])]);
else
    axis(handles.axes3,[0 time(end) 0 1]);
end

if handles.air && handles.mass1~=handles.mass2
    for i = 1:length(time)
        plot(handles.axes1,time(i),fall1(i),'bo',time(i),fall2(i),'ro'); 
        plot(handles.axes2,time(i),-vel1(i),'bo',time(i),-vel2(i),'ro');
        plot(handles.axes3,time(i),F_air1(i),'bo',time(i),F_air2(i),'ro'); 
        pause(0.01)
    end
else
    for i = 1:length(time)
        plot(handles.axes1,time(i),fall1(i),'o','MarkerEdgeColor',[160 92 240]/256); 
        plot(handles.axes2,time(i),-vel1(i),'o','MarkerEdgeColor',[160 92 240]/256);
        plot(handles.axes3,time(i),F_air1(i),'o','MarkerEdgeColor',[160 92 240]/256); 
        pause(0.01)
    end
end

hold(handles.axes1,'off');
hold(handles.axes2,'off');
hold(handles.axes3,'off');

set(handles.edit_mass1,'enable','on');
set(handles.edit_mass2,'enable','on');
set(handles.edit_height,'enable','on');
set(handles.check_air,'enable','on');
set(hObject,'enable','on');

guidata(hObject, handles);


% --- Executes on button press in check_air.
function check_air_Callback(hObject, eventdata, handles)
% hObject    handle to check_air (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of check_air
handles.air = get(hObject,'Value');
guidata(hObject, handles);


function [time,fall,vel,F_air] = free_fall(m,height,air_res)

g = 9.81;
if air_res
    drag_constant = 0.001;
    terminal_vel = sqrt(m*g/drag_constant);
    new_fall = height;
    new_time = 0.1;
    time=[];
    fall=[];
    while new_fall>=0    
        time = [time new_time];
        fall = [fall new_fall];
        new_time = new_time+0.1;
        new_fall = height - terminal_vel^2/g*log(cosh(g*new_time/terminal_vel));
    end
    vel = terminal_vel*tanh(g*time/terminal_vel);
    F_air = drag_constant*vel.^2;
else
    final_time = sqrt(2*height/g);
    time = 0.1:0.1:final_time;
    vel = g*time;
    fall = height - g*time.^2;
    F_air = zeros(size(time));
end

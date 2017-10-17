function varargout = Ogawa(varargin)
% OGAWA MATLAB code for Ogawa.fig
%      OGAWA, by itself, creates a new OGAWA or raises the existing
%      singleton*.
%
%      H = OGAWA returns the handle to a new OGAWA or the handle to
%      the existing singleton*.
%
%      OGAWA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OGAWA.M with the given input arguments.
%
%      OGAWA('Property','Value',...) creates a new OGAWA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Ogawa_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Ogawa_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Ogawa

% Last Modified by GUIDE v2.5 16-Oct-2017 19:40:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @Ogawa_OpeningFcn, ...
    'gui_OutputFcn',  @Ogawa_OutputFcn, ...
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


% --- Executes just before Ogawa is made visible.
function Ogawa_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Ogawa (see VARARGIN)

% Choose default command line output for Ogawa
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Ogawa wait for user response (see UIRESUME)
% uiwait(handles.figure1);

%hide axes on video feeds
axes(handles.axes1);
set(gca,'xtick',[],'ytick',[])
box(handles.axes1,'on');
%try axes borders
%box(handles.axes1,'on');
try
    %reload variables if exist
    load('settings')
    
    set(handles.edit1,'String',base_address);
    set(handles.edit2,'String',x_v_step);
    set(handles.edit3,'String',x_positions);
    set(handles.edit4,'String',x_steps);
    set(handles.edit5,'String',x_step_size);
    set(handles.edit6,'String',y_steps);
    set(handles.edit7,'String',y_step_size);
    set(handles.edit8,'String',cells_to_sort);
    set(handles.checkbox1,'Value', checkbox_status);
    set(handles.figure1, 'position',window_location);
catch
end


% --- Outputs from this function are returned to the command line.
function varargout = Ogawa_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double
val1 = str2num(get(handles.edit2,'String'));
if isnumeric(val1) == 0 || isreal(val1) == 0 || isempty(val1) == 1
    set(handles.edit2,'String',5);
    waitfor(msgbox('Percentage needs to be between 1-50%, reverting to default','Value error', 'modal'))
elseif  val1 <= 0 || val1 > 50
    set(handles.edit2,'String',5);
    waitfor(msgbox('Percentage needs to be between 1-50%, reverting to default', 'Value error', 'modal'))
end


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double
val1 = str2num(get(handles.edit3,'String'));
if isnumeric(val1) == 0 || isreal(val1) == 0 || isempty(val1) == 1
    set(handles.edit3,'String',5);
    waitfor(msgbox('This value needs to be higher than 0 and lower than ~1000','Value error', 'modal'))
elseif  val1 <= 0 || val1 > 1000
    set(handles.edit3,'String',5);
    waitfor(msgbox('This value needs to be higher than 0 and lower than ~1000', 'Value error', 'modal'))
end

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


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double
val1 = str2num(get(handles.edit4,'String'));
if isnumeric(val1) == 0 || isreal(val1) == 0 || isempty(val1) == 1
    set(handles.edit4,'String',5);
    waitfor(msgbox('This value needs to be higher than 0 and much lower than ~1000','Value error', 'modal'))
elseif  val1 <= 0 || val1 > 1000
    set(handles.edit4,'String',5);
    waitfor(msgbox('This value needs to be higher than 0 and much lower than ~1000', 'Value error', 'modal'))
end

% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double

val1 = str2num(get(handles.edit5,'String'));
if isnumeric(val1) == 0 || isreal(val1) == 0 || isempty(val1) == 1
    set(handles.edit5,'String',500);
    waitfor(msgbox('This value needs to be higher than 0 and lower than ~10000 to prevent too large a movement','Value error', 'modal'))
elseif  val1 <= 0 || val1 > 10000
    set(handles.edit5,'String',500);
    waitfor(msgbox('This value needs to be higher than 0 much lower than ~10000 to prevent too large a movement', 'Value error', 'modal'))
end

% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider5_Callback(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double
val1 = str2num(get(handles.edit6,'String'));
if isnumeric(val1) == 0 || isreal(val1) == 0 || isempty(val1) == 1
    set(handles.edit6,'String',5);
    waitfor(msgbox('This value needs to be higher than 0 and much lower than ~1000 to prevent too many steps','Value error', 'modal'))
elseif  val1 <= 0 || val1 > 1000
    set(handles.edit6,'String',5);
    waitfor(msgbox('This value needs to be higher than 0 and much lower than ~1000 to prevent too many steps', 'Value error', 'modal'))
end


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider6_Callback(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double

val1 = str2num(get(handles.edit7,'String'));
if isnumeric(val1) == 0 || isreal(val1) == 0 || isempty(val1) == 1
    set(handles.edit7,'String',500);
    waitfor(msgbox('This value needs to be higher than 0 and lower than ~10000 to prevent too large a movement','Value error', 'modal'))
elseif  val1 <= 0 || val1 > 10000
    set(handles.edit7,'String',500);
    waitfor(msgbox('This value needs to be higher than 0 much lower than ~10000 to prevent too large a movement', 'Value error', 'modal'))
end

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


% --- Executes on slider movement.
function slider7_Callback(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double

val1 = str2num(get(handles.edit8,'String'));
if isnumeric(val1) == 0 || isreal(val1) == 0 || isempty(val1) == 1
    set(handles.edit8,'String',1);
    waitfor(msgbox('This value needs to be an integer higher than 0 and lower than 1000 to prevent many cells being sorted','Value error', 'modal'))
elseif  val1 <= 0 || val1 > 1000
    set(handles.edit8,'String',1);
    waitfor(msgbox('This value needs to be an integer higher than 0 and lower than 1000 to prevent many cells being sorted', 'Value error', 'modal'))
end

% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Get variables
base_address = get(handles.edit1,'String');
x_v_step = get(handles.edit2,'String');
x_positions = get(handles.edit3,'String');
x_steps= get(handles.edit4,'String');
x_step_size = get(handles.edit5,'String');
y_steps = get(handles.edit6,'String');
y_step_size = get(handles.edit7,'String');
cells_to_sort = get(handles.edit8,'String');

%if start button is activated
if strcmp(get(handles.pushbutton1,'String'),'Start!');
    
    %Disable all buttons
    set(findall(handles.GroupBox1, '-property', 'enable'), 'enable', 'off');
    
    %drawnow
    drawnow()
    
    %Check whether Utopex is online
    try
        %test any directory page on utopex
        webread(strcat(base_address,'firmware/sort-cfg/piezo'));
        
        %update buttons
        set(handles.status1, 'String', 'Connected!');
        set(handles.status2, 'String', 'Sorting...');
        set(handles.pushbutton1, 'String', 'Stop!');
        
        
        %update display
        drawnow()
        
    catch
        %msgbox
        waitfor(msgbox('No Utopex server detected! Please check your connection...', 'Error connecting!'));
        
        %update buttons
        set(handles.status1, 'String', 'Disconnected!');
        set(handles.status2, 'String', 'Try again...');
        set(handles.pushbutton1,'String','Start!');
        
        
        %reenable buttons
        set(findall(handles.GroupBox1, '-property', 'enable'), 'enable', 'on');
        
        %stop command
        return
        
    end
    
    %reset dot preview & 3D axes
    axes(handles.axes1);
    cla
    axis on
    hold(handles.axes1,'on');
    %populate grid with dots according to size
    [base_plot_x, base_plot_y] = meshgrid(1:str2double(x_positions),1:str2double(y_steps));
    plot(base_plot_x,base_plot_y,'bo','MarkerFaceColor','b');
    %blanks in corner
    plot(0,0,'ko','MarkerFaceColor','k')
    plot((str2double(x_positions)+1),0,'ko','MarkerFaceColor','k')
    plot(0,(str2double(y_steps)+1),'ko','MarkerFaceColor','k')
    plot((str2double(x_positions)+1),(str2double(y_steps)+1),'ko','MarkerFaceColor','k')
    axis(handles.axes1,'tight');
    
        %get starting X & Y position
        x_home = webread(strcat(base_address,'stepper/motor2/position'));
        set(handles.xhome,'String',x_home);
        y_home = webread(strcat(base_address,'stepper/motor1/position'));
        set(handles.yhome,'String',y_home);
        
        %get starting deflection voltage
        orig_defl_v = webread(strcat(base_address,'cytometer/sort-bucket1/deflection'));
        set(handles.xdv,'String',orig_defl_v);

        
        
    set(handles.baseline,'String','yes');
    
    
    
    %activate button
    set(handles.pushbutton1,'Enable','on');
    drawnow();
    
    %actual sort
    
    for L_x_steps = 1:1:str2double(x_steps)
        % Update handles structure and check for stop
        if strcmp(get(handles.pushbutton1,'String'),'Start!')
            return
        end
        %move stepper to new position
        webread(strcat(base_address,'stepper/motor2/position/',num2str((str2double(x_home)+((L_x_steps-1)*str2double(x_step_size))))));
        %wait for stepper
        completed_x_stepper = 0;
        while (completed_x_stepper == 0)
            completed_x_stepper = str2double(webread(strcat(base_address,'stepper/motor2/ready')));
            pause(0.01);
        end
        
        %populate grid with dots according to size
        [base_plot_x, base_plot_y] = meshgrid(1:str2double(x_positions),1:str2double(y_steps));
        plot(base_plot_x,base_plot_y,'bo','MarkerFaceColor','b');
        
        
        
        for L_y_steps = 1:1:str2double(y_steps)
            % Update handles structure and check for stop
            if strcmp(get(handles.pushbutton1,'String'),'Start!')
                return
            end
            %move stepper to new position
            webread(strcat(base_address,'stepper/motor1/position/',num2str((str2double(y_home)+((L_y_steps-1)*str2double(y_step_size))))));
            %wait for stepper
            completed_y_stepper = 0;
            while (completed_y_stepper == 0)
                completed_y_stepper = str2double(webread(strcat(base_address,'stepper/motor2/ready')));
                pause(0.01);
            end
            
            
            for L_x_positions = 1:1:str2double(x_positions)
                % Update handles structure and check for stop
                if strcmp(get(handles.pushbutton1,'String'),'Start!')
                    return
                end
                %calculate current deflection voltage & set
                L_x_v_step = str2double(orig_defl_v) - ((L_x_positions-1)*(str2double(x_v_step)/100));
                webread(strcat(base_address,'cytometer/sort-bucket1/deflection/', num2str(L_x_v_step)));
                
                %Display options
                set(handles.status1, 'String', 'Sorting');
                set(handles.status2, 'String', strcat('X,Y,V,C = ',num2str(L_x_steps),',',(num2str(L_y_steps)),',',num2str(L_x_positions),',1'));
                %Update display blue to orange for waiting
                plot(((str2double(x_positions)-L_x_positions+1)),L_y_steps,'yo','MarkerFaceColor','y');
                
                %Sort - set limit
                webread(strcat(base_address,'cytometer/sort-bucket1/limit/',cells_to_sort));
                %Sort - pause is disabled
                webread(strcat(base_address,'cytometer/sort-bucket1/pause/0'));
                %Sort - how many remaining
                completed_query = webread(strcat(base_address,'cytometer/sort-bucket1/remaining'));
                %wait for number of cells to sort to complete
                while strcmp(completed_query, '0') == 0
                    pause(0.01);
                    set(handles.status2, 'String', strcat('X,Y,V,C = ',num2str(L_x_steps),',',(num2str(L_y_steps)),',',num2str(L_x_positions),',',num2str(1+(str2double(cells_to_sort)-str2double(completed_query)))));
                    completed_query = webread(strcat(base_address,'cytometer/sort-bucket1/remaining'));
                    drawnow()
                end
                
                %make dot red
                plot(((str2double(x_positions)-L_x_positions+1)),L_y_steps,'ro','MarkerFaceColor','r');
                
            end
        end
    end
    
    %Finished sort
    set(handles.status1, 'String', 'Sort completed!');
    
    
    
    %return stage to original position if requested
    if get(handles.checkbox1,'Value') == 1
        
        %notice
        set(handles.status2, 'String', 'Returning stage home.');
        %return stages home
        completed_x_stepper = webread(strcat(base_address,'stepper/motor2/position/',x_home));
        completed_y_stepper = webread(strcat(base_address,'stepper/motor1/position/',y_home));
        %wait until complete
        while ((str2double(completed_x_stepper) == 0) || (str2double(completed_y_stepper) == 0))
            completed_x_stepper = str2double(webread(strcat(base_address,'stepper/motor2/ready')));
            completed_y_stepper = str2double(webread(strcat(base_address,'stepper/motor1/ready')));
            pause(0.01);
        end
    end
    %deflection to original voltage
    webread(strcat(base_address,'cytometer/sort-bucket1/deflection/', orig_defl_v));
    
    %complete notice
    set(handles.status1, 'String', 'Finished!');
    set(handles.status2, 'String', 'Ready!');
    
    %reenable buttons
    set(findall(handles.GroupBox1, '-property', 'enable'), 'enable', 'on');
    set(handles.pushbutton1,'String','Start!');
else
    %if stop button is activated
    
    %update buttons
    set(handles.pushbutton1,'Enable','off');
    set(handles.status1, 'String', 'Sort stopped!');
    drawnow()
    
    if strcmp(get(handles.baseline,'String'),'yes')
    
    %deflection to original voltage
    webread(strcat(base_address,'cytometer/sort-bucket1/deflection/', get(handles.xdv,'String')));
    %return stage to original position if requested
    if get(handles.checkbox1,'Value') == 1
        completed_x_stepper = webread(strcat(base_address,'stepper/motor2/position/',get(handles.xhome,'String')));
        completed_y_stepper = webread(strcat(base_address,'stepper/motor1/position/',get(handles.yhome,'String')));
        %wait until complete
        while ((str2double(completed_x_stepper) == 0) || (str2double(completed_y_stepper) == 0))
            completed_x_stepper = str2double(webread(strcat(base_address,'stepper/motor2/ready')));
            completed_y_stepper = str2double(webread(strcat(base_address,'stepper/motor1/ready')));
            pause(0.01);
        end
    end
    end
    %update buttons
    set(handles.status2, 'String', 'Try again...');
    set(handles.pushbutton1,'String','Start!');
    
    %reenable buttons
    set(findall(handles.GroupBox1, '-property', 'enable'), 'enable', 'on');
    
    
    %terminate existing button
    return
end



% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



% --- Executes on slider movement.
function slider8_Callback(hObject, eventdata, handles)
% hObject    handle to slider8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%save variables for next time to .mat file
%Get variables
base_address = get(handles.edit1,'String');
x_v_step = get(handles.edit2,'String');
x_positions = get(handles.edit3,'String');
x_steps= get(handles.edit4,'String');
x_step_size = get(handles.edit5,'String');
y_steps = get(handles.edit6,'String');
y_step_size = get(handles.edit7,'String');
cells_to_sort = get(handles.edit8,'String');
checkbox_status = get(handles.checkbox1,'Value');
window_location = get(handles.figure1, 'position');

save('settings', 'base_address','x_v_step','x_positions','x_steps','x_step_size','y_steps','y_step_size','cells_to_sort','checkbox_status','window_location');



% Hint: delete(hObject) closes the figure
delete(hObject);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

waitfor(msgbox({'Ogawa can be used to sort high density grids very quickly. The app uses the ROI of sort-bucket 1. This means that you need to have selected a ROI to sort and have placed it in the left most population to sort in the sort layout window in Sortware. The app moves the deflected stream in increments subtracting the voltage, i.e. the stream will move in increments to the left once started, followed by down in the Y direction, and subsequently in the X direction if chosen.';'';'(1) Have Sortware connected, and acquiring data.'; '(2) Ensure you have selected the population that you want sorted as the left most population to be sorted in the sort layout.';'(3) Adjust the stream deflection voltage to be where you want the first drop to go. The next drop will go left of this.';'(4) Configure sort grid as desired in the Ogawa window.';'(5)*Only necesary if instrument has not sorted anything since power on. Only done once!* Click Sort to begin the sort and then stop the sort. This initialises the sort bucket and enables the stream.',;,'Click start to begin!.';'(6) The app will start sorting the x direction by changing stream deflection voltages, followed by moving in the Y direction, followed by moving in the x direction by the number in the step size box.';'(7) Once completed it will stop sorting.',;,;'';'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE'},'Readme', 'modal'));

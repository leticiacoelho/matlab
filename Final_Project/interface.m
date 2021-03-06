function varargout = interface(varargin)

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @interface_OpeningFcn, ...
                   'gui_OutputFcn',  @interface_OutputFcn, ...
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


% --- Executes just before interface is made visible.
function interface_OpeningFcn(hObject, eventdata, handles, varargin)
    handles.f = 0;
    handles.t = 0;
    handles.v = [0];
    handles.f_nomes = [0];
    handles.matrix = [0 0];
    handles.output = hObject;
    handles.st = struct('nome','','valor','','pagamentos','');
    guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = interface_OutputFcn(hObject, eventdata, handles) 
    varargout{1} = handles.output;


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles) 
    s = size(handles.matrix);
    for v = handles.matrix
           v_nome = [handles.st.nome handles.st.nome]
    end  
    f = handles.f; %Nome
    f_nomes = handles.f; %Nome
    t = handles.t; % Valor pago
    v = handles.v;  % Vetor de pagamento  
    handles.v = [v t];
    new_Struct = struct('nome',f,'valor',t,'pagamentos',handles.v);
    handles.st = [handles.st new_Struct];
    guidata(hObject, handles);

function edit1_Callback(hObject, eventdata, handles)
    handles.f = handles.edit1.String
    for v = handles.f_nomes
        if(handles.f == v)
            handles.f_nomes = handles.f;
        else
            handles.f_nomes = [handles.f_nomes handles.f];
        end
    end    
    guidata(hObject, handles);
         
function edit1_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
function edit2_Callback(hObject, eventdata, handles)
    handles.t = str2num(handles.edit2.String);
    guidata(hObject, handles);
    
function edit2_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

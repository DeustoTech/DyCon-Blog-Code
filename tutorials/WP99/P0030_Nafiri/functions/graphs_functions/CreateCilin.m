function [isurf,R,T,H] = CreateCilin(x1,x2,ax)

R = (x2-x1)*0.01 ;           % Radius of the cylindrical shell

M = 50 ;N = 100 ;
% Discretizing the Height and Angle of the cylinder
nH = linspace(x1,x2,M) ;
nT = linspace(0,pi,N) ;
[H, T] = meshgrid(nH,nT) ;
%%cylinder at (0,0)
X1 = H; 
Y1 = R*sin(T);
Z1 = R*cos(T);

isurf = surf(X1,Y1,Z1,'FaceColor','interp','LineStyle','none','Parent',ax,'FaceLighting','gouraud');
xlim(ax,[x1-4 x2+4])
ylim(ax,[-3*R 3*R])
zlim(ax,[-3*R 3*R])
daspect(ax,[1 1 1])
view(ax,-10,17)
colorbar(ax)
colormap(ax,'hot')

%set(ax,'Colormap',...
%    [0 0 1;0.0158730167895555 0 0.98412698507309;0.0317460335791111 0 0.968253970146179;0.0476190485060215 0 0.952380955219269;0.0634920671582222 0 0.936507940292358;0.0793650820851326 0 0.920634925365448;0.095238097012043 0 0.904761910438538;0.111111111938953 0 0.888888895511627;0.126984134316444 0 0.873015880584717;0.142857149243355 0 0.857142865657806;0.158730164170265 0 0.841269850730896;0.174603179097176 0 0.825396835803986;0.190476194024086 0 0.809523820877075;0.206349208950996 0 0.793650805950165;0.222222223877907 0 0.777777791023254;0.238095238804817 0 0.761904776096344;0.253968268632889 0 0.746031761169434;0.269841283559799 0 0.730158746242523;0.28571429848671 0 0.714285731315613;0.30158731341362 0 0.698412716388702;0.31746032834053 0 0.682539701461792;0.333333343267441 0 0.666666686534882;0.349206358194351 0 0.650793671607971;0.365079373121262 0 0.634920656681061;0.380952388048172 0 0.61904764175415;0.396825402975082 0 0.60317462682724;0.412698417901993 0 0.58730161190033;0.428571432828903 0 0.571428596973419;0.444444447755814 0 0.555555582046509;0.460317462682724 0 0.539682567119598;0.476190477609634 0 0.523809552192688;0.492063492536545 0 0.507936537265778;0.507936537265778 0 0.492063492536545;0.523809552192688 0 0.476190477609634;0.539682567119598 0 0.460317462682724;0.555555582046509 0 0.444444447755814;0.571428596973419 0 0.428571432828903;0.58730161190033 0 0.412698417901993;0.60317462682724 0 0.396825402975082;0.61904764175415 0 0.380952388048172;0.634920656681061 0 0.365079373121262;0.650793671607971 0 0.349206358194351;0.666666686534882 0 0.333333343267441;0.682539701461792 0 0.31746032834053;0.698412716388702 0 0.30158731341362;0.714285731315613 0 0.28571429848671;0.730158746242523 0 0.269841283559799;0.746031761169434 0 0.253968268632889;0.761904776096344 0 0.238095238804817;0.777777791023254 0 0.222222223877907;0.793650805950165 0 0.206349208950996;0.809523820877075 0 0.190476194024086;0.825396835803986 0 0.174603179097176;0.841269850730896 0 0.158730164170265;0.857142865657806 0 0.142857149243355;0.873015880584717 0 0.126984134316444;0.888888895511627 0 0.111111111938953;0.904761910438538 0 0.095238097012043;0.920634925365448 0 0.0793650820851326;0.936507940292358 0 0.0634920671582222;0.952380955219269 0 0.0476190485060215;0.968253970146179 0 0.0317460335791111;0.98412698507309 0 0.0158730167895555;1 0 0]);

caxis(ax,[-10 10])
lightangle(ax,40,40)
end
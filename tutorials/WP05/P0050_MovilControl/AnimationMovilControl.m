function AnimationMovilControl(Xnum_with_control,Xnum_free,tspan,xline,yline,Bmatrix)
%ANIMATIONMOVILCONTROL Summary of this function goes here
%   Detailed explanation goes here

Ns = length(xline);
[xms,yms] = meshgrid(xline,yline);

tspan_fine = linspace(tspan(1),tspan(end),16*length(tspan));

Xnum_with_control    = interp1(tspan,Xnum_with_control(:,1:end)',tspan_fine,'linear')';
Xnum_free            = interp1(tspan,Xnum_free',tspan_fine,'linear')';
%%
xline_fine = linspace(xline(1),xline(end),2*length(xline));
yline_fine = linspace(yline(1),yline(end),2*length(yline));
[xms_fine,yms_fine] = meshgrid(xline_fine,yline_fine);
%%


figure('unit','norm','pos',[0 0 1 1],'Color','k');

ax1 = subplot(2,2,1,'Color','none');
hold on
Z = reshape(Xnum_with_control(1:Ns^2,1),Ns,Ns);
isurf = surf(xms_fine,yms_fine,interp2(xms,yms,Z,xms_fine,yms_fine,'linear'),'Parent',ax1);
ax2 = subplot(2,2,2,'Color','none');
Z = reshape(Xnum_free(1:Ns^2,1),Ns,Ns);
jsurf = surf(xms_fine,yms_fine,interp2(xms,yms,Z,xms_fine,yms_fine,'linear'),'Parent',ax2);
%%
x = Xnum_with_control(end-3,1);
y = Xnum_with_control(end-2,1);
radius = 0.1;
z =  0.2;
% Create the mesh of shere
[Xs,Ys,Zs] = sphere;
X = Xs*radius+x ; Y = Ys*radius+y; Z = Zs*radius*0.1+z;
% create the sphere object
%
%
ax3 = subplot(2,2,3);
ax4 = subplot(2,2,4);

ksurf =surf(X,Y,Z,'Parent',ax1);

zlim(  [ax1 ax2],[-0.1 0.3])
xlim(  [ax1 ax2],[-1.5 1.5])
ylim(  [ax1 ax2],[-1.5 1.5])
axis(  [ax1 ax2],'off')
view(  [ax1 ] ,-5,10)
view(  [ax2] ,-5,10)
caxis( [ax1 ],[-0.1 0.1])

caxis( [ ax2],[-0.1 0.1])
%
shading(   [ax1 ],'interp')
shading(   [ax2],'interp')

lighting(  [ax1 ]','gouraud')
lighting(  [ ax2  ]','gouraud')
lighting(  [  ax3 ]','gouraud')
lighting(  [   ax4]','gouraud')

lightangle([ax1 ],40,40)
lightangle([ ax2],40,40)

%
title(ax1,'Control Dynamics','Color','w','FontSize',15)
title(ax2,'Free Dynamics','Color','w','FontSize',15)

%%
ax2.Color = 'none';
for it = 1:length(tspan_fine)
    % controled state
    Z = reshape(Xnum_with_control(1:Ns^2,it),Ns,Ns);
    isurf.ZData = interp2(xms,yms,Z,xms_fine,yms_fine,'linear');
    %
    Z = reshape(Xnum_free(1:Ns^2,it),Ns,Ns);
    jsurf.ZData = interp2(xms,yms,Z,xms_fine,yms_fine,'linear');
    %%
    x = Xnum_with_control(end-3,it);
    y = Xnum_with_control(end-2,it);

    % Create the mesh of shere
    X = x+(Xs)*radius ; Y = y+(Ys)*radius; Z = z+Zs*radius*0.05;

    ksurf.XData = X;
    ksurf.YData = Y;
    ksurf.ZData = Z;

    pause(0.01)
end

end


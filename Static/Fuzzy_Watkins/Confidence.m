function [ confidence ] = Confidence( deffValue, VR, ER, FIS )
    
    % degree of different value between optimal and explore action
    df1 = trapmf(deffValue ,[-inf -inf -1 0]);
    df2 = trimf(deffValue ,[-1 0 1]);
    df3 = trapmf(deffValue ,[0 1 inf inf]);
    
    % degree of visited ratio explore action
    vr1 = trimf(VR ,[0 0 .5]);
    vr2 = trimf(VR ,[.3 .5 .7]);
    vr3 = trimf(VR ,[.5 1 1]);
    
    % degree of entropy ratio explore action
    er1 = trimf(ER ,[0 0 .5]);
    er2 = trimf(ER ,[.3 .5 .7]);
    er3 = trimf(ER ,[.5 1 1]);
    
    r1 =  df1 * vr1 * FIS.c.c2; % t-norm
    r2 =  df1 * vr2 * FIS.c.c1; % t-norm
    r3 =  df1 * vr3 * FIS.c.c1; % t-norm
    r4 =  df2 * vr1 * FIS.c.c3; % t-norm
    r5 =  df2 * vr2 * FIS.c.c3; % t-norm
    r6 =  df2 * vr3 * FIS.c.c4; % t-norm
    r7 =  df3 * vr1 * FIS.c.c4; % t-norm
    r8 =  df3 * vr2 * FIS.c.c4; % t-norm
    r9 =  df3 * vr3 * FIS.c.c5; % t-norm

    s_mf = max(r1, r2);
    s_mf = max(s_mf, r3);
    s_mf = max(s_mf, r4);
    s_mf = max(s_mf, r5);
    s_mf = max(s_mf, r6);
    s_mf = max(s_mf, r7);
    s_mf = max(s_mf, r8);
    s_mf = max(s_mf, r9);
    
    confidence = defuzz(FIS.c.support_c,s_mf,'centroid');
end
%     
% x = -10:0.0001:10;
% o1 = trapmf(x ,[-inf -5 -5 0]);
% o2 = trimf(x ,[-5 0 5]);
% o3 = trapmf(x ,[0 5 5 inf]);
% plot(x,o1,'LineWidth',3)
% hold on
% plot(x,o2,'LineWidth',3)
% plot(x,o3,'LineWidth',3)
% xlabel('df')
% ylabel('Membership Degree')
%
% x = 0:0.0001:1;
% y1 = trimf(x ,[0 .2 .4]);
% y2 = trimf(x ,[.3 .5 .7]);
% y3 = trimf(x ,[.6 .8 1]);
% plot(x,y1,'LineWidth',3)
% hold on
% plot(x,y2,'LineWidth',3)
% plot(x,y3,'LineWidth',3)
% xlabel('VR')
% ylabel('Membership Degree')

% support = 0:0.01:1;
% y1 = trimf(support ,[0 0 .3]);
% y2 = trimf(support ,[.1 .3 .5]);
% y3 = trimf(support ,[.3 .5 .7]);
% y4 = trimf(support ,[.5 .7 .9]);
% y5 = trimf(support ,[.7 1 1]);
% plot(support,y1,'LineWidth',3)
% hold on
% plot(support,y2,'LineWidth',3)
% plot(support,y3,'LineWidth',3)
% plot(support,y4,'LineWidth',3)
% plot(support,y5,'LineWidth',3)
% xlabel('c')
% ylabel('Membership Degree')

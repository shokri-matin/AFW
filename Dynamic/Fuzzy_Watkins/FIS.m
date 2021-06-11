function [ FIS ] = FIS()

    FIS.c.support_c = 0:0.01:1;
    FIS.c.c1 = trimf(FIS.c.support_c,[0 0 .3]);
    FIS.c.c2 = trimf(FIS.c.support_c,[.1 .3 .5]);
    FIS.c.c3 = trimf(FIS.c.support_c,[.3 .5 .7]);
    FIS.c.c4 = trimf(FIS.c.support_c,[.5 .7 .9]);
    FIS.c.c5 = trimf(FIS.c.support_c,[.9 1 1]);
end


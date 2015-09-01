function [Xi] = Linear_interp(xi1,xi2,nordal_para)
%%%%%%
%%%%%%
%%%%%% Y
%%%%%% Y
%%%%%% Y  *3      *4
%%%%%% Y
%%%%%% Y
%%%%%% Y
%%%%%% Y  *1      *2
%%%%%% Y
%%%%%% 0XXXXXXXXXXXXXXXX
%%%%%%
%%%%%%  Node1 = [x1, y1] *Bottom Left*
%%%%%%  Node2 = [x2, y1] *Bottom Right* *To the right*
%%%%%%  Node3 = [x1, y2] *Top Left*     *To the top*
%%%%%%  Node3 = [x2, y2] *Top Right*
%%%%%%

n1 = nordal_para(1);
n2 = nordal_para(2);
n3 = nordal_para(3);
n4 = nordal_para(4);

Xi = n1 .* (1-xi1) .* (1-xi2)...
    + n2 .* xi1 .* (1-xi2)...
    + n3 .* (1-xi1) .* xi2...
    + n4 .* xi1 .* xi2;... 



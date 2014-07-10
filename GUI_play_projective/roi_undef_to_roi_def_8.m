function [x_roi_def, y_roi_def] = roi_undef_to_roi_def_8(x_roi_undef, y_roi_undef, xi_Xundef, xi_Yundef, fv)

nordal_para_x = fv([1:4]);
nordal_para_y = fv([5:8]);

[X_def_febl] = Linear_interp(xi_Xundef,xi_Yundef,nordal_para_x);
[Y_def_febl] = Linear_interp(xi_Xundef,xi_Yundef,nordal_para_y);

X_def = X_def_febl;
Y_def = Y_def_febl;

x_roi_def = interp2(X_def, x_roi_undef, y_roi_undef); 
y_roi_def = interp2(Y_def, x_roi_undef, y_roi_undef); 
# Deforminator

About Deforminator_PIL

Deforminator_PIL is a matlab graphical user interface for deformable linear registration of MRI images, and was developed for use in lung MRI. The algorithm performs Projective image registration, using a GUI interface in matlab, using the outline of the lung as the constraints. The technique assumes all images were acquired close to a target volume, typically Functional Residual Capacity (FRC) and that no large deviations in lung volume are present in the dataset. The technique will produce unreliable results for variations in lung volume >10-12% above or below target volume.

The original algorithm and interface was developed by Tatsuya Arai in early 2014, and has undergone a few revisions since its first incarnation. Rui Carlos Sá added a "wrapper", shared it using github and added a few add-ons in March 2014; Amran Asadi significantly improved usability of the GUI and produced a compiled version that only requires the free Matlab runtime environment (not full Matlab).

Using Deforminator_PIL

Keyboard Shortcuts

numbers 1-0: loads saved patterns 1-10
q, w, e, r, t: loads saved patterns 11-15
s: save to file. Allow save to complete before pressing s again (or bad stuff may happen)
z: load last pattern used
x: load the initial pattern. Note that the initial pattern will be the default pattern if this is the first time registering the set of images. If you are continuing a previous registration save, the "initial" pattern is the pattern last saved to the file for this image
k: save the current pattern to the next unused pattern spot
backspace: replace the pattern number currently selected with a different pattern. For example, if you load up pattern 7, and then modify it and would like to save the new pattern 7, drag the anchor points to the desired location and hit backspace. Your modified pattern is now saved as pattern 7. Note that this does not effect images to which the original pattern 7 had been applied (that pattern is just not a hotkeyed favorite anymore)


All code by Tatsuya Arai, Rui C. Sá, Amran K. Asadi. 
Except function "different.m"
Written by Jonas Lundgren <splinefit@gmail.com>
https://www.mathworks.com/matlabcentral/profile/authors/920395-jonas-lundgren

load 'recipe26.mat'
load 'recipe31.mat'
load 'recipe35.mat'
load 'recipe37.mat'
load 'recipe39.mat'
load 'recipe51.mat'

num26=CalNumPerImage(B_final26,100);
fprintf("num26=%d\n",num26);

num51=CalNumPerImage(B_final51,100);
fprintf("num51=%d\n",num51);

num39=CalNumPerImage(B_final39,100);
fprintf("num39=%d\n",num39);

num35=CalNumPerImage(B_final35,100);
fprintf("num35=%d\n",num35);

 num31=CalNumPerImage(B_final31,100);
 fprintf("num31=%d\n",num31);

num37=CalNumPerImage(B_final37,100);
fprintf("num37=%d\n",num37);
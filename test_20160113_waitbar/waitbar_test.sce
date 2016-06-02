// Count # of switches and target_fgs. 
swc_fg_list = fscanfMat(path+fname+'.swcs');
temp_size= size(swc_fg_list); n=temp_size(1,1);
No_swcs=0; No_swcs_sr=0; No_target_fgs=0;
for i=1:n
    if swc_fg_list(i,4) == 0 & swc_fg_list(i,3) == 0 then No_swcs=No_swcs+1; end
    if swc_fg_list(i,4) == 0 & swc_fg_list(i,3) == 1 then No_swcs_sr=No_swcs_sr+1; end
    if swc_fg_list(i,4) ~= 0 then No_target_fgs=No_target_fgs+1; end
end

swc_prog_time=1; // Switch program unit time (s)
tar_prog_time=5; // Target program unit time (s)

winH=waitbar('Programming_switches');
realtimeinit(1); realtime(0); //sets time unit to a second and current date to 0
for i=0:1:No_swcs,
  realtime(swc_prog_time*i); // wait till date t is reached.
  waitbar(i/(No_swcs+No_swcs_sr),winH);
end
close(winH);



winId=progressionbar(['Do something' 'secondline' 'third line']);
realtimeinit(1);
for j=0:0.1:1,
  realtime(3*j);
  progressionbar(winId,"hihi");
  disp("safjksdlkfjsld")
end
close(winId);


tic();
realtimeinit(1);
realtime(0);
realtime(2);
a=toc();

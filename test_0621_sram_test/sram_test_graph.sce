fd = mopen('sram_test_input','r'); clear data_01;
for i=1:8192
    data_01(i,1)=i;
    data_01(i,2) = msscanf(mgetstr(7,fd),"%x");
end
mclose(fd)
fd = mopen('read_output.txt','r'); clear data_02;
for i=1:8192
    data_02(i,1)=i;
    data_02(i,2) = msscanf(mgetstr(7,fd),"%x");
end
mclose(fd)
scf(2);
clf(2);
plot2d("nn", data_01(:,1), data_01(:,2), style=1); 
plot2d("nn", data_02(:,1), data_02(:,2), style=2); 
legend("input","output","in_upper_right"); // "in_upper_left" "in_lower_right"
xtitle("","SRAM address", "Values");
a=gca();a.data_bounds(1,1)=0;a.data_bounds(1,2)=0;a.data_bounds(2,1)=9000;a.data_bounds(2,2)=30;

clear bad_srams;j=1;
for i=1:8192
    if data_02(i,2) ~= 16 then
        bad_srams(j)=data_02(i,1);
        j=j+1; 
    end
end
disp(bad_srams)
aa=size(bad_srams);
clear bad_srams_hex;
for i=1:aa(1,1)
    bad_srams_hex(i)=dec2hex(bad_srams(i));
end
disp(bad_srams_hex)

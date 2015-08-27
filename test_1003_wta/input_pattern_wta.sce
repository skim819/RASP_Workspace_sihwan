clear DAC00; clear DAC02; clear DAC03; clear DAC04;

// nbias
DAC02 = [ linspace(1,1,100) ];

// pbias
DAC03 = [ linspace(2,2,100) ];

// vcc0
DAC00 = [ linspace(2.5,2.5,100) ];

// vcc1
DAC04 = [ linspace(2.5,2.5,100) ];

disp(size(DAC00));
disp(size(DAC02));
disp(size(DAC03));
disp(size(DAC04));

OG=1.065;
FG=1.0135;

ABV = ((1.05*(OG-FG))/FG)/0.79;
disp(['Estimated ABV = ' num2str(ABV*100) '%']);
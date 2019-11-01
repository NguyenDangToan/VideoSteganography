function [red,green,blue] = hidedata(redc,greenc,bluec,txt)
red = bitand(redc,248); % 248 = 1111 1000
green = bitand(greenc,248);
blue = bitand(bluec,252); % 252 = 1111 1100
if bitand(txt,128)== 128 % 128 = 1000 0000
    red = bitor(red,4);
end

if bitand(txt,64)== 64 % 64 = 0100 0000
    red = bitor(red,2);
end

if bitand(txt,32)== 32 % 32 = 0010 0000
    red = bitor(red,1);
end

if bitand(txt,16)== 16 % 16 = 0001 0000
    green = bitor(green,4);
end

if bitand(txt,8)== 8 % 8 = 0000 1000
    green = bitor(green,2);
end

if bitand(txt,4)== 4 % 4 = 0000 0100
    green = bitor(green,1);
end

if bitand(txt,2)== 2 % 2 =000 0010
    blue = bitor(blue,2);
end

if bitand(txt,1)== 1 % 1 = 0000 0001
    blue = bitor(blue,1);
end
end  


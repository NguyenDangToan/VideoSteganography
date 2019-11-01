
% 
% [input_file, Fs] = audioread('videook.avi');
% audiowrite('audio.wav', input_file, Fs);

%  file = 'video1.avi';
%  file1 = 'testaudiofile.mp3';
%  videor = vision.VideoFileReader(file,'AudioOutputPort',true);
%  videow = vision.VideoFileWriter(file1,'AudioInputPort',true);
%  while ~isDone(videor)
%       audioFrame = step(videor);
%       step(videow,audioFrame);
%  end
%  release(videow);
%  release(videor);

    vidObj = VideoReader('.\video\ok.avi');
    frameCnt = vidObj.NumberOfFrames;
    vidObj = VideoReader('.\video\ok.avi');
    
    f1 = fopen('key.txt','r');
        f = fread(f1);
        s = char(f');
        fclose(f1);
        
    filesize=bin2dec(s);
    framesize=(vidObj.width * vidObj.height);
    k=1;
    count = 1;
    a = flo
    
    while(k<=filesize)
                
        if hasFrame(vidObj)
        	vidFrame = readFrame(vidObj);
        	i=1;j=1;n=1;
            if(k+framesize<filesize)
                imwrite(vidFrame,['.\stego_image\', num2str(count), '.png']);
                k=k+framesize;
            else
            	if(mod(filesize,framesize)~=0)
                    imwrite(vidFrame,['.\stego_image\', num2str(count), '.png']);
                end
                k=filesize+1;
            end
                
        end
        count = count+1;
	end

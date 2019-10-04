function[status] = Hide_data_video(vidfile,txtfile)
        vidObj = VideoReader(vidfile);
        frameCnt = vidObj.NumberOfFrames;
        
        vidObj = VideoReader(vidfile);
        
        %additionally applies a set of properties tailored to a specific file format (such as 'MPEG-4' or 'Uncompressed AVI')
        videoOut = VideoWriter('output','Uncompressed AVI');
        videoOut.FrameRate = vidObj.FrameRate;
        open(videoOut);
        
        f1 = fopen(txtfile,'r');
        f = fread(f1);
        s = char(f');
        fclose(f1);
        
%         fiig = figure('visible', 'off');
%         currAxes = axes;
        
        count=0;
        s2 = size(f);
        sizeText = s2(1);
        sizeVideo = frameCnt *(vidObj.width * vidObj.height);
        framesize=(vidObj.width * vidObj.height);
        count=0;
        if(sizeText>sizeVideo)
            status = 0;
            disp('Text file size is too big');
        else
            %array = zeros(960,1280,3,778);
            k=1;
            while(k<=sizeText)
                
                if hasFrame(vidObj)
                    count=count+1;
                    vidFrame1 = readFrame(vidObj);
                    if(k+framesize<=sizeText)
                        
                        vidFrame2 = functionhide_forvideo(vidFrame1,f,k,framesize);
                        k=k+framesize;
                    else
                       
                        vidFrame2 = functionhide_forvideo(vidFrame1,f,k,sizeText-k+1);
                        k=sizeText+1;
                    end
                    writeVideo(videoOut,vidFrame2);
                end
            end
            
        end
            %array={};


            %count = 0;
            %vidFrame1 = readFrame(vidObj);
            %vidFrame2 = readFrame(vidObj);
            %vidFrame3 = readFrame(vidObj);
            %vidFrame4 = readFrame(vidObj);
            % Read video frames until available

            while hasFrame(vidObj)
                count=count+1;
                vidFrame = readFrame(vidObj);
                %array = [array, vidFrame];
                writeVideo(videoOut,vidFrame);
                %image(vidFrame, 'Parent', currAxes);
                %count=count+1;
                %array(:,:,:,count) = vidFrame;
                %currAxes.Visible = 'off';
                %pause(10/vidObj.FrameRate);
            end
        %end
     
        close(videoOut);
        
        % extract audio from input video
        [input_file, Fs] = audioread(vidfile);
        audiowrite('audio.wav', input_file, Fs);
        
        
        %add audio into stego video
        video_filename = 'output.avi';
        audio_filename = 'audio.wav';
        out_filename = '.\video\stegovideo.avi';

        videoFReader = VideoReader(video_filename);
        FR = videoFReader.FrameRate;
        [AUDIO,Fs] = audioread(audio_filename);
        SamplesPerFrame = floor(Fs/FR);
        videoFWriter = vision.VideoFileWriter(out_filename, 'AudioInputPort', true, 'FrameRate', FR);
        framenum = 0;
        % read every frame and add audio that(every frame)
        while hasFrame(videoFReader)
           videoFrame = readFrame(videoFReader);
           this_audio = AUDIO(framenum*SamplesPerFrame + 1 : min(end, (framenum+1)*SamplesPerFrame), :);
           if size(this_audio,1) < SamplesPerFrame
               this_audio(SamplesPerFrame,:) = 0; %zero pad short frames
           end
           step(videoFWriter,videoFrame, this_audio);
           framenum = framenum + 1;
        end
        delete(videoFReader);
        release(videoFWriter);
        
        
        secretkey=dec2bin(sizeText);
        fid = fopen('key.txt','wb');
        fwrite(fid,char(secretkey),'char');
        fclose(fid);
        status = 1;
end
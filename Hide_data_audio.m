function[thanhcong] = Hide_data_audio(vidfile,txtfile)
    % create video without audio
    vidObj = VideoReader(vidfile);
    videoOut = VideoWriter('ouput1','Uncompressed AVI');
    videoOut.FrameRate = vidObj.FrameRate;
    open(videoOut);
    
    while hasFrame(vidObj)
        vidFrame = readFrame(vidObj);
        writeVideo(videoOut,vidFrame);
    end
     
    close(videoOut);

    %extract audio
    [input_file, Fs] = audioread(vidfile);
    audiowrite('audio1.wav', input_file, Fs);

    %hide data in audio
    [ok] = data_embedding('audio1.wav', txtfile);
    if(ok == 1)
        thanhcong = 1;
    else
        thanhcong =0;
    end

    %add audio into stego video
        video_filename = 'ouput1.avi';
        audio_filename = '.\audio\stego_audio.wav';
        out_filename = '.\stego_video\stego_audio.avi';

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

end

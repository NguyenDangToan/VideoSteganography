function Hide_data_audio(vidfile,txtfile, pass)

    % extract audio from input video
    [input_file, Fs] = audioread(vidfile);
    audiowrite('audio_to_embed.wav', input_file, Fs);

    wavin = 'audio_to_embed.wav';
    wavout = 'audio_stego.wav';
    password = pass;

    file = txtfile;
    fid  = fopen(file, 'r');
    text = fread(fid,'*char')';
    fclose(fid);

    lsb_enc(wavin, wavout, text, password);


    %add audio into stego video
    video_filename = vidfile;
    audio_filename = 'audio_to_embed.wav';
    out_filename = 'stego_audio_video.avi';

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

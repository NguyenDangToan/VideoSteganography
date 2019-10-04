function Retrieve_data_audio(vidfile, pass)
    % extract audio from input video
    [input_file, Fs] = audioread(vidfile);
    audiowrite('audio_stego1.wav', input_file, Fs);
    wavin = 'audio_stego1.wav';

    password = pass;

    msg = lsb_dec(wavin, password);
    fprintf('Retrieved message: %s\n', msg);
    fid = fopen('x.txt','wb');
    fwrite(fid,char(msg),'char');
    fclose(fid);
end
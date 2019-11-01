function[ok] = data_extracting(vidfile)
    %extract audio
    [input_file, Fs] = audioread(vidfile);
    audiowrite('.\audio\extracting_audio.wav', input_file, Fs);
    
    wavin = '.\audio\stego_audio.wav';
    password = 'mypassword123';

    msg = lsb_dec(wavin, password);
    if(msg)
        fprintf('Retrieved message: %s\n', msg);
        ok = msg;
    else
        ok = 0;
    end
    
    
end
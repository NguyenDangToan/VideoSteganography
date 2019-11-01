function[ok] = data_embedding(wavin, txtfile)

%     [FileName,PathName] = uigetfile({'.wav'}, 'Select cover audio:');
%     [file.path,file.name,file.ext] = fileparts([PathName FileName]);

%     wavin = [PathName FileName];
%     wavout = [file.path '\' file.name '_stego' file.ext];

    password = 'mypassword123';

    file = txtfile;
    fid  = fopen(file, 'r');
    text = fread(fid,'*char')';
    fclose(fid);

    [status] = lsb_enc(wavin, '.\audio\stego_audio.wav', text, password);
    if(status == 1)
        ok = 1;
    else
        ok = 0;
    end
end
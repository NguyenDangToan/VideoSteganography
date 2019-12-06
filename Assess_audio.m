function[status, MSE, PSNR] = Assess_audio(original_video,stego_video)
    status = 0;
    [input_file1, Fs1] = audioread(original_video);
    audiowrite('.\audio\assess_original_video.wav', input_file1, Fs1);
    
    [input_file2, Fs2] = audioread(stego_video);
    audiowrite('.\audio\assess_stego_video.wav', input_file2, Fs2);
    [y1,fs1]=audioread('.\audio\assess_stego_video.wav');
    [y2,fs2]=audioread('.\audio\assess_original_video.wav');
    %[m,n] = size(A) returns the number of rows and columns when A is a matrix.
    [c1x,c1y]=size(y1);
    [c2x,c2y]=size(y2);
    if c1x ~= c2x
        disp('dimeonsions do not agree');
        status = 0;
    else
        R=c1x;
        C=c1y;
        err = sum(sum((y1-y2).^2))/(R*C);
        MSE=sqrt(err);
        MAXVAL=65535;
        PSNR = 20*log10(MAXVAL/MSE); 
        disp(['mse=' num2str(MSE) ' PSNR=' num2str(PSNR)]);
        status = 1;
    end
end


[input_file, Fs] = audioread('videook.avi');
audiowrite('audio.wav', input_file, Fs);

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
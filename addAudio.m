video_filename = 'output.avi';
audio_filename = 'audio.wav';
out_filename = 'videonew1.avi';

videoFReader = VideoReader(video_filename);
FR = videoFReader.FrameRate;
[AUDIO,Fs] = audioread(audio_filename);
SamplesPerFrame = floor(Fs/FR);
videoFWriter = vision.VideoFileWriter(out_filename, 'AudioInputPort', true, 'FrameRate', FR);
framenum = 0;
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
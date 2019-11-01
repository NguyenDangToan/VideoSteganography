% vidObj = VideoReader("./video/videook.avi");
% videoOut = VideoWriter('test','Uncompressed AVI');
%         videoOut.FrameRate = vidObj.FrameRate;
%         open(videoOut);
% while hasFrame(vidObj)
%                 vidFrame = readFrame(vidObj);
%                 writeVideo(videoOut,vidFrame);
% end
%      
% close(videoOut);
% 
% %extract audio
% [input_file, Fs] = audioread('videook.avi');
% audiowrite('audio.wav', input_file, Fs);
% 
% %add audio into stego video
%         video_filename = 'test.avi';
%         audio_filename = 'audio.wav';
%         out_filename = '.\video\stego_video_no_audio.avi';
% 
%         videoFReader = VideoReader(video_filename);
%         FR = videoFReader.FrameRate;
%         [AUDIO,Fs] = audioread(audio_filename);
%         SamplesPerFrame = floor(Fs/FR);
%         videoFWriter = vision.VideoFileWriter(out_filename, 'AudioInputPort', true, 'FrameRate', FR);
%         framenum = 0;
%         % read every frame and add audio that(every frame)
%         while hasFrame(videoFReader)
%            videoFrame = readFrame(videoFReader);
%            this_audio = AUDIO(framenum*SamplesPerFrame + 1 : min(end, (framenum+1)*SamplesPerFrame), :);
%            if size(this_audio,1) < SamplesPerFrame
%                this_audio(SamplesPerFrame,:) = 0; %zero pad short frames
%            end
%            step(videoFWriter,videoFrame, this_audio);
%            framenum = framenum + 1;
%         end
%         delete(videoFReader);
%         release(videoFWriter);
Hide_data_audio(".\video\videook.avi", "text.txt", "12345");
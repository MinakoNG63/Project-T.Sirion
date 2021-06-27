for i = 1:100
   
   img = imread(sprintf('banana(%d).jpg',i));
   [h, w, ~] = size(img);
   
   imHist = histogram(img(:,:,1),150);
   redHist = imHist.Values/(h*w);
   imHist = histogram(img(:,:,2),150);
   greenHist = imHist.Values/(h*w);
   imHist = histogram(img(:,:,3),150);
   blueHist = imHist.Values/(h*w);
   
   save(sprintf('D:/github/Project-T.Sirion/work_2/banana/value_banana/value_banana_%03d',i), 'redHist', 'greenHist', 'blueHist')
   
   end   
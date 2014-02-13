% Write RLE compressed array to file.
function rle_write(f, rle, ty)
   % write size
   fwrite(f, rle.sz, 'uint32');
   % write value array
   fwrite(f, tyid(ty), 'uint32');
   fwrite(f, numel(rle.vals), 'uint32');
   fwrite(f, rle.vals, ty);
   % write count array
   fwrite(f, tyid('uint32'), 'uint32');
   fwrite(f, numel(rle.counts), 'uint32');
   fwrite(f, rle.counts, 'uint32');
end

% get type id
function id = tyid(ty)
   if (strcmp(ty,'int32'))
      id = 5;
   elseif (strcmp(ty,'uint32'))
      id = 6;
   else
      error('type not supported'); % FIXME
   end
end
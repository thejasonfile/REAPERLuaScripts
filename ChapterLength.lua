function Msg(param)
  reaper.ShowConsoleMsg(tostring(param).."\n")
  
end

function convert_time(sec)
  length_hour = 0
  length_min = 0
  length_sec = 0
  remaining_sec = sec
  
  if (remaining_sec / 3600 > 0)
  then
    length_hour = math.floor(remaining_sec / 3600)
    remaining_sec = remaining_sec % 3600
  end
  
  if (remaining_sec / 60 > 0)
  then
    length_min = math.floor(remaining_sec / 60)
    remaining_sec = remaining_sec % 60
    length_sec = math.floor(remaining_sec)
  end
  
  return {length_hour, length_min, length_sec}
end

function Main()
  count_sel_items = reaper.CountSelectedMediaItems(0)
  total_time = 0
  
  for i = 0, count_sel_items - 1 do
    item = reaper.GetSelectedMediaItem(0, i)
    item_current_take = reaper.GetMediaItemInfo_Value(item, "I_CURTAKE")
    item_take = reaper.GetMediaItemTake(item, item_current_take)
    take_name = reaper.GetTakeName(item_take)
    
    item_length_total = reaper.GetMediaItemInfo_Value(item, "D_LENGTH")
    total_time = total_time + math.floor(item_length_total)
    item_length = convert_time(item_length_total)
    Msg(take_name.." is "..item_length[1]..":"..item_length[2]..":"..item_length[3])
    
  end
  
  total_length = convert_time(total_time)
  Msg("")
  Msg("Total book time is "..total_length[1]..":"..total_length[2]..":"..total_length[3])
  
end

reaper.ShowConsoleMsg("")
Main()



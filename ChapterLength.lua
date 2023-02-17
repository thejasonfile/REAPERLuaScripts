function Msg(param)
  reaper.ShowConsoleMsg(tostring(param).."\n")
  
end

function convert_time(sec)
  --length_hour = math.floor (sec / 3600)
  length_min = math.floor(sec / 60)
  length_sec = math.floor(sec - (length_min * 60))
  return {length_min, length_sec}
  
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
    total_time = total_time + item_length_total
    item_length = convert_time(item_length_total)
    Msg(take_name.." is "..item_length[1]..":"..item_length[2])
    
  end
  
  total_length = convert_time(total_time)
  Msg("")
  Msg("Total book time is "..total_length[1]..":"..total_length[2])
  
end

reaper.ShowConsoleMsg("")
Main()



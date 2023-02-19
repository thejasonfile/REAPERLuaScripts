function Msg(param)
  reaper.ShowConsoleMsg(tostring(param).."\n")
  
end

function convert_time(sec)
  --takes in number of seconds and returns number of hours, minutes, seconds
  remaining_sec = sec

  length_hour = math.floor(remaining_sec / 3600)
  remaining_sec = remaining_sec % 3600
  
  length_min = math.floor(remaining_sec / 60)
  remaining_sec = remaining_sec % 60
  
  length_sec = math.floor(remaining_sec)

  return {length_hour, length_min, length_sec}
end

function Main()
  --sets variables for the total number of selected items and the total time
  count_sel_items = reaper.CountSelectedMediaItems(0)
  total_time = 0
  
  --get the take name and the item length for all selected items
  --also add each item length to total time
  --and display the take name and item length
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
  
  --convert and display the total length of all items
  total_length = convert_time(total_time)
  Msg("")
  Msg("Total time of all selected items is "..total_length[1]..":"..total_length[2]..":"..total_length[3])
  
end

reaper.ShowConsoleMsg("")
Main()



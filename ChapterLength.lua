function Msg(param)
  reaper.ShowConsoleMsg(tostring(param).."\n")
end

function Main()
  count_sel_items = reaper.CountSelectedMediaItems(0)
  
  for i = 0, count_sel_items - 1 do
    item = reaper.GetSelectedMediaItem(0, i)
    item_current_take = reaper.GetMediaItemInfo_Value(item, "I_CURTAKE")
    item_take = reaper.GetMediaItemTake(item, item_current_take)
    take_name = reaper.GetTakeName(item_take)
    item_length_total = reaper.GetMediaItemInfo_Value(item, "D_LENGTH")
    item_length_min = math.floor(item_length_total / 60)
    item_length_sec = math.floor(item_length_total - (item_length_min * 60))
    Msg(take_name.." is "..item_length_min..":"..item_length_sec)

  end
  
end

reaper.ShowConsoleMsg("")
Main()



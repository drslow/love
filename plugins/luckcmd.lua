do
local function muteteam(msg, matches)
 
 if matches[1]:lower() == "lock" and matches[2]:lower() == "cmd" and is_momod(msg) then
  local hash = 'mutetmcmd:'..msg.to.id
   if redis:get(hash) then
    return reply_msg(msg.id, "قفل #دستورات از قبل فعال است !", ok_cb, false)
   end
   if not redis:get(hash) then
    redis:set(hash, true)
    return reply_msg(msg.id, "قفل #دستورات فعال شد !", ok_cb, false)
   end 
 end 
 
  if matches[1]:lower() == 'unlock' and matches[2]:lower() == "cmd" and is_momod(msg) then
  local hash = 'mutetmcmd:'..msg.to.id
   if not redis:get(hash) then
    return reply_msg(msg.id, "قفل #دستورات فعال نیست !", ok_cb, false)
   end
   if redis:get(hash) then
    redis:del(hash)
    return reply_msg(msg.id, "قفل #دستورات غیرفعال شد !", ok_cb, false)
   end 
 end 
  
end
return {
    patterns = {
        "^[/!#]([Ll][Oo][Cc][Kk]) ([Cc][Mm][Dd])$",
        "^[/!#]([Uu][Nn][Ll][Oo][Cc][Kk]) ([Cc][Mm][Dd])$",
    },
    run = muteteam,
}
end

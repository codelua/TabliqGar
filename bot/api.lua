tabchi = dofile('./bot/funcation.lua')
tabchi_id = 343317686
---------------------------------

json = dofile('./libs/JSON.lua')
----~~~~~~~~~~~~~~~~
URL = require "socket.url"
----~~~~~~~~~~~~~~~~
serpent = dofile("./libs/serpent.lua")
------~~~~~~~~~~~~~~~~
http = require "socket.http"
-----~~~~~~~~~~~~~~~~
https = require "ssl.https"
-----~~~~~~~~~~~~~~~~
d = dofile('./libs/redis.lua')
config_sudo = {280061509,310217440,363936960,366831302,56693692,260604473}
function dl_cb(arg, data)
 --vardump(data)
 --vardump(arg)
end
function is_sudo(msg)
  local var = false
  for v,user in pairs(config_sudo) do
    if user == msg.sender_user_id_ then
      var = true
    end
  end
  return var
end
	  function showedit(msg,data)
         if msg then
  tabchi.viewMessages(msg.chat_id_, {[0] = msg.id_})
      if msg.send_state_.ID == "MessageIsSuccessfullySent" then
      return false 
      end     
 if msg.chat_id_ then
      local id = tostring(msg.chat_id_)
      if id:match('-100(%d+)') then
        chat_type = 'super'
        elseif id:match('^(%d+)') then
        chat_type = 'user'
        else
        chat_type = 'group'
        end
      end

 local text = msg.content_.text_
	if text and text:match('[QWERTYUIOPASDFGHJKLZXCVBNM]') then
		text = text
		end
    if msg.content_.ID == "MessageText" then
      msg_type = 'text'
    end
    if msg.content_.ID == "MessageChatAddMembers" then
      msg_type = 'user'
    end
    if msg.content_.ID == "MessageChatJoinByLink" then
      msg_type = 'Joins'
    end
   if msg.content_.ID == "MessageDocument" then
        print("This is [ File Or Document ]")
        msg_type = 'Document'
      end
      -------------------------
      if msg.content_.ID == "MessageSticker" then
        print("This is [ Sticker ]")
        msg_type = 'Sticker'
      end
      -------------------------
      if msg.content_.ID == "MessageAudio" then
        print("This is [ Audio ]")
        msg_type = 'Audio'
      end
      -------------------------
      if msg.content_.ID == "MessageVoice" then
        print("This is [ Voice ]")
        msg_type = 'Voice'
      end
      -------------------------
      if msg.content_.ID == "MessageVideo" then
        print("This is [ Video ]")
        msg_type = 'Video'
      end
      -------------------------
      if msg.content_.ID == "MessageAnimation" then
        print("This is [ Gif ]")
        msg_type = 'Gif'
      end
      -------------------------
      if msg.content_.ID == "MessageLocation" then
        print("This is [ Location ]")
        msg_type = 'Location'
      end
    
      -------------------------
      if msg.content_.ID == "MessageContact" then
        print("This is [ Contact ]")
        msg_type = 'Contact'
      end
      
 if not msg.reply_markup_ and msg.via_bot_user_id_ ~= 0 then
        print("This is [ MarkDown ]")
        msg_type = 'Markreed'
      end
    if msg.content_.ID == "MessagePhoto" then
      msg_type = 'Photo'
end
function check_markdown(text) 
		str = text
		if str:match('_') then
			output = str:gsub('_',[[\_]])
		elseif str:match('*') then
			output = str:gsub('*','\\*')
		elseif str:match('`') then
			output = str:gsub('`','\\`')
		else
			output = str
		end
	return output
end
    -------------------------------------------
    if msg_type == 'text' and text then
      if text:match('^[/]') then
      text = text:gsub('^[/]','')
      end
    end

--[[if text == 'panel' and is_sudo(msg) then-------- Çíä ÈÎÔ ÏÑ æÑŽä ÈÚÏí ÝÚÇá ãíÔæÏ
function inline(arg,data)
local cerner = 'CerNer Team'
          tdcli_function({
        ID = "SendInlineQueryResultMessage",
        chat_id_ = msg.chat_id_,
        reply_to_message_id_ = msg.id_,
        disable_notification_ = 0,
        from_background_ = 1,
        query_id_ = data.inline_query_id_,
        result_id_ = data.results_[0].id_
      }, dl_cb, nil)
end
          tdcli_function({
      ID = "GetInlineQueryResults",
      bot_user_id_ = 390586489,
      chat_id_ = msg.chat_id_,
      user_location_ = {
        ID = "Location",
        latitude_ = 0,
        longitude_ = 0
      },
      query_ = 'CerNer Team',
      offset_ = 0
    }, inline, nil)
       end--]]
if text == 'reset' and is_sudo(msg) then
d:del("tallmsg")
d:del("asgp")
d:del("tgp")
d:del("tusers")
tabchi.sendText(msg.chat_id_, msg.id_,1,' Stats TabChi Has Been Reseted ',1,'md')
        print("Tabchi [ Message ]")
end
if text == 'git pull' and is_sudo(msg) then
text = io.popen("git fetch --all && git reset --hard origin/master && git pull origin master "):read('*all')
 tabchi.sendText(msg.chat_id_, msg.id_, 1,text, 1, 'md')
end
if text and text:match("^(pm) (%d+) (.*)") and is_sudo(msg) then

      local matches = {
        text:match("^(pm) (%d+) (.*)")
      }
      if #matches == 3 then
        tabchi.sendText((matches[2]), 0, 1, matches[3], 1, "html")
                    print("Tabchi [ Message ]")
 
  tabchi.sendText(msg.chat_id_, msg.id_, 1, '*Send!*', 1, 'md')
      end
end
 if text and text:match('^jointo (.*)') and is_sudo(msg) then

  local link = text:match('^jointo (.*)')
tabchi.importChatInviteLink(link, dl_cb, nil)
            print("Tabchi [ Message ]")

    tabchi.sendText(msg.chat_id_, msg.id_, 1, '*Done!*', 1, 'md')
end
if text == 'reload' and is_sudo(msg) then
 dofile('./bot/funcation.lua')
 dofile('./bot/api.lua')
tabchi.sendText(msg.chat_id_,msg.id_,1,'*Tabchi Api BOT Reloaded*',1,'md')
end

if text == 'panel' and is_sudo(msg) then
local gps = d:scard("asgp") or 0
local user = d:scard("ausers")
local gp = d:scard("agp") or 0
local allmsg = d:get("aallmsg") or 0
local text = '> Stats For Tabchi Bot Api : \n\n> `All Msg :` *'..allmsg..'*\n\n`> SuperGroup  :`* '..gps..'*\n\n`> Group  :` *'..gp..'*`\n\n> Users : `*'..user..'*\n\n> `Create By` *CerNer Team*'
 tabchi.sendText(msg.chat_id_, msg.id_,1,text,1,'md')
 end
if is_sudo(msg) then
        if text == 'bcsgp' and tonumber(msg.reply_to_message_id_) > 0 then
          function cb(a,b,c)
          local text = b.content_.text_
          local list = d:smembers('asgp')
          for k,v in pairs(list) do
        tabchi.sendText(v, 0, 1, text,1, 'md')
          end
   local gps = d:scard("asgp")     
     local text = '*Youre Message Was Send To* `'..gps..'`* SuperGroups*'
       tabchi.sendText(msg.chat_id_, msg.id_, 1, text, 1, 'md')
          end
          tabchi.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),cb)
          end

  if text == 'bcgp' and tonumber(msg.reply_to_message_id_) > 0 then
          function cb(a,b,c)
          local text = b.content_.text_
          local list = d:smembers('agp')
          for k,v in pairs(list) do
        tabchi.sendText(v, 0, 1, text,1, 'md')
          end
					local gp = d:scard("agp")     
     local text = '*Youre Message Was Send To* `'..gp..'`* Groups*'
       tabchi.sendText(msg.chat_id_, msg.id_, 1, text, 1, 'md')		
          end
          tabchi.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),cb)
          end
  if text == 'bcuser' and tonumber(msg.reply_to_message_id_) > 0 and is_sudo(msg) then
          function cb(a,b,c)
          local text = b.content_.text_
          local list = d:smembers('ausers')
          for k,v in pairs(list) do
        tabchi.sendText(v, 0, 1, text,1, 'md')
          end
local uu = d:scard("ausers")     
     local text = '*Youre Message Was Send To* `'..uu..'`* Users*'
       tabchi.sendText(msg.chat_id_, msg.id_, 1, text, 1, 'md')
          end
          tabchi.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),cb)
          end
  if text == 'fwdsgp' and tonumber(msg.reply_to_message_id_) > 0 then
          function cb(a,b,c)
          local list = d:smembers('asgp')
          for k,v in pairs(list) do
         tabchi.forwardMessages(v, msg.chat_id_, {[0] = b.id_}, 1)
          end
local gps = d:scard("asgp")     
     local text = '*Youre Message Was ForWard To* `'..gps..'`* SuperGroups*'
       tabchi.sendText(msg.chat_id_, msg.id_, 1, text, 1, 'md')

          end
          tabchi.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),cb)
          end
if text == 'fwdgp' and tonumber(msg.reply_to_message_id_) > 0 then
          function cb(a,b,c)
          local list = d:smembers('agp')
          for k,v in pairs(list) do
         tabchi.forwardMessages(v, msg.chat_id_, {[0] = b.id_}, 1)
          end
					local gp = d:scard("agp")     
     local text = '*Youre Message Was ForWard To* `'..gp..'`* Groups*'
       tabchi.sendText(msg.chat_id_, msg.id_, 1, text, 1, 'md')
          end
          tabchi.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),cb)
          end

if text == 'fwduser' and tonumber(msg.reply_to_message_id_) > 0 then
          function cb(a,b,c)
          local list = d:smembers('ausers')
          for k,v in pairs(list) do
         tabchi.forwardMessages(v, msg.chat_id_, {[0] = b.id_}, 1)
          end
					local qq = d:scard("ausers")     
     local text = '*Youre Message Was ForWard To* `'..qq..'`* Users*'
       tabchi.sendText(msg.chat_id_, msg.id_, 1, text, 1, 'md')
          end
          tabchi.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),cb)
          end
end
------------------------------------
------------------------------------
d:incr("aallmsg")
------------------------------------
 if msg.chat_id_ then
      local id = tostring(msg.chat_id_)
      if id:match('-100(%d+)') then
        if not d:sismember("asgp",msg.chat_id_) then
          d:sadd("asgp",msg.chat_id_)
        end
-----------------------------------
elseif id:match('^-(%d+)') then
if not d:sismember("agp",msg.chat_id_) then
d:sadd("agp",msg.chat_id_)
end
-----------------------------------------
elseif id:match('') then
if not d:sismember("ausers",msg.chat_id_) then
d:sadd("ausers",msg.chat_id_)
end
   else
        if not d:sismember("asgp",msg.chat_id_) then
            d:sadd("asgp",msg.chat_id_)
end
end
end
end
end
      function tdcli_update_callback(data)
 ------vardump(data)
    if (data.ID == "UpdateNewMessage") then
     showedit(data.message_,data)
  elseif (data.ID == "UpdateMessageEdited") then
    data = data
    local function edited_cb(extra,result,success)
      showedit(result,data)
    end
     tdcli_function ({
      ID = "GetMessage",
      chat_id_ = data.chat_id_,
      message_id_ = data.message_id_
    }, edited_cb, nil)
  elseif (data.ID == "UpdateOption" and data.name_ == "my_id") then
    tdcli_function ({
      ID="GetChats",
      offset_order_="9223372036854775807",
      offset_chat_id_=0,
      limit_=20
    }, dl_cb, nil)
  end
end



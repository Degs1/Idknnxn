--

restcount=0
pack_total=0
pnbzx=Botak[bot:getLocal().name].pnbtilex -1
pnbzy=Botak[bot:getLocal().name].pnbtiley -1

function degshook(text,ongak)
    if webhooq then
        RequestINFO={}
        RequestINFO.json = true
        RequestINFO.url=webhookurl
        RequestINFO.method=POST
        RequestINFO.postData = 
        [[
            {
                "content" : "**Bot Information** > ]]..text..[[",
              "embeds": [
                {   
                    "title": "Degs ROTATION LOG",
    				"description": "**<:jawir:1137548164472242247> | Bot Name : **]]..bot:getLocal().name..[[\n**<a:wifi:1069253991327862814> | Bot Status : **]]..ongak..[[ (]]..boy:getMs()..[[)\n\n**<:gems:994218103032520724> | Bot Gems : **]]..bot:getLocal().gems..[[\n**<:emoji_3:1137558475275255808> | Bot Level : **]]..bot:getLocal().level..[[\n**<:slotbp:1137570524323643484> | Bot Slot : **]]..bot:getLocal().slot..[[\n\n**<:wl:1129693761790820433> | Current World : **]]..bot:getCurrentWorld():upper()..[[\n**<:polisil:1137565897956012073> | Fossil : **]]..posil_total..[[\n\n**UP TIME : **]]..SecondTT(os.difftime(os.time(), startT)..[[",
                    "color": "]] .. math.random(0, 16777215) .. [[",
                  "footer": {
                    "text": "Time Up | ]]..(os.date("!%a %b %d, %Y at %I:%M %p", os.time() + 7 * 60 * 60))..[[",
                    "icon_url": "https://cdn.discordapp.com/emojis/978628955907170314.gif?size=96&quality=lossless",
                    "thumbnail": {
                    "url": "https://cdn.discordapp.com/attachments/1118664844145594530/1126848269365035150/earth.gif"
                    }
                  }
                }
              ]
            }
        ]]
    end
end

startT = os.time()
function SecondTT(seconds)
  local seconds = tonumber(seconds)
  if seconds <= 0 then
    return "00:00:00)"
  else
    hours = string.format("%02.f", math.floor(seconds / 3600))
    mins = string.format("%02.f", math.floor(seconds / 60 - hours * 60))
    secs = string.format("%02.f", math.floor(seconds - hours * 3600 - mins * 60))
    return hours .. ":" .. mins .. ":" .. secs .. ") "
  end
end

function onlinehook(text)
if webhooq then
    RequestINFO={}
    RequestINFO.json = true
    RequestINFO.url=webhookurl
    RequestINFO.method=POST
    RequestINFO.postData = 
    [[
        {
            "content" : "**Bot Information** > ]]..text..[[",
          "embeds": [
            {   
                "title": "Pnb By degssss",
				"description": "<:growbot:992058196439072770> Bot Name : ]]..bot:getLocal().name..[[\n<:monitorgt:986523288383680512> Bot Status : Offline",
                           "color": "]] .. math.random(0, 16777215) .. [[",
              "footer": {
                "text": "Time Up | ]]..(os.date("!%a %b %d, %Y at %I:%M %p", os.time() + 7 * 60 * 60))..[[",
                "icon_url": "https://cdn.discordapp.com/emojis/978628955907170314.gif?size=96&quality=lossless",
                "thumbnail": {
                "url": "https://cdn.discordapp.com/attachments/1118664844145594530/1126848269365035150/earth.gif"
                }
              }
            }
          ]
        }
    ]]
    x = httpReq(RequestINFO)
    if x.success then
        --log("Response Body : ",x.body)
        --log("Response Http Status Code : ",x.httpCode)
    else
        --log("Request Failed Error Msg : ",x.failInfo)
    end
end
end

function join(B,P)
    while bot:getCurrentWorld():upper()~=B:upper() or bot:getTile(math.floor(bot:getLocal().pos.x/32),math.floor(bot:getLocal().pos.y/32)).fg==6 do
        sleep(500)
        bot:sendPacket("action|join_request\nname|"..B.."|"..P.."\ninvitedWorld|0",3)       
        sleep(Delaywarp)
    end
end

function readycoy()
    ready=0
    for _, a in ipairs(bot:getTiles()) do
        if a.fg==Idseed then
			if bot:getSeedTime(a.x,a.y)==0 and bot:hasAccessToTile(a.x,a.y) then
            	ready=1
       		end
        end
    end
end

function mf(xy)
    return math.floor(xy / 32)
end
function punch(x,y)
    bot:hitTile(mf(bot:getLocal().pos.x) + x,mf(bot:getLocal().pos.y) + y)
end
function place(id,x,y)
    bot:placeTile(mf(bot:getLocal().pos.x) + x,mf(bot:getLocal().pos.y) + y,id)
end

function harvestgeng()
    bot:autoCollect(3,true)
    for B,E in ipairs(bot:getTiles()) do
        if E.fg==Idseed and bot:canHarvest(E.x,E.y) and bot:getItemCount(Idblock)<150 then
            recon1()
            sleep(50)
            bot:findPath(E.x,E.y)
			recon1()
			if bot:getTile(E.x,E.y).fg == Idseed then
				--sleep(delayharvest)
                punch(0,0)
                sleep(Delayharvest)
			end
			if bot:getItemCount(Idblock) > 150 then
			    break
			end
        end
    end
end

function plantoi()
    for y,E in ipairs(bot:getTiles()) do
        if E.fg==0 and E.x>=0 and E.x<=99 and E.y>=0 and bot:getItemCount(Idseed)>0 then
           if bot:getTile(E.x,E.y+1).fg~=0 and bot:getTile(E.x,E.y+1).fg~=Idseed and bot:hasAccessToTile(E.x,E.y) and bot:getTile(E.x,E.y).fg == 0 and bot:isSolid(E.x,E.y+1) then
                recon1()
                bot:findPath(E.x,E.y)
                bot:placeTile(math.floor(bot:getLocal().pos.x/32),math.floor(bot:getLocal().pos.y/32),Idseed)
				sleep(Delayplant)
            end
        end
    end
end

function trashkontol(B)
    sleep(500)
    bot:sendPacket("action|trash\n|itemID|"..B,2)
    sleep(1000)
    bot:sendPacket("action|dialog_return\ndialog_name|trash_item\nitemID|"..B.."|\ncount|"..bot:getItemCount(B),2)
    sleep(1000)
end


function pnb()
    bot:autoCollect(3,true)
    if not bot:isInside(pnbzx,pnbzy, 0) then 
    repeat
        bot:findPath(pnbzx,pnbzy)
        sleep(2000)
    until math.floor(bot:getLocal().pos.x/32)==pnbzx and math.floor(bot:getLocal().pos.y/32)==pnbzy
    end
    posx=math.floor(bot:getLocal().pos.x/32)
    posy=math.floor(bot:getLocal().pos.y/32)
    if custom_tile == 1 then
        while bot:getItemCount(Idblock) > 0 do
            if bot:getItemCount(Idseed)>150 then goto A end
            if bot:getTile(posx,posy-1).bg==0 or bot:getTile(posx,posy-1).fg==0 then
                recon1()
                place(Idblock,0,-1)
                sleep(Delayput)
            end
            while bot:getTile(posx,posy-1).bg~=0 or bot:getTile(posx,posy-1).fg~=0 do
                recon1()
                punch(0,-1)
                sleep(Delaypunch)
            end
        end
    elseif custom_tile == 3 then
        while bot:getItemCount(Idblock) > 0 do
            if bot:getItemCount(Idseed)>150 then goto A end
            if bot:getTile(posx-1,posy-1).bg==0 or bot:getTile(posx-1,posy-1).fg==0 then
                recon1()
                place(Idblock,-1,-1)
                sleep(Delayput)
            end
            if bot:getTile(posx,posy-1).bg==0 or bot:getTile(posx,posy-1).fg==0 then
                recon1()
                place(Idblock,0,-1)
                sleep(Delayput)
            end
            if bot:getTile(posx+1,posy-1).bg==0 or bot:getTile(posx+1,posy-1).fg==0 then
                recon1()
                place(Idblock,1,-1)
                sleep(Delayput)
            end
            while bot:getTile(posx-1,posy-1).bg~=0 or bot:getTile(posx-1,posy-1).fg~=0 do
                recon1()
                punch(-1,-1)
                sleep(Delaypunch)
            end
            while bot:getTile(posx,posy-1).bg~=0 or bot:getTile(posx,posy-1).fg~=0 do
                recon1()
                punch(0,-1)
                sleep(Delaypunch)
            end
            while bot:getTile(posx+1,posy-1).bg~=0 or bot:getTile(posx+1,posy-1).fg~=0 do
                recon1()
                punch(1,-1)
                sleep(Delaypunch)
            end
        end
    end
    ::A::
    sleep(500)
    recon1()
    for d,T in pairs(trashitem) do
        if bot:getItemCount(T)>5 then
            trashkontol(T)
            sleep(500)
        end
    end
end

function recon1()
    local zposx=math.floor(bot:getLocal().pos.x/32)
    local zposy=math.floor(bot:getLocal().pos.y/32)
    if bot:getEnetStatus()~=Connected then
        onlinehook("Disconnect Try To connect")
        while bot:getEnetStatus()~=Connected do
            bot:reConnect()
            sleep(30000)
                if bot:getEnetStatus()==Connected then
                goto K
                end
        end
        ::K::
        if bot:getEnetStatus()==Connected then
            degshook("Bot Reconnected","Online")
        end
    end
    if bot:getEnetStatus()==Connected and bot:getTile(math.floor(bot:getLocal().pos.x/32),math.floor(bot:getLocal().pos.y/32)).fg==6 then
        while bot:getTile(math.floor(bot:getLocal().pos.x/32),math.floor(bot:getLocal().pos.y/32)).fg==6 do
            if bot:getCurrentWorld():upper()==droppackworld:upper() then
                join(droppackworld,droppackworldid)
                sleep(1000)
            elseif bot:getCurrentWorld():upper()==lists:upper() then
                join(lists,farmworldid)
                sleep(1000)
            elseif bot:getCurrentWorld():upper()==dropseedworld:upper() then
                join(dropseedworld,dropseedworldid)
                sleep(1000)
            end
        end
        repeat
            bot:findPath(zposx,zposy)
            sleep(1000)
        until math.floor(bot:getLocal().pos.x/32)==zposx or math.floor(bot:getLocal().pos.y/32)==zposy
    end
end

function restbotak()
    if Restbro == true and restcount==Restafter then
        degshook("Bot Rest","Online")
        if bot:getEnetStatus() == Connected then
            bot:disconnect()
        end
        sleep(restsecond)
        if bot:getEnetStatus() ~= Connected then
            bot:reConnect()
        end
    end
end

function buypack()
    sleep(1000)
    local iter=0
    bot:autoCollect(3,false)
    if bot:getCurrentWorld():upper()~=droppackworld:upper() then
        join(droppackworld,droppackworldid)
        sleep(4500)
        recon1()
    end
    if bot:getCurrentWorld():upper()==droppackworld:upper() then
        --scanp()
        if bot:inWorld() then
            bot:autoCollect(3,false)
            sleep(1000)
            recon1()
            sleep(1000)
            while bot:getLocal().gems>packprice do
                sleep(500)
                for B=1,mindroppackack do
                    if bot:getItemCount(packid[1])~=200 then
                        bot:sendPacket("action|buy\nitem|"..packname,2)
                        sleep(4000)
                        recon1()
                        pack_total = pack_total+1
                    end
                end
                if bot:getItemCount(packid[1])==200 then
                    break
                end
                recon1()
                if bot:getLocal().gems<packprice then
                    sleep(100)
                    break
                end
                iter=iter+1
                if iter>=3 then iter=0 break end
            end
            for E,V in pairs(bot:getTiles()) do
                if V.fg==iddroppack or V.bg==iddroppack then
                    bot:findPath(V.x,V.y)
                    sleep(1000)
                    for B,E in pairs(packid) do
                        while bot:getItemCount(E)>0 do
                            sleep(1500)
							bot:move(RIGHT,1)
							sleep(1000)
                            droppp(E)
                            sleep(2000)
                            recon1()
                        end
                    end
                end
            end
            sleep(1000)
            recon1()
        end
    end
end

function dropbijilu(B)
    if bot:getCurrentWorld():upper()~=dropseedworld:upper() then
        join(dropseedworld,dropseedworldid)
        sleep(4500)
        recon1()
    end
    bot:autoCollect(3,false)
    if bot:inWorld() and bot:getCurrentWorld():upper()==dropseedworld:upper() then
        recon1()
        for V,c in pairs(bot:getTiles()) do
            if c.fg==iddropseed or c.bg==iddropseed then
                bot:findPath(c.x,c.y)
                sleep(500)
                while bot:getItemCount(B)>0 do
                    sleep(1500)
					bot:move(RIGHT,1)
					sleep(1000)
                    droppp(B)
                    sleep(2000)
                    recon1()
                    if bot:getItemCount(B)==0 then goto C end
                end
            end
        end
        ::C::
        sleep(1000)
    end
end

function droppp(B)
local counts=bot:getItemCount(B)
    sleep(1500)
    if bot:inWorld() then
        bot:sendPacket("action|drop\n|itemID|"..B,2)
    	sleep(1500)
        bot:sendPacket("action|dialog_return\ndialog_name|drop_item\nitemID|"..B.."|\ncount|"..counts,2)
        sleep(2000)
    end
end

function droppix(B)
    if bot:getCurrentWorld():upper()~=pickaxeworld:upper() then
        join(pickaxeworld,pickaxeworldid)
        sleep(4500)
        recon1()
    end
    bot:autoCollect(3,false)
    if bot:inWorld() and bot:getCurrentWorld():upper()==pickaxeworld:upper() then
        recon1()
        for V,c in pairs(bot:getTiles()) do
            if c.fg==iddroppix or c.bg==iddroppix then
                bot:findPath(c.x,c.y)
                sleep(500)
                while bot:getItemCount(B)>0 do
                    sleep(1500)
					bot:move(RIGHT,1)
					sleep(1000)
                    droppixx(B)
                    sleep(2000)
                    recon1()
                    if bot:getItemCount(B)==0 then goto C end
                end
            end
        end
        ::C::
        sleep(1000)
    end
end

function droppixx(B)
local countss=bot:getItemCount(98) -1
    if bot:inWorld() then
        bot:sendPacket("action|drop\n|itemID|"..B,2)
    	sleep(1500)
        bot:sendPacket("action|dialog_return\ndialog_name|drop_item\nitemID|"..B.."|\ncount|"..countss,2)
        sleep(2000)
    end
end

function takepix()
    for _,object in pairs(bot:getObjects()) do
        if object.id == 98 then
            local posX = math.floor(object.pos.x / 32)
            local posY = math.floor(object.pos.y / 32)
            bot:autoCollect(3,true)
            sleep(200)
            bot:findPath(posX, posY)
            sleep(2000)
            if bot:getItemCount(98) > 0 then
                bot:autoCollect(3,false)
                break
            end
            sleep(50)
        end
    end
end

function pakepix()
    packet = {}
    packet.type = 10 
    packet.int_data = 98 -- Clothing ID (Jeans)
    bot:sendPacketRaw(packet)
end

function takepixlu()
    if takepickaxe then
        if bot:getItemCount(98) == 0 then
            join(pickaxeworld,pickaxeworldid)
            sleep(500)
            takepix()
            if bot:getItemCount(98) > 1 then
                droppix(98)
                sleep(200)
                pakepix()
            elseif bot:getItemCount(98) == 1 then
                sleep(200)
                pakepix()
            end
        elseif bot:getItemCount(98) >= 1 then
            pakepix()
        end
    end
end

takepixlu()
            
            

while true do
    for _,bijimu in pairs(Botak[bot:getLocal.name:upper()].farmworld) do
        lists = bijimu:upper()
        ready=0
        recon1()
        join(lists,farmworldid)
        sleep(200)
        readycoy()
        degshook("Start New World" ..lists,"Online")
        while ready == 1 do
            if bot:getItemCount(Idblock) < 150 then
                join(lists,farmworldid)
                harvestgeng()
                sleep(1000)
            end
            if bot:getItemCount(Idblock) >= 150 then
                join(lists,farmworldid)
                pnb()
                sleep(1000)
            end
            if bot:getItemCount(Idseed) > 0 and plantseed == true then
                join(lists,farmworldid)
                plantoi()
                sleep(1000)
            elseif bot:getItemCount(Idseed) >= 150 and plantseed == false then
                dropbijilu(Idseed)
                sleep(500)
                join(lists,farmworldid)
            end
            if bot:getLocal().gems>=packprice*mindroppack then
                buypack()
                join(lists,farmworldid)
                sleep(1000)
            end
            if bot:getItemCount(Idseed) >= 150 then
                dropbijilu(Idseed)
                sleep(1000)
                join(lists,farmworldid)
            end
            readycoy()
        end
        restcount=restcount+1
        if restcount==Restafter then
            restbotak()
        end
    end
    if loopbang == false then
        break
    end
end
        


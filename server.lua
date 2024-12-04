function ch_give(idname, player, choice)
  local user_id = vRP.getUserId(player)
  local my_name = GetPlayerName(source)
  if user_id ~= nil then
    vRPclient.getNearestPlayer(
      player,
      {10},
      function(nplayer)
        if nplayer ~= nil then
          local nuser_id = vRP.getUserId(nplayer)
          local nuser_name = GetPlayerName(nplayer)
          if nuser_id ~= nil then
            vRP.prompt(
              player,
              lang.inventory.give.prompt({format_num(vRP.getInventoryItemAmount(user_id, idname))}),
              "",
              function(player, amount)
                local amount = parseInt(amount)

                if amount > 100 then
                  vRPclient.notify(player, {"아이템 거래는 최대 100개까지만 가능합니다."})
                  return
                end

                local new_weight = vRP.getInventoryWeight(nuser_id) + vRP.getItemWeight(idname) * amount
                if new_weight <= vRP.getInventoryMaxWeight(nuser_id) then
                  local result = vRP.tryGetInventoryItem(user_id, idname, amount, true, false, true)
                  if result then
                    if type(result) == "table" and result.type and result.content then
                      vRP.giveInventoryItem(nuser_id, idname, amount, result, true, false, true)
                    else
                      vRP.giveInventoryItem(nuser_id, idname, amount, true, false, true)
                    end
                    local names = vRP.getItemName(idname) or "인투디언노운"
                    vRP.basicLog("logs/sendItem.txt", user_id .. " to " .. nuser_id .. " | " .. idname .. " | " .. amount)
                    sendToDiscord_item(65280, "아이템 선물로그", "**" .. my_name .. "(" .. user_id .. ")님이 " .. nuser_name .. "(" .. nuser_id .. ")님에게 " .. vRP.getItemName(idname) .. " " .. comma_value(amount) .. "개를 선물하였습니다.**", os.date("전달일시 : %Y년 %m월 %d일 %H시 %M분 %S초 | Made By MONEKY"))
                    vRPclient.playAnim(player, {true, {{"mp_common", "givetake1_a", 1}}, false})
                    vRPclient.playAnim(nplayer, {true, {{"mp_common", "givetake2_a", 1}}, false})
                  else
                    vRPclient.notify(player, {lang.common.invalid_value()})
                  end
                else
                  vRPclient.notify(player, {lang.inventory.full()})
                end
              end
            )
          else
            vRPclient.notify(player, {lang.common.no_player_near()})
          end
        else
          vRPclient.notify(player, {lang.common.no_player_near()})
        end
      end
    )
  end
end

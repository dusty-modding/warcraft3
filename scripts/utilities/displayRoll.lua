function displayroll (p)
  local color = udg_playerColor[GetConvertedPlayerId(GetTriggerPlayer())]
  local dice = tostring(I2S(GetRandomInt(0, 100)))

  DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 10, "[" ..color ..GetPlayerName(p) .."|r] Rolled: |cffFFCD28" ..dice .."|r")
end

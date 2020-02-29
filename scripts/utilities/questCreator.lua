function questCreator (name, desc, icon, isReq)
  local qst = CreateQuest()
  local req = false

  if isReq then
    req = true
  end

  QuestSetTitle(qst, name)
  QuestSetDescription(qst, desc)
  QuestSetIconPath(qst, icon)
  QuestSetRequired(qst, req)


  req = nil

  return qst
end

function buildQuestReq (qst, requirements, desc)
  local r = nil
  local newDesc = ''

  for i = 1, #requirements do
    r = requirements[i]

    newDesc = newDesc ..r ..'|n'
  end

  newDesc = newDesc ..'|n|n' ..desc

  QuestSetDescription(qst, newDesc)

  newDesc = nil
  r = nil

  return qst
end

function questCreator (name, desc, icon, isReq)
  local qst = CreateQuest()
  local req = isReq or false

  QuestSetTitle(qst, name)
  QuestSetDescription(qst, desc)
  QuestSetIconPath(qst, icon)
  QuestSetRequired(qst, req)

  req = nil

  return qst
end

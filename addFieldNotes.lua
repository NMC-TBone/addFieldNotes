-- Author:[NMC]T-Bone
-- Name:addFieldNotes
-- Description:Adds a note to all fields on the map.
-- Icon:iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAALtJREFUeNpiYKACcADi/2RiBxaYKQkJCQwKCgpE2fjgwQOGBQsWoLpg//79/9HB/fv3/zs4OIAxMgCpxXABOvjw4QNDYGAgw4ULF/C6hgmb4IQJExgUFRUJasZpQGFhIdgFBgYG5BkAClCg/xkCAgIIGoA1DObPn090GmCiNBENvAEs+CTt7e0ZGhoa4HxQtBoaGqIkFxZkSVyGgMCBAwfQ1SSCtJGbmRJgpjACsQAQG5Dg7Q8wm0EAIMAAt5l0Tb4vJHoAAAAASUVORK5CYII=
-- Hide: no

--- Add a note to a given field node
local function addNoteToField(fieldNode)
    local fieldMapIndicator = getChild(fieldNode, "fieldMapIndicator")
    local name = getName(fieldNode)
    local fieldNumber = string.match(name, "%d+")
    local note = createNoteNode(fieldMapIndicator, fieldNumber, nil, nil, nil, true)
    setName(note, "Field "..fieldNumber)
    setTranslation(note, 0.0, 0.0, 0.0)
end

--- Add notes main function
local function addNotes(parent)
    local numFields = getNumOfChildren(parent)
    for i=0, numFields-1 do
        local fieldNode = getChildAt(parent, i)
        addNoteToField(fieldNode)
    end
end

local fieldsParent = getSelection(0)

if fieldsParent == 0 or getUserAttribute(fieldsParent, "onCreate") ~= "FieldUtil.onCreate" then
    print("Select your main fields transform group")
    return
end

addNotes(fieldsParent)


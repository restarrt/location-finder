--script to localize stuff better
--type the name of the object and the script will print where it is perfectly
--by reestart

local objectname = ""









local objectsfoundwithobjectname = {}
local foundany = false
local parentsize = 100
local showlocationstrofobjects = {} --locations will be shown in here, of the objects with the same name
local currentparent --will be used for location.

for i,v in pairs(game:GetDescendants()) do
   if v.Name == objectname then
      table.insert(objectsfoundwithobjectname, v)
      table.insert(showlocationstrofobjects, "")
      foundany = true
   end
end

if foundany then
   for i,v in pairs(objectsfoundwithobjectname) do
      currentparent = v
      showlocationstrofobjects[i] = objectname
      for x = 1, parentsize do
         if currentparent ~= nil then
            currentparent = currentparent.Parent
            if currentparent == nil then
            print(showlocationstrofobjects[i])
            break
            else
            showlocationstrofobjects[i] = currentparent.Name.."."..showlocationstrofobjects[i]
            end
         else
            print(showlocationstrofobjects[i])
            break
         end
      end
   end
else
  print("didn't find object, are you sure you entered the right name?")
end

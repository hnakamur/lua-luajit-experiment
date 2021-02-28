-- http://lua-users.org/wiki/FileInputOutput

-- see if the file exists
function file_exists(file)
  local f = io.open(file, "rb")
  if f then f:close() end
  return f ~= nil
end

-- get all lines from a file, returns an empty 
-- table if the file does not exist
function lines_from(file)
  if not file_exists(file) then return {} end
  lines = {}
  for line in io.lines(file) do 
    lines[#lines + 1] = line
  end
  return lines
end

-- tests the functions above
local lines = lines_from("enwik8")

local startime = 0
local endtime = 0

-- Add line numbers, a tab, and line contents
local function add_line_number(k, v)
  return string.format('%6d',k) .. '\t' .. v .. '\n'
end

local outfilestrarray = {}
starttime = os.clock()
for k,v in pairs(lines) do
  table.insert(outfilestrarray, add_line_number(k, v))
end
endtime = os.clock()
print(endtime-starttime)

local outfile = io.open('enwik8_out',"w")
outfile:write(table.concat(outfilestrarray))
outfile:close()

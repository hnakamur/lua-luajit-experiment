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

-- Add line numbers, a tab, and line contents
local outfilestrarray = {}

local startime = 0
local endtime = 0

local function tohex(str)
  return (str:gsub('.', function (c)
    return string.format('%02x', string.byte(c))
  end))
end

starttime = os.clock()
local hmac = require("resty.hmac")
local key = '01234567890123456789012345678901'
local hmac_sha256 = hmac:new(key, hmac.ALGOS.SHA256)
local update_time = 0
for k,v in pairs(lines) do
  local t1 = os.clock()
  hmac_sha256:update(v)
  update_time = update_time + (os.clock() - t1)
end
local t1 = os.clock()
local mac = hmac_sha256:final()
endtime = os.clock()
print(endtime-starttime)
print(update_time)
print(endtime - t1)
print(tohex(mac))

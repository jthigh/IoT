function auth(newKey) 
  local oldKey
  local keyNum
  
  fd = file.open("authkey", "r"); oldKey = fd:read(); fd:close()
  fd = file.open("keynum", "r"); keyNum = fd:read(); fd:close()

  if (oldKey == crypto.toHex(crypto.hash("sha1", newKey))) then
    -- Authentication successful
    fd = file.open("authkey", "w+"); fd:write(newKey); fd:close()    
    fd = file.open("keynum", "w+"); fd:write(keyNum-1); fd:close()    
    return true
  else
    return false
  end
end    

ka = {}

local ONLINE = false

mud.on_connect(function () ONLINE = true end)
mud.on_disconnect(function () ONLINE = false end)

function ka.keep_alive()
    local keepalive = timer.add(30,0,function ()
        if ONLINE then 
            mud.send_bytes({0xff, 0xf1}) 
        end
      end)      
end

return ka
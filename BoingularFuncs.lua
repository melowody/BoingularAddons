-----------------------
---    FUNCTIONS    ---
-----------------------

function Card:extinct(quote, sound)
    G.E_MANAGER:add_event(Event({
        func = function()
            if sound then
                play_sound(sound)
            end
            self.T.r = -0.2
            self:juice_up(0.3, .4)
            self.states.drag.is = true
            self.children.center.pinch.x = true
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.3,
                blockable = false,
                func = function()
                    G.jokers:remove_card(self)
                    self:remove()
                    self = nil
                    return true;
                end
            }))
            return true
        end
    }))
    if quote then
        return {
            message = quote
        } 
    end
end

function PRINT_TABLE( t )
 
    local printTable_cache = {}
 
    local function sub_printTable( t, indent )
 
        if ( printTable_cache[tostring(t)] ) then
            print( indent .. "*" .. tostring(t) )
        else
            printTable_cache[tostring(t)] = true
            if ( type( t ) == "table" ) then
                for pos,val in pairs( t ) do
                    if ( type(val) == "table" ) then
                        print( indent .. "[" .. pos .. "] => " .. tostring( t ).. " {" )
                        sub_printTable( val, indent .. string.rep( " ", string.len(pos)+8 ) )
                        print( indent .. string.rep( " ", string.len(pos)+6 ) .. "}" )
                    elseif ( type(val) == "string" ) then
                        print( indent .. "[" .. pos .. '] => "' .. val .. '"' )
                    else
                        print( indent .. "[" .. pos .. "] => " .. tostring(val) )
                    end
                end
            else
                print( indent..tostring(t) )
            end
        end
    end
 
    if ( type(t) == "table" ) then
        print( tostring(t) .. " {" )
        sub_printTable( t, "  " )
        print( "}" )
    else
        sub_printTable( t, "  " )
    end
end

function Card:destroy(color, sound)
    G.GAME.joker_buffer = G.GAME.joker_buffer - 1
    G.E_MANAGER:add_event(Event({func = function()
        G.GAME.joker_buffer = 0
        self:start_dissolve({HEX(color)}, nil, 1.6)
        if sound then
            play_sound(sound, 0.96+math.random()*0.08)
        end
    return true end }))
end
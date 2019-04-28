local vRPAnchor = class("vRPAnchor", vRP.Extension)

local function menu_boat(self)
    local function m_anchor(menu)
        local user = menu.user
        local inboat = self.remote.isPedInAnyBoat(user.source)

        if inboat then
            vRP.EXT.Base.remote._notify(user.source, "Must be standing on boat to anchor")
        else
            self.remote.anchor(user.source)
            vRP.EXT.Base.remote._notify(user.source, "Boat anchored")
        end
    end

    local function m_unanchor(menu)
        local user = menu.user
        local inboat = self.remote.isPedInAnyBoat(user.source)

        if inboat then
            self.remote.unanchor(user.source)
            vRP.EXT.Base.remote._notify(user.source, "Boat un-anchored")
        else
            vRP.EXT.Base.remote._notify(user.source, "Must be driving boat to un-anchor")
        end
    end

    vRP.EXT.GUI:registerMenuBuilder("boat", function(menu)
        local user = menu.user
        menu.title = "Boat"
        menu.css.header_color = "rgba(0,125,255,0.75)"
        menu:addOption("Anchor Boat", m_anchor)
        menu:addOption("Unanchor Boat", m_unanchor)
    end)
end

function vRPAnchor:__construct()
    vRP.Extension.__construct(self)
    menu_boat(self)

    local function m_boat(menu)
        local user = menu.user
        menu.user:openMenu("boat")
    end

    vRP.EXT.GUI:registerMenuBuilder("vehicle", function(menu)
        menu:addOption("Boat", m_boat)
    end)
end

vRP:registerExtension(vRPAnchor)

-- Copyright (C) 2007, 2010 - Bit-Blot
--
-- This file is part of Aquaria.
--
-- Aquaria is free software; you can redistribute it and/or
-- modify it under the terms of the GNU General Public License
-- as published by the Free Software Foundation; either version 2
-- of the License, or (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
--
-- See the GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.

if not v then v = {} end
if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end

-- activate a temp barrier with a faulty orb

function init(me)
	node_setCursorActivation(me, false)
end

function activate(me)
	local orb = node_getNearestEntity(me, "EnergyOrb")
	if orb ~= 0 and entity_isState(orb, STATE_CHARGED) then
		debugLog("BOSS NODE ACTIVATED")
		local barrier = getEntityByID(5)
		if barrier ~= 0 then
			debugLog("Setting barrier to pulse")
			entity_setState(barrier, STATE_PULSE)
		else
			debugLog("Did not find barrier")
		end
	end
end

function update(me, dt)
end

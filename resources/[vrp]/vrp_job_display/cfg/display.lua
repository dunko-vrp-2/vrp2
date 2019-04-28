--[[
    FiveM Scripts
    Copyright C 2018  Sighmir

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published
    by the Free Software Foundation, either version 3 of the License, or
    at your option any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
]]

--      height: 50px;
--      width: 50px;
--	  top: 180px;
--      right: 20px;

--  top: 180px;
--  right: 20px;
--  font-size: 20px;
-- 240
-- 270

local cfg = {}

cfg.firstjob = false -- set this to your first job, for example "citizen", or false to disable

-- text display css
cfg.display_css = [[
.div_job{
  position: absolute;
  top: 150px;
  right: 20px;
  font-size: 40px;
  font-weight: bold;
  font-family: 'GTA';
  color: white;
  text-shadow: 3px 3px 2px rgba(0, 0, 0, 0.80);
}
]]
return cfg


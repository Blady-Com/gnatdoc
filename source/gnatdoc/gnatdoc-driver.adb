------------------------------------------------------------------------------
--                    GNAT Documentation Generation Tool                    --
--                                                                          --
--                       Copyright (C) 2022, AdaCore                        --
--                                                                          --
-- This is free software;  you can redistribute it  and/or modify it  under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 3,  or (at your option) any later ver- --
-- sion.  This software is distributed in the hope  that it will be useful, --
-- but WITHOUT ANY WARRANTY;  without even the implied warranty of MERCHAN- --
-- TABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public --
-- License for  more details.  You should have  received  a copy of the GNU --
-- General  Public  License  distributed  with  this  software;   see  file --
-- COPYING3.  If not, go to http://www.gnu.org/licenses for a complete copy --
-- of the license.                                                          --
------------------------------------------------------------------------------

with GNATdoc.Command_Line;
with GNATdoc.Configuration.Command_Line;
with GNATdoc.Configuration.Project;
with GNATdoc.Backend.HTML;
with GNATdoc.Frontend;
with GNATdoc.Projects;

procedure GNATdoc.Driver is
   PF_Provider : aliased
     GNATdoc.Configuration.Project.Project_Configuration_Provider;
   CL_Provider : aliased
     GNATdoc.Configuration.Command_Line.Command_Line_Configuration_Provider
       (PF_Provider'Unchecked_Access);

   Backend : GNATdoc.Backend.HTML.HTML_Backend;

begin
   GNATdoc.Command_Line.Initialize;
   GNATdoc.Projects.Initialize;

   GNATdoc.Configuration.Provider := CL_Provider'Unchecked_Access;

   Backend.Initialize;
   GNATdoc.Projects.Process_Compilation_Units
     (GNATdoc.Frontend.Process_Compilation_Unit'Access);
   Backend.Generate;
end GNATdoc.Driver;

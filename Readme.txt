Behold The ADAPTO FLEX!! http://reprap.org/wiki/Adapto_Flex
	Originated from the Adapto https://github.com/rotorit/Adapto

The thought behind the Adapto Flex is to support a more flexible variety of tool heads(thus Adapto Flex).

Currently the paste extruder mount and support for Mutley's Flex3Drive system(http://mutley3d.com/Flex3Drive/) exist in working complete tool head options. In the pipeline for mountable tool heads will be a dual extruder configuration, single extruder configuration, pen holder, and cable driven dremel mount(more suggestions and contributions welcome).

There are design changes with the Adapto Flex, notably implementing the Vertical X Standard(http://reprap.org/wiki/Vertical_X_Axis_Standard) and moving the Z axis smooth rods to the sides of the Z frame instead of in front of the Z frame. This has allowed for shrinking the X ends making them stronger with less material use, and relocating the belt and drive motor position to run between the X smooth rods.

The X carriage is a flat plate style with four bolt holes. This allows for mounting a variety of tool heads increasing the printers versatility. It is suggested to use a SmoothieBoard with the printer and leveraging the ability to swap out config files quickly and easily per tool head setup instead of having to re-flash the controller firmware each time you swap tool heads.

This design still retains the ability to use either Alu extrusions (20x20mm), wood, alu, acryl plates or plates made out of any material(if it is stiff enough). Smooth rods can still be of any length, however the upper cross frame piece must be the same length as the front and rear lower frame pieces now(X axis). It is recommended to use 20x20mm aluminum T-slot extrusion for the frame and 10mm smooth rods.

Example STLs have been provided to view the parts on github. Most parts are based on RoTorITs design but either combined to reduce part count, save plastic, or make the design more versatile. A few parts are t00ties designs or t00ties code re-structured to handle the central config file better(these files retain t00ties copyright headings in them).

On the todo list is:
  -Endstop holders

ENJOY!

Making the STLs
---------------
Edit ./inc/configuration.scad to suit your needs. Check the resulting parts for sanity.

On linux make the stls by typing one of
make -k
make -k -j12

If openscad is in your path this should result in lots of new files in the "output" directory.
The _x# in the file names is the amount of a given part that needs to be printed.

Creative Commons - GNU GPL license
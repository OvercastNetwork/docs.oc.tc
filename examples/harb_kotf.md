---
layout: page

category: "Examples"
category_lead:  "XML File Examples"
title:  "Harb KoTF"

---

[<i class="fa fa-share right-ref-link"></i>](/modules/main)
Specify the XML file version and then open the main map module and specify the maps name, version and objective.

     <?xml version="1.0"?>
     <map proto="1.3.0">
     <name>Harb KoTF</name>
     <version>2.1</version>
     <objective>Hold the flag for the most amount of time to win!</objective>

Specify the map's authors. Each author can be given an optional attribute `contribution=""` attribute to set to their specific contribution to the map.

    <authors>
        <author uuid="1379cb6e-f291-4498-9807-e636f9674ac0" contribution="Map Author"/> <!-- SH4D0W_HAWK -->
        <author uuid="ef4ea031-998f-4ec9-b7b6-1bdd428bcef8" contribution="Map Author"/> <!-- Plastix -->
    </authors>

[<i class="fa fa-share right-ref-link"></i>](/modules/teams)
Defining two teams, use their respective [colors](/reference/formatting#chatColors) and names. You must have a `max` to specify the amount of players who can play, keep in mind however this is not the maximum capacity. Donors and staff will be able to join above the `max`. To combat this, use `max-overfill` with a number greater than the `max`.

    <teams>
        <team id="blue" color="blue" max="40">Blue</team>
        <team id="red" color="dark red" max="40">Red</team>
    </teams>

[<i class="fa fa-share right-ref-link"></i>](/modules/gamemode_ctf)
This map uses flags as the primary objective. To define a flag, you must use the `<flags>` module and at least define a `post`, as that's the only one required. In this example, the `yaw` makes the flag turn 90 degrees. You may have multiple post locations that the flag spawns at.
The flag, when picked up and dropped off, yields a kit that is referred to elsewhere in the file. You may customize what happens once a flag is picked up.
    <flags>
        <post id="post" return-time="0s" yaw="90">
            <block>-47.5,32,0.5</block>
            <block>-29.5,40,0.5</block>
            <block>0.5,33,0.5</block>
            <block>30.5,40,0.5</block>
            <block>48.5,32,0.5</block>
        </post>
        <flag name="Flag" id="flag" shared="true" post="post" points-rate="0.5" pickup-kit="get-flag" drop-kit="reset-flag"/>
    </flags>

[<i class="fa fa-share right-ref-link"></i>](/modules/filters)
Filters are used to apply a certain true-false condition. In these filters, `no-lantern` is used to deny the block breaking of a sea lantern, `no-sewers` is used similarly to deny access to the lower part of the sewers, and `no-carrier` is used to deny the flag carrier to certain locations.

    <filters>
        <filter name="no-lantern">
            <deny>
                <block>sea lantern</block>
            </deny>
        </filter>
        <filter name="no-sewers">
            <deny>
                <block>stained glass</block>
            </deny>
        </filter>
        <filter name="no-carrier">
            <not>
                <carrying-flag>flag</carrying-flag>
            </not>
        </filter>
     </filters>
     
[<i class="fa fa-share right-ref-link"></i>](/modules/regions)
In these regions, there are many different regions that provide different functions:
- `outside-map` provides a boundary by defining three different rectangles. You cannot leave. Using a union, you can combine regions.
- `portals-area` defines a region that refers to disable editing in the portal area.
- `no-lantern` disables the ability to destroy the block under the flag in the whole `map` region.
- `no-sewers` disables the ability to edit stained glass and access sewers in the whole `map` region.
- The `<apply block-break="deny-all" region="map"/>` is applied to the whole map, making it to where you cannot break any blocks.
- `outside-map` restricts a user from leaving the map boundaries or editing outside of the map boundaries.
- `no-carrier` restricts a user carrying the flag from entering the bases.

    <regions>
        <negative name="outside-map">
            <union name="map">
                <rectangle name="main-area" min="-50,-32" max="51,33"/>
                <union name="bases">
                    <rectangle name="blue-base" min="-20,-62" max="21,-32"/>
                    <rectangle name="red-base" min="-20,33" max="21,63"/>
                </union>
            </union>
        </negative>
        <complement name="portals-area">
            <rectangle min="-56,-2" max="57,3"/>
            <region name="main-area"/>
        </complement>
        <apply block="deny-all" region="portals-area" message="You may not edit the portal area"/>
        <apply block-break="no-lantern" region="map" message="You may not break this block since a flag may spawn here"/>
        <apply block-break="no-sewers" region="map" message="Sewer entry is disabled for this gamemode"/>
        <apply block-break="deny-all" region="map"/>
        <apply block="deny-all" enter="deny-all" region="outside-map" message="You may not interact with the game outside the map"/>
        <apply enter="no-carrier" region="bases" message="Flag carrier cannot enter the bases"/>
    </regions>

[<i class="fa fa-share right-ref-link"></i>](/modules/kits)
This defines the spawn kits. In this example, both teams get the same kit. 
</br>
**Two special kits are applied:**
- `get-flag`, which lowers the health and gives night vision.
- `reset-flag`, which happens to reset you to normal once the flag is dropped.
</br>

    <kits>
        <kit name="spawn">
            <item slot="0">stone sword</item>
            <item slot="1" enchantment="arrow infinite:1">bow</item>
            <item slot="28" amount="1">arrow</item>
            <item slot="2" amount="2">tnt</item>
            <item slot="3" amount="1">golden apple</item>
            <item slot="4" amount="32">ladder</item>
            <potion duration="5">heal</potion>
            <potion duration="5">damage resistance</potion>
        </kit>
        <kit name="red" parents="spawn">
            <helmet locked="true" color="cd0000" unbreakable="true">leather helmet</helmet>
            <chestplate locked="true" color="cd0000" enchantment="protection explosions:3" unbreakable="true">leather chestplate</chestplate>
            <leggings locked="true" color="cd0000" unbreakable="true">leather leggings</leggings>
            <boots locked="true" color="cd0000" unbreakable="true">leather boots</boots>
        </kit>
        <kit name="blue" parents="spawn">
            <helmet locked="true" color="0066cc" unbreakable="true">leather helmet</helmet>
            <chestplate locked="true" color="0066cc" enchantment="protection explosions:3" unbreakable="true">leather chestplate</chestplate>
            <leggings locked="true" color="0066cc" unbreakable="true">leather leggings</leggings>
            <boots locked="true" color="0066cc" unbreakable="true">leather boots</boots>
        </kit>
        <kit name="get-flag" force="true">
            <potion duration="oo" amplifier="-4">health boost</potion>
            <potion duration="oo">night vision</potion>
        </kit>
        <kit name="reset-flag" force="true">
            <potion duration="0" amplifier="0">health boost</potion>
            <potion duration="0">night vision</potion>
        </kit>
    </kits>

[<i class="fa fa-share right-ref-link"></i>](/modules/spawns)
Both teams have defined spawns that they are taken to. `sequential` spawns players at the next region in a list if the one prior to it isn't safe, and requires `safe="true"` to function. The `default` is the spectator spawn, where newly joined players will spawn at.

    <spawns>
        <spawns safe="true" sequential="true">
            <spawn team="blue" kit="blue" yaw="0">
                <cuboid min="-15,32,-57" max="16,42,-32"/>
                <point>0.5,33,-47.5</point>
            </spawn>
            <spawn team="red" kit="red" yaw="180">
                <cuboid min="-15,32,33" max="16,42,58"/>
                <point>0.5,33,48.5</point>
            </spawn>
        </spawns>
        <default yaw="90">
            <cuboid min="-75.5,42.5,-0.5" max="-73.5,42.5,1.5"/>
        </default>
    </spawns>

[<i class="fa fa-share right-ref-link"></i>](/modules/portals)
Portals are used to transport a player via walking through a region. The `x=""` is used to offset the player's X axis.

    <portals filter="no-carrier">
        <portal x="110">
            <cuboid min="-56,33,-1" max="-55,35,2"/>
        </portal>
        <portal x="-110">
            <cuboid min="56,33,-1" max="57,35,2"/>
        </portal>
    </portals>

The score is the amount required in order for the match to determine a winner.

    <score>
        <limit>200</limit>
    </score>

[<i class="fa fa-share right-ref-link"></i>](/modules/repair_remove_keep)
These are used to define what should be either repaired upon pickup, or removed from the map under any circumstance.

    <toolrepair>
        <tool>stone sword</tool>
        <tool>bow</tool>
        <tool>shears</tool>
    </toolrepair>
    <itemremove>
        <item>leather helmet</item>
        <item>leather chestplate</item>
        <item>leather leggings</item>
        <item>leather boots</item>
        <item>arrow</item>
        <item>ladder</item>
        <item>cooked chicken</item>
        <item>glass bottle</item>
        <item>golden apple</item>
        <item>clay ball</item>
        <item>glowstone dust</item>
        <item>string</item>
    </itemremove>

[<i class="fa fa-share right-ref-link"></i>](/modules/killreward)
Once you kill a player, you will be given one golden apple and TNT block as a reward.

    <killreward>
        <item>golden apple</item>
        <item>tnt</item>
    </killreward>
    
[<i class="fa fa-share right-ref-link"></i>](/modules/tnt)
These are the behavioral modifications of TNT. It will instantly be primed, it does not require a license, you cannot defuse team TNT, it will not do damage to blocks,

    <tnt>
        <instantignite>on</instantignite>
        <licensing>off</licensing>
        <friendly-defuse>off</friendly-defuse>
        <blockdamage>off</blockdamage>
    </tnt>

Disable the ability for people to be hungry by disabling the depletion of hunger.

    <hunger>
        <depletion>off</depletion>
    </hunger>

Define how high a user can build. Once they reach the Y-axis of `48`, they will be restricted from building.
    <maxbuildheight>48</maxbuildheight>

Disable the ability to hurt your team, but any other means of TNT will hurt you, the enemy, and entities.

    <disabledamage>
        <damage ally="true" self="false" enemy="false" other="false">block explosion</damage>
    </disabledamage>

Finally, close the `<map>` tag.

    </map>

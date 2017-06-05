---
layout: page

category: "Examples"
category_lead:  "XML File Examples"
title:  "Arcane Realms"

---

[<i class="fa fa-share right-ref-link"></i>](/modules/main)
Specify the XML file version and then open the main map module and specify the maps name, version and objective. RFW is always a development phase.

    <?xml version="1.0"?>
    <map proto="1.2.0">
    <name>Arcane Realms</name>
    <version>1.2.1</version>
    <objective>Find and complete the Statue of Completion</objective>
    <phase>development</phase>


Specify the map's authors. Each author can be given an optional attribute `contribution=""` attribute to set to their specific contribution to the map.

    <authors>
    <author uuid="5ca79703-1be6-4dca-9073-59d024eb8bb0"/> <!-- koipen -->
    </authors>

Define the rules of the map with `<rules>`. The standard rules are disallowing dyed wools, and disallowing any form of exiting your lane.

    <rules>
        <rule>The players may not leave their lanes, or enter the void</rule>
        <rule>Find wool in chests, do not use dyes for wool.</rule>
    </rules>

[<i class="fa fa-share right-ref-link"></i>](/modules/teams)
Defining two teams, use their respective [colors](/reference/formatting#chatColors) and names. You must have a `max` to specify the amount of players who can play. This will generally be a very small number.

    <teams>
        <team id="blue" color="blue" max="4">Blue</team>
        <team id="red" color="dark red" max="4">Red</team>
    </teams>

This map allows you to damage your teammates.

    <friendlyfire>on</friendlyfire>
    
This map allows the normal daylight cycle throughout the map.

    <timelock>off</timelock>
    
Slimes are banned on this map using a filter to deny their spawn.

    <mobs>
        <filter>
            <deny><mob>slime</mob></deny>
        </filter>
    </mobs>

[<i class="fa fa-share right-ref-link"></i>](/modules/spawns)
Both teams have defined spawns that they are taken to. The `bedspawn="on"` attribute means that players will spawn at their beds, rather than the initial spawnpoint of the match. However, a spawnpoint is still required.

    <spawns bedspawn="on">
        <spawn team="blue" yaw="180"><point>72,80.5,260</point></spawn>
        <spawn team="red" yaw="180"><point>104,80.5,260</point></spawn>
        <default yaw="0"><cuboid min="86.5,84,279.5" max="89.5,84,282.5"/></default>
    </spawns>

[<i class="fa fa-share right-ref-link"></i>](/modules/filters)
Filters are used to apply a certain true-false condition. In these filters, `only-liquid` allows liquids to flow out of the lane by creating an exception with `<allow>` and the `monument-protection` disables the ability to edit the obsidian/signs in that specific region.

    <filters>
        <filter name="only-liquids" parents="deny-players">
            <allow>
                <block>water</block><block>stationary water</block>
                <block>lava</block><block>stationary lava</block>
            </allow>
        </filter>
        <filter name="monument-protection">
            <deny>
                <block>obsidian</block>
                <block>wall sign</block>
            </deny>
        </filter>
    </filters>

     
[<i class="fa fa-share right-ref-link"></i>](/modules/regions)
In these regions, there are many different regions that provide different functions:
- `monument-protection` protects the specified two regions from being edited.
- The `spawn protection` region denies any block breaking at spawn with `deny-all`.
- `only-liquids` allows liquids to flow out of the lane as the only one not abiding by the lane region.
- The rectangles that are named `color-lane` confine the user to their own lane/side.
- The `deny-all` that applies leaving makes it to where you cannot leave the playing field, and cannot enter the spawn.

    <regions>
        <!-- protect monuments -->
        <apply block="monument-protection">
            <cuboid name="blue-monument" min="68,94,201" max="73,97,206"/>
            <cuboid name="red-monument" min="103,94,201" max="108,97,206"/>
        </apply>

        <!-- spawn protection -->
        <apply block="deny-all" message="You may not break blocks at spawn">
            <rectangle name="spawn" min="-oo,256" max="oo,oo"/>
        </apply>

        <!-- prevent blocks from being placed / destroyed in the lane -->
        <apply block="only-liquids" message="You may not place or break blocks outside of your lane">
            <negative>
                <rectangle name="blue-lane" min="64,-oo" max="80,264"/>
                <rectangle name="red-lane" min="96,-oo" max="112,264"/>
            </negative>
        </apply>

        <!-- prevent players from entering the spawn area -->
        <apply leave="deny-all" message="You may not leave the playing field">
            <rectangle name="playable" min="-oo,-oo" max="oo,256"/>
            <rectangle name="red-spawn-area" min="96,256" max="112,264"/>
            <rectangle name="blue-spawn-area" min="64,256" max="80,264"/>
       </apply>
   </regions>

[<i class="fa fa-share right-ref-link"></i>](/modules/lanes)
The `<lanes>` refer to where blocks are prevented from being placed/destroyed. This is the element that makes Race for Wool's meta essentially work.
   
    <lanes>
        <lane team="blue"><region name="blue-lane"/></lane>
        <lane team="red"><region name="red-lane"/></lane>
    </lanes>

[<i class="fa fa-share right-ref-link"></i>](/modules/gamemode_ctw)
These define the colors that need to be retrieved and brought back. All that is required is where they are to be placed, using `<block>`

    <wools team="blue">
        <wool color="cyan"  ><block>68,95,205</block></wool>
        <wool color="lime"  ><block>68,95,201</block></wool>
        <wool color="orange"><block>72,95,203</block></wool>
    </wools>
    <wools team="red">
        <wool color="cyan"  ><block>107,95,205</block></wool>
        <wool color="lime"  ><block>107,95,201</block></wool>
        <wool color="orange"><block>103,95,203</block></wool>
    </wools>

Finally, close the `<map>` tag.

    </map>

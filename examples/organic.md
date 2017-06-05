---
layout: page

category: "Examples"
category_lead:  "XML File Examples"
title:  "Organic"

---

[<i class="fa fa-share right-ref-link"></i>](/modules/main)
Every map XML file starts with the XML header and then the base `<map>` module.

    <?xml version="1.0"?>
    <map proto="1.4.3">
    <name>Organic</name>
    <version>1.0.5</version>
    <objective>Leak the enemey's core 5 blocks!</objective>
    
Specify the map's authors. Each author can be given an optional attribute contribution="" attribute to set to their specific contribution to the map.

    <authors>
        <author uuid="57f5535d-6b9e-4013-ad71-e2cc63ec8d7c"/> <!-- ItzaMeLuigi -->
        <author uuid="5ca79703-1be6-4dca-9073-59d024eb8bb0" contribution="Building"/> <!-- koipen -->
    </authors>

The time is locked in place to what time the world is initially so a day and night cycle does not occur.

    <timelock>on</timelock>
    
Defining two teams, use their respective [colors](/reference/formatting#chatColors) and names. You must have a `max` to specify the amount of players who can play, keep in mind however this is not the maximum capacity. Donors and staff will be able to join above the `max`. To combat this, use `max-overfill` with a number greater than the `max`.

    <teams>
        <team color="dark red" max="20" id="red">Red</team>
        <team color="blue" max="20" id="blue">Blue</team>
    </teams>

[<i class="fa fa-share right-ref-link"></i>](/modules/kits)
This defines the spawn kits. In this example, both teams get the same kit. 

    <kits>
        <kit id="spawn">
            <item slot="0" material="diamond sword"/>
            <item slot="1" enchantment="arrow infinite:1" material="bow"/>
            <item slot="2" material="diamond pickaxe"/>
            <item slot="3" material="diamond axe"/>
            <item slot="4" amount="64" material="wood"/>
            <item slot="5" amount="32" material="glass"/>
            <item slot="6" amount="32" material="ladder"/>
            <item slot="7" amount="2" material="golden_apple"/>
            <item slot="8" amount="32" material="golden_carrot"/>
            <item slot="28" material="arrow"/>
            <potion amplifier="5" duration="4">damage resistance</potion>
        </kit>
        <kit id="kit-red" parents="spawn">
            <helmet color="993333">leather helmet</helmet>
        </kit>
        <kit id="kit-blue" parents="spawn">
            <helmet color="334CB2">leather helmet</helmet>
        </kit>
    </kits>
    
[<i class="fa fa-share right-ref-link"></i>](/modules/gamemode_dtc)
This is the component that makes Destroy the Core work. In order to win, you must leak the enemy's core. Each core has an owner, and a distance required for the core to leak. In this instance, the match will yield a win once the lava has leaked to `5` blocks below its source. Core regions apply only to the material, so air in the selection is fine. In this case, it is `obsidian`.

    <cores material="obsidian" leak="5" mode-changes="true">
        <core team="red">
            <region>
                <cuboid id="red-core" min="30,25,111" max="35,30,116" />
            </region>
        </core>
        <core team="blue">
	          <region>
                <cuboid id="blue-core" min="-45,25,111" max="-40,30,116" />
	          </region>
        </core>
    </cores>
    
This map uses `monument modes`. After a certain period of time, the obsidian material will change to `gold blocks`, then once the match time reaches `30m` the `gold blocks` will turn to `glass`.

<modes>
    <mode after="15m" material="gold block"/>
    <mode after="30m" material="glass"/>
</modes>

[<i class="fa fa-share right-ref-link"></i>](/modules/spawns)
Both teams have defined spawns that they are taken to. The `default` is the spectator spawn, where newly joined players will spawn at.
Spawning in a cuboid means that they will spawn in every block that is within the cuboid region at random.

    <spawns>
        <spawn team="red" kit="kit-red" yaw="0">
            <region>
                <cuboid id="red-spawn" min="23.5,19.5,40.5" max="25.5,19.5,42.5"/>
            </region>
        </spawn>
        <spawn team="blue" kit="kit-blue" yaw="0">
            <region>
                <cuboid id="blue-spawn" min="-35.5,19.5,40.5" max="-33.5,19.5,42.5"/>
            </region>
        </spawn>
        <default>
            <region yaw="180">
                <cuboid min="-5,62,0" max="-3,62,1"/>
            </region>
        </default>
    </spawns>
    
[<i class="fa fa-share right-ref-link"></i>](/modules/filters)
Filters are used to apply a certain true-false condition.
In these filters, `no-void` means you cannot build in the void, `only-red` means that the filter is applied only to red, and `only-blue` means that the filter is applied only to blue.

    <filters>
        <team id="only-blue">blue</team>
        <team id="only-red">red</team>
        <deny id="no-void">
           <void/>
        </deny>
    </filters>
    
[<i class="fa fa-share right-ref-link"></i>](/modules/regions)
In these regions, there are many different regions that provide different functions:
- `allow-block-place` allows blocks to be placed in its respective cuboid region.
- The `<negative>` applied to `void` also applied with `allow-block-place` means that you will be allowed to build in a specific region above the void, but nowhere else.
- The `everything` is the whole map, spanning infinitely using `oo` and `-oo` as coordinates.
- `spawns-break` prevents the spawn from being broken, and the `team-spawn-entry` prevents it from being entered.

    <regions>
        <union id="allow-block-place">
            <rectangle min="-75,22" max="65,149"/>
        </union>
        <negative id="void">
            <region id="allow-block-place"/>
        </negative>
        <rectangle id="everything" min="oo,oo" max="-oo,-oo"/>
        <union id="spawns-break">
            <cuboid id="red-spawn-entry" min="18,18,34" max="31,24,49"/>
            <cuboid id="blue-spawn-entry" min="-41,18,34" max="-28,24,49"/>
        </union>
        <apply block-break="never" block-place="never" message="You may not break spawn" region="spawns-break"/>
        <apply enter="only-red" message="You may not enter the enemy spawn" region="red-spawn-entry"/>
        <apply enter="only-blue" message="You may not enter the enemy spawn" region="blue-spawn-entry"/>
        <apply block-place="never" block-break="never" message="You may not edit the void area!" region="void"/>
    </regions>

[<i class="fa fa-share right-ref-link"></i>](/modules/repair_remove_keep)
These are used to define what should be either repaired upon pickup, or removed from the map under any circumstance.

    <itemremove>
        <item>obsidian</item>
        <item>string</item>
        <item>glowstone dust</item>
        <item>apple</item>
        <item>sapling</item>
        <item>sugar cane</item>
        <item>clay ball</item>
        <item>stone plate</item>
        <item>sand</item>
        <item>glass bottle</item>
        <item>golden apple</item>
        <item>leather helmet</item>
        <item>leather chestplate</item>
        <item>leather boots</item>
    </itemremove>
    <toolrepair>
        <tool>diamond sword</tool>
        <tool>bow</tool>
        <tool>diamond pickaxe</tool>
        <tool>diamond axe</tool>
    </toolrepair>

[<i class="fa fa-share right-ref-link"></i>](/modules/killreward)
Once you kill a player, you will be given one golden apple as a reward.

    <killreward>
        <item amount="1">golden apple</item>
    </killreward>
    
Define how high a user can build. Once they reach the Y-axis of `60`, they will be restricted from building.

    <maxbuildheight>60</maxbuildheight>

Finally, Close the main `<map>` module.

    </map>




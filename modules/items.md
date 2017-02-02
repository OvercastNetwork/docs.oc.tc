---
layout: page

category: "Modules"
title:  "Items & Armor"
nav_content:
  - path: "#heads"
    name: "Player Heads"
  - path: "#armor"
    name: "Armor"
  - path: "#potions"
    name: "Potions"
  - path: "#books"
    name: "Books"
  - path: "#enchantments"
    name: "Enchantments"
  - path: "#attributes"
    name: "Attribute Modifiers"
  - path: "#grenades"
    name: "Grenades"
  - path: "#can-destroy"
    name: "Can-Destroy / Can-Place-On"

---

The item elements are used to place items into a player's inventory or armor slots.
Items have many different attributes, and some may only apply to certain item types;
such as the leather armor `color` attribute.

Item names can be found with the [material finder](/reference/inventory#material_finder)
or on the [bukkit docs - Material](https://hub.spigotmc.org/javadocs/bukkit/org/bukkit/Material.html)
<h5>Item Element</h5>
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Element</th>
        <th>Description</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<item>' | escape_once}}</code>
          </span>
        </td>
        <td>
          A single item stack.
        </td>
      </tr>
    </tbody>
  </table>
</div>
<h5>Sub-Elements</h5>
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Element</th>
        <th>Description</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<enchantment> </enchantment>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <a href='#enchantments'>Enchantment</a>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<stored-enchantment> </stored-enchantment>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <a href='#enchantments'>Stored Enchantment (for enchanted books)</a>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<effect> </effect>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <a href='#potions'>Potion Effect</a>
          (only works on potion items)
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<attribute> </attribute>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <a href='#attributes'>Attribute Modifier</a>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<can-destroy> </can-destroy>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <a class='left-ref-link' href='#can-destroy'><i class="fa fa-chevron-down"></i></a>
          Materials that can be mined with the item
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<can-place-on> </can-place-on>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <a class='left-ref-link' href='#can-destroy'><i class="fa fa-chevron-down"></i></a>
          Materials that the item can be placed on
        </td>
      </tr>
    </tbody>
  </table>
  <h5>Item Attributes</h5>
</div>
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Attribute</th>
        <th>Description</th>
        <th>Value</th>
        <th>Default</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <code>material</code>
        </td>
        <td>
          <span class='label label-danger'>Required</span>
          The item's material name.
        </td>
        <td>
          <a href='/reference/inventory#material_matchers'>Material Name</a>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>slot</code>
        </td>
        <td>
          Slot where the item will be placed in the player's inventory.
          <br/>
          <i>If no slot is specified the item will be merged into the player's inventory.</i>
        </td>
        <td>
          <a href='/reference/inventory'>Inventory Slot</a>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>amount</code>
        </td>
        <td>The amount of items.</td>
        <td>
          <span class='label label-primary'>Number</span>
        </td>
        <td>1</td>
      </tr>
      <tr>
        <td>
          <code>damage</code>
        </td>
        <td>
          The item's damage, used for items such as birch logs.
        </td>
        <td>
          <span class='label label-primary'>Number</span>
        </td>
        <td>0</td>
      </tr>
      <tr>
        <td>
          <code>unbreakable</code>
        </td>
        <td>
          Specify if this item is unbreakable, hides the durability bar in minecraft.
        </td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>false</td>
      </tr>
      <tr>
        <td>
          <code>name</code>
        </td>
        <td>The item's display name.</td>
        <td>
          <span class='label label-primary'>String</span>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>lore</code>
        </td>
        <td>Custom lore string.</td>
        <td>
          <span class='label label-primary'>String</span>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>color</code>
        </td>
        <td>
          Leather armor color as a hexadecimal color. <code>RRGGBB</code>
          <br/>
          <i>Only applies to leather armor items.</i>
        </td>
        <td>
          <span class='label label-primary'>Hex Color</span>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>grenade</code>
        </td>
        <td>
          <a class='left-ref-link' href='#grenades'><i class="fa fa-chevron-down"></i></a>
          Projectile explodes on impact.
          <br/>
          <i>Works with ender pearls, snowballs, eggs, and arrows.</i>
        </td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>false</td>
      </tr>
      <tr>
        <td>
          <code>grenade-power</code>
        </td>
        <td>The power of the grenade explosion on impact.</td>
        <td>
          <span class='label label-primary'>Decimal</span>
        </td>
        <td>1.0</td>
      </tr>
      <tr>
        <td>
          <code>grenade-fire</code>
        </td>
        <td>
          Explosion creates fire.
        </td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>false</td>
      </tr>
      <tr>
        <td>
          <code>grenade-destroy</code>
        </td>
        <td>
          Explosion destroys blocks.
        </td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>true</td>
      </tr>
      <tr>
        <td>
          <code>prevent-sharing</code>
        </td>
        <td>
          Prevent this item from being moved from the player's inventory.
        </td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>false</td>
      </tr>
      <tr>
        <td>
          <code>projectile</code>
        </td>
        <td>
          Make this item shoot a custom projectile.
        </td>
        <td>
          <a href='/modules/projectiles'>Projectile ID</a>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>show-enchantments</code>
        </td>
        <td>
          Show enchantments in the item tooltip.
        </td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>true</td>
      </tr>
      <tr>
        <td>
          <code>show-attributes</code>
        </td>
        <td>
          Show attribute modifiers in the item tooltip.
        </td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>true</td>
      </tr>
      <tr>
        <td>
          <code>show-unbreakable</code>
        </td>
        <td>
          Show the unbreakable property in the item tooltip.
        </td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>true</td>
      </tr>
      <tr>
        <td>
          <code>show-can-destroy</code>
        </td>
        <td>
          Show the breakable block list in the item tooltip.
        </td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>true</td>
      </tr>
      <tr>
        <td>
          <code>show-can-place-on</code>
        </td>
        <td>
          Show the blocks the item can be placed on in the item tooltip.
        </td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>true</td>
      </tr>
      <tr>
        <td>
          <code>show-other</code>
        </td>
        <td>
          Show various other things in the item tooltip.
        </td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>true</td>
      </tr>
    </tbody>
  </table>
</div>
Items can be give custom names and lore with the `name` and `lore` attributes. Colors and fancy text in item names or lore can be specified with the grave symbol `` ` and then the [formatting code](/reference/formatting). You can specify multiple lines of lore using a pipe symbol `|` for line breaks.

    <item name="`6Golden Sword" material="gold sword"/> <!-- Gold sword with a gold/yellow name. -->
    <item lore="`4The One and Only" material="stick"/> <!-- A stick with the lore colored red. -->
    <item lore="`eWarning!|`5Does damage!" material="iron sword"/> <!-- A sword with 2 lines of lore. -->


<br/>

### Custom Heads {#heads}
Player heads can be given to players by using the heads element.

A player's skin data can be found by using `https://sessionserver.mojang.com/session/minecraft/profile/(UUID)`
There is a limit of one request a minute for each UUID so be sure to copy the data the first time.

    <head name="Cubist" uuid="3fbec7dd0a5f40bf9d11885a54507112">
        <skin>eyJ0aW1lc3RhbXAiOjE0NDY0MDgwOTExNzQsInByb2ZpbGVJZCI6IjNmYmVjN2RkMGE1ZjQwYmY5ZDExODg1YTU0NTA3MTEyIiwicHJvZmlsZU5hbWUiOiJDdWJpc3QiLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvOTRlZGExMjg4NWIzYmE2ZGY2ODMyZGZkMTIzNGEyNjc5MmQwNDI2ZDkyMDM2ZWVlYzc1M2ZiZmM2NmRiIn19fQ==</skin>
    </head>
<h5>
  Skin Data Lookup
</h5>
<i id='lookupInfo'>
  Opens a separate page with the JSON data for the specified UUID. You can find a player's UUID with
  <a href='http://mcuuid.net'>mcuuid.net</a>
</i>
<form id='queryUUIDForm' role='search'>
  <div class='form-group input-group'>
    <input class='form-control' disabled='true' id='queryField' placeholder='No Skin Lookup - JavaScript Disabled :(' type='search'>
    <span class='input-group-btn'>
      <button class='btn btn-default' type='submit'>
        <i class='fa fa-search'></i>
      </button>
    </span>
  </div>
</form>
<h5>Head Attributes</h5>
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Attribute</th>
        <th>Description</th>
        <th>Value</th>
        <th>Default</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <code>name</code>
        </td>
        <td>The heads display name.</td>
        <td>
          <span class='label label-primary'>String</span>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>uuid</code>
        </td>
        <td>
          <span class='label label-default' title='Can be either this attribute or a sub-element.'>Property</span>
          <span class='label label-danger'>Required</span>
          UUID used to identify the player this head belongs to.
        </td>
        <td>
          <span class='label label-primary'>String</span>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>skin</code>
        </td>
        <td>
          <span class='label label-default' title='Can be either this attribute or a sub-element.'>Property</span>
          <span class='label label-danger'>Required</span>
          The skin data used for this head.
        </td>
        <td>
          <span class='label label-primary'>String</span>
        </td>
        <td></td>
      </tr>
    </tbody>
  </table>
</div>
<h5>Head Sub-elements</h5>
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Element</th>
        <th>Description</th>
        <th>Value</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<uuid>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <span class='label label-default' title='Can be either this sub-element or an attribute.'>Property</span>
          <span class='label label-danger'>Required</span>
          UUID used to identify the player this head belongs to.
        </td>
        <td>
          <span class='label label-primary'>String</span>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<skin>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <span class='label label-default' title='Can be either this sub-element or an attribute.'>Property</span>
          <span class='label label-danger'>Required</span>
          The skin data used for this head.
        </td>
        <td>
          <span class='label label-primary'>String</span>
        </td>
      </tr>
    </tbody>
  </table>
</div>
<br/>

### Armor {#armor}
Armor slots have predefined tags to make it easier to give them to a player. They accept all of the properties of normal items, and may have their own special attributes.

    <helmet material="iron helmet"/>
    <chestplate material="diamond chestplate"/>
    <leggings material="gold leggings"/>
    <boots material="leather boots"/>


##### Armor Attributes
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Attribute</th>
        <th>Description</th>
        <th>Value</th>
        <th>Default</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <code>locked</code>
        </td>
        <td>Prevent this armor item from being removed from the armor slot in any way.</td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>false</td>
      </tr>
    </tbody>
  </table>
</div>
Enchanting, naming or giving armor lore works the same way as with items.

    <boots material="iron boots" lore="The Winged Boots of Hermes">
        <enchantment level="1">feather_falling</enchantment>
    </boots>

Items like leather armor are colored with the `color` attribute.
The color is represented in hexadecimal, see [dye colors](/reference/colors) for a list of hex colors for the different dyes.

`NOTE:` The hex color value is specified without the hash `#` symbol.

    <helmet color="cd0000" material="leather helmet"/>

<br/>

### Potions {#potions}

Potion items (including lingering and splash potions) can specify their potion type, and any number of custom effects.
The potion type determines the name and color of the item.
It also determines the default effects of the potion.
However, if any custom effects are present, they will completely replace the default effects.

By default when a player drinks a potion bottle the empty bottle is automatically removed from the players inventory.
This behavior can be disabled with the `<keep-potion-bottles/>` tag.

See [Potion Effects](/modules/potions) for details on the effects element.

Also see [Minecraft wiki - Potion](http://www.minecraftwiki.net/wiki/Potions)
and [Minecraft wiki - Status Effect](http://minecraft.gamepedia.com/Status_effect)
<h5>Potion Item Attributes</h5>
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Attribute</th>
        <th>Description</th>
        <th>Value</th>
        <th>Default</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <code>potion</code>
        </td>
        <td>
          Potion type
        </td>
        <td>
          <a href='http://minecraft.gamepedia.com/Potion#Data_values'>Potion ID</a>
        </td>
        <td>
          <code>minecraft:empty</code>
        </td>
      </tr>
    </tbody>
  </table>
</div>
<h5>Potion Item Sub-elements</h5>
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Element</th>
        <th>Description</th>
        <th>Value</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<effect>' | escape_once}}</code>
          </span>
        </td>
        <td>
          Custom effect
        </td>
        <td>
          <a href='/modules/potions'>Potion Effect</a>
        </td>
      </tr>
    </tbody>
  </table>
</div>
    <item slot="0" material="lingering potion" potion="strong_harming"/>
    <item slot="1" material="potion" potion="fire_resistance">
        <effect duration="15m">fire_resistance</effect>
    </item>

<br/>

### Auto Potion Bottle Remover
Empty potion bottles are removed automatically when a player drinks a potion.<br/>
This feature is enabled by default, but can be disabled with this tag.

    <keep-potion-bottles/>

<br/>

### Books {#books}
Written books can be created using the book element, the tile, author and individual pages can be formatted with [formatting codes](/reference/formatting). All normal item attributes can also be applied to books.

Each page in a book can contain a maximum of 13 lines, with approximately 19 characters per line. Preferably books should be written in-game to ensure proper formatting, and then translated into the books element.
<h5>Book Element</h5>
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Element</th>
        <th>Description</th>
        <th>Value</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<book>' | escape_once}}</code>
          </span>
        </td>
        <td>
          The element containing the books
          <code>{{'<title>' | escape_once}}</code>
          <code>{{'<author>' | escape_once}}</code>
          &
          <code>{{'<pages>' | escape_once}}</code>
        </td>
        <td>
          <span class='label label-primary'>Formatted Text</span>
        </td>
      </tr>
    </tbody>
  </table>
</div>
<h5>Book Sub-elements</h5>
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Element</th>
        <th>Description</th>
        <th>Value</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<title>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <span class='label label-danger'>Required</span>
          The title of the book.
        </td>
        <td>
          <span class='label label-primary'>Formatted Text</span>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<author>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <span class='label label-danger'>Required</span>
          The author of the book.
        </td>
        <td>
          <span class='label label-primary'>Formatted Text</span>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<pages>' | escape_once}}</code>
          </span>
        </td>
        <td>The pages in the book.</td>
        <td>
          <code>{{'<page>' | escape_once}}</code>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<page>' | escape_once}}</code>
          </span>
        </td>
        <td>
          A newline separated string. Used inside
          <code>{{'<pages>' | escape_once}}</code>
        </td>
        <td>
          <span class='label label-primary'>Formatted Text</span>
        </td>
      </tr>
    </tbody>
  </table>
</div>
    <book slot="1">
        <title>`6Example`r</title>
        <author>`4BB-8`r</author>
        <pages>
            <page>
                `lPage `1I`r
                This is an example
            </page>
            <page>
                `lPage `1II`r

                Nothing to see here, move along...
            </page>
            <!-- More pages -->
        </pages>
    </book>



<br/>

### Enchantments {#enchantments}

Any enchantment can be applied to any item and an item can have one or multiple enchantments.
The enchantment type can be specified by its
[Minecraft name](http://minecraft.gamepedia.com/Data_values#Enchantment_IDs) or
[Bukkit name](/reference/enchantments).

To store an enchantment in an enchanted book (instead of enchanting the book itself),
simply replace the tag `enchantment` with `stored-enchantment`.
<h5>Enchantment Element</h5>
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Element</th>
        <th>Description</th>
        <th>Value</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<enchantment> </enchantment>' | escape_once}}</code>
          </span>
        </td>
        <td>An item enchantment.</td>
        <td>
          <a href='/reference/enchantments'>Enchantment Name</a>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<stored-enchantment> </stored-enchantment>' | escape_once}}</code>
          </span>
        </td>
        <td>An enchantment stored in an enchanted book.</td>
        <td>
          <a href='/reference/enchantments'>Enchantment Name</a>
        </td>
        <td></td>
      </tr>
    </tbody>
  </table>
</div>
<h5>Enchantment Attributes</h5>
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Attribute</th>
        <th>Description</th>
        <th>Value</th>
        <th>Default</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <code>level</code>
        </td>
        <td>The specified enchantment's level.</td>
        <td>
          <span class='label label-primary'>Number</span>
        </td>
        <td>1</td>
      </tr>
    </tbody>
  </table>
</div>
Examples

    <!-- A sharpness II iron sword -->
    <item material="iron sword">
        <enchantment level="2">sharpness</enchantment>
    </item>

    <!-- A knockback IV stick -->
    <item material="stick">
        <enchantment level="4">knockback</enchantment>
    </item>

    <!-- Feather falling 2 boots -->
    <boots material="gold boots">
        <enchantment level="2">feather_falling</enchantment>
    </boots>

    <!-- Enchanted book of Luck -->
    <item material="enchanted_book">
        <stored-enchantment level="1">luck</stored-enchantment>
    </item>

<br/>


### Attribute Modifiers {#attributes}

Attribute modifiers can be applied to items in the same way they are applied to kits.
See [Attribute Kits](/modules/kits#attributes) for details.

Additionally, a `slot` can be specified, in which case the modifier will only be applied
when the item is in that slot. This must be an [armor or hand slot](/reference/inventory).

Examples

    <chestplate material="chainmail chestplate">
        <attribute amount="1">generic.knockbackResistance</attribute>
    </chestplate>

    <item material="diamond spade">
        <attribute slot="weapon.mainhand" operation="multiply" amount="2">generic.movementSpeed</attribute>
    </item>

`NOTE:` Negative attribute values are allowed; however sometimes they don't work as expected.

<br/>

### Grenades {#grenades}

The `grenade="true"` attribute will make the item explode on impact, just like a grenade. This option only works on items that can turn into projectiles. For example, ender pearls, snowballs, eggs, and arrows all work.

The `grenade-power="1.0"` attribute sets the explosion power. The default value of `1.0` will not destroy blocks, but it will damage players and set off TNT.

The attributes `grenade-fire="true"` and `grenade-destroy="true"` determine if the explosion creates fire and/or destroys blocks.

`NOTE:` If an ender pearl is used as a grenade, the player will teleport to the location and the explosion will occur.


    <item slot="1" amount="12" name="`4Grenade" grenade="true" grenade-power="1.2" material="snow ball"/>
    <item name="`a`lRocket Ammo" amount="3" enchantment="thorns" grenade="true" grenade-power="4" grenade-fire="true" material="arrow"/>

<br/>

### Can-Destroy / Can-Place-On {#can-destroy}

In adventure mode, no blocks can be placed or mined by default. The `<can-destroy>` element allows an item to mine a specified list of blocks.
The `<can-place-on>` element allows a block item to be placed against a specified list of blocks. In each case, the blocks are listed inside
the element, each wrapped in a `<material>` sub-element. These blocks **cannot** have damage/data values (this is a limitation of Minecraft
that we are unable to work around).

Instead of a list of blocks, you can use the `<all-blocks/>` element, which is equivalent to listing literally every block in the game.
In this case, you will probably want to specify `show-can-place-on="false"` or `show-can-destroy="false"` on the item to prevent a
massive tooltip being displayed to the player.
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Elements</th>
        <th>Description</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<can-destroy> </can-destroy>' | escape_once}}</code>
          </span>
        </td>
        <td>A node containing the materials this item can destroy.</td>
        <td></td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<can-place-on> </can-place-on>' | escape_once}}</code>
          </span>
        </td>
        <td>A node containing materials this item can be placed on.</td>
        <td></td>
      </tr>
      <tr>
        <th colspan='2'>Sub-elements</th>
        <th>Value/Children</th>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<material> </material>' | escape_once}}</code>
          </span>
        </td>
        <td>
          An individual material to match.
          <br/>
          <i>Does not accept a damage/data value.</i>
        </td>
        <td>
          <a href='/reference/inventory#material_matchers'>Material Name</a>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<all-blocks/>' | escape_once}}</code>
          </span>
        </td>
        <td>Match all block type materials.</td>
        <td></td>
      </tr>
    </tbody>
  </table>
</div>
    <item material="iron shovel">
        <can-destroy>
            <material>dirt</material>
            <material>grass</material>
            <material>sand</material>
        </can-destroy>
    </item>

    <item material="lever">
        <can-place-on>
            <all-blocks/>
        </can-place-on>
    </item>





<script>
    $(document).ready(function() {
        // Remove the js missing error from the search field.
        document.getElementById('queryField').disabled = false;
        document.getElementById('queryField').placeholder = "Player UUID";
    });

    $('#queryUUIDForm').submit(function () {
     doUUIDLookup();
     return false;
    });

    function doUUIDLookup() {
        var UUID = document.getElementById('queryField').value.trim();
        UUID = UUID.replace(/-/g, '');

        var element = document.getElementById("queryError");
        if (element) element.remove();
        if (!UUID.match(/^[a-f0-9]{32}$/i)) {
            document.getElementById('lookupInfo').innerHTML += '<span id="queryError" class="text-danger"><br/>Invalid UUID!</span>';
            return;
        }
        window.open("https://sessionserver.mojang.com/session/minecraft/profile/" + UUID);
    }
</script>

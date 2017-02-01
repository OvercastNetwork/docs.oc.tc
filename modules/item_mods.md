---
layout: page

category: "Modules"
title:  "Item Mods"

---

The item mods module allows modification of all items present on a map or created during the match. This can be used, for example, to make all gold swords unbreakable or give all items of a specific type a custom name.
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Element</th>
        <th>Description</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <span class='highlight'>
            <code>&lt;item-mods&gt; &lt;/item-mods&gt;</code>
          </span>
        </td>
        <td>The item mods node, containing all the individual modification rules.</td>
        <td></td>
      </tr>
      <tr>
        <th colspan='2'>Sub-elements</th>
        <th>Value/Children</th>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>&lt;rule&gt; &lt;/rule&gt;</code>
          </span>
        </td>
        <td>
          A single item modification rule.
        </td>
        <td>
          <span class='label label-default'>Rule Sub-Elements</span>
        </td>
      </tr>
    </tbody>
  </table>
</div>
<h5>Rule Sub-Elements</h5>
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Element</th>
        <th>Description</th>
        <th>Value/Children</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <span class='highlight'>
            <code>&lt;match&gt; &lt;/match&gt;</code>
          </span>
        </td>
        <td>
          <span class='label label-danger'>Required</span>
          <span class='label label-warning' title='Only one of this child permitted per parent'>Unique</span>
          The material or materials to modify.
        </td>
        <td>
          <span class='label label-default'>Match Sub-Elements</span>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>&lt;modify&gt; &lt;/modify&gt;</code>
          </span>
        </td>
        <td>
          <span class='label label-danger'>Required</span>
          <span class='label label-warning' title='Only one of this child permitted per parent'>Unique</span>
          The attributes to modify on the specified material(s).
        </td>
        <td>
          <a href='#itemmeta'>Item Meta</a>
        </td>
      </tr>
    </tbody>
  </table>
</div>
<h5>Match Sub-Elements</h5>
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Element</th>
        <th>Description</th>
        <th>Value/Children</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <span class='highlight'>
            <code>&lt;material&gt; &lt;/material&gt;</code>
          </span>
        </td>
        <td>An individual material to match.</td>
        <td>
          <a href='/reference/inventory#material_matchers'>Single Material Pattern</a>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>&lt;all-materials/&gt;</code>
          </span>
        </td>
        <td>Match all materials.</td>
        <td></td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>&lt;all-blocks/&gt;</code>
          </span>
        </td>
        <td>Match all block type materials.</td>
        <td></td>
      </tr>
    </tbody>
  </table>
</div>
Examples

    <item-mods>
        <rule>
            <match>
                <material>Iron Sword</material>
            </match>
            <modify unbreakable="true">
                <enchantment level="1">Knockback</enchantment>
            </modify>
        </rule>
    </item-mods>

    <item-mods>
        <rule>
            <match>
                <material>Bow</material>
            </match>
            <modify show-enchantments="false" unbreakable="true">
                <enchantment level="2">Infinity</enchantment>
            </modify>
        </rule>
    </item-mods>

<br/>

### Item Meta {#itemmeta}
The following attributes and sub-elements can be used with the `<modify>` element to modify an item or block.
While these are the same attributes as used in item kits
the modify element does not currently support the projectile or grenade attributes.
<h5>Modify Sub-Elements</h5>
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
            <code>&lt;enchantment&gt; &lt;/enchantment&gt;</code>
          </span>
        </td>
        <td>This item's enchantments.</td>
        <td>
          <a href='/modules/items#enchantments'>Enchantments</a>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>&lt;effect&gt; &lt;/effect&gt;</code>
          </span>
        </td>
        <td>A custom potion effect, only applies for potion items.</td>
        <td>
          <a href='/modules/potions'>Potion Effect</a>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>&lt;attribute&gt; &lt;/attribute&gt;</code>
          </span>
        </td>
        <td>Custom attributes for this item.</td>
        <td>
          <a href='/modules/items#attributes'>Attribute Modifiers</a>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>&lt;can-destroy&gt; &lt;/can-destroy&gt;</code>
          </span>
        </td>
        <td>The materials that can be mined with the item.</td>
        <td>
          <a href='/modules/items#can-destroy'>Can Destroy</a>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>&lt;can-place-on&gt; &lt;/can-place-on&gt;</code>
          </span>
        </td>
        <td>Materials that the item can be placed on.</td>
        <td>
          <a href='/modules/items#can-destroy'>Can Place On</a>
        </td>
      </tr>
    </tbody>
  </table>
</div>
<h5>Modify Attributes</h5>
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
          <code>color</code>
        </td>
        <td>
          Leather armor color as a hexadecimal color. <code>RRGGBB</code>
          <br>
          <i>Only applies to leather armor items.</i>
        </td>
        <td>
          <span class='label label-primary'>Hex Color</span>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>potion</code>
        </td>
        <td>
          Potion type
          <br>
          <i>Only applies to potion items.</i>
        </td>
        <td>
          <a href='http://minecraft.gamepedia.com/Potion#Data_values'>Potion ID</a>
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

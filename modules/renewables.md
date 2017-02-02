---
layout: page

category: "Modules"
title:  "Renewables"

---

This module can create regions in which destroyed or altered blocks will gradually be restored to their original state.

The `<renewables>` tag can contain any number of `<renewable>` tags. Each `<renewable>` can use a region and a filter to
specify blocks to renew. If neither are specified, the renewable affects all blocks in the world.
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
            <code>{{'<renewables> </renewables>' | escape_once}}</code>
          </span>
        </td>
        <td>Node containing this map's renewable block rules.</td>
        <td></td>
      </tr>
      <tr>
        <th colspan='2'>Sub-elements</th>
        <th>Value/Children</th>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<renewable>' | escape_once}}</code>
          </span>
        </td>
        <td>An individual renewable block rule.</td>
        <td>
          <span class='label label-default'>Renewable Sub-elements</span>
        </td>
      </tr>
    </tbody>
  </table>
</div>
<h5>Renewable Attributes</h5>
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th style='min-width: 130px;'>Attribute</th>
        <th>Description</th>
        <th>Value</th>
        <th>Default</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <code>region</code>
        </td>
        <td>
          <span class='label label-default' title='Can be either this attribute or a sub-element.'>Property</span>
          Region in which blocks will be renewed.
        </td>
        <td>
          <a href='/modules/regions'>Region</a>
        </td>
        <td>Everywhere</td>
      </tr>
      <tr>
        <td>
          <code>renew-filter</code>
        </td>
        <td>
          <span class='label label-default' title='Can be either this attribute or a sub-element.'>Property</span>
          Filter which blocks are renewed.
        </td>
        <td>
          <a href='/modules/filters'>Filter</a>
        </td>
        <td>Everything</td>
      </tr>
      <tr>
        <td>
          <code>replace-filter</code>
        </td>
        <td>
          <span class='label label-default' title='Can be either this attribute or a sub-element.'>Property</span>
          Filter which blocks can be replaced by renewing blocks.
        </td>
        <td>
          <a href='/modules/filters'>Filter</a>
        </td>
        <td>Everything</td>
      </tr>
      <tr>
        <td>
          <code>shuffle-filter</code>
        </td>
        <td>
          <span class='label label-default' title='Can be either this attribute or a sub-element.'>Property</span>
          Filter which renewable blocks are shuffled.
        </td>
        <td>
          <a href='/modules/filters'>Filter</a>
        </td>
        <td>Nothing</td>
      </tr>
      <tr>
        <td>
          <code>rate</code>
        </td>
        <td>
          Approximate number of blocks that will be restored per second. This rate applies to the
          renewable as a whole, which means the time required for any single block to renew will
          depend on how many other blocks are waiting to be renewed by the same renewable.
          <i>This parameter cannot be combined with</i>
          <code>interval</code>
        </td>
        <td>Blocks/second</td>
        <td>1</td>
      </tr>
      <tr>
        <td>
          <code>interval</code>
        </td>
        <td>
          Average time required for a block to renew. Unlike `rate`, this applies to each block
          individually, and blocks do not affect each other's renewal time. A renewable with an
          `interval` can behave very differently from a renewable with a `rate`, particularly
          if it is large.
          <i>This parameter cannot be combined with</i>
          <code>rate</code>
        </td>
        <td>
          <a href='/reference/time_periods'>Time Period</a>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>grow</code>
        </td>
        <td>
          Only allow blocks to be restored adjacent to other blocks that are already renewed,
          or not renewable. If set to false, blocks will be restored at completely random locations,
          even in mid-air.
        </td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>true</td>
      </tr>
      <tr>
        <td>
          <code>particles</code>
        </td>
        <td>
          Show block restore particle effects.
        </td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>true</td>
      </tr>
      <tr>
        <td>
          <code>sound</code>
        </td>
        <td>
          Play block restore sound effects.
        </td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>true</td>
      </tr>
      <tr>
        <td>
          <code>avoid-players</code>
        </td>
        <td>
          Prevent blocks from being restored within this distance of any player.
        </td>
        <td>meters</td>
        <td>2</td>
      </tr>
    </tbody>
  </table>
</div>
<h5>Renewable Sub-elements</h5>
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
            <code>{{'<region>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <span class='label label-default' title='Can be either this sub-element or an attribute.'>Property</span>
          The region the renewable applies to.
        </td>
        <td>
          <a href='/modules/regions'>Bounded Regions</a>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<renew-filter>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <span class='label label-default' title='Can be either this sub-element or an attribute.'>Property</span>
          Filter which blocks are renewed.
        </td>
        <td>
          <a href='/modules/filters'>Filters</a>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<replace-filter>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <span class='label label-default' title='Can be either this sub-element or an attribute.'>Property</span>
          Filter which blocks are replaced.
        </td>
        <td>
          <a href='/modules/filters'>Filters</a>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<shuffle-filter>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <span class='label label-default' title='Can be either this sub-element or an attribute.'>Property</span>
          Filter which blocks are shuffled.
        </td>
        <td>
          <a href='/modules/filters'>Filters</a>
        </td>
      </tr>
    </tbody>
  </table>
</div>
By default, all blocks in the region are renewable. The `<renew-filter>` sub-element can be used inside the `<renewable>` to specify only particular blocks to renew.

The `<replace-filter>` element specifies which block types are allowed to be replaced by renewing blocks. Any other type of block in the renewable region will obstruct the renewal process. By default, any block can be replaced.

Normally, blocks will be restored to their exact state when the map was loaded. If some block types are specified in
`<shuffle-filter>` element, blocks of those types in the original region will be restored to a block type chosen at random from
the shuffleable types. The approximate proportions of block types from the original region will be preserved.

    <renewables>
        <renewable rate="2.5" grow="true" particles="true" sound="true" avoid-players="4">
            <region>
                <cylinder base="0,117,0" radius="6" height="13"/>
            </region>
            <!-- These are the blocks that will renew -->
            <renew-filter>
                <any>
                    <material>iron ore</material>
                    <material>glowstone</material>
                    <material>stone</material>
                </any>
            </renew-filter>
            <!-- These blocks can be replaced by renewing blocks -->
            <replace-filter>
                <any>
                    <material>air</material>
                    <material>lava</material>
                    <material>stationary lava</material>
                </any>
            </replace-filter>
            <!-- These blocks will switch with each other when they renew -->
            <shuffle-filter>
                <any>
                    <material>stone</material>
                    <material>iron ore</material>
                </any>
            </shuffle-filter>
        </renewable>
    </renewables>

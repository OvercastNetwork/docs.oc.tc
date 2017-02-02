---
layout: page

category: "Modules"
title:  "Falling Blocks"

---

The falling blocks module is used to specify what blocks are affected by gravity. Additional it also supports sticky blocks, if a falling block is stuck to a sticky block it will not fall.

Falling blocks will not fall if they touch a sticky block. If you make a falling block stick to itself, then it will stick only if the neighbor block is also stuck to something. Entire structures can then be built from those blocks, and they will not collapse as long as some part of the structure is stuck to a non-falling block.
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
            <code>{{'<falling-blocks> </falling-blocks>' | escape_once}}</code>
          </span>
        </td>
        <td>Node containing this map's falling block rules.</td>
        <td></td>
      </tr>
      <tr>
        <th colspan='2'>Sub-elements</th>
        <th>Value/Children</th>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<rule>' | escape_once}}</code>
          </span>
        </td>
        <td>An individual falling block rule.</td>
        <td>
          <span class='label label-default'>Rule Sub-elements</span>
        </td>
      </tr>
    </tbody>
  </table>
</div>
<h5>Rule Attributes</h5>
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Attribute</th>
        <th>Description</th>
        <th>Value</th>
        <td>Default</td>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <code>filter</code>
        </td>
        <td>
          <span class='label label-default' title='Can be either this attribute or a sub-element.'>Property</span>
          <span class='label label-danger'>Required</span>
          Filter what blocks get modified by this rule.
        </td>
        <td>
          <a href='/modules/filters'>Block Filter</a>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>sticky</code>
        </td>
        <td>
          <span class='label label-default' title='Can be either this attribute or a sub-element.'>Property</span>
          <span class='label label-danger'>Required</span>
          The blocks that are sticky.
        </td>
        <td>
          <a href='/modules/filters'>Block Filter</a>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>delay</code>
        </td>
        <td>
          <span class='label label-default' title='Can be either this attribute or a sub-element.'>Property</span>
          Tick delay till blocks start to fall after they have been disturbed.
        </td>
        <td>
          <span class='label label-primary'>Number</span>
        </td>
        <td>2</td>
      </tr>
    </tbody>
  </table>
</div>
<h5>Rule Sub-elements</h5>
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Element</th>
        <th>Description</th>
        <th>Value/Children</th>
        <th>Default</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<filter>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <span class='label label-default' title='Can be either this sub-element or an attribute.'>Property</span>
          <span class='label label-danger'>Required</span>
          Filter what blocks get modified by this rule.
          <br/>
          Also accepts regions to limit the rule to a certain area.
        </td>
        <td>
          <a href='/modules/filters'>Block Filters</a>
          &
          <a href='/modules/regions'>Regions</a>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<sticky>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <span class='label label-default' title='Can be either this sub-element or an attribute.'>Property</span>
          <span class='label label-danger'>Required</span>
          The blocks that are sticky.
        </td>
        <td>
          <a href='/modules/filters'>Block Filters</a>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<delay>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <span class='label label-default' title='Can be either this sub-element or an attribute.'>Property</span>
          Tick delay till blocks start to fall after they have been disturbed.
        </td>
        <td>
          <span class='label label-primary'>Number</span>
        </td>
        <td>2</td>
      </tr>
    </tbody>
  </table>
</div>
Example

    <falling-blocks>
        <!-- make glass fall if it is not attached to wood or glass -->
        <rule>
            <filter>
                <material>glass</material>
            </filter>
            <sticky>
                <any>
                    <material>wood</material>
                    <material>glass</material>
                </any>
            </sticky>
        </rule>
    </falling-blocks>
<p>
  <a class='btn btn-primary btn-xs btn-more collapsed' data-target='#collapse-falling-example' data-toggle='collapse'>Examples</a>
</p>
<div class='collapse' id='collapse-falling-example' markdown='1'>

    <falling-blocks>
        <!-- make sandstone fall, just like sand or gravel -->
        <rule>
            <filter>
                <material>sandstone</material>
            </filter>
        </rule>
    </falling-blocks>

    </falling-blocks>
        <!-- blocks that match the "building-blocks" filter, and are inside
             the "box" region, collapse if they are not connected to something
             made of quartz, either directly or through other building-blocks -->
        <rule>
            <filter>
                <all>
                    <region id="box"/>
                    <filter id="building-blocks"/>
                </all>
            </filter>
            <sticky>
                <any>
                    <filter id="building-blocks"/>
                    <material>quartz</material>
                    <material>quartz stairs</material>
                </any>
            </sticky>
        </rule>
    </falling-blocks>

</div>

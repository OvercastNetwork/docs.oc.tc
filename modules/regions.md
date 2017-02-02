---
layout: page

category: "Modules"
title:  "Regions"
nav_content:
  - path:  "#applying"
    name: "Applying Things to Regions"
  - path:  "#regionModifiers"
    name: "Region Modifiers"
  - path:  "#pointProviders"
    name: "Point Providers"
---

Regions are a type of filter that filters the coordinates of a query. They are used to define, among other things, the area a filter applies to or where a portal links from. There are two distinct types of regions; block bounded regions, which contain a finite amount of blocks and unbounded regions that contain a infinite amount. All regions and region modifiers can have a `id` attribute to reference them from kits, portals, etc.

    <regions>
        <rectangle id="xyzzy-region" min="-50,-50" max="50,50"/>
    </regions>

    <!-- Region reference -->
    <region id="xyzzy-region"/>


The area a region applies to is specified with one or more of the following elements. Use `oo` and `-oo` to specify positive/negative infinity in coordinates. See the [Properly Defining Regions](/guides/regions) guide for information on how to properly get the coordinates of a region.


##### Region Types
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Block Bounded Regions</th>
        <th></th>
      </tr>
      <tr></tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<cuboid id="abc" min="X1,Y1,Z1" max="X2,Y2,Z2"/>' | escape_once}}</code>
          </span>
          <br>
          A rectangular solid from <code>X1,Y1,Z1</code> to <code>X2,Y2,Z2</code>.
          <br>
          <i>Only block bounded when using finite coordinates.</i>
        </td>
        <td class='text-right'>
          <span class='label label-primary'>Randomize-able</span>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<cylinder id="abc" base="X,Y,Z" radius="R" height="H"/>' | escape_once}}</code>
          </span>
          <br>
          A cylinder located at <code>X,Y,Z</code> with a radius of <code>R</code> and a height of <code>H</code>.
          <br>
          <i>Only block bounded when using a finite radius.</i>
        </td>
        <td class='text-right'>
          <span class='label label-primary'>Randomize-able</span>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<block id="abc">X,Y,Z</block>' | escape_once}}</code>
          </span>
          <br>
          A single block located at <code>X,Y,Z</code>.
        </td>
        <td class='text-right'>
          <span class='label label-primary'>Randomize-able</span>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<sphere id="abc" origin="X,Y,Z" radius="R"/>' | escape_once}}</code>
          </span>
          <br>
          A sphere located at <code>X,Y,Z</code> with a radius of <code>R</code>.
          <br>
          <i>Only block bounded when using a finite radius.</i>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<point id="abc">X,Y,Z</point>' | escape_once}}</code>
          </span>
          <br>
          A single point region located at <code>X,Y,Z</code>.<br/>
          <i>This region will always return the same location even when used in a randomized context, e.g., spawns.</i>
        </td>
        <td class='text-right'>
          <span class='label label-primary'>Randomize-able</span>
        </td>
      </tr>
      <tr>
        <td colspan='2'>
          <b>Unbounded Regions</b>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<rectangle id="abc" min="X1,Z1" max="X2,Z2"/>' | escape_once}}</code>
          </span>
          <br>
          A rectangle from <code>X1,Z1</code> to <code>X2,Z2</code>.
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<circle id="abc" center="X,Z" radius="R"/>' | escape_once}}</code>
          </span>
          <br>
          A circle located at <code>X,Z</code> with a radius of <code>R</code>. <br/>
          <i>The region goes from 0 to map height, i.e. PGM doesn't check the players Y position.</i>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<half normal="1,0,1" origin="100,50,0" id="abc"/>' | escape_once}}</code>
          </span>
          <br>
          Half of the world split by a plane pointing towards a normal.
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<below x="" y="" z="" id="abc"/>' | escape_once}}</code>
          </span>
          |
          <span class='highlight'>
            <code>{{'<above x="" y="" z="" id="abc"/>' | escape_once}}</code>
          </span>
          <br>
          Half of the world split at the specified axis.
          <br>
          If multiple axises are defined the specified parts of each axis are intersected and returned.
        </td>
        <td></td>
      </tr>
      <tr>
        <td colspan='2'>
          <b>Static Regions</b>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<empty/>' | escape_once}}</code>
          </span>
          <br>
          A zero size/position region, contains nothing.
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<nowhere/>' | escape_once}}</code>
          </span>
          <br>
          A reference-able zero size/position region, contains nothing. Can be referenced with the ID: <code>nowhere</code>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<everywhere/>' | escape_once}}</code>
          </span>
          <br>
          A reference-able infinite size region, contains everything. Can be referenced with the ID: <code>everywhere</code>
        </td>
        <td></td>
      </tr>
    </tbody>
  </table>
</div>
<br/>

#### Half-space Regions

A half-space region contains everything on one side of an arbitrary plane. The plane is defined by an origin point and a normal vector, and the region contains everything on the side of the plane that the normal is pointing towards. The example below defines a region with a diagonal boundary:

    <half origin="5,0,0" normal="1,1,0"/>

The above and below regions can be used to conveniently define axis-aligned half-spaces:

    <above y="50"/>         <!-- Everything above Y=50 -->
    <below x="0" z="0"/>    <!-- Everything in the -X, -Z quadrant -->

<br/>

### Applying Things to Regions {#applying}

Filters, kits, and velocity changes can be applied to regions by using an `<apply>` element. The apply element can contain more than one region. If the apply element contains more than one region the same settings are applied to all of them. Applies with no region default to `<everywhere/>`. Applies can also be defined in the filters element.

The order in which apply elements are specified determines which takes precedence when regions overlap. Applies specified first override those specified further down in the XML. See [filter apply order](/guides/filter_apply_order) for a more detailed example. The region an apply affects can be specified as an attribute or in a <region> sub-element.


##### Apply Element Attributes
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th style='min-width: 175px;'>Attribute</th>
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
          The region this apply affects.
        </td>
        <td>
          <a href='/modules/regions'>Region</a>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>enter</code>
        </td>
        <td>
          <span class='label label-default' title='Can be either this attribute or a sub-element.'>Property</span>
          Filter player enter events.
        </td>
        <td>
          <a href='/modules/filters'>Filter</a>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>leave</code>
        </td>
        <td>
          <span class='label label-default' title='Can be either this attribute or a sub-element.'>Property</span>
          Filter player leave events.
        </td>
        <td>
          <a href='/modules/filters'>Filter</a>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>block</code>
        </td>
        <td>
          <span class='label label-default' title='Can be either this attribute or a sub-element.'>Property</span>
          Filter block place and break events.
        </td>
        <td>
          <a href='/modules/filters'>Filter</a>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>block-place</code>
        </td>
        <td>
          <span class='label label-default' title='Can be either this attribute or a sub-element.'>Property</span>
          Filter block place events.
        </td>
        <td>
          <a href='/modules/filters'>Filter</a>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>block-place-against</code>
        </td>
        <td>
          <span class='label label-default' title='Can be either this attribute or a sub-element.'>Property</span>
          Filter block place against events.
        </td>
        <td>
          <a href='/modules/filters'>Filter</a>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>block-break</code>
        </td>
        <td>
          <span class='label label-default' title='Can be either this attribute or a sub-element.'>Property</span>
          Filter block break events.
        </td>
        <td>
          <a href='/modules/filters'>Filter</a>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>block-physics</code>
        </td>
        <td>
          <span class='label label-default' title='Can be either this attribute or a sub-element.'>Property</span>
          Filter world block updates; water flowing, portals disappearing, etc.
        </td>
        <td>
          <a href='/modules/filters'>Filter</a>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>use</code>
        </td>
        <td>
          <span class='label label-default' title='Can be either this attribute or a sub-element.'>Property</span>
          Filter right-click events.
        </td>
        <td>
          <a href='/modules/filters'>Filter</a>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>message</code>
        </td>
        <td>Send a message to the player if the filter denies the event.</td>
        <td>
          <span class='label label-primary'>String</span>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>early-warning</code>
        </td>
        <td>Warn the player before they actually break a denied block.</td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>false</td>
      </tr>
      <tr>
        <td colspan='4'>
          <b>Apply Effects</b>
        </td>
      </tr>
      <tr>
        <td>
          <code>kit</code>
        </td>
        <td>
          <span class='label label-default' title='Can be either this attribute or a sub-element.'>Property</span>
          Give a kit to players entering the region.
        </td>
        <td>
          <a href='/modules/kits'>Kit</a>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>lend-kit</code>
        </td>
        <td>
          <span class='label label-default' title='Can be either this attribute or a sub-element.'>Property</span>
          Give a kit to players entering the region, and remove it when they leave the region.
          This can be used only with removable kits. Any non-removable kit will generate an error.
          The kits page explains which kit types are removable.
        </td>
        <td>
          <a href='/modules/kits'>Kit</a>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>velocity</code>
        </td>
        <td>Change a players velocity when they enter the region.</td>
        <td>
          <span class='label label-primary'>X,Y,Z</span>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>filter</code>
        </td>
        <td>
          <span class='label label-default' title='Can be either this attribute or a sub-element.'>Property</span>
          Filter when/if kits and velocities are applied.
        </td>
        <td>
          <a href='/modules/filters'>Filter</a>
        </td>
        <td></td>
      </tr>
    </tbody>
  </table>
</div>
Apply Examples

    <!-- Apply a blue team usage filter and referenced the region in an attribute. -->
    <apply region="region1" use="blue-team-filter"/>

    <apply kit="dark-tower-kit">
        <region>
            <!-- Multiple regions or region references in a regions sub-element. -->
            <region id="region1"/>
            <rectangle min="-5,-5" max="5,5"/>
        </region>
        <!-- Inline effect filter -->
        <filter>
            <team>blue</team>
        </filter>
    </apply>
<p>
  <a class='btn btn-primary btn-xs btn-more collapsed' data-target='#collapse-apply-example' data-toggle='collapse'>Examples</a>
</p>
<div class='collapse' id='collapse-apply-example' markdown='1'>

    <!-- Give a kit to players entering the region. -->
    <apply kit="knight">
        <region>
            <region id="r-knight"/>
            <region id="b-knight"/>
        </region>
    </apply>

    <!-- Only allow breaking of sandstone stairs and deny placing of all blocks. -->
    <apply block-break="only-sandstone-stairs" block-place="never" message="You may not modify this area">
        <region>
            <rectangle min="-6,-58" max="7,-47"/>
            <rectangle min="-6,48" max="7,59"/>
        </region>
    </apply>

    <!-- Example regions from Harb using region modifiers. -->
    <regions>
        <rectangle id="main-area" min="-50,-32" max="51,33"/>
        <union id="bases">
            <rectangle id="blue-base" min="-20,-62" max="21,-32"/>
            <rectangle id="red-base" min="-20,33" max="21,63"/>
        </union>
        <complement id="portals-area">
            <rectangle min="-56,-2" max="57,3"/>
            <region id="main-area"/>
        </complement>

        <!-- Protect portal areas -->
        <apply block="never" region="portals-area"/>
        <apply block="no-tnt" region="bases" message="You may not place TNT in the bases."/>
    </regions>

</div>
An applies velocity attribute changes the players velocity when they enter the specified region. This velocity is specified as a `X,Y,Z` vector.
On the mapdev servers velocity can be tested with the `/vel x y z` command.

Example using velocity for jump pads

    <regions>
        <!--  Yellow Pads  -->
        <apply velocity="-0.4,1.1,0.0">
            <region>
                <cuboid min="-1081,1,-2116" max="-1078,2,-2113"/>
            </region>
        </apply>
        <apply velocity="0.0,1.4,-0.4">
            <region>
                <cuboid min="-1062,1,-2123" max="-1059,2,-2120"/>
            </region>
        </apply>
    </regions>


<br/>

### Region Modifiers {#regionModifiers}

Regions can be inverted, combined, subtracted, or intersected by putting them inside of the following elements.
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <tbody>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<negative><region id="region1"/></negative>' | escape_once}}</code>
          </span>
          <br>
          Inverse of a region, the region or regions will no longer be considered block bounded.
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{' <union><region id="region1"/><region id="region2"/>..</union>' | escape_once}}</code>
          </span>
          <br>
          Combination of multiple regions.
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<complement><region id="region1"/><region id="region2"/>..</complement>' | escape_once}}</code>
          </span>
          <br>
          Subtracts successive regions from the first defined region.
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<intersect><region id="region1"/><region id="region2"/>..</intersect>' | escape_once}}</code>
          </span>
          <br>
          Returns the area that multiple regions intersect with.
        </td>
      </tr>
    </tbody>
  </table>
</div>
![Region Combinations .png](/img/regions.png)

Regions can be translated or mirrored with the following elements. When translating or mirroring a region the original is not modified instead a copy is created.

When mirroring a region the origin is the central point around which the region is mirrored. This point can be inside or outside the region being mirrored. The normal specifies which direction the region is being mirrored, e.g., `1,0,0` would mirror along the +X axis.
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <tbody>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<translate offset="X,Y,Z"><region id="region1"/></translate>' | escape_once}}</code>
          </span>
          <br>
          Copy and translate a region by <code>X,Y,Z</code> blocks.
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<mirror normal="1,0,1" origin="100,50,0"><region id="region1"/></mirror>' | escape_once}}</code>
          </span>
          <br>
          Copy and mirror a region towards a normal around a point.
        </td>
      </tr>
    </tbody>
  </table>
</div>
![Region Mirror .png](/img/region_mirror.png)

<br/>
Examples

    <!-- Region Union-->
    <regions>
        <!-- Blue Team Base -->
        <apply enter="only-blue" message="You may not enter the enemy team's base!">
            <region>
                <union>
                    <cuboid min="-20,8,-75" max="11,41,-79"/>
                    <cuboid min="8,8,-80" max="13,41,-75"/>
                </union>
            </region>
        </apply>
    </regions>

    <!-- Region Mirror -->
    <regions>
        <apply block="never" message="You may not under-bridge!">
            <region>
                <cuboid id="red-underside" min="-oo,-oo,-oo" max="oo,41,40"/>
                <mirror origin="116,44,93" normal="0,0,1">
                    <region id="red-underside"/>
                </mirror>
                <cuboid min="-oo,-oo,-oo" max="oo,37,oo"/>
            </region>
        </apply>
    </regions>


<br/>

### Point Providers {#pointProviders}

A point provider is used to return individual points inside a region. It can also be used to modify the position returned by a region to include the direction a player ends up facing when spawned, etc.
Input can be a region, a region modifier or simply an exact `X,Y,Z` coordinate.

    <point yaw="90" pitch="50">X,Y,Z</point>


##### Point Attributes
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Attribute</th>
        <th>Description</th>
        <th>Value</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <code>region</code>
        </td>
        <td>
          <span class='label label-default' title='Can be either this attribute or a sub-element.'>Property</span>
          The region the point provider modifies.
        </td>
        <td>
          <a href='/modules/regions'>Randomize-able Region</a>
        </td>
      </tr>
      <tr>
        <td>
          <code>yaw</code>
        </td>
        <td>
          Specifies what direction the player is looking horizontally from -180&deg; to 180&deg;.
          <br>
          <i>South 0&deg;, East -90&deg;, North 180&deg; and West 90&deg;.</i>
        </td>
        <td>
          <span class='label label-primary'>-180 to 180</span>
        </td>
      </tr>
      <tr>
        <td>
          <code>pitch</code>
        </td>
        <td>
          Specifies what direction the player is looking vertically from -90&deg; to 90&deg;.
          <br>
          <i>-90&deg; is straight up 90&deg; is straight down.</i>
        </td>
        <td>
          <span class='label label-primary'>-90 to 90</span>
        </td>
      </tr>
      <tr>
        <td>
          <code>angle</code>
        </td>
        <td>
          Specify the exact block coordinates that the player should look at.
          <br>
          <i>This attribute will negate any angles set by the <code>yaw</code> and <code>pitch</code> attributes.</i>
        </td>
        <td>
          <span class='label label-primary'>X,Y,Z</span>
        </td>
      </tr>
    </tbody>
  </table>
</div>
<h5>Point Sub-elements</h5>
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Element</th>
        <th>Description</th>
        <th>Value/Children</th>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<region>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <span class='label label-default' title='Can be either this sub-element or an attribute.'>Property</span>
          The region or regions the point provider modifies.
        </td>
        <td>
          <a href='/modules/regions'>Randomize-able Regions</a>
        </td>
      </tr>
    </thead>
  </table>
</div>
`NOTE:` The pitch and yaw arguments can also accept a `X,Y,Z` coordinate. <br/>
`TIP:` Copy the yaw and pitch from the F3 screen in minecraft (the `Facing: Direction (Axis) (Yaw/Pitch)` line).

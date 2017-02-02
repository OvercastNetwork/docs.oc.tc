---
layout: page

category: "Modules"
title:  "TNT"

---

You can modify TNT explosion & placing behavior with this module. Destruction of terrain can be easily disabled with the blockdamage element. If it is set to `false` the yield element will have no effect since there won't be any block drops. TNT damage can be further limited with the [disable damage module](/modules/disabledamage#block_explosion).

By default dispensers containing TNT will ignite their TNT when exploded. This behavior can be customized with the `<dispenser-tnt-limit>` and `<dispenser-tnt-multiplier>` elements, setting either of these to 0 will disable it.

If licensing is enabled only players with a TNT license can use TNT. This license is revoked if a player kills too many of their teammates using TNT.
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Element</th>
        <th>Description</th>
        <th></th>
        <th></th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<tnt> </tnt>' | escape_once}}</code>
          </span>
        </td>
        <td colspan='3'>Node containing the custom TNT settings.</td>
      </tr>
      <tr>
        <th colspan='2'>Sub-elements</th>
        <th>Value</th>
        <th>Default</th>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<instantignite>' | escape_once}}</code>
          </span>
        </td>
        <td>Instantly ignite TNT when placed.</td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>false</td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<blockdamage>' | escape_once}}</code>
          </span>
        </td>
        <td>Specify if TNT destroys the terrain.</td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>true</td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<yield>' | escape_once}}</code>
          </span>
        </td>
        <td>
          Modify the amount of items dropped by the explosion as a percentage.<br/>
          <i>Not valid when <code>blockdamage</code> is false.</i>
        </td>
        <td>
          <span class='label label-primary'>0 - 1.0</span>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<power>' | escape_once}}</code>
          </span>
        </td>
        <td>
          Modify the explosions block radius.
        </td>
        <td>
          <span class='label label-primary'>0 - 20.0</span>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<fuse>' | escape_once}}</code>
          </span>
        </td>
        <td>
          Time till the TNT explodes once it is ignited.
        </td>
        <td>
          <a href='/reference/time_periods'>Time Period</a>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<dispenser-tnt-limit>' | escape_once}}</code>
          </span>
        </td>
        <td>
          Max amount of TNT a dispenser ignites when exploded.
        </td>
        <td>
          <span class='label label-primary'>0 - 64</span>
        </td>
        <td>16</td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<dispenser-tnt-multiplier>' | escape_once}}</code>
          </span>
        </td>
        <td>
          Multiplier for the amount of TNT ignited when a dispenser is exploded.
        </td>
        <td>
          <span class='label label-primary'>0 - 2.0</span>
        </td>
        <td>0.25</td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<licensing>' | escape_once}}</code>
          </span>
        </td>
        <td>
          TNT usage is restricted to players who are licensed.
        </td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>true</td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<friendly-defuse>' | escape_once}}</code>
          </span>
        </td>
        <td>
          Players may defuse TNT placed by their teammates.
        </td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>true</td>
      </tr>
    </tbody>
  </table>
</div>
Examples

    <tnt>
        <instantignite>on</instantignite>
        <fuse>2s</fuse>
    </tnt>

    <tnt>
        <dispenser-tnt-limit>8</dispenser-tnt-limit>
        <dispenser-tnt-multiplier>1</dispenser-tnt-multiplier>
    </tnt>

---
layout: page

category: "Reference"
title:  "Formatting Codes"

---

Text formatting codes are used to create fancy colorized text, they are prefixed with a grave symbol <code>`</code>. After using a formatting code such as <code>`o</code> (italic) it has to be reset, otherwise it will continue until the end of the text.

<div class="alert alert-info alert-small">Some older maps may use the depreciated § section symbol to specify formatting codes. This symbol should not be used in new map files.</div>

Examples

    <item name="`iFrozen `rWater" material="snowball"/>

    <line>This is one of three of `9Blue Team`r's victory monuments.</line>

    <item name="`1Blue `4Red `rNone" material="book"/>

<br/>

##### Chat Colors {#chatColors}
![Minecraft Colors .png](/img/colors.png)

<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th style='width: 40px;'>ID</th>
        <th>Color Name</th>
        <th style='width: 40px;'>ID</th>
        <th>Color Name</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <code>0</code>
        </td>
        <td>BLACK</td>
        <td>
          <code>8</code>
        </td>
        <td>DARK_GRAY</td>
      </tr>
      <tr>
        <td>
          <code>1</code>
        </td>
        <td>DARK_BLUE</td>
        <td>
          <code>9</code>
        </td>
        <td>BLUE</td>
      </tr>
      <tr>
        <td>
          <code>2</code>
        </td>
        <td>DARK_GREEN</td>
        <td>
          <code>a</code>
        </td>
        <td>GREEN</td>
      </tr>
      <tr>
        <td>
          <code>3</code>
        </td>
        <td>DARK_AQUA</td>
        <td>
          <code>b</code>
        </td>
        <td>AQUA</td>
      </tr>
      <tr>
        <td>
          <code>4</code>
        </td>
        <td>DARK_RED</td>
        <td>
          <code>c</code>
        </td>
        <td>RED</td>
      </tr>
      <tr>
        <td>
          <code>5</code>
        </td>
        <td>DARK_PURPLE</td>
        <td>
          <code>d</code>
        </td>
        <td>LIGHT_PURPLE</td>
      </tr>
      <tr>
        <td>
          <code>6</code>
        </td>
        <td>GOLD</td>
        <td>
          <code>e</code>
        </td>
        <td>YELLOW</td>
      </tr>
      <tr>
        <td>
          <code>7</code>
        </td>
        <td>GRAY</td>
        <td>
          <code>f</code>
        </td>
        <td>WHITE</td>
      </tr>
    </tbody>
  </table>
</div>
<h5>Text</h5>
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th style='width: 40px;'>ID</th>
        <th>Function</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <code>k</code>
        </td>
        <td>MAGIC</td>
      </tr>
      <tr>
        <td>
          <code>l</code>
        </td>
        <td>BOLD</td>
      </tr>
      <tr>
        <td>
          <code>m</code>
        </td>
        <td>STRIKETHROUGH</td>
      </tr>
      <tr>
        <td>
          <code>n</code>
        </td>
        <td>UNDERLINE</td>
      </tr>
      <tr>
        <td>
          <code>o</code>
        </td>
        <td>ITALIC</td>
      </tr>
      <tr>
        <td>
          <code>r</code>
        </td>
        <td>RESET</td>
      </tr>
    </tbody>
  </table>
</div>

The magic formatter will convert all the text after it into a scrambled, constantly changing mess of letters.

`NOTE:` Reset resets all color and text styles.

To have a line all italic and one word red you will have to to do the following.

    <!-- Everything is italic and the word "italic" is also red -->
    <line>`oThis is a `citalic `r`otext with a single red word.</line>

Copied from: [bukkit docs - Chat Color](https://hub.spigotmc.org/javadocs/bukkit/org/bukkit/ChatColor.html)

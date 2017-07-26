use feature 'say';
use strict;
use HTML::TreeBuilder;
use HTML::Element;
use Data::Dumper;
use HTML::Entities;


my $tree = HTML::TreeBuilder->new_from_content(<DATA>);

#$tree->parse($content);

my @tables = $tree->look_down(_tag => "table");

my @lines;
foreach my $table (@tables) {

  my @rows = $table->look_down(_tag=>"tr");

  my $first_row = shift(@rows);
  
  my @first_cells = $first_row->look_down(_tag=>"td");
  my $day = $first_cells[0]->as_text;
  
  foreach my $row (@rows) {
    my @cells = $row->look_down(_tag=>"td");
    my @new_cells =  map {$_->as_text . ","} @cells;
    my $times = shift @new_cells;

    my @start_end =  split/-/,  $times;
    @start_end =     map {$day . " " . $_} @start_end;

    unshift  @new_cells, @start_end;
    @new_cells =     map  {&clean($_) } @new_cells;
    push @lines, join(",",@new_cells);
  }

}
print Dumper(\@lines);

sub clean {
  my $str = shift;
  $str =~ s/,//;
  return $str;

}

__DATA__
<!-- thursday -->


  


<table>
<tbody>
<tr>
<td><b>THURSDAY</b></td>
<td><b>GM NAME</b></td>
<td><b>SYSTEM & MODULE</b></td>
<td><b>TABLE/ROOM</b></td>
</tr>
<tr>
<td>5:00PM-7:00PM</td>
<td>EDWIN NAGY</td>
<td>Call of Cthulhu: Necropolis</td>
<td>Miskatonic University</td>
</tr>
<tr>
<td>5:00PM-9:00PM</td>
<td>GENE LANCASTER</td>
<td>Crypts & Things: The Halls of Nazir-Thun</td>
<td>Velma's Diner</td>
</tr>
<tr>
<td>5:00PM-9:00PM</td>
<td>NOAH LLOYD</td>
<td>Call of Cthulhu: The Founding</td>
<td>Another Dimension (Salon 5)</td>
</tr>
<tr>
<td>5:00PM-9:00PM</td>
<td>HERBIE HICKS; RICH MOWRY</td>
<td>Fortuna: Quest Through the Obsidian Spire</td>
<td>The Dreamlands</td>
</tr>
<tr>
<td>5:00PM-11:00PM</td>
<td>MATT HAWKES</td>
<td>Lovecraftesque</td>
<td>R'Lyeh</td>
</tr>
<tr>
<td>5:00PM-11:00PM</td>
<td>DAN ALBAN</td>
<td>Call of Cthulhu Delta Green: Monsoon Over Myanmar</td>
<td>Yuggoth</td>
</tr>
<tr>
<td>5:00PM-12:00AM</td>
<td>REALITY A GAMES</td>
<td>Magic the Gathering Rolling Drafts</td>
<td>Salon 2</td>
</tr>
<tr>
<td>6:00PM-8:00PM</td>
<td>ROLAND BRUNO</td>
<td>Cthulhu Wars</td>
<td>Hibb's Roadhouse</td>
</tr>
<tr>
<td>6:00PM-8:00PM</td>
<td>ADAM BYSKO</td>
<td>Rune Wars</td>
<td>Red Hook</td>
</tr>
<tr>
<td>6:00PM-8:00PM</td>
<td>KRISTIN ROACH</td>
<td>Rune Wars</td>
<td>Providence</td>
</tr>
<tr>
<td>6:00PM-10:00PM</td>
<td>JASON BRADLEY THOMPSON</td>
<td>Dreamland: The Paradise of the Unchanging</td>
<td>Angell Street</td>
</tr>
<tr>
<td>6:00PM-10:00PM</td>
<td>DAN COMBS</td>
<td>Call of Cthulhu 7th ed: The Dreaming Ward</td>
<td>Dunwich</td>
</tr>
<tr>
<td>6:00PM-10:00PM</td>
<td>LYON HEART MEDIA LLC.</td>
<td>Empire in Flames</td>
<td>State Suite A</td>
</tr>
<tr>
<td>6:00PM-12:00AM</td>
<td>REALITY A GAMES</td>
<td>Magic the Gathering Legacy Tournament</td>
<td>Arkham Asylum (Salon 6)</td>
</tr>
<tr>
<td>8:00PM-12:00AM</td>
<td>JONATHAN POWELL</td>
<td>Call of Cthulhu 7th ed: An Amaranthine Desire</td>
<td>Miskatonic University</td>
</tr>
</tbody>
</table>

<!-- friday -->



<table>
<tbody>
<tr>
<td><b>FRIDAY</b></td>
<td><b>GM NAME</b></td>
<td><b>SYSTEM & MODULE</b></td>
<td><b>TABLE/ROOM</b></td>
</tr>
<tr>
<td>8:00AM-12:00PM</td>
<td>DAN ALBAN</td>
<td>Call of Cthulhu Delta Green: Monsoon Over Myanmar</td>
<td>Miskatonic University</td>
</tr>
<tr>
<td>8:00AM-2:00PM</td>
<td>GENE LANCASTER</td>
<td>Trail of Cthulhu: Cthulhu-Trek-The Derelict</td>
<td>Historical Society (Salon 4)</td>
</tr>
<tr>
<td>8:00AM-12:00AM</td>
<td>REALITY A GAMES</td>
<td>Magic the Gathering Rolling Draft</td>
<td>Salon 2</td>
</tr>
<tr>
<td>9:00AM-11:00AM</td>
<td>ROLAND BRUNO</td>
<td>Cthulhu Wars</td>
<td>Angell Street</td>
</tr>
<tr>
<td>9:00AM-1:00PM</td>
<td>BILL ADCOCK</td>
<td>Cthulhu Invictus 7th ed: The Unquiet Dead</td>
<td>Hibb's Roadhouse</td>
</tr>
<tr>
<td>9:00AM-3:00PM</td>
<td>REALITY A GAMES</td>
<td>Magic the Gathering: Standard Tournament</td>
<td>Arkham Asylum (Salon 6)</td>
</tr>
<tr>
<td>10:00AM-2:00PM</td>
<td>MATT SANDERSON</td>
<td>Call of Cthulhu (Modern Day): Dissociation</td>
<td>The Dreamlands</td>
</tr>
<tr>
<td>12:00PM-2:00PM</td>
<td>ROLAND BRUNO</td>
<td>Cthulhu Wars</td>
<td>Angell Street</td>
</tr>
<tr>
<td>12:00PM-2:00PM</td>
<td>BADGER MCINNES</td>
<td>Feed the Shoggoth</td>
<td>Red Hook</td>
</tr>
<tr>
<td>1:00PM-5:00PM</td>
<td>LYNNE HARDY</td>
<td>Call of Cthulhu 7th ed: Scritch Scratch</td>
<td>Miskatonic University</td>
</tr>
<tr>
<td>1:00PM-5:00PM</td>
<td>PAUL FRICKER</td>
<td>Call of Cthulhu: We Will Remember Them</td>
<td>Providence</td>
</tr>
<tr>
<td>1:00PM-7:00PM</td>
<td>STEVE ROSENSTEIN</td>
<td>Pulp Cthulhu: Yojimbo</td>
<td>Velma's Diner</td>
</tr>
<tr>
<td>2:00PM-6:00PM</td>
<td>NOAH LLOYD</td>
<td>Call of Cthulhu: The Founding</td>
<td>Another Dimension (Salon 5)</td>
</tr>
<tr>
<td>3:00PM-7:00PM</td>
<td>EDWIN NAGY</td>
<td>Call of Cthulhu: The Dreaming Ward</td>
<td>Historical Society (Salon 4)</td>
</tr>
<tr>
<td>3:00PM-7:00PM</td>
<td>MATT SANDERSON</td>
<td>Call of Cthulhu (Modern Day): Pulvis et Umbra Sumus</td>
<td>Angell Street</td>
</tr>
<tr>
<td>3:00PM-7:00PM</td>
<td>SEAN MURPHY</td>
<td>Call of Cthulhu: Camp Sunny</td>
<td>The Dreamlands</td>
</tr>
<tr>
<td>3:00PM-7:00PM</td>
<td>BILL ADCOCK</td>
<td>Call of Cthulhu 7th ed: The Dragon of Cambria</td>
<td>Hibb's Roadhouse</td>
</tr>
<tr>
<td>3:00PM-7:00PM</td>
<td>LYON HEART MEDIA LLC</td>
<td>Empire in Flames</td>
<td>State Suite A</td>
</tr>
<tr>
<td>5:00PM-9:00PM</td>
<td>BRUCE RUSK</td>
<td>Call of Cthulhu: Dead Light</td>
<td>Dunwich</td>
</tr>
<tr>
<td>5:00PM-11:00PM</td>
<td>REALITY A GAMES</td>
<td>Magic the Gathering Commander Pods Tournament</td>
<td>Arkham Asylum (Salon 6)</td>
</tr>
<tr>
<td>5:00PM-11:00PM</td>
<td>CORY WELCH</td>
<td>Call of Cthulhu 7th ed: Forget Me Not</td>
<td>Swan Point</p>
<p>(Salon 1)</td>
</tr>
<tr>
<td>6:00PM-8:00PM</td>
<td>ADAM BYSKO</td>
<td>Rune Wars</td>
<td>Red Hook</td>
</tr>
<tr>
<td>6:00PM-8:00PM</td>
<td>KRISTIN ROACH</td>
<td>Rune Wars</td>
<td>Providence</td>
</tr>
<tr>
<td>6:00PM-10:00PM</td>
<td>DAN COMBS</td>
<td>Call of Cthulhu 7th ed: Weekend In The Woods</td>
<td>Miskatonic University</td>
</tr>
<tr>
<td>8:00PM-12:00AM</td>
<td>JASON BRADLEY THOMPSON</td>
<td>Dreamland: On the Wings of Dream</td>
<td>Hibb's Roadhouse</td>
</tr>
<tr>
<td>8:00PM-12:00AM</td>
<td>HERBIE HICKS; RICH MOWRY</td>
<td>Fortuna: Quest Through the Obsidian Spire</td>
<td>Velma's Diner</td>
</tr>
<tr>
<td>8:00PM-12:00AM</td>
<td>LYON HEART MEDIA LLC</td>
<td>Empire in Flames</td>
<td>State Suite A</td>
</tr>
<tr>
<td>8:00PM-12:00AM</td>
<td>SETH ZEREN</td>
<td>10 Candles</td>
<td>Another Dimension (Salon 5)</td>
</tr>
<tr>
<td>9:00PM-11:00PM</td>
<td>ADAM BYSKO</td>
<td>Rune Wars</td>
<td>Red Hook</td>
</tr>
<tr>
<td>9:00PM-11:00PM</td>
<td>KRISTIN ROACH</td>
<td>Rune Wars</td>
<td>Providence</td>
</tr>
</tbody>
</table>


<!--saturday-->
<table>
<tbody>
<tr>
<td><b>SATURDAY</b></td>
<td><b>GM NAME</b></td>
<td><b>SYSTEM & MODULE</b></td>
<td><b>TABLE/ROOM</b></td>
</tr>
<tr>
<td>8:00AM-12:00PM</td>
<td>CHRIS JANIAK</td>
<td>Call of Cthulhu: The Books of Uncle Silas</td>
<td>Miskatonic University</td>
</tr>
<tr>
<td>8:00AM-1:00PM</td>
<td>REALITY A GAMES</td>
<td>Magic the Gathering Rolling Drafts</td>
<td>Arkham Asylum (Salon 6)</td>
</tr>
<tr>
<td>8:00AM-2:00PM</td>
<td>SETH ZEREN</td>
<td>Arkham Horror</td>
<td>Angell Street</td>
</tr>
<tr>
<td>8:00AM-2:00PM</td>
<td>GENE LANCASTER</td>
<td>Trail of Cthulhu: Cthulhu Trek-The Derelict</td>
<td>Another Dimension (Salon 5)</td>
</tr>
<tr>
<td>9:00AM-11:00AM</td>
<td>ROLAND BRUNO</td>
<td>Cthulhu Wars</td>
<td>Dunwich</td>
</tr>
<tr>
<td>9:00AM-1:00PM</td>
<td>BILL ADCOCK</td>
<td>Call of Cthulhu 7th ed: The Haunting of the De Morcey House</td>
<td>Hibb's Roadhouse</td>
</tr>
<tr>
<td>9:00AM-1:00PM</td>
<td>LYON HEART MEDIA LLC</td>
<td>Empire in Flames</td>
<td>State Suite A</td>
</tr>
<tr>
<td>10:00AM-12:00PM</td>
<td>ADAM BYSKO</td>
<td>Rune Wars</td>
<td>Red Hook</td>
</tr>
<tr>
<td>10:00AM-12:00PM</td>
<td>KRISTIN ROACH</td>
<td>Rune Wars</td>
<td>Providence</td>
</tr>
<tr>
<td>10:00AM-2:00PM</td>
<td>MATT RYAN</td>
<td>Call of Cthulhu 7th ed: The Founding</td>
<td>The Dreamlands</td>
</tr>
<tr>
<td>10:00AM-2:00PM</td>
<td>ASHWICK PLANTATION</td>
<td>Owl's Hollow</td>
<td>State Suite B</td>
</tr>
<tr>
<td>10:00AM-4:00PM</td>
<td>STEVE ROSENSTEIN</td>
<td>Pulp Cthulhu: Yojimbo</td>
<td>Velma's Diner</td>
</tr>
<tr>
<td>10:00AM-4:00PM</td>
<td>CORY WELCH</td>
<td>Call of Cthulhu 7th ed: And Some Fell on the Stony Ground</td>
<td>Historical Society (Salon 4)</td>
</tr>
<tr>
<td>10:00AM-4:00PM</td>
<td>BRIAN MYHRE</td>
<td>Call of Cthulhu 7th ed: Chicago Heaters Bring Little Warmth</td>
<td>R'lyeh</td>
</tr>
<tr>
<td>12:00PM-2:00PM</td>
<td>ROLAND BRUNO</td>
<td>Cthulhu Wars</td>
<td>Dunwich</td>
</tr>
<tr>
<td>1:00PM-3:00PM</td>
<td>ADAM BYSKO</td>
<td>Rune Wars</td>
<td>Red Hook</td>
</tr>
<tr>
<td>1:00PM-3:00PM</td>
<td>KRISTIN ROACH</td>
<td>Rune Wars</td>
<td>Providence</td>
</tr>
<tr>
<td>1:00PM-5:00PM</td>
<td>LYNNE HARDY</td>
<td>Call of Cthulhu 7th ed: Bad Habits Achtung! Cthulhu</td>
<td>Miskatonic University</td>
</tr>
<tr>
<td>2:00PM-6:00PM</td>
<td>JASON BRADLEY THOMPSON</td>
<td>Dreamland: To the Edge of the World</td>
<td>Hibb's Roadhouse</td>
</tr>
<tr>
<td>2:00PM-6:00PM</td>
<td>SEAN MURPHY; EDWIN NAGY; DAVID CLARKSON & MORE!</td>
<td>Extra Life Charity</td>
<td>State Suite A</td>
</tr>
<tr>
<td>2:00PM-8:00PM</td>
<td>REALITY A GAMES</td>
<td>Magic the Gathering Modern Tournament</td>
<td>Arkham Asylum (Salon 6)</td>
</tr>
<tr>
<td>3:00PM-7:00PM</td>
<td>DAN COMBS</td>
<td>Call of Cthulhu 7th ed: Those Within</td>
<td>Angell Street</td>
</tr>
<tr>
<td>3:00PM-7:00PM</td>
<td>NOAH LLOYD</td>
<td>Call of Cthulhu: An Amaranthine Desire</td>
<td>Another Dimension (Salon 5)</td>
</tr>
<tr>
<td>3:00PM-7:00PM</td>
<td>CHRIS JANIAK</td>
<td>Call of Cthulhu: The Condemned</td>
<td>Dunwich</td>
</tr>
<tr>
<td>3:00PM-7:00PM</td>
<td>ASHWICK PLANTATION</td>
<td>Owl's Hollow</td>
<td>State Suite B</td>
</tr>
<tr>
<td>4:00PM-6:00PM</td>
<td>ADAM BYSKO</td>
<td>Rune Wars</td>
<td>Red Hook</td>
</tr>
<tr>
<td>4:00PM-6:00PM</td>
<td>KRISTIN ROACH</td>
<td>Rune Wars</td>
<td>Providence</td>
</tr>
<tr>
<td>5:00PM-9:00PM</td>
<td>MATT RYAN</td>
<td>Call of Cthulhu 7th ed: A Weekend in the Woods</td>
<td>Velma's Diner</td>
</tr>
<tr>
<td>6:00PM-10:00PM</td>
<td>MATT SANDERSON</td>
<td>World War Cthulhu Cold War: Cadenza</td>
<td>Miskatonic University</td>
</tr>
<tr>
<td>6:00PM-10:00PM</td>
<td>CORY WELCH</td>
<td>Call of Cthulhu 7th ed: Camp Sunny</td>
<td>Swan Point</p>
<p>(Salon 1)</td>
</tr>
<tr>
<td>6:00PM-12:00AM</td>
<td>PAUL ZANE</td>
<td>Call of Cthulhu: Dissolution of Memory</td>
<td>Historical Society (Salon 4)</td>
</tr>
<tr>
<td>8:00PM-12:00AM</td>
<td>ASHWICK PLANTATION</td>
<td>Owl's Hollow</td>
<td>State Suite B</td>
</tr>
<tr>
<td>8:00PM-12:00AM</td>
<td>SETH ZEREN</td>
<td>10 Candles</td>
<td>Another Dimension (Salon 5)</td>
</tr>
<tr>
<td>9:00PM-12:00AM</td>
<td>REALITY A GAMES</td>
<td>Magic the Gathering Rolling Drafts</td>
<td>Arkham Asylum (Salon 6)</td>
</tr>
</tbody>
</table>

<!--sunday-->
<table>
<tbody>
<tr>
<td><b>SUNDAY</b></td>
<td><b>GM NAME</b></td>
<td><b>SYSTEM & MODULE</b></td>
<td><b>TABLE/ROOM</b></td>
</tr>
<tr>
<td>8:00AM-12:00PM</td>
<td>GENE LANCASTER</td>
<td>Crypts & Things: The Halls of Nizar-Thun</td>
<td>Velma's Diner</td>
</tr>
<tr>
<td>8:00AM-5:00PM</td>
<td>REALITY A GAMES</td>
<td>Magic the Gathering Rolling Drafts</td>
<td>Salon 2</td>
</tr>
<tr>
<td>9:00AM-11:00AM</td>
<td>ROLAND BRUNO</td>
<td>Cthulhu Wars</td>
<td>Angell Street</td>
</tr>
<tr>
<td>9:00AM-1:00PM</td>
<td>CHRIS JANIAK</td>
<td>Call of Cthulhu: Edge of Darkness</td>
<td>R'lyeh</td>
</tr>
<tr>
<td>9:00AM-3:00PM</td>
<td>REALITY A GAMES</td>
<td>Magic the Gathering Commander Two-Headed Giant Tournament</td>
<td>Arkham Asylum (Salon 6)</td>
</tr>
<tr>
<td>10:00AM-12:00PM</td>
<td>ADAM BYSKO</td>
<td>Rune Wars</td>
<td>Red Hook</td>
</tr>
<tr>
<td>10:00AM-12:00PM</td>
<td>KRISTIN ROACH</td>
<td>Rune Wars</td>
<td>Providence</td>
</tr>
<tr>
<td>10:00AM-2:00PM</td>
<td>SETH ZEREN</td>
<td>Betrayal at the House on the Hill</td>
<td>Hibb's Roadhouse</td>
</tr>
<tr>
<td>10:00AM-2:00PM</td>
<td>MATT RYAN</td>
<td>Call of Cthulhu 7th ed: The Founding</td>
<td>Dunwich</td>
</tr>
<tr>
<td>10:00AM-2:00PM</td>
<td>DAN COMBS</td>
<td>Pulp Cthulhu: Midnight Masquerade</td>
<td>The Dreamlands</td>
</tr>
<tr>
<td>10:00AM-2:00PM</td>
<td>MATT PUCCIO</td>
<td>Call of Cthulhu 7th ed: Heart of Darkness</td>
<td>Historical Society (Salon 4)</td>
</tr>
<tr>
<td>10:00AM-2:00PM</td>
<td>LYON HEART MEDIA LLC</td>
<td>Empire in Flames</td>
<td>State Suite A</td>
</tr>
<tr>
<td>10:00AM-3:00PM</td>
<td>ASHWICK PLANTATION</td>
<td>Owl's Hollow</td>
<td>State Suite B</td>
</tr>
<tr>
<td>11:00AM-3:00PM</td>
<td>HERBIE HICKS & RICH MOWRY</td>
<td>Fortuna: Quest Through the Obsidian Spire</td>
<td>Yuggoth</td>
</tr>
<tr>
<td>12:00PM-2:00PM</td>
<td>ROLAND BRUNO</td>
<td>Cthulhu Wars</td>
<td>Angell Street</td>
</tr>
<tr>
<td>12:00PM-4:00PM</td>
<td>LYNNE HARDY</td>
<td>Cogs, Cakes & Swordsticks: Cogs, Cakes & Cthulhu</td>
<td>Miskatonic University</td>
</tr>
<tr>
<td>12:00PM-4:00PM</td>
<td>MIKE MASON</td>
<td>Call of Cthulhu</td>
<td>Another Dimension (Salon 5)</td>
</tr>
<tr>
<td>1:00PM-3:00PM</td>
<td>ADAM BYSKO</td>
<td>Rune Wars</td>
<td>Red Hook</td>
</tr>
<tr>
<td>1:00PM-3:00PM</td>
<td>KRISTIN ROACH</td>
<td>Rune Wars</td>
<td>Providence</td>
</tr>
<tr>
<td>1:00PM-5:00PM</td>
<td>BRUCE RUSK</td>
<td>Call of Cthulhu 7th ed: Devourers in the Mist</td>
<td>Velma's Diner</td>
</tr>
<tr>
<td>3:00PM-5:00PM</td>
<td>BADGER MCINNES</td>
<td>Feed the Shoggoth</td>
<td>Hibb's Roadhouse</td>
</tr>
</tbody>
</table>

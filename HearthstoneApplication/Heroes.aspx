<%@ Page Title="" Language="C#" MasterPageFile="~/Header_Footer.Master" AutoEventWireup="true" CodeBehind="Heroes.aspx.cs" Inherits="HearthstoneApplication.Heroes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
        <h1 class="Center"><strong>The Heroes of Hearthstone & Their Abilities</strong></h1>
        <div class="tabbable tabs-left tabsmargin">
            <ul id="tabs" class="nav nav-tabs">
                <li class="active"><a href="#Druid" data-toggle="tab">
                    <img alt="Druid" src='<%= ConfigurationManager.AppSettings["imgPath"] + "Images/Hearthstone/Icons/DruidIcon.png"%>' />
                    Druid</a></li>
                <li><a href="#Hunter" data-toggle="tab">
                    <img alt="Hunter" src='<%= ConfigurationManager.AppSettings["imgPath"] + "Images/Hearthstone/Icons/HunterIcon.png"%>' />
                    Hunter</a></li>
                <li><a href="#Mage" data-toggle="tab">
                    <img alt="Mage" src='<%= ConfigurationManager.AppSettings["imgPath"] + "Images/Hearthstone/Icons/MageIcon.png"%>' />
                    Mage</a></li>
                <li><a href="#Paladin" data-toggle="tab">
                    <img alt="Paladin" src='<%= ConfigurationManager.AppSettings["imgPath"] + "Images/Hearthstone/Icons/PaladinIcon.png"%>' />
                    Paladin</a></li>
                <li><a href="#Priest" data-toggle="tab">
                    <img alt="Priest" src='<%= ConfigurationManager.AppSettings["imgPath"] + "Images/Hearthstone/Icons/PriestIcon.png"%>' />
                    Priest</a></li>
                <li><a href="#Rogue" data-toggle="tab">
                    <img alt="Rogue" src='<%= ConfigurationManager.AppSettings["imgPath"] + "Images/Hearthstone/Icons/RogueIcon.png"%>' />
                    Rogue</a></li>
                <li><a href="#Shaman" data-toggle="tab">
                    <img alt="Shaman" src='<%= ConfigurationManager.AppSettings["imgPath"] + "Images/Hearthstone/Icons/ShamanIcon.png"%>' />
                    Shaman</a></li>
                <li><a href="#Warlock" data-toggle="tab">
                    <img alt="Warlock" src='<%= ConfigurationManager.AppSettings["imgPath"] + "Images/Hearthstone/Icons/WarlockIcon.png"%>' />
                    Warlock</a></li>
                <li><a href="#Warrior" data-toggle="tab">
                    <img alt="Warrior" src='<%= ConfigurationManager.AppSettings["imgPath"] + "Images/Hearthstone/Icons/WarriorIcon.png"%>' />
                    Warrior</a></li>
            </ul>
            <div id="mytabs" class="tab-content">
                <div class="tab-pane active tabpadding" id="Druid">
                    <img class="HeroPic" alt="Malfurion" title="Malfurion" src='<%= ConfigurationManager.AppSettings["imgPath"] + "Images/Hearthstone/HeroesPics/Malfurion.jpg"%>' />
                    <h1 class="Center">Malfurion Stormrage (Druid)</h1>
                    <h3 class="HearthHeaders">BIO:</h3>
                    <p><u>Malfurion Stormrage</u> was the first night elf druid, and initiated the mainstream use of druidism among the night elven people ten millenia ago under tutelage of the demigod Cenarius. Through Malfurion's guidance, the kaldorei managed to successfully halt the Burning Legion's first invasion of Azeroth during the War of the Ancients. In its aftermath, he became the greatest of the world's archdruids. Malfurion Stormrage is the twin brother of Illidan Stormrage, as well as the loving and beloved husband of the high priestess of Elune, Tyrande Whisperwind. Together, the two have represented the highest leadership of the night elves ever since the fall of Queen Azshara and her Highborne caste.</p>
                    <p>Malfurion is often referred to as shan'do, which means "Honored Instructor" in Darnassian. Connected deeply to the ebb and flow of all life on Azeroth and bearing ten thousand years of responsibility and experience, he is one of the most powerful and venerated mortals of the Warcraft universe.</p>
                    <img class="AbilityIcon" alt="Druid" title="Druid" src='<%= ConfigurationManager.AppSettings["imgPath"] + "Images/Hearthstone/AbilityIcon/Druid.png"%>' />
                    <br />
                    <h3 class="HearthHeaders">Hero Power:</h3>
                    <p><span class="bigword">Shapeshift:</span> +1 Attack to Malfurion for this turn, and +1 Armor. (The armor stays and stacks for later turns)</p>
                    <br />
                    <h3 class="HearthHeaders">Legendary Card:</h3>
                    <img class="Card" alt="Cenarius" src='<%= ConfigurationManager.AppSettings["imgPath"] + "Images/Hearthstone/Cards/Cenarius.png"%>' />
                    <p><span class="bigword">CENARIUS:</span> is the ultimate card needed for any Druid deck who wants to take a heavy board presence going into late game! For 8 cost Cenarius is a 5 attack 8 health minion who gives the user one of two choices.</p>
                    <ol id="CenariusChoices">
                        <li>The first choice is to give your squadren of minions +2/2 which can be overwhelming for your opponent if you already have out a large force(this can buff all your minions attack by two before they attack on this same turn if you summon Cenarius first!).<br />
                        </li>
                        <li>The Second Option is to summon two 2/2 Treants with Taunt. This Option is a good choice if your board is empty or if you are in dire need of taunt minions to guard your hero or protect your important squishy minions!</li>
                    </ol>
                </div>

                <div class="tab-pane tabpadding" id="Hunter">
                    <img class="HeroPic" alt="Rexxar" src='<%= ConfigurationManager.AppSettings["imgPath"] + "Images/Hearthstone/HeroesPics/Rexxar.jpg"%>' />
                    <h1 class="Center">Rexxar (Hunter)</h1>
                    <h3 style="color: #FFF">BIO:</h3>
                    <p><u>Rexxar</u>, Champion of the Horde, is a half-ogre, half-orc beastmaster of the Mok'Nathal clan, and may be one of the last half-ogres of the clan. He saved the city of Orgrimmar from the hatred of an enemy of the Horde. He was instrumental in assisting the Horde after the fall of the Burning Legion. Due to his mixed lineage, he is a towering and massively muscled warrior, and he wields his two huge axes with tremendous skill and ferocity. Rexxar is always seen with his loyal bear companion Misha.</p>
                    <p>Prior to World of Warcraft: The Burning Crusade, the warrior wandered a path from the Charred Vale in Stonetalon Mountains along the main road through Desolace and continued to the Twin Colossals in northern Feralas. Currently, he can be found in Thunderlord Stronghold in the Blade's Edge Mountains of Outland, protecting the settlement against ogres and gronn while trying to find more of his people.</p>
                    <img class="AbilityIcon" alt="Hunter" title="Hunter" src='<%= ConfigurationManager.AppSettings["imgPath"] + "Images/Hearthstone/AbilityIcon/Hunter.png"%>' />
                    <br />
                    <h3 style="color: #FFF">Hero Power:</h3>
                    <p><span class="bigword">Steady Shot:</span> Deal 2 damage to the enemy hero</p>
                    <br />
                    <h3 class="HearthHeaders">Legendary Card:</h3>
                    <img class="Card" alt="King" src='<%= ConfigurationManager.AppSettings["imgPath"] + "Images/Hearthstone/Cards/King.png"%>' />
                    <p><span class="bigword">King Krush:</span> packs one of the largest late blows in the game. Although Krush costs 9 he is an 8/8 with charge which can really take your enemy by surprise late game. If you can get the field set up so that no taunt minions are on the board and then toss down Krush to hit the enemy for 8 direct damage points that can be the final blow needed to finish your opponent off!</p>
                </div>

                <div class="tab-pane tabpadding" id="Mage">
                    <img class="HeroPic" alt="Jaina" src='<%= ConfigurationManager.AppSettings["imgPath"] + "Images/Hearthstone/HeroesPics/Jaina.jpg"%>' />
                    <h1 class="Center">Jaina Proudmoore (Mage)</h1>
                    <h3 style="color: #FFF">BIO:</h3>
                    <p><u>Jaina Proudmoore</u>, Jaina Proudmoore is the founder and former leader of Theramore Isle, the Alliance's major port in southern Kalimdor. After the destruction of Theramore, she took leadership of the Kirin Tor. She is the daughter of Grand Admiral Daelin Proudmoore, sister of Tandred Proudmoore and Derek Proudmoore, and the alleged half-sister of Finnall Goldensword. She is also the most powerful human sorceress on Azeroth.</p>
                    <p>Jaina was one of the most talented and trusted sorceresses of the Kirin Tor. She was dispatched by Antonidas to discover what was happening in the northlands of Lordaeron. She was escorted by her childhood friend and one-time romantic interest, Prince Arthas Menethil, to uncover if the plague had magical origins. Jaina saw the fall of Lordaeron firsthand and — guided by a mysterious prophet — rallied what survivors she could and fled across the sea to Kalimdor.</p>
                    <p>Jaina swore to defeat the Burning Legion and its sinister agents any way she could. Joining forces with the night elves and even the orcish Horde, Jaina helped defeat the demon Archimonde and banish the Legion. She then gathered the human survivors in Kalimdor and founded the port city of Theramore. She rules here over the tattered remnants of the Alliance and hopes to reunite the distant human kingdoms once more.</p>
                    <img class="AbilityIcon" alt="Mage" title="Mage" src='<%= ConfigurationManager.AppSettings["imgPath"] + "Images/Hearthstone/AbilityIcon/Mage.png"%>' />
                    <br />
                    <h3 style="color: #FFF">Hero Power:</h3>
                    <p><span class="bigword">Fireblast:</span> Deal 1 damage(this can hit any character, of your choice, on the board)</p>
                    <br />
                    <h3 class="HearthHeaders">Legendary Card:</h3>
                    <img class="Card" alt="Archmage" src='<%= ConfigurationManager.AppSettings["imgPath"] + "Images/Hearthstone/Cards/Archmage.png"%>' />
                    <p><span class="bigword">Archmage Antonidas:</span> is very powerful in majority of mage decks. Assuming you are spell heavy then Antonidas is a most have. If you can hold off and make late game with Antonidas till turn 8 or 9 and play him along with 1 or 2 (0 or 1) cost spells then you are guranteed 2 fireballs and maybe more if he survives the next turn. Having fireballs in your hands will really keep your opponent on their toes and worried aobut all the direct damage you can cause!</p>
                </div>

                <div class="tab-pane tabpadding" id="Paladin">
                    <img class="HeroPic" alt="Uther" src='<%= ConfigurationManager.AppSettings["imgPath"] + "Images/Hearthstone/HeroesPics/Uther.jpg"%>' />
                    <h1 class="Center">Uther the Lightbringer (Paladin)</h1>
                    <h3 style="color: #FFF">BIO:</h3>
                    <p><u>Uther the Lightbringer</u>, Lord Uther the Lightbringer, or Sire Uther Lightbringer, was the first paladin of the Knights of the Silver Hand who led his Order in battle against the Horde during the Third War. During the Third War, Uther was betrayed and murdered by his beloved pupil, Prince Arthas, while defending the urn carrying the ashes of Arthas' father, King Terenas. He is believed to have been canonized as a saint by the Church of Light.</p>
                    <img class="AbilityIcon" alt="Paladin" title="Paladin" src='<%= ConfigurationManager.AppSettings["imgPath"] + "Images/Hearthstone/AbilityIcon/Paladin.png"%>' />
                    <p>Uther is generally viewed as a hero and a martyr who was loyal to his nation, order and king to the death. Being the creator of the Knights of the Silver Hand, a commander during the Second War and instrumental in rallying the shaken Alliance to victory after the death of Anduin Lothar has immortalized him as one of the greatest knights and holy men ever to live in the eyes of many.</p>
                    <br />
                    <h3 style="color: #FFF">Hero Power:</h3>
                    <p><span class="bigword">Reinforce:</span> Summon a 1/1 Silver Hand Recruit. (This does count as a minion and will trigger cards with minion effects)</p>
                    <br />
                    <h3 class="HearthHeaders">Legendary Card:</h3>
                    <img class="Card" alt="Tirion" src='<%= ConfigurationManager.AppSettings["imgPath"] + "Images/Hearthstone/Cards/Tirion.png"%>' />
                    <p><span class="bigword">Tirion Fordring:</span> Tirion is a heavy ability driven minion. He costs 8 and is only a 6/6 but don't let that fool you into thinking he is not immensly useful! Tirion has divine shield & Taunt which immediatly makes him a strong force to reckon with! Then even after they can manage to break through his shield and kill him off, my favorate is his Deathrattle: Equip a 5/3 Ashbringer! This sword really allows the paladin to get in more blows for 5 damage a turn! This can be very strong to finish off your opponent or his troublesome minions. Tirions biggest weakness however is a silence! If he gets silenced then you just payed 8 for a 6/6...</p>
                </div>

                <div class="tab-pane tabpadding" id="Priest">
                    <img class="HeroPic" alt="Anduin" src='<%= ConfigurationManager.AppSettings["imgPath"] + "Images/Hearthstone/HeroesPics/Anduin.jpg"%>' />
                    <h1 class="Center">Anduin Wrynn (Priest)</h1>
                    <h3 style="color: #FFF">BIO:</h3>
                    <p><u>Anduin Wrynn</u>, the current Prince of Stormwind, son of Varian Wrynn, King of Stormwind, capital city of the Alliance. Anduin became king of Stormwind when he was just a boy of age 10. This occured when his father was kidnapped by Edwin VanCleef and the throne needed a king that is until his father returned.</p>
                    <p>At the age of 15 Anduin pulled away from traditional combat training to study the light; ultimately choosing the path of a priest after being encouraged by King Magni Bronzebeard and High Priest Rohan. During Mists of Pandaria, Anduin traveled to the Vale of Eternal Blossoms to study alongside the night elves. Anduin's research led him to learning about the Ancient Mogu relic, known as the Divine Bell. Anduin Wrynn ended up thwarting Garrosh Hellscream's attempt to use the Divine Bell, but ironically enough the Divine Bell was destroyed in rage by Garrosh Hellscream, causing the Divine Bell to collapse and injure Anduin.</p>
                    <p>Anduin possesses remarkable skills with a knife, kudos to Valeera Sanguinar. She serves as both his bodyguard, and his teacher.</p>
                    <img class="AbilityIcon" alt="Priest" title="Priest" src='<%= ConfigurationManager.AppSettings["imgPath"] + "Images/Hearthstone/AbilityIcon/Priest.png"%>' />
                    <br />
                    <h3 style="color: #FFF">Hero Power:</h3>
                    <p><span class="bigword">Lessar Heal:</span> Restore 2 Health. (This can be done to any character you choose, if you heal an enraged enemy minion to full health then the enrage won't be triggered anymore)</p>
                    <br />
                    <h3 class="HearthHeaders">Legendary Card:</h3>
                    <img class="Card" alt="Prophet Velen" src='<%= ConfigurationManager.AppSettings["imgPath"] + "Images/Hearthstone/Cards/Velen.png"%>' />
                    <p><span class="bigword">Prophet Velen:</span> Prophet is a great card and a must if you are playing a spell heavy deck. He is the vital piece to your deck if you are wanting your main strategy to be shadowform and direct damage spells.</p>
                </div>

                <div class="tab-pane tabpadding" id="Rogue">
                    <img class="HeroPic" alt="Valeera" src='<%= ConfigurationManager.AppSettings["imgPath"] + "Images/Hearthstone/HeroesPics/Valeera.jpg"%>' />
                    <h1 class="Center">Valeera Sanguinar (Rogue)</h1>
                    <h3 style="color: #FFF">BIO:</h3>
                    <p><u>Valeera Sanguinar</u>: According to the World of Warcraft Comics, after her parents were killed by bandits, she lived the life of thief, causing her to get caught and then sold to fight in the arenas. After winning a gladiator contest at Dire Maul, she was sold once again but managed to escape with her companions, one of them turning out to be the lost king of Stormwind, Varian Wrynn, father of Anduin Wrynn, another playable character in Hearthstone.</p>
                    <p>After they decided to go to Stormwind, they faced many dangers, which resulted in Valeera getting addicted to magic and hit by a demon's mark. When they finally reached Stormwind, Valeera becomes an adviser to Varian and, with Anduin's help, works toward a durable peace between the Horde and the Alliance. Even though the signature of the first treaty is cancelled by an attack, Valeera keeps trying to make the Horde and Alliance cooperate against their common enemies, such as the Lich King. She counts herself as neither Horde, nor Alliance, and her loyalties lie only towards Varian, Broll, and Varian's Son, Anduin.</p>
                    <img class="AbilityIcon" alt="Rogue" title="Rogue" src='<%= ConfigurationManager.AppSettings["imgPath"] + "Images/Hearthstone/AbilityIcon/Rogue.png"%>' />
                    <br />
                    <h3 style="color: #FFF">Hero Power:</h3>
                    <p><span class="bigword">Dagger Mastery:</span> Equip a 1/2 Dagger; or Give your weapon +1 Attack this turn.</p>
                    <br />
                    <h3 class="HearthHeaders">Legendary Card:</h3>
                    <img class="Card" alt="Edwin VanCleef" src='<%= ConfigurationManager.AppSettings["imgPath"] + "Images/Hearthstone/Cards/VanCleef.png"%>' />
                    <p><span class="bigword">Edwin VanCleef:</span> Edwin at first glance seems to be one of the weakest legendary cards, but don't let this fool you. If used correctly and put into a rogue deck with many 0, 1 and 2 cost cards he can be one of the deadliest cards in the game. All it takes is 3+ low costs cards plus him in one turn and a lot could happen that your oppenent probably isn't ready for, and since Edwin has stealth he cannot be knocked out very easily without you first delivering a blow to something.</p>
                </div>

                <div class="tab-pane tabpadding" id="Shaman">
                    <img class="HeroPic" alt="Thrall" src='<%= ConfigurationManager.AppSettings["imgPath"] + "Images/Hearthstone/HeroesPics/Thrall.jpg"%>' />
                    <h1 class="Center">Thrall (Shaman)</h1>
                    <h3 style="color: #FFF">BIO:</h3>
                    <p><u>Thrall</u>, Former Warchief of the Horde. Raised by humans as a gladiator, he later escaped from Durnholde. Fought under Orgrim Doomhamer, the name sake of the Horde Capitol, Orgrimmar, to liberate the orcs interned after the Second War. During the liberation of the last of the camps, Orgrimar fell in combat bestowing his black plate, the title of Warchief, and the Doomhammer upon Thrall. Thrall then gathered his Horde and sailed to Kalimdor, and settled Durotar, the new home for the Orcs. He joined the Earthing Ring shaman after the Shattering to help repair the elements of the world. Appointed Garrosh Hellscream as his replacement. With the help of the dragon aspects and a group of mortal heroes, he used the Dragon Soul to destroy Deathwing, and save Azeroth from destruction.</p>
                    <p>Thrall was born as the son of Durotan, whom Durotar is named after, and Draka. According to World of Warcraft novels, Thrall was found as an infant in close proximity to the slaughtered corpses of his parents by Aedelas Blackmoore. Blackmoore then named him "Thrall", which in human tongue is another word for "slave". Blackmoore then took Thrall to Durnholde Keep, raising him as a gladiator. Thrall had both the intelligence of a human, and the ferocity and savagery of an Orc. Thrall grew to befriend Taretha Foxton, a human woman who can be seen in World of Warcraft at the Caverns of Time instance, Escape From Durnholde Keep, in which you aid Thrall in his escape from Durnholde. Taretha later allowed for Thrall to escape by creating a diversion with fire. Thrall was then taken to an internment camp, where he met fellow members of the Horde, and learned of the corruption of Gul'dan, an Orcish Warlock. Thrall, with the help of Grom Hellscream, father to Garrosh Hellscream, later created a Horde army, in which he used to return to Durnholde and confront Blackmoore, only to have Taretha's severed head thrown at his feet.</p>
                    <img class="AbilityIcon" alt="Shaman" title="Shaman" src='<%= ConfigurationManager.AppSettings["imgPath"] + "Images/Hearthstone/AbilityIcon/Shaman.png"%>' />
                    <br />
                    <h3 style="color: #FFF">Hero Power:</h3>
                    <p>
                        <span class="bigword">Totemic Call:</span> Summon a random Totem. (The Totems are minions and trigger any cards with minion effects)<br />
                        The four types of Totems are:
                    <br />
                        &nbsp;&nbsp;&nbsp; 1) Healing Totem: 0/2 At the end of your turn, restore 1 Health to all friendly characters.
                    <br />
                        &nbsp;&nbsp;&nbsp; 2) Searing Totem: 1/1
                    <br />
                        &nbsp;&nbsp;&nbsp; 3) Stoneclaw Totem: 0/2 Taunt
                    <br />
                        &nbsp;&nbsp;&nbsp; 4) Wrath of Air Totem: 0/2 Spell Power +1
                    </p>
                    <br />
                    <h3 class="HearthHeaders">Legendary Card:</h3>
                    <img class="Card" alt="Al'Akir the Windlord" src='<%= ConfigurationManager.AppSettings["imgPath"] + "Images/Hearthstone/Cards/Windlord.png"%>' />
                    <p><span class="bigword">Al'Akir the Windlord:</span> The Windlord is actually one of my least favorate legendarys. I love playing my Shaman deck but Al'Akir doesn't typically play a very good role in my Shaman(minion heavy) deck. However thats just with my specific deck. He is very prone to silence and if he does get silenced you just payed 8 for a 3/5. However the fact that he has charge & windwalk allow you to get out 2 attacks of 3 damage each on any pesky minions that need to be taken care of. Your opponent can't very well plan for double charge attacks.</p>
                </div>

                <div class="tab-pane tabpadding" id="Warlock">
                    <img class="HeroPic" alt="Gul'dan" src='<%= ConfigurationManager.AppSettings["imgPath"] + "Images/Hearthstone/HeroesPics/Guldan.jpg"%>' />
                    <h1 class="Center">Gul'dan (Warlock)</h1>
                    <h3 style="color: #FFF">BIO:</h3>
                    <p><u>Gul'dan</u>, Formerly an orc shaman of the Shadowmoon Clan, he was the first orc to become a warlock and is credited with creating the Orcish Horde. On his quest for power he betrayed his people, including his mentor, to the demonlord Kil'jaeden. He is the creator of the Shadow Council and death knights, and is considered to be one of the strongest warlocks in the Warcraft universe. Gul'dan was at fault for the orcs' descent towards demonic enslavement. He was also a primary factor in the Orcish Horde invading Azeroth. His other self-given alias' are "Darkness Incarnate" and "The Destroyer of Dreams." Gul'dan was slain near the end of the Second War. He attempted to retrieve the power of Sargeras from the Tomb of Sargeras, but was torn to shreds by demons when he unlocked the tomb. All of the knowledge Gul'dan had was sealed in his skull. His skull would later be used as a channeling totem for demonic energies. Gul'dan's skull has been used countless numbers of times by both Ner'zhul and the Burning Legion to create havoc on both Draenor and Azeroth. That was until Illidan Stormrage found the skull. He held the skull of Gul'dan until his untimely demise within the Black Temple. It can be looted by players in World of Warcraft. Gul'dan was also responsible for creating the fel volcano known as the Hand of Gul'dan. It was created when he cut the orcs' ties to the shamanistic magics of Draenor.</p>
                    <p>Warlock is the only class so far with a minion (Lord Jaraxxus) that replaces the hero and gives a new hero power.</p>
                    <p>Gul'dan is acknowledged across the entire Warcraft universe as one of the most powerful beings to have ever lived. According to Medivh, one of the greatest magi to have ever lived, Gul'dan is the single most powerful warlock of his people. Gul'dan was once able to cast a spell that not only wiped out the entirety of an Arakkoa camp, but twisted their spirits entirely as well.</p>
                    <img class="AbilityIcon" alt="Warlock" title="Warlock" src='<%= ConfigurationManager.AppSettings["imgPath"] + "Images/Hearthstone/AbilityIcon/Warlock.png"%>' />
                    <br />
                    <h3 style="color: #FFF">Hero Power:</h3>
                    <p><span class="bigword">Life Tap:</span> Draw a card and take 2 damage to your hero.</p>
                    <br />
                    <h3 class="HearthHeaders">Legendary Card:</h3>
                    <img class="Card" alt="Lord Jaraxxus" src='<%= ConfigurationManager.AppSettings["imgPath"] + "Images/Hearthstone/Cards/Jaraxxus.png"%>' />
                    <p><span class="bigword">Lord Jaraxxus:</span> Good Ole jaraxxus! Feared by many loved by all warlocks! I can't really think of anybody who would play a warlock deck and wouldn't put Jaraxxus in their deck. He is a one of a kind card where Jaraxxus kills Gul'dan and takes his place as your new hero. He makes your hero power summon an 6/6 Inferno and he Jaraxxus has a weapon 3/8 which u can use basically for the remainder of the game. However! Since he costs 9 he can only work if you can make it to the 9th turn, and typically warlocks are more aggressive than most characters and they are either all in and win or dead by round 7. Although, if you can last long enough and you are below 15 health he can be a game changer if both players are low on cards and you can get out those infernos for cheap.</p>
                </div>

                <div class="tab-pane tabpadding" id="Warrior">
                    <img class="HeroPic" alt="Garrosh Hellscream" src='<%= ConfigurationManager.AppSettings["imgPath"] + "Images/Hearthstone/HeroesPics/Garrosh.jpg"%>' />
                    <h1 class="Center">Garrosh Hellscream (Warrior)</h1>
                    <h3 style="color: #FFF">BIO:</h3>
                    <p><u>Garrosh Hellscream</u>, Current Warchief of the Horde and son of Grommash Hellscream, Garrosh is well-known for his fierce hatred of the Alliance. Garrosh was chosen to lead the Horde campaign in Northrend, in the battle against the Lich King. Soon after the fall of Icecrown Citadel, Thrall appointed Garrosh to be the next Warchief, Cairne Bloodhoof, Leader of the Tauren, challenged him to honorable non-lethal combat for leadership of the Horde. Unbeknownst to Garrosh, his blade was poisoned and he ended up killing Cairne, and his son Baine Bloodhoof became the Tauren Leader.</p>
                    <p>Garrosh, now in Pandaria has slain the Pandaren leader Taran Zhu, directly after releasing the caged sha and corrupting the Vale of Eternal Blossoms.</p>
                    <img class="AbilityIcon" alt="Warrior" title="Warrior" src='<%= ConfigurationManager.AppSettings["imgPath"] + "Images/Hearthstone/AbilityIcon/Warrior.png"%>' />
                    <br />
                    <h3 style="color: #FFF">Hero Power:</h3>
                    <p><span class="bigword">Armor Up:</span> Gain 2 Armor. (This is stackable and lasts until used)</p>
                    <br />
                    <h3 class="HearthHeaders">Legendary Card:</h3>
                    <img class="Card" alt="Grom Hellscream" src='<%= ConfigurationManager.AppSettings["imgPath"] + "Images/Hearthstone/Cards/Grom.png"%>' />
                    <p><span class="bigword">Grom Hellscream:</span> Hellscream! Fierce and bloodlusted throughout Warcraft Lore! His card is just like his character, a force to reckon with! Grom is a 4/9 8 cost with charge. This doesn't seem like much but Grom's enrage ablilty gives +6 attack! Grom if combined with a wirlwind or a something that can damage him off the bat allows you to hit for a 10 on the same turn you summon him on! Wow, your opponent will have a hard time preparing for 10 damage coming out instantly!</p>
                </div>
            </div>
        </div>
</asp:Content>

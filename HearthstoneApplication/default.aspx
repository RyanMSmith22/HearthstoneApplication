<%@ Page Title="" Language="C#" MasterPageFile="~/Header_Footer.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="HearthstoneApplication.indexPage" %>

<asp:Content ID="Header" ContentPlaceHolderID="Head" runat="server">
</asp:Content>

<asp:Content ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent" runat="server">
    <section id="Featured" class="container-fluid">
        <div class="row-fluid">
            <div class="span12">
                <h2 style="color: #FFF" class="Center">
                    <strong>Links to other fan sites for HEARTHSTONE!</strong>
                </h2>
            </div>
        </div>
        <div id="HearthLinks" class="Center">
            <a href="http://us.battle.net/hearthstone/en/" target="_blank">
                <img id="Hearthstone" class="HSpics" src='<%= ConfigurationManager.AppSettings["imgPath"] + "Images/hearthstone.jpg"%>' title="Hearthstone" alt="Hearthstone" /></a>
            <a href="http://www.hearthdex.com/" target="_blank">
                <img id="Hearthdex" class="HSpics" src='<%= ConfigurationManager.AppSettings["imgPath"] + "Images/HearthDex.png"%>' title="Hearthdex" alt="Hearthdex" /></a>
            <a href="http://www.hearthpwn.com/" target="_blank">
                <img id="Hearthpwn" class="HSpics" src='<%= ConfigurationManager.AppSettings["imgPath"] + "Images/hearthpwn.png"%>' title="Hearthpwn" alt="Hearthpwn" /></a>
            <a href="http://hearthstone.gamepedia.com/Hearthstone_Wiki" target="_blank">
                <img id="HearthstoneWiki" class="HSpics" src='<%= ConfigurationManager.AppSettings["imgPath"] + "Images/hearthstonewiki.png"%>' title="HearthstoneWiki" alt="HearthstoneWiki" /></a>
            <a href="http://www.hearthstonepedia.org/" target="_blank">
                <img id="Hearthstonepedia" class="HSpics" src='<%= ConfigurationManager.AppSettings["imgPath"] + "Images/hearthstonepedia.jpeg"%>' title="HearthstonePedia" alt="HearthstonePedia" /></a>
            <a href="http://www.wowhead.com/hearthstone/cards" target="_blank">
                <img id="HearthstoneWowhead" class="HSpics" src='<%= ConfigurationManager.AppSettings["imgPath"] + "Images/wowhead.gif"%>' title="WowHead" alt="WowHead" /></a>
        </div>
    </section>
</asp:Content>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <section class="Hearthstone">
        <div class="wrapperCarousel">
            <div id="VideoCarousel" class="carousel slide">
                <ol class="carousel-indicators">
                    <li data-target="#VideoCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#VideoCarousel" data-slide-to="1"></li>
                </ol>
                <!-- Carousel items -->
                <div class="carousel-inner">
                    <div class="active item">
                        <iframe class="carouselImage" src="https://www.youtube.com/embed/QdXl3QtutQI?feature=player_detailpage" frameborder="0" allowfullscreen></iframe>
                    </div>
                    <div class="item">
                        <iframe class="carouselImage" src="https://www.youtube.com/embed/vF_PdZybRJE?feature=player_detailpage" frameborder="0" allowfullscreen></iframe>
                    </div>
                </div>
                <!-- Carousel nav -->
                <a class="carousel-control left" href="#VideoCarousel" data-slide="prev">&lsaquo;</a>
                <a class="carousel-control right" href="#VideoCarousel" data-slide="next">&rsaquo;</a>
            </div>
        </div>
        <div class="wrapperCarousel">
            <div id="HeroCarousel" class="carousel slide">
                <ol class="carousel-indicators">
                    <li data-target="#HeroCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#HeroCarousel" data-slide-to="1"></li>
                    <li data-target="#HeroCarousel" data-slide-to="2"></li>
                    <li data-target="#HeroCarousel" data-slide-to="3"></li>
                    <li data-target="#HeroCarousel" data-slide-to="4"></li>
                    <li data-target="#HeroCarousel" data-slide-to="5"></li>
                    <li data-target="#HeroCarousel" data-slide-to="6"></li>
                    <li data-target="#HeroCarousel" data-slide-to="7"></li>
                    <li data-target="#HeroCarousel" data-slide-to="8"></li>
                </ol>
                <!-- Carousel items -->
                <div class="carousel-inner">
                    <div class="active item">
                        <img src="/Images/Hearthstone/HeroesPics/Anduin.png" alt="Pic" class="carouselImage" />
                        <div class="carousel-caption center">
                            <h4>Anduin Wrynn, Prince of Stormwind (Priest)</h4>
                        </div>
                    </div>
                    <div class="item">
                        <img src="/Images/Hearthstone/HeroesPics/Garrosh.jpg" alt="Pic" class="carouselImage" />
                        <div class="carousel-caption center">
                            <h4>Garrosh Hellscream (Warrior)</h4>
                        </div>
                    </div>
                    <div class="item">
                        <img src="/Images/Hearthstone/HeroesPics/Gul'dan.jpg" alt="Pic" class="carouselImage" />
                        <div class="carousel-caption center">
                            <h4>Gul'dan (Warlock)</h4>
                        </div>
                    </div>
                    <div class="item">
                        <img src="/Images/Hearthstone/HeroesPics/Jaina.jpg" alt="Pic" class="carouselImage" />
                        <div class="carousel-caption center">
                            <h4>Jaina Proudmoore (Mage)</h4>
                        </div>
                    </div>
                    <div class="item">
                        <img src="/Images/Hearthstone/HeroesPics/Malfurion.png" alt="Pic" class="carouselImage" />
                        <div class="carousel-caption center">
                            <h4>Malfurion Stormrage (Druid)</h4>
                        </div>
                    </div>
                    <div class="item">
                        <img src="/Images/Hearthstone/HeroesPics/Rexxar.jpg" alt="Pic" class="carouselImage" />
                        <div class="carousel-caption center">
                            <h4>Rexxar (Hunter)</h4>
                        </div>
                    </div>
                    <div class="item">
                        <img src="/Images/Hearthstone/HeroesPics/Thrall.jpg" alt="Pic" class="carouselImage" />
                        <div class="carousel-caption center">
                            <h4>Thrall (Shaman)</h4>
                        </div>
                    </div>
                    <div class="item">
                        <img src="/Images/Hearthstone/HeroesPics/Uther.jpg" alt="Pic" class="carouselImage" />
                        <div class="carousel-caption center">
                            <h4>Sir Uther the Lightbringer (Paladin)</h4>
                        </div>
                    </div>
                    <div class="item">
                        <img src="/Images/Hearthstone/HeroesPics/Valeera.jpg" alt="Pic" class="carouselImage" />
                        <div class="carousel-caption center">
                            <h4>Valeera Sanguinar (Rogue)</h4>
                        </div>
                    </div>
                </div>
                <!-- Carousel nav -->
                <a class="carousel-control left" href="#HeroCarousel" data-slide="prev">&lsaquo;</a>
                <a class="carousel-control right" href="#HeroCarousel" data-slide="next">&rsaquo;</a>
            </div>
        </div>

    </section>
    <script type="text/javascript">
        $(document).ready(carousel());
        function carousel() {
            $('#VideoCarousel').carousel('pause');
        }
    </script>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Header_Footer.Master" AutoEventWireup="true" CodeBehind="Stats.aspx.cs" Inherits="HearthstoneApplication.Stats" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div id="StatsContainer">
        <asp:Panel ID="pnlLogin" runat="server">
            <div class="span6 loginArea">
                <br />
                <br />
                <br />
                <br />
                <br />
                <asp:TextBox ID="txtLogin" CssClass="txtLogin" placeholder="Username" runat="server"></asp:TextBox>
                <br />
                <asp:TextBox ID="txtPassword" TextMode="Password" placeholder="Password" CssClass="txtLogin" runat="server"></asp:TextBox>
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <asp:ImageButton ID="btnLogin" CssClass="btnLogin" runat="server" ImageUrl='Images/hearthstone-btn-login.png' OnClick="btnLogin_Click" 
                    onmouseover="this.src='Images/hearthstone-btn-hover-login.png'" 
                    onmouseout="this.src='Images/hearthstone-btn-login.png'"/>
                <br />
                <asp:ImageButton ID="btnRegister" CssClass="btnLogin" runat="server" ImageUrl='Images/hearthstone-btn-register.png' OnClick="btnRegister_Click" 
                    onmouseover="this.src='Images/hearthstone-btn-hover-register.png'" 
                    onmouseout="this.src='Images/hearthstone-btn-register.png'"/>
                <asp:HiddenField ID="hdnUserID" runat="server"/>
            </div>
        </asp:Panel>
        <div id="SaveStatus">
            <asp:Label ID="lblSaveStatus" CssClass="msgSuccess" runat="server" Visible="false">Your Stats have been Saved Succussfully!</asp:Label>
        </div>
        <asp:Label ID="lblOutputMessage" CssClass="msgError" runat="server"></asp:Label>
        <asp:Panel ID="pnlStatMenu" runat="server" Visible="false">
            <div id="userSection" class="Center">
                <h1>Track Your Hearthstone Stats Here</h1>
                <div class="menuOptions">
                    <div class="span3 menuOptionBack Center">
                        <p>You can add stats for your currently logged-in account. This will save the stats to your specific username and can be found with your username when viewing stats.</p>
                        <br />
                        <asp:ImageButton ID="btnAddStats" runat="server" ImageUrl='Images/hearthstone-btn-add-stats.png' OnClick="btnAddStats_Click" 
                            onmouseover="this.src='Images/hearthstone-btn-hover-add-stats.png'" 
                            onmouseout="this.src='Images/hearthstone-btn-add-stats.png'"/>
                    </div>
                    <div class="span3 menuOptionBack Center">
                        <p>Enter in a username who has set his or her stats to public to view that person's Hearthstone win and loss statistics for each class.</p>
                        <div id="divUserName">
                            <asp:TextBox ID="txtUsername" placeholder="Username" runat="server"></asp:TextBox>
                        </div>
                        <asp:ImageButton ID="btnViewStats" runat="server" ImageUrl='Images/hearthstone-btn-view-stats.png' OnClick="btnViewStats_Click" 
                            onmouseover="this.src='Images/hearthstone-btn-hover-view-stats.png'" 
                            onmouseout="this.src='Images/hearthstone-btn-view-stats.png'"/>
                    </div>
                </div>
            </div>
        </asp:Panel>
        <div id="statsSection" class="Center container-fluid">
            <asp:Panel ID="pnlAddSection" runat="server" Visible="false">
                <div class="backAddSection">
                    <h2 class="Center">Add Your Stats</h2>
                    <br />
                    <div class="row-fluid">
                        <div id="divHeroUsed" class="heroBack span4">
                            <label>Select Your Hero</label>
                            <asp:DropDownList ID="ddlSelectedHero" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlSelectedHero_SelectedIndexChange">
                                <asp:ListItem Selected="True" Value="1">Druid: Malfurion Stormrage</asp:ListItem>
                                <asp:ListItem Value="2">Hunter: Rexxar</asp:ListItem>
                                <asp:ListItem Value="3">Mage: Jaina Proudmoore</asp:ListItem>
                                <asp:ListItem Value="4">Paladin: Uther the Lightbringer</asp:ListItem>
                                <asp:ListItem Value="5">Priest: Anduin Wrynn</asp:ListItem>
                                <asp:ListItem Value="6">Rogue: Valeera Sanguinar</asp:ListItem>
                                <asp:ListItem Value="7">Shaman: Thrall</asp:ListItem>
                                <asp:ListItem Value="8">Warlock: Guldan</asp:ListItem>
                                <asp:ListItem Value="9">Warrior: Garrosh Hellscream</asp:ListItem>
                            </asp:DropDownList>
                            <br />
                            <asp:Image runat="server" ID="imgSelectedHero" alt="Your Hero" class="statsHeroImg" ImageUrl='<%= ConfigurationManager.AppSettings["imgPath"] + "Images/Hearthstone/HeroesPics/Malfurion.jpg"%>' />
                        </div>
                        <div id="divStats" class="span4">
                            <div class="groupingBack">
                                <label>Did You Win or Lose?</label>
                                <asp:DropDownList ID="ddlOutcome" AutoPostBack="false" runat="server">
                                    <asp:ListItem Selected="True" Value="Win">Won</asp:ListItem>
                                    <asp:ListItem Value="Lose">Lost</asp:ListItem>
                                    <asp:ListItem Value="Tie">Tie</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="groupingBack">
                                <label>Mana at End</label>
                                <asp:DropDownList ID="ddlmanaLeft" AutoPostBack="false" runat="server">
                                    <asp:ListItem Selected="True" Value="1">1 Crystal</asp:ListItem>
                                    <asp:ListItem Value="2">2 Crystals</asp:ListItem>
                                    <asp:ListItem Value="3">3 Crystals</asp:ListItem>
                                    <asp:ListItem Value="4">4 Crystals</asp:ListItem>
                                    <asp:ListItem Value="5">5 Crystals</asp:ListItem>
                                    <asp:ListItem Value="6">6 Crystals</asp:ListItem>
                                    <asp:ListItem Value="7">7 Crystals</asp:ListItem>
                                    <asp:ListItem Value="8">8 Crystals</asp:ListItem>
                                    <asp:ListItem Value="9">9 Crystals</asp:ListItem>
                                    <asp:ListItem Value="10">10 Crystals</asp:ListItem>
                                    <asp:ListItem Value="10">10+ Crystals</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="groupingBack">
                                <label>Health + Armor of Winner</label>
                                <asp:TextBox ID="tbxHealthLeft" runat="server" MaxLength="2">30</asp:TextBox>
                            </div>
                        </div>
                        <div id="divHeroAgainst" class="heroBack span4">
                            <label>Select Your Opponent's Hero</label>
                            <asp:DropDownList ID="ddlOpponentHero" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlOpponentHero_SelectedIndexChange">
                                <asp:ListItem Selected="True" Value="1">Druid: Malfurion Stormrage</asp:ListItem>
                                <asp:ListItem Value="2">Hunter: Rexxar</asp:ListItem>
                                <asp:ListItem Value="3">Mage: Jaina Proudmoore</asp:ListItem>
                                <asp:ListItem Value="4">Paladin: Uther the Lightbringer</asp:ListItem>
                                <asp:ListItem Value="5">Priest: Anduin Wrynn</asp:ListItem>
                                <asp:ListItem Value="6">Rogue: Valeera Sanguinar</asp:ListItem>
                                <asp:ListItem Value="7">Shaman: Thrall</asp:ListItem>
                                <asp:ListItem Value="8">Warlock: Guldan</asp:ListItem>
                                <asp:ListItem Value="9">Warrior: Garrosh Hellscream</asp:ListItem>
                            </asp:DropDownList>
                            <br />
                            <asp:Image runat="server" ID="imgOpponentHero" alt="Your Hero" class="statsHeroImg" ImageUrl='<%= ConfigurationManager.AppSettings["imgPath"] + "Images/Hearthstone/HeroesPics/Malfurion.jpg"%>' />
                        </div>
                    </div>
                    <br />
                    <asp:ImageButton ID="btnSaveStats" runat="server" ImageUrl='Images/hearthstone-btn-save.png' OnClick="btnSaveStats_Click" 
                        onmouseover="this.src='Images/hearthstone-btn-hover-save.png'" 
                        onmouseout="this.src='Images/hearthstone-btn-save.png'"/>
                </div>
            </asp:Panel>
            <asp:Panel ID="pnlviewSection" runat="server" Visible="false">
                <asp:Label ID="lblUserDisplay" runat="server" CssClass="LargeText"></asp:Label>
                <div id="HeroStatsContainer" class="row-fluid">
                    <asp:Repeater ID="HeroRepeater" runat="server" OnItemDataBound="ItemBound">
                        <ItemTemplate>
                            <div id="HeroStats" class="span6 row-fluid">
                                <div class="topHeroArea">
                                    <div class="span3">
                                        <img src='<%= ConfigurationManager.AppSettings["imgPath"] + "Images/Hearthstone/HeroesPics/legendary-portrait-"%><%# Eval("Name") %><%= ".png"%>' />
                                    </div>
                                    <div class="span6 heroSummary">
                                        <h3 class="underline"><%# Eval("Class") %>: <%# Eval("Name") %></h3>
                                        <br />
                                        <h4>Total Games: <%# Eval("TotalGames") %></h4>
                                        <h4>Win Percentage: <%# Eval("WinPercentage") %>%</h4>
                                        <h4 class="Blue">Total Wins: <%# Eval("TotalWins") %></h4>
                                        <h4 class="Red">Total Loses: <%# Eval("TotalLoses") %> </h4>
                                    </div>
                                    <div class="span3 statSpacing"></div>
                                </div>
                                <br />
                                <div class="versus">
                                    <h4>Your Stats as a <%# Eval("Class") %> versus</h4>
                                </div>
                                <asp:Repeater ID="OppHeroRepeater" runat="server">
                                    <ItemTemplate>
                                        <div id="OppHeroStats" class="span3">
                                            <div class="OppHeroStatsArea">
                                                <label class="Black underline"><%# Eval("Class") %>:</label>
                                                <label class="Black">Games: <%# Eval("TotalGames") %></label>
                                                <label class="Black">Win Percentage: <%# Eval("WinPercentage") %>%</label>
                                                <div class="row-fluid">
                                                    <label class="Blue span6">Wins: <%# Eval("TotalWins") %> </label>
                                                    <label class="Red span6">Loses: <%# Eval("TotalLoses") %> </label>
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </asp:Panel>
            <asp:Panel ID="pnlNoUserFound" runat="server" Visible="false">
                <h2>UserName not Found</h2>
            </asp:Panel>
        </div>
    </div>
</asp:Content>

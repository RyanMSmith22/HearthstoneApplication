<%@ Page Title="" Language="C#" MasterPageFile="~/Header_Footer.Master" AutoEventWireup="true" CodeBehind="Stats.aspx.cs" Inherits="HearthstoneApplication.Stats" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div id="userSection" class="Center">
        <h1>Track Your Hearthstone Stats Here</h1>
        <label>Enter in your username then press Add Stats or View Stats depending on what you would like to do.</label>
        <div id="divUserName">
            <label>Username:</label>
            <asp:TextBox ID="tbxUserName" runat="server"></asp:TextBox> 
        </div>
        <asp:Button ID="btnAddStats" runat="server" CssClass="btnStats" Text="Add Stats" OnClick="btnAddStats_Click" />
        <asp:Button ID="btnViewStats" runat="server" CssClass="btnStats" Text="View Stats" OnClick="btnViewStats_Click" />
    </div>
    <div id="statsSection" class="Center">
        <asp:Panel ID="pnlAddSection" runat="server" Visible="false">
            <h2 class="Center">Add Stats Section</h2>
            <div id="divHeroUsed">
                <label>Select Your Hero</label>
                <asp:DropDownList ID="ddlSelectedHero" AutoPostBack="false" runat="server">
                    <asp:ListItem Selected="True" Value="1">Druid: Malfurion Stormrage</asp:ListItem>
                    <asp:ListItem Value="2">Hunter: Rexxar</asp:ListItem>
                    <asp:ListItem Value="3">Mage: Jaina Proudmoore</asp:ListItem>
                    <asp:ListItem Value="4">Paladin: Uther the Lightbringer</asp:ListItem>
                    <asp:ListItem Value="5">Priest: Anduin Wrynn</asp:ListItem>
                    <asp:ListItem Value="6">Rogue: Valeera Sanguinar</asp:ListItem>
                    <asp:ListItem Value="7">Shaman: Thrall</asp:ListItem>
                    <asp:ListItem Value="8">Warlock: Gul'dan</asp:ListItem>
                    <asp:ListItem Value="9">Warrior: Garrosh Hellscream</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div id="divHeroAgainst">
                <label>Select Your Opponent's Hero</label>
                <asp:DropDownList ID="ddlOpponentHero" AutoPostBack="false" runat="server">
                    <asp:ListItem Selected="True" Value="1">Druid: Malfurion Stormrage</asp:ListItem>
                    <asp:ListItem Value="2">Hunter: Rexxar</asp:ListItem>
                    <asp:ListItem Value="3">Mage: Jaina Proudmoore</asp:ListItem>
                    <asp:ListItem Value="4">Paladin: Uther the Lightbringer</asp:ListItem>
                    <asp:ListItem Value="5">Priest: Anduin Wrynn</asp:ListItem>
                    <asp:ListItem Value="6">Rogue: Valeera Sanguinar</asp:ListItem>
                    <asp:ListItem Value="7">Shaman: Thrall</asp:ListItem>
                    <asp:ListItem Value="8">Warlock: Gul'dan</asp:ListItem>
                    <asp:ListItem Value="9">Warrior: Garrosh Hellscream</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div id="divStats">
                <label>Did You Win or Lose?</label>
                <asp:DropDownList ID="ddlOutcome" AutoPostBack="false" runat="server">
                    <asp:ListItem Selected="True" Value="Win">Won</asp:ListItem>
                    <asp:ListItem Value="Lose">Lost</asp:ListItem>
                    <asp:ListItem Value="Tie">Tie</asp:ListItem>
                </asp:DropDownList>
                <label>How Much Mana Was Left When You Finished?</label>
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
                <label>How Much Health Did the Winner Have Left (armor included)?</label>
                <asp:TextBox ID="tbxHealthLeft" runat="server" MaxLength="2"></asp:TextBox>
            </div>
            <asp:Button ID="btnSaveStats" runat="server" Text="Save Stats" OnClick="btnSaveStats_Click" />
            <div id="SaveStatus">
                <asp:Label ID="lblSaveStatus" CssClass="lblSaveStatus" runat="server" Visible="false">Your Stats have been Saved Succussfully!</asp:Label>
            </div>
        </asp:Panel>
        <asp:Panel ID="pnlviewSection" runat="server" Visible="false">
            <h2 class="Center">View Stats Section</h2>
            <asp:Repeater ID="HeroRepeater" runat="server">
                <ItemTemplate>
                    <div class="HeroStats">
                        <h3><%# Eval("Class") %>: <%# Eval("Name") %></h3>
                        <h4 class="Blue">Total Wins: <%# Eval("TotalWins") %></h4>
                        <h4 class="Red">Total Loses: <%# Eval("TotalLoses") %> </h4>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </asp:Panel>
    </div>

</asp:Content>

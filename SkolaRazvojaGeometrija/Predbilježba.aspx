<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Predbilježba.aspx.cs" Inherits="SkolaRazvojaGeometrija.Predbilježba" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style3 {
        margin-left: 65px;
    }
    .auto-style4 {
        margin-left: 0px;
    }
        .auto-style5 {
            margin-left: 48px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
    Pretraga:
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Naziv" DataValueField="Naziv">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GeometrijaConnectionString2 %>" SelectCommand="SELECT * FROM [Tečajevi]"></asp:SqlDataSource>
    <asp:Button ID="BtnOdaberi" runat="server" Height="30px" OnClick="BtnOdaberi_Click" Text="Odaberi" Width="73px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="BtnPrijava" runat="server" Text="Prijava" PostBackUrl="~/Prijava.aspx" />
</p>
<p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:GridView ID="GridView1" runat="server">
    </asp:GridView>
</p>
<p>
    &nbsp;</p>
<p>
    Ime:<asp:TextBox ID="TxtBoxIme" runat="server" CssClass="auto-style3"></asp:TextBox>
</p>
<p>
    Prezime:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TxtBoxPrezime" runat="server"></asp:TextBox>
</p>
    <p>
        Adresa:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TxtBoxAdresa" runat="server"></asp:TextBox>
</p>
    <p>
        Telefon:<asp:TextBox ID="TxtBoxTelefon" runat="server" CssClass="auto-style5"></asp:TextBox>
</p>
<p>
    Email:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TxtBoxEmail" runat="server" CssClass="auto-style4" TextMode="Email"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
</p>
<p>
    <asp:Button ID="BtnSend" runat="server" Text="Pošalji predbilježbu" OnClick="BtnSend_Click" />
</p>
</asp:Content>

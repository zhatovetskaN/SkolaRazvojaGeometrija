<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Prijava.aspx.cs" Inherits="SkolaRazvojaGeometrija.Prijava" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-left: 0px;
        }
        .auto-style3 {
            margin-left: 47px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="auto-style1">
        Korisničko ime:
        <asp:TextBox ID="TxtLogin" runat="server" ></asp:TextBox>
    <br />
    <br />
        Zaporka:<asp:TextBox ID="TxtPass" runat="server" CssClass="auto-style3" TextMode="Password"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="BtnLogin" runat="server" Text="Prijava" OnClick="BtnLogin_Click" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="LblError" runat="server" Text="LblError" ForeColor="#CC0000" Visible="False"></asp:Label>
</div>
</asp:Content>

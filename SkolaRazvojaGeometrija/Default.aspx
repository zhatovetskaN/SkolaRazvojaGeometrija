<%@ Page 
    Title=""
    Language="C#" 
    MasterPageFile="~/Main.Master"
    AutoEventWireup="true" 
    CodeBehind="Default.aspx.cs" 
    Inherits="SkolaRazvojaGeometrija.Default"
     %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Škola Razvoja Geometrija</title>
</asp:Content> 
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p style="margin: 5px">Dobrodosli na stranice Geometrija!</p>
    <p style="margin: 5px">&nbsp;<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Predbilježba.aspx">Predbiliziti se</asp:HyperLink>

    </p>

</asp:Content>
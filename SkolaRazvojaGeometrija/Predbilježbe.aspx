<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Predbilježbe.aspx.cs" Inherits="SkolaRazvojaGeometrija.Predbilježbe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            color: #FF0066;
        }
        .auto-style2 {
            color: #000000;
        }
        .auto-style3 {
            text-align: center;
            text-decoration: underline;
            color: #0000FF;
        }
        .auto-style4 {
            color: #0000CC;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <br class="auto-style2" />
        <span class="auto-style2">Linkovi:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="auto-style1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="auto-style4"><strong>Naziv tečaja</strong></span>:&nbsp;
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="Naziv" DataValueField="Tečaj_Id">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:GeometrijaConnectionString2 %>" SelectCommand="SELECT DISTINCT Naziv, Tečaj_Id FROM [Predbilježba] ORDER BY Tečaj_Id"></asp:SqlDataSource>
&nbsp;<asp:Button ID="BtnPrikazi" runat="server" OnClick="BtnPrikazi_Click" Text="Prikaži" />
    &nbsp;<asp:Label ID="LblText" runat="server"></asp:Label>
    </p>
    <p>
        <asp:HyperLink ID="HyperLink2" runat="server">Predbilježbe</asp:HyperLink>
&nbsp;&nbsp;&nbsp;</p>
        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Tečajevi.aspx">Tečajevi</asp:HyperLink>
    <p>
        <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/Default.aspx">Odjava</asp:HyperLink>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
    <p>
        &nbsp;</p>
    <p>

        
                          
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GeometrijaConnectionString2 %>" SelectCommand="SELECT [Id_Predbilježba], [Šifra_Tečaja], [Ime], [Prezime], [Adresa], [Telefon], [Email] FROM [Predbilježba]"></asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" DataKeyNames="Id_Predbilježba" OnRowCancelingEdit="GridView1_CancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnClientCLick ="return confirm(Are You sure?)"
             OnRowDataBound ="GridView1_RowDataBound" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating"  OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AutoGenerateEditButton="True" HorizontalAlign="Center" Height="155px" Width="150px" >
         <Columns>
             <asp:TemplateField>
            <ItemTemplate>
<asp:LinkButton ID="LinkDelete" CommandName="Delete" runat="server"  OnClientClick ="return confirm('Are you sure you want to delete this row?');">Delete</asp:LinkButton>
</ItemTemplate>
</asp:TemplateField>
             </Columns>
            <PagerStyle BackColor="White" BorderColor="White" />
            <RowStyle BackColor="#FFFFCC" BorderColor="#CC3399" />
        </asp:GridView>
                     </p>
    <p class="auto-style3">
        <strong>Dodajte novu predbilježbu:</strong></p>

        
                          
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  

        
                          <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="Naziv" DataValueField="Id_Tečaja">
        </asp:DropDownList>

        
                          <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:GeometrijaConnectionString2 %>" SelectCommand="SELECT [Id_Tečaja], [Naziv] FROM [Tečajevi]"></asp:SqlDataSource>

        
                          <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" Height="50px" Width="125px"

AutoGenerateInsertButton="True"  
     OnItemInserting="DetailsView1_ItemInserting"  OnModeChanging="DetailsView1_ModeChanging1"  HorizontalAlign="Center" DefaultMode="Insert" CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="Id_Tečaja">
                   <AlternatingRowStyle BackColor="White" />
                   <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                   <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />

                         <Fields>
                            

                       <asp:TemplateField HeaderText="Ime" Visible="True" InsertVisible="True" >
                          <ItemTemplate>
                         <asp:Label ID="ImeLabel"  runat="server"></asp:Label>
                         </ItemTemplate>                        
                            <InsertItemTemplate>
              <asp:TextBox ID="InsertImeTextBox" runat="server"  MaxLength="20" /></InsertItemTemplate>
                           </asp:TemplateField> 
                       
                       <asp:TemplateField HeaderText="Prezime" Visible="True" InsertVisible="True" >
                          <ItemTemplate>
                         <asp:Label ID="PrezimeLabel"  runat="server"></asp:Label>
                         </ItemTemplate>                        
                            <InsertItemTemplate>
              <asp:TextBox ID="InsertPrezimeTextBox" runat="server"  MaxLength="20" /></InsertItemTemplate>
                           </asp:TemplateField> 

                       <asp:TemplateField HeaderText="Adresa" Visible="True" InsertVisible="True" >
                          <ItemTemplate>
                         <asp:Label ID="AdresaLabel"  runat="server"></asp:Label>
                         </ItemTemplate>                        
                            <InsertItemTemplate>
              <asp:TextBox ID="InsertAdresaTextBox" runat="server"  MaxLength="20" /></InsertItemTemplate>
                           </asp:TemplateField> 

                       <asp:TemplateField HeaderText="Telefon" Visible="True" InsertVisible="True" >
                          <ItemTemplate>
                         <asp:Label ID="TelefonLabel"  runat="server"></asp:Label>
                         </ItemTemplate>                        
                            <InsertItemTemplate>
              <asp:TextBox ID="InsertTelefonTextBox" runat="server"  MaxLength="20" /></InsertItemTemplate>
                           </asp:TemplateField> 

                       <asp:TemplateField HeaderText="Email" Visible="True" InsertVisible="True" >
                          <ItemTemplate>
                         <asp:Label ID="EmailLabel"  runat="server"></asp:Label>
                         </ItemTemplate>                        
                            <InsertItemTemplate>
              <asp:TextBox ID="InsertEmailTextBox" runat="server"  MaxLength="20" /></InsertItemTemplate>
                           </asp:TemplateField>        
                         </Fields>
        </asp:DetailsView>
        
                          
                     </p>
    <p>
        

        
                          
                     </p>
    <p>
        &nbsp;</p>
    <p>

        
                          
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
</asp:Content>

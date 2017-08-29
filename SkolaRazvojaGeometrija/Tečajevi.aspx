<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Tečajevi.aspx.cs" Inherits="SkolaRazvojaGeometrija.Tečajevi" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 1030px;
        }
        .auto-style2 {
            margin-right: 1px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
&nbsp;&nbsp; Linkovi:</p>
    <p>
&nbsp;&nbsp;
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Predbilježbe.aspx">Predbilježbe</asp:HyperLink>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Pretraga aktivnih i zatvorenih tečajeva:&nbsp;
        <asp:Button ID="BtnPrikazi" runat="server" Text="Prikaži"  OnClick="BtnPrikazi_Click" />
    </p>
    <p class="auto-style1">
        &nbsp;
        <asp:HyperLink ID="HyperLink5" runat="server">Tečajevi</asp:HyperLink>
    </p>
    <p>
        &nbsp;&nbsp;<asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/Default.aspx">Odjava</asp:HyperLink>
    </p>
    <p>
        &nbsp;</p>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id_Tečaja" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" >
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True"   />
            <asp:BoundField DataField="Id_Tečaja" HeaderText="Id_Tečaja"  InsertVisible="False" ReadOnly="True" SortExpression="Id_Tečaja" />
            <asp:BoundField DataField="Šifra_Tečaja" HeaderText="Šifra_Tečaja" ReadOnly="True" SortExpression="Šifra_Tečaja" />
            <asp:BoundField DataField="Naziv" HeaderText="Naziv" SortExpression="Naziv" />
            <asp:BoundField DataField="Datum_pocetka" HeaderText="Datum_pocetka" SortExpression="Datum_pocetka" />
            <asp:BoundField DataField="Datum_zavrsetka" HeaderText="Datum_zavrsetka" SortExpression="Datum_zavrsetka" />
            <asp:BoundField DataField="Broj_predbilježbi" HeaderText="Broj_predbilježbi" SortExpression="Broj_predbilježbi" />
            <asp:BoundField DataField="Zatvoren" HeaderText="Zatvoren" SortExpression="Zatvoren" />
        </Columns>
    </asp:GridView>


    <table border="1"  style="border-collapse: collapse">
    <tr>
        <td style="width: 150px">
            Naziv:<br />
            <asp:TextBox ID="txtNaziv" runat="server" Width="140" />
        </td>
        <td style="width: 150px">
            Datum_pocetka:<br />
            <asp:TextBox ID="txtDatum_pocetka" runat="server" Width="140" />
        </td>
        <td style="width: 150px">
            Datum_zavrsetka:<br />
            <asp:TextBox ID="txtDatum_zavrsetka" runat="server" Width="140" />
        </td>
        <td style="width: 100px">
            
            <br />
            <asp:Button ID="btnAdd" runat="server" Text="Dodaj novi seminar" OnClick="Insert" CssClass="auto-style2" Height="24px" Width="149px" />
            <br />
        </td>
        <td>&nbsp;</td>
    </tr>
</table>
    <p>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GeometrijaConnectionString2 %>"
             DeleteCommand="DELETE FROM [Tečajevi] WHERE [Id_Tečaja] = @Id_Tečaja" 
            
            SelectCommand="SELECT [Id_Tečaja], [Šifra_Tečaja], [Naziv], [Datum_pocetka], [Datum_zavrsetka], [Broj predbilježbi] AS Broj_predbilježbi, [Zatvoren] FROM [Tečajevi]" 
            UpdateCommand="UPDATE [Tečajevi] SET [Naziv] = @Naziv, [Datum_pocetka] = @Datum_pocetka, [Datum_zavrsetka] = @Datum_zavrsetka, [Broj predbilježbi] = @Broj_predbilježbi, [Zatvoren] = @Zatvoren WHERE [Id_Tečaja] = @Id_Tečaja" 
            InsertCommand="INSERT INTO [Tečajevi] ([Naziv], [Datum_pocetka], [Datum_zavrsetka]) VALUES (@Naziv, @Datum_pocetka, @Datum_zavrsetka)">
            <DeleteParameters>
                <asp:Parameter Name="Id_Tečaja" Type="Int32" />
            </DeleteParameters>
           
            <InsertParameters>
                <asp:ControlParameter Name="Naziv" ControlID ="txtNaziv" Type="String" />
                <asp:ControlParameter Name="Datum_pocetka" ControlID ="txtDatum_pocetka" Type="DateTime" />
                <asp:ControlParameter Name="Datum_zavrsetka" ControlID ="txtDatum_zavrsetka" Type="DateTime" />
            </InsertParameters>
           
            <UpdateParameters>
                <asp:Parameter Name="Šifra_Tečaja" Type="String" />
                <asp:Parameter Name="Naziv" Type="String" />
                <asp:Parameter Name="Datum_pocetka" Type="DateTime" />
                <asp:Parameter Name="Datum_zavrsetka" Type="DateTime" />
                <asp:Parameter Name="Broj_predbilježbi" Type="String" />
                <asp:Parameter Name="Zatvoren" Type="String" />
                <asp:Parameter Name="Id_Tečaja" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>

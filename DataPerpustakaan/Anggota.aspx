<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Anggota.aspx.vb" Inherits="DataPerpustakaan.Anggota" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link rel="stylesheet" href="style.css" />
    <style type="text/css">
        body {
            background:url(./Images/hogwarts-logo-low-opacity.png)center center fixed; 
            background-color:#DED6D1;
            background-repeat:no-repeat;
        }
        menu ul li:hover {
            background-color:#82593E;
        }
        .auto-style27 {
            color: #999999;
        }
        .auto-style28 {
            width: 96px;
        }
        .auto-style29 {
            width: 96px;
            height: 12px;
        }
        .auto-style30 {
            width: 96px;
            height: 24px;
        }
        .auto-style31 {
            height: 23px;
            width: 96px;
        }
    </style>
</head>
<body>
    <table class="logo">
        <tr>
            <td><img src="/Images/hogwarts-logo.png" alt="Hogwarts" /></td>
            <td><h1 class="auto-style3">DATA PERPUSTAKAAN </h1></td>
        </tr>
    </table>
    <menu>
        <ul>
            <li><a href="Buku.aspx">BUKU</a></li>
            <li><a href="Peminjaman.aspx">PEMINJAMAN</a></li>
            <li><a href="Anggota.aspx">ANGGOTA</a></li>
            <li><a href="Pengarang.aspx">PENGARANG</a></li>
            <li><a href="Penerbit.aspx">PENERBIT</a></li>
        </ul>
    </menu>
    <form id="form1" runat="server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style28" colspan="2">&nbsp;</td>
            <td class="auto-style4" colspan="5"><h2>DATA ANGGOTA</h2></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style24"></td>
            <td class="auto-style29" colspan="2"></td>
            <td class="auto-style20" colspan="3"></td>
            <td class="auto-style21" colspan="2"></td>
            <td class="auto-style22"></td>
        </tr>
        <tr>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style28" colspan="2">NIM</td>
            <td class="auto-style7" colspan="3">
                <asp:TextBox ID="TextBox1" runat="server" Width="128px"></asp:TextBox>
            </td>
            <td class="auto-style5" colspan="2">
                <asp:Button ID="Button5" runat="server" style="font-weight: 700" Text="Cari" Width="128px" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style25"></td>
            <td class="auto-style30" colspan="2">Nama</td>
            <td class="auto-style15" colspan="3">
                <asp:TextBox ID="TextBox2" runat="server" Width="256px"></asp:TextBox>
            </td>
            <td class="auto-style16" colspan="2"></td>
            <td class="auto-style17"></td>
        </tr>
        <tr>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style28" colspan="2">Fakultas</td>
            <td class="auto-style7" colspan="3">
                <asp:DropDownList ID="DropDownList1" runat="server" Width="135px" Height="23px">
                    <asp:ListItem>Pilih Fakultas</asp:ListItem>
                    <asp:ListItem>Ekonomi</asp:ListItem>
                    <asp:ListItem>FKIP</asp:ListItem>
                    <asp:ListItem>Hukum</asp:ListItem>
                    <asp:ListItem>Pertanian</asp:ListItem>
                    <asp:ListItem>Psikologi</asp:ListItem>
                    <asp:ListItem>Teknik</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style5" colspan="2">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style28" colspan="2">Tanggal Lahir</td>
            <td class="auto-style7" colspan="3">
                <asp:TextBox ID="TextBox3" runat="server" Width="128px"></asp:TextBox>
                &nbsp;&nbsp; <span class="auto-style27">YYYY-MM-DD</span></td>
            <td class="auto-style5" colspan="2">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style28" colspan="2">No. Telepon</td>
            <td class="auto-style7" colspan="3">
                <asp:TextBox ID="TextBox4" runat="server" Width="256px"></asp:TextBox>
            </td>
            <td class="auto-style5" colspan="2">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style28" colspan="2">&nbsp;</td>
            <td class="auto-style7" colspan="3">
                &nbsp;</td>
            <td class="auto-style5" colspan="2">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style26"></td>
            <td class="auto-style31" colspan="2">&nbsp;</td>
            <td class="auto-style8" colspan="3">
                <asp:Button ID="Button1" runat="server" style="font-weight: 700" Text="Tambahkan" Width="256px" />
            </td>
            <td class="auto-style6" colspan="2">
                <asp:Button ID="Button3" runat="server" style="font-weight: 700" Text="Edit" Width="256px" />
            </td>
            <td class="auto-style2"></td>
        </tr>
        <tr>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style28" colspan="2">&nbsp;</td>
            <td class="auto-style7" colspan="3">
                <asp:Button ID="Button2" runat="server" style="font-weight: 700" Text="Tampilkan" Width="256px" />
            </td>
            <td class="auto-style5" colspan="2">
                <asp:Button ID="Button4" runat="server" style="font-weight: 700" Text="Hapus" Width="256px" BackColor="#541F1B" ForeColor="White" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style26"></td>
            <td class="auto-style31" colspan="2"></td>
            <td class="auto-style2" colspan="3">
            </td>
            <td class="auto-style6" colspan="2"></td>
            <td class="auto-style2"></td>
        </tr>
        <tr>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style11">Jumlah Anggota:
                <asp:Label ID="Label1" runat="server" Text="-"></asp:Label>
            </td>
            <td class="auto-style11" colspan="2">Usia (max.): <asp:Label ID="Label2" runat="server" Text="-"></asp:Label>
            </td>
            <td class="auto-style11">Usia (min.):
                <asp:Label ID="Label3" runat="server" Text="-"></asp:Label>
            </td>
            <td colspan="2">Usia (rata²):
                <asp:Label ID="Label4" runat="server" Text="-"></asp:Label>
            </td>
            <td class="auto-style11">Total Usia (sum):
                <asp:Label ID="Label5" runat="server" Text="-"></asp:Label>
            </td>
            <td class="auto-style7">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style28" colspan="2">&nbsp;</td>
            <td class="auto-style7" colspan="6">
                <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="White" />
                    <EditRowStyle Font-Bold="False" />
                    <FooterStyle BackColor="#CCCC99" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#F7F7DE" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FBFBF2" />
                    <SortedAscendingHeaderStyle BackColor="#848384" />
                    <SortedDescendingCellStyle BackColor="#EAEAD3" />
                    <SortedDescendingHeaderStyle BackColor="#575357" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style28" colspan="2">&nbsp;</td>
            <td class="auto-style7" colspan="3">
                &nbsp;</td>
            <td class="auto-style5" colspan="2">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <div>
    
    </div>
    </form>
</body>
</html>

